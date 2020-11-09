Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A4D2AC2D3
	for <lists+dccp@lfdr.de>; Mon,  9 Nov 2020 18:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbgKIRtl (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 9 Nov 2020 12:49:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:45176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbgKIRtl (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 9 Nov 2020 12:49:41 -0500
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C19A20665;
        Mon,  9 Nov 2020 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604944180;
        bh=2JS+DaVkJRk5CcGsB31ekydAlAwz2JA7uSthpODOzec=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XmRgnrltaXpz59xQMBWOzeps7fFSmvRjemBlntUxDEH1LwiYlonGdBYE3avceHraq
         nSyFlK0cCmuNTW1Bum6YvH/dg4My0lmOdWzcN8YwqUwP35dB8OhS0wO7HkYRWRIlhO
         RBYzc1DM34+d3vUKr9NlcwrI5QlXXnd1WqzveoCg=
Date:   Mon, 9 Nov 2020 09:49:38 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Cc:     Kleber Sacilotto de Souza <kleber.souza@canonical.com>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        "David S. Miller" <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Kees Cook <keescook@chromium.org>,
        Alexey Kodanev <alexey.kodanev@oracle.com>,
        dccp@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dccp: ccid: move timers to struct dccp_sock
Message-ID: <20201109094938.45b230c9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201109114828.GP595944@mussarela>
References: <20201013171849.236025-1-kleber.souza@canonical.com>
        <20201013171849.236025-2-kleber.souza@canonical.com>
        <20201016153016.04bffc1e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <20201109114828.GP595944@mussarela>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Mon, 9 Nov 2020 08:48:28 -0300 Thadeu Lima de Souza Cascardo wrote:
> On Fri, Oct 16, 2020 at 03:30:16PM -0700, Jakub Kicinski wrote:
> > On Tue, 13 Oct 2020 19:18:48 +0200 Kleber Sacilotto de Souza wrote:  
> > > From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> > > 
> > > When dccps_hc_tx_ccid is freed, ccid timers may still trigger. The reason
> > > del_timer_sync can't be used is because this relies on keeping a reference
> > > to struct sock. But as we keep a pointer to dccps_hc_tx_ccid and free that
> > > during disconnect, the timer should really belong to struct dccp_sock.
> > > 
> > > This addresses CVE-2020-16119.
> > > 
> > > Fixes: 839a6094140a (net: dccp: Convert timers to use timer_setup())
> > > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> > > Signed-off-by: Kleber Sacilotto de Souza <kleber.souza@canonical.com>  
> > 
> > I've been mulling over this fix.
> > 
> > The layering violation really doesn't sit well.
> > 
> > We're reusing the timer object. What if we are really unlucky, the
> > fires and gets blocked by a cosmic ray just as it's about to try to
> > lock the socket, then user manages to reconnect, and timer starts
> > again. Potentially with a different CCID algo altogether?
> > 
> > Is disconnect ever called under the BH lock?  Maybe plumb a bool
> > argument through to ccid*_hc_tx_exit() and do a sk_stop_timer_sync()
> > when called from disconnect()?
> > 
> > Or do refcounting on ccid_priv so that the timer holds both the socket
> > and the priv?  
> 
> Sorry about too late a response. I was on vacation, then came back and spent a
> couple of days testing this further, and had to switch to other tasks.
> 
> So, while testing this, I had to resort to tricks like having a very small
> expire and enqueuing on a different CPU. Then, after some minutes, I hit a UAF.
> That's with or without the first of the second patch.
> 
> I also tried to refcount ccid instead of the socket, keeping the timer on the
> ccid, but that still hit the UAF, and that's when I had to switch tasks.

Hm, not instead, as well. I think trying cancel the timer _sync from
the disconnect path would be the simplest solution, tho.

> Oh, and in the meantime, I found one or two other fixes that we
> should apply, will send them shortly.
> 
> But I would argue that we should apply the revert as it addresses the
> CVE, without really regressing the other UAF, as I argued. Does that
> make sense?

We can - it's always a little strange to go from one bug to a different
without a fix - but the justification being that while the previous UAF
required a race condition the new one is actually worst because it can 
be triggered reliably?

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C0934024E
	for <lists+dccp@lfdr.de>; Thu, 18 Mar 2021 10:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCRJqU (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 18 Mar 2021 05:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhCRJqC (ORCPT <rfc822;dccp@vger.kernel.org>);
        Thu, 18 Mar 2021 05:46:02 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CD6C06175F
        for <dccp@vger.kernel.org>; Thu, 18 Mar 2021 02:46:02 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 133so1909316ybd.5
        for <dccp@vger.kernel.org>; Thu, 18 Mar 2021 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4eehFqOuvXew6Np+Xd0lW5IZJH/ObfCrNO3PXqQWzZ8=;
        b=Od80FWkZVeHjiWqW9kZwT0VuANj7TiXqtp21XG3vyGjHp99my/LYeWv4wNlFkPVwrZ
         5/JTF3ppT/QBnReVwCqJd/q3MVwWSxX/vcxeK1jwHAbI4BlP2PVwDS+KEqQYILQHSMYu
         /7s+Hq8dwei79L1At8Ct95F+2gT3w3S/DCm5w4TTzQaO9r7i56cGBou6S2lXsP5VyQ4v
         Yi5wVARLWfLR3ghYj2ozc0Z6bwAWTEMmLArcyS9zTGD2XiWdNzZfopdcQ/RoSVwfMuca
         5B5aX/etsFF+tfIc/hsaMhGIKjozGgO9dTwOxzNVRHv26NglSh7ecHHIPK9boGi5RaJC
         /0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4eehFqOuvXew6Np+Xd0lW5IZJH/ObfCrNO3PXqQWzZ8=;
        b=mAz86QCkb6qPWSDMpPe5sgUXypSfnzg+rHtnZjBgssKwgRgvpXxCZb7Kdg8EJczlNG
         Z74X4oQSP92aUie2z4mI8MOjdXy0/oh6syvw2ElMsn6MNDzLiWu0D/iW3tP7nIWZMsYb
         PUZZNZb9wwBg+l9i1gH/hXiyJzuALBFeapPqLPWOXhThA/n0wRmVOEhlv8sUs0y4Gd34
         oZ7YtyIzo4+7is20UZa8dXkzXdWXuuUfCDSZNIQqicbA1TUvKLX/xyi4Q0hh+6/bpKet
         7mIZgt4QUa2xrZB3R7juA3CqvsV0tCsdY216uVUsw+MSPhXTs1U46xI0o5iKIZkfDOoy
         xoXg==
X-Gm-Message-State: AOAM530c+jEJErPqSG+2Ng3/71bFrrfouMFoSOycAxBBRciaoRxDKB+6
        O0aW5l+kMZK7fTB578IAkcUjr3vvDs2P+pCXb7JWaQ==
X-Google-Smtp-Source: ABdhPJyLJUdEIavlW86rSs9vWP1xFyv4QhOuAs5ODlke617CDtmpSr5coqU57AdVZQ3vQnydoHWCzwbOF6CGHBvb6jE=
X-Received: by 2002:a25:6f41:: with SMTP id k62mr11137422ybc.253.1616060761514;
 Thu, 18 Mar 2021 02:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210317165515.1914146-1-kuba@kernel.org>
In-Reply-To: <20210317165515.1914146-1-kuba@kernel.org>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 18 Mar 2021 10:45:50 +0100
Message-ID: <CANn89iLFMpSOwvhuT3_-yCZS1Ff7Vc5RPuO_DCNyYon3VSQW+w@mail.gmail.com>
Subject: Re: [PATCH net] ipv6: weaken the v4mapped source check
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        jamorris@linux.microsoft.com, Paul Moore <paul@paul-moore.com>,
        Ricardo Dias <rdias@singlestore.com>, dccp@vger.kernel.org,
        mptcp@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Wed, Mar 17, 2021 at 5:55 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> This reverts commit 6af1799aaf3f1bc8defedddfa00df3192445bbf3.
>
> Commit 6af1799aaf3f ("ipv6: drop incoming packets having a v4mapped
> source address") introduced an input check against v4mapped addresses.
> Use of such addresses on the wire is indeed questionable and not
> allowed on public Internet. As the commit pointed out
>
>   https://tools.ietf.org/html/draft-itojun-v6ops-v4mapped-harmful-02
>
> lists potential issues.
>
> Unfortunately there are applications which use v4mapped addresses,
> and breaking them is a clear regression. For example v4mapped
> addresses (or any semi-valid addresses, really) may be used
> for uni-direction event streams or packet export.
>
> Since the issue which sparked the addition of the check was with
> TCP and request_socks in particular push the check down to TCPv6
> and DCCP. This restores the ability to receive UDPv6 packets with
> v4mapped address as the source.
>
> Keep using the IPSTATS_MIB_INHDRERRORS statistic to minimize the
> user-visible changes.
>
> Fixes: 6af1799aaf3f ("ipv6: drop incoming packets having a v4mapped source address")
> Reported-by: Sunyi Shao <sunyishao@fb.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---


Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !

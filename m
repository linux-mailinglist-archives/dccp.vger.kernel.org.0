Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3947616B26A
	for <lists+dccp@lfdr.de>; Mon, 24 Feb 2020 22:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgBXV3i (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 24 Feb 2020 16:29:38 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:38736 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbgBXV3f (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 24 Feb 2020 16:29:35 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 012FF121A82EE;
        Mon, 24 Feb 2020 13:29:34 -0800 (PST)
Date:   Mon, 24 Feb 2020 13:29:34 -0800 (PST)
Message-Id: <20200224.132934.1883265315899035765.davem@davemloft.net>
To:     jbi.octave@gmail.com
Cc:     boqun.feng@gmail.com, linux-kernel@vger.kernel.org,
        gerrit@erg.abdn.ac.uk, kuba@kernel.org, dccp@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 14/30] dccp: Add missing annotation for
 dccp_child_process()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200223231711.157699-15-jbi.octave@gmail.com>
References: <0/30>
        <20200223231711.157699-1-jbi.octave@gmail.com>
        <20200223231711.157699-15-jbi.octave@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 24 Feb 2020 13:29:35 -0800 (PST)
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

From: Jules Irenge <jbi.octave@gmail.com>
Date: Sun, 23 Feb 2020 23:16:55 +0000

> Sparse reports a warning at dccp_child_process()
> warning: context imbalance in dccp_child_process() - unexpected unlock
> The root cause is the missing annotation at dccp_child_process()
> Add the missing __releases(child) annotation
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

Applied.

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514BE250D56
	for <lists+dccp@lfdr.de>; Tue, 25 Aug 2020 02:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgHYAbr (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 24 Aug 2020 20:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgHYAbq (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 24 Aug 2020 20:31:46 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E12C061574;
        Mon, 24 Aug 2020 17:31:46 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 371501294C6EF;
        Mon, 24 Aug 2020 17:15:00 -0700 (PDT)
Date:   Mon, 24 Aug 2020 17:31:45 -0700 (PDT)
Message-Id: <20200824.173145.1114480096772083734.davem@davemloft.net>
To:     rdunlap@infradead.org
Cc:     netdev@vger.kernel.org, gerrit@erg.abdn.ac.uk,
        dccp@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH] net: dccp: delete repeated words
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200823010713.4728-1-rdunlap@infradead.org>
References: <20200823010713.4728-1-rdunlap@infradead.org>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 24 Aug 2020 17:15:00 -0700 (PDT)
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Date: Sat, 22 Aug 2020 18:07:13 -0700

> Drop duplicated words in /net/dccp/.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

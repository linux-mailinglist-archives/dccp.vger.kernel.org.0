Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37AC24E96D
	for <lists+dccp@lfdr.de>; Sat, 22 Aug 2020 21:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgHVTis (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sat, 22 Aug 2020 15:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbgHVTis (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sat, 22 Aug 2020 15:38:48 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CADFC061573;
        Sat, 22 Aug 2020 12:38:48 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 7AD5315CEDE8C;
        Sat, 22 Aug 2020 12:22:01 -0700 (PDT)
Date:   Sat, 22 Aug 2020 12:38:46 -0700 (PDT)
Message-Id: <20200822.123846.870872137998115453.davem@davemloft.net>
To:     linmiaohe@huawei.com
Cc:     gerrit@erg.abdn.ac.uk, kuba@kernel.org, grandmaster@al2klimov.de,
        dccp@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dccp: Convert to use the preferred fallthrough
 macro
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200822080827.33935-1-linmiaohe@huawei.com>
References: <20200822080827.33935-1-linmiaohe@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 22 Aug 2020 12:22:01 -0700 (PDT)
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

From: Miaohe Lin <linmiaohe@huawei.com>
Date: Sat, 22 Aug 2020 04:08:27 -0400

> Convert the uses of fallthrough comments to fallthrough macro.
> 
> Signed-off-by: Miaohe Lin <linmiaohe@huawei.com>

Applied.

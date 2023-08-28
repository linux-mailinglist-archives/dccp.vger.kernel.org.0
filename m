Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A999778A8C9
	for <lists+dccp@lfdr.de>; Mon, 28 Aug 2023 11:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjH1JVG (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 28 Aug 2023 05:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjH1JUe (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 28 Aug 2023 05:20:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C2F12F
        for <dccp@vger.kernel.org>; Mon, 28 Aug 2023 02:20:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9E2C63514
        for <dccp@vger.kernel.org>; Mon, 28 Aug 2023 09:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4864DC433C7;
        Mon, 28 Aug 2023 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693214424;
        bh=lmCmRnHp5sN/qUUE4MNYbg0ju1991+Nb99EaylABA+A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pNL4PJcWjPla4t7OkfMPgxyj57wntUHcKsTGFdBEF624NgJhVMKEucIOjfACs520c
         QauS8IBO0CkGOcrHbOUBBQskWpO+B9wuOvsP+KxNhj84M9/fVnXMA+YZwAKzZSw27v
         OQ5XxJ64+JQirNZ0aiMTOOIVdaBp+pmOFF2Y5YRlh/0NFslk3LC8WKpMwzKcDptRI5
         G+kkY8QmIBLN1WHGck0SahligjR7eh2ItJ6VKSLZkutCKS37tBLFZlAA64qFXn4uRF
         ywOhmPaoCoN4Aq0FwS58RD4ZiNlP4hAhD8IBvsP6cox4JGvotznT3LGYwy7+wGfdeB
         TdBJbFBzBYrMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30F82C3959E;
        Mon, 28 Aug 2023 09:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] dccp: Fix out of bounds access in DCCP error handler
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169321442419.7279.7733954383397054161.git-patchwork-notify@kernel.org>
Date:   Mon, 28 Aug 2023 09:20:24 +0000
References: <20230825133241.3635236-1-jannh@google.com>
In-Reply-To: <20230825133241.3635236-1-jannh@google.com>
To:     Jann Horn <jannh@google.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, dccp@vger.kernel.org, netdev@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 25 Aug 2023 15:32:41 +0200 you wrote:
> There was a previous attempt to fix an out-of-bounds access in the DCCP
> error handlers, but that fix assumed that the error handlers only want
> to access the first 8 bytes of the DCCP header. Actually, they also look
> at the DCCP sequence number, which is stored beyond 8 bytes, so an
> explicit pskb_may_pull() is required.
> 
> Fixes: 6706a97fec96 ("dccp: fix out of bound access in dccp_v4_err()")
> Fixes: 1aa9d1a0e7ee ("ipv6: dccp: fix out of bound access in dccp_v6_err()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>
> 
> [...]

Here is the summary with links:
  - [net] dccp: Fix out of bounds access in DCCP error handler
    https://git.kernel.org/netdev/net/c/977ad86c2a1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



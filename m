Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A292634314
	for <lists+dccp@lfdr.de>; Tue, 22 Nov 2022 18:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbiKVR4H (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 22 Nov 2022 12:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234503AbiKVRzn (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 22 Nov 2022 12:55:43 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4178585ECF
        for <dccp@vger.kernel.org>; Tue, 22 Nov 2022 09:54:23 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3a7081e3b95so47777567b3.1
        for <dccp@vger.kernel.org>; Tue, 22 Nov 2022 09:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DJtljlWfswpDDpAnUDjR7A0FiOUmuThlBRS2V8r1yRY=;
        b=py5ChYRIZNZiWkvTN1pQuru3K0U579g0Q5nhoTfbPCxQKixcseAxCNXdAeCa/xmKyZ
         dOVPW11QaM3MCGIL8i7cUUxoE79bu7eD9gEFy5n4SdZj5IVZtUkNv9nglUpG4m7MGtiM
         u9hEYP8FtUScpfAuexX4xZ2X0KGWyIvMk9F1IeYQ3y6DutdpnfxLk33hoO0qFDjZHPe8
         xVfP0rRVJAGZiLOG4iNktItFrVoipiisfV0Zh7HDUriKFEaRW6f8o+U2OJGzmo27/m2O
         LGEurA5onvKXdL0HWls2plA91V8sZCO0dbpIUfpgjGpq483AWtgD5ULBpBDTCvBcVOnQ
         UrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJtljlWfswpDDpAnUDjR7A0FiOUmuThlBRS2V8r1yRY=;
        b=QsPwZT4MzIygr+KfyKKBQ5L7T2RDAOlbRdV1gCqHBUHtS1DhJrs/6TiCoxnwkuBwlB
         xoOQzyYqIkqdvRDYw5EgBHBLGlt60mnN+ciPM6WnHs761EIwWlibVA2msl/lfyNRVK9N
         dahHr3BSTBlPuucO547z+WRPZRXKSHsHndI9UKJunnhVgRiIi0zCqL8LPIzjGF0smXFc
         dD5ODfDCV0ECjT7AUQuCIHu19ovrqN0vKcsXOOmWK0ab+QRo4Sw/nAZNHft1I49LBCAm
         i4amgv9JW5AS7reXwNDMRTd84vhLureDGQq7c/rJnYRXXDvO0KL3oAdxD6eO6eXFNPfE
         0cLA==
X-Gm-Message-State: ANoB5pnCePBuM6gUjTSjrqLjytcVk1xSVLCr5X3cwM0StggLINapPRHP
        nnuCiPCTk/idd7BuQHHoXcKN08pOJWVakedBt8A1Sg==
X-Google-Smtp-Source: AA0mqf6gtl57ZKrhqiQPjl7KA2EKKX2kPX8Aw8Q+Lw/4WFrk6BpWQA6DOjTCJc9rM03uMHOPYBJPZCW8UZoS6u/xDe4=
X-Received: by 2002:a0d:dbcf:0:b0:39f:21ad:8475 with SMTP id
 d198-20020a0ddbcf000000b0039f21ad8475mr5048210ywe.489.1669139662229; Tue, 22
 Nov 2022 09:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20221119014914.31792-1-kuniyu@amazon.com>
In-Reply-To: <20221119014914.31792-1-kuniyu@amazon.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 22 Nov 2022 09:54:11 -0800
Message-ID: <CANn89iLTh6OPb0LLcAnfzZPt8jDtfyUo5xDA4c0gL4534xmiOg@mail.gmail.com>
Subject: Re: [PATCH v4 net 0/4] dccp/tcp: Fix bhash2 issues related to
 WARN_ON() in inet_csk_get_port().
To:     Kuniyuki Iwashima <kuniyu@amazon.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Arnaldo Carvalho de Melo <acme@mandriva.com>,
        Joanne Koong <joannelkoong@gmail.com>,
        Martin KaFai Lau <martin.lau@kernel.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "Ziyang Xuan (William)" <william.xuanziyang@huawei.com>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org,
        dccp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Fri, Nov 18, 2022 at 5:49 PM Kuniyuki Iwashima <kuniyu@amazon.com> wrote:
>
> syzkaller was hitting a WARN_ON() in inet_csk_get_port() in the 4th patch,
> which was because we forgot to fix up bhash2 bucket when connect() for a
> socket bound to a wildcard address fails in __inet_stream_connect().
>
> There was a similar report [0], but its repro does not fire the WARN_ON() due
> to inconsistent error handling.
>
> When connect() for a socket bound to a wildcard address fails, saddr may or
> may not be reset depending on where the failure happens.  When we fail in
> __inet_stream_connect(), sk->sk_prot->disconnect() resets saddr.  OTOH, in
> (dccp|tcp)_v[46]_connect(), if we fail after inet_hash6?_connect(), we
> forget to reset saddr.
>
> We fix this inconsistent error handling in the 1st patch, and then we'll
> fix the bhash2 WARN_ON() issue.
>
> Note that there is still an issue in that we reset saddr without checking
> if there are conflicting sockets in bhash and bhash2, but this should be
> another series.
>
> See [1][2] for the previous discussion.
>
> [0]: https://lore.kernel.org/netdev/0000000000003f33bc05dfaf44fe@google.com/
> [1]: https://lore.kernel.org/netdev/20221029001249.86337-1-kuniyu@amazon.com/
> [2]: https://lore.kernel.org/netdev/20221103172419.20977-1-kuniyu@amazon.com/
> [3]: https://lore.kernel.org/netdev/20221118081906.053d5231@kernel.org/T/#m00aafedb29ff0b55d5e67aef0252ef1baaf4b6ee
>
>
> Changes:
>   v4:
>     * Patch 3
>       * Narrow down the bhash lock section (Joanne Koong)
>
>   v3: https://lore.kernel.org/netdev/20221118205839.14312-1-kuniyu@amazon.com/
>     * Patch 3
>       * Update saddr under the bhash's lock
>       * Correct Fixes tag
>       * Change #ifdef in inet_update_saddr() along the recent
>         discussion [3]
>
>   v2: https://lore.kernel.org/netdev/20221116222805.64734-1-kuniyu@amazon.com/
>     * Add patch 2-4
>
>   v1: [2]
>
>
> Kuniyuki Iwashima (4):
>   dccp/tcp: Reset saddr on failure after inet6?_hash_connect().
>   dccp/tcp: Remove NULL check for prev_saddr in
>     inet_bhash2_update_saddr().
>   dccp/tcp: Update saddr under bhash's lock.
>   dccp/tcp: Fixup bhash2 bucket when connect() fails.

SGTM, thanks !

Reviewed-by: Eric Dumazet <edumazet@google.com>

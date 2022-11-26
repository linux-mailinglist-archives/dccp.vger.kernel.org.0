Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0CC5639515
	for <lists+dccp@lfdr.de>; Sat, 26 Nov 2022 11:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiKZKAL (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sat, 26 Nov 2022 05:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiKZKAJ (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sat, 26 Nov 2022 05:00:09 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728D018B35
        for <dccp@vger.kernel.org>; Sat, 26 Nov 2022 02:00:09 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id b73so7711614yba.4
        for <dccp@vger.kernel.org>; Sat, 26 Nov 2022 02:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDnRL1ZmQxOMFMNGZoJPqBH20uB7idv9vdFa8r24GwU=;
        b=MiEyQDHiGILUBvLpce9HOeHnX2so9u+IdOsselUg6u0uUyClXJnpVT09HoxE8OS6Wq
         pzzB6gQ5kgLdYaF+JldoYMepHbKoSsnbO7j8qlp57xrhxLn2e245C9kX8nsoDpkHmZmy
         lYELitg3JAQqqt9AJl27jhXMFxFmQz4gRe73nGNzoNcav360yj4bs9sbxfoPoGQELBVF
         Z8CW7WBBxGRykwRA3T8kMgSloFoPODAEglV/ik/ob5zz1Klm8bAzyH0OxWUUTdknPCin
         6W5ZM2e5Jc0vsKtpe83UMamJFUQhLySaXNiHdj+3b+2GdNpB+fgSlmxoxT0M1JxI8xxw
         j07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDnRL1ZmQxOMFMNGZoJPqBH20uB7idv9vdFa8r24GwU=;
        b=C2gM75HT4v8qOpmu/H0UDlXShm2Zcui52+QqkgcUWuH3z32vLhuCjf051K+TAl7Rwn
         agvNOO4Cyf5O2nPyke+mZLMuSukia/Qgr4gFy4SBUl1KO1fI6IEqe8Y7K1ZzDVx1Jkda
         ikYjRz+6XOK7FPLc5fbCGMc/FK06Hn5azE08GtCvR3qcH1wL0VgnwBwIk9bW4oZazdMQ
         v6HegqxhKdCqdMagrwwYpOOpSc2lgXW0dSPkZZwj41z62UsgERWk656uZn08J+JurEck
         GOh6dKg1uHMWRhxdwxfTPyoNCzN0jRLBugbPvddCdNX2ySGcm7zM4wnzHfy23ie0xphn
         0a6w==
X-Gm-Message-State: ANoB5pn3yOHSeCZ4w+YI9QQ6z49m1aJ6cUnex/8KEkP+3Yhr851MPRzw
        EiHXViYxcYoja/RbOgy+Qhc7ZI7zifM4B4bYFQU=
X-Google-Smtp-Source: AA0mqf4wX5vGWkwzOtJheTozNHjzSTy6gRHwog6HTrzWrLvxvNVcEf7E3pjWkJKeDMwZfxDcZO6KOsgtt2yEnrLWr5k=
X-Received: by 2002:a25:c485:0:b0:6be:8e8d:639f with SMTP id
 u127-20020a25c485000000b006be8e8d639fmr37897339ybf.506.1669456808648; Sat, 26
 Nov 2022 02:00:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:480a:b0:3de:425f:2d37 with HTTP; Sat, 26 Nov 2022
 02:00:08 -0800 (PST)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <coulinina15@gmail.com>
Date:   Sat, 26 Nov 2022 10:00:08 +0000
Message-ID: <CANZxeNOFxytK9dL68ZHA0u4KfHtLK9k3OKp6zZ142eEC87Ovjg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

-- 
Dear,

Please grant me the permission to share important discussion with you.
I am looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs. Nina Coulibaly

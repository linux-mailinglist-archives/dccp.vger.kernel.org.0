Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D5E5642A7
	for <lists+dccp@lfdr.de>; Sat,  2 Jul 2022 22:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiGBUDT (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sat, 2 Jul 2022 16:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiGBUDT (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sat, 2 Jul 2022 16:03:19 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4BCDF5
        for <dccp@vger.kernel.org>; Sat,  2 Jul 2022 13:03:17 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id 126so5411667vsq.13
        for <dccp@vger.kernel.org>; Sat, 02 Jul 2022 13:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=dLWcVdG/vJ7pdL1QuYHhvedWqnd2dz9a4gO4/fJfKf4=;
        b=cxPYdpRjnoX+iW3cwL/XU8H3EERtEcEgd+IBki/dwOMEiMpjQ9+VMVxN3Fc97kFQ8g
         ykPOs1r4bQ81v+YfevebaDgzTwNQdwhavGr1jauukpShbzg1c3TA6hmPjUlRPqWQreC2
         eqFc0s7vPiHhsrGDtmlm2jtmNzpG+Cm+T5msuvQDsr5ual5EUqQoctZIWQ8rLU5pzXr5
         /qeKIjs9S4lsGKu6LPxVQzLyHRmYGOjADBHd4CDQ7M8iY1UFgFgDYpkLHmAYrR1omzyR
         KHFeaz4HP7p84yl7zeEaRACnlUHShSv8zbSZc38whWLy28ZGM97Nmw9VhRr3qrbZewqo
         1u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=dLWcVdG/vJ7pdL1QuYHhvedWqnd2dz9a4gO4/fJfKf4=;
        b=fTyxZCNxavZLN0gquvp27eXndAUdB7cyaDkma/kceWV4agg0PLYuYW0iV2OhOCAoHg
         rX3WINb79+azGPsNsp+U2F8LqkewyxrwMwI7XoyjfyWTxd1mQffknsLM6EmeqXY+e0UZ
         +v+ZfW7BEecUPFJ6DfgjaB/FO5Iyw9MQUtNKQ7DApgpl/BlJwpQhGGZNoSNifQxUMY81
         olalPux6Aq4wNnxNUJrR3UB3mkBlDwo7a/r6fmGqP9YL/7kUb5AHgjXmlPOnBytA0jv/
         Wdl+q8IWva4jmaLERuYCIrkbWv0MwXtM8OIbVCe9nyf5xKdUwOFn0gD3ecQwB4Ofvkq2
         UpUg==
X-Gm-Message-State: AJIora8nzkJDoEX2OFmYJ0KTlVX9DihLMe33jPoAOecYU1uFoGCdQXy7
        LShD1uUyKaBtCrrUP08St1wXDz1Xq6+TFVOk3Mc=
X-Google-Smtp-Source: AGRyM1vlO5anBGIAmOkputXJXpOEq4Io9LAGK/e1guAPGG/wfDcUO3yyQ3S4yHrce0oWhiW04vzURqaxVLWIZ1T/08E=
X-Received: by 2002:a67:cc1b:0:b0:356:479b:7140 with SMTP id
 q27-20020a67cc1b000000b00356479b7140mr13596095vsl.47.1656792196526; Sat, 02
 Jul 2022 13:03:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:9091:0:b0:2d1:1a85:1f4a with HTTP; Sat, 2 Jul 2022
 13:03:16 -0700 (PDT)
Reply-To: marc.colbert104@protonmail.com
From:   "Mark COLBERT." <marc.colbert102@gmail.com>
Date:   Sat, 2 Jul 2022 13:03:16 -0700
Message-ID: <CAJMiVvjAk+Zs3U-NiLkL7qxp_aeMd9x+ASfcD2iGt3y4sgnFPA@mail.gmail.com>
Subject: Again, please respond to our previous email.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Again, please respond to our previous email.
Approval has been given for the release of the funds.
The payment will be made immediately without delay.
Feel free to ask questions if/where you have any.
Respond, for details on mode/schedule of payment.
Regards,
Mr. Wade KAHN.
Email: wadekahn777@yahoo.co.jp

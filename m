Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2CE6EFC3E
	for <lists+dccp@lfdr.de>; Wed, 26 Apr 2023 23:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239938AbjDZVMn (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 26 Apr 2023 17:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239904AbjDZVMm (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 26 Apr 2023 17:12:42 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5A410F0
        for <dccp@vger.kernel.org>; Wed, 26 Apr 2023 14:12:41 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-506767f97f8so13276765a12.1
        for <dccp@vger.kernel.org>; Wed, 26 Apr 2023 14:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682543559; x=1685135559;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=UsES5JPzF4QSxtGh9uAHeXJEIwute7J/gaibl89GNu/htXU23RFo2DglOmsQHdsAOn
         SdAKm+yZjAS9QNPOUoaC8zkns+U2dd16eoiMte0z8/2+WU/FtBMjWmbMyy2YNIHhbcat
         qP9CbOgRbir5FVYg0234DBkeMD2DHY8c9rsqx2tG3Zyavh6m1i4LGGMTT2ZNO878kHkD
         xr01gPyfHvvXZ7jsBce9mUmy2/Jf5m5j4ByXbv/TcmLIhxT53A4cbfh6wvu6tBbEAEz0
         w0pOZlC5Ml0sa7nIdLki6cL5/NxbLAQbkCekrvN5g9ct0AZYnPLXv2Yk6Y0ZRbWJ54N5
         FPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682543559; x=1685135559;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=U4dZcYy9VcvlJqAC2Jlx/XJNg2QKeMT9LyoIm0XW15BWolwgG6+VgwhxOkHK4ZvzEu
         TaVJtce9V4vsVXiJos8jaqwUW/GBg76HmIE0Sx+wsHF8bufkLqfnPGG7xw+nBKiqXx2Y
         puR+6KGGCbMlbh2pv9y9pXBx8mZ0e8Rq/5P2QTTXrWlfwLXBUn7Ba58CPw3oBmoVJ3xu
         8VZb42zkYPtJKSYlkv18WPGE8UumYS7+LCwSPAotdwWJTMGwuwhalLZ2OM7uLxHS4nvq
         fgKVCTVVB8Gnn2e1LVpWOB3oDcEnrIFtkHBAD6a6N8kxx0XMhKg3nVvPgPzghnghHY3A
         Pf0Q==
X-Gm-Message-State: AAQBX9cZ8cobm7repeG9fsmOGyHAhgXBt6cjmUaj0Sqz7OAtOSYh7a4G
        dFD4Pvf6ym0LU/7CGSKSAr49rnobKzLmpnE86U7f1/TS/i3A0A==
X-Google-Smtp-Source: AKy350ZMkJWaPXgFWKwG2kHLfJyUQbNDDqzihFS7PKIB2wvrmDVkktg1oLkCldiPTbcICArOT94ZmudLvp2y5pZIAlM=
X-Received: by 2002:aa7:d9d0:0:b0:504:8014:1554 with SMTP id
 v16-20020aa7d9d0000000b0050480141554mr17359887eds.28.1682543559420; Wed, 26
 Apr 2023 14:12:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:4783:b0:c6:d649:3a3a with HTTP; Wed, 26 Apr 2023
 14:12:38 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <jamesjanneth27@gmail.com>
Date:   Wed, 26 Apr 2023 21:12:38 +0000
Message-ID: <CADCRY1fK_1XJe_zEtVqGfxpx4s-ckGggnLEY0-fGwmA-vaRf3A@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0DC52C5D4
	for <lists+dccp@lfdr.de>; Thu, 19 May 2022 00:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiERWBs (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 18 May 2022 18:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiERWBk (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 18 May 2022 18:01:40 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22993281786
        for <dccp@vger.kernel.org>; Wed, 18 May 2022 14:50:32 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id g3so3115695qtb.7
        for <dccp@vger.kernel.org>; Wed, 18 May 2022 14:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=675CvuSp++zNLeIUZybBsP51nvc83dY+2bSGb3FYErQ=;
        b=EHywor1tGPa8q1x+/ElYoYYjqR036UriPE2ag+P7smK794VAQAaD5w2NUxVOHyZn7Y
         WpDOZcK6TtaNBr3/emRhDMBd885SRKUtEqR9lmrVHH0EvBgnqzzt1QlWTMJ2zu/4YV6W
         HvB3rADq9O/HBi3iHscda19ydabpJW2OI21rnFZ/33bFZwF1OyCEDdjR0+GDfl2TANGU
         FPqGxY11fqcG5zTNhJk6+p+dDKe6Jy8kK0n9JRo1FsaKrV6surP/Qm1k5a4vbRI8naDc
         2T8rVQaTNgaJctpdDfFOf0A/mrzhue0I6up08VnO42Wp+50CVaBUzRYcYrTVf7hiYz71
         cUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=675CvuSp++zNLeIUZybBsP51nvc83dY+2bSGb3FYErQ=;
        b=ziDEPJHjXLY7Q9tOzavXM0ZaM8poZzV88BaYh7jNHATkk1CAveNamY6u/c6d6GhW99
         rLFC42UngT0ISk+raF528FJKzudt/3bN3/+vpaiPbWcM13BKotMVsQaEc3ilF2XeuNsN
         ZM99dG5u76A60t6t28JpkOtD8FELfhXGoMHukNzRDEvOH5nMpn6ZG28oVi/nWnlbYcnJ
         WYWVPKhDTVxf4d4mf0NU1p4lK60ARetPXyT2LPctcDTPiVFmjwJh0JTy5ncj17zbzaqS
         1dUG4iMRlw32TO5Vw6A/P5sSFrDzBRZnDRxqH+2ipQif21kkYXU6GAdRJL/XJYuFX6ao
         yI8A==
X-Gm-Message-State: AOAM533/+u/fDc24wblyEB2IA//rbmHB+qJYhQra4DkcPadOmn4G1dAr
        xwdb2WrGS67/YGUyvIRt6NEqG2qk++Tb/LZ4IJ4=
X-Google-Smtp-Source: ABdhPJxcHfcBwK4RJ+qcS3/RO5qNYrIAY7hz9vCnWiBt1hss6BEX21dYmU1sZaSXVgWo0nl5KldguoEiy3mLyv0D5nQ=
X-Received: by 2002:a05:622a:58a:b0:2f3:c0d0:1def with SMTP id
 c10-20020a05622a058a00b002f3c0d01defmr1670432qtb.78.1652910631273; Wed, 18
 May 2022 14:50:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ad4:5cc1:0:0:0:0:0 with HTTP; Wed, 18 May 2022 14:50:31
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <thompsonmiller942@gmail.com>
Date:   Wed, 18 May 2022 17:50:31 -0400
Message-ID: <CAN7gJ1TtYPGBhnkrtRO9Z7bSt=cmZurAq3k=8kC6LSpjoAaq+w@mail.gmail.com>
Subject: work
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4608]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [thompsonmiller942[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [thompsonmiller942[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Can you work with me?

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DAB594DE7
	for <lists+dccp@lfdr.de>; Tue, 16 Aug 2022 03:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244008AbiHPA7s (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 15 Aug 2022 20:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349256AbiHPA6R (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 15 Aug 2022 20:58:17 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C471BB8F39
        for <dccp@vger.kernel.org>; Mon, 15 Aug 2022 13:49:30 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id w18so1522688qki.8
        for <dccp@vger.kernel.org>; Mon, 15 Aug 2022 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=ciiDt7IvJulP9OD3Rdq8UvRJ3fwWfqewZln/FuuV02VzqTDNxD6KPMkb0xfzdNRxy8
         +Djh+8Tacz4KwWedlMk2YxcJrjnu77ky4O4+oiBAmlYNryIFr6hkSNTxpxR2nH36KTz0
         VZJ5L4o1ZUSwtKt3PJEnOmCNK32E9wIG7hXl9kucs6UOFwG7qZeXPgTdSTZipr2WhtVr
         Dj5niZU39Ux+5XEmJMd9UbZ2/Dq5BwVG3EO022Sz7hHDQnSr6JNuvHgiFLh661sNXKqZ
         Pz/Ak4FtHu7se1rMxfLmJRqei1KXXZ6oQEqqvyvYzSyF1xQy37aH+ppciYPXQnBOroYe
         9pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=e8GYBblKokxnBye5P6c1lKghiGAxYhHyRLp7BcW87++nghIUpGOZYIu5VeF1pIlbbe
         eRWzeDonbL2kMe906ECT8PJnkUB6pAQKAVnIM/3Yfs4N4lFAG+jqZBrE8oXrIxSPNzI6
         bFdo22Lm3lPvvQsLUabMvwEI+y0NsQiaPP1+ksRsXxPScpsUD9BKj89YboCqjCwpBVoF
         D2/SL096kWKZlGOMi3lkSyqr4JeNaZImsQ+wIjcXdjDBsy8KIesPm3YiW0+lUdu3JQg5
         FmGoPZf0VQ4tRrPtsY56hiPG/UUqPHoCzo8q3Y01+31wNMIb1ql7EVH2Cor/vQZyx8e7
         5XIg==
X-Gm-Message-State: ACgBeo3BvIOQk6yUfP0x+DaDm91So673sjYZqnL0uzfqRYPI1gPHCtbA
        of8grtz6RtDkjjoEZFNnPi0yCM6a8DW7hdSa/S0=
X-Google-Smtp-Source: AA6agR4OyNII0/T7Ajz/xZEHVX5t/vs6a2boGSvSsLNg87xrMh5q2e1rm1NYCUG0MZ1/3JjMUmh5qHaPQl4Nx3tHjN0=
X-Received: by 2002:a05:620a:e11:b0:6b9:2aea:65d3 with SMTP id
 y17-20020a05620a0e1100b006b92aea65d3mr12812712qkm.112.1660596569528; Mon, 15
 Aug 2022 13:49:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:ef88:0:b0:46d:3a61:256e with HTTP; Mon, 15 Aug 2022
 13:49:28 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Prof. Chin Guang" <dmitrybogdanv07@gmail.com>
Date:   Mon, 15 Aug 2022 13:49:28 -0700
Message-ID: <CAPi14yL=-oMuMop-OF5+7fFv1b1T9bKVUSG4J6GXsht-GK8bEA@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:736 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5086]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dmitrybogdanv07[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [dmitrybogdanv07[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

Sincerely,
Prof. Chin Guang

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F42874D56F
	for <lists+dccp@lfdr.de>; Mon, 10 Jul 2023 14:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbjGJMaF (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 10 Jul 2023 08:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjGJMaD (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 10 Jul 2023 08:30:03 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444C6103
        for <dccp@vger.kernel.org>; Mon, 10 Jul 2023 05:30:00 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so4245774276.0
        for <dccp@vger.kernel.org>; Mon, 10 Jul 2023 05:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688992199; x=1691584199;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=FXvIdTc68oVVGV7z40vQSQTWUhysGTYi/JYmVoo8EIqH3yGnjBSTkEtvi9UKtlE1qS
         scWlKp2Uh9gx+h+1ro2FdLR+fH4xmkW1n69MwuBJa1TyZMEiB8NXhbq7cft4UaCM8da0
         Bwnfx1FTflqBavwh90O19m2PxOflofsRYQRJje0IfWXO5mAiIsfaSptMEbJtkGn/vrd/
         jj3d1w+6nVYkN4laInm9eyRJFHygW3a/qHSHx4i6YS1LKa8MIxPEukW2OofIFpLRSbov
         7lns7QPYIBd6BTPGN5HMknPjlFBoYMGwgs2BeZr5ZKi3fR9QMM7WwfSWWQ1UO34AsoSH
         c0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688992199; x=1691584199;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=lx7dB5QW8dbAgyuGzW1jIkBUP4wMiTSRZCOeEGoua3urfAGFp2XxSRhr1qim8C4lMS
         L4EdiMaNI0gWYRq391ahd0vc+VUTCeouCjd6oaQt0hwmJaoPW0yfILwXAnKsydRfUyCe
         gF8cmAyYEp3kDeJ9inAJmMxMXD/0taP10wiUB8JeeAk+DNRhUIzGfMeUQ4FyWa/9x115
         x4Q7uK8vKl0MmdlxPssbLnBjmQGcA4vA///0h7AxN7ZuBMGibNUzYw8sXeJ29TW06Kc1
         NoBUgL8bCjtBp0M4Kkqq9KQnnAfpK7FQ9qnLPCtVPO9Zso0YQrUFe4R+zxL9wAr+FK7f
         mZEg==
X-Gm-Message-State: ABy/qLYXCh69c95xzUcdx4O/zogBhysOlko+focCK55U9HC4qIOvSq2k
        D0BhL3CTNgFrx2Tt5OZV04VzSos7XZwr9ErUS7o=
X-Google-Smtp-Source: APBJJlF85YotSJcS4oFcPogXacqAL7Y90FhAJ1wO0RBSV/w2afCJaqV1Y3w60sZRFaBJ2Xrd0Y++t1JQJTNYHj5/qUw=
X-Received: by 2002:a25:2d01:0:b0:c1a:b0e2:e930 with SMTP id
 t1-20020a252d01000000b00c1ab0e2e930mr12136657ybt.3.1688992199278; Mon, 10 Jul
 2023 05:29:59 -0700 (PDT)
MIME-Version: 1.0
Reply-To: salkavar2@gmail.com
Sender: mr.leonharris111@gmail.com
Received: by 2002:a05:7010:12c4:b0:36d:f257:ebc6 with HTTP; Mon, 10 Jul 2023
 05:29:58 -0700 (PDT)
From:   "Mr. Sal Kavar" <salkavar2@gmail.com>
Date:   Mon, 10 Jul 2023 05:29:58 -0700
X-Google-Sender-Auth: 7rkLvUZy467A1VbuYNDvpl0l2Yg
Message-ID: <CANg__WSh_1cPpzr_qPiVA_trYhPvk08TBBa5cuhSFeoAicBw5w@mail.gmail.com>
Subject: Yours Faithful,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5041]
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:b42 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mr.leonharris111[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [salkavar2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [salkavar2[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.6 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  1.7 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

I assume you and your family are in good health.

Overdue and unclaimed sum of $15.5m, (Fifteen Million Five Hundred
Thousand Dollars Only) when the account holder suddenly passed on, he
left no beneficiary who would be entitled to the receipt of this fund.
For this reason, I have found it expedient to transfer this fund to a
trustworthy individual with capacity to act as foreign business
partner.

You will take 45% 10% will be shared to Charity in both countries and
45% will be for me.

Yours Faithful,
Mr.Sal Kavar.

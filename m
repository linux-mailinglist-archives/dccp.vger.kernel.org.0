Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A6F51839A
	for <lists+dccp@lfdr.de>; Tue,  3 May 2022 13:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234962AbiECMAC (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 3 May 2022 08:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbiECMAB (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 3 May 2022 08:00:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57ECA2A71B
        for <dccp@vger.kernel.org>; Tue,  3 May 2022 04:56:29 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id n10so15545768ejk.5
        for <dccp@vger.kernel.org>; Tue, 03 May 2022 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=6Sdk0zIC53fKnd0AhUgagosyQ05s4CWLaby2vRipFVc=;
        b=Xiu5jD8siIV2ji+PWVETixPVQ9oIylgn1TMWlmVPVcIVsopH4vMK0L8EHkxKqgl/ne
         PscdBFDpFIjL78Gh3XT+yPaGegjMJLIVn0zCE7vcBU9V+EoZRCiIuT7CUfccVvrst+bY
         m7ymXJfjLdJlg3j8lw3jDQPhz9CGH810SQb/qO+RVeBFhk/g21kgUDNF9wnSFZkiHjP/
         cGILTs2zTPe8KlGyQYe2DrAJpvL3Gc0M3DqJeTEGdj8ct1OviPE/kIJ+gXTIOY57qInx
         2Pf2xiiiY648I2XLUNAMN1UCSAi3jN509mh24Kh+fC3djIMOQMyBijJ1I+dupaA8Li2+
         1vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=6Sdk0zIC53fKnd0AhUgagosyQ05s4CWLaby2vRipFVc=;
        b=QADp7WUh/IRkcUfp3h1ERn+xx1i2Gp1D6Aynfu3pcOjJNV1a3V88khZF4qnBWDU4HD
         aamneReMHgrdGbkn1sCaevikueE2tLirUdGmjEo8dzOjzKQRZN6c3ww1o4rx9JcHRVpT
         HZ8Iebv32oxvEfbQa4Z5hzWLjt/n4TCGm5ZYlA65gP3H7lkw4nJkqyvkrJjFxpEgws7u
         CM9TvHcUPI5wXO/8L1cl1veOD6SH7jcO5jFF8HcVWauSj9mPVL0KEAds8Op2oqJTearV
         pmyGek+EzPpt1T70xuuM1rgGI1Ays3Uxrj7q9rCJNP0Xraz7yJl3bcUqFmbJalLCxNnF
         pmzQ==
X-Gm-Message-State: AOAM532vI4xyTmQcEPvVi3h7IE5ZQaLkU8YGrH6uy9/45TujRWg5n2/D
        Wu1/hEg67s2SJdAZ7KmzgTJTaBUcuRIK2YyuUkk=
X-Google-Smtp-Source: ABdhPJxpY63oDt0MWDKO+dyP1ZpBUdjjoa5zbBxdwOxhINuaXrmw83sgTGsQ9zqURTfkFjXu3d2ApBl5qh3NWjg5UK8=
X-Received: by 2002:a17:907:1ca4:b0:6f4:68b8:99d2 with SMTP id
 nb36-20020a1709071ca400b006f468b899d2mr6405240ejc.616.1651578987893; Tue, 03
 May 2022 04:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c25e:b0:1a:7107:ead with HTTP; Tue, 3 May 2022
 04:56:27 -0700 (PDT)
Reply-To: stefanopessina097@gmail.com
From:   Stefano Pessina <loancompany880@gmail.com>
Date:   Tue, 3 May 2022 14:56:27 +0300
Message-ID: <CALn+s1RmzYfVLXZzGR8GaKxG=Od0KhN_=xZduDWvF3GNY_fFig@mail.gmail.com>
Subject: Cash Grant Donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:633 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [stefanopessina097[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [loancompany880[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [loancompany880[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.3 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

-- 

Hello My Friend ,

You have a donation of $2,000,000.00 USD from Mr.Stefano Pessina . get
back via :  stefanopessina097@gmail.com   for more info

Best wishes ,
Mr. Stefano Pessina.

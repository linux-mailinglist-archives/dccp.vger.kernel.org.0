Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72004522B02
	for <lists+dccp@lfdr.de>; Wed, 11 May 2022 06:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbiEKEaC (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 11 May 2022 00:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbiEKEaC (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 11 May 2022 00:30:02 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E4753731
        for <dccp@vger.kernel.org>; Tue, 10 May 2022 21:30:01 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id x12so746154pgj.7
        for <dccp@vger.kernel.org>; Tue, 10 May 2022 21:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=RisCeINXqigauoxKza3io27RLUXZRrecXVzQxV9bTk7ErudQxfWIK0uyMSWQewIIb0
         zKuQ547wbDAROiiIQn+rTuKaQPqeyo3empWT/V5vBEqfVfVoIl/vUgF1VXbtDIjSj/Zi
         l95HpevNlobcdnIrSik7PYipVu/s2MDCJcW5B2Nd453QrD7lvxpU8r/q0HxKT5iLUcqF
         gzbomh2MhxWezJOnai3OLDmrdWgHxuiIvEFoPKU1di2/dn4LGuMGc0TgJZheyti21/x6
         3awErwFiMBd74tqtTkGKF7VsBkzJOpPMrUAuKWf5KyvZyTib37Sy5aRyv3hi2Ll7sHwz
         klsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=b5HDmthFeVTtLtm0XiMcuNPDVDYa5HFbNWZdyOye18E2q3Im1DNRVc5BOjas2+dfMR
         h0bmcXTvvqwUlNNOI2gbmpctl/aa9Ug/IFaeVEZyy59MhXfG/dH+sq4gQA2T9x6cLmdo
         GGPRvtR3E/t9vUGoEk4YrqI1GMQGWH9pJViQ4cF+meUNWeYYrWhIsTPAB5VTcDjy1J74
         GRD30VOaZppKo1HIUSSmu+3+SO5H3Cqp1/YEa0DtmJhXFijNeIwUP6w0Gl12C3uOGqeB
         pP1CR+tGgS+Bq13EQITrt91rGM0p5CbJlNnWcw9TAxlkjUhmVRXHfNU4JXbqxugaqXk6
         Kusg==
X-Gm-Message-State: AOAM532iX8ywUW1p+QstnZ3/2xmODb+Pwb4UrD4ajSbb30btvk82Vqg8
        5+2pdUlkaY8HLVVjct7F8674FiBjJ4MRbjQlGQM=
X-Google-Smtp-Source: ABdhPJxLFORJlh+R8hiwFiKdUBA3fW6jSdYoPPOBkW3xMLMW7wMV8+SxP+JK1ns+RqRYIECTycRFGtBO3e8ve91Dy+E=
X-Received: by 2002:a63:9141:0:b0:3c6:270f:cec2 with SMTP id
 l62-20020a639141000000b003c6270fcec2mr18936555pge.182.1652243400570; Tue, 10
 May 2022 21:30:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:319:0:0:0:0 with HTTP; Tue, 10 May 2022 21:30:00
 -0700 (PDT)
From:   Private Mail <privatemail1961@gmail.com>
Date:   Tue, 10 May 2022 21:30:00 -0700
Message-ID: <CANjAOAi=6gYvXv6ea_iEimVZcYWiDExt4ma_8T_aV8pNh8eAZQ@mail.gmail.com>
Subject: Have you had this? It is for your Benefit
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DEAR_BENEFICIARY,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        LOTS_OF_MONEY,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Our Ref: BG/WA0151/2022

Dear Beneficiary

Subject: An Estate of US$15.8 Million

Blount and Griffin Genealogical Investigators specializes in probate
research to locate missing heirs and beneficiaries to estates in the
United Kingdom and Europe.

We can also help you find wills, obtain copies of certificates, help
you to administer an estate, as well as calculating how an estate,
intestacy or trust should be distributed.

You may be entitled to a large pay out for an inheritance in Europe
worth US$15.8 million. We have discovered an estate belonging to the
late Depositor has remained unclaimed since he died in 2011 and we
have strong reasons to believe you are the closest living relative to
the deceased we can find.

You may unknowingly be the heir of this person who died without
leaving a will (intestate). We will conduct a probate research to
prove your entitlement, and can submit a claim on your behalf all at
no risk to yourselves.

Our service fee of 10% will be paid to us after you have received the estate.

The estate transfer process should take just a matter of days as we
have the mechanism and expertise to get this done very quickly. This
message may come to you as a shock, however we hope to work with you
to transfer the estate to you as quickly as possible.

Feel free to email our senior case worker Mr. Malcolm Casey on email:
malcolmcasey68@yahoo.com for further discussions.

With warm regards,

Mr. Blount W. Gort, CEO.
Blount and Griffin Associates Inc

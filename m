Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935D3734D51
	for <lists+dccp@lfdr.de>; Mon, 19 Jun 2023 10:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjFSIO5 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 19 Jun 2023 04:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjFSIOx (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 19 Jun 2023 04:14:53 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CB694
        for <dccp@vger.kernel.org>; Mon, 19 Jun 2023 01:14:52 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-39ca48cd4c6so2067716b6e.0
        for <dccp@vger.kernel.org>; Mon, 19 Jun 2023 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687162492; x=1689754492;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rJ/7Kbo9gs7zs3QTF5nFKkJrBjocKGAtdax9LA/wsFg=;
        b=FDISoEFTwML/+p368lw1P/Cn3vgdll9kixDZ2w6lnoYYAp8s8Z+hqKuaOVevpLCOMI
         ph54uOPb2e9ngwvgg8My1IiADYjqT7Qwp7Oz69iR839wWcx/TVrIJwC7/hAXVlvKxhQG
         EUviG/ZRkcdHGA8fZ6+HvO3OJd89syyb1I+HhxUMtX+CAiQlWf6TnU7bdcaLAWdzYWNV
         XpNsAUONjxeJJTofE8ExIdPiMBQjRZhzVOpjPKeKiQ4rEcDGKIUibD0EVAeTNLSqcAct
         kePtpwl4f5GYqXWFP0QKYYTjFIjwD2pxvjcNVYVcQwOtl/PcljQlRJvPjB70ZVOwvUqI
         GHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162492; x=1689754492;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJ/7Kbo9gs7zs3QTF5nFKkJrBjocKGAtdax9LA/wsFg=;
        b=kukiuxAGrWIgNjiUV0LULfLkSIxnd0Oq50SP7OT/uN+e8/WyzgGXWUYYLzJFEzDr9C
         1rH9tZYcBuWSOnFtRWrA965KqiCKcDY18tYlIrpRtPUPiVONZZSBBDWVfLLa6jzTTmU5
         DG02C9zJ6wQIVH2KnygoJGJw9m6XsBp9316qgV8E1zHMz0Ozmpj0O8kbFQNGe/oOpmrA
         iK104+UCQiOFYIAHo8qblf3UKwLbjSLVIY2A+sPKuzWr+wlYjPdJwqFO+2Q8SfB1yFLl
         qMzgZaYSIY2nb+im7/FxihzBFwhXw+/GyCjzSu/df3tUPfbNasZN5tLezOCkFqw8fKDW
         enyw==
X-Gm-Message-State: AC+VfDxGKSXwE5GxMiK27Keb4HkaUx6d1urIz/JFSs4Sdjr4ERkySYiu
        TS2MtPBXgow5e111UfAjbm5xH12b1UyoQa4O7UY=
X-Google-Smtp-Source: ACHHUZ6gBLx4NH9cZ6UThAbHP/9UMoYMmPUQrSEdOIi38EPe7t+3DFpGtUChcuuq1Gm5ZGOC9zSPzL2r9cT4iNhGGZs=
X-Received: by 2002:a05:6808:6398:b0:39c:8bc5:f8db with SMTP id
 ec24-20020a056808639800b0039c8bc5f8dbmr6693095oib.37.1687162491819; Mon, 19
 Jun 2023 01:14:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6359:6e83:b0:127:8127:f692 with HTTP; Mon, 19 Jun 2023
 01:14:51 -0700 (PDT)
From:   OFFER <diazanna810@gmail.com>
Date:   Sun, 18 Jun 2023 20:14:51 -1200
Message-ID: <CAO6W-YLZC8t7fAc6s5=KCjJUV2S48JR8gjJde-xf00=-WSAtsA@mail.gmail.com>
Subject: Greetings From Saudi Arabia
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Dear Sir,

Need funding for your project or your business ? We are looking for
foreign direct investment partners in any of the sectors stated below and we are
willing to provide financing for up to US$ ten Billion to corporate
bodies, companies, industries and entrepreneurs with profitable
business ideas and investment projects that can generate the required
ROI, so you can draw from this opportunity. We are currently providing
funds in any of the sectors stated below. Energy & Power,
construction, Agriculture, Acquisitions, Healthcare or Hospital, Real
Estate, Oil & Gas, IT, technology, transport, mining,marine
transportation and manufacturing, Education, hotels, etc. We are
willing to finance your projects. We have developed a new funding
method that does not take longer to receive funding from our
customers. If you are seriously pursuing Foreign Direct Investment or
Joint Venture for your projects in any of the sectors above or are you
seeking a Loan to expand your Business or seeking funds to finance
your business or project ? We are willing to fund your business and we
would like you to provide us with your comprehensive business plan for
our team of investment experts to review. Kindly contact me with below
email: yousefahmedalgosaibi@consultant.com

Regards
Mr. Yousef Ahmed

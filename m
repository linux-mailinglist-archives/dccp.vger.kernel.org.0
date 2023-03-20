Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0BB6C1123
	for <lists+dccp@lfdr.de>; Mon, 20 Mar 2023 12:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjCTLtN (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 20 Mar 2023 07:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjCTLtL (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 20 Mar 2023 07:49:11 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA95E211B
        for <dccp@vger.kernel.org>; Mon, 20 Mar 2023 04:49:09 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l22so11752258ljc.11
        for <dccp@vger.kernel.org>; Mon, 20 Mar 2023 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312947;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=Q70luUMWCpRsf+n3gDRImpttqITMsohdipUsa5VTba/jJWU1TGWrcMK2PQiBSwfYRn
         WaUtdvTVDm0VwChZoHcyfPTv3a2IYvzkHdTWwsjQk3oPUi+bQWgAFuUC0XpnDxcBRzqc
         lOXOGZ1UF2zHAlzXhFxC3tCghPvR47QTKhd56II7jQ9xawTwf6STjG1JD8rWBV9mwHux
         oQD9Z5qTK1BBi9vVlSBm4LRZCVr95KNq8tnEkckoBzM+lDeaCYLeCRh2M4ViHTEnyp0J
         hYFqt5LIO2gAx51KAQQNe8apOdxfQSCgM+sATtk9YY0zIx7dPqfbHLbo9VVKJ5epXHfp
         ReFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312947;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=aNgsK1yYGjZyXrzhKzjTRvTXsFJj1L/+TnknpdhG+M8kczYbdkghD11Nb2hAiQLe8a
         3nURbFO70PgQbpFluiThcmxIm9jFpiGdGKJzX68E99z5DLsW/yjKeVavjcL/ToZ2lgVo
         eXlYHsa1ywaOUUN2wN6WDoa5kvh829xwvzszzjVjIRXI71kY9huRJ029oMAHMpQDj+on
         90A3Dh0v56xEcfrJ+EOsPccpJwsIxVOXMt147B/0wJ5wZ9H3tNf3/Psi0BYFqolmOyc+
         a6Is3JseNC9ll3rNSlDWYfDl9l1owl8LHH1l2yWK2MSasUnYgdUicgFs0mcfXJI/iwRf
         5J8A==
X-Gm-Message-State: AO0yUKUTLyPEi4anA2NJniDiKT6vniw9xvI3btcLlRkHtatqk/y2s3p1
        KaHrOjdOKu/zmztWEhZ+gPrs7g+hhTA3OwRogxc=
X-Google-Smtp-Source: AK7set+2Sk6sAlHNmxjHrSzTPnb31SWxrz+n/KainNYl1rPuJ3Fg9evnzOD5zvrIcXHFD9Mn6L9b40YGnf7Z+YN/NGs=
X-Received: by 2002:a2e:b5ac:0:b0:298:7c9e:505 with SMTP id
 f12-20020a2eb5ac000000b002987c9e0505mr5762087ljn.8.1679312947720; Mon, 20 Mar
 2023 04:49:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:73ca:0:b0:222:5939:ed00 with HTTP; Mon, 20 Mar 2023
 04:49:07 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly214@gmail.com>
Date:   Mon, 20 Mar 2023 04:49:07 -0700
Message-ID: <CAL5O4-HtJdUV-h05+JHRc6Ndqk_m5pjebD03uGQ4ZeykcnkiNw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly

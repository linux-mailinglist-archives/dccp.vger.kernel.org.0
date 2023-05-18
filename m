Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB577707B08
	for <lists+dccp@lfdr.de>; Thu, 18 May 2023 09:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjERHei (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 18 May 2023 03:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjERHeh (ORCPT <rfc822;dccp@vger.kernel.org>);
        Thu, 18 May 2023 03:34:37 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE4A1B7
        for <dccp@vger.kernel.org>; Thu, 18 May 2023 00:34:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f27977aed6so1933643e87.2
        for <dccp@vger.kernel.org>; Thu, 18 May 2023 00:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684395275; x=1686987275;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=aeF9Qh9eIrcKV0VOzRY+2njQQDD3pNQhHlyknN5GzFSP1A0+7QOJVaYu1VMHmN/lYD
         CKoK+o0LQ/RucJcGt3tpuhtDMrWe49ZGJcFSZZxYSgBI6YwMJxb6kDu1GVSocH9Duxkt
         qD7F52KwwCmOcn+Y+EcPGW4J7iY/Ih9aP1ZmDKrXev8NIFJNk/NbBnIq+KAnU6tQ5GHF
         EPPQX41tLcfPDyZg+T999N3L5DpfWyN201KnX+VKxfifqYUhYCEow2m1+DcZnAceM2qW
         r42WGmx3t/ROYBv/0niN0JDQFEGMXJbcGbVmO5897MvUWURa6GU2I32o6XER5NQuhTku
         0kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684395275; x=1686987275;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=NP7DlrrApWgfdEiWhsI4WHm+2YzM+H7xAYBOHTMbgCb9NlY3Nuhnm1hB4xHdqWZKCu
         kh9aBOAa3xNnqtUMLTwfqTTRZCTBTdYilbVz5cAww4PZHS/OCGPxd/cZAjHcWv3L7O52
         A0bTagKmh/rVKgpHxMbsv9lC8Uo7WUQZ5ixfNHflh/Wee/wVaVlnpbWRiN1twZBAbCNT
         j5fX1XGe3g5fQQIPjeLGRUo5YkoUq34vntfRKBA7yIjIXfl3Qm+OdJX9h1q4C03rSC0c
         bYqi3zn6Cx5OP69Ct6GiU1BvuAs7UnLVt5kJhEFVS8MGu2nl+tjJTttaFan0tw559IVS
         ZXQQ==
X-Gm-Message-State: AC+VfDxSdRvERKuxl2nIal6RwtHbwy/eHwiHh2wCXF/Rw6eFOj43E76s
        ZgffxEZoxc/dhyyn1rkhCHAnPj7Wh8dk0PNLNOg=
X-Google-Smtp-Source: ACHHUZ7uuo/5Db2snkQicVW6eBRAZSao7CjZuSfg1DbvlOGjCD1i2OuHpf5Bcok6D4MSak/dp06XSL3hBvJ64fdJAQE=
X-Received: by 2002:ac2:4546:0:b0:4ec:844e:7b85 with SMTP id
 j6-20020ac24546000000b004ec844e7b85mr1018081lfm.25.1684395274812; Thu, 18 May
 2023 00:34:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:7310:0:b0:222:5939:ed00 with HTTP; Thu, 18 May 2023
 00:34:34 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly214@gmail.com>
Date:   Thu, 18 May 2023 00:34:34 -0700
Message-ID: <CAL5O4-Esx9sZry+H_85Aw4Dv-df8f9UgBQvUxF4JpGnR7LCDSA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4911570920E
	for <lists+dccp@lfdr.de>; Fri, 19 May 2023 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjESIup (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Fri, 19 May 2023 04:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjESIuo (ORCPT <rfc822;dccp@vger.kernel.org>);
        Fri, 19 May 2023 04:50:44 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC0510D9
        for <dccp@vger.kernel.org>; Fri, 19 May 2023 01:50:31 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-561a41db2c0so40519557b3.3
        for <dccp@vger.kernel.org>; Fri, 19 May 2023 01:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684486230; x=1687078230;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9VGGyuCCLKSSiQdC0nI1d1YAaPWI1/GKqon17Q9aHQ=;
        b=XVSkz4oPz/FZgDnHNS4QM0Rug8qzADwGhu795wZZPgH5/Z31hJI6FYhexYYyk6DZK2
         CUCJ8fDlQ11PHPhrLwIRogkiFvBVZf0bxKrUGeMoBGWsrGOQwSbmakgZ3HAymH0Nsr/F
         yBU/4tSMo8d7WeJZO+IHsOqnCiPra4Rp+VuCTbcQDq2ipfo8tNG+lloDd+UvezqIXYMP
         +77qO0sAln3ZS1MzMtnSU74a3on6HW0bVtv18AEfjX1a5YsGPWJw1INof1CLIn4b73R4
         w81v9yKgxSplvWQ7UlRFbvEUVYIzfcXOE6jV4zaRargqSaRezK1zEBXFyioODRFUmPs0
         yZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684486230; x=1687078230;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9VGGyuCCLKSSiQdC0nI1d1YAaPWI1/GKqon17Q9aHQ=;
        b=LIEXlsPevpEBR9UwsXevD41O97bSSPe7Gm3/XjxFShYwn5QoWr+8MM6L58buLICf5p
         f2heaPxNawHIegrvoi1gPq/QJq/Tj5bmAGx6XnM9XoczWOcRl6mauESAHJLGdJgoXlxN
         MzHlJpT+3AXVYI94QvGmSKxuGyc3hcp0mENnz7ALlIfSUPcv/WQgVVM7TwvuLQ4iptKm
         DuRCRWFy1t34i61gKwsffhk/W82O+NbocQrXEWVbREDPd9Kd/ZNHjxYVKXMJiP4VWhRl
         KbaXZI8XAN4Wftc/IhK4fq33rxkeNIX7HoEn+bq1fSTXfv7/qlQcxlm+dsw2bOIYtaNH
         /b3w==
X-Gm-Message-State: AC+VfDwMwiDr5SONKoH3t9Mi1mtpqgJtiotY0c7T41MJdIWCXSDzpQxX
        R00ZURmBApZ51Nt2JaYcPkQ2VEHiod2QzxzgxyA=
X-Google-Smtp-Source: ACHHUZ492NA2KkH2ISJcmpRxIusX+Byp02Ph3rQcrt3X8sKo+gMvkElQ4exXLrHZ0W03WPO3SWJoaZ/8P+yZSPx72gY=
X-Received: by 2002:a25:ff01:0:b0:ba8:8b4d:c1b with SMTP id
 c1-20020a25ff01000000b00ba88b4d0c1bmr854813ybe.52.1684486230230; Fri, 19 May
 2023 01:50:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:6108:b0:2fa:ea06:e64c with HTTP; Fri, 19 May 2023
 01:50:29 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly01@gmail.com>
Date:   Fri, 19 May 2023 01:50:29 -0700
Message-ID: <CALav4vSwjuh+rEZcr+qs8b-hNvuQ=3=P2-Q8W2WHWXY8VNfrMg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

Dear

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly

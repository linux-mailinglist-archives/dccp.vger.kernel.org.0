Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45B0621170
	for <lists+dccp@lfdr.de>; Tue,  8 Nov 2022 13:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbiKHMv7 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 8 Nov 2022 07:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiKHMv6 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 8 Nov 2022 07:51:58 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDA363A7
        for <dccp@vger.kernel.org>; Tue,  8 Nov 2022 04:51:57 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso8995251wmp.5
        for <dccp@vger.kernel.org>; Tue, 08 Nov 2022 04:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=YMP3qnEHObdClYut4tDiDRNLKGHQnQXT4MOsP0Uh8dtNB2XSin/uOkFn23txSwYci4
         0LfYXGVNsItoeP99ulbhhe53LP1ZFaA6i02TtrD2UPM7cSn5Ro0fyVG1UdvJNe8mYCql
         V7klRh43aOEU0PgWYxFCOX4rpNCkA3PFORU2HA7DCcaFHb7qJJb0+m9G8RQMUPPDOBgL
         U8XQOQMvbBu+UMUJOkaoztAdWj7pKnsDhZBcx5444CFdTKkkrD3qZr2kYJnXja71QcaW
         wHWma7kuvQiBaQfBZ3lEFFKzMqhrjfTw+tDPXj7Xf5aj2gDW3tDvP1dwfzuqKPlygGPs
         r/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=DrqveM1Wrbes9hIQ3dZ2P2cGUN09eeVvkyPZUso59LW52cist5KPXQkq46y2K0i71z
         VbU74GDpnRQB93b5DnjTnP2OXNbMAoE8emWk+EUnlhaBHijGI7hkQSuoTMl/1pazyL15
         5EeMCZePW+yCR7MusWvOYez07eqeBCAInunbk71iN9+JLKWkXOVUAmN0s08HtfpAeP1o
         D9mFGeJ904jsfTGhQe3alO9BYiaLd1Kt6ex6+CZWd2fZy5Fnap+fCEluAgN+IeJPzyY6
         F1MAsGXPZ3bLq0uqLvnoVZxwVUNFjZpi7HEgV+/Bq8kzIIhB3CJd641ooZqltycBnaiX
         KevQ==
X-Gm-Message-State: ACrzQf0o+3LNWrtuRD6uj7T4ceVg9V2hbdpT+kmD5+RKEQ7lc80XJwdN
        HY+bDRe1PtiUyWsuzSvBSh3ND+FT/alfQWMI2Vw=
X-Google-Smtp-Source: AMsMyM76Rxs3QEGVbuiHJ1f5Oh62u7SS8jvwIMQz1NrPf5g5TnpxQbZSugwtHDwnVH8GKW04Sm27GV8W8wqTptuWXI4=
X-Received: by 2002:a1c:ed0e:0:b0:3cf:6b2b:f1db with SMTP id
 l14-20020a1ced0e000000b003cf6b2bf1dbmr34455219wmh.117.1667911916177; Tue, 08
 Nov 2022 04:51:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6021:f08:b0:22b:1bef:1706 with HTTP; Tue, 8 Nov 2022
 04:51:55 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <fofoneabraham@gmail.com>
Date:   Tue, 8 Nov 2022 12:51:55 +0000
Message-ID: <CACQYsd9RzbeVT6v0UDaET69-xQttUM9VD3v8gcUty6WmXgDDkQ@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham

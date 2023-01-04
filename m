Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B3F65D22A
	for <lists+dccp@lfdr.de>; Wed,  4 Jan 2023 13:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjADMOU (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 4 Jan 2023 07:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjADMOT (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 4 Jan 2023 07:14:19 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C826B2E4
        for <dccp@vger.kernel.org>; Wed,  4 Jan 2023 04:14:18 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id c11so26969046qtn.11
        for <dccp@vger.kernel.org>; Wed, 04 Jan 2023 04:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=akrTiVTd/HSmar0Qv8/zUiCFbL1UXJTsDUBaGCru/JcQTk2UQe4+YaCpT5rr2BSSpT
         kvLeA5OW00G5RCdwYFdz1khVATLg4Q2ZUJW5j5wiuVIERuFqutomuo/Yz6SF8mJmJNDs
         vQwIupu9oI2hBKDF3LqEIVpStjXr8VkctL+JOQVjF2a71W1opfzrfoYRhozMHTZmRpgV
         w2913D5cZrfdMzRgLHpiGC6X4J76n3azjrOP0IquNEKjck0iX6088TA9FxL6FQ5OQEfE
         HJaF4ATtuTEYJzOqDDSONK1SPQuY856o4GlbuFiW03ur11/jUmwhSAyTd3eXL0gBmAoj
         ulWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=VjRT21s+ldjn39/Vh+T3Jzmbnu0HGyDazPG/ukHCHOXUaWn5Pkda+lCm4N5N8g3wTS
         l3YE2LRmWtk2PP7bZ+aVqAK51LTMunE4r075+Xr01Wm6djR7BA9skjlVX6QwO06BSkhe
         uk52OkBNpqzPQJWP0yjPCGPfzxYIpU2fUYK2X3v3IFJFt5A1tE6gFsGfwV6rNAYkocV1
         gH2E17PXD6spxjxMmKpec2JjEOrq3rH8ubZ3lKtJmcPhV+ZVdUjSPlBwy54c7CgxW70j
         dgBwMPG2dwC06w0bwf/2oJrUEh907VjWbwPU9dE+GgXqUvNqNcD85g7O0tTGmgN4Q9pa
         bblA==
X-Gm-Message-State: AFqh2krEO2tnTusw8bHHbDPCR0f6p1QDc1vZ37I24U1h1TSwoPSyKivz
        YMOhfjCvbj25/hQ8WEGvqkLJ4QD4Cumaulv0Fcw=
X-Google-Smtp-Source: AMrXdXvx8v2CxJV0dZ3m8piXaMvWR6HK5KfznW1PRztayE5cbfWpshxsy9ezIMWLcfFWfC31UUn/7A0lNEggswdQpnw=
X-Received: by 2002:ac8:4984:0:b0:3a4:fb34:7d9a with SMTP id
 f4-20020ac84984000000b003a4fb347d9amr1950677qtq.379.1672834457557; Wed, 04
 Jan 2023 04:14:17 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:622a:1485:b0:3a8:2397:6ae1 with HTTP; Wed, 4 Jan 2023
 04:14:17 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From:   Greg Denzell <gregdenzell59@gmail.com>
Date:   Wed, 4 Jan 2023 12:14:17 +0000
Message-ID: <CA+k3XGAs1EnOiz8LopiESscJ=4mmzVPK5-fouGu9xtRVbtBGKA@mail.gmail.com>
Subject: Seasons Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.

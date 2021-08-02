Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48013DDDF7
	for <lists+dccp@lfdr.de>; Mon,  2 Aug 2021 18:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhHBQwD (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 2 Aug 2021 12:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhHBQwC (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 2 Aug 2021 12:52:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE40C06175F
        for <dccp@vger.kernel.org>; Mon,  2 Aug 2021 09:51:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h9so24726807ljq.8
        for <dccp@vger.kernel.org>; Mon, 02 Aug 2021 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=EFDEOxEBj9I9s7fKhQnTMH+MQQVqHtRi7JZa0Apxt88Fq2uHMWi+aQEsydr6NDAE2x
         pBHfYa74Eps5HyvMfixKK1umQgGuu76alZLAiGoW20LgjdtiS2IaYORly3IsSLPp8ZaH
         ygANWtPIKMmxYx7w39Kp4s8YpcU5ZkvRtbXh2LKs8kLGE8M0J7lmsr52FsRUxFS5/0Nz
         FWnZWOjpKBVmstYgonwqnvs2CJrKI9DzfALVfhL5uDokIOxuQN86ciAfpUwQo8Oi97hC
         zGJBjTnkSpWPKsJxmNJ2+uG09/N2OSqzbyt7Ey5ZMKekfhDEDinV2qchEIqb6r39dJjy
         2EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=LkU0DvL7DreVSckRP10yVlAsdwlr+36Rz9ZlWLN8oOANr75OBypdprIYHLmgfHgeX4
         h3uGJI3LjZ1mKXIg/RnWb+dywMkcnVmPfd8EC2/nRAepltPMZykfML9nOzTxDVnqzY4V
         68D8RQFjq6N1qAFESVQl5DoLMCo6t4I/py4h2oySKOVV6R0LPpsy1flj5kQYv11PnmCs
         o7ws8UVYaT0V6zIZl1UDX6DHsYMPYXKXJwlY+YZCePJOuCLlTxkP4j4c/inULuzv10kJ
         Iv+8ovmGjLzr1k0b5v3g+pAeks/egG+oxHoIgwbaTCQ5qk63ZEC7V2mUfN8aKurMJHBj
         vkAg==
X-Gm-Message-State: AOAM532N6uQwTN1/BHg9NzcsXtYKLuCAl3Ayz3hJdxBOnM2/dMcQqKsf
        qsFLzT3kvOrX7yiU/tkFwMmuSGsMetEx/I3bEQc=
X-Google-Smtp-Source: ABdhPJxJlKfmg35i1bCIH78KVOzn4RE4irX/feuuJkO86lrp5JYCQZ6gK4dQTj54h+YrGxTL06jaNdWGzFC6tI1lzcg=
X-Received: by 2002:a2e:b4b4:: with SMTP id q20mr11887247ljm.155.1627923110438;
 Mon, 02 Aug 2021 09:51:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:51d4:0:0:0:0 with HTTP; Mon, 2 Aug 2021 09:51:50
 -0700 (PDT)
Reply-To: fms333166@yandex.com
From:   Frank Martins <martinsandpartners.tg@gmail.com>
Date:   Mon, 2 Aug 2021 09:51:50 -0700
Message-ID: <CAKBT9ESioUx_Z=uwqH1_Mo0KixseMSou1GeC1YXkjw-wkUBUeA@mail.gmail.com>
Subject: =?UTF-8?Q?Ich_warte_immer_noch_auf_Ihre_Antwort_auf_meine_zahl?=
        =?UTF-8?Q?reichen_unbeantworteten_E=2DMails_an_Sie_bez=C3=BCglich_Ihres_Fami?=
        =?UTF-8?Q?lienerbschaftsfonds_=288=2C5_Millionen_US=2DDollar=29=2E_Bitte_best=C3=A4t?=
        =?UTF-8?Q?igen_Sie_mir_diesen_Brief_f=C3=BCr_weitere_Details=2E_Gr=C3=BC=C3=9Fe=2E_Mit?=
        =?UTF-8?Q?_freundlichen_Gr=C3=BC=C3=9Fen_Herr_Frank_Martins=2E?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org



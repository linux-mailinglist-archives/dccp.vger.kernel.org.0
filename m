Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7946E53CD
	for <lists+dccp@lfdr.de>; Mon, 17 Apr 2023 23:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjDQVXX (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 17 Apr 2023 17:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjDQVXX (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 17 Apr 2023 17:23:23 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DC644B5
        for <dccp@vger.kernel.org>; Mon, 17 Apr 2023 14:23:22 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f167d293c7so11594395e9.2
        for <dccp@vger.kernel.org>; Mon, 17 Apr 2023 14:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681766600; x=1684358600;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=raOvDqQr2eq4Of5xQT6cMdKveC+Zgm5ET9+gMQ30MaWEBlPEbSSB9yby115kkbMKS6
         5QYTif14RGgzzF1bYkQMHYHWP4xY66QJJPhEBODla/yGJdo7XIzPjKdx897SJrpD767B
         CNSfIJNYk/zk99S4fNRv05AqsDonREA4VPQWB8CPh2Td72N2GKDbBe4HQton5zUlAQOF
         scHR0cuP839OcbnzN3EFs5+ExJyybN0BTz0Ew0TaBhnOjpbBeYqfM80pzCYodEAjh8O7
         dwESCit4EFT1sWqEbGQcvfAxt/5a6OFgIr4xN1wO19mDzSkulMX2+zWDoaDWn0Bb9DPB
         3IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681766600; x=1684358600;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=abR3oiavQrt8JrPvpfl5pJ2ypyGItH98RNkAtQws8gMA9QkNh88TzQ+AY+9VV0jJvB
         YiFYdbE8B0Gna0OZsLtAB89VglaxF/h+osIep+9p4fjtr0HcPu6cugwa3VSO9naOS3p9
         NDqi0ZhH9iXpgBpN7OC9e57g1qSrdNIaLFiqB/KYvf/QIrqHflOt+57Rd+cyKOpjvXxr
         HIBxuBEu1MsIAaKGqd5YZ9DOUzVXPTisBu/mVZ3YgZ8RhiNZbRjjr+wqvJ7UgNVCAypf
         OaWIrEfwKJc2vqTGMRAYq0QYmTR6rKyMBCevyba9F5jCZKWGoFZRFsWeMGlqtjWU2sM+
         jlrw==
X-Gm-Message-State: AAQBX9fq1qS+bNLaun35IgGuQL9XPI8y1sbTGAY7dlEoW0RheOj3V/B6
        6DMHkSoNtCUNLf3L1OzmsGNCwCShqbhxF1rdjW8=
X-Google-Smtp-Source: AKy350ZOawtzNgfqWpusJ0rwGKbunZco1hw1nIcu41IadqVBTac/RRbT9GPHUYOLK89qe/V32TZMFHqizgDxFJSBT7o=
X-Received: by 2002:adf:eb0b:0:b0:2f5:5d74:4f9f with SMTP id
 s11-20020adfeb0b000000b002f55d744f9fmr216827wrn.11.1681766600424; Mon, 17 Apr
 2023 14:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:ce8d:0:b0:2ef:12c5:56c2 with HTTP; Mon, 17 Apr 2023
 14:23:20 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <regionalmanager.nina01@gmail.com>
Date:   Mon, 17 Apr 2023 14:23:20 -0700
Message-ID: <CADndTXtqfPWJwJbVVnbmw4U5F8qr0X=kPatmMHExWo16SBDT6g@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly

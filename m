Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7BE76FDEB3
	for <lists+dccp@lfdr.de>; Wed, 10 May 2023 15:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbjEJNjL (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 10 May 2023 09:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235752AbjEJNjK (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 10 May 2023 09:39:10 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5281130
        for <dccp@vger.kernel.org>; Wed, 10 May 2023 06:39:09 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b983027d0faso9237197276.0
        for <dccp@vger.kernel.org>; Wed, 10 May 2023 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683725949; x=1686317949;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmlwvXEoimVTfsyyyYai0GQlqo3zzXGhdH5Gfvmx5TY=;
        b=NE5T8jumqhYuKkHM9lO89uHyQPgEfZ2CFPu/m7OjNIDoAHyoN60vdts4gPSM+YjIKg
         o3OHEncm4AnkFVmHkEz5xFf4NC+cJcQbM6VNi/ppYKhxQkrtZeDzT1gLJv717Y9klgiz
         +/NVJ21YcmIVraCUQyyDr5jo3jQfTk9KBm5MhNMmxDDmBjnHds+0oOR8tKnHMYBvxsSl
         OriGQyF8vt1T1Rpz17sDFkdw8Du+cF3JYEKEGydQ6sL1GTONlf7nbhNbyajtSP/MY/eI
         GDiYnpO+i+22i7Wquaes4HyHusy7nrRNvt2I+aSuPHL52WGxtjHxubsvG4UMIvRhdznu
         5R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683725949; x=1686317949;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmlwvXEoimVTfsyyyYai0GQlqo3zzXGhdH5Gfvmx5TY=;
        b=UOn1bLFBlGpcIOcCnrpXWs6W876PPOLkoTnyrOIxkSxvXhf6iKDAurJQYGsa7tWJ5c
         ueHlswb3n1PEoftyN79R/p5iR9LdSNXOJMclZqpMKZAyXz7ajnwU5K+RZ6coF1gyy4qP
         hK9gBrTq55EDYPO3IgmnKhL2Ea/XSuSn+T8boZPL9A7HfFK+FejVgKX3U75NCqGcTkaX
         Hws8rO9+PinXf5633QNgpZ4oCgCgBjejLIelkzsx1A90upST57IXSwAGBgUzsExF2KVe
         tZk/DfrNNgiWOOJYpB784KDeGa/wHay5NKEvTAnfwSZOgzTgtla8nnozPj9vxxDGbpsj
         S/cA==
X-Gm-Message-State: AC+VfDyoh7m1khvcfeDBK1MZeaug79ii3lzYuWAMjS6QY9Rfik78sw0l
        imuaFy2Qz5LIVfQ3lAksbWV1n9b2LBJ9WvQ7kKU=
X-Google-Smtp-Source: ACHHUZ6FpENaGV+jzcpjs7K8v/QpP8QlUs/Npds+hHmiPp2TiXg4TRuP/KfgAmOLvFmnh9pPCBBKFwGmwL6fHWgIERQ=
X-Received: by 2002:a05:6902:1506:b0:b9e:8a15:753b with SMTP id
 q6-20020a056902150600b00b9e8a15753bmr25369767ybu.16.1683725948955; Wed, 10
 May 2023 06:39:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:19d6:b0:4c8:31f6:3644 with HTTP; Wed, 10 May 2023
 06:39:08 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <coulinina15@gmail.com>
Date:   Wed, 10 May 2023 06:39:08 -0700
Message-ID: <CANZxeNMF3PK=2AiMDm5f01-k56zF=vySTnQ3czhdE__+fzpmdg@mail.gmail.com>
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

Please grant me the permission to share important discussion with you.
I am looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs. Nina Coulibaly

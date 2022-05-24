Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFA9532602
	for <lists+dccp@lfdr.de>; Tue, 24 May 2022 11:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbiEXJEd (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 24 May 2022 05:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbiEXJEa (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 24 May 2022 05:04:30 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1496513E9E
        for <dccp@vger.kernel.org>; Tue, 24 May 2022 02:04:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id v8so27798968lfd.8
        for <dccp@vger.kernel.org>; Tue, 24 May 2022 02:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=H7cTMX0LmXuXmKz+SeqT99Rbevu2X1N9feVzWATtqDxP/+/5OAHSU2Wr6Dw+3FB1Li
         42Kuz6S+jR+uVl+f2RCVtMCVHO4jFx50z3bSeLFlaoQ5b8rC3SNolIUZ6sULbQ+gcLk1
         ee0uUiYcDDIH0YZYfb4EHcv387vIQs2sV1JX2hkG9v9PevkKCsFlA7UwBxo8gWaghpSf
         F67T0nOfK+t8yPvV7zkC/KuxIzPgl6uGn44wKz/+5Y3ntxwNxDmK6DWkBaSJwcxu6a+O
         lF/5+xstyURtsq56lz4hQDl57/35IF7yr3QNkSgt5TtJ3Kx7WeYHaYL7tbUD1fgYJjVT
         s65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=h+x6mlVMKUdmPguFGx6UxIome40aJB2wPH8xcDvNCiz1B8CiYkoNHSsfRBZEp+QmVS
         Zkg1zUNmP22MBRqwEZATEBcUXv0y7KnBk7iAdOWch49nvkSi50EaiJQoReEHg4Hqttqf
         jOGGh/l+FowuZqZ1vZyMf0CfF7hwSbajFGxaUFPKKFCiPFYKvSNNQa7PxXk2SRpduXy1
         2NHXlPEEro6x5K5Na1O9yAinITOqEq98wMYPXUvOIRqWt9ALtlMPuCioirjbheGW9F/N
         oHgYNHIUmVGAxASjBWU+zJk8fGo0KZ36Ydv2O829vorQZLZPUvF+OJ2YmcbO1Q7KuGPJ
         oPJg==
X-Gm-Message-State: AOAM532WTEUzkWiYp9UqGpRkWo0KgbhXax4RNHvQZlo5K6oWBI50cRMD
        OhIUI2uy0cL4oAZxieqf8hKD9MCo8tTf/t6osig=
X-Google-Smtp-Source: ABdhPJxqQDgfkowbcvjfGH3SD5AhdBFfJfGeU6e7KXhfho1R5QjDwJDB40rTVoCmD93kkJWn5BlL5CbqlrGzrfxyegc=
X-Received: by 2002:a05:6512:55a:b0:478:54e1:efee with SMTP id
 h26-20020a056512055a00b0047854e1efeemr12970476lfl.448.1653383068270; Tue, 24
 May 2022 02:04:28 -0700 (PDT)
MIME-Version: 1.0
Sender: dokoukomi77@gmail.com
Received: by 2002:aa6:c265:0:b0:1d0:6e73:d87d with HTTP; Tue, 24 May 2022
 02:04:27 -0700 (PDT)
From:   Julian Bikarm <jub47823@gmail.com>
Date:   Tue, 24 May 2022 09:04:27 +0000
X-Google-Sender-Auth: DOWM1IpR2BWVcdqZoABVZFNRFMA
Message-ID: <CAAB_OejsyFyMfb5-+_nYhPT67D6CrTrhCJC0Xc9RV6NFWT=jzg@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Dear ,


Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.

Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian

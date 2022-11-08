Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E69621627
	for <lists+dccp@lfdr.de>; Tue,  8 Nov 2022 15:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbiKHOXD (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 8 Nov 2022 09:23:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbiKHOWb (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 8 Nov 2022 09:22:31 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4AD77211
        for <dccp@vger.kernel.org>; Tue,  8 Nov 2022 06:22:29 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s12so13088529edd.5
        for <dccp@vger.kernel.org>; Tue, 08 Nov 2022 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=N3/yj2r4E3ZbKPT7xHoAySw3tne2mAoMBieWCTzZDHeC1U++ZvstcqamT4zkS53Tn+
         MwMS+xynkKcQRzGhqONKI/yp2/XyOXD6JnPXdXu8fTRQae5acRuAE33j0AKWcPSvA+CU
         xh4FxMndCVFxG9ST6NQEFhMw5AFca0ElhYwqUBfP7wTwDwBV5Qb7eLA/WDOU2X2642L7
         jrkSXlkh2oLV1N/vjSDVBn++qEGqy0e2VqpcfTtMBDES/wLkoxBpJdE5vjXyNktH1lMO
         QNsfQPjAHcOkN+1F6bY/zErfA7wl/NT0oAIElX6JB8aHzx1VnrbDzcgnJsyaRQRkka7e
         aP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=YM60oHIjx4gjRV0VQzt6L9D/l+hCVDCglbFl5fvUiwhX9svR6CuOWKEUyXZ3AMeWPg
         EM/PPNIoLcEbp0E5h+rYhocrQ7Xzl4h8wxKp4AQ42lGT5tS7o3RIOv87TRSHeT7GUKM7
         J9p98M3ReadWTDlfigLASfzPna0P8j4lpbjol8LpUE3tlqIRmZAvO38cT7PM2v9FYS7Z
         58voMNVVJPJ1TXJDPG0a1rn7j6ZnfOQOQZcTjZp7MTM8BBcH14QRhmdvFxBYEPKa3Pdb
         6dhFrYMs46Sgon6M12jDY600mpChaXfHhRwZxStaweqi/XOWOK/QLfwalCTCFmIGcn7w
         TZjw==
X-Gm-Message-State: ACrzQf1JB5TTfnttnkPBx39Sb4r8qSxdPRQolhGMc6q9T5wGDJy/ls6U
        Xi0JovrL9Bqk5a9fGQfJLOtr0qwWB5nXvnimMHk=
X-Google-Smtp-Source: AMsMyM68bpxcTfbg6w0jLRGycKI6BmuhGndEm+PAedYUu7Qo3PHDC8RAcS55hJTFfal+cGb+F4gaDXSh9585WVk345s=
X-Received: by 2002:aa7:c14b:0:b0:461:c47d:48cf with SMTP id
 r11-20020aa7c14b000000b00461c47d48cfmr54286616edp.83.1667917347744; Tue, 08
 Nov 2022 06:22:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6402:3514:b0:462:e787:e7e with HTTP; Tue, 8 Nov 2022
 06:22:26 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli4@gmail.com>
Date:   Tue, 8 Nov 2022 14:22:26 +0000
Message-ID: <CAO+ex-VsO3CDw7_PRkK5uoM9Xbwn9GifqRd=FcWc5qT3_T0qEQ@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:534 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4980]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli4[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli4[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEDF642CB1
	for <lists+dccp@lfdr.de>; Mon,  5 Dec 2022 17:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbiLEQV1 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 5 Dec 2022 11:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiLEQV1 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 5 Dec 2022 11:21:27 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BEA1D66B
        for <dccp@vger.kernel.org>; Mon,  5 Dec 2022 08:21:26 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id z92so16550177ede.1
        for <dccp@vger.kernel.org>; Mon, 05 Dec 2022 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=WpGWlZW0sQf4YKFL2S7kgQw+B9tPiseDUaoH3pPMdfcAz8yNDjrwqU6crOhxU6TkWq
         /5C1NfpTkrYfo+j2sTjVEVHw7cBgycNxloUmzisNAfuRVziPBRpK4vpCYwe2knXbVoul
         IPCt/F9TG6N8mmCuNsT7NmPSHsvGSSQR7fddwf7MEydiXIF2IWzQjZUuwB4xBrf4YvSy
         MM++I5zW3mVOeugLqyafwL/VpYnzfkSMUgxldk9l9M+AO3hx34GCZFo6NuLTulzLyZeV
         JhSLZmh8J+dGqVuqnOamRrIucuV4OexDoNCThe1CJCBghjtbNwqRqoZbA/CujpdlIVmq
         5ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=WgQ3KU06sNfJ70sZHVMRWKMxWHA5aZjBYwz1AjFE0MmqH3lxTwXlGDaiWEpjN7z7UW
         rCM22rlgALI1uiKvb3yvDbufAs6rA5I2Y/A3MOX1H8cvMEeXNhOQ/dMwhlBFwJ1xkSNw
         xJE7DSzD6LkO94dBQrj+K4sXDrFnZC8FS7QZ1Qt1V5as5SRXr0abXUPI+uLDOb+hDUCQ
         I1DTUlNhUsO8Lpp+77DCPNWsityrdyyRyO/83XgSGDJXdNoAy3zmKNyZ4yRFTBO0vtqQ
         lufJCbDMACal7lTb8BPRPN9tZYI5xNR9/DMlHhrImq5icltukbfEGAOWMhXvvvUDb0MM
         vAIg==
X-Gm-Message-State: ANoB5pnujRgVwyDBEmBAg+nuTsSDTaAQaU7F4umYtYrmAfeJ3PBshAb7
        ZHZIo5BH+GSuWUmJuJKGzUfAPr6erdXLFjUV+bs=
X-Google-Smtp-Source: AA0mqf4iwcY3zupNtMRjqtzaFn9fR9FG3wJAV7sE7S81qbuEiUeEIUci0xuClxMhy2CAskLH6CHZ74VmxFZtrYg4XC4=
X-Received: by 2002:aa7:c84d:0:b0:468:354b:280d with SMTP id
 g13-20020aa7c84d000000b00468354b280dmr75851638edt.178.1670257284679; Mon, 05
 Dec 2022 08:21:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:4084:b0:27:8b12:efa6 with HTTP; Mon, 5 Dec 2022
 08:21:24 -0800 (PST)
Reply-To: plml44@hotmail.com
From:   Philip Manul <justintentou@gmail.com>
Date:   Mon, 5 Dec 2022 08:21:24 -0800
Message-ID: <CAK9eWvhDQMBf0srAxJD97SQ2Z9jU2ORu8LShjsYG=P0Wz7Jg3w@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.

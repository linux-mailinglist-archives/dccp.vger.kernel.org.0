Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9EF5006CC
	for <lists+dccp@lfdr.de>; Thu, 14 Apr 2022 09:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbiDNHVp (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 14 Apr 2022 03:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239646AbiDNHVo (ORCPT <rfc822;dccp@vger.kernel.org>);
        Thu, 14 Apr 2022 03:21:44 -0400
Received: from mail-yw1-x1141.google.com (mail-yw1-x1141.google.com [IPv6:2607:f8b0:4864:20::1141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662CBC19
        for <dccp@vger.kernel.org>; Thu, 14 Apr 2022 00:19:20 -0700 (PDT)
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-2ebf3746f87so46238117b3.6
        for <dccp@vger.kernel.org>; Thu, 14 Apr 2022 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=H3DXGoFynX3YmgElWNuJKIN72A4F3e5KQaKvvj92+aU9BHRj1V7XzkVnJuJGimIaxl
         QKaBzOdI1KwqDVXd2XGJ+fP8kG6Xrz85ZV3W6VJWOGT7etCpKyQGlT+KcM8hD9yePY0L
         SqYUg6PHVSmZ5YM06+mrcdHpG11XrSIvUyxZXGcFMp8mFyDtFhpmfEeWucTXe/eJ65NR
         QaWvgYVYMSyOFxXkHFPVbcghooIZlAqYnKCe8Pk0ERRWIkXj6eH+e6unO30cT3E4MpvJ
         66djh98EqHWqLyPkjN8qiSqEHpaU21LM5jSIdoBu/UBIJpr59R3ixW7CILg5BJZl56cR
         alvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=Xy38c2yu+eZ8WpcxtMojpLYlRs3j/Dd7n/Iaoyx0iza5dnnTOusB1ACDJJypIWvvte
         4kO5tYtbAeagBiDiZlNfgkVnbPyKS3zlGseNvbBqlz55CE2TNV/XUganz+mqq5X14ETG
         yEzSCgPl9ie2VtcxruCGt/V78cDohHAylqA7jlDtY5oTgDOPM6nvl0GBh2gszxt2k0Pt
         oDa2wGmVFIRXdhP9f5mXg0JUIS1wNJhWA7MVdnb5zOvZenZsN7aCqPvxo4ESoKFJshzo
         xyuv589964ww/SV5g6ECO25Mk8TTtifAdey8goaZffyNiqsM5xTmBvd+2A2SbtxI+ENw
         yS4w==
X-Gm-Message-State: AOAM533/mb2yZVwkDxyjAbW8gjStjx89/D+yAwdwwYEV/2/DqdleAxrx
        TrmQkN2oyZHEX55av0BK1l5a30nMEhw/p9Hwt5c=
X-Google-Smtp-Source: ABdhPJwBPN3ezBfPqevefaF/MZZWTeilEhFfcRVGc2e+r5Tlck8uMghDcd30kW6RodK9fJrLQ1kDRB5us7nSV+7Gfco=
X-Received: by 2002:a05:690c:289:b0:2eb:e870:4f90 with SMTP id
 bf9-20020a05690c028900b002ebe8704f90mr950385ywb.250.1649920759168; Thu, 14
 Apr 2022 00:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:a822:b0:247:d9b3:22bc with HTTP; Thu, 14 Apr 2022
 00:19:18 -0700 (PDT)
Reply-To: danielseyba@yahoo.com
From:   Seyba Daniel <mohaseen949433@gmail.com>
Date:   Thu, 14 Apr 2022 09:19:18 +0200
Message-ID: <CAOnm=uf+sOxsm1GWfs+og=Uq91U1DrTpWYwLbSdev8ss46xtwA@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mohaseen949433[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mohaseen949433[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel

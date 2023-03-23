Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3335C6C662B
	for <lists+dccp@lfdr.de>; Thu, 23 Mar 2023 12:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjCWLJT (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 23 Mar 2023 07:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjCWLJS (ORCPT <rfc822;dccp@vger.kernel.org>);
        Thu, 23 Mar 2023 07:09:18 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E5F1FD6
        for <dccp@vger.kernel.org>; Thu, 23 Mar 2023 04:09:17 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id ek18so84769555edb.6
        for <dccp@vger.kernel.org>; Thu, 23 Mar 2023 04:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679569756;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fe2YSlcshGfWZCjajooa620VZJBWu0AUqVI3FADJRJQ=;
        b=nqFlME9DMcpz4tIRDpFhOQVNuCzoRhfQWxGkohZK8agIXbo585g0qEMM1ewMhsciv5
         LUpkYwtznPriOOZnXhLBBQXCASOXcVs4C98qNKGMF9u2xLoBYQT57a0OvUatEEjkpE7p
         c6wmJrr+9hzyeyjmu+rsVcFfBaTIeIEjAsEzGJZif87dg1afHbCnf2AEzrXdh+fGIGLq
         NisHQ0l6SHB/zAu7JPZApLjP/BY3dgZfHdssF56mzkRFCEAByXIm5/K7vf14rTnZI/8l
         hLQ65FuOyh5Ev6Cz9FBtCX2odnXYPq1VCXvPhOsBkyoyxarJjyZhCdkjTkqbQpUNURny
         m5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679569756;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe2YSlcshGfWZCjajooa620VZJBWu0AUqVI3FADJRJQ=;
        b=T5sVDpy08y9lzhLpWza+RCwkb+0Jk/Nc8q91b6L9AVerRXCxosrFx9Zmk77Sp15Kc9
         pPPp9icRdIFhWzfp+FGJDuwQJITlhm4i3EvAFINufr5NnGI61iqpVNPWgy45UWRP6yTX
         Onk4eSNRRYdpXVuq+KzfxUfzdvLkg7uq+Pph84bCFD4PpXQ4eUcy96Z9Yg1jCySQmJo3
         WbCAm7YA3Q+DJ+R7FR4T3c1A0wpyFPSgbxRz2Qz81dVZGtNdwyxB8Fk672OdEnNHYP1M
         fdvkbM896ZKYVjE/ACYTLvJu7nB19m+KEvkd218VNNWrGfGe95HZHdJyKpaC46N9trwS
         tisw==
X-Gm-Message-State: AO0yUKUxgprxrc62o5dwSotWbFp2RIUsKNgle6RDczPbsZ3zBJfPsdxa
        agZ2wz30o/mdyKUgrSgYcINUbMf3X+D8WFKdJtQ=
X-Google-Smtp-Source: AK7set8Kb2PsAWpIhw3reFd9wmSdvMWF8rl8javpXM334T39Ad+KFzfKBWjBVlUcgIc+YP1hLk5dBmR22uD7ZFjm5ck=
X-Received: by 2002:a50:c3ce:0:b0:4fa:ce07:639f with SMTP id
 i14-20020a50c3ce000000b004face07639fmr4995524edf.5.1679569755713; Thu, 23 Mar
 2023 04:09:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c072:b0:4a:8bce:2dbb with HTTP; Thu, 23 Mar 2023
 04:09:15 -0700 (PDT)
Reply-To: annamalgorzata587@gmail.com
From:   "Leszczynska Anna Malgorzata." <ogechiogechi099@gmail.com>
Date:   Thu, 23 Mar 2023 04:09:15 -0700
Message-ID: <CAJFRAdgRT=o8fQRzxbBO0GJkD_7cnPf4HAqNi-psY=T1hpAuBw@mail.gmail.com>
Subject: Mrs. Leszczynska Anna Malgorzata.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.0 required=5.0 tests=ADVANCE_FEE_5_NEW,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:535 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ogechiogechi099[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ogechiogechi099[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [annamalgorzata587[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.8 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

-- 
I am Mrs. Leszczynska Anna Malgorzatafrom  from Germany Presently
admitted  in one of the hospitals here in Ivory Coast.

I and my late husband do not have any child that is why I am donating
this money to you having known my condition that I will join my late
husband soonest.

I wish to donate towards education and the less privileged I ask for
your assistance. I am suffering from colon cancer I have some few
weeks to live according to my doctor.

The money should be used for this purpose.
Motherless babies
Children orphaned by aids.

Widows and Widowers.


My husband stressed the importance of education and the less
privileged I feel that this is what he would have wanted me to do with
the money that he left for charity.

These services bring so much joy to the kids. Together we are
transforming lives and building brighter futures - but without you, it
just would not be possible.

Sincerely,

Anna Malgorzata.

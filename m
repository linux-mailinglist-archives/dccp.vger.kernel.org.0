Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF3F573E28
	for <lists+dccp@lfdr.de>; Wed, 13 Jul 2022 22:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbiGMUuY (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 13 Jul 2022 16:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237187AbiGMUuX (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 13 Jul 2022 16:50:23 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D862C113
        for <dccp@vger.kernel.org>; Wed, 13 Jul 2022 13:50:22 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o15so95242pjh.1
        for <dccp@vger.kernel.org>; Wed, 13 Jul 2022 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=PB20jiDCAxe+CGj4bmOMcCJX9PTw2f72Twm4YZG0TsKX2Ir10spZCG+zoe+U1eq9rK
         0wjpGAr76RuBJrIVRx+vggd1gyWlHVRjBwq06H3TsPKs6H9AQTupWUFVTQc4j+ru5vCE
         eSjq1YOrDNwBkNYShrPhnPTSmGxxT1UC0CrDz3yQFxPJS/LOhVqi/G/WsiWnLlSv4YLx
         FeUgPmYniiqQFj4F1B8SeFPuw6xYGIrHIXndAWwjrCmZ4xEVNwk4jZrKYqvxdUkMfLie
         lhK5mapcDr6cXseNXlhoqJDosblPq/WDqgCBRru5tLcuIlxMvVsZrgj6sS+meQ67vDhj
         xvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=mxNiESZUjCa6ep0RFyAcI90v2aqjZhMJC7o5cBitAHhnLtayDLV5TmR7TwnvZ3cfhS
         079IZ+UAtZMnMLdd3MmqeIYpRxUhNTeBUw6/liyOteh/XWi1W8XvUR/h8lMugTcZU61f
         mACpdUPyzGsfC6N2OjIYK8fW3t5vSOo/U45Tf1LvkgAZ5tWZA2SVeJM3THCDRuWwjviy
         RaFtKwldsex00ZoeM7KkSJ3H4l9dHoP0pTAx95zmaGAQZtWnUbqMPgNbEFwh4KIpeoHS
         9ELYwBPBtQt+5oDdxsvQezo9ota0OeXJqwaEH4H2JgCNv9tv6hL3vEKL26Q+EoBuPdmH
         LmnA==
X-Gm-Message-State: AJIora8xQvxo7BxdoWc3aRWstlTx1ZzIOC7KT52WGWhvhqL2fTMJxph+
        Q/wIei6ox2XjcxgcVIe7oQ0VVwJJ9i/tjIm/X5g=
X-Google-Smtp-Source: AGRyM1uYIsUnnXlVdG9GcUKBxcSgt0THZd0RpouJCXGLkx7wGCxUfQUYzdQVGnUY6Kgqg34qvx8KCOiFR1bWUvS6N/0=
X-Received: by 2002:a17:902:7106:b0:16c:6c95:6153 with SMTP id
 a6-20020a170902710600b0016c6c956153mr4836988pll.166.1657745422155; Wed, 13
 Jul 2022 13:50:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:626:b0:42:c3cf:981a with HTTP; Wed, 13 Jul 2022
 13:50:19 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <savadogoidrissaboursouma@gmail.com>
Date:   Wed, 13 Jul 2022 12:50:19 -0800
Message-ID: <CAA6zzo=x=fNy8QPhFrJV0kVoK_Pqjz3GYQr2-LKBLqLZp_0tmg@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1044 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [savadogoidrissaboursouma[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily

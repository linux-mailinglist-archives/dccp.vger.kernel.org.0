Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB294E920F
	for <lists+dccp@lfdr.de>; Mon, 28 Mar 2022 11:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbiC1J5R (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 28 Mar 2022 05:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235704AbiC1J5P (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 28 Mar 2022 05:57:15 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82064F475
        for <dccp@vger.kernel.org>; Mon, 28 Mar 2022 02:55:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bu29so23834100lfb.0
        for <dccp@vger.kernel.org>; Mon, 28 Mar 2022 02:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=CgJnLx2YiTiAlhPSHSahbEcY/Qhad3wU2K/PXmoQc5VSOBsej4mspbOeiDTUwwpEGj
         mevZbVfqii3iaaIRhXy0IYx2YrajflXl+sNtV4kl0CNGJNfv9TZjW+5QARINsUqCSgCo
         27Ip+2FMtBx2kmHVKbQerXA8DOsUDXO+kOdEufqm72BXWwbLksaJjJBVRli/m+PC9Cn8
         IbpiBEl7QAyZFCIhEqHvc/5YU6zc9un6+9EOnpMupUdZtyUqQAjS0jcaGd+UgPn13tuL
         +UM9LfO2iImQ1o0YPzIhUqlmIgaK0sq+/dZbuoVo79tZLOWYy7DfdLtq83nL8b2agqwR
         lvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=kbGDgkqGiYAqxYzAuvJT5Xg0to3q60G11HnoF4oQ4AhXSaBFJzItlgeWfOYIKOx71H
         IukSm0cNae8M4sZbSjoSb/fVObBWp3qOVCaewkXKCtL3lSq7zgXlaxjpFqEgXyArgxKp
         4fYHIXPzpUB0LPAVF6FNv5AIQIvYsgdseGaY5TkEy935g9iZlKF53Gt0v63oiRgMGOXK
         CTZvOsy+ao67INpM3W6/+XjLmUrVoOeICw/34YV469jXc9/s3xrfFDj6U6z2SWpvyyq1
         bYVQ0y9igoqbH0pCfEVJZaaSKuugG8pQ8OUT6On2d5kEutvG+wKXJJZ+HWiUd9XcdOs3
         c0Zg==
X-Gm-Message-State: AOAM530mNw8gYakFiynKjOHzaouRsM0XFWfF+mPGGYge9BUqXUR6YlB8
        uToMYToxOhdbE1A9lctg8Nw+FKrfnrgqVXnZ4fY=
X-Google-Smtp-Source: ABdhPJww9c4uL/asTFUALzuwHuqB+TjpeyTEt9Q5kU38jcvQ8QkhbE4WfGNW24YIitwkshpjlHloLTYQ1ky9HGJGrqU=
X-Received: by 2002:a05:6512:3d8f:b0:44a:2c65:8323 with SMTP id
 k15-20020a0565123d8f00b0044a2c658323mr19060065lfv.52.1648461332301; Mon, 28
 Mar 2022 02:55:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:3f8c:0:0:0:0 with HTTP; Mon, 28 Mar 2022 02:55:31
 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <raqsacrx@gmail.com>
Date:   Mon, 28 Mar 2022 02:55:31 -0700
Message-ID: <CAP7=Wk7-bLq+h6U+zqkNcB83PHUv8Tyj8zmbC3yh5sWaH=SocQ@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4537]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [raqsacrx[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava

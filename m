Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39EF4784C14
	for <lists+dccp@lfdr.de>; Tue, 22 Aug 2023 23:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjHVVc5 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 22 Aug 2023 17:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjHVVc5 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 22 Aug 2023 17:32:57 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 14:32:23 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472F1E40
        for <dccp@vger.kernel.org>; Tue, 22 Aug 2023 14:32:22 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-0f-64e510f81203
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 6E.DD.10987.8F015E46; Wed, 23 Aug 2023 00:48:08 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=QNLEVYucUvTJcNgtMxSrLgDJIa2wvOQKxNXvsmICuYCpJBfBLULaT+/mbfL46isF3
          nP1nz9GYk3MDQaLDnW/YYnQ3QKOjk60Cgzk11yYIqbLfZcag0Qv04nUlt2v1DNyF7
          hFv6u7PlmAOFp8MPi72tVZF9hEG+qHK6QdTOlBy54=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=bbRP0VFOb/waS8dFyBO3SNKkZbLdySmCjyh32RCV/21wLn9jnZNgHR7wCQMLQsXNT
          xBnslD7mQKEDyvXR8In/HQgyPRttjo4fP3DxSpEGPoQ54Kqqc8rlyHUeaNkeWfabz
          snXnPayVCyYhvKr5n5z42GtoCyDZUnAphq5IQgiYU=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 01:11:18 +0500
Message-ID: <6E.DD.10987.8F015E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     dccp@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 13:11:32 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW/eHwNMUgzk/ZS3+Xu9mc2D0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OCQEDCROPLAqIuRi0NIYA+T
        xKQvT1hAHBaB1cwShy+vY4VwHjJLfNk9jQ2irJlRYn/TJlaQdl4Ba4lt0yO6GDk5mAX0JG5M
        ncIGYvMKCEqcnAkyCSSuLbFs4WtmkHJmATWJr10lIGFhATGJT9OWsYPYIgISEj2np4LZbAL6
        Eiu+NjOC2CwCqhKHzj1gBbGFBKQkNl5ZzzaBkX8Wkm2zkGybhWTbLIRtCxhZVjFKFFfmJgID
        LdlELzk/tzixpFgvL7VEryB7EyMwCE/XaMrtYFx6KfEQowAHoxIP7891T1KEWBPLgLoOMUpw
        MCuJ8Ep/f5gixJuSWFmVWpQfX1Sak1p8iFGag0VJnNdW6FmykEB6YklqdmpqQWoRTJaJg1Oq
        gTHHTnFmjVG3aaQit4/CwWXrlRp7db5kid/Pa36f4TvpeVhKUVPWqS3x3yIXVD55kev9e5/b
        ys92HVv+Bnx6veOKUtymee3GlbvOb33+/Hlp7KoPO3I5Pvz52HWK8VfoXlvtnjTPUhsh8c4d
        ccs+797tnha111rvbq5tpz/bzpOOsj07FXfJdymxFGckGmoxFxUnAgAsCFlQPgIAAA==
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China


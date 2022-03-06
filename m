Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA574CEDEC
	for <lists+dccp@lfdr.de>; Sun,  6 Mar 2022 22:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiCFVXI (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sun, 6 Mar 2022 16:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiCFVXG (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sun, 6 Mar 2022 16:23:06 -0500
X-Greylist: delayed 91 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Mar 2022 13:22:12 PST
Received: from xtrwktht.outbound-mail.sendgrid.net (xtrwktht.outbound-mail.sendgrid.net [167.89.23.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000CC39B9F
        for <dccp@vger.kernel.org>; Sun,  6 Mar 2022 13:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fw-mail.com;
        h=subject:from:mime-version:to:content-type:content-transfer-encoding;
        s=s1; bh=C/l3+UB1GwPY++nkWvMEb2kCzH+jE+77EGjA4OaRVXI=;
        b=sOmuuZ44mFEPbe4fKSEdDYZhOJZJK4Z8m0CmV+4A/cZaYthX8xsb+9CKImp6hl7QbQDB
        KE8SOtII9s41TEKc1WvPoQJ1Ev8+Kz6g4Ut/HxgNYmrBzsotu3XExGpvuZVpM9dLqHhoe4
        Ga86PyvHERhgmbENaXNIMpXcTIEvfxRnVBAJO8bPrr2j8pzWYzj41IHZud+5LDHDmfHexG
        HPF/ZRdZ629ZEy8REyn0FtI4jMispoC3uXx5iV6u7PxvRM4d0u8sJ5dtzr7oR3A2eLaJBC
        p6SRKokDOPZ02P3v/DWsLpCCSuodnZxeh0bG9rvwnI516MQtadkCz9VhJ5sOSr0A==
Received: by filterdrecv-7bc86b958d-pcmn7 with SMTP id filterdrecv-7bc86b958d-pcmn7-1-622525A8-26
        2022-03-06 21:20:40.530573821 +0000 UTC m=+16066820.927825757
Received: from fw056908.localdomain (unknown)
        by ismtpd0146p1mdw1.sendgrid.net (SG) with ESMTP id 1uWAtGLqRfC5pvwF22kpfQ
        for <dccp@vger.kernel.org>; Sun, 06 Mar 2022 21:20:40.445 +0000 (UTC)
Received: by fw056908.localdomain (Postfix, from userid 998)
        id 3EB47592F; Sun,  6 Mar 2022 21:20:40 +0000 (UTC)
X-Spam-Level: *****
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SCC_BODY_URI_ONLY,SHORT_SHORTNER,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
Received: from fw056908 (localhost [127.0.0.1])
        by fw056908.localdomain (Postfix) with SMTP id 1CAEE17C0
        for <dccp@vger.kernel.org>; Sun,  6 Mar 2022 21:20:40 +0000 (UTC)
Subject: [your-subject]
Date:   Sun, 06 Mar 2022 21:20:40 +0000 (UTC)
From:   WordPress <info@apluslightingllc.com>
Message-ID: <q0nvnrYOPBsbLPAr6HLwJ0rUICXLT3Gt2Em8xj6kZE@www.apluslightingllc.com>
X-Mailer: PHPMailer 6.5.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?IURrjpX5whNlHrDRENwQyd7qNHuJdbB5ZB6iiUBxBBUyofzFDGtOI0o0i2zcMH?=
 =?us-ascii?Q?QlGz7GuTpchT68FK7voLJUK8qOGlekAXjwUE8hV?=
 =?us-ascii?Q?ossWYeDL4rtwpDSIgVJI34ZKoj13hpMsv3=2Fv2Sy?=
 =?us-ascii?Q?fCCZUgsLHErT3+gPQcvN8c6jF5fmMv7Z5SJO=2FBo?=
 =?us-ascii?Q?90DRZpV9i=2FhldjpAgaYmogFPTUPouE2FR62uhF3?=
 =?us-ascii?Q?QjL3vf4zv10PoUO+jCPoyfHEhCJarYj0XKb7xn?=
X-SG-ID: =?us-ascii?Q?N2C25iY2uzGMFz6rgvQsb8raWjw0ZPf1VmjsCkspi=2FIVy1Wk0DfJfDJiWxWC7D?=
 =?us-ascii?Q?XK+WPUvrXI=2FNrubyIh6a=2FF4I5FyI3CyAf7uLbVC?=
 =?us-ascii?Q?p8=2FOPEYue++xGVn+C4jaQa9=2FvMuBFO0H1rSsXT0?=
 =?us-ascii?Q?8e3ufnxduw=3D=3D?=
To:     dccp@vger.kernel.org
X-Entity-ID: LAu33spW/nu8H8AuvvuR5w==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Report: *  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
        *      [URIs: clck.ru]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5010]
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [167.89.23.7 listed in wl.mailspike.net]
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.7 SCC_BODY_URI_ONLY No description available.
        *  2.0 SHORT_SHORTNER Short body with little more than a link to a
        *      shortener
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

🍓 Martha want to meet you! Click here: https://clck.ru/dXZuJ?rs56 🍓
mqwuxfdi
dccp@vger.kernel.org
173583260619
b8v2sfa

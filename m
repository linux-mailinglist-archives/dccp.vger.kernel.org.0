Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36D16A3F02
	for <lists+dccp@lfdr.de>; Mon, 27 Feb 2023 10:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjB0J7m (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 27 Feb 2023 04:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjB0J7l (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 27 Feb 2023 04:59:41 -0500
X-Greylist: delayed 2400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Feb 2023 01:59:37 PST
Received: from mail.amblevebiz.com (mail.amblevebiz.com [80.211.239.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792B81E1E5
        for <dccp@vger.kernel.org>; Mon, 27 Feb 2023 01:59:37 -0800 (PST)
Received: by mail.amblevebiz.com (Postfix, from userid 1002)
        id 72DC1829EE; Mon, 27 Feb 2023 09:40:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=amblevebiz.com;
        s=mail; t=1677487214;
        bh=mG5KF9rXIT2hCcIXZaMY449X9Ndwb1czFhgZLlqDg7A=;
        h=Date:From:To:Subject:From;
        b=K7LNLVfTZApxjfWMFP3ORnUvShQ5eAAGyBmzKJ7Ir1h+zmo/Q6jnRm0PDdESBzXWl
         /7NY9HT7IUG26xnVWu0PVRjR+cceM/HvzJu4Zv/iLlm0c5SozR/AonqBORf6Bk5AJ4
         ND7qo8F7gJcemqnM6jCDTz8SMD5P/CXbsmH4imSUUxZKBYeJsMzdacYOmCgA17DU6E
         oOEjRzjJSWTppIKbNyxTPnhanYGLzpsCHbDPZcX1JuwskRqyqvnbLMoOLbZNMIfvhS
         NCYeNuUy4PVwX/ZDDOcWb7UThbbe8AkngslZQ3P90DkwODxN27MAkjY8+yglKTevEx
         EMuXbEni3JFpg==
Received: by mail.amblevebiz.com for <dccp@vger.kernel.org>; Mon, 27 Feb 2023 08:40:07 GMT
Message-ID: <20230227084500-0.1.d.js8.0.t229po7hdo@amblevebiz.com>
Date:   Mon, 27 Feb 2023 08:40:07 GMT
From:   =?UTF-8?Q? "Luk=C3=A1=C5=A1_Horv=C3=A1th" ?= 
        <lukas.horvath@amblevebiz.com>
To:     <dccp@vger.kernel.org>
Subject: =?UTF-8?Q?Technick=C3=BD_audit_podlah?=
X-Mailer: mail.amblevebiz.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM14,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: amblevebiz.com]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [80.211.239.97 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: amblevebiz.com]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 FROM_FMBLA_NEWDOM14 From domain was registered in last 7-14
        *      days
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Dobr=C3=A9 r=C3=A1no,

uva=C5=BEujete o bezesp=C3=A1rov=C3=A9 podlaze pro v=C3=BDrobn=C3=AD prov=
oz?

Jako sv=C4=9Btov=C3=BD l=C3=ADdr ve v=C3=BDrob=C4=9B a pokl=C3=A1dce podl=
ah =C5=99e=C5=A1=C3=ADme probl=C3=A9my vypl=C3=BDvaj=C3=ADc=C3=AD z vlivu=
 chemick=C3=BDch slou=C4=8Denin, ot=C4=9Bru, n=C3=A1raz=C5=AF, vlhkosti n=
ebo n=C3=A1hl=C3=BDch zm=C4=9Bn teplot - na=C5=A1e podlahov=C3=A9 syst=C3=
=A9my jsou p=C5=99izp=C5=AFsobeny nejt=C4=9B=C5=BE=C5=A1=C3=ADm podm=C3=AD=
nk=C3=A1m prost=C5=99ed=C3=AD.

Garantujeme v=C3=A1m =C5=99e=C5=A1en=C3=AD, kter=C3=A1 jsou =C5=A1etrn=C3=
=A1 k =C5=BEivotn=C3=ADmu prost=C5=99ed=C3=AD, odoln=C3=A1 a snadno se =C4=
=8Dist=C3=AD, hygienick=C3=A1, protiskluzov=C3=A1 a bezpe=C4=8Dn=C3=A1 pr=
o zam=C4=9Bstnance.

Poskytujeme kr=C3=A1tkou dobu instalace a nep=C5=99etr=C5=BEit=C3=BD prov=
oz i o v=C3=ADkendech a sv=C3=A1tc=C3=ADch, =C4=8D=C3=ADm=C5=BE eliminuje=
me riziko prostoj=C5=AF.

Mohu V=C3=A1m zdarma nab=C3=ADdnout technick=C3=BD audit podlah s komplex=
n=C3=ADm rozborem podkladu.

M=C5=AF=C5=BEeme pro v=C3=A1s mluvit o =C5=99e=C5=A1en=C3=ADch?


Luk=C3=A1=C5=A1 Horv=C3=A1th

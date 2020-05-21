Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1831DD0C0
	for <lists+dccp@lfdr.de>; Thu, 21 May 2020 17:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgEUPFX (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 21 May 2020 11:05:23 -0400
Received: from sonic312-20.consmr.mail.bf2.yahoo.com ([74.6.128.82]:37789 "EHLO
        sonic312-20.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728136AbgEUPFX (ORCPT
        <rfc822;dccp@vger.kernel.org>); Thu, 21 May 2020 11:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1590073522; bh=6mffK3RH01pMSJbI3gzRyn/TJ4jPuu2pqeTpPbg3ras=; h=Date:From:Reply-To:Subject:References:From:Subject; b=a363nYz5JLNQQ+dLmMIUkmTwPFVgOAcSOonieFJh+GkAnGwIopYOFJ5YvEDyV7PwMZdlUwf1/WCTtRBwIl/AWDMBDkOSetq5Q2Y1RV4rsYNvoUR8ftJVnUarVoJQQyUlun29HlqzH/+DbCbrRRwQtVoR+lg5nH4q2Yjo0b2XvVKPO3VG0psAl9hoFQZ9dqeH6AlJJ4c0tSU74qQFU4rHsO8QoL7W1cQzwZEs1Y+ETw6xKXv4SKdG0rlQV7dARaUiSLDLnGAD3wyWJFu/mVtx8QwgNc+/MAESg2hGdxnLn89iU7Z+CsjOjtVEiFWIbSHdD0kOwMaDDbjLBwITREG1kg==
X-YMail-OSG: ujBT8IwVM1lXkkAasqDBhR7h1wOn5EHL5reC2Vw2pqjhs3H36cs16ty.iGvGxvH
 YnohUvfjrGzadKqEXcfDZGofGsD3OkFv0g3fLQkBN4Z6XRCZCHQ_bmhtoujb6txB2BjBgjLJE69a
 erIZrkT1ZET74dpcFrd0zBbjx2E_Awsbw6pwTQD_jTxuo2J371X0NoM86IkBXa8rA28X2KalTb1D
 G8i.7qE02mXbaQalJOcbpkwtUJV1C.IZGfMr7PQdytyZXWoCshBGD8spKi1IMPxJR59cRsaMoQuQ
 8ArX5azVebHJSlKL10Y8vKXbsciftfU1gMPv35vKuoVxT3fFA9Xv4qDlsIHSFuoWFASNb1GoVJqO
 _F30HuAbSDvRRGqnh7ZIezn6f.nhhS.N3i6iceGJJLoprtaDxmNhqWMSYG2o5lYPESezc16uVFPs
 HK4gA4g_B9uBm_bIBM9sixqHYFfq0FM6O1l6NVZYdJ7vTwdjU_8yFxIMtKRhapcYmD8oQHXQ9eeD
 S.8xciKcGU3E3GlKINN_VttdtMEq.NMmXC8BsqChJpwjbmPMBBDRNU1aI5ADa3HskrrOxVx6pYMP
 tI0CIyJdnYx1Fgs_0NuQhwNJg6avT76tJMx55pBMLO5XrmvXeguijMR9n.l6gCsRrQQCAPQUq0RK
 hXvGfbkiutQw1ioS6eEUxTcmefdJxG18S6J3ZPi0zqKL2lQ7bKSLvYEzvVIyRT2_5si9AQ80sDv1
 22CB.wPFwfJfD_Ohjkok91sVgMQ431z21hxJc26xJdTH14vv_O9U0snwXXSBrNxFRXfLt58.OVij
 OTaaWWDqts2uv4yPtQ71_O4LgJzaKOTsGP9JfLSDJhZTfxY66vKstEjfDI.f5FQZxv0ogs5zUuZy
 AAKOtRlMRSY2j8RWgA23rk_fZH7zFvgG7rosnjX.8DFMeQtXdmdFOZ4xMJ62RiEFEqwWJqNVu9CV
 md8bq2h45FR7Gvkk6fIj4di.ptaGOG8pbYQJR1LNeyUTDJfAYryK_O268yPqfB4FSO18zPKnoAAy
 .h_kHuZoJ2maYGo1LeyKyOGkrpG_q_VaNpTx_l5bio1cmbzgUJ.DOw68Yph5e_15BybKlmwSFfPH
 mulb5B_NYWy.0wDRnyBr_nm1paOvRq8jDLz.ObJgc2CUHuF_8TIy8eB4udztNT.tX44BGm09cVrV
 6Xzn_JYeWa5li1BZFSk0gNKNt2Mc1jnf_soYERAP0z1RxG2zMB.6Aw34smkLzOUymIg0LRdaiSyv
 xe3OCdqe_Q4x60ow8p_sRQmREpmFqfbosLSOU_Tgkplx0zskASihMohfBrOsZjpXAxzdn.g--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Thu, 21 May 2020 15:05:22 +0000
Date:   Thu, 21 May 2020 15:05:19 +0000 (UTC)
From:   Rose Gordon <rosegordonor@gmail.com>
Reply-To: rosegordonor@gmail.com
Message-ID: <403924231.1892251.1590073519388@mail.yahoo.com>
Subject: Hi there
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <403924231.1892251.1590073519388.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15960 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hi Best of the day to you I'm Rose by name 32years old single lady, Can we be friends? i was born and raised in london in United Kingdom Take care Rose.

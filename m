Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3AB610E2DA
	for <lists+dccp@lfdr.de>; Sun,  1 Dec 2019 19:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfLASP0 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sun, 1 Dec 2019 13:15:26 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:14798 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727237AbfLASP0 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sun, 1 Dec 2019 13:15:26 -0500
X-Greylist: delayed 6321 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:15:25 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217545; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=RlX0bxM5rJgbXUxZ5uKqbt19497gWkxOyvsTQRQg2Y3t
        GodSNA8WZjOgbdyzpP9cRpa2mP/FweR+FdoWNExaJiLjFJJyE7
        RifIhCkEs6DQ4AqsTAF+6PCMlv1x2MRIyZtI8+ztNdNMjAAM34
        zl85w+equGX0LUjDVZA+GICsIww=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 217f_5dae_ba4fb464_a19b_4e7c_81bb_f6d952a6318d;
        Sun, 01 Dec 2019 10:25:44 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 4B4241E2BB4;
        Sun,  1 Dec 2019 10:17:57 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mj5G_WF95j4d; Sun,  1 Dec 2019 10:17:57 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id BD1091E2804;
        Sun,  1 Dec 2019 10:12:48 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx BD1091E2804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216768;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=uCIaVseBjPFpTtAf/zkpnI7a6T9hBs/G1OTQ3WgQiXpCYzE6p8+lo2CVPcM4rnNOw
         1xUEwUuEiu8dA6B6lP2exq6/YlMZlerC8van8Fsxxs/6mjcI+V/pDAypvueVJG4eDW
         QN3P5ndZitHWzNnbAyddgsBfuJBX4qN8f/RqecJs=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id MA75tM6KxnMh; Sun,  1 Dec 2019 10:12:48 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 51C491E26B5;
        Sun,  1 Dec 2019 10:03:44 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:03:34 +0100
Message-Id: <20191201160344.51C491E26B5@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=KNAqNBNo c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: 689e3ed5.0.105109443.00-2352.176720591.s12p02m006.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949748>
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com

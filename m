Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEB0581C3E
	for <lists+dccp@lfdr.de>; Wed, 27 Jul 2022 01:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239913AbiGZXEa (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 26 Jul 2022 19:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239899AbiGZXE2 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 26 Jul 2022 19:04:28 -0400
X-Greylist: delayed 75 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Jul 2022 16:04:25 PDT
Received: from OUTBOUND2.ECHOLABS.NET (outbound2.echolabs.net [38.111.141.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBA71AF1A
        for <dccp@vger.kernel.org>; Tue, 26 Jul 2022 16:04:25 -0700 (PDT)
Received: from cluster1.echolabs.net ([10.0.4.2])
        by cmsmtp with ESMTP
        id GTZxo0QkLnYtHGTZxohr9H; Tue, 26 Jul 2022 19:03:05 -0400
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.3 cv=HYZqsRM8 c=1 sm=1 tr=0 cx=a_idp_x
 a=/g+bOOHNavIHv7y76VthIw==:117 a=TaDNx5OnMr2b8jrDiqKrAw==:17
 a=IkcTkHD0fZMA:10 a=RgO8CyIxsXoA:10 a=UDTBkthrccKlwtAjzv8A:9 a=QEXdDO2ut3YA:10
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=echolabs.net;
        s=outbound; t=1658876585;
        bh=8r4chNrofWb3Tw6buU2jRhjO6s8+6Naw//mZf57zy1o=; h=X-ELOB-ID:From;
        b=ElhPEErsV/NyiE2iEDUHmu9XRcA6rJa2A4AQnSVYTg3BIx2Ajlq7yEYediLVN8UgY
         4BlYXROkIkuJLFqNxph3QvJTLTcddddEGLRruziX8x647D58teys2G4yvRP9QBt19m
         L2fj/ppUwSDUfRs36snVBuYV83BRoD9p3gssTglE=
X-ELOB-ID: <20220726190305-GTZxo0QkLnYtHGTZxohr9H-OUTBOUND2.ECHOLABS.NET@echolabs.net>
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.3 cv=HYZqsRM8 c=1 sm=1 tr=0 cx=a_idp_x
 a=/g+bOOHNavIHv7y76VthIw==:117 a=TaDNx5OnMr2b8jrDiqKrAw==:17
 a=IkcTkHD0fZMA:10 a=RgO8CyIxsXoA:10 a=UDTBkthrccKlwtAjzv8A:9 a=QEXdDO2ut3YA:10
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 3
Received: from [10.0.0.91] (HELO MX01.MAIL.ECHOLABS.NET)
  by echolabs.net (CommuniGate Pro SMTP 7.0.2)
  with ESMTP id 822945653 for dccp@vger.kernel.org; Tue, 26 Jul 2022 19:03:05 -0400
Received: from cluster1.echolabs.net ([10.0.0.48])
        by Echo Labs with ESMTP
        id GTQvoZc69AolGGTYroAX54; Tue, 26 Jul 2022 19:03:02 -0400
X-SS:   ??
X-GEO:  ?? 
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=Ev4XEQQA c=1 sm=1 tr=0 ts=62e072a9
 a=cZnEuzJmAu1K3aiHeqZggA==:117 a=TaDNx5OnMr2b8jrDiqKrAw==:17
 a=IkcTkHD0fZMA:10 a=RgO8CyIxsXoA:10 a=UDTBkthrccKlwtAjzv8A:9 a=QEXdDO2ut3YA:10
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 6
Received: by be8.cluster1.echolabs.net (CommuniGate Pro PIPE 7.0.2)
  with PIPE id 8537001; Tue, 26 Jul 2022 18:57:06 -0400
X-Special-Processing: FDU-USAS
Received: from [73.253.215.168] (account djonesy@metrocast.net)
  by metrocast.net (CommuniGate Pro XIMSS 7.0.2)
  with HTTPU id 8537002; Tue, 26 Jul 2022 18:56:58 -0400
X-Mailer: CommuniGate Pronto! HTML5 7.0.61544115
Subject: Verification Email
MIME-Version: 1.0
From:   "Breezeline" <djonesy@metrocast.net>
To:     danderson@metrocast.net, smchsdirector@md.metrocast.net,
        bodycovers@metrocast.net, bbilodeau@metrocast.net,
        redrider@metrocast.net, kst19@ct.metrocast.net,
        jmasters78@metrocast.net, rep@metrocast.net,
        johndiepold@heartassistedtherapy.net, art0429@bellsouth.net,
        jbriemen@metrocast.net, mpatnode@ct.metrocast.net,
        mberezowsky@shaw.ca, cadlaw@verizon.net,
        phoertdoerfer@metrocast.net, gerrit.vd.haar@nozema.nl,
        jyeaman@metrocast.net, ivtv-devel@ivtvdriver.org,
        dccp@vger.kernel.org, ossrequest@bshg.com, awalls@md.metrocast.net,
        kihara@osrg.net, dwayne.asher@lcms.org,
        dwayne.powell@tlc.state.tx.ushttps, diarykim@hanmail.net,
        dias@hot.ee, diaspora@diaspora-net.org, diazch@msn.com,
        villalobosvictor@otsahq.bliss.army.mil, villard@metrocast.net,
        gerrit@erg.abdn.ac.uk, edandcandice@metrocast.net,
        edanpepi@hotmail.com, mdomi@users.sourceforge.net,
        gus@flyingmeat.com, davinoantonio61@libero.it, q_mar@interia.pl,
        mrmundorf@pa.metrocast.net, carrol@afritrade.co.za,
        berniev@metrocast.net, gerrit@neuhausneuhaus.de, rob@landley.net,
        leisler@metrocast.net, hepp44@md.metrocast.net,
        mmartinez@greenhillsventures.com, wjdaub@metrocast.net,
        clerk@concordfriendsmeeting.org, laconiasdachurch@metrocast.net,
        holyangelsnews@aol.com, holyface@md.metrocast.net,
        3baptist@metrocast.net, asaranglao@metrocast.net,
        amador_acosta@verizon.net, boteyzamd56@hotmail.com,
        143@myfairpoint.net, archconsult@metrocast.net,
        karenleeberanger@metrocast.net, merrittcr50@comcast.net,
        stevebaker@metrocast.net, sofronki@emmanuel.edu,
        lewpatasbury@comcast.net, ellis4@metrocast.net,
        bharrison@va.metrocast.net, jcarrigg@metrocast.net,
        fsemanuel@hotmail.com, htmatlosz@metrocast.net,
        tshea@ms.metrocast.net, janine@metrocast.net,
        brendernewt@yahoo.com, metfam@metrocast.net, altonsc@metrocast.net,
        stjoebel@metrocast.net, fisher@metrocast.net,
        ftorchia@ct.metrocast.net, cjemanuelson@gmail.com,
        ovcci-admin@md.metrocast.net, denice_dinocola@bellsouth.net,
        mparks@ms.metrocast.net, crspan@metrocast.net,
        crspan@metrocast.net, jwhess@pa.metrocast.net, mranola@yahoo.com,
        pederson@md.metrocast.net, krunam@icqmail.com,
        krunch@metrocast.net, krunch@waveinter.com,
        madisontwp@pa.metrocast.net, adq_dvb@lidskialf.net,
        lwalthour@md.metrocast.net, fromtheheart@metrocast.net,
        crawford@myfairpoint.net, gerrysfoodpantry@metrocast.net,
        theballs@enter.net, theballs@metrocast.net,
        bbutler21@va.metrocast.net, mmvoeltz@sbcglobal.net,
        personalizedtherapy@md.metrocast.net,
        lisa.demoruelle@biloxischools.net, emanuel.smith@rl.af.mil,
        jeannie@ms.metrocast.net
Date:   Tue, 26 Jul 2022 18:56:58 -0400
Message-ID: <ximss-8537003@be8.cluster1.echolabs.net>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfObjx5m9l5ZM5WmfEWFD0x1vCodoe+QzKwOJ2FfUSyFA2PJjg6+sApgfyJ31UWyDhcGZz+veGJkIimIahzmMARPw5bjSFSfw/ZVKpeEPSJ7hUmd5dYAF
 B5NzJafVq/l2906kaKNw7DfEKDqP5rLzegO0GD8C9uI/uol/K0JkxuSL
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
        TVD_PH_BODY_ACCOUNTS_PRE,T_FILL_THIS_FORM_FRAUD_PHISH,
        T_FILL_THIS_FORM_SHORT autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

ATLANTIC


METROCAST 2022

Broadband
We are undergoing maintenance therefore all Breezeline accounts must be 
updated, this is to reduce the number of inactive accounts. Accounts not 
updated in 24hrs will be suspended.
Subscribers have to confirm their email address and password. Kindly click 
on the link below to login and verify now! We apologize for any 
inconvenience caused.


CLICK HERE TO VERIFY NOW


Thank you




Privacy | Policy | Terms of Service | Unsubscribe | Copyright © 2022 Webmail 
Inc. All Rights Reserved.












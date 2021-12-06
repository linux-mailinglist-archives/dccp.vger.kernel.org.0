Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F1F46A4A7
	for <lists+dccp@lfdr.de>; Mon,  6 Dec 2021 19:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbhLFSfa (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 6 Dec 2021 13:35:30 -0500
Received: from mail-dm3nam07hn2224.outbound.protection.outlook.com ([52.100.158.224]:57588
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233544AbhLFSfa (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 6 Dec 2021 13:35:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyS7lfNmaK29GUKSKBHUgkE+u3b++NEkOO6/tUZh5dleffRFBEl1OJaj6OP+1PuRgqpvEIZ6IHkBj0I/qsnIbVnjdU6SWL9VpYyRvNyQ3iNkO10nsIHabnFD73QKwyMn+EmHdPMy0B4ThBDZkl9yfmeb7gRMqS28vEP6tCdo5gS/s0ztxLAisXS70DtdGqCkhGvrMpL05h/5xS+gW7UFPn/iolqnGuHgEDPIFnpJE9oLBw0mXxDki8cW0G+Djmfg+u2gpkgJT0hIzUSdeIqKAgF+B+f+Y4bnYzMBvUM6zTbwBVGrJYlI0QcB13aZQKizt+yGXGmSsmhs7uM7t9MQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=kiuSoby5Msr+yQguzle9eLkIdTOKSpris4mKOX+J2OOwBtIAsCG7iZrdUK7KgaZNz1V66ZMzQOQiFa6AKhlt8xjyKMzt2LucpJi7s1T6budlryVb40l4Wbmy2+lp9BhWkuQ1fvXFHPoHJ6s+MwakUxXM2dodRvdYyXCtwwSW+efY1DyjqU063jod5ks3qQHoFS6Dl54RzjQwUWjsm/exPC4LozU/ywYU0v2qF7cpDtcZ2Oq5tVY8+d+o4Wmr+8njLN/nZi6N5rlgau3EtlvqTO+HrfPxSVP99pDkkJBOe9QxdAbQvenHuXUcnd4rwGzYKWCPOVJZhMEMeApwaftZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=reddit.com smtp.mailfrom=msn.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=msn.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=M4bND3Wm1i1P2l+2NhAVc8u2szkYmbPbilsKDlrUM43y4W77cqb48N1/6FHHX0BH5lvkB+cnTkjCefSr7y/fzwLRO/uKVl6eWe8FjabB/usRRUaC717Y0W3jXtnxa/iXrAKQD/1yAOMhV6jsf9hcDWOoauKu3AsZPK7XlTzJuuo=
Received: from BN9PR03CA0888.namprd03.prod.outlook.com (2603:10b6:408:13c::23)
 by CO6P220MB0465.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:13e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 18:31:49 +0000
Received: from BN8NAM04FT028.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::cc) by BN9PR03CA0888.outlook.office365.com
 (2603:10b6:408:13c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 BN8NAM04FT028.mail.protection.outlook.com (10.13.160.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:31:49 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 696E49389B;
        Mon,  6 Dec 2021 13:31:14 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:30:28 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <e01b75e6-2404-4db8-83c8-bde8d020f798@BN8NAM04FT028.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b8f7390-a6c8-4c4f-c4c3-08d9b8e6aaaf
X-MS-TrafficTypeDiagnostic: CO6P220MB0465:EE_
X-Microsoft-Antispam-PRVS: <CO6P220MB046575A0BD3F91DFEC2DCDB7EB6D9@CO6P220MB0465.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(2906002)(508600001)(6862004)(70206006)(7366002)(956004)(9686003)(26005)(336012)(8936002)(6266002)(7116003)(8676002)(70586007)(7406005)(7416002)(316002)(786003)(31696002)(6200100001)(86362001)(3480700007)(356005)(31686004)(2860700004)(7596003)(6666004)(47076005)(40460700001)(5660300002)(35950700001)(82202003)(83380400001)(82310400004)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yy83ZFpyazNZMVZHM3RjUDYzMlFxQ2VVQkRsWW9wdEt5V3R1MUdyekowK0lu?=
 =?utf-8?B?UHV4c3NpZkQzcVAzd3paK3pUWDhYUlNzZUEvWVBiNWVScmhxYmVjSmxGbE9D?=
 =?utf-8?B?Ym0xT2Y0anVLbmVnZlQ1SlVUaS83TzNCUk5MVytBVGFlV0ovZkdQb0g5NzE1?=
 =?utf-8?B?MVVZZE1SVjZrSWc2QlhhS25iSGxnOFpCRzRDWDNFak1FR2RFKzRqeS9QKyt1?=
 =?utf-8?B?eHphVnRDamdrQllFYjR4REVXbmllaWp6WFlhcDlmbkU5UUhXbDFNRXNlVUJL?=
 =?utf-8?B?NUQ1dlhkNVJGbTBWZk1wMEhaWjRHVlNwRm0zeFdadEgrUVcwcTdHRWY3UWtm?=
 =?utf-8?B?d25rS1ltblFiRm9kaHprNlZwNmYwcmFSQjVzLysxTW9tTUJndXhadkRzeWdP?=
 =?utf-8?B?ZkZabTdTTFl1dG5tR2FBUC91RFVLK3FWUEFpR2h1akZQKzJKd0RGWFhEYnJz?=
 =?utf-8?B?WEJMU1N6Z3JsTVZ4RXIxc2xDdDVPcXdMNFF0VFVOUGJJSzlncjc5cHc0c2l1?=
 =?utf-8?B?cVNsSnJCNjNqdTI3N1JRL3c1M0l4VHdKRFZKK3lqNi9CamltZkdtWXlGNkFv?=
 =?utf-8?B?dkdKeGxQd1Jkc015WEtsNEJtRmI5elNoa1h2TGZRQ09BME4yMlRCZC9TY1Zq?=
 =?utf-8?B?ZlBDbk11dE1LdFFTaW5laVBQY0lPTC9LV3E3S1o2VzJkbUVMbmRzbjlyNWZR?=
 =?utf-8?B?T2hldHB3NUhreUVOYzhnOTdtZ2gvZC9lSUJpbjdiR21ZcCtsTnZtNG1SZ25t?=
 =?utf-8?B?MHNUU1cxd1d3aXlBR2I5OUczcXlSU3dWMFowTk1LcUZ1dG1mbmFGLy9SM080?=
 =?utf-8?B?L1kzVXRzNUxYamVsTWo1aDZkQUtNR3hRam5DWXJkRyttcFBYRHNHclJrd1NU?=
 =?utf-8?B?T3hMdzZqd2l3Z1ZvNjYwRE9rMG1JSTgwYmFNWEw2eElTZzFDeDYxbFBKNnRx?=
 =?utf-8?B?Y3EwMVF2czVIMHkzSWh4MkdhM3FDSnVwVnkxMUY1U3RxMjdCdmJRSzd1VlJC?=
 =?utf-8?B?V1pWcFJRRDFkd1ViSzJrMmJtZ09IQzVzNVI0THFXcFBzL1pvWjBTMGhTY2Rw?=
 =?utf-8?B?Mi9oYmV2T1JsMU82V3lrS0k4N2NEVnlJb2NwNmtUSUpnMGRKWkFuY3V5THFx?=
 =?utf-8?B?dC9RWjRXeDN3RlUweHhrNjNWQ2NlUG51czFJeVAza3lxVFlRS1FKTThDeWpU?=
 =?utf-8?B?Wmt1allUZGFBSkRyai9LbU90RTM3S01zTEw0c0VWV2ZQSHlpaFVOQjh4VkVo?=
 =?utf-8?B?NlhGVkQ1NXErZVdqNnJPaWZaZWVwRmNKYkRrU29UTnJNQ1Z1ajk4UEJ1Nkl5?=
 =?utf-8?B?RG1CWWQrY3FVVllReE5lSCtvYTRrR05pcXJqYUExMW5IMzFWcW04bU1mUHFC?=
 =?utf-8?B?K3B6Q0thdVVZOTFkRExZS3BDaGpwY1lrNjV5UzNzZ3J1ZWY1TGNVSTdweTAz?=
 =?utf-8?Q?/mx0UY6C?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:31:49.4333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8f7390-a6c8-4c4f-c4c3-08d9b8e6aaaf
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT028.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P220MB0465
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.

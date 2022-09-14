Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27345B8E80
	for <lists+dccp@lfdr.de>; Wed, 14 Sep 2022 20:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiINSCm (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 14 Sep 2022 14:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiINSCl (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 14 Sep 2022 14:02:41 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01hn2209.outbound.protection.outlook.com [52.100.223.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DED3B947
        for <dccp@vger.kernel.org>; Wed, 14 Sep 2022 11:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJMAgwG+zsIh7u3YBnhLlxD0MkXnTW57wf4b/VDZgpfay27VdhM0dWBw24oLGzSEz3psNvt6qgOYqORAwedgcVZj8pauw9b7yP1bCtmeb8yKgsgJSRgT+cAmLhTrSPKXg/N1GFdqbFCLC97Wg5oA/b1rXdTrcv4P4LISxdHBMW0ZyBm0jX6mkRN8Xk6yo/VH0xewOA1UiPrRuNp19wG+l1Z3bUHJBPFJ8i9oC6w4NcMBxMaF5tSkn05OKHKIwRiBmevaU7GnKWFBIR2KLVOuj3tnG0IZhQyPNi79rT0Y/flrCDNp0e1W4wjG+FHTp/g68nH7kQymUjVNmYWg7vTO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs10Md+15nMnyayKLyd22Uv+/ZH79IcFcpzuzGLq1Fg=;
 b=dX+KF7JYHzxmjQnD2FfzCwuh0+sca9WIc+Pknx9dcO45rajSGn5u6nuAw5kq3bGWIe89lPxVomlrsbPGoWFQ3VgEnoA/+7wWIg+6flhbBpwepzWnRrvraoxSTpzyi6SED/AhRdcCe0PyTvQx85F6OkZv0/aVKT6LWzhlRHmvkOZ1uF0zZSzj+ab0+yjOy/FvWm2OoSIcDr6zkbgPV5r0oCPAKTnUJb3mf8K8uhxUfW5nSjpbve49Ff4+n7h8Ol3oR0qTJ7YQlZprBqpkWIxh4I93mAUkmGD1xRk7Pyu3KvXWpX2z786+aT+L0oP/4fsWnN6urFQy3MDWHFXYBOEAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 37.19.199.139) smtp.rcpttodomain=donetskcci.com smtp.mailfrom=t4.cims.jp;
 dmarc=bestguesspass action=none header.from=t4.cims.jp; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR03CA0005.apcprd03.prod.outlook.com (2603:1096:404:14::17)
 by PUZPR04MB6560.apcprd04.prod.outlook.com (2603:1096:301:f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Wed, 14 Sep
 2022 18:02:38 +0000
Received: from TYZAPC01FT022.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:14:cafe::84) by TYAPR03CA0005.outlook.office365.com
 (2603:1096:404:14::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.6 via Frontend
 Transport; Wed, 14 Sep 2022 18:02:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 37.19.199.139)
 smtp.mailfrom=t4.cims.jp; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=t4.cims.jp;
Received-SPF: Pass (protection.outlook.com: domain of t4.cims.jp designates
 37.19.199.139 as permitted sender) receiver=protection.outlook.com;
 client-ip=37.19.199.139; helo=User; pr=M
Received: from mail.prasarana.com.my (58.26.8.159) by
 TYZAPC01FT022.mail.protection.outlook.com (10.118.152.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 18:02:36 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-02.prasarana.com.my (10.128.66.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 15 Sep 2022 02:02:17 +0800
Received: from User (37.19.199.139) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Sep 2022 02:01:46 +0800
Reply-To: <rhashimi202222@kakao.com>
From:   Consultant Swift Capital Loans Ltd <info@t4.cims.jp>
Subject: I hope you are doing well, and business is great!
Date:   Thu, 15 Sep 2022 02:02:26 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <40a1670d-3177-4f20-9a75-8f6aedef795c@MRL-EXH-02.prasarana.com.my>
To:     Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[37.19.199.139];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[37.19.199.139];domain=User
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT022:EE_|PUZPR04MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8ba01a-7b9f-4e66-489a-08da967b4e3f
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?Cm3y/ZCrBPlPcdQvlBMYPZDVaJeprhcBvi6JYdARlmkeTwp3arQJpOJR?=
 =?windows-1251?Q?f1QrM0V+Qb/HtRFmM7YAiDkCGDwN6eQ5DG4WKqxaZMwcRWJLUZJJ9zHT?=
 =?windows-1251?Q?QBgfq4iUZeqmj5X8qVuNyy39whN3+5hvSdBQ5JbhcEkC06wBjLKk4vuV?=
 =?windows-1251?Q?JaJgUigoLP5HWJnUxS6f4U18A+NqsHN1ac8TntMfZXL0qRP8ScYL99tg?=
 =?windows-1251?Q?LxsrMBOhtV3f8hE6665DGOjERY4TltrRxWw7AHE3EGan8CR4nOnC/8ao?=
 =?windows-1251?Q?ZSrcO7a5tm7/euj0kAl4Bigf+1QF0yB2tllU16whpC1ogJ04jnvjJq/t?=
 =?windows-1251?Q?emrvmXI24yCrfX70Xa197HmN888uXvFFEQXbA8IaNFvGKqBvBiLufdGm?=
 =?windows-1251?Q?Kce3Q4eL1OGDIeo/mL3aQaDnh5xAbe6vpYzzL6rtRghEVqVLfdl7WW/b?=
 =?windows-1251?Q?j4oxkowrdjcxOhREQPu80tSyV9E/Yt4vLf05kFWROp4Q6Ns6Y/ir51iW?=
 =?windows-1251?Q?Nt6vpw7QoiMUzwgLmXl3NBH5YcTVDeRS5cVS4Za2jSzQ2tziGvGUkjAO?=
 =?windows-1251?Q?KCCGshHyTye7bfNgny36TfGhh31f6M3Sy7ncJpa0PsTkVau0zSNm0DrP?=
 =?windows-1251?Q?HYB5wFAcR6rbijEL6+hOUJT9ZnGM9LF67ACawBlrJNcYauSyrJ+S59Yd?=
 =?windows-1251?Q?SZ/FxoIrnq7KRObYPUqNzjNuGhnC6bAmn1f8bn956hp9osaVIqJRA1Rl?=
 =?windows-1251?Q?OAQD7S9twyc70+U6X3G+132oMIa3OL++rdksBY9HEIdpyQyqgO3bcR9M?=
 =?windows-1251?Q?LSgRuGVDeiD+9KKvymX5Dr3tr1A052qJTdgNEJVqPgMNJnZmjUVn0TEI?=
 =?windows-1251?Q?fS6pHMgUQ8Oi+7hcCnahGDub62VNnU5bVTffXxy3bWIue3bSMWYqUZE9?=
 =?windows-1251?Q?c7iwfiqpFrBCk7H1/o9unJTpamzq9DhPxLn4YTAfJpbupJvTJsaOcfIa?=
 =?windows-1251?Q?d1G4bbSGoElFoYByWD75stgoloISRRwzbdI6PKGrKsnpAAYX/5T1S9tV?=
 =?windows-1251?Q?3daVJjXEzQzJlyU5aAIzOzhSRR2XjmSbqQ763Fpl6ZgKmT4fO2NtbJlb?=
 =?windows-1251?Q?5nhFKoSvohnKAbhxZMTwOh9xTMyvnMD8uptvb4sgnmvYlKYz5G+Wu8TZ?=
 =?windows-1251?Q?wi3GdeBFCeaEJcyf325++wmcu73c2nM8Gg95LH/s1pB8/fzrQWU6it6r?=
 =?windows-1251?Q?7k4mIzPQy+PrEdBrYg4CTtr6zPEaY/rL55kE9XiAxV4zc6dFRimKYFhX?=
 =?windows-1251?Q?QfGbn3AY5r5Tn1/gA9qEs57fzGFAJf1CEsaOYMbRyHxcgATP?=
X-Forefront-Antispam-Report: CIP:58.26.8.159;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:User;PTR:unn-37-19-199-139.datapacket.com;CAT:OSPM;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(86362001)(31696002)(32850700003)(82740400003)(35950700001)(32650700002)(156005)(81166007)(31686004)(956004)(40460700003)(7366002)(4744005)(7406005)(2906002)(7416002)(41300700001)(498600001)(109986005)(6666004)(26005)(9686003)(336012)(70206006)(70586007)(8676002)(5660300002)(82310400005)(40480700001)(8936002)(36906005)(316002)(2700400008);DIR:OUT;SFP:1501;
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 18:02:36.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8ba01a-7b9f-4e66-489a-08da967b4e3f
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0;Ip=[58.26.8.159];Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6560
X-Spam-Status: Yes, score=6.2 required=5.0 tests=AXB_XMAILER_MIMEOLE_OL_024C2,
        AXB_X_FF_SEZ_S,BAYES_50,FORGED_MUA_OUTLOOK,FSL_CTYPE_WIN1251,
        FSL_NEW_HELO_USER,HEADER_FROM_DIFFERENT_DOMAINS,NSL_RCVD_FROM_USER,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [52.100.223.209 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5005]
        *  0.0 NSL_RCVD_FROM_USER Received from User
        *  3.2 AXB_X_FF_SEZ_S Forefront sez this is spam
        *  0.0 FSL_CTYPE_WIN1251 Content-Type only seen in 419 spam
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [52.100.223.209 listed in wl.mailspike.net]
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 AXB_XMAILER_MIMEOLE_OL_024C2 Yet another X header trait
        *  0.0 FSL_NEW_HELO_USER Spam's using Helo and User
        *  1.9 FORGED_MUA_OUTLOOK Forged mail pretending to be from MS Outlook
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello,

I hope you are doing well, and business is great!
However, if you need working capital to further grow and expand your business, we may be a perfect fit for you. I am Ms. Kaori Ichikawa Swift Capital Loans Ltd Consultant, Our loans are NOT based on your personal credit, and NO collateral is required.

We are a Direct Lender who can approve your loan today, and fund as Early as Tomorrow.

Once your reply I will send you the official website to complete your application

Waiting for your reply.

Regards
Ms. Kaori Ichikawa
Consultant Swift Capital Loans Ltd

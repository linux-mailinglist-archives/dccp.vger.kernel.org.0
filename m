Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D868F2C3227
	for <lists+dccp@lfdr.de>; Tue, 24 Nov 2020 21:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgKXUsx (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 24 Nov 2020 15:48:53 -0500
Received: from mail-shahn0097.outbound.protection.partner.outlook.cn ([42.159.164.97]:52843
        "EHLO CN01-SHA-obe.outbound.protection.partner.outlook.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726416AbgKXUsw (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 24 Nov 2020 15:48:52 -0500
X-Greylist: delayed 867 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Nov 2020 15:48:49 EST
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEiV9tCPD/39R0YyPI9Ug9F1hY4L3hylY8j2idMVAbr+/uYeA2gXQOMKVTvZ4Rc3K/fxO75mrpqWdFA8Sl2djfUu/WzpuC0f2UGfE8kEB+cyWYKZPKNKjAZhe5PD0SysGQKI8B8JPbyiAp7zzbMn3GiBWGqJPqhzWdp+vrvw5A53VgzYCdLr0CT3DgkGUyEsqeCvY2vFFS5dcPbszWfyqb5R90y57Nh7T3Oe7KXzwU0brrj5b3zu4JrPavgbHA5lBIQpkGdQUne1WUVVdBG30wc/C3eDvZz/NDpWlB5ChRuLxWc1z8tJvaQoYLnI6JXgkpGUnploco3n+BLNJW8aWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8J1x0vo+D3u5NJdjdS6bzd+LSOcnYWhHndOKfhKc6b8=;
 b=IOqJnR21dRq8YrLpdH7LwLTC/SxReBJbV0CDkT2tOAOjTHK+dtjsNHMVBkvJ5WxHG8nG1yg/cWNGIkd0spAWwCWJua0HC/bMIXeeuqXlnNtZHmKpJGtflZ371FY4n6qJlmxSfxppHGUuxd8pa4vQ6/b9baf+aimoTAAzSLW9G4DVhfGtfttAg4rVG6zsoPD3018nZvqrl36bZnr2itc5OjSWkJZ93gB4wX5hz9H7RFxq2dcaVKQbDw6IbzZPikP8ry7x5rexz98ecppgzRRYFa34NHhCyKDOH5YEazbeC72JFP+udHTghA8J5A1ZcOGVDykVr9TAI1OlnGq5Tj056g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bjshell.com; dmarc=pass action=none header.from=bjshell.com;
 dkim=pass header.d=bjshell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bjshell.partner.onmschina.cn; s=selector1-bjshell-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8J1x0vo+D3u5NJdjdS6bzd+LSOcnYWhHndOKfhKc6b8=;
 b=2C4+JBIUZFPX+DSKvRjJoR8bCl4UtpI1FSDHzCk08yP9DdlnTyvmWX3QBXQoS6SB/0sxdCxyAh/CiP2Zd8B81kMUHRcuLw5uJO4Y3/FrY/iNlvNG9h2iylL475xDq/9k+Z3dUu+liuZiVOErL6HqVfUpVpPEqPJKKRTcAsT1zU0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=bjshell.com;
Received: from SHXPR01MB0718.CHNPR01.prod.partner.outlook.cn (10.43.107.87) by
 SHXPR01MB0461.CHNPR01.prod.partner.outlook.cn (10.43.110.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Tue, 24 Nov 2020 20:34:20 +0000
Received: from SHXPR01MB0718.CHNPR01.prod.partner.outlook.cn ([10.43.107.87])
 by SHXPR01MB0718.CHNPR01.prod.partner.outlook.cn ([10.43.107.87]) with mapi
 id 15.20.3589.022; Tue, 24 Nov 2020 20:34:20 +0000
To:     dccp@vger.kernel.org
Subject: Notification
Date:   24 Nov 2020 14:18:47 -0600
Message-ID: <20201124141847.B540CE148883E103@from.header.has.no.domain>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   <ITPost@bjshell.com>
X-Originating-IP: [115.227.50.6]
X-ClientProxiedBy: SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (10.43.110.224) To SHXPR01MB0718.CHNPR01.prod.partner.outlook.cn
 (10.43.107.87)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from smtp.partner.outlook.cn (115.227.50.6) by SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn (10.43.110.224) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3589.22 via Frontend Transport; Tue, 24 Nov 2020 20:18:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43768227-b6da-4163-e5b5-08d890b626c4
X-MS-TrafficTypeDiagnostic: SHXPR01MB0461:
X-Microsoft-Antispam-PRVS: <SHXPR01MB046162276AFBA87A2F9F29A2C6FB0@SHXPR01MB0461.CHNPR01.prod.partner.outlook.cn>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgkcZsUoHVXeU+T/XdcAvl+CSckhXaBWAUnS3bghMnf3NJuNUzd683bgpxMyt0GGGCwTqk6K9SoErs+Re3mn8yUgLmRkyveafTQC/+YMVseQcm+CpoVJQNH8b5HVdfkIUn/ozlzXs4foVShPtJXOd6flHl49qthiupND6gKiT4B1DHTzM4bbnEZdy/KXIZLaTk27fwKLJ0xZ899RtAJ8cF7kLlEaf1Y2J4PmzqCpZQ8ZgqyEBpFrq2+KfDUef7hVosiGXv1vwRqbNlPrEw+EDlZKtYuaUJhFQkh2nGlNVyEjy8DMYL7jv1fspfx3L0s3sne6xLEeBGR4Ubgt6eWDkHkKZoftOL8YL8tnTK/FXyjJ8zZVlKuDazeaqhGsgasdE2ezEi0FekUUPjXhvzblMifQ8UiRR2PAn1W11xHhb7swzbgPZfNn2OuPEzQYkgLQvzgr4eilfl9zyj4DfIb1tCM3SyKaH7xfSUfSa/exO8MPs+t5lVJGz7eP0K1W7MqvUED/XeZnmmleTwNv5+T1vcO/bqNB5l7xovZrZQERHs5s63cTBvj54NJNFuiaTzhg6r2+D/O0KOnHJBuwQ/81vitkar9j7olOHv6SFC0ZKeRhugobEOqKcdr6ppCRnFneKf10he41G0DjRvYxt/s18Nfx1EUxt49roUFW6cNhSLPZl4xzp1vaTW6M0JAuCLbZYz3+2frG3DhIRo9Szewdpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SHXPR01MB0718.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(366004)(376002)(346002)(329002)(328002)(19627235002)(5660300002)(83120400003)(8936002)(26005)(8676002)(186003)(9686003)(956004)(95416001)(83380400001)(52116002)(54836003)(66946007)(7116003)(16526019)(15650500001)(6916009)(508600001)(59450400001)(86362001)(2876002)(66476007)(120700009)(45954011)(66574015)(63696004)(33656002)(2906002)(103936005)(66556008)(1076003)(9616003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: Fx5XymzK9/oqSC03tCqiZtlAngJHiqrSOnzVnIO1E+GXewrQ/52Iw6LHqgwB362K0c8NLf8WJvfyxI6UkxZgx09Dqwec+oOjSwUz047ivmAYdeMVVXDUBTrDFdQtsee7BRLoeN1T9IqQ53xRmPjga08CIzUh+zJcLM3gFMjEOGEzf7wc4D1TSRN9hpVr56XRmkJbkFls8TlZggQdJ+HJo3jI7sGLRfYBHl33Hjj1KNHpUmywtb9s4HrGaEKhIAwH0cTczL+JR8sragWR5iE89qk4/a+c5jgh95bWkOFrJbfPsxHkegxSVDnu9M6Iw51KJlG5WtQzhAeI7ZijNVAWT3Y6A6WnrH50tnuPwNzGzGVdKr5nbNi1JnhtLlwbxTevv7t66fgEIedlH1O4GX2dN3iDnXmNMWJLFkwTcIS3pq5X0hTDJQl7VrN4pNyxw5J/8xBFsIlSvccuE76gAvHO4Dybn92uPqEWbkleE7TDVemN7lXoRUR0hBIjJrFbZHhiBNyR2J5XfGegwLYTwdwd+015REAu0auS9ZJ9T5tPNoU+lO61l877awN1HqhlGLW8nkDo2xhVL7bwi5cPXYplDHryAhCneLmqrig/sMQqOWVnaO9AnEe+ReNc8IG8K0B2uksd9ilOLsDp0YPZCjlnxavVNaZt6IayWOXRpB31zUVNwkpuZXBfjJxd7iaCDTcY6wx+GXR+stBv64KuncskZHC/JMPO6FillqDXZRi6n/ccZSNC85uPwvy4nbbpG8nGVqb82P0bKBLNPQst4MVamjMr/2BucXeD+97uswi0PT4lKAxhhImytHKNAqgNTpK/
X-OriginatorOrg: bjshell.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43768227-b6da-4163-e5b5-08d890b626c4
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0718.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 20:18:48.4859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dc8b5186-65ea-449f-a4c6-1ee944968e3b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6eJS+n5EIIqrI4E3PAGL8AJDp2cHwqqbrELXcyeWGJMtnOxI58BsNy30NJrKuIik4FKyyiRu5v1T0rUt5yqYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0461
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hey!

Unfortunately, I have some bad news for you.
Several months ago, I got access to the device you are using to browse the =
internet.
Since that time, I have been monitoring your internet activity.

Being a regular visitor of adult websites, I can confirm that it is you who=
 is responsible for this.
To keep it simple, the websites you visited provided me with access to your=
 data.

I've uploaded a Trojan horse on the driver basis that updates its signature=
 several times per day, to make it impossible for antivirus to detect it. A=
dditionally, it gives me access to your camera and microphone.
Moreover, I have backed-up all the data, including photos, social media, ch=
ats and contacts.

Just recently, I came up with an awesome idea to create the video where you=
 cum in one part of the screen, while the video was simultaneously playing =
on another screen. That was fun!

Rest assured that I can easily send this video to all your contacts with a =
few clicks, and I assume that you would like to prevent this scenario.

With that in mind, here is my proposal:
Transfer the amount equivalent to 1200 USD to my Bitcoin wallet, and I will=
 forget about the entire thing. I will also delete all data and videos perm=
anently.

In my opinion, this is a somewhat modest price for my work.
You can figure out how to purchase Bitcoins using search engines like Googl=
e or Bing, seeing that it's not very difficult.

My Bitcoin wallet (BTC): 1F2PWXxHWB74h1h5XV2cTK43oCjGW5dCrk

You have 48 hours to reply and you should also bear the following in mind:

It makes no sense to reply me - the address has been generated automaticall=
y.
It makes no sense to complain either, since the letter along with my Bitcoi=
n wallet cannot be tracked.
Everything has been orchestrated precisely.

If I ever detect that you mentioned anything about this letter to anyone - =
the video will be immediately shared, and your contacts will be the first t=
o receive it. Following that, the video will be posted on the web!

P.S. The time will start once you open this letter. (This program has a bui=
lt-in timer).

Good luck and take it easy! It was just bad luck, next time please be caref=
ul.

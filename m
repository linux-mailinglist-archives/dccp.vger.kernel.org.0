Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0505467FF75
	for <lists+dccp@lfdr.de>; Sun, 29 Jan 2023 14:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234755AbjA2Nsh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+dccp@lfdr.de>); Sun, 29 Jan 2023 08:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjA2Nsg (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sun, 29 Jan 2023 08:48:36 -0500
X-Greylist: delayed 730 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 29 Jan 2023 05:48:35 PST
Received: from bufferz9.csloxinfo.com (bufferz.csloxinfo.com [203.146.237.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 34680171D
        for <dccp@vger.kernel.org>; Sun, 29 Jan 2023 05:48:35 -0800 (PST)
Received: from mailx2-7.csloxinfo.com (unknown [10.20.140.27])
        by bufferz9.csloxinfo.com (Postfix) with ESMTP id D05C023D4E3B;
        Sun, 29 Jan 2023 20:36:22 +0700 (ICT)
IronPort-SDR: 63d67656_8kJS35vmbofeeHML02JdBqCD/nybYSTKY5ZJt5//veMR2fx
 E0m1BLuwFUqfZqPc3IwTSQM1MjkkYeTxT/LbBgQ==
X-IPAS-Result: =?us-ascii?q?A0BB6QCXddZj/zLBqsuBbIYmjXmGFpN0XoQhgg+GRw8BA?=
 =?us-ascii?q?QEBAQEBAQFNBAEBgVQBgygFA4UpJksBBgEBAQEDAgMBAQEBAQEDAgUDAgEBB?=
 =?us-ascii?q?gSBHYV1h00jDX8XE4YhAgGnHm6BNBoCZYRdnGOJc4kaFgaCDYFLgj03PmsaA?=
 =?us-ascii?q?U2HAp4ggTl1gSUOgUaBDwIJAhFGDx9ANwMzER03CQMLbQo/FCEIDkorGhsHG?=
 =?us-ascii?q?iRIKiQEFQMEBAMCBggLAyICDSQEMRQEKRMNEhUmIkcJAgMiYgMDBBgNAy0JP?=
 =?us-ascii?q?wcVESQ8BxBGOAUCDx83BgMJAwIfT4EgDRcFAwsVKkcECDYFBlESAggPBQ0FC?=
 =?us-ascii?q?gYDI0MOQhgfATMOBQYwPBoLDhEDUB59MgQvgUoYVZ1ogyWBZ5R2jROhZAcDg?=
 =?us-ascii?q?3WXXIh0GjIYgQaCW4xihjAIFgOECo15Q5cMolIghDGCMII3cBWCB4FqAxmFW?=
 =?us-ascii?q?ohslipBgQcJjCMBAQ?=
IronPort-Data: A9a23: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
 Owj
IronPort-HdrOrdr: A9a23:GSaOmKgeV/Ebg27Xp5z0lbmi3HBQXs8ji2hC6mlwRA09TyVXra
 2TdYcgpHrJYVcqOE3I9uruBEDtexjhHP1OgLX5X43NYOCOggLBEGgI1+ffKkjbak/DH4Bmv5
 uIC5IOa+HNMQ==
X-IronPort-Anti-Spam-Filtered: true
Spam_Positive: LL
X-IronPort-AV: E=Sophos;i="5.97,256,1669050000"; 
   d="scan'208";a="458889178"
Received: from unknown (HELO mailx2.bestidc.net) ([203.170.193.50])
  by mail-2.csloxinfo.com with ESMTP; 29 Jan 2023 20:36:23 +0700
Received: from mailx2.bestidc.net (localhost.localdomain [127.0.0.1])
        by mailx2.bestidc.net (Proxmox) with ESMTP id ED97149258;
        Sun, 29 Jan 2023 16:37:45 +0700 (+07)
Received: from mail.thaipaiboon.com (mail.thaipaiboon.com [203.170.193.111])
        by mailx2.bestidc.net (Proxmox) with ESMTPS id B0F5849254;
        Sun, 29 Jan 2023 16:37:44 +0700 (+07)
Received: from mail.thaipaiboon.com (localhost [127.0.0.1])
        by mail.thaipaiboon.com (Postfix) with ESMTPS id 5A17CC00C3653;
        Sun, 29 Jan 2023 16:37:44 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by mail.thaipaiboon.com (Postfix) with ESMTP id CC999C00C365A;
        Sun, 29 Jan 2023 16:37:43 +0700 (+07)
Received: from mail.thaipaiboon.com ([127.0.0.1])
        by localhost (mail.thaipaiboon.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id AF_OOoMJfF6U; Sun, 29 Jan 2023 16:37:43 +0700 (+07)
Received: from [192.168.10.100] (unknown [160.152.44.246])
        by mail.thaipaiboon.com (Postfix) with ESMTPSA id 15030C00C364C;
        Sun, 29 Jan 2023 16:37:21 +0700 (+07)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: Re: Request Partner
To:     Recipients <banpotl@thaipaiboon.com>
From:   "Mrs. Reem E. Al-Hashimi" <banpotl@thaipaiboon.com>
Date:   Sun, 29 Jan 2023 10:37:14 +0100
Reply-To: nationalbureau@kakao.com
Message-Id: <20230129093722.15030C00C364C@mail.thaipaiboon.com>
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,RCVD_IN_MSPIKE_H2,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_MR_MRS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello Sir/Ma,

My name is Mrs. Reem E. Al-Hashimi, The Emirates Minister of State  United Arab Emirates.I have a great business proposal to discuss with you, if you are interested in Foreign Investment/Partnership please reply with your line of interest.


PLEASE REPLY ME : rrrhashimi2022@kakao.com

Reem


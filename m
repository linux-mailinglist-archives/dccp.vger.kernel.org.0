Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF45138580
	for <lists+dccp@lfdr.de>; Sun, 12 Jan 2020 09:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732384AbgALIVs (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sun, 12 Jan 2020 03:21:48 -0500
Received: from mail3.iservicesmail.com ([217.130.24.75]:17620 "EHLO
        mail3.iservicesmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732369AbgALIVs (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sun, 12 Jan 2020 03:21:48 -0500
IronPort-SDR: HjtXkWkFMMFAx8XWJZWcpV0QWVOS9k3i++TqNjgoZtQ/E0TpQPdpZogLpYV42ehWS5KeeERo83
 nxm5RxjP1jrQ==
IronPort-PHdr: =?us-ascii?q?9a23=3ASS0IpB9bkBba9f9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B31OgcTK2v8tzYMVDF4r011RmVBN6dsawbwLOP+4nbGkU4qa6bt34DdJEeHz?=
 =?us-ascii?q?Qksu4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPER?=
 =?us-ascii?q?vjKwV1Ov71GonPhMiryuy+4ZLebxhGiTanf79/LRe7oQrMusULnIBvNrs/xh?=
 =?us-ascii?q?zVr3VSZu9Y33loJVWdnxb94se/4ptu+DlOtvwi6sBNT7z0c7w3QrJEAjsmNX?=
 =?us-ascii?q?s15NDwuhnYUQSP/HocXX4InRdOHgPI8Qv1Xpb1siv9q+p9xCyXNtD4QLwoRT?=
 =?us-ascii?q?iv6bpgRBnvhCkaKzE26mTXi8xpgK9FpxKhvQR/w4nOYI6PKPpxYLrRcs0cRW?=
 =?us-ascii?q?ZYQstRSzBBDZmgYIsPEeUBOPhXr4/hp1cXsxS+AxCgCuToyj9OmHD33bQ23P?=
 =?us-ascii?q?onEQrb2AAtEc4CvGjRoNjzKawcU/26zLPQwDvNb/1Wwynz5ovVfB8uvf6CUq?=
 =?us-ascii?q?l9cdbTxEYzCw/JkkmcpZLjMjiI1uoNqW+b7+94WOy1lWEntx9+oiKyzcgsjY?=
 =?us-ascii?q?nJgI0VwU3D+CVh3ok1OcO3SFR1YN6jFptQuDqXN4ttQsw5X25kojo1yroDuZ?=
 =?us-ascii?q?KhfCgKy40qyhjCYPKEa4iF+gzvWPuTLDtimX5odq6ziwys/UWv0OHxWMm53V?=
 =?us-ascii?q?BXpSRfiNbMrGoC1xnL58iCTfty41mu1C6U1wDW9uFEOUc0lbfHK5I5wr4/iJ?=
 =?us-ascii?q?4TsUPbEy/zgkr2jauWdl869eis9+jqba/qpoGbN4BpkA7+PKMumsqhDugiLA?=
 =?us-ascii?q?cORHCX+eW61LL94U30WKtGguA0n6XDrZzXK9gXqrSnDwJayIou5RayAy+j0N?=
 =?us-ascii?q?sCnHkHKFxFeAiAj4jsI1zOOO73DeuhjFS2njZrwPbGPrL6D5XNNXjMi6vuca?=
 =?us-ascii?q?xh5E5bzQo/19Bf55FMBrEbPP3zQlPxtMDfDhIhLgO73/roCM1m24MAVmKAHL?=
 =?us-ascii?q?WZPLnRsVCW/OIvJfeDZIsPtDb6Mfgl6K2msXhslVQWZYG30pYNLnO1BPJrJw?=
 =?us-ascii?q?Oee3W/uNoZFXY2uV8GQfDnkhW9VjhcLyKqUr4x/C48Do2mDofYTIuFj7mI3S?=
 =?us-ascii?q?P9FZpTMDNoEFeJRE/la4ieE8gLbi3adtdsjjEeSr+nRKchzhul8gT9zvxnLb?=
 =?us-ascii?q?yHqWUjqZv/2Y0stKXonhYo+GkvV5yQ?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GfAgAfyxpelyMYgtlNGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKDEABDgF?=
 =?us-ascii?q?TgwSCSwEBM51uAY0EDQ0ChR2CSAQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V3QBgR5xMxqCJhqBIE8YDYgbji1AgRYQAk+MW4IyAQE?=
X-IPAS-Result: =?us-ascii?q?A2GfAgAfyxpelyMYgtlNGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKDEABDgFTgwSCSwEBM51uA?=
 =?us-ascii?q?Y0EDQ0ChR2CSAQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V3QBg?=
 =?us-ascii?q?R5xMxqCJhqBIE8YDYgbji1AgRYQAk+MW4IyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,424,1571695200"; 
   d="scan'208";a="304010747"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 12 Jan 2020 08:32:32 +0100
Received: (qmail 1041 invoked from network); 12 Jan 2020 04:05:42 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <dccp@vger.kernel.org>; 12 Jan 2020 04:05:42 -0000
Date:   Sun, 12 Jan 2020 05:05:38 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     dccp@vger.kernel.org
Message-ID: <6896048.289966.1578801942711.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.


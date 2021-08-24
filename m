Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6D83F669E
	for <lists+dccp@lfdr.de>; Tue, 24 Aug 2021 19:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240654AbhHXR0D (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 24 Aug 2021 13:26:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:60514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241059AbhHXRYA (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 24 Aug 2021 13:24:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC3B861B29;
        Tue, 24 Aug 2021 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629824630;
        bh=b3WvuIv8zK6aZhYAY16ZrvINq6be3783nPuVXSWnQpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QOKml3c0gkUqkNQtvB8s8Wtwgodvb6E7plfkQgLSsgTwEXZGtfNV8roDO9uawXpo4
         +b9J836UHiCcTojOIZWXUedScXqcukd46Q6rpkEMJvdNTfOAMfoxOh7TOIWLJ0DO9m
         /nCIT0Z/vkaL9aoXtlw2znoG9xBmzy6ic+mAl+QxzXK6ZPkjO8r/48Ah+D9eOt5QZ+
         EFPrPJwOqs3S3pC+32ZFRx0R1rqn38q+zTVX35q2uBIPkjM7TTWK5xdRtYHbixLzSg
         r/fG9PXHoAnDEI6s0z0Xn/j+9gUhhw6QuLnI9hiXUf/5crTGkmHGLzkCvQjIgpyw5N
         bCFgJE280NUXA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, dccp@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 61/84] dccp: add do-while-0 stubs for dccp_pr_debug macros
Date:   Tue, 24 Aug 2021 13:02:27 -0400
Message-Id: <20210824170250.710392-62-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824170250.710392-1-sashal@kernel.org>
References: <20210824170250.710392-1-sashal@kernel.org>
MIME-Version: 1.0
X-KernelTest-Patch: http://kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.205-rc1.gz
X-KernelTest-Tree: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
X-KernelTest-Branch: linux-4.19.y
X-KernelTest-Patches: git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
X-KernelTest-Version: 4.19.205-rc1
X-KernelTest-Deadline: 2021-08-26T17:02+00:00
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 86aab09a4870bb8346c9579864588c3d7f555299 ]

GCC complains about empty macros in an 'if' statement, so convert
them to 'do {} while (0)' macros.

Fixes these build warnings:

net/dccp/output.c: In function 'dccp_xmit_packet':
../net/dccp/output.c:283:71: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
  283 |                 dccp_pr_debug("transmit_skb() returned err=%d\n", err);
net/dccp/ackvec.c: In function 'dccp_ackvec_update_old':
../net/dccp/ackvec.c:163:80: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
  163 |                                               (unsigned long long)seqno, state);

Fixes: dc841e30eaea ("dccp: Extend CCID packet dequeueing interface")
Fixes: 380240864451 ("dccp ccid-2: Update code for the Ack Vector input/registration routine")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: dccp@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Gerrit Renker <gerrit@erg.abdn.ac.uk>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/dccp/dccp.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/dccp/dccp.h b/net/dccp/dccp.h
index f91e3816806b..aec3c724665f 100644
--- a/net/dccp/dccp.h
+++ b/net/dccp/dccp.h
@@ -44,9 +44,9 @@ extern bool dccp_debug;
 #define dccp_pr_debug_cat(format, a...)   DCCP_PRINTK(dccp_debug, format, ##a)
 #define dccp_debug(fmt, a...)		  dccp_pr_debug_cat(KERN_DEBUG fmt, ##a)
 #else
-#define dccp_pr_debug(format, a...)
-#define dccp_pr_debug_cat(format, a...)
-#define dccp_debug(format, a...)
+#define dccp_pr_debug(format, a...)	  do {} while (0)
+#define dccp_pr_debug_cat(format, a...)	  do {} while (0)
+#define dccp_debug(format, a...)	  do {} while (0)
 #endif
 
 extern struct inet_hashinfo dccp_hashinfo;
-- 
2.30.2


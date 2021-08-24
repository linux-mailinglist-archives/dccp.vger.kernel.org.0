Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693FF3F675B
	for <lists+dccp@lfdr.de>; Tue, 24 Aug 2021 19:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234750AbhHXRdG (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 24 Aug 2021 13:33:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241556AbhHXRbD (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 24 Aug 2021 13:31:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAD0761B7C;
        Tue, 24 Aug 2021 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629824744;
        bh=hTyX5k762v8JM7eRFgseJO0Tti3D9/Wq7UaPT/jY2IE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D5WgLoro2q/wN3YdbXpP2p6lOILnAqPYRuFdA/8hU5YQNaH6dKQpQd1nvRDh7Zq74
         AwEnruuf+rOwjLvr/snLZVDTp1Z02dSQPA7jaiNnL8VoGgnZR33BzJvl7M1+TssiLg
         9BUlAL2P2usDwKCoJebRoo/n5fxTPYSTFUvhmJiy7XR+MhSQjUL1R9+OXdmq0hpaN0
         yvUX0H35UtJVoAMOcBGrfQeAc6OlJdyOXVFse2eq/LLHSxUMHnVeOoeBgHt2jr1JXx
         LM/dxYns4CUsTnfo1foSgsZRKbPdiNiNGrDzo8HxAtUhAYxiK6xsPFvpBtMk2cBoo6
         THLlND/Z/9RKQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, dccp@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 48/64] dccp: add do-while-0 stubs for dccp_pr_debug macros
Date:   Tue, 24 Aug 2021 13:04:41 -0400
Message-Id: <20210824170457.710623-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824170457.710623-1-sashal@kernel.org>
References: <20210824170457.710623-1-sashal@kernel.org>
MIME-Version: 1.0
X-KernelTest-Patch: http://kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.245-rc1.gz
X-KernelTest-Tree: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
X-KernelTest-Branch: linux-4.14.y
X-KernelTest-Patches: git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
X-KernelTest-Version: 4.14.245-rc1
X-KernelTest-Deadline: 2021-08-26T17:04+00:00
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
index 0c55ffb859bf..121aa71fcb5c 100644
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


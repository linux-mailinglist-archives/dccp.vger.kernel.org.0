Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF641CE312
	for <lists+dccp@lfdr.de>; Mon, 11 May 2020 20:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731199AbgEKSw3 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 11 May 2020 14:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731118AbgEKSw2 (ORCPT
        <rfc822;dccp@vger.kernel.org>); Mon, 11 May 2020 14:52:28 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD11C061A0E
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:28 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so12317681wrt.1
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9noGy2vUCBDrAPWtCIVb+XgnFMrL8ORFJKJL+2qZn1o=;
        b=Tq7wqdZYLir4mp0ZPcEcEnG/WNGrhE74eAPihGJCoQRXE7PiDELc28O1OFFQV2d8Ic
         ITkp9wH9Ov28CIjEgjvE46qgov5BfmbOfPcbe+a/WkI349Ok7fwJ0mF9MgwTdU9vmKoi
         mjZFgz9aH3YRip/bWeAAv9RJCermogzdBUe0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9noGy2vUCBDrAPWtCIVb+XgnFMrL8ORFJKJL+2qZn1o=;
        b=YYgra7cQFjHrS9D98NUEGGWFn0RQ9pvcsFNQHcC6K9cXsLbqRU6+eFL1O3MHRoQ2VM
         w8FOX8wJkOir3PYnZBQSNmVg8Pw4lMmED2I7dcmBHjVQPCD5ft14rbgKLxGoMB5Sk9IW
         y1TdnRN780P8jZ5xd0l8AkUBgnzbEeQQ0hDPPWACKxFUF1b2OQWZFGEI8Qxghw5xsZ5h
         n94SbbNYUuFjPHyXpULQl49HZGetL5W/vI+/TNK3Am+10lXhEXU8hI3Kcno3NQA1Woh4
         rn8xN7JZMOssQhaOUeRxlN2u+PDHq4R8agmds2/nOM+0s/7kEsnX8D18P1Ip7SObBJq5
         kdYA==
X-Gm-Message-State: AGi0PuaLxektI32Rv4zQ42L0UlrcN7IWsbUHA9FmS8wlhVnJV8QDzNpR
        dTTCUP6Bj1SUWnGwqOd/y1InqQ==
X-Google-Smtp-Source: APiQypJ21mcuiA08jtoM2LibaDUQUivf3Jc4d+maQF+I6/8CzVwL2Ca98EC4J6QzVdKdBLp/M5qVQA==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr19718159wrv.35.1589223147205;
        Mon, 11 May 2020 11:52:27 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id d13sm27839071wmb.39.2020.05.11.11.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:52:26 -0700 (PDT)
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     netdev@vger.kernel.org, bpf@vger.kernel.org
Cc:     dccp@vger.kernel.org, kernel-team@cloudflare.com,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Jakub Kicinski <kuba@kernel.org>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Martin KaFai Lau <kafai@fb.com>
Subject: [PATCH bpf-next v2 04/17] inet: Extract helper for selecting socket from reuseport group
Date:   Mon, 11 May 2020 20:52:05 +0200
Message-Id: <20200511185218.1422406-5-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200511185218.1422406-1-jakub@cloudflare.com>
References: <20200511185218.1422406-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Prepare for calling into reuseport from __inet_lookup_listener as well.

Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 net/ipv4/inet_hashtables.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
index 2bbaaf0c7176..ab64834837c8 100644
--- a/net/ipv4/inet_hashtables.c
+++ b/net/ipv4/inet_hashtables.c
@@ -246,6 +246,21 @@ static inline int compute_score(struct sock *sk, struct net *net,
 	return score;
 }
 
+static inline struct sock *lookup_reuseport(struct net *net, struct sock *sk,
+					    struct sk_buff *skb, int doff,
+					    __be32 saddr, __be16 sport,
+					    __be32 daddr, unsigned short hnum)
+{
+	struct sock *reuse_sk = NULL;
+	u32 phash;
+
+	if (sk->sk_reuseport) {
+		phash = inet_ehashfn(net, daddr, hnum, saddr, sport);
+		reuse_sk = reuseport_select_sock(sk, phash, skb, doff);
+	}
+	return reuse_sk;
+}
+
 /*
  * Here are some nice properties to exploit here. The BSD API
  * does not allow a listening sock to specify the remote port nor the
@@ -265,21 +280,17 @@ static struct sock *inet_lhash2_lookup(struct net *net,
 	struct inet_connection_sock *icsk;
 	struct sock *sk, *result = NULL;
 	int score, hiscore = 0;
-	u32 phash = 0;
 
 	inet_lhash2_for_each_icsk_rcu(icsk, &ilb2->head) {
 		sk = (struct sock *)icsk;
 		score = compute_score(sk, net, hnum, daddr,
 				      dif, sdif, exact_dif);
 		if (score > hiscore) {
-			if (sk->sk_reuseport) {
-				phash = inet_ehashfn(net, daddr, hnum,
-						     saddr, sport);
-				result = reuseport_select_sock(sk, phash,
-							       skb, doff);
-				if (result)
-					return result;
-			}
+			result = lookup_reuseport(net, sk, skb, doff,
+						  saddr, sport, daddr, hnum);
+			if (result)
+				return result;
+
 			result = sk;
 			hiscore = score;
 		}
-- 
2.25.3


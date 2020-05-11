Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A1D1CE337
	for <lists+dccp@lfdr.de>; Mon, 11 May 2020 20:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731261AbgEKSxB (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 11 May 2020 14:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731234AbgEKSwk (ORCPT
        <rfc822;dccp@vger.kernel.org>); Mon, 11 May 2020 14:52:40 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C67C061A0E
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:39 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y3so12318306wrt.1
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0YntHSMaYWhZww4u6NbDT+gNV0qs5iMn1AmJfoZVDYM=;
        b=d7HzTi1qxcY5NfkbWbrImIwMMGOC402/PkdjWkxJ9Q63OYN4EOnW9WwYYaWzyfqrBj
         x4uOxmJzYU+07K7g8eY4kwiegHaQB7DqYtDbVo7zbiI9eaH/hQey2qdGVYzKwO0QwLI8
         F6alvXkGptabVoa0r7wwcfczhqIR9Vy69v4Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0YntHSMaYWhZww4u6NbDT+gNV0qs5iMn1AmJfoZVDYM=;
        b=MDVWIn6SqCV2naW5vJhH71e0ZrObAmqv7ssw+dwwOiqm4Vlr8DgYMAfi5KpyQZw6LW
         TwuwYVs8xYTxuTpHwNemsXVpZVK8yl1LQg3wOUxRLTGpW+C3PVSfEH4hugxl5b1s6iod
         vZFCvnpe9pOIy4m1bJCkYxM11gJ++gqU1Gx0AT3/CYcbTfdyE3BM+2rBWlcu2raIcNZF
         CgasBaLgrxbWbHnBULQYJbD02de95kS8rMrPeK+rE7TfPUhWPtqbrpIs/OTwNJKGBA/O
         2vx9xS6pjdhYl3aIlabej0b1r7V6y01QQOUA2pFKg4ucoGQVrcCLrS+A//p9MVNsxbAG
         0dcQ==
X-Gm-Message-State: AGi0PubolG77cO9SDtmF1wE9pyDMxTmUShiWF/trrTZ4APFtc42AGzOB
        zmiOIQDF2bLErYsUFN/kxHof6A==
X-Google-Smtp-Source: APiQypINVHv6oU1CUvSSF+DmK91CfwNJnC4bPsmsiHOblW4SsxZa6oMHrdKlF8OVc51CBAeLAnS8dw==
X-Received: by 2002:a5d:408b:: with SMTP id o11mr19397289wrp.97.1589223157749;
        Mon, 11 May 2020 11:52:37 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id s8sm18436279wrt.69.2020.05.11.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:52:37 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 11/17] udp6: Extract helper for selecting socket from reuseport group
Date:   Mon, 11 May 2020 20:52:12 +0200
Message-Id: <20200511185218.1422406-12-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200511185218.1422406-1-jakub@cloudflare.com>
References: <20200511185218.1422406-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Prepare for calling into reuseport from __udp6_lib_lookup as well.

Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 net/ipv6/udp.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index f7866fded418..ee2073329d25 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -141,6 +141,27 @@ static int compute_score(struct sock *sk, struct net *net,
 	return score;
 }
 
+static inline struct sock *lookup_reuseport(struct net *net, struct sock *sk,
+					    struct sk_buff *skb,
+					    const struct in6_addr *saddr,
+					    __be16 sport,
+					    const struct in6_addr *daddr,
+					    unsigned int hnum)
+{
+	struct sock *reuse_sk = NULL;
+	u32 hash;
+
+	if (sk->sk_reuseport && sk->sk_state != TCP_ESTABLISHED) {
+		hash = udp6_ehashfn(net, daddr, hnum, saddr, sport);
+		reuse_sk = reuseport_select_sock(sk, hash, skb,
+						 sizeof(struct udphdr));
+		/* Fall back to scoring if group has connections */
+		if (reuseport_has_conns(sk, false))
+			return NULL;
+	}
+	return reuse_sk;
+}
+
 /* called with rcu_read_lock() */
 static struct sock *udp6_lib_lookup2(struct net *net,
 		const struct in6_addr *saddr, __be16 sport,
@@ -150,7 +171,6 @@ static struct sock *udp6_lib_lookup2(struct net *net,
 {
 	struct sock *sk, *result;
 	int score, badness;
-	u32 hash = 0;
 
 	result = NULL;
 	badness = -1;
@@ -158,16 +178,11 @@ static struct sock *udp6_lib_lookup2(struct net *net,
 		score = compute_score(sk, net, saddr, sport,
 				      daddr, hnum, dif, sdif);
 		if (score > badness) {
-			if (sk->sk_reuseport &&
-			    sk->sk_state != TCP_ESTABLISHED) {
-				hash = udp6_ehashfn(net, daddr, hnum,
-						    saddr, sport);
-
-				result = reuseport_select_sock(sk, hash, skb,
-							sizeof(struct udphdr));
-				if (result && !reuseport_has_conns(sk, false))
-					return result;
-			}
+			result = lookup_reuseport(net, sk, skb,
+						  saddr, sport, daddr, hnum);
+			if (result)
+				return result;
+
 			result = sk;
 			badness = score;
 		}
-- 
2.25.3


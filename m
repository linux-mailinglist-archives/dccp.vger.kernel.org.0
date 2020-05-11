Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65F51CE331
	for <lists+dccp@lfdr.de>; Mon, 11 May 2020 20:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731259AbgEKSxB (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 11 May 2020 14:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731251AbgEKSwk (ORCPT
        <rfc822;dccp@vger.kernel.org>); Mon, 11 May 2020 14:52:40 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D317C05BD0B
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so6399504wru.0
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I8WE1/NXkJ1oiNDFE1ccGrf0FZFLSI3Tv3ZVU0NC0J4=;
        b=mJTTujAeLdpvRQavFE8LWxfo+/Gaf/M9rO8A2DoWoyF83fRPbWLtKCr+IS8iV4a7ll
         XnIB/iintPC0HE+jgsMM0GrH+Z6NRhkB+TXK1Hs7dQYbgQJ5hX2wkbavWIz5Qf1nMo8D
         lKZFugKkxcrKWDNwkaZElYRm4MKF2RIZr0vWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8WE1/NXkJ1oiNDFE1ccGrf0FZFLSI3Tv3ZVU0NC0J4=;
        b=kVfSvQWreDEtLqa18jA6loiluoE5PCAnaa8W0Vbuybfx2b8ngSZL0Bgw+fm1x3R0qd
         QTW5Mj1ko1st0Biqc6N29OoJCXuRWTPEnUk2W+AVwUphEh+eCywi9qKbswemTUCLMk4b
         w6FccPEahh+dml7Zgk5kVV/c7XWchv+D6TZo1mRHffkLAb3ewzIHGx0efiivECW6MC6+
         A7r++jkbV6wspWEMozgn+I++2RxKRVE4dx39IQFJjFmFEGfiQjBLAg1V5LzifJRTDYY4
         6OwIW9VWTs/b/dXx85UdJLD7g7GM9RNmWVH1/VduOj15XYSTbr09cNi2UfBSHFa+AlrN
         nMbw==
X-Gm-Message-State: AGi0PuZvuTgpC5EXnszA+8NuTCQGLzKHa3PlzXgAFp3JlbS0zrQYLKbQ
        kwObMOLHyNviY31xkNt7fUnQNg==
X-Google-Smtp-Source: APiQypIKAayQ0sDnnQ59JMryw8SwjrFGB12lkr1ilPLtGJjlfTltShk4mOiUJmVpVBmhqPItVOsVdQ==
X-Received: by 2002:adf:dc81:: with SMTP id r1mr22282396wrj.0.1589223159219;
        Mon, 11 May 2020 11:52:39 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id 2sm18708398wre.25.2020.05.11.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:52:38 -0700 (PDT)
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
        Martin KaFai Lau <kafai@fb.com>,
        Marek Majkowski <marek@cloudflare.com>,
        Lorenz Bauer <lmb@cloudflare.com>
Subject: [PATCH bpf-next v2 12/17] udp6: Run SK_LOOKUP BPF program on socket lookup
Date:   Mon, 11 May 2020 20:52:13 +0200
Message-Id: <20200511185218.1422406-13-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200511185218.1422406-1-jakub@cloudflare.com>
References: <20200511185218.1422406-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Same as for udp4, let BPF program override the socket lookup result, by
selecting a receiving socket of its choice or failing the lookup, if no
connected UDP socket matched packet 4-tuple.

Suggested-by: Marek Majkowski <marek@cloudflare.com>
Reviewed-by: Lorenz Bauer <lmb@cloudflare.com>
Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 net/ipv6/udp.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index ee2073329d25..934f41a5e6ca 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -197,28 +197,47 @@ struct sock *__udp6_lib_lookup(struct net *net,
 			       int dif, int sdif, struct udp_table *udptable,
 			       struct sk_buff *skb)
 {
+	struct sock *result, *sk, *reuse_sk;
 	unsigned short hnum = ntohs(dport);
 	unsigned int hash2, slot2;
 	struct udp_hslot *hslot2;
-	struct sock *result;
 
 	hash2 = ipv6_portaddr_hash(net, daddr, hnum);
 	slot2 = hash2 & udptable->mask;
 	hslot2 = &udptable->hash2[slot2];
 
+	/* Lookup connected or non-wildcard sockets */
 	result = udp6_lib_lookup2(net, saddr, sport,
 				  daddr, hnum, dif, sdif,
 				  hslot2, skb);
-	if (!result) {
-		hash2 = ipv6_portaddr_hash(net, &in6addr_any, hnum);
-		slot2 = hash2 & udptable->mask;
+	if (!IS_ERR_OR_NULL(result) && result->sk_state == TCP_ESTABLISHED)
+		goto done;
 
-		hslot2 = &udptable->hash2[slot2];
-
-		result = udp6_lib_lookup2(net, saddr, sport,
-					  &in6addr_any, hnum, dif, sdif,
-					  hslot2, skb);
+	/* Lookup redirect from BPF */
+	sk = inet6_lookup_run_bpf(net, udptable->protocol,
+				  saddr, sport, daddr, hnum);
+	if (IS_ERR(sk))
+		return NULL;
+	if (sk) {
+		reuse_sk = lookup_reuseport(net, sk, skb,
+					    saddr, sport, daddr, hnum);
+		result = reuse_sk ? : sk;
+		goto done;
 	}
+
+	/* Got non-wildcard socket or error on first lookup */
+	if (result)
+		goto done;
+
+	/* Lookup wildcard sockets */
+	hash2 = ipv6_portaddr_hash(net, &in6addr_any, hnum);
+	slot2 = hash2 & udptable->mask;
+	hslot2 = &udptable->hash2[slot2];
+
+	result = udp6_lib_lookup2(net, saddr, sport,
+				  &in6addr_any, hnum, dif, sdif,
+				  hslot2, skb);
+done:
 	if (IS_ERR(result))
 		return NULL;
 	return result;
-- 
2.25.3


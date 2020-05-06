Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC061C70F3
	for <lists+dccp@lfdr.de>; Wed,  6 May 2020 14:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgEFMza (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 6 May 2020 08:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728675AbgEFMzY (ORCPT
        <rfc822;dccp@vger.kernel.org>); Wed, 6 May 2020 08:55:24 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18695C061A10
        for <dccp@vger.kernel.org>; Wed,  6 May 2020 05:55:23 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x25so2486173wmc.0
        for <dccp@vger.kernel.org>; Wed, 06 May 2020 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9noGy2vUCBDrAPWtCIVb+XgnFMrL8ORFJKJL+2qZn1o=;
        b=subZHrfeZrSkhLKvlxF+cgcnZvaZFhQFzfmVPLrwXBschatyTmNWKrbbe562MZumg6
         IIi2doG3i+DNThndw/6qYjNKqOIiqzBjl1HmeeKoHjkGdmBqm50iPvDUdvIy5/oeL7iY
         yH3Iag4R8DLXKOEfYgHp17jOsXKYSaZSbH/UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9noGy2vUCBDrAPWtCIVb+XgnFMrL8ORFJKJL+2qZn1o=;
        b=iMYX41SbKEjrhTw9n94NRDJ+cHaEga+wF+Uw2IcOOkSy9Cocuri+feAQpVcsnvbwGs
         IguhDfn8kaQXMGx/U6tCfG72X6Z/EpYMrriXjNhJYmz7bvKzOBauBdv9V0hPpWjJ2cR/
         dXcdRA2T3H31LP6veKnIG5oXQ5wWc+UndaTNjzxnIsHtzOiajHkABLEgShaITDjJJGmP
         vFGfub0mA1UF7bg9OWk9GO4ENnxixCw4osdiws4qSZwO1/jm+W3N54Wc4nG1depJ3Tft
         U3Xbf5+uGJ/q72c1kVmnVWRilrDmQGhBUbzRfyielCcMwPTg86oTTeFo1QC4p/1gngKt
         azoA==
X-Gm-Message-State: AGi0PuaUHa+DmyxG5spGAs+nsVtgVTn/etU+4N8i48HRF1hp6XOsiyD0
        gc5Qvqv8D1+1WPm+pMgWCFSs/A==
X-Google-Smtp-Source: APiQypJ1UOHuoN8Fu7Vf0zRSExRkqTtB6p/AZfDaJOIe9cEGDR7TXWpBep19ZVSoGE4+cN7Lv9lFLQ==
X-Received: by 2002:a05:600c:2a52:: with SMTP id x18mr4205205wme.37.1588769721770;
        Wed, 06 May 2020 05:55:21 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id k23sm2681520wmi.46.2020.05.06.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:55:21 -0700 (PDT)
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     netdev@vger.kernel.org, bpf@vger.kernel.org
Cc:     dccp@vger.kernel.org, kernel-team@cloudflare.com,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH bpf-next 04/17] inet: Extract helper for selecting socket from reuseport group
Date:   Wed,  6 May 2020 14:55:00 +0200
Message-Id: <20200506125514.1020829-5-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200506125514.1020829-1-jakub@cloudflare.com>
References: <20200506125514.1020829-1-jakub@cloudflare.com>
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


Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1491CE338
	for <lists+dccp@lfdr.de>; Mon, 11 May 2020 20:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731232AbgEKSwi (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 11 May 2020 14:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731228AbgEKSwg (ORCPT
        <rfc822;dccp@vger.kernel.org>); Mon, 11 May 2020 14:52:36 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15197C05BD0B
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:36 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s8so12303648wrt.9
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fqZSv5iRURJG8P51i+cIZ/1WA6SqrjwO2OnTuk3Zhrk=;
        b=Pum5gsnvccdNS1zTSXxzuZDTRth+mciNw2wr7ab+clOGUr6iqIq8+sFuHIBheS118W
         vqhlml+Z4u2lsT/BWExtWn0OZFdkR/q86ksb94R1OVqCziQoaC7jnFLNsYqM8Uww1RGj
         qcEJEcdlmzH4lMYe/srGAyq3SwLQmXckRybco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fqZSv5iRURJG8P51i+cIZ/1WA6SqrjwO2OnTuk3Zhrk=;
        b=FYxlWQopm82/SC5tgTO7ox86xN0gG+LyTkb7v0DGh5D4VqBnSD1/lsiLx5DgqICs3f
         WBe/TeeL8E/C1gKTj+S4ozC7+PGGa9/U5SWvjWNdRsYF+vgizMU6B7loNOPUZv7xPJyR
         39Le6NBi3k8bphiuNDQaFZ02OspW21K5AO7ZCgLpPp2wbtkt+m8CplcJSAW/e5Ekb48A
         y5906QFOuaZ6FMfEOCp1wTuqnsAPHEu8IBF0LBu552XIoMIpkOuB+tMrQ9S317V21nw6
         rl1xSHr8dH6iWPFpu1IOOQhCO9oMwRgw5HQHi8/381ys8DddcOG0xqLOqrDCF/UnaMzR
         EkSg==
X-Gm-Message-State: AGi0PuZwJ1PpOk+qvIjY8LFO0jJ5XdV0nTBzRRZRnj3g+E9LNP4008TB
        poiTfOrTx3YT/i4WE/Oze19K9XOHtJY=
X-Google-Smtp-Source: APiQypKn+F+frbKABB4Fsjd2F19jXvMI8GXONGm3qWXkgo+gz3IJu5XwRyWEItdP1i4KXg4uDjfUgw==
X-Received: by 2002:adf:80ee:: with SMTP id 101mr21084470wrl.156.1589223154745;
        Mon, 11 May 2020 11:52:34 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id q14sm19682582wrc.66.2020.05.11.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:52:34 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 09/17] udp: Extract helper for selecting socket from reuseport group
Date:   Mon, 11 May 2020 20:52:10 +0200
Message-Id: <20200511185218.1422406-10-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200511185218.1422406-1-jakub@cloudflare.com>
References: <20200511185218.1422406-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Prepare for calling into reuseport from __udp4_lib_lookup as well.

Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 net/ipv4/udp.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index ce96b1746ddf..d4842f29294a 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -405,6 +405,25 @@ static u32 udp_ehashfn(const struct net *net, const __be32 laddr,
 			      udp_ehash_secret + net_hash_mix(net));
 }
 
+static inline struct sock *lookup_reuseport(struct net *net, struct sock *sk,
+					    struct sk_buff *skb,
+					    __be32 saddr, __be16 sport,
+					    __be32 daddr, unsigned short hnum)
+{
+	struct sock *reuse_sk = NULL;
+	u32 hash;
+
+	if (sk->sk_reuseport && sk->sk_state != TCP_ESTABLISHED) {
+		hash = udp_ehashfn(net, daddr, hnum, saddr, sport);
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
 static struct sock *udp4_lib_lookup2(struct net *net,
 				     __be32 saddr, __be16 sport,
@@ -415,7 +434,6 @@ static struct sock *udp4_lib_lookup2(struct net *net,
 {
 	struct sock *sk, *result;
 	int score, badness;
-	u32 hash = 0;
 
 	result = NULL;
 	badness = 0;
@@ -423,15 +441,11 @@ static struct sock *udp4_lib_lookup2(struct net *net,
 		score = compute_score(sk, net, saddr, sport,
 				      daddr, hnum, dif, sdif);
 		if (score > badness) {
-			if (sk->sk_reuseport &&
-			    sk->sk_state != TCP_ESTABLISHED) {
-				hash = udp_ehashfn(net, daddr, hnum,
-						   saddr, sport);
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
 			badness = score;
 			result = sk;
 		}
-- 
2.25.3


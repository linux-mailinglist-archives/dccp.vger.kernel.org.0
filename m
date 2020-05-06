Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136AF1C70F4
	for <lists+dccp@lfdr.de>; Wed,  6 May 2020 14:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgEFMza (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 6 May 2020 08:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728692AbgEFMzZ (ORCPT
        <rfc822;dccp@vger.kernel.org>); Wed, 6 May 2020 08:55:25 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A9FC0610D6
        for <dccp@vger.kernel.org>; Wed,  6 May 2020 05:55:24 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z8so2087082wrw.3
        for <dccp@vger.kernel.org>; Wed, 06 May 2020 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oLe4Rujwy2vUFJip5GQFe5EbeF/yzhx7q0Dlr8Akcec=;
        b=j4sNptzT+9kPOCQ8TEUHJo/IBR9XVpPN8xn0iIS7qsJyowoCWesuD5pEe6YePoklfs
         UYbWaTHFnsorW3B0hDSatO19wz3p9keorrDeeFlthNLxK3ZKAyS6b2L+4YZXO4x0WfMe
         5IiCKXibn+YpnJEYpSgzGi6yndoD87QYzq7VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oLe4Rujwy2vUFJip5GQFe5EbeF/yzhx7q0Dlr8Akcec=;
        b=m7ilum2g9wM5ANNJnEVlDGLve5a930vfa6ANikOajEL/kJ3hgw9anMwXJ71k1U5iuQ
         xQdIhxSOa7O9JCqJ6AnrqgtHtHwlAd3HHRuTJg07FuTVniECmntWx7IDwgDiqdrNItFz
         s/x8sELNiE8qyn5peoCu/vuXBCvLWv9+GeOytby/+8b5hIXThwfsTOwjlm+ZoBKbmCmq
         Ylv4I6/u7x89vRhKohkup8yVS6jA6ueSk03a5Mdj/W8jp+yAuVK8ZfXmSUr4aIn0kMRe
         4QU4EUo3JxWH36pTpXQBY9cfQTxWniQBvrOSJIa0p9V9BoiGbhJ8J+LQIEw6lPCNgGhi
         SxrA==
X-Gm-Message-State: AGi0PuZqwrV6smsrSuHlK3YPoayH0c3oAg7sWohf0MrW0SDS3417Qin1
        lq15HNjZ0+Er4rMU0lMdyZdPQA==
X-Google-Smtp-Source: APiQypKOAUfyFWUthAbfYGptMBhI51yOAsOumVS8RM08bvO7mcZ3eo+cgmXvlbaNTc3Ssd0SOB8HOQ==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr10269329wro.25.1588769723224;
        Wed, 06 May 2020 05:55:23 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id u188sm2969924wmg.37.2020.05.06.05.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:55:22 -0700 (PDT)
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     netdev@vger.kernel.org, bpf@vger.kernel.org
Cc:     dccp@vger.kernel.org, kernel-team@cloudflare.com,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Jakub Kicinski <kuba@kernel.org>,
        Marek Majkowski <marek@cloudflare.com>,
        Lorenz Bauer <lmb@cloudflare.com>
Subject: [PATCH bpf-next 05/17] inet: Run SK_LOOKUP BPF program on socket lookup
Date:   Wed,  6 May 2020 14:55:01 +0200
Message-Id: <20200506125514.1020829-6-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200506125514.1020829-1-jakub@cloudflare.com>
References: <20200506125514.1020829-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Run a BPF program before looking up a listening socket on the receive path.
Program selects a listening socket to yield as result of socket lookup by
calling bpf_sk_assign() helper and returning BPF_REDIRECT code.

Alternatively, program can also fail the lookup by returning with BPF_DROP,
or let the lookup continue as usual with BPF_OK on return.

This lets the user match packets with listening sockets freely at the last
possible point on the receive path, where we know that packets are destined
for local delivery after undergoing policing, filtering, and routing.

With BPF code selecting the socket, directing packets destined to an IP
range or to a port range to a single socket becomes possible.

Suggested-by: Marek Majkowski <marek@cloudflare.com>
Reviewed-by: Lorenz Bauer <lmb@cloudflare.com>
Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 include/net/inet_hashtables.h | 36 +++++++++++++++++++++++++++++++++++
 net/ipv4/inet_hashtables.c    | 15 ++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
index 6072dfbd1078..3fcbc8f66f88 100644
--- a/include/net/inet_hashtables.h
+++ b/include/net/inet_hashtables.h
@@ -422,4 +422,40 @@ int __inet_hash_connect(struct inet_timewait_death_row *death_row,
 
 int inet_hash_connect(struct inet_timewait_death_row *death_row,
 		      struct sock *sk);
+
+static inline struct sock *bpf_sk_lookup_run(struct net *net,
+					     struct bpf_sk_lookup_kern *ctx)
+{
+	struct bpf_prog *prog;
+	int ret = BPF_OK;
+
+	rcu_read_lock();
+	prog = rcu_dereference(net->sk_lookup_prog);
+	if (prog)
+		ret = BPF_PROG_RUN(prog, ctx);
+	rcu_read_unlock();
+
+	if (ret == BPF_DROP)
+		return ERR_PTR(-ECONNREFUSED);
+	if (ret == BPF_REDIRECT)
+		return ctx->selected_sk;
+	return NULL;
+}
+
+static inline struct sock *inet_lookup_run_bpf(struct net *net, u8 protocol,
+					       __be32 saddr, __be16 sport,
+					       __be32 daddr, u16 dport)
+{
+	struct bpf_sk_lookup_kern ctx = {
+		.family		= AF_INET,
+		.protocol	= protocol,
+		.v4.saddr	= saddr,
+		.v4.daddr	= daddr,
+		.sport		= sport,
+		.dport		= dport,
+	};
+
+	return bpf_sk_lookup_run(net, &ctx);
+}
+
 #endif /* _INET_HASHTABLES_H */
diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
index ab64834837c8..f4d07285591a 100644
--- a/net/ipv4/inet_hashtables.c
+++ b/net/ipv4/inet_hashtables.c
@@ -307,9 +307,22 @@ struct sock *__inet_lookup_listener(struct net *net,
 				    const int dif, const int sdif)
 {
 	struct inet_listen_hashbucket *ilb2;
-	struct sock *result = NULL;
+	struct sock *result, *reuse_sk;
 	unsigned int hash2;
 
+	/* Lookup redirect from BPF */
+	result = inet_lookup_run_bpf(net, hashinfo->protocol,
+				     saddr, sport, daddr, hnum);
+	if (IS_ERR(result))
+		return NULL;
+	if (result) {
+		reuse_sk = lookup_reuseport(net, result, skb, doff,
+					    saddr, sport, daddr, hnum);
+		if (reuse_sk)
+			result = reuse_sk;
+		goto done;
+	}
+
 	hash2 = ipv4_portaddr_hash(net, daddr, hnum);
 	ilb2 = inet_lhash2_bucket(hashinfo, hash2);
 
-- 
2.25.3


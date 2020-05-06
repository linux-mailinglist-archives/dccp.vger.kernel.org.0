Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62CB1C711F
	for <lists+dccp@lfdr.de>; Wed,  6 May 2020 14:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgEFM4H (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 6 May 2020 08:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728681AbgEFMz2 (ORCPT
        <rfc822;dccp@vger.kernel.org>); Wed, 6 May 2020 08:55:28 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1423C061A10
        for <dccp@vger.kernel.org>; Wed,  6 May 2020 05:55:27 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z8so2087312wrw.3
        for <dccp@vger.kernel.org>; Wed, 06 May 2020 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lXY32cPktzhafRRWtWGOpRuM3Po7H5+m/zDtuRoVn8o=;
        b=d4DvmqMmjg1GzVw06i1yZCzEzx9vUTZLc1r37rH7WmsoFgtAVMOa+DPN2e7L21vLZz
         kjWt6Qev/58+rs9XSBNpStLWdfSehHylhyeD6uspaIEdSPWcWa2DfqjlleDY9YtdcQ+h
         GXtzp7v2FPuuLGTh3IVFT4ecyVeqb6/zRRD5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lXY32cPktzhafRRWtWGOpRuM3Po7H5+m/zDtuRoVn8o=;
        b=olCoJcKrw5s9Kii7MEdgWLGDxVKm9NZyFX3kA661oJ2g8qp9oP7+rAliuJKERn24Zk
         q78vkgekzT2FB3NtMRqpxVU+NOv4H/O97Cl1Udi9EcR1AA14Po9DxCSMS1LkpFAsLJZl
         oPLli2AjvxxPQSf8unqHcCMhQ3YZ1i1ORFkUi40N0uCfmqKogDjsTt53V4r3gYOza9Ml
         YslyX070D7wi9tDhIX2T+xlnRhp6Sw+Vmmnvb4xjuUEAoSXRbVmtUE25fMiGMw2K74xX
         9z57XhYVUyd8YG79TTpewZK+u+WwX6PePwcPBzmUAbFwJ4XHB9+Pz06JsQirNEKXuRw3
         xM1g==
X-Gm-Message-State: AGi0PubhkMEJImaqtx7x2m0B8X+CUvJiUMuYa8YTO+eN8FxOeC31+Pbg
        y7WPhfJn/9t3Mx85n90kiHS1xw==
X-Google-Smtp-Source: APiQypJuIIVQ5R+JGiWyvd8nhiCM49tWuPVe9EnWB9uJhZ3K+I/HbJZOxdqzKeNmnWiMGJ1j2y+Fcg==
X-Received: by 2002:a5d:4005:: with SMTP id n5mr9261146wrp.242.1588769726384;
        Wed, 06 May 2020 05:55:26 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id x13sm2975933wmc.5.2020.05.06.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:55:25 -0700 (PDT)
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
Subject: [PATCH bpf-next 07/17] inet6: Run SK_LOOKUP BPF program on socket lookup
Date:   Wed,  6 May 2020 14:55:03 +0200
Message-Id: <20200506125514.1020829-8-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200506125514.1020829-1-jakub@cloudflare.com>
References: <20200506125514.1020829-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Following ipv4 stack changes, run a BPF program attached to netns before
looking up a listening socket. Program can return a listening socket to use
as result of socket lookup, fail the lookup, or take no action.

Suggested-by: Marek Majkowski <marek@cloudflare.com>
Reviewed-by: Lorenz Bauer <lmb@cloudflare.com>
Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 include/net/inet6_hashtables.h | 20 ++++++++++++++++++++
 net/ipv6/inet6_hashtables.c    | 15 ++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/net/inet6_hashtables.h b/include/net/inet6_hashtables.h
index 81b965953036..8b8c0cb92ea8 100644
--- a/include/net/inet6_hashtables.h
+++ b/include/net/inet6_hashtables.h
@@ -21,6 +21,7 @@
 
 #include <net/ipv6.h>
 #include <net/netns/hash.h>
+#include <net/inet_hashtables.h>
 
 struct inet_hashinfo;
 
@@ -103,6 +104,25 @@ struct sock *inet6_lookup(struct net *net, struct inet_hashinfo *hashinfo,
 			  const int dif);
 
 int inet6_hash(struct sock *sk);
+
+static inline struct sock *inet6_lookup_run_bpf(struct net *net, u8 protocol,
+						const struct in6_addr *saddr,
+						__be16 sport,
+						const struct in6_addr *daddr,
+						u16 dport)
+{
+	struct bpf_sk_lookup_kern ctx = {
+		.family		= AF_INET6,
+		.protocol	= protocol,
+		.v6.saddr	= *saddr,
+		.v6.daddr	= *daddr,
+		.sport		= sport,
+		.dport		= dport,
+	};
+
+	return bpf_sk_lookup_run(net, &ctx);
+}
+
 #endif /* IS_ENABLED(CONFIG_IPV6) */
 
 #define INET6_MATCH(__sk, __net, __saddr, __daddr, __ports, __dif, __sdif) \
diff --git a/net/ipv6/inet6_hashtables.c b/net/ipv6/inet6_hashtables.c
index 03942eef8ab6..6d91de89fd2b 100644
--- a/net/ipv6/inet6_hashtables.c
+++ b/net/ipv6/inet6_hashtables.c
@@ -167,9 +167,22 @@ struct sock *inet6_lookup_listener(struct net *net,
 		const unsigned short hnum, const int dif, const int sdif)
 {
 	struct inet_listen_hashbucket *ilb2;
-	struct sock *result = NULL;
+	struct sock *result, *reuse_sk;
 	unsigned int hash2;
 
+	/* Lookup redirect from BPF */
+	result = inet6_lookup_run_bpf(net, hashinfo->protocol,
+				      saddr, sport, daddr, hnum);
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
 	hash2 = ipv6_portaddr_hash(net, daddr, hnum);
 	ilb2 = inet_lhash2_bucket(hashinfo, hash2);
 
-- 
2.25.3


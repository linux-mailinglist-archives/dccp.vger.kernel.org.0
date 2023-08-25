Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14537888A9
	for <lists+dccp@lfdr.de>; Fri, 25 Aug 2023 15:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbjHYNdZ (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Fri, 25 Aug 2023 09:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjHYNcz (ORCPT <rfc822;dccp@vger.kernel.org>);
        Fri, 25 Aug 2023 09:32:55 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B697EE6F
        for <dccp@vger.kernel.org>; Fri, 25 Aug 2023 06:32:52 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fef2fafee2so96255e9.0
        for <dccp@vger.kernel.org>; Fri, 25 Aug 2023 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692970371; x=1693575171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMgENuQTUm9al0raOuSkoRbcV4eFm8ZoAXmdkzqummM=;
        b=mpjB2aMPstSr/9aUA9o4x2Q11ub8LlCgy8zS1XNlGcK9SUh3DsEKTFcEPCgK64EY0X
         OBNin9gTZwYkXCaLXnIxotZA8cHQnrXdOmMvrAfyrnSIb0b33P/lGDqmUNpoF9RMmCuk
         7JeQKve7zD/wLjSCJp71ByJez1n/u5f/lv1qaw0CU3WP/gOdtRKr0sq8SiIQhyYhKs4o
         d6SNUcmNYdCJKsQT9Hl55dzWQNvGuBNArguyjGicN+bK7UOaSNghM3VOnTWyyks+XfIS
         NLYK4sA+5ClwwrHvzjKaUMMgYsJCc8y/U4AQh/ioIdJmK/fZ1/FOixaYmcjhlzniidvw
         TN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692970371; x=1693575171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMgENuQTUm9al0raOuSkoRbcV4eFm8ZoAXmdkzqummM=;
        b=lpkQvuGmynyjkQgEi82SRgt89PdPx+Nwa5Dof5DEEF4D0gfum7tN69Q9ZM75To+/S2
         fz7Q7a1HQwl0iKrKtZusFI4sO9vppgIb71G65libWZi6+C+AYqTE1tL17lbel1ISQwJd
         iQNsx+XMSzd6ANryoD5YwQLkfU0DzTPnFRkF70dTHJDJ0H056Jc+ixcrvkIY3hFLi0PJ
         4zqEwA9VSJ9zOkaxEBG+ij8flOW3573Qr/ll/UjxZwLmkIGfowxQcz9t7rsQvjI6+Hcb
         Q+zykCyCvY3d37YR+sB736p3y2kY2YePWPpjUY50Koao0C8hRE4hxRhLbP2OohSMVXE+
         npGA==
X-Gm-Message-State: AOJu0YxEiW4fe9qNJUMjTP56cIwXtqXwG7QTCoOUPVsl3ZO9lEbHNpHZ
        rQUA8DCl9jnL9tI8XQGVaQWUkA==
X-Google-Smtp-Source: AGHT+IGJR6VlnUlpJi5XWv4o1WdYQ0zmm0E6porJBW6byN68WqZpCJrXbmhmp5hwFVUsPoFo4L5SMQ==
X-Received: by 2002:a05:600c:1d98:b0:401:a494:2bbb with SMTP id p24-20020a05600c1d9800b00401a4942bbbmr161556wms.5.1692970371097;
        Fri, 25 Aug 2023 06:32:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:d136:2a30:906a:7af7])
        by smtp.gmail.com with ESMTPSA id y6-20020adfd086000000b003179b3fd837sm2264180wrh.33.2023.08.25.06.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:32:49 -0700 (PDT)
From:   Jann Horn <jannh@google.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, dccp@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net] dccp: Fix out of bounds access in DCCP error handler
Date:   Fri, 25 Aug 2023 15:32:41 +0200
Message-ID: <20230825133241.3635236-1-jannh@google.com>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

There was a previous attempt to fix an out-of-bounds access in the DCCP
error handlers, but that fix assumed that the error handlers only want
to access the first 8 bytes of the DCCP header. Actually, they also look
at the DCCP sequence number, which is stored beyond 8 bytes, so an
explicit pskb_may_pull() is required.

Fixes: 6706a97fec96 ("dccp: fix out of bound access in dccp_v4_err()")
Fixes: 1aa9d1a0e7ee ("ipv6: dccp: fix out of bound access in dccp_v6_err()")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 net/dccp/ipv4.c | 13 +++++++++----
 net/dccp/ipv6.c | 15 ++++++++++-----
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/net/dccp/ipv4.c b/net/dccp/ipv4.c
index fa8079303cb0..dcd2fb774d82 100644
--- a/net/dccp/ipv4.c
+++ b/net/dccp/ipv4.c
@@ -255,12 +255,17 @@ static int dccp_v4_err(struct sk_buff *skb, u32 info)
 	int err;
 	struct net *net = dev_net(skb->dev);
 
-	/* Only need dccph_dport & dccph_sport which are the first
-	 * 4 bytes in dccp header.
+	/* For the first __dccp_basic_hdr_len() check, we only need dh->dccph_x,
+	 * which is in byte 7 of the dccp header.
 	 * Our caller (icmp_socket_deliver()) already pulled 8 bytes for us.
+	 *
+	 * Later on, we want to access the sequence number fields, which are
+	 * beyond 8 bytes, so we have to pskb_may_pull() ourselves.
 	 */
-	BUILD_BUG_ON(offsetofend(struct dccp_hdr, dccph_sport) > 8);
-	BUILD_BUG_ON(offsetofend(struct dccp_hdr, dccph_dport) > 8);
+	dh = (struct dccp_hdr *)(skb->data + offset);
+	if (!pskb_may_pull(skb, offset + __dccp_basic_hdr_len(dh)))
+		return -EINVAL;
+	iph = (struct iphdr *)skb->data;
 	dh = (struct dccp_hdr *)(skb->data + offset);
 
 	sk = __inet_lookup_established(net, &dccp_hashinfo,
diff --git a/net/dccp/ipv6.c b/net/dccp/ipv6.c
index d29d1163203d..25816e790527 100644
--- a/net/dccp/ipv6.c
+++ b/net/dccp/ipv6.c
@@ -74,7 +74,7 @@ static inline __u64 dccp_v6_init_sequence(struct sk_buff *skb)
 static int dccp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 			u8 type, u8 code, int offset, __be32 info)
 {
-	const struct ipv6hdr *hdr = (const struct ipv6hdr *)skb->data;
+	const struct ipv6hdr *hdr;
 	const struct dccp_hdr *dh;
 	struct dccp_sock *dp;
 	struct ipv6_pinfo *np;
@@ -83,12 +83,17 @@ static int dccp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	__u64 seq;
 	struct net *net = dev_net(skb->dev);
 
-	/* Only need dccph_dport & dccph_sport which are the first
-	 * 4 bytes in dccp header.
+	/* For the first __dccp_basic_hdr_len() check, we only need dh->dccph_x,
+	 * which is in byte 7 of the dccp header.
 	 * Our caller (icmpv6_notify()) already pulled 8 bytes for us.
+	 *
+	 * Later on, we want to access the sequence number fields, which are
+	 * beyond 8 bytes, so we have to pskb_may_pull() ourselves.
 	 */
-	BUILD_BUG_ON(offsetofend(struct dccp_hdr, dccph_sport) > 8);
-	BUILD_BUG_ON(offsetofend(struct dccp_hdr, dccph_dport) > 8);
+	dh = (struct dccp_hdr *)(skb->data + offset);
+	if (!pskb_may_pull(skb, offset + __dccp_basic_hdr_len(dh)))
+		return -EINVAL;
+	hdr = (const struct ipv6hdr *)skb->data;
 	dh = (struct dccp_hdr *)(skb->data + offset);
 
 	sk = __inet6_lookup_established(net, &dccp_hashinfo,

base-commit: 93f5de5f648d2b1ce3540a4ac71756d4a852dc23
-- 
2.42.0.rc1.204.g551eb34607-goog


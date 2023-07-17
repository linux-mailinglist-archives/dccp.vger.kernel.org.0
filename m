Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1C6D75658A
	for <lists+dccp@lfdr.de>; Mon, 17 Jul 2023 15:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjGQNye (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 17 Jul 2023 09:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjGQNya (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 17 Jul 2023 09:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC21F5
        for <dccp@vger.kernel.org>; Mon, 17 Jul 2023 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689602025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fJ7M8ndWWkx3e/2RVZAso//ELmQ26/rKM/2vgLOQ29k=;
        b=JsGa0gxjfeLaLQSIKdPSW/rsEuQK0JVtxq/+eDbvJo/EyO4bhQv+KKiPrZ0vSAbBgArsLW
        HJ3Osnw6ogFXc0qy1r8AKEvSeurXrcB+fw9XM1LJUGk1Boq3Dmcbvh+aVc5gecG+iKK8CN
        H+yWEeI35QJdZr2X+74SlxS4BuNh1yE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-ntaNBVeDNfuUOjYIFU-LVA-1; Mon, 17 Jul 2023 09:53:41 -0400
X-MC-Unique: ntaNBVeDNfuUOjYIFU-LVA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-763a397a3ceso612394985a.1
        for <dccp@vger.kernel.org>; Mon, 17 Jul 2023 06:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689602020; x=1692194020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJ7M8ndWWkx3e/2RVZAso//ELmQ26/rKM/2vgLOQ29k=;
        b=e+X3ZPPeaZdW2QSzvUz3ajTswuGZoj94U6Q6Wge9CwgcLde7ObVML0/JLj4GN9wXog
         Nz3SniLo33R7e1qY+lj3vqUee2G7s2H3MMtu29PU2Wtj1yKvi/CuxZVp3DLNrlw8mcPI
         pQS+9kwC2SG7v2AJDjIpHuxK4ZLnY8ozlG9xHyzrYFLGSHYfn0iiRwvVGzOaCILJUuKW
         6o3WgrrYnb5zZvWO4z5LNJaZnBfK3aMNBLai9n7IYiP4n1Yh/kWlHiCsm2sGkni7a+8C
         SQcNOsmd2V08kIhOQy+q7+98dqHHyURAlUtKLS13HMuXSwUY39i6om9Cxpo+y4BfjdI0
         wd7g==
X-Gm-Message-State: ABy/qLaxez2UhMzV9mdJwjjo5M3SDog9177g7jF/K1/rdSkTzr5JT5Z0
        pd9aPYBvtPjKbSkyas+no4IadEac3JKb2ghLKqKSgkN450sKgJHKzcyNyqGZbCY7J7T7gq1SVO0
        UJSlVjnkdiTfKHw==
X-Received: by 2002:a05:620a:1a0d:b0:765:3e03:10db with SMTP id bk13-20020a05620a1a0d00b007653e0310dbmr15047526qkb.48.1689602020511;
        Mon, 17 Jul 2023 06:53:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzWZdgTUrzDhDU1m1IObzlkNO78/Af8/69MC3hhvRl/+ryasnFWZC/PcNIbS+6mi1LboTVdQ==
X-Received: by 2002:a05:620a:1a0d:b0:765:3e03:10db with SMTP id bk13-20020a05620a1a0d00b007653e0310dbmr15047511qkb.48.1689602020293;
        Mon, 17 Jul 2023 06:53:40 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id g18-20020a05620a13d200b00767cd2dbd82sm6108028qkl.15.2023.07.17.06.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 06:53:39 -0700 (PDT)
Date:   Mon, 17 Jul 2023 15:53:35 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>
Cc:     netdev@vger.kernel.org, dccp@vger.kernel.org
Subject: [PATCH net-next 2/3] dccp: Set TOS and routing scope independently
 for fib lookups.
Message-ID: <d316b3692ee6ef6c91bfcf246aeae45c0e104dd0.1689600901.git.gnault@redhat.com>
References: <cover.1689600901.git.gnault@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689600901.git.gnault@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

There's no reason for setting the RTO_ONLINK flag in ->flowi4_tos as
RT_CONN_FLAGS() does. We can easily set ->flowi4_scope properly
instead. This makes the code more explicit and will allow to convert
->flowi4_tos to dscp_t in the future.

Signed-off-by: Guillaume Nault <gnault@redhat.com>
---
 net/dccp/ipv4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/dccp/ipv4.c b/net/dccp/ipv4.c
index fa8079303cb0..8e919cfe6e23 100644
--- a/net/dccp/ipv4.c
+++ b/net/dccp/ipv4.c
@@ -474,7 +474,8 @@ static struct dst_entry* dccp_v4_route_skb(struct net *net, struct sock *sk,
 		.flowi4_oif = inet_iif(skb),
 		.daddr = iph->saddr,
 		.saddr = iph->daddr,
-		.flowi4_tos = RT_CONN_FLAGS(sk),
+		.flowi4_tos = ip_sock_rt_tos(sk),
+		.flowi4_scope = ip_sock_rt_scope(sk),
 		.flowi4_proto = sk->sk_protocol,
 		.fl4_sport = dccp_hdr(skb)->dccph_dport,
 		.fl4_dport = dccp_hdr(skb)->dccph_sport,
-- 
2.39.2


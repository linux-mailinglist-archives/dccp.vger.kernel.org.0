Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B42509386
	for <lists+dccp@lfdr.de>; Thu, 21 Apr 2022 01:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349631AbiDTXYT (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 20 Apr 2022 19:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243760AbiDTXYS (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 20 Apr 2022 19:24:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B4771B7B4
        for <dccp@vger.kernel.org>; Wed, 20 Apr 2022 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650496889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5lHsAD1lpE5WDQpN++gxRlB5KiezFJw2XfqrSpdhgEQ=;
        b=B/NgMLTCklziSg53bVOxr6PrCGwrexvsvV/xRTxuNK7DoVXTx2qL9eDycpe0YBLVGxBmrs
        8pJMcq0FpxJ65w+zG5TjGy7peOCBeKOniPN0pNJujl7xjrInQyZmzISmQNzhnGGHOQRN4o
        LrU0TTl+ASAIo3Mf7Hgvkj/5coFe8QA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-MebkhPiRMBWESnOvoVfOaw-1; Wed, 20 Apr 2022 19:21:28 -0400
X-MC-Unique: MebkhPiRMBWESnOvoVfOaw-1
Received: by mail-wm1-f72.google.com with SMTP id az19-20020a05600c601300b003914ac8efb8so1639673wmb.2
        for <dccp@vger.kernel.org>; Wed, 20 Apr 2022 16:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5lHsAD1lpE5WDQpN++gxRlB5KiezFJw2XfqrSpdhgEQ=;
        b=eakXPFQJrKR7FX6EK7TVK/wnSoLFFOIsb06jbBlLhX3qkfZSSr/3JGuT9MCYEXebqK
         CiDg+C4oltKF8Stj+X1YHk+sXd7hk+QsLpjb8iQB90+BvpiaCxkqXKQzZ6fkZR81kTWD
         B+L52sgRxuOuwstu8ZpbtW2y2sRyGlX5f1aB1WzK2WsqoADdmd/3H25OY/BBsr0XT5DP
         VnGopj19THhDzbibXVEFxthks2ICHXGpoyQIcY9K/2fU+oS6D04pJtu6XfMbItt027ME
         CZwYF+tnP/qw0Wptjun2r44h0g8ymj2seEhswOcyOlAPJEd5oAYRsay9R6phuE7n61OT
         f99g==
X-Gm-Message-State: AOAM532OZW2fZ1WLkdn13+obH7ufUDZ/QZi+nHBW7Ygfi2T2OSGvrKol
        t9zxux8OEx7GYwVGi5Rh+0W2SAtm5eRESBu3KSs+bdgYI95TLhnoOEYktCJoPJ09/GGbynAeu8e
        SEnxdgjmMkmeZYw==
X-Received: by 2002:a05:600c:3b8b:b0:392:9897:1edf with SMTP id n11-20020a05600c3b8b00b0039298971edfmr5718684wms.108.1650496887285;
        Wed, 20 Apr 2022 16:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxF/ScVtsxc6UpvojKuXtLKT/ibu1Jaryq1uANuvXtlO7MkXQ6tKV4zYxsZORAkOoeSmSueg==
X-Received: by 2002:a05:600c:3b8b:b0:392:9897:1edf with SMTP id n11-20020a05600c3b8b00b0039298971edfmr5718671wms.108.1650496887140;
        Wed, 20 Apr 2022 16:21:27 -0700 (PDT)
Received: from debian.home (2a01cb058d3818005c1e4a7b0f47339f.ipv6.abo.wanadoo.fr. [2a01:cb05:8d38:1800:5c1e:4a7b:f47:339f])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d5608000000b00207ab405d15sm863689wrv.42.2022.04.20.16.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 16:21:26 -0700 (PDT)
Date:   Thu, 21 Apr 2022 01:21:24 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     netdev@vger.kernel.org,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>, dccp@vger.kernel.org
Subject: [PATCH net-next 1/3] ipv4: Don't reset ->flowi4_scope in
 ip_rt_fix_tos().
Message-ID: <c3fdfe3353158c9b9da14602619fb82db5e77f27.1650470610.git.gnault@redhat.com>
References: <cover.1650470610.git.gnault@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1650470610.git.gnault@redhat.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

All callers already initialise ->flowi4_scope with RT_SCOPE_UNIVERSE,
either by manual field assignment, memset(0) of the whole structure or
implicit structure initialisation of on-stack variables
(RT_SCOPE_UNIVERSE actually equals 0).

Therefore, we don't need to always initialise ->flowi4_scope in
ip_rt_fix_tos(). We only need to reduce the scope to RT_SCOPE_LINK when
the special RTO_ONLINK flag is present in the tos.

This will allow some code simplification, like removing
ip_rt_fix_tos(). Also, the long term idea is to remove RTO_ONLINK
entirely by properly initialising ->flowi4_scope, instead of
overloading ->flowi4_tos with a special flag. Eventually, this will
allow to convert ->flowi4_tos to dscp_t.

Signed-off-by: Guillaume Nault <gnault@redhat.com>
---
It's important for the correctness of this patch that all callers
initialise ->flowi4_scope to 0 (in one way or another). Auditing all of
them is long, although each case is pretty trivial.

If it helps, I can send a patch series that converts implicit
initialisation of ->flowi4_scope with an explicit assignment to
RT_SCOPE_UNIVERSE. This would also have the advantage of making it
clear to future readers that ->flowi4_scope _has_ to be initialised. I
haven't sent such patch series to not overwhelm reviewers with trivial
and not technically-required changes (there are 40+ places to modify,
scattered over 30+ different files). But if anyone prefers explicit
initialisation everywhere, then just let me know and I'll send such
patches.
---
 net/ipv4/route.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index e839d424b861..d8f82c0ac132 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -503,8 +503,8 @@ static void ip_rt_fix_tos(struct flowi4 *fl4)
 	__u8 tos = RT_FL_TOS(fl4);
 
 	fl4->flowi4_tos = tos & IPTOS_RT_MASK;
-	fl4->flowi4_scope = tos & RTO_ONLINK ?
-			    RT_SCOPE_LINK : RT_SCOPE_UNIVERSE;
+	if (tos & RTO_ONLINK)
+		fl4->flowi4_scope = RT_SCOPE_LINK;
 }
 
 static void __build_flow_key(const struct net *net, struct flowi4 *fl4,
-- 
2.21.3


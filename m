Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E28756588
	for <lists+dccp@lfdr.de>; Mon, 17 Jul 2023 15:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjGQNy0 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 17 Jul 2023 09:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGQNyZ (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 17 Jul 2023 09:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2335EE2
        for <dccp@vger.kernel.org>; Mon, 17 Jul 2023 06:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689602014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=cxwNxY4JS8J6tPLEogfd2SFfXj3N8uNj2U1eKeq6+xE=;
        b=Tciml48Jb8afZz3cX7JA5o0TBxnzAGNSkeOKatB5jAenyd00YNsKrQFzarUFvwlsHx5jVh
        lTpfaOcC5ABRWLYz1TzvT91cG6BhCiC7Vwzj8ITiTb3vwCs9rRaU4Ngd613hYFcariur23
        tsgfAPPGhsCJgXBxvANtcRVLz+rQ9H0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-XVvqmdrxPIanAN5fI_qJBg-1; Mon, 17 Jul 2023 09:53:32 -0400
X-MC-Unique: XVvqmdrxPIanAN5fI_qJBg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403c7ffd25eso49448441cf.2
        for <dccp@vger.kernel.org>; Mon, 17 Jul 2023 06:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689602012; x=1692194012;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxwNxY4JS8J6tPLEogfd2SFfXj3N8uNj2U1eKeq6+xE=;
        b=d3PgdBlh/XI8W+Vh8i7Lnn27Ya3PownrtjRzgikYkP2jk2gefyigJHAoLjVm2kMxja
         +Hk+J7hvRoG0IXUjKuwTQG0y4fxM6I7KjAfjxrF/YHi/R4767IYfb9PfHkb1qjeN2Ev3
         oeFqvXBThR4MkC4frdS6R/wNytI1ja0CtfB6dd4t66rvuMgEyztn+EdzFdkbq9tIt4To
         0jBJ4nQg0MFNS3XiUYt1J1vbPCyKzc1uJcF+Pwt4lZXt6z0MqRTbh1KkA8rIxBukX9Ua
         6MywNAxowhiH2YaUggI/WURW0vj7IAnMZsWAGAD1DaDzHAUOPykX4EHTDEqkytM3lKhD
         6i+g==
X-Gm-Message-State: ABy/qLa4Cv+tJZ3qqSKs1N6oqayIm5q2z0fccbDa+7sPPbyBpBB9oa8z
        gqMdWsP61GVHY0yQ0xoYu9HpnCxrcJabDB5cMtDh7OOj4cn+HiVJ9j5DeWIkfnM70KlgL4W0MbQ
        BBHKNCsRm0a23jw==
X-Received: by 2002:a05:622a:104c:b0:3e3:9117:66e8 with SMTP id f12-20020a05622a104c00b003e3911766e8mr15174573qte.35.1689602012085;
        Mon, 17 Jul 2023 06:53:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFQ6vap0ITLUfu8vhP2jR7nb8amW+13ht5RG1X59wHJKsZtwSGwA6x7Lps3sxW4+8YYauf9HQ==
X-Received: by 2002:a05:622a:104c:b0:3e3:9117:66e8 with SMTP id f12-20020a05622a104c00b003e3911766e8mr15174559qte.35.1689602011845;
        Mon, 17 Jul 2023 06:53:31 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id x10-20020ac87eca000000b00403b44bc230sm6250267qtj.95.2023.07.17.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 06:53:31 -0700 (PDT)
Date:   Mon, 17 Jul 2023 15:53:24 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>
Cc:     netdev@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>,
        Harald Welte <laforge@gnumonks.org>,
        osmocom-net-gprs@lists.osmocom.org, dccp@vger.kernel.org,
        Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        Xin Long <lucien.xin@gmail.com>, linux-sctp@vger.kernel.org
Subject: [PATCH net-next 0/3] net: Remove more RTO_ONLINK users.
Message-ID: <cover.1689600901.git.gnault@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Code that initialise a flowi4 structure manually before doing a fib
lookup can easily avoid overloading ->flowi4_tos with the RTO_ONLINK
bit. They can just set ->flowi4_scope correctly instead.

Properly separating the routing scope from ->flowi4_tos will allow to
eventually convert this field to dscp_t (to ensure proper separation
between DSCP and ECN).

Guillaume Nault (3):
  gtp: Set TOS and routing scope independently for fib lookups.
  dccp: Set TOS and routing scope independently for fib lookups.
  sctp: Set TOS and routing scope independently for fib lookups.

 drivers/net/gtp.c   | 3 ++-
 net/dccp/ipv4.c     | 3 ++-
 net/sctp/protocol.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.39.2


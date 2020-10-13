Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAA828D301
	for <lists+dccp@lfdr.de>; Tue, 13 Oct 2020 19:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388243AbgJMRTB (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 13 Oct 2020 13:19:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60018 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388113AbgJMRS7 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 13 Oct 2020 13:18:59 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kleber.souza@canonical.com>)
        id 1kSNww-0004Bz-G2
        for dccp@vger.kernel.org; Tue, 13 Oct 2020 17:18:58 +0000
Received: by mail-ed1-f71.google.com with SMTP id y8so130542edj.5
        for <dccp@vger.kernel.org>; Tue, 13 Oct 2020 10:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SpXSDSdlRFb9ggkqiY6j3lhSsXlTf+Fbt8H5fRXb3p0=;
        b=Hgu4UsF4xqrUzo0Rd2CWke3C+dE7UQYlVq/h6DXLFLkCOk/Kn4T+yqn6ztO/MTTpjj
         UBkMCFbJMHl3S77sj9vgtZICUZlaXsRnRGQhuAbnbNI6rsHYrZQ97AeOfr1F7APyv8Gu
         AZav0boMmN22hDFkNXlN08xNMzrvjYIrCdTFNN7eV2/vdU1UOrwP8IAx51pT9cnYELvv
         9tD0BHDdwjxFapx1wpeCidWxFEQa8xuP4rVfXwUvTJPCnSTv0igazKR4lpbPorXJ249j
         +TQTPyNNaG/4H4VNoUOc7i/GycHU60hSC2pkc/IP4n6ep4sMP9u75Gb1VQtPbNjE02Pp
         wSDw==
X-Gm-Message-State: AOAM5329jaGelS7FIZSDcWNjLxaETrDsxp33qisjkgeTWucRyhAHjqLq
        X1oAfQjxawwmA/Rd7E41JO+iKy+F9/xgMzVweIySWkCEiquUUrv2CXc2kFlWIu8BPeWdr4kp+dj
        umLI6JeYUYArXcoaGhNb9Wz6hyjBWe+A=
X-Received: by 2002:a17:906:4910:: with SMTP id b16mr763226ejq.546.1602609537602;
        Tue, 13 Oct 2020 10:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3NuZ4q11/DfqCThTBhZ0g6qFgOjTVcNSF/1wGkdeI6EkcYetu/CBb+wZODe17xtTC7wk0Gg==
X-Received: by 2002:a17:906:4910:: with SMTP id b16mr763142ejq.546.1602609536787;
        Tue, 13 Oct 2020 10:18:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:4640:10c0:6cbe:6d37:31ed:e54b])
        by smtp.gmail.com with ESMTPSA id g9sm192776edv.81.2020.10.13.10.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:18:56 -0700 (PDT)
From:   Kleber Sacilotto de Souza <kleber.souza@canonical.com>
To:     netdev@vger.kernel.org
Cc:     Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Kees Cook <keescook@chromium.org>,
        Eric Dumazet <edumazet@google.com>,
        Alexey Kodanev <alexey.kodanev@oracle.com>,
        dccp@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Revert "dccp: don't free ccid2_hc_tx_sock struct in dccp_disconnect()"
Date:   Tue, 13 Oct 2020 19:18:49 +0200
Message-Id: <20201013171849.236025-3-kleber.souza@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013171849.236025-1-kleber.souza@canonical.com>
References: <20201013171849.236025-1-kleber.souza@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

This reverts commit 2677d20677314101293e6da0094ede7b5526d2b1.

This fixes an issue that after disconnect, dccps_hc_tx_ccid will still be
kept, allowing the socket to be reused as a listener socket, and the cloned
socket will free its dccps_hc_tx_ccid, leading to a later use after free,
when the listener socket is closed.

This addresses CVE-2020-16119.

Fixes: 2677d2067731 (dccp: don't free ccid2_hc_tx_sock struct in dccp_disconnect())
Reported-by: Hadar Manor
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Signed-off-by: Kleber Sacilotto de Souza <kleber.souza@canonical.com>
---
 net/dccp/proto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/dccp/proto.c b/net/dccp/proto.c
index 6d705d90c614..359e848dba6c 100644
--- a/net/dccp/proto.c
+++ b/net/dccp/proto.c
@@ -279,7 +279,9 @@ int dccp_disconnect(struct sock *sk, int flags)
 
 	dccp_clear_xmit_timers(sk);
 	ccid_hc_rx_delete(dp->dccps_hc_rx_ccid, sk);
+	ccid_hc_tx_delete(dp->dccps_hc_tx_ccid, sk);
 	dp->dccps_hc_rx_ccid = NULL;
+	dp->dccps_hc_tx_ccid = NULL;
 
 	__skb_queue_purge(&sk->sk_receive_queue);
 	__skb_queue_purge(&sk->sk_write_queue);
-- 
2.25.1


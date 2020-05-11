Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FC91CE329
	for <lists+dccp@lfdr.de>; Mon, 11 May 2020 20:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731291AbgEKSww (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 11 May 2020 14:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731190AbgEKSwq (ORCPT
        <rfc822;dccp@vger.kernel.org>); Mon, 11 May 2020 14:52:46 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7725DC061A0E
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:46 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id h4so19155936wmb.4
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8DCoKl1/gaqXVRh80rwnARoKd5SOhiqEFIXtMsss+EA=;
        b=FlFimMQ4dwBCND13Ajh3hU0NuJDBawAeO05LF7vpA8j3al3FVrgYlo4OnNFPEgqt5a
         rpwziA7n1HQTLEV4nuNK6IZTkwP7cVEh/1bPcBNeGrl85ubUduAmE3tc+SN0JMVlnEAL
         MywBnnypSDXU6gew0k2pgPRTz4nZ5oOU9XCVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8DCoKl1/gaqXVRh80rwnARoKd5SOhiqEFIXtMsss+EA=;
        b=CdEX9UTfVWsQP4Gfk7WaX1ndtgBA1JVPpL1LkjvWNXImCOsd3QxKv5txpMeV7liwsJ
         t1eiCHpdJ/JCg0PjFsmsn4Dvb+JhZkU/D8uuE/SNSU9dy6O3zrucc3A8BKfnMzZ7O7EX
         WVbhd8HE+3P7ts1YgRCwfFK7Igknp2qZIVbkWmcyKbSngcTVDQjiNTuxDHznqpxKF7N8
         EGU+Ivprcmf8xxWIkZpls6YrDBrmtPBZR5ydJl1tnnbOw1gYlw7sUK999LLg6yMmh6sT
         eMvwKvBHlmu+YcE4Wlkxxy7/p51MspI3nmzgu1CSlHLoYf0gHb7owDdhV0aruhm99CI+
         JxDg==
X-Gm-Message-State: AGi0Pubwib14AiWVdI4bQrfodqd9CBzadVBEx5wSckoNgth2PBxUstf8
        VtMbv/quaUk9y8UR9B2zy8gO2A==
X-Google-Smtp-Source: APiQypJaYfNdpTusfsYnSZWh9YYqSd9y8kMv59m0ysOfP2XEySo1vBXmOHoY3SKwFAco7TEMB5a6iw==
X-Received: by 2002:a05:600c:2041:: with SMTP id p1mr2895620wmg.152.1589223165214;
        Mon, 11 May 2020 11:52:45 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id m3sm3344768wrn.96.2020.05.11.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:52:44 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 16/17] selftests/bpf: Rename test_sk_lookup_kern.c to test_ref_track_kern.c
Date:   Mon, 11 May 2020 20:52:17 +0200
Message-Id: <20200511185218.1422406-17-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200511185218.1422406-1-jakub@cloudflare.com>
References: <20200511185218.1422406-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Name the BPF C file after the test case that uses it.

This frees up "test_sk_lookup" namespace for BPF sk_lookup program tests
introduced by the following patch.

Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 tools/testing/selftests/bpf/prog_tests/reference_tracking.c     | 2 +-
 .../bpf/progs/{test_sk_lookup_kern.c => test_ref_track_kern.c}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/bpf/progs/{test_sk_lookup_kern.c => test_ref_track_kern.c} (100%)

diff --git a/tools/testing/selftests/bpf/prog_tests/reference_tracking.c b/tools/testing/selftests/bpf/prog_tests/reference_tracking.c
index fc0d7f4f02cf..106ca8bb2a8f 100644
--- a/tools/testing/selftests/bpf/prog_tests/reference_tracking.c
+++ b/tools/testing/selftests/bpf/prog_tests/reference_tracking.c
@@ -3,7 +3,7 @@
 
 void test_reference_tracking(void)
 {
-	const char *file = "test_sk_lookup_kern.o";
+	const char *file = "test_ref_track_kern.o";
 	const char *obj_name = "ref_track";
 	DECLARE_LIBBPF_OPTS(bpf_object_open_opts, open_opts,
 		.object_name = obj_name,
diff --git a/tools/testing/selftests/bpf/progs/test_sk_lookup_kern.c b/tools/testing/selftests/bpf/progs/test_ref_track_kern.c
similarity index 100%
rename from tools/testing/selftests/bpf/progs/test_sk_lookup_kern.c
rename to tools/testing/selftests/bpf/progs/test_ref_track_kern.c
-- 
2.25.3


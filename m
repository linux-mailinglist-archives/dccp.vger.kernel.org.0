Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88431C710B
	for <lists+dccp@lfdr.de>; Wed,  6 May 2020 14:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgEFMzm (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 6 May 2020 08:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728769AbgEFMzl (ORCPT
        <rfc822;dccp@vger.kernel.org>); Wed, 6 May 2020 08:55:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F420AC061A0F
        for <dccp@vger.kernel.org>; Wed,  6 May 2020 05:55:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so2067508wrb.8
        for <dccp@vger.kernel.org>; Wed, 06 May 2020 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8DCoKl1/gaqXVRh80rwnARoKd5SOhiqEFIXtMsss+EA=;
        b=Zx2p/C9hj15+qgcVJRFWGUkWhPZBmn7s3xTUeUlwAFGrbu69FjVxlJOezY+biAfdrm
         BYyu/VuT3Dfl+StE+iSN2PvixBf88F3i8noAtwPCSUhANnvshvTCSWIs/IqPIT5pOZDS
         P+UZ6TR4AB6R8T+kxR7yuBQkH/+sJM5ZhmY2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8DCoKl1/gaqXVRh80rwnARoKd5SOhiqEFIXtMsss+EA=;
        b=NSK5kxtls4KKb80oS2mqjdoPO3V4A9aGY7Y7VGXzboZ/gCxLP2hdA6fmZAuy8RV6K5
         FmK838HRIyTh+mYv0vyceQAMYW7jcPR1enC1cs1mfIc6MZCF6FybVbjj6A0pM8ioe0Ee
         FZT4I0PYIYiFm9N8sWUX8DywkjjCB7ut+5K2H70MjgtRJqiJUa5+y0LpzUuI/nOMdClY
         R4IIdHzKlDfbSURgbKraERl/sppcyPwtRmkjjoKfSvAhLZ7VwxWR0/ngtSDM3vARaNhe
         3uwouTvmdGM++ON3Y7RHJd1prywRjdS8/2V3waR6RphWY65bMFk0Bb/ERO/T8usUk0IJ
         kYZw==
X-Gm-Message-State: AGi0PuYCjJjiF5gP/7aNTb5fvTWSk9O1XtzpIB56cRq0AtH/HJIXRgdf
        by+LWMwxV4fPPBdlJ6okzEJE+A==
X-Google-Smtp-Source: APiQypLBOnq5gamj0J8plk0NnUuN/zwsYh5Hj7hWEu/0YXLir2P+QthCsBdoqAAh8D0iUEovO5kuHg==
X-Received: by 2002:adf:b301:: with SMTP id j1mr9265960wrd.221.1588769739725;
        Wed, 06 May 2020 05:55:39 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id p7sm2776520wrf.31.2020.05.06.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:55:39 -0700 (PDT)
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     netdev@vger.kernel.org, bpf@vger.kernel.org
Cc:     dccp@vger.kernel.org, kernel-team@cloudflare.com,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH bpf-next 16/17] selftests/bpf: Rename test_sk_lookup_kern.c to test_ref_track_kern.c
Date:   Wed,  6 May 2020 14:55:12 +0200
Message-Id: <20200506125514.1020829-17-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200506125514.1020829-1-jakub@cloudflare.com>
References: <20200506125514.1020829-1-jakub@cloudflare.com>
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


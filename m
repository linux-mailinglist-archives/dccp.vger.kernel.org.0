Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6045D1CE32E
	for <lists+dccp@lfdr.de>; Mon, 11 May 2020 20:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgEKSw7 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 11 May 2020 14:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731259AbgEKSwp (ORCPT
        <rfc822;dccp@vger.kernel.org>); Mon, 11 May 2020 14:52:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476E2C061A0E
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:45 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y16so5135664wrs.3
        for <dccp@vger.kernel.org>; Mon, 11 May 2020 11:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DMqKMKWuzCcR6FxP9hi6qzxvVY3wjBoadkJ8o2Mh5D0=;
        b=JJ7RBd3YRIwSXmyf5NPu//CnAnU+v4tsq2Btmu/NTeC81ikDA8I9wPfKjWSeUe6jm8
         aqxRm1wU3VDslngOuNnoizn6g8CnmaBQmqyq8O5RpodbpwaEuRInIWINHDWNkbhf/mT/
         lLtxPlZfJsLpJh6jeM4C49jrOJ46iSLLjnm2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DMqKMKWuzCcR6FxP9hi6qzxvVY3wjBoadkJ8o2Mh5D0=;
        b=dAJbWpaBqgIttcHwMgKgunvw2T5kw/zCJcU+Oj6TOEOVpK2JVwVirWAerSJt/su4Ct
         XhNKAde6Ob/Iie6bdgSenYJT7zNmUfAQaYz6nui7JTROEHIoMo83FsrXaDXw+dJWW6iZ
         h4wkI9NB5H7D7G+SkQUSrPW9uy1t+WrxEnMEwFSXtVy3N341L+yLU7j4+AXpXDanKNdI
         /yNz3Wb8LS4RWPNU7zJV9pxtjoSwswPvBQSoS1wDsOnW+QRI5UHia0k1JVCCGkJDM8wI
         49kGMawFzhLfW2+PWvV9IaDkuZfsk40PVVThwcsB7bMICxEbyJHUhsZhje5SXaDKutv4
         KvNA==
X-Gm-Message-State: AGi0Pub6LilNIv1mpgqSbGkN508GjP+D8ApVWkei0qAg4dimC9nOnLxV
        uoUhn2e+GO2YCj4Lm+akGg5xKA==
X-Google-Smtp-Source: APiQypLCY6N3PM2wsnBC3way/PtTOY12KkcMxt0ZEytY46n8Gass3dyNRQCQPGuQZvfwdqopEEB8wg==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr20116949wrt.215.1589223163698;
        Mon, 11 May 2020 11:52:43 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id y10sm15892107wrd.95.2020.05.11.11.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:52:43 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 15/17] selftests/bpf: Add verifier tests for bpf_sk_lookup context access
Date:   Mon, 11 May 2020 20:52:16 +0200
Message-Id: <20200511185218.1422406-16-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200511185218.1422406-1-jakub@cloudflare.com>
References: <20200511185218.1422406-1-jakub@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Exercise verifier access checks for bpf_sk_lookup context fields.

Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---

Notes:
    v2:
     - Adjust for fields renames in struct bpf_sk_lookup.

 .../selftests/bpf/verifier/ctx_sk_lookup.c    | 694 ++++++++++++++++++
 1 file changed, 694 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/verifier/ctx_sk_lookup.c

diff --git a/tools/testing/selftests/bpf/verifier/ctx_sk_lookup.c b/tools/testing/selftests/bpf/verifier/ctx_sk_lookup.c
new file mode 100644
index 000000000000..223163172fa9
--- /dev/null
+++ b/tools/testing/selftests/bpf/verifier/ctx_sk_lookup.c
@@ -0,0 +1,694 @@
+{
+	"valid 1,2,4-byte read bpf_sk_lookup remote_ip4",
+	.insns = {
+		/* 4-byte read */
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		/* 2-byte read */
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip4) + 2),
+		/* 1-byte read */
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip4) + 3),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup remote_ip4",
+	.insns = {
+		/* 8-byte read */
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup remote_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		/* 4-byte write */
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup remote_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		/* 4-byte write */
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup remote_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		/* 2-byte write */
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup remote_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		/* 1-byte write */
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"valid 1,2,4-byte read bpf_sk_lookup local_ip4",
+	.insns = {
+		/* 4-byte read */
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		/* 2-byte read */
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip4) + 2),
+		/* 1-byte read */
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip4) + 3),
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup local_ip4",
+	.insns = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup local_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup local_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup local_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup local_ip4",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x7f000001U),
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip4)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"valid 1,2,4-byte read bpf_sk_lookup remote_ip6",
+	.insns = {
+		/* 4-byte read */
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[3])),
+		/* 2-byte read */
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[3]) + 2),
+		/* 1-byte read */
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[3]) + 3),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup remote_ip6",
+	.insns = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup remote_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup remote_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup remote_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup remote_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"valid 1,2,4-byte read bpf_sk_lookup local_ip6",
+	.insns = {
+		/* 4-byte read */
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip6[3])),
+		/* 2-byte read */
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip6[3]) + 2),
+		/* 1-byte read */
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip6[3]) + 3),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup local_ip6",
+	.insns = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup local_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup local_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup local_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup local_ip6",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 0x00000001U),
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_ip6[0])),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"valid 4-byte read bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte read bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte read bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup remote_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, remote_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"valid 4-byte read bpf_sk_lookup local_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup local_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte read bpf_sk_lookup local_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte read bpf_sk_lookup local_port",
+	.insns = {
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup local_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup local_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup local_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup local_port",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, local_port)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"valid 4-byte read bpf_sk_lookup family",
+	.insns = {
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup family",
+	.insns = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte read bpf_sk_lookup family",
+	.insns = {
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte read bpf_sk_lookup family",
+	.insns = {
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup family",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup family",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup family",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup family",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, family)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"valid 4-byte read bpf_sk_lookup protocol",
+	.insns = {
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte read bpf_sk_lookup protocol",
+	.insns = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte read bpf_sk_lookup protocol",
+	.insns = {
+		BPF_LDX_MEM(BPF_H, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte read bpf_sk_lookup protocol",
+	.insns = {
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_1,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 8-byte write bpf_sk_lookup protocol",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 4-byte write bpf_sk_lookup protocol",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 2-byte write bpf_sk_lookup protocol",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_H, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
+{
+	"invalid 1-byte write bpf_sk_lookup protocol",
+	.insns = {
+		BPF_MOV64_IMM(BPF_REG_0, 1234),
+		BPF_STX_MEM(BPF_B, BPF_REG_1, BPF_REG_0,
+			    offsetof(struct bpf_sk_lookup, protocol)),
+		BPF_EXIT_INSN(),
+	},
+	.errstr = "invalid bpf_context access",
+	.result = REJECT,
+	.prog_type = BPF_PROG_TYPE_SK_LOOKUP,
+},
-- 
2.25.3


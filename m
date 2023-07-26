Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D29763429
	for <lists+dccp@lfdr.de>; Wed, 26 Jul 2023 12:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbjGZKrL (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 26 Jul 2023 06:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjGZKrJ (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 26 Jul 2023 06:47:09 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E19E212C
        for <dccp@vger.kernel.org>; Wed, 26 Jul 2023 03:47:08 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so65285625e9.1
        for <dccp@vger.kernel.org>; Wed, 26 Jul 2023 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690368427; x=1690973227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPdomX7dp8TGU4MIOJN63VoiHSMVcog9K5D8a+5Yv00=;
        b=F/K+3WcJUF0cJF24SmVrGpIDnoCnB1agb9ecevYPtDSHJXhTY0KwSLcwh44Z2MPb0V
         7mCCNzUN4G9CKh22WnVS8Lj74mGPuGtlCClfh/tT+jieUa8s+NF2lVZpkAmgc/dbi+ro
         x0YEEsXI72lSh4305HwUTjqB0qBJtG0L3aPGIP6xO//UCxvDl0pPerhAefRoUmdOLmlb
         z6tp9acWjN/hMFIgZH3Hp0Cmqak/6Tlpv331Al30I3d3Gi338FcOOAlatB9nnOCmIuAT
         GAVr87+hIIGrqYVRmY2ALWB0WfyyhAfXG2E9jySPaxOrrqLkWWwK6nx9v1iXkTB63Z2O
         TOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690368427; x=1690973227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPdomX7dp8TGU4MIOJN63VoiHSMVcog9K5D8a+5Yv00=;
        b=WC7bTaZO+iEXvZoMimmKfcioWnTkMV+e811eu+j4q0IHMsEcyDdkURG9eDIVefa+8V
         uoRgCHn69NW1ewRX1hbDjbUy4cxn9UrYwFq35GsArdxQeLpdQkqlPhEW1lZjNDE3hkJ9
         NsXAJmQDI2nV0kvROvAYFBvGw5I7lS/1lxbt8RKKRZ/rtDZg9aPV+HOLEEVT5Tkg/GZA
         JyktdMwAS8nYQ/NVwP0hR1FR0e2EyZ6GU/3paoMiKgnB4c+JtoLuzk6xch9ohZ8uSmeE
         dPLq9Oo5uKFrj3NInLu8Skg4W656QVxKYSK6DQ2Da7OE1UJopZWJ5xWUruC2P0XcXC6p
         J6Rw==
X-Gm-Message-State: ABy/qLZNQacDmJVGLTQWmjlihIEY4wdKuVEEpv0tuvaCFYznuwbo6JnU
        A0nyL1XeKxgjYn3GgV/nJsigQw==
X-Google-Smtp-Source: APBJJlEQzU/OChI2cfTtzLG73M1MUxSfhsDlw7ejnSoADvsiVZ5cfbJqWfp50XIZ2gZtpdV547+eTQ==
X-Received: by 2002:a05:600c:294a:b0:3fc:5fa:e2a9 with SMTP id n10-20020a05600c294a00b003fc05fae2a9mr1102874wmd.41.1690368427054;
        Wed, 26 Jul 2023 03:47:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u12-20020a7bcb0c000000b003fbc9b9699dsm1619645wmj.45.2023.07.26.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 03:47:06 -0700 (PDT)
Date:   Wed, 26 Jul 2023 13:47:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Gerrit Renker <gerrit@erg.abdn.ac.uk>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, dccp@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] dccp: Allocate enough data in ccid_get_builtin_ccids()
Message-ID: <35ed2523-49ee-4e2b-b50d-38508f74f93f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

This is allocating the ARRAY_SIZE() instead of the number of bytes.  The
array size is 1 or 2 depending on the .config and it should allocate
8 or 16 bytes instead.

Fixes: ddebc973c56b ("dccp: Lockless integration of CCID congestion-control plugins")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/dccp/ccid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/dccp/ccid.c b/net/dccp/ccid.c
index 6beac5d348e2..9067958d3857 100644
--- a/net/dccp/ccid.c
+++ b/net/dccp/ccid.c
@@ -48,7 +48,8 @@ bool ccid_support_check(u8 const *ccid_array, u8 array_len)
  */
 int ccid_get_builtin_ccids(u8 **ccid_array, u8 *array_len)
 {
-	*ccid_array = kmalloc(ARRAY_SIZE(ccids), gfp_any());
+	*ccid_array = kmalloc_array(ARRAY_SIZE(ccids), sizeof(*ccid_array),
+				    gfp_any());
 	if (*ccid_array == NULL)
 		return -ENOBUFS;
 
-- 
2.39.2


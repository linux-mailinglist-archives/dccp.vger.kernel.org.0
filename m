Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5B63FB2B5
	for <lists+dccp@lfdr.de>; Mon, 30 Aug 2021 10:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbhH3Ive (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 30 Aug 2021 04:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234695AbhH3Ive (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 30 Aug 2021 04:51:34 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EFEC06175F
        for <dccp@vger.kernel.org>; Mon, 30 Aug 2021 01:50:41 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id k12-20020a05620a0b8c00b003d5c8646ec2so416138qkh.20
        for <dccp@vger.kernel.org>; Mon, 30 Aug 2021 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WCe88g7AXY9JlaaNfnczI9r0A/F6aA5ScCXXL8MQTbQ=;
        b=bcC1OCRPm6wMd+6jhTq5ndmFY5wYcgLdbW9cCRTjWXi5sudLNVoDbGbmszS5ZJzTN4
         P0Ttlmvrboav75fyWkQqJYv2RBsugznVtD0AmQyuRkwBG639Nx+E6mc6Iw58gbiMOPtD
         9BIiZ8c+jRspSH1ARtAAGZTVHNneDAHl0EI+ke3SsptCcCho47mUs9ZXjsvBDskZ4BfR
         ItS6VqxraY77c2an8hw0OFxOZl4bR1JXBl2QOk7pcGIm0NDHNhR7ESUA+93ZgCW7/UNd
         PcJr4puGjLk3Umkn1OaYgzmMwOP7p0w51zB4IbF7G/m3crrgWYE6DtZNeGmkfQ8H86Fh
         7xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WCe88g7AXY9JlaaNfnczI9r0A/F6aA5ScCXXL8MQTbQ=;
        b=cctqj1FFfMuef8VroKc1LL/7tcFTrISoeQ78LO5Qa5JTdeBwU2oW90EWq1QqpGtxCP
         09ZWE+6Q6yxaqmiPo+PdAiR0nfYieROPQdGNKhC5EP1zlgiULR/hAeumu6H57AAcPTRF
         fCWKOoz/cW2NhxVexuksEY92eUZnGxpA6HHkP9bEMJCtjP7zb92q+FglUdiOkhDzJIKB
         KozEeVgf+WUD0ztpHVF81fKvdSAmpykUhlU+9xYc/lHaA8bJNVnGrY30HD55FL2ScTSH
         NOHTHniao4KRQRAWxjoS+lYPxiGE97cv2xslyPOcQiFmhjRitBLd3dOGTucqXsm/BYkm
         TeOA==
X-Gm-Message-State: AOAM531KScWfDh0R43c/k8zY4ysMY1PXWVk6SZVxF7TiHuTP6g3DIsuX
        fKXsh6fGzSKo3VaNpAzAgeG4bhuA7noD
X-Google-Smtp-Source: ABdhPJyd0GkGZ8FrrElrpCEdvAxN+QB+fxbOK8cNw07FbgGyQIOqvJXhwzj0C3etAbfFwqnahiDpkz8hp48f
X-Received: from dvyukov-desk.muc.corp.google.com ([2a00:79e0:15:13:7e54:6e42:f267:120d])
 (user=dvyukov job=sendgmr) by 2002:a05:6214:104e:: with SMTP id
 l14mr21749227qvr.45.1630313440139; Mon, 30 Aug 2021 01:50:40 -0700 (PDT)
Date:   Mon, 30 Aug 2021 10:50:35 +0200
In-Reply-To: <000000000000b6599705ca78de28@google.com>
Message-Id: <20210830085035.2763839-1-dvyukov@google.com>
Mime-Version: 1.0
References: <000000000000b6599705ca78de28@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [syzbot] BUG: please report to dccp@vger.kernel.org => prev = NUM,
 last = NUM at net/dccp/ccids/lib/packet_history.c:LINE/tfrc_rx
From:   Dmitry Vyukov <dvyukov@google.com>
To:     syzbot+d9bd66f8d352f7eb1955@syzkaller.appspotmail.com
Cc:     syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
        dccp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

This is the same as:

#syz dup: BUG: please report to dccp@vger.kernel.org => prev = 0, last = 0 at net/dccp/ccids/lib/packet_history.c:LINE/tfrc_rx_hist_sample_rtt()

https://syzkaller.appspot.com/bug?id=0881c535c265ca965edc49c0ac3d0a9850d26eb1

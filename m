Return-Path: <dccp+bounces-51-lists+dccp=lfdr.de@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788487331D
	for <lists+dccp@lfdr.de>; Wed,  6 Mar 2024 10:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1354B2092F
	for <lists+dccp@lfdr.de>; Wed,  6 Mar 2024 09:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B945F876;
	Wed,  6 Mar 2024 09:53:20 +0000 (UTC)
X-Original-To: dccp@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E355F55B
	for <dccp@vger.kernel.org>; Wed,  6 Mar 2024 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718800; cv=none; b=ujyt9OzD/nEx3KL69x9cFjX3es4s9SzdD13nYT9qdkgNQu2lanjOzp0Yqm96rHMcckHikoa4bELnLresvUc7/CQjuNZAxOVR1dSu7q2sWXyoJKGv40rmDGvNv0KBAqr24o6IpdDCFzYAzk8pe1EiCM3ycQp6kz4DYatK2NTara8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718800; c=relaxed/simple;
	bh=RBKpY6uTHbNRvkc++ykcWeEmfUxZUBNwIYIcX1qKjUQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iBMDZO9CtGequoC1s2Ok0Rz+fyzEGpdJU3Llg7bgm6zqg6EEqb9j1MN1ipcJVIhh5lAaV0o3aU5uyv17j0qsLP6Uvz1Opxdu3b9UnnRn8X1SyTXgvmtVWhZfqSFD3qJeOrafLUCCR8Gj6l8XJXW1PYHBhdqXHTzsUl+qsSsxlKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c83c53216bso158935239f.1
        for <dccp@vger.kernel.org>; Wed, 06 Mar 2024 01:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709718797; x=1710323597;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7GshgTWBC/O7D9m77niat5ipmKRovvawMUZYhZfFyw=;
        b=v33Xh26zM1PGVWpchXmqds8NGKWuDYlyH1Ve/Qr3SlGFz2NUCH96LSPz/7nUOifbYt
         LnStkFJhohBJ4Yks8sRIuAZXBNDwAkD4iK9b6qNzGRTwTs/nJW3Y6Qlxx5cAf9NYApq+
         UmyReCFxVLHenmYgvla5SC8BVttmBPQBT/STn7YnnvjtVXfA//iXdqZZJ5YoRJeGpCni
         fFmxTAFg+S37zvwg4PtZPrRTBqEhwyNjpRpuhtd3hJRbqbwu6n4cJ79h58xZWFUA19EI
         UyIFpLPNGdAXZkBfqG844WrJ9/AALeX/99cdjQw6/rRUqhotm4+KAcyPgbTilHtZK145
         vD7w==
X-Gm-Message-State: AOJu0YyqBuMWDUpZ4h4xerYeNkwPCNYC7e9uxHSySbvrpYvsSJfpBTOQ
	8mEynf50lZ4701jGYbeSH5rR9JFmg2ll7m/mI/9NyqW4jHp6gjwY6Nyg17FFTWC3WuQvubMuRcg
	NCe3WiSRAipvU4X/82lhkNT8Pf/3Si9mali/Vsm9Kf7SMkr5dkk73Ka46Zg==
X-Google-Smtp-Source: AGHT+IGf+1HCcLGFBTjKehh1H4T8kt4HVAo8Zc5w6ywbaml/rk3AHPWNa1CIGOXyFav/zdeME3dCRaZTyXSttRyTgaNbk7NjStYF
Precedence: bulk
X-Mailing-List: dccp@vger.kernel.org
List-Id: <dccp.vger.kernel.org>
List-Subscribe: <mailto:dccp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dccp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:40a3:b0:474:e82a:7cec with SMTP id
 m35-20020a05663840a300b00474e82a7cecmr442251jam.1.1709718797575; Wed, 06 Mar
 2024 01:53:17 -0800 (PST)
Date: Wed, 06 Mar 2024 01:53:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009870f70612faed33@google.com>
Subject: [syzbot] Monthly dccp report (Mar 2024)
From: syzbot <syzbot+list41dc79b1e0e10a83fb37@syzkaller.appspotmail.com>
To: dccp@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello dccp maintainers/developers,

This is a 31-day syzbot report for the dccp subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dccp

During the period, 0 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 7 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 102     Yes   KASAN: use-after-free Read in ccid2_hc_tx_packet_recv
                  https://syzkaller.appspot.com/bug?extid=554ccde221001ab5479a
<2> 51      Yes   BUG: "hc->tx_t_ipi == NUM" holds (exception!) at net/dccp/ccids/ccid3.c:LINE/ccid3_update_send_interval()
                  https://syzkaller.appspot.com/bug?extid=94641ba6c1d768b1e35e
<3> 17      Yes   BUG: stored value of X_recv is zero at net/dccp/ccids/ccid3.c:LINE/ccid3_first_li() (3)
                  https://syzkaller.appspot.com/bug?extid=2ad8ef335371014d4dc7

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


Return-Path: <dccp+bounces-175-lists+dccp=lfdr.de@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C9952CCD
	for <lists+dccp@lfdr.de>; Thu, 15 Aug 2024 12:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3263F1C2098B
	for <lists+dccp@lfdr.de>; Thu, 15 Aug 2024 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28E61AC88C;
	Thu, 15 Aug 2024 10:40:27 +0000 (UTC)
X-Original-To: dccp@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1F1AC884
	for <dccp@vger.kernel.org>; Thu, 15 Aug 2024 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718427; cv=none; b=aFb7RNwWomnsuwDK6EixIN0TXoAL3+CsO5lWeTizVy85z5SB5PUxPbHS9eBvXbg+xzM/9bc8xAcOR7jm9SQ/al5hGNhm5tFLX88L7SF2yA5c71+bOBp/aSUwtff/KHRPA8MZKIvzAXV6fW2ToDHfhTsFY4OPshw4uRU9+wlaksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718427; c=relaxed/simple;
	bh=BCmmieNUI4lmEO0U6tUUzo6gPeh57OR7A4GuRgAbXMk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DfkwfI6GeZDqxSPqpO960Odj3MDZjVC52KdllSm2CSPaTdtSB+TUjXe1wwRisB1kjRYxnmfe9bTJrO9PEZjqegXP/mTBtdMGUEBwBNUogas+1BmC0X4OXWlBEzcFIMVEC6tRsUBGtEO5oF8m0W/unLcgpgTA4v8Slw2dSB1Z4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-81f8293cdb1so87295239f.2
        for <dccp@vger.kernel.org>; Thu, 15 Aug 2024 03:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723718425; x=1724323225;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Yu9jYSVcnvbxIatxBmYFvoSLSb1OU99YNJNpjw3ik4=;
        b=vQBItsydGWQHCCTKMt2MYB8nvZ6rdLiQ1IMN+4TkAsk10tPJ2C3P2krC5/uP6mVYqU
         zkXrLNv0mdkGMH059xhkIO3f+uFCrrhhGJ6VoL0GJMSkqgvbSdeMq2qpWWYGqeHcISuO
         vrmKaGNwkn+UhkU6e6P6CshyY2HZXHyvw2N/yuTpaLrjnAGC+3rnAhTxDxVZ3MLjnf4T
         7q7e6FEkkQ648cek+2UoL7eiUDypnk84gQZvSaLVfdv93e4dOMXK9zeWc1ciw/FHTKh5
         vAL7NDh3glh6QEZ+IrJmRlPe55PoId70bF4++IvTgbkVJvGnv5fqj6JLBJf9Sc1w+eK/
         y4gw==
X-Gm-Message-State: AOJu0YyN84RWrwwEwHYTk5pVS4lkM30g1rk8gsqSZS8nheZmVKdwrIYq
	l8MvryJm9pWuC0dk7/bVdHBvPVjGopldzGLBVk83+0I7WHE9ZcVmzGuIQqf3XVs0wa2xnAoFJWD
	Aj+vYI8U88vDK5ekvIs352jRkTMgpE9AUw7sHp9vJn2fMS3PIM1YGbwE=
X-Google-Smtp-Source: AGHT+IH3nDNZkdMLYskbOXMf/HRcQdTHbUXHqKTI0sYkHX84dShX8bUE0h8qfkQlgTbsvnTWT+x/goGGP9OIYUhv2rhQvB5QFE1Y
Precedence: bulk
X-Mailing-List: dccp@vger.kernel.org
List-Id: <dccp.vger.kernel.org>
List-Subscribe: <mailto:dccp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dccp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:22c3:b0:4bd:4861:d7f8 with SMTP id
 8926c6da1cb9f-4cab0a036efmr244210173.4.1723718425345; Thu, 15 Aug 2024
 03:40:25 -0700 (PDT)
Date: Thu, 15 Aug 2024 03:40:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006f9129061fb67866@google.com>
Subject: [syzbot] Monthly dccp report (Aug 2024)
From: syzbot <syzbot+listd5bb09218cb571c8dc9d@syzkaller.appspotmail.com>
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
<1> 106     Yes   KASAN: use-after-free Read in ccid2_hc_tx_packet_recv
                  https://syzkaller.appspot.com/bug?extid=554ccde221001ab5479a
<2> 57      Yes   BUG: "hc->tx_t_ipi == NUM" holds (exception!) at net/dccp/ccids/ccid3.c:LINE/ccid3_update_send_interval()
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


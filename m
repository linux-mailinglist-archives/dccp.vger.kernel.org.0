Return-Path: <dccp+bounces-174-lists+dccp=lfdr.de@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3393137B
	for <lists+dccp@lfdr.de>; Mon, 15 Jul 2024 13:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A0491C22516
	for <lists+dccp@lfdr.de>; Mon, 15 Jul 2024 11:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E6D18C16C;
	Mon, 15 Jul 2024 11:52:27 +0000 (UTC)
X-Original-To: dccp@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748AE18A950
	for <dccp@vger.kernel.org>; Mon, 15 Jul 2024 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721044347; cv=none; b=LUpWcep2ppJiKbGitFfliqg9ci6QZitK/YOjjfkEG5+ISnU92ck6LctcW51C44kf+U4Capy/O0Vp+wwF4L4YgXEZfEmoknz1HKfdS9gFd/FY0KPiz7Y3Wm8oXKONe+MGzoEE/WzOo5q3FEsCnokNrd+1rcu44g/Cz1IBuVbCuNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721044347; c=relaxed/simple;
	bh=t4pDWDgmRHlWKFeqXPZa/lEDpSFjluOZxYF9jV+3PgY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EZ4nb+kKHpjzr0lkQucP2SilreMUpyiDFWHtRXlcYlh9/JBey5xn8LNutG5sGFzpfg+OuhgPyZLUSUAM/qvS9UeZMvvYSMQGeGaFaf3kKCwKv/8+OMh7NMraY//51SiwozzH9PlyONiy0kQOTeIdgB+KI7FOkAOu8EjaUoJ6msY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-81257dec573so133994039f.0
        for <dccp@vger.kernel.org>; Mon, 15 Jul 2024 04:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721044344; x=1721649144;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lllYPE4GPyNqsW1MAxUY+CN0ZVo9aIg8GROzQIAinyo=;
        b=Xlc1b+CCm6rUYf1FR2lzdN6P3fduZvtgehZ65vOJ0vgq+QPyx3fNEHO/TZiAkl7zZv
         WlDJqhgQ/8IYbJZu0K2jKh8cusOYO77m08enbfAB/2b8aI9dPaStfOwMvKlFoGJmyjxu
         8U1ZNqRMt6XRObCjCTRWWllRKvh06A7N5aL0w/gBVbwTWedHb51vu2sl4uyruynL0JEx
         K010Ywaf8+GIhHQjw9GYqT6UvtXj3lJg5Fsg4iVmOO/upistKSFRjFyv4U/dUawvxz+x
         52FXcIL0lxMsG27H8+AGqJF77As5i7Rq4avVsUU2wuVS8jCT0RsE8rjnzPL9jdhvPVq5
         OTPw==
X-Gm-Message-State: AOJu0YwFCzS7/jnECLKgZ2LzkCdDZUyqp5lQF3Xli2n/L2FtSd0nMRVp
	EKh4KDnYOe3LmROdvaIKzFaYHlDhyKzMAuFOhELhOodg/gAueqZAGnTlgC7IN/yokmf+PE7KHMk
	Za6hRzq+477F0GzdC7mx97yqd59cBIT/O7XhSNt84iI5bn6jcqUwTNIo=
X-Google-Smtp-Source: AGHT+IEEnMX0NPtpIhNWzE9s+ZJMHHn7EnH/1HgY+OJdlyiUh10GvxgRFUmJbKaSturjGICO8+RHPXegNh9XF7g7naGO35FhIhV1
Precedence: bulk
X-Mailing-List: dccp@vger.kernel.org
List-Id: <dccp.vger.kernel.org>
List-Subscribe: <mailto:dccp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dccp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6c09:b0:7f6:2d58:8d5a with SMTP id
 ca18e2360f4ac-8000621696bmr128825539f.3.1721044344703; Mon, 15 Jul 2024
 04:52:24 -0700 (PDT)
Date: Mon, 15 Jul 2024 04:52:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cf1914061d47dc7a@google.com>
Subject: [syzbot] Monthly dccp report (Jul 2024)
From: syzbot <syzbot+listd096a34372f703f89669@syzkaller.appspotmail.com>
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
<1> 105     Yes   KASAN: use-after-free Read in ccid2_hc_tx_packet_recv
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


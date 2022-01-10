Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9805D489D4C
	for <lists+dccp@lfdr.de>; Mon, 10 Jan 2022 17:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237178AbiAJQQY (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 10 Jan 2022 11:16:24 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:36507 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237165AbiAJQQY (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 10 Jan 2022 11:16:24 -0500
Received: by mail-io1-f72.google.com with SMTP id j6-20020a6b5506000000b00601e1eac0ecso11475753iob.3
        for <dccp@vger.kernel.org>; Mon, 10 Jan 2022 08:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=+IuiwBmD1/QY3GSRuTwaawG8oRAV143g489IiDGe0jo=;
        b=m6F+m2A8+2ffFs0zJWSJs/L3itkJF86x8P5s238Zw1bc1dq4p2DKYwUdL+06LoZP6Y
         aSMDOKrLMnI90i3yVULOV3VesnezReO82ROM+J8zbJmK6zE8m0dJK0WyxB6uniQNtF+k
         vj4EH+is8XPXNqPMMyOxx1n1G6jOfbY3piLsOmmW2IJGBF38i0+SUaw6k5t4wlsLtDg9
         Vj5FnCnjrHx/Bst9+Nt+9NYNbSlJlSyjaq4g/zoxMa83nojiZSqhSRp/RCqZeJrX8lzS
         ErozN+wqzihg+PvbsC3dMXHy17cM21l8at1jmDHTRVsALE7pAqXcri60I0HillHDyIjX
         TxmQ==
X-Gm-Message-State: AOAM5322T0kkgqqeYa+OkD4tIl+z+ewZEjUbmnPaCGKyklgiaKfKq5UL
        Guy8H3T+KaGI+1cTkA2it2Q1LCOnkuu0a7h7ZuDe8UQtt3bj
X-Google-Smtp-Source: ABdhPJya6Aex3XB8Zmgqnu+l176k2/B5jS08DGhSr8A9/AG1c1V4rtY7OfzXyZvbSFkNfAdRV9eMhrVDUi8ifFOfstq6VWxhmPpp
MIME-Version: 1.0
X-Received: by 2002:a02:bb0b:: with SMTP id y11mr209283jan.286.1641831383889;
 Mon, 10 Jan 2022 08:16:23 -0800 (PST)
Date:   Mon, 10 Jan 2022 08:16:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006afc5805d53ca868@google.com>
Subject: [syzbot] BUG: "hc->tx_t_ipi == NUM" holds (exception!) at net/dccp/ccids/ccid3.c:LINE/ccid3_update_send_interval()
From:   syzbot <syzbot+94641ba6c1d768b1e35e@syzkaller.appspotmail.com>
To:     davem@davemloft.net, dccp@vger.kernel.org, kuba@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    82192cb497f9 Merge branch 'ena-capabilities-field-and-cosm..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12ec95c7b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=322a0a6462d9ff7d
dashboard link: https://syzkaller.appspot.com/bug?extid=94641ba6c1d768b1e35e
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=100ea4e3b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13977b73b00000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13698c63b00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10e98c63b00000
console output: https://syzkaller.appspot.com/x/log.txt?x=17698c63b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+94641ba6c1d768b1e35e@syzkaller.appspotmail.com

BUG: "hc->tx_t_ipi == 0" holds (exception!) at net/dccp/ccids/ccid3.c:90/ccid3_update_send_interval()
CPU: 0 PID: 29976 Comm: syz-executor890 Not tainted 5.16.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 ccid3_update_send_interval net/dccp/ccids/ccid3.c:90 [inline]
 ccid3_update_send_interval.cold+0x87/0x93 net/dccp/ccids/ccid3.c:86
 ccid3_hc_tx_update_s net/dccp/ccids/ccid3.c:169 [inline]
 ccid3_hc_tx_packet_sent+0x12e/0x160 net/dccp/ccids/ccid3.c:353
 ccid_hc_tx_packet_sent net/dccp/ccid.h:175 [inline]
 dccp_xmit_packet+0x2f2/0x750 net/dccp/output.c:289
 dccp_write_xmit+0x16d/0x1d0 net/dccp/output.c:366
 dccp_sendmsg+0x922/0xc90 net/dccp/proto.c:783
 inet_sendmsg+0x99/0xe0 net/ipv4/af_inet.c:819
 sock_sendmsg_nosec net/socket.c:705 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:725
 ____sys_sendmsg+0x331/0x810 net/socket.c:2413
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2467
 __sys_sendmmsg+0x195/0x470 net/socket.c:2553
 __do_sys_sendmmsg net/socket.c:2582 [inline]
 __se_sys_sendmmsg net/socket.c:2579 [inline]
 __x64_sys_sendmmsg+0x99/0x100 net/socket.c:2579
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f2cf5f36da9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2cf5ee4308 EFLAGS: 00000246 ORIG_RAX: 0000000000000133
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f2cf5f36da9
RDX: 0000000000000001 RSI: 000000002000bf40 RDI: 0000000000000004
RBP: 00007f2cf5fbf4c8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f2cf5fbf4c0
R13: 00007f2cf5f8c5dc R14: 00007f2cf5ee4400 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

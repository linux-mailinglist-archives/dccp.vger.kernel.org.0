Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC52610C6AC
	for <lists+dccp@lfdr.de>; Thu, 28 Nov 2019 11:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfK1KaB (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 28 Nov 2019 05:30:01 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:40868 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfK1KaB (ORCPT <rfc822;dccp@vger.kernel.org>);
        Thu, 28 Nov 2019 05:30:01 -0500
Received: by mail-il1-f198.google.com with SMTP id y3so17380850ilk.7
        for <dccp@vger.kernel.org>; Thu, 28 Nov 2019 02:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=1y+8h0adrUwE7n/UFRdlXn6lrWhJARMArZmc7WSZSbo=;
        b=hG2sUbR02V7qjMjH/NSutwNtN84y8OJcVv0x4dVMHq9Va7PvItIc4aDG4u7XRMTIwD
         7db73w05Yx4AffKgQIM3h6Z9AYg8gha8OOuCSekQYKsbvdjL9Ou7h3daOh5IIp5BCtFK
         Glj/YmCNZnF2Mm99aZnfTSxZGUc4JqKE9W7Kyx4elpEtXKRiAZ61z2VmrtfEkirbqznH
         dLTEZvP3N7ibMU0dq+VninwEsrrPdBWbh5cVr0lA6VijwI0ssm9a5KLjRTDMMAIy6xp/
         +Vu95ersBYH0xiyWoUQq9cRHjYTWQMZpG4bYgd3yPgrR9PZ3vMdZDkUl7Ab0hz90ZvwG
         Nu+g==
X-Gm-Message-State: APjAAAX5Eh+RhlxoTTlzJRJVD7c3Li7s2AfG+MQWGGZCtYWkFLrENtw1
        ArE6tqPp6v15U04Eh6cnZdLJbAbVSl5OI8GSlAfHXUpRlP+2
X-Google-Smtp-Source: APXvYqw2P2kVfRCOmAlhCFdPp4pODsE7Gp3HDeRuvO52RgpRAmsfSGU8ZjG8MAIR7k8Tm/JF3bkAGnvJEgGs1eN+T2lG1oJs2xsz
MIME-Version: 1.0
X-Received: by 2002:a02:cd31:: with SMTP id h17mr407619jaq.94.1574937000680;
 Thu, 28 Nov 2019 02:30:00 -0800 (PST)
Date:   Thu, 28 Nov 2019 02:30:00 -0800
In-Reply-To: <0000000000003872fd0568da185f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007825cd05986598e6@google.com>
Subject: Re: KASAN: use-after-free Read in ccid2_hc_tx_packet_recv
From:   syzbot <syzbot+554ccde221001ab5479a@syzkaller.appspotmail.com>
To:     alexey.kodanev@oracle.com, coreteam@netfilter.org,
        davem@davemloft.net, dccp@vger.kernel.org, dsahern@gmail.com,
        edumazet@google.com, fw@strlen.de, gerrit@erg.abdn.ac.uk,
        kadlec@blackhole.kfki.hu, keescook@chromium.org,
        kuznet@ms2.inr.ac.ru, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, soheil@google.com,
        syzkaller-bugs@googlegroups.com, yoshfuji@linux-ipv6.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

syzbot has bisected this bug to:

commit 3fa6f616a7a4d0bdf4d877d530456d8a5c3b109b
Author: David Ahern <dsahern@gmail.com>
Date:   Mon Aug 7 15:44:17 2017 +0000

     net: ipv4: add second dif to inet socket lookups

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=141e882ae00000
start commit:   b5069438 Merge branch 'stable/for-linus-4.17' of git://git..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=161e882ae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=121e882ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=982e2df1b9e60b02
dashboard link: https://syzkaller.appspot.com/bug?extid=554ccde221001ab5479a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1363ccb7800000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1272e2b7800000

Reported-by: syzbot+554ccde221001ab5479a@syzkaller.appspotmail.com
Fixes: 3fa6f616a7a4 ("net: ipv4: add second dif to inet socket lookups")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

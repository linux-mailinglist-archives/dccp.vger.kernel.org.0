Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D65F3004
	for <lists+dccp@lfdr.de>; Thu,  7 Nov 2019 14:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbfKGNmF (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 7 Nov 2019 08:42:05 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:34262 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbfKGNmF (ORCPT <rfc822;dccp@vger.kernel.org>);
        Thu, 7 Nov 2019 08:42:05 -0500
Received: by mail-il1-f198.google.com with SMTP id s17so2683126ili.1
        for <dccp@vger.kernel.org>; Thu, 07 Nov 2019 05:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=V9C3/szOLxcs/lQrxw09yt7xBy3qLGRL88aXaqrhtNg=;
        b=LepaWjICWEX2rcthduzKtHaUloIRAeZYr6zAtoMIDaVTi7Z95jgSYuIhyaiPPVyQfn
         blY1wKkwO31AlQ/hBnYzJGtDjntVR+KulV1kSb7cbaAU+JkCQ9MHILYCpv0kTLpS5cIc
         xYfr4wn0jUeA9CMEn2WSd/a+SF/imAjfoAE4h6id/Kfm2e7Jcq8UOzzbNC8QclkMx7up
         u5XxksSHzI+l80s1GrUDSJEBpwhZz5N1KGqGWYMTeB5FUPW7uCWpIIeex4K+8LLgtSSm
         TDTo+GIjv9EQ18mhOO5Ww65uAVxbV1+5YHCtoon0wzTLU57g71uiM/HcpMR5jpVpAGQ3
         bwog==
X-Gm-Message-State: APjAAAXVLx0pKO5wBzMvlmIuCBqQefBCZnTc870BM4mqo8plkYu5P1pn
        Z2XT72Eo94ft+cwWWg1kOYq8yXoW8Ydg4OYOVAzQ1O12Sekt
X-Google-Smtp-Source: APXvYqxCUbUYzo+u5rS8f2qDgRbx0mqmdassnoPfmOY5Y2vuj78n07nSmrMgM7MJp/uItBjNn+rZa528BFNhpP5yPG6wP1qdX+ZU
MIME-Version: 1.0
X-Received: by 2002:a6b:ba44:: with SMTP id k65mr3353167iof.190.1573134124463;
 Thu, 07 Nov 2019 05:42:04 -0800 (PST)
Date:   Thu, 07 Nov 2019 05:42:04 -0800
In-Reply-To: <001a1140ad88c4f006055d3836d2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ac3e9d0596c1d4fe@google.com>
Subject: Re: suspicious RCU usage at ./include/net/inet_sock.h:LINE
From:   syzbot 
        <syzbot+79de6f09efc55fec084b706de3c91e9457433ac5@syzkaller.appspotmail.com>
To:     davem@davemloft.net, dccp@vger.kernel.org, dvyukov@google.com,
        ebiggers3@gmail.com, gerrit@erg.abdn.ac.uk, jon.maloy@ericsson.com,
        kuznet@ms2.inr.ac.ru, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, parthasarathy.bhuvaragan@ericsson.com,
        syzkaller-bugs@googlegroups.com,
        tipc-discussion@lists.sourceforge.net, ying.xue@windriver.com,
        yoshfuji@linux-ipv6.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit 3f32d0be6c16b902b687453c962d17eea5b8ea19
Author: Parthasarathy Bhuvaragan <parthasarathy.bhuvaragan@ericsson.com>
Date:   Tue Sep 25 20:09:10 2018 +0000

     tipc: lock wakeup & inputq at tipc_link_reset()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1368cfa2600000
start commit:   464e1d5f
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=bace9f7ec244b823
dashboard link:  
https://syzkaller.appspot.com/bug?extid=79de6f09efc55fec084b706de3c91e9457433ac5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126079e1800000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101499e1800000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: tipc: lock wakeup & inputq at tipc_link_reset()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

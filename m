Return-Path: <dccp+bounces-208-lists+dccp=lfdr.de@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF197973C
	for <lists+dccp@lfdr.de>; Sun, 15 Sep 2024 16:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698942823D8
	for <lists+dccp@lfdr.de>; Sun, 15 Sep 2024 14:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846E11C6F53;
	Sun, 15 Sep 2024 14:39:24 +0000 (UTC)
X-Original-To: dccp@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C52CA6
	for <dccp@vger.kernel.org>; Sun, 15 Sep 2024 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726411164; cv=none; b=eezhdNPfXQeYih2eQQK2F0XgvT/W+DbEVCdMuWxVNgkQDM4Ufw0mKkh7+15OFGQrZHdiSMNno5YBV4mJhDHyE2E1QRgHGoax4nDafe4IL+bGoqFxbUi5A2wlXGDpF2eltYLFlDnuksv9szEaiAZJAV+zcaw/wY/gjqJJVGUZJrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726411164; c=relaxed/simple;
	bh=sP4jgrmmfEBdugsBMtTm54HDqgh+RebnBva5M7bLO8k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PmmqAYncISh8QhfUEiSJf0pDoflG+wx1H9Aa0yaz+KlaYhjNo+bcpeE9oIViquKqa68+uCkbWGqpSq9fS1Fqg6UdafLD2l8ehmGuUThG8kNfKI768Rz1ygDkwYo24GOgnW7vX+tLVDTiDwtkwKhwfUCfe900uCUqK8KQO3jacd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a04c2472f6so63255575ab.0
        for <dccp@vger.kernel.org>; Sun, 15 Sep 2024 07:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726411162; x=1727015962;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRoQrrO88SaCzlahLfAtzhw8yyIVL+w80a86nD+hlh4=;
        b=UN8QTiJU9eFBlV+WHoiKHtXGSYCFQ6eMz24+56JP46XnGHbqYY/kT0Sid6xUoZEav2
         2E2IfEzs9ayFQvf23MlGgfCte9iugp+km1dvcz3+3uJGsyNbgjiTkYSiuMU706iud3ZW
         TZ9C0saMonS7my9hJMhPi5dYxv9YUEgn+ESeV5qqqShdcRDUoDAOBYat50s/OizSUjs/
         maC+no8qNA8XcckXAzxb00lqhOC8q5Zt1jCR6XCvfOlGr4rxTfWV/FlzkZsP0Fgafwg4
         ZKSikoxVBQdpA2b/JHa1gvhDqnJkgh3LMQvfIvZr52W6KT2o53ttNqpFP+lxP7dNdovw
         4hgg==
X-Gm-Message-State: AOJu0YxreT3pGl4fpG1TjPTvt0WtennU52vAYpiTE+i4ckdySvsV2+CS
	mkZe4wrrLSvl58AKZ6JcCgIs3kiCQtz8FoziQgnl7cB44Y/zAONVwYJa3Njchu1T5cNmMJRHqXc
	rhCaJNQLmhqE8KK9Pb+kcHRZDFcd5jUpPP2tc9Bw8khgG2k8qRYtkI9E=
X-Google-Smtp-Source: AGHT+IGmQKXv+bq140njVGpBEWOL2SN219VKri4+PIWgXDGb33Z1C7b6Xke3DzLHhzJod9BEerJISpoK8t5gpvnkw8OmJ2ay6r5n
Precedence: bulk
X-Mailing-List: dccp@vger.kernel.org
List-Id: <dccp.vger.kernel.org>
List-Subscribe: <mailto:dccp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dccp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1543:b0:3a0:4a91:224f with SMTP id
 e9e14a558f8ab-3a08b6f87edmr83293015ab.1.1726411162152; Sun, 15 Sep 2024
 07:39:22 -0700 (PDT)
Date: Sun, 15 Sep 2024 07:39:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000e9a0e0622296c4c@google.com>
Subject: [syzbot] Monthly dccp report (Sep 2024)
From: syzbot <syzbot+list8e7646c17f00ffb612e5@syzkaller.appspotmail.com>
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
<1> 107     Yes   KASAN: use-after-free Read in ccid2_hc_tx_packet_recv
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


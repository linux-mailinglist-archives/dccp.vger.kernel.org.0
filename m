Return-Path: <dccp+bounces-151-lists+dccp=lfdr.de@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B868F8C5C79
	for <lists+dccp@lfdr.de>; Tue, 14 May 2024 22:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E96801C209F8
	for <lists+dccp@lfdr.de>; Tue, 14 May 2024 20:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504D814532B;
	Tue, 14 May 2024 20:49:36 +0000 (UTC)
X-Original-To: dccp@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7B1DFD1
	for <dccp@vger.kernel.org>; Tue, 14 May 2024 20:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715719776; cv=none; b=hGT+bPHw0Tja85w59bzz+3ofjaXmHKgpjd9vXyWtJtffK2jmzWogsso4Nboz2b6HpHgwrOUZ3FYnMNmkL1Cc4CcdA/ffNMASpOPn6wI4JderGM4zHvb7R9x80yqVSIoadCOJqsmT7qd1oxiRQCFPROrVu4hBCM7HkygvXZxXVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715719776; c=relaxed/simple;
	bh=IB69RAvqCOdOjg7nFJ4PG6OHmguovls0NLwI8SN34WY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VuvDc2hSUcBM6jYKFg+Oj6UETxF/oZ2ZYaXXQg8LF7J83Y6dNs5A/CRivwZaH1up562V/RGbLhxvyd+awgNperLRi3E6KU3CyAunyjTGEkq7zcVJ8zHLjJgYhIh7vMHKjOR5O5GzHO1YG/qtLhMlZWZfvGDDi9DjFS6x+3VdZME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36c886d0955so63439535ab.2
        for <dccp@vger.kernel.org>; Tue, 14 May 2024 13:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715719774; x=1716324574;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVqW8S3ABFDk/zNJBkMLpZFKRsCOqY4qSaDAmMCsU4E=;
        b=U2CjhllhVpY83Nlp2XcskVERsWhQNnULzZkEikildtqldz8KnQTyBUfBYgtkXJADgN
         68fi2QDfrGiFeLldAYyQDy2osWuYa3QFJ+GE2INbTzEwRMY5imA+jebywZRhfDR9EuHH
         IyoMJYesnhMuBGMBD777Dpi1X30TQgIUYx4RnbkXpjXZ1hzMnZ4jJkDqRaYiWkqG/ygF
         HW37xupiMYSNvD74QINtkVMe65xPye8z86VYtRyRuHE5/CmLOEF71Ll1ax3o1TeP3Y6L
         G13fWPFj+ROD6qjciFAsa7WamSr2FHxTRkpb3qHj09rpfwQSa9rEnE8lRGQg9IGBBgjj
         uyIQ==
X-Gm-Message-State: AOJu0YzjKMmYtAdskDjTEHWPT4H54UKzi4ExEPNuf31CoQv+8n2BFc6C
	iBRwvVldniiUTU3ch2elKJw0bDKbzvXtjF3opnGATQuVvVICu1OCT1/ODRpIQo5qdgcLRtJI3gq
	trXQHxY9RlzbTHt5BKl8hiFPTRBopEjMkPwmpxoaPkZh1AWZkKSRDC/8=
X-Google-Smtp-Source: AGHT+IHADF36HovZ4nEix/LNsmP7MIKXZTsQIoDpi9OF/S8o9O2BkcW3OdPN5ChDi98azQ4YeENsmszraj19HOLTwdeh6PAXoVX0
Precedence: bulk
X-Mailing-List: dccp@vger.kernel.org
List-Id: <dccp.vger.kernel.org>
List-Subscribe: <mailto:dccp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dccp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ad01:0:b0:36a:63dc:2009 with SMTP id
 e9e14a558f8ab-36cc1436c0fmr3440275ab.1.1715719774152; Tue, 14 May 2024
 13:49:34 -0700 (PDT)
Date: Tue, 14 May 2024 13:49:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ac3c84061870238f@google.com>
Subject: [syzbot] Monthly dccp report (May 2024)
From: syzbot <syzbot+list962db2fd5c4970f5379c@syzkaller.appspotmail.com>
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


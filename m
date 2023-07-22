Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C17575DCDC
	for <lists+dccp@lfdr.de>; Sat, 22 Jul 2023 16:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjGVOK7 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sat, 22 Jul 2023 10:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjGVOK7 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sat, 22 Jul 2023 10:10:59 -0400
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD87F2D53
        for <dccp@vger.kernel.org>; Sat, 22 Jul 2023 07:10:57 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-39cdf9f9d10so5376453b6e.3
        for <dccp@vger.kernel.org>; Sat, 22 Jul 2023 07:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690035057; x=1690639857;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jE88Sg/HkvkvrZgXmJzjM5EFv0iGLJWGouDm2D6gBG0=;
        b=IAsXhw8Ed7B4TMlhPQFxnJ0EJB1DDLDSPC1TwHS8XlrY7BS41lGV+6G5MltAWPpYDN
         ZmoxQ+IzPEZzvTFR0aD2/mGGw4kDUwhSkd2nGvIe+tNmHlNRqQ5IEGp2rZiT+yKCDL56
         FzWA1AsJrqJuNMTuU5p2s2IdS784x9metR3AJdR1MChrfIwKEORnEC0N5SwNUMxWiH/i
         7i2UQJ2YvhotDmfBEtf224hyxWyMekc74/dNWZ3GtNeN0ZizFtKHq4kHZk1MsC4hPmop
         o1fEq7l1uJudKgue+61Y2sWEijx7eW7RP6DI9gXPzGtyXsYsj96CFJ3G6gCH1lew74O4
         RgYg==
X-Gm-Message-State: ABy/qLYBgKamMzskdvhYPjGm18Tgnwktt/zX0eDnIVm7YSmMMvR/2+Ao
        huALiWDt67sw+lfw9P7lUqpulg52rB4buV1jscHtHP/sXntWUtY=
X-Google-Smtp-Source: APBJJlHNcjzpmR2IYLssdl8GbcS097gsETsQPbM2yG7animODfDOsG8U/I/F8z/rynn2gmwAZpRYWKSmMXAhkleVkG598/twLkZ7
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f11:b0:3a1:f3ed:e9e with SMTP id
 m17-20020a0568080f1100b003a1f3ed0e9emr9991915oiw.3.1690035057187; Sat, 22 Jul
 2023 07:10:57 -0700 (PDT)
Date:   Sat, 22 Jul 2023 07:10:57 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003de1ad060113f3d3@google.com>
Subject: [syzbot] Monthly dccp report (Jul 2023)
From:   syzbot <syzbot+listd0be519e02c69d098715@syzkaller.appspotmail.com>
To:     dccp@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello dccp maintainers/developers,

This is a 31-day syzbot report for the dccp subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dccp

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 4 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 102     Yes   KASAN: use-after-free Read in ccid2_hc_tx_packet_recv
                  https://syzkaller.appspot.com/bug?extid=554ccde221001ab5479a
<2> 47      Yes   BUG: "hc->tx_t_ipi == NUM" holds (exception!) at net/dccp/ccids/ccid3.c:LINE/ccid3_update_send_interval()
                  https://syzkaller.appspot.com/bug?extid=94641ba6c1d768b1e35e
<3> 9       Yes   BUG: stored value of X_recv is zero at net/dccp/ccids/ccid3.c:LINE/ccid3_first_li() (3)
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

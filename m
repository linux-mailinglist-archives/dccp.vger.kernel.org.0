Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC7E28D303
	for <lists+dccp@lfdr.de>; Tue, 13 Oct 2020 19:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgJMRS4 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 13 Oct 2020 13:18:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59997 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgJMRS4 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 13 Oct 2020 13:18:56 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kleber.souza@canonical.com>)
        id 1kSNws-0004AW-O9
        for dccp@vger.kernel.org; Tue, 13 Oct 2020 17:18:54 +0000
Received: by mail-ej1-f69.google.com with SMTP id p19so39372ejy.11
        for <dccp@vger.kernel.org>; Tue, 13 Oct 2020 10:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z/aFQntV5BEuLQOersUesePgf9vJOqG7JddMqo5PmOE=;
        b=qZUt76OR0nygG2rthvNnTfycl+bNy2UYbm/rLjrllOtEQ7BVZvosF2s5HqsYaYT+xU
         WIYA5Pgz7zfCj0liup8DdP+ZUUwog+mhNQLyhZwIjV5ZnhKuuz8j1gsYg/QHZL9ibRId
         IBV06tllgcndtydAMRsg/+YPGN0wkS/Odz2hbBJ0XmSv/ZHrVjGp4/kpMYY0gPXlEiXE
         JHvdtmRk0ohgdGM/i6as3zei09ec/4HvAnYUtM/AH/1hfmK42tFSUhOi1KrQf+I3IHOz
         7TQIeIZFLNHuXLMBkEp4d637HAzrHo696EabcXp2PMlRYUcXgnjN/mdTnEN8Cw7ry98o
         zrVA==
X-Gm-Message-State: AOAM5313YLYrURuVICrJUgQD/bNSpizE4br5ofDfPXh0LTMjBHuE4riP
        nX3YllVU1Vu0tXRGcF5KTFtmDsVZ3YQbgIWfw5uHi3UmzJUFU072pXbVn28uXTXu6GdrLQ/aywD
        IFe6u8kJnGqMo772Ke6U0UR/fxauPqOE=
X-Received: by 2002:a17:906:aecf:: with SMTP id me15mr781857ejb.423.1602609534372;
        Tue, 13 Oct 2020 10:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9pvtKKURjp2ug1Z4ZJd2hmab2EjAkSsdGoOmFWxQUGirumG8Fv5V+n0z6JDMIK5vb6vlaRg==
X-Received: by 2002:a17:906:aecf:: with SMTP id me15mr781824ejb.423.1602609534064;
        Tue, 13 Oct 2020 10:18:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:4640:10c0:6cbe:6d37:31ed:e54b])
        by smtp.gmail.com with ESMTPSA id g9sm192776edv.81.2020.10.13.10.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:18:53 -0700 (PDT)
From:   Kleber Sacilotto de Souza <kleber.souza@canonical.com>
To:     netdev@vger.kernel.org
Cc:     Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Kees Cook <keescook@chromium.org>,
        Eric Dumazet <edumazet@google.com>,
        Alexey Kodanev <alexey.kodanev@oracle.com>,
        dccp@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] net: dccp: fix structure use-after-free
Date:   Tue, 13 Oct 2020 19:18:47 +0200
Message-Id: <20201013171849.236025-1-kleber.souza@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

This patchset addresses the following CVE:

CVE-2020-16119 - DCCP CCID structure use-after-free

Hadar Manor reported that by reusing a socket with an attached
dccps_hc_tx_ccid as a listener, it will be used after being released,
leading to DoS and potentially code execution.

The first patch moves the ccid timers to struct dccp_sock to avoid its
use-after-free, the second patch reverts 2677d2067731 "dccp: don't free
ccid2_hc_tx_sock struct in dccp_disconnect()" that's not needed anymore
and would cause another use-after-free.

Thadeu Lima de Souza Cascardo (2):
  dccp: ccid: move timers to struct dccp_sock
  Revert "dccp: don't free ccid2_hc_tx_sock struct in dccp_disconnect()"

 include/linux/dccp.h   |  2 ++
 net/dccp/ccids/ccid2.c | 32 +++++++++++++++++++-------------
 net/dccp/ccids/ccid3.c | 30 ++++++++++++++++++++----------
 net/dccp/proto.c       |  2 ++
 4 files changed, 43 insertions(+), 23 deletions(-)

-- 
2.25.1


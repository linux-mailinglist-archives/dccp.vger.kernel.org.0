Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797D574C124
	for <lists+dccp@lfdr.de>; Sun,  9 Jul 2023 07:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbjGIFpn (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sun, 9 Jul 2023 01:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjGIFpj (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sun, 9 Jul 2023 01:45:39 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C52E48
        for <dccp@vger.kernel.org>; Sat,  8 Jul 2023 22:45:38 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-78f554d4949so1046008241.3
        for <dccp@vger.kernel.org>; Sat, 08 Jul 2023 22:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688881537; x=1691473537;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4kWzn6pxkecn7JMiXg/VymW/f2W9szhFxBJtG2FdMw=;
        b=pDt9bsyjKi1uSsC43A4SS5MjXoABZdsdUQSTDi6Av/72kHEPETZmBnLIOSbO4tVdZ3
         cIxqXDDhhZiPhR0ytXQ2ocOy/xRECnbWjVEZL5iokcSMvJ6BoODF5+dsnE/VDbyibnHx
         lSUWfVAnKK/xiy39GiUmq1Zrk7x1Rgl0yuv2rcO42YMGZABF3d04tTjNbLCLSw3QBhNN
         Psnsz4kHb87Ykby/zsR0wyKuxZSMoV86cCxn425yVxTN9mAXqtZlnLWx81YqEw0wLGjB
         /5zxxfFnEy47LNWJPyJHfkV85nUphCQkR8qrK/H4Eu2c9QgPcqfTsldaSQ7t2nbF0tHr
         2NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688881537; x=1691473537;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4kWzn6pxkecn7JMiXg/VymW/f2W9szhFxBJtG2FdMw=;
        b=IJcMe9pjSBF73yClEiixdF4nvgI1kzMClWiAygdRkY0P9JCVep3sALihqYmWiOckCO
         3cRcgHTzoQIuALSEMazeTW2u7YaANSNIpgfKdU84c8OhJbKy9s3V+5r4iQHKSgvDR9oi
         c0sd9RxBE5W70myj5IehOqpJD++gz1B8nj73wQsOW9EnD65xY87ZT72/T76k84allbCf
         PxSvwxeBEttnwenM7Pr+hlwof0m9H+uweYdFsGZ6rM5UsDhXdxZHkXQ6a0wKSGTSOU+5
         RPWpUTEMz7I7yrkPeLvwYHmJcc4wXe+mjaWxGIe05xRglx6dSwlXuGqGkS5X9A2YMR5W
         hpfg==
X-Gm-Message-State: ABy/qLZaaXdqeWvVFTnnGCy/e7eWkXYmvDk4bic/Wfep7tqrRT3higcM
        lZN6yzfpydfIOMN4YSgsn1WpUQTU10HGEbxERpE=
X-Google-Smtp-Source: APBJJlHnG6ScjE3Yv3gPdNChLz6A0gHsXj/fVe88dzGHUe0Y7qMQoJTImKZ8neemMgAdWemtZJnTs9u6Il4WDB1ra78=
X-Received: by 2002:a67:e34b:0:b0:444:c49c:a95d with SMTP id
 s11-20020a67e34b000000b00444c49ca95dmr4736157vsm.7.1688881537255; Sat, 08 Jul
 2023 22:45:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2443:0:b0:786:668c:c4ea with HTTP; Sat, 8 Jul 2023
 22:45:36 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly81.info@gmail.com>
Date:   Sun, 9 Jul 2023 05:45:36 +0000
Message-ID: <CAJws7ADKwOw4vTWyX8D5jQkiyDvtZxu-cMd0x_zRhRjjsGi+MA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Dear ,

Please grant me the permission to share important discussion with you.
I am looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs. Nina Coulibaly

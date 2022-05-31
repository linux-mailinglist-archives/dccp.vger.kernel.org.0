Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A119B539952
	for <lists+dccp@lfdr.de>; Wed,  1 Jun 2022 00:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348308AbiEaWEs (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Tue, 31 May 2022 18:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347523AbiEaWEr (ORCPT <rfc822;dccp@vger.kernel.org>);
        Tue, 31 May 2022 18:04:47 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D962F9C2CD
        for <dccp@vger.kernel.org>; Tue, 31 May 2022 15:04:46 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id w2so4561941ybi.7
        for <dccp@vger.kernel.org>; Tue, 31 May 2022 15:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tFkrwhqVchKldB/4jas7UgIJBTUliw27Vbsv32SH+8=;
        b=l04EUNe5705ARgKl9NFJEeXLPc9vUjgai4XVpiyBvU/fPCzZrL1M9OnLEnM79kayQV
         GL65SOmDmldDJKndhWqCyCuJaqhqEB2JLaHThO8aKxpJ9NBp1CyGcPd13APIYRUQ1tiR
         ank09vWOvhuhuVzZccZQFytX4VUIqMMgAnVd/PRVwTsGPR3VqDQmIBYIZwIfmfQpOAjY
         +KhT7xcRNK4kdoul+LbUh1uDHTjbOKodUA59pNuBVVS7pTBFSlO5UY6RYL+QmT+vlfm4
         v4w0VdJWnD+70vaIt+wQr+YnTlMf0ka7D2J/Mx59JstUPEqrcpi7BAvqupe8TNuv3DUY
         Y09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tFkrwhqVchKldB/4jas7UgIJBTUliw27Vbsv32SH+8=;
        b=Lg7yV1RfNWdkF3BFDQC/7DTay9HssFUWt3aDHcMrr3fthkOseHaW0hAtZUGi8i+qM1
         h0hFKQVP3LeoGzRK5IUjbarkz/bzSoYdZmNe/I/aGgi4s+JNTIktosfuFPz0Vwsf68uW
         iqWVsBwivs0qTDptjZLSFBZ01j9lRU4d63bEqLUMJ4QFKnplEsaAg3vxTk/p3b3+l7HC
         sLUifgcWLBfU01G/DJZpvLShGIr/FCBxoE842Jlj0BBD0hHND8/SLEj73Vlk1Rq4F52r
         DI2hx3UAnUbE41t8EP6wK4OOqGbTTjmEc6oikCIFhRvdD71Ze/91HiD2CW+yPZG41Cfo
         ZECA==
X-Gm-Message-State: AOAM531uEQ3czvAuwR+WI3c+NpJGew71j5TNU6QnH+3ezCd9fg5o9FUI
        h6cKZGSXzGGI4fjtbruLiWIO46FItTeq2Cm4dT/JSg==
X-Google-Smtp-Source: ABdhPJywRuGYPTVD0zI+ijOluT6NTQHJERO1wgN0joG82CRywpBmGOD+X6ACHMkgziA7eIJZMht9tNDGKVmzX6iqmM8=
X-Received: by 2002:a25:c0d4:0:b0:65d:61f:8ded with SMTP id
 c203-20020a25c0d4000000b0065d061f8dedmr10155960ybf.407.1654034685818; Tue, 31
 May 2022 15:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220524230400.1509219-1-joannelkoong@gmail.com> <20220524230400.1509219-2-joannelkoong@gmail.com>
In-Reply-To: <20220524230400.1509219-2-joannelkoong@gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 31 May 2022 15:04:34 -0700
Message-ID: <CANn89i+pg8guF+XeOngSMa4vUD81g=u-pCBpi0Yp2WB9PQZvdg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/2] net: Update bhash2 when socket's rcv
 saddr changes
To:     Joanne Koong <joannelkoong@gmail.com>
Cc:     netdev@vger.kernel.org, kafai@fb.com, kuba@kernel.org,
        davem@davemloft.net, richard_siegfried@systemli.org,
        dsahern@kernel.org, pabeni@redhat.com, yoshfuji@linux-ipv6.org,
        kuniyu@amazon.co.jp, dccp@vger.kernel.org, testing@vger.kernel.org,
        syzbot+015d756bbd1f8b5c8f09@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Tue, May 24, 2022 at 4:20 PM Joanne Koong <joannelkoong@gmail.com> wrote:
>
> Commit d5a42de8bdbe ("net: Add a second bind table hashed by port and
> address") added a second bind table, bhash2, that hashes by a socket's port
> and rcv address.
>
> However, there are two cases where the socket's rcv saddr can change
> after it has been binded:
>
> 1) The case where there is a bind() call on "::" (IPADDR_ANY) and then
> a connect() call. The kernel will assign the socket an address when it
> handles the connect()
>
> 2) In inet_sk_reselect_saddr(), which is called when rerouting fails
> when rebuilding the sk header (invoked by inet_sk_rebuild_header)
>
> In these two cases, we need to update the bhash2 table by removing the
> entry for the old address, and adding a new entry reflecting the updated
> address.
>
> Reported-by: syzbot+015d756bbd1f8b5c8f09@syzkaller.appspotmail.com
> Fixes: d5a42de8bdbe ("net: Add a second bind table hashed by port and address")
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumzet@google.com>

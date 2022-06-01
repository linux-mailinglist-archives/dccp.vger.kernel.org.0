Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3049C53A16B
	for <lists+dccp@lfdr.de>; Wed,  1 Jun 2022 11:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350616AbiFAJ6b (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 1 Jun 2022 05:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351561AbiFAJ62 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 1 Jun 2022 05:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 322A18CB36
        for <dccp@vger.kernel.org>; Wed,  1 Jun 2022 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654077500;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=82uW6EP3zc+L57WVwLvvIjr2wDUWz17pBSLf4qWZW8w=;
        b=Y4MSv4IIv8heMAaa/bBCJYn9qPdz91I2JBh3nKAwZ8N/Cp3UteHBQpdSY39HkcbhjdOcxF
        usgva0ys6WyeRVqOTYR+zdl6OP9saA8Pouo1WQHhAYl1vDoxw6HQEJTOGbUuxVHocKF+RO
        u8CY7lbxXnfpCacxXN+pqvHNZpR1vYw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-lvUbiEOZOnOMG5I-tVWkWg-1; Wed, 01 Jun 2022 05:58:17 -0400
X-MC-Unique: lvUbiEOZOnOMG5I-tVWkWg-1
Received: by mail-qt1-f198.google.com with SMTP id t8-20020a05622a180800b00304bc431155so876094qtc.21
        for <dccp@vger.kernel.org>; Wed, 01 Jun 2022 02:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=82uW6EP3zc+L57WVwLvvIjr2wDUWz17pBSLf4qWZW8w=;
        b=oVThP5BaeeXpjbMa//SB3+ShygZvgw8/LUc9XRf9W0Iza5nE4FDv/tBYl9ndwy+8HV
         3hiVDXLhRd4l7sTC1N+8KvA5LrkBgcQrADyHSKd4UUWScvn5HdFm+/cKqwjHiEvxrLnZ
         DuMpjM0gGimLT2rpHJ3JFkILiqyEKj3OY85MxyLs5z9LrqR8zQyDo2eJ1NnjrPC3fB3f
         5wF4fdhQf5akLw8R7MyywEaODV5O1Ej9SQ5UpU4B/rHVeN1P/ChI4lQHxVEfUO6bhayh
         +7m6vmJLoVO25UpoppSHWioRVSy0aFqCLn035D7nhq3m57zUT1OBQtPYj4VtUVQuVXhI
         ZcNg==
X-Gm-Message-State: AOAM530DMQNU0D2XWk/7s7v5nhM/+i7O26oMIJ6gVAmOC4Bv9amzlb7X
        mYON6LKvS3o828K7C8iyax5nMr/jqbBk7/C5xDh42rYau6Ry44f5Hy02JHVD4ItW/8+heiYxKqv
        PLriAdohf8bhpYA==
X-Received: by 2002:ac8:5a07:0:b0:2f9:3f44:cbf2 with SMTP id n7-20020ac85a07000000b002f93f44cbf2mr35438350qta.374.1654077496977;
        Wed, 01 Jun 2022 02:58:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUM/uH1EMfzyt/oe9dsKBoDbn6qxA8RvrUjHsiO/kb+dC9J0+cArxgPflsfnYB9Tt0pc3J3A==
X-Received: by 2002:ac8:5a07:0:b0:2f9:3f44:cbf2 with SMTP id n7-20020ac85a07000000b002f93f44cbf2mr35438335qta.374.1654077496724;
        Wed, 01 Jun 2022 02:58:16 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it. [146.241.112.184])
        by smtp.gmail.com with ESMTPSA id z24-20020ac84558000000b002f918680d80sm837267qtn.78.2022.06.01.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:58:16 -0700 (PDT)
Message-ID: <5e8ccf5fb949fb8bef822f379f7a410ccd6b6f41.camel@redhat.com>
Subject: Re: [PATCH net-next v1 1/2] net: Update bhash2 when socket's rcv
 saddr changes
From:   Paolo Abeni <pabeni@redhat.com>
To:     Eric Dumazet <edumazet@google.com>,
        Joanne Koong <joannelkoong@gmail.com>
Cc:     netdev@vger.kernel.org, kafai@fb.com, kuba@kernel.org,
        davem@davemloft.net, richard_siegfried@systemli.org,
        dsahern@kernel.org, yoshfuji@linux-ipv6.org, kuniyu@amazon.co.jp,
        dccp@vger.kernel.org, testing@vger.kernel.org,
        syzbot+015d756bbd1f8b5c8f09@syzkaller.appspotmail.com
Date:   Wed, 01 Jun 2022 11:58:12 +0200
In-Reply-To: <CANn89i+pg8guF+XeOngSMa4vUD81g=u-pCBpi0Yp2WB9PQZvdg@mail.gmail.com>
References: <20220524230400.1509219-1-joannelkoong@gmail.com>
         <20220524230400.1509219-2-joannelkoong@gmail.com>
         <CANn89i+pg8guF+XeOngSMa4vUD81g=u-pCBpi0Yp2WB9PQZvdg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

Hello,

On Tue, 2022-05-31 at 15:04 -0700, Eric Dumazet wrote:
> On Tue, May 24, 2022 at 4:20 PM Joanne Koong <joannelkoong@gmail.com> wrote:
> > 
> > Commit d5a42de8bdbe ("net: Add a second bind table hashed by port and
> > address") added a second bind table, bhash2, that hashes by a socket's port
> > and rcv address.
> > 
> > However, there are two cases where the socket's rcv saddr can change
> > after it has been binded:
> > 
> > 1) The case where there is a bind() call on "::" (IPADDR_ANY) and then
> > a connect() call. The kernel will assign the socket an address when it
> > handles the connect()
> > 
> > 2) In inet_sk_reselect_saddr(), which is called when rerouting fails
> > when rebuilding the sk header (invoked by inet_sk_rebuild_header)
> > 
> > In these two cases, we need to update the bhash2 table by removing the
> > entry for the old address, and adding a new entry reflecting the updated
> > address.
> > 
> > Reported-by: syzbot+015d756bbd1f8b5c8f09@syzkaller.appspotmail.com
> > Fixes: d5a42de8bdbe ("net: Add a second bind table hashed by port and address")
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> 
> Reviewed-by: Eric Dumazet <edumzet@google.com>
> 
Apparently this patch (and 2/2) did not reach the ML nor patchwork (let
alone my inbox ;). I've no idea on the root cause, sorry.

@Joanne: could you please re-post the series? (you can retain Eric's
review tag)

Thanks!

Paolo


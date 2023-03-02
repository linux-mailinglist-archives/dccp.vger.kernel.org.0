Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5ED86A8423
	for <lists+dccp@lfdr.de>; Thu,  2 Mar 2023 15:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjCBO2a (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Thu, 2 Mar 2023 09:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjCBO22 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Thu, 2 Mar 2023 09:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CFF460BF
        for <dccp@vger.kernel.org>; Thu,  2 Mar 2023 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677767262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pTxrMJqUyW4X5SCAWi1tkS9ixIAshryWM3VoKDkX6js=;
        b=Z7gER4/6Vuf/GHD7MViWLAbXotaDJamILFUBKvmMDqUa48BCRRmyUE+ZlaDiSS6QMyrmRI
        imbaTCOTgNrj0KU2PyYDmQH5rI2TObkMCJv/YmrBJSa6/hxlOovGD3PB54iGBrlo9v7FBR
        GS5pN1elC4isWeE/ONpdTmhw2t67DJY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-MJrnz3d9OV-mNYrq9ZK-Bw-1; Thu, 02 Mar 2023 09:27:41 -0500
X-MC-Unique: MJrnz3d9OV-mNYrq9ZK-Bw-1
Received: by mail-wr1-f72.google.com with SMTP id bh3-20020a05600005c300b002c70d6e2014so3286318wrb.10
        for <dccp@vger.kernel.org>; Thu, 02 Mar 2023 06:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677767260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTxrMJqUyW4X5SCAWi1tkS9ixIAshryWM3VoKDkX6js=;
        b=TalzTxEnBDz95h9jhnCMReRSr2Py/a3239MB5JZbnLOCMk9AbSLi/8EUF+nc67zCYX
         55vAON4oRut3iZO/9lTJsCKHaKoxB41j6bXytwkoo2/qfLwrOOUxsYBjNQfnrx3qOgO4
         h1uV5mrWXcp70cSZoIu3ysOoDJ8XFTAjSpi+V8mOFfYbtF8D2t90N0vgKLtD5LB/diHq
         U1n97ctDHBUBT/WztCt/ysGmyBJqnbS0cJlNejk3kQr/tdg1E6Php9fRi+Slfp12Bpkl
         W89YwShC634h/BtvJNnpZr+6oQMNQVt5hRp88MhpRa8Ffmg8VNy4lIJXb+QjoDygJ9yk
         ae5g==
X-Gm-Message-State: AO0yUKUY9a1HIccUKi7HOByqqLtH4+2zGSrPE4OMgz70bfIz7GUfIb1X
        IoE5atZ7o1WIpuWNUGzd04KOp8C+RgkkkdjRi5gmHinNvkPUdsiKM8hdo6qlxgx1Dndhqm2BuA5
        SEDS8UoXV39EEBA==
X-Received: by 2002:a05:600c:458d:b0:3eb:3986:9c03 with SMTP id r13-20020a05600c458d00b003eb39869c03mr8498376wmo.4.1677767260316;
        Thu, 02 Mar 2023 06:27:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+XDEBpfqMsm8FydffGycIJMdGzutQxMCWN0tEeXrxStr12oOQQkJvky6L4STooei6BkfnzOQ==
X-Received: by 2002:a05:600c:458d:b0:3eb:3986:9c03 with SMTP id r13-20020a05600c458d00b003eb39869c03mr8498350wmo.4.1677767260037;
        Thu, 02 Mar 2023 06:27:40 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c0a0700b003dc434b39c7sm8090637wmp.0.2023.03.02.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 06:27:39 -0800 (PST)
Message-ID: <3dc0b4652c04c508b21f2028a20b7f81387c7fd4.camel@redhat.com>
Subject: Re: [PATCH] [net:netfilter]: Keep conntrack reference until IPsecv6
 policy checks are done
From:   Paolo Abeni <pabeni@redhat.com>
To:     Madhu Koriginja <madhu.koriginja@nxp.com>, gerrit@erg.abdn.ac.uk,
        davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        edumazet@google.com, dccp@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vani.namala@nxp.com
Date:   Thu, 02 Mar 2023 15:27:37 +0100
In-Reply-To: <20230302112324.906365-1-madhu.koriginja@nxp.com>
References: <20230302112324.906365-1-madhu.koriginja@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Thu, 2023-03-02 at 16:53 +0530, Madhu Koriginja wrote:
> Keep the conntrack reference until policy checks have been performed for
> IPsec V6 NAT support. The reference needs to be dropped before a packet i=
s
> queued to avoid having the conntrack module unloadable.
>=20
> Signed-off-by: Madhu Koriginja <madhu.koriginja@nxp.com>
> 	V1-V2: added missing () in ip6_input.c in below condition
> 	if (!(ipprot->flags & INET6_PROTO_NOPOLICY))
> ---
>  net/dccp/ipv6.c      |  1 +
>  net/ipv6/ip6_input.c | 14 +++++++-------
>  net/ipv6/raw.c       |  2 +-
>  net/ipv6/tcp_ipv6.c  |  2 ++
>  net/ipv6/udp.c       |  2 ++
>  5 files changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/net/dccp/ipv6.c b/net/dccp/ipv6.c
> index 58a401e9cf09..eb503096db6c 100644
> --- a/net/dccp/ipv6.c
> +++ b/net/dccp/ipv6.c
> @@ -771,6 +771,7 @@ static int dccp_v6_rcv(struct sk_buff *skb)
> =20
>  	if (!xfrm6_policy_check(sk, XFRM_POLICY_IN, skb))
>  		goto discard_and_relse;
> +	nf_reset(skb);

nf_reset() is gone since commit 895b5c9f206e ("netfilter: drop bridge
nf reset from nf_reset"), you should use instead nf_reset_ct(): in the
current form the patch does not apply cleanly (nor build after manual
edit).


Cheers,

Paolo


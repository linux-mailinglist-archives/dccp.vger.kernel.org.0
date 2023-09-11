Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56BBF79C12F
	for <lists+dccp@lfdr.de>; Tue, 12 Sep 2023 02:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjILAnU (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 11 Sep 2023 20:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjILAnT (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 11 Sep 2023 20:43:19 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4225715CEEA;
        Mon, 11 Sep 2023 17:10:19 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-34df008b0cbso17587125ab.1;
        Mon, 11 Sep 2023 17:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694477348; x=1695082148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5WMUEGKJ7eIap0nhI1fqJpW2DseHZBErJML2IMf20M=;
        b=jHxZDvblhuLXWgQB38gT+E1F6P48gteYrlGk18j7NhkSYgyBSxdLivljMExbZB0ooy
         Ue2KUC1wYvDqNDzuMIrhXG0Q0pPt9zxHYRr98xIVBgnnIAGCeaGxdpFNVkLlofGZAPLZ
         MiN9UOFv8EPvPztantxk50DPWoED/1R3r5DIs6/lgelKR3edCTnl/ekKJCL5q4VqVrVw
         zzA7s2Kar5bN8lXj5+AryS388BSokXDvamqfX0iIouaBcTywUfgIYQiWiNDMi+b59tWk
         8hTjDsyFUgZbTzlUfBtsgUS0GzwXrjeGVUmd8cFIKgX7ex5+SRzzQbsGjxGMvoVKasdU
         xImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694477348; x=1695082148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5WMUEGKJ7eIap0nhI1fqJpW2DseHZBErJML2IMf20M=;
        b=vdlbdjWys/nJ0EX5KeHWx+bNVFhHEWMj+Cep4XMehO1R8Ji8IbUqeNfB+WY6ctYiuD
         Ng60/MgI71Ps4bhb6oRibBcpFIuPsl72QAkklAiOCf1ybkJ7vsx/VTZtNi9fX3Jjk7rN
         +qtRdCNhF3rH+q84/NEYuuY8JT7WRImLXuBCrmiSN6xQubwPvbOPsaJRC1ni97M7cVfP
         3EblP1wgD6DWbAZARFRqxS1hIcDSeIfR9DigFBmU92e2rRcPKT+Q0yPAJp1ayxKXriWj
         S1X7nm5vNgYXuZntduDjevL0i+DYyLY6erZgLsp0JxDJELTiRLcpBV1V6ljRh5loQamk
         BY4Q==
X-Gm-Message-State: AOJu0YwgYggSI4lGm6x9vp+fSdaWdB4BKrJfn5E9RkbvAZL8mRTsK1yT
        Ibi08BRufknPWhaVO5Ne501LQb10yk0=
X-Google-Smtp-Source: AGHT+IHU/Lewuz4gtERa76E4z8kKO9LkcNu8fUKblIxiCWNuAsOictGAM5s8oQqXaM1AEcqC+moxSw==
X-Received: by 2002:a17:902:6b08:b0:1bc:1189:17f with SMTP id o8-20020a1709026b0800b001bc1189017fmr8282406plk.42.1694475418376;
        Mon, 11 Sep 2023 16:36:58 -0700 (PDT)
Received: from google.com ([2620:0:1008:10:5b6e:44b:2440:c142])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709029a4c00b001bd41b70b65sm6941628plv.49.2023.09.11.16.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 16:36:57 -0700 (PDT)
Date:   Mon, 11 Sep 2023 16:36:55 -0700
From:   Andrei Vagin <avagin@gmail.com>
To:     Joanne Koong <joannelkoong@gmail.com>, kuniyu@amazon.com
Cc:     netdev@vger.kernel.org, edumazet@google.com, kafai@fb.com,
        kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
        dccp@vger.kernel.org
Subject: Re: [PATCH RESEND net-next v4 1/3] net: Add a bhash2 table hashed by
 port and address
Message-ID: <ZP+kl4/UuTaQTGPT@google.com>
References: <20220822181023.3979645-1-joannelkoong@gmail.com>
 <20220822181023.3979645-2-joannelkoong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822181023.3979645-2-joannelkoong@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Mon, Aug 22, 2022 at 11:10:21AM -0700, Joanne Koong wrote:
>  
> +static bool inet_use_bhash2_on_bind(const struct sock *sk)
> +{
> +#if IS_ENABLED(CONFIG_IPV6)
> +	if (sk->sk_family == AF_INET6) {
> +		int addr_type = ipv6_addr_type(&sk->sk_v6_rcv_saddr);
> +
> +		return addr_type != IPV6_ADDR_ANY &&
> +			addr_type != IPV6_ADDR_MAPPED;
>

Why do we return false to all mapped addresses? Should it be

(addr_type != IPV6_ADDR_MAPPED || sk->sk_rcv_saddr != htonl(INADDR_ANY))

>
> +	}
> +#endif
> +	return sk->sk_rcv_saddr != htonl(INADDR_ANY);
> +}
> +
>
Thanks,
Andrei

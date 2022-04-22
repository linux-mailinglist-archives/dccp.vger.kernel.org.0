Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1948750B5D2
	for <lists+dccp@lfdr.de>; Fri, 22 Apr 2022 13:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446651AbiDVLF3 (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Fri, 22 Apr 2022 07:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446979AbiDVLF2 (ORCPT <rfc822;dccp@vger.kernel.org>);
        Fri, 22 Apr 2022 07:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 729D05623A
        for <dccp@vger.kernel.org>; Fri, 22 Apr 2022 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650625353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZyHAq8XvVGq2hZYkl/QwRkAUTtNiHFZTrfQAk4QcfNI=;
        b=KBQHAbGW+PLrkQ7yQa+5AJG9Y1cld2G9zqgyPcr6+BeU7VJYrD6aw9p0rXEAgiKizzXyPL
        x8o9d7tjr65+xZ0jIub+om3Sv1zT4wBGkFVvhgP7lwyWzy5VlRneo0u3JlowAxk8dXcAoy
        1/rA034FIqkdR5b6Wh5jfZZRcD+IF/I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-lRvsxagyOIy2Hm6fWgr7Kg-1; Fri, 22 Apr 2022 07:02:32 -0400
X-MC-Unique: lRvsxagyOIy2Hm6fWgr7Kg-1
Received: by mail-wr1-f70.google.com with SMTP id t17-20020adfa2d1000000b0020ac519c222so711819wra.4
        for <dccp@vger.kernel.org>; Fri, 22 Apr 2022 04:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZyHAq8XvVGq2hZYkl/QwRkAUTtNiHFZTrfQAk4QcfNI=;
        b=4Vm1j3uT5m5n1gLWvq2Q9epYto5nClo01TvFPjRILWEp11sjZhPC+dkmHoHNwsoYAc
         h2iIig41yfR2latatRzf6+vE2PwCEmnjGNFC0thxUX7v6oB2pslPrvwn0yQtTuCnHJpm
         oR/+CjiR7YQI8wPsP9yIW2c+paIpLacQRfe18x5nsBtEH8WFikJWTh21enRuDYhIc/Oc
         tKeLrGfcFPevZAguzDS1+xEEHq5vw4fawItPSe7Qeyp7Jbz0qMOKHmgSkI0mrwuq8Sk5
         sJAlwZK4xEBKJx2AKleBf4bv1dF8EB2NYrKfcsc0L7tytxDTnD3Kv9mEGp49ZxXrapoa
         22WA==
X-Gm-Message-State: AOAM531xT/r4wv8ooKB3mxtADr3uoL53hIX1u/0H104sRPUFQXqw4ojZ
        Ftmru9YYNqQRng+Rbynv1IAzKwaRgKLM91UXaWvqB9bREWoIKEwYBERexp2Z1RnmGeu5nNcfE0n
        TACeEhKgI1HimNQ==
X-Received: by 2002:a5d:4888:0:b0:207:ad8b:e534 with SMTP id g8-20020a5d4888000000b00207ad8be534mr3054346wrq.325.1650625351046;
        Fri, 22 Apr 2022 04:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5KDHAyqMTVOXlPYgdsFNWeD0RjDElwWKKy8+vAIVq0lSzAkGokyJMdVzf2Awq+RspMcySUg==
X-Received: by 2002:a5d:4888:0:b0:207:ad8b:e534 with SMTP id g8-20020a5d4888000000b00207ad8be534mr3054328wrq.325.1650625350805;
        Fri, 22 Apr 2022 04:02:30 -0700 (PDT)
Received: from debian.home (2a01cb058d3818005c1e4a7b0f47339f.ipv6.abo.wanadoo.fr. [2a01:cb05:8d38:1800:5c1e:4a7b:f47:339f])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c2506000000b0038e6fe8e8d8sm1740027wml.5.2022.04.22.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 04:02:30 -0700 (PDT)
Date:   Fri, 22 Apr 2022 13:02:28 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David Ahern <dsahern@kernel.org>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        dccp@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] ipv4: First steps toward removing RTO_ONLINK
Message-ID: <20220422110228.GB15621@debian.home>
References: <cover.1650470610.git.gnault@redhat.com>
 <2ee8fb0d-aeb4-5010-bc8c-16cbd6e88eff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ee8fb0d-aeb4-5010-bc8c-16cbd6e88eff@kernel.org>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Thu, Apr 21, 2022 at 09:10:21PM -0600, David Ahern wrote:
> On 4/20/22 5:21 PM, Guillaume Nault wrote:
> > RTO_ONLINK is a flag that allows to reduce the scope of route lookups.
> > It's stored in a normally unused bit of the ->flowi4_tos field, in
> > struct flowi4. However it has several problems:
> > 
> >  * This bit is also used by ECN. Although ECN bits are supposed to be
> >    cleared before doing a route lookup, it happened that some code
> >    paths didn't properly sanitise their ->flowi4_tos. So this mechanism
> >    is fragile and we had bugs in the past where ECN bits slipped in and
> >    could end up being erroneously interpreted as RTO_ONLINK.
> > 
> >  * A dscp_t type was recently introduced to ensure ECN bits are cleared
> >    during route lookups. ->flowi4_tos is the most important structure
> >    field to convert, but RTO_ONLINK prevents such conversion, as dscp_t
> >    mandates that ECN bits (where RTO_ONLINK is stored) be zero.
> > 
> > Therefore we need to stop using RTO_ONLINK altogether. Fortunately
> > RTO_ONLINK isn't a necessity. Instead of passing a flag in ->flowi4_tos
> > to tell the route lookup function to restrict the scope, we can simply
> > initialise the scope correctly.
> > 
> 
> I believe the set looks ok. I think the fib test coverage in selftests
> could use more tests to cover tos.

Yes, this is on my todo list. I also plan to review existing tests that
cover route lookups with link scope, and extend them if necessary.

Thanks for the review.


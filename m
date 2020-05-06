Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF44D1C722D
	for <lists+dccp@lfdr.de>; Wed,  6 May 2020 15:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgEFNxk (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 6 May 2020 09:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728712AbgEFNxj (ORCPT
        <rfc822;dccp@vger.kernel.org>); Wed, 6 May 2020 09:53:39 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73491C061A0F
        for <dccp@vger.kernel.org>; Wed,  6 May 2020 06:53:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u16so2752172wmc.5
        for <dccp@vger.kernel.org>; Wed, 06 May 2020 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=GjvudzLMbL+TOgF/JDI7RJUqMk0E0cm0LNLU/JCk0xU=;
        b=SDljmdh7QFJ0KmZse6HyzKivVZ/KaukZvxWzW96n1cu8RfNquElkqy8RHleT0wKRGt
         emNxPjx/RrFJSajMX/Gd2W6n+rmeZRnf83MfTvrufPsxBkB5F1EhJ5o4gQR6Tw0nMSgO
         dTtl5It8lJA7vg8FHCPU9oP37Kt0mJ3gJ9jhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=GjvudzLMbL+TOgF/JDI7RJUqMk0E0cm0LNLU/JCk0xU=;
        b=COCDzNNFi6CBaS38jXKyxwepo1rBnz1nuJprSJATU+u5nrzKTYYG/WRH0qnFJNUrDX
         lWx1UPzyO2wr/22TvyUs2x16GJFPBm02HJT8DK4XZM5828UKH7X+LRK51TJEU5duY/wC
         M3zvkewEj7QAvyihqjzEOoIoYbSNU2kgrGUam3Fz9SBE8lBkDIyHtMk7FvGemc7MIN5H
         rSbBtsNAHGHUpiD01CFOu5gzDoJJEPphCoXW283KniRfxJp7fD3P5ZggfHdRYlqaOlFg
         BovRDl3deofS2ge7EvOa+n7e+HAYTtbwBbYMIcdU3rbyO457TNdlxbLbqeqdRaYVVDUM
         Km0A==
X-Gm-Message-State: AGi0PuYAOaXe5D2WtamSZiyO5Z1y+XnXYbsf2SYcShXKzhKW3suf3/1R
        BOXi4gh0JA4C+RjdcN/QIU1G1Tma/hc=
X-Google-Smtp-Source: APiQypID4OpGLH0lhbJH5XyyLd82LCR2zCZPq2lmrYrF/s+vdE2bbsnydQvU3CDb8RYnnGyEl0rj7g==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr4500261wma.19.1588773217172;
        Wed, 06 May 2020 06:53:37 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id s12sm3033822wmc.7.2020.05.06.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 06:53:36 -0700 (PDT)
References: <20200506125514.1020829-1-jakub@cloudflare.com> <20200506125514.1020829-3-jakub@cloudflare.com> <CACAyw9-ro_Dit=3M46=JSrkuc8y+UcsvJgVQuG98KdtmM9mCCA@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.3
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     Lorenz Bauer <lmb@cloudflare.com>
Cc:     Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        dccp@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Jakub Kicinski <kuba@kernel.org>,
        Marek Majkowski <marek@cloudflare.com>
Subject: Re: [PATCH bpf-next 02/17] bpf: Introduce SK_LOOKUP program type with a dedicated attach point
In-reply-to: <CACAyw9-ro_Dit=3M46=JSrkuc8y+UcsvJgVQuG98KdtmM9mCCA@mail.gmail.com>
Date:   Wed, 06 May 2020 15:53:35 +0200
Message-ID: <87eerxuq3k.fsf@cloudflare.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Wed, May 06, 2020 at 03:16 PM CEST, Lorenz Bauer wrote:
> On Wed, 6 May 2020 at 13:55, Jakub Sitnicki <jakub@cloudflare.com> wrote:

[...]

>> @@ -4012,4 +4051,18 @@ struct bpf_pidns_info {
>>         __u32 pid;
>>         __u32 tgid;
>>  };
>> +
>> +/* User accessible data for SK_LOOKUP programs. Add new fields at the end. */
>> +struct bpf_sk_lookup {
>> +       __u32 family;           /* AF_INET, AF_INET6 */
>> +       __u32 protocol;         /* IPPROTO_TCP, IPPROTO_UDP */
>> +       /* IP addresses allows 1, 2, and 4 bytes access */
>> +       __u32 src_ip4;
>> +       __u32 src_ip6[4];
>> +       __u32 src_port;         /* network byte order */
>> +       __u32 dst_ip4;
>> +       __u32 dst_ip6[4];
>> +       __u32 dst_port;         /* host byte order */
>
> Jakub and I have discussed this off-list, but we couldn't come to an
> agreement and decided to invite
> your opinion.
>
> I think that dst_port should be in network byte order, since it's one
> less exception to the
> rule to think about when writing BPF programs.
>
> Jakub's argument is that this follows __sk_buff->local_port precedent,
> which is also in host
> byte order.

Yes, would be great to hear if there is a preference here.

Small correction, proposed sk_lookup program doesn't have access to
__sk_buff, so perhaps that case matters less.

bpf_sk_lookup->dst_port, the packet destination port, is in host byte
order so that it can be compared against bpf_sock->src_port, socket
local port, without conversion.

But I also see how it can be a surprise for a BPF user that one field has
a different byte order.

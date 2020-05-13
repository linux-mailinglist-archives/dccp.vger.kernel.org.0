Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E6B1D168A
	for <lists+dccp@lfdr.de>; Wed, 13 May 2020 15:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388604AbgEMNzZ (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 13 May 2020 09:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387906AbgEMNzY (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 13 May 2020 09:55:24 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF83C061A0F
        for <dccp@vger.kernel.org>; Wed, 13 May 2020 06:55:24 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e26so26635843wmk.5
        for <dccp@vger.kernel.org>; Wed, 13 May 2020 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=pEF6eTbjMF/Zp5kqlMON2d9WgYdaB5cU0Wyi39YjYtI=;
        b=hbmlsggGZTqdI3GRYlpSMceoK9GVRcT9K+DNYXSUoijaHEsKRPYTNM0JH4XPFZHf72
         dzBSKPtoihA8/gdApZ1PuvyRCQLV/tZwMG/AJ0Rn/Mf6YAiBYUr6pRA+Z+aVTsW9OMMj
         iqXicabjI3ljIYgKeTcO8BBNpeIUq7rhje2h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=pEF6eTbjMF/Zp5kqlMON2d9WgYdaB5cU0Wyi39YjYtI=;
        b=anIIKMZo2cvlKz6aQ0A8aVHkRPHz9lg1cjDEyd/1QeJlYtZLg5MLp8vi/gqusvWmn/
         m8wqgcDA5tYtmBtSqD+PxhTK9f9y7P+2AnFCOjxKoDeTmXHsbmtFHcmOC2U883glpMx4
         o7qfvO/d6l0WzNPG+5rJu/QJe2UfXW5xjYgNpM/kQ9DjtsqP+JK0IF0VwFCDrahX2liD
         qpI66gFpAhqYf/oFdufDwOvKE07gXLjkdj/8/tLFjgEH8K6nUekI9yDA24Uj1oRmqRoi
         Z4RoRAssTDZZp63Axpo2odZfjE4knknPc1OUweKT/zKBrdRXDF9ksvRA1MPdD1BORTbc
         awlA==
X-Gm-Message-State: AGi0PuZydM6neLy4FWRR51gZGjAHUMUAlc55Z7wB79hgY+2PrAyaPZP7
        E/H2sFVdAPYFTd0cY12HOvgYTQ==
X-Google-Smtp-Source: APiQypJWEBPUYLL7acho2GSRta1Ab9Yd9/st+SXO645SSDx4wE9FmjPNmqUesATEF4X4Otq52IKn6Q==
X-Received: by 2002:a1c:dc05:: with SMTP id t5mr15429291wmg.112.1589378122987;
        Wed, 13 May 2020 06:55:22 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id i17sm36371968wml.23.2020.05.13.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 06:55:22 -0700 (PDT)
References: <20200511185218.1422406-1-jakub@cloudflare.com> <20200511185218.1422406-6-jakub@cloudflare.com> <20200511204445.i7sessmtszox36xd@ast-mbp> <871rnpuuob.fsf@cloudflare.com> <20200512235840.znwcyu3gpxemucwh@ast-mbp>
User-agent: mu4e 1.1.0; emacs 26.3
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     netdev@vger.kernel.org, bpf@vger.kernel.org, dccp@vger.kernel.org,
        kernel-team@cloudflare.com, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Jakub Kicinski <kuba@kernel.org>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Marek Majkowski <marek@cloudflare.com>,
        Lorenz Bauer <lmb@cloudflare.com>
Subject: Re: [PATCH bpf-next v2 05/17] inet: Run SK_LOOKUP BPF program on socket lookup
In-reply-to: <20200512235840.znwcyu3gpxemucwh@ast-mbp>
Date:   Wed, 13 May 2020 15:55:20 +0200
Message-ID: <87y2pwszw7.fsf@cloudflare.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Wed, May 13, 2020 at 01:58 AM CEST, Alexei Starovoitov wrote:
> On Tue, May 12, 2020 at 03:52:52PM +0200, Jakub Sitnicki wrote:
>> On Mon, May 11, 2020 at 10:44 PM CEST, Alexei Starovoitov wrote:
>> > On Mon, May 11, 2020 at 08:52:06PM +0200, Jakub Sitnicki wrote:
>> >> Run a BPF program before looking up a listening socket on the receive path.
>> >> Program selects a listening socket to yield as result of socket lookup by
>> >> calling bpf_sk_assign() helper and returning BPF_REDIRECT code.
>> >>
>> >> Alternatively, program can also fail the lookup by returning with BPF_DROP,
>> >> or let the lookup continue as usual with BPF_OK on return.
>> >>
>> >> This lets the user match packets with listening sockets freely at the last
>> >> possible point on the receive path, where we know that packets are destined
>> >> for local delivery after undergoing policing, filtering, and routing.
>> >>
>> >> With BPF code selecting the socket, directing packets destined to an IP
>> >> range or to a port range to a single socket becomes possible.
>> >>
>> >> Suggested-by: Marek Majkowski <marek@cloudflare.com>
>> >> Reviewed-by: Lorenz Bauer <lmb@cloudflare.com>
>> >> Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
>> >> ---
>> >>  include/net/inet_hashtables.h | 36 +++++++++++++++++++++++++++++++++++
>> >>  net/ipv4/inet_hashtables.c    | 15 ++++++++++++++-
>> >>  2 files changed, 50 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
>> >> index 6072dfbd1078..3fcbc8f66f88 100644
>> >> --- a/include/net/inet_hashtables.h
>> >> +++ b/include/net/inet_hashtables.h
>> >> @@ -422,4 +422,40 @@ int __inet_hash_connect(struct inet_timewait_death_row *death_row,
>> >>
>> >>  int inet_hash_connect(struct inet_timewait_death_row *death_row,
>> >>  		      struct sock *sk);
>> >> +
>> >> +static inline struct sock *bpf_sk_lookup_run(struct net *net,
>> >> +					     struct bpf_sk_lookup_kern *ctx)
>> >> +{
>> >> +	struct bpf_prog *prog;
>> >> +	int ret = BPF_OK;
>> >> +
>> >> +	rcu_read_lock();
>> >> +	prog = rcu_dereference(net->sk_lookup_prog);
>> >> +	if (prog)
>> >> +		ret = BPF_PROG_RUN(prog, ctx);
>> >> +	rcu_read_unlock();
>> >> +
>> >> +	if (ret == BPF_DROP)
>> >> +		return ERR_PTR(-ECONNREFUSED);
>> >> +	if (ret == BPF_REDIRECT)
>> >> +		return ctx->selected_sk;
>> >> +	return NULL;
>> >> +}
>> >> +
>> >> +static inline struct sock *inet_lookup_run_bpf(struct net *net, u8 protocol,
>> >> +					       __be32 saddr, __be16 sport,
>> >> +					       __be32 daddr, u16 dport)
>> >> +{
>> >> +	struct bpf_sk_lookup_kern ctx = {
>> >> +		.family		= AF_INET,
>> >> +		.protocol	= protocol,
>> >> +		.v4.saddr	= saddr,
>> >> +		.v4.daddr	= daddr,
>> >> +		.sport		= sport,
>> >> +		.dport		= dport,
>> >> +	};
>> >> +
>> >> +	return bpf_sk_lookup_run(net, &ctx);
>> >> +}
>> >> +
>> >>  #endif /* _INET_HASHTABLES_H */
>> >> diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
>> >> index ab64834837c8..f4d07285591a 100644
>> >> --- a/net/ipv4/inet_hashtables.c
>> >> +++ b/net/ipv4/inet_hashtables.c
>> >> @@ -307,9 +307,22 @@ struct sock *__inet_lookup_listener(struct net *net,
>> >>  				    const int dif, const int sdif)
>> >>  {
>> >>  	struct inet_listen_hashbucket *ilb2;
>> >> -	struct sock *result = NULL;
>> >> +	struct sock *result, *reuse_sk;
>> >>  	unsigned int hash2;
>> >>
>> >> +	/* Lookup redirect from BPF */
>> >> +	result = inet_lookup_run_bpf(net, hashinfo->protocol,
>> >> +				     saddr, sport, daddr, hnum);
>> >> +	if (IS_ERR(result))
>> >> +		return NULL;
>> >> +	if (result) {
>> >> +		reuse_sk = lookup_reuseport(net, result, skb, doff,
>> >> +					    saddr, sport, daddr, hnum);
>> >> +		if (reuse_sk)
>> >> +			result = reuse_sk;
>> >> +		goto done;
>> >> +	}
>> >> +
>> >
>> > The overhead is too high to do this all the time.
>> > The feature has to be static_key-ed.
>>
>> Static keys is something that Lorenz has also suggested internally, but
>> we wanted to keep it simple at first.
>>
>> Introduction of static keys forces us to decide when non-init_net netns
>> are allowed to attach to SK_LOOKUP, as attaching enabling SK_LOOKUP in
>> isolated netns will affect the rx path in init_net.
>>
>> I see two options, which seem sensible:
>>
>> 1) limit SK_LOOKUP to init_net, which makes testing setup harder, or
>>
>> 2) allow non-init_net netns to attach to SK_LOOKUP only if static key
>>    has been already enabled (via sysctl?).
>
> I think both are overkill.
> Just enable that static_key if any netns has progs.
> Loading this prog type will be privileged operation even after cap_bpf.
>

OK, right. In the new model caps are checked at load time. And
CAP_BPF+CAP_NET_ADMIN check on load is done against init_user_ns.

[...]

>> I'm curious what downside do you see here?
>> Is overriding an earlier DROP/REDIRECT verdict useful?
>>
>> > Another option could be to execute all attached progs regardless
>> > of return code, but don't let second prog override selected_sk blindly.
>> > bpf_sk_assign() could get smarter.
>>
>> So if IIUC the rough idea here would be like below?
>>
>> - 1st program calls
>>
>>   bpf_sk_assign(ctx, sk1, 0 /*flags*/) -> 0 (OK)
>>
>> - 2nd program calls
>>
>>   bpf_sk_assign(ctx, sk2, 0) -> -EBUSY (already selected)
>>   bpf_sk_assign(ctx, sk2, BPF_EXIST) -> 0 (OK, replace existing)
>>
>> In this case the last program to run has the final say, as opposed to
>> the semantics where DROP/REDIRECT terminates.
>>
>> Also, 2nd and subsequent programs would probably need to know if and
>> which socket has been already selected. I think the selection could be
>> exposed in context as bpf_sock pointer.
>
> I think running all is better.
> The main down side of terminating early is predictability.
> Imagine first prog is doing the sock selection based on some map configuration.
> Then second prog gets loaded and doing its own selection.
> These two progs are managed by different user space processes.
> Now first map got changed and second prog stopped seeing the packets.
> No warning. Nothing. With "bpf_sk_assign(ctx, sk2, 0) -> -EBUSY"
> the second prog at least will see errors and will be able to log
> and alert humans to do something about it.
> The question of ordering come up, of course. But that ordering concerns
> we had for some time with cgroup-bpf run array and it wasn't horrible.
> We're still trying to solve it on cgroup-bpf side in a generic way,
> but simple first-to-attach -> first-to-run was good enough there
> and I think will be here as well. The whole dispatcher project
> and managing policy, priority, ordering in user space better to solve
> it generically for all cases. But the kernel should do simple basics.

That makes sense. Thanks for guidance.

-Jakub

Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEFA6303E1
	for <lists+dccp@lfdr.de>; Sat, 19 Nov 2022 00:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbiKRXdg (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Fri, 18 Nov 2022 18:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236387AbiKRXcv (ORCPT <rfc822;dccp@vger.kernel.org>);
        Fri, 18 Nov 2022 18:32:51 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F1D9B7EC;
        Fri, 18 Nov 2022 15:20:32 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 63so7371962ybq.4;
        Fri, 18 Nov 2022 15:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7yeCK6sJNjXRHuqYylhfQsKIKZH9dHe89MSSNjmBm+M=;
        b=GTidl8vXDZV+fB6n5G7B5ex77Y5wtWMXfb+40qUKEM1EE66mx4jUfmMgDxMTmJSYrv
         dXCTfWPSA/7pxIm8aMAcjJZcNf9uKJGVXSw2i0/88DyqMIVq86KwQhUQ/Uc03PmigtWN
         m+QTztsNcoxaL8BKYSceM46NRl6o+ePRVkCLz8HRVFAM7SaXaMfzXjrOnAnXgL+H/ZR6
         ob2JjMW/C3hmS259fGvuNulrli2dbIB1ASvTR9yASAJOy0xd1zwKs3VeLyLNRF66h5qA
         HnIB41A4XC5I1JiPxmbFxKGXOVuPIfd2ijhTeUM/M8sJ48PTXZr9yEVQgWt7iPawDoQj
         Amtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yeCK6sJNjXRHuqYylhfQsKIKZH9dHe89MSSNjmBm+M=;
        b=zWwQY/T6ukR/AxvnnRomUb+HBBuozOWq1nKqHsOKVxTP3PaawlLQiHOdrAdhHZirmf
         iml9IxsNo6XAHNIZO7Qb0bTr7zVQ8Oj3nICUKQYhtWNqM8sG/vi6eSB3IX4GMh4nsO00
         we5o5pXx3RcZFhs/uH/XEFP0ad8my7Bl9jVSRahQJC6QGHU7fTLhPY6kulqImJI3WBQV
         W98axkvasWrLAeqMUJs1Ujj41foYbkXXxk8m9t9CG3yVF2sOy1OiFljZgYIMnJWPcViR
         sQeyoNuCN5dLq5LUtIFXbl2t9k2FubBYosYqsuK6eM13ixbfiyDFEYsw50F59ek/LlSR
         3+2Q==
X-Gm-Message-State: ANoB5plZpR3TpTR5ADKU7UWUGdREp6+j+K38Zt14Kjiru48NghLYA79g
        vTG3WazKlOmTES8eaoM5dUrrOQJxyiJd+W523GM=
X-Google-Smtp-Source: AA0mqf5vSW6O/oRdmOmckKIKYZstYS5F4EE2iGGFNrEChwAS4xKtqEyiORW8gyoBBHrb3b8mX1wrT40+4ZqRoHhYxqA=
X-Received: by 2002:a25:2fc4:0:b0:6e7:198:27bb with SMTP id
 v187-20020a252fc4000000b006e7019827bbmr8727097ybv.157.1668813631654; Fri, 18
 Nov 2022 15:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20221118205839.14312-1-kuniyu@amazon.com> <20221118205839.14312-4-kuniyu@amazon.com>
In-Reply-To: <20221118205839.14312-4-kuniyu@amazon.com>
From:   Joanne Koong <joannelkoong@gmail.com>
Date:   Fri, 18 Nov 2022 15:20:20 -0800
Message-ID: <CAJnrk1aYK6TioDBnGhKuxajOzm-Df+MiUd+O3hDbnup83GwNWw@mail.gmail.com>
Subject: Re: [PATCH v3 net 3/4] dccp/tcp: Update saddr under bhash's lock.
To:     Kuniyuki Iwashima <kuniyu@amazon.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Arnaldo Carvalho de Melo <acme@mandriva.com>,
        Martin KaFai Lau <martin.lau@kernel.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "Ziyang Xuan (William)" <william.xuanziyang@huawei.com>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org,
        dccp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Fri, Nov 18, 2022 at 1:00 PM Kuniyuki Iwashima <kuniyu@amazon.com> wrote:
>
> When we call connect() for a socket bound to a wildcard address, we update
> saddr locklessly.  However, it could result in a data race; another thread
> iterating over bhash might see a corrupted address.
>
> Let's update saddr under the bhash bucket's lock.

Thanks for the quick turnaround!

>
> Fixes: 3df80d9320bc ("[DCCP]: Introduce DCCPv6")
> Fixes: 7c657876b63c ("[DCCP]: Initial implementation")
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.com>
> ---
>  include/net/inet_hashtables.h |  2 +-
>  net/dccp/ipv4.c               | 22 +++-----------
>  net/dccp/ipv6.c               | 23 +++------------
>  net/ipv4/af_inet.c            | 11 +------
>  net/ipv4/inet_hashtables.c    | 55 +++++++++++++++++++++++++++++------
>  net/ipv4/tcp_ipv4.c           | 20 +++----------
>  net/ipv6/tcp_ipv6.c           | 19 ++----------
>  7 files changed, 63 insertions(+), 89 deletions(-)
>
> diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
> index 3af1e927247d..ba06e8b52264 100644
> --- a/include/net/inet_hashtables.h
> +++ b/include/net/inet_hashtables.h
> @@ -281,7 +281,7 @@ inet_bhash2_addr_any_hashbucket(const struct sock *sk, const struct net *net, in
>   * sk_v6_rcv_saddr (ipv6) changes after it has been binded. The socket's
>   * rcv_saddr field should already have been updated when this is called.
>   */
> -int inet_bhash2_update_saddr(struct inet_bind_hashbucket *prev_saddr, struct sock *sk);
> +int inet_bhash2_update_saddr(struct sock *sk, void *saddr, int family);
>
>  void inet_bind_hash(struct sock *sk, struct inet_bind_bucket *tb,
>                     struct inet_bind2_bucket *tb2, unsigned short port);
> diff --git a/net/dccp/ipv4.c b/net/dccp/ipv4.c
> index 40640c26680e..95e376e3b911 100644
> --- a/net/dccp/ipv4.c
> +++ b/net/dccp/ipv4.c
> @@ -45,11 +45,10 @@ static unsigned int dccp_v4_pernet_id __read_mostly;
>  int dccp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
>  {
>         const struct sockaddr_in *usin = (struct sockaddr_in *)uaddr;
> -       struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
> -       __be32 daddr, nexthop, prev_sk_rcv_saddr;
>         struct inet_sock *inet = inet_sk(sk);
>         struct dccp_sock *dp = dccp_sk(sk);
>         __be16 orig_sport, orig_dport;
> +       __be32 daddr, nexthop;
>         struct flowi4 *fl4;
>         struct rtable *rt;
>         int err;
> @@ -91,26 +90,13 @@ int dccp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
>                 daddr = fl4->daddr;
>
>         if (inet->inet_saddr == 0) {
> -               if (inet_csk(sk)->icsk_bind2_hash) {
> -                       prev_addr_hashbucket =
> -                               inet_bhashfn_portaddr(&dccp_hashinfo, sk,
> -                                                     sock_net(sk),
> -                                                     inet->inet_num);
> -                       prev_sk_rcv_saddr = sk->sk_rcv_saddr;
> -               }
> -               inet->inet_saddr = fl4->saddr;
> -       }
> -
> -       sk_rcv_saddr_set(sk, inet->inet_saddr);
> -
> -       if (prev_addr_hashbucket) {
> -               err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> +               err = inet_bhash2_update_saddr(sk,  &fl4->saddr, AF_INET);
>                 if (err) {
> -                       inet->inet_saddr = 0;
> -                       sk_rcv_saddr_set(sk, prev_sk_rcv_saddr);
>                         ip_rt_put(rt);
>                         return err;
>                 }
> +       } else {
> +               sk_rcv_saddr_set(sk, inet->inet_saddr);
>         }
>
>         inet->inet_dport = usin->sin_port;
> diff --git a/net/dccp/ipv6.c b/net/dccp/ipv6.c
> index 626166cb6d7e..94c101ed57a9 100644
> --- a/net/dccp/ipv6.c
> +++ b/net/dccp/ipv6.c
> @@ -934,26 +934,11 @@ static int dccp_v6_connect(struct sock *sk, struct sockaddr *uaddr,
>         }
>
>         if (saddr == NULL) {
> -               struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
> -               struct in6_addr prev_v6_rcv_saddr;
> -
> -               if (icsk->icsk_bind2_hash) {
> -                       prev_addr_hashbucket = inet_bhashfn_portaddr(&dccp_hashinfo,
> -                                                                    sk, sock_net(sk),
> -                                                                    inet->inet_num);
> -                       prev_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
> -               }
> -
>                 saddr = &fl6.saddr;
> -               sk->sk_v6_rcv_saddr = *saddr;
> -
> -               if (prev_addr_hashbucket) {
> -                       err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> -                       if (err) {
> -                               sk->sk_v6_rcv_saddr = prev_v6_rcv_saddr;
> -                               goto failure;
> -                       }
> -               }
> +
> +               err = inet_bhash2_update_saddr(sk, saddr, AF_INET6);
> +               if (err)
> +                       goto failure;
>         }
>
>         /* set the source address */
> diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> index 4728087c42a5..0da679411330 100644
> --- a/net/ipv4/af_inet.c
> +++ b/net/ipv4/af_inet.c
> @@ -1230,7 +1230,6 @@ EXPORT_SYMBOL(inet_unregister_protosw);
>
>  static int inet_sk_reselect_saddr(struct sock *sk)
>  {
> -       struct inet_bind_hashbucket *prev_addr_hashbucket;
>         struct inet_sock *inet = inet_sk(sk);
>         __be32 old_saddr = inet->inet_saddr;
>         __be32 daddr = inet->inet_daddr;
> @@ -1260,16 +1259,8 @@ static int inet_sk_reselect_saddr(struct sock *sk)
>                 return 0;
>         }
>
> -       prev_addr_hashbucket =
> -               inet_bhashfn_portaddr(tcp_or_dccp_get_hashinfo(sk), sk,
> -                                     sock_net(sk), inet->inet_num);
> -
> -       inet->inet_saddr = inet->inet_rcv_saddr = new_saddr;
> -
> -       err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> +       err = inet_bhash2_update_saddr(sk, &new_saddr, AF_INET);
>         if (err) {
> -               inet->inet_saddr = old_saddr;
> -               inet->inet_rcv_saddr = old_saddr;
>                 ip_rt_put(rt);
>                 return err;
>         }
> diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
> index d745f962745e..fce0bd62d6b5 100644
> --- a/net/ipv4/inet_hashtables.c
> +++ b/net/ipv4/inet_hashtables.c
> @@ -858,31 +858,65 @@ inet_bhash2_addr_any_hashbucket(const struct sock *sk, const struct net *net, in
>         return &hinfo->bhash2[hash & (hinfo->bhash_size - 1)];
>  }
>
> -int inet_bhash2_update_saddr(struct inet_bind_hashbucket *prev_saddr, struct sock *sk)
> +static void inet_update_saddr(struct sock *sk, void *saddr, int family)
> +{
> +       if (family == AF_INET) {
> +               inet_sk(sk)->inet_saddr = *(__be32 *)saddr;
> +               sk_rcv_saddr_set(sk, inet_sk(sk)->inet_saddr);
> +       }
> +#if IS_ENABLED(CONFIG_IPV6)
> +       else {
> +               sk->sk_v6_rcv_saddr = *(struct in6_addr *)saddr;
> +       }
> +#endif
> +}
> +
> +int inet_bhash2_update_saddr(struct sock *sk, void *saddr, int family)
>  {
>         struct inet_hashinfo *hinfo = tcp_or_dccp_get_hashinfo(sk);
> +       struct inet_bind_hashbucket *head, *head2;
>         struct inet_bind2_bucket *tb2, *new_tb2;
>         int l3mdev = inet_sk_bound_l3mdev(sk);
> -       struct inet_bind_hashbucket *head2;
>         int port = inet_sk(sk)->inet_num;
>         struct net *net = sock_net(sk);
> +       int bhash, err = 0;
> +
> +       if (!inet_csk(sk)->icsk_bind2_hash) {
> +               /* Not bind()ed before. */
> +               inet_update_saddr(sk, saddr, family);
> +               goto out;
> +       }

I think it would be cleaner if this logic were outside
bhash2_update_saddr(), since this mutates the sk's address when the
socket hasn't been previously bound to bhash2. I think something like
this would be clearer:

static int inet_update_saddr(struct sock *sk, void *saddr, int family)
{
    if (!inet_csk(sk)->icsk_bind2_hash) {
      update_sk_saddr(sk, saddr, family)
      return 0;
    }
    return inet_bhash2_update_saddr(sk, saddr, family);
}

and then from dccp/tcp_ipv4/6_connect(), we just call
inet_update_saddr(). This also "moves" the lower-level implementation
details (eg underlying bind tables) to inet_hashtables.c, instead of
it being mentioned in the higher dccp_tcp_ipv4/6 layers.

What are your thoughts?

> +
> +       bhash = inet_bhashfn(net, port, hinfo->bhash_size);
> +       head = &hinfo->bhash[bhash];
> +
> +       /* If we change saddr locklessly, another thread
> +        * iterating over bhash might see corrupted address.
> +        */
> +       spin_lock_bh(&head->lock);

I don't think we should be acquiring the bhash lock here. I think we
only need to acquire it right before we mutate the saddr, and we can
release it right after.

>
>         /* Allocate a bind2 bucket ahead of time to avoid permanently putting
>          * the bhash2 table in an inconsistent state if a new tb2 bucket
>          * allocation fails.
>          */
>         new_tb2 = kmem_cache_alloc(hinfo->bind2_bucket_cachep, GFP_ATOMIC);
> -       if (!new_tb2)
> -               return -ENOMEM;
> +       if (!new_tb2) {
> +               err = -ENOMEM;
> +               goto unlock;
> +       }
>
>         head2 = inet_bhashfn_portaddr(hinfo, sk, net, port);
>
> -       spin_lock_bh(&prev_saddr->lock);
> +       spin_lock(&head2->lock);
>         __sk_del_bind2_node(sk);
>         inet_bind2_bucket_destroy(hinfo->bind2_bucket_cachep, inet_csk(sk)->icsk_bind2_hash);
> -       spin_unlock_bh(&prev_saddr->lock);
> +       spin_unlock(&head2->lock);
> +
> +       inet_update_saddr(sk, saddr, family);
>
> -       spin_lock_bh(&head2->lock);
> +       head2 = inet_bhashfn_portaddr(hinfo, sk, net, port);
> +
> +       spin_lock(&head2->lock);
>         tb2 = inet_bind2_bucket_find(head2, net, port, l3mdev, sk);
>         if (!tb2) {
>                 tb2 = new_tb2;
> @@ -890,12 +924,15 @@ int inet_bhash2_update_saddr(struct inet_bind_hashbucket *prev_saddr, struct soc
>         }
>         sk_add_bind2_node(sk, &tb2->owners);
>         inet_csk(sk)->icsk_bind2_hash = tb2;
> -       spin_unlock_bh(&head2->lock);
> +       spin_unlock(&head2->lock);
>
>         if (tb2 != new_tb2)
>                 kmem_cache_free(hinfo->bind2_bucket_cachep, new_tb2);
>
> -       return 0;
> +unlock:
> +       spin_unlock_bh(&head->lock);
> +out:
> +       return err;
>  }
>  EXPORT_SYMBOL_GPL(inet_bhash2_update_saddr);
>
> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index 6a3a732b584d..23dd7e9df2d5 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -199,15 +199,14 @@ static int tcp_v4_pre_connect(struct sock *sk, struct sockaddr *uaddr,
>  /* This will initiate an outgoing connection. */
>  int tcp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
>  {
> -       struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
>         struct sockaddr_in *usin = (struct sockaddr_in *)uaddr;
>         struct inet_timewait_death_row *tcp_death_row;
> -       __be32 daddr, nexthop, prev_sk_rcv_saddr;
>         struct inet_sock *inet = inet_sk(sk);
>         struct tcp_sock *tp = tcp_sk(sk);
>         struct ip_options_rcu *inet_opt;
>         struct net *net = sock_net(sk);
>         __be16 orig_sport, orig_dport;
> +       __be32 daddr, nexthop;
>         struct flowi4 *fl4;
>         struct rtable *rt;
>         int err;
> @@ -251,24 +250,13 @@ int tcp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
>         tcp_death_row = &sock_net(sk)->ipv4.tcp_death_row;
>
>         if (!inet->inet_saddr) {
> -               if (inet_csk(sk)->icsk_bind2_hash) {
> -                       prev_addr_hashbucket = inet_bhashfn_portaddr(tcp_death_row->hashinfo,
> -                                                                    sk, net, inet->inet_num);
> -                       prev_sk_rcv_saddr = sk->sk_rcv_saddr;
> -               }
> -               inet->inet_saddr = fl4->saddr;
> -       }
> -
> -       sk_rcv_saddr_set(sk, inet->inet_saddr);
> -
> -       if (prev_addr_hashbucket) {
> -               err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> +               err = inet_bhash2_update_saddr(sk,  &fl4->saddr, AF_INET);
>                 if (err) {
> -                       inet->inet_saddr = 0;
> -                       sk_rcv_saddr_set(sk, prev_sk_rcv_saddr);
>                         ip_rt_put(rt);
>                         return err;
>                 }
> +       } else {
> +               sk_rcv_saddr_set(sk, inet->inet_saddr);
>         }
>
>         if (tp->rx_opt.ts_recent_stamp && inet->inet_daddr != daddr) {
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index 81b396e5cf79..2f3ca3190d26 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -292,24 +292,11 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr *uaddr,
>         tcp_death_row = &sock_net(sk)->ipv4.tcp_death_row;
>
>         if (!saddr) {
> -               struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
> -               struct in6_addr prev_v6_rcv_saddr;
> -
> -               if (icsk->icsk_bind2_hash) {
> -                       prev_addr_hashbucket = inet_bhashfn_portaddr(tcp_death_row->hashinfo,
> -                                                                    sk, net, inet->inet_num);
> -                       prev_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
> -               }
>                 saddr = &fl6.saddr;
> -               sk->sk_v6_rcv_saddr = *saddr;
>
> -               if (prev_addr_hashbucket) {
> -                       err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> -                       if (err) {
> -                               sk->sk_v6_rcv_saddr = prev_v6_rcv_saddr;
> -                               goto failure;
> -                       }
> -               }
> +               err = inet_bhash2_update_saddr(sk, saddr, AF_INET6);
> +               if (err)
> +                       goto failure;
>         }
>
>         /* set the source address */
> --
> 2.30.2
>

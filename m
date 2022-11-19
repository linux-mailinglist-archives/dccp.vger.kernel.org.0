Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A99630892
	for <lists+dccp@lfdr.de>; Sat, 19 Nov 2022 02:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbiKSBnK (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Fri, 18 Nov 2022 20:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbiKSBmp (ORCPT <rfc822;dccp@vger.kernel.org>);
        Fri, 18 Nov 2022 20:42:45 -0500
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710A7CD94E;
        Fri, 18 Nov 2022 16:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668818978; x=1700354978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jToRV35Q5SUl9TJr5+ua+CQwBIOSt9sdpJtFVnN0r78=;
  b=L9f48l78LeIhUD7jEBNW+kEsiuNBSQ9xJcc30BSL8D9hTLY17e5C9M/E
   r1ssXPgR1HzrI508XrPBZhi3i68pC5bADQj5NYstmIrYl8mfzBFxs3Y5D
   4xg4XJuimYPX+cJNnCEU4jlG6bnHC0BZEwa2Oxd/Q3FTCy267Z/QKJ/Ds
   Y=;
X-IronPort-AV: E=Sophos;i="5.96,175,1665446400"; 
   d="scan'208";a="268441959"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-3e1fab07.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2022 00:49:36 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1e-m6i4x-3e1fab07.us-east-1.amazon.com (Postfix) with ESMTPS id D89A7820B1;
        Sat, 19 Nov 2022 00:49:31 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Sat, 19 Nov 2022 00:49:30 +0000
Received: from 88665a182662.ant.amazon.com.com (10.43.160.223) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Sat, 19 Nov 2022 00:49:27 +0000
From:   Kuniyuki Iwashima <kuniyu@amazon.com>
To:     <joannelkoong@gmail.com>
CC:     <acme@mandriva.com>, <davem@davemloft.net>, <dccp@vger.kernel.org>,
        <dsahern@kernel.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <kuni1840@gmail.com>, <kuniyu@amazon.com>, <martin.lau@kernel.org>,
        <mathew.j.martineau@linux.intel.com>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>, <pengfei.xu@intel.com>,
        <stephen@networkplumber.org>, <william.xuanziyang@huawei.com>,
        <yoshfuji@linux-ipv6.org>
Subject: Re: [PATCH v3 net 3/4] dccp/tcp: Update saddr under bhash's lock.
Date:   Fri, 18 Nov 2022 16:49:20 -0800
Message-ID: <20221119004920.27975-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAJnrk1aYK6TioDBnGhKuxajOzm-Df+MiUd+O3hDbnup83GwNWw@mail.gmail.com>
References: <CAJnrk1aYK6TioDBnGhKuxajOzm-Df+MiUd+O3hDbnup83GwNWw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.223]
X-ClientProxiedBy: EX13D45UWA002.ant.amazon.com (10.43.160.38) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

From:   Joanne Koong <joannelkoong@gmail.com>
Date:   Fri, 18 Nov 2022 15:20:20 -0800
> On Fri, Nov 18, 2022 at 1:00 PM Kuniyuki Iwashima <kuniyu@amazon.com> wrote:
> >
> > When we call connect() for a socket bound to a wildcard address, we update
> > saddr locklessly.  However, it could result in a data race; another thread
> > iterating over bhash might see a corrupted address.
> >
> > Let's update saddr under the bhash bucket's lock.
> 
> Thanks for the quick turnaround!
> 
> >
> > Fixes: 3df80d9320bc ("[DCCP]: Introduce DCCPv6")
> > Fixes: 7c657876b63c ("[DCCP]: Initial implementation")
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.com>
> > ---
> >  include/net/inet_hashtables.h |  2 +-
> >  net/dccp/ipv4.c               | 22 +++-----------
> >  net/dccp/ipv6.c               | 23 +++------------
> >  net/ipv4/af_inet.c            | 11 +------
> >  net/ipv4/inet_hashtables.c    | 55 +++++++++++++++++++++++++++++------
> >  net/ipv4/tcp_ipv4.c           | 20 +++----------
> >  net/ipv6/tcp_ipv6.c           | 19 ++----------
> >  7 files changed, 63 insertions(+), 89 deletions(-)
> >
> > diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
> > index 3af1e927247d..ba06e8b52264 100644
> > --- a/include/net/inet_hashtables.h
> > +++ b/include/net/inet_hashtables.h
> > @@ -281,7 +281,7 @@ inet_bhash2_addr_any_hashbucket(const struct sock *sk, const struct net *net, in
> >   * sk_v6_rcv_saddr (ipv6) changes after it has been binded. The socket's
> >   * rcv_saddr field should already have been updated when this is called.
> >   */
> > -int inet_bhash2_update_saddr(struct inet_bind_hashbucket *prev_saddr, struct sock *sk);
> > +int inet_bhash2_update_saddr(struct sock *sk, void *saddr, int family);
> >
> >  void inet_bind_hash(struct sock *sk, struct inet_bind_bucket *tb,
> >                     struct inet_bind2_bucket *tb2, unsigned short port);
> > diff --git a/net/dccp/ipv4.c b/net/dccp/ipv4.c
> > index 40640c26680e..95e376e3b911 100644
> > --- a/net/dccp/ipv4.c
> > +++ b/net/dccp/ipv4.c
> > @@ -45,11 +45,10 @@ static unsigned int dccp_v4_pernet_id __read_mostly;
> >  int dccp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
> >  {
> >         const struct sockaddr_in *usin = (struct sockaddr_in *)uaddr;
> > -       struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
> > -       __be32 daddr, nexthop, prev_sk_rcv_saddr;
> >         struct inet_sock *inet = inet_sk(sk);
> >         struct dccp_sock *dp = dccp_sk(sk);
> >         __be16 orig_sport, orig_dport;
> > +       __be32 daddr, nexthop;
> >         struct flowi4 *fl4;
> >         struct rtable *rt;
> >         int err;
> > @@ -91,26 +90,13 @@ int dccp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
> >                 daddr = fl4->daddr;
> >
> >         if (inet->inet_saddr == 0) {
> > -               if (inet_csk(sk)->icsk_bind2_hash) {
> > -                       prev_addr_hashbucket =
> > -                               inet_bhashfn_portaddr(&dccp_hashinfo, sk,
> > -                                                     sock_net(sk),
> > -                                                     inet->inet_num);
> > -                       prev_sk_rcv_saddr = sk->sk_rcv_saddr;
> > -               }
> > -               inet->inet_saddr = fl4->saddr;
> > -       }
> > -
> > -       sk_rcv_saddr_set(sk, inet->inet_saddr);
> > -
> > -       if (prev_addr_hashbucket) {
> > -               err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> > +               err = inet_bhash2_update_saddr(sk,  &fl4->saddr, AF_INET);
> >                 if (err) {
> > -                       inet->inet_saddr = 0;
> > -                       sk_rcv_saddr_set(sk, prev_sk_rcv_saddr);
> >                         ip_rt_put(rt);
> >                         return err;
> >                 }
> > +       } else {
> > +               sk_rcv_saddr_set(sk, inet->inet_saddr);
> >         }
> >
> >         inet->inet_dport = usin->sin_port;
> > diff --git a/net/dccp/ipv6.c b/net/dccp/ipv6.c
> > index 626166cb6d7e..94c101ed57a9 100644
> > --- a/net/dccp/ipv6.c
> > +++ b/net/dccp/ipv6.c
> > @@ -934,26 +934,11 @@ static int dccp_v6_connect(struct sock *sk, struct sockaddr *uaddr,
> >         }
> >
> >         if (saddr == NULL) {
> > -               struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
> > -               struct in6_addr prev_v6_rcv_saddr;
> > -
> > -               if (icsk->icsk_bind2_hash) {
> > -                       prev_addr_hashbucket = inet_bhashfn_portaddr(&dccp_hashinfo,
> > -                                                                    sk, sock_net(sk),
> > -                                                                    inet->inet_num);
> > -                       prev_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
> > -               }
> > -
> >                 saddr = &fl6.saddr;
> > -               sk->sk_v6_rcv_saddr = *saddr;
> > -
> > -               if (prev_addr_hashbucket) {
> > -                       err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> > -                       if (err) {
> > -                               sk->sk_v6_rcv_saddr = prev_v6_rcv_saddr;
> > -                               goto failure;
> > -                       }
> > -               }
> > +
> > +               err = inet_bhash2_update_saddr(sk, saddr, AF_INET6);
> > +               if (err)
> > +                       goto failure;
> >         }
> >
> >         /* set the source address */
> > diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> > index 4728087c42a5..0da679411330 100644
> > --- a/net/ipv4/af_inet.c
> > +++ b/net/ipv4/af_inet.c
> > @@ -1230,7 +1230,6 @@ EXPORT_SYMBOL(inet_unregister_protosw);
> >
> >  static int inet_sk_reselect_saddr(struct sock *sk)
> >  {
> > -       struct inet_bind_hashbucket *prev_addr_hashbucket;
> >         struct inet_sock *inet = inet_sk(sk);
> >         __be32 old_saddr = inet->inet_saddr;
> >         __be32 daddr = inet->inet_daddr;
> > @@ -1260,16 +1259,8 @@ static int inet_sk_reselect_saddr(struct sock *sk)
> >                 return 0;
> >         }
> >
> > -       prev_addr_hashbucket =
> > -               inet_bhashfn_portaddr(tcp_or_dccp_get_hashinfo(sk), sk,
> > -                                     sock_net(sk), inet->inet_num);
> > -
> > -       inet->inet_saddr = inet->inet_rcv_saddr = new_saddr;
> > -
> > -       err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> > +       err = inet_bhash2_update_saddr(sk, &new_saddr, AF_INET);
> >         if (err) {
> > -               inet->inet_saddr = old_saddr;
> > -               inet->inet_rcv_saddr = old_saddr;
> >                 ip_rt_put(rt);
> >                 return err;
> >         }
> > diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
> > index d745f962745e..fce0bd62d6b5 100644
> > --- a/net/ipv4/inet_hashtables.c
> > +++ b/net/ipv4/inet_hashtables.c
> > @@ -858,31 +858,65 @@ inet_bhash2_addr_any_hashbucket(const struct sock *sk, const struct net *net, in
> >         return &hinfo->bhash2[hash & (hinfo->bhash_size - 1)];
> >  }
> >
> > -int inet_bhash2_update_saddr(struct inet_bind_hashbucket *prev_saddr, struct sock *sk)
> > +static void inet_update_saddr(struct sock *sk, void *saddr, int family)
> > +{
> > +       if (family == AF_INET) {
> > +               inet_sk(sk)->inet_saddr = *(__be32 *)saddr;
> > +               sk_rcv_saddr_set(sk, inet_sk(sk)->inet_saddr);
> > +       }
> > +#if IS_ENABLED(CONFIG_IPV6)
> > +       else {
> > +               sk->sk_v6_rcv_saddr = *(struct in6_addr *)saddr;
> > +       }
> > +#endif
> > +}
> > +
> > +int inet_bhash2_update_saddr(struct sock *sk, void *saddr, int family)
> >  {
> >         struct inet_hashinfo *hinfo = tcp_or_dccp_get_hashinfo(sk);
> > +       struct inet_bind_hashbucket *head, *head2;
> >         struct inet_bind2_bucket *tb2, *new_tb2;
> >         int l3mdev = inet_sk_bound_l3mdev(sk);
> > -       struct inet_bind_hashbucket *head2;
> >         int port = inet_sk(sk)->inet_num;
> >         struct net *net = sock_net(sk);
> > +       int bhash, err = 0;
> > +
> > +       if (!inet_csk(sk)->icsk_bind2_hash) {
> > +               /* Not bind()ed before. */
> > +               inet_update_saddr(sk, saddr, family);
> > +               goto out;
> > +       }
> 
> I think it would be cleaner if this logic were outside
> bhash2_update_saddr(), since this mutates the sk's address when the
> socket hasn't been previously bound to bhash2. I think something like
> this would be clearer:
> 
> static int inet_update_saddr(struct sock *sk, void *saddr, int family)
> {
>     if (!inet_csk(sk)->icsk_bind2_hash) {
>       update_sk_saddr(sk, saddr, family)
>       return 0;
>     }
>     return inet_bhash2_update_saddr(sk, saddr, family);
> }
> 
> and then from dccp/tcp_ipv4/6_connect(), we just call
> inet_update_saddr(). This also "moves" the lower-level implementation
> details (eg underlying bind tables) to inet_hashtables.c, instead of
> it being mentioned in the higher dccp_tcp_ipv4/6 layers.
> 
> What are your thoughts?

Hmm..  There are other users of inet_reset_saddr().  If we hide the
details of reset & bhash2 logic too, we need a cleanup patch below.

So, I'll keep this part as is in the next spin.  If needed, I can
post a followup for net-next.

And I noticed UDP has the same problem, this will be another series.

Thank you!

---8<---
diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
index 95a18c029d5b..6ac7d5b8cbed 100644
--- a/include/net/inet_hashtables.h
+++ b/include/net/inet_hashtables.h
@@ -277,6 +277,7 @@ inet_bhashfn_portaddr(const struct inet_hashinfo *hinfo, const struct sock *sk,
 struct inet_bind_hashbucket *
 inet_bhash2_addr_any_hashbucket(const struct sock *sk, const struct net *net, int port);
 
+void inet_reset_saddr(struct sock *sk);
 int inet_update_saddr(struct sock *sk, void *saddr, int family);
 
 void inet_bind_hash(struct sock *sk, struct inet_bind_bucket *tb,
diff --git a/include/net/ip.h b/include/net/ip.h
index 144bdfbb25af..43939a235398 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -632,7 +632,7 @@ static inline void ip_ipgre_mc_map(__be32 naddr, const unsigned char *broadcast,
 #include <linux/ipv6.h>
 #endif
 
-static __inline__ void inet_reset_saddr(struct sock *sk)
+static __inline__ void __inet_reset_saddr(struct sock *sk)
 {
 	inet_sk(sk)->inet_rcv_saddr = inet_sk(sk)->inet_saddr = 0;
 #if IS_ENABLED(CONFIG_IPV6)
diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
index b0ababa74c02..4171077b127c 100644
--- a/net/ipv4/inet_hashtables.c
+++ b/net/ipv4/inet_hashtables.c
@@ -941,6 +941,12 @@ int inet_update_saddr(struct sock *sk, void *saddr, int family)
 }
 EXPORT_SYMBOL_GPL(inet_update_saddr);
 
+void inet_reset_saddr(struct sock *sk)
+{
+	__inet_reset_saddr(sk);
+}
+EXPORT_SYMBOL_GPL(inet_reset_saddr);
+
 /* RFC 6056 3.3.4.  Algorithm 4: Double-Hash Port Selection Algorithm
  * Note that we use 32bit integers (vs RFC 'short integers')
  * because 2^16 is not a multiple of num_ephemeral and this
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 6a320a614e54..a3c64866207d 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -1971,7 +1971,7 @@ int __udp_disconnect(struct sock *sk, int flags)
 	sock_rps_reset_rxhash(sk);
 	sk->sk_bound_dev_if = 0;
 	if (!(sk->sk_userlocks & SOCK_BINDADDR_LOCK)) {
-		inet_reset_saddr(sk);
+		__inet_reset_saddr(sk);
 		if (sk->sk_prot->rehash &&
 		    (sk->sk_userlocks & SOCK_BINDPORT_LOCK))
 			sk->sk_prot->rehash(sk);
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index 024191004982..fea2de97ba54 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -411,7 +411,7 @@ static int __inet6_bind(struct sock *sk, struct sockaddr *uaddr, int addr_len,
 		      (flags & BIND_FORCE_ADDRESS_NO_PORT))) {
 		if (sk->sk_prot->get_port(sk, snum)) {
 			sk->sk_ipv6only = saved_ipv6only;
-			inet_reset_saddr(sk);
+			__inet_reset_saddr(sk);
 			err = -EADDRINUSE;
 			goto out;
 		}
@@ -419,7 +419,7 @@ static int __inet6_bind(struct sock *sk, struct sockaddr *uaddr, int addr_len,
 			err = BPF_CGROUP_RUN_PROG_INET6_POST_BIND(sk);
 			if (err) {
 				sk->sk_ipv6only = saved_ipv6only;
-				inet_reset_saddr(sk);
+				__inet_reset_saddr(sk);
 				if (sk->sk_prot->put_port)
 					sk->sk_prot->put_port(sk);
 				goto out;

---8<---


> 
> > +
> > +       bhash = inet_bhashfn(net, port, hinfo->bhash_size);
> > +       head = &hinfo->bhash[bhash];
> > +
> > +       /* If we change saddr locklessly, another thread
> > +        * iterating over bhash might see corrupted address.
> > +        */
> > +       spin_lock_bh(&head->lock);
> 
> I don't think we should be acquiring the bhash lock here. I think we
> only need to acquire it right before we mutate the saddr, and we can
> release it right after.
> 
> >
> >         /* Allocate a bind2 bucket ahead of time to avoid permanently putting
> >          * the bhash2 table in an inconsistent state if a new tb2 bucket
> >          * allocation fails.
> >          */
> >         new_tb2 = kmem_cache_alloc(hinfo->bind2_bucket_cachep, GFP_ATOMIC);
> > -       if (!new_tb2)
> > -               return -ENOMEM;
> > +       if (!new_tb2) {
> > +               err = -ENOMEM;
> > +               goto unlock;
> > +       }
> >
> >         head2 = inet_bhashfn_portaddr(hinfo, sk, net, port);
> >
> > -       spin_lock_bh(&prev_saddr->lock);
> > +       spin_lock(&head2->lock);
> >         __sk_del_bind2_node(sk);
> >         inet_bind2_bucket_destroy(hinfo->bind2_bucket_cachep, inet_csk(sk)->icsk_bind2_hash);
> > -       spin_unlock_bh(&prev_saddr->lock);
> > +       spin_unlock(&head2->lock);
> > +
> > +       inet_update_saddr(sk, saddr, family);
> >
> > -       spin_lock_bh(&head2->lock);
> > +       head2 = inet_bhashfn_portaddr(hinfo, sk, net, port);
> > +
> > +       spin_lock(&head2->lock);
> >         tb2 = inet_bind2_bucket_find(head2, net, port, l3mdev, sk);
> >         if (!tb2) {
> >                 tb2 = new_tb2;
> > @@ -890,12 +924,15 @@ int inet_bhash2_update_saddr(struct inet_bind_hashbucket *prev_saddr, struct soc
> >         }
> >         sk_add_bind2_node(sk, &tb2->owners);
> >         inet_csk(sk)->icsk_bind2_hash = tb2;
> > -       spin_unlock_bh(&head2->lock);
> > +       spin_unlock(&head2->lock);
> >
> >         if (tb2 != new_tb2)
> >                 kmem_cache_free(hinfo->bind2_bucket_cachep, new_tb2);
> >
> > -       return 0;
> > +unlock:
> > +       spin_unlock_bh(&head->lock);
> > +out:
> > +       return err;
> >  }
> >  EXPORT_SYMBOL_GPL(inet_bhash2_update_saddr);
> >
> > diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> > index 6a3a732b584d..23dd7e9df2d5 100644
> > --- a/net/ipv4/tcp_ipv4.c
> > +++ b/net/ipv4/tcp_ipv4.c
> > @@ -199,15 +199,14 @@ static int tcp_v4_pre_connect(struct sock *sk, struct sockaddr *uaddr,
> >  /* This will initiate an outgoing connection. */
> >  int tcp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
> >  {
> > -       struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
> >         struct sockaddr_in *usin = (struct sockaddr_in *)uaddr;
> >         struct inet_timewait_death_row *tcp_death_row;
> > -       __be32 daddr, nexthop, prev_sk_rcv_saddr;
> >         struct inet_sock *inet = inet_sk(sk);
> >         struct tcp_sock *tp = tcp_sk(sk);
> >         struct ip_options_rcu *inet_opt;
> >         struct net *net = sock_net(sk);
> >         __be16 orig_sport, orig_dport;
> > +       __be32 daddr, nexthop;
> >         struct flowi4 *fl4;
> >         struct rtable *rt;
> >         int err;
> > @@ -251,24 +250,13 @@ int tcp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
> >         tcp_death_row = &sock_net(sk)->ipv4.tcp_death_row;
> >
> >         if (!inet->inet_saddr) {
> > -               if (inet_csk(sk)->icsk_bind2_hash) {
> > -                       prev_addr_hashbucket = inet_bhashfn_portaddr(tcp_death_row->hashinfo,
> > -                                                                    sk, net, inet->inet_num);
> > -                       prev_sk_rcv_saddr = sk->sk_rcv_saddr;
> > -               }
> > -               inet->inet_saddr = fl4->saddr;
> > -       }
> > -
> > -       sk_rcv_saddr_set(sk, inet->inet_saddr);
> > -
> > -       if (prev_addr_hashbucket) {
> > -               err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> > +               err = inet_bhash2_update_saddr(sk,  &fl4->saddr, AF_INET);
> >                 if (err) {
> > -                       inet->inet_saddr = 0;
> > -                       sk_rcv_saddr_set(sk, prev_sk_rcv_saddr);
> >                         ip_rt_put(rt);
> >                         return err;
> >                 }
> > +       } else {
> > +               sk_rcv_saddr_set(sk, inet->inet_saddr);
> >         }
> >
> >         if (tp->rx_opt.ts_recent_stamp && inet->inet_daddr != daddr) {
> > diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> > index 81b396e5cf79..2f3ca3190d26 100644
> > --- a/net/ipv6/tcp_ipv6.c
> > +++ b/net/ipv6/tcp_ipv6.c
> > @@ -292,24 +292,11 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr *uaddr,
> >         tcp_death_row = &sock_net(sk)->ipv4.tcp_death_row;
> >
> >         if (!saddr) {
> > -               struct inet_bind_hashbucket *prev_addr_hashbucket = NULL;
> > -               struct in6_addr prev_v6_rcv_saddr;
> > -
> > -               if (icsk->icsk_bind2_hash) {
> > -                       prev_addr_hashbucket = inet_bhashfn_portaddr(tcp_death_row->hashinfo,
> > -                                                                    sk, net, inet->inet_num);
> > -                       prev_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
> > -               }
> >                 saddr = &fl6.saddr;
> > -               sk->sk_v6_rcv_saddr = *saddr;
> >
> > -               if (prev_addr_hashbucket) {
> > -                       err = inet_bhash2_update_saddr(prev_addr_hashbucket, sk);
> > -                       if (err) {
> > -                               sk->sk_v6_rcv_saddr = prev_v6_rcv_saddr;
> > -                               goto failure;
> > -                       }
> > -               }
> > +               err = inet_bhash2_update_saddr(sk, saddr, AF_INET6);
> > +               if (err)
> > +                       goto failure;
> >         }
> >
> >         /* set the source address */
> > --
> > 2.30.2

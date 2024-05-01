Return-Path: <dccp+bounces-140-lists+dccp=lfdr.de@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C508B8B05
	for <lists+dccp@lfdr.de>; Wed,  1 May 2024 15:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1131D1F2337C
	for <lists+dccp@lfdr.de>; Wed,  1 May 2024 13:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4038B12E1EE;
	Wed,  1 May 2024 13:16:19 +0000 (UTC)
X-Original-To: dccp@vger.kernel.org
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE8612E1ED
	for <dccp@vger.kernel.org>; Wed,  1 May 2024 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.211.30.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714569379; cv=none; b=seOY6mnVDuEScfvoLphTcWbfdk08YbqSvRl9DO56HvuY3nXpjHy41yMK7IgTar0uD7sTPKntWajiVn9x24tK7JTRdE3qcK2+otRZPnfCxTQ++j/aRX/fbT45GvSpWAHDmXxgC8fRU8MRh3T6pJ5ovTfGTH0OCyyRhBCzYPx2DNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714569379; c=relaxed/simple;
	bh=juN4Ny8Hm6qA0zsZ9K4+OvOZiB1X0k0WkV7pZSOQMuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1EK9wBrrOhpKUjymhhZWo2XrGjzy//TMzNMo3d5IyARaMraAiHJJt6C65zafhUWIfsP1HF9OCcXCqTpFzFMpi7391/f3fDuqOU3+biWd5XkIvwv//W+Dtbd1eAYSvozWWOGvNoXSRpZaTIXJzUOwpVfUuEEC3jSXrk72+WIsUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=none smtp.mailfrom=queasysnail.net; arc=none smtp.client-ip=207.211.30.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=queasysnail.net
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-F3TRqiq5Oo6qB2-P5FKodQ-1; Wed, 01 May 2024 09:16:08 -0400
X-MC-Unique: F3TRqiq5Oo6qB2-P5FKodQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07D1C802E4D;
	Wed,  1 May 2024 13:16:06 +0000 (UTC)
Received: from hog (unknown [10.39.193.137])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC61C271A4;
	Wed,  1 May 2024 13:15:55 +0000 (UTC)
Date: Wed, 1 May 2024 15:15:54 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: j.granados@samsung.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Ahern <dsahern@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Remi Denis-Courmont <courmisch@gmail.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Jan Karcher <jaka@linux.ibm.com>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, Martin Schiller <ms@dev.tdt.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Simon Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>,
	Joerg Reuter <jreuter@yaina.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dccp@vger.kernel.org,
	linux-wpan@vger.kernel.org, mptcp@lists.linux.dev,
	linux-hams@vger.kernel.org, linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-afs@lists.infradead.org,
	linux-sctp@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	linux-x25@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	lvs-devel@vger.kernel.org
Subject: Re: [PATCH net-next v6 8/8] ax.25: x.25: Remove the now superfluous
 sentinel elements from ctl_table array
Message-ID: <ZjJAikcdWzzaIr1s@hog>
References: <20240501-jag-sysctl_remset_net-v6-0-370b702b6b4a@samsung.com>
 <20240501-jag-sysctl_remset_net-v6-8-370b702b6b4a@samsung.com>
Precedence: bulk
X-Mailing-List: dccp@vger.kernel.org
List-Id: <dccp.vger.kernel.org>
List-Subscribe: <mailto:dccp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dccp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240501-jag-sysctl_remset_net-v6-8-370b702b6b4a@samsung.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

2024-05-01, 11:29:32 +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which will
> reduce the overall build time size of the kernel and run time memory
> bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Avoid a buffer overflow when traversing the ctl_table by ensuring that
> AX25_MAX_VALUES is the same as the size of ax25_param_table. This is
> done with a BUILD_BUG_ON where ax25_param_table is defined and a
> CONFIG_AX25_DAMA_SLAVE guard in the unnamed enum definition as well as
> in the ax25_dev_device_up and ax25_ds_set_timer functions.
                                ^^
nit:                            not anymore ;)
(but not worth a repost IMO)


> diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
> index c4f8adbf8144..c50a58d9e368 100644
> --- a/net/ax25/ax25_ds_timer.c
> +++ b/net/ax25/ax25_ds_timer.c
> @@ -55,6 +55,7 @@ void ax25_ds_set_timer(ax25_dev *ax25_dev)
>  	ax25_dev->dama.slave_timeout =
>  		msecs_to_jiffies(ax25_dev->values[AX25_VALUES_DS_TIMEOUT]) / 10;
>  	mod_timer(&ax25_dev->dama.slave_timer, jiffies + HZ);
> +	return;

nit: return not needed here since we're already at the bottom of the
function, but probably not worth a repost of the series.

>  }

-- 
Sabrina



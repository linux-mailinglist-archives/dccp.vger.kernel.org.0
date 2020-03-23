Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7F118FCF6
	for <lists+dccp@lfdr.de>; Mon, 23 Mar 2020 19:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgCWSqB (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Mon, 23 Mar 2020 14:46:01 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33172 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbgCWSqB (ORCPT <rfc822;dccp@vger.kernel.org>);
        Mon, 23 Mar 2020 14:46:01 -0400
Received: by mail-yb1-f193.google.com with SMTP id p196so4056521ybc.0
        for <dccp@vger.kernel.org>; Mon, 23 Mar 2020 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZD7/ATruuR8NRvdfBN7+Qi9sh7ywUUPfAO2yyzLIz1E=;
        b=kvfXmaOwoZFGrOh5aIUvAhTBITelayYfPkSLj1cRrvga94U8gaH693Py6Vo/ajX4Q1
         9SwZZA2arAeuJE7ZjjIhlJlG4fYIr/KtnJ/i+HFNrlwcelTOYajzoHFGNAuT/OY23gsA
         yqk7TP2umuK5l/+P+IeCqqGJDJDkMn0pAkRqvz/VHDzeQjZn++d6tHWxC53L+cgjOyAF
         X7gokJAZENM+xW82kmIID+8i+KfximdguGF6G/73QgQD/EAEhllf9muwVv74xqOTSKjY
         iGiJvE9CgrWZ8Htnzd91hy1JeFozaq5y0jkLBysGRMmIwZiATvN2nDMS3Eb7ZzkYlo+e
         IjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZD7/ATruuR8NRvdfBN7+Qi9sh7ywUUPfAO2yyzLIz1E=;
        b=qj4YNJn7Xb28DZo9vNPZiDVWwOMF7lb/36+dQYn9vLlu0h+tv8juNX9UtHPNggvjP4
         VqpnaKp4QDRxjsoNhMMYbN615+c0PnkkE0HWHVVsoJfgjHafmZapD7kkjLaPAsaKdWsj
         1lRCQHvRbbCHkE9rcQHZQ1AiAgMzOpj/MqeL496mEsP+Jc0rFKh2preJIgH5/F97ZBWu
         8iwUvdqZcuhlAhyZfFU6pgD5Q2dFC+cF+8UMAH9KBBU3RpxyT05yEpkMtxaZj4bsS5uH
         UuGrBzHWJPOx4AjkiVfG/gHxhYFnpWz15InMTbGqhdchv2sJvLYAD9+/lyN8T8UEetW/
         hjnw==
X-Gm-Message-State: ANhLgQ0IbSMm0vrquslEwxS/Is39Ge9d6gU7Q4FHs85UA/34XiItu5cS
        ZKeASmAHd2IBdBqNTIuU5Nm4bZ//r3dRx2AaVeNh+A==
X-Google-Smtp-Source: ADFU+vvBrruOh4WIZciJ6/BEzpsNg721CBLrFVfaFXtvnnk1x2jc6X3b6gzNPONGIUjhpi99zU2HV6CCIwxvjG34syg=
X-Received: by 2002:a25:6cc5:: with SMTP id h188mr34935921ybc.520.1584989159878;
 Mon, 23 Mar 2020 11:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200323181814.87661-1-kuniyu@amazon.co.jp> <20200323181814.87661-2-kuniyu@amazon.co.jp>
In-Reply-To: <20200323181814.87661-2-kuniyu@amazon.co.jp>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 23 Mar 2020 11:45:48 -0700
Message-ID: <CANn89iJzxqF8j6uUO9BqmMY0tVh+intVj-v-tygXc_8r6-wjkg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp/dccp: Move initialisation of refcounted
 into if block.
To:     Kuniyuki Iwashima <kuniyu@amazon.co.jp>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        dccp@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        Kuniyuki Iwashima <kuni1840@gmail.com>,
        osa-contribution-log@amazon.com
Content-Type: text/plain; charset="UTF-8"
Sender: dccp-owner@vger.kernel.org
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

On Mon, Mar 23, 2020 at 11:18 AM Kuniyuki Iwashima <kuniyu@amazon.co.jp> wrote:
>
> The refcounted is initialised at most three times.
>
>   - __inet_lookup_skb() sets it true.
>   - skb_steal_sock() is false and __inet_lookup() sets it true.
>   - __inet_lookup_established() is false and __inet_lookup() sets it false.
>
> We do not need to initialise refcounted again and again, so we should do
> it just before return.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
> ---

Well, I do not believe this patch (and the following one) makes things
more readable.

I doubt setting a boolean in a register or a stack variable has any cost,
I prefer letting the compiler optimize this.

The ehash lookup cost is at least 2 or 3 cache lines, this is the
major contribution.

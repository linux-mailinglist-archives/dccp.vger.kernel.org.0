Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 600D9767C1A
	for <lists+dccp@lfdr.de>; Sat, 29 Jul 2023 06:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbjG2EbD (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Sat, 29 Jul 2023 00:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjG2EbC (ORCPT <rfc822;dccp@vger.kernel.org>);
        Sat, 29 Jul 2023 00:31:02 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0AB49D5
        for <dccp@vger.kernel.org>; Fri, 28 Jul 2023 21:31:01 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-583c1643f51so2644027b3.1
        for <dccp@vger.kernel.org>; Fri, 28 Jul 2023 21:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690605060; x=1691209860;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE5l1VpxCufAhFhvUtJmOdSBkyXi7tvoVHorDEIVEKk=;
        b=ZJfSP9Ai5zq8/2gGe3AWaxRYSIWcMGMa0VSeMPe2GQbcZjA5+fcsmnDuKEGuu6x197
         D/K6G2utnm5RNrm0jrpJpmqoZWyq5kZgEP4s+sZCZyBe9f4niOAXuZhBxGjGxCEgSOGQ
         6CphsLLz29Lk6iUJbgXTBFsbLp8VQ3phkyn2rrSbQ4OwyMDmIN6qMyDIbScjIWd7bNoG
         oGFeOryUSsfVKuFlfpMTkXSOtUTL02bgoPzM8BTHQDPOnX8DwD3D/AjtyJ2i08vi4pV+
         72PkineKcOkvH3nK+7Gw6zJECTt6VrbUt/BrJVP4TmEDkFOvRxP7XvqA0WKIyFENdJu/
         /euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690605060; x=1691209860;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RE5l1VpxCufAhFhvUtJmOdSBkyXi7tvoVHorDEIVEKk=;
        b=Tjmtn233ZpOGqD9doktYySiIkt0F3KzJURVv4WQYGolAhve5QZlHJGijAeY0QA2cQh
         vBO3QE/HfE6uAaCsFYHr4a38z64AFfMKREQ5LkQyB5XYpSkNr8wU6Jy67BH+w5eicbmU
         H9OJb//G0dfxlEwYw7MSw3v2SBVFHffU0Y8yIMuSVgH1HI0JqS5jBZk0q2XYFw3OOrSJ
         19rAzFzo8q+SLhVp1CSozVvjwTIUkwkiw1GP88CilGrm5S/0O4vudBQZzEoV1zSyitT1
         51LCrW+x3qvciMqml+WSOONvnDrjEjmwalGUxjdBqx2GEOb+UOL4AE3rhJguqhvqg1YM
         N3UA==
X-Gm-Message-State: ABy/qLbIwTQfm+qhGmfjqC5fLgGf9KZvPpwjR/1fYTK+KgZkQsuYx63u
        R0QOojujIZq90Sgaq2fLo6bkEv3rfmWVIJbS4wA=
X-Google-Smtp-Source: APBJJlFdZKfziF3CIJ9oAZkLeL6OiyForpbBK41JsZRKBhGzAZdyvCmRUqYdl9l8SOG3GhuusHlNOoJOUzj1bk5ZozY=
X-Received: by 2002:a81:6dd8:0:b0:567:7dc3:2618 with SMTP id
 i207-20020a816dd8000000b005677dc32618mr507301ywc.1.1690605060080; Fri, 28 Jul
 2023 21:31:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:6326:b0:31a:14a8:aa9e with HTTP; Fri, 28 Jul 2023
 21:30:59 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   Bintu Felicia <yerobarry10@gmail.com>
Date:   Sat, 29 Jul 2023 05:30:59 +0100
Message-ID: <CAD1=OdU8CNRTkW-trhk78giS0M7Csu=qw30JfYK9hAYsXvXKuw@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail,
with a wish for much happiness.

Warm regards,

Felicia Bintu

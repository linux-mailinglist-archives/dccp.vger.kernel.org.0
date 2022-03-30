Return-Path: <dccp-owner@vger.kernel.org>
X-Original-To: lists+dccp@lfdr.de
Delivered-To: lists+dccp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE45C4ECBB2
	for <lists+dccp@lfdr.de>; Wed, 30 Mar 2022 20:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348792AbiC3STr (ORCPT <rfc822;lists+dccp@lfdr.de>);
        Wed, 30 Mar 2022 14:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349899AbiC3STo (ORCPT <rfc822;dccp@vger.kernel.org>);
        Wed, 30 Mar 2022 14:19:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152854BB83
        for <dccp@vger.kernel.org>; Wed, 30 Mar 2022 11:17:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id p15so37273784lfk.8
        for <dccp@vger.kernel.org>; Wed, 30 Mar 2022 11:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=BUnAD3xqyyj2lm0zvOZVtbyxWcA123m5vBtT7P90vEA=;
        b=COaCAbAL84KPw3zkTdXKHa2gj0S9jD4uN0z7VuwXiJ2n/iBDLngoLF+XUwyq4ohDb+
         EYk2uauBhL0XFFsRFPWK10Ge/UmGOK6Q69CGtmoIn6WO2vWBS0JSzZoHaKRoAi2210dd
         c7l39MJx0G1USPj7hKX+SzodjulpwBwL9ZyhtG2Vo8p3VgQIhAaU/fp/zv9vo9o+7xA9
         RuJOkq+ADa/rorOFSXqkFKiBk7x8xqcVd1Z+Fuo08nMXwY/BUVv37SnbR1rBNFQaT9Ub
         edPU7avhX46w2jArJuhlFP/hob+0Xga3ZPiF0hB9IO894lBp6MzB0eZUXLYBw2mWS+Cr
         WrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=BUnAD3xqyyj2lm0zvOZVtbyxWcA123m5vBtT7P90vEA=;
        b=npXMFBHCc+w/GjZL01w0OnipBLp1FI2PZQBICr5m03kUCXw3S/cJJUPFq25b/hoVb9
         EHU+7PNTf/vT4lVrmuMj6tJ6nGb8B3kJG+O8YshHiQ1z1vSLHDT+K6jUFZ/9H7bv0RZ3
         Tghkff+azuGakPXG+Yquczc/DprSVc2a/l/aMnu7crQ1AnTRNbwIj4Q8iXtjxeeXJrV6
         C/d1XaIHfNr0NckXt2kvh28NyJNfNrcPk1qlmW18NNCdIcS9nhU2DyybYlYvHoBBy/fF
         khj6lf60yRcV/B9ddMut1P3r3mMfB/zcSRuqPIC5iO4KrnDLV5jm8eVJDYuXuJsMtOcK
         SQhw==
X-Gm-Message-State: AOAM533F4qs3B4a1p36Js7YH7yDM4P5GgjiuljekzrnDYj9YicREpOMf
        kBanaRgNqTZH3+4obDkTcj1XOzdvzo5/1xeXpFQ=
X-Google-Smtp-Source: ABdhPJx7uPj5Gb/tzoRIuMQkcrpPdQSHSDIQdXC3Q3N/6p2ovZeFuYwpvc4PtbF4UHllgjvlNxor4S73iqqlBC8TJmQ=
X-Received: by 2002:a19:3801:0:b0:444:150b:9ef5 with SMTP id
 f1-20020a193801000000b00444150b9ef5mr7529793lfa.523.1648664271209; Wed, 30
 Mar 2022 11:17:51 -0700 (PDT)
MIME-Version: 1.0
Reply-To: isabellasayouba0@gmail.com
Sender: 33s.marshaa0@gmail.com
Received: by 2002:a05:6512:3b85:0:0:0:0 with HTTP; Wed, 30 Mar 2022 11:17:50
 -0700 (PDT)
From:   Mrs Isabella Sayouba <isabellasayouba0@gmail.com>
Date:   Wed, 30 Mar 2022 18:17:50 +0000
X-Google-Sender-Auth: 3QbAZg8Vn9ne3DjSRHjpQOmYGSM
Message-ID: <CAFsTCOrfm7f5wOf0aquZUYUZJThj2UUfUy2+Sz=B2R90O+u5Ow@mail.gmail.com>
Subject: =?UTF-8?B?44GC44GE44GV44Gk44CC?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_99,BAYES_999,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <dccp.vger.kernel.org>
X-Mailing-List: dccp@vger.kernel.org

44GC44GE44GV44Gk44CCDQoNCua2meOCkua1geOBl+OBquOBjOOCieOBk+OBruODoeODvOODq+OC
kuabuOOBhOOBpuOBhOOBvuOBmeOAguengeOBruebruOBq+OBr+Wkp+OBjeOBquaCsuOBl+OBv+OB
jOOBguOCiuOBvuOBmeOAguengeOBruWQjeWJjeOBr+OCpOOCtuODmeODqeODu+OCteODqOOCpuOD
kOOBleOCk+OBp+OBmeOAguODgeODpeODi+OCuOOCouWHuui6q+OBp+OAgeODluODq+OCreODiuOD
leOCoeOCveOBrueXhemZouOBi+OCiemAo+e1oeOCkuWPluOCiuOBvuOBmeOAguengeOBr+OBguOB
quOBn+OBq+W/g+OCkumWi+OBhOOBpuaEn+WLleOBl+OBn+OBruOBp+OAgeOBguOBquOBn+OBq+ip
seOBmeS7peWkluOBq+mBuOaKnuiCouOBr+OBguOCiuOBvuOBm+OCk+OAguengeOBr+OAgTIwMTHl
ubTjgavkuqHjgY/jgarjgovliY3jgavjg5bjg6vjgq3jg4rjg5XjgqHjgr3jga7jg4Hjg6Xjg4vj
grjjgqLlpKfkvb/jgag55bm06ZaT5YON44GE44Gm44GE44GfU2F5b3ViYUJyb3du5rCP44Go57WQ
5ama44GX44G+44GX44Gf44CC5a2Q5L6b44Gq44GX44GnMTHlubTplpPntZDlqZrjgZfjgZ/jgIIN
Cg0K5b2844Gv44Gf44Gj44GfNeaXpemWk+e2muOBhOOBn+efreOBhOeXheawl+OBruW+jOOBp+at
u+OBq+OBvuOBl+OBn+OAguW9vOOBruatu+W+jOOAgeengeOBr+WGjeWpmuOBl+OBquOBhOOBk+OB
qOOBq+axuuOCgeOBvuOBl+OBn+OAguS6oeOBj+OBquOBo+OBn+Wkq+OBjOeUn+OBjeOBpuOBhOOB
n+OBqOOBjeOAgeW9vOOBr+e3j+mhjTg1MOS4h+ODieODq+OCkumgkOOBkeOBvuOBl+OBn+OAgg0K
77yIODAw5LiHNTAwMOODieODq++8ieilv+OCouODleODquOCq+OBruODluODq+OCreODiuODleOC
oeOCveOBrummlumDveODr+OCrOODieOCpeOCsOODvOOBrumKgOihjOOBp+OAguePvuWcqOOAgeOB
k+OBruOBiumHkeOBr+OBvuOBoOmKgOihjOOBq+OBguOCiuOBvuOBmeOAguW9vOOBr+OBk+OBruOB
iumHkeOCkuODluODq+OCreODiuODleOCoeOCveOBrumJsealreOBi+OCieOBrumHkeOBrui8uOWH
uuOBq+WIqeeUqOOBp+OBjeOCi+OCiOOBhuOBq+OBl+OBvuOBl+OBn+OAgg0KDQrmnIDov5HjgIHn
p4Hjga7ljLvogIXjga/np4HjgYznmYzjgajohLPljZLkuK3jga7llY/poYzjga7jgZ/jgoHjgas3
44O25pyI6ZaT44Gv57aa44GL44Gq44GE44Gg44KN44GG44Go56eB44Gr6KiA44GE44G+44GX44Gf
44CC56eB44KS5pyA44KC5oKp44G+44Gb44Gm44GE44KL44Gu44Gv6ISz5Y2S5Lit44Gu55eF5rCX
44Gn44GZ44CC56eB44Gu54q25oWL44KS55+l44Gj44Gf44Gu44Gn44CB56eB44Gv44GT44Gu44GK
6YeR44KS44GC44Gq44Gf44Gr5rih44GX44Gm44CB5oG144G+44KM44Gq44GE5Lq644CF44Gu5LiW
6Kmx44KS44GZ44KL44GT44Go44Gr44GX44G+44GX44Gf44CC44GC44Gq44Gf44Gv44GT44Gu44GK
6YeR44KS56eB44GM44GT44GT44Gn5oyH56S644GZ44KL5pa55rOV44Gn5Yip55So44GZ44KL44Gn
44GX44KH44GG44CC56eB44Gv44GC44Gq44Gf44Gr44GC44Gq44Gf44Gu5YCL5Lq655qE44Gq5L2/
55So44Gu44Gf44KB44Gr57eP44GK6YeR44GuMzDjg5Hjg7zjgrvjg7Pjg4jjgpLlj5bjgaPjgabm
rLLjgZfjgYTjgafjgZnjgILjgYrph5Hjga43MO+8heOBr+engeOBruWQjeWJjeOBp+WtpOWFkOmZ
ouOCkuW7uuOBpuOAgemAmuOCiuOBruiyp+OBl+OBhOS6uuOAheOCkuWKqeOBkeOCi+OBn+OCgeOB
q+S9v+OBhuOBp+OBl+OCh+OBhuOAguengeOBr+WtpOWFkOOBqOOBl+OBpuiCsuOBoeOBvuOBl+OB
n+OBjOOAgeelnuOBruWutuOCkue2reaMgeOBmeOCi+OBn+OCgeOBoOOBkeOBq+OAgeWutuaXj+OB
q+OBr+iqsOOCguOBhOOBvuOBm+OCk+OAguOBk+OBrueXheawl+OBjOengeOCkuOBqOOBpuOCguiL
puOBl+OCgeOBn+OBruOBp+OAgeelnuOBjOengeOBrue9quOCkui1puOBl+OAgealveWckuOBp+en
geOBrumtguOCkuWPl+OBkeWFpeOCjOOCi+OCiOOBhuOBq+OBk+OCjOOCkuOBl+OBpuOBhOOCi+OB
ruOBp+OBmeOAgg0KDQrov5Tkv6HjgpLlj5fjgZHlj5bjgormrKHnrKzjgIHjg5bjg6vjgq3jg4rj
g5XjgqHjgr3jga7pioDooYzjga7pgKPntaHlhYjjgpLjgYrnn6XjgonjgZvjgZfjgb7jgZnjgILj
gb7jgZ/jgIHpioDooYzjga7nj77lnKjjga7lj5flj5bkurrjgafjgYLjgovjgZPjgajjgpLoqLzm
mI7jgZnjgovmqKnpmZDmm7jjgpLnmbrooYzjgZnjgovjgojjgYbpioDooYzplbfjgavmjIfnpLrj
gZfjgb7jgZnjgILnp4HjgYzjgZPjgZPjgafov7DjgbnjgZ/jgojjgYbjgavjgYLjgarjgZ/jgYzj
gZ3jgozjgavlv5zjgZjjgabooYzli5XjgZnjgovjgZPjgajjgpLnp4Hjgavkv53oqLzjgZfjgabj
gY/jgaDjgZXjgYTjgIINCg0K44Kk44K244OZ44Op44O744K144Oo44Km44OQ5aSr5Lq644GL44KJ
44CCDQo=

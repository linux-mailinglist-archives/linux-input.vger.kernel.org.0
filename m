Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF432419F8
	for <lists+linux-input@lfdr.de>; Tue, 11 Aug 2020 12:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgHKKxy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Aug 2020 06:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgHKKxx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Aug 2020 06:53:53 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC91C06174A
        for <linux-input@vger.kernel.org>; Tue, 11 Aug 2020 03:53:53 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c15so6411810lfi.3
        for <linux-input@vger.kernel.org>; Tue, 11 Aug 2020 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version;
        bh=E/KooAQ65hs98T+3xI5X13bqIjJN8Y8JKuP0CmFdqcA=;
        b=rvYc8kvFD+APDn/BD7rSrsay68l2UDP04HmB/H57kphkKZTBOQAD4bE9PafGuH/iD3
         tT9Wy/YCsJ1uKxLuzBHuUxjtQBPDLi7luRzYLpoIRJT4g11mp2QgM78cISWoUF83ZrPI
         /lUCCSfqB1ByzoRRnMaB1cH4Jn/wfEJgrDf9+eVshHsOKDjXP2Q+/k8u7hRzvUbDUa3s
         /IvTi4LtpCaCW5fLT/4wWGpfOgafBqtc+YiN/WvLRFi86AkdDGdA/k/OWQ6/gPOgYntb
         THuPta0ZpXBKYUve7RED+EdUEbRbfn9QUPZaFMDhEqdbJzN95lA7Uen8UVAONfrIF7sw
         gojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version;
        bh=E/KooAQ65hs98T+3xI5X13bqIjJN8Y8JKuP0CmFdqcA=;
        b=JHx4Px6IeZxKNcQ1k52kO93xbwrWjnh5R/ruEi7qKKmL2z7S9kRzwcudDyzxeqphfz
         i4SfPKn6rHkm6gDclyT/QwyHZ3HkKZYAiHNOUUs/XG0xtdFDR36sXLHW6qjzW/7+/GIp
         A4tk6vtaVKZEWIzXPJQQZR0+DHl3/J4FyP/wyrMXsBkfIIwuZayQHJ0yg6K+V1+ugKGs
         Z0mAez+2akwQx0iYPqJci4vXp8x+wwIqppUsxOeUmGKAv8pl/tQVzR59KrMpgpbRlmiE
         8t5DpjTiSfhQUvpTsi0gtC5IwrsfluuKTa7gTcfEV0a2SiIemfdgePhrYcsHYNs8NwrD
         aMtw==
X-Gm-Message-State: AOAM533M9iqfbXKwIryUGhI/fKoe8AoZZl8jibqOrmOUIuVjREnaWm6w
        23rnyWi53wWtz2P6Qol0MG7q5VHj8Yw=
X-Google-Smtp-Source: ABdhPJzICKgL9MvUzSmP6lbmODpljuldFwEtJQIJEzPsIbBSM7AITFme0G3NqEm3ceZWgXYQRUeinA==
X-Received: by 2002:a19:cc9:: with SMTP id 192mr2968823lfm.61.1597143231871;
        Tue, 11 Aug 2020 03:53:51 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id p11sm10051938ljg.17.2020.08.11.03.53.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 03:53:51 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     linux-input@vger.kernel.org
Subject: RFC: Adding support for other usages
Date:   Tue, 11 Aug 2020 13:53:47 +0300
Message-ID: <87y2mlo3lw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

I noticed that HID Usage And Descriptions specifications contains many
more usages than currently supported by the kernel. At the moment I'm
concerned exclusively about digitizers.

Taking as an example usage 0x0f (Capacitive Heat Map Digitizer), should
support for that be added to hid-multitouch.c or should we have a new
hid-heat-map.c driver? Any suggestions?

Best regards

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8yeLsACgkQzL64meEa
mQZV0RAArd1yhrlFPpDy3Om2q1Eeonof27sFAd/XX2jjuyPQD2QF3zgsUM8t2IES
IcQfezpUFMcPp7Qt28sYx9sCtF4Zzf3A+P+Fj0BClSLtaMEpt/XS7f90VuVamhOK
2CFPuUjbBVTwYNc6s/dt0xog+xy00eKeMxHUlAwR6lmjhl4GZNSiChhZkejnrxT1
WSBHJvhfgkOX1F05P16PnyVbIuUQ0n9gdmKEaMHk8SCW83PhBOnKdZUZ8hOIkmcz
fwI2pB90pdeBESnTyX8BZLtb5Lmq/ifMyxHto9ZwTonILLlRdffh4ctnbfdkYJhk
xd572ZeIAXq1qu20hPtKuWevtSV7iyDHw9j8KV4/PFobUK3eU8TdFc1p+TArY7y6
QgCi1JOXo3k/xgl3wCdQJch46KtbNNcpwgqpRLDB3YrZ7MG7oZO16E56XB7g7RtB
ZnKLuTmKW0QI1QCMhsDZzYnzvFlC5/aEOHasJRNM1mjoS4Ew5xm4IIhvL2Amnzu/
K3aSXr9/zHw4miVhDUA/jgCPXvDCIlE/HliMgQDC4AKTC1GDa2dGBwBf/R6xo6xh
CL71XNKY6E2tUCbAytCK3RROcNfTIE6nYAIOwz3iR3reEcbvBTgmGe2LMjn/lHUf
brUmZSnAcMroMnoXqVfwGgkVdrqRckafG8gvShNJkRxe5VMCoVA=
=h4DE
-----END PGP SIGNATURE-----
--=-=-=--

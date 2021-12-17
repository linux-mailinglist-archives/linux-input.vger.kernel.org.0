Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934794781D6
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 01:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhLQA73 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 19:59:29 -0500
Received: from smtp1.rz.tu-harburg.de ([134.28.205.38]:53798 "EHLO
        smtp1.rz.tu-harburg.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhLQA73 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 19:59:29 -0500
X-Greylist: delayed 578 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Dec 2021 19:59:28 EST
Received: from mail.tu-harburg.de (mail4.rz.tu-harburg.de [134.28.202.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.tuhh.de", Issuer "DFN-Verein Global Issuing CA" (verified OK))
        by smtp1.rz.tu-harburg.de (Postfix) with ESMTPS id 4JFVkN2P99zxct;
        Fri, 17 Dec 2021 01:49:48 +0100 (CET)
Received: from mailspring.rz.tuhh.de (mailspring.rz.tuhh.de [134.28.202.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cfa9884@KERBEROS.TU-HARBURG.DE)
        by mail.tu-harburg.de (Postfix) with ESMTPSA id 4JFVkN171vzJrFd;
        Fri, 17 Dec 2021 01:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuhh.de; s=x2021-50;
        t=1639702188; bh=vJzoMSe5078XB93HmI/RKpVoQdczOQVhiEycNgq18bE=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=1+kkbRrcYHNuRrWYEneQ965pIkkWspwPLJc1W7a0y6/BbHytmvsvu4GuHuYuY7Zxd
         87OzPTe0+LpGEGATHHmzZ2FZYMqMGoSSiT1QIc+S6AUSqnMY7L3xbjnOdtowTh9/rL
         xysyCOzfGJK2kKT6aUXBmXziImjKcFL/F+CACN/o=
Date:   Fri, 17 Dec 2021 01:49:46 +0100
From:   Maximilian Schmidt <maximilian.schmidt@tuhh.de>
To:     ValdikSS <iam@valdikss.org.ru>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Message-ID: <20211217004946.jv5hii5g4n24vovu@schmidma-tower-arch>
References: <20211101221132.1564649-1-iam@valdikss.org.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o6xxbt5sdk3e6alk"
Content-Disposition: inline
In-Reply-To: <20211101221132.1564649-1-iam@valdikss.org.ru>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--o6xxbt5sdk3e6alk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I quickly tested the patchset on archlinux using a custom kernel.
Based on 5.15.8, I can confirm these changes work like a charm.
I tested with an "Lenovo TrackPoint Keyboard II"

On Tue, Nov 02, 2021 at 01:11:29AM +0300, ValdikSS wrote:
> This patchset adds support for Lenovo ThinkPad TrackPoint Keyboard II,
> in both USB and Bluetooth modes.
>=20
> It brings additional functional keys mapping, native vertical and horizon=
tal
> scrolling, trackpoint sensitivity configuration and Fn-Lock sync.
>=20
> There is no code difference between the previous patchset, only minor
> patch subject changes and code/comments split.
>=20
> ValdikSS (3):
>   HID: lenovo: Add support for ThinkPad TrackPoint Keyboard II
>   HID: lenovo: Sync Fn-lock state on button press for Compact and
>     TrackPoint II keyboards
>   HID: lenovo: Add note about different report numbers
>=20
>  drivers/hid/hid-ids.h    |   2 +
>  drivers/hid/hid-lenovo.c | 174 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 170 insertions(+), 6 deletions(-)
>=20
> --=20
> 2.31.1
>=20

--=20

--o6xxbt5sdk3e6alk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEgGnnfq5xq9E78tmvOxh34FrGoeoFAmG73qkACgkQOxh34FrG
oerTMQ//SNCkheVmsWDOpS7+PAkOUUi1mR7/A9p4b/P1J9x1VYeOm8MQ5OG3bx+e
+VV7kqBOeMBXlGleYWuGw/VM4HnnVVagfiHyCJDKkczDHBtMnNfE8JHkQ0hk46KT
Hm7MLnNg6zaMt11PHsJoZNbZ4SsIEznFAbhRye5zkfObce9Xbz4hyZXu5LWTaqTu
xPXfpprETcTRAsvPaIJRGV+G/fxJT0Gl4Lq2/4EhgXdYqWlTUzVkktfclO6CDJLH
ZZAVTeMl0/NMqij7gPs+I9KYVXLc62SmiefuO9Awf/39ggpyBkD4m/QhmrZvYGYB
J/rrxXWiwpp842DH1CEMa8vVcfEzWeUzji00FXrElUYmvFjXtgiVmCQ9Fs7IBvO3
yxZ7JGjQqypEYuR+IKyVQdvt75XVOuyKW1ijmesce5GeO32iyjO0k0um59gb/hYk
0M2c221OW9Gip0ivUXLPTDdKxyhpDoptBxB6ZLkLG1YBz4PAUcMhhS1J3Q1oeFNh
Cgmjl413ISSbDBgqmmvH3euHYbNyj79+Mr+jnsY7zL8a+T31c0xc/w61v20Fl4GG
DKXXlsVkaxILPNht2s7F59/DUyuOZmfO4kyMRsCJWJ1VNgVz1eXGSr+xja+hR93y
gWdNGaTiR3XdbkFPuLMmNnxrJOBfJBlnZ9Po/Rn1/MUbCv2THD8=
=kaOs
-----END PGP SIGNATURE-----

--o6xxbt5sdk3e6alk--

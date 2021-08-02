Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B317B3DD97B
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 16:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhHBOAg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 10:00:36 -0400
Received: from mx1.riseup.net ([198.252.153.129]:44338 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235402AbhHBN5c (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 09:57:32 -0400
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4GdfhK2tmjzDxXp;
        Mon,  2 Aug 2021 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1627912641; bh=Z65PMyFUa16d9Sdspmc+iNX0aYW4nm2Kdaiq9sG/QeQ=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
        b=B7JGXIihvF4fUqOkgTpVvdC7Z2YQnqOYiqIQlR/xYNGTLk5sYlXZXrrNRqaB41f9x
         OQXAMiXNe6RpN9/3//WfP3evUutO48L4VctJb8Rik1eXMXKTbtEo8XZSWpSogFTb+T
         98GIbF/SMvEpH5RrWr6Zv+EJps02p6P9CGVa4z6Y=
X-Riseup-User-ID: 2668D83796406052EE9BC3D2B5F80B355C6F7F5F7CB77A2C25E630036B0BFDF9
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4GdfhH5jSsz5vjx;
        Mon,  2 Aug 2021 06:57:19 -0700 (PDT)
Message-ID: <131a3c2eeffa885bfb3ee8e1c3316da6818c4310.camel@riseup.net>
Subject: Re: [PATCH v4] HID: logitech-hidpp: battery: provide CAPACITY
 property for newer devices
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
To:     Hamza Mahfooz <someguy@effective-light.com>,
        linux-kernel@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
In-Reply-To: <20210802125232.65188-1-someguy@effective-light.com>
References: <20210802125232.65188-1-someguy@effective-light.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-jSn/QtWNxsoPNSju7pKV"
Date:   Mon, 02 Aug 2021 14:57:17 +0100
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-jSn/QtWNxsoPNSju7pKV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-08-02 at 08:52 -0400, Hamza Mahfooz wrote:
> For devices that only support the BATTERY_VOLTAGE (0x1001) feature, UPowe=
r
> requires the additional information provided by this patch, to set them u=
p.
>=20
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Thanks Hamza!

Reviewed-by: Filipe La=C3=ADns <lains@riseup.net>

Cheers,
Filipe La=C3=ADns

--=-jSn/QtWNxsoPNSju7pKV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmEH+bgACgkQ+JPGdIFq
qV2QwxAAm7IGALONFgvyVWA6DvGYN874+OEyaq7dUZ+Hs9nc8bRYCErxT7/CvzUH
1eKRyGXvSbT10vFfzeuyZ5GUp9PDohkk51ugUmb8NuoV/4eSx4q7j4EByJFd0fIB
Y762u9lxrlhMpojw88XQ4FCZ6M2FyEUOv11WraV7hRyPwgdiESmmEBCp75mAgDUT
6c0/i0kQAdk6Ahkg28OUqiyF2EoSg5WUdoVWG3t5kSciMdbD5FuZ3LV9M5OuIeXA
GmV1/9OnFEfo4qotmjevz5lkrkXSAVTsxfQWn4i8dJ5D+FXbwSR2T3Ns8c9Lmo8i
FIjMZ/AjAXqCat6YqglpD3aMGXrArIleJIS67/m4WN/PgokSWmq1KCMJD7lZbS6D
FP0ITpgojM2b2fijHfyTvoDPbN8h1fg7GEFXxVF1qrIRMf/Cf7R+cJ1ccdBHpgbH
fT9Lj6HpYUp5gTIWWvlANwTw75XhG7se5tzENuFHKfcKfgVg+C0rEMMKuUxGVOdM
D4LLD/oiTlx0vIsAomH8pTwrDlsqPQH2NP0Wgc2fAbQ2Y2v0I4qYA6HiXj5eUF++
pbpBpt8jM5FIxMwZFzCFxvighkDE+ALicZvIeWsAF0TA0qOSrGoCZ5t347T6m5c4
ZLme9uP2CWnxwjHQXwZALlA2D1GlGZp3t4HsdvW1A+Hotgfux38=
=fnhX
-----END PGP SIGNATURE-----

--=-jSn/QtWNxsoPNSju7pKV--


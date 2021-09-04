Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D289400D6C
	for <lists+linux-input@lfdr.de>; Sun,  5 Sep 2021 01:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbhIDXG0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 19:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhIDXG0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 19:06:26 -0400
X-Greylist: delayed 522 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 04 Sep 2021 16:05:24 PDT
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198B9C061575
        for <linux-input@vger.kernel.org>; Sat,  4 Sep 2021 16:05:24 -0700 (PDT)
Received: from [192.168.1.134] (unknown [188.251.63.183])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.archlinux.org (Postfix) with ESMTPSA id 1A0658CA611;
        Sat,  4 Sep 2021 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1630796197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WBYl+yvkUUP7gfLUFwYJtn6xlXx9fTA1se5usPNF0rA=;
        b=R3yCgJ/oJnvgwpeXMOCQAjvjZ2GxeH0YXc9BqlPt9PmIPJ5gLo9fjTNWVPbI28jd+YK4yy
        WQ525ouTKqxnUomQGMO2PsQQA4qg01yG6McZKdPYlII6yBewaYCLdQwRDAsI5Wo52wYpjw
        DFzmKLyoRroZj6AFA7CQQYVI15O+k0aRYmoRjcvkrDEo8MayizL8v/xWrSH4jvuoay+YH4
        Yo95uyrvOydOYEG/qUuGud7RyfqkC93op1gcQtkb//yKReR7qeKFh/016Zd7j4QLVEM7wy
        GANQsh9kA8rQBTW1Sfb9Z+NBL7Dlw7S1ENL36RHTtXw/O1kLBNrRXchMyNDN5dGiuztfGJ
        cU3kclGhUg4KKxBPowEJfUs1dtAoGUzw9EsBuw5gmGQvEoWgYzQo3sGarXPMMEZc4zkVVF
        5Kc/DV5xTBVydvrL3Lu1nXN8WnAgMOsioRcyDY7WHEOd/Jbyd3kb3iJwb+SFpWmcf9iBDJ
        fl80v8STNHDrAQJFvsXJgl8OjBX/wk0Hrx3yu0NWs9O/mThVjOlP8+ZQHvevcPjnAMRxVa
        q6o+16BfY0+MnQ+9LVpxZRwRmEX8CjS8NGbGlFtrZHTHwMpiHBK2AbuhCqySBwFrFw4Exb
        rwzspJq/rZJRfxM3sj7GwS88P/9YD+yOU5cHHTlrSoQjZSx8R0lqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1630796197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WBYl+yvkUUP7gfLUFwYJtn6xlXx9fTA1se5usPNF0rA=;
        b=kdfZ77Uv0q06QpZTtRKFEwtuOBU0cHg/HoFst3Dpx3GZA3nIxvR5Pua/36z1OTUd8vtUMQ
        TtKP1A+VQi0N1yBQ==
Message-ID: <7da980efbabf5487016253029375f4e275403933.camel@archlinux.org>
Subject: Re: [PATCH] HID: wacom: Add Dell Latitude 7275 battery quirk
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     =?ISO-8859-1?Q?J=E9r=F4me?= de Bretagne 
        <jerome.debretagne@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
In-Reply-To: <20210904205840.78242-1-jerome.debretagne@gmail.com>
References: <20210904205840.78242-1-jerome.debretagne@gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Pmo07CAiVXyYOI38mMXu"
Date:   Sat, 04 Sep 2021 23:56:32 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.40.4 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-Pmo07CAiVXyYOI38mMXu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-09-04 at 22:58 +0200, J=C3=A9r=C3=B4me de Bretagne wrote:
> The Wacom touchscreen/digitizer in the Dell Latitude 7275
> mistakenly reports having a battery, add a quirk to ignore it.
>=20
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> Tested-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> ---
> =C2=A0drivers/hid/wacom_wac.c | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 81ba642adcb7..4d4503cbe308 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -3574,6 +3574,13 @@ void wacom_setup_device_quirks(struct wacom *wacom=
)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0__clear_bit(MSC_SERIAL, wacom_wac->pen_input->mscbi=
t);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0__clear_bit(EV_MSC, wacom_wac->pen_input->evbit);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The Wacom touchscreen/digit=
izer in the Dell Latitude 7275
> mistakenly
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * reports having a battery, l=
et's ignore it.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (wacom->hdev->product =3D=
=3D 0x4804)

We probably want a define for this ID.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0features->quirks &=3D ~WACOM_QUIRK_BATTERY;
> =C2=A0}
> =C2=A0
> =C2=A0int wacom_setup_pen_input_capabilities(struct input_dev *input_dev,

Cheers,
Filipe La=C3=ADns

--=-Pmo07CAiVXyYOI38mMXu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmEz+ZsACgkQ+JPGdIFq
qV3a3hAAjAzzIUOw+D/o1KkpVSOC38C1mU/ZYFwizvVNthcoZSZ1OEDUyzhWmVWT
l9kW1RsYqtntFR91yqTM8q/0OIaEaOUkySJ7A/ETpqm4Hl5D4yIXgPrV4KlSuXmn
ovIB8KnFutV7fBd9cgy+d51fwSD2d2U3/7VpMPWixljJaSW13mLR4/DWRqWxcNu1
0xg3ieHoW6uJHS51fYB8Nr9T5rYpmGDG78Isgxep8R7NXQp9y3f23sUBZ/SvJ35q
wREPMgdykLKVtYIpiLZb1ZpktZiOpBJOAw4M4mfk/FWk7FGKXWyRHpDMmpJh7/tv
ywzQXvgTy1vCcE3SyFWRpEqAPeo7ceur5JHMNAcpp94lG0yeOVOU2PcCEqoK9Eri
wON755VwmkE/brPs0LGmdt6a6rs6rSqFZzWXWiDkz/keVMuy2ViESxsfxO9ChEBy
UefAi6y+foDq02wFgKPM1lZWY8X1RD5bdlvOlCpHwe4zcUyw2oT1nfn/bFS+n8bi
uMnOK3GLAeE2MtH/m6zUcDV2u4ikymQdzAIF6g2I/uchJPzlHTPnwaVo6FnDbwtN
8DhJYg6jp2Rn8WCRROpaXBsR8NIXBpwgKSPrBfJwO3QJXRguVPlHKYMLyZgb1YjM
seZbbVkqv51w2fHyGr0qzdPf5V5r6vWn+oOVkDdxqdp0X9n+p9o=
=gB3N
-----END PGP SIGNATURE-----

--=-Pmo07CAiVXyYOI38mMXu--


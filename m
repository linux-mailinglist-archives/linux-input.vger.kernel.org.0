Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35EA2EC3D7
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 20:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbhAFTV3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 14:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbhAFTV2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 14:21:28 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF0DC061575;
        Wed,  6 Jan 2021 11:20:48 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id v14so3306386wml.1;
        Wed, 06 Jan 2021 11:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:in-reply-to:references:organization:date
         :mime-version:user-agent;
        bh=zVK2OEPGyXuuBLK69KjXzMY3ueZyL1xh6wI6rpSwSuk=;
        b=YMu9umD97lXPnerGmHONH+T74ZxdWPZEnJlooQbFBX43fOK7sEQZmMJUBfHzq05igy
         d8sE7KFZAeeARrRUN4jxsKvFzzU5zQ2Q6AVn3smeryYlkk1L01CO54VCGLDPRQsnReop
         hfnhHX35TEorBr4YGDKgonWdhje15hHifDZZHcLpiZFQyhunIKRC2PLOGT0/+ufh/ucz
         Y2aPzlBadyX5jlzA54MXcP4Nkyx5VbxDAHVgaHImHQXfoLKJ5SDVv9SFdoAevXUStBSB
         6xdrXbTKAE0/hqMQvSok6Q1WboAl8zppXM//A0AB7y1ahLMkZPsfdPx+AhNdcBDKiESF
         CbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:in-reply-to
         :references:organization:date:mime-version:user-agent;
        bh=zVK2OEPGyXuuBLK69KjXzMY3ueZyL1xh6wI6rpSwSuk=;
        b=iCQPmWPiDSpEHuSzt9k190Onv9PNM+3JFFJBa0tuk+5AowG4zzc6V7jZRHHF6KxSxQ
         I0zv0zEN2Kts7mQPwRxzT4EsBEPvGgKy1WEuaAL00hkkFJBoEL3aDqjsUuitNtoS4RN8
         k3vZyhhBoBmzoD7pdliX0FrBQs9DXoVNokdRfqv6NPWfMXjxCpAql9hZQmMfx3Vsay9b
         7xLCyXB/J+0wcykvN+Nm064Xk1DzrNz9iRJ6zGSQpsBcUTJWTaMt5bZa+fhSfSy1Gzgs
         ti5IjLHSsNq9GL7BUqG6vFz38zInBckndNKv62t8spYYX9JSuRhwZgzyv/NPIjUAqNo3
         RZwg==
X-Gm-Message-State: AOAM532BQ9JF4VqeB1+ojE4o5Tcgb1e2eWVaQeOozJ1+DbQVVaXfshAD
        iBwj4LLvg2NtuQEN9LZpdPs=
X-Google-Smtp-Source: ABdhPJxPJpvmgaDMqb0UjjwOAknadUKHIj+5KDcxjd6ULGcxP3THb+kqXivuwlk+CZgwaLCdFv/GKg==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr4968577wme.7.1609960847073;
        Wed, 06 Jan 2021 11:20:47 -0800 (PST)
Received: from ?IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c? ([2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        by smtp.gmail.com with ESMTPSA id z2sm4387044wml.23.2021.01.06.11.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 11:20:45 -0800 (PST)
Message-ID: <1370f0590b09509ccf6a2c1233bbf6e96479c846.camel@gmail.com>
Subject: Re: (hid-logitech) Support for non-DJ receivers
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <filipe.lains@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <308ef1e5-16ae-899f-9d89-d63f854b12bc@redhat.com>
References: <4990836470c5fb01babcf416ca6ccf9e5e21d152.camel@gmail.com>
         <308ef1e5-16ae-899f-9d89-d63f854b12bc@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-mGDVV4QR84OAYbHbHAUK"
Date:   Wed, 06 Jan 2021 19:20:44 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-mGDVV4QR84OAYbHbHAUK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-06 at 20:16 +0100, Hans de Goede wrote:
> Hi Filipe,
>=20
> hid-logitech-dj already supports exposing devices behind a non-DJ / non-
> unifying
> receiver as separate HID child-devices of the receiver as we doe for DJ
> devices.
>=20
> ATM hid-logitech-dj does not yet support the c541 PID receiver, but with =
some
> luck that could be as simple as adding this patch to the kernel:
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.=
c
> index 1ffcfc9a1e03..ee7051f3c926 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1877,6 +1877,10 @@ static const struct hid_device_id logi_dj_receiver=
s[] =3D
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HID_USB_DEVICE(USB=
_VENDOR_ID_LOGITECH,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1=
),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D recvr_t=
ype_gaming_hidpp},
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ /* Logitech lightspeed recei=
ver (0xc541) */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HID_USB_DEVICE(USB_VEND=
OR_ID_LOGITECH,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00xc541),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D recvr_type_g=
aming_hidpp},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ /* Logitech 27 MHz HID+=
+ 1.0 receiver (0xc513) */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HID_USB_DEVICE(USB=
_VENDOR_ID_LOGITECH,
> USB_DEVICE_ID_MX3000_RECEIVER),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D recvr_t=
ype_27mhz},
>=20
> Where the second 0xc541 should really be a
> USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2 define in hid-ids.h, =
but
> we
> can fix that when upstreaming this.
>=20
> For now if you can get the reporter of the bug to build a kernel with the
> above change and test that, then that would be great. If things do not wo=
rk
> OOTB with this change, then we may need to do some additional work on
> the kernel side, but we do already support lightspeed receivers, so
> we should be able to add support for this new model too.
>=20
> Regards,
>=20
> Hans
>=20
> [1] https://github.com/libratbag/libratbag/pull/1071
>=20
>=20
>=20

Great to know!

I have that device, I can try it out and send a patch if everything is work=
ing
correctly :)

The lightspeed receivers we support all have the DJ interface, these new on=
es do
not. But yeah, I think it should just work, or at least be simple to make i=
t
work.

Cheers,
Filipe La=C3=ADns

--=-mGDVV4QR84OAYbHbHAUK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/2DYwACgkQ+JPGdIFq
qV1nIRAApmYeDXt6Ct9zsX9m+4gz4kL+zDy7I8cBgjt4Yb5WmZYNTkKSb8xS8mf4
hGeusY2XXFSwDFLCgsJujff59UBmyO6p0x2D4nSiOMtAezOlDa6ZpiLv+TFMYEUp
RCMykhQXjWrg2ndx6lvKlIjULFbdixg/zQi1XniZUKllBMYSFi0f6jRWjNRJW6of
fSrpBBq+zLxD6Ro90Ed+/S+N2GMhUckNCtmQUhS0AfkF91LEwnGex2yl4Gfqlv7I
fy5Z5FgFut0kl+7ujLhKVj5gkbjqBdqUMyNTvTGpD/RK7BfJFj6woVMWWLDXeAmO
7KIcQBSd/lfyBfLG9eHNf2msAMx4EaZbOUjaJOPfGaH6nzUdpaV1lzDGa1591XdI
mdNCYxSFq5ocIiuXDxu7sN6quqJu5eK2PAPuysJtkxgdkLLosX4GfKmGhMR4vJq8
NMj17/XdBri2vFfQ/SHu54b5mxWXjogFHJYvD7gmi4TXLKdsl1LGVPv/6SvjTvuj
z4uAQJeDYajl1aII2LKefJB4U0rNdcFawkbYcT4AGmMaF559zfFCgGwhdi859CUc
7jWNjo5PZ2anmHz7YREP9atTq+OuC4ZJfpeTW2A1a1YH1YfdVTocag5gWufHbZCA
pZL1OcUwrhLdnJT0u9f3p3hB/XobzwJ8YlQZrfmlihgOv4rdU/s=
=VYvi
-----END PGP SIGNATURE-----

--=-mGDVV4QR84OAYbHbHAUK--


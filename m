Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5EE3215763
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 14:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgGFMiK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 08:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgGFMiK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 08:38:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCB3C061794;
        Mon,  6 Jul 2020 05:38:09 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so40680784wrs.11;
        Mon, 06 Jul 2020 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:in-reply-to:references:organization
         :date:mime-version:user-agent;
        bh=UlxO3hPX8FKOMLmnj0A7S3C/4WvNGuPtDs4m9jeq4vY=;
        b=RYwaSxlPduOAWSvK50CoX9I1hSnEm6ogaQ+FFcgICmweYSq/0Lvdsa7GZy1rDi/qBa
         5JAyjnsIyYDBPSYCnsnlimgGpm8streL5rjrTcY+G0jCpX5WF9KpN2LQe2lxSjFBJ6pR
         w0t7VyJsolZqvI7h2GUSOFcDRH3inst7syNExslZadnWJXvtQQzAc2UIejK41t+4fZvB
         md9P+hqgXQVCv5NuEIrr5zS6qEeQEqVItjZlJ8XpfePLrI+46q8zo4ulIHhl8HZcFTMd
         jcZtGDj9BfWBu5XiV1yMEo45rZbi/G98Eq3sl5HBQo5PvRf73gBmUgWSjgUhSxSnUgpy
         IWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:in-reply-to
         :references:organization:date:mime-version:user-agent;
        bh=UlxO3hPX8FKOMLmnj0A7S3C/4WvNGuPtDs4m9jeq4vY=;
        b=SlTNWkJa+JudH/VvKEtfQHDYWOyU5hp8x0gqUzJ1jV23fgeBbeJu1su0QcRFlT07BI
         2Cow0x/Yn4BM+Ir8tMGrtab9B35j3p20eARvAQWjbSiT4XhDPB8/GBaN4/efQFMEfd3u
         JGwG9qRvrCpfuB6gCVImoANHHUS8hlIgkU2xrPa5mSzp8k13VCa4FQSu2S2JEnvQFwr4
         AOeQDheMCAms5gpYAHo8ur6hdVXAQOR0oo1Gc8lIi2t/7TLQAXK1wolgd7FND2WqU6jo
         uOpQXk/huVSG3vr1Rsz15lVin6WMBkUvd4kZFdswUNfP7qrWKLhh5Wb8NfbRBbIFvjof
         bAlg==
X-Gm-Message-State: AOAM532BsqbGBPNwu48YS3WxE4ktHYJBHu3S2gxHPMF0EWweSXmjS2QZ
        J2LbXm1ymP0tSIYUTJrLHsStMFmZo0SDYA==
X-Google-Smtp-Source: ABdhPJzk++snLRL/3Zeg4bNmeyzlYwHvm5wO5AmviL5i6AEwJagIUnDIMAnnl27dbd6WFbaTAidK7g==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr46305862wrm.141.1594039088678;
        Mon, 06 Jul 2020 05:38:08 -0700 (PDT)
Received: from genesis ([2001:8a0:f254:2300:dad6:8c60:8394:88da])
        by smtp.gmail.com with ESMTPSA id e23sm22716650wme.35.2020.07.06.05.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 05:38:07 -0700 (PDT)
Message-ID: <2f76f069f2078b3d51533f772f1094dcc03685a3.camel@gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: avoid repeated "multiplier = "
 log messages
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <filipe.lains@gmail.com>
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Harry Cutts <hcutts@chromium.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <7d2c980f071487cecfd1534adb7561b33d922af3.1593970340.git.mail@maciej.szmigiero.name>
References: <7d2c980f071487cecfd1534adb7561b33d922af3.1593970340.git.mail@maciej.szmigiero.name>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-/JbVFOtHolAxXpvgH3yU"
Date:   Mon, 06 Jul 2020 13:38:04 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.36.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-/JbVFOtHolAxXpvgH3yU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-07-05 at 19:34 +0200, Maciej S. Szmigiero wrote:
> These messages appear each time the mouse wakes from sleep, in my
> case
> (Logitech M705), every minute or so.
> Let's downgrade them to the "debug" level so they don't fill the
> kernel log
> by default.
>=20
> While we are at it, let's make clear that this is a wheel multiplier
> (and
> not, for example, XY movement multiplier).
>=20
> Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling
> on Logitech mice")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
> Sending again since the previous message bounced for most recipients.
>=20
>  drivers/hid/hid-logitech-hidpp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 1e1cf8eae649..b8b53dc95e86 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3146,7 +3146,7 @@ static int hi_res_scroll_enable(struct
> hidpp_device *hidpp)
>  		multiplier =3D 1;
> =20
>  	hidpp->vertical_wheel_counter.wheel_multiplier =3D multiplier;
> -	hid_info(hidpp->hid_dev, "multiplier =3D %d\n", multiplier);
> +	hid_dbg(hidpp->hid_dev, "wheel multiplier =3D %d\n", multiplier);
>  	return 0;
>  }
> =20

I have seen this being useful in some cases, however I do not have a
strong opinion on it. Peter would know better.

Cheers,
Filipe La=C3=ADns

--=-/JbVFOtHolAxXpvgH3yU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl8DGyYACgkQ+JPGdIFq
qV2X+BAAodOXRsLeK4VZh5PBrDPvqTjUWn7Y1TEFkSZBxAQVzyL1Uv1TvtOjUPIn
Q65fmafPxfwW+BNNiTeMhqVCUzPNLGjH65aHlVB5ZWYxiTO1k4OKwcCMgpcM6C69
vdJ2lJjRjWpsmq6gw4QxlmuiaEm1BcAx6IbbIBBXFz2LoypDjT5D6enYLNdLMAdO
/B+BtUJVhZJFeUV3gNqiUcay6YSKzkHycf+ZgpxFMOJRwnAfPKlVnqKXawzteJAX
2YVNmyhc+qrNEpAw/t5KrBvoZZJr0XAF/izj021XtJjPPaDde8R1AtmJ1V2Ru6Sv
Cq8f+AcuBCvykmS3RdWvOAq0BMyI8/hrrlc8iFsaja8GFZqfov+Qk+PnfSk+NAub
/vbvurzLqV4Di68+8Zb5dvsYmQBIisf+gq7kvuUBd6aKTEdar84wOXCXMjjcdiDp
zfz20Dpw+f62a5ORVkIJ305PwVugrWK8YR8HikdIdtSoSKkJMRaXn9Cyz1vi1W6D
vGsuG1q0IjDxdKVkpW863RGC/AXMrQkOB24Mr5H499n8QWgnjqaCSYimoGGbzihU
vy7YjOr5Ma5Olsq0kLXp3KY8RVcnXpSAcaoqAd0xWIKBwZPw/4cKDo7lD2uCjgKa
B31lJwUKysIjK1AgQzNY7fKHOvmqxZGtJpSIg1FKg+sDav1j2us=
=C+AW
-----END PGP SIGNATURE-----

--=-/JbVFOtHolAxXpvgH3yU--


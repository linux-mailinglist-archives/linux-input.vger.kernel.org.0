Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7EE2A0A0F
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 16:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgJ3PlR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 11:41:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:39532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgJ3PlR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 11:41:17 -0400
Received: from earth.universe (dyndsl-037-138-186-059.ewe-ip-backbone.de [37.138.186.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A94020729;
        Fri, 30 Oct 2020 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604072476;
        bh=EjnSNy2Xsppi3sak2rAWly1XUDFfvIBzYoVKfsEOvxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hTdZqDrS0SK/ui9qwGn+Uf+BjnEkNZBzO/OkMAPmDCkEJnTcsh0uiRQQsLlamXP71
         iGVFiGC+aij3j4IIhtGmPG0y5GsTj+8djd5mmVJjqPlKb1eSQAC2VJbKw1vJ90e7Jv
         ASGOjdZwIpOlGKemjFXk2Smu3Y5dk953odmPp3jg=
Received: by earth.universe (Postfix, from userid 1000)
        id E441D3C0C8E; Fri, 30 Oct 2020 16:41:13 +0100 (CET)
Date:   Fri, 30 Oct 2020 16:41:13 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Jungrae Kim <jryu.kim@samsung.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
Subject: Re: [PATCH] Input: add SW_COVER_ATTACHED and SW_EXT_PEN_ATTACHED
Message-ID: <20201030154113.6moks2gr57ztmujk@earth.universe>
References: <20201030115918epcms1p4aaae97a4549a1b3e505709fed3d91ecb@epcms1p4>
 <20201030114142.GA2409436@kroah.com>
 <20201030104628.GB2395528@kroah.com>
 <20201029135715.GB3470996@kroah.com>
 <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
 <20201030112812epcms1p7d031bb4949b319135e48dfac9409743b@epcms1p7>
 <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p2>
 <20201030131552epcms1p2cfe412ede3d3b2c5286d2fff4260300c@epcms1p2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6tx7ecjnkisosyh4"
Content-Disposition: inline
In-Reply-To: <20201030131552epcms1p2cfe412ede3d3b2c5286d2fff4260300c@epcms1p2>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--6tx7ecjnkisosyh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2020 at 10:15:52PM +0900, Jungrae Kim wrote:
> From 23aed4567e234b7e108c31abadb9f3a3ccccf7d2 Mon Sep 17 00:00:00 2001
> From: Jungrae Kim <jryu.kim@samsung.com>
> Date: Fri, 30 Oct 2020 21:23:12 +0900
> Subject: [PATCH] Input: add SW_COVER_ATTACHED and SW_EXT_PEN_ATTACHED
>=20
> SW_COVER_ATTACHED represents the connected state of a removable cover
> of a device. Value 0 means cover was attached with device, value 1 means
> removed it.

Any reason against using SW_MACHINE_COVER? That was introduced for Nokia
N900, where you actually remove the cover to access battery/SD card/
SIM card (so there is state 0 =3D cover removed/open and state 1 =3D cover
attached/closed).

-- Sebastian

> SW_EXT_PEN_ATTACHED represents the state of the pen.
> Some device have internal pen slot. but other some device have external p=
en
> slot. These two cases has different use case in userspace. So need to
> separate a event. Value 0 means pen was detach on external pen slot on
> device, value 1 means pen was attached external pen slot on device.
>=20
> Signed-off-by: Jungrae Kim <jryu.kim@samsung.com>
> ---
>  include/linux/mod_devicetable.h        | 2 +-
>  include/uapi/linux/input-event-codes.h | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_deviceta=
ble.h
> index 5b08a473cdba..897f5a3e7721 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -320,7 +320,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX                0x0f
>  #define INPUT_DEVICE_ID_SND_MAX                0x07
>  #define INPUT_DEVICE_ID_FF_MAX         0x7f
> -#define INPUT_DEVICE_ID_SW_MAX         0x10
> +#define INPUT_DEVICE_ID_SW_MAX         0x12
>  #define INPUT_DEVICE_ID_PROP_MAX       0x1f
>=20
>  #define INPUT_DEVICE_ID_MATCH_BUS      1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/=
input-event-codes.h
> index ee93428ced9a..a0506369de6d 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -893,7 +893,9 @@
>  #define SW_MUTE_DEVICE         0x0e  /* set =3D device disabled */
>  #define SW_PEN_INSERTED                0x0f  /* set =3D pen inserted */
>  #define SW_MACHINE_COVER       0x10  /* set =3D cover closed */
> -#define SW_MAX                 0x10
> +#define SW_COVER_ATTACHED      0x11  /* set =3D cover attached */
> +#define SW_EXT_PEN_ATTACHED    0x12  /* set =3D external pen attached */
> +#define SW_MAX                 0x12
>  #define SW_CNT                 (SW_MAX+1)
>=20
>  /*
> --=20
> 2.17.1

--6tx7ecjnkisosyh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl+cNBAACgkQ2O7X88g7
+prlDQ//ck3cDCvU9DJcbm0S9wAUs6J5X9DsDBuaDWA1t9ZQBsBRHCC/lM529xKw
HBkdfgG1a26NlfmUv52uOp/Sc25aKfk2gEWm2fnyKVGe7JBKAxNvcqaausD9Izuw
TxDBck60JoVx1iZAx60c5muvh7MT0a4O81jG5sfDsAWapG8WqzKvOx+E+CkJrQ3T
PxcsEUdPWOEHXGtNtiWhHTYG3lYZbfBIrQnFMY+hYZGAi82Hq0uAA3B4NF2NnlRW
YIJ42GboJV6bW/SZJNNKOqKDad3tS0EYG67LYv8CL0YqqF/R2g4nk3xt2A4M1mw3
cyV8wk6tow6vaXyqPVRAQclewJYxVdJNH/RTmDu6nyJ8dUcdhys+4g54Zxd/QN0u
j8UuHlAdJTCacmEeKwQ2xFOpOxPAggWYkY8lD+SiwcKMWpRD/3WesdkagcFMLMII
gmFMO+uvrIK2opn6bPHRmKPulw2XLJDx/zYyBLJvWKBqidIXaKPbUrIRGgnwn9kG
cm/m3Km1bwCoRTtZxps6B3c1FCKuQCEtDIM1hc2lxwz/wDaH6tNaivNxXlo4y7Or
8hr54njWVP5fLQwHP/SJneDwGDoCHx9hhGMi80FCwvDHQOLf8L83jW6pPtpvAOEi
UHvOU3Vxfl7/KHV068b3aTVgSaROvMzN944nEIjo6r2VWriW7G4=
=zC77
-----END PGP SIGNATURE-----

--6tx7ecjnkisosyh4--

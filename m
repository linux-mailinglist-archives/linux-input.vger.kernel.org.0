Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7BF3527AE
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 10:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234327AbhDBI7h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 04:59:37 -0400
Received: from mout.gmx.net ([212.227.15.19]:48441 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229742AbhDBI7f (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 2 Apr 2021 04:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617353966;
        bh=/LjJASVgOV0maQa24Uvuz0z3QL8rMLEvyUWzo5UmwUg=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=FgfmEnS/VDXHh/rD3LuU2aR0S92D4gBe3RFvC2mx/9m8dMBMokJcq4xWnB6dJ28o6
         A/BhSgZrDsDD1USu/zunhlb8OaDQ19g8U/WlPnKDzjYqKECu3SYi8UTg8QU3l1hEGS
         FmaM08z9J+81RQBqtTJp/ep+itvy8SwLRP0YdGMM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oBr-1lnCJc3CmT-00wpBH; Fri, 02
 Apr 2021 10:59:25 +0200
Date:   Fri, 2 Apr 2021 10:59:25 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Subject: Re: [PATCH v2 3/3] Input: add driver for the Hycon HY46XX touchpanel
 series
Message-ID: <YGbc7Qbu6s659Mx4@latitude>
References: <20210306194120.GA1075725@robh.at.kernel.org>
 <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
 <20210401230358.2468618-4-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F4oZXRIuQxOUFdge"
Content-Disposition: inline
In-Reply-To: <20210401230358.2468618-4-giulio.benetti@benettiengineering.com>
X-Provags-ID: V03:K1:3GJOwttnlBZYPjNdxhcwkJCPSeiGZav7VXEdvSBAqj1EC8/xUA/
 5/q6/bEM9DHyeXT+F1tOmpDMAuY+tr+nh9y8QgLYWDCYNgKU32gnHp+GGrPImr47+XQyzRI
 VHylP5BfTvVSw4Jt08XbXj+E0nJG5mruymiemu4UHj0kYDgVquI/C51XISGL1au+YOxhZoF
 87pE9YiQxWL0hTArqehIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:458nIHpDN6k=:YR51a7hCfisNAFzFG6HHwK
 R7W76FjWFpVJ8qZAYtKoWchuM58Mam0j/hnf3HSPHDasDy1Ny7sKC/K8GuvuhFtBsGeQ7Q8vB
 wcWETzfBh+kYcyHrjTgm8E2xj+jiudkA1e6y8ZfbFixpLjEdx0jMwzuKcl6rkTH6oDupbL8EZ
 tgbZPo24F4wpkq3ZNxeR4YJttfUzhmue4BtuiXoTUKKgpNRjxtjtOYtsZ9Fo4eTkd30/YFb80
 +3fxlF+8qzpe0MZezYw9Lzu92Amnpe9gjTjp/MeNdLSIbPbaQmpJplVy9aAdRuCblDAukkf9F
 jMW4iDqLyQLjuckvUyBFZ+AaeQDK+pL3Qk7ghkYpfnOSFOzcW4L1U41OcAXWKmyZi/F2B1X+z
 auSfa84Q+X14AHwhb03GJ+YuLlXMCVRUQzvhe7cboChkxb64qJSa0irtkBgVCaDJIrck1Ic7V
 iKuj4wsAR5PHtnESSdmSHC0suQSLgfELF/5oG4/enWEp0qzPScagEYrQk/GPr0sKiC/gDHg0Z
 8oeCQ4B4DsunoQfUGASJyIHP6ZZhpL2iMq8j4+l/F87YoMQ8n5EFDWkG8idKWOTzL6yb45xNy
 X2AcmTsswjJo5W5588XbkI0WZ21o5VmXhENy4AiBxA6lLwBtGjRwiUZxDudoq/19nlDfZ0tbU
 D1P0t2vnfXCdBGqJ7AOJb2+iOYREt+CwHHyuvqzAUWjI0lzULSWO8XAc76T81QqVmjudj5LeW
 DV7OWcy9WqVnAUxChk5vuxVvsAQ++zrQRpmOYJAZCfLsBPpBvSrwC1dCCyk9Nq5jTzm++o88P
 LsbgmI/h0cNuinWsiFPHfF1FVMaTE0QHXvWwMeYOR4UZeLhiNpdYp7vw7c21/c0T54LlQlOss
 Qbqg3ZGPIdmw155f6Mb3BPxH0/wSTeI4p0r4Qieta3+3GddNGUkB3zZ4QGes+7LWWS3CY60B2
 ipmfy7O1ELP2ZXuWcwxATqD4kqFRVnJAaAa2+yxcasHNS7TDjNKANK5ImOT625y7PYDZ7N3oM
 SaTxYEREYtQZI9eRul9W3bls7r4FCqFOHnF2QahK1NyGNHTKWytWkVwGn9ErcU76vbqE8Ic5U
 e+jlKuQ0YUCtPQG5pWN89ybeNBdmha2Nkui3MRkTWfFdlrPYkiyVIH80v570eiAokvEWcIetD
 XWIVLvqpNvecR27/8YBacfj0TQZffpleNFtvnYbDDg9rmOSXvCdkxGG5pQnFpo/Xv7sE6rbRE
 oFrrMEKb4l1gSxSoc
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--F4oZXRIuQxOUFdge
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

a few remarks below.

On Fri, Apr 02, 2021 at 01:03:58AM +0200, Giulio Benetti wrote:
> This patch adds support for Hycon HY46XX.
>=20
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * removed proximity-sensor-switch property according to previous patch
> As suggested by Dmitry Torokhov
> * moved i2c communaction to regmap use
> * added macro to avoid magic number
> * removed cmd variable that could uninitiliazed since we're using regmap =
now
> * removed useless byte masking
> * removed useless struct hycon_hy46xx_i2c_chip_data
> * used IRQF_ONESHOT only for isr
> ---


> +config TOUCHSCREEN_HYCON_HY46XX
> +	tristate "Hycon hy46xx touchscreen support"
> +	depends on I2C
> +	help
> +	  Say Y here if you have a touchscreen using Hycon hy46xx,
> +	  or something similar enough.

The "something similar enough" part doesn't seem relevant, because the
driver only lists HY46xx chips (in the compatible strings), and no chips
that are similar enough to work with the driver, but have a different
part number.

> +static void hycon_hy46xx_get_defaults(struct device *dev, struct hycon_h=
y46xx_data *tsdata)
> +{
> +	bool val_bool;
> +	int error;
> +	u32 val;
> +
> +	error =3D device_property_read_u32(dev, "threshold", &val);

This seems to follow the old version of the binding, where
Hycon-specific properties didn't have the "hycon," prefix.
Please check that the driver still works with a devicetree that follows
the newest version of the binding.

> +MODULE_AUTHOR("Giulio Benetti <giulio.benetti@micronovasrl.com>");

This is a different email address than you used in the DT binding. If
this is intentional, no problem (Just letting you know, in case it's
unintentional).


Thanks,
Jonathan Neusch=C3=A4fer

--F4oZXRIuQxOUFdge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBm3OUACgkQCDBEmo7z
X9upNQ/8DWmEiVnx/iq6BM00GmeRFWSkwuLnvC1jVHjRJPHIhpa8f0SYBg9wbADt
z3AjK4OyxECPBB0mf3tcBq8MO9dRQ7tXc6P4/UhBZqDkprxkZQoKKGogYxWwAmbP
vaoDO6XO+iQ+3huy5Go0s0qWz1TOwX2cNsDM6Wh4ThHcL6OryofS+bqK7H3F8SW5
Ej4OiubMxfQQ75ep6HNiDQpOZY8xFMxwsLh7nl6E1kGR93Q2lWy2FllgHQdx9tmY
cJNzFFuFU2yZYCUsuDC/2/EOIV44Lrxe2/C5O+FQqJYo8fUrjB/CkmUadHjKpcJG
R7NFuwl1SH1qf+yox9Pxgd4DFkR0fTNNCjkZU0efBA4cyq/V9QVdqFilImIYkTAD
8jSjgJHGBBRxISz2QsAYMiWs2OU/CsEoX7e9S3uxy/XuIp6a+1yUwtAeZAlcfkX7
+Qc8uVHTkzw+isi3xojy7YCs8+x1I62oQWsN9j9r+TMt6souLc5jPiFHUHk+g4Yo
S1HiHk0Jn5q9yIR2QblDK5kBJw4W2aNTcnMrmCh5lODk9LC6+qnisyDvX+B/PKVZ
Qfol/vuaO1to+waAiigNua4egVpDcj7EO7jW74W5z+4rTV5iVF7X8E+pgd3XrVm2
EJGGT7W41TFH0ueu/v2x7KN1p4Iq1VHO/DTqd/ho0Cv0IQooZIs=
=yZTH
-----END PGP SIGNATURE-----

--F4oZXRIuQxOUFdge--

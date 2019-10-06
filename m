Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61C9CD2C3
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 17:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfJFPZZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 11:25:25 -0400
Received: from orion.archlinux.org ([88.198.91.70]:56578 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfJFPZZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Oct 2019 11:25:25 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id C663715A9D3636;
        Sun,  6 Oct 2019 15:25:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (unknown [79.140.127.125])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Sun,  6 Oct 2019 15:25:21 +0000 (UTC)
Message-ID: <e0dc8d111e1615d35da0c87b4b93b55b3bb89f23.camel@archlinux.org>
Subject: Re: [PATCH v3 3/4] HID: logitech: Add feature 0x0001: FeatureSet
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Mazin Rezk <mnrzk@protonmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <nZMYgsXB3gdFVoIR3TeMjdbHiP4STlPINtmdH7TkH-nLrHS5APVXn00Z-L89Bjnam4_EBf1GLqI5KAZDZhFnH9hyWGyCOGJQKZzpyN2tqlE=@protonmail.com>
References: <nZMYgsXB3gdFVoIR3TeMjdbHiP4STlPINtmdH7TkH-nLrHS5APVXn00Z-L89Bjnam4_EBf1GLqI5KAZDZhFnH9hyWGyCOGJQKZzpyN2tqlE=@protonmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-uXZbwO1sXvxROo2na7kP"
Date:   Sun, 06 Oct 2019 16:25:20 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.34.0 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-uXZbwO1sXvxROo2na7kP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-10-06 at 01:04 +0000, Mazin Rezk wrote:
> This patch adds support for the 0x0001 (FeatureSet) feature. This feature
> is used to look up the feature ID of a feature index on a device and list
> the total count of features on the device.
>=20
> I also added the hidpp20_get_features function which iterates through all
> feature indexes on the device and stores a map of them in features an
> hidpp_device struct. This function runs when an HID++ 2.0 device is probe=
d.
>=20
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 92 ++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>=20
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index a0efa8a43213..64ac94c581aa 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -190,6 +190,9 @@ struct hidpp_device {
>=20
>  	struct hidpp_battery battery;
>  	struct hidpp_scroll_counter vertical_wheel_counter;
> +
> +	u16 *features;
> +	u8 feature_count;
>  };
>=20
>  /* HID++ 1.0 error codes */
> @@ -911,6 +914,84 @@ static int hidpp_root_get_protocol_version(struct hi=
dpp_device *hidpp)
>  	return 0;
>  }
>=20
> +/* ---------------------------------------------------------------------=
----- */
> +/* 0x0001: FeatureSet                                                   =
      */
> +/* ---------------------------------------------------------------------=
----- */
> +
> +#define HIDPP_PAGE_FEATURESET				0x0001
> +
> +#define CMD_FEATURESET_GET_COUNT			0x00
> +#define CMD_FEATURESET_GET_FEATURE			0x11
> +
> +static int hidpp20_featureset_get_feature(struct hidpp_device *hidpp,

Can you change this to `hidpp20_featureset_get_feature_id` please? So
that we keep in sync with the documentation, and to avoid minor
confusion as IRoot has a `get_feature` function.

> +	u8 featureset_index, u8 feature_index, u16 *feature_id)
> +{
> +	struct hidpp_report response;
> +	int ret;
> +
> +	ret =3D hidpp_send_fap_command_sync(hidpp, featureset_index,
> +		CMD_FEATURESET_GET_FEATURE, &feature_index, 1, &response);
> +
> +	if (ret)
> +		return ret;
> +
> +	*feature_id =3D (response.fap.params[0] << 8) | response.fap.params[1];
> +
> +	return ret;
> +}
> +
> +static int hidpp20_featureset_get_count(struct hidpp_device *hidpp,
> +	u8 feature_index, u8 *count)
> +{
> +	struct hidpp_report response;
> +	int ret;
> +
> +	ret =3D hidpp_send_fap_command_sync(hidpp, feature_index,
> +		CMD_FEATURESET_GET_COUNT, NULL, 0, &response);
> +
> +	if (ret)
> +		return ret;
> +
> +	*count =3D response.fap.params[0];
> +
> +	return ret;
> +}

Just a nitpick but can we put this before
`hidpp20_featureset_get_feature`? This way we keep the ID order.

> +
> +static int hidpp20_get_features(struct hidpp_device *hidpp)
> +{
> +	int ret;
> +	u8 featureset_index, featureset_type;
> +	u8 i;
> +
> +	hidpp->feature_count =3D 0;
> +
> +	ret =3D hidpp_root_get_feature(hidpp, HIDPP_PAGE_FEATURESET,
> +				     &featureset_index, &featureset_type);
> +
> +	if (ret =3D=3D -ENOENT) {
> +		hid_warn(hidpp->hid_dev, "Unable to retrieve feature set.");
> +		return 0;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	ret =3D hidpp20_featureset_get_count(hidpp, featureset_index,
> +		&hidpp->feature_count);
> +
> +	if (ret)
> +		return ret;
> +
> +	hidpp->features =3D devm_kzalloc(&hidpp->hid_dev->dev,
> +			hidpp->feature_count * sizeof(u16), GFP_KERNEL);
> +
> +	for (i =3D 0; i < hidpp->feature_count && !ret; i++)
> +		ret =3D hidpp20_featureset_get_feature(hidpp, featureset_index,
> +				i, &(hidpp->features[i]));
> +
> +	return ret;
> +}
> +
>  /* ---------------------------------------------------------------------=
----- */
>  /* 0x0005: GetDeviceNameType                                            =
      */
>  /* ---------------------------------------------------------------------=
----- */

Please use `DeviceNameType` here to keep in sync with the
documentation.

> @@ -3625,6 +3706,17 @@ static int hidpp_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>  		hidpp_overwrite_name(hdev);
>  	}
>=20
> +	/* Cache feature indexes and IDs to check reports faster */
> +	if (hidpp->protocol_major >=3D 2) {
> +		if (hidpp20_get_features(hidpp)) {
> +			hid_err(hdev, "%s:hidpp20_get_features returned error\n",
> +				__func__);
> +			goto hid_hw_init_fail;
> +		}
> +	} else {
> +		hidpp->feature_count =3D 0;
> +	}

I have not looked at the whole code that much but is the else really
needed here?

> +
>  	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
>  		ret =3D wtp_get_config(hidpp);
>  		if (ret)
> --
> 2.23.0
>=20
--=20
Filipe La=C3=ADns
3DCE 51D6 0930 EBA4 7858 BA41 46F6 33CB B0EB 4BF2

--=-uXZbwO1sXvxROo2na7kP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl2aB1wACgkQ+JPGdIFq
qV2bMg//R+mnVueaSn3RkG2T95mmGTDD5qfryIR3fLnh+Db8GwyLfeFj9OR38ZW0
o7vXr7j++D/I1gODF7ltAdeXVxEm/0P58NX2TmnQAk2miuBKQx3zIt5IuW7YXDA3
6ft0PZnwTDHzad7fpAhSn2eYPzzh2SWK6Wmn1LPf+JAyvxSWp2lnEIVC5qBuMavr
nOYGlT8pufSYViwVorwJS6o0AgYVAF25Wu1bMnk+qGpmBPDLtKDEge8KLLFpJ9uX
6PjTng+5O2eKsbwZHm2KlZi24/+Lzpshuy1OqTGafpd+RwTTwbFpJKp4oTECxUIc
FpeVX7kvW0QLNO9VlOzGtllYn59k6wTnkces5cYcD/565/ai+X6/7thEZBoKGEeO
euXi4ZKCMMJ7N9Cu9pqSmIVR8SHjoMBwTqypxYSFWZl6kpvyMEG7RZz133TYkpD3
2STy0jQ8vCHU7hmwzs9EUKrtIB8vzp4yl7pWSoyBIb8JNj72v1rENZBB360nHxy2
IDAugH9HiLNEy56ElFJMP8cpNUpdFap1UJovL7mcFu+7a6ZI/jb5Lwr6jGh8xq0k
FkOimRzmI/XsOB80OYdFuOK7sBnOMUZurIWqfQE6ZC5wQuf7oCOEc3rfi3FgH+pu
EYIpW+/Kz2jW5EuqTaVu0EZYFJQZCmQY5NqsnGaFuPC/Fnbvvas=
=a7N+
-----END PGP SIGNATURE-----

--=-uXZbwO1sXvxROo2na7kP--

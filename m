Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF4DA50C5
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 10:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbfIBIDV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 04:03:21 -0400
Received: from orion.archlinux.org ([88.198.91.70]:41068 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730205AbfIBIDV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 04:03:21 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 013761513131F9;
        Mon,  2 Sep 2019 08:03:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (unknown [154.53.1.40])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Mon,  2 Sep 2019 08:03:14 +0000 (UTC)
Message-ID: <9203df304b8ab11688ca15e56cc866982796894d.camel@archlinux.org>
Subject: Re: [PATCH v5] hid-logitech-hidpp: read battery voltage from newer
 devices
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Pedro Vanzella <pedro@pedrovanzella.com>,
        linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20190831175659.7404-1-pedro@pedrovanzella.com>
References: <20190831175659.7404-1-pedro@pedrovanzella.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-NdhKaDjaaqQo7Wns1juD"
Date:   Mon, 02 Sep 2019 09:03:12 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.32.4 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-NdhKaDjaaqQo7Wns1juD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-08-31 at 13:56 -0400, Pedro Vanzella wrote:
> Newer Logitech mice report their battery voltage through feature
> 0x1001
> instead of the battery levels through feature 0x1000.
>=20
> When the device is brought up and we try to query the battery, figure
> out if it supports the old or the new feature. If it supports the new
> feature, record the feature index and read the battery voltage and
> its status.
>=20
> If everything went correctly, record the fact that we're capable
> of querying battery voltage.
>=20
> Note that the protocol only gives us the current voltage in
> millivolts.
>=20
> Like we do for other ways of interacting with the battery for other
> devices, refresh the battery status and notify the power supply
> subsystem of the changes in voltage and status.
>=20
> Since there are no known devices which implement both the old and the
> new battery feature, we make sure to try the newer feature first and
> only fall back to the old one if that fails.
>=20
> Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 141
> ++++++++++++++++++++++++++++++-
>  1 file changed, 137 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 0179f7ed77e5..2f215e5be001 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -87,6 +87,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_CAPABILITY_HIDPP20_BATTERY	BIT(1)
>  #define HIDPP_CAPABILITY_BATTERY_MILEAGE	BIT(2)
>  #define HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS	BIT(3)
> +#define HIDPP_CAPABILITY_BATTERY_VOLTAGE	BIT(4)
> =20
>  /*
>   * There are two hidpp protocols in use, the first version hidpp10
> is known
> @@ -135,12 +136,14 @@ struct hidpp_report {
>  struct hidpp_battery {
>  	u8 feature_index;
>  	u8 solar_feature_index;
> +	u8 voltage_feature_index;
>  	struct power_supply_desc desc;
>  	struct power_supply *ps;
>  	char name[64];
>  	int status;
>  	int capacity;
>  	int level;
> +	int voltage; /* in millivolts */
>  	bool online;
>  };
> =20
> @@ -1219,6 +1222,118 @@ static int hidpp20_battery_event(struct
> hidpp_device *hidpp,
>  	return 0;
>  }
> =20
> +/* ---------------------------------------------------------------
> ----------- */
> +/* 0x1001: Battery
> voltage                                                    */
> +/* ---------------------------------------------------------------
> ----------- */
> +
> +#define HIDPP_PAGE_BATTERY_VOLTAGE 0x1001
> +
> +#define CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE 0x00
> +
> +#define EVENT_BATTERY_VOLTAGE_STATUS_BROADCAST 0x00
> +
> +static int hidpp20_battery_map_status_voltage(u8 data[3], int
> *voltage)
> +{
> +	int status;
> +
> +	switch (data[2]) {
> +	case 0x00: /* discharging */
> +		status =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +		break;
> +	case 0x10: /* wireless charging */
> +	case 0x80: /* charging */
> +		status =3D POWER_SUPPLY_STATUS_CHARGING;
> +		break;
> +	case 0x81: /* fully charged */
> +		status =3D POWER_SUPPLY_STATUS_FULL;
> +		break;
> +	default:
> +		status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> +	}
> +
> +	*voltage =3D get_unaligned_be16(data);
> +
> +	return status;
> +}
> +
> +static int hidpp20_battery_get_battery_voltage(struct hidpp_device
> *hidpp,
> +					       u8 feature_index,
> +					       int *status, int
> *voltage)
> +{
> +	struct hidpp_report response;
> +	int ret;
> +	u8 *params =3D (u8 *)response.fap.params;
> +
> +	ret =3D hidpp_send_fap_command_sync(hidpp, feature_index,
> +					  CMD_BATTERY_VOLTAGE_GET_BATTE
> RY_VOLTAGE,
> +					  NULL, 0, &response);
> +
> +	if (ret > 0) {
> +		hid_err(hidpp->hid_dev, "%s: received protocol error
> 0x%02x\n",
> +			__func__, ret);
> +		return -EPROTO;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	hidpp->capabilities |=3D HIDPP_CAPABILITY_BATTERY_VOLTAGE;
> +
> +	*status =3D hidpp20_battery_map_status_voltage(params, voltage);
> +
> +	return 0;
> +}
> +
> +static int hidpp20_query_battery_voltage_info(struct hidpp_device
> *hidpp)
> +{
> +	u8 feature_type;
> +	int ret;
> +	int status, voltage;
> +
> +	if (hidpp->battery.voltage_feature_index =3D=3D 0xff) {
> +		ret =3D hidpp_root_get_feature(hidpp,
> HIDPP_PAGE_BATTERY_VOLTAGE,
> +					     &hidpp-
> >battery.voltage_feature_index,
> +					     &feature_type);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D hidpp20_battery_get_battery_voltage(hidpp,
> +						  hidpp-
> >battery.voltage_feature_index,
> +						  &status, &voltage);
> +
> +	if (ret)
> +		return ret;
> +
> +	hidpp->battery.status =3D status;
> +	hidpp->battery.voltage =3D voltage;
> +	hidpp->battery.online =3D status !=3D
> POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +	return 0;
> +}
> +
> +static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
> +					 u8 *data, int size)
> +{
> +	struct hidpp_report *report =3D (struct hidpp_report *)data;
> +	int status, voltage;
> +
> +	if (report->fap.feature_index !=3D hidpp-
> >battery.voltage_feature_index ||
> +		report->fap.funcindex_clientid !=3D
> EVENT_BATTERY_VOLTAGE_STATUS_BROADCAST)
> +		return 0;
> +
> +	status =3D hidpp20_battery_map_status_voltage(report->fap.params,=20
> &voltage);
> +
> +	hidpp->battery.online =3D status !=3D
> POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +	if (voltage !=3D hidpp->battery.voltage || status !=3D hidpp-
> >battery.status) {
> +		hidpp->battery.voltage =3D voltage;
> +		hidpp->battery.status =3D status;
> +		if (hidpp->battery.ps)
> +			power_supply_changed(hidpp->battery.ps);
> +	}
> +	return 0;
> +}
> +
>  static enum power_supply_property hidpp_battery_props[] =3D {
>  	POWER_SUPPLY_PROP_ONLINE,
>  	POWER_SUPPLY_PROP_STATUS,
> @@ -1228,6 +1343,7 @@ static enum power_supply_property
> hidpp_battery_props[] =3D {
>  	POWER_SUPPLY_PROP_SERIAL_NUMBER,
>  	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
>  	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
> +	0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
>  };
> =20
>  static int hidpp_battery_get_property(struct power_supply *psy,
> @@ -1265,6 +1381,9 @@ static int hidpp_battery_get_property(struct
> power_supply *psy,
>  		case POWER_SUPPLY_PROP_SERIAL_NUMBER:
>  			val->strval =3D hidpp->hid_dev->uniq;
>  			break;
> +		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +			val->intval =3D hidpp->battery.voltage;
> +			break;
>  		default:
>  			ret =3D -EINVAL;
>  			break;
> @@ -3083,6 +3202,9 @@ static int hidpp_raw_hidpp_event(struct
> hidpp_device *hidpp, u8 *data,
>  		ret =3D hidpp_solar_battery_event(hidpp, data, size);
>  		if (ret !=3D 0)
>  			return ret;
> +		ret =3D hidpp20_battery_voltage_event(hidpp, data, size);
> +		if (ret !=3D 0)
> +			return ret;
>  	}
> =20
>  	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
> @@ -3204,12 +3326,16 @@ static int hidpp_initialize_battery(struct
> hidpp_device *hidpp)
> =20
>  	hidpp->battery.feature_index =3D 0xff;
>  	hidpp->battery.solar_feature_index =3D 0xff;
> +	hidpp->battery.voltage_feature_index =3D 0xff;
> =20
>  	if (hidpp->protocol_major >=3D 2) {
>  		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
>  			ret =3D hidpp_solar_request_battery_event(hidpp);
> -		else
> -			ret =3D hidpp20_query_battery_info(hidpp);
> +		else {
> +			ret =3D
> hidpp20_query_battery_voltage_info(hidpp);
> +			if (ret)
> +				ret =3D
> hidpp20_query_battery_info(hidpp);
> +		}
> =20
>  		if (ret)
>  			return ret;
> @@ -3234,7 +3360,7 @@ static int hidpp_initialize_battery(struct
> hidpp_device *hidpp)
>  	if (!battery_props)
>  		return -ENOMEM;
> =20
> -	num_battery_props =3D ARRAY_SIZE(hidpp_battery_props) - 2;
> +	num_battery_props =3D ARRAY_SIZE(hidpp_battery_props) - 3;
> =20
>  	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE)
>  		battery_props[num_battery_props++] =3D
> @@ -3244,6 +3370,10 @@ static int hidpp_initialize_battery(struct
> hidpp_device *hidpp)
>  		battery_props[num_battery_props++] =3D
>  				POWER_SUPPLY_PROP_CAPACITY_LEVEL;
> =20
> +	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
> +		battery_props[num_battery_props++] =3D
> +			POWER_SUPPLY_PROP_VOLTAGE_NOW;
> +
>  	battery =3D &hidpp->battery;
> =20
>  	n =3D atomic_inc_return(&battery_no) - 1;
> @@ -3407,7 +3537,10 @@ static void hidpp_connect_event(struct
> hidpp_device *hidpp)
>  		else
>  			hidpp10_query_battery_status(hidpp);
>  	} else if (hidpp->capabilities &
> HIDPP_CAPABILITY_HIDPP20_BATTERY) {
> -		hidpp20_query_battery_info(hidpp);
> +		if (hidpp->capabilities &
> HIDPP_CAPABILITY_BATTERY_VOLTAGE)
> +			hidpp20_query_battery_voltage_info(hidpp);
> +		else
> +			hidpp20_query_battery_info(hidpp);
>  	}
>  	if (hidpp->battery.ps)
>  		power_supply_changed(hidpp->battery.ps);

Reviewed-by: Filipe La=C3=ADns <lains@archlinux.org>

Thank you,
Filipe La=C3=ADns

--=-NdhKaDjaaqQo7Wns1juD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl1szLsACgkQ+JPGdIFq
qV1oghAAmuAeyEctBrGNhp4sYrWWXiim4FMsUVroBM6BM7XzskGUZcSjGl6+GNtv
bPZUI2VBmbLUQDvMo3OXgiXlkTORSfFCLmTjrBm7+BAm2hwfj7kyoeOJRUKP8MRy
7WIG83hn35IMq+X4FD2Z2mDA00XK9xsVHzgroHJseXA086Zg0039cbldiuwMtcsU
V8k/EPDoA6Ci7GIHt0MYQcQUL/vr/pHPqGGNQby6S0WAvGLw2drSHkK/BcguuU2j
PoGWpS/6z5gK/8t+3MzBGgDtPlgGuSsh+LI7lnUrEcSOkzo511+Aqa3ArvmZcnwY
GHhr3Em7qB3DUN578J/3XINl0vOgEmkRXo98rezunrTuK9EcTj2ziJgM99eUoskb
xNSY+Ba74EXHU46U9gcP5dBSxiK7Gpf7mk0xSnSMTo/LzY5lHFdtAeysqPwrqCqi
6bqeuPyhA2nex11eLGzyhaKRluullTnpJXTVovPPR0KC7+Rr5IptmrV5Z3afHmDW
mjj4E4iAGXwrXU/WYw37ZCoocYkfThw9w0l907eXlygq8ObMOyk0MysKC+T27Z2o
EMCypmViM7rHXmYtpeFrxZ/2w0NdMwUhyzVMSdhQcxk97Jos1E9bqrZRfr12kOGa
78q32zvtBf+la9e1KdflA2YngGhvbxsXsEJaHRbFjrFSWuhygSk=
=ZRJP
-----END PGP SIGNATURE-----

--=-NdhKaDjaaqQo7Wns1juD--

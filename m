Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE52EF43E
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 15:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbhAHOyP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 09:54:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbhAHOyP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 09:54:15 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28E4C061380;
        Fri,  8 Jan 2021 06:53:34 -0800 (PST)
Received: from [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c] (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id A9EB135A5AA;
        Fri,  8 Jan 2021 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1610117610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Wjx0BOwSU5r5h1YyXIJf5qGFzQPWXnGLB+3MBQ/dDV8=;
        b=iTkH9rxFYPYcrxIykJDzfBchfZ65GNgSH82FOc/gHU821BI/QcVnKiWPBigzLURljBx+ip
        YSrdsSA6PhyW1wtSQEVpPdRRPotNw8ALmQNcMUpKWduWOeOco2VZllP2DlENllYoJSQ9GZ
        gZUrVsr+ifyPdFHwMBdKBbH0mnGrjfJUcwQws4RE0l7MEMlybLD99CymHH+Ap7omO4mwjv
        Sm2sxh1MTpycLaXpHxt2ziEckNrx0bDA72OXNi2Y7NuL1y1XfLNCxOnPUt6Dc7ME5ZEZ5J
        vKewO3/flJ3BbsCxyQei1YmksmX0411gjQasDH9Y6sSJLy8D7YaWKpf3abZ0KEglh8ouFK
        aAxGvyvHCyv054dFi6PfULuAvimYQ9PGgNjrlQNi/7amQoUPz0TU9jKn3WfQv1iB8MZwD2
        88ilpqcBMQ9UrYjJvk0SrmzkNA6IROkX+76V6SHTXCTl2eGVPfdwx2O/GqUODbEL2l/iUd
        HD2ibFmubmstfVD145Mm8kdN1CGGFuO3QeHeYcKBwxefmvCoj9aC1JiFL/l+Hlq/RL4VNP
        F9iWTrxxbPY9XRUp3ohIq7D8acYeNgc92HE0BIt0ZERpFczrWdRCpxrhj7EBLAqqg/Ii6S
        TDRQPXHEEQSGX6OQfjZbRm+OAvyrPZWoeaPhQC5zULOkEgdrqOXFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1610117610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Wjx0BOwSU5r5h1YyXIJf5qGFzQPWXnGLB+3MBQ/dDV8=;
        b=gDDW+s/CWqp7nsJzY2D7TWe0//OmaNe6oOq4EoZ9Nqtc30T/tI/jMeLVldmn705NDPIArR
        MWOHRwnxOJUq9NDA==
Message-ID: <e832278f9021c0f71afc5f90261bd17aea45a336.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <nycvar.YFH.7.76.2101081438530.13752@cbobk.fhfr.pm>
References: <20210104182937.1472673-1-lains@archlinux.org>
         <nycvar.YFH.7.76.2101081438530.13752@cbobk.fhfr.pm>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-A66lfXRMEicDMD38Z0Lu"
Date:   Fri, 08 Jan 2021 14:53:28 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-A66lfXRMEicDMD38Z0Lu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-08 at 14:44 +0100, Jiri Kosina wrote:
> On Mon, 4 Jan 2021, lains@archlinux.org=C2=A0wrote:
>=20
> > From: Filipe La=C3=ADns <lains@archlinux.org>
> >=20
> > This new feature present in new devices replaces the old Battery Level
> > Status (0x1000) feature. It keeps essentially the same information for
> > levels (reporting critical, low, good and full) but makes these levels
> > optional, the device exports a capability setting which describes which
> > levels it supports. In addition to this, there is an optional
> > state_of_charge paramenter that exports the battery percentage.
> >=20
> > This patch adds support for this new feature. There were some
> > implementation choices, as described below and in the code.
> >=20
> > If the device supports the state_of_charge parameter, we will just
> > export the battery percentage and not the levels, which the device migh=
t
> > still support.
> >=20
> > Since this feature can co-exist with the Battery Voltage (0x1001)
> > feature and we currently only support one battery feature, I changed th=
e
> > battery feature discovery to try to use 0x1000 and 0x1004 first and onl=
y
> > then 0x1001, the battery voltage feature.
> > In the future we could uncouple this and make the battery feature
> > co-exists with 0x1000 and 0x1004, allowing the device to export voltage
> > information in addition to the battery percentage or level.
> >=20
> > I tested this patch with a MX Anywhere 3, which supports the new
> > feature. Since I don't have any device that doesn't support the
> > state_of_charge parameter of this feature, I forced the MX Anywhere 3 t=
o
> > use the level information, instead of battery percentage, to test that
> > part of the implementation.
> > I also tested with a MX Master 3, which supports the Battery Level
> > Status (0x1000) feature, and a G703 Hero, which supports the Battery
> > Voltage (0x1001) feature, to make sure nothing broke there.
>=20
> Thanks a lot for the patch, Filipe. Minor details:
>=20
> > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> > ---
> > =C2=A0drivers/hid/hid-logitech-hidpp.c | 244 ++++++++++++++++++++++++++=
++++-
> > =C2=A01 file changed, 237 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitec=
h-
> > hidpp.c
> > index f85781464807..291c6b4d26b7 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -92,6 +92,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
> > =C2=A0#define HIDPP_CAPABILITY_BATTERY_MILEAGE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0BIT(2)
> > =C2=A0#define HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS=C2=A0=C2=A0BIT(3)
> > =C2=A0#define HIDPP_CAPABILITY_BATTERY_VOLTAGE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0BIT(4)
> > +#define HIDPP_CAPABILITY_BATTERY_PERCENTAGE=C2=A0=C2=A0=C2=A0=C2=A0BIT=
(5)
> > +#define HIDPP_CAPABILITY_UNIFIED_BATTERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0BIT(6)
> > =C2=A0
> > =C2=A0#define lg_map_key_clear(c)=C2=A0 hid_map_usage_clear(hi, usage, =
bit, max,
> > EV_KEY, (c))
> > =C2=A0
> > @@ -152,6 +154,7 @@ struct hidpp_battery {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int voltage;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int charge_type;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool online;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 supported_levels_1004;
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> > @@ -1171,7 +1174,7 @@ static int
> > hidpp20_batterylevel_get_battery_info(struct hidpp_device *hidpp,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0}
> > =C2=A0
> > -static int hidpp20_query_battery_info(struct hidpp_device *hidpp)
> > +static int hidpp20_query_battery_info_1000(struct hidpp_device *hidpp)
>=20
> That '_1000' suffix looks strange to me, as it's not completely obvious=
=20
> just from looking at the code what it actually means. Would it perhaps be=
=20
> more readable to call it something like hidpp20_query_battery_level(), an=
d=20
> symmentrically change hidpp20_query_battery_info_1004() to e.g.=20
> hidpp20_query_battery_voltage() ?

The problem here is that hidpp20_query_battery_info_1004() does not set the
battery voltage, it is also the battery level. The best alternative I can t=
hink
of is replacing the 1000/1004 with slightly mangled HID++ feature names, li=
ke we
do on the other feature function. The drawback here is that I think that co=
uld
get confusing quickly.

hidpp20_batterylevel_query_battery_info()
hidpp20_unifiedbattery_query_battery_info()

Note that this does not provide *that* much more information than the featu=
re
number, though it is probably the best option. What do you think?

> [ ... snip ... ]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* if the device supports st=
ate of charge (battery percentage) we
> > won't
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export the batt=
ery level information. there are 4 possible
> > battery
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 levels and they=
 all are optional, this means that the device
> > might
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not support any=
 of them, we are just better off with the battery
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 percentage. */
>=20
> Could you please use standard kernel commenting style here?

Oops, sorry. Will do :)

Cheers,
Filipe La=C3=ADns

--=-A66lfXRMEicDMD38Z0Lu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/4ceIACgkQ+JPGdIFq
qV0ZYw/+P8XnnaH+qJ1QGdWmlzwkyuj5XmeVyMKxlSC5QL6dx8XFeE5GxwnKcl5I
YExeMq+f+uDhYi6v5Ym19hU9VOgalbZiwXqXL3pnkxmdvlOiCAnj1ZYoeVnm2H6e
GzBdP0cHDT27TlIx3sXSNSxJz5IhiRnmFuG8lBSYpHPpbxeQZNv7Y7354FRnYwlY
xHVmQ/6WrlgOBvC2qfaCDvG8gw6Nct1QOUD+VjCz59Sroa1fcnaEXBRwa80wl7ip
GvRiLEJy69ykAQ/tfEMQIiBZ+ASa6vvdep8F9YZZmGDe1W63QUm7a1pADZvIQfvi
FEoToVHH+UieptxgJA+E4cH4tuoPbQ6A6rheM8sEcmwj0L5ohc0iEHZ9Z6SSz6qG
Us+wAxS5pyMyJjQpVrYU4af0yZg295ap/NjuUi2PXyJJqr85a/+O+nKyheew6+NK
CtQ9n5nFS1PS3D2MHlf4vAP8iFm0KB7kCpEQjmBi5eE002WzuFZmFopDup9VhfN3
iGeZ/3DCTrGL6FYMEgqjSekhaILLumen+cmWEvAncPZJ9oFK+CARAlO+Oi8rhAN1
aCZk+PhYFVDUokKHq20wvHn/nPcKW5oZWfG0XDfsApxQ9K+9pdGvjSgoSTyBPIvJ
9LbXQDCfEpr2eKYC1eOzdY9pLr1eXSSH2adZK9sDLeqq2FfRA0A=
=EMAA
-----END PGP SIGNATURE-----

--=-A66lfXRMEicDMD38Z0Lu--


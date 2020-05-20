Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C278B1DC141
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 23:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgETVUH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 17:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgETVUH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 17:20:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E14C061A0E;
        Wed, 20 May 2020 14:20:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 84B392A2B99
Received: by earth.universe (Postfix, from userid 1000)
        id F0C6F3C08C7; Wed, 20 May 2020 23:20:03 +0200 (CEST)
Date:   Wed, 20 May 2020 23:20:03 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 3/5] Input: EXC3000: add EXC80H60 and EXC80H84 support
Message-ID: <20200520212003.fxxi4uytifkeb2ca@earth.universe>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-4-sebastian.reichel@collabora.com>
 <20200520174519.GV89269@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hcixh3a6whlmsy5m"
Content-Disposition: inline
In-Reply-To: <20200520174519.GV89269@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--hcixh3a6whlmsy5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 20, 2020 at 10:45:19AM -0700, Dmitry Torokhov wrote:
> Hi Sebastian,
>=20
> On Wed, May 20, 2020 at 05:39:34PM +0200, Sebastian Reichel wrote:
> > =20
> >  	data->client =3D client;
> > +	data->info =3D device_get_match_data(&client->dev);

The above is for DT (and ACPI, but driver has no ACPI table).

> > +	if (!data->info) {
> > +		enum eeti_dev_id eeti_dev_id =3D
> > +			i2c_match_id(exc3000_id, client)->driver_data;
>=20
> I believe i2c devices can be instantiated via sysfs, so I think we
> better handle case where we can't find matching id. Also driver_data is
> enough to store a pointer, maybe we can have individual structures
> instead of using an array and indexing here?

The above code is only for exactly this usecase (loading via sysfs).
There is zero chance, that we cannot find matching id. The sysfs
based probing works by providing the device address and the name
listed in driver's id_table. I took the above code style from
drivers/i2c/muxes/i2c-mux-ltc4306.c.

We can store the pointer directly in i2c_device_id's driver_data
field, but that requires two type casts (field is ulong instead
of pointer). The array variant feels a bit cleaner to me.

-- Sebastian

--hcixh3a6whlmsy5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl7Fnv0ACgkQ2O7X88g7
+po2bA//S0yFjgkrJB7fjg4C3R86Xu6HxdkqfQaAUch7IP/RsFdhDsxcCeNO1yC2
PSuIRz5c+QZDayKvVBA4zfrLaqtn7yKadyzaoHqTIFbavZpuEnLjT6ySC9AFFKCR
FUwWBrVfhXxJH1PWJVTfB4ZgwwnZ5wqu7x0nuKp4My4JsqbsKir0JCE8oOftTkAd
HSW5bGRwVKxbDI6vQ0x9aDac/+bw1b4vTD5k8hWPKlzZufEzln0NgWJH+4CKFQbg
7UqB1NjNmUxrTZLMco5czBbocVojX6yOs5/1WjvVGvb0aai1Ny4p9HEzV9A7by+m
A+yRbrbUhMX9fdIFBoRIFSiHLglpMRm2/h8tfPLE5m5DsL1tv4+aW4Y+j9rMuWxy
yWyFwDZ92UgYGwv5N7QmozpBdp+732YBseEXT6q0OzVpP61RAj0QpL3TEgDHZZ98
hL8KOb88E4kOmYmbUQoYz+W2ACN90HX9PS3Meb711iSlYPh/MOiYol5VT5lRqJHV
DHwi0bTIbRxJJiTFrTambDURbWUdFSqPEDwQaZnBalEWk7e9ipWOJhYXgHBE6QiR
sGvn/2oA2dxwJdzJzrzoOjRQTafeB2GnFGmZPJOhNHiiHbRUEnIFkCTeNOAJ0C93
R0jR3PYflML/6Hmsmx4WRsf5xmlAq7AIvt7ahxX7eooQ40+EeqA=
=oNKC
-----END PGP SIGNATURE-----

--hcixh3a6whlmsy5m--

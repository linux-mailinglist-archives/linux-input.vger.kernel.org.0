Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39A432B4AB
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351230AbhCCFY5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383550AbhCBVOx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 16:14:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BE4C061756
        for <linux-input@vger.kernel.org>; Tue,  2 Mar 2021 13:09:44 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lHCGy-0002Z3-NS; Tue, 02 Mar 2021 22:09:40 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lHCGt-0003MP-1y; Tue, 02 Mar 2021 22:09:35 +0100
Date:   Tue, 2 Mar 2021 22:09:34 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jingle Wu <jingle.wu@emc.com.tw>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kernel@pengutronix.de
Cc:     linux-input@vger.kernel.org
Subject: elan_i2c: failed to read report data: -71
Message-ID: <20210302210934.iro3a6chigx72r4n@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7r63wxkl6g7wjvlx"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--7r63wxkl6g7wjvlx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just installed Linux on a new Thinkpad E15 and I experience a
non-working touchpad. I can move the mouse just fine, but when I press
one of the three buttons or move the trackpoint the kernel log gets
flooded with:

	elan_i2c 0-0015: failed to read report data: -71

and nothing happens in the GUI.

This is a kernel from Debian testing, i.e. 5.10.13, during probe of the
device the following is reported:

	elan_i2c 0-0015: supply vcc not found, using dummy regulator
	elan_i2c 0-0015: Elan Touchpad: Module ID: 0x000e, Firmware: 0x0001, Sampl=
e: 0x0000, IAP: 0x0000
	input: Elan Touchpad as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/inpu=
t/input21
	input: Elan TrackPoint as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/in=
put/input22

I backported commits

	056115daede8 Input: elan_i2c - add new trackpoint report type 0x5F
	c7f0169e3bd2 Input: elan_i2c_core - move header inclusion inside

to this kernel, but this didn't help.

When enabling smbus tracing the matching events are:

 irq/159-elan_i2-2207    [003] ....   963.625641: smbus_read: i2c-0 a=3D015=
 f=3D0040 c=3Da8 BLOCK_DATA
 irq/159-elan_i2-2207    [003] ....   963.629247: smbus_result: i2c-0 a=3D0=
15 f=3D0000 c=3Da8 BLOCK_DATA rd res=3D-71

The relevant code is:

        len =3D i2c_smbus_read_block_data(client,
                                        ETP_SMBUS_PACKET_QUERY,
                                        &report[ETP_SMBUS_REPORT_OFFSET]);
        if (len < 0) {
                dev_err(&client->dev, "failed to read report data: %d\n", l=
en);
                return len;
        }

I think the failing location in the i2c driver is

        if (read_write =3D=3D I2C_SMBUS_READ ||
            command =3D=3D I2C_SMBUS_BLOCK_PROC_CALL) {
                len =3D inb_p(SMBHSTDAT0(priv));
                if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
                        return -EPROTO;

                data->block[0] =3D len;
                for (i =3D 0; i < len; i++)
                        data->block[i + 1] =3D inb_p(SMBBLKDAT(priv));
        }

in i801_block_transaction_by_block().

Does this ring a bell? Does someone know if there is documentation
available?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7r63wxkl6g7wjvlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmA+qYEACgkQwfwUeK3K
7Anojwf+JN5qU64c1ElSCCk70UIdgPtk7iVwxblVrt7DtBwc02iJJLVzZgJmVH8v
MhAbfP1NFnzsCGf4Ehi0kbunv9BJfTXBbO43S45ohz+VF56P7HM8MCEra6+QVksM
+yUg8UHAtBErVbwWI2EFLpJYgY/Mr5JLhX5TSKrsps2VP6u1FnRm0/DjOxtTQHYQ
tpX0QEjKjJxR6qH3SUvgDjaI9aTxBTFQ4WU6KQgmJ+UQ3YW9fydtS+K1JKM2m3rP
MMPTqc+EWQKENKkwUjdPfPFswqnny1d53RMAzaZX2lingZEUtpPNNvFeIIdqVluQ
UV6Z3zQPRXgdj1iTRwfDJCz0Z27bLg==
=3NnI
-----END PGP SIGNATURE-----

--7r63wxkl6g7wjvlx--

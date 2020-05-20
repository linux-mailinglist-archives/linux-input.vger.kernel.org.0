Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4521DC151
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 23:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgETVZo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 17:25:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41356 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgETVZo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 17:25:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 732B42A2B99
Received: by earth.universe (Postfix, from userid 1000)
        id 1DB363C08C7; Wed, 20 May 2020 23:25:40 +0200 (CEST)
Date:   Wed, 20 May 2020 23:25:40 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 4/5] Input: EXC3000: Add support to query model and
 fw_version
Message-ID: <20200520212540.t73my7ireicuwbrs@earth.universe>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-5-sebastian.reichel@collabora.com>
 <20200520174952.GW89269@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nc34qudpeetjvypj"
Content-Disposition: inline
In-Reply-To: <20200520174952.GW89269@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--nc34qudpeetjvypj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 20, 2020 at 10:49:52AM -0700, Dmitry Torokhov wrote:
> Hi Sebastian,
>=20
> On Wed, May 20, 2020 at 05:39:35PM +0200, Sebastian Reichel wrote:
> > Expose model and fw_version via sysfs. Also query the model
> > in probe to make sure, that the I2C communication with the
> > device works before successfully probing the driver.
> >=20
> > This is a bit complicated, since EETI devices do not have
> > a sync interface. Sending the commands and directly reading
> > does not work. Sending the command and waiting for some time
> > is also not an option, since there might be touch events in
> > the mean time.
> >=20
> > Last but not least we do not cache the results, since this
> > interface can be used to check the I2C communication is still
> > working as expected.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../ABI/testing/sysfs-driver-input-exc3000    |  15 ++
> >  drivers/input/touchscreen/exc3000.c           | 145 +++++++++++++++++-
> >  2 files changed, 159 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-input-exc3000
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Doc=
umentation/ABI/testing/sysfs-driver-input-exc3000
> > new file mode 100644
> > index 000000000000..d79da4f869af
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> > @@ -0,0 +1,15 @@
> > +What:		/sys/class/input/inputX/fw_version
> > +Date:		May 2020
> > +Contact:	linux-input@vger.kernel.org
> > +Description:	Reports the firmware version provided by the touchscreen,=
 for example "00_T6" on a EXC80H60
> > +
> > +		Access: Read
> > +		Valid values: Represented as string
> > +
> > +What:		/sys/class/input/inputX/model
> > +Date:		May 2020
> > +Contact:	linux-input@vger.kernel.org
> > +Description:	Reports the model identification provided by the touchscr=
een, for example "Orion_1320" on a EXC80H60
> > +
> > +		Access: Read
> > +		Valid values: Represented as string
>=20
> These are properties of the controller (i2c device), not input
> abstraction class on top of it, so the attributes should be attached to
> i2c_client instance.
>=20
> Please use devm_device_add_group() in probe to instantiate them at the
> proper level.

As written in the cover letter using devm_device_add_group() in
probe routine results in a udev race condition:

http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/

-- Sebastian

--nc34qudpeetjvypj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl7FoFMACgkQ2O7X88g7
+ppXxg//c/Ljjrs8JDeSMRa8W7opVTrXN0WVDAVkizEQIrti/KD5ht30QyjNnO3N
kDgiRr4rmVmUHpGWd/VsK9FzRRSP21Hj0qo4wsMCvxAU2htHJVjy76Hh0Ox4p5Xr
Cn0sIw6gp5JhLbM8jUeVnThbx15sHECslLlXDKR1EjUm3makvca8vYHzbDAHT5ST
6wUvQJ9pENyxvQ8jvP4InCKw5MGv9de5nC7vkKZE8Qn2JaLbK0/tOexMB+WJs0oK
h3Sk/4djmR8U+A2E0MoztvXHh3YDwIECBRyUkiU7BMkejDILfAwI2/pAfeMDJWpR
20edPBUx7jqdTe7AoESy4bBBGYCVlnRpWWgLUUCJCcak35mcaAAW/h3kR18fcQwc
HRuROOawXaBWzAyCeiuV6w+mIDwHARSD65FQ1xu1AyuD99uO8bKpzThyAgC7kTDk
p+TcNiVquWqxjdJWosSjp7CHZjPdpErw/Gi3VD3hj/W/ignfRopRi+npK04Z8o79
oyWaFic4ibUFqYuFPVPcknVxhLtiHFpj8RHDETQP2aydSznhGlrnNnTBwweT8Oii
VcPK8CAnzrlwTOgKgFicTuvXJ0FwlYt855OKQIPkoTOJjk22khaSp682IObjUFWP
4THZIvNHgdlmx04NZLUie9TVmg/u5k4PF6ibv1UBu5qhBecO6ng=
=Whj0
-----END PGP SIGNATURE-----

--nc34qudpeetjvypj--

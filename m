Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683C330BFF2
	for <lists+linux-input@lfdr.de>; Tue,  2 Feb 2021 14:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhBBNq3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Feb 2021 08:46:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55096 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhBBNol (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Feb 2021 08:44:41 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 922351C0B7A; Tue,  2 Feb 2021 14:43:59 +0100 (CET)
Date:   Tue, 2 Feb 2021 14:43:59 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add support for a front proximity
 switch
Message-ID: <20210202134359.GA25474@duo.ucw.cz>
References: <20201205004709.3126266-1-swboyd@chromium.org>
 <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com>
 <X/ZwRqJFJ9BY4Z3z@google.com>
 <CAD=FV=VmNQDSZFT3vaJ64DYyGqoE39uig581ZmaX0s-Y1U_CTw@mail.gmail.com>
 <X/dlKKeAHU/Ab+VD@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <X/dlKKeAHU/Ab+VD@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > Given that it touches a header file owned by the Chrome OS maintain=
ers
> > > > and a driver owned by input, how should it land?  One maintainer Ac=
ks
> > > > and the other lands?
> > >
> > > Sorry about missing this one, however the "front proximity" switch has
> > > been introduced for the benefit of phone devices, to be emitted when a
> > > device is raised to user's ear, and I do not think we should be using
> > > this here.
> > >
> > > We have just recently had similar discussion with regard to palm- and
> > > lap-mode sensors and whether they should be reported over input or IIO
> > > as true proximity sensors:
> > >
> > > https://lore.kernel.org/linux-iio/9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d=
9@redhat.com/
> > >
> > > Based on what we are doing for other Chrome OS devices that expose
> > > proximity sensors (for example trogdor) we have decided that we all
> > > should be using IIO as it will allow not only on/off, but true proxim=
ity
> > > reporting with potential of implementing smarter policies by userspac=
e.
> > >
> > > Because of that we should do the same here and export this as IIO
> > > proximity sensor as well.
> >=20
> > For devices with a true proximity sensor that's exactly what we're
> > doing.  I've only been involved in the periphery of the discussion,
> > but as I understand it there are some models of laptop for which we
> > don't have a true proximity sensor.  On these devices, the EC is in
> > charge of deciding about proximity based on a number of factors.
>=20
> Yes, I understand that on some devices the proximity sensors are not
> true sensors but rather on/off signals, potentially derived from a
> multitude of sources. However there is still a benefit in exposing them
> as IIO proximity devices with limited reporting representing
> [near, infinity] range/values. This will mean that userspace needs to
> monitor only one set of devices (IIO) instead of both IIO and input, and
> will not require constantly expanding EV_SW set to account for
> ever-growing number of proximity sensors (lap, palm, general presence,
> etc).

While I believe one set of devices is good goal, I don't think IIO is
good solution here. It is being used for user input after
all... Routing on/off values to IIO is strange.

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBlXHwAKCRAw5/Bqldv6
8iQyAKDEsYNRzqr/jIGnzNuxddtPB41y4ACfTPpkTTE4bkMVKGj5xxJf3/IwM88=
=+KpI
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

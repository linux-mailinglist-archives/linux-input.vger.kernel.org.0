Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C62171367
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 09:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgB0I4T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 03:56:19 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46850 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbgB0I4T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 03:56:19 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8BEE61C030F; Thu, 27 Feb 2020 09:56:17 +0100 (CET)
Date:   Thu, 27 Feb 2020 09:56:17 +0100
From:   Pavel Machek <pavel@denx.de>
To:     ycho1399@gmail.com
Cc:     linux-input@vger.kernel.org, voyandrea@gmail.com,
        andrea.ho@advantech.com.tw, oakley.ding@advantech.com.tw,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [V1,1/1] Input/misc: add support for Advantech software defined
 button
Message-ID: <20200227085617.GA16021@duo.ucw.cz>
References: <20200227031721.17703-1-Andrea.Ho@advantech.com.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20200227031721.17703-1-Andrea.Ho@advantech.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-02-27 03:15:31, ycho1399@gmail.com wrote:
> From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
>=20
> Advantech sw_button is a ACPI event trigger button.
>=20
> With this driver, we can report KEY_EVENTs on the
> Advantech Tabletop Network Appliances products and it has been
> tested in FWA1112VC.
>=20
> Add the software define button support to report KEY_EVENTs by
> different acts of pressing button (like double-click, long pressed
> and tick) that cloud be get on user interface and trigger the
> customized actions.

I'm not sure why you Cc half of the world. What does Dave Miller have
to do with this. Please be more careful (and drop me from the list).

Plus, I'm pretty sure you should not be detecting double clicks (etc)
in the driver.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXleEMAAKCRAw5/Bqldv6
8q1wAJwKJUFtf+/y1rzmBIHrvP2KDOfAMACfV8gYT/huf3pBaSq5vhhA2C8nHO0=
=AKub
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--

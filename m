Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F81171537
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 11:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbgB0KmZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 05:42:25 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33742 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgB0KmZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 05:42:25 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2949D1C0311; Thu, 27 Feb 2020 11:42:23 +0100 (CET)
Date:   Thu, 27 Feb 2020 11:42:22 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Andrea.Ho@advantech.com.tw
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
        linux-kernel@vger.kernel.org, voyandrea@gmail.com,
        amy.shih@advantech.com.tw, oakley.ding@advantech.com.tw
Subject: Re: [V2,1/1] Input/misc: add support for Advantech software defined
 button
Message-ID: <20200227104222.GA25104@duo.ucw.cz>
References: <20200227101738.22389-1-Andrea.Ho@advantech.com.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <20200227101738.22389-1-Andrea.Ho@advantech.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +/* Defined keycodes */
> +static short swbtn_keycodes[]  =3D {
> +	BTN_TRIGGER_HAPPY2, /* double click */
> +	BTN_TRIGGER_HAPPY,  /* tick */
> +	BTN_TRIGGER_HAPPY3, BTN_TRIGGER_HAPPY4, /* long press */
> +	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, BTN_TRIGGER_HAPPY7,
> +	BTN_TRIGGER_HAPPY8, BTN_TRIGGER_HAPPY9, BTN_TRIGGER_HAPPY10
> +};

NAK. See my prev email.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXledDgAKCRAw5/Bqldv6
8oV9AKCi6b7noclyjt7mj4GvMMIWU9Xo+wCeMjTPUj85fu6rwD5+0AVCXbnc62U=
=AEx8
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

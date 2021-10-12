Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0A9429ECA
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 09:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbhJLHmF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 03:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhJLHmE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 03:42:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39D3C061570
        for <linux-input@vger.kernel.org>; Tue, 12 Oct 2021 00:40:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maCOG-0006Cm-Lt; Tue, 12 Oct 2021 09:40:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maCOF-0004MH-DM; Tue, 12 Oct 2021 09:39:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maCOF-00039T-CR; Tue, 12 Oct 2021 09:39:59 +0200
Date:   Tue, 12 Oct 2021 09:39:59 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Input: snvs_pwrkey - Add clk handling
Message-ID: <20211012073959.4wnkarxwtrmuxtuz@pengutronix.de>
References: <20210922094300.354227-1-u.kleine-koenig@pengutronix.de>
 <20211005200005.bau4trn26wu23bpw@pengutronix.de>
 <YWTpg35wyYS1uoFZ@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o26z3qqgdsfqdrae"
Content-Disposition: inline
In-Reply-To: <YWTpg35wyYS1uoFZ@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--o26z3qqgdsfqdrae
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Mon, Oct 11, 2021 at 06:48:51PM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 05, 2021 at 10:00:05PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Wed, Sep 22, 2021 at 11:43:00AM +0200, Uwe Kleine-K=F6nig wrote:
> > > On i.MX7S and i.MX8M* (but not i.MX6*) the pwrkey device has an
> > > associated clock. Accessing the registers requires that this clock is
> > > enabled. Binding the driver on at least i.MX7S and i.MX8MP while not
> > > having the clock enabled results in a complete hang of the machine.
> > > (This usually only happens if snvs_pwrkey is built as a module and the
> > > rtc-snvs driver isn't already bound because at bootup the required clk
> > > is on and only gets disabled when the clk framework disables unused c=
lks
> > > late during boot.)
> > >=20
> > > This completes the fix in commit 135be16d3505 ("ARM: dts: imx7s: add
> > > snvs clock to pwrkey").
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > This patch fixes a hard machine hang that occurs on an i.MX8MP based
> > machine in ~10% of the boot ups. In my eyes it's suitable to be applied
> > before v5.14 even.
> >=20
> > Any feedback on it?
>=20
> Sorry for the delay. As you may know I strongly dislike dev_err_probe()
> as it conflates the 2 issue - error printing and noting the deferral
> event that should be implemented by the resource providers (and I
> believe Rob had WIP patches to push this reporting down too providers).

I didn't know your dislike (and I probably will forget it again soon,
given that there seems to be disagreement among maintainers :-), and
=66rom your words I don't understand it. The improved idea is that
devm_clk_get_optional() already registers the deferral event for the
clk? My first intuition is that this won't work, so I'd like to see the
WIP series. (Added Rob to Cc.) Someone has a link?

Also I don't share that sentiment, given that today
devm_clk_get_optional() and all the other resource providers don't do
the necessary stuff for deferral handling, I strongly prefer to use the
mechanism that is available today (even if it might be possible to
improve it) instead of open coding it. And if it's only because once the
improved variant is available it's easier to identify the code locations
that need adaption if they all use a common function instead of
identifying something like

	clk =3D devm_clk_get_optional(&pdev->dev, NULL);
	if (IS_ERR(clk)) {
		error =3D PTR_ERR(clk);
		if (error !=3D -EPROBE_DEFER)
			dev_err(pdev->dev, "Failed to get clk: %pe\n", clk)
		else
			device_set_deferred_probe_reason(dev, oh_I_need_a_struct_va_format_how_d=
o_I_get_this?);
		return error;
	}

instead of

	clk =3D devm_clk_get_optional(&pdev->dev, NULL);
	if (IS_ERR(clk))
		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to get clock\n");
=09
Even if the driver does not call device_set_deferred_probe_reason(), the
additional check for error !=3D -EPROBE_DEFER is ugly, isn't it?

> Could you p lease resubmit with "normal" dev_err()/dev_warn()/etc and I
> will be happy to apply.

Is the above the variant you prefer? Maybe without the call to
device_set_deferred_probe_reason()? Or maybe even without the check for
-EPROBE_DEFER (which however might result in wrong error messages which
is IMHO worse than the ugliness of the additional check)?

Please advice. Given that adding clk handling prevents a machine hang,
I'm willing to add it in the way you prefer, even if I don't agree to
your reasoning.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o26z3qqgdsfqdrae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlO8wACgkQwfwUeK3K
7AlGXgf9HELhIYwZuB9hzIS6b2B57ph49TXd/FIssYhQgnfEYc5y2oUm8Yg6gy9V
4KuxleqGGIcWOj0dIUaads8/4i+ADDuuxZgXYLZt7XWQWptPUVh4Z4IhCMnxF3F5
FR94UoIfoV0p+ZqRDS5It7+5mj17+LccVPRRZ7g547cYZhoGbDRx6chzgiZXHI9l
vsHDEciv6ocF/rP3lXawavHvyr2VhC7gNaNqHyyk8X4mGUWZBNbGJ3dC+pQejxim
H7r5L1V6zP3lWI7T+xEUBXIuPygjxGKbejHAlxYniXMdRcNhV3NWJX1H2oGM79ah
Kn9lY5RHLlmHc5pV9c2TrJuM9tk0nA==
=pO9c
-----END PGP SIGNATURE-----

--o26z3qqgdsfqdrae--

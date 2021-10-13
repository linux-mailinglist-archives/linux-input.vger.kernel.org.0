Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0ABC42B8FE
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 09:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbhJMH2Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 03:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhJMH2X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 03:28:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE515C061570
        for <linux-input@vger.kernel.org>; Wed, 13 Oct 2021 00:26:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maYeX-0004VN-Hk; Wed, 13 Oct 2021 09:26:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maYeW-0005GE-Jc; Wed, 13 Oct 2021 09:26:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maYeW-0006lB-IE; Wed, 13 Oct 2021 09:26:16 +0200
Date:   Wed, 13 Oct 2021 09:26:13 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] Input: snvs_pwrkey - Add clk handling
Message-ID: <20211013072613.6u6eat4rns7pkyi7@pengutronix.de>
References: <20210922094300.354227-1-u.kleine-koenig@pengutronix.de>
 <20211005200005.bau4trn26wu23bpw@pengutronix.de>
 <YWTpg35wyYS1uoFZ@google.com>
 <20211012073959.4wnkarxwtrmuxtuz@pengutronix.de>
 <YWZNOoL2cCeuswwo@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lpct5panyw6x4qif"
Content-Disposition: inline
In-Reply-To: <YWZNOoL2cCeuswwo@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--lpct5panyw6x4qif
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Helli Dmitry,

On Tue, Oct 12, 2021 at 08:06:34PM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 12, 2021 at 09:39:59AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Oct 11, 2021 at 06:48:51PM -0700, Dmitry Torokhov wrote:
> > > On Tue, Oct 05, 2021 at 10:00:05PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > On Wed, Sep 22, 2021 at 11:43:00AM +0200, Uwe Kleine-K=F6nig wrote:
> > > > > On i.MX7S and i.MX8M* (but not i.MX6*) the pwrkey device has an
> > > > > associated clock. Accessing the registers requires that this cloc=
k is
> > > > > enabled. Binding the driver on at least i.MX7S and i.MX8MP while =
not
> > > > > having the clock enabled results in a complete hang of the machin=
e.
> > > > > (This usually only happens if snvs_pwrkey is built as a module an=
d the
> > > > > rtc-snvs driver isn't already bound because at bootup the require=
d clk
> > > > > is on and only gets disabled when the clk framework disables unus=
ed clks
> > > > > late during boot.)
> > > > >=20
> > > > > This completes the fix in commit 135be16d3505 ("ARM: dts: imx7s: =
add
> > > > > snvs clock to pwrkey").
> > > > >=20
> > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > >=20
> > > > This patch fixes a hard machine hang that occurs on an i.MX8MP based
> > > > machine in ~10% of the boot ups. In my eyes it's suitable to be app=
lied
> > > > before v5.14 even.
> > > >=20
> > > > Any feedback on it?
> > >=20
> > > Sorry for the delay. As you may know I strongly dislike dev_err_probe=
()
> > > as it conflates the 2 issue - error printing and noting the deferral
> > > event that should be implemented by the resource providers (and I
> > > believe Rob had WIP patches to push this reporting down too providers=
).
> >=20
> > I didn't know your dislike (and I probably will forget it again soon,
> > given that there seems to be disagreement among maintainers :-), and
> > from your words I don't understand it. The improved idea is that
> > devm_clk_get_optional() already registers the deferral event for the
> > clk? My first intuition is that this won't work, so I'd like to see the
> > WIP series. (Added Rob to Cc.) Someone has a link?
>=20
> I think this is here:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=3Dd=
ev_err-removal
>=20
> I do not think it adds calls to device_set_deferred_probe_reason() but
> that should be trivial to add, given we have device pointer and ID of
> the resource, which should be enough to track it.

So the general idea is to push the error message into the resource
providers. I think this lowers the quality of error messages in some
cases. E.g. when clk_get() fails, the clk core can only emit something
like

	dev_err(dev, "Failed to get clock '%s' (%pe)\n", id, clk);

but the requesting driver has more information and might emit a more
helpful message. Or the requesting driver might even be able to handle
an error (even if it's not -ENODEV) and emitting an error is wrong. For
example because id is NULL but the driver knows a good name or a
detailed purpose of the clk can be mentioned to help debugging the
issue.

And IMHO even with this approach it's sensible to factor out the part:

	if (IS_ERR(x) && PTR_ERR(x) !=3D -EPROBE_DEFER)
		dev_err(dev, ...);

	return PTR_ERR(x);

Ah, it could use dev_err_probe() which has exactly the required
semantic, so no need to reinvent the wheel.

I don't know your bubble of work, in mine there are often customers who
say something like "Look, my kernel error log contains these errors,
why is there a problem with device X?" and the explanation is just that
a driver emitted an error message in the -EPROBE_DEFER case, sometimes
even several of them, e.g. once whenever an USB thumb drive is inserted
into the machine. (ok, if this happens there is likely indeed a problem
to fix, but then a single error message would still be nicer.) So I
really like drivers that don't print an error on probe deferral. Also
having drivers write something helpful (today!) to
/sys/kernel/debug/devices_deferred is very appreciated, as it makes
debugging quite a bit easier. dev_err_probe() helps for both.

All in all pushing the error message reporting into the providers seems
to be orthogonal to the question how to best report an error on the
requester's side while the providers are still "unfixed". And not using
an approach that has upsides today and not only when a certain series
(that wasn't even posted yet) landed, seems wrong to me.

> > Also I don't share that sentiment, given that today
> > devm_clk_get_optional() and all the other resource providers don't do
> > the necessary stuff for deferral handling, I strongly prefer to use the
> > mechanism that is available today (even if it might be possible to
> > improve it) instead of open coding it. And if it's only because once the
> > improved variant is available it's easier to identify the code locations
> > that need adaption if they all use a common function instead of
> > identifying something like
> >=20
> > 	clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> > 	if (IS_ERR(clk)) {
> > 		error =3D PTR_ERR(clk);
> > 		if (error !=3D -EPROBE_DEFER)
> > 			dev_err(pdev->dev, "Failed to get clk: %pe\n", clk)
> > 		else
> > 			device_set_deferred_probe_reason(dev, oh_I_need_a_struct_va_format_h=
ow_do_I_get_this?);
>=20
> You do not, you happily ignore it and wait for providers to do it for
> you instead of forcing the change through all drivers.

I don't get this. What change is forced here? Today (where some
providers don't emit an error message) the driver has to emit an error
message itself. (Either using dev_err_probe() with the above mentioned
advantages, by open coding it or by using a simpler and inferior
procedure.) And once devm_clk_get_optional() is adapted to emit the
error message itself, you have to adapt all callers anyhow, and which of
the approaches a given driver selected doesn't make any relevant
difference, you just remove the error message emitting there.
But until devm_clk_get_optional() is "fixed" (in a year? Or two? Ever?)
you force an inferior behaviour for users with your refusal to allow
dev_err_probe().

> > 		return error;
> > 	}
> >=20
> > instead of
> >=20
> > 	clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> > 	if (IS_ERR(clk))
> > 		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to get clock\n=
");
> > =09
> > Even if the driver does not call device_set_deferred_probe_reason(), the
> > additional check for error !=3D -EPROBE_DEFER is ugly, isn't it?
>=20
> I'd simply do
>=20
> 	clk =3D devm_clk_get_optional(...);
> 	error =3D PTR_ERR_OR_ZERO(clk);
> 	if (error) {
> 		dev_err(&pdev->dev, "...", error);
> 		return error;
> 	}

Done something similar now (not using PTR_ERR_OR_ZERO() which in my
experience is even more controversial than dev_err_probe()).

> > > Could you p lease resubmit with "normal" dev_err()/dev_warn()/etc and=
 I
> > > will be happy to apply.
> >=20
> > Is the above the variant you prefer? Maybe without the call to
> > device_set_deferred_probe_reason()? Or maybe even without the check for
> > -EPROBE_DEFER (which however might result in wrong error messages which
> > is IMHO worse than the ugliness of the additional check)?
>=20
> Why are they wrong? They are not. They would literally say that some
> resource was not obtained because it is not ready.

With your approach you emit messages at the error level (i.e. where
people assume there is a real problem that needs addressing), but this
information is (in most cases) irrelevant and already wrong when someone
reads it. So the only effect is delaying the boot process a bit and
irritating people. Yes, technically it's right to emit an error on
-EPROBE_DEFER, but its usefulness is negative.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lpct5panyw6x4qif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFmihIACgkQwfwUeK3K
7Ak4vggAj1DquW3CeiME8ooX14h56NQ/u7ysKQsgcvhuaktkOUflVWw+dzJqx7XE
0APHcMv4KH9N3Ey7kxVMYrwC4ycWS/EiFPv27rf/4zKBbBWDkzJ2m9vVdK2WnNgY
OWADC1J8uvVPyXYAnyVyhwMtaNyhZtJ+SQzCP4xZtqF0Wkr9vGFVC0Vz1T+Ugn7Z
cemkz0eHYiZRRoFMqQ9woO4uU7zoxqQv3ALdEc+A55cwFCmId1gIgZZYZHVOLjca
HLi1o4S5BdoXHgBh8fXw2OMA/zu/OGu4qzM0t+zDac1I8oXprnk0A14OPhXQ3vRg
tkAVZRLi/Hkn0nrx98hbZzbOTdgTwg==
=Xozs
-----END PGP SIGNATURE-----

--lpct5panyw6x4qif--

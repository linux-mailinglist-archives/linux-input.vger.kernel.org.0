Return-Path: <linux-input+bounces-2248-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 253708725D1
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 18:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42AE284CD0
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 17:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E9417555;
	Tue,  5 Mar 2024 17:41:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E915491
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709660484; cv=none; b=ElEVuPriw/xPW/xhzI5z1anb1kDRFAMeR8rU1KZ2eQ2pyU2egDWIyTF9p3CIFHPI9MjzPU+YapGpZbsAZZMGiTBGZcRHomscUCMh3uV+x2ay0pCfR2OdkIwL1F/FJGl68RyXGYqaKcy4BjRmtyNHJve7a6FOHjqqFKTBKcoYUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709660484; c=relaxed/simple;
	bh=5t85UXiYe/PAqcAbf3aRNV3LBJ8HouOjKFmrJ9PHCr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMFMnfB+nBr3qF2gprPDOxOHFpQB0rKUPRJqFSThnb8jWVjVv6/36QPj7ZZL7DH7SaE72uhxjbtEwIfedlZtRX4PyqhtKkmE+aQc2kJa1Qp0n4uz946+xah16stVfh2mZ717asL3POnEJtYRjZIxlr8FbF8maFfQIrg0ULH4Mkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhYmz-0001Ui-CH; Tue, 05 Mar 2024 18:41:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhYmy-004axp-SQ; Tue, 05 Mar 2024 18:41:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhYmy-000D1u-2Y;
	Tue, 05 Mar 2024 18:41:16 +0100
Date: Tue, 5 Mar 2024 18:41:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: gpio_keys_polled - Suppress deferred probe error
 for gpio
Message-ID: <pybgja2s3e6zyg6ek5tyrhxtt5yuzv36tzxjanfm7gl7snxzxg@vo2cz2fr67y4>
References: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
 <ZedTGsn2LAoBMECf@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="umik4pwuj4727mmp"
Content-Disposition: inline
In-Reply-To: <ZedTGsn2LAoBMECf@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org


--umik4pwuj4727mmp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 09:15:06AM -0800, Dmitry Torokhov wrote:
> On Tue, Mar 05, 2024 at 11:10:42AM +0100, Uwe Kleine-K=F6nig wrote:
> > On a PC Engines APU our admins are faced with:
> >=20
> > 	$ dmesg | grep -c "gpio-keys-polled gpio-keys-polled: unable to claim =
gpio 0, err=3D-517"
> > 	261
> >=20
> > Such a message always appears when e.g. a new USB device is plugged in.
> >=20
> > Suppress this message which considerably clutters the kernel log for
> > EPROBE_DEFER (i.e. -517).
>=20
> I'll apply this, but that seems to be a misconfiguration somewhere - we
> expect deferred probes to succeed eventually, here it looks like it
> stays deferred forever and each time a new devices gets plugged in we
> try to resolve deferred probe again and again.
>=20
> Why doesn't gpio 0 become available?

This is an x86 machine and I don't even know why the device actually
exists. Also I have no idea what gpio 0 should be, there seems to be a
gpio controller[1], but its GPIO numbers start at 512.

I found a bug report about this this issue:
https://github.com/pcengines/apu2-documentation/issues/204

Anyhow, I think my patch is fine. I forwarded the bug report to my admin
who might or might not dig deeper.

Best regards and thanks,
Uwe

[1] /sys/devices/pci0000:00/AMD0030:00/gpio/gpiochip512

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--umik4pwuj4727mmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXnWTsACgkQj4D7WH0S
/k54mwf+OmIRVIgnrQNZmb1WHREVBMDIG6iRHizIABfiOSRFjV9muc7cgvN2eTC+
iTvVCV5s9Izzls+784bcweP4tMHOsrpFbj9Y6sh89dXA+Vcq0KCAeuBozVTM+5pw
1ROA2AZ9R8BijizFaDevvmWtSgwAl+NOfPvsF0TNlsTqkr5rj9+vUdNOZbjkPRJX
XCqGxV064m6zaYFPrlgo70j9S1aGzKvqqwOFsvtKJPzk7txLMif+QEY6y8Tg1GB1
FyLSjWB1++WbmBNMRi4HzJIM9D7KHAGmLMiqKJt5naDqcpJoKWJHsbt6XltUU4WA
BQmLhqrI01MwV3LT50A++sHsyOB05g==
=Qd7K
-----END PGP SIGNATURE-----

--umik4pwuj4727mmp--


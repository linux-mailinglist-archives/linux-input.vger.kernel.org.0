Return-Path: <linux-input+bounces-3969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00E8D493E
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 12:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF5EF1C2130A
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 10:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC99A1761A7;
	Thu, 30 May 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V83AqyIs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7118399A;
	Thu, 30 May 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717063560; cv=none; b=kIpPK2mjHXm0I2ObbHnXgzLDsiWt/i1k6lSRsCPnKUC5OSHCl4ZFqZTza6SAeYYzVS+pteUUJxr8jYuSHjr9tiSQ++nbKvJ6n/0+0wPwhbpDKseEcGGvPGH2bP1erAxTeIhEU/4DhZgZuC93vKWSZwh7J2v2++hynq/SBB4XyqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717063560; c=relaxed/simple;
	bh=2y5PSLV2MHgdFHU8JMTljUTmWYwZQZo5bjFpDf1ewGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjGNcmEFWlhpa8/GttWRJI1ami+7nDlZ9yztnweBtXT0BFXrFmNwSnGJyZgkZFhMsvrMwg4rYGU1yxJYqp/VkBE60R52YxiipAoB0Hxooj9elhuLhIbhzKTC0NfZFRnv408PR456S0aJfXXcmdBvjbhqLcN827AiCt8HG5pYESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V83AqyIs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7848EC2BBFC;
	Thu, 30 May 2024 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717063560;
	bh=2y5PSLV2MHgdFHU8JMTljUTmWYwZQZo5bjFpDf1ewGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V83AqyIsEU4RQhpQCNN89inqjoKbRLjNJd0VI0b+j2hILtvzCDsNTZ/Yfxp6DwIIc
	 l3GxkKnia2EWPrDf5tMF52ke5xLj8N5DCeUDBT9rtJX6jqTUCKOiG5jEVFh4LW8njv
	 smnM3FasCayduxxtVsxQHb0Wxu50Utv1OCBL8NuvYaIifn6P4OBwc1D2w8RGyYFpi7
	 3NqqDKTyjB4VoKsqv4eO1PIFxfDUhqe5HxUB0b4IQZJT1BVUfjhgNuITiOcWh4L8Hd
	 7PNxTJNL4lHViSaEBm8e2KQ2L+B66y14nMrxOenmPCl2P0uTlAp1katPOOAOZqJBFX
	 0O3GZHh/kPhrg==
Date: Thu, 30 May 2024 11:05:54 +0100
From: Mark Brown <broonie@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Message-ID: <f39508da-4241-46b2-a9e9-0e8b782ebf3f@sirena.org.uk>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <425AC5F6-6324-41F8-993F-E8B91DDEFC23@cirrus.com>
 <61971924-D827-4F35-813A-5807466CBA14@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+vduDYRBK43jhePc"
Content-Disposition: inline
In-Reply-To: <61971924-D827-4F35-813A-5807466CBA14@cirrus.com>
X-Cookie: To err is human, to moo bovine.


--+vduDYRBK43jhePc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 10:03:00PM +0000, James Ogletree wrote:

> This file has not had any feedback yet for this version. For the sake of =
efficiency, I
> would appreciate your review. That way I can make any needed changes
> in the already-planned v11.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--+vduDYRBK43jhePc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZYT4EACgkQJNaLcl1U
h9CrSAf+K9K/JlGRMOmpo/y/ORRpLSd23L7FQ2MpuVUIgxwCW85kWhvJ3G8xFTtJ
uLrD0qGmAindSOFHI3OsSWvH1nh2w9V+0rFJMY0ilTnWSjUwQ15AQx7KEWAjmA09
TUDEP3lAteNkvI09aimVAaiZKcu+KeB9e4E5mPFv7FbHE4qnvw6HArMCjP8EwkE9
zhEJUzUrPHUDhzcRtsXp0GOMi3aQPTGJ1EDUCRF2Pydo78t6jnQLZ8cEBFodWUIa
8Mo1K5zVfSItzqgfMlgtMuTbQ0NNGX7c//jOmLuu3QMmhzP02+zwYTuo95bJZJNy
js/Z5HoEhHYYxcwXniK8XJI4ayEDtA==
=Sw18
-----END PGP SIGNATURE-----

--+vduDYRBK43jhePc--


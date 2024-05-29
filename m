Return-Path: <linux-input+bounces-3956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAB48D3EE0
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 21:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7FBF1C219D6
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 19:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF4D1C2312;
	Wed, 29 May 2024 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Inumogio"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C75167DA0;
	Wed, 29 May 2024 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717010899; cv=none; b=pb/70xdAAxu12cYFExJNyeoKWTdMESYqPvEwKvwzhcg1WinLTepNuWn9RvUGzE/N5g8k0csJb0dp76ZSd0ual9S7xK/hy/VSe8SEEDz0K1xQRWc4EEn8fkQcEr8wAunUfa1MxunOVGNCAP8uMw5Y7FDdbM/sLF8SAN7x68TD9Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717010899; c=relaxed/simple;
	bh=O8lTga93zJCWzBm1FW2weUSkInMDUtJmNXGH6r+JERo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWN+V5NAtpRYKkUdIzaAz0oCSZ0RsvOJVz4UslPDaJR99V+m0KY7xOpQeyXiv8SgbycLmYQ7mZcAHSmO51l9At83KWuxBv9z5e9MwKH76ok2dUNAkEyOMJBNgb1vOWmQryKhdREjHqC7i44t6vtKVSVkOBD1lU00Q6k8Jz8GdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Inumogio; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B770C113CC;
	Wed, 29 May 2024 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717010899;
	bh=O8lTga93zJCWzBm1FW2weUSkInMDUtJmNXGH6r+JERo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Inumogioc7wKBwAf4YNDjrmaYciCex9ilEK0sEZZvtdk0UYW8QA5sAybeQV5y9xTs
	 1n4R3pXTCyQWmsMbx60pHLKdZv7rpgZ8Qhcn01Wh+lnG2CNFX2EBlopQf0w5FzZ4uh
	 +8M5YcbWsDTuaWk6BY1odRcDlwMvehn97432qlY6c/fOAfgO6B84dCpM5V4Ri6MVVo
	 3HFRwkhYN4UqZBBBo4FmbkoylkS6aVKfh/F2uaY3yMWs58HVwfFZNyWELtFTjSkkuL
	 AG6JUUjaHKvDUak/ljr/TuLLpI3okAL+tztWIgYAsAO0T7c0svqcV/nUHBiMdyKWpH
	 q8uG6TLIHiShw==
Date: Wed, 29 May 2024 20:28:13 +0100
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
Message-ID: <b232be56-e463-4492-be57-c255b3dc44c7@sirena.org.uk>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <425AC5F6-6324-41F8-993F-E8B91DDEFC23@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CnNVFB9rzluODJpO"
Content-Disposition: inline
In-Reply-To: <425AC5F6-6324-41F8-993F-E8B91DDEFC23@cirrus.com>
X-Cookie: Everybody gets free BORSCHT!


--CnNVFB9rzluODJpO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 07:24:08PM +0000, James Ogletree wrote:
> HI Mark,
>=20
> This file has not had any feedback yet for this version. For the sake of =
efficiency, I
> would appreciate your feedback. That way I can make any needed changes
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

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--CnNVFB9rzluODJpO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXgcwACgkQJNaLcl1U
h9AKAAf/aQVZ/nTSojJassBw+OiNhCGvoSQZN94sL0mdSeEJzA+rpYMRU7ZYPtDw
KqHP/qnnbRbG8S8VNpj5bmrBgesIe4m9lYMaafVO+012ooIIo0RkQ2XJKoxeyQZt
/2rl/bPw7fEDo6HrqR7y/6aKEjx3OysBplwLSVOI9F4aAu86z8NSIyahSxHguUr3
peCFa2FWmobDG+12FFdKR/vPbhkOXNPQtjsEzVhZ2l+LEC8D737TIgOBk4YMwgPh
2hhOuq3FY4PoTblkMktQNxc3c890cSxuW0YFbrZ5Q47e7rSX+OrROUtoB1pkEJKj
WvH0vyq6NvG8nDhwYWwexaQi8SrNuQ==
=vxo5
-----END PGP SIGNATURE-----

--CnNVFB9rzluODJpO--


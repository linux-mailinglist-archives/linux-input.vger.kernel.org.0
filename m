Return-Path: <linux-input+bounces-13614-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974E3B0BCDC
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 08:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8D043B6A3D
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 06:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED52127EFFA;
	Mon, 21 Jul 2025 06:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdgWa7zU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D627EC80;
	Mon, 21 Jul 2025 06:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080159; cv=none; b=q8CrhTLiCskqxWK6PuLxMY8XSBWs13l6it0UWwR9p+xhlfhrYuZzX42LCOUfpNg4DYGTabUrEGoVQ/vzA0X1FiFx1w922OEs6tUz+7JkOvmY1bVlNgdyCFPru/Z2Nf/drnm80LDVMuTGcfzCK8lXoqsEYALbSufU4orsro7H/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080159; c=relaxed/simple;
	bh=R0y01Ira8vxCv34EaQba0Oh2JfMMnOt+9HcYYnrhJ8k=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=P8Y7F4bJJC8l3mY/76P5dsGDoG1yAh67chvOW4ZFRKDXWimOpKnMlJ+VnK5HH9sjol7R6ziBooKM+WvpZAWnr8+enXaDg9YXjgDMtbPgCFUHOY4tZuvP/6XK6//cgZiOBRRj8TtXzCyui+fyzOQpWb9VxiCpjILuVNwVhDb60JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdgWa7zU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7184C4CEED;
	Mon, 21 Jul 2025 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753080157;
	bh=R0y01Ira8vxCv34EaQba0Oh2JfMMnOt+9HcYYnrhJ8k=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=gdgWa7zUKhWWxVb7zMuTgFjTlM1F+8XSUbzJPspaVX2xc0YJAT2JgY3r5NY6cIRAh
	 zh92DAxdjN0+sk/aZHrW2NVRKdvOXB1rPZZrIb8P+xytL2AkWCnI4eXpnFR6jyvtaz
	 3n2fufub4WDiqSlRrpxWad+N6tBteybAPGTG73n5qu7yD7UjmqgPLjnh7yNLJsaF/p
	 PCn8rPS3j3SkC5HO1EVVqT1T3YYcFjqdIiKjOmGKxmbA79TUwZlCDZJmrVinsW0iC4
	 yaOksr5ZNyRJ6S3Hj9LK8bk7dedaskp1gZD3WZDeIuFHtfzJ8LailcJqBEv/TuIifz
	 NScTJ6JNUthtA==
Content-Type: multipart/signed;
 boundary=6493458b0ac4188a6504b0b3b194601da3c29538be77290fa402a0754a70;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Jul 2025 08:42:32 +0200
Message-Id: <DBHJ1S8MTSA2.35ZZDZFQGFNB1@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
Cc: "Job Sava" <jsava@criticallink.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Julien Panis" <jpanis@baylibre.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-input@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jon Cormier" <jcormier@criticallink.com>, "Jerome Neanne"
 <jneanne@baylibre.com>, "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.16.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com> <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com> <20250521-wandering-tested-porpoise-acbef7@kuoka> <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com> <20250529-wise-tremendous-stork-a7d091@kuoka> <CAKMwjwQOBE651A-5VVjwcv5TspO2eNZfgwWzMpTTWxhR3nGKUw@mail.gmail.com> <0fb4b411-1b27-43fc-8d48-e5220fc85478@kernel.org> <CAKMwjwSZEhXav2U-bd+JNyVDK3JdJoN1kJjnxpfKXBKsW2XxdQ@mail.gmail.com> <DBEDT0OKPYAC.EX6HDQCKUWIS@walle.cc> <CADL8D3bpVVrswNUvS5nSeQYuZbyPOfMoMFG_JrPSFb9YkNEKdg@mail.gmail.com>
In-Reply-To: <CADL8D3bpVVrswNUvS5nSeQYuZbyPOfMoMFG_JrPSFb9YkNEKdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

--6493458b0ac4188a6504b0b3b194601da3c29538be77290fa402a0754a70
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

[+ Jerome and Markus ]

Hi,

> > > > Someone knowing the device should come with arguments whether
> > > > other states for this are useful at all. Or not useful and then arg=
ument
> > > > that in commit msg for example.
> > > The other states are not useful for the kernel. Only the push button
> > > has a need for an interrupt handler. The other states the PMIC handle=
s
> > > on its own.
> > >
> > > What exactly do you want me to change?
> >
> > Because the driver isn't setting the configuration anyway, wouldn't
> > it be possible to read the config bits (Register 0x3c, bits 7-6) to
> > figure out whether the pin is configured as power-button instead of
> > having this property?
> >
> > I mean, the correct config is likely stored in the NVM anyway, and
> > reconfiguring it to another value seems unlikely.
> Currently, the TPS MFD driver only loads the power button driver if
> the flag is set.  We could put that discovery code in the MFD driver,
> but what if the system designer doesn't want the power button driver?

The device tree is not for configuration. The designer can just
ignore the input event in that case.

> I'm not sure auto detecting it makes sense.

Why?

> We are basing this on the other TI PMIC drivers and how they are
> configured. I'm not sure I want to reinvent the wheel, so to speak.

That was never a good reason. Maybe there was a reason for the
TPS65219. Markus? Jerome? I haven't found anything in the commit
messages or cover letters. Only that it is "optional". Not sure what
that means. According to the TPS65219 datasheet, that pin if not
used shall be configured as EN and be connected to VSYS.

-michael

--6493458b0ac4188a6504b0b3b194601da3c29538be77290fa402a0754a70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaH3hWRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hFtAF/d1kdDlZUxRD9dqbtdD3Pkp9siZiMMOkP
A8dvPl4Q37apv3pBGU1xvF/RwwElPKGKAYCPjkNWw/8Pjy9QYI485mpRElbm8EqP
Q4yItP4WaDZtZykP4FGO1RMMYyvT5pHWopY=
=4oih
-----END PGP SIGNATURE-----

--6493458b0ac4188a6504b0b3b194601da3c29538be77290fa402a0754a70--


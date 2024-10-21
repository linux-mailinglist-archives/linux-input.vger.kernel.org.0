Return-Path: <linux-input+bounces-7580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B27F9A6689
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 13:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D351F22D30
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 11:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793661E47C6;
	Mon, 21 Oct 2024 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6707OZN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF7198E6F;
	Mon, 21 Oct 2024 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509731; cv=none; b=PPNlRwg+GZcPw6ZfkZJ7gJsR4olM6xgFZoDr0zG/YGVPBWo/Gojq8/f5gNwdGuPzQ3aHu1gSoSfZ3vAdnPnthLY3puqWLMggtFUnEYEaB6bX2jwn3xsInFirwvtCUH9EQZ1e6LM7WPWTFpuzYI0SkIHV2jDZOh8NUP5kTwIQMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509731; c=relaxed/simple;
	bh=ouYF4clg1g57Dt++Tg2iW7qBltDCzRkhKuRhzIp1iQk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JwSJAixjiu5TDEFeEUg2r4XXVXp7lkaeKu2/pH/1MdMa1MDExW/Q1XWneysEiNvzrIpSFuo0OlznlVl8zHvOaLsyy3Ixj7GyrDKsOFXN7gec6l7t+Vg6GvCl+q51AoOJC6d7cLR3OBzNZR8O6sKZCIs7TcwcQVFo1yz7BN8J0OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6707OZN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so4625746a12.1;
        Mon, 21 Oct 2024 04:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729509727; x=1730114527; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3NQ+flCukfnuhPjkRvVrmnoPHQw6PCn91uWxRQwmPzs=;
        b=V6707OZNw05vG6BM2caqxULQ8pHFmaqMPVvLjNam44aLQEzAfQKUa1hNGZq1wWCgD5
         MEFMey7v7TJ8hSH7qQ2XDCR0hj9GpgWXDkAKPFUOBSGAX2Pv9alPlSeAYUFSKXfxT1zW
         rA2yMTMxxQipuT7pKtbT52pl37D0lY72oO/0UGXb5VCwBbslGjLvIW3es+aYLukq40QK
         8z4RlJhefS33fcHTocCUg1TzPAOb6+LUULA3ytRf0XCjMR9Nql6kfKZajvlwJMRuITRl
         dnno7aBF0FZmlsRIveGH6cjqoYapo9vcux+oXi/yUW2+KoBjv79f3L0x3UaKoqmdV/Mc
         OUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729509727; x=1730114527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NQ+flCukfnuhPjkRvVrmnoPHQw6PCn91uWxRQwmPzs=;
        b=JxXYErNzXfzmAjX/7GtZKgJ/lEzDGtoM7jT7iqzXEhFXvjOHtiNivSf3KWn9wZBCRJ
         dk4MA3XrZZbtUobbvS/EXZEBeX0PlbxTX+Imepmt1ZzzSaUVIU+dL95KzcRzPTjPYhyz
         EVF7xXkR0gMw+qb2AlNm4FiTkW5VRY+IXiRYbuJUYJdCLjJfVtu7YPZp0cwcqrJBt5DH
         XzCbbHuDngNm10+fstz3zU6pdCKccl+tRaA25XS3UMf2/t8Gu6z9mibSHqQdg6880E+Y
         mU3YLJQUthEqDJqMtSRc8LfNEfUoZMWIjULg4raQSAJJ1Icvm9gWH0C3k+rmNFm4tZN8
         4uNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZbMWHDO9ZitQo6SuP/e/nEw8U38CahJRpL8OZVo6FpLRQgNu5bx+DJqTSpeJiyBDQv3XsjD6BUW8@vger.kernel.org, AJvYcCXhVv8nY1UdltrrDALnbnhMTnMMZpTfN/dVsL5ye6MYL+FxOi34tuyb8t9mLn2IV4gpv3y3tsPZYhqPLQA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfk20+R3rOyG4E68KNc7J93/TJP0/ndXtE74MEKHKA+26RaEib
	ytamlOmWXO/k+ASeUoKnkvHm2c0BL1SN+k0Lt5G6F/gQTpFskzky
X-Google-Smtp-Source: AGHT+IGzFNY+XuXhi0t0FuSiSBAXr0K7xfluXUNRBc3Xt0ndfkECgwDzSKGFf0ePYj4wJoUnLBGWuQ==
X-Received: by 2002:a05:6402:448c:b0:5c9:76b6:d14e with SMTP id 4fb4d7f45d1cf-5ca0ac778bcmr9622442a12.16.1729509727250;
        Mon, 21 Oct 2024 04:22:07 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef15:2100:888:d3c6:a442:4910? (p200300f6ef1521000888d3c6a4424910.dip0.t-ipconnect.de. [2003:f6:ef15:2100:888:d3c6:a442:4910])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a468sm1912252a12.47.2024.10.21.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:22:06 -0700 (PDT)
Message-ID: <597033e06206d11597494af6f65d2006200adc15.camel@gmail.com>
Subject: Re: [PATCH 00/13] Input: adp5589: refactor and platform_data removal
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry Torokhov
	 <dmitry.torokhov@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Mike Frysinger <vapier@gentoo.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee
 Jones	 <lee@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Mon, 21 Oct 2024 13:26:24 +0200
In-Reply-To: <20241019171833.GB13357@pendragon.ideasonboard.com>
References: 
	<20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
	 <d1395bd61ce58b3734121bca4e09605a3e997af3.camel@gmail.com>
	 <ZxLTbBGqQLrsDLWv@google.com>
	 <20241019171833.GB13357@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-10-19 at 20:18 +0300, Laurent Pinchart wrote:
> On Fri, Oct 18, 2024 at 02:30:20PM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 16, 2024 at 03:36:03PM +0200, Nuno S=C3=A1 wrote:
> > > On Tue, 2024-10-01 at 15:41 +0200, Nuno Sa wrote:
> > > > This series aims to remove platform data dependency from the adp558=
9
> > > > driver (as no platform is really using it) and instead add support =
for
> > > > FW properties. Note that rows and columns for the keypad are being =
given
> > > > as masks and that was briefly discussed with Dmitry. For context
> > > > on why this is being done as mask [1].
> > > >=20
> > > > The first couple of patches are fixes that we may want to backport.=
..
> > > >=20
> > > > [1]:
> > > > https://lore.kernel.org/linux-input/9db96c99c805e615ba40ca7fd363217=
4d1e8d11f.camel@gmail.com/
> > > >=20
> > > > ---
> > > > Nuno Sa (13):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: fix NULL pointe=
r dereference
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: fix adp5589_gpi=
o_get_value()
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add chip_info s=
tructure
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: support gpi key=
 events as 'gpio keys'
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: input: Document adp5589=
 and similar devices
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add support for=
 fw properties
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add guard() not=
ation
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: bail out on ret=
urned error
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: refactor adp558=
9_read()
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: fix coding styl=
e
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: unify adp_const=
ants in info struct
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: make use of dev=
_err_probe()
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add regulator s=
upport
> > > >=20
> > > > =C2=A0.../devicetree/bindings/input/adi,adp5589.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 310 +++++
> > > > =C2=A0.../devicetree/bindings/trivial-devices.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 -
> > > > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
> > > > =C2=A0drivers/input/keyboard/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +
> > > > =C2=A0drivers/input/keyboard/adp5589-keys.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1397
> > > > +++++++++++++-------
> > > > =C2=A0include/linux/input/adp5589.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 180 ---
> > > > =C2=A06 files changed, 1254 insertions(+), 650 deletions(-)
> > > > ---
> > > > base-commit: c7bf046925dc5885d9c4d8fbcbb7e4e73665bfcf
> > > > change-id: 20240930-b4-dev-adp5589-fw-conversion-955b2f42da70
> > > > --
> > > >=20
> > > > Thanks!
> > > > - Nuno S=C3=A1
> > >=20
> > > Hi Dmitry,
> > >=20
> > > Something really caught my attention now while checking 6.12 merge wi=
ndow.
> > > It seems
> > > we have a new MFD device for adp5585 [1] which adds duplicated
> > > functionality (that
> > > was already present in adp5589-keys.c). So, having this as MFD might =
makes
> > > sense
> > > (even though it makes it harder to validate the keys and to make use =
of
> > > gpio-keys)
> > > but we are now duplicating GPIO support. Bottom line, not sure what w=
e
> > > should do next
> > > and should I proceed for v2?
> > >=20
> > > Also ccing Lee and Bartosz...
> >=20
> > Let's add Laurent and Krzysztof too please.
> >=20
> > I am surprised we do not see warnings for various bots because
> > "adi,adp5585" compatible is present in trivial devices.
> >=20
> > I think moving it all to MFD makes sense (I think original drivers were
> > added well before we had MFD infrastructure), but we need to make sure
> > the device tree binding is complete and allows describing keypad (and i=
f
> > not maybe we can pull it from the release and work on it so that it
> > describes the hardware fully).
>=20
> Keypad support is nice. I didn't include it in my adp5585 driver
> submission because I had no way to test it. Would it be more difficult
> to add it to the MFD driver, compared to what is done in this series ?

Well, I still wonder about the GPIO part of it... It's duplicating somethin=
g
that existed before even if we all agree that MFD makes more sense.

Anyways, there's no point in over discussing this... I'll see how it works
sending  my v2 on top of the MFD implementations. This means that adp5589 a=
lso
needs to be added.

- Nuno S=C3=A1





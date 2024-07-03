Return-Path: <linux-input+bounces-4806-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B1925590
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 10:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0403B1F22C3C
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 08:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F6613AA3B;
	Wed,  3 Jul 2024 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NInGt7P7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF085624;
	Wed,  3 Jul 2024 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996063; cv=none; b=GKwF3zSUVwcfykDjt/CJ0SAtE5t0rvhdRc3pCsRe5kBSuWuv4ZwhOyDSxz9uB5llydfeROYDi2/Kh2I5TMa70yBgfOSJfSLcSjmi4ZJ9TXyZaoOOPHAvOoDHUBG/MirzpY3jW/xUCYeE40MWO6yJO4q61I9zo6/uXvdFimQ31ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996063; c=relaxed/simple;
	bh=yJU1wKiYfVQN60B/LGgNq09BR1L3TvyH8cxkqqPfbTU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fY9jSk121eKWB7jWtTmwmQdF/vqiOl6M+4ObMkeiQqI1pnoXdZrgCSxYHEOZ7/XtHM8DaXLMdM/nnR4rFlv7725ga7H5xkscMpBchjVq1rBvC7pBHXuBJsLUjS+4UiuQuCdj6y8GPNe7880CxcG6PcO1JT19AzMjcqL6bk8NGYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NInGt7P7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso922670e87.2;
        Wed, 03 Jul 2024 01:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719996059; x=1720600859; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hcDX4RWcsum+eXhQAgrLlcrCCaZ40hfPE47AKnYbyu8=;
        b=NInGt7P7aIQyuOwQF76UtGXe1hrQt1gype6J4U+6kEbH1m0yiCyROtTf3hFiqbNzZR
         prRKAyk3c+MSJ0zQLaat/+YIcDB55bl/0/VjKXcv/UXxksxmKWJxaCCwbSGdSSuqoqd3
         XZ3amNX8zrh+W+2RegCtX8rwOaQUWn7SOD6FLcjhSBZujgOYHWhFZvgzYDeVjWwM7i0K
         VzLOiomPPVCZlUsOjE8Lo899kycCVGxgqp4QWk6KF2u0jYS6LeWPe7ATy4ANUm3jWZzC
         ax2juBCb9N9CiPe9BXwgEcZ4BMplV43gZ11t2aZjSJaOswGpFD7MfP7UTjLb0AEj31Xj
         YdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996059; x=1720600859;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hcDX4RWcsum+eXhQAgrLlcrCCaZ40hfPE47AKnYbyu8=;
        b=NJwKxshBU2rcGuthhPwp7Pz0y44IvRv81ohkwYA8L+ZL7TqbNKBNAlgAQRhbE2W5w8
         leH+kxrSnpW+/8bXKpf85XQsqda1tv32GpaXrlljsxnL2SsM6p8XmePlPv7Lfv+fSu+R
         W46/xG3BoJx44pWRrZurefdXOgjIPFD4rz29mY8ptPwZN2+LZCV5D71sycP4vdL3HR0q
         y03Xog/agqfSAefC8nueZX/CddnBhLhi1Y1FnOHPeUhrpEbJVbgrcY7z9zYu4Oqp+MJh
         Zz55FbcKgIWe4t76JEDEn97kFVLWB4BrpbJAa3yJk/T5hgHGcQRTlj3r1VGBV5W62Aqo
         Xieg==
X-Forwarded-Encrypted: i=1; AJvYcCVbFZlAb0XpEw1J8uJjrGnJ8VFp8nDVuqd73cFCQR1c8amjdDICZoBfv0tqGLpAphdA+TYI+yAn4i763b/bqPqs74FhoQupiSP90pnhN+SWL90umuSV58dIpF11rIg1XW0pW6qYRm1bFQPzqCOPIc/XJ5Wa9BMxYZSYPhJPZwTA6aoFOkgz
X-Gm-Message-State: AOJu0Yzy7QoEgzk5eWcj7hZ+ZLc+PU+k6n0Coou5jvqXpimfPtEOAdxg
	6UXnmtCcIxq21w2vIMxWzLvVwwoV64gb6SMgXECeeasOJdeqnys4
X-Google-Smtp-Source: AGHT+IFSQYWG1FAyrVIClew9rBrV6znrwdovQR7cFevwtOLk1QDL2ZjIcue9ubeWtWJBpADt5E3uNw==
X-Received: by 2002:a05:6512:3094:b0:52c:de76:109a with SMTP id 2adb3069b0e04-52e82740e56mr6256924e87.67.1719996059114;
        Wed, 03 Jul 2024 01:40:59 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0642acsm238812445e9.25.2024.07.03.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:40:58 -0700 (PDT)
Message-ID: <d4661ddc1d253678fd62be4c7e19eb0cff4174f6.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>
Cc: utsav.agarwal@analog.com, Michael Hennerich
 <michael.hennerich@analog.com>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org, Arturs
 Artamonovs <arturs.artamonovs@analog.com>,  Vasileios Bimpikas
 <vasileios.bimpikas@analog.com>, Oliver Gaskell <oliver.gaskell@analog.com>
Date: Wed, 03 Jul 2024 10:44:51 +0200
In-Reply-To: <20240702-comic-tannery-792d461e0ab7@spud>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
	 <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
	 <20240701-battalion-tacky-c52566b37a97@spud> <ZoLrYTp2IUKFBvzq@google.com>
	 <20240702-comic-tannery-792d461e0ab7@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-07-02 at 16:42 +0100, Conor Dooley wrote:
> On Mon, Jul 01, 2024 at 10:46:09AM -0700, Dmitry Torokhov wrote:
> > On Mon, Jul 01, 2024 at 04:46:12PM +0100, Conor Dooley wrote:
> > > On Mon, Jul 01, 2024 at 04:04:51PM +0100, Utsav Agarwal via B4 Relay
> > > wrote:
> > > > From: Utsav Agarwal <utsav.agarwal@analog.com>
> > > >=20
> > > > Updating dt bindings for adp5588. Following properties are now made
> > > > optional:
> > > > 	- interrupts
> > > > 	- keypad,num-rows
> > > > 	- keypad,num-columns
> > > > 	- linux,keymap
> > > > The proposed new property "gpio-only" has been added as an optional
> > > > property with an additional example.
> > >=20
> > > I can see that as it is clear in the diff, but this doesn't explain w=
hy,
> > > which is what you need to do in your commit message.
> > >=20
> > > >=20
> > > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > > ---
> > > > =C2=A0.../devicetree/bindings/input/adi,adp5588.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0 | 28
> > > > ++++++++++++++++++----
> > > > =C2=A01 file changed, 24 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.ya=
ml
> > > > b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > > index 26ea66834ae2..158fbf02cc16 100644
> > > > --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > > @@ -46,6 +46,11 @@ properties:
> > > > =C2=A0=C2=A0 '#gpio-cells':
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 const: 2
> > > > =C2=A0
> > > > +=C2=A0 gpio-only:
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if keypad,num=
-rows, keypad,num-columns and
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux,keypad are not specified. All=
 keys will be marked as gpio.
> > >=20
> > > Why is a property required for this? Is the absence of the 3 keypad
> > > properties not sufficient to determine that you're in this mode?
> >=20
> > Yes, I think it should be enough.
> >=20
> > >=20
> > >=20
> > > > =C2=A0=C2=A0 interrupt-controller:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 description:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if eithe=
r keypad,num-rows lower than 8 or
> > > > @@ -68,10 +73,6 @@ properties:
> > > > =C2=A0required:
> > > > =C2=A0=C2=A0 - compatible
> > > > =C2=A0=C2=A0 - reg
> > > > -=C2=A0 - interrupts
> > >=20
> > > I don't understand why interrupts is no longer required.
> >=20
> > I think it should be possible to use this chip as a GPIO controller but
> > not an interrupt controller, in which case one does not have to wire up
> > the interrupt line from it. However this requires much more elaborate
> > binding description (i.e. no keys and no "interrupt-controller"
> > property).
>=20
> Aye. I can totally understand why you might want to make the interrupt
> portion optional - but it seems unrelated to the rest of the changes in
> the patch (use as a keypad without interrupts could be possible, right?)
> and is unexplained.
>=20

IMO, it is related as it's the new usecase (of only using the gpios) that
trigger the interrupt not being required anymore. No, I don't think we can =
use
the keypad without the interrupt line.

I guess (as you suggested before) we should check if one of the rows/column=
s
property is present and in that case still make 'interrupts' required.

Agree it should be better explained.

- Nuno S=C3=A1
>=20



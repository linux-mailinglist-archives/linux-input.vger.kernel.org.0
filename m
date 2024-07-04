Return-Path: <linux-input+bounces-4841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE6927053
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 09:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 310AD1C214EC
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 07:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323C21A01B5;
	Thu,  4 Jul 2024 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLCfexAb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECC8FBF6;
	Thu,  4 Jul 2024 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720077334; cv=none; b=HhYLdPS0xRRWTsWFqb4BsIZGVZ5EWqV4BVeRHB+Nnl9pWV5fNaQKMA2K0/BfxrQlN/ZeZpiVhuI+1GvTHSR0L2rNcvS+PxND+xlZkNgR/2QCUW633mgGGHU5V15BYaGEJZNEuZmGWSWyhV0WkouVq3aZQWU2VponHCHgNhIEV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720077334; c=relaxed/simple;
	bh=lZ/lqchbV1ZqzGPk3v4UVJ9pBGXfkyVEn4YOVaxcOk0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njiM/IUoa5j8P1Xs2K4HIQmnZqR0cNU0TxrWTM6Ofa3WIeKXgdAS5nJFb6y49811sE/nkUGuX4u5LS1KaqQuxgnuUwgZRgSi9+gRsC9+fvqdcmeqBuJrvr4JfXeiUQiTga1taEo3Y4h1doP//YfYuZ3qUdRaSVisGWvJFuJKu9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLCfexAb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso478365a12.0;
        Thu, 04 Jul 2024 00:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077331; x=1720682131; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pqqPxi9GFea+OeTvn8PO5uRaTOTc+yG0hq5j6l0g4FE=;
        b=lLCfexAb0igdrUx6jiknUx0avGfJOK60ZbLHZ+eYdBdfqDFTLN+mtvbDB6+kKR0alW
         2ry00rKcbzqV9uiWeWkFULvCidCfZhn/kxEh9U68V5TmkM1CSvsa45FKKo+W+C4ah0St
         NhECwTVFXs9qXijffk4f7hu61poACdzIYD35dpSsAGdr0RcerYsGQ690WVGjEPR2fskx
         afuTAzNsfMKYRVL7QJLS5YZxuLwwTL7qKa/ruWYKlTy8peJdV3LaXMLRRuD8RcL0cgxh
         GxRvoY3GbcT/YpzAefuINz7fAoqaPf6nZur58ay9YNCXnVYLOW0sSuvr1bYSqSJvr1sY
         Dfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077331; x=1720682131;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqqPxi9GFea+OeTvn8PO5uRaTOTc+yG0hq5j6l0g4FE=;
        b=VcojGu37cXie0JySDPnR5zpYnmkLJYDAvA359SrTsP/lDP478LHRM36o5a1myrgsPv
         roQnWshRYDwOnHYe0UaaHlAB8+7A4ybPdkVY/3fCiXkc1oO/QwDDbgI81rbrXDi+I3nv
         8a/edy8Fc400BzQb0zq8fgPO22wdMS/OHzTqPdA706ZSp/+5LoOfzud5LGnG2ABU42mg
         fj02Pu0MfjsXocD/W6SKn7Tbm/0xMXFZX0BjGlFHvarNGvSP4lgJ9igUY84Ka8tCUmmT
         n7qKVV1VB0ahxKkDX2fVohsbCRTgLR0yq0JRuu8pHkAXTKkjsDsp1T3QUlqOQv78AyXI
         yxFw==
X-Forwarded-Encrypted: i=1; AJvYcCUNryGzYoZVoUlPcWkthF2wmvwe3841uOgflBUpGsNdubVe4IvHJrnb2w3iz9vnlmM7ye6sIfsEehbAxmSbCjeCkdllqaFvdmKmNhYqu8U1mWHeJgUEO/tUh/8L413wMDmHZ1R+ocAGp3gsROENe2mpDoV8XWit/C1go0+nx7kx0hFl0Wpi
X-Gm-Message-State: AOJu0Yz8XjA8to/pi/7xgluZoDNJ0RTAjGhtaxgx9ux8t3arKm+9KFjX
	7Rn/TyMc9rSqZv/NRhFiI2a4AGedqZn8yCAx+LybScz4pEfYvYSd
X-Google-Smtp-Source: AGHT+IG3F2ZpfqdQldXn+rgvvAvq07dW1pZfkDqUzfdoBfCR0uLBmCANZoclVDTGLfrrrtCQUNxIyg==
X-Received: by 2002:a05:6402:2105:b0:58c:2a57:b230 with SMTP id 4fb4d7f45d1cf-58e5955a333mr616316a12.13.1720077329339;
        Thu, 04 Jul 2024 00:15:29 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614f3d415sm8129864a12.85.2024.07.04.00.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:15:29 -0700 (PDT)
Message-ID: <b9a57a014cab9ff7d9578f52bc7faef1dbea6ff6.camel@gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>, "Agarwal, Utsav"
 <Utsav.Agarwal@analog.com>
Cc: "Hennerich, Michael" <Michael.Hennerich@analog.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Sa,
 Nuno" <Nuno.Sa@analog.com>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Artamonovs, Arturs"
 <Arturs.Artamonovs@analog.com>, "Bimpikas, Vasileios"
 <Vasileios.Bimpikas@analog.com>, "Gaskell, Oliver"
 <Oliver.Gaskell@analog.com>
Date: Thu, 04 Jul 2024 09:19:22 +0200
In-Reply-To: <20240703-mandate-hardy-281ddd048b40@spud>
References: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
	 <20240703-adp5588_gpio_support-v5-3-49fcead0d390@analog.com>
	 <20240703-safehouse-flame-0b751b853623@spud>
	 <SJ0PR03MB63432316EE8382033A4396369BDD2@SJ0PR03MB6343.namprd03.prod.outlook.com>
	 <20240703-mandate-hardy-281ddd048b40@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-07-03 at 16:57 +0100, Conor Dooley wrote:
> On Wed, Jul 03, 2024 at 03:55:11PM +0000, Agarwal, Utsav wrote:
> > Hi Conor,
> >=20
> > Thank you for your feedback.
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: Wednesday, July 3, 2024 4:20 PM
> > > To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> > > Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; Dmitry Torokho=
v
> > > <dmitry.torokhov@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof
> > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; S=
a,
> > > Nuno <Nuno.Sa@analog.com>; linux-input@vger.kernel.org;
> > > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Artamonovs,
> > > Arturs <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> > > <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
> > > <Oliver.Gaskell@analog.com>
> > > Subject: Re: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for
> > > adp5588
> > >=20
> > > On Wed, Jul 03, 2024 at 11:58:16AM +0100, Utsav Agarwal via B4 Relay
> > > wrote:
> > > > From: Utsav Agarwal <utsav.agarwal@analog.com>
> > > >=20
> > > > Updating dt bindings for adp5588. Since the device can now function=
 in a
> > > > purely gpio mode, the following keypad specific properties are now =
made
> > > > optional:
> > > > 	- interrupts
> > > > 	- keypad,num-rows
> > > > 	- keypad,num-columns
> > > > 	- linux,keymap
> > > >=20
> > > > However since the above properties are required to be specified whe=
n
> > > > configuring the device as a keypad, dependencies have been added
> > > > such that specifying either one would require the remaining as well=
.
> > > >=20
> > > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > > ---
> > > > =C2=A0.../devicetree/bindings/input/adi,adp5588.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0 | 33
> > > ++++++++++++++++++----
> > > > =C2=A01 file changed, 28 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.ya=
ml
> > > b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > > index 26ea66834ae2..6c06464f822b 100644
> > > > --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > > @@ -49,7 +49,10 @@ properties:
> > > > =C2=A0=C2=A0 interrupt-controller:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 description:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if eithe=
r keypad,num-rows lower than 8 or
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-columns lower than 10.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-columns lower than 10. T=
his property does not apply if
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-rows or keypad,num-colum=
ns are not specified since the
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device then acts as gpio only, duri=
ng which interrupts are not
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utilized.
> > > >=20
> > > > =C2=A0=C2=A0 '#interrupt-cells':
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 const: 2
> > > > @@ -65,13 +68,15 @@ properties:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 2
> > > >=20
> > > > +dependencies:
> > > > +=C2=A0 keypad,num-rows: ["keypad,num-columns"]
> > > > +=C2=A0 keypad,num-cols: ["keypad,num-rows"]
> > > > +=C2=A0 linux,keymap: ["keypad,num-rows"]
> > >=20
> > > Is what you've got here sufficient? Adding "keypad,num-rows" won't
> > > mandate "linux,keymap" which I think is wrong. I think all 3 entries
> > > here need to contain both of the other two.
> > >=20
> >=20
> > Ah, I can see the issue, thank you for pointing it out - I will be
> > correcting that.
> >=20
> > > > +=C2=A0 interrupts: ["linux,keymap"]
> > >=20
> > > I still don't understand why interrupts are only allowed when the key=
map
> > > is present. I'd cover the interrupts with something like
> > >=20
> > > if:
> > > =C2=A0 required:
> > > =C2=A0=C2=A0=C2=A0 - linux,keymap
> > > =C2=A0 then:
> > > =C2=A0=C2=A0=C2=A0 required:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - interrupts
> > >=20
> > > so that interrupts can be used while not in keypad mode. Unless of
> > > course there's something (unmentioned in this patch) that prevents th=
at.
> >=20
> > In case when the device is not in keypad mode, i.e, is purely using gpi=
o -
> > it doesn't trigger the interrupt.
> > Due to this, I had restricted the same to keypad mode only(as a
> > requirement). This was mentioned=20
> > here:
> > https://lore.kernel.org/all/d4661ddc1d253678fd62be4c7e19eb0cff4174f6.ca=
mel@gmail.com/
>=20
> This says "not required", not "not functional". How come generating
> interrupts becomes impossible when not in keypad mode? That's what needs
> to be explained.
>=20

I should have read the patch before replying in v4. Yes, I agree with Conor=
 that
what we need is to make the interrupt __required__ when using the keypad. I=
n the
case we have gpios, it's optional but it does not mean we should remove it.=
 One
usecase would be to use gpios still as inputs through gpio-keys.

- Nuno S=C3=A1



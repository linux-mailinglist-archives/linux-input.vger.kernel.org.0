Return-Path: <linux-input+bounces-4851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B2927490
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 13:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFDE21F224E4
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C441ABC34;
	Thu,  4 Jul 2024 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+nmxWzv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45212157A43;
	Thu,  4 Jul 2024 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091354; cv=none; b=mcCUHnEo7VgvMJdpkf9J4bLeHlqp5l8eSp8Ovk5ssFAlB2qXRN0oX0BbKggItEAccJUd4TXNIniF555UZ5uxjVSi7G05568baFahWxsmYrei2gjVlhuFBGyTl1nj90DEi2rVhUbWkgpJKBP8J6ddFFhG/zd61jzW1OEPy2U8iLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091354; c=relaxed/simple;
	bh=DIDz+v/YNYXCr9N5diE1OUTLocg3rPp4XlgQBYIT6iE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qgf/1obg3WOqzizi+VBbEjfAUC2cUU+y/Htoxj6qDFNnQiTValnbvuMY2qCpIWl6bDiSUK0ojTv9j8FVDr2cuXJHPvSImtkq8Vums8FZB5PgTAj0BS9sBzLQH9HoUEwGTvezLFD/THdFDmjGbhCeKjUhcKz+OZ74JLF4VwXSAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+nmxWzv; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee910d6a8bso1987581fa.0;
        Thu, 04 Jul 2024 04:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091351; x=1720696151; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5E9+RPdyUmQP3+v/4PJ49tPYPsmQMBFAH+k6jQWc/X0=;
        b=H+nmxWzvDByNwCIipoQhq7HTYQ9FbfmY6QaVGrP/QdnWR20IRtuKUN1N51nZ6/R99m
         4EE+6OfNZC4vPPbY2/OZshevv/lWJxvAVEKPFnNQV7J9+TekzIGUBFq4tGXUsY3vs709
         ZZ+0gd+zXv0EvLczwbPDwhPvicQcwnwJxyq//4vEC4gxNQ0QCefDE0lxbMDytVGK6SGy
         yaIjagorj5Vxa675B6nxBAeHXfZuBQSh6YeRWWmyAZzyn784tY2MeLRiyJKgDWeMVYrC
         B7ou9+k976Qpn+9wS5I76h1Pp56hJf4FPuqwM364YneQXdVMJZP2PVuhv3Ckj0pI2WgO
         j3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091351; x=1720696151;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5E9+RPdyUmQP3+v/4PJ49tPYPsmQMBFAH+k6jQWc/X0=;
        b=UuZymI7eeg1oBnPPkF2zLZbbtehJI+9JwixuUYEBOinIiR3X9XzCCHMWE3sb6J4clu
         wk9bo254T30cXR24Ssuhc8/JgLmALhZ83GmrcWqVu+x8rpEt9b0eVU11BM+pWIXXCdP9
         ExipJLh0VykJ1UHQ3WcwHbLAqb4cHLQVz3t68YvgUER0jLyaFg62EVr1AggyW+YTXpEB
         bDGEpNK367f73SxWyYNLy+sX2oIrZQA9jTaKJ2gvHJhATbiyp+wXJ3hATtLPELfZOMQ8
         2LR2xb4EHJwn7ijgBJlN5eiyS09Y1WGHPyo4IRmitIoPYCV4NwJ5cxPK0Vzp6GVfsf5v
         Lueg==
X-Forwarded-Encrypted: i=1; AJvYcCW4rWKKTzNENxpZzmvdrGpM0gYby1x6gm+Km/rrPmjsp2wdZn3FKMwusZ09BmeTRkXsngtb//nkRrEIW7QPvYK8WFx2JwQXK3nO5CC1nMuiy+Re5AxwurNwHJqSqz0yo7tPLbtc82I9dQ==
X-Gm-Message-State: AOJu0Yw900ay/oVkzNl2kwO5oIFvlUs/SScJlYELMR6ql4RkEM6zyMgN
	d2wxLAlUsskntotfUfcdRqE13DSmEJIxVJtrGgqg1mCdtKn52CLsJhBgRDeb
X-Google-Smtp-Source: AGHT+IEejNKDD+WdFx74F/4/WZzlSYRgCYTjD7ohCLjJk2Zqb7qGI9MGIdhNJfJBjRbqEL9ELCBr7A==
X-Received: by 2002:a2e:86cd:0:b0:2ec:5073:5816 with SMTP id 38308e7fff4ca-2ee8eda803fmr8554471fa.31.1720091350889;
        Thu, 04 Jul 2024 04:09:10 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a25b724sm20265265e9.38.2024.07.04.04.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:09:10 -0700 (PDT)
Message-ID: <2ed1b75e1eb470c9d4d85ff1485c5461d7ec9384.camel@gmail.com>
Subject: Re: [PATCH v6 3/3] dt-bindings: input: Update dtbinding for adp5588
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: utsav.agarwal@analog.com, Michael Hennerich
 <michael.hennerich@analog.com>,  Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arturs Artamonovs
 <arturs.artamonovs@analog.com>,  Vasileios Bimpikas
 <vasileios.bimpikas@analog.com>, Oliver Gaskell <oliver.gaskell@analog.com>
Date: Thu, 04 Jul 2024 13:13:04 +0200
In-Reply-To: <20240704-adp5588_gpio_support-v6-3-cb65514d714b@analog.com>
References: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
	 <20240704-adp5588_gpio_support-v6-3-cb65514d714b@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-07-04 at 11:45 +0100, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Updating dt bindings for adp5588. Since the device can now function in a
> purely gpio mode, the following keypad specific properties are now made
> optional:
> 	- interrupts
> 	- keypad,num-rows
> 	- keypad,num-columns
> 	- linux,keymap
>=20
> However the above properties are required to be specified when
> configuring the device as a keypad, dependencies have been added
> such that specifying either one would require the remaining as well.
>=20
> Note that interrupts are optional, but required when the device has been
> configured in keypad mode.
>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
> =C2=A0.../devicetree/bindings/input/adi,adp5588.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 | 46 +++++++++++++++++++--
> -
> =C2=A01 file changed, 41 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> index 26ea66834ae2..83d1fe19e300 100644
> --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> @@ -49,7 +49,10 @@ properties:
> =C2=A0=C2=A0 interrupt-controller:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if either keyp=
ad,num-rows lower than 8 or
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-columns lower than 10.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-columns lower than 10. This pr=
operty is optional if
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-rows or keypad,num-columns are=
 not specified since the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device then acts as gpio only, during whi=
ch interrupts may or may
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not be utilized.
> =C2=A0
> =C2=A0=C2=A0 '#interrupt-cells':
> =C2=A0=C2=A0=C2=A0=C2=A0 const: 2
> @@ -65,13 +68,28 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 2
> =C2=A0
> +
> +dependencies:
> +=C2=A0 keypad,num-rows:
> +=C2=A0=C2=A0=C2=A0 - linux,keymap
> +=C2=A0=C2=A0=C2=A0 - keypad,num-columns
> +=C2=A0 keypad,num-columns:
> +=C2=A0=C2=A0=C2=A0 - linux,keymap
> +=C2=A0=C2=A0=C2=A0 - keypad,num-rows
> +=C2=A0 linux,keymap:
> +=C2=A0=C2=A0=C2=A0 - keypad,num-rows
> +=C2=A0=C2=A0=C2=A0 - keypad,num-columns

The above seems pretty generic. Maybe it could be moved into matrix-keymap.=
yaml
at some point...

- Nuno S=C3=A1




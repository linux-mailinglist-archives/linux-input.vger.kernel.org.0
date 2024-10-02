Return-Path: <linux-input+bounces-6997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72D98CFD8
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D4951C211AC
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 09:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85BA19645C;
	Wed,  2 Oct 2024 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/d5gYMA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114DE12DD90;
	Wed,  2 Oct 2024 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860389; cv=none; b=HBw4nZ8ZFeW7ACNv9evJcI7a7cQ4aTdQCIVKPrcJ59n/pMwTNX4a9lsSU+okiq2nfA/PAWBsLaKWpXy1Z2J87XnLV/23aNfc4KlA7CfaSzjTuPnbRQgmSmqfZS579zeVGv097ADwWIWRdux33tdJbELRpxNq7o1cf0SdAlyMA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860389; c=relaxed/simple;
	bh=5I5mldIJzdW8ANKclnGu0nHw5GefTnyB3NHWqrKtqzM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=awHhp95aAn6JwtYzLknTO1ji1kK+3cnmiNqMFqzEatdlPvc9wGd50cmK30LHYu3XocaJyNtg9chuFofOS/BWRWq6lkwW3Q2/CHmmQkToTj3f4gv/r7I2o1gi2lmh/uj4g5IzVENCY+vJr2b1BuyXdOBBaJm8tmctoBEXSWcxVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/d5gYMA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so4730797a12.3;
        Wed, 02 Oct 2024 02:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727860386; x=1728465186; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QDt4wkIAqycH/8EbIQQz964AqPmfjsiKJTHguvRyM3E=;
        b=B/d5gYMA4YWmy8CIItVconsfSZM7VdmzB+ZWYia5npLn87a/MSspI3ci7YLOGFZV5M
         rhiXnrInm9zeRMCxIx0eMbs5DfzwNbM3cw3+Z+tQXEibgNWS/sbrW6/eFn+DyKSK30HX
         Cvb0kD/7M3puFBCATC41VTqP7Q2Oqi4Vu5mlK9IZ8zTKUPpiszK+1SgyZiOoYEAsdiS6
         KqDzMfNenquSVURj3RhWvFAZOXmS6UQGscGZZ5VcRNVWNmqApbX16d8XqJNT8lJjaBDU
         LwF5NjQo3RUROv6pfi/RsYTF0DOyhRC++x3DNwiCB7cdE445CDHQV4FXGCx1NUgh42km
         38dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727860386; x=1728465186;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDt4wkIAqycH/8EbIQQz964AqPmfjsiKJTHguvRyM3E=;
        b=uKJBCqXfkQIKY6Zwi94bHk7jmr5NRyRE2SHvT7yFbPwU7tzu5sDGyzPAl/c44JQY5k
         jKbuJ/SQDD/uLa5embLLqwEm5B+VGl8kSCKT4AmNBdujUMJCVlXNWdVMjZF7ds1ZW7hN
         nZNaDQxc2K570EvXq4yiPWUlAyEjBnHKkEBHbgfCnmQ8BEClAR3oANe3IaABON8XOyMg
         YUEi/7crmexem4H7EaIW8u12ytJ4UQQuOoXUZmtRt5UDdAgDmHFTG+mjCAC/KOg4/C2o
         TYzxqUYCiVPov59dp+Cp0UThipyT3L8N+nZWO5rhIxN9tD6zGc3jzuVNmcyhaAV2Gpy/
         djHA==
X-Forwarded-Encrypted: i=1; AJvYcCVLXdv2Dh/Q+ZHT71YBRlB0u58dzpBpJk32rM/IUc8tIyA7i08YaqJ242vjReWzdm9dbMJGrArW8gc4@vger.kernel.org, AJvYcCWu5EIJvnzcVg/Fj1dPP5Zc4RHRN8YLHWIrnMGZ8/kACfoxaY7Ec/KzmuV6qfSoTpP2DftAUZ9XhuVnleA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLc0Sh6+3uAtHz+YWAM3nIXSGRg0wbeYU25gm5zk2ZVy8jv6Y
	yY4CsVHWVB18W75M+fYncQmziQqVkZRHDTiLQb7H09mM7JY6mvgu
X-Google-Smtp-Source: AGHT+IGJGYXsCmI1lgv7ZHOpY/4Rl26rSnqpLeSH2YqQvxowGgmN4A4UPSgGlCA55J5GgRGAv6ekvw==
X-Received: by 2002:a17:907:94c3:b0:a86:94e2:2a47 with SMTP id a640c23a62f3a-a98f824db54mr226428566b.15.1727860386078;
        Wed, 02 Oct 2024 02:13:06 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:341e:1201:c434:b5b1:98a6:efed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27758dcsm835978366b.37.2024.10.02.02.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:13:05 -0700 (PDT)
Message-ID: <22f246a0809e2d1fc738178400f8a3d67fc4dc56.camel@gmail.com>
Subject: Re: [PATCH 03/13] Input: adp5589-keys: add chip_info structure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nuno Sa <nuno.sa@analog.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Date: Wed, 02 Oct 2024 11:13:05 +0200
In-Reply-To: <ZvwNV4zor-MTKigP@google.com>
References: 
	<20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
	 <20241001-b4-dev-adp5589-fw-conversion-v1-3-fca0149dfc47@analog.com>
	 <ZvwNV4zor-MTKigP@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-01 at 07:55 -0700, Dmitry Torokhov wrote:
> On Tue, Oct 01, 2024 at 03:41:34PM +0200, Nuno Sa wrote:
> > Add a more natural chip_info structure and add it to the i2c id table
> > driver data so that we do not need an enum a switch() to get the
> > specific bits of each device.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > =C2=A0drivers/input/keyboard/adp5589-keys.c | 181 ++++++++++++++++++---=
-------------
> > =C2=A01 file changed, 95 insertions(+), 86 deletions(-)
> >=20
> > diff --git a/drivers/input/keyboard/adp5589-keys.c
> > b/drivers/input/keyboard/adp5589-keys.c
> > index
> > 922d3ab998f3a5dfbaf277f10eb19e5cd1b35415..eaa5440d4f9e14352409dd880cd25=
4354612bf3
> > e 100644
> > --- a/drivers/input/keyboard/adp5589-keys.c
> > +++ b/drivers/input/keyboard/adp5589-keys.c
> > @@ -228,16 +228,20 @@ struct adp_constants {
> > =C2=A0	u8 (*reg) (u8 reg);
> > =C2=A0};
> > =C2=A0
> > +struct adp5589_info {
> > +	const struct adp_constants *var;
> > +	bool support_row5;
>=20
> Is it possible to derive "row5" data from keymap information to avoid
> having this fake "adp5585-02-keys" device?
>=20

This is not a fake device. Looking at the adp5585 datasheet you can see the=
re's
module with 25 keys (without GPIO5) and another with 11 GPIOS. From the dat=
asheet:

"- 10 configurable I/Os allowing functions such as Key pad decoding for a m=
atrix of=20
up to 5 =C3=97 5
- 11 GPIOs (5 =C3=97 6) with ADP5585ACxZ-01-R7 models"

Why its named adp5585-02 in the driver I'm not sure. I kept the same name a=
s the i2c
id? Should I call it ADP5585-1 instead? Or even ADP5585-1-r7?

- Nuno S=C3=A1


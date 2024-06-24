Return-Path: <linux-input+bounces-4596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAEB914832
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 13:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B1A280A9E
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 11:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141011369B1;
	Mon, 24 Jun 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLG0MI/A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32912F360;
	Mon, 24 Jun 2024 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227540; cv=none; b=q8rIevpNCO7hIqmR4+ANvpSlchAFiVD6gBoKJ33GkQ8eF5Rx2om4oOQSyGgOkyuIdHqA3dZkeSFatxTevbICpFg870qsfQ0QBiQfUMamaDbDZr0gpNMQMZESLzZV7VgwmtTKvpInuLz46TbU3+zlk4YZtWxOAtF8vshyde5vKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227540; c=relaxed/simple;
	bh=ZXKT/3KWbLoO/1so8mlAmDSqpch3CYn1bRPyJ4+5NAg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RrlMTLLJROiX2MJz8KAn6nbhEWygJKGOOjLRWMcHMZ4lXtqrDFDj8RZIM3l0DhxsYaLlgXgynVbkUeAFeaAcK64CBdJABc8nH9GMApWa5FdghK4udzSN6x7107+vdZqcI02WAwRFL+YVJ4lTiGBnBflwmA/J6zU700ztuCzQu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLG0MI/A; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6fd513f18bso256246966b.3;
        Mon, 24 Jun 2024 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719227536; x=1719832336; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jPfmjkaomaMj0CLLUzRPw9Nbvo5OKvh2ZAXCqjjbkP0=;
        b=XLG0MI/AXdjioUy4o07++w2a61zwXLOwVk3Ko/Bo4iyDOPe6rTMRm/EYS6PjwjYGvI
         mic+KM499f3z74ltjPT820SxOmBXLO3qcAcNett9rVkSQ0F1WoN8KyTsl9Bs9/eSxUjY
         M+KCjn/KQYicKHatMFotwZLT4BwKv0T36y97z6DLoMzneWsJ3QAQ8EHnj97JSK4LTMbA
         taS9DiG3HwRHkBVJf9MxhxcB0pNOnEK5C8Hg/bZKag1xOm3adRbEBWoY0/ueqAlkDfHA
         HHJOq6ll5OCKTNBxe87zUwFrRCHW22pEquVreE/oURS9NtJATqGFxOuNcYDbBBLx3a7w
         SxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227536; x=1719832336;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPfmjkaomaMj0CLLUzRPw9Nbvo5OKvh2ZAXCqjjbkP0=;
        b=VjCqWMdneynmAfLMkGgQ4sIciizJ/E00zDLajpZcBp2e6EmVopT840rsxObWXjptN7
         zOLiLvVAWL2MdXd2n0Eb+XGpJ3P//qyDdVknmbTzAkWMJm9qPJ2CXI4NqFHiV446vuTE
         wfTfBtY8kTqsjBjF8Rl/7pi3DCbBG7s5PIy/XmtzeOrHz3+c1tX+hD7u6HZYhWivnmVO
         X76Be3HCQoT+QjScMDThZOYrlpTVYBcojrXkdhXhtXoxYbXaznJBBrwB/Mt96xX1PwWR
         NUgIgbYCx098sbkhX32kunH2CPWjJjbjvlZriIj7Tjl75SOWDThHF8QPUaVSJ0zVjS+o
         bP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWM7BUM1Ppn8GvE/kpUEmh+wxzm3UgVLBWnYOR6Srz1jd03SKSoNu9ug0f7I4d3o8L6SlLBkMNVgmMWfsgEUa4d3+XHIoKyTbnzzEqh7oZBdRSd3AudG5Hp8Ugf3cRO2OtdqGJT0Es+T9M=
X-Gm-Message-State: AOJu0Yy+q6y4g3XK4FXlCzOw3QDP1PWSr2HFrWStmnv1eqR6mCcAeLLZ
	o0iiG4vJhHdu8sMI4dj+zsdpA/bR+Oq2eEyX4mwlZclQn+hSQxN+
X-Google-Smtp-Source: AGHT+IHPhhAvyv2SV918fWeWD31jqvLQpnNThN8xHEVm4+yEDSSnmeCZluPB1ZB3fdOp9no7cYgmYw==
X-Received: by 2002:a17:907:1682:b0:a72:544f:63e4 with SMTP id a640c23a62f3a-a72544f6476mr154323066b.24.1719227536313;
        Mon, 24 Jun 2024 04:12:16 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7261aece51sm16707766b.153.2024.06.24.04.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 04:12:15 -0700 (PDT)
Message-ID: <2dbc797b5f541fa639beea95b2437a292d3c0007.camel@gmail.com>
Subject: Re: [PATCH] adp5588-keys: Support for dedicated gpio operation
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>, "dmitry.torokhov@gmail.com"
	 <dmitry.torokhov@gmail.com>
Cc: "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
 "linux-input@vger.kernel.org"
	 <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "Artamonovs, Arturs"
	 <Arturs.Artamonovs@analog.com>, "Bimpikas, Vasileios"
	 <Vasileios.Bimpikas@analog.com>
Date: Mon, 24 Jun 2024 13:12:15 +0200
In-Reply-To: <SJ0PR03MB63430F59E256C45E0C658F509BD42@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: 
	<SJ0PR03MB6343CB033C1005A36B102BF89BC92@SJ0PR03MB6343.namprd03.prod.outlook.com>
	 <ZnaJbqXcABKGIj83@google.com>
	 <SJ0PR03MB63430F59E256C45E0C658F509BD42@SJ0PR03MB6343.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Utsav,

On Mon, 2024-06-24 at 10:43 +0000, Agarwal, Utsav wrote:
> Hi Dmitry,
>=20
> Thank you for your reply.
>=20
> > -----Original Message-----
> > From: dmitry.torokhov@gmail.com=C2=A0<dmitry.torokhov@gmail.com>
> > Sent: Saturday, June 22, 2024 9:21 AM
> > To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> > Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; linux-
> > input@vger.kernel.org; linux-kernel@vger.kernel.org; Artamonovs, Arturs
> > <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> > <Vasileios.Bimpikas@analog.com>
> > Subject: Re: [PATCH] adp5588-keys: Support for dedicated gpio operation
> >=20
> > [External]
> >=20
> > Hi Utsav,
> >=20
> > On Fri, Jun 21, 2024 at 10:44:12AM +0000, Agarwal, Utsav wrote:
> > > From: UtsavAgarwalADI <utsav.agarwal@analog.com>
> > >=20
> > > We have a SoC which uses ADP5587 exclusively as an I2C GPIO expander.
> > > The current state of the driver for the ADP5588/87 only allows partia=
l
> > > I/O to be used as GPIO. This support was present before as a separate
> > > gpio driver, which was dropped with the commit
> > > 5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
> > > functionality was deemed to have been merged with adp5588-keys.
> > >=20
> > > To restore this functionality, the "gpio-only" property allows
> > > indicating if the device is to be used for GPIO only.
> > > When specified, the driver skips relevant input device checks/parsing
> > > and allows all GPINS to be registered as GPIO.
> > >=20
> > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > ---
> > > =C2=A0drivers/input/keyboard/adp5588-keys.c | 30
> > > ++++++++++++++++++++-------
> > > =C2=A01 file changed, 23 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/input/keyboard/adp5588-keys.c
> > > b/drivers/input/keyboard/adp5588-keys.c
> > > index 1b0279393df4..78770b2dfe1b 100644
> > > --- a/drivers/input/keyboard/adp5588-keys.c
> > > +++ b/drivers/input/keyboard/adp5588-keys.c
> > > @@ -719,7 +719,7 @@ static int adp5588_probe(struct i2c_client *clien=
t)
> > > =C2=A0	struct input_dev *input;
> > > =C2=A0	struct gpio_desc *gpio;
> > > =C2=A0	unsigned int revid;
> > > -	int ret;
> > > +	int ret, gpio_mode_only;
> > > =C2=A0	int error;
> > >=20
> > > =C2=A0	if (!i2c_check_functionality(client->adapter,
> > > @@ -739,13 +739,17 @@ static int adp5588_probe(struct i2c_client
> > *client)
> > > =C2=A0	kpad->client =3D client;
> > > =C2=A0	kpad->input =3D input;
> > >=20
> > > -	error =3D adp5588_fw_parse(kpad);
> > > -	if (error)
> > > -		return error;
> > > +	gpio_mode_only =3D device_property_present(&client->dev, "gpio-
> > only");
> >=20
> > Do we really need a new property? Can we simply allow omitting
> > keypad,num-rows/cols properties in case where we only want to have GPIO
> > functionality?
> >=20
> > In any case this requires DT binding update.
>=20
> I agree that we may not require another property however there are the fo=
llowing
> two options to accomplish the same:
>=20
> - The probe function utilizes a function called matrix_keypad_parse_prope=
rties(),
> which parses the rows and columns specified - which I would have to read =
as well in
> order to identify if all GPINS should be configured as GPIO. This would h=
owever
> mean that in case this is not a GPIO only mode, we would have redundant c=
ode
> execution.=20
>=20
> - If we avoid that and just use the return value from the function, it wi=
ll print
> out a dev_err message :"number of keypad rows/columns not specified " mes=
sage.
>=20
> How would you suggest I should proceed? I will add the DT bindings in the=
 v2 patch.
>=20
> >=20
> > > +	if (!gpio_mode_only) {
> > > +		error =3D adp5588_fw_parse(kpad);
> > > +		if (error)
> > > +			return error;
> > >=20
> > > -	error =3D devm_regulator_get_enable(&client->dev, "vcc");
> > > -	if (error)
> > > -		return error;
> > > +		error =3D devm_regulator_get_enable(&client->dev, "vcc");
> > > +		if (error)
> > > +			return error;
> >=20
> > Why regulator is not needed for the pure GPIO mode? Please add a
> > comment.
>=20
> We don't specify a regulator for our kernel and the driver seems to work =
without
> it. I agree however that it may not be mutually exclusive to the same, I =
will be
> fixing the same in the v2 patch.
>=20

What you need to ask yourself is... can the part work without a power suppl=
y :)? Note
that if you don't specify a regulator in DT and call devm_regulator_get_ena=
ble(), you
don't get an error. Just a dummy regulator.

> >=20
> > > +
> > > +	}
> > >=20
> > > =C2=A0	gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
> > GPIOD_OUT_HIGH);
> > > =C2=A0	if (IS_ERR(gpio))
> > > @@ -790,6 +794,11 @@ static int adp5588_probe(struct i2c_client *clie=
nt)
> > > =C2=A0	if (error)
> > > =C2=A0		return error;
> > >=20
> > > +	if (!client->irq && gpio_mode_only) {
> > > +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> > revid);
> > > +		return 0;
> > > +	}
> > > +
> >=20
> > What is the reason for requesting interrupt in pure GPIO mode? Can we
> > program the controller to not raise attention in this case?
>=20

Wouldn't make sense to still allow it in a more relaxed way? I mean, even i=
n "pure"
gpio mode, we could still want to use gpio-keys for example, right? IMO, I =
think we
should make the IRQ optional got gpio mode and configure the gpiochip accor=
dingly.
Maybe this was exactly what you meant but I wasn't sure about it :)

- Nuno S=C3=A1




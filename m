Return-Path: <linux-input+bounces-5329-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB794756A
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 08:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA11B283329
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 06:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BF714B08C;
	Mon,  5 Aug 2024 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crhFHu1i"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5314B941;
	Mon,  5 Aug 2024 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722839987; cv=none; b=TnldT1oN0Dy1i0PHt2QmUCz/R0Mw3Q1w7CrDwv6Ix4OoaJXo79b9DDXgCtMIpSktkI/GZ2ITAfiEhNVWkP2eT+p8jhHVVa1l55Y+ysUxjlwepSMr7ygnKRFFULVZXTO40ynDiKCyTZmEjC/DLTglYMOhMESG2SdzScV+ir/z9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722839987; c=relaxed/simple;
	bh=xrm8h7v/E7UxATiiMSVvNBK+L+hoY830siHCNaBtR5Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HXQ/61lkeiN5+ox4cJwUEpB/qXifeucmrnXaid7KdsBppq/MMzNAdsE9pfJ4qjW8XIJXuZLCkn3oUCJzxrqkWeZt4GrJ+qs0BIvVj6Fa6VSgYEriDmu7Vob+artsoh6RJLrGn6oedPHFzFMeCHZWKud+iLeWneByICuvExOj418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crhFHu1i; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a83a968ddso1341546566b.0;
        Sun, 04 Aug 2024 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722839983; x=1723444783; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MQo1kSLefaYanCELcv67E+K3OaYhN87jPOh5VTToIuE=;
        b=crhFHu1im+OKoCtysCWp6iiClrW+Y+CEgjGJyQxnm4cYo+dYn1FPrUrw3scd1LwQcb
         IZOW58jNme87q2AHr12mOMBJdpQNs6eQpZ8DJLVZVJQDbC/HrAc0MTRKL/7u1cAu4NIg
         pjrFpE81Tmi/qOzfnIBib1sXdR38bxGhgVM3B7HahsL+HvyAlsvXQoN57cP+woYNx3QM
         s//Pxy3OX8XELhJllObG1QKdYX7aG55v5M5vNEY3mJRkmLlSzXAOaqdzPgXXzcHR9tg6
         O30yhvyrMRuSoZ3RJehs6Mv1vItZJMXGdyBH99Oe6BVFSDa11CyG8HS81z+cU3hxzzey
         f2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722839983; x=1723444783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQo1kSLefaYanCELcv67E+K3OaYhN87jPOh5VTToIuE=;
        b=bAFlnE8xt5gqIe+OSh+EcIb22GPWs1aHBj1PVmkZ31sGbC4QxKeyeK4XHYu+mTw47s
         vxBOGqmalckmpuprBVfOG62+kAFHUcwfvix5cu+cARiZwMbRQoT4O3bodyMpmxGsTDGo
         XpMvFhqlBAhzFb3wGOPwlrtfoZ2GyP4rDQMeTC+NzCU6b8YjzSrx9L0l6CR8U25v25tz
         wJuGnnGqchAaXye7UspBhHBMr4BXxgj3YxLsfn3ISVY1KCT3yJyLxCSHpqQEufk3S+O8
         z13z25UiVp8IhGvys+Fh8m89hTg8gJsRo7KRdDD+dBSSsaJTG0wVn4idb7/sPXThZVkI
         I+PA==
X-Forwarded-Encrypted: i=1; AJvYcCVCOu/SAhUNrs1dQQClKS1tPQhtuob3ONNzfejdjzYxSZv3c1R+BH7vWL4Rsvm/HZ+r04UGriOBiyjWsg/bOJEzNnOb0HyWeI/4tQgZ9cWcr7lZlWEgaO8pCk12XCLgM59k6YZ8ud+wgKfuHnF/0jSlPjBWhiYn13mei1GtlqpVINMF/fGV
X-Gm-Message-State: AOJu0YzKNdchNGFLrCzTJrPh04icxEEAn7vh1yrG94OZ5Iczyu6L7bex
	k/+OC4uj/CRN5pN94yiPP64nPVucRHGkQSJV6F3JejA2huebmDrvvwec+tRYp9w=
X-Google-Smtp-Source: AGHT+IEZzFCAyXXYB7N0x6xF3hGsh2u/6+1XFPvXKrFeboeys2puaaACAngc848U0zMkrY0zP75ycA==
X-Received: by 2002:a17:907:d22:b0:a7d:2fb2:d852 with SMTP id a640c23a62f3a-a7dc50a4b64mr753224866b.52.1722839983242;
        Sun, 04 Aug 2024 23:39:43 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:994e:fbde:478:1ce1? (p200300f6ef1cc500994efbde04781ce1.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:994e:fbde:478:1ce1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3d2asm413300466b.45.2024.08.04.23.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 23:39:42 -0700 (PDT)
Message-ID: <f2b0593ffb1c9cb07114483f8f49428211eb5117.camel@gmail.com>
Subject: Re: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, utsav.agarwal@analog.com
Cc: Michael Hennerich <michael.hennerich@analog.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arturs Artamonovs
 <arturs.artamonovs@analog.com>,  Vasileios Bimpikas
 <vasileios.bimpikas@analog.com>, Oliver Gaskell <oliver.gaskell@analog.com>
Date: Mon, 05 Aug 2024 08:43:43 +0200
In-Reply-To: <Zq17uABHdNENnwVq@google.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
	 <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
	 <Zq17uABHdNENnwVq@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-08-02 at 17:37 -0700, Dmitry Torokhov wrote:
> Hi Utsav,
>=20
> On Thu, Jul 04, 2024 at 03:26:31PM +0100, Utsav Agarwal via B4 Relay wrot=
e:
> > From: Utsav Agarwal <utsav.agarwal@analog.com>
> >=20
> > Keypad specific setup is relaxed if no keypad rows/columns are specifie=
d,
> > enabling a purely gpio operation.
> >=20
> > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > ---
> > =C2=A0drivers/input/keyboard/adp5588-keys.c | 37 ++++++++++++++++++++++=
+++++++++-
> > ---
> > =C2=A01 file changed, 33 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/input/keyboard/adp5588-keys.c
> > b/drivers/input/keyboard/adp5588-keys.c
> > index 09bcfc6b9408..7c32f8b69a3e 100644
> > --- a/drivers/input/keyboard/adp5588-keys.c
> > +++ b/drivers/input/keyboard/adp5588-keys.c
> > @@ -188,6 +188,7 @@ struct adp5588_kpad {
> > =C2=A0	u32 cols;
> > =C2=A0	u32 unlock_keys[2];
> > =C2=A0	int nkeys_unlock;
> > +	bool gpio_only;
> > =C2=A0	unsigned short keycode[ADP5588_KEYMAPSIZE];
> > =C2=A0	unsigned char gpiomap[ADP5588_MAXGPIO];
> > =C2=A0	struct gpio_chip gc;
> > @@ -431,10 +432,12 @@ static int adp5588_gpio_add(struct adp5588_kpad *=
kpad)
> > =C2=A0	kpad->gc.label =3D kpad->client->name;
> > =C2=A0	kpad->gc.owner =3D THIS_MODULE;
> > =C2=A0
> > -	girq =3D &kpad->gc.irq;
> > -	gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> > -	girq->handler =3D handle_bad_irq;
> > -	girq->threaded =3D true;
> > +	if (kpad->client->irq) {
> > +		girq =3D &kpad->gc.irq;
> > +		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> > +		girq->handler =3D handle_bad_irq;
> > +		girq->threaded =3D true;
> > +	}
> > =C2=A0
> > =C2=A0	mutex_init(&kpad->gpio_lock);
> > =C2=A0
> > @@ -632,6 +635,21 @@ static int adp5588_fw_parse(struct adp5588_kpad *k=
pad)
> > =C2=A0	struct i2c_client *client =3D kpad->client;
> > =C2=A0	int ret, i;
> > =C2=A0
> > +	/*
> > +	 * Check if the device is to be operated purely in GPIO mode. To do
> > +	 * so, check that no keypad rows or columns have been specified,
> > +	 * since all GPINS should be configured as GPIO.
> > +	 */
> > +	ret =3D device_property_present(&client->dev,
> > +			"keypad,num-rows");
> > +	ret |=3D device_property_present(&client->dev,
> > +			"keypad,num-columns");
> > +	/* If purely GPIO, skip keypad setup */
> > +	if (!ret) {
> > +		kpad->gpio_only =3D true;
> > +		return 0;
> > +	}
> > +
> > =C2=A0	ret =3D matrix_keypad_parse_properties(&client->dev, &kpad->rows=
,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &kpad->cols);
> > =C2=A0	if (ret)
> > @@ -775,6 +793,11 @@ static int adp5588_probe(struct i2c_client *client=
)
> > =C2=A0	if (error)
> > =C2=A0		return error;
> > =C2=A0
> > +	if (kpad->gpio_only && !client->irq) {
> > +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> > revid);
> > +		return 0;
>=20
> I think we need more elaborate handling here (and probably more
> elaborate binding yaml file): now that you are making interrupt optional
> you should check if interrupt-controller functionality of the GPIO
> block/gpiochip is requested. If it was, then we should not allow missing
> interrupt. If only GPIO controller is needed, without interrupt
> capabilities, tnen running without interrupt is fine.
>=20
Hi Dmitry,

I need to double check but I don't think we can act as an interrupt-control=
ler
without the interrupt line connected. So, I think the only thing we could l=
ikely
add/improve is to express that dependency in the bindings.

- Nuno S=C3=A1


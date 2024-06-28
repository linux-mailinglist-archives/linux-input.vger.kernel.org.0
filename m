Return-Path: <linux-input+bounces-4699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49C91BF56
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 15:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C39DFB237F0
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 13:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D101BE25C;
	Fri, 28 Jun 2024 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND5IZnY0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F11BE256;
	Fri, 28 Jun 2024 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580329; cv=none; b=f3/QQcVug1FP02qIFudlqxQX4U/bZ4y60rfh47AYZmsVXmoa0FlmVrieS5UdI6qZxivE0sdov8gJUcAJAX28IwrgpSSUyVDALKr60lxNHSziUFGH4OY2ZeyJcY8DrzQfE/QgQUdSXZAXYs3Z5u3K5pbh/Zdk9DlGvtzR8BcExpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580329; c=relaxed/simple;
	bh=tXQ1rt497o6BQpkuOjONP8FV37VQ5yPs1pf6RVIa8YY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gkjMLK+he5c2o84ZN4jNm0hCO9DnLh6r+7PbAOP8RydNtCxLUPhEyqEXDCaDwVhO+swOsE0XFeP8MaHAzrnbqHIVCJao7bjmMztzsoTGoKioc2z83pFgkAKWNylOv/1QHTECShTCYTkGIm0dTac6cI4pff/WMmsiipwFNAMwiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ND5IZnY0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4256aee6e4dso4565205e9.1;
        Fri, 28 Jun 2024 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719580326; x=1720185126; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4JwrHWmo6S97xr7gBwMVuIiPbffTWGOCUOEM7k7oU8E=;
        b=ND5IZnY0mw6UWYDac+c0EeJ9RRu0qoRXupqMtyg4n8myyRiwp7Qt+waCki8+lUV/yZ
         cvK/7WaWbuMmI7j1TfdcUg+UOoKprNw4R21XOP9ohg+5KnK0yMaG9y65q6I67ys45D/4
         km85FjPOuNxKwYcueV5sKGAeCh+YtDp5DVMD6Wp2OU8pLoXviueAQlGSz7xUF6VGxelu
         ZBasy3Com9juTkCMX7jkUC8sZK2gYwKufF2nVQb/VcEv2G8nfYTLGJY5WdPQ0mLdPG8N
         Mm4F7sfPrrAuGvVcuQMzUlCINPnQFPOLWLpiqc/6SV8+gQZ974iaWWKnxl0pw00ejBE4
         W85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719580326; x=1720185126;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JwrHWmo6S97xr7gBwMVuIiPbffTWGOCUOEM7k7oU8E=;
        b=klfCXXNMRz3Mfpy7RmA295tEoHw3MQPNMsJumdkCHe/kvQvfZ9toYSDDopgHwf6hDg
         3XnQJvAEflamVR4QkW3EAL2dgFt5tT5jUz0HZiy0XfXXa1DktCQ8wgd/JeMVauZ4U97O
         6zfiQMTzHMZkXkVudBu75sqbIDGwCrKJdYYY8VgCfRb3kZjsdNJYe8uolvrPzVhJJWKY
         Sufif+zwlWDMxbWrTLm9umzn47SH3eUshY6XaOTNJxf+9ew+lRWvbmOzM1LBnAt3GT+F
         X2aW4PDmM8fQHZZpDzPlflvZudtQv7lCmW8z8ifGZvIwu4T1/UEv+weSRumBMe1fUyC9
         Uo1w==
X-Forwarded-Encrypted: i=1; AJvYcCX8TlJJQXic2xlSNHFEHD7BcXXFFBX4PSbVbwMf3aI5gJvuDi+dSQaCHa3oYA1DiE4NVfQm8rHKyqBKs+kyqZ2Ad/Gv1BkqxWISrwG6ZwyMYAxjCD5r6Q5WAAFkafA8yQO8Q59bIwoGXJU=
X-Gm-Message-State: AOJu0YwmYQjoHQcFjAFGgdMPNPCQvLgvz7e920xFgjrcRha6fudnqcRg
	zfhCvtbCZktL1lBUp9fPiwfu1OY6ZI88uKq1UQ5P5rUQcz6alg5/
X-Google-Smtp-Source: AGHT+IEBUpRwdSTIhnSB1tU0xG2657LQQCXuGTehPEC0xYrXlbDugJWnU6WyHfQzoBzeoeKvgE/wwA==
X-Received: by 2002:a5d:64ca:0:b0:366:efab:2fb1 with SMTP id ffacd0b85a97d-366efab327cmr14606908f8f.38.1719580326225;
        Fri, 28 Jun 2024 06:12:06 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:994e:fbde:478:1ce1? (p200300f6ef1cc500994efbde04781ce1.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:994e:fbde:478:1ce1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d91fesm2313070f8f.40.2024.06.28.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 06:12:05 -0700 (PDT)
Message-ID: <1fc545709ad2aee0b70a8d1c561516d94cb6fb1e.camel@gmail.com>
Subject: Re: [PATCH v2] adp5588-keys: Support for dedicated gpio operation
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>, "Hennerich, Michael"
	 <Michael.Hennerich@analog.com>, "dmitry.torokhov@gmail.com"
	 <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org"
	 <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Cc: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>, "Bimpikas,
 Vasileios" <Vasileios.Bimpikas@analog.com>, "Gaskell, Oliver"
 <Oliver.Gaskell@analog.com>
Date: Fri, 28 Jun 2024 15:15:57 +0200
In-Reply-To: <SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: 
	<SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Utsav,

On Fri, 2024-06-28 at 12:57 +0000, Agarwal, Utsav wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Current state of the driver for the ADP5588/87 only allows partial
> I/O to be used as GPIO. This support was previously present as a
> separate gpio driver, which was dropped with the commit
> 5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
> functionality was deemed to have been merged with adp5588-keys.
>=20
> To restore this, keypad specific checks in the probe
> function are relaxed if the following conditions are met:
> 	1) "gpio-only" property has been specified for the node
> 	2) No keypad rows/columns are specified
>=20
> The "gpio-only" property is introduced to simplify usage since it
> serves as a clear indication of the user's intention as opposed to being
> inferred from the number of rows and columns specified. This=20
> also adds simplicity for the accompanying dt binding update as well
> as interpretation of the same.=20
>=20
> In such a case, additional checks are also introduced to make sure=20
> that keypad and pure GPIO operation are mutually exclusive by=20
> checking for keypad specific properties (keypad,num-rows and=20
> keypad,num-columns).
>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
> =C2=A0drivers/input/keyboard/adp5588-keys.c | 33 ++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 33 insertions(+)
>=20
> diff --git a/drivers/input/keyboard/adp5588-keys.c
> b/drivers/input/keyboard/adp5588-keys.c
> index 1b0279393df4..6bfe748797df 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -188,6 +188,7 @@ struct adp5588_kpad {
> =C2=A0	u32 cols;
> =C2=A0	u32 unlock_keys[2];
> =C2=A0	int nkeys_unlock;
> +	bool gpio_only;
> =C2=A0	unsigned short keycode[ADP5588_KEYMAPSIZE];
> =C2=A0	unsigned char gpiomap[ADP5588_MAXGPIO];
> =C2=A0	struct gpio_chip gc;
> @@ -647,6 +648,25 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpa=
d)
> =C2=A0	struct i2c_client *client =3D kpad->client;
> =C2=A0	int ret, i;
> =C2=A0
> +	/*
> +	 * Check if the device is to be operated purely in GPIO mode. If
> +	 * so, confirm that no keypad rows or columns have been specified,
> since
> +	 * all GPINS should be configured as GPIO.
> +	 */
> +	if (kpad->gpio_only) {
> +		ret =3D device_property_present(&client->dev,
> +				"keypad,num-rows");

Should align with open parenthesis...

> +		if (ret)
> +			return -EINVAL;
> +

dev_err_probe() with a message should be helpful...

> +		ret =3D device_property_present(&client->dev,
> +				"keypad,num-columns");
> +		if (ret)
> +			return -EINVAL;

Alternatively, you could just:

if (kpad->gpio_only)
	return 0;

And ignore the other properties...

> +
> +		return 0;
> +	}
> +
> =C2=A0	ret =3D matrix_keypad_parse_properties(&client->dev, &kpad->rows,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &kpad->cols);
> =C2=A0	if (ret)
> @@ -739,6 +759,7 @@ static int adp5588_probe(struct i2c_client *client)
> =C2=A0	kpad->client =3D client;
> =C2=A0	kpad->input =3D input;
> =C2=A0
> +	kpad->gpio_only =3D device_property_present(&client->dev, "gpio-only");

Since the above is also FW properties it could go inside adp5588_fw_parse()=
.
It's also missing the bindings patch.

> =C2=A0	error =3D adp5588_fw_parse(kpad);
> =C2=A0	if (error)
> =C2=A0		return error;
> @@ -790,6 +811,11 @@ static int adp5588_probe(struct i2c_client *client)
> =C2=A0	if (error)
> =C2=A0		return error;
> =C2=A0
> +	if (!client->irq && kpad->gpio_only) {
> +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> revid);
> +		return 0;
> +	}
> +

Note that in case there are no IRQ, you should not make the gpiochip an irq=
chip
capable:

https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/input/keyboard/ad=
p5588-keys.c#L449


- Nuno S=C3=A1




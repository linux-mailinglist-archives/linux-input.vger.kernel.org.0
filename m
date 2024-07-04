Return-Path: <linux-input+bounces-4850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4B92748A
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 13:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DDBD1F21C60
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C351ABCAD;
	Thu,  4 Jul 2024 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJUJJuVe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942C1AB513;
	Thu,  4 Jul 2024 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091180; cv=none; b=C2b2h+8MJbrNd0NW4Z91ceJwp9L3lbXCAzXapZ76v9NkxsrkT1KMBADMdb7dKJAADtpriss6gyx/kbgs2BgLlFM8LoD1hNPzQZosrUS5cknUBqZxZgL1adITxWfb1JGJDSkVnqnqkskVCiYbnjAorpyVX603t+t0OFrhYF4NLW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091180; c=relaxed/simple;
	bh=kvST1rvipBfVLNwN66rt1V71FvGSHg/H+eoBL4MtfrY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UNhjRJVlAq1b3QrZ5t1FMtL+a7MKg6QBwm1C5onWKT6aYWqLyvtNs1qmQj2qDlSOT6U8qDpYZcyBge97FznX7WgP1bv9xUyBf1r90rbMMyZutx3eKNDA2wb7Zqf3d+sbB49d67xQ8DiWJCWqwobnGM2s5N7wziFVOVt9jHn47gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJUJJuVe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3679e9bfb08so277726f8f.1;
        Thu, 04 Jul 2024 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091177; x=1720695977; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D950wyfI9R9DcheKTK0zZ2zHLBsWZJePc69tdMO64tk=;
        b=LJUJJuVeIeln8kZ01CfdSar0fOD2Lv3rKqD9HTZdPF0Kf2OL0KWVQ1fr+YwTpINIoW
         kXP4vdS1FesuOoZw/QjsII8qFoSHC4eMcmD6CCiQc59/Yvuot/eYoIyU6hTpdz2MakJa
         PG16razPQxrnbuD73rAXpeMCbiJhFqkws4FgatW7awh5XJHvlYm347/xUC+FuulM9npK
         PyCe9qKIiGrZixewJuETLR7TsZlwBzreea0vIinZscbgsBZAmz976ACEW2p2WtCPwiCQ
         me814M/ue1rZc6mEVKWRid6pKDEL7suSwVJpsZf8soyGdlggKiXkOr8wPvY8Op4/pDIg
         KWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091177; x=1720695977;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D950wyfI9R9DcheKTK0zZ2zHLBsWZJePc69tdMO64tk=;
        b=DH6gBWHk6DVZY18K/odquRtfpvoqgBXh5caiVElZjvgWfj39ty/wc6B2m7Pi39JMxF
         oWqnV/mTlk6azuneLtWq320rbb1wwcsVb3KEaM/8x8Jxe+QixKVlzRTwnyeDhDNIOk/K
         7O/cUJgxYOi0Y/TZkdEUME8MY5numJ4l+gWhHhhKcgRNKa17vLF97aIHGdsEXxJ9iUIH
         qnDUvSJZT8PvoNWCGKIxyOZFfQpWG7TQyhtwr6pnb/FtK7qBJ74EKDrgNxw1iuhemnU8
         F37NnKxP42E0ZFnVlNzgqIxLgX7j54c6eT/Z/PsbYDadbuT/bRAPU2d2kGM6108GSmop
         DzAA==
X-Forwarded-Encrypted: i=1; AJvYcCUuxMzhh66fJY3hfWQHmfHFhjYGHGGA2A9VoxBq/qeGyhkKNtrWZJd6/7nXcM1o2BJL6xGKjf5U0vAyacv8dWjfFEzbzUz+i2cZmUU2BGLizw29YPs7Qe/rXgrWVYOzajplxydFHjgmwA==
X-Gm-Message-State: AOJu0YzhipgmxcwFvdpCNT9pkLF47CiinFiJZ3ZQO2YArPJy7m4W8Kqo
	DqjZx3dq/pG8Cs5d66FbRd0lYoPTafl0LKeKJMdmg+ysGWd/jxXf
X-Google-Smtp-Source: AGHT+IGcr5+/HlIE4XPF3IkQFuLT5rydlJyv0HT9ULTEdCdNV7pH2/rmn/4+GCjTb8VOWj4ZxNsyKg==
X-Received: by 2002:a5d:4525:0:b0:367:3282:a258 with SMTP id ffacd0b85a97d-3679f703046mr1035415f8f.18.1720091176580;
        Thu, 04 Jul 2024 04:06:16 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a043a16sm18440772f8f.0.2024.07.04.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:06:16 -0700 (PDT)
Message-ID: <fc12a44eccc1e3843bb9ae0f25ee5df6eecddafb.camel@gmail.com>
Subject: Re: [PATCH v6 2/3] Input: adp5588-keys - add support for pure gpio
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
Date: Thu, 04 Jul 2024 13:10:09 +0200
In-Reply-To: <20240704-adp5588_gpio_support-v6-2-cb65514d714b@analog.com>
References: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
	 <20240704-adp5588_gpio_support-v6-2-cb65514d714b@analog.com>
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
> Keypad specific setup is relaxed if no keypad rows/columns are specified,
> enabling a purely gpio operation.
>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
> =C2=A0drivers/input/keyboard/adp5588-keys.c | 27 ++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 27 insertions(+)
>=20
> diff --git a/drivers/input/keyboard/adp5588-keys.c
> b/drivers/input/keyboard/adp5588-keys.c
> index 09bcfc6b9408..572335c8ef0f 100644
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
> @@ -632,6 +633,21 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpa=
d)
> =C2=A0	struct i2c_client *client =3D kpad->client;
> =C2=A0	int ret, i;
> =C2=A0
> +	/*
> +	 * Check if the device is to be operated purely in GPIO mode. To do
> +	 * so, check that no keypad rows or columns have been specified,
> +	 * since all GPINS should be configured as GPIO.
> +	 */
> +	ret =3D device_property_present(&client->dev,
> +			"keypad,num-rows");
> +	ret |=3D device_property_present(&client->dev,
> +			"keypad,num-columns");
> +	/* If purely GPIO, skip keypad setup */
> +	if (!ret) {
> +		kpad->gpio_only =3D true;
> +		return 0;
> +	}
> +
> =C2=A0	ret =3D matrix_keypad_parse_properties(&client->dev, &kpad->rows,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &kpad->cols);
> =C2=A0	if (ret)
> @@ -775,6 +791,11 @@ static int adp5588_probe(struct i2c_client *client)
> =C2=A0	if (error)
> =C2=A0		return error;
> =C2=A0
> +	if (kpad->gpio_only && !client->irq) {
> +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> revid);
> +		return 0;
> +	}

You're still missing something regarding interrupts. If there's no client->=
irq
then you should not setup the gpio_irq_chip. Hence, in adp5588_gpio_add(), =
you
should have:

if (kpad->client->irq) {
	girq =3D &kpad->gc.irq;
	gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
	girq->handler =3D handle_bad_irq;
	girq->threaded =3D true;
}

- Nuno S=C3=A1



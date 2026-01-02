Return-Path: <linux-input+bounces-16770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DECEF2E1
	for <lists+linux-input@lfdr.de>; Fri, 02 Jan 2026 19:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 628F43019B67
	for <lists+linux-input@lfdr.de>; Fri,  2 Jan 2026 18:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26512C21ED;
	Fri,  2 Jan 2026 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="Cic6iS8v"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DFB22157E;
	Fri,  2 Jan 2026 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767378359; cv=none; b=FpK5cjuJbkxXRHh34AFyaMoqMK+/MevQJghdcNxuvkE9Cu8WIHud5rFCu8ZGM6mLAJwDPhlspwgxkaFnDBd8c5PxNQ3RLyL83l6YHIWlQR7Emq8BldLCpQWnBGjXIFz5StNpkLCAK1xfI/baMZ+g5snxWKMe8C/lAZXY2gM4Bpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767378359; c=relaxed/simple;
	bh=GcESW9rZxMqVbzjkCfFL84xuFP9RkChOnbp/NzydfGU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Xg/C7oMz/o2dFFwsiKEPm248lRoggJRbRxOsrhyRqFcktQ94hzWcRe7maaF5f+XChY1O3Wrp7z4ql/Ji6z0CQvDLmaTQB0XN593tp+ziBNkjWUHQ6HZspohJ5X4Xzm4TNjeE/CB83VEMeXtYvt4mvPX4zcXxYnUuGdO14yEdahA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=Cic6iS8v; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767378345; x=1767983145; i=hendrik-noack@gmx.de;
	bh=GcESW9rZxMqVbzjkCfFL84xuFP9RkChOnbp/NzydfGU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Cic6iS8vsNB2i73hubXyefSzUCGfFKFuguCKRMMUpvRAThUDfjEA6i9K4OuaN+mP
	 0AfMI7BCalYNnXzNpV5uQfjdMrFIekihaCSQTDkgPslSz0raCpIy1R03zdvUbp3dY
	 MD75r9P/NygiyN5DXOPcnrk4eaLbQoM9ZEshfDfuE+yZekBYs6lTD+NNj8j1JXJDz
	 jycichTu81hJsnN2QbN4/xlPMnG4h1IhvV7yLCC7LZQNs5ZZXUh8Om9VV6ONXIZZn
	 Tj4srWOBp7MX4TQ2cSdVgjTkEQfGksOR5lCcBTDYwm68RdqcAVOpjdiNzs9EZ5HX7
	 +B7SZGXRbnV/Z5Gkew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.85.36.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ycl-1vaM8B2blb-007n4K; Fri, 02
 Jan 2026 19:25:44 +0100
Date: Fri, 2 Jan 2026 19:25:43 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <82fd8d18-454e-48d2-85b7-2ea2b04c7c0b@gmx.de>
In-Reply-To: <k5rhkjmttba4aznb3xa44pqaxepsfkbe5ap6g2ln3rcgunvkky@262tpqra76v7>
References: <20251205152858.14415-1-hendrik-noack@gmx.de> <20251205164952.17709-1-hendrik-noack@gmx.de> <k5rhkjmttba4aznb3xa44pqaxepsfkbe5ap6g2ln3rcgunvkky@262tpqra76v7>
Subject: Re: [PATCH 2/2] Input: Add support for Wacom W9000-series penabled
 touchscreens
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <82fd8d18-454e-48d2-85b7-2ea2b04c7c0b@gmx.de>
X-Provags-ID: V03:K1:2zF5ViTvw+cmel92mHUY0PnudmURhWoF3AKsATqHPTj91AQjPo9
 A28yoIpilfXHUhb8TMIMbT3XqgaovXBNRH3bwKoda42rUc90M7Dg5fVBZqkbtBoaxCg7NtW
 VfyMBbjUEClQjMH42sZRgReD7jexn8zorC91AJvHnqTAPVChffZcMkaH0tvTvabi7Xy9Y1C
 Ki/TWHv+gS08sWMI4dO9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BMsxJ2bME7c=;bDQUgBOULnGwyI7nmCEGTEACxOu
 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
 Ol554Hb8mnWa/iDwdRPFPXcttAkX0WGng==

Hi Dmitry,

09.12.2025 06:35:15 Dmitry Torokhov <dmitry.torokhov@gmail.com>:

> Hi Hendrik,
>
> On Fri, Dec 05, 2025 at 05:49:52PM +0100, Hendrik Noack wrote:
>> Add driver for two Wacom W9007A variants. These are penabled touchscreen=
s
>> supporting passive Wacom Pens and use I2C.
>>
>> Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
>> ---
>> drivers/input/touchscreen/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 +
>> drivers/input/touchscreen/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
>> drivers/input/touchscreen/wacom_w9000.c | 480 ++++++++++++++++++++++++
>> 3 files changed, 493 insertions(+)
>> create mode 100644 drivers/input/touchscreen/wacom_w9000.c
>>
>> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscre=
en/Kconfig
>> index 7d5b72ee07fa..40f7af0a681a 100644
>> --- a/drivers/input/touchscreen/Kconfig
>> +++ b/drivers/input/touchscreen/Kconfig
>> @@ -610,6 +610,18 @@ config TOUCHSCREEN_WACOM_I2C
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, choos=
e M here: the module
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will be called wacom_i2c.
>>
>> +config TOUCHSCREEN_WACOM_W9000
>> +=C2=A0=C2=A0 tristate "Wacom W9000-series penabled touchscreen (I2C)"
>> +=C2=A0=C2=A0 depends on I2C
>> +=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0 Say Y here if you have a Wacom W9000-series pe=
nabled I2C touchscreen.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 This driver supports model W9007A.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 If unsure, say N.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, choose M h=
ere: the module
>> +=C2=A0=C2=A0=C2=A0=C2=A0 will be called wacom_w9000.
>> +
>> config TOUCHSCREEN_LPC32XX
>> =C2=A0=C2=A0=C2=A0 tristate "LPC32XX touchscreen controller"
>> =C2=A0=C2=A0=C2=A0 depends on ARCH_LPC32XX
>> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscr=
een/Makefile
>> index ab9abd151078..aa3915df83b2 100644
>> --- a/drivers/input/touchscreen/Makefile
>> +++ b/drivers/input/touchscreen/Makefile
>> @@ -102,6 +102,7 @@ tsc2007-$(CONFIG_TOUCHSCREEN_TSC2007_IIO)=C2=A0=C2=
=A0 +=3D tsc2007_iio.o
>> obj-$(CONFIG_TOUCHSCREEN_TSC2007)=C2=A0 +=3D tsc2007.o
>> obj-$(CONFIG_TOUCHSCREEN_WACOM_W8001)=C2=A0 +=3D wacom_w8001.o
>> obj-$(CONFIG_TOUCHSCREEN_WACOM_I2C)=C2=A0=C2=A0=C2=A0 +=3D wacom_i2c.o
>> +obj-$(CONFIG_TOUCHSCREEN_WACOM_W9000)=C2=A0 +=3D wacom_w9000.o
>> obj-$(CONFIG_TOUCHSCREEN_WDT87XX_I2C)=C2=A0 +=3D wdt87xx_i2c.o
>> obj-$(CONFIG_TOUCHSCREEN_WM831X)=C2=A0=C2=A0 +=3D wm831x-ts.o
>> obj-$(CONFIG_TOUCHSCREEN_WM97XX)=C2=A0=C2=A0 +=3D wm97xx-ts.o
>> diff --git a/drivers/input/touchscreen/wacom_w9000.c b/drivers/input/tou=
chscreen/wacom_w9000.c
>> new file mode 100644
>> index 000000000000..05c928646bc3
>> --- /dev/null
>> +++ b/drivers/input/touchscreen/wacom_w9000.c
>> @@ -0,0 +1,480 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Wacom W9000-series penabled I2C touchscreen driver
>> + *
>> + * Copyright (c) 2025 Hendrik Noack <hendrik-noack@gmx.de>
>> + *
>> + * Partially based on vendor driver:
>> + * Copyright (C) 2012, Samsung Electronics Co. Ltd.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/input.h>
>> +#include <linux/input/touchscreen.h>
>> +#include <linux/unaligned.h>
>> +
>> +// Message length
>
> Prefer C-style comments /* */
>
>> +#define COM_COORD_NUM_MAX=C2=A0 12
>> +#define COM_QUERY_NUM_MAX=C2=A0 9
>
> What does "COM" stand for?

It stands for command, but I should use CMD instead.

>> +
>> +// Commands
>> +#define COM_QUERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x2a
>> +
>> +struct wacom_w9000_variant {
>> +=C2=A0=C2=A0 int com_coord_num;
>
> unsigned?

You're right, would be better.

>
>> +=C2=A0=C2=A0 int com_query_num;
>> +=C2=A0=C2=A0 char *name;
>
> const?

Makes sense.

>
>> +};
>> +
>> +struct wacom_w9000_data {
>> +=C2=A0=C2=A0 struct i2c_client *client;
>> +=C2=A0=C2=A0 struct input_dev *input_dev;
>> +=C2=A0=C2=A0 const struct wacom_w9000_variant *variant;
>> +=C2=A0=C2=A0 unsigned int fw_version;
>> +
>> +=C2=A0=C2=A0 struct touchscreen_properties prop;
>> +=C2=A0=C2=A0 unsigned int max_pressure;
>> +
>> +=C2=A0=C2=A0 struct regulator *regulator;
>> +
>> +=C2=A0=C2=A0 struct gpio_desc *flash_mode_gpio;
>> +=C2=A0=C2=A0 struct gpio_desc *pen_inserted_gpio;
>> +
>> +=C2=A0=C2=A0 unsigned int irq;
>> +=C2=A0=C2=A0 unsigned int pen_insert_irq;
>> +
>> +=C2=A0=C2=A0 bool pen_inserted;
>> +=C2=A0=C2=A0 bool pen_proximity;
>> +};
>> +
>> +static int wacom_w9000_read(struct i2c_client *client, u8 command, int =
len, char *data)
>> +{
>> +=C2=A0=C2=A0 struct i2c_msg xfer[2];
>
> =C2=A0=C2=A0=C2=A0 struct i2c_msg xfer[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .addr =
=3D client->addr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .buf =
=3D &comand,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .len =
=3D sizeof(command),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0 };

Okay, I change it in my next version.

>> +=C2=A0=C2=A0 bool retried =3D false;
>> +=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0 /* Write register */
>> +=C2=A0=C2=A0 xfer[0].addr =3D client->addr;
>> +=C2=A0=C2=A0 xfer[0].flags =3D 0;
>> +=C2=A0=C2=A0 xfer[0].len =3D 1;
>> +=C2=A0=C2=A0 xfer[0].buf =3D &command;
>> +
>> +=C2=A0=C2=A0 /* Read data */
>> +=C2=A0=C2=A0 xfer[1].addr =3D client->addr;
>> +=C2=A0=C2=A0 xfer[1].flags =3D I2C_M_RD;
>> +=C2=A0=C2=A0 xfer[1].len =3D len;
>> +=C2=A0=C2=A0 xfer[1].buf =3D data;
>> +
>> +retry:
>
> Why do we need a retry? Is it because the controller might be asleep?
> If so can we wake it up explicitly?

Many other devices also have a retry, so I also did it. I thought it makes
sense because it's a connection on a board between a i2c host and
client, that migth have a difficult transmission because of suboptimal
routing.

>
>> +=C2=A0=C2=A0 ret =3D i2c_transfer(client->adapter, xfer, 2);
>> +=C2=A0=C2=A0 if (ret =3D=3D 2) {
>
> ARRAY_SIZE(xfer)
>

You're right.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 0;
>> +=C2=A0=C2=A0 } else if (!retried) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retried =3D true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
>> +=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret >=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -E=
IO;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&client->dev, "%s: i2c tra=
nsfer failed (%d)\n", __func__, ret);
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static int wacom_w9000_query(struct wacom_w9000_data *wacom_data)
>> +{
>> +=C2=A0=C2=A0 struct i2c_client *client =3D wacom_data->client;
>> +=C2=A0=C2=A0 struct device *dev =3D &wacom_data->client->dev;
>> +=C2=A0=C2=A0 bool retried =3D false;
>> +=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0 u8 data[COM_QUERY_NUM_MAX];
>> +
>> +retry:
>> +=C2=A0=C2=A0 ret =3D wacom_w9000_read(client, COM_QUERY, wacom_data->va=
riant->com_query_num, data);
>> +=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0 if (data[0] =3D=3D 0x0f) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->fw_version =3D get_una=
ligned_be16(&data[7]);
>> +=C2=A0=C2=A0 } else if (!retried) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retried =3D true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
>> +=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 dev_dbg(dev, "query: %X, %X, %X, %X, %X, %X, %X, %X, %X, %=
d\n", data[0], data[1], data[2],
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data[3], data[4], data[5], data[6]=
, data[7], data[8], retried);
>
> Please print hex data with "%*ph".

Okay

>
>> +
>> +=C2=A0=C2=A0 wacom_data->prop.max_x =3D get_unaligned_be16(&data[1]);
>> +=C2=A0=C2=A0 wacom_data->prop.max_y =3D get_unaligned_be16(&data[3]);
>> +=C2=A0=C2=A0 wacom_data->max_pressure =3D get_unaligned_be16(&data[5]);
>> +
>> +=C2=A0=C2=A0 dev_dbg(dev, "max_x:%d, max_y:%d, max_pressure:%d, fw:0x%X=
", wacom_data->prop.max_x,
>
> fw: %#X
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->prop.max_y, wacom_data=
->max_pressure,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->fw_version);
>> +
>> +=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static void wacom_w9000_coord(struct wacom_w9000_data *wacom_data)
>> +{
>> +=C2=A0=C2=A0 struct i2c_client *client =3D wacom_data->client;
>> +=C2=A0=C2=A0 struct device *dev =3D &wacom_data->client->dev;
>> +=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0 u8 data[COM_COORD_NUM_MAX];
>> +=C2=A0=C2=A0 bool touch, rubber, side_button;
>> +=C2=A0=C2=A0 u16 x, y, pressure;
>> +=C2=A0=C2=A0 u8 distance;
>> +
>> +=C2=A0=C2=A0 ret =3D i2c_master_recv(client, data, wacom_data->variant-=
>com_coord_num);
>> +=C2=A0=C2=A0 if (ret !=3D wacom_data->variant->com_coord_num) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret >=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -E=
IO;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "%s: i2c receive fail=
ed (%d)\n", __func__, ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 dev_dbg(dev, "data: %X, %X, %X, %X, %X, %X, %X, %X, %X, %X=
, %X, %X", data[0], data[1],
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data[2], data[3], data[4], data[5]=
, data[6], data[7], data[8], data[9], data[10],
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data[11]);
>
> "data: %*ph"
>
>> +
>> +=C2=A0=C2=A0 if (data[0] & BIT(7)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->pen_proximity =3D 1;
>
> =3D true
>
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 touch =3D !!(data[0] & BIT(4));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 side_button =3D !!(data[0] & BIT(5=
));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rubber =3D !!(data[0] & BIT(6));
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x =3D get_unaligned_be16(&data[1])=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 y =3D get_unaligned_be16(&data[3])=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pressure =3D get_unaligned_be16(&d=
ata[5]);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 distance =3D data[7];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!((x <=3D wacom_data->prop.max=
_x) && (y <=3D wacom_data->prop.max_y))) {
>
> Too many parens. Also maybe
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (x > wacom_data->prop.max_x=
 || y > wacom_data->prop.max_y)

Yeah, I should've just used it from the beginning.

>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(d=
ev, "Coordinates out of range x=3D%d, y=3D%d", x, y);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 touchscreen_report_pos(wacom_data-=
>input_dev, &wacom_data->prop, x, y, false);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_abs(wacom_data->input=
_dev, ABS_PRESSURE, pressure);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_abs(wacom_data->input=
_dev, ABS_DISTANCE, distance);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(wacom_data->input=
_dev, BTN_STYLUS, side_button);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(wacom_data->input=
_dev, BTN_TOUCH, touch);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(wacom_data->input=
_dev, BTN_TOOL_PEN, !rubber);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(wacom_data->input=
_dev, BTN_TOOL_RUBBER, rubber);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_sync(wacom_data->input_dev);
>> +=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (wacom_data->pen_proximity) {
>
> Can be collapsed "else if"

You're right.

>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_repo=
rt_abs(wacom_data->input_dev, ABS_PRESSURE, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_repo=
rt_abs(wacom_data->input_dev, ABS_DISTANCE, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_repo=
rt_key(wacom_data->input_dev, BTN_STYLUS, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_repo=
rt_key(wacom_data->input_dev, BTN_TOUCH, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_repo=
rt_key(wacom_data->input_dev, BTN_TOOL_PEN, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_repo=
rt_key(wacom_data->input_dev, BTN_TOOL_RUBBER, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_sync=
(wacom_data->input_dev);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data=
->pen_proximity =3D 0;
>
> =3D false
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0 }
>> +}
>> +
>> +static irqreturn_t wacom_w9000_interrupt(int irq, void *dev_id)
>> +{
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data =3D dev_id;
>> +
>> +=C2=A0=C2=A0 wacom_w9000_coord(wacom_data);
>> +
>> +=C2=A0=C2=A0 return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t wacom_w9000_interrupt_pen_insert(int irq, void *dev_=
id)
>> +{
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data =3D dev_id;
>> +=C2=A0=C2=A0 struct device *dev =3D &wacom_data->client->dev;
>> +=C2=A0=C2=A0 int ret;
>
> =C2=A0=C2=A0=C2=A0 int error;
>
>> +
>> +=C2=A0=C2=A0 wacom_data->pen_inserted =3D gpiod_get_value(wacom_data->p=
en_inserted_gpio);
>
> This runs in a thread, use "can sleep" variant.

Okay

>
>> +
>> +=C2=A0=C2=A0 input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED=
, wacom_data->pen_inserted);
>> +=C2=A0=C2=A0 input_sync(wacom_data->input_dev);
>> +
>> +=C2=A0=C2=A0 if (!wacom_data->pen_inserted && !regulator_is_enabled(wac=
om_data->regulator)) {
>
> What if the regulator is shared with something else? You should not
> operate based on the state, just do what you need (i.e. enable or
> disable).

I'll rework the whole regulator on/off situation.
It's difficult because I also want to take in account if the pen is
currently inserted in the device, then the regulator can stay off until
it's pulled out.

>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regulator_enable(wacom_dat=
a->regulator);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(de=
v, "Failed to enable regulators: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return IRQ=
_HANDLED;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(200);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable_irq(wacom_data->irq);
>> +=C2=A0=C2=A0 } else if (wacom_data->pen_inserted && regulator_is_enable=
d(wacom_data->regulator)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disable_irq(wacom_data->irq);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator_disable(wacom_data->regu=
lator);
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 dev_dbg(dev, "Pen inserted changed to %d", wacom_data->pen=
_inserted);
>> +
>> +=C2=A0=C2=A0 return IRQ_HANDLED;
>> +}
>> +
>> +static int wacom_w9000_open(struct input_dev *dev)
>> +{
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data =3D input_get_drvdata(=
dev);
>> +=C2=A0=C2=A0 int ret;
>
> =C2=A0=C2=A0=C2=A0 int error;
>
>> +
>> +=C2=A0=C2=A0 if (!wacom_data->pen_inserted && !regulator_is_enabled(wac=
om_data->regulator)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regulator_enable(wacom_dat=
a->regulator);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&w=
acom_data->client->dev, "Failed to enable regulators: %d\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(200);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable_irq(wacom_data->irq);
>> +=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static void wacom_w9000_close(struct input_dev *dev)
>> +{
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data =3D input_get_drvdata(=
dev);
>> +
>> +=C2=A0=C2=A0 if (regulator_is_enabled(wacom_data->regulator)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disable_irq(wacom_data->irq);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator_disable(wacom_data->regu=
lator);
>> +=C2=A0=C2=A0 }
>> +}
>> +
>> +static int wacom_w9000_probe(struct i2c_client *client)
>> +{
>> +=C2=A0=C2=A0 struct device *dev =3D &client->dev;
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data;
>> +=C2=A0=C2=A0 struct input_dev *input_dev;
>> +=C2=A0=C2=A0 int ret;
>
> =C2=A0=C2=A0=C2=A0 int error;
>
>> +=C2=A0=C2=A0 u32 val;
>> +
>> +=C2=A0=C2=A0 if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C=
)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "i2c_check_functional=
ity error\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 wacom_data =3D devm_kzalloc(dev, sizeof(*wacom_data), GFP_=
KERNEL);
>> +=C2=A0=C2=A0 if (!wacom_data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0 wacom_data->variant =3D i2c_get_match_data(client);
>> +
>> +=C2=A0=C2=A0 wacom_data->client =3D client;
>> +
>> +=C2=A0=C2=A0 input_dev =3D devm_input_allocate_device(dev);
>> +=C2=A0=C2=A0 if (!input_dev)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +=C2=A0=C2=A0 wacom_data->input_dev =3D input_dev;
>> +
>> +=C2=A0=C2=A0 wacom_data->irq =3D client->irq;
>> +=C2=A0=C2=A0 i2c_set_clientdata(client, wacom_data);
>> +
>> +=C2=A0=C2=A0 wacom_data->regulator =3D devm_regulator_get(dev, "vdd");
>> +=C2=A0=C2=A0 if (IS_ERR(wacom_data->regulator))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, PTR_ERR(=
wacom_data->regulator),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to get regulators\n")=
;
>> +
>> +=C2=A0=C2=A0 wacom_data->flash_mode_gpio =3D devm_gpiod_get_optional(de=
v, "flash-mode", GPIOD_OUT_LOW);
>> +=C2=A0=C2=A0 if (IS_ERR(wacom_data->flash_mode_gpio))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, PTR_ERR(=
wacom_data->flash_mode_gpio),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to get flash-mode gpi=
o\n");
>> +
>> +=C2=A0=C2=A0 wacom_data->pen_inserted_gpio =3D devm_gpiod_get_optional(=
dev, "pen-inserted", GPIOD_IN);
>> +=C2=A0=C2=A0 if (IS_ERR(wacom_data->pen_inserted_gpio))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, PTR_ERR(=
wacom_data->pen_inserted_gpio),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to get pen-insert gpi=
o\n");
>> +
>> +=C2=A0=C2=A0 ret =3D regulator_enable(wacom_data->regulator);
>> +=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, ret, "Fa=
iled to enable regulators\n");
>> +
>> +=C2=A0=C2=A0 msleep(200);
>> +
>> +=C2=A0=C2=A0 ret =3D wacom_w9000_query(wacom_data);
>> +=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_disable_regulators;
>
> I do not think you need power past this point until you open the device.
> Maybe turn it off right here?

Correct, this will simplify some things.

>
>> +
>> +=C2=A0=C2=A0 input_dev->name =3D wacom_data->variant->name;
>> +=C2=A0=C2=A0 input_dev->id.bustype =3D BUS_I2C;
>> +=C2=A0=C2=A0 input_dev->dev.parent =3D dev;
>> +=C2=A0=C2=A0 input_dev->id.vendor =3D 0x56a;
>> +=C2=A0=C2=A0 input_dev->id.version =3D wacom_data->fw_version;
>> +=C2=A0=C2=A0 input_dev->open =3D wacom_w9000_open;
>> +=C2=A0=C2=A0 input_dev->close =3D wacom_w9000_close;
>> +
>> +=C2=A0=C2=A0 input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
>> +=C2=A0=C2=A0 input_set_capability(input_dev, EV_KEY, BTN_TOOL_PEN);
>> +=C2=A0=C2=A0 input_set_capability(input_dev, EV_KEY, BTN_TOOL_RUBBER);
>> +=C2=A0=C2=A0 input_set_capability(input_dev, EV_KEY, BTN_STYLUS);
>> +
>> +=C2=A0=C2=A0 // Calculate x and y resolution from size in devicetree
>> +=C2=A0=C2=A0 ret =3D device_property_read_u32(dev, "touchscreen-x-mm", =
&val);
>> +=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_abs_set_res(input_dev, ABS_X=
, 100);
>
> If you do not have resolution data simply do not set it.

Okay.

>
>> +=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_abs_set_res(input_dev, ABS_X=
, wacom_data->prop.max_x / val);
>
> Don't you parse prop below so here max_x and max_y are both 0?

They're parsed in the wacom_w9000_query. I should still move them
below the touchscreen_parse_properties, just in case they're changed
in there.

>
>> +=C2=A0=C2=A0 ret =3D device_property_read_u32(dev, "touchscreen-y-mm", =
&val);
>> +=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_abs_set_res(input_dev, ABS_Y=
, 100);
>> +=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_abs_set_res(input_dev, ABS_Y=
, wacom_data->prop.max_y / val);
>> +
>> +=C2=A0=C2=A0 input_set_abs_params(input_dev, ABS_X, 0, wacom_data->prop=
.max_x, 4, 0);
>> +=C2=A0=C2=A0 input_set_abs_params(input_dev, ABS_Y, 0, wacom_data->prop=
.max_y, 4, 0);
>> +=C2=A0=C2=A0 input_set_abs_params(input_dev, ABS_PRESSURE, 0, wacom_dat=
a->max_pressure, 0, 0);
>> +=C2=A0=C2=A0 input_set_abs_params(input_dev, ABS_DISTANCE, 0, 255, 0, 0=
);
>> +
>> +=C2=A0=C2=A0 touchscreen_parse_properties(input_dev, false, &wacom_data=
->prop);
>> +
>> +=C2=A0=C2=A0 ret =3D devm_request_threaded_irq(dev, wacom_data->irq, NU=
LL, wacom_w9000_interrupt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_ONESHOT | IRQF_NO_AUTOEN, clie=
nt->name, wacom_data);
>> +=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to register i=
nterrupt\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_disable_regulators;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 if (wacom_data->pen_inserted_gpio) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_set_capability(input_dev, EV=
_SW, SW_PEN_INSERTED);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->pen_insert_irq =3D gpi=
od_to_irq(wacom_data->pen_inserted_gpio);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_request_threaded_irq(=
dev, wacom_data->pen_insert_irq, NULL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_w9000=
_interrupt_pen_insert, IRQF_ONESHOT |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_NO_AUT=
OEN | IRQF_TRIGGER_RISING |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_TRIGGE=
R_FALLING, "wacom_pen_insert",
>
> Rely on DT to define triggers. Use IRQF_ONESHOT only.

For this I would also need to specify this interrupt in the DT. This
interrupt would then need to have the same pin as specified for
pen_inserted_gpio and I can't only have the interrupt for it in the DT,
because I need pen_inserted_gpio to find out if the pen is inserted or not,
so that I can set power accordingly.

>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data)=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(de=
v, "Failed to register pen-insert interrupt\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_d=
isable_regulators;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->pen_inserted =3D gpiod=
_get_value(wacom_data->pen_inserted_gpio);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (wacom_data->pen_inserted)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator_=
disable(wacom_data->regulator);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable_irq=
(wacom_data->irq);
>> +=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable_irq(wacom_data->irq);
>
> Can this be moved into "open"?

Makes sense

>
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 input_set_drvdata(input_dev, wacom_data);
>> +
>> +=C2=A0=C2=A0 input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED=
, wacom_data->pen_inserted);
>> +=C2=A0=C2=A0 input_sync(wacom_data->input_dev);
>> +
>> +=C2=A0=C2=A0 if (wacom_data->pen_inserted_gpio)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable_irq(wacom_data->pen_insert_=
irq);
>> +
>> +=C2=A0=C2=A0 ret =3D input_register_device(wacom_data->input_dev);
>> +=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to register i=
nput device: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_disable_regulators;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 return 0;
>> +
>> +err_disable_regulators:
>> +=C2=A0=C2=A0 regulator_disable(wacom_data->regulator);
>> +=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static void wacom_w9000_remove(struct i2c_client *client)
>> +{
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata=
(client);
>> +
>> +=C2=A0=C2=A0 if (regulator_is_enabled(wacom_data->regulator))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator_disable(wacom_data->regu=
lator);
>
> Please move this to "close" and drop wacom_w9000_remove() altogether.

Alright, this makes things easier.

>
>> +}
>> +
>> +static int wacom_w9000_suspend(struct device *dev)
>> +{
>> +=C2=A0=C2=A0 struct i2c_client *client =3D to_i2c_client(dev);
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata=
(client);
>> +=C2=A0=C2=A0 struct input_dev *input_dev =3D wacom_data->input_dev;
>> +
>> +=C2=A0=C2=A0 mutex_lock(&input_dev->mutex);
>
> =C2=A0=C2=A0=C2=A0 guard(mutex)(&input_dev->mutex);

Okay

>
>> +
>> +=C2=A0=C2=A0 if (regulator_is_enabled(wacom_data->regulator)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disable_irq(wacom_data->irq);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator_disable(wacom_data->regu=
lator);
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 mutex_unlock(&input_dev->mutex);
>> +
>> +=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int wacom_w9000_resume(struct device *dev)
>> +{
>> +=C2=A0=C2=A0 struct i2c_client *client =3D to_i2c_client(dev);
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata=
(client);
>> +=C2=A0=C2=A0 struct input_dev *input_dev =3D wacom_data->input_dev;
>> +=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0 mutex_lock(&input_dev->mutex);
>
> =C2=A0=C2=A0=C2=A0 guard(mutex)(&input_dev->mutex);
>> +
>> +=C2=A0=C2=A0 if (!wacom_data->pen_inserted && !regulator_is_enabled(wac=
om_data->regulator)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regulator_enable(wacom_dat=
a->regulator);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&w=
acom_data->client->dev, "Failed to enable regulators: %d\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(200=
);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable_irq=
(wacom_data->irq);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 mutex_unlock(&input_dev->mutex);
>> +
>> +=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(wacom_w9000_pm, wacom_w9000_suspend, wa=
com_w9000_resume);
>> +
>> +static const struct wacom_w9000_variant w9007a_lt03 =3D {
>> +=C2=A0=C2=A0 .com_coord_num=C2=A0 =3D 8,
>> +=C2=A0=C2=A0 .com_query_num=C2=A0 =3D 9,
>> +=C2=A0=C2=A0 .name =3D "Wacom W9007 LT03 Digitizer",
>> +};
>> +
>> +static const struct wacom_w9000_variant w9007a_v1 =3D {
>> +=C2=A0=C2=A0 .com_coord_num=C2=A0 =3D 12,
>> +=C2=A0=C2=A0 .com_query_num=C2=A0 =3D 9,
>> +=C2=A0=C2=A0 .name =3D "Wacom W9007 V1 Digitizer",
>> +};
>> +
>> +static const struct of_device_id wacom_w9000_of_match[] =3D {
>> +=C2=A0=C2=A0 { .compatible =3D "wacom,w9007a-lt03", .data =3D &w9007a_l=
t03, },
>> +=C2=A0=C2=A0 { .compatible =3D "wacom,w9007a-v1", .data =3D &w9007a_v1,=
 },
>> +=C2=A0=C2=A0 {},
>
> =C2=A0=C2=A0=C2=A0 { }
>
> No need for trailing comma on a sentinel entry.

Okay

>
>> +};
>> +MODULE_DEVICE_TABLE(of, wacom_w9000_of_match);
>> +
>> +static const struct i2c_device_id wacom_w9000_id[] =3D {
>> +=C2=A0=C2=A0 { .name =3D "w9007a-lt03", .driver_data =3D (kernel_ulong_=
t)&w9007a_lt03 },
>> +=C2=A0=C2=A0 { .name =3D "w9007a-v1", .driver_data =3D (kernel_ulong_t)=
&w9007a_v1 },
>> +=C2=A0=C2=A0 { }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, wacom_w9000_id);
>> +
>> +static struct i2c_driver wacom_w9000_driver =3D {
>> +=C2=A0=C2=A0 .driver =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name=C2=A0=C2=A0 =3D "wacom_w9000=
",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .of_match_table =3D wacom_w9000_of=
_match,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D pm_sleep_ptr(&wacom_w9000_=
pm),
>> +=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0 .probe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D wacom_w9000_probe=
,
>> +=C2=A0=C2=A0 .remove=C2=A0=C2=A0=C2=A0=C2=A0 =3D wacom_w9000_remove,
>> +=C2=A0=C2=A0 .id_table=C2=A0=C2=A0 =3D wacom_w9000_id,
>> +};
>> +module_i2c_driver(wacom_w9000_driver);
>> +
>> +/* Module information */
>> +MODULE_AUTHOR("Hendrik Noack <hendrik-noack@gmx.de>");
>> +MODULE_DESCRIPTION("Wacom W9000-series penabled touchscreen driver");
>> +MODULE_LICENSE("GPL");
>
> Thanks.
>
> --
> Dmitry

Thanks for your feedback. I'm going to incorporate it in my next version.

Hendrik


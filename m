Return-Path: <linux-input+bounces-15868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98482C2B2C0
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 11:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CFC14E1176
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 10:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882712FDC5B;
	Mon,  3 Nov 2025 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="Mo1CM+y4"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46822FFDE2;
	Mon,  3 Nov 2025 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167311; cv=none; b=siy8yOicb1GA9O5XIFBz3b7FSZvttogu5StjJiXNOO44fIw8nASjPQtgLqv3GhhS3loidnIY1ARhGHC5+zur5xYCB++YLBoclqXGhbtI5LVtQtWLUBz4pwlS/mYI2ucp/b8Drl561v4vLfgrW8KGVO5joGECEpeKttRbCwc/zb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167311; c=relaxed/simple;
	bh=z8gBnAAY25DyQDRkKROzWmlDuilvhefVAfS5wjLAVuU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qk2jX3FAQLk1m7co6o+6C4wz+9xnBw3Uml3Hb7tRduENCxI3nceiskUX/tYWdgXwcjFAET7nsSBEZMgWp+fW9E20D4Qa9C4EmIRgsH03bRnDIrjIhz3XtZGNa0QoejovrAQLADKuS69n/3Wi1zhDjanc8e5/TizA8iZ8UcUlVPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=Mo1CM+y4; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1762167305; x=1762772105; i=hendrik-noack@gmx.de;
	bh=z8gBnAAY25DyQDRkKROzWmlDuilvhefVAfS5wjLAVuU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Mo1CM+y4DwoONiyUar3HdmnNBtr2Yqg0OVIGImlF7JJ4fYggUZ+396JQjZOtaE9J
	 1+r12+Tyn6vmYbwgOZT4LfuW2LdXhsfIrq7ch+5tOY97oi7PTLiDTfhW2iS3JvVLD
	 9ru444j53nMgzBzLB3ioGgoWCdEtPL6DcvFzoFE9NeEu8VwA24IsEAn82m+Ev0s2J
	 3BVZ4cWiJ9kxOz4vb5KaD3+Kj6nydvYNuzIDIamVcyTXT8hBtgIOav6sfZy8CBk8N
	 6wue28dN2o08bFDbJT3M/WS6Q7ZJQTvr4I4KOPEcREcN3yGgtXzooZZAnrB+7Cg45
	 vAp68A+wVvp1cfZ1/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.85.39.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYLQ-1vr8uP25ZQ-00b1PR; Mon, 03
 Nov 2025 11:55:05 +0100
Date: Mon, 3 Nov 2025 11:55:05 +0100 (GMT+01:00)
From: Kernel GMX <hendrik-noack@gmx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <a596e67d-56f2-43c7-8b42-55403dfb3a93@gmx.de>
In-Reply-To: <20251028-funky-rose-rook-3ccab5@kuoka>
References: <20251027164050.113623-1-hendrik-noack@gmx.de> <20251027212535.4078-1-hendrik-noack@gmx.de> <20251027212535.4078-2-hendrik-noack@gmx.de> <20251028-funky-rose-rook-3ccab5@kuoka>
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
X-Correlation-ID: <a596e67d-56f2-43c7-8b42-55403dfb3a93@gmx.de>
X-Provags-ID: V03:K1:O44pUs/aBda5RcUDlPz31ROWOKXuoNOREMkjVDN+ZkxrRG+bvVi
 /0UV2D7PujOOdXm9NGLrp+JLO+FF/nEop2Xe6IdfC0RcXWAASBO16BoxxoKnuOCdr327imF
 fp+2dn73dIkabsXkCD0+kvnLUPMTg22EpmpuuiPfh/k1Q74eoLLTAr+qYf4YTsxWgGGC1bp
 nyQIZc3kPkKTrxj4jJucA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J2tUm8Fjw3Y=;CLSvCzF7qeS67KsINwOYeEg6hvD
 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
 Cdu9F3R79FhgPcwMOtloNbcpkGPAIX5HaX9RoR

28.10.2025 08:44:34 Krzysztof Kozlowski <krzk@kernel.org>:

> On Mon, Oct 27, 2025 at 10:25:35PM +0100, Hendrik Noack wrote:
>> +
>> +static const struct of_device_id wacom_w9000_of_match[] =3D {
>> +=C2=A0=C2=A0 { .compatible =3D "wacom,w9007a_lt03", .data =3D &wacom_w9=
007a_lt03, },
>> +=C2=A0=C2=A0 { .compatible =3D "wacom,w9007a_v1", .data =3D &wacom_w900=
7a_v1, },
>> +=C2=A0=C2=A0 {},
>> +};
>> +MODULE_DEVICE_TABLE(of, wacom_w9000_of_match);
>
> This goes next to other ID table, around the probe.
>
>> +
>> +static int wacom_w9000_read(struct i2c_client *client, u8 command, int =
len, char *data)
>> +{
>> +=C2=A0=C2=A0 struct i2c_msg xfer[2];
>> +=C2=A0=C2=A0 bool retried =3D false;
>> +=C2=A0=C2=A0 int ret;
>> +
>
> ...
>
>> +
>> +static int wacom_w9000_probe(struct i2c_client *client)
>> +{
>> +=C2=A0=C2=A0 struct device *dev =3D &client->dev;
>> +=C2=A0=C2=A0 struct wacom_w9000_data *wacom_data;
>> +=C2=A0=C2=A0 struct input_dev *input_dev;
>> +=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0 u32 val;
>> +
>> +=C2=A0=C2=A0 if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C=
)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "i2c_check_functional=
ity error\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 wacom_data =3D devm_kzalloc(dev, sizeof(struct wacom_w9000=
_data), GFP_KERNEL);
>
> sizeof(*)
>
> Please use existing kernel coding style, not some downstream version.
>

Okay, I was orienting myself on the atmel_mxt_ts driver and it had it like =
this.

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
>> +=C2=A0=C2=A0 if (IS_ERR(wacom_data->regulator)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(wacom_data->regula=
tor);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to get regula=
tors %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>
> Nope. Look at all other drivers. Syntax is since some years return
> dev_err_probe.
>
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 /* Request flash-mode line and don't go into flash mode */
>> +=C2=A0=C2=A0 wacom_data->flash_mode_gpio =3D devm_gpiod_get_optional(de=
v, "flash-mode", GPIOD_OUT_LOW);
>> +=C2=A0=C2=A0 if (IS_ERR(wacom_data->flash_mode_gpio)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(wacom_data->flash_=
mode_gpio);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to get flash-=
mode gpio: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>
> You must handle deferred probe. Please look at all other drivers how
> they do it.
>
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 /* Request pdct line=C2=A0 */
>> +=C2=A0=C2=A0 wacom_data->pen_detect_gpio =3D devm_gpiod_get_optional(de=
v, "pdct", GPIOD_IN);
>> +=C2=A0=C2=A0 if (IS_ERR(wacom_data->pen_detect_gpio)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(wacom_data->pen_de=
tect_gpio);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to get pdct g=
pio: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 /* Request pen-insert line=C2=A0 */
>> +=C2=A0=C2=A0 wacom_data->pen_inserted_gpio =3D devm_gpiod_get_optional(=
dev, "pen-inserted", GPIOD_IN);
>> +=C2=A0=C2=A0 if (IS_ERR(wacom_data->pen_inserted_gpio)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(wacom_data->pen_in=
serted_gpio);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to get pen-in=
sert gpio: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 ret =3D regulator_enable(wacom_data->regulator);
>> +=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to enable reg=
ulators: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 msleep(200);
>> +
>> +=C2=A0=C2=A0 ret =3D wacom_w9000_query(wacom_data);
>> +=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_disable_regulators;
>> +
>> +=C2=A0=C2=A0 input_dev->name =3D wacom_data->variant->name;
>> +=C2=A0=C2=A0 input_dev->id.bustype =3D BUS_I2C;
>> +=C2=A0=C2=A0 input_dev->dev.parent =3D dev;
>> +=C2=A0=C2=A0 input_dev->id.vendor =3D 0x56a;
>> +=C2=A0=C2=A0 input_dev->id.version =3D wacom_data->fw_version;
>> +=C2=A0=C2=A0 input_dev->open =3D wacom_w9000_open;
>> +=C2=A0=C2=A0 input_dev->close =3D wacom_w9000_close;
>> +
>> +=C2=A0=C2=A0 __set_bit(EV_KEY, input_dev->evbit);
>> +=C2=A0=C2=A0 __set_bit(EV_ABS, input_dev->evbit);
>> +=C2=A0=C2=A0 __set_bit(BTN_TOUCH, input_dev->keybit);
>> +=C2=A0=C2=A0 __set_bit(BTN_TOOL_PEN, input_dev->keybit);
>> +=C2=A0=C2=A0 __set_bit(BTN_TOOL_RUBBER, input_dev->keybit);
>> +=C2=A0=C2=A0 __set_bit(BTN_STYLUS, input_dev->keybit);
>> +
>> +=C2=A0=C2=A0 // Calculate x and y resolution from size in devicetree
>> +=C2=A0=C2=A0 ret =3D device_property_read_u32(dev, "touchscreen-x-mm", =
&val);
>> +=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_abs_set_res(input_dev, ABS_X=
, 100);
>> +=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_abs_set_res(input_dev, ABS_X=
, wacom_data->prop.max_x / val);
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
>> +=C2=A0=C2=A0 if (wacom_data->pen_detect_gpio) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->pen_detect_irq =3D gpi=
od_to_irq(wacom_data->pen_detect_gpio);
>
> Why is this a GPIO? Your binding said this is GPIO, your code says this
> is an interrupt.

You are right, it's not necessary here.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_request_threaded_irq(=
dev, wacom_data->pen_detect_irq, NULL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_w9000=
_interrupt_pen_detect, IRQF_ONESHOT |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_NO_AUT=
OEN | IRQF_TRIGGER_RISING |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_TRIGGE=
R_FALLING, "wacom_pdct", wacom_data);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(de=
v, "Failed to register pdct interrupt\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_d=
isable_regulators;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0 if (wacom_data->pen_inserted_gpio) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_dev->evbit[0] |=3D BIT_MASK(=
EV_SW);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_set_capability(input_dev, EV=
_SW, SW_PEN_INSERTED);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data->pen_insert_irq =3D gpi=
od_to_irq(wacom_data->pen_inserted_gpio);
>
> Same question here.
>

The driver needs to know the GPIO state to determine if the pen is inserted
so that it can enable or disable the regulator and main interrupt according=
ly.
An interrupt for this GPIO is necessary for this evaluation to occur
on every signal change.

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
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wacom_data)=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(de=
v, "Failed to register pen-insert interrupt\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_d=
isable_regulators;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0 }
>> +

...

Thank you for you feedback, I will address the feedback in my next iteratio=
n.

Best regards,
Hendrik


Return-Path: <linux-input+bounces-9871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D1A2E3CB
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 06:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EB503A7D56
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 05:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E361E130E58;
	Mon, 10 Feb 2025 05:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dZzqJ7Qc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF022F2E;
	Mon, 10 Feb 2025 05:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739166508; cv=none; b=sDZSW9G9Ca5X9v4A8eJY5h0wm+NfRhOr9PKzvWwvlF0QB4LHmGdSc0F6EeQHy7zF86p5pAHo/jE3QtW7zTe/2z21Lz6sdiq29lFvne66ZjqYkeG8nzLdEOzy3Cg9+Sio2yVCwoN3kJqVWsi3HAz4d5Co00Cy0MMRe3h+f28Z//c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739166508; c=relaxed/simple;
	bh=+NAxRQC5smRZ5HsmXOpBI0/Ve2ax8F4QGZ7SNEUkpNM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FyAFU2sN6sK/iyYVj/uPN/oTBoHYl6i/pxNkvtTI4WmyXDw0C7WQDfwqwvdtx/N6YWUw1P/qGeGm1F8CDMpmHZqjmWZDKW85omGG+9MHTTsRpbdb+uCHJoPON5dMduU3qj9HOudw6WHJfckoISrZeBFOzpqOktL7ZuAB2y52LMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dZzqJ7Qc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [127.0.0.1] (254C220D.nat.pool.telekom.hu [37.76.34.13])
	by mail.mainlining.org (Postfix) with ESMTPSA id 83E49E4533;
	Mon, 10 Feb 2025 05:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739166504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwdoMmgPxPuwsmi4DTSKg54itX3LuYY47U5m5IBWkVQ=;
	b=dZzqJ7Qc1i19o14nPMXRoCPBKMmBsnCzUVvxlm8fPvS99E2oX2o53PF/1MPyx+1nrjbRea
	taI9xEel0OoM57zVdxmhpb00g1ty8nNpVYE+fbTYm7iXAuzBYQYsihLNgtnEcgsUJ1uP1f
	yhBhWTqBACM49wK7vAbhYeaBibwQe3CzlXq6gLosiljz4J88CUjJbME3qx+kPK63+zD/ci
	NI9Udny9cwzz1lW8FoDuO27CjmfBYBYK6Z4heVyIJY+ZRVUM0AINWC6QKoDUHO3jkxNgB1
	z8xJn+HKfYunYMezBql7594CgSLJyHME3JOHrEmph8JvLbzwrLtOL4QGorRNBQ==
Date: Mon, 10 Feb 2025 06:48:24 +0100
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Felix Kaechele <felix@kaechele.ca>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] Input: rmi_i2c: introduce reset GPIO handling
User-Agent: K-9 Mail for Android
In-Reply-To: <20250210050220.634497-2-felix@kaechele.ca>
References: <20250210050220.634497-1-felix@kaechele.ca> <20250210050220.634497-2-felix@kaechele.ca>
Message-ID: <8A6D08BB-B830-4275-B61B-15D367415D59@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On February 10, 2025 6:02:09 AM GMT+01:00, Felix Kaechele <felix@kaechele=
=2Eca> wrote:
>Implement reset GPIO handling logic for the rmi_i2c driver=2E This logic
>is required for some mobile devices to successfully initialize the touch
>controller=2E
>
>The timings for the assertion of the reset GPIO were derived from the
>GPLv2+ licensed synaptics-dsx-v2=2E1 vendor driver release and research I
>conducted into downstream device tree sources=2E Values of 10ms to 20ms
>are commonly found=2E
>
>Tested-On: Motorola Moto G5 Plus (XT1685 "potter")
>
>Signed-off-by: Felix Kaechele <felix@kaechele=2Eca>
>---
> drivers/input/rmi4/rmi_driver=2Ec |  1 -
> drivers/input/rmi4/rmi_driver=2Eh |  2 ++
> drivers/input/rmi4/rmi_i2c=2Ec    | 23 +++++++++++++++++++++++
> 3 files changed, 25 insertions(+), 1 deletion(-)

Tested-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainlining=2E=
org>

>
>diff --git a/drivers/input/rmi4/rmi_driver=2Ec b/drivers/input/rmi4/rmi_d=
river=2Ec
>index 2168b6cd7167=2E=2Eff6aed6a11c1 100644
>--- a/drivers/input/rmi4/rmi_driver=2Ec
>+++ b/drivers/input/rmi4/rmi_driver=2Ec
>@@ -30,7 +30,6 @@
> #define RMI4_PAGE_MASK 0xFF00
>=20
> #define RMI_DEVICE_RESET_CMD	0x01
>-#define DEFAULT_RESET_DELAY_MS	100
>=20
> void rmi_free_function_list(struct rmi_device *rmi_dev)
> {
>diff --git a/drivers/input/rmi4/rmi_driver=2Eh b/drivers/input/rmi4/rmi_d=
river=2Eh
>index 3bfe9013043e=2E=2Ee01453bd680f 100644
>--- a/drivers/input/rmi4/rmi_driver=2Eh
>+++ b/drivers/input/rmi4/rmi_driver=2Eh
>@@ -16,6 +16,8 @@
> #define SYNAPTICS_INPUT_DEVICE_NAME "Synaptics RMI4 Touch Sensor"
> #define SYNAPTICS_VENDOR_ID 0x06cb
>=20
>+#define DEFAULT_RESET_DELAY_MS	100
>+
> #define GROUP(_attrs) { \
> 	=2Eattrs =3D _attrs,  \
> }
>diff --git a/drivers/input/rmi4/rmi_i2c=2Ec b/drivers/input/rmi4/rmi_i2c=
=2Ec
>index 3c0c5fd44702=2E=2Ebeff566ca2c8 100644
>--- a/drivers/input/rmi4/rmi_i2c=2Ec
>+++ b/drivers/input/rmi4/rmi_i2c=2Ec
>@@ -4,6 +4,7 @@
>  * Copyright (c) 2011 Unixphere
>  */
>=20
>+#include <linux/gpio/consumer=2Eh>
> #include <linux/i2c=2Eh>
> #include <linux/rmi=2Eh>
> #include <linux/of=2Eh>
>@@ -26,7 +27,9 @@
>  * @tx_buf_size: Size of the buffer
>  *
>  * @supplies: Array of voltage regulators
>+ * @reset_gpio: Reference to the reset GPIO
>  * @startup_delay: Milliseconds to pause after powering up the regulator=
s
>+ * @reset_delay: Milliseconds to pause after resetting the device
>  */
> struct rmi_i2c_xport {
> 	struct rmi_transport_dev xport;
>@@ -39,7 +42,9 @@ struct rmi_i2c_xport {
> 	size_t tx_buf_size;
>=20
> 	struct regulator_bulk_data supplies[2];
>+	struct gpio_desc *reset_gpio;
> 	u32 startup_delay;
>+	u32 reset_delay;
> };
>=20
> #define RMI_PAGE_SELECT_REGISTER 0xff
>@@ -227,6 +232,15 @@ static int rmi_i2c_probe(struct i2c_client *client)
> 		return -ENODEV;
> 	}
>=20
>+	rmi_i2c->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
>+						      GPIOD_OUT_HIGH);
>+	if (IS_ERR(rmi_i2c->reset_gpio)) {
>+		error =3D PTR_ERR(rmi_i2c->reset_gpio);
>+		dev_err(&client->dev, "failed to get reset GPIO: %d\n", error);
>+		return error;
>+	}
>+	gpiod_set_consumer_name(rmi_i2c->reset_gpio, "rmi4 reset");
>+
> 	rmi_i2c->supplies[0]=2Esupply =3D "vdd";
> 	rmi_i2c->supplies[1]=2Esupply =3D "vio";
> 	error =3D devm_regulator_bulk_get(&client->dev,
>@@ -251,6 +265,15 @@ static int rmi_i2c_probe(struct i2c_client *client)
>=20
> 	msleep(rmi_i2c->startup_delay);
>=20
>+	if (rmi_i2c->reset_gpio) {
>+		of_property_read_u32(client->dev=2Eof_node, "syna,reset-delay-ms",
>+				     &rmi_i2c->reset_delay);
>+		gpiod_set_value_cansleep(rmi_i2c->reset_gpio, 1);
>+		usleep_range(10000, 20000);
>+		gpiod_set_value_cansleep(rmi_i2c->reset_gpio, 0);
>+		msleep(rmi_i2c->reset_delay ?: DEFAULT_RESET_DELAY_MS);
>+	}
>+
> 	rmi_i2c->client =3D client;
> 	mutex_init(&rmi_i2c->page_mutex);
>=20


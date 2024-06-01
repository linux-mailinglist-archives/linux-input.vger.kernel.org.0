Return-Path: <linux-input+bounces-4011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560298D71DA
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 22:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08478281B78
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 20:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C4F154C12;
	Sat,  1 Jun 2024 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRhxDNM7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D688120F;
	Sat,  1 Jun 2024 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717274686; cv=none; b=oTbR3v1oLJ6BsVl2Csidx6SngHgaBFQLMjdQYEdk40WOPcqVfCpTbamM4fL9c6lY0bWyshVl8oIHUYrg+8wMtjoV/Ni4i4bc60HkiZ9OwmEVGcEt2Au6yvgueXzminFZG9aBFA/xIjcouuUc9VXvbKSJcf5g27dXR+5iu6naEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717274686; c=relaxed/simple;
	bh=oL/f5LFTUMhn1i0h51KvDWlGmHaSNFHJXTUDC1jxepU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2+QBC4XSSsqykki9UptDtKTLnE/cqJZqSBygFP0/moihkEvPlB5y7vqpSMBaadJvPhR52tsgyGlomP79ERnjyzZtsRSGTqm/KI/H+F458ZPalOj8lvzAQZm2Fim6PT2dppyC3oNU989a5+3Sz7Stkkr6jUgLeTUD+Kt92C7++g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRhxDNM7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 074D5C4AF08;
	Sat,  1 Jun 2024 20:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717274686;
	bh=oL/f5LFTUMhn1i0h51KvDWlGmHaSNFHJXTUDC1jxepU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jRhxDNM7ePk0nBGTUOyV0zivwwFyxTe/Woq9utdJYdNypCXeVv81ONZw6tMYqnTCm
	 7Ahf5nTwghzuo5eGxgTulez+uvOpMtRKOOrsfrg9oaJhXX6MTrA8LqRkLWwCAvpJEC
	 IhNaBGhb9Wf5OM6o2nzry8gQTv0yO4FeyedFUtXKOv1UumZnsvtT3xnY7v6eQ3N/Xb
	 R1jmePgdic9r6OYqlT94TMo8D30nxQV477hepqdrCjJ+145Z/kZMLqg0g70PCvZEE4
	 jvBL25EtWKulT0I1KqXOa0OUNU9szwooVQdX4/Ghlv7atap99h1DOMWstxm4IjIOMk
	 TnToiL3dy8OeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D23C27C53;
	Sat,  1 Jun 2024 20:44:45 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Sat, 01 Jun 2024 15:44:45 -0500
Subject: [PATCH v5 3/3] Input: novatek-nvt-ts: add support for NT36672A
 touchscreen
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-nvt-ts-devicetree-regulator-support-v5-3-aa9bf986347d@gmail.com>
References: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
In-Reply-To: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717274685; l=5689;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=3VXnAP6lJY2+M+2uxu95s8qsqxPyAvaz4q1AjmLeC48=;
 b=Qz1O618oBK00jaC0pV7fWbiAbJxW7yQ2Z0jWPgduxelFegorutKfOEmouD2q96iSuRR1UC5lf
 Un/y+WCP5FrDzZLarOPOSsbPW8tvbdVDh+Kp+M42JxXJDlaiHEgV46u
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Extend the novatek touchscreen driver to support NT36672A chip which
is found in phones like qcom/sdm845-xiaomi-beryllium-tianma.dts.
Added devicetree support for the driver and used i2c chip data to handle
the variation in chip id and wake type. Also added vcc and iovcc
regulators which are used to power the touchscreen hardware.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
 drivers/input/touchscreen/novatek-nvt-ts.c | 67 +++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
index 9bee3a0c122fb..b9ff97bf4d880 100644
--- a/drivers/input/touchscreen/novatek-nvt-ts.c
+++ b/drivers/input/touchscreen/novatek-nvt-ts.c
@@ -31,9 +31,6 @@
 #define NVT_TS_PARAMS_CHIP_ID		0x0e
 #define NVT_TS_PARAMS_SIZE		0x0f
 
-#define NVT_TS_SUPPORTED_WAKE_TYPE	0x05
-#define NVT_TS_SUPPORTED_CHIP_ID	0x05
-
 #define NVT_TS_MAX_TOUCHES		10
 #define NVT_TS_MAX_SIZE			4096
 
@@ -51,10 +48,16 @@ static const int nvt_ts_irq_type[4] = {
 	IRQF_TRIGGER_HIGH
 };
 
+struct nvt_ts_i2c_chip_data {
+	u8 wake_type;
+	u8 chip_id;
+};
+
 struct nvt_ts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
 	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data regulators[2];
 	struct touchscreen_properties prop;
 	int max_touches;
 	u8 buf[NVT_TS_TOUCH_SIZE * NVT_TS_MAX_TOUCHES];
@@ -142,6 +145,13 @@ static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
 static int nvt_ts_start(struct input_dev *dev)
 {
 	struct nvt_ts_data *data = input_get_drvdata(dev);
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators), data->regulators);
+	if (error) {
+		dev_err(&data->client->dev, "failed to enable regulators\n");
+		return error;
+	}
 
 	enable_irq(data->client->irq);
 	gpiod_set_value_cansleep(data->reset_gpio, 0);
@@ -155,6 +165,7 @@ static void nvt_ts_stop(struct input_dev *dev)
 
 	disable_irq(data->client->irq);
 	gpiod_set_value_cansleep(data->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
 }
 
 static int nvt_ts_suspend(struct device *dev)
@@ -188,6 +199,7 @@ static int nvt_ts_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	int error, width, height, irq_type;
 	struct nvt_ts_data *data;
+	const struct nvt_ts_i2c_chip_data *chip;
 	struct input_dev *input;
 
 	if (!client->irq) {
@@ -199,12 +211,35 @@ static int nvt_ts_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	chip = device_get_match_data(&client->dev);
+	if (!chip)
+		return -EINVAL;
+
 	data->client = client;
 	i2c_set_clientdata(client, data);
 
+	/*
+	 * VCC is the analog voltage supply
+	 * IOVCC is the digital voltage supply
+	 */
+	data->regulators[0].supply = "vcc";
+	data->regulators[1].supply = "iovcc";
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(data->regulators), data->regulators);
+	if (error) {
+		dev_err(dev, "cannot get regulators: %d\n", error);
+		return error;
+	}
+
+	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators), data->regulators);
+	if (error) {
+		dev_err(dev, "failed to enable regulators: %d\n", error);
+		return error;
+	}
+
 	data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	error = PTR_ERR_OR_ZERO(data->reset_gpio);
 	if (error) {
+		regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
 		dev_err(dev, "failed to request reset GPIO: %d\n", error);
 		return error;
 	}
@@ -214,6 +249,7 @@ static int nvt_ts_probe(struct i2c_client *client)
 	error = nvt_ts_read_data(data->client, NVT_TS_PARAMETERS_START,
 				 data->buf, NVT_TS_PARAMS_SIZE);
 	gpiod_set_value_cansleep(data->reset_gpio, 1); /* Put back in reset */
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
 	if (error)
 		return error;
 
@@ -225,8 +261,8 @@ static int nvt_ts_probe(struct i2c_client *client)
 	if (width > NVT_TS_MAX_SIZE || height >= NVT_TS_MAX_SIZE ||
 	    data->max_touches > NVT_TS_MAX_TOUCHES ||
 	    irq_type >= ARRAY_SIZE(nvt_ts_irq_type) ||
-	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != NVT_TS_SUPPORTED_WAKE_TYPE ||
-	    data->buf[NVT_TS_PARAMS_CHIP_ID] != NVT_TS_SUPPORTED_CHIP_ID) {
+	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != chip->wake_type ||
+	    data->buf[NVT_TS_PARAMS_CHIP_ID] != chip->chip_id) {
 		dev_err(dev, "Unsupported touchscreen parameters: %*ph\n",
 			NVT_TS_PARAMS_SIZE, data->buf);
 		return -EIO;
@@ -277,8 +313,26 @@ static int nvt_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct nvt_ts_i2c_chip_data nvt_nt11205_ts_data = {
+	.wake_type = 0x05,
+	.chip_id = 0x05,
+};
+
+static const struct nvt_ts_i2c_chip_data nvt_nt36672a_ts_data = {
+	.wake_type = 0x01,
+	.chip_id = 0x08,
+};
+
+static const struct of_device_id nvt_ts_of_match[] = {
+	{ .compatible = "novatek,nt11205-ts", .data = &nvt_nt11205_ts_data },
+	{ .compatible = "novatek,nt36672a-ts", .data = &nvt_nt36672a_ts_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nvt_ts_of_match);
+
 static const struct i2c_device_id nvt_ts_i2c_id[] = {
-	{ "nt11205-ts" },
+	{ "nt11205-ts", (unsigned long) &nvt_nt11205_ts_data },
+	{ "nt36672a-ts", (unsigned long) &nvt_nt36672a_ts_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
@@ -287,6 +341,7 @@ static struct i2c_driver nvt_ts_driver = {
 	.driver = {
 		.name	= "novatek-nvt-ts",
 		.pm	= pm_sleep_ptr(&nvt_ts_pm_ops),
+		.of_match_table = nvt_ts_of_match,
 	},
 	.probe = nvt_ts_probe,
 	.id_table = nvt_ts_i2c_id,

-- 
2.45.1




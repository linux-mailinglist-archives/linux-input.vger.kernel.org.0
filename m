Return-Path: <linux-input+bounces-3754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595608CADE6
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 14:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64AAC1C2224B
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E7D7603A;
	Tue, 21 May 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kqtx7pqH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471975803;
	Tue, 21 May 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716293428; cv=none; b=O1oTkOdEThu3toYNEIS1FR4DA8pp6fsy0nGTi91Vya7RitQ7L/T6pmIJxzNHuXYx7bLebg85U6nDKVmieei4eTtyx7eXoZ8Lmfi+1In7x4VAIJzVKGl+MzY+350vsLrNh+KvQFbS59bsuRNey53gg6AwI0Tahf74lubIgBUY/uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716293428; c=relaxed/simple;
	bh=OdYZn52F6VF1uhjqjjPzVuFAHrHpPEZt905OhIkUFNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBBiJw05vAYF22Ae3eocH5p5meAuO63WzZksapRaHujW/kqjG/4X3N/UziPJ0e5BD0CW4ackv0ynDxmHxxCC2q2mvFqGXNM1Lg5s7+FkOWNMTctJKuWnkqBpJ2VpQyygS34MgLM4QUga6olXmJLENsJfGVJLDzFowk2+Rz+dJAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kqtx7pqH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8101C4AF0B;
	Tue, 21 May 2024 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716293428;
	bh=OdYZn52F6VF1uhjqjjPzVuFAHrHpPEZt905OhIkUFNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Kqtx7pqHMhTaam9MFyIegtO3DA6uJCRfyFca94yYpg7bxyvWdlTr79lFrl/8bYpt5
	 QQh7Nuc8c7zIxFdfLuGTbKxBxuHK09Ln5e3u4iU5oiCQzaVxiZ6klQdI9hykmjMDEH
	 cpDA5+BbaYaDWuVqQolJwlJeDkglnXE1K6diBqMuWU9FSe18JAvJdu35//US2WYSDw
	 lQrXMMaGC7voWjL2J6Dhh6qHWGsieUIBgoYRMRpeGhb6NX+Fx/ar7TLBqJmNBTODnt
	 F+wI8NFkhORqogd+rvhD0liGagtXDG1Sd7AqSoiYpmWrxRCM6D3TBNMCCHTufOtmlH
	 PUpBWzryPXrzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DE2C25B7C;
	Tue, 21 May 2024 12:10:27 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Tue, 21 May 2024 07:09:46 -0500
Subject: [PATCH 2/2] Input: novatek-nvt-ts: add support for NT36672A
 touchscreen
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-nvt-ts-devicetree-regulator-support-v1-2-8d766c639dca@gmail.com>
References: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
In-Reply-To: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716293427; l=5393;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=YdF+1/EluDURAn87EosfJ/ZwGhhN9IKd2kxlFEmen+c=;
 b=I+Jnn6QR1nh843pLr0rEf96p2m4czhTgNStHL7im12iz1E6oXP6k+cVh8noIMbLwUMnzI76p2
 S/ekfKH+VPVAhlW7xWeHILyZkzUG5I9nHnTUX8WmBOB7IMuI5pobPDU
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Extend the novatek touchscreen driver to support NT36672A chip which
is found in phones like Xiaomi Poco F1 [1]. Added devicetree support for
the driver and used i2c chip data to handle the variation in chip id and
wake type. Also added vcc and iovcc regulators which are used to power
the touchscreen hardware.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts?h=v6.9

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
 drivers/input/touchscreen/novatek-nvt-ts.c | 78 +++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
index 1a797e410a3fa..83b881e14a0f3 100644
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
 
@@ -51,11 +48,18 @@ static const int nvt_ts_irq_type[4] = {
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
+	const struct nvt_ts_i2c_chip_data *chip;
 	int max_touches;
 	u8 buf[NVT_TS_TOUCH_SIZE * NVT_TS_MAX_TOUCHES];
 };
@@ -139,9 +143,23 @@ static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void nvt_ts_disable_regulators(void *_data)
+{
+	struct nvt_ts_data *data = _data;
+
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
+}
+
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
@@ -155,6 +173,7 @@ static void nvt_ts_stop(struct input_dev *dev)
 
 	disable_irq(data->client->irq);
 	gpiod_set_value_cansleep(data->reset_gpio, 1);
+	nvt_ts_disable_regulators(data);
 }
 
 static int nvt_ts_suspend(struct device *dev)
@@ -199,9 +218,37 @@ static int nvt_ts_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->chip = device_get_match_data(&client->dev);
+	if (!data->chip)
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
+		dev_err(dev, "failed to enable regulators\n");
+		return error;
+	}
+
+	error = devm_add_action_or_reset(dev, nvt_ts_disable_regulators, data);
+	if (error) {
+		dev_err(dev, "failed to install regulator disable handler\n");
+		return error;
+	}
+
 	data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	error = PTR_ERR_OR_ZERO(data->reset_gpio);
 	if (error) {
@@ -225,8 +272,8 @@ static int nvt_ts_probe(struct i2c_client *client)
 	if (width > NVT_TS_MAX_SIZE || height >= NVT_TS_MAX_SIZE ||
 	    data->max_touches > NVT_TS_MAX_TOUCHES ||
 	    irq_type >= ARRAY_SIZE(nvt_ts_irq_type) ||
-	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != NVT_TS_SUPPORTED_WAKE_TYPE ||
-	    data->buf[NVT_TS_PARAMS_CHIP_ID] != NVT_TS_SUPPORTED_CHIP_ID) {
+	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != data->chip->wake_type ||
+	    data->buf[NVT_TS_PARAMS_CHIP_ID] != data->chip->chip_id) {
 		dev_err(dev, "Unsupported touchscreen parameters: %*ph\n",
 			NVT_TS_PARAMS_SIZE, data->buf);
 		return -EIO;
@@ -277,8 +324,26 @@ static int nvt_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct nvt_ts_i2c_chip_data nvt_ts_data = {
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
+	{ .compatible = "novatek,nvt-ts", .data = &nvt_ts_data },
+	{ .compatible = "novatek,nt36672a-ts", .data = &nvt_nt36672a_ts_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nvt_ts_of_match);
+
 static const struct i2c_device_id nvt_ts_i2c_id[] = {
-	{ "NVT-ts" },
+	{ "NVT-ts", (unsigned long) &nvt_ts_data },
+	{ "NT36672A-ts", (unsigned long) &nvt_nt36672a_ts_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
@@ -287,6 +352,7 @@ static struct i2c_driver nvt_ts_driver = {
 	.driver = {
 		.name	= "novatek-nvt-ts",
 		.pm	= pm_sleep_ptr(&nvt_ts_pm_ops),
+		.of_match_table = nvt_ts_of_match,
 	},
 	.probe = nvt_ts_probe,
 	.id_table = nvt_ts_i2c_id,

-- 
2.45.1




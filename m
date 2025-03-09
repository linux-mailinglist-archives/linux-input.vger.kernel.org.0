Return-Path: <linux-input+bounces-10657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486AA58121
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 07:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B8561890C39
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 06:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F063917C225;
	Sun,  9 Mar 2025 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gYND53qF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE174C08;
	Sun,  9 Mar 2025 06:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501409; cv=none; b=uTeOS6VnfkPMShMG0EMnVsAWnBtuds1sPP0kWtVhkdysUKsOBel2Y4/hNC7xm708+2WHiJPznDSDwsqXMKlNCpNqgW/+iQA1uFaY+oVfOGZjilD1z1oS5bCwVLIKLSWTvqP/qTHq+Dpqnaj2ePwxVtwzCfxGH/yIb4GYXXBs/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501409; c=relaxed/simple;
	bh=daveLIbbpfc6TX/ZIqAb4ljP0jJp/eT5pPtr9JdvYps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2RBN9FSEJKMDr+IHVK5ZPCvZIwI1vK+JNravGoKU9hVhEoMafXqendjW38QkEuEaHE7eDI0kRIJhTRxJlUSFQOaZdhSa6vHujUWjEekpYymT4W4EH0GuI2n5rH8YwtQoJfK33UDjUtvSfVLGPR6QOoUUo24Iv7j5vZ4D9mVWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gYND53qF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-222-202.nc.de [78.35.222.202])
	by mail.mainlining.org (Postfix) with ESMTPSA id 1B586BBAD2;
	Sun,  9 Mar 2025 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741501399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1LrjvVvOA5k19Tg/ELjrX84XlI5Hmoq1hVcftIAD0wU=;
	b=gYND53qF0VESLItCW0Ur9vJY1vITKvWyxKDnxwaGocBdYciJfdIYH6h4H84xfJYq3v3Bp5
	OjaPKepKfqrz8zfQszwVFdosr2ISK6AEVRCHEdshNYhuxZlJ9K6BUkef04B92mRAc4vs/9
	Iy7k3XPwtBiNfNR1g0zg0JuJwFDb6oaSjcuBgoc+aeKldvqYoBc7Y5yL/MqdpjyzOMWgWR
	zHUlPk8Rk2IbL+pkzoCcLQjzKqthtF0AZYCAvw1eIv//TEg0X21+LVdKVL6wfVoIH/Umxn
	kNltLPhh6902MW5xYqTCrzhh8dLKqCVDiPEBIkNbxrWtWkFlcONlBTvB3x+h1g==
From: Jens Reidel <adrian@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH v4 2/2] Input: goodix_berlin - Add support for Berlin-A series
Date: Sun,  9 Mar 2025 07:23:15 +0100
Message-ID: <20250309062315.35720-3-adrian@mainlining.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309062315.35720-1-adrian@mainlining.org>
References: <20250309062315.35720-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of the goodix_berlin driver lacks support for
revisions A and B of the Berlin IC. This change adds support for the
gt9897 IC, which is a Berlin-A revision part.

The differences between revision D and A are rather minor, a handful of
address changes and a slightly larger read buffer. They were taken from
the driver published by Goodix, which does a few more things that don't
appear to be necessary for the touchscreen to work properly.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 drivers/input/touchscreen/goodix_berlin.h     | 16 ++++++-
 .../input/touchscreen/goodix_berlin_core.c    | 21 ++++----
 drivers/input/touchscreen/goodix_berlin_i2c.c | 14 ++++--
 drivers/input/touchscreen/goodix_berlin_spi.c | 48 ++++++++++++++-----
 4 files changed, 73 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
index 38b6f9ddbdef..d8bbd4853206 100644
--- a/drivers/input/touchscreen/goodix_berlin.h
+++ b/drivers/input/touchscreen/goodix_berlin.h
@@ -12,12 +12,26 @@
 
 #include <linux/pm.h>
 
+#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A	0x1000C
+#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D	0x10014
+
+#define GOODIX_BERLIN_IC_INFO_ADDR_A		0x10068
+#define GOODIX_BERLIN_IC_INFO_ADDR_D		0x10070
+
+struct goodix_berlin_ic_data {
+	int fw_version_info_addr;
+	int ic_info_addr;
+	ssize_t read_dummy_len;
+	ssize_t read_prefix_len;
+};
+
 struct device;
 struct input_id;
 struct regmap;
 
 int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
-			struct regmap *regmap);
+			struct regmap *regmap,
+			const struct goodix_berlin_ic_data *ic_data);
 
 extern const struct dev_pm_ops goodix_berlin_pm_ops;
 extern const struct attribute_group *goodix_berlin_groups[];
diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index f7ea443b152e..02a1d9a465f2 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -12,7 +12,7 @@
  * to the previous generations.
  *
  * Currently the driver only handles Multitouch events with already
- * programmed firmware and "config" for "Revision D" Berlin IC.
+ * programmed firmware and "config" for "Revision A/D" Berlin IC.
  *
  * Support is missing for:
  * - ESD Management
@@ -20,7 +20,7 @@
  * - "Config" update/flashing
  * - Stylus Events
  * - Gesture Events
- * - Support for older revisions (A & B)
+ * - Support for revision B
  */
 
 #include <linux/bitfield.h>
@@ -28,6 +28,7 @@
 #include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sizes.h>
@@ -53,10 +54,8 @@
 
 #define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
 #define GOODIX_BERLIN_BOOTOPTION_ADDR		0x10000
-#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR	0x10014
 
 #define GOODIX_BERLIN_IC_INFO_MAX_LEN		SZ_1K
-#define GOODIX_BERLIN_IC_INFO_ADDR		0x10070
 
 #define GOODIX_BERLIN_CHECKSUM_SIZE		sizeof(u16)
 
@@ -175,6 +174,8 @@ struct goodix_berlin_core {
 	/* Runtime parameters extracted from IC_INFO buffer  */
 	u32 touch_data_addr;
 
+	const struct goodix_berlin_ic_data *ic_data;
+
 	struct goodix_berlin_event event;
 };
 
@@ -299,7 +300,7 @@ static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
 {
 	int error;
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADDR,
+	error = regmap_raw_read(cd->regmap, cd->ic_data->fw_version_info_addr,
 				&cd->fw_version, sizeof(cd->fw_version));
 	if (error) {
 		dev_err(cd->dev, "error reading fw version, %d\n", error);
@@ -367,7 +368,7 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
 	if (!afe_data)
 		return -ENOMEM;
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
+	error = regmap_raw_read(cd->regmap, cd->ic_data->ic_info_addr,
 				&length_raw, sizeof(length_raw));
 	if (error) {
 		dev_err(cd->dev, "failed get ic info length, %d\n", error);
@@ -380,8 +381,8 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
 		return -EINVAL;
 	}
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
-				afe_data, length);
+	error = regmap_raw_read(cd->regmap, cd->ic_data->ic_info_addr, afe_data,
+				length);
 	if (error) {
 		dev_err(cd->dev, "failed get ic info data, %d\n", error);
 		return error;
@@ -716,7 +717,8 @@ const struct attribute_group *goodix_berlin_groups[] = {
 EXPORT_SYMBOL_GPL(goodix_berlin_groups);
 
 int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
-			struct regmap *regmap)
+			struct regmap *regmap,
+			const struct goodix_berlin_ic_data *ic_data)
 {
 	struct goodix_berlin_core *cd;
 	int error;
@@ -733,6 +735,7 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 	cd->dev = dev;
 	cd->regmap = regmap;
 	cd->irq = irq;
+	cd->ic_data = ic_data;
 
 	cd->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(cd->reset_gpio))
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
index ad7a60d94338..929090a094bf 100644
--- a/drivers/input/touchscreen/goodix_berlin_i2c.c
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -31,6 +31,8 @@ static const struct input_id goodix_berlin_i2c_input_id = {
 
 static int goodix_berlin_i2c_probe(struct i2c_client *client)
 {
+	const struct goodix_berlin_ic_data *ic_data =
+		i2c_get_match_data(client);
 	struct regmap *regmap;
 	int error;
 
@@ -39,22 +41,28 @@ static int goodix_berlin_i2c_probe(struct i2c_client *client)
 		return PTR_ERR(regmap);
 
 	error = goodix_berlin_probe(&client->dev, client->irq,
-				    &goodix_berlin_i2c_input_id, regmap);
+				    &goodix_berlin_i2c_input_id, regmap,
+				    ic_data);
 	if (error)
 		return error;
 
 	return 0;
 }
 
+static const struct goodix_berlin_ic_data gt9916_data = {
+	.fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D,
+	.ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_D,
+};
+
 static const struct i2c_device_id goodix_berlin_i2c_id[] = {
-	{ "gt9916" },
+	{ .name = "gt9916", .driver_data = (long)&gt9916_data },
 	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, goodix_berlin_i2c_id);
 
 static const struct of_device_id goodix_berlin_i2c_of_match[] = {
-	{ .compatible = "goodix,gt9916", },
+	{ .compatible = "goodix,gt9916", .data = &gt9916_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, goodix_berlin_i2c_of_match);
diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
index 0662e87b8692..01f850f484c2 100644
--- a/drivers/input/touchscreen/goodix_berlin_spi.c
+++ b/drivers/input/touchscreen/goodix_berlin_spi.c
@@ -18,10 +18,14 @@
 
 #define GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN	1
 #define GOODIX_BERLIN_REGISTER_WIDTH		4
-#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN	3
-#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
+#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A	4
+#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D	3
+#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
 						 GOODIX_BERLIN_REGISTER_WIDTH + \
-						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN)
+						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A)
+#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_D	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
+						 GOODIX_BERLIN_REGISTER_WIDTH + \
+						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D)
 #define GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
 						 GOODIX_BERLIN_REGISTER_WIDTH)
 
@@ -33,6 +37,7 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
 				  size_t val_size)
 {
 	struct spi_device *spi = context;
+	const struct goodix_berlin_ic_data *ic_data = spi_get_device_match_data(spi);
 	struct spi_transfer xfers;
 	struct spi_message spi_msg;
 	const u32 *reg = reg_buf; /* reg is stored as native u32 at start of buffer */
@@ -42,23 +47,22 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
 		return -EINVAL;
 
 	u8 *buf __free(kfree) =
-		kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size,
-			GFP_KERNEL);
+		kzalloc(ic_data->read_prefix_len + val_size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	spi_message_init(&spi_msg);
 	memset(&xfers, 0, sizeof(xfers));
 
-	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
+	/* buffer format: 0xF1 + addr(4bytes) + dummy(3/4bytes) + data */
 	buf[0] = GOODIX_BERLIN_SPI_READ_FLAG;
 	put_unaligned_be32(*reg, buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN);
 	memset(buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + GOODIX_BERLIN_REGISTER_WIDTH,
-	       0xff, GOODIX_BERLIN_SPI_READ_DUMMY_LEN);
+	       0xff, ic_data->read_dummy_len);
 
 	xfers.tx_buf = buf;
 	xfers.rx_buf = buf;
-	xfers.len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size;
+	xfers.len = ic_data->read_prefix_len + val_size;
 	xfers.cs_change = 0;
 	spi_message_add_tail(&xfers, &spi_msg);
 
@@ -68,7 +72,7 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
 		return error;
 	}
 
-	memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
+	memcpy(val_buf, buf + ic_data->read_prefix_len, val_size);
 	return error;
 }
 
@@ -123,6 +127,7 @@ static const struct input_id goodix_berlin_spi_input_id = {
 
 static int goodix_berlin_spi_probe(struct spi_device *spi)
 {
+	const struct goodix_berlin_ic_data *ic_data = spi_get_device_match_data(spi);
 	struct regmap_config regmap_config;
 	struct regmap *regmap;
 	size_t max_size;
@@ -137,7 +142,7 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
 	max_size = spi_max_transfer_size(spi);
 
 	regmap_config = goodix_berlin_spi_regmap_conf;
-	regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
+	regmap_config.max_raw_read = max_size - ic_data->read_prefix_len;
 	regmap_config.max_raw_write = max_size - GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN;
 
 	regmap = devm_regmap_init(&spi->dev, NULL, spi, &regmap_config);
@@ -145,21 +150,38 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
 		return PTR_ERR(regmap);
 
 	error = goodix_berlin_probe(&spi->dev, spi->irq,
-				    &goodix_berlin_spi_input_id, regmap);
+				    &goodix_berlin_spi_input_id, regmap,
+				    ic_data);
 	if (error)
 		return error;
 
 	return 0;
 }
 
+static const struct goodix_berlin_ic_data gt9897_data = {
+	.fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A,
+	.ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_A,
+	.read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A,
+	.read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A,
+};
+
+static const struct goodix_berlin_ic_data gt9916_data = {
+	.fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D,
+	.ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_D,
+	.read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D,
+	.read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN_D,
+};
+
 static const struct spi_device_id goodix_berlin_spi_ids[] = {
-	{ "gt9916" },
+	{ .name = "gt9897", .driver_data = (long)&gt9897_data },
+	{ .name = "gt9916", .driver_data = (long)&gt9916_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, goodix_berlin_spi_ids);
 
 static const struct of_device_id goodix_berlin_spi_of_match[] = {
-	{ .compatible = "goodix,gt9916", },
+	{ .compatible = "goodix,gt9897", .data = &gt9897_data },
+	{ .compatible = "goodix,gt9916", .data = &gt9916_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, goodix_berlin_spi_of_match);
-- 
2.48.1



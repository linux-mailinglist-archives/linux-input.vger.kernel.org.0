Return-Path: <linux-input+bounces-9729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE5A261A3
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 18:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0233A1959
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 17:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BAB20E00B;
	Mon,  3 Feb 2025 17:43:45 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A820C47A;
	Mon,  3 Feb 2025 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604625; cv=none; b=HcCYFwjUTmOrf+ejRRm0ot8Yl6dW+hzoNRuOMfA/wPfivjWcNHym7V/zlkTIR/Utk21juh+gWW0qkBTEjp41mD7Sj1Z9RrnUINTCnJwESgBGZeU9dLCoKMzQfE79RSdXKf2uOts4ADSC15TmJXUc4dmsaT+gLwbGWXitc9T3CUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604625; c=relaxed/simple;
	bh=Ga7cYMuManZGLjU7L9j83OmarEqLLmEeuzqPq8LvzcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJ7EN9PUtFRZwf1oLu7kP7ujr4QKzOyDVihJTW4DPFs5NpNvN7EuU4eXl76Kdecaf2fcdw/CDcpEV/a1li1rNZwVopQW19AuP82qVb0PbedeVMAP17MJNKd4E5xSrForf/NJ27AtLT2vHAGFfIlfVpZBCuBB6T1LN2tBN/Vn7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3ba4:0:640:5b85:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id E86F4608FA;
	Mon,  3 Feb 2025 20:43:36 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id PhnTWxOOeeA0-eIPswsfo;
	Mon, 03 Feb 2025 20:43:35 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
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
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 2/2] Input: goodix_berlin - Add support for Berlin-A series
Date: Mon,  3 Feb 2025 18:43:09 +0100
Message-ID: <20250203174309.21574-3-adrian@travitia.xyz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203174309.21574-1-adrian@travitia.xyz>
References: <20250203174309.21574-1-adrian@travitia.xyz>
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

Signed-off-by: Jens Reidel <adrian@travitia.xyz>
---
 drivers/input/touchscreen/goodix_berlin.h     |  9 ++++
 .../input/touchscreen/goodix_berlin_core.c    | 27 +++++++++---
 drivers/input/touchscreen/goodix_berlin_i2c.c |  6 ++-
 drivers/input/touchscreen/goodix_berlin_spi.c | 44 +++++++++++++++----
 4 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
index 38b6f9ddbdef..a5232e58c166 100644
--- a/drivers/input/touchscreen/goodix_berlin.h
+++ b/drivers/input/touchscreen/goodix_berlin.h
@@ -12,6 +12,15 @@
 
 #include <linux/pm.h>
 
+enum goodix_berlin_ic_type {
+	IC_TYPE_BERLIN_A,
+	IC_TYPE_BERLIN_D,
+};
+
+struct goodix_berlin_ic_data {
+	enum goodix_berlin_ic_type ic_type;
+};
+
 struct device;
 struct input_id;
 struct regmap;
diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index 3fc03cf0ca23..b892ab901d64 100644
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
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sizes.h>
@@ -54,9 +55,11 @@
 #define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
 #define GOODIX_BERLIN_BOOTOPTION_ADDR		0x10000
 #define GOODIX_BERLIN_FW_VERSION_INFO_ADDR	0x10014
+#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A	0x1000C
 
 #define GOODIX_BERLIN_IC_INFO_MAX_LEN		SZ_1K
 #define GOODIX_BERLIN_IC_INFO_ADDR		0x10070
+#define GOODIX_BERLIN_IC_INFO_ADDR_A		0x10068
 
 #define GOODIX_BERLIN_CHECKSUM_SIZE		sizeof(u16)
 
@@ -297,9 +300,16 @@ static void goodix_berlin_power_off(struct goodix_berlin_core *cd)
 
 static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
 {
+	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(cd->dev);
+	int fw_version_info_addr;
 	int error;
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADDR,
+	if (ic_data->ic_type == IC_TYPE_BERLIN_A)
+		fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A;
+	else
+		fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR;
+
+	error = regmap_raw_read(cd->regmap, fw_version_info_addr,
 				&cd->fw_version, sizeof(cd->fw_version));
 	if (error) {
 		dev_err(cd->dev, "error reading fw version, %d\n", error);
@@ -358,16 +368,23 @@ static int goodix_berlin_parse_ic_info(struct goodix_berlin_core *cd,
 
 static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
 {
+	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(cd->dev);
 	u8 *afe_data __free(kfree) = NULL;
 	__le16 length_raw;
 	u16 length;
+	int ic_info_addr;
 	int error;
 
+	if (ic_data->ic_type == IC_TYPE_BERLIN_A)
+		ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_A;
+	else
+		ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR;
+
 	afe_data = kzalloc(GOODIX_BERLIN_IC_INFO_MAX_LEN, GFP_KERNEL);
 	if (!afe_data)
 		return -ENOMEM;
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
+	error = regmap_raw_read(cd->regmap, ic_info_addr,
 				&length_raw, sizeof(length_raw));
 	if (error) {
 		dev_err(cd->dev, "failed get ic info length, %d\n", error);
@@ -380,7 +397,7 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
 		return -EINVAL;
 	}
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
+	error = regmap_raw_read(cd->regmap, ic_info_addr,
 				afe_data, length);
 	if (error) {
 		dev_err(cd->dev, "failed get ic info data, %d\n", error);
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
index ad7a60d94338..b3fd063b4242 100644
--- a/drivers/input/touchscreen/goodix_berlin_i2c.c
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -53,8 +53,12 @@ static const struct i2c_device_id goodix_berlin_i2c_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, goodix_berlin_i2c_id);
 
+static const struct goodix_berlin_ic_data gt9916_data = {
+	.ic_type = IC_TYPE_BERLIN_D,
+};
+
 static const struct of_device_id goodix_berlin_i2c_of_match[] = {
-	{ .compatible = "goodix,gt9916", },
+	{ .compatible = "goodix,gt9916", .data = &gt9916_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, goodix_berlin_i2c_of_match);
diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
index 0662e87b8692..f48f11a76b6d 100644
--- a/drivers/input/touchscreen/goodix_berlin_spi.c
+++ b/drivers/input/touchscreen/goodix_berlin_spi.c
@@ -10,6 +10,7 @@
 #include <linux/unaligned.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <linux/input.h>
@@ -19,9 +20,13 @@
 #define GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN	1
 #define GOODIX_BERLIN_REGISTER_WIDTH		4
 #define GOODIX_BERLIN_SPI_READ_DUMMY_LEN	3
+#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A	4
 #define GOODIX_BERLIN_SPI_READ_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
 						 GOODIX_BERLIN_REGISTER_WIDTH + \
 						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN)
+#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
+						 GOODIX_BERLIN_REGISTER_WIDTH + \
+						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A)
 #define GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
 						 GOODIX_BERLIN_REGISTER_WIDTH)
 
@@ -33,32 +38,41 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
 				  size_t val_size)
 {
 	struct spi_device *spi = context;
+	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(&spi->dev);
 	struct spi_transfer xfers;
 	struct spi_message spi_msg;
 	const u32 *reg = reg_buf; /* reg is stored as native u32 at start of buffer */
+	ssize_t read_prefix_len, read_dummy_len;
 	int error;
 
+	if (ic_data->ic_type == IC_TYPE_BERLIN_A) {
+		read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A;
+		read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A;
+	} else {
+		read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
+		read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN;
+	}
+
 	if (reg_size != GOODIX_BERLIN_REGISTER_WIDTH)
 		return -EINVAL;
 
 	u8 *buf __free(kfree) =
-		kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size,
-			GFP_KERNEL);
+		kzalloc(read_prefix_len + val_size, GFP_KERNEL);
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
+	       0xff, read_dummy_len);
 
 	xfers.tx_buf = buf;
 	xfers.rx_buf = buf;
-	xfers.len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size;
+	xfers.len = read_prefix_len + val_size;
 	xfers.cs_change = 0;
 	spi_message_add_tail(&xfers, &spi_msg);
 
@@ -68,7 +82,7 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
 		return error;
 	}
 
-	memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
+	memcpy(val_buf, buf + read_prefix_len, val_size);
 	return error;
 }
 
@@ -123,6 +137,7 @@ static const struct input_id goodix_berlin_spi_input_id = {
 
 static int goodix_berlin_spi_probe(struct spi_device *spi)
 {
+	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(&spi->dev);
 	struct regmap_config regmap_config;
 	struct regmap *regmap;
 	size_t max_size;
@@ -137,7 +152,10 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
 	max_size = spi_max_transfer_size(spi);
 
 	regmap_config = goodix_berlin_spi_regmap_conf;
-	regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
+	if (ic_data->ic_type == IC_TYPE_BERLIN_A)
+		regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A;
+	else
+		regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
 	regmap_config.max_raw_write = max_size - GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN;
 
 	regmap = devm_regmap_init(&spi->dev, NULL, spi, &regmap_config);
@@ -153,13 +171,23 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id goodix_berlin_spi_ids[] = {
+	{ "gt9897" },
 	{ "gt9916" },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, goodix_berlin_spi_ids);
 
+static const struct goodix_berlin_ic_data gt9897_data = {
+	.ic_type = IC_TYPE_BERLIN_A,
+};
+
+static const struct goodix_berlin_ic_data gt9916_data = {
+	.ic_type = IC_TYPE_BERLIN_D,
+};
+
 static const struct of_device_id goodix_berlin_spi_of_match[] = {
-	{ .compatible = "goodix,gt9916", },
+	{ .compatible = "goodix,gt9897", .data = &gt9897_data },
+	{ .compatible = "goodix,gt9916", .data = &gt9916_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, goodix_berlin_spi_of_match);
-- 
2.48.1



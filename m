Return-Path: <linux-input+bounces-10029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1665A3563B
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 06:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2303D7A3CE6
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 05:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC19618CC15;
	Fri, 14 Feb 2025 05:30:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9187418BBBB;
	Fri, 14 Feb 2025 05:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739511019; cv=none; b=vBrK0kOySfBiJlGkzElczQng5V7zcifUZ82Uk+NrUElyP2Ci1OmeYF7xtOfRLlqJlf2qdmaM2P0vSJ10DbfO6/2GGtQZbKGpBWZup3i0O6qDWA/b4szDpr4bWyFYWWzdxnXnDe4mFSGl6id77Zp2aLg+mf3T8r7vSBruDJb3c1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739511019; c=relaxed/simple;
	bh=GnnIU2g5Q/b+SC5krhcY37z+aYNNrKQCvvcAKc2v6Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWFkpbijSUMtitB6TjBuxM1Qj/BMrEWkfPmzVuSgqO4KzLebNMaBti9uGpVA0Xg449hqRLLatiu0u3V8XdYmSrwmpCCN7Xs+8l3Mr2EdMQUjgvYZOxEzkqGPXalEZjOkK5vkQxbUxt7AwTnPtN371KAAcQGDgVI0ZmSx4gwcGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c10:2d9f:0:640:f6ce:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id C783A60964;
	Fri, 14 Feb 2025 08:30:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 5UJF7UBMgqM0-L03ZfJmy;
	Fri, 14 Feb 2025 08:30:12 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass
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
Subject: [PATCH v2 2/2] Input: goodix_berlin - Add support for Berlin-A series
Date: Fri, 14 Feb 2025 06:29:59 +0100
Message-ID: <20250214052959.222668-3-adrian@travitia.xyz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214052959.222668-1-adrian@travitia.xyz>
References: <20250214052959.222668-1-adrian@travitia.xyz>
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
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/input/touchscreen/goodix_berlin.h     | 13 ++++++
 .../input/touchscreen/goodix_berlin_core.c    | 15 ++++---
 drivers/input/touchscreen/goodix_berlin_i2c.c |  9 +++-
 drivers/input/touchscreen/goodix_berlin_spi.c | 45 ++++++++++++++-----
 4 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
index 38b6f9ddbdef..b186a7fb3586 100644
--- a/drivers/input/touchscreen/goodix_berlin.h
+++ b/drivers/input/touchscreen/goodix_berlin.h
@@ -12,6 +12,19 @@
 
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
diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index 3fc03cf0ca23..f9fbde63ab52 100644
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
 
@@ -297,9 +296,10 @@ static void goodix_berlin_power_off(struct goodix_berlin_core *cd)
 
 static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
 {
+	const struct goodix_berlin_ic_data *ic_data = device_get_match_data(cd->dev);
 	int error;
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADDR,
+	error = regmap_raw_read(cd->regmap, ic_data->fw_version_info_addr,
 				&cd->fw_version, sizeof(cd->fw_version));
 	if (error) {
 		dev_err(cd->dev, "error reading fw version, %d\n", error);
@@ -358,6 +358,7 @@ static int goodix_berlin_parse_ic_info(struct goodix_berlin_core *cd,
 
 static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
 {
+	const struct goodix_berlin_ic_data *ic_data = device_get_match_data(cd->dev);
 	u8 *afe_data __free(kfree) = NULL;
 	__le16 length_raw;
 	u16 length;
@@ -367,7 +368,7 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
 	if (!afe_data)
 		return -ENOMEM;
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
+	error = regmap_raw_read(cd->regmap, ic_data->ic_info_addr,
 				&length_raw, sizeof(length_raw));
 	if (error) {
 		dev_err(cd->dev, "failed get ic info length, %d\n", error);
@@ -380,7 +381,7 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
 		return -EINVAL;
 	}
 
-	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
+	error = regmap_raw_read(cd->regmap, ic_data->ic_info_addr,
 				afe_data, length);
 	if (error) {
 		dev_err(cd->dev, "failed get ic info data, %d\n", error);
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
index ad7a60d94338..7db234c74db8 100644
--- a/drivers/input/touchscreen/goodix_berlin_i2c.c
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -46,15 +46,20 @@ static int goodix_berlin_i2c_probe(struct i2c_client *client)
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
index 0662e87b8692..a5e77e6585e8 100644
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
@@ -152,14 +157,30 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
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



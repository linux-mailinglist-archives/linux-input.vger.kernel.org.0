Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B8E1722FC
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 17:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgB0QQD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 11:16:03 -0500
Received: from hermes.aosc.io ([199.195.250.187]:55143 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728059AbgB0QQD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 11:16:03 -0500
X-Greylist: delayed 440 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Feb 2020 11:16:02 EST
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id AFE494B2ED;
        Thu, 27 Feb 2020 16:09:10 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 2/3] Input: goodix - use string-based chip ID
Date:   Fri, 28 Feb 2020 00:08:01 +0800
Message-Id: <20200227160802.7043-3-icenowy@aosc.io>
In-Reply-To: <20200227160802.7043-1-icenowy@aosc.io>
References: <20200227160802.7043-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1582819756;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=0iDpNGq6IRp8gcDFfkwBhK68bKjQJBn92umR+xGbvCg=;
        b=Co6bzQ6FiD5JH6Gd/UbVp/L8hASBcHWNrb5syERRx6Hf/ssVEyGUmM/KA5CR1QdvdQC/we
        CbCWsxfC3Cz0NgfW+G5jlezSM3Zkk94MzFk7ZAQyXRMW/ZVT+3tbTHeXdNOqVB/PKDLYBi
        hXHP2+oE2sei26oD67VLUnOP6WD9uTo=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For Goodix GT917S chip, the chip ID string is "917S", which contains not
only numbers now.

Use string-based chip ID in the driver to support this chip and further
chips with alphanumber ID.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Used a table to save ID and chip data info.
- Use strscpy().

 drivers/input/touchscreen/goodix.c | 61 +++++++++++++++++-------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 0403102e807e..dde85b894ca4 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -37,6 +37,11 @@ struct goodix_chip_data {
 	int (*check_config)(struct goodix_ts_data *, const struct firmware *);
 };
 
+struct goodix_chip_id {
+	const char *id;
+	const struct goodix_chip_data *data;
+};
+
 struct goodix_ts_data {
 	struct i2c_client *client;
 	struct input_dev *input_dev;
@@ -48,7 +53,7 @@ struct goodix_ts_data {
 	struct regulator *vddio;
 	struct gpio_desc *gpiod_int;
 	struct gpio_desc *gpiod_rst;
-	u16 id;
+	char id[5];
 	u16 version;
 	const char *cfg_name;
 	struct completion firmware_loading_complete;
@@ -115,6 +120,22 @@ static const struct goodix_chip_data gt9x_chip_data = {
 	.check_config		= goodix_check_cfg_8,
 };
 
+static const struct goodix_chip_id goodix_chip_ids[] = {
+	{ .id = "1151", .data = &gt1x_chip_data },
+	{ .id = "5663", .data = &gt1x_chip_data },
+	{ .id = "5688", .data = &gt1x_chip_data },
+
+	{ .id = "911", .data = &gt911_chip_data },
+	{ .id = "9271", .data = &gt911_chip_data },
+	{ .id = "9110", .data = &gt911_chip_data },
+	{ .id = "927", .data = &gt911_chip_data },
+	{ .id = "928", .data = &gt911_chip_data },
+
+	{ .id = "912", .data = &gt967_chip_data },
+	{ .id = "967", .data = &gt967_chip_data },
+	{ }
+};
+
 static const unsigned long goodix_irq_flags[] = {
 	IRQ_TYPE_EDGE_RISING,
 	IRQ_TYPE_EDGE_FALLING,
@@ -235,28 +256,16 @@ static int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value)
 	return goodix_i2c_write(client, reg, &value, sizeof(value));
 }
 
-static const struct goodix_chip_data *goodix_get_chip_data(u16 id)
+static const struct goodix_chip_data *goodix_get_chip_data(const char *id)
 {
-	switch (id) {
-	case 1151:
-	case 5663:
-	case 5688:
-		return &gt1x_chip_data;
-
-	case 911:
-	case 9271:
-	case 9110:
-	case 927:
-	case 928:
-		return &gt911_chip_data;
-
-	case 912:
-	case 967:
-		return &gt967_chip_data;
-
-	default:
-		return &gt9x_chip_data;
+	unsigned int i;
+
+	for (i = 0; goodix_chip_ids[i].id; i++) {
+		if (!strcmp(goodix_chip_ids[i].id, id))
+			return goodix_chip_ids[i].data;
 	}
+
+	return &gt9x_chip_data;
 }
 
 static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
@@ -673,12 +682,11 @@ static int goodix_read_version(struct goodix_ts_data *ts)
 
 	memcpy(id_str, buf, 4);
 	id_str[4] = 0;
-	if (kstrtou16(id_str, 10, &ts->id))
-		ts->id = 0x1001;
+	strscpy(ts->id, id_str, 5);
 
 	ts->version = get_unaligned_le16(&buf[4]);
 
-	dev_info(&ts->client->dev, "ID %d, version: %04x\n", ts->id,
+	dev_info(&ts->client->dev, "ID %s, version: %04x\n", ts->id,
 		 ts->version);
 
 	return 0;
@@ -736,7 +744,8 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	ts->input_dev->phys = "input/ts";
 	ts->input_dev->id.bustype = BUS_I2C;
 	ts->input_dev->id.vendor = 0x0416;
-	ts->input_dev->id.product = ts->id;
+	if (kstrtou16(ts->id, 10, &ts->input_dev->id.product))
+		ts->input_dev->id.product = 0x1001;
 	ts->input_dev->id.version = ts->version;
 
 	/* Capacitive Windows/Home button on some devices */
@@ -915,7 +924,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 	if (ts->gpiod_int && ts->gpiod_rst) {
 		/* update device config */
 		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
-					      "goodix_%d_cfg.bin", ts->id);
+					      "goodix_%s_cfg.bin", ts->id);
 		if (!ts->cfg_name)
 			return -ENOMEM;
 
-- 
2.24.1


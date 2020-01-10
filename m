Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DE51373C1
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 17:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbgAJQej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 11:34:39 -0500
Received: from hermes.aosc.io ([199.195.250.187]:50548 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728494AbgAJQej (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 11:34:39 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 73CE846F48;
        Fri, 10 Jan 2020 16:27:29 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 2/3] Input: goodix - use string-based chip ID
Date:   Sat, 11 Jan 2020 00:26:07 +0800
Message-Id: <20200110162608.1066397-3-icenowy@aosc.io>
In-Reply-To: <20200110162608.1066397-1-icenowy@aosc.io>
References: <20200110162608.1066397-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1578673658;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=Ai8vKwQmojc8dFI43W6cKcPsNNFMQ/agmFABSU1F9Tg=;
        b=n09rdI7uB1yu/27yhd5KA7gsXqO1ybaE1os1lsan0+CweYb7AmicFwZcdoo4vM81aoJlH6
        TCrjMjqq3aHdtLOqHnk0X8efhq+lJ1rWfhi/WiwHBQOD1z/vCPLFQmctCwNXTPnHBs3AeD
        HEwzowQodSLdUCwHc0AFzbUX7mzwfpE=
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
 drivers/input/touchscreen/goodix.c | 39 ++++++++++++++----------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 0403102e807e..bfd067d7145e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -48,7 +48,7 @@ struct goodix_ts_data {
 	struct regulator *vddio;
 	struct gpio_desc *gpiod_int;
 	struct gpio_desc *gpiod_rst;
-	u16 id;
+	char id[5];
 	u16 version;
 	const char *cfg_name;
 	struct completion firmware_loading_complete;
@@ -235,28 +235,25 @@ static int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value)
 	return goodix_i2c_write(client, reg, &value, sizeof(value));
 }
 
-static const struct goodix_chip_data *goodix_get_chip_data(u16 id)
+static const struct goodix_chip_data *goodix_get_chip_data(const char *id)
 {
-	switch (id) {
-	case 1151:
-	case 5663:
-	case 5688:
+	if (!strcmp(id, "1151") ||
+	    !strcmp(id, "5663") ||
+	    !strcmp(id, "5688"))
 		return &gt1x_chip_data;
 
-	case 911:
-	case 9271:
-	case 9110:
-	case 927:
-	case 928:
+	if (!strcmp(id, "911") ||
+	    !strcmp(id, "9271") ||
+	    !strcmp(id, "9110") ||
+	    !strcmp(id, "927") ||
+	    !strcmp(id, "928"))
 		return &gt911_chip_data;
 
-	case 912:
-	case 967:
+	if (!strcmp(id, "912") ||
+	    !strcmp(id, "967"))
 		return &gt967_chip_data;
 
-	default:
-		return &gt9x_chip_data;
-	}
+	return &gt9x_chip_data;
 }
 
 static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
@@ -673,12 +670,11 @@ static int goodix_read_version(struct goodix_ts_data *ts)
 
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
@@ -736,7 +732,8 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	ts->input_dev->phys = "input/ts";
 	ts->input_dev->id.bustype = BUS_I2C;
 	ts->input_dev->id.vendor = 0x0416;
-	ts->input_dev->id.product = ts->id;
+	if (kstrtou16(ts->id, 10, &ts->input_dev->id.product))
+		ts->input_dev->id.product = 0x1001;
 	ts->input_dev->id.version = ts->version;
 
 	/* Capacitive Windows/Home button on some devices */
@@ -915,7 +912,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 	if (ts->gpiod_int && ts->gpiod_rst) {
 		/* update device config */
 		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
-					      "goodix_%d_cfg.bin", ts->id);
+					      "goodix_%s_cfg.bin", ts->id);
 		if (!ts->cfg_name)
 			return -ENOMEM;
 
-- 
2.23.0


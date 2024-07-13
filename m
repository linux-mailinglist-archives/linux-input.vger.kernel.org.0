Return-Path: <linux-input+bounces-5024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B5C93062A
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 17:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4955E1F21B9F
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 15:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C3213BAFE;
	Sat, 13 Jul 2024 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="iYeWP0Of"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF843D3B3;
	Sat, 13 Jul 2024 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720884516; cv=none; b=egFwrO75kDjon7EvPvQs1z3gPu7GNJJgc/5KLb3vlffrkv6yITEdRanFK4/9vxnHN8Sy90+mbaQYma4mNVgdV13CBosz86qDnKqvKOFT0i5LLw0ekwvUqPK9PKPmVrBSBmp9jlwyHY5pQKGw4UPoZVJy9mlpQ7Vws9YJ32toEDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720884516; c=relaxed/simple;
	bh=NHNv5hzxTobQL52F93BEiNiFlkGOz0ZfeaLUaBByllI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zwep8AqOJlEnIS2ta/AcGJD1w2NV5n938WpoJE081nO7DoJt8z5OoxMf8I07KdbXgkDfQZnTXmBujrzdHS7vJnirA1ig66RDDc7lOrfQHbZLRgb2kU9BTBSYR7L7cYrFznfeJ0aRDgVNN0xHOJeq4Tw/HvvKBys7JO0c2lg+db0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=iYeWP0Of; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id AA48442839;
	Sat, 13 Jul 2024 20:28:31 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720884512; bh=NHNv5hzxTobQL52F93BEiNiFlkGOz0ZfeaLUaBByllI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iYeWP0OfkZ0s86TliCz/ylMCJspay2OAhMFq4PuvgldfrgNHviWZFZWzl6dgvKZpJ
	 WDIW8PWcaNbeHGPM/M9NWQ1ceqQhNydVt/LQ4ZtQby/F5IK2ybbG3LCrS/tPlRijZT
	 Y3X9qBU0W8N3VEX00nqxMPZTqT1iFBPoa6Uj9/57Xx9DZDAWXnoxn1VhLOVPDONxgN
	 1e/XCq8MyW+G/Q9ZuH3d3ikOSiGUQQtSb12QSaNbCoqpm/bHtKS9paL4vDo0zi+HpS
	 6eD1GPqexaGVZ1mtbY7CcCKSz8Ryjy+FWbA4p6/NPiUpoXnGpCbFVq0nJtaqLoKe6V
	 K0IpjYEYH+rkw==
From: Nikita Travkin <nikita@trvn.ru>
Date: Sat, 13 Jul 2024 20:28:09 +0500
Subject: [PATCH RESEND v4 2/2] input: zinitix: Add touchkey support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240713-zinitix-tkey-v4-2-14b7e2d5ace3@trvn.ru>
References: <20240713-zinitix-tkey-v4-0-14b7e2d5ace3@trvn.ru>
In-Reply-To: <20240713-zinitix-tkey-v4-0-14b7e2d5ace3@trvn.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=5056; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=NHNv5hzxTobQL52F93BEiNiFlkGOz0ZfeaLUaBByllI=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmkp0diiYmR3YPhA9A3Dz2n2/ulop/yZfDoEDTC
 qhjoWCJ07WJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpKdHQAKCRBDHOzuKBm/
 dR1/D/9Qgo+t6bewoAG4XmRrNl37+Ps78pUpX1jvpzrL43YSKDQHlTZOhFTCmoib7h0F7uk4LrI
 T8tPLi9RAcFtk22P3nEiV9DBRR6UQ8l2JlziYevmsPHKcBjmU1HxDR9IjQ9L2CJlIWkf5Y8rrzf
 aBwoyfUaoLOKt4QR40IAadLDi+XEZmRYx3+zz1Im2AIfS380cVd5oNsDfp+xJHGEwkq2inymOrI
 1+vwrqd+UGylaMq9qI36GzxupQUAE6WBgxMxKT9ccELjUl95fyrUQQ8/Yu1dE3k83Q8vbQvagPj
 RVZS5rkvzx/NptCaznqRnS1FwJuPbIUtubmfS9444cQjo/sMkT/JFtkekI9To9YqqZeEJuqfQzw
 uGGyMeKMm1W34Z4jZ9+od0fUY0cDp2qGgj8caIyBpgAcTdaCwKR0lg4uitbgD9NOlmzC44jCaFo
 C5z0HM9nINU3K+Qihn7Y6VuZHOuzDOsg1cl3Z2BWOfVZBZfb8717aGHwY3j8chzLEd1qLkOurf6
 UbwZ2P11nbsrnktr16FNbYVWy1sB251kATn9zNB8svaUdNNwQ0qx93GqADJGYZ4jrRws42G0c1q
 psFzgKAJ6H5092xrK6hujSIfsmc+FOqAGoBIvi9ibtBgOAF2C/enRfcz+eLc0zoTdMsabHE5d+E
 iHkyRvuvB+3LYSQ==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Zinitix touch controllers can use some of the sense lines for virtual
keys (like those found on many phones). Add support for those keys.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 drivers/input/touchscreen/zinitix.c | 61 +++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 1b4807ba4624..75390d67689e 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -119,6 +119,7 @@
 
 #define DEFAULT_TOUCH_POINT_MODE		2
 #define MAX_SUPPORTED_FINGER_NUM		5
+#define MAX_SUPPORTED_BUTTON_NUM		8
 
 #define CHIP_ON_DELAY				15 // ms
 #define FIRMWARE_ON_DELAY			40 // ms
@@ -146,6 +147,8 @@ struct bt541_ts_data {
 	struct touchscreen_properties prop;
 	struct regulator_bulk_data supplies[2];
 	u32 zinitix_mode;
+	u32 keycodes[MAX_SUPPORTED_BUTTON_NUM];
+	int num_keycodes;
 };
 
 static int zinitix_read_data(struct i2c_client *client,
@@ -195,6 +198,7 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	struct i2c_client *client = bt541->client;
 	int i;
 	int error;
+	u16 int_flags = 0;
 
 	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
 	if (error) {
@@ -225,6 +229,11 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	if (error)
 		return error;
 
+	error = zinitix_write_u16(client, ZINITIX_BUTTON_SUPPORTED_NUM,
+				  bt541->num_keycodes);
+	if (error)
+		return error;
+
 	error = zinitix_write_u16(client, ZINITIX_INITIAL_TOUCH_MODE,
 				  bt541->zinitix_mode);
 	if (error)
@@ -235,9 +244,12 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	if (error)
 		return error;
 
-	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG,
-				  BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE |
-					BIT_UP);
+	int_flags = BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE | BIT_UP;
+
+	if (bt541->num_keycodes)
+		int_flags |= BIT_ICON_EVENT;
+
+	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, int_flags);
 	if (error)
 		return error;
 
@@ -350,6 +362,15 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
 	}
 }
 
+static void zinitix_report_keys(struct bt541_ts_data *bt541, u16 icon_events)
+{
+	int i;
+
+	for (i = 0; i < bt541->num_keycodes; i++)
+		input_report_key(bt541->input_dev,
+				 bt541->keycodes[i], !!(icon_events & BIT(i)));
+}
+
 static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 {
 	struct bt541_ts_data *bt541 = bt541_handler;
@@ -358,6 +379,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	unsigned long finger_mask;
 	int error;
 	int i;
+	__le16 icon_events = 0;
 
 	memset(&touch_event, 0, sizeof(struct touch_event));
 
@@ -368,6 +390,17 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 		goto out;
 	}
 
+	if (le16_to_cpu(touch_event.status) & BIT_ICON_EVENT) {
+		error = zinitix_read_data(bt541->client, ZINITIX_ICON_STATUS_REG,
+					  &icon_events, sizeof(icon_events));
+		if (error) {
+			dev_err(&client->dev, "Failed to read icon events\n");
+			goto out;
+		}
+
+		zinitix_report_keys(bt541, le16_to_cpu(icon_events));
+	}
+
 	finger_mask = touch_event.finger_mask;
 	for_each_set_bit(i, &finger_mask, MAX_SUPPORTED_FINGER_NUM) {
 		const struct point_coord *p = &touch_event.point_coord[i];
@@ -453,6 +486,7 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
 {
 	struct input_dev *input_dev;
 	int error;
+	int i;
 
 	input_dev = devm_input_allocate_device(&bt541->client->dev);
 	if (!input_dev) {
@@ -470,6 +504,14 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
 	input_dev->open = zinitix_input_open;
 	input_dev->close = zinitix_input_close;
 
+	if (bt541->num_keycodes) {
+		input_dev->keycode = bt541->keycodes;
+		input_dev->keycodemax = bt541->num_keycodes;
+		input_dev->keycodesize = sizeof(bt541->keycodes[0]);
+		for (i = 0; i < bt541->num_keycodes; i++)
+			input_set_capability(input_dev, EV_KEY, bt541->keycodes[i]);
+	}
+
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
 	input_set_abs_params(input_dev, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
@@ -534,6 +576,19 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return error;
 	}
 
+	bt541->num_keycodes = of_property_read_variable_u32_array(
+					client->dev.of_node, "linux,keycodes",
+					bt541->keycodes, 0,
+					ARRAY_SIZE(bt541->keycodes));
+	if (bt541->num_keycodes == -EINVAL) {
+		bt541->num_keycodes = 0;
+	} else if (bt541->num_keycodes < 0) {
+		dev_err(&client->dev,
+			"Unable to parse \"linux,keycodes\" property: %d\n",
+			bt541->num_keycodes);
+		return bt541->num_keycodes;
+	}
+
 	error = zinitix_init_input_dev(bt541);
 	if (error) {
 		dev_err(&client->dev,

-- 
2.45.2



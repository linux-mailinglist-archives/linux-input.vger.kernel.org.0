Return-Path: <linux-input+bounces-5072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ADC933E0A
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 15:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F4E28484D
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 13:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B04180A98;
	Wed, 17 Jul 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="W0Uia3v4"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE9180053;
	Wed, 17 Jul 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224562; cv=none; b=DQ9t9/1WI6FKtBZwoLiU6ep8ti9SlOb5wIhzn0tiJsevHmNEuahjCZUKxeroLs1zNQbTXjZ5Fd3FyArl46fmSxEenAcUuel89AV/44Xber0gUzX2nYgIPX8JJ7MUKTIKV91JEvu75y1mD/JampYBn7hqIhBTPnflozXvQOvBVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224562; c=relaxed/simple;
	bh=t6zNy31B64DMsjtCyfWmRr63vBv9RmhXGUzzvZfhK3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1NTeAQRV1QEbmighSt4AkhnkwiIWynBAWAT/1ASrK0yN5DU+Nqs9pbtwBQa8htUJhcApOq2D85gaqAhKJrM2p1f6ofidhKWZI+ToG8RAMALV2HwPMCMBVUWPntbzAE466oo7VsHjaNqz63vxLv4M6WLCo78udnj5BLd0VjWNyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=W0Uia3v4; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 99D5A427AB;
	Wed, 17 Jul 2024 18:55:48 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721224549; bh=t6zNy31B64DMsjtCyfWmRr63vBv9RmhXGUzzvZfhK3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W0Uia3v4cNYqDP0OVrcgjszuWL6h6pCvTtBMCltanwNmgEWyW3wr7jqLXtTW4KfTi
	 RqTJlbnz8iGmqI3u/GijAj86aRe2Eg13sm0dVD6mAfrEoXaGDgm1KjX6eMHyVOvqR3
	 s7f8gp4eLeq3M57yn7EkEqXb9bRss1gzKsM+4B5GkL5H3WYounfSkjurz9w813z13v
	 SIPHz9rSN2jZRgXzbgGrR3ftIkI2x6lIF6KsnCDPnN9EmtlS1K/zP8GP763JrjCZ0+
	 E8sVRIAN3mNaLhe91bH0cMIaL3k+V5TktEr9r6v/ieDu+74MvThmgACXAeqvpvmZoY
	 RJDSdAm7PXFPQ==
From: Nikita Travkin <nikita@trvn.ru>
Date: Wed, 17 Jul 2024 18:55:34 +0500
Subject: [PATCH v5 2/2] input: zinitix: Add touchkey support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-zinitix-tkey-v5-2-52ea4cd4bd50@trvn.ru>
References: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
In-Reply-To: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5266; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=t6zNy31B64DMsjtCyfWmRr63vBv9RmhXGUzzvZfhK3k=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBml81dMatw8vJZHUXQB87T4OPu5FkSHEPE19K0t
 Ob+2mqTpkOJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpfNXQAKCRBDHOzuKBm/
 dWIvD/4hJCrUcoGESEsJa/BAmnOINsP8q3C0pPvBN47RVu8P3C8vN92+LJIgO2iXaFzUZST+9CZ
 lBczJY+jtHAbNgnCm58MMgxEOHdo2IMD949qm1potydOIy+8ywOBA4/ww8brd6NSrGJPu3BpQ5J
 dMIAVKG4niFpeYJR3BxmiER4+MHPbZZzfNITDpNttA30ZHxA5iqf7J45qACkOXmokrLwsNq+kF7
 XbJB0pwc4V6H+ky1dr+efzPWtvPvbj+AZXENIaZsPetc7E6ayDDiz4XsnOL/s9xELBXcPAejavG
 wNMnTeg0F+FsArnTB/vIG/Ws95DZu/IMtGVaaynFJPx6Wj8vfKxGPBtlZO2Y1B6UeFEKdLQA9Z8
 Ce3JV4e6FGCR06SiwpmKLqJRNd2pdJMatBKMOqM3h7MyaRBHtb2sbkmIl2M5HneeOtqbv9D15Nc
 WeQQ9TQZMSTSCofjEJ+EKJcnEa9FI6eeEj5pGORR5VMU1oPkHrbrLjs5pUCf3CH0GMZB+SSHUjz
 va1kNUPFNAwdKLL3MdWHbYjvwP70Bmf3drUMC4rmhUsDti4yijdsbpLuY8fijsX0rwpf54rhHGc
 Uez9XctyDIJd/6DBC6XK1ktszS44iUQLWHo7j02pRaCvyaLx8fgoAcHx3jP7MC7otlVkz97on15
 agOiDxSZqPfk9rg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Zinitix touch controllers can use some of the sense lines for virtual
keys (like those found on many phones). Add support for those keys.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 drivers/input/touchscreen/zinitix.c | 63 +++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 1b4807ba4624..1df93c96f6bf 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -119,6 +120,7 @@
 
 #define DEFAULT_TOUCH_POINT_MODE		2
 #define MAX_SUPPORTED_FINGER_NUM		5
+#define MAX_SUPPORTED_BUTTON_NUM		8
 
 #define CHIP_ON_DELAY				15 // ms
 #define FIRMWARE_ON_DELAY			40 // ms
@@ -146,6 +148,8 @@ struct bt541_ts_data {
 	struct touchscreen_properties prop;
 	struct regulator_bulk_data supplies[2];
 	u32 zinitix_mode;
+	u32 keycodes[MAX_SUPPORTED_BUTTON_NUM];
+	int num_keycodes;
 };
 
 static int zinitix_read_data(struct i2c_client *client,
@@ -195,6 +199,7 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	struct i2c_client *client = bt541->client;
 	int i;
 	int error;
+	u16 int_flags;
 
 	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
 	if (error) {
@@ -225,6 +230,11 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
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
@@ -235,9 +245,11 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	if (error)
 		return error;
 
-	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG,
-				  BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE |
-					BIT_UP);
+	int_flags = BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE | BIT_UP;
+	if (bt541->num_keycodes)
+		int_flags |= BIT_ICON_EVENT;
+
+	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, int_flags);
 	if (error)
 		return error;
 
@@ -350,12 +362,22 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
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
 	struct i2c_client *client = bt541->client;
 	struct touch_event touch_event;
 	unsigned long finger_mask;
+	__le16 icon_events;
 	int error;
 	int i;
 
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
@@ -534,6 +576,21 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return error;
 	}
 
+	bt541->num_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
+	if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
+		dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
+		return -EINVAL;
+	}
+
+	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
+					       bt541->keycodes,
+					       bt541->num_keycodes);
+	if (error) {
+		dev_err(&client->dev,
+			"Unable to parse \"linux,keycodes\" property: %d\n", error);
+		return error;
+	}
+
 	error = zinitix_init_input_dev(bt541);
 	if (error) {
 		dev_err(&client->dev,

-- 
2.45.2



Return-Path: <linux-input+bounces-16579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E182CBDD50
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 13:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DFD63037891
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 12:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE86C21B185;
	Mon, 15 Dec 2025 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LryNsyYC"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553621146C;
	Mon, 15 Dec 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801833; cv=pass; b=RGbnrYecthoFLypD3AYeQtw3yYSmrojRdnU5Rzk4FYZy54KYBjDpL7KGt8OXC91AgPFhQxlkXhe/G6xg5nBbldCROPCy1lMfOY+PAeNb+rPam1gHOiIG0h7cQdrTTC5K9ZfMAAaLTAHC9dAHnpQUIq76UNMegmTValFc0LK/34Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801833; c=relaxed/simple;
	bh=7C6Q3SSN+d7+kzGDmCPbKwmMa1GEa0w+hl6HzzkS/c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PaittQY3oeaK+w5hd9sX6Of1+7d2lYzjpWEHYxyWESUR0WCmCYqgf1yymguDMFcUWRdQYd92pxCEEs+vepFq7/P0U1v1q53ZkjEOK9kmXKXWZ3xV/RfJTWEl2vL/0+0yv9mhTYelm1FoWO5EdCzr9TJY6NI9mL9/2BuE6Xhaibw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LryNsyYC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765801801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CvR3Zn1MaPwq2vkBfl9IUi21oYWD3iMXyRi2x3ycVcs7QCkMYrBmIoAlirl8czz3rf3HLs5/Rwm4rlbkf7/JYJAGMV9er2u7buC43/Cr+wP0ZbK/nf/RdQ9cBZ1JoaqHRqG+rGGpTzEv1c5LYQu3sZ33bKUj5+3kb1mlrHlrfFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765801801; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=39OmIwXfdmPw69o0cpAowcv7j0z798lr3Zhxe2aAZ+I=; 
	b=ks9k7pmiZIS5i/DlJ/lSOFjhkR17AGPCUKB0dxbCKV/E5reJvusbk4Azmby1dm4QXrs3WlKG1bsMDdq1g6cCKM2JgXYYMmS4MX3/PDHatM5dFY7iZzRg2nxJ5FEn2690JJLIuGL5RWgGxjWPAse9/WpExJ27sfUi+6GJZzWs+mQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765801801;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=39OmIwXfdmPw69o0cpAowcv7j0z798lr3Zhxe2aAZ+I=;
	b=LryNsyYChnaPRg4/Za7PeYsFJFTlgFgnmCO/TGC8JG1/LUFTyh7DFRYes3IKy/d2
	rsi44gUotpQPe3umEAp6HYHRz1YXcubcP9ckfNgngZNNs7KouEeAz8NVARw4nHqwz/4
	wRzD5HQ4bacTDsLbEPVM7LGgZbwX/7Ii1KdRwzrA=
Received: by mx.zohomail.com with SMTPS id 1765801799867522.9935835434184;
	Mon, 15 Dec 2025 04:29:59 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 13:29:30 +0100
Subject: [PATCH v2 2/4] Input: adc-keys - support EV_SW as well, not just
 EV_KEY.
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-rock4d-audio-v2-2-82a61de39b4c@collabora.com>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
In-Reply-To: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

Instead of doing something like what gpio-keys is doing, adc-keys
hardcodes that all keycodes must be of type EV_KEY.

This limits the usefulness of adc-keys, and overcomplicates the code
with manual bit-setting logic.

Instead, refactor the code to read the linux,input-type fwnode property,
and get rid of the custom bit setting logic, replacing it with
input_set_capability instead. input_report_key is replaced with
input_event, which allows us to explicitly pass the type.

Only EV_KEY and EV_SW is allowed at this stage.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/input/keyboard/adc-keys.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
index f1753207429d..62376f34f7d0 100644
--- a/drivers/input/keyboard/adc-keys.c
+++ b/drivers/input/keyboard/adc-keys.c
@@ -18,13 +18,15 @@
 
 struct adc_keys_button {
 	u32 voltage;
-	u32 keycode;
+	u32 code;
+	u32 type;
 };
 
 struct adc_keys_state {
 	struct iio_channel *channel;
 	u32 num_keys;
 	u32 last_key;
+	u32 last_type;
 	u32 keyup_voltage;
 	const struct adc_keys_button *map;
 };
@@ -34,7 +36,8 @@ static void adc_keys_poll(struct input_dev *input)
 	struct adc_keys_state *st = input_get_drvdata(input);
 	int i, value, ret;
 	u32 diff, closest = 0xffffffff;
-	int keycode = 0;
+	u32 code = 0;
+	u32 type = EV_KEY;
 
 	ret = iio_read_channel_processed(st->channel, &value);
 	if (unlikely(ret < 0)) {
@@ -45,22 +48,24 @@ static void adc_keys_poll(struct input_dev *input)
 			diff = abs(st->map[i].voltage - value);
 			if (diff < closest) {
 				closest = diff;
-				keycode = st->map[i].keycode;
+				code = st->map[i].code;
+				type = st->map[i].type;
 			}
 		}
 	}
 
 	if (abs(st->keyup_voltage - value) < closest)
-		keycode = 0;
+		code = 0;
 
-	if (st->last_key && st->last_key != keycode)
-		input_report_key(input, st->last_key, 0);
+	if (st->last_key && st->last_key != code)
+		input_event(input, st->last_type, st->last_key, 0);
 
-	if (keycode)
-		input_report_key(input, keycode, 1);
+	if (code)
+		input_event(input, type, code, 1);
 
 	input_sync(input);
-	st->last_key = keycode;
+	st->last_key = code;
+	st->last_type = type;
 }
 
 static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
@@ -88,11 +93,20 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
 		map[i].voltage /= 1000;
 
 		if (fwnode_property_read_u32(child, "linux,code",
-					     &map[i].keycode)) {
+					     &map[i].code)) {
 			dev_err(dev, "Key with invalid or missing linux,code\n");
 			return -EINVAL;
 		}
 
+		if (fwnode_property_read_u32(child, "linux,input-type",
+					     &map[i].type))
+			map[i].type = EV_KEY;
+
+		if (map[i].type != EV_KEY && map[i].type != EV_SW)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid linux,input-type: 0x%x\n",
+					     map[i].type);
+
 		i++;
 	}
 
@@ -156,9 +170,8 @@ static int adc_keys_probe(struct platform_device *pdev)
 	input->id.product = 0x0001;
 	input->id.version = 0x0100;
 
-	__set_bit(EV_KEY, input->evbit);
 	for (i = 0; i < st->num_keys; i++)
-		__set_bit(st->map[i].keycode, input->keybit);
+		input_set_capability(input, st->map[i].type, st->map[i].code);
 
 	if (device_property_read_bool(dev, "autorepeat"))
 		__set_bit(EV_REP, input->evbit);

-- 
2.52.0



Return-Path: <linux-input+bounces-13017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F21AE71CE
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842D9189FFFE
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D02425B30E;
	Tue, 24 Jun 2025 21:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p5BbM2Sz"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2F2561C2;
	Tue, 24 Jun 2025 21:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802232; cv=none; b=tXl6E1ciNxPFhDBuN4bTCRe6No2QL33GsiPm+4yl5NDrBOUEFWdKqfIrrdIkSr+qWGrYfE28C/RAAipZAgau8t/a3cS2VpysaERu+h4Tgqrz5iZxCzvBue3aWCPVF0W2c8sSi/9pz98x8HkErP1VbyvtzuD7b1yq/nTjmpkhyXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802232; c=relaxed/simple;
	bh=MICpW8xSvbQyHJc16lRuTN06i664LCOeSiTaLvuagRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iA380wUgnwXUVmTB6sP9qpSZ3wYHob99wjh7Kk51/KZpfD3KBh/7Po6wH3XEL+nurGB6Cy9Qvb2F4STuaXCNwGKIcFhdLTThQLu1EbpxYn9ue/Qqu4pj7fySMr+fUJ1Unvl2a+9E9CQwfLlVcPTRYEBi1n7FvX4EOHB0IWiiDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p5BbM2Sz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802228;
	bh=MICpW8xSvbQyHJc16lRuTN06i664LCOeSiTaLvuagRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p5BbM2Sz/VKPHAD+fWaayF6prjlsflEbJbtARGjBk0hDmRxtkX5cBy39yO6ZbDum1
	 p7mepLHVWoYp9tYn8nAzSlru/v7ObGG4orkJtPyzwC3k9qSugQI+gVbwIgpU7NmTLD
	 65KDOaioyOmjjmbYpCTle26lcOt7kvZSY8OYsdTzUHKVy3wyorN4g+ps59Zke7IvaG
	 1y3eafv5cUit9P+wrelX88SkoAaMhmr0mtrxWtBBe/e8rlVEiUtoEsO9IppX8jiweU
	 UcL96iGycwQF6nx1Oj+eAvpYRZpZ/Ml9dEUZbLxUXCV7X6fOISxnF69qOHP5NuSVf4
	 AaPnEDvG5FLCQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7A3A917E0E8F;
	Tue, 24 Jun 2025 23:57:08 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:45 +0300
Subject: [PATCH v2 01/11] HID: playstation: Make use of bitfield macros
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-1-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Improve code readability and make it more robust by replacing open coded
bit operations with the equivalent bitfield macros.

While at it, also fix the vertical alignment for some of the bitfield
constants.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 77 +++++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 1468fb11e39dffc883181663a4ad44252e0a7ebb..79190147fa00b90a4416dd2723c68bcae811684b 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -5,6 +5,7 @@
  *  Copyright (c) 2020-2022 Sony Interactive Entertainment
  */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/crc32.h>
 #include <linux/device.h>
@@ -111,34 +112,45 @@ struct ps_led_info {
 #define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
 /* Status field of DualSense input report. */
-#define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
-#define DS_STATUS_CHARGING		GENMASK(7, 4)
-#define DS_STATUS_CHARGING_SHIFT	4
+#define DS_STATUS_BATTERY_CAPACITY		GENMASK(3, 0)
+#define DS_STATUS_CHARGING			GENMASK(7, 4)
 
 /* Feature version from DualSense Firmware Info report. */
-#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))
-
+#define DS_FEATURE_VERSION_MINOR		GENMASK(7, 0)
+#define DS_FEATURE_VERSION_MAJOR		GENMASK(15, 8)
+#define DS_FEATURE_VERSION(major, minor)	(FIELD_PREP(DS_FEATURE_VERSION_MAJOR, major) | \
+						 FIELD_PREP(DS_FEATURE_VERSION_MINOR, minor))
 /*
  * Status of a DualSense touch point contact.
  * Contact IDs, with highest bit set are 'inactive'
  * and any associated data is then invalid.
  */
-#define DS_TOUCH_POINT_INACTIVE BIT(7)
+#define DS_TOUCH_POINT_INACTIVE			BIT(7)
+#define DS_TOUCH_POINT_X_LO			GENMASK(7, 0)
+#define DS_TOUCH_POINT_X_HI			GENMASK(11, 8)
+#define DS_TOUCH_POINT_X(hi, lo)		(FIELD_PREP(DS_TOUCH_POINT_X_HI, hi) | \
+						 FIELD_PREP(DS_TOUCH_POINT_X_LO, lo))
+#define DS_TOUCH_POINT_Y_LO			GENMASK(3, 0)
+#define DS_TOUCH_POINT_Y_HI			GENMASK(11, 4)
+#define DS_TOUCH_POINT_Y(hi, lo)		(FIELD_PREP(DS_TOUCH_POINT_Y_HI, hi) | \
+						 FIELD_PREP(DS_TOUCH_POINT_Y_LO, lo))
 
  /* Magic value required in tag field of Bluetooth output report. */
-#define DS_OUTPUT_TAG 0x10
+#define DS_OUTPUT_TAG				0x10
+#define DS_OUTPUT_SEQ_TAG			GENMASK(3, 0)
+#define DS_OUTPUT_SEQ_NO			GENMASK(7, 4)
 /* Flags for DualSense output report. */
-#define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
-#define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
-#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
-#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
-#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
-#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
-#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
-#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
-#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2 BIT(2)
-#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
-#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
+#define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION		BIT(0)
+#define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT			BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE	BIT(0)
+#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE		BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE		BIT(2)
+#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS			BIT(3)
+#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE	BIT(4)
+#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE	BIT(1)
+#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2		BIT(2)
+#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE			BIT(4)
+#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT			BIT(1)
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
@@ -315,7 +327,9 @@ struct dualsense_output_report {
  * Contact IDs, with highest bit set are 'inactive'
  * and any associated data is then invalid.
  */
-#define DS4_TOUCH_POINT_INACTIVE BIT(7)
+#define DS4_TOUCH_POINT_INACTIVE	BIT(7)
+#define DS4_TOUCH_POINT_X(hi, lo)	DS_TOUCH_POINT_X(hi, lo)
+#define DS4_TOUCH_POINT_Y(hi, lo)	DS_TOUCH_POINT_Y(hi, lo)
 
 /* Status field of DualShock4 input report. */
 #define DS4_STATUS0_BATTERY_CAPACITY	GENMASK(3, 0)
@@ -1194,7 +1208,8 @@ static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_
 		 * Highest 4-bit is a sequence number, which needs to be increased
 		 * every report. Lowest 4-bit is tag and can be zero for now.
 		 */
-		bt->seq_tag = (ds->output_seq << 4) | 0x0;
+		bt->seq_tag = FIELD_PREP(DS_OUTPUT_SEQ_NO, ds->output_seq) |
+			      FIELD_PREP(DS_OUTPUT_SEQ_TAG, 0x0);
 		if (++ds->output_seq == 16)
 			ds->output_seq = 0;
 
@@ -1439,19 +1454,18 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 		input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
 
 		if (active) {
-			int x = (point->x_hi << 8) | point->x_lo;
-			int y = (point->y_hi << 4) | point->y_lo;
-
-			input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
-			input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
+			input_report_abs(ds->touchpad, ABS_MT_POSITION_X,
+					 DS_TOUCH_POINT_X(point->x_hi, point->x_lo));
+			input_report_abs(ds->touchpad, ABS_MT_POSITION_Y,
+					 DS_TOUCH_POINT_Y(point->y_hi, point->y_lo));
 		}
 	}
 	input_mt_sync_frame(ds->touchpad);
 	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
 	input_sync(ds->touchpad);
 
-	battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
-	charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
+	battery_data = FIELD_GET(DS_STATUS_BATTERY_CAPACITY, ds_report->status);
+	charging_status = FIELD_GET(DS_STATUS_CHARGING, ds_report->status);
 
 	switch (charging_status) {
 	case 0x0:
@@ -2351,11 +2365,10 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 			input_mt_report_slot_state(ds4->touchpad, MT_TOOL_FINGER, active);
 
 			if (active) {
-				int x = (point->x_hi << 8) | point->x_lo;
-				int y = (point->y_hi << 4) | point->y_lo;
-
-				input_report_abs(ds4->touchpad, ABS_MT_POSITION_X, x);
-				input_report_abs(ds4->touchpad, ABS_MT_POSITION_Y, y);
+				input_report_abs(ds4->touchpad, ABS_MT_POSITION_X,
+						 DS4_TOUCH_POINT_X(point->x_hi, point->x_lo));
+				input_report_abs(ds4->touchpad, ABS_MT_POSITION_Y,
+						 DS4_TOUCH_POINT_Y(point->y_hi, point->y_lo));
 			}
 		}
 		input_mt_sync_frame(ds4->touchpad);

-- 
2.49.0



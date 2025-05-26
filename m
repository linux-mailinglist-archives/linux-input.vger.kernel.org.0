Return-Path: <linux-input+bounces-12572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD9BAC3F8F
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADED31899242
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204AA207A0B;
	Mon, 26 May 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JmaoAcdU"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0B202C30;
	Mon, 26 May 2025 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263917; cv=none; b=Gqr18q4/NaJGb4eGfVpiqb/nUph5beoUMmY8zh4vZvM/RrIUZc+ecqxbx8XYhPv7x/dk5RVUszCeDAWTwitnZnzxF419DTiFoa9EE/S62JYV8/eQ1dOzfHSzxXYPk4wfGXt0ykpzm0xzzabiKXDWab45wEc028wGxYSsJjiko6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263917; c=relaxed/simple;
	bh=mcZVPEoHxVrNSWLlV4uyqHyCNE9injyhGEmhDU9x+AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUdwWjJdz+bK3ZxmZIVTdPuoXfZza11d1caZfTLQ6Ki/6a4YYRdfexK1hIO6gmzlZzwB1Qix66mi/pKy5B/xKB+SdAh6oQDAbI8+L98dmuGq7FYgqu7Pxl+0asax4wgzDWb2RYT+4D8VoZyDCTqA4gkYo0xcfPKY+wtKgXAMtJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JmaoAcdU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263913;
	bh=mcZVPEoHxVrNSWLlV4uyqHyCNE9injyhGEmhDU9x+AY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JmaoAcdUZqIIPI330gtuSmReyIGEPd6uQlSLvOM9Qz+Eyu+9P4gbUfpSFH1yG+Am4
	 rpxb3lsS421n8YtdivO22KhsCXHTT3J+LZ7BOukpre3RYB95jYWRYOeLWOSHFNqKHg
	 TNCAw4SNuuKnRvaPmJpes0v9cwTEthWyGnGcBy+rOUHIOZgOyUStgqBLh6NvvpRAd1
	 g52fW2AhAHKVvgAyLVb+DYXm3Z+a0VeTfHCbO5KxefBihTclVxhBpmTfqTrNCLadDt
	 gtsMFekHh3AW0NDE2QYVTejk5g13PelqWRfxmiI6cM88E/FjLy+yGJtjTlLvJwDPIm
	 DnU6UQ1MagKgA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id D915B17E1576;
	Mon, 26 May 2025 14:51:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:24 +0300
Subject: [PATCH 01/11] HID: playstation: Make use of bitfield macros
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-1-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Improve code readability by replacing open coded bit operations with the
equivalent bitfield macros.

While at it, vertically align all DS_OUTPUT_* bit constants.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 68 ++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 1468fb11e39dffc883181663a4ad44252e0a7ebb..538194ce8902fe1383b57ac59743f32838dcb0df 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -5,6 +5,7 @@
  *  Copyright (c) 2020-2022 Sony Interactive Entertainment
  */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/crc32.h>
 #include <linux/device.h>
@@ -116,29 +117,41 @@ struct ps_led_info {
 #define DS_STATUS_CHARGING_SHIFT	4
 
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
@@ -315,7 +328,9 @@ struct dualsense_output_report {
  * Contact IDs, with highest bit set are 'inactive'
  * and any associated data is then invalid.
  */
-#define DS4_TOUCH_POINT_INACTIVE BIT(7)
+#define DS4_TOUCH_POINT_INACTIVE	BIT(7)
+#define DS4_TOUCH_POINT_X(hi, lo)	DS_TOUCH_POINT_X(hi, lo)
+#define DS4_TOUCH_POINT_Y(hi, lo)	DS_TOUCH_POINT_Y(hi, lo)
 
 /* Status field of DualShock4 input report. */
 #define DS4_STATUS0_BATTERY_CAPACITY	GENMASK(3, 0)
@@ -1194,7 +1209,8 @@ static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_
 		 * Highest 4-bit is a sequence number, which needs to be increased
 		 * every report. Lowest 4-bit is tag and can be zero for now.
 		 */
-		bt->seq_tag = (ds->output_seq << 4) | 0x0;
+		bt->seq_tag = FIELD_PREP(DS_OUTPUT_SEQ_NO, ds->output_seq) |
+			      FIELD_PREP(DS_OUTPUT_SEQ_TAG, 0x0);
 		if (++ds->output_seq == 16)
 			ds->output_seq = 0;
 
@@ -1439,11 +1455,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
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
@@ -2351,11 +2366,10 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
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



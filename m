Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C568C427986
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 13:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbhJILp0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 07:45:26 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38751 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232933AbhJILp0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 07:45:26 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id CAC1C580542;
        Sat,  9 Oct 2021 07:43:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 09 Oct 2021 07:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=qaUqksoNnwhMxXafs7u0XKkHPB
        HK7yNaTZWp2E6vOls=; b=kyQ/cjvn6eLjCAl6YrSnePFJgYbrpUPjRkXwz/0QKE
        sztVjBCw1CCdcgEuGmqgf0ykBpxu3Jhdann+bf1hDd24o0tfC+chWvb/rNUWTBto
        VnTt4PH6WuqXMrWTug71fkTIXGv7wzl0q6aJyIbEv4wFwozr+/JhpWS3SmM81AAi
        072O26LosPXvflS94e7H5c7xei0i87aIKkh6Ke7WMMBisBIWLOxzL9X8SF1RNNxK
        7NBsAnRnbeh8tWkbQhktZ4ZbaqZKg/na/0Nf1mqwq8SMT93CWQf0A9MHOl0l90VT
        q5Zb30k1wMMl8EzPvG7P1H7EQAwIhL2BEcux5jf2Ypsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qaUqksoNnwhMxXafs
        7u0XKkHPBHK7yNaTZWp2E6vOls=; b=EffMQS3TXAU6XNrR4+YDXk8+T15LrU5Dl
        ocwDQZimm5fHy9yM2N9d7xuwkGt0cQArlV51XuR4fXjZEJicCqL2Gbc4ciug66Bl
        Q0BLiIbkCBAES8KRZtSAITz87ReO5YR+FWfy5JbZWksPa8GxAnaw9DOawxiGchCP
        rRv12f8aB9Uqm234sVi5oCnepzA72nfOlItGNZStZhhyheZKIDTaF0JmkK5pjmXE
        J7GHaitYYNwXlvCllRf0kuS/5CeChIOcT2Ib+HzURekcvb4yIQ0AEJiD5XMPQXme
        MJnv14x1aMrny8zp/WV1hCnnH+mCl+0n3BEr4z/3osiSRbxiNfpJQ==
X-ME-Sender: <xms:YIBhYTfzKiIObmTgdeQjblDWxX6UDnOxzwfpxgDoGRZU8rNelhBRew>
    <xme:YIBhYZMUd1O60IKvee4ab0GhuSzVxvKYVuKS0BFTcxJF5KrzoEByVL_L940zVFFwh
    gQyPEBlwWlCcQAYQzQ>
X-ME-Received: <xmr:YIBhYcgsFO_A4Ocep1IB12qDZHbYrhPF1S3dGy6sOt3I4kC7U8gKnIwIWRldFyqz58F_oEwUU65cWVTxK260zbz9BGljPNCPNIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsth
    grihhrvdefrdhmvg
X-ME-Proxy: <xmx:YIBhYU8tFulmjLAaG7bSfEuM5ORJlgzUONPfzhiWnr3i69-gfkjmGg>
    <xmx:YIBhYfsIPq7RDzqWo9yOp8kpzJBEX7Ki-ELlF8dhroV-nfAS0kDj0g>
    <xmx:YIBhYTHxxV4Yj16y1FQFht_unqEvwIFNjBCh2YKukwIAiMfXS7tj2g>
    <xmx:YIBhYQnQ9Hv2o2xw5B_lO6t69X4iUz78R1dPIQEz-bXAqG4JvhCYew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Oct 2021 07:43:24 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     linux-imx@nxp.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the data values
Date:   Sat,  9 Oct 2021 21:43:10 +1000
Message-Id: <20211009114313.17967-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to the Wacom HID device for flipping the values based on
device tree settings. This allows us to support devices where the panel
is installed in a different orientation, such as the reMarkable2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../bindings/input/hid-over-i2c.txt           | 20 ++++++
 drivers/hid/wacom_sys.c                       | 25 ++++++++
 drivers/hid/wacom_wac.c                       | 61 +++++++++++++++++++
 drivers/hid/wacom_wac.h                       | 13 ++++
 4 files changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
index c76bafaf98d2..16ebd7c46049 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
@@ -33,6 +33,26 @@ device-specific compatible properties, which should be used in addition to the
 - post-power-on-delay-ms: time required by the device after enabling its regulators
   or powering it on, before it is ready for communication.
 
+  flip-tilt-x:
+    type: boolean
+    description: Flip the tilt X values read from device
+
+  flip-tilt-y:
+    type: boolean
+    description: Flip the tilt Y values read from device
+
+  flip-pos-x:
+    type: boolean
+    description: Flip the X position values read from device
+
+  flip-pos-y:
+    type: boolean
+    description: Flip the Y position values read from device
+
+  flip-distance:
+    type: boolean
+    description: Flip the distance values read from device
+
 Example:
 
 	i2c-hid-dev@2c {
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 93f49b766376..47d9590b10bd 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -10,6 +10,7 @@
 
 #include "wacom_wac.h"
 #include "wacom.h"
+#include <linux/of.h>
 #include <linux/input/mt.h>
 
 #define WAC_MSG_RETRIES		5
@@ -2730,6 +2731,28 @@ static void wacom_mode_change_work(struct work_struct *work)
 	return;
 }
 
+static void wacom_of_read(struct hid_device *hdev, struct wacom_wac *wacom_wac)
+{
+	if (IS_ENABLED(CONFIG_OF)) {
+		wacom_wac->flip_tilt_x = of_property_read_bool(hdev->dev.parent->of_node,
+							"flip-tilt-x");
+		wacom_wac->flip_tilt_y = of_property_read_bool(hdev->dev.parent->of_node,
+							"flip-tilt-y");
+		wacom_wac->flip_pos_x = of_property_read_bool(hdev->dev.parent->of_node,
+							"flip-pos-x");
+		wacom_wac->flip_pos_y = of_property_read_bool(hdev->dev.parent->of_node,
+							"flip-pos-y");
+		wacom_wac->flip_distance = of_property_read_bool(hdev->dev.parent->of_node,
+							"flip-distance");
+	} else {
+		wacom_wac->flip_tilt_x = false;
+		wacom_wac->flip_tilt_y = false;
+		wacom_wac->flip_pos_x = false;
+		wacom_wac->flip_pos_y = false;
+		wacom_wac->flip_distance = false;
+	}
+}
+
 static int wacom_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
@@ -2797,6 +2820,8 @@ static int wacom_probe(struct hid_device *hdev,
 				 error);
 	}
 
+	wacom_of_read(hdev, wacom_wac);
+
 	wacom_wac->probe_complete = true;
 	return 0;
 }
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 33a6908995b1..c01f683e23fa 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -3261,6 +3261,63 @@ static int wacom_status_irq(struct wacom_wac *wacom_wac, size_t len)
 	return 0;
 }
 
+static int wacom_of_irq(struct wacom_wac *wacom_wac, size_t len)
+{
+	const struct wacom_features *features = &wacom_wac->features;
+	unsigned char *data = wacom_wac->data;
+	struct input_dev *input = wacom_wac->pen_input;
+	unsigned int x, y, pressure;
+	unsigned char tsw, f1, f2, ers;
+	short tilt_x, tilt_y, distance;
+
+	if (!IS_ENABLED(CONFIG_OF))
+		return 0;
+
+	tsw = data[1] & WACOM_TIP_SWITCH_bm;
+	ers = data[1] & WACOM_ERASER_bm;
+	f1 = data[1] & WACOM_BARREL_SWITCH_bm;
+	f2 = data[1] & WACOM_BARREL_SWITCH_2_bm;
+	x = le16_to_cpup((__le16 *)&data[2]);
+	y = le16_to_cpup((__le16 *)&data[4]);
+	pressure = le16_to_cpup((__le16 *)&data[6]);
+
+	/* Signed */
+	tilt_x = get_unaligned_le16(&data[9]);
+	tilt_y = get_unaligned_le16(&data[11]);
+
+	distance = get_unaligned_le16(&data[13]);
+
+	/* keep touch state for pen events */
+	if (!wacom_wac->shared->touch_down)
+		wacom_wac->tool[0] = (data[1] & 0x0c) ?
+			BTN_TOOL_RUBBER : BTN_TOOL_PEN;
+
+	wacom_wac->shared->touch_down = data[1] & 0x20;
+
+	// Flip the values based on properties from the device tree
+
+	// Default to a negative value for distance as HID compliant Wacom
+	// devices generally specify the hovering distance as negative.
+	distance = wacom_wac->flip_distance ? distance : -distance;
+	x = wacom_wac->flip_pos_x ? (features->x_max - x) : x;
+	y = wacom_wac->flip_pos_y ? (features->y_max - y) : y;
+	tilt_x = wacom_wac->flip_tilt_x ? -tilt_x : tilt_x;
+	tilt_y = wacom_wac->flip_tilt_y ? -tilt_y : tilt_y;
+
+	input_report_key(input, BTN_TOUCH, tsw || ers);
+	input_report_key(input, wacom_wac->tool[0], wacom_wac->shared->touch_down);
+	input_report_key(input, BTN_STYLUS, f1);
+	input_report_key(input, BTN_STYLUS2, f2);
+	input_report_abs(input, ABS_X, x);
+	input_report_abs(input, ABS_Y, y);
+	input_report_abs(input, ABS_PRESSURE, pressure);
+	input_report_abs(input, ABS_DISTANCE, distance);
+	input_report_abs(input, ABS_TILT_X, tilt_x);
+	input_report_abs(input, ABS_TILT_Y, tilt_y);
+
+	return 1;
+}
+
 void wacom_wac_irq(struct wacom_wac *wacom_wac, size_t len)
 {
 	bool sync;
@@ -3379,6 +3436,10 @@ void wacom_wac_irq(struct wacom_wac *wacom_wac, size_t len)
 			sync = wacom_remote_irq(wacom_wac, len);
 		break;
 
+	case HID_GENERIC:
+		sync = wacom_of_irq(wacom_wac, len);
+		break;
+
 	default:
 		sync = false;
 		break;
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 8b2d4e5b2303..4dd5a56bf347 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -157,6 +157,14 @@
 #define WACOM_HID_WT_Y                  (WACOM_HID_UP_WACOMTOUCH | 0x131)
 #define WACOM_HID_WT_REPORT_VALID       (WACOM_HID_UP_WACOMTOUCH | 0x1d0)
 
+// Bitmasks (for data[3])
+#define WACOM_TIP_SWITCH_bm         (1 << 0)
+#define WACOM_BARREL_SWITCH_bm      (1 << 1)
+#define WACOM_ERASER_bm             (1 << 2)
+#define WACOM_INVERT_bm             (1 << 3)
+#define WACOM_BARREL_SWITCH_2_bm    (1 << 4)
+#define WACOM_IN_RANGE_bm           (1 << 5)
+
 #define WACOM_BATTERY_USAGE(f)	(((f)->hid == HID_DG_BATTERYSTRENGTH) || \
 				 ((f)->hid == WACOM_HID_WD_BATTERY_CHARGING) || \
 				 ((f)->hid == WACOM_HID_WD_BATTERY_LEVEL))
@@ -357,6 +365,11 @@ struct wacom_wac {
 	bool has_mode_change;
 	bool is_direct_mode;
 	bool is_invalid_bt_frame;
+	bool flip_tilt_x;
+	bool flip_tilt_y;
+	bool flip_pos_x;
+	bool flip_pos_y;
+	bool flip_distance;
 };
 
 #endif
-- 
2.31.1


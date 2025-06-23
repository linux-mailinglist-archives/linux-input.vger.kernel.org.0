Return-Path: <linux-input+bounces-12993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A5AE33CC
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 04:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159563AB43A
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 02:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0668D1AA1D5;
	Mon, 23 Jun 2025 02:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redstrate.com header.i=@redstrate.com header.b="e9xo6MW8"
X-Original-To: linux-input@vger.kernel.org
Received: from ryne.moe (ryne.moe [157.90.134.234])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1AE19F121;
	Mon, 23 Jun 2025 02:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.134.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750647042; cv=none; b=X138NW908sKNZSjOcx9ZbbmzoYqg18tOeKvdH2qqOpVoULJ1/I07JFpr6SqIpN/f/C8qNc46q8Ts3n/2RUrV2+Ju3R+JqT7yfgY78TXDbOmGWPyLph8QN3Zl8HV7ph3chidsO+Etp8vn+fbwhwz6IhqLDIf/IcpUECt7Zg/yyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750647042; c=relaxed/simple;
	bh=OI/ejyJmJUFvir1W/UFaioN9oRcq9r++KJZpzYoHfcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRaplpeLnlFxg7V0dybQ3l4VkRTfyUe/gdM5RThTy4iidTENrYkhrtmDllVM61iQi7+A9MwLYZz9iq+Qk4mfxxDak0l4D/rDNsP3NHzgltVFB7aZUuLlPzxLj9vUQXtf6iSdLobtSCD40SO6vIyV257bWffhSk2VC+tGv4NFdr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redstrate.com; spf=pass smtp.mailfrom=redstrate.com; dkim=pass (1024-bit key) header.d=redstrate.com header.i=@redstrate.com header.b=e9xo6MW8; arc=none smtp.client-ip=157.90.134.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redstrate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redstrate.com
Received: from adrastea.lan (c-73-35-115-196.hsd1.fl.comcast.net [73.35.115.196])
	by ryne.moe (Postfix) with ESMTPSA id 32AAE1908D88;
	Mon, 23 Jun 2025 02:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=redstrate.com;
	s=default; t=1750646613;
	bh=OI/ejyJmJUFvir1W/UFaioN9oRcq9r++KJZpzYoHfcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e9xo6MW8pqboAZV7Z73cQXpzhRxNUrZzeM7n6B1ZQtLf5ebt03rCsrvnbozQJV1l9
	 bnk/zy2vuKLI96bKLTVoj35KwtotvLDvaCiO4gOgTpBV8IWOgArnDpSnW9ea8G5UMg
	 N0BiMXvMIRXSkKbxCKK3EhDHQyC0tDA1ruWdHLCc=
From: Joshua Goins <josh@redstrate.com>
To: linux-input@vger.kernel.org
Cc: josh@redstrate.com,
	jose.exposito89@gmail.com,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] HID: uclogic: Add support for XP-PEN Artist 22R Pro
Date: Sun, 22 Jun 2025 22:42:54 -0400
Message-ID: <20250623024309.17356-2-josh@redstrate.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623024309.17356-1-josh@redstrate.com>
References: <20250623024309.17356-1-josh@redstrate.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the XP-PEN Artist 22R Pro, including stylus, tablet frame
and pen pressure.

The tablet has 20 buttons, but need to be remapped in order since the
device reports invalid keycodes. Existing tablet functionality should
not be inhibited, as BTN0-8 is still used.

New initialization functions are added since the device differs slightly
from other UGEE v2 devices.

Signed-off-by: Joshua Goins <josh@redstrate.com>
---
 drivers/hid/hid-ids.h            |   1 +
 drivers/hid/hid-uclogic-core.c   |  66 +++++++++++++++-
 drivers/hid/hid-uclogic-params.c | 132 +++++++++++++++++++++++++++++++
 drivers/hid/hid-uclogic-params.h |   5 ++
 drivers/hid/hid-uclogic-rdesc.c  |  44 +++++++++++
 drivers/hid/hid-uclogic-rdesc.h  |   4 +
 6 files changed, 248 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e3fb4e2fe911..3e454b0c5367 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1402,6 +1402,7 @@
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO_PRO_S	0x0909
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO_PRO_SW	0x0933
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_STAR06	0x0078
+#define USB_DEVICE_ID_UGEE_XPPEN_TABLET_22R_PRO	0x091b
 #define USB_DEVICE_ID_UGEE_TABLET_G5		0x0074
 #define USB_DEVICE_ID_UGEE_TABLET_EX07S		0x0071
 #define USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720	0x0055
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 61a4019ddc74..d53e3cb4c3ea 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -62,6 +62,30 @@ static const __u8 *uclogic_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
+/* Buttons considered valid tablet pad inputs. */
+static const unsigned int uclogic_extra_input_mapping[] = {
+	BTN_0,
+	BTN_1,
+	BTN_2,
+	BTN_3,
+	BTN_4,
+	BTN_5,
+	BTN_6,
+	BTN_7,
+	BTN_8,
+	BTN_RIGHT,
+	BTN_MIDDLE,
+	BTN_SIDE,
+	BTN_EXTRA,
+	BTN_FORWARD,
+	BTN_BACK,
+	BTN_B,
+	BTN_A,
+	BTN_BASE,
+	BTN_BASE2,
+	BTN_X
+};
+
 static int uclogic_input_mapping(struct hid_device *hdev,
 				 struct hid_input *hi,
 				 struct hid_field *field,
@@ -72,9 +96,27 @@ static int uclogic_input_mapping(struct hid_device *hdev,
 	struct uclogic_drvdata *drvdata = hid_get_drvdata(hdev);
 	struct uclogic_params *params = &drvdata->params;
 
-	/* Discard invalid pen usages */
-	if (params->pen.usage_invalid && (field->application == HID_DG_PEN))
-		return -1;
+	if (field->application == HID_GD_KEYPAD) {
+		/*
+		 * Remap input buttons to sensible ones that are not invalid.
+		 * This only affects previous behavior for devices with more than ten or so buttons.
+		 */
+		const int key = (usage->hid & HID_USAGE) - 1;
+
+		if (key < ARRAY_SIZE(uclogic_extra_input_mapping)) {
+			hid_map_usage(hi,
+				      usage,
+				      bit,
+				      max,
+				      EV_KEY,
+				      uclogic_extra_input_mapping[key]);
+			return 1;
+		}
+	} else if (field->application == HID_DG_PEN) {
+		/* Discard invalid pen usages */
+		if (params->pen.usage_invalid)
+			return -1;
+	}
 
 	/* Let hid-core decide what to do */
 	return 0;
@@ -407,8 +449,22 @@ static int uclogic_raw_event_frame(
 
 	/* If need to, and can, transform the bitmap dial reports */
 	if (frame->bitmap_dial_byte > 0 && frame->bitmap_dial_byte < size) {
-		if (data[frame->bitmap_dial_byte] == 2)
+		switch (data[frame->bitmap_dial_byte]) {
+		case 2:
 			data[frame->bitmap_dial_byte] = -1;
+			break;
+
+		/* Everything below here is for tablets that shove multiple dials into 1 byte */
+		case 16:
+			data[frame->bitmap_dial_byte] = 0;
+			data[frame->bitmap_second_dial_destination_byte] = 1;
+			break;
+
+		case 32:
+			data[frame->bitmap_dial_byte] = 0;
+			data[frame->bitmap_second_dial_destination_byte] = -1;
+			break;
+		}
 	}
 
 	return 0;
@@ -546,6 +602,8 @@ static const struct hid_device_id uclogic_devices[] = {
 		.driver_data = UCLOGIC_MOUSE_FRAME_QUIRK | UCLOGIC_BATTERY_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
 				USB_DEVICE_ID_UGEE_XPPEN_TABLET_STAR06) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
+				USB_DEVICE_ID_UGEE_XPPEN_TABLET_22R_PRO) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, uclogic_devices);
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index a6044996abf2..675f28811a4d 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -103,6 +103,8 @@ static void uclogic_params_frame_hid_dbg(
 		frame->touch_flip_at);
 	hid_dbg(hdev, "\t\t.bitmap_dial_byte = %u\n",
 		frame->bitmap_dial_byte);
+	hid_dbg(hdev, "\t\t.bitmap_second_dial_destination_byte = %u\n",
+			frame->bitmap_second_dial_destination_byte);
 }
 
 /**
@@ -1529,6 +1531,126 @@ static int uclogic_params_ugee_v2_init(struct uclogic_params *params,
 	return rc;
 }
 
+/*
+ * uclogic_params_init_ugee_xppen_pro_22r() - Initializes a UGEE XP-Pen Pro 22R tablet device.
+ *
+ * @hdev:	The HID device of the tablet interface to initialize and get
+ *		parameters from. Cannot be NULL.
+ * @params:	Parameters to fill in (to be cleaned with
+ *		uclogic_params_cleanup()). Not modified in case of error.
+ *		Cannot be NULL.
+ *
+ * Returns:
+ *	Zero, if successful. A negative errno code on error.
+ */
+static int uclogic_params_init_ugee_xppen_pro_22r(struct uclogic_params *params,
+						  struct hid_device *hdev,
+						  const u8 rdesc_frame_arr[],
+						  const size_t rdesc_frame_size)
+{
+	int rc = 0;
+	struct usb_interface *iface;
+	__u8 bInterfaceNumber;
+	const int str_desc_len = 12;
+	u8 *str_desc = NULL;
+	__u8 *rdesc_pen = NULL;
+	s32 desc_params[UCLOGIC_RDESC_PH_ID_NUM];
+	enum uclogic_params_frame_type frame_type;
+	/* The resulting parameters (noop) */
+	struct uclogic_params p = {0, };
+
+	if (!hdev || !params) {
+		rc = -EINVAL;
+		goto cleanup;
+	}
+
+	iface = to_usb_interface(hdev->dev.parent);
+	bInterfaceNumber = iface->cur_altsetting->desc.bInterfaceNumber;
+
+	/* Ignore non-pen interfaces */
+	if (bInterfaceNumber != 2) {
+		rc = -EINVAL;
+		uclogic_params_init_invalid(&p);
+		goto cleanup;
+	}
+
+	/*
+	 * Initialize the interface by sending magic data.
+	 * This magic data is the same as other UGEE v2 tablets.
+	 */
+	rc = uclogic_probe_interface(hdev,
+				     uclogic_ugee_v2_probe_arr,
+				     uclogic_ugee_v2_probe_size,
+				     uclogic_ugee_v2_probe_endpoint);
+	if (rc) {
+		uclogic_params_init_invalid(&p);
+		goto cleanup;
+	}
+
+	/**
+	 * Read the string descriptor containing pen and frame parameters.
+	 * These are slightly different than typical UGEE v2 devices.
+	 */
+	rc = uclogic_params_get_str_desc(&str_desc, hdev, 100, str_desc_len);
+	if (rc != str_desc_len) {
+		rc = (rc < 0) ? rc : -EINVAL;
+		hid_err(hdev, "failed retrieving pen and frame parameters: %d\n", rc);
+		uclogic_params_init_invalid(&p);
+		goto cleanup;
+	}
+
+	rc = uclogic_params_parse_ugee_v2_desc(str_desc, str_desc_len,
+					       desc_params,
+					       ARRAY_SIZE(desc_params),
+					       &frame_type);
+	if (rc)
+		goto cleanup;
+
+	// str_desc doesn't report the correct amount of buttons, so manually fix it
+	desc_params[UCLOGIC_RDESC_FRAME_PH_ID_UM] = 20;
+
+	kfree(str_desc);
+	str_desc = NULL;
+
+	/* Initialize the pen interface */
+	rdesc_pen = uclogic_rdesc_template_apply(
+				uclogic_rdesc_ugee_v2_pen_template_arr,
+				uclogic_rdesc_ugee_v2_pen_template_size,
+				desc_params, ARRAY_SIZE(desc_params));
+	if (!rdesc_pen) {
+		rc = -ENOMEM;
+		goto cleanup;
+	}
+
+	p.pen.desc_ptr = rdesc_pen;
+	p.pen.desc_size = uclogic_rdesc_ugee_v2_pen_template_size;
+	p.pen.id = 0x02;
+	p.pen.subreport_list[0].value = 0xf0;
+	p.pen.subreport_list[0].id = UCLOGIC_RDESC_V1_FRAME_ID;
+
+	/* Initialize the frame interface */
+	rc = uclogic_params_frame_init_with_desc(
+		&p.frame_list[0],
+		rdesc_frame_arr,
+		rdesc_frame_size,
+		UCLOGIC_RDESC_V1_FRAME_ID);
+	if (rc < 0) {
+		hid_err(hdev, "initializing frame params failed: %d\n", rc);
+		goto cleanup;
+	}
+
+	p.frame_list[0].bitmap_dial_byte = 7;
+	p.frame_list[0].bitmap_second_dial_destination_byte = 8;
+
+	/* Output parameters */
+	memcpy(params, &p, sizeof(*params));
+	memset(&p, 0, sizeof(p));
+cleanup:
+	kfree(str_desc);
+	uclogic_params_cleanup(&p);
+	return rc;
+}
+
 /**
  * uclogic_params_init() - initialize a tablet interface and discover its
  * parameters.
@@ -1845,6 +1967,16 @@ int uclogic_params_init(struct uclogic_params *params,
 			uclogic_params_init_invalid(&p);
 		}
 
+		break;
+	case VID_PID(USB_VENDOR_ID_UGEE,
+			USB_DEVICE_ID_UGEE_XPPEN_TABLET_22R_PRO):
+		rc = uclogic_params_init_ugee_xppen_pro_22r(&p,
+			hdev,
+			uclogic_rdesc_xppen_artist_22r_pro_frame_arr,
+			uclogic_rdesc_xppen_artist_22r_pro_frame_size);
+		if (rc != 0)
+			goto cleanup;
+
 		break;
 	}
 
diff --git a/drivers/hid/hid-uclogic-params.h b/drivers/hid/hid-uclogic-params.h
index 35ff062d09b5..6ec8643d2ee5 100644
--- a/drivers/hid/hid-uclogic-params.h
+++ b/drivers/hid/hid-uclogic-params.h
@@ -175,6 +175,11 @@ struct uclogic_params_frame {
 	 * counterclockwise, as opposed to the normal 1 and -1.
 	 */
 	unsigned int bitmap_dial_byte;
+	/*
+	 * Destination offset for the second bitmap dial byte, if the tablet
+	 * supports a second dial at all.
+	 */
+	unsigned int bitmap_second_dial_destination_byte;
 };
 
 /*
diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index 9b9cbc2aae36..08a89c6aae3b 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -1193,6 +1193,50 @@ const __u8 uclogic_rdesc_xppen_deco01_frame_arr[] = {
 const size_t uclogic_rdesc_xppen_deco01_frame_size =
 			sizeof(uclogic_rdesc_xppen_deco01_frame_arr);
 
+/* Fixed report descriptor for XP-Pen Arist 22R Pro frame */
+const __u8 uclogic_rdesc_xppen_artist_22r_pro_frame_arr[] = {
+	0x05, 0x01,         /*  Usage Page (Desktop),                       */
+	0x09, 0x07,         /*  Usage (Keypad),                             */
+	0xA1, 0x01,         /*  Collection (Application),                   */
+	0x85, UCLOGIC_RDESC_V1_FRAME_ID,
+	/*      Report ID (Virtual report),             */
+	0x05, 0x0D,         /*     Usage Page (Digitizer),                  */
+	0x09, 0x39,         /*      Usage (Tablet Function Keys),           */
+	0xA0,               /*      Collection (Physical),                  */
+	0x14,               /*          Logical Minimum (0),                */
+	0x25, 0x01,         /*          Logical Maximum (1),                */
+	0x75, 0x01,         /*          Report Size (1),                    */
+	0x95, 0x08,         /*          Report Count (8),                   */
+	0x81, 0x01,         /*          Input (Constant),                   */
+	0x05, 0x09,         /*          Usage Page (Button),                */
+	0x19, 0x01,         /*          Usage Minimum (01h),                */
+	0x29, 0x14,         /*          Usage Maximum (14h),                */
+	0x95, 0x14,         /*          Report Count (20),                  */
+	0x81, 0x02,         /*          Input (Variable),                   */
+	0x95, 0x14,         /*          Report Count (20),                  */
+	0x81, 0x01,         /*          Input (Constant),                   */
+	0x05, 0x01,         /*          Usage Page (Desktop),               */
+	0x09, 0x38,         /*          Usage (Wheel),                      */
+	0x75, 0x08,         /*          Report Size (8),                    */
+	0x95, 0x01,         /*          Report Count (1),                   */
+	0x15, 0xFF,         /*          Logical Minimum (-1),               */
+	0x25, 0x08,         /*          Logical Maximum (8),                */
+	0x81, 0x06,         /*          Input (Variable, Relative),         */
+	0x05, 0x0C,         /*          Usage Page (Consumer Devices),      */
+	0x0A, 0x38, 0x02,   /*          Usage (AC PAN),                     */
+	0x95, 0x01,         /*          Report Count (1),                   */
+	0x81, 0x06,         /*          Input (Variable, Relative),         */
+	0x26, 0xFF, 0x00,   /*          Logical Maximum (255),              */
+	0x75, 0x08,         /*          Report Size (8),                    */
+	0x95, 0x01,         /*          Report Count (1),                   */
+	0x81, 0x02,         /*          Input (Variable),                   */
+	0xC0,               /*      End Collection                          */
+	0xC0,               /*  End Collection                              */
+};
+
+const size_t uclogic_rdesc_xppen_artist_22r_pro_frame_size =
+				sizeof(uclogic_rdesc_xppen_artist_22r_pro_frame_arr);
+
 /**
  * uclogic_rdesc_template_apply() - apply report descriptor parameters to a
  * report descriptor template, creating a report descriptor. Copies the
diff --git a/drivers/hid/hid-uclogic-rdesc.h b/drivers/hid/hid-uclogic-rdesc.h
index 3878a0e8c464..644a35ff12f2 100644
--- a/drivers/hid/hid-uclogic-rdesc.h
+++ b/drivers/hid/hid-uclogic-rdesc.h
@@ -210,4 +210,8 @@ extern const size_t uclogic_rdesc_ugee_g5_frame_size;
 /* Least-significant bit of Ugee G5 frame rotary encoder state */
 #define UCLOGIC_RDESC_UGEE_G5_FRAME_RE_LSB 38
 
+/* Fixed report descriptor for XP-Pen Arist 22R Pro frame */
+extern const __u8 uclogic_rdesc_xppen_artist_22r_pro_frame_arr[];
+extern const size_t uclogic_rdesc_xppen_artist_22r_pro_frame_size;
+
 #endif /* _HID_UCLOGIC_RDESC_H */
-- 
2.49.0



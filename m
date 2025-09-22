Return-Path: <linux-input+bounces-14997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA7B93652
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 23:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47CF4164323
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 21:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4136C219A7D;
	Mon, 22 Sep 2025 21:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redstrate.com header.i=@redstrate.com header.b="MyLWzpBj"
X-Original-To: linux-input@vger.kernel.org
Received: from ryne.moe (ryne.moe [157.90.134.234])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FFF19994F;
	Mon, 22 Sep 2025 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.134.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758577151; cv=none; b=jyUesXKH+FujLuMAlEEEhXV7s1iqqqDrsDPanliBcBiqbnDPN62kOYzvSmC8Q1p6vINAv+2qXLU8gX6ryek0dctw2dW8Llqt4CUGzCr/PyU/fL4RqqK6RcOTpn+AtZmfxLOhgnicertmdtSYl/aiYvVvP0kxww8ABNKXcFrCt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758577151; c=relaxed/simple;
	bh=xHLuZkXlKH0zpcXXTlQAt8n84r+Ap5K2/jcgYDvJXPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTIIvu1kNghoX9B1VPL9ooc5+EPv778PkyFLOQavOSGrHgTRLDUMT+Z4awmgevTiGV0gdxtnzpBVVCbjTGbVXsrxr2QmrkxCd30idMvWRzuuN8qi52sKpbX66zBxj116nL05sxWvbMae43tGjd2WSmJN2uX9FtioIjGhGyLp1v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redstrate.com; spf=pass smtp.mailfrom=redstrate.com; dkim=pass (1024-bit key) header.d=redstrate.com header.i=@redstrate.com header.b=MyLWzpBj; arc=none smtp.client-ip=157.90.134.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redstrate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redstrate.com
Received: from adrastea (c-73-35-115-196.hsd1.fl.comcast.net [73.35.115.196])
	by ryne.moe (Postfix) with ESMTPSA id E5C4F19056B6;
	Mon, 22 Sep 2025 21:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=redstrate.com;
	s=default; t=1758576741;
	bh=xHLuZkXlKH0zpcXXTlQAt8n84r+Ap5K2/jcgYDvJXPk=;
	h=From:To:Cc:Subject:Date;
	b=MyLWzpBjN1I9XNIAmdzCU0x97WLhnPlLL39fItHodUsg03NAmf5DNNma3n3QFXJzD
	 8HzKVXiR/tPdjm2pqxDXJY0K8VIiiZ0G1pFVyn8EJJUG3qogIZPgy/UaAYLSmVKP2h
	 QvlYPKIWtTv47CEFZftATb413HPK+FgC7hRFM3zA=
From: Joshua Goins <josh@redstrate.com>
To: linux-input@vger.kernel.org
Cc: josh@redstrate.com,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: uclogic: Add support for the XP-PEN Artist 24 Pro
Date: Mon, 22 Sep 2025 17:32:03 -0400
Message-ID: <20250922213207.9224-1-josh@redstrate.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tablet is similar to the 22R Pro, but with a few annoying
differences. Its descriptors are bigger because of the tablet's split
coordinate system, I guess it's just that large. Thankfully, this is
easy enough to support as all we have to do is shift bytes around.

To help code re-use, I changed the signature of
uclogic_params_init_ugee_xppen_pro to accept a pen descriptor so we
didn't create yet-another initialization function.

I have been testing this locally for a month or so and it works great,
and also corroborated this with a few other testers. Since this touches
my 22R Pro code, I have tested and checked that it didn't regress that
device.

Signed-off-by: Joshua Goins <josh@redstrate.com>
---
 drivers/hid/hid-ids.h            |   1 +
 drivers/hid/hid-uclogic-core.c   |  19 +++++
 drivers/hid/hid-uclogic-params.c |  47 +++++++++---
 drivers/hid/hid-uclogic-params.h |   5 ++
 drivers/hid/hid-uclogic-rdesc.c  | 125 +++++++++++++++++++++++++++++++
 drivers/hid/hid-uclogic-rdesc.h  |   8 ++
 6 files changed, 194 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 149798754570..7f11ba71783a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1414,6 +1414,7 @@
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO_PRO_SW	0x0933
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_STAR06	0x0078
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_22R_PRO	0x091b
+#define USB_DEVICE_ID_UGEE_XPPEN_TABLET_24_PRO	0x092d
 #define USB_DEVICE_ID_UGEE_TABLET_G5		0x0074
 #define USB_DEVICE_ID_UGEE_TABLET_EX07S		0x0071
 #define USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720	0x0055
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 34fb03ae8ee2..90ebb81041ea 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -362,6 +362,23 @@ static int uclogic_raw_event_pen(struct uclogic_drvdata *drvdata,
 		data[8] = pressure_low_byte;
 		data[9] = pressure_high_byte;
 	}
+	if (size == 12 && pen->fragmented_hires2) {
+		// 00 00 when on the left side, 01 00 in the right
+		// we move these to the end of the x coord (u16) to create a correct x coord (u32)
+		u8 lsb_low_byte = data[10];
+		u8 lsb_high_byte = data[11];
+
+		// shift everything right by 2 bytes, to make space for the moved lsb
+		data[11] = data[9];
+		data[10] = data[8];
+		data[9] = data[7];
+		data[8] = data[6];
+		data[7] = data[5];
+		data[6] = data[4];
+
+		data[4] = lsb_low_byte;
+		data[5] = lsb_high_byte;
+	}
 	/* If we need to emulate in-range detection */
 	if (pen->inrange == UCLOGIC_PARAMS_PEN_INRANGE_NONE) {
 		/* Set in-range bit */
@@ -604,6 +621,8 @@ static const struct hid_device_id uclogic_devices[] = {
 				USB_DEVICE_ID_UGEE_XPPEN_TABLET_STAR06) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
 				USB_DEVICE_ID_UGEE_XPPEN_TABLET_22R_PRO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
+				USB_DEVICE_ID_UGEE_XPPEN_TABLET_24_PRO) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, uclogic_devices);
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 4a17f7332c3f..d49fe701f8e4 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -1123,6 +1123,9 @@ static int uclogic_params_parse_ugee_v2_desc(const __u8 *str_desc,
 		return -EINVAL;
 
 	pen_x_lm = get_unaligned_le16(str_desc + 2);
+	if (str_desc_size > 12)
+		pen_x_lm += (u8)str_desc[12] << 16;
+
 	pen_y_lm = get_unaligned_le16(str_desc + 4);
 	frame_num_buttons = str_desc[6];
 	*frame_type = str_desc[7];
@@ -1532,7 +1535,7 @@ static int uclogic_params_ugee_v2_init(struct uclogic_params *params,
 }
 
 /*
- * uclogic_params_init_ugee_xppen_pro_22r() - Initializes a UGEE XP-Pen Pro 22R tablet device.
+ * uclogic_params_init_ugee_xppen_pro() - Initializes a UGEE XP-Pen Pro tablet device.
  *
  * @hdev:	The HID device of the tablet interface to initialize and get
  *		parameters from. Cannot be NULL.
@@ -1543,15 +1546,17 @@ static int uclogic_params_ugee_v2_init(struct uclogic_params *params,
  * Returns:
  *	Zero, if successful. A negative errno code on error.
  */
-static int uclogic_params_init_ugee_xppen_pro_22r(struct uclogic_params *params,
-						  struct hid_device *hdev,
-						  const u8 rdesc_frame_arr[],
-						  const size_t rdesc_frame_size)
+static int uclogic_params_init_ugee_xppen_pro(struct uclogic_params *params,
+					     struct hid_device *hdev,
+					     const u8 rdesc_pen_arr[],
+					     const size_t rdesc_pen_size,
+					     const u8 rdesc_frame_arr[],
+					     const size_t rdesc_frame_size,
+					     size_t str_desc_len)
 {
 	int rc = 0;
 	struct usb_interface *iface;
 	__u8 bInterfaceNumber;
-	const int str_desc_len = 12;
 	u8 *str_desc = NULL;
 	__u8 *rdesc_pen = NULL;
 	s32 desc_params[UCLOGIC_RDESC_PH_ID_NUM];
@@ -1614,8 +1619,8 @@ static int uclogic_params_init_ugee_xppen_pro_22r(struct uclogic_params *params,
 
 	/* Initialize the pen interface */
 	rdesc_pen = uclogic_rdesc_template_apply(
-				uclogic_rdesc_ugee_v2_pen_template_arr,
-				uclogic_rdesc_ugee_v2_pen_template_size,
+				rdesc_pen_arr,
+				rdesc_pen_size,
 				desc_params, ARRAY_SIZE(desc_params));
 	if (!rdesc_pen) {
 		rc = -ENOMEM;
@@ -1623,7 +1628,7 @@ static int uclogic_params_init_ugee_xppen_pro_22r(struct uclogic_params *params,
 	}
 
 	p.pen.desc_ptr = rdesc_pen;
-	p.pen.desc_size = uclogic_rdesc_ugee_v2_pen_template_size;
+	p.pen.desc_size = rdesc_pen_size;
 	p.pen.id = 0x02;
 	p.pen.subreport_list[0].value = 0xf0;
 	p.pen.subreport_list[0].id = UCLOGIC_RDESC_V1_FRAME_ID;
@@ -1970,10 +1975,30 @@ int uclogic_params_init(struct uclogic_params *params,
 		break;
 	case VID_PID(USB_VENDOR_ID_UGEE,
 			USB_DEVICE_ID_UGEE_XPPEN_TABLET_22R_PRO):
-		rc = uclogic_params_init_ugee_xppen_pro_22r(&p,
+		rc = uclogic_params_init_ugee_xppen_pro(&p,
 			hdev,
+			uclogic_rdesc_ugee_v2_pen_template_arr,
+			uclogic_rdesc_ugee_v2_pen_template_size,
 			uclogic_rdesc_xppen_artist_22r_pro_frame_arr,
-			uclogic_rdesc_xppen_artist_22r_pro_frame_size);
+			uclogic_rdesc_xppen_artist_22r_pro_frame_size,
+			12);
+		if (rc != 0)
+			goto cleanup;
+
+		break;
+	case VID_PID(USB_VENDOR_ID_UGEE,
+			USB_DEVICE_ID_UGEE_XPPEN_TABLET_24_PRO):
+		rc = uclogic_params_init_ugee_xppen_pro(&p,
+			hdev,
+			uclogic_rdesc_xppen_artist_24_pro_pen_template_arr,
+			uclogic_rdesc_xppen_artist_24_pro_pen_template_size,
+			uclogic_rdesc_xppen_artist_24_pro_frame_arr,
+			uclogic_rdesc_xppen_artist_24_pro_frame_size,
+			14);
+
+		// The 24 Pro has a fragmented X Coord.
+		p.pen.fragmented_hires2 = true;
+
 		if (rc != 0)
 			goto cleanup;
 
diff --git a/drivers/hid/hid-uclogic-params.h b/drivers/hid/hid-uclogic-params.h
index 6ec8643d2ee5..c84ff17fb5d5 100644
--- a/drivers/hid/hid-uclogic-params.h
+++ b/drivers/hid/hid-uclogic-params.h
@@ -103,6 +103,11 @@ struct uclogic_params_pen {
 	 * Only valid if "id" is not zero.
 	 */
 	bool tilt_y_flipped;
+	/*
+	 * True, if reports include fragmented high resolution X coords.
+	 * This moves bytes 10-11 to the LSB of the X coordinate.
+	 */
+	bool fragmented_hires2;
 };
 
 /*
diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index 08a89c6aae3b..a1b31511b625 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -1237,6 +1237,131 @@ const __u8 uclogic_rdesc_xppen_artist_22r_pro_frame_arr[] = {
 const size_t uclogic_rdesc_xppen_artist_22r_pro_frame_size =
 				sizeof(uclogic_rdesc_xppen_artist_22r_pro_frame_arr);
 
+/* Fixed report descriptor template for XP-PEN 24 Pro reports
+ * Mostly identical to uclogic_rdesc_ugee_v2_pen_template_arr except that the X coordinate has to be
+ * 32-bits instead of 16-bits.
+ */
+const __u8 uclogic_rdesc_xppen_artist_24_pro_pen_template_arr[] = {
+	0x05, 0x0d,         /*  Usage Page (Digitizers),                */
+	0x09, 0x01,         /*  Usage (Digitizer),                      */
+	0xa1, 0x01,         /*  Collection (Application),               */
+	0x85, 0x02,         /*      Report ID (2),                      */
+	0x09, 0x20,         /*      Usage (Stylus),                     */
+	0xa1, 0x00,         /*      Collection (Physical),              */
+	0x09, 0x42,         /*          Usage (Tip Switch),             */
+	0x09, 0x44,         /*          Usage (Barrel Switch),          */
+	0x09, 0x46,         /*          Usage (Tablet Pick),            */
+	0x75, 0x01,         /*          Report Size (1),                */
+	0x95, 0x03,         /*          Report Count (3),               */
+	0x14,               /*          Logical Minimum (0),            */
+	0x25, 0x01,         /*          Logical Maximum (1),            */
+	0x81, 0x02,         /*          Input (Variable),               */
+	0x95, 0x02,         /*          Report Count (2),               */
+	0x81, 0x03,         /*          Input (Constant, Variable),     */
+	0x09, 0x32,         /*          Usage (In Range),               */
+	0x95, 0x01,         /*          Report Count (1),               */
+	0x81, 0x02,         /*          Input (Variable),               */
+	0x95, 0x02,         /*          Report Count (2),               */
+	0x81, 0x03,         /*          Input (Constant, Variable),     */
+	0x75, 0x10,         /*          Report Size (16),               */
+	0x95, 0x01,         /*          Report Count (1),               */
+	0x35, 0x00,         /*          Physical Minimum (0),           */
+	0xa4,               /*          Push,                           */
+	0x05, 0x01,         /*          Usage Page (Desktop),           */
+	0x09, 0x30,         /*          Usage (X),                      */
+	0x65, 0x13,         /*          Unit (Inch),                    */
+	0x55, 0x0d,         /*          Unit Exponent (-3),             */
+	0x27, UCLOGIC_RDESC_PEN_PH(X_LM),
+			    /*          Logical Maximum (PLACEHOLDER),  */
+	0x47, UCLOGIC_RDESC_PEN_PH(X_PM),
+			    /*          Physical Maximum (PLACEHOLDER), */
+	0x75, 0x20,         /*          Report Size (32),               */
+	0x81, 0x02,         /*          Input (Variable),               */
+	0x75, 0x10,         /*          Report Size (16),               */
+	0x09, 0x31,         /*          Usage (Y),                      */
+	0x27, UCLOGIC_RDESC_PEN_PH(Y_LM),
+			    /*          Logical Maximum (PLACEHOLDER),  */
+	0x47, UCLOGIC_RDESC_PEN_PH(Y_PM),
+			    /*          Physical Maximum (PLACEHOLDER), */
+	0x81, 0x02,         /*          Input (Variable),               */
+	0xb4,               /*          Pop,                            */
+	0x09, 0x30,         /*          Usage (Tip Pressure),           */
+	0x45, 0x00,         /*          Physical Maximum (0),           */
+	0x27, UCLOGIC_RDESC_PEN_PH(PRESSURE_LM),
+			    /*          Logical Maximum (PLACEHOLDER),  */
+	0x75, 0x0D,         /*          Report Size (13),               */
+	0x95, 0x01,         /*          Report Count (1),               */
+	0x81, 0x02,         /*          Input (Variable),               */
+	0x75, 0x01,         /*          Report Size (1),                */
+	0x95, 0x03,         /*          Report Count (3),               */
+	0x81, 0x01,         /*          Input (Constant),               */
+	0x09, 0x3d,         /*          Usage (X Tilt),                 */
+	0x35, 0xC3,         /*          Physical Minimum (-61),         */
+	0x45, 0x3C,         /*          Physical Maximum (60),          */
+	0x15, 0xC3,         /*          Logical Minimum (-61),          */
+	0x25, 0x3C,         /*          Logical Maximum (60),           */
+	0x75, 0x08,         /*          Report Size (8),                */
+	0x95, 0x01,         /*          Report Count (1),               */
+	0x81, 0x02,         /*          Input (Variable),               */
+	0x09, 0x3e,         /*          Usage (Y Tilt),                 */
+	0x35, 0xC3,         /*          Physical Minimum (-61),         */
+	0x45, 0x3C,         /*          Physical Maximum (60),          */
+	0x15, 0xC3,         /*          Logical Minimum (-61),          */
+	0x25, 0x3C,         /*          Logical Maximum (60),           */
+	0x81, 0x02,         /*          Input (Variable),               */
+	0xc0,               /*      End Collection,                     */
+	0xc0,               /*  End Collection                          */
+};
+const size_t uclogic_rdesc_xppen_artist_24_pro_pen_template_size =
+			sizeof(uclogic_rdesc_xppen_artist_24_pro_pen_template_arr);
+
+/* Fixed report descriptor for XP-Pen Arist 24 Pro frame */
+const __u8 uclogic_rdesc_xppen_artist_24_pro_frame_arr[] = {
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
+	0x75, 0x01,         /*          Report Size (1),                    */
+	0x95, 16,           /*          Report Count (16),                  */
+	0x81, 0x01,         /*          Input (Constant),                   */
+	0xC0,               /*      End Collection                          */
+	0xC0,               /*  End Collection                              */
+};
+
+const size_t uclogic_rdesc_xppen_artist_24_pro_frame_size =
+				sizeof(uclogic_rdesc_xppen_artist_24_pro_frame_arr);
+
 /**
  * uclogic_rdesc_template_apply() - apply report descriptor parameters to a
  * report descriptor template, creating a report descriptor. Copies the
diff --git a/drivers/hid/hid-uclogic-rdesc.h b/drivers/hid/hid-uclogic-rdesc.h
index 644a35ff12f2..0619daa6849d 100644
--- a/drivers/hid/hid-uclogic-rdesc.h
+++ b/drivers/hid/hid-uclogic-rdesc.h
@@ -214,4 +214,12 @@ extern const size_t uclogic_rdesc_ugee_g5_frame_size;
 extern const __u8 uclogic_rdesc_xppen_artist_22r_pro_frame_arr[];
 extern const size_t uclogic_rdesc_xppen_artist_22r_pro_frame_size;
 
+/* Fixed report descriptor for XP-Pen Arist 24 Pro frame */
+extern const __u8 uclogic_rdesc_xppen_artist_24_pro_pen_template_arr[];
+extern const size_t uclogic_rdesc_xppen_artist_24_pro_pen_template_size;
+
+/* Fixed report descriptor for XP-Pen Arist 24 Pro frame */
+extern const __u8 uclogic_rdesc_xppen_artist_24_pro_frame_arr[];
+extern const size_t uclogic_rdesc_xppen_artist_24_pro_frame_size;
+
 #endif /* _HID_UCLOGIC_RDESC_H */
-- 
2.51.0



Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B64612CBA5
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfL3B1p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:45 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:37453 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfL3B1p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:45 -0500
Received: by mail-yw1-f67.google.com with SMTP id z7so13582413ywd.4
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C8uDRIWzMyMW2I9LxpkDqdaXx13zyHsQRAGPxFlb2KY=;
        b=NAYcdOa9ZEnBQMbHFigNziSR62pSRKP9UmR8xixoE9yOKxSQYJ/tX8rGNq8hqUIBUZ
         Z5GDi2IpHQNgIabwVkhxVltRmhx2iZVHzkXSW4VqTXmzfhGsq1W8wLArGB1poAU8Kvvy
         GQb0WxQ+AOhZ7HyuUMfVkKpb21aNwzuZ5/4C3r+qOYS34Pdi9vJt8a5UjA885WF4nOdN
         RinuEkfVNaGThkfuqsueo2N5Be5nH4Lc9YBJ5ni8xB6evY1xIf2VKbIU+UVs52ze+Hm+
         oIvZwSyj+3DK2BhfII1w07vlxzq9JckvnGT5sJ76eQ0ZDbZDvy0HnQEp7cjg/Ixwy7Rc
         rL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C8uDRIWzMyMW2I9LxpkDqdaXx13zyHsQRAGPxFlb2KY=;
        b=fwkn2y0jCEdWZ9VTf6B1Jii4dchLo9Xk72OfZUMli9KCdAtv0/ACcCmdhoIoeACfz7
         f+Zq/NuYRk9y1nyB7xxpeoMEVUlA4I4Lke+ENkcWrVVNnKXyVBuz+50I589JrVViddIg
         87LGb1QhWHy9X2IlKPA65dsQgBId/hTpe71EMjvKI8sKVvrZI3pDNMPhcpg2JySA/UJW
         cfLv8huHSzJL8h2hCQeU9V+KUkES5OirbqVXHGVNThRBHUjwL05VQy2t1Tr9Pid/4zkE
         kjyTszJjg+VTQuNjdD1fE7HaFVzk8xGQDu5HEXzfs0nnrmLn+yhAkwl6Sq0uzo7b5zl6
         oXjQ==
X-Gm-Message-State: APjAAAXkfl6gdcbhC0+aY6F8w0UwDjFCgpA6TTSOXiDmIjRsSNnV+RkH
        weGmcBsNq5fobCSHs5YOv01Savm/XgE=
X-Google-Smtp-Source: APXvYqy05sQUe1vXh9fXmaSJ0Bcz+aDnuWybgQngQ9moCEweiZdDm5XJnQ8+3SXmX3rAoAlosnA6vw==
X-Received: by 2002:a81:ac64:: with SMTP id z36mr46017748ywj.40.1577669263996;
        Sun, 29 Dec 2019 17:27:43 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:42 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 12/12] HID: nintendo: add support for charging grip
Date:   Sun, 29 Dec 2019 19:27:20 -0600
Message-Id: <20191230012720.2368987-13-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230012720.2368987-1-djogorchock@gmail.com>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the joy-con charging grip. The peripheral
essentially behaves the same as a pro controller, but with two joy-cons
attached to the grip. However the grip exposes the two joy-cons as
separate hid devices, so extra handling is required. The joy-con is
queried to check if it is a right or left joy-con (since the product ID
is identical between left/right when using the grip).

Since controller model detection is now more complicated, the various
checks for hid product values have been replaced with helper macros to
reduce code duplication.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-ids.h      |  1 +
 drivers/hid/hid-nintendo.c | 87 ++++++++++++++++++++++++++++----------
 2 files changed, 65 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5e3e872feb29..89807f826e5f 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -871,6 +871,7 @@
 #define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
 #define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
 #define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
+#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200E
 
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index edf2ef140cb3..b86588a2ccc3 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -245,6 +245,13 @@ enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_REMOVED,
 };
 
+/* Controller type received as part of device info */
+enum joycon_ctlr_type {
+	JOYCON_CTLR_TYPE_JCL = 0x01,
+	JOYCON_CTLR_TYPE_JCR = 0x02,
+	JOYCON_CTLR_TYPE_PRO = 0x03,
+};
+
 struct joycon_stick_cal {
 	s32 max;
 	s32 min;
@@ -350,6 +357,7 @@ struct joycon_ctlr {
 	spinlock_t lock;
 	u8 mac_addr[6];
 	char *mac_addr_str;
+	enum joycon_ctlr_type ctlr_type;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -395,6 +403,26 @@ struct joycon_ctlr {
 	int timestamp;
 };
 
+/* Helper macros for checking controller type */
+#define jc_type_is_joycon(ctlr) \
+	(ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONL || \
+	 ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONR || \
+	 ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_CHRGGRIP)
+#define jc_type_is_procon(ctlr) \
+	(ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_PROCON)
+#define jc_type_is_chrggrip(ctlr) \
+	(ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_CHRGGRIP)
+
+/* Does this controller have inputs associated with left joycon? */
+#define jc_type_has_left(ctlr) \
+	(ctlr->ctlr_type == JOYCON_CTLR_TYPE_JCL || \
+	 ctlr->ctlr_type == JOYCON_CTLR_TYPE_PRO)
+
+/* Does this controller have inputs associated with right joycon? */
+#define jc_type_has_right(ctlr) \
+	(ctlr->ctlr_type == JOYCON_CTLR_TYPE_JCR || \
+	 ctlr->ctlr_type == JOYCON_CTLR_TYPE_PRO)
+
 static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
 {
 	u8 *buf;
@@ -785,7 +813,6 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	unsigned long flags;
 	u8 tmp;
 	u32 btns;
-	u32 id = ctlr->hdev->product;
 	unsigned long msecs = jiffies_to_msecs(jiffies);
 
 	spin_lock_irqsave(&ctlr->lock, flags);
@@ -824,7 +851,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	/* Parse the buttons and sticks */
 	btns = hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
 
-	if (id != USB_DEVICE_ID_NINTENDO_JOYCONR) {
+	if (jc_type_has_left(ctlr)) {
 		u16 raw_x;
 		u16 raw_y;
 		s32 x;
@@ -844,7 +871,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		/* report buttons */
 		input_report_key(dev, BTN_TL, btns & JC_BTN_L);
 		input_report_key(dev, BTN_TL2, btns & JC_BTN_ZL);
-		if (id != USB_DEVICE_ID_NINTENDO_PROCON) {
+		if (jc_type_is_joycon(ctlr)) {
 			/* Report the S buttons as the non-existent triggers */
 			input_report_key(dev, BTN_TR, btns & JC_BTN_SL_L);
 			input_report_key(dev, BTN_TR2, btns & JC_BTN_SR_L);
@@ -857,7 +884,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		input_report_key(dev, BTN_DPAD_RIGHT, btns & JC_BTN_RIGHT);
 		input_report_key(dev, BTN_DPAD_LEFT, btns & JC_BTN_LEFT);
 	}
-	if (id != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		u16 raw_x;
 		u16 raw_y;
 		s32 x;
@@ -877,7 +904,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		/* report buttons */
 		input_report_key(dev, BTN_TR, btns & JC_BTN_R);
 		input_report_key(dev, BTN_TR2, btns & JC_BTN_ZR);
-		if (id != USB_DEVICE_ID_NINTENDO_PROCON) {
+		if (jc_type_is_joycon(ctlr)) {
 			/* Report the S buttons as the non-existent triggers */
 			input_report_key(dev, BTN_TL, btns & JC_BTN_SL_R);
 			input_report_key(dev, BTN_TL2, btns & JC_BTN_SR_R);
@@ -1142,6 +1169,15 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 		name = "Nintendo Switch Pro Controller";
 		imu_name = "Nintendo Switch Pro Controller IMU";
 		break;
+	case USB_DEVICE_ID_NINTENDO_CHRGGRIP:
+		if (jc_type_has_left(ctlr)) {
+			name = "Nintendo Switch Left Joy-Con (Grip)";
+			imu_name = "Nintendo Switch Left Joy-Con IMU (Grip)";
+		} else {
+			name = "Nintendo Switch Right Joy-Con (Grip)";
+			imu_name = "Nintendo Switch Right Joy-Con IMU (Grip)";
+		}
+		break;
 	case USB_DEVICE_ID_NINTENDO_JOYCONL:
 		name = "Nintendo Switch Left Joy-Con";
 		imu_name = "Nintendo Switch Left Joy-Con IMU";
@@ -1166,32 +1202,28 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->input->name = name;
 	input_set_drvdata(ctlr->input, ctlr);
 
-
-	/* set up sticks */
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONR) {
+	if (jc_type_has_left(ctlr)) {
+		/* set up sticks */
 		input_set_abs_params(ctlr->input, ABS_X,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
 		input_set_abs_params(ctlr->input, ABS_Y,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
+		/* set up buttons */
+		for (i = 0; joycon_button_inputs_l[i] > 0; i++)
+			input_set_capability(ctlr->input, EV_KEY,
+					     joycon_button_inputs_l[i]);
 	}
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
+		/* set up sticks */
 		input_set_abs_params(ctlr->input, ABS_RX,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
 		input_set_abs_params(ctlr->input, ABS_RY,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
-	}
-
-	/* set up buttons */
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONR) {
-		for (i = 0; joycon_button_inputs_l[i] > 0; i++)
-			input_set_capability(ctlr->input, EV_KEY,
-					     joycon_button_inputs_l[i]);
-	}
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+		/* set up buttons */
 		for (i = 0; joycon_button_inputs_r[i] > 0; i++)
 			input_set_capability(ctlr->input, EV_KEY,
 					     joycon_button_inputs_r[i]);
@@ -1392,7 +1424,7 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 	mutex_unlock(&joycon_input_num_mutex);
 
 	/* configure the home LED */
-	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name, "home");
 		if (!name)
 			return ret;
@@ -1504,7 +1536,7 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
 	return 0;
 }
 
-static int joycon_read_mac(struct joycon_ctlr *ctlr)
+static int joycon_read_info(struct joycon_ctlr *ctlr)
 {
 	int ret;
 	int i;
@@ -1536,6 +1568,9 @@ static int joycon_read_mac(struct joycon_ctlr *ctlr)
 		return -ENOMEM;
 	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
 
+	/* Retrieve the type so we can distinguish for charging grip */
+	ctlr->ctlr_type = report->subcmd_reply.data[2];
+
 	return 0;
 }
 
@@ -1671,7 +1706,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	/* Initialize the controller */
 	mutex_lock(&ctlr->output_mutex);
 	/* if handshake command fails, assume ble pro controller */
-	if (hdev->product == USB_DEVICE_ID_NINTENDO_PROCON &&
+	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
 	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
 		hid_dbg(hdev, "detected USB controller\n");
 		/* set baudrate for improved latency */
@@ -1691,6 +1726,10 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		 * This doesn't send a response, so ignore the timeout.
 		 */
 		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
+	} else if (jc_type_is_chrggrip(ctlr)) {
+		hid_err(hdev, "Failed charging grip handshake\n");
+		ret = -ETIMEDOUT;
+		goto err_mutex;
 	}
 
 	/* get controller calibration data, and parse it */
@@ -1734,9 +1773,9 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_mutex;
 	}
 
-	ret = joycon_read_mac(ctlr);
+	ret = joycon_read_info(ctlr);
 	if (ret) {
-		hid_err(hdev, "Failed to retrieve controller MAC; ret=%d\n",
+		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
 			ret);
 		goto err_close;
 	}
@@ -1804,6 +1843,8 @@ static const struct hid_device_id nintendo_hid_devices[] = {
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_CHRGGRIP) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_JOYCONL) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
-- 
2.24.1


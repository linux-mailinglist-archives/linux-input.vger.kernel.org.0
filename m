Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1180187834
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgCQDaO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:30:14 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:40129 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgCQDaO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:30:14 -0400
Received: by mail-qv1-f68.google.com with SMTP id cy12so4245912qvb.7
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WsCbaQNaqexxH2AzD3qg2AWXRMQJdjg1yUnDdNJB9es=;
        b=NMP1VvFZeYoJtSQZpjZABRjhjSbALlSlrPk4YJRnj/3V7yw2LKBVpN4jZfa+l7T69b
         gD2gkWkE+aCgDGuIyvhuyCI+kCRgEq9YOVXElaXd/Tr2uUYqZy744+lnLF1r+P2V584M
         3FEttyNnLz9tBxaWA11cLfSwrp7A3vfY21vUg7kGvLL7FjXtQUv5OSkkYHogtfRlg5ca
         4psa8bD3QyAxEB8ywJWrxL6I8zIFkvxqyJIk1FveTqcVORI+Ke9GtguX1wJ+EZxo/aAc
         sX6uNIZH0B5+K5ILg/2l/c0m0/okOegcw4amGQsMkbe3UAWqofYzfYwKgYLWzcdIlje/
         1CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WsCbaQNaqexxH2AzD3qg2AWXRMQJdjg1yUnDdNJB9es=;
        b=G+FLNGu1U662c4ac/drpj5ALTsL6TmpNIboDUy+8VZM2+zjXCqzy/JUaX0ivWqnx0v
         F9E692TYKSx1s5yb3KIBlCEDT/rHeGIrQOeDCK8chOKiDCSepUtx4R/Uk9u0Agd03WVS
         +NiurSMS1f+bVSNJw7L1Y9ca1Fv4v/QjlSaP2X79yGgeyHhUb97ix+cB7CKBo+oXc533
         Zj02T6NeogFMxMXbtgtWZsOpjV/poFeZ+ixDUwya2IoT6SeJmhHv6bBSsOQgO6R4sWYo
         +csjcXVtGgugACyVRIrjmiQ0m6DHwKcE0/9gpeSViyWeAnkHT85Fw42wTnYmfm034vp8
         VfxQ==
X-Gm-Message-State: ANhLgQ3Qk6cpiFUTKxwKOoJdASwLwv8pfywSo4ZqC22mlbt3kC/+putH
        AqXc4rpqExUs/Se3G3AUPTUTLc9x8g8=
X-Google-Smtp-Source: ADFU+vv5SKMJ12Egj+pK174X9S1k3J01LzTPSxIVXuVB0y5xr1IajDymKWHZtv32WgYSD5hI333ibQ==
X-Received: by 2002:a0c:a2c4:: with SMTP id g62mr3039603qva.107.1584415811842;
        Mon, 16 Mar 2020 20:30:11 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:30:10 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 11/11] HID: nintendo: add support for charging grip
Date:   Mon, 16 Mar 2020 22:29:28 -0500
Message-Id: <20200317032928.546172-12-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
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
 drivers/hid/hid-nintendo.c | 67 ++++++++++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 452b4228a196..e50f3f32d94e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -878,6 +878,7 @@
 #define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
 #define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
 #define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
+#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200E
 
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index dbd5946f71e1..69505193b367 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -233,6 +233,13 @@ enum joycon_ctlr_state {
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
@@ -321,6 +328,7 @@ struct joycon_ctlr {
 	spinlock_t lock;
 	u8 mac_addr[6];
 	char *mac_addr_str;
+	enum joycon_ctlr_type ctlr_type;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -359,6 +367,26 @@ struct joycon_ctlr {
 	u16 rumble_rh_freq;
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
@@ -655,7 +683,6 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	unsigned long flags;
 	u8 tmp;
 	u32 btns;
-	u32 id = ctlr->hdev->product;
 	unsigned long msecs = jiffies_to_msecs(jiffies);
 
 	spin_lock_irqsave(&ctlr->lock, flags);
@@ -694,7 +721,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	/* Parse the buttons and sticks */
 	btns = hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
 
-	if (id != USB_DEVICE_ID_NINTENDO_JOYCONR) {
+	if (jc_type_has_left(ctlr)) {
 		u16 raw_x;
 		u16 raw_y;
 		s32 x;
@@ -718,7 +745,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		input_report_key(dev, BTN_THUMBL, btns & JC_BTN_LSTICK);
 		input_report_key(dev, BTN_Z, btns & JC_BTN_CAP);
 
-		if (id != USB_DEVICE_ID_NINTENDO_PROCON) {
+		if (jc_type_is_joycon(ctlr)) {
 			/* Report the S buttons as the non-existent triggers */
 			input_report_key(dev, BTN_TR, btns & JC_BTN_SL_L);
 			input_report_key(dev, BTN_TR2, btns & JC_BTN_SR_L);
@@ -750,7 +777,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 			input_report_abs(dev, ABS_HAT0Y, haty);
 		}
 	}
-	if (id != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		u16 raw_x;
 		u16 raw_y;
 		s32 x;
@@ -770,7 +797,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		/* report buttons */
 		input_report_key(dev, BTN_TR, btns & JC_BTN_R);
 		input_report_key(dev, BTN_TR2, btns & JC_BTN_ZR);
-		if (id != USB_DEVICE_ID_NINTENDO_PROCON) {
+		if (jc_type_is_joycon(ctlr)) {
 			/* Report the S buttons as the non-existent triggers */
 			input_report_key(dev, BTN_TL, btns & JC_BTN_SL_R);
 			input_report_key(dev, BTN_TL2, btns & JC_BTN_SR_R);
@@ -989,6 +1016,12 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	case USB_DEVICE_ID_NINTENDO_PROCON:
 		name = "Nintendo Switch Pro Controller";
 		break;
+	case USB_DEVICE_ID_NINTENDO_CHRGGRIP:
+		if (jc_type_has_left(ctlr))
+			name = "Nintendo Switch Left Joy-Con (Grip)";
+		else
+			name = "Nintendo Switch Right Joy-Con (Grip)";
+		break;
 	case USB_DEVICE_ID_NINTENDO_JOYCONL:
 		name = "Nintendo Switch Left Joy-Con";
 		break;
@@ -1011,9 +1044,8 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->input->name = name;
 	input_set_drvdata(ctlr->input, ctlr);
 
-
 	/* set up sticks and buttons */
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONR) {
+	if (jc_type_has_left(ctlr)) {
 		input_set_abs_params(ctlr->input, ABS_X,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
@@ -1039,7 +1071,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 					     JC_DPAD_FUZZ, JC_DPAD_FLAT);
 		}
 	}
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		input_set_abs_params(ctlr->input, ABS_RX,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
@@ -1207,7 +1239,7 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 	mutex_unlock(&joycon_input_num_mutex);
 
 	/* configure the home LED */
-	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name, "home");
 		if (!name)
 			return ret;
@@ -1319,7 +1351,7 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
 	return 0;
 }
 
-static int joycon_read_mac(struct joycon_ctlr *ctlr)
+static int joycon_read_info(struct joycon_ctlr *ctlr)
 {
 	int ret;
 	int i;
@@ -1351,6 +1383,9 @@ static int joycon_read_mac(struct joycon_ctlr *ctlr)
 		return -ENOMEM;
 	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
 
+	/* Retrieve the type so we can distinguish for charging grip */
+	ctlr->ctlr_type = report->reply.data[2];
+
 	return 0;
 }
 
@@ -1486,7 +1521,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	/* Initialize the controller */
 	mutex_lock(&ctlr->output_mutex);
 	/* if handshake command fails, assume ble pro controller */
-	if (hdev->product == USB_DEVICE_ID_NINTENDO_PROCON &&
+	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
 	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
 		hid_dbg(hdev, "detected USB controller\n");
 		/* set baudrate for improved latency */
@@ -1506,6 +1541,10 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		 * This doesn't send a response, so ignore the timeout.
 		 */
 		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
+	} else if (jc_type_is_chrggrip(ctlr)) {
+		hid_err(hdev, "Failed charging grip handshake\n");
+		ret = -ETIMEDOUT;
+		goto err_mutex;
 	}
 
 	/* get controller calibration data, and parse it */
@@ -1532,9 +1571,9 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
@@ -1602,6 +1641,8 @@ static const struct hid_device_id nintendo_hid_devices[] = {
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_CHRGGRIP) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_JOYCONL) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
-- 
2.25.1


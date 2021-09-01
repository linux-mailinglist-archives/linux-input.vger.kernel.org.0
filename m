Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F133FE66D
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238899AbhIAXn5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXn5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:57 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0ABCC061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:59 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id x5so44418qtq.13
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/CjUU/0Eefcmqe/LFifEgG3xgk28fO5+EffKmQo1GhA=;
        b=bgimSxzhwaYegKpTG1VGlTWZ4iZE7dpl2um2PRUVH49uTn6BnWnMmnkvJQT+NbbxNX
         lY8aoaooMdp09GSlfxihEB1BggxRcAm+vKP9wvhwQDoQkADVIebDoxKSqSphQgOGCpXT
         Zxt9kowdBquqW9X9TZbcs60oShZL7C959Dohz3oCMtUbZkEsGHy9RFFjo5eCBmmJmHCx
         9gcRDn18R/HIlR6kyXZTJW/iclBRrDOvMrSOLm7D2Rq4pTf3j7HDAnez9UoT2dHSh8DU
         RO1hDSSnF29HZHlYBx8GYKv+7UNwwZw79m/ogEG3kPVNNzJvLikf82vp2LQ23oJ5NbDv
         RjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/CjUU/0Eefcmqe/LFifEgG3xgk28fO5+EffKmQo1GhA=;
        b=SjOwv5DNMrdiqcBTxsd//BsqwPwv611CMbSvWHwYESQYpjDj67nyWzOJZD1lm42amD
         42Bh0w+IpAJGnrLfEbjIiM17+IuW7om1PpbUum9f/ftgoBr61cIpRg3c6dFsuZJTv0Dk
         UgqncTQVNwapw9dPDeoR+xqHvYPskpEa+d/hLLUz5omMUOZ9EucYFDVUsGmkYBlNLrsR
         cc+WeEhf/aWDDklhOLVkJjWAdQLPkS/LUFhojZmcgGLZfpfWVrxrmNYWU29fCKxUxn8I
         FD2jkzQgitcUWt+GIuxsY1tTebH7j20/5LvAvjIgtt2NONNRkiDsLw3Chvr/teZ44aDD
         jPTg==
X-Gm-Message-State: AOAM531x60Bu9qOtMcCW9rBG4MM71bzYVDBN2LmNua4bnUk2gYEPFaMh
        V1MLN78COFow67PI+CuhbA8LbyurukY=
X-Google-Smtp-Source: ABdhPJxihzjVe3AMvu28l8I14S5mT63d55B3EMTRIfOd0A6pQHFOTgn1DDCoIbdrIt1/S03SmQypvA==
X-Received: by 2002:ac8:7516:: with SMTP id u22mr325274qtq.119.1630539778979;
        Wed, 01 Sep 2021 16:42:58 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:58 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 11/16] HID: nintendo: add support for charging grip
Date:   Wed,  1 Sep 2021 19:42:31 -0400
Message-Id: <20210901234236.3113-12-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 5420f288d2aa0..fe1c0cbedfaac 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -921,6 +921,7 @@
 #define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
 #define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
 #define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
+#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200E
 
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 4b72e92e0ff4d..dcfb80d829713 100644
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
@@ -328,6 +335,7 @@ struct joycon_ctlr {
 	spinlock_t lock;
 	u8 mac_addr[6];
 	char *mac_addr_str;
+	enum joycon_ctlr_type ctlr_type;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -366,6 +374,26 @@ struct joycon_ctlr {
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
@@ -662,7 +690,6 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	unsigned long flags;
 	u8 tmp;
 	u32 btns;
-	u32 id = ctlr->hdev->product;
 	unsigned long msecs = jiffies_to_msecs(jiffies);
 
 	spin_lock_irqsave(&ctlr->lock, flags);
@@ -701,7 +728,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	/* Parse the buttons and sticks */
 	btns = hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
 
-	if (id != USB_DEVICE_ID_NINTENDO_JOYCONR) {
+	if (jc_type_has_left(ctlr)) {
 		u16 raw_x;
 		u16 raw_y;
 		s32 x;
@@ -725,7 +752,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		input_report_key(dev, BTN_THUMBL, btns & JC_BTN_LSTICK);
 		input_report_key(dev, BTN_Z, btns & JC_BTN_CAP);
 
-		if (id != USB_DEVICE_ID_NINTENDO_PROCON) {
+		if (jc_type_is_joycon(ctlr)) {
 			/* Report the S buttons as the non-existent triggers */
 			input_report_key(dev, BTN_TR, btns & JC_BTN_SL_L);
 			input_report_key(dev, BTN_TR2, btns & JC_BTN_SR_L);
@@ -757,7 +784,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 			input_report_abs(dev, ABS_HAT0Y, haty);
 		}
 	}
-	if (id != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		u16 raw_x;
 		u16 raw_y;
 		s32 x;
@@ -777,7 +804,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		/* report buttons */
 		input_report_key(dev, BTN_TR, btns & JC_BTN_R);
 		input_report_key(dev, BTN_TR2, btns & JC_BTN_ZR);
-		if (id != USB_DEVICE_ID_NINTENDO_PROCON) {
+		if (jc_type_is_joycon(ctlr)) {
 			/* Report the S buttons as the non-existent triggers */
 			input_report_key(dev, BTN_TL, btns & JC_BTN_SL_R);
 			input_report_key(dev, BTN_TL2, btns & JC_BTN_SR_R);
@@ -996,6 +1023,12 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
@@ -1018,9 +1051,8 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->input->name = name;
 	input_set_drvdata(ctlr->input, ctlr);
 
-
 	/* set up sticks and buttons */
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONR) {
+	if (jc_type_has_left(ctlr)) {
 		input_set_abs_params(ctlr->input, ABS_X,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
@@ -1046,7 +1078,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 					     JC_DPAD_FUZZ, JC_DPAD_FLAT);
 		}
 	}
-	if (hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		input_set_abs_params(ctlr->input, ABS_RX,
 				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
 				     JC_STICK_FUZZ, JC_STICK_FLAT);
@@ -1209,7 +1241,7 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 	mutex_unlock(&joycon_input_num_mutex);
 
 	/* configure the home LED */
-	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+	if (jc_type_has_right(ctlr)) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
 				      d_name,
 				      "blue",
@@ -1325,7 +1357,7 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
 	return power_supply_powers(ctlr->battery, &hdev->dev);
 }
 
-static int joycon_read_mac(struct joycon_ctlr *ctlr)
+static int joycon_read_info(struct joycon_ctlr *ctlr)
 {
 	int ret;
 	int i;
@@ -1357,6 +1389,9 @@ static int joycon_read_mac(struct joycon_ctlr *ctlr)
 		return -ENOMEM;
 	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
 
+	/* Retrieve the type so we can distinguish for charging grip */
+	ctlr->ctlr_type = report->reply.data[2];
+
 	return 0;
 }
 
@@ -1490,7 +1525,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	/* Initialize the controller */
 	mutex_lock(&ctlr->output_mutex);
 	/* if handshake command fails, assume ble pro controller */
-	if (hdev->product == USB_DEVICE_ID_NINTENDO_PROCON &&
+	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
 	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
 		hid_dbg(hdev, "detected USB controller\n");
 		/* set baudrate for improved latency */
@@ -1510,6 +1545,10 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		 * This doesn't send a response, so ignore the timeout.
 		 */
 		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
+	} else if (jc_type_is_chrggrip(ctlr)) {
+		hid_err(hdev, "Failed charging grip handshake\n");
+		ret = -ETIMEDOUT;
+		goto err_mutex;
 	}
 
 	/* get controller calibration data, and parse it */
@@ -1536,9 +1575,9 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_mutex;
 	}
 
-	ret = joycon_read_mac(ctlr);
+	ret = joycon_read_info(ctlr);
 	if (ret) {
-		hid_err(hdev, "Failed to retrieve controller MAC; ret=%d\n",
+		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
 			ret);
 		goto err_mutex;
 	}
@@ -1606,6 +1645,8 @@ static const struct hid_device_id nintendo_hid_devices[] = {
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_CHRGGRIP) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_JOYCONL) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
-- 
2.33.0


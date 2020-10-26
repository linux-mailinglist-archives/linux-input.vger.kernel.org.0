Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918F6299885
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 22:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgJZVEV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 17:04:21 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49105 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729640AbgJZVEV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 17:04:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2C0EE5C00F4;
        Mon, 26 Oct 2020 17:04:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 26 Oct 2020 17:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MmcNNdGH5UlgyKGt0
        NJp5mfw6W3meR7J2gBMRXhpURk=; b=PdHzXOs0jxqgOh5pttLeuHCmFfj+KZT13
        /LOgIMSmAN8eJNkOABWTSZJL0ERD+3tCKE2Sq9GsJoW81KZberM/GIBKffuOCz6J
        1ColDvVX5ZJcfM59ZUWB/85ELhtKnPPuWMLm2wfAheLAglW3ja1cyDU9Mg55aRa8
        5w2vYwvnFUC+AdmnV1FsB2EF1iLGXQdb6dvCpJfvSWOB2I/W07GPdyq79olbIewx
        5qaqkP4a0IEc1gMPyNacdJJ5Hd5u0oKVZ29hLFzjxXjl8e/CadnG9Vqles4NnNvj
        zX6kflbVCfN1C0HmzvrtYS82EoP3aKOK0rk2jlVwXnYkB6/GzLJXQ==
X-ME-Sender: <xms:0jmXXzvIU0ODPhkVtNuBgoCC5b58Wr46vpDJbHX1X6xUd-mSh3i-6Q>
    <xme:0jmXX0df6_hIeIEq6MKTQCfb_uvM-t48DXQxMGaZD3p_eRxuCQcFwepTeQm2fwLSu
    aPczGE-mGSmo1flYLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepnfhukhgvucffucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
    uggvvheqnecuggftrfgrthhtvghrnhepfffghfehheekgfdttdeihfdugeetkeduiefhvd
    dujeduiefgtdehieejtedvjedvnecukfhppedvtdefrdduudegrddugedurdduieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslh
    hjohhnvghsrdguvghv
X-ME-Proxy: <xmx:0jmXX2yzpdIim4WQu3BFAsVpjW-xtKOxuHlk5AQWs3JIFJ8n_Fknew>
    <xmx:0jmXXyPZM-QklQfPwHa-aLnlVQHshIiJ1pWudY00gRlcG9IRbFUuwQ>
    <xmx:0jmXXz-qsIGPRJcc7YP2OQUtwTz5TLbquoHlZLCmLH8NAbGnTtMz9g>
    <xmx:0zmXX1Igaeo6dESh9JCtH8mJCl5NNhi8RVe7_bJ2XGNui7-z5Ylsnw>
Received: from localhost.localdomain (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3F8823280059;
        Mon, 26 Oct 2020 17:04:16 -0400 (EDT)
From:   Luke D Jones <luke@ljones.dev>
To:     linux-input@vger.kernel.org
Cc:     hdegoede@redhat.com, jikos@kernel.org, andy@infradead.org,
        benjamin.tissoires@redhat.com, Luke D Jones <luke@ljones.dev>
Subject: [PATCH v10] HID: ASUS: Add support for ASUS N-Key keyboard
Date:   Tue, 27 Oct 2020 10:02:17 +1300
Message-Id: <20201026210216.103501-1-luke@ljones.dev>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
almost all modern ASUS gaming laptops with slight changes to the
firmware. This patch enables: Fn+key hotkeys, keyboard backlight
brightness control.

Additionally this keyboard requires the LED interface to be
initialized before such things as keyboard backlight control work.

Signed-off-by: Luke D Jones <luke@ljones.dev>

---
Changes v8-v10
- Remove asus_wmi_send_event and change Fn+F5 to emit
  KEY_PROG4. The ASUS G14-G15 laptops have a problem
  with freezes if the user spams this key to trigger
  asus_wmi_send_event(). It is better handled with a
  key-bind and daemon.
- Change cases of dev_warn to hid_warn.
- Remove out-of-scope changes which are better suited
  as separate patches.
---
 drivers/hid/hid-asus.c | 123 ++++++++++++++++++++++++++++++++++++-----
 drivers/hid/hid-ids.h  |   1 +
 2 files changed, 110 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index c183caf89d49..1dfe184ebf5a 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -48,6 +48,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define INPUT_REPORT_ID 0x5d
 #define FEATURE_KBD_REPORT_ID 0x5a
 #define FEATURE_KBD_REPORT_SIZE 16
+#define FEATURE_KBD_LED_REPORT_ID1 0x5d
+#define FEATURE_KBD_LED_REPORT_ID2 0x5e
 
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
@@ -80,6 +82,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_T101HA_DOCK		BIT(9)
 #define QUIRK_T90CHI			BIT(10)
 #define QUIRK_MEDION_E1239T		BIT(11)
+#define QUIRK_ROG_NKEY_KEYBOARD		BIT(12)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -332,6 +335,28 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (drvdata->quirks & QUIRK_MEDION_E1239T)
 		return asus_e1239t_event(drvdata, data, size);
 
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		/*
+		 * Skip these report ID, the device emits a continuous stream associated
+		 * with the AURA mode it is in which looks like an 'echo'.
+		*/
+		if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
+				report->id == FEATURE_KBD_LED_REPORT_ID2) {
+			return -1;
+		/* Additional report filtering */
+		} else if (report->id == FEATURE_KBD_REPORT_ID) {
+			/*
+			 * G14 and G15 send these codes on some keypresses with no
+			 * discernable reason for doing so. We'll filter them out to avoid
+			 * unmapped warning messages later.
+			*/
+			if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
+					data[1] == 0x8a || data[1] == 0x9e) {
+				return -1;
+			}
+		}
+	}
+
 	return 0;
 }
 
@@ -344,7 +369,11 @@ static int asus_kbd_set_report(struct hid_device *hdev, u8 *buf, size_t buf_size
 	if (!dmabuf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
+	/*
+	 * The report ID should be set from the incoming buffer due to LED and key
+	 * interfaces having different pages
+	*/
+	ret = hid_hw_raw_request(hdev, buf[0], dmabuf,
 				 buf_size, HID_FEATURE_REPORT,
 				 HID_REQ_SET_REPORT);
 	kfree(dmabuf);
@@ -397,6 +426,51 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	return ret;
 }
 
+static int rog_nkey_led_init(struct hid_device *hdev)
+{
+	u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
+	u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 0x53, 0x20,
+				0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+	u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
+						0x05, 0x20, 0x31, 0x00, 0x08 };
+	int ret;
+
+	hid_info(hdev, "Asus initialise N-KEY Device");
+	/* The first message is an init start */
+	ret = asus_kbd_set_report(hdev, buf_init_start, sizeof(buf_init_start));
+	if (ret < 0) {
+		hid_warn(hdev, "Asus failed to send init start command: %d\n", ret);
+		return ret;
+	}
+	/* Followed by a string */
+	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+	if (ret < 0) {
+		hid_warn(hdev, "Asus failed to send init command 1.0: %d\n", ret);
+		return ret;
+	}
+	/* Followed by a string */
+	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+	if (ret < 0) {
+		hid_warn(hdev, "Asus failed to send init command 1.1: %d\n", ret);
+		return ret;
+	}
+
+	/* begin second report ID with same data */
+	buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
+	buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
+
+	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+	if (ret < 0) {
+		hid_warn(hdev, "Asus failed to send init command 2.0: %d\n", ret);
+		return ret;
+	}
+	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+	if (ret < 0)
+		hid_warn(hdev, "Asus failed to send init command 2.1: %d\n", ret);
+
+	return ret;
+}
+
 static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
 				   enum led_brightness brightness)
 {
@@ -460,19 +534,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	unsigned char kbd_func;
 	int ret;
 
-	/* Initialize keyboard */
-	ret = asus_kbd_init(hdev);
-	if (ret < 0)
-		return ret;
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		ret = rog_nkey_led_init(hdev);
+		if (ret < 0)
+			return ret;
+	} else {
+		/* Initialize keyboard */
+		ret = asus_kbd_init(hdev);
+		if (ret < 0)
+			return ret;
 
-	/* Get keyboard functions */
-	ret = asus_kbd_get_functions(hdev, &kbd_func);
-	if (ret < 0)
-		return ret;
+		/* Get keyboard functions */
+		ret = asus_kbd_get_functions(hdev, &kbd_func);
+		if (ret < 0)
+			return ret;
 
-	/* Check for backlight support */
-	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
-		return -ENODEV;
+		/* Check for backlight support */
+		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
+			return -ENODEV;
+	}
 
 	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
 					      sizeof(struct asus_kbd_leds),
@@ -751,8 +831,8 @@ static int asus_input_mapping(struct hid_device *hdev,
 	     usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
 		return -1;
 
-	/* ASUS-specific keyboard hotkeys */
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
+	/* ASUS-specific keyboard hotkeys and led backlight */
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
 		switch (usage->hid & HID_USAGE) {
 		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
 		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
@@ -780,6 +860,18 @@ static int asus_input_mapping(struct hid_device *hdev,
 		/* Fn+F5 "fan" symbol on FX503VD */
 		case 0x99: asus_map_key_clear(KEY_PROG4);		break;
 
+		/* Fn+F5 "fan" symbol on N-Key keyboard */
+		case 0xae: asus_map_key_clear(KEY_PROG4);		break;
+
+		/* Fn+Ret "Calc" symbol on N-Key keyboard */
+		case 0x92: asus_map_key_clear(KEY_CALC);		break;
+
+		/* Fn+Left Aura mode previous on N-Key keyboard */
+		case 0xb2: asus_map_key_clear(KEY_PROG2);		break;
+
+		/* Fn+Right Aura mode next on N-Key keyboard */
+		case 0xb3: asus_map_key_clear(KEY_PROG3);		break;
+
 		default:
 			/* ASUS lazily declares 256 usages, ignore the rest,
 			 * as some make the keyboard appear as a pointer device. */
@@ -1126,6 +1218,9 @@ static const struct hid_device_id asus_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
 	  QUIRK_USE_KBD_BACKLIGHT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
 	  QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6f370e020feb..c9f930ddcfd7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -190,6 +190,7 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
+#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
 #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869
 
 #define USB_VENDOR_ID_ATEN		0x0557
-- 
2.28.0


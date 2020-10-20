Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA7A28C96D
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 09:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390260AbgJMHcW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 03:32:22 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58921 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390018AbgJMHcV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 03:32:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 76DB9760;
        Tue, 13 Oct 2020 03:32:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 13 Oct 2020 03:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OEiCorPEsacvk944V
        J16bLdPicV9i0Ibum0EJZXSoNA=; b=BbNIVi6NA0AS30ZSnmBg52gzLj3Lh5s+j
        L2IedXtaLFRSWH8X5OeNG6MDOOUvZJngtgZotVxQxT3LF9X5n8TbMzXdKaQ2yNJ2
        lhVrCGHpnEiPUA81IKGn6yzr9UeFwBd++f+ocwR02wfy2EvwTJ5eNCnfVheTOCc4
        FM78Z5iJ8UIklngLoJCzusajYU26D4qL+ckrSVgSv0E4BHw4tE7qNt1v0p5yBKtc
        xl8xWDI05s9MsqUY4NulaxZLBMj2MCh26fPCFQv6oNQ+rCOVfTiSiNq/KiiHBY/9
        6jRy7nVSOqRhXTBKoX02oZ6LPJqVTZxlJNy2VaIVUYKWIcTrF93zg==
X-ME-Sender: <xms:A1iFX-J2QxBeXRZOAMQrFhkQrGySxWUWIUlVA4ot-vFmVry7wunpFw>
    <xme:A1iFX2LG1mX72v2TDLhhBovbdDmtWV0yVMaR7f1aomPEqTk1uASZ919gSS4JFLBJZ
    XNTfyrtVuRailgc7U0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheekgdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepnfhukhgvucffucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
    uggvvheqnecuggftrfgrthhtvghrnhepfffghfehheekgfdttdeihfdugeetkeduiefhvd
    dujeduiefgtdehieejtedvjedvnecukfhppedvtdefrdduudegrddugedurdduieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslh
    hjohhnvghsrdguvghv
X-ME-Proxy: <xmx:A1iFX-vbZiiwlScW_MpuFl8BwhKUGbS1PBYdd4ag4A_AQIT7Fi4XCQ>
    <xmx:A1iFXzYx6GjkQH-ccY5mInlGcyeAKSruiIJIVR1wgq6xakiiYpBMoQ>
    <xmx:A1iFX1Y8H7UK7aGODZ26k8B30-lNSWkU5yZuutvqfZIfhdg3kS7Yeg>
    <xmx:BFiFX0k-uZ5yl9H89ugxavbXS43QW4khdFRdza_NxiWyzHg-_PTqmQ>
Received: from localhost.localdomain (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id DC5BD3280059;
        Tue, 13 Oct 2020 03:32:16 -0400 (EDT)
From:   Luke D Jones <luke@ljones.dev>
To:     linux-input@vger.kernel.org
Cc:     hdegoede@redhat.com, jikos@kernel.org, andy@infradead.org,
        benjamin.tissoires@redhat.com, Luke D Jones <luke@ljones.dev>
Subject: [PATCH V7] HID: ASUS: Add support for ASUS N-Key keyboard
Date:   Tue, 13 Oct 2020 20:31:34 +1300
Message-Id: <20201013073133.9932-1-luke@ljones.dev>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
almost all modern ASUS gaming laptops with slight changes to the
firmware. This patch enables: Fn+key hotkeys, keyboard backlight
brightness control, and notify asus-wmi to toggle "fan-mode".

The keyboard has many of the same key outputs as the existing ASUS
keyboard including a few extras, and varies a little between laptop
models.

An existing key event used across some keyboards for "Mic Toggle"
has been changed to emit "F20" as this is what all the main
desktop environments are using.

Additionally this keyboard requires the LED interface to be
intitialised before such things as keyboard backlight control work.

Misc changes in scope: update some hardcoded comparisons to use an
available define.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c                     | 148 ++++++++++++++++++---
 drivers/hid/hid-ids.h                      |   1 +
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 3 files changed, 135 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index c183caf89d49..a2f5469da0e6 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -26,6 +26,8 @@
 #include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/module.h>
+
+#include <linux/acpi.h>
 #include <linux/platform_data/x86/asus-wmi.h>
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
@@ -48,6 +50,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define INPUT_REPORT_ID 0x5d
 #define FEATURE_KBD_REPORT_ID 0x5a
 #define FEATURE_KBD_REPORT_SIZE 16
+#define FEATURE_KBD_LED_REPORT_ID1 0x5d
+#define FEATURE_KBD_LED_REPORT_ID2 0x5e

 #define SUPPORT_KBD_BACKLIGHT BIT(0)

@@ -80,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_T101HA_DOCK		BIT(9)
 #define QUIRK_T90CHI			BIT(10)
 #define QUIRK_MEDION_E1239T		BIT(11)
+#define QUIRK_ROG_NKEY_KEYBOARD		BIT(12)

 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -305,10 +310,33 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 	return 0;
 }

+/*
+ * This enables triggering events in asus-wmi
+ */
+static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
+{
+	int err;
+	u32 retval;
+
+	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
+		ASUS_WMI_DEVID_NOTIF, code, &retval);
+	if (err) {
+		pr_warn("Failed to notify asus-wmi: %d\n", err);
+		return err;
+	}
+
+	if (retval != 0) {
+		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
@@ -321,6 +349,7 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
 static int asus_raw_event(struct hid_device *hdev,
 		struct hid_report *report, u8 *data, int size)
 {
+	int ret;
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);

 	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
@@ -332,6 +361,35 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (drvdata->quirks & QUIRK_MEDION_E1239T)
 		return asus_e1239t_event(drvdata, data, size);

+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		/*
+		 * Skip these report ID, the device emits a continuous stream associated
+		 * with the AURA mode it is in which looks like an 'echo'
+		*/
+		if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
+				report->id == FEATURE_KBD_LED_REPORT_ID2) {
+			return -1;
+		/* Additional report filtering */
+		} else if (report->id == FEATURE_KBD_REPORT_ID) {
+			/* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
+			if (data[1] == 0xae) {
+				ret = asus_wmi_send_event(drvdata, 0xae);
+				if (ret < 0) {
+					hid_warn(hdev, "Asus failed to trigger fan control event");
+				}
+				return -1;
+			/*
+			 * G14 and G15 send these codes on some keypresses with no
+			 * discernable reason for doing so. We'll filter them out to avoid
+			 * unmapped warning messages later
+			*/
+			} else if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
+					data[1] == 0x8a || data[1] == 0x9e) {
+				return -1;
+			}
+		}
+	}
+
 	return 0;
 }

@@ -344,7 +402,11 @@ static int asus_kbd_set_report(struct hid_device *hdev, u8 *buf, size_t buf_size
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
@@ -397,6 +459,44 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
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
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init start command: %d\n", ret);
+	/* Followed by a string */
+	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 1.0: %d\n", ret);
+	/* Followed by a string */
+	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 1.1: %d\n", ret);
+
+	/* begin second report ID with same data */
+	buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
+	buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
+
+	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 2.0: %d\n", ret);
+
+	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 2.1: %d\n", ret);
+
+	return ret;
+}
+
 static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
 				   enum led_brightness brightness)
 {
@@ -460,19 +560,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
@@ -751,8 +857,8 @@ static int asus_input_mapping(struct hid_device *hdev,
 	     usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
 		return -1;

-	/* ASUS-specific keyboard hotkeys */
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
+	/* ASUS-specific keyboard hotkeys and led backlight */
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
 		switch (usage->hid & HID_USAGE) {
 		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
 		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
@@ -780,6 +886,15 @@ static int asus_input_mapping(struct hid_device *hdev,
 		/* Fn+F5 "fan" symbol on FX503VD */
 		case 0x99: asus_map_key_clear(KEY_PROG4);		break;

+		/* Fn+Ret "Calc" symbol on device 0x1866, N-KEY Device */
+		case 0x92: asus_map_key_clear(KEY_CALC);		break;
+
+		/* Fn+Left Aura mode previous */
+		case 0xb2: asus_map_key_clear(KEY_PROG2);		break;
+
+		/* Fn+Right Aura mode next */
+		case 0xb3: asus_map_key_clear(KEY_PROG3);		break;
+
 		default:
 			/* ASUS lazily declares 256 usages, ignore the rest,
 			 * as some make the keyboard appear as a pointer device. */
@@ -1126,6 +1241,9 @@ static const struct hid_device_id asus_devices[] = {
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
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 897b8332a39f..ddf72cfe721a 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -69,6 +69,7 @@
 /* Input */
 #define ASUS_WMI_DEVID_TOUCHPAD		0x00100011
 #define ASUS_WMI_DEVID_TOUCHPAD_LED	0x00100012
+#define ASUS_WMI_DEVID_NOTIF		0x00100021 /* Emit keyboard event */
 #define ASUS_WMI_DEVID_FNLOCK		0x00100023

 /* Fan, Thermal */
--
2.28.0


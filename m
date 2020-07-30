Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86929232B1A
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 07:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgG3FAB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 01:00:01 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38249 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726133AbgG3FAA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 01:00:00 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 0E2F55C0131;
        Thu, 30 Jul 2020 00:59:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 30 Jul 2020 00:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=OyGNdsaKJXkFcKJ97jKM+aOLOGEXc
        8ZbZxQlXdKP6S0=; b=effKgfHaaeh7ZF2sGwPlw/17Ne5xmG9WtP7RWP+E7aIj0
        U2XYVKzdGLaBMRpMfIl2JGYwDfFyfIArL5XaiZ1ZXBYjauPkFXC87iQwWvXV1gPv
        I0yFU3/QlVJhIxkE36OSEP8bZFs2q/BKvcD6fjZZ5t7V4sVw7y8pDQhogAPU1tGl
        N3rxnnzwVgF2kpsWDYz8HDG0pPoL4a031nO+g/qZGzMvKqbw3uTRJYpTv667C79y
        iCtkegPKwlwjmPIKCpCl0GtCnQPsWhJUL/m9pgjcRIOgdE5zcXYeNt2QGE0wc0B+
        3qNHpYTeAXB5ZjcX/o2DnjimH6eWTvAAdYquFgCIg==
X-ME-Sender: <xms:zlMiX1L6JBXO06NQ6JbuNTQbzh67s6wzpPqGwdbr38P3IdhVli2tkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieehgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhuffvkffogggtsehttdertdertd
    dvnecuhfhrohhmpefnuhhkvgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghv
    qeenucggtffrrghtthgvrhhnpeeghedtjeejtefgveffffffieffleekhfduleffgfefgf
    egieetuefhteejteekjeenucfkphepvddtfedruddugedrudeguddrudeinecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonh
    gvshdruggvvh
X-ME-Proxy: <xmx:zlMiXxJdMmEg4lwVq6n50zANh9x-5r1436FLQTKYJj2UJH4DHcnzjg>
    <xmx:zlMiX9skCAIXonlv-N5miCrd2KhR-xFNCyr-Rieil1lyXrAB-8sm1w>
    <xmx:zlMiX2bfW1cOshJBcaNv98j09niZdxJO6_WqwvRcoGuJxPBKQ2-eDw>
    <xmx:z1MiXy1gquAMipnGaRi7HPmNKtUnlcC6Ugk064yo3-biXrBeqnWohQ>
Received: from [192.168.20.21] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id D933D328005D;
        Thu, 30 Jul 2020 00:59:55 -0400 (EDT)
Date:   Thu, 30 Jul 2020 16:59:42 +1200
From:   Luke Jones <luke@ljones.dev>
Subject: [PATCH] HID: asus: Add support for N-Key keyboard 0x1866
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, luke@ljones.dev
Message-Id: <I7N9EQ.8IGH4DTLLTFG1@ljones.dev>
X-Mailer: geary/3.36.2
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable missing functionality of the keyboard found in many ASUS
Zephyrus laptops: Fn key combos and hotkeys, keyboard backlight
brightness control. Two input event codes are added for keyboard
LED mode switching prev/next.

The keyboard has many of the same key outputs as the existing G752
keyboard including a few extras, and varies a little between laptop
models.

Additionally the keyboard requires the LED interface to be
intitialised before such things as keyboard backlight control work.

Misc changes in scope: update some hardcoded comparisons to use an
available define, change "Mic Toggle" to use a keycode that works.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 140 +++++++++++++++++++++----
 drivers/hid/hid-ids.h | 1 +
 include/uapi/linux/input-event-codes.h | 7 ++
 3 files changed, 125 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index c183caf89d49..822c3bc1eb08 100644
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
 #define QUIRK_T101HA_DOCK BIT(9)
 #define QUIRK_T90CHI BIT(10)
 #define QUIRK_MEDION_E1239T BIT(11)
+#define QUIRK_ROG_NKEY_KEYBOARD BIT(12)

 #define I2C_KEYBOARD_QUIRKS (QUIRK_FIX_NOTEBOOK_REPORT | \
        QUIRK_NO_INIT_REPORTS | \
@@ -308,7 +311,7 @@ static int asus_e1239t_event(struct asus_drvdata 
*drvdat, u8 *data, int size)
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
         struct hid_usage *usage, __s32 value)
 {
- if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
+ if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
      (usage->hid & HID_USAGE) != 0x00 &&
      (usage->hid & HID_USAGE) != 0xff && !usage->type) {
   hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
@@ -332,6 +335,16 @@ static int asus_raw_event(struct hid_device *hdev,
  if (drvdata->quirks & QUIRK_MEDION_E1239T)
   return asus_e1239t_event(drvdata, data, size);

+ /*
+ * Skip these report ID, the device emits a continuous stream 
associated
+ * with the AURA mode it is in
+ */
+ if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
+ (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
+ report->id == FEATURE_KBD_LED_REPORT_ID2)) {
+ return -1;
+ }
+
  return 0;
 }

@@ -344,7 +357,9 @@ static int asus_kbd_set_report(struct hid_device 
*hdev, u8 *buf, size_t buf_size
  if (!dmabuf)
   return -ENOMEM;

- ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
+ // The report ID should be set from the incoming buffer due to LED 
and key
+ // interfaces having different pages
+ ret = hid_hw_raw_request(hdev, buf[0], dmabuf,
      buf_size, HID_FEATURE_REPORT,
      HID_REQ_SET_REPORT);
  kfree(dmabuf);
@@ -397,6 +412,44 @@ static int asus_kbd_get_functions(struct 
hid_device *hdev,
  return ret;
 }

+static int asus_kbd_led_init(struct hid_device *hdev)
+{
+ u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
+ u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 
0x53, 0x20,
+ 0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+ u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
+ 0x05, 0x20, 0x31, 0x00, 0x08 };
+ int ret;
+
+ hid_warn(hdev, "Asus initialise N-KEY Device");
+ /* The first message is an init start */
+ ret = asus_kbd_set_report(hdev, buf_init_start, 
sizeof(buf_init_start));
+ if (ret < 0)
+ hid_err(hdev, "Asus failed to send init start command: %d\n", ret);
+ /* Followed by a string */
+ ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+ if (ret < 0)
+ hid_err(hdev, "Asus failed to send init command 1.0: %d\n", ret);
+ /* Followed by a string */
+ ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+ if (ret < 0)
+ hid_err(hdev, "Asus failed to send init command 1.1: %d\n", ret);
+
+ /* begin second report ID with same data */
+ buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
+ buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
+
+ ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+ if (ret < 0)
+ hid_err(hdev, "Asus failed to send init command 2.0: %d\n", ret);
+
+ ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+ if (ret < 0)
+ hid_err(hdev, "Asus failed to send init command 2.1: %d\n", ret);
+
+ return ret;
+}
+
 static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
        enum led_brightness brightness)
 {
@@ -460,19 +513,28 @@ static int asus_kbd_register_leds(struct 
hid_device *hdev)
  unsigned char kbd_func;
  int ret;

- /* Initialize keyboard */
- ret = asus_kbd_init(hdev);
- if (ret < 0)
- return ret;
+ if (drvdata->quirks & QUIRK_G752_KEYBOARD) {
+ /* Initialize keyboard */
+ ret = asus_kbd_init(hdev);
+ if (ret < 0)
+ return ret;

- /* Get keyboard functions */
- ret = asus_kbd_get_functions(hdev, &kbd_func);
- if (ret < 0)
- return ret;
+ /* Get keyboard functions */
+ ret = asus_kbd_get_functions(hdev, &kbd_func);
+ if (ret < 0)
+ return ret;

- /* Check for backlight support */
- if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
- return -ENODEV;
+ /* Check for backlight support */
+ if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
+ return -ENODEV;
+ }
+
+ if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+ /* Initialize keyboard LED interface and Vendor keys on 0x1866 */
+ ret = asus_kbd_led_init(hdev);
+ if (ret < 0)
+ return ret;
+ }

  drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
            sizeof(struct asus_kbd_leds),
@@ -751,14 +813,14 @@ static int asus_input_mapping(struct hid_device 
*hdev,
       usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
   return -1;

- /* ASUS-specific keyboard hotkeys */
- if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
+ /* ASUS-specific keyboard hotkeys and led backlight */
+ if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
   switch (usage->hid & HID_USAGE) {
   case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN); break;
   case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP); break;
   case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF); break;
   case 0x6c: asus_map_key_clear(KEY_SLEEP); break;
- case 0x7c: asus_map_key_clear(KEY_MICMUTE); break;
+ case 0x7c: asus_map_key_clear(KEY_F20); break;
   case 0x82: asus_map_key_clear(KEY_CAMERA); break;
   case 0x88: asus_map_key_clear(KEY_RFKILL); break;
   case 0xb5: asus_map_key_clear(KEY_CALC); break;
@@ -771,16 +833,45 @@ static int asus_input_mapping(struct hid_device 
*hdev,
   /* ROG key */
   case 0x38: asus_map_key_clear(KEY_PROG1); break;

- /* Fn+C ASUS Splendid */
- case 0xba: asus_map_key_clear(KEY_PROG2); break;
+ default:
+ if (drvdata->quirks & QUIRK_G752_KEYBOARD) {
+ switch (usage->hid & HID_USAGE) {
+ /* Fn+C ASUS Splendid */
+ case 0xba: asus_map_key_clear(KEY_PROG2); break;

- /* Fn+Space Power4Gear Hybrid */
- case 0x5c: asus_map_key_clear(KEY_PROG3); break;
+ /* Fn+Space Power4Gear Hybrid */
+ case 0x5c: asus_map_key_clear(KEY_PROG3); break;

- /* Fn+F5 "fan" symbol on FX503VD */
- case 0x99: asus_map_key_clear(KEY_PROG4); break;
+ /* Fn+F5 "fan" symbol on FX503VD */
+ case 0x99: asus_map_key_clear(KEY_PROG4); break;
+
+ default:
+ return -1;
+ }
+ break;
+ }
+
+ /* device 0x1866, N-KEY Device specific */
+ if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+ switch (usage->hid & HID_USAGE) {
+ /* Fn+F5 "fan" symbol on device 0x1866, N-KEY Device */
+ case 0xae: asus_map_key_clear(KEY_PROG4); break;
+
+ /* Fn+Ret "Calc" symbol on device 0x1866, N-KEY Device */
+ case 0x92: asus_map_key_clear(KEY_CALC); break;
+
+ /* Fn+Left Aura mode previous */
+ case 0xb2: asus_map_key_clear(KEY_KBDILLUM_MODE_PREV); break;
+
+ /* Fn+Right Aura mode next */
+ case 0xb3: asus_map_key_clear(KEY_KBDILLUM_MODE_NEXT); break;
+
+ default:
+ return -1;
+ }
+ break;
+ }

- default:
    /* ASUS lazily declares 256 usages, ignore the rest,
     * as some make the keyboard appear as a pointer device. */
    return -1;
@@ -1126,6 +1217,9 @@ static const struct hid_device_id asus_devices[] 
= {
  { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
   USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
    QUIRK_USE_KBD_BACKLIGHT },
+ { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
+ USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
+ QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
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
+#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD 0x1866
 #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD 0x1869

 #define USB_VENDOR_ID_ATEN 0x0557
diff --git a/include/uapi/linux/input-event-codes.h 
b/include/uapi/linux/input-event-codes.h
index 0c2e27d28e0a..ca59f7d7a25e 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -772,6 +772,13 @@
 #define BTN_TRIGGER_HAPPY39 0x2e6
 #define BTN_TRIGGER_HAPPY40 0x2e7

+/*
+ * Some keyboards have function keys associated with
+ * changing the keyboard backlight modes, e.g, RGB patterns
+ */
+#define KEY_KBDILLUM_MODE_PREV 0x2ea
+#define KEY_KBDILLUM_MODE_NEXT 0x2eb
+
 /* We avoid low common keys in module aliases so they don't get huge. 
*/
 #define KEY_MIN_INTERESTING KEY_MUTE
 #define KEY_MAX 0x2ff
-- 
2.26.2




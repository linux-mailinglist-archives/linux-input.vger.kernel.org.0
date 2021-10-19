Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E749C432D56
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 07:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhJSFmN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 01:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhJSFmM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 01:42:12 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C32C06161C
        for <linux-input@vger.kernel.org>; Mon, 18 Oct 2021 22:40:00 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id np13so13830900pjb.4
        for <linux-input@vger.kernel.org>; Mon, 18 Oct 2021 22:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FxyYtvxSrqY6hLGeLD/vKMnYzvzkaPQhKYNE9aj3NiU=;
        b=AHACrIannJrLYZmnNMhEXEm+o08Em/7UxTsZbCQdf+3tZpKyD90jPvvHPktD16zxJL
         XkDYmsPyq2NutuEDaK4zGLc3+ZNmd3pbktTWuO7YxS5LV7u3G8fRq5vaqLnXiLchqRxg
         htv37sMDr8bAxjusrFJB4TXGBFlPS0sI89R9mc0LZWZv4auBmNchXHxA4VJ9ceEPjYPe
         B/aBJXEAZgKiIjDljc0pxtqEgp5OSA34/AcO7p73cylkYrJQva8lifzaIc5SilJ1n+lQ
         sNQMHpoPWZs+sx97VV6eGIFsGwu3timet8YliHGx92czvA6tKbxsymnD/cA5CVuhK9fz
         p7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FxyYtvxSrqY6hLGeLD/vKMnYzvzkaPQhKYNE9aj3NiU=;
        b=iZVxSErnPgy7g2vEQZLZQ4BBZq5827b8gPadiHk5a/k68L+UayJdrmIJgRvdqm/6L0
         LCkOrTIoai6RmnXiWEdvwpWber5RwtdQ02/Zql0VBoocI2NQJXkpT9POaKhz+3YBW9PX
         b/SAUGFX4uu1/eo8HT9+0sFN8RSbQThBqj5t1A6ke/c+KeO/fOpPJlHAEGRL0l2fuxY3
         MdO8V7q4l/3+ZL7tlEEz7MRJYOQU5ZjHzfnZJiodpy5VJvcjDjFuzyR1DQCD74qErFBq
         4hQXyuVOnSaSfstpNkLHY6IsP3utr8g7EYZRKllzuVObEuCC6FK89yw0sW0sGonn5+Ie
         2mew==
X-Gm-Message-State: AOAM532zRwUqWU1lF74oYgcYSwIriO7bXRkXlIaTrjBeNSNae2zPIzCc
        jsuKty0/hZb6N2XuVOB1x+whTmA1xXhKPw==
X-Google-Smtp-Source: ABdhPJxw16hoAocN2RO4VcAuOZVU1LCwcZYst31Rjrc3PS/+m1jFnoX5RwIh0buNvjhObKkR3TH2HA==
X-Received: by 2002:a17:902:e843:b0:13f:2212:d64c with SMTP id t3-20020a170902e84300b0013f2212d64cmr31617881plg.16.1634621999921;
        Mon, 18 Oct 2021 22:39:59 -0700 (PDT)
Received: from xavier.lan ([166.70.246.164])
        by smtp.gmail.com with ESMTPSA id n9sm1296162pjk.3.2021.10.18.22.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 22:39:59 -0700 (PDT)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        hadess@hadess.net, jikos@kernel.org, jose.exposito89@gmail.com,
        jslaby@suse.cz, juw@posteo.de, lukas@wunner.de
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v2 3/3] HID: apple: Bring back flag for Apple tilde key quirk
Date:   Mon, 18 Oct 2021 23:39:40 -0600
Message-Id: <20211019053940.137338-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Apple ISO keyboards have a quirk where the backtick/tilde key is
swapped with the less-than/greater-than key. Unfortunately, there is no
perfectly reliable way to detect whether a keyboard has the quirk or
not, but the quirk appears to only be present on models that support
Bluetooth, and the affected keyboards usually report country code 13 in
the HID descriptor.

Therefore, the best we can do is to change
/sys/module/hid_apple/parameters/iso_layout to a ternary:

0 = Not ISO or ISO and not quirky
1 = ISO and quirky
-1 = Guess based on product ID and country code

Table of keyboards that José and I have tested:

Product    Model  Shape  Labels      Bus  Country  Quirky
=========================================================
05ac:0201  M2452  ANSI   Usonian     USB  0        No
05ac:020b  A1048  ANSI   Usonian     USB  0        No
05ac:020c  A1048  ISO    Québécois   USB  13       No
05ac:0221  A1243  ISO    Norwegian   USB  13       No
05ac:0221  A1243  ISO    Portuguese  USB  13       No
05ac:0221  A1243  ISO    Swedish     USB  13       No
05ac:0221  A1243  ISO    Swiss       USB  13       No
05ac:022c  A1255  ANSI   Usonian     BT   33       No
05ac:022d  A1255  ISO    Hebrew      BT   13       Yes
05ac:022d  A1255  ISO    Québécois   BT   13       Yes
05ac:022d  A1255  ISO    Spanish     BT   13       Yes
05ac:023a  A1314  ISO    Russian     BT   13       Yes
05ac:023a  A1314  ISO    Swiss       BT   13       Yes
05ac:024f  A1243  ANSI   Usonian     USB  0        No
05ac:0250  A1243  ISO    British     USB  13       No
05ac:0250  A1243  ISO    German      USB  13       No
05ac:0250  A1243  ISO    Italian     USB  13       No
05ac:0250  A1243  ISO    Québécois   USB  13       No
05ac:0251  A1243  JIS    Japanese    USB  15       No
05ac:0255  A1314  ANSI   Usonian     BT   33       No
05ac:0255  A1314  ANSI   Taiwanese   BT   33       No
05ac:0255  A1314  ANSI   Thai        BT   33       No
05ac:0256  A1314  ISO    Arabic      BT   13       Yes
05ac:0256  A1314  ISO    French      BT   13       Yes
05ac:0256  A1314  ISO    German      BT   13       Yes
05ac:0256  A1314  ISO    Norwegian   BT   13       Yes
05ac:0256  A1314  ISO    Spanish     BT   13       Yes
05ac:0256  A1314  ISO    Swiss       BT   13       Yes
05ac:0257  A1314  JIS    Japanese    BT   15       No
05ac:0267  A1644  ANSI   Usonian     USB  33       No
004c:0267  A1644  ANSI   Usonian     BT   0        No
05ac:0267  A1644  ISO    British     USB  13       Yes
004c:0267  A1644  ISO    British     BT   0        Yes
05ac:0267  A1644  ISO    Québécois   USB  13       Yes
004c:0267  A1644  ISO    Québécois   BT   0        Yes
05ac:0267  A1644  ISO    Spanish     USB  13       Yes
004c:0267  A1644  ISO    Spanish     BT   0        Yes
05ac:0267  A1644  ISO    Swiss       USB  13       Yes
004c:0267  A1644  ISO    Swiss       BT   0        Yes
05ac:0267  A1644  JIS    Japanese    USB  15       No
004c:0267  A1644  JIS    Japanese    BT   0        No
05ac:029c  A2450  ANSI   Usonian     USB  33       No
004c:029c  A2450  ANSI   Usonian     BT   0        No
05ac:029c  A2450  ISO    Spanish     USB  13       Yes
004c:029c  A2450  ISO    Spanish     BT   0        Yes
05ac:029c  A2450  JIS    Japanese    USB  15       No
004c:029c  A2450  JIS    Japanese    BT   0        No

Reported-by: José Expósito <jose.exposito89@gmail.com>
Tested-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
v2:
- Add José's testing to the commit message
- Correct alphabetization in commit message
---
 drivers/hid/hid-apple.c | 46 +++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e7af40b737d8..283bf22914ac 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -25,7 +25,7 @@
 #define APPLE_IGNORE_MOUSE	0x0002
 #define APPLE_HAS_FN		0x0004
 #define APPLE_HIDDEV		0x0008
-/* 0x0010 reserved, was: APPLE_ISO_KEYBOARD */
+#define APPLE_ISO_TILDE_QUIRK	0x0010
 #define APPLE_MIGHTYMOUSE	0x0020
 #define APPLE_INVERT_HWHEEL	0x0040
 #define APPLE_IGNORE_HIDINPUT	0x0080
@@ -40,10 +40,10 @@ module_param(fnmode, uint, 0644);
 MODULE_PARM_DESC(fnmode, "Mode of fn key on Apple keyboards (0 = disabled, "
 		"[1] = fkeyslast, 2 = fkeysfirst)");
 
-static unsigned int iso_layout = 1;
-module_param(iso_layout, uint, 0644);
-MODULE_PARM_DESC(iso_layout, "Enable/Disable hardcoded ISO-layout of the keyboard. "
-		"(0 = disabled, [1] = enabled)");
+static int iso_layout = -1;
+module_param(iso_layout, int, 0644);
+MODULE_PARM_DESC(iso_layout, "Swap the backtick/tilde and greater-than/less-than keys. "
+		"([-1] = auto, 0 = disabled, 1 = enabled)");
 
 static unsigned int swap_opt_cmd;
 module_param(swap_opt_cmd, uint, 0644);
@@ -277,14 +277,13 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		}
 	}
 
-	if (iso_layout) {
-		if (hid->country == HID_COUNTRY_INTERNATIONAL_ISO) {
-			trans = apple_find_translation(apple_iso_keyboard, usage->code);
-			if (trans) {
-				input_event_with_scancode(input, usage->type,
-						trans->to, usage->hid, value);
-				return 1;
-			}
+	if (iso_layout > 0 || (iso_layout < 0 && (asc->quirks & APPLE_ISO_TILDE_QUIRK) &&
+			hid->country == HID_COUNTRY_INTERNATIONAL_ISO)) {
+		trans = apple_find_translation(apple_iso_keyboard, usage->code);
+		if (trans) {
+			input_event_with_scancode(input, usage->type,
+					trans->to, usage->hid, value);
+			return 1;
 		}
 	}
 
@@ -533,9 +532,11 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 				USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
@@ -545,13 +546,13 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ISO),
@@ -633,7 +634,8 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY),
@@ -641,9 +643,9 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 
 	{ }
 };
-- 
2.33.1


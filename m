Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB55426551
	for <lists+linux-input@lfdr.de>; Fri,  8 Oct 2021 09:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbhJHHjQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Oct 2021 03:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhJHHjP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Oct 2021 03:39:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DCEC061570
        for <linux-input@vger.kernel.org>; Fri,  8 Oct 2021 00:37:20 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id u7so7435982pfg.13
        for <linux-input@vger.kernel.org>; Fri, 08 Oct 2021 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AtHbvhTlx+3IEO/ObjVOMiej+ZMrDRMDJTNSXgWYANc=;
        b=PSiUcwsgfPFuK/ULz4LAeI4IVKn72cqe4MmxXJDHwEl7iuWeLpXTf+t3JSPo2jI6yQ
         jJxGTqmL+/lO4rr+nU6h64kLNYxLgVwGYS83X0+vkfO+WP+1sr1i0Lu8ftnP3IosM/eW
         gaI6TEb6rmuMuHjUR7ygwjOXdeFVKFIz8qv8E0psTtLUJZ+ZWa0qNdk0eASV+Hx9SmB9
         SSyuoan3iIcHvFQfU1QNckJ8jdZOjxm2RWxWtkQX7ugD8Hv6lMBKtjHWIKkrzydE8UPy
         JGKuyDmSqC/0g3XKtVHkfVziYLMFGh+2QOkGpPiiAiVsDxd+FbyrjIkFrOceV4ob3n6A
         sjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AtHbvhTlx+3IEO/ObjVOMiej+ZMrDRMDJTNSXgWYANc=;
        b=utWg5oOFH4+r8rhClpJeCV5OLy5McVJ1Boo2LmHBAKjUW7Uk23HcAEXynCfsBM5AXx
         O+ODuvB5dXxQvSeHywKQ58yhXRSeUELpmi2Vc7Bgce5Etvhcm3XVxzox63KY3vMI5Pq3
         2dJna8/RCKpCgsjJ0DOdAFz+fd50BYHFu00PEvf8ESe4Pb18lQINEA6c88/8zODgBWFl
         rVvXhKUlSHpBKrxZl+FpXTLzF/BVYHw0gNQ0quGZNnJv76f7MASbTNpPJqGSuIldbH2l
         t4sj+N36eK2jSrrs1yGcE0SoQ05OQxvINzCuMDB2LDV7HwItIzNc+BwQs/gYVc9wqBzy
         eXgg==
X-Gm-Message-State: AOAM5307JpxIzR7oDsh4a/BWynWI/eLwwPQoc81jkmjox7QnsCe/saLB
        tsQMrvPFFJq2Pv8P9iEH5xJPwoV7PIo=
X-Google-Smtp-Source: ABdhPJwoQK6oNP86veKw2vd6xnv3wnhkQjlk2hTEqK1//k3+oopVPrxlcApnwtFW1OffXT5qgmt6rQ==
X-Received: by 2002:a05:6a00:ac1:b0:44c:4dc6:b897 with SMTP id c1-20020a056a000ac100b0044c4dc6b897mr8644286pfl.25.1633678639868;
        Fri, 08 Oct 2021 00:37:19 -0700 (PDT)
Received: from xavier.lan ([207.135.154.184])
        by smtp.gmail.com with ESMTPSA id 22sm1556583pgn.88.2021.10.08.00.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 00:37:19 -0700 (PDT)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        hadess@hadess.net, jikos@kernel.org, jose.exposito89@gmail.com,
        jslaby@suse.cz, juw@posteo.de, lukas@wunner.de
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 3/3] HID: apple: Bring back flag for Apple tilde key quirk
Date:   Fri,  8 Oct 2021 01:37:02 -0600
Message-Id: <20211008073702.5761-3-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008073702.5761-1-alexhenrie24@gmail.com>
References: <20211008073702.5761-1-alexhenrie24@gmail.com>
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

Table of keyboards I have tested:

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
05ac:0267  A1644  ISO    Swiss       USB  13       Yes
004c:0267  A1644  ISO    Swiss       BT   0        Yes
05ac:0267  A1644  ISO    Québécois   USB  13       Yes
004c:0267  A1644  ISO    Québécois   BT   0        Yes
05ac:0267  A1644  JIS    Japanese    USB  15       No
004c:0267  A1644  JIS    Japanese    BT   0        No
05ac:029c  A2450  ANSI   Usonian     USB  33       No
004c:029c  A2450  ANSI   Usonian     BT   0        No
05ac:029c  A2450  ISO    Spanish     USB  13       Yes
004c:029c  A2450  ISO    Spanish     BT   0        Yes
05ac:029c  A2450  JIS    Japanese    USB  15       No
004c:029c  A2450  JIS    Japanese    BT   0        No

Reported-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
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
2.33.0


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2093A8B4D
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 23:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhFOVnP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 17:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhFOVnP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 17:43:15 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72519C061574;
        Tue, 15 Jun 2021 14:41:09 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1623793266;
        bh=1XbtmOAvAq8GkpzE6f8SSUVkBGQfOCKy1KoLG/I4mBs=;
        h=From:To:Cc:Subject:Date:From;
        b=PAAHFlJPvAJIhoKTws2F1t6LknnNKWdgaYSDF0tJTdkl15nXE6KLd58NsOxvjwnPF
         l9JAX7lz08EKym0COkqBvuJvDiLCn9NdkY7DoaHNzDtvOGC8xfqLJ2P9NxiBV8lhth
         XWFOvpeiRXzBwJ2rLxtzB/dJRrb1PQSZq56uH3FE=
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] HID: input: Add support for Programmable Buttons
Date:   Tue, 15 Jun 2021 23:41:03 +0200
Message-Id: <20210615214103.1031479-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Map them to KEY_MACRO# event codes.

These buttons are defined by HID as follows:
"The user defines the function of these buttons to control software applications or GUI objects."

This matches the semantics of the KEY_MACRO# input event codes that Linux supports.

Also add support for HID "Named Array" collections.
Also add hid-debug support for KEY_MACRO#.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---

---

v1: https://lore.kernel.org/linux-input/20210519160349.609690-1-linux@weissschuh.net/

v1 -> v2: Only handle the 30 keys known

v2: https://lore.kernel.org/linux-input/20210519174345.614467-1-linux@weissschuh.net/

v2 -> v3:
 * Use hex constants for consistency
 * Validate that the button is part of a "Programmable Buttons" Named Array.
   Otherwise the condition would also apply to "Function Buttons".
 * Ignore non-"Programmable Buttons" buttons.

v3: https://lore.kernel.org/linux-input/20210520084805.685486-1-linux@weissschuh.net/

v3 -> v4:
 * Mention new support for HID "Named Array" collections in commit message.
 * Mention new support KEY_MACRO# in hid-debug.


 drivers/hid/hid-debug.c | 11 +++++++++++
 drivers/hid/hid-input.c | 22 ++++++++++++++++++++++
 include/linux/hid.h     |  1 +
 3 files changed, 34 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index a311fb87b02a..fa57d05badf7 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -122,6 +122,7 @@ static const struct hid_usage_entry hid_usage_table[] = {
   {  9, 0, "Button" },
   { 10, 0, "Ordinal" },
   { 12, 0, "Consumer" },
+      {0, 0x003, "ProgrammableButtons"},
       {0, 0x238, "HorizontalWheel"},
   { 13, 0, "Digitizers" },
     {0, 0x01, "Digitizer"},
@@ -942,6 +943,16 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_KBDINPUTASSIST_NEXTGROUP] = "KbdInputAssistNextGroup",
 	[KEY_KBDINPUTASSIST_ACCEPT] = "KbdInputAssistAccept",
 	[KEY_KBDINPUTASSIST_CANCEL] = "KbdInputAssistCancel",
+	[KEY_MACRO1] = "Macro1", [KEY_MACRO2] = "Macro2", [KEY_MACRO3] = "Macro3",
+	[KEY_MACRO4] = "Macro4", [KEY_MACRO5] = "Macro5", [KEY_MACRO6] = "Macro6",
+	[KEY_MACRO7] = "Macro7", [KEY_MACRO8] = "Macro8", [KEY_MACRO9] = "Macro9",
+	[KEY_MACRO10] = "Macro10", [KEY_MACRO11] = "Macro11", [KEY_MACRO12] = "Macro12",
+	[KEY_MACRO13] = "Macro13", [KEY_MACRO14] = "Macro14", [KEY_MACRO15] = "Macro15",
+	[KEY_MACRO16] = "Macro16", [KEY_MACRO17] = "Macro17", [KEY_MACRO18] = "Macro18",
+	[KEY_MACRO19] = "Macro19", [KEY_MACRO20] = "Macro20", [KEY_MACRO21] = "Macro21",
+	[KEY_MACRO22] = "Macro22", [KEY_MACRO23] = "Macro23", [KEY_MACRO24] = "Macro24",
+	[KEY_MACRO25] = "Macro25", [KEY_MACRO26] = "Macro26", [KEY_MACRO27] = "Macro27",
+	[KEY_MACRO28] = "Macro28", [KEY_MACRO29] = "Macro29", [KEY_MACRO30] = "Macro30",
 };
 
 static const char *relatives[REL_MAX + 1] = {
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index abbfa91e73e4..99557641be80 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -567,6 +567,16 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
 
+static bool hidinput_field_in_collection(struct hid_device *device, struct hid_field *field,
+					 unsigned int type, unsigned int usage)
+{
+	struct hid_collection *collection;
+
+	collection = &device->collection[field->usage->collection_index];
+
+	return collection->type == type && collection->usage == usage;
+}
+
 static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_field *field,
 				     struct hid_usage *usage)
 {
@@ -632,6 +642,18 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 				else
 					code += BTN_TRIGGER_HAPPY - 0x10;
 				break;
+		case HID_CP_CONSUMER_CONTROL:
+				if (hidinput_field_in_collection(device, field,
+								 HID_COLLECTION_NAMED_ARRAY,
+								 HID_CP_PROGRAMMABLEBUTTONS)) {
+					if (code <= 0x1d)
+						code += KEY_MACRO1;
+					else
+						code += BTN_TRIGGER_HAPPY - 0x1e;
+				} else {
+					goto ignore;
+				}
+				break;
 		default:
 			switch (field->physical) {
 			case HID_GD_MOUSE:
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 10e922cee4eb..f05bf96a0d21 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -102,6 +102,7 @@ struct hid_item {
 #define HID_COLLECTION_PHYSICAL		0
 #define HID_COLLECTION_APPLICATION	1
 #define HID_COLLECTION_LOGICAL		2
+#define HID_COLLECTION_NAMED_ARRAY	4
 
 /*
  * HID report descriptor global item tags

base-commit: 231bc539066760aaa44d46818c85b14ca2f56d9f
-- 
2.32.0


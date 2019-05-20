Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1AF2401A
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2019 20:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfETSPh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 14:15:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58844 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbfETSPh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 14:15:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2E3D1308339E;
        Mon, 20 May 2019 18:15:37 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-135.ams2.redhat.com [10.36.116.135])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 130F65DEA8;
        Mon, 20 May 2019 18:15:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/7] Input: Add event-codes for macro keys found on various keyboards
Date:   Mon, 20 May 2019 20:15:19 +0200
Message-Id: <20190520181525.4898-2-hdegoede@redhat.com>
In-Reply-To: <20190520181525.4898-1-hdegoede@redhat.com>
References: <20190520181525.4898-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 20 May 2019 18:15:37 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Various keyboards have macro keys, which are intended to have user
programmable actions / key-sequences bound to them. In some cases these
macro keys are actually programmable in hardware, but more often they
basically are just extra keys and the playback of the key-sequence is done
by software running on the host.

One example of keyboards with macro-keys are various "internet" / "office"
keyboards have a set of so-called "Smart Keys", typically a set of 4 keys
labeled "[A]" - "[D]".

Another example are gaming keyboards, such as the Logitech G15 Gaming
keyboard, which has 18 "G"aming keys labeled "G1" to G18", 3 keys to select
macro presets labeled "M1" - "M3" and a key to start recording a macro
called "MR" note that even though there us a record key everything is
handled in sw on the host.

Besides macro keys the G15 (and other gaming keyboards) also has a buildin
LCD panel where the contents are controlled by the host. There are 5 keys
directly below the LCD intended for controlling a menu shown on the LCD.

The Microsoft SideWinder X6 keyboard is another gaming keyboard example,
this keyboard has 30 "S"idewinder keys and a key to cycle through
macro-presets.

After discussion between various involved userspace people we've come to
the conclusion that since these are all really just extra keys we should
simply treat them as such and give them their own event-codes, see:
https://github.com/libratbag/libratbag/issues/172

This commit adds the following new KEY_ defines for this:

KEY_LCD_MENU1 - KEY_LCD_MENU5, KEY_MACRO_RECORD, KEY_MACRO_PRESET_CYCLE,
KEY_MACRO_PRESET1 - KEY_MACRO_PRESET3, KEY_MACRO1 - KEY_MACRO30.

The defines leave room for adding some more LCD-menu, preset or macro keys,
the maximum values above are based on the maximum values to support all
currently known internet, office and gaming keyboards.

BugLink: https://github.com/libratbag/libratbag/issues/172
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/uapi/linux/input-event-codes.h | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 64cee116928e..62cc2e21f170 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -649,6 +649,60 @@
 #define KEY_DATA			0x277
 #define KEY_ONSCREEN_KEYBOARD		0x278
 
+/*
+ * Some keyboards have a buildin LCD panel where the contents are controlled
+ * by the host. Often these have a number of keys directly below the LCD
+ * intended for controlling a menu shown on the LCD. These keys often don't
+ * have any labelling so we just name them KEY_LCD_MENU#
+ */
+#define KEY_LCD_MENU1			0x280
+#define KEY_LCD_MENU2			0x281
+#define KEY_LCD_MENU3			0x282
+#define KEY_LCD_MENU4			0x283
+#define KEY_LCD_MENU5			0x284
+
+/* Macro preset selection and recording keys, typically found on gaming kbds */
+#define KEY_MACRO_RECORD_START		0x288
+#define KEY_MACRO_RECORD_STOP		0x289
+#define KEY_MACRO_PRESET_CYCLE		0x28a
+#define KEY_MACRO_PRESET1		0x28b
+#define KEY_MACRO_PRESET2		0x28c
+#define KEY_MACRO_PRESET3		0x28d
+
+/* Gaming "macro" (macros handled in software/userspace) keys on gaming kbds */
+#define KEY_MACRO1			0x290
+#define KEY_MACRO2			0x291
+#define KEY_MACRO3			0x292
+#define KEY_MACRO4			0x293
+#define KEY_MACRO5			0x294
+#define KEY_MACRO6			0x295
+#define KEY_MACRO7			0x296
+#define KEY_MACRO8			0x297
+#define KEY_MACRO9			0x298
+#define KEY_MACRO10			0x299
+#define KEY_MACRO11			0x29a
+#define KEY_MACRO12			0x29b
+#define KEY_MACRO13			0x29c
+#define KEY_MACRO14			0x29d
+#define KEY_MACRO15			0x29e
+#define KEY_MACRO16			0x29f
+#define KEY_MACRO17			0x2a0
+#define KEY_MACRO18			0x2a1
+#define KEY_MACRO19			0x2a2
+#define KEY_MACRO20			0x2a3
+#define KEY_MACRO21			0x2a4
+#define KEY_MACRO22			0x2a5
+#define KEY_MACRO23			0x2a6
+#define KEY_MACRO24			0x2a7
+#define KEY_MACRO25			0x2a8
+#define KEY_MACRO26			0x2a9
+#define KEY_MACRO27			0x2aa
+#define KEY_MACRO28			0x2ab
+#define KEY_MACRO29			0x2ac
+#define KEY_MACRO30			0x2ad
+
+/* Note: 0x2ae - 0x2bf are served to extend the MACRO keys if necessary */
+
 #define BTN_TRIGGER_HAPPY		0x2c0
 #define BTN_TRIGGER_HAPPY1		0x2c0
 #define BTN_TRIGGER_HAPPY2		0x2c1
-- 
2.21.0


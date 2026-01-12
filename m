Return-Path: <linux-input+bounces-16955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8E6D108FA
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 05:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F3873097D48
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 04:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC5430CD8B;
	Mon, 12 Jan 2026 04:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIi1oDdk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B930C35E
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 04:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768191676; cv=none; b=K4ToNevC0bILIlOK2HEk9L8FeezI8o/1CSRSmdCXJ0w58IdzFp01r3rfuP8HDqwYt1S8VVq8ZyJAFFjpx0BbffgFb30sIHuQX2paASYFWbqd2LcAdVglDETSlWdUyCP4J+ZQveYZs1JIQNfsSOxeIfQC8aeE1wCqaVQW8I/t9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768191676; c=relaxed/simple;
	bh=7KupU8plT/Xn2/stWgD4+qjwfFojDlfPlgZKGF9Lw84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aINrbqhWZ3BLa/W1k/YSiB7olxxq/xlUquGMa/p+IpR+6pm6yWjKaB4D8j+n7QYkqxLjp6h6fn8H7fpJkn+8XoHxoe6DNZPO1WWCwveF1uCeud2FVbVEH6qW5PcbLJINgjINsG648XM5Zw1rXvBsA6wLaTsCt6Yw8AWUulpuvCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIi1oDdk; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b29ff9d18cso636229285a.3
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 20:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768191670; x=1768796470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVt5xK139IY5UuyrJxByRbDMj9qpXpLr/BwvYNYUW/o=;
        b=MIi1oDdkavYAODhVAjjeW/rtTjvcWzzhcOBxMXlupS8BH4n+ecaJ7GPeSqSwZtCd1l
         bSY1YiLpJlQqwWJE5QUWngJaJbBegpvbZjugUPb2HYG2jfLwonjfKuf9C5LUrn7bfyuT
         Wzc/aSo9HvEzSfouNT5+olMBCupY/gxl03Gp88fx8kU7zkPcBMA/tA3VnppFlhD/xuKo
         I0WNJH8Cay3parFemgjF/DxKiPhu4FsdsdA6dHczzkpHdyAFvt7gFfT5b5aDqv5Chj+U
         THDtXSw3tEWNtQ8/Cb4B+UtNzXZ2wcH4ffyPKHltUQhANeV33hBopK9jjhLopSmZ82iN
         k7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768191670; x=1768796470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dVt5xK139IY5UuyrJxByRbDMj9qpXpLr/BwvYNYUW/o=;
        b=oxybbkupQKutpXeYL2J14MyVE/Z+k5VfsKPUOOd3zCSd66eJ0XrvFws7+ebqmZtfkm
         VVayyfu8u5YSp0EgdVyXw/Y6j7REXYAkgAozlzqAPxJ9c/Ys9kWEOIXli12RARPAvd3X
         J3EekA2oIBi0yJ4AG0t8JbY5r2SPVzPeo4NnGFq8rhThDNPJIPfCt/lg9eUlOiJCQyD3
         71+++J3X45Jlk4pCGAenhAcLIQrdoj6bFjxZ2kebY327RGnqIyrGAYoHY58NeP7jYzOh
         +lOyF+DC9u3yoz6uJlJ4M6h7juNi7gc/0bvfJ32Xp4JYV665gwxC/E2iNewjJqLerAzA
         NSfg==
X-Forwarded-Encrypted: i=1; AJvYcCXSq8l+v8Im0rF24XhkHvQPeU3Ezr53tg0XUrMnbKXzIad6HryyIDhOUYMu0sMVR9eyFSKSArAGxPOwfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKnXtUeyR5uIRSGUm3+2n5hcgUlASaTQREkw5b/Cd8DcF33zR
	0doUegrkLwE2bOwxhW8OPrItO7SdOjcE0UpqGXvXai5WD7rTB0p+mKM+RsHQpxfi
X-Gm-Gg: AY/fxX4fh9ZGEx3JDKhcJVa6mUZrQFT7rMlbqkBGf5cCLiz8BEGnUl8U+xJwhHb4nQ4
	95LfU68oNnHYkAHNwcgbj+hten9Ox1kkoBR+aktWH9AoOR6WRMaNfQoJknKf+TifByYoFu6nXvZ
	ozt/REPn+E93Q/dbCLQT4PEMw1c3l1cglrYboe27LHQCv2/iOgR2EpONldQXZOD8DycWD3K1F0c
	5VoHXy3hnnjt8RowFnKgXjg33/GbzevOvpPs06bvlmbS37Ub7xz1P8mObeZZf3HwdV4PwNVYzoo
	Ed5vK6WkIYNQPJDKmVSPUdMUTaX/k75fd4QNKoI7+RfVrJwwtpcb3CeqNOzDV+jr7sdSivo/ozt
	RKE0xvNkSyFs3aoYUAdzuei2VcrfJnYnnwG+pAKEbqK6hoV3eig7OiCy6w9CTHLkFda1Sv2irRR
	SnHVBZQrJ8ic9TtDTvbVBQ7QxetSOZzDfN00jLxw==
X-Google-Smtp-Source: AGHT+IEPVsAEw1e9mk3EChbuqK05lRBMLAj1h5pfrZHXko8IHjDLdUHDvD2ACOr0GKyVM01gbmBzEQ==
X-Received: by 2002:a05:620a:2991:b0:8b2:e6b1:a9b6 with SMTP id af79cd13be357-8c3893690c1mr2127115485a.2.1768191669605;
        Sun, 11 Jan 2026 20:21:09 -0800 (PST)
Received: from achantapc.tail227c81.ts.net ([128.172.224.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4cd7a3sm1470618385a.24.2026.01.11.20.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:21:09 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH v2 4/4] HID: steelseries: Add support for Arctis headset lineup
Date: Sun, 11 Jan 2026 23:19:41 -0500
Message-ID: <20260112041941.40531-5-srimanachanta@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112041941.40531-1-srimanachanta@gmail.com>
References: <20260112041941.40531-1-srimanachanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add full support for the SteelSeries Arctis wireless gaming headset
lineup, extending the driver from basic support for 2 models (Arctis 1
and 9) to comprehensive support for 25+ models across all Arctis
generations.

This is a major restructure of the hid-steelseries driver that replaces
the previous minimal implementation with a unified, capability-based
architecture.

Architecture changes:
- Introduce steelseries_device_info structure to define per-device
  capabilities, interface bindings, and metadata
- Implement capability system (SS_CAP_*) for feature detection: battery,
  sidetone, chatmix, microphone controls, volume limiting, and Bluetooth
  settings
- Add interface binding logic to correctly bind to HID control
  interfaces on multi-interface USB devices using two modes:
  * Mode 0: Bind to first enumerated interface (for Arctis 9, Pro)
  * Mode 1: Bind to specific interface via bitmask (for other models)
- Create device info tables for all supported Arctis models with their
  specific capabilities and interface requirements

Features added:
- Battery monitoring: Implement power_supply integration with periodic
  polling and device-specific battery request protocols for all model
  families. Supports battery capacity reporting, charging status, and
  wireless connection tracking.
- Sidetone control: Sysfs attribute to adjust microphone monitoring
  volume (0-128) with device-specific mapping to hardware ranges
- Auto-sleep timeout: Configure inactivity timeout (0-90 minutes) before
  headset enters standby mode
- ChatMix reporting: Read-only sysfs attribute reporting game/chat audio
  balance from physical dial on supported models
- Microphone controls:
  * Mute LED brightness (0-3 or 0-10 depending on model)
  * Internal microphone gain/volume (0-128)
- Volume limiter: Enable/disable EU hearing protection (max volume cap)
- Bluetooth controls (Nova 7 series):
  * Auto-enable Bluetooth on power-on
  * Configure game audio attenuation during BT calls

Implementation details:
- Device-specific raw_event parsing for battery updates across different
  HID report formats (8-byte, 12-byte, 64-byte, 128-byte)
- Helper functions for HID feature reports and output reports to handle
  different communication methods across device families
- Attribute visibility system to expose only relevant controls for each
  device based on capability flags
- Save-state commands after configuration changes to persist settings
  across power cycles

The legacy SRW-S1 racing wheel controller support is preserved
unchanged.

Tested on Arctis Nova 7 (0x2202). All other implementation details are
based on the reverse engineering done in the HeadsetControl library
(abe3ac8).

Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
---
 drivers/hid/hid-steelseries.c | 2061 ++++++++++++++++++++++++++++-----
 1 file changed, 1740 insertions(+), 321 deletions(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index f98435631aa1..a0046fbc830b 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -4,9 +4,7 @@
  *
  *  Copyright (c) 2013 Simon Wood
  *  Copyright (c) 2023 Bastien Nocera
- */
-
-/*
+ *  Copyright (c) 2025 Sriman Achanta
  */
 
 #include <linux/device.h>
@@ -14,124 +12,144 @@
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/leds.h>
+#include <linux/power_supply.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
 
 #include "hid-ids.h"
 
-#define STEELSERIES_SRWS1		BIT(0)
-#define STEELSERIES_ARCTIS_1		BIT(1)
-#define STEELSERIES_ARCTIS_9		BIT(2)
+#define SS_CAP_SIDETONE BIT(0)
+#define SS_CAP_BATTERY BIT(1)
+#define SS_CAP_INACTIVE_TIME BIT(2)
+#define SS_CAP_CHATMIX BIT(3)
+#define SS_CAP_MIC_MUTE_LED BIT(4)
+#define SS_CAP_MIC_VOLUME BIT(5)
+#define SS_CAP_VOLUME_LIMITER BIT(6)
+#define SS_CAP_BT_POWER_ON BIT(7)
+#define SS_CAP_BT_CALL_VOL BIT(8)
+
+/* Legacy quirk flag for SRW-S1 */
+#define STEELSERIES_SRWS1 BIT(0)
+
+struct steelseries_device_info {
+	u16 product_id;
+	const char *name;
+	u8 interface_binding_mode; /* 0 = first enumerated, 1 = specific interface(s) */
+	u16 valid_interfaces; /* Bitmask when mode = 1, ignored when mode = 0 */
+	unsigned long capabilities;
+};
 
 struct steelseries_device {
 	struct hid_device *hdev;
-	unsigned long quirks;
-
-	struct delayed_work battery_work;
-	spinlock_t lock;
-	bool removed;
+	const struct steelseries_device_info *info;
 
+	/* Battery subsystem */
 	struct power_supply_desc battery_desc;
 	struct power_supply *battery;
-	uint8_t battery_capacity;
+	struct delayed_work battery_work;
+	u8 battery_capacity;
 	bool headset_connected;
 	bool battery_charging;
+
+	/* Synchronization */
+	spinlock_t lock;
+	bool removed;
+
+	/* Cached chatmix value (read-only from status) */
+	int chatmix_level;
 };
 
 #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
-    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
+	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
 #define SRWS1_NUMBER_LEDS 15
 struct steelseries_srws1_data {
 	__u16 led_state;
-	/* the last element is used for setting all leds simultaneously */
 	struct led_classdev *led[SRWS1_NUMBER_LEDS + 1];
 };
 #endif
 
-/* Fixed report descriptor for Steelseries SRW-S1 wheel controller
- *
- * The original descriptor hides the sensitivity and assists dials
- * a custom vendor usage page. This inserts a patch to make them
- * appear in the 'Generic Desktop' usage.
- */
-
+/* Fixed report descriptor for Steelseries SRW-S1 wheel controller */
 static const __u8 steelseries_srws1_rdesc_fixed[] = {
-0x05, 0x01,         /*  Usage Page (Desktop)                */
-0x09, 0x08,         /*  Usage (MultiAxis), Changed          */
-0xA1, 0x01,         /*  Collection (Application),           */
-0xA1, 0x02,         /*      Collection (Logical),           */
-0x95, 0x01,         /*          Report Count (1),           */
-0x05, 0x01,         /* Changed  Usage Page (Desktop),       */
-0x09, 0x30,         /* Changed  Usage (X),                  */
-0x16, 0xF8, 0xF8,   /*          Logical Minimum (-1800),    */
-0x26, 0x08, 0x07,   /*          Logical Maximum (1800),     */
-0x65, 0x14,         /*          Unit (Degrees),             */
-0x55, 0x0F,         /*          Unit Exponent (15),         */
-0x75, 0x10,         /*          Report Size (16),           */
-0x81, 0x02,         /*          Input (Variable),           */
-0x09, 0x31,         /* Changed  Usage (Y),                  */
-0x15, 0x00,         /*          Logical Minimum (0),        */
-0x26, 0xFF, 0x03,   /*          Logical Maximum (1023),     */
-0x75, 0x0C,         /*          Report Size (12),           */
-0x81, 0x02,         /*          Input (Variable),           */
-0x09, 0x32,         /* Changed  Usage (Z),                  */
-0x15, 0x00,         /*          Logical Minimum (0),        */
-0x26, 0xFF, 0x03,   /*          Logical Maximum (1023),     */
-0x75, 0x0C,         /*          Report Size (12),           */
-0x81, 0x02,         /*          Input (Variable),           */
-0x05, 0x01,         /*          Usage Page (Desktop),       */
-0x09, 0x39,         /*          Usage (Hat Switch),         */
-0x25, 0x07,         /*          Logical Maximum (7),        */
-0x35, 0x00,         /*          Physical Minimum (0),       */
-0x46, 0x3B, 0x01,   /*          Physical Maximum (315),     */
-0x65, 0x14,         /*          Unit (Degrees),             */
-0x75, 0x04,         /*          Report Size (4),            */
-0x95, 0x01,         /*          Report Count (1),           */
-0x81, 0x02,         /*          Input (Variable),           */
-0x25, 0x01,         /*          Logical Maximum (1),        */
-0x45, 0x01,         /*          Physical Maximum (1),       */
-0x65, 0x00,         /*          Unit,                       */
-0x75, 0x01,         /*          Report Size (1),            */
-0x95, 0x03,         /*          Report Count (3),           */
-0x81, 0x01,         /*          Input (Constant),           */
-0x05, 0x09,         /*          Usage Page (Button),        */
-0x19, 0x01,         /*          Usage Minimum (01h),        */
-0x29, 0x11,         /*          Usage Maximum (11h),        */
-0x95, 0x11,         /*          Report Count (17),          */
-0x81, 0x02,         /*          Input (Variable),           */
-                    /*   ---- Dial patch starts here ----   */
-0x05, 0x01,         /*          Usage Page (Desktop),       */
-0x09, 0x33,         /*          Usage (RX),                 */
-0x75, 0x04,         /*          Report Size (4),            */
-0x95, 0x02,         /*          Report Count (2),           */
-0x15, 0x00,         /*          Logical Minimum (0),        */
-0x25, 0x0b,         /*          Logical Maximum (b),        */
-0x81, 0x02,         /*          Input (Variable),           */
-0x09, 0x35,         /*          Usage (RZ),                 */
-0x75, 0x04,         /*          Report Size (4),            */
-0x95, 0x01,         /*          Report Count (1),           */
-0x25, 0x03,         /*          Logical Maximum (3),        */
-0x81, 0x02,         /*          Input (Variable),           */
-                    /*    ---- Dial patch ends here ----    */
-0x06, 0x00, 0xFF,   /*          Usage Page (FF00h),         */
-0x09, 0x01,         /*          Usage (01h),                */
-0x75, 0x04,         /* Changed  Report Size (4),            */
-0x95, 0x0D,         /* Changed  Report Count (13),          */
-0x81, 0x02,         /*          Input (Variable),           */
-0xC0,               /*      End Collection,                 */
-0xA1, 0x02,         /*      Collection (Logical),           */
-0x09, 0x02,         /*          Usage (02h),                */
-0x75, 0x08,         /*          Report Size (8),            */
-0x95, 0x10,         /*          Report Count (16),          */
-0x91, 0x02,         /*          Output (Variable),          */
-0xC0,               /*      End Collection,                 */
-0xC0                /*  End Collection                      */
+	0x05, 0x01, /*  Usage Page (Desktop)                */
+	0x09, 0x08, /*  Usage (MultiAxis), Changed          */
+	0xA1, 0x01, /*  Collection (Application),           */
+	0xA1, 0x02, /*      Collection (Logical),           */
+	0x95, 0x01, /*          Report Count (1),           */
+	0x05, 0x01, /* Changed  Usage Page (Desktop),       */
+	0x09, 0x30, /* Changed  Usage (X),                  */
+	0x16, 0xF8, 0xF8, /*          Logical Minimum (-1800),    */
+	0x26, 0x08, 0x07, /*          Logical Maximum (1800),     */
+	0x65, 0x14, /*          Unit (Degrees),             */
+	0x55, 0x0F, /*          Unit Exponent (15),         */
+	0x75, 0x10, /*          Report Size (16),           */
+	0x81, 0x02, /*          Input (Variable),           */
+	0x09, 0x31, /* Changed  Usage (Y),                  */
+	0x15, 0x00, /*          Logical Minimum (0),        */
+	0x26, 0xFF, 0x03, /*          Logical Maximum (1023),     */
+	0x75, 0x0C, /*          Report Size (12),           */
+	0x81, 0x02, /*          Input (Variable),           */
+	0x09, 0x32, /* Changed  Usage (Z),                  */
+	0x15, 0x00, /*          Logical Minimum (0),        */
+	0x26, 0xFF, 0x03, /*          Logical Maximum (1023),     */
+	0x75, 0x0C, /*          Report Size (12),           */
+	0x81, 0x02, /*          Input (Variable),           */
+	0x05, 0x01, /*          Usage Page (Desktop),       */
+	0x09, 0x39, /*          Usage (Hat Switch),         */
+	0x25, 0x07, /*          Logical Maximum (7),        */
+	0x35, 0x00, /*          Physical Minimum (0),       */
+	0x46, 0x3B, 0x01, /*          Physical Maximum (315),     */
+	0x65, 0x14, /*          Unit (Degrees),             */
+	0x75, 0x04, /*          Report Size (4),            */
+	0x95, 0x01, /*          Report Count (1),           */
+	0x81, 0x02, /*          Input (Variable),           */
+	0x25, 0x01, /*          Logical Maximum (1),        */
+	0x45, 0x01, /*          Physical Maximum (1),       */
+	0x65, 0x00, /*          Unit,                       */
+	0x75, 0x01, /*          Report Size (1),            */
+	0x95, 0x03, /*          Report Count (3),           */
+	0x81, 0x01, /*          Input (Constant),           */
+	0x05, 0x09, /*          Usage Page (Button),        */
+	0x19, 0x01, /*          Usage Minimum (01h),        */
+	0x29, 0x11, /*          Usage Maximum (11h),        */
+	0x95, 0x11, /*          Report Count (17),          */
+	0x81, 0x02, /*          Input (Variable),           */
+	/*   ---- Dial patch starts here ----   */
+	0x05, 0x01, /*          Usage Page (Desktop),       */
+	0x09, 0x33, /*          Usage (RX),                 */
+	0x75, 0x04, /*          Report Size (4),            */
+	0x95, 0x02, /*          Report Count (2),           */
+	0x15, 0x00, /*          Logical Minimum (0),        */
+	0x25, 0x0b, /*          Logical Maximum (b),        */
+	0x81, 0x02, /*          Input (Variable),           */
+	0x09, 0x35, /*          Usage (RZ),                 */
+	0x75, 0x04, /*          Report Size (4),            */
+	0x95, 0x01, /*          Report Count (1),           */
+	0x25, 0x03, /*          Logical Maximum (3),        */
+	0x81, 0x02, /*          Input (Variable),           */
+	/*    ---- Dial patch ends here ----    */
+	0x06, 0x00, 0xFF, /*          Usage Page (FF00h),         */
+	0x09, 0x01, /*          Usage (01h),                */
+	0x75, 0x04, /* Changed  Report Size (4),            */
+	0x95, 0x0D, /* Changed  Report Count (13),          */
+	0x81, 0x02, /*          Input (Variable),           */
+	0xC0, /*      End Collection,                 */
+	0xA1, 0x02, /*      Collection (Logical),           */
+	0x09, 0x02, /*          Usage (02h),                */
+	0x75, 0x08, /*          Report Size (8),            */
+	0x95, 0x10, /*          Report Count (16),          */
+	0x91, 0x02, /*          Output (Variable),          */
+	0xC0, /*      End Collection,                 */
+	0xC0 /*  End Collection                      */
 };
 
 #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
-    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
+	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
 static void steelseries_srws1_set_leds(struct hid_device *hdev, __u16 leds)
 {
-	struct list_head *report_list = &hdev->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct hid_report *report = list_entry(report_list->next, struct hid_report, list);
+	struct list_head *report_list =
+		&hdev->report_enum[HID_OUTPUT_REPORT].report_list;
+	struct hid_report *report =
+		list_entry(report_list->next, struct hid_report, list);
 	__s32 *value = report->field[0]->value;
 
 	value[0] = 0x40;
@@ -152,12 +170,11 @@ static void steelseries_srws1_set_leds(struct hid_device *hdev, __u16 leds)
 	value[15] = 0x00;
 
 	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
-
-	/* Note: LED change does not show on device until the device is read/polled */
 }
 
-static void steelseries_srws1_led_all_set_brightness(struct led_classdev *led_cdev,
-			enum led_brightness value)
+static void
+steelseries_srws1_led_all_set_brightness(struct led_classdev *led_cdev,
+					 enum led_brightness value)
 {
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hid = to_hid_device(dev);
@@ -176,7 +193,8 @@ static void steelseries_srws1_led_all_set_brightness(struct led_classdev *led_cd
 	steelseries_srws1_set_leds(hid, drv_data->led_state);
 }
 
-static enum led_brightness steelseries_srws1_led_all_get_brightness(struct led_classdev *led_cdev)
+static enum led_brightness
+steelseries_srws1_led_all_get_brightness(struct led_classdev *led_cdev)
 {
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hid = to_hid_device(dev);
@@ -193,7 +211,7 @@ static enum led_brightness steelseries_srws1_led_all_get_brightness(struct led_c
 }
 
 static void steelseries_srws1_led_set_brightness(struct led_classdev *led_cdev,
-			enum led_brightness value)
+						 enum led_brightness value)
 {
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hid = to_hid_device(dev);
@@ -221,7 +239,8 @@ static void steelseries_srws1_led_set_brightness(struct led_classdev *led_cdev,
 	}
 }
 
-static enum led_brightness steelseries_srws1_led_get_brightness(struct led_classdev *led_cdev)
+static enum led_brightness
+steelseries_srws1_led_get_brightness(struct led_classdev *led_cdev)
 {
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hid = to_hid_device(dev);
@@ -245,7 +264,7 @@ static enum led_brightness steelseries_srws1_led_get_brightness(struct led_class
 }
 
 static int steelseries_srws1_probe(struct hid_device *hdev,
-		const struct hid_device_id *id)
+				   const struct hid_device_id *id)
 {
 	int ret, i;
 	struct led_classdev *led;
@@ -288,7 +307,8 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 	name_sz = strlen(hdev->uniq) + 16;
 
 	/* 'ALL', for setting all LEDs simultaneously */
-	led = devm_kzalloc(&hdev->dev, sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
+	led = devm_kzalloc(&hdev->dev, sizeof(struct led_classdev) + name_sz,
+			   GFP_KERNEL);
 	if (!led) {
 		hid_err(hdev, "can't allocate memory for LED ALL\n");
 		goto out;
@@ -305,20 +325,23 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 	drv_data->led[SRWS1_NUMBER_LEDS] = led;
 	ret = devm_led_classdev_register(&hdev->dev, led);
 	if (ret) {
-		hid_err(hdev, "failed to register LED %d. Aborting.\n", SRWS1_NUMBER_LEDS);
-		goto out; /* let the driver continue without LEDs */
+		hid_err(hdev, "failed to register LED %d. Aborting.\n",
+			SRWS1_NUMBER_LEDS);
+		goto out;
 	}
 
 	/* Each individual LED */
 	for (i = 0; i < SRWS1_NUMBER_LEDS; i++) {
-		led = devm_kzalloc(&hdev->dev, sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
+		led = devm_kzalloc(&hdev->dev,
+				   sizeof(struct led_classdev) + name_sz,
+				   GFP_KERNEL);
 		if (!led) {
 			hid_err(hdev, "can't allocate memory for LED %d\n", i);
 			break;
 		}
 
 		name = (void *)(&led[1]);
-		snprintf(name, name_sz, "SRWS1::%s::RPM%d", hdev->uniq, i+1);
+		snprintf(name, name_sz, "SRWS1::%s::RPM%d", hdev->uniq, i + 1);
 		led->name = name;
 		led->brightness = 0;
 		led->max_brightness = 1;
@@ -329,8 +352,9 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 		ret = devm_led_classdev_register(&hdev->dev, led);
 
 		if (ret) {
-			hid_err(hdev, "failed to register LED %d. Aborting.\n", i);
-			break;	/* but let the driver continue without LEDs */
+			hid_err(hdev, "failed to register LED %d. Aborting.\n",
+				i);
+			break;
 		}
 	}
 out:
@@ -340,51 +364,277 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 }
 #endif
 
-#define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS	3000
+static const __u8 *steelseries_srws1_report_fixup(struct hid_device *hdev,
+						  __u8 *rdesc,
+						  unsigned int *rsize)
+{
+	if (hdev->vendor != USB_VENDOR_ID_STEELSERIES ||
+	    hdev->product != USB_DEVICE_ID_STEELSERIES_SRWS1)
+		return rdesc;
+
+	if (*rsize >= 115 && rdesc[11] == 0x02 && rdesc[13] == 0xc8 &&
+	    rdesc[29] == 0xbb && rdesc[40] == 0xc5) {
+		hid_info(hdev,
+			 "Fixing up Steelseries SRW-S1 report descriptor\n");
+		*rsize = sizeof(steelseries_srws1_rdesc_fixed);
+		return steelseries_srws1_rdesc_fixed;
+	}
+	return rdesc;
+}
+
+static const struct steelseries_device_info arctis_1_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_1,
+	.name = "Arctis 1 Wireless",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
 
-#define ARCTIS_1_BATTERY_RESPONSE_LEN		8
-#define ARCTIS_9_BATTERY_RESPONSE_LEN		64
-static const char arctis_1_battery_request[] = { 0x06, 0x12 };
-static const char arctis_9_battery_request[] = { 0x00, 0x20 };
+static const struct steelseries_device_info arctis_1_x_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X,
+	.name = "Arctis 1 Wireless for Xbox",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
 
-static int steelseries_headset_request_battery(struct hid_device *hdev,
-	const char *request, size_t len)
-{
-	u8 *write_buf;
-	int ret;
+static const struct steelseries_device_info arctis_7_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7,
+	.name = "Arctis 7",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(5),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
 
-	/* Request battery information */
-	write_buf = kmemdup(request, len, GFP_KERNEL);
-	if (!write_buf)
-		return -ENOMEM;
+static const struct steelseries_device_info arctis_7_p_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P,
+	.name = "Arctis 7P",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
 
-	hid_dbg(hdev, "Sending battery request report");
-	ret = hid_hw_raw_request(hdev, request[0], write_buf, len,
-				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret < (int)len) {
-		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
-		ret = -ENODATA;
-	}
+static const struct steelseries_device_info arctis_7_x_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X,
+	.name = "Arctis 7X",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
 
-	kfree(write_buf);
-	return ret;
-}
+static const struct steelseries_device_info arctis_7_gen2_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2,
+	.name = "Arctis 7 (2019 Edition)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(5),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
 
-static void steelseries_headset_fetch_battery(struct hid_device *hdev)
-{
-	int ret = 0;
+static const struct steelseries_device_info arctis_7_plus_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS,
+	.name = "Arctis 7+",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY |
+			SS_CAP_INACTIVE_TIME | SS_CAP_CHATMIX,
+};
 
-	if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1)
-		ret = steelseries_headset_request_battery(hdev,
-			arctis_1_battery_request, sizeof(arctis_1_battery_request));
-	else if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9)
-		ret = steelseries_headset_request_battery(hdev,
-			arctis_9_battery_request, sizeof(arctis_9_battery_request));
+static const struct steelseries_device_info arctis_7_plus_p_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P,
+	.name = "Arctis 7+ (PlayStation)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY |
+			SS_CAP_INACTIVE_TIME | SS_CAP_CHATMIX,
+};
 
-	if (ret < 0)
-		hid_dbg(hdev,
-			"Battery query failed (err: %d)\n", ret);
-}
+static const struct steelseries_device_info arctis_7_plus_x_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X,
+	.name = "Arctis 7+ (Xbox)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY |
+			SS_CAP_INACTIVE_TIME | SS_CAP_CHATMIX,
+};
+
+static const struct steelseries_device_info arctis_7_plus_destiny_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY,
+	.name = "Arctis 7+ (Destiny Edition)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY |
+			SS_CAP_INACTIVE_TIME | SS_CAP_CHATMIX,
+};
+
+static const struct steelseries_device_info arctis_9_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_9,
+	.name = "Arctis 9",
+	.interface_binding_mode = 0,
+	.valid_interfaces = 0,
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY |
+			SS_CAP_INACTIVE_TIME | SS_CAP_CHATMIX,
+};
+
+static const struct steelseries_device_info arctis_pro_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO,
+	.name = "Arctis Pro Wireless",
+	.interface_binding_mode = 0,
+	.valid_interfaces = 0,
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
+
+static const struct steelseries_device_info arctis_nova_3_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3,
+	.name = "Arctis Nova 3",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(4),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME,
+};
+
+static const struct steelseries_device_info arctis_nova_3_p_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P,
+	.name = "Arctis Nova 3 (PlayStation)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(0),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_VOLUME,
+};
+
+static const struct steelseries_device_info arctis_nova_3_x_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X,
+	.name = "Arctis Nova 3 (Xbox)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(0),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_VOLUME,
+};
+
+static const struct steelseries_device_info arctis_nova_5_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5,
+	.name = "Arctis Nova 5",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER,
+};
+
+static const struct steelseries_device_info arctis_nova_5_x_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X,
+	.name = "Arctis Nova 5X",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER,
+};
+
+static const struct steelseries_device_info arctis_nova_7_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7,
+	.name = "Arctis Nova 7",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_7_x_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X,
+	.name = "Arctis Nova 7X",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_7_p_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P,
+	.name = "Arctis Nova 7P",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_7_x_rev2_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2,
+	.name = "Arctis Nova 7X (Rev 2)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_7_diablo_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO,
+	.name = "Arctis Nova 7 (Diablo IV Edition)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_7_wow_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW,
+	.name = "Arctis Nova 7 (World of Warcraft Edition)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_7_gen2_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2,
+	.name = "Arctis Nova 7 (Gen 2)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_7_x_gen2_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2,
+	.name = "Arctis Nova 7X (Gen 2)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(3),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_CHATMIX |
+			SS_CAP_INACTIVE_TIME | SS_CAP_MIC_MUTE_LED |
+			SS_CAP_MIC_VOLUME | SS_CAP_VOLUME_LIMITER |
+			SS_CAP_BT_POWER_ON | SS_CAP_BT_CALL_VOL,
+};
+
+static const struct steelseries_device_info arctis_nova_pro_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO,
+	.name = "Arctis Nova Pro Wireless",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(4),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
+
+static const struct steelseries_device_info arctis_nova_pro_x_info = {
+	.product_id = USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X,
+	.name = "Arctis Nova Pro Wireless (Xbox)",
+	.interface_binding_mode = 1,
+	.valid_interfaces = BIT(4),
+	.capabilities = SS_CAP_SIDETONE | SS_CAP_BATTERY | SS_CAP_INACTIVE_TIME,
+};
+
+#define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS 3000
 
 static int battery_capacity_to_level(int capacity)
 {
@@ -395,29 +645,45 @@ static int battery_capacity_to_level(int capacity)
 	return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
 }
 
-static void steelseries_headset_battery_timer_tick(struct work_struct *work)
+static u8 steelseries_map_battery(u8 capacity, u8 min_in, u8 max_in)
+{
+	if (capacity >= max_in)
+		return 100;
+	if (capacity <= min_in)
+		return 0;
+	return (capacity - min_in) * 100 / (max_in - min_in);
+}
+
+static void steelseries_headset_set_wireless_status(struct hid_device *hdev,
+						    bool connected)
 {
-	struct steelseries_device *sd = container_of(work,
-		struct steelseries_device, battery_work.work);
-	struct hid_device *hdev = sd->hdev;
+	struct usb_interface *intf;
 
-	steelseries_headset_fetch_battery(hdev);
+	if (!hid_is_usb(hdev))
+		return;
+
+	intf = to_usb_interface(hdev->dev.parent);
+	usb_set_wireless_status(intf, connected ?
+					      USB_WIRELESS_STATUS_CONNECTED :
+					      USB_WIRELESS_STATUS_DISCONNECTED);
 }
 
 #define STEELSERIES_PREFIX "SteelSeries "
 #define STEELSERIES_PREFIX_LEN strlen(STEELSERIES_PREFIX)
 
-static int steelseries_headset_battery_get_property(struct power_supply *psy,
-				enum power_supply_property psp,
-				union power_supply_propval *val)
+static int steelseries_battery_get_property(struct power_supply *psy,
+					    enum power_supply_property psp,
+					    union power_supply_propval *val)
 {
 	struct steelseries_device *sd = power_supply_get_drvdata(psy);
+	unsigned long flags;
 	int ret = 0;
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_MODEL_NAME:
 		val->strval = sd->hdev->name;
-		while (!strncmp(val->strval, STEELSERIES_PREFIX, STEELSERIES_PREFIX_LEN))
+		while (!strncmp(val->strval, STEELSERIES_PREFIX,
+				STEELSERIES_PREFIX_LEN))
 			val->strval += STEELSERIES_PREFIX_LEN;
 		break;
 	case POWER_SUPPLY_PROP_MANUFACTURER:
@@ -427,21 +693,28 @@ static int steelseries_headset_battery_get_property(struct power_supply *psy,
 		val->intval = 1;
 		break;
 	case POWER_SUPPLY_PROP_STATUS:
+		spin_lock_irqsave(&sd->lock, flags);
 		if (sd->headset_connected) {
 			val->intval = sd->battery_charging ?
-				POWER_SUPPLY_STATUS_CHARGING :
-				POWER_SUPPLY_STATUS_DISCHARGING;
-		} else
+					      POWER_SUPPLY_STATUS_CHARGING :
+					      POWER_SUPPLY_STATUS_DISCHARGING;
+		} else {
 			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
+		}
+		spin_unlock_irqrestore(&sd->lock, flags);
 		break;
 	case POWER_SUPPLY_PROP_SCOPE:
 		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
 		break;
 	case POWER_SUPPLY_PROP_CAPACITY:
+		spin_lock_irqsave(&sd->lock, flags);
 		val->intval = sd->battery_capacity;
+		spin_unlock_irqrestore(&sd->lock, flags);
 		break;
 	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
+		spin_lock_irqsave(&sd->lock, flags);
 		val->intval = battery_capacity_to_level(sd->battery_capacity);
+		spin_unlock_irqrestore(&sd->lock, flags);
 		break;
 	default:
 		ret = -EINVAL;
@@ -450,289 +723,1434 @@ static int steelseries_headset_battery_get_property(struct power_supply *psy,
 	return ret;
 }
 
-static void
-steelseries_headset_set_wireless_status(struct hid_device *hdev,
-					bool connected)
+static enum power_supply_property steelseries_battery_props[] = {
+	POWER_SUPPLY_PROP_MODEL_NAME,	  POWER_SUPPLY_PROP_MANUFACTURER,
+	POWER_SUPPLY_PROP_PRESENT,	  POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_SCOPE,	  POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
+};
+
+/* Forward declarations for battery request functions */
+static int steelseries_arctis_1_request_battery(struct hid_device *hdev);
+static int steelseries_arctis_7_plus_request_battery(struct hid_device *hdev);
+static int steelseries_arctis_9_request_battery(struct hid_device *hdev);
+static int steelseries_arctis_nova_request_battery(struct hid_device *hdev);
+static int steelseries_arctis_nova_3p_request_battery(struct hid_device *hdev);
+static int
+steelseries_arctis_pro_wireless_request_battery(struct hid_device *hdev);
+
+static int steelseries_request_battery(struct hid_device *hdev)
 {
-	struct usb_interface *intf;
+	u16 product = hdev->product;
 
-	if (!hid_is_usb(hdev))
-		return;
+	/* Route to device-specific battery request handler */
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1 ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X)
+		return steelseries_arctis_1_request_battery(hdev);
 
-	intf = to_usb_interface(hdev->dev.parent);
-	usb_set_wireless_status(intf, connected ?
-				USB_WIRELESS_STATUS_CONNECTED :
-				USB_WIRELESS_STATUS_DISCONNECTED);
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY)
+		return steelseries_arctis_7_plus_request_battery(hdev);
+
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9)
+		return steelseries_arctis_9_request_battery(hdev);
+
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO)
+		return steelseries_arctis_pro_wireless_request_battery(hdev);
+
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X)
+		return steelseries_arctis_nova_3p_request_battery(hdev);
+
+	/* All other Nova series use the same battery request */
+	return steelseries_arctis_nova_request_battery(hdev);
 }
 
-static enum power_supply_property steelseries_headset_battery_props[] = {
-	POWER_SUPPLY_PROP_MODEL_NAME,
-	POWER_SUPPLY_PROP_MANUFACTURER,
-	POWER_SUPPLY_PROP_PRESENT,
-	POWER_SUPPLY_PROP_STATUS,
-	POWER_SUPPLY_PROP_SCOPE,
-	POWER_SUPPLY_PROP_CAPACITY,
-	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
-};
+static void steelseries_battery_timer_tick(struct work_struct *work)
+{
+	struct steelseries_device *sd = container_of(
+		work, struct steelseries_device, battery_work.work);
+
+	steelseries_request_battery(sd->hdev);
+}
 
-static int steelseries_headset_battery_register(struct steelseries_device *sd)
+static int steelseries_battery_register(struct steelseries_device *sd)
 {
 	static atomic_t battery_no = ATOMIC_INIT(0);
-	struct power_supply_config battery_cfg = { .drv_data = sd, };
+	struct power_supply_config battery_cfg = {
+		.drv_data = sd,
+	};
 	unsigned long n;
 	int ret;
 
 	sd->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
-	sd->battery_desc.properties = steelseries_headset_battery_props;
-	sd->battery_desc.num_properties = ARRAY_SIZE(steelseries_headset_battery_props);
-	sd->battery_desc.get_property = steelseries_headset_battery_get_property;
+	sd->battery_desc.properties = steelseries_battery_props;
+	sd->battery_desc.num_properties = ARRAY_SIZE(steelseries_battery_props);
+	sd->battery_desc.get_property = steelseries_battery_get_property;
 	sd->battery_desc.use_for_apm = 0;
 	n = atomic_inc_return(&battery_no) - 1;
-	sd->battery_desc.name = devm_kasprintf(&sd->hdev->dev, GFP_KERNEL,
-						    "steelseries_headset_battery_%ld", n);
+	sd->battery_desc.name =
+		devm_kasprintf(&sd->hdev->dev, GFP_KERNEL,
+			       "steelseries_headset_battery_%ld", n);
 	if (!sd->battery_desc.name)
 		return -ENOMEM;
 
-	/* avoid the warning of 0% battery while waiting for the first info */
 	steelseries_headset_set_wireless_status(sd->hdev, false);
-	sd->battery_capacity = 100;
+	sd->battery_capacity =
+		100; /* Start with full to avoid low battery warnings */
 	sd->battery_charging = false;
+	sd->headset_connected = false;
+	sd->chatmix_level = 64;
 
-	sd->battery = devm_power_supply_register(&sd->hdev->dev,
-			&sd->battery_desc, &battery_cfg);
+	sd->battery = devm_power_supply_register(
+		&sd->hdev->dev, &sd->battery_desc, &battery_cfg);
 	if (IS_ERR(sd->battery)) {
 		ret = PTR_ERR(sd->battery);
-		hid_err(sd->hdev,
-				"%s:power_supply_register failed with error %d\n",
-				__func__, ret);
+		hid_err(sd->hdev, "Failed to register battery: %d\n", ret);
 		return ret;
 	}
 	power_supply_powers(sd->battery, &sd->hdev->dev);
 
-	INIT_DELAYED_WORK(&sd->battery_work, steelseries_headset_battery_timer_tick);
-	steelseries_headset_fetch_battery(sd->hdev);
+	INIT_DELAYED_WORK(&sd->battery_work, steelseries_battery_timer_tick);
+	steelseries_request_battery(sd->hdev);
 
-	if (sd->quirks & STEELSERIES_ARCTIS_9) {
-		/* The first fetch_battery request can remain unanswered in some cases */
-		schedule_delayed_work(&sd->battery_work,
-				msecs_to_jiffies(STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS));
+	/* Arctis 9 may need a retry */
+	if (sd->hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9) {
+		schedule_delayed_work(
+			&sd->battery_work,
+			msecs_to_jiffies(
+				STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS));
 	}
 
 	return 0;
 }
 
-static bool steelseries_is_vendor_usage_page(struct hid_device *hdev, uint8_t usage_page)
+/* Helper function to send feature reports */
+static int steelseries_send_feature_report(struct hid_device *hdev,
+					   const u8 *data, size_t len)
 {
-	return hdev->rdesc[0] == 0x06 &&
-		hdev->rdesc[1] == usage_page &&
-		hdev->rdesc[2] == 0xff;
+	u8 *buf;
+	int ret;
+
+	buf = kmemdup(data, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, data[0], buf, len, HID_FEATURE_REPORT,
+				 HID_REQ_SET_REPORT);
+	kfree(buf);
+
+	if (ret < 0)
+		return ret;
+	if (ret < len)
+		return -EIO;
+
+	return 0;
 }
 
-static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id *id)
+/* Helper function to send output reports */
+static int steelseries_send_output_report(struct hid_device *hdev,
+					  const u8 *data, size_t len)
 {
-	struct steelseries_device *sd;
+	u8 *buf;
 	int ret;
 
-	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
-#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
-    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
-		return steelseries_srws1_probe(hdev, id);
-#else
-		return -ENODEV;
-#endif
-	}
-
-	sd = devm_kzalloc(&hdev->dev, sizeof(*sd), GFP_KERNEL);
-	if (!sd)
+	buf = kmemdup(data, len, GFP_KERNEL);
+	if (!buf)
 		return -ENOMEM;
-	hid_set_drvdata(hdev, sd);
-	sd->hdev = hdev;
-	sd->quirks = id->driver_data;
 
-	ret = hid_parse(hdev);
-	if (ret)
+	/* Use raw_request with OUTPUT_REPORT type for devices without Interrupt OUT */
+	ret = hid_hw_raw_request(hdev, data[0], buf, len, HID_OUTPUT_REPORT,
+				 HID_REQ_SET_REPORT);
+	kfree(buf);
+
+	if (ret < 0)
 		return ret;
+	if (ret < len)
+		return -EIO;
 
-	if (sd->quirks & STEELSERIES_ARCTIS_9 &&
-			!steelseries_is_vendor_usage_page(hdev, 0xc0))
-		return -ENODEV;
+	return 0;
+}
 
-	spin_lock_init(&sd->lock);
+/* Sidetone level attribute */
+static ssize_t sidetone_level_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	/* Sidetone is write-only, no way to read current value */
+	return sysfs_emit(buf, "Write-only attribute (0-128)\n");
+}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
-	if (ret)
-		return ret;
+static ssize_t sidetone_level_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	u16 product = hdev->product;
+	unsigned int value;
+	u8 data[64] = { 0 };
+	int ret;
 
-	ret = hid_hw_open(hdev);
-	if (ret)
-		return ret;
+	if (kstrtouint(buf, 10, &value))
+		return -EINVAL;
+	if (value > 128)
+		return -EINVAL;
+
+	/* Device-specific sidetone mappings */
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1 ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7 ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2) {
+		/* Map 0-128 to 0x00-0x12 (18) */
+		u8 level = (value * 0x12) / 128;
+
+		if (level == 0) {
+			data[0] = 0x06;
+			data[1] = 0x35;
+			data[2] = 0x00;
+			ret = steelseries_send_feature_report(hdev, data, 31);
+		} else {
+			data[0] = 0x06;
+			data[1] = 0x35;
+			data[2] = 0x01;
+			data[3] = 0x00;
+			data[4] = level;
+			ret = steelseries_send_feature_report(hdev, data, 31);
+		}
+		if (ret >= 0) {
+			/* Save state */
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_feature_report(hdev, data, 31);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY) {
+		/* Map to 0-3 levels */
+		u8 level;
+
+		if (value < 26)
+			level = 0x0;
+		else if (value < 51)
+			level = 0x1;
+		else if (value < 76)
+			level = 0x2;
+		else
+			level = 0x3;
+
+		data[0] = 0x00;
+		data[1] = 0x39;
+		data[2] = level;
+		ret = steelseries_send_feature_report(hdev, data, 64);
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9) {
+		/* Arctis 9: exponential mapping to 0xc0-0xfd */
+		u8 level;
+
+		if (value == 0)
+			level = 0xc0;
+		else
+			level = 0xc0 + ((value * (0xfd - 0xc0)) / 128);
+
+		data[0] = 0x06;
+		data[1] = 0x00;
+		data[2] = level;
+		ret = steelseries_send_feature_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x90;
+			data[1] = 0x00;
+			steelseries_send_feature_report(hdev, data, 31);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO) {
+		/* Arctis Pro Wireless: 0x00-0x09 */
+		u8 level = (value * 0x09) / 128;
+
+		data[0] = 0x39;
+		data[1] = 0xAA;
+		data[2] = level;
+		ret = steelseries_send_feature_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x90;
+			data[1] = 0xAA;
+			steelseries_send_feature_report(hdev, data, 31);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) {
+		/* Nova 3: 0-3 levels */
+		u8 level;
+
+		if (value < 26)
+			level = 0x0;
+		else if (value < 51)
+			level = 0x1;
+		else if (value < 76)
+			level = 0x2;
+		else
+			level = 0x3;
+
+		data[0] = 0x06;
+		data[1] = 0x39;
+		data[2] = level;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X) {
+		/* Nova 3P/3X: Map to 0-10 */
+		u8 level = (value * 0x0a) / 128;
+
+		data[0] = 0x39;
+		data[1] = level;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5 ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) {
+		/* Nova 5: Map to 0-10 */
+		u8 level = (value * 0x0a) / 128;
+
+		data[0] = 0x00;
+		data[1] = 0x39;
+		data[2] = level;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+			data[0] = 0x00;
+			data[1] = 0x35;
+			data[2] = 0x01;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X) {
+		/* Nova Pro: 0-3 only */
+		if (value > 3)
+			return -EINVAL;
+		data[0] = 0x06;
+		data[1] = 0x39;
+		data[2] = value;
+		ret = steelseries_send_output_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 31);
+		}
+	} else {
+		/* Nova 7 series: 0-3 levels */
+		u8 level;
+
+		if (value < 26)
+			level = 0x0;
+		else if (value < 51)
+			level = 0x1;
+		else if (value < 76)
+			level = 0x2;
+		else
+			level = 0x3;
+
+		data[0] = 0x00;
+		data[1] = 0x39;
+		data[2] = level;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			memset(data, 0, sizeof(data));
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	}
 
-	if (steelseries_headset_battery_register(sd) < 0)
-		hid_err(sd->hdev,
-			"Failed to register battery for headset\n");
+	return (ret < 0) ? ret : count;
+}
+static DEVICE_ATTR_RW(sidetone_level);
 
-	return ret;
+/* Inactive time attribute */
+static ssize_t inactive_time_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "Write-only attribute (0-90 minutes)\n");
 }
 
-static void steelseries_remove(struct hid_device *hdev)
+static ssize_t inactive_time_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
-	struct steelseries_device *sd;
-	unsigned long flags;
+	struct hid_device *hdev = to_hid_device(dev);
+	u16 product = hdev->product;
+	unsigned int value;
+	u8 data[64] = { 0 };
+	int ret;
 
-	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
-#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
-    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
-		hid_hw_stop(hdev);
-#endif
-		return;
+	if (kstrtouint(buf, 10, &value))
+		return -EINVAL;
+	if (value > 90)
+		return -EINVAL;
+
+	/* Device-specific mappings */
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1 ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X) {
+		data[0] = 0x06;
+		data[1] = 0x53;
+		data[2] = value;
+		ret = steelseries_send_feature_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_feature_report(hdev, data, 31);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7 ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2) {
+		data[0] = 0x06;
+		data[1] = 0x51;
+		data[2] = value;
+		ret = steelseries_send_feature_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_feature_report(hdev, data, 31);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY) {
+		data[0] = 0x00;
+		data[1] = 0xa3;
+		data[2] = value;
+		ret = steelseries_send_feature_report(hdev, data, 64);
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9) {
+		/* Arctis 9 uses seconds */
+		u32 seconds = value * 60;
+
+		data[0] = 0x04;
+		data[1] = 0x00;
+		data[2] = (seconds >> 8) & 0xff;
+		data[3] = seconds & 0xff;
+		ret = steelseries_send_feature_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x90;
+			data[1] = 0x00;
+			steelseries_send_feature_report(hdev, data, 31);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO) {
+		/* Pro Wireless uses 10-minute increments */
+		u8 increments = value / 10;
+
+		data[0] = 0x3c;
+		data[1] = 0xAA;
+		data[2] = increments;
+		ret = steelseries_send_feature_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x90;
+			data[1] = 0xAA;
+			steelseries_send_feature_report(hdev, data, 31);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X) {
+		/* Map to specific values */
+		u8 mapped;
+
+		if (value >= 90)
+			mapped = 90;
+		else if (value >= 75)
+			mapped = 75;
+		else if (value >= 60)
+			mapped = 60;
+		else if (value >= 45)
+			mapped = 45;
+		else if (value >= 30)
+			mapped = 30;
+		else if (value >= 15)
+			mapped = 15;
+		else if (value >= 10)
+			mapped = 10;
+		else if (value >= 5)
+			mapped = 5;
+		else if (value >= 1)
+			mapped = 1;
+		else
+			mapped = 0;
+
+		data[0] = 0xa3;
+		data[1] = mapped;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X) {
+		/* Map to enum values */
+		u8 mapped;
+
+		if (value >= 45)
+			mapped = 6;
+		else if (value >= 23)
+			mapped = 5;
+		else if (value >= 13)
+			mapped = 4;
+		else if (value >= 8)
+			mapped = 3;
+		else if (value >= 3)
+			mapped = 2;
+		else if (value > 0)
+			mapped = 1;
+		else
+			mapped = 0;
+
+		data[0] = 0x06;
+		data[1] = 0xc1;
+		data[2] = mapped;
+		ret = steelseries_send_output_report(hdev, data, 31);
+		if (ret >= 0) {
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 31);
+		}
+	} else {
+		/* Nova 5/7 series */
+		data[0] = 0x00;
+		data[1] = 0xa3;
+		data[2] = value;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			memset(data, 0, sizeof(data));
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
 	}
 
-	sd = hid_get_drvdata(hdev);
+	return (ret < 0) ? ret : count;
+}
+static DEVICE_ATTR_RW(inactive_time);
 
-	spin_lock_irqsave(&sd->lock, flags);
-	sd->removed = true;
-	spin_unlock_irqrestore(&sd->lock, flags);
+/* ChatMix level attribute (read-only) */
+static ssize_t chatmix_level_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct steelseries_device *sd = hid_get_drvdata(hdev);
 
-	cancel_delayed_work_sync(&sd->battery_work);
+	return sysfs_emit(buf, "%d\n", sd->chatmix_level);
+}
+static DEVICE_ATTR_RO(chatmix_level);
 
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
+/* Microphone mute LED brightness */
+static ssize_t mic_mute_led_brightness_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	return sysfs_emit(buf,
+			  "Write-only (0-3 or 0-10 depending on device)\n");
 }
 
-static const __u8 *steelseries_srws1_report_fixup(struct hid_device *hdev,
-		__u8 *rdesc, unsigned int *rsize)
+static ssize_t mic_mute_led_brightness_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
 {
-	if (hdev->vendor != USB_VENDOR_ID_STEELSERIES ||
-	    hdev->product != USB_DEVICE_ID_STEELSERIES_SRWS1)
-		return rdesc;
+	struct hid_device *hdev = to_hid_device(dev);
+	u16 product = hdev->product;
+	unsigned int value;
+	u8 data[64] = { 0 };
+	int ret;
 
-	if (*rsize >= 115 && rdesc[11] == 0x02 && rdesc[13] == 0xc8
-			&& rdesc[29] == 0xbb && rdesc[40] == 0xc5) {
-		hid_info(hdev, "Fixing up Steelseries SRW-S1 report descriptor\n");
-		*rsize = sizeof(steelseries_srws1_rdesc_fixed);
-		return steelseries_srws1_rdesc_fixed;
+	if (kstrtouint(buf, 10, &value))
+		return -EINVAL;
+
+	/* Device-specific validation */
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) {
+		if (value > 3)
+			return -EINVAL;
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5 ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) {
+		if (value > 10)
+			return -EINVAL;
+		/* Map special values */
+		if (value == 2)
+			value = 0x04;
+		else if (value == 3)
+			value = 0x0a;
+	} else {
+		if (value > 3)
+			return -EINVAL;
 	}
-	return rdesc;
+
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) {
+		data[0] = 0x06;
+		data[1] = 0xae;
+		data[2] = value;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5 ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) {
+		data[0] = 0x00;
+		data[1] = 0xae;
+		data[2] = value;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+			data[0] = 0x00;
+			data[1] = 0x35;
+			data[2] = 0x01;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else {
+		/* Nova 7 series */
+		data[0] = 0x00;
+		data[1] = 0xae;
+		data[2] = value;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			memset(data, 0, sizeof(data));
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	}
+
+	return (ret < 0) ? ret : count;
 }
+static DEVICE_ATTR_RW(mic_mute_led_brightness);
 
-static uint8_t steelseries_headset_map_capacity(uint8_t capacity, uint8_t min_in, uint8_t max_in)
+/* Microphone volume */
+static ssize_t mic_volume_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
-	if (capacity >= max_in)
-		return 100;
-	if (capacity <= min_in)
-		return 0;
-	return (capacity - min_in) * 100 / (max_in - min_in);
+	return sysfs_emit(buf, "Write-only (0-128)\n");
+}
+
+static ssize_t mic_volume_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	u16 product = hdev->product;
+	unsigned int value;
+	u8 data[64] = { 0 };
+	u8 mapped;
+	int ret;
+
+	if (kstrtouint(buf, 10, &value))
+		return -EINVAL;
+	if (value > 128)
+		return -EINVAL;
+
+	/* Map 0-128 to device-specific range */
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) {
+		/* Map to 0-10 */
+		if (value < 13)
+			mapped = 0x00;
+		else if (value < 25)
+			mapped = 0x01;
+		else if (value < 37)
+			mapped = 0x02;
+		else if (value < 49)
+			mapped = 0x03;
+		else if (value < 61)
+			mapped = 0x04;
+		else if (value < 73)
+			mapped = 0x05;
+		else if (value < 85)
+			mapped = 0x06;
+		else if (value < 97)
+			mapped = 0x07;
+		else if (value < 109)
+			mapped = 0x08;
+		else if (value < 121)
+			mapped = 0x09;
+		else
+			mapped = 0x0a;
+
+		data[0] = 0x06;
+		data[1] = 0x37;
+		data[2] = mapped;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x06;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X) {
+		/* Map to 0-14 */
+		mapped = (value * 0x0e) / 128;
+		data[0] = 0x37;
+		data[1] = mapped;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5 ||
+		   product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) {
+		/* Map to 0-15 */
+		mapped = value / 8;
+		if (mapped == 16)
+			mapped = 15;
+
+		data[0] = 0x00;
+		data[1] = 0x37;
+		data[2] = mapped;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+			data[0] = 0x00;
+			data[1] = 0x35;
+			data[2] = 0x01;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else {
+		/* Nova 7: map to 0-7 */
+		mapped = value / 16;
+		if (mapped == 8)
+			mapped = 7;
+
+		data[0] = 0x00;
+		data[1] = 0x37;
+		data[2] = mapped;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			memset(data, 0, sizeof(data));
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	}
+
+	return (ret < 0) ? ret : count;
+}
+static DEVICE_ATTR_RW(mic_volume);
+
+/* Volume limiter */
+static ssize_t volume_limiter_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "Write-only (0=off, 1=on)\n");
+}
+
+static ssize_t volume_limiter_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	u16 product = hdev->product;
+	unsigned int value;
+	u8 data[64] = { 0 };
+	int ret;
+
+	if (kstrtouint(buf, 10, &value))
+		return -EINVAL;
+	if (value > 1)
+		return -EINVAL;
+
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5 ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) {
+		data[0] = 0x00;
+		data[1] = 0x27;
+		data[2] = value;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+			data[0] = 0x00;
+			data[1] = 0x35;
+			data[2] = 0x01;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	} else {
+		/* Nova 7 series */
+		data[0] = 0x00;
+		data[1] = 0x3a;
+		data[2] = value;
+		ret = steelseries_send_output_report(hdev, data, 64);
+		if (ret >= 0) {
+			memset(data, 0, sizeof(data));
+			data[0] = 0x00;
+			data[1] = 0x09;
+			steelseries_send_output_report(hdev, data, 64);
+		}
+	}
+
+	return (ret < 0) ? ret : count;
 }
+static DEVICE_ATTR_RW(volume_limiter);
 
-static int steelseries_headset_raw_event(struct hid_device *hdev,
-					struct hid_report *report, u8 *read_buf,
-					int size)
+/* Bluetooth when powered on */
+static ssize_t bluetooth_on_power_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
 {
+	return sysfs_emit(buf, "Write-only (0=off, 1=on)\n");
+}
+
+static ssize_t bluetooth_on_power_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	unsigned int value;
+	u8 data[64] = { 0 };
+	int ret;
+
+	if (kstrtouint(buf, 10, &value))
+		return -EINVAL;
+	if (value > 1)
+		return -EINVAL;
+
+	data[0] = 0x00;
+	data[1] = 0xb2;
+	data[2] = value;
+	ret = steelseries_send_output_report(hdev, data, 64);
+	if (ret >= 0) {
+		/* Send save state command as output report */
+		memset(data, 0, sizeof(data));
+		data[0] = 0x00;
+		data[1] = 0x09;
+		steelseries_send_output_report(hdev, data, 64);
+	}
+
+	return (ret < 0) ? ret : count;
+}
+static DEVICE_ATTR_RW(bluetooth_on_power);
+
+/* Bluetooth call volume */
+static ssize_t bluetooth_call_vol_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf,
+			  "Write-only (0=nothing, 1=-12dB, 2=mute game)\n");
+}
+
+static ssize_t bluetooth_call_vol_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	unsigned int value;
+	u8 data[64] = { 0 };
+	int ret;
+
+	if (kstrtouint(buf, 10, &value))
+		return -EINVAL;
+	if (value > 2)
+		return -EINVAL;
+
+	data[0] = 0x00;
+	data[1] = 0xb3;
+	data[2] = value;
+	ret = steelseries_send_output_report(hdev, data, 64);
+
+	return (ret < 0) ? ret : count;
+}
+static DEVICE_ATTR_RW(bluetooth_call_vol);
+
+/* Attribute group setup based on capabilities */
+static struct attribute *steelseries_attrs[] = {
+	&dev_attr_sidetone_level.attr,
+	&dev_attr_inactive_time.attr,
+	&dev_attr_chatmix_level.attr,
+	&dev_attr_mic_mute_led_brightness.attr,
+	&dev_attr_mic_volume.attr,
+	&dev_attr_volume_limiter.attr,
+	&dev_attr_bluetooth_on_power.attr,
+	&dev_attr_bluetooth_call_vol.attr,
+	NULL
+};
+
+static umode_t steelseries_attr_is_visible(struct kobject *kobj,
+					   struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hid_device *hdev = to_hid_device(dev);
 	struct steelseries_device *sd = hid_get_drvdata(hdev);
+	unsigned long caps = sd->info->capabilities;
+
+	if (attr == &dev_attr_sidetone_level.attr)
+		return (caps & SS_CAP_SIDETONE) ? attr->mode : 0;
+	if (attr == &dev_attr_inactive_time.attr)
+		return (caps & SS_CAP_INACTIVE_TIME) ? attr->mode : 0;
+	if (attr == &dev_attr_chatmix_level.attr)
+		return (caps & SS_CAP_CHATMIX) ? attr->mode : 0;
+	if (attr == &dev_attr_mic_mute_led_brightness.attr)
+		return (caps & SS_CAP_MIC_MUTE_LED) ? attr->mode : 0;
+	if (attr == &dev_attr_mic_volume.attr)
+		return (caps & SS_CAP_MIC_VOLUME) ? attr->mode : 0;
+	if (attr == &dev_attr_volume_limiter.attr)
+		return (caps & SS_CAP_VOLUME_LIMITER) ? attr->mode : 0;
+	if (attr == &dev_attr_bluetooth_on_power.attr)
+		return (caps & SS_CAP_BT_POWER_ON) ? attr->mode : 0;
+	if (attr == &dev_attr_bluetooth_call_vol.attr)
+		return (caps & SS_CAP_BT_CALL_VOL) ? attr->mode : 0;
+
+	return 0;
+}
+
+static const struct attribute_group steelseries_attr_group = {
+	.attrs = steelseries_attrs,
+	.is_visible = steelseries_attr_is_visible,
+};
+
+static int steelseries_arctis_1_request_battery(struct hid_device *hdev)
+{
+	const u8 data[] = { 0x06, 0x12 };
+
+	return steelseries_send_feature_report(hdev, data, sizeof(data));
+}
+
+static int steelseries_arctis_7_plus_request_battery(struct hid_device *hdev)
+{
+	const u8 data[] = { 0x00, 0xb0 };
+
+	return steelseries_send_output_report(hdev, data, sizeof(data));
+}
+
+static int steelseries_arctis_9_request_battery(struct hid_device *hdev)
+{
+	const u8 data[] = { 0x00, 0x20 };
+
+	return steelseries_send_feature_report(hdev, data, sizeof(data));
+}
+
+static int steelseries_arctis_nova_request_battery(struct hid_device *hdev)
+{
+	const u8 data[] = { 0x00, 0xb0 };
+
+	return steelseries_send_output_report(hdev, data, sizeof(data));
+}
+
+static int steelseries_arctis_nova_3p_request_battery(struct hid_device *hdev)
+{
+	const u8 data[] = { 0xb0 };
+
+	return steelseries_send_output_report(hdev, data, sizeof(data));
+}
+
+static int
+steelseries_arctis_pro_wireless_request_battery(struct hid_device *hdev)
+{
+	/* Request battery - response will arrive asynchronously via raw_event */
+	const u8 data[] = { 0x40, 0xAA };
+
+	return steelseries_send_output_report(hdev, data, sizeof(data));
+}
+
+static int steelseries_raw_event(struct hid_device *hdev,
+				 struct hid_report *report, u8 *data, int size)
+{
+	struct steelseries_device *sd = hid_get_drvdata(hdev);
+	u16 product = hdev->product;
 	int capacity = sd->battery_capacity;
 	bool connected = sd->headset_connected;
 	bool charging = sd->battery_charging;
-	unsigned long flags;
+	int chatmix = sd->chatmix_level;
+	unsigned long flags = 0;
 
-	/* Not a headset */
-	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1)
+	/* Skip SRW-S1 */
+	if (product == USB_DEVICE_ID_STEELSERIES_SRWS1)
 		return 0;
 
-	if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1) {
-		hid_dbg(sd->hdev,
-			"Parsing raw event for Arctis 1 headset (%*ph)\n", size, read_buf);
-		if (size < ARCTIS_1_BATTERY_RESPONSE_LEN ||
-		    memcmp(read_buf, arctis_1_battery_request, sizeof(arctis_1_battery_request))) {
-			if (!delayed_work_pending(&sd->battery_work))
-				goto request_battery;
-			return 0;
+	/* Arctis 1 family (Arctis 1, 1X, 7P, 7X) */
+	if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1 ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P ||
+	    product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X) {
+		if (size < 8)
+			goto schedule_work;
+
+		if (data[2] == 0x01) {
+			connected = false;
+			capacity = 100;
+		} else {
+			connected = true;
+			capacity = data[3];
+			if (capacity > 100)
+				capacity = 100;
 		}
-		if (read_buf[2] == 0x01) {
+	}
+
+	/* Arctis 7 (original and 2019) */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7 ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2) {
+		/* Battery response is 8 bytes for Arctis 7 */
+		if (size < 8)
+			goto schedule_work;
+
+		connected = true;
+		charging = false;
+
+		/* Battery level is in data[2] */
+		capacity = data[2];
+		if (capacity > 100)
+			capacity = 100;
+	}
+
+	/* Arctis 7+ family */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY) {
+		if (size < 6)
+			goto schedule_work;
+
+		/* data[1] == 0x01 means HEADSET_OFFLINE */
+		if (data[1] == 0x01) {
 			connected = false;
 			capacity = 100;
 		} else {
 			connected = true;
-			capacity = read_buf[3];
+			/* data[3] == 0x01 means charging */
+			charging = (data[3] == 0x01);
+			/* data[2] contains battery level (0x00-0x04 range) */
+			capacity = steelseries_map_battery(data[2], 0x00, 0x04);
+
+			/* ChatMix available */
+			if (size >= 6 &&
+			    (sd->info->capabilities & SS_CAP_CHATMIX)) {
+				/* data[4] is game (0-100), data[5] is chat (0-100) */
+				int game = (data[4] * 64) / 100;
+				int chat = (data[5] * -64) / 100;
+
+				chatmix = 64 - (chat + game);
+			}
 		}
 	}
 
-	if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9) {
-		hid_dbg(sd->hdev,
-			"Parsing raw event for Arctis 9 headset (%*ph)\n", size, read_buf);
-		if (size < ARCTIS_9_BATTERY_RESPONSE_LEN) {
-			if (!delayed_work_pending(&sd->battery_work))
-				goto request_battery;
-			return 0;
+	/* Arctis 9 */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9) {
+		if (size < 12)
+			goto schedule_work;
+
+		connected = true;
+
+		charging = (data[4] == 0x01);
+
+		capacity = steelseries_map_battery(data[3], 0x64, 0x9A);
+
+		/* ChatMix: data[9] is game (0-19), data[10] is chat (0-19) */
+		if (size >= 11 && (sd->info->capabilities & SS_CAP_CHATMIX)) {
+			int game = (data[9] * 64) / 19;
+			int chat = (data[10] * -64) / 19;
+
+			chatmix = 64 - (chat + game);
 		}
+	}
 
-		if (read_buf[0] == 0xaa && read_buf[1] == 0x01) {
+	/* Arctis Pro Wireless */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO) {
+		if (size >= 2 && (data[0] == 0x02 || data[0] == 0x04)) {
+			/* This is a connection status response */
+			/* HEADSET_OFFLINE */
+			if (data[0] == 0x02) {
+				connected = false;
+				capacity = 100;
+				charging = false;
+			}
+			/* HEADSET_ONLINE (0x04) */
+			else {
+				connected = true;
+				charging = false;
+			}
+		} else if (size >= 1 && sd->headset_connected) {
+			/* This is a battery level response (only valid if headset connected) */
+			/* Battery range is 0x00-0x04 */
+			capacity = steelseries_map_battery(data[0], 0x00, 0x04);
+		}
+	}
+
+	/* Arctis Nova 3 */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) {
+		/* No battery monitoring for wired headset */
+		goto schedule_work;
+	}
+
+	/* Arctis Nova 3P/3X Wireless */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X) {
+		if (size < 4)
+			goto schedule_work;
+
+		/* data[1] == 0x02 means HEADSET_OFFLINE */
+		if (data[1] == 0x02) {
+			connected = false;
+			capacity = 100;
+		} else {
 			connected = true;
-			charging = read_buf[4] == 0x01;
+			charging = false;
+			/* data[3] contains battery level (0x00-0x64 range, 0-100) */
+			capacity = steelseries_map_battery(data[3], 0x00, 0x64);
+		}
+	}
+
+	/* Arctis Nova 5/5X */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5 ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) {
+		if (size < 16)
+			goto schedule_work;
+
+		/* data[1] == 0x02 means HEADSET_OFFLINE */
+		if (data[1] == 0x02) {
+			connected = false;
+			capacity = 100;
+		} else {
+			connected = true;
+			/* data[4] == 0x01 means charging */
+			charging = (data[4] == 0x01);
+			/* data[3] contains battery level (0-100) */
+			capacity = data[3];
+			if (capacity > 100)
+				capacity = 100;
+
+			/* ChatMix available */
+			if (size >= 7 &&
+			    (sd->info->capabilities & SS_CAP_CHATMIX)) {
+				/* data[5] is game (0-100), data[6] is chat (0-100) */
+				int game = (data[5] * 64) / 100;
+				int chat = (data[6] * -64) / 100;
+
+				chatmix = 64 - (chat + game);
+			}
+		}
+	}
 
-			/*
-			 * Found no official documentation about min and max.
-			 * Values defined by testing.
-			 */
-			capacity = steelseries_headset_map_capacity(read_buf[3], 0x68, 0x9d);
+	/* Arctis Nova 7 family */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7 ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2 ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2 ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2) {
+		if (size < 8)
+			goto schedule_work;
+
+		/* data[3] == 0x00 means HEADSET_OFFLINE */
+		if (data[3] == 0x00) {
+			connected = false;
+			capacity = 100;
 		} else {
-			/*
-			 * Device is off and sends the last known status read_buf[1] == 0x03 or
-			 * there is no known status of the device read_buf[0] == 0x55
-			 */
+			connected = true;
+			/* data[3] == 0x01 means charging */
+			charging = (data[3] == 0x01);
+			/* data[2] contains battery level (0x00-0x04 range) */
+			capacity = steelseries_map_battery(data[2], 0x00, 0x04);
+
+			/* ChatMix available */
+			if (size >= 6 &&
+			    (sd->info->capabilities & SS_CAP_CHATMIX)) {
+				/* data[4] is game (0-100), data[5] is chat (0-100) */
+				int game = (data[4] * 64) / 100;
+				int chat = (data[5] * -64) / 100;
+
+				chatmix = 64 - (chat + game);
+			}
+		}
+	}
+
+	/* Arctis Nova Pro Wireless */
+	else if (product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO ||
+		 product == USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X) {
+		if (size < 16)
+			goto schedule_work;
+
+		/* data[15] contains headset status */
+		if (data[15] == 0x01) { /* HEADSET_OFFLINE */
 			connected = false;
+			capacity = 100;
+		} else if (data[15] == 0x02) { /* HEADSET_CABLE_CHARGING */
+			connected = true;
+			charging = true;
+			/* data[6] contains battery level (0x00-0x08 range) */
+			capacity = steelseries_map_battery(data[6], 0x00, 0x08);
+		} else if (data[15] == 0x08) { /* HEADSET_ONLINE */
+			connected = true;
 			charging = false;
+			/* data[6] contains battery level (0x00-0x08 range) */
+			capacity = steelseries_map_battery(data[6], 0x00, 0x08);
+		} else {
+			/* Unknown status */
+			goto schedule_work;
 		}
 	}
 
+	/* Update state if changed */
+	spin_lock_irqsave(&sd->lock, flags);
+
 	if (connected != sd->headset_connected) {
-		hid_dbg(sd->hdev,
+		hid_dbg(hdev,
 			"Connected status changed from %sconnected to %sconnected\n",
 			sd->headset_connected ? "" : "not ",
 			connected ? "" : "not ");
 		sd->headset_connected = connected;
+		spin_unlock_irqrestore(&sd->lock, flags);
 		steelseries_headset_set_wireless_status(hdev, connected);
+		spin_lock_irqsave(&sd->lock, flags);
 	}
 
 	if (capacity != sd->battery_capacity) {
-		hid_dbg(sd->hdev,
-			"Battery capacity changed from %d%% to %d%%\n",
+		hid_dbg(hdev, "Battery capacity changed from %d%% to %d%%\n",
 			sd->battery_capacity, capacity);
 		sd->battery_capacity = capacity;
+		spin_unlock_irqrestore(&sd->lock, flags);
 		power_supply_changed(sd->battery);
+		spin_lock_irqsave(&sd->lock, flags);
 	}
 
 	if (charging != sd->battery_charging) {
-		hid_dbg(sd->hdev,
+		hid_dbg(hdev,
 			"Battery charging status changed from %scharging to %scharging\n",
 			sd->battery_charging ? "" : "not ",
 			charging ? "" : "not ");
 		sd->battery_charging = charging;
+		spin_unlock_irqrestore(&sd->lock, flags);
 		power_supply_changed(sd->battery);
+		spin_lock_irqsave(&sd->lock, flags);
 	}
 
-request_battery:
-	spin_lock_irqsave(&sd->lock, flags);
+	if (chatmix != sd->chatmix_level)
+		sd->chatmix_level = chatmix;
+
+schedule_work:
 	if (!sd->removed)
-		schedule_delayed_work(&sd->battery_work,
-				msecs_to_jiffies(STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS));
+		schedule_delayed_work(
+			&sd->battery_work,
+			msecs_to_jiffies(
+				STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS));
 	spin_unlock_irqrestore(&sd->lock, flags);
 
 	return 0;
 }
 
-static const struct hid_device_id steelseries_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_SRWS1),
-	  .driver_data = STEELSERIES_SRWS1 },
+static bool steelseries_is_vendor_usage_page(struct hid_device *hdev,
+					     u8 usage_page)
+{
+	return hdev->rdesc[0] == 0x06 && hdev->rdesc[1] == usage_page &&
+	       hdev->rdesc[2] == 0xff;
+}
+
+static int steelseries_probe(struct hid_device *hdev,
+			     const struct hid_device_id *id)
+{
+	struct steelseries_device_info *info =
+		(struct steelseries_device_info *)id->driver_data;
+	struct steelseries_device *sd;
+	struct usb_interface *intf;
+	u8 interface_num;
+	int ret;
+
+	/* Legacy SRW-S1 handling */
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
+#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
+	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
+		return steelseries_srws1_probe(hdev, id);
+#else
+		return -ENODEV;
+#endif
+	}
+
+	/* Get interface number for binding check */
+	if (hid_is_usb(hdev)) {
+		intf = to_usb_interface(hdev->dev.parent);
+		interface_num = intf->cur_altsetting->desc.bInterfaceNumber;
+	} else {
+		/* Non-USB devices not supported for modern Arctis */
+		return -ENODEV;
+	}
+
+	/* Interface binding logic */
+	if (info->interface_binding_mode == 0) {
+		/* Mode 0: First enumerated (interface 0) */
+		if (interface_num != 0)
+			return -ENODEV;
+	} else {
+		/* Mode 1: Check bitmask */
+		if (!(info->valid_interfaces & BIT(interface_num)))
+			return -ENODEV;
+	}
+
+	sd = devm_kzalloc(&hdev->dev, sizeof(*sd), GFP_KERNEL);
+	if (!sd)
+		return -ENOMEM;
+
+	sd->hdev = hdev;
+	sd->info = info;
+	hid_set_drvdata(hdev, sd);
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	/* Arctis 9 requires vendor usage page check */
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9 &&
+	    !steelseries_is_vendor_usage_page(hdev, 0xc0))
+		return -ENODEV;
+
+	spin_lock_init(&sd->lock);
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_open(hdev);
+	if (ret)
+		goto err_stop;
+
+	/* Register battery if supported */
+	if (info->capabilities & SS_CAP_BATTERY) {
+		ret = steelseries_battery_register(sd);
+		if (ret < 0)
+			hid_warn(hdev, "Failed to register battery: %d\n", ret);
+	}
+
+	/* Create sysfs attributes */
+	ret = sysfs_create_group(&hdev->dev.kobj, &steelseries_attr_group);
+	if (ret)
+		hid_warn(hdev, "Failed to create sysfs attributes: %d\n", ret);
+
+	hid_info(hdev, "SteelSeries %s initialized\n", info->name);
 
-	{ /* SteelSeries Arctis 1 Wireless for XBox */
-	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_1),
-	  .driver_data = STEELSERIES_ARCTIS_1 },
+	return 0;
 
-	{ /* SteelSeries Arctis 9 Wireless for XBox */
-	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_9),
-	  .driver_data = STEELSERIES_ARCTIS_9 },
+err_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
 
-	{ }
+static void steelseries_remove(struct hid_device *hdev)
+{
+	struct steelseries_device *sd;
+	unsigned long flags;
+
+	/* Legacy SRW-S1 */
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
+#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
+	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
+		hid_hw_stop(hdev);
+#endif
+		return;
+	}
+
+	sd = hid_get_drvdata(hdev);
+
+	sysfs_remove_group(&hdev->dev.kobj, &steelseries_attr_group);
+
+	spin_lock_irqsave(&sd->lock, flags);
+	sd->removed = true;
+	spin_unlock_irqrestore(&sd->lock, flags);
+
+	cancel_delayed_work_sync(&sd->battery_work);
+
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id steelseries_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_SRWS1),
+	  .driver_data = STEELSERIES_SRWS1 },
+
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_1),
+	  .driver_data = (unsigned long)&arctis_1_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X),
+	  .driver_data = (unsigned long)&arctis_1_x_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7),
+	  .driver_data = (unsigned long)&arctis_7_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P),
+	  .driver_data = (unsigned long)&arctis_7_p_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X),
+	  .driver_data = (unsigned long)&arctis_7_x_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2),
+	  .driver_data = (unsigned long)&arctis_7_gen2_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS),
+	  .driver_data = (unsigned long)&arctis_7_plus_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P),
+	  .driver_data = (unsigned long)&arctis_7_plus_p_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X),
+	  .driver_data = (unsigned long)&arctis_7_plus_x_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY),
+	  .driver_data = (unsigned long)&arctis_7_plus_destiny_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_9),
+	  .driver_data = (unsigned long)&arctis_9_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO),
+	  .driver_data = (unsigned long)&arctis_pro_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3),
+	  .driver_data = (unsigned long)&arctis_nova_3_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P),
+	  .driver_data = (unsigned long)&arctis_nova_3_p_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X),
+	  .driver_data = (unsigned long)&arctis_nova_3_x_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5),
+	  .driver_data = (unsigned long)&arctis_nova_5_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X),
+	  .driver_data = (unsigned long)&arctis_nova_5_x_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7),
+	  .driver_data = (unsigned long)&arctis_nova_7_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X),
+	  .driver_data = (unsigned long)&arctis_nova_7_x_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P),
+	  .driver_data = (unsigned long)&arctis_nova_7_p_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2),
+	  .driver_data = (unsigned long)&arctis_nova_7_x_rev2_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO),
+	  .driver_data = (unsigned long)&arctis_nova_7_diablo_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW),
+	  .driver_data = (unsigned long)&arctis_nova_7_wow_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2),
+	  .driver_data = (unsigned long)&arctis_nova_7_gen2_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2),
+	  .driver_data = (unsigned long)&arctis_nova_7_x_gen2_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO),
+	  .driver_data = (unsigned long)&arctis_nova_pro_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
+			 USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X),
+	  .driver_data = (unsigned long)&arctis_nova_pro_x_info },
+	{}
 };
 MODULE_DEVICE_TABLE(hid, steelseries_devices);
 
@@ -742,12 +2160,13 @@ static struct hid_driver steelseries_driver = {
 	.probe = steelseries_probe,
 	.remove = steelseries_remove,
 	.report_fixup = steelseries_srws1_report_fixup,
-	.raw_event = steelseries_headset_raw_event,
+	.raw_event = steelseries_raw_event,
 };
-
 module_hid_driver(steelseries_driver);
-MODULE_DESCRIPTION("HID driver for Steelseries devices");
+
+MODULE_DESCRIPTION("HID driver for SteelSeries devices");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
 MODULE_AUTHOR("Simon Wood <simon@mungewell.org>");
 MODULE_AUTHOR("Christian Mayer <git@mayer-bgk.de>");
+MODULE_AUTHOR("Sriman Achanta <srimanachanta@gmail.com>");
-- 
2.52.0



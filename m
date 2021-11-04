Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D9844540D
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhKDNkD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:40:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:50270 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231504AbhKDNkC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:40:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755216"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755216"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:24 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542045"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:22 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 5/8] HID: core: Add support for USI style events
Date:   Thu,  4 Nov 2021 15:36:58 +0200
Message-Id: <20211104133701.1733551-6-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for Universal Stylus Interface (USI) style events to the HID
core and input layers. A new driver will be added in a separate patch
which is going to use this glue logic.

Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 drivers/hid/hid-core.c                 |  3 +++
 drivers/hid/hid-input.c                | 18 ++++++++++++++++++
 include/linux/hid.h                    |  5 +++++
 include/linux/mod_devicetable.h        |  2 +-
 include/uapi/linux/input-event-codes.h | 22 ++++++++++++++--------
 5 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index dbed2524fd47..194c4bfed1be 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -780,6 +780,9 @@ static void hid_scan_input_usage(struct hid_parser *parser, u32 usage)
 
 	if (usage == HID_DG_CONTACTID)
 		hid->group = HID_GROUP_MULTITOUCH;
+
+	if (usage == HID_DG_TRANSDUCER_INDEX)
+		hid->group = HID_GROUP_USI;
 }
 
 static void hid_scan_feature_usage(struct hid_parser *parser, u32 usage)
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 0506612800db..426700cd8574 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -829,6 +829,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			}
 			break;
 
+		case 0x38: /* Transducer Index */
+			map_msc(MSC_PEN_ID);
+			break;
+
 		case 0x3b: /* Battery Strength */
 			hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
 			usage->type = EV_PWR;
@@ -875,6 +879,20 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			map_msc(MSC_SERIAL);
 			break;
 
+		case 0x5c: map_msc(MSC_PEN_COLOR);		break;
+		case 0x5e: map_msc(MSC_PEN_LINE_WIDTH);		break;
+
+		case 0x70:
+		case 0x71:
+		case 0x72:
+		case 0x73:
+		case 0x74:
+		case 0x75:
+		case 0x76:
+		case 0x77:
+			map_msc(MSC_PEN_LINE_STYLE);
+			break;
+
 		default:  goto unknown;
 		}
 		break;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 555b5de654b1..000fd3cf06ce 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -241,6 +241,7 @@ struct hid_item {
 #define HID_DG_TOUCH		0x000d0033
 #define HID_DG_UNTOUCH		0x000d0034
 #define HID_DG_TAP		0x000d0035
+#define HID_DG_TRANSDUCER_INDEX	0x000d0038
 #define HID_DG_TABLETFUNCTIONKEY	0x000d0039
 #define HID_DG_PROGRAMCHANGEKEY	0x000d003a
 #define HID_DG_BATTERYSTRENGTH	0x000d003b
@@ -253,6 +254,9 @@ struct hid_item {
 #define HID_DG_BARRELSWITCH	0x000d0044
 #define HID_DG_ERASER		0x000d0045
 #define HID_DG_TABLETPICK	0x000d0046
+#define HID_DG_PEN_COLOR	0x000d005c
+#define HID_DG_PEN_LINE_WIDTH	0x000d005e
+#define HID_DG_PEN_LINE_STYLE	0x000d0070
 
 #define HID_CP_CONSUMERCONTROL	0x000c0001
 #define HID_CP_NUMERICKEYPAD	0x000c0002
@@ -369,6 +373,7 @@ struct hid_item {
 #define HID_GROUP_MULTITOUCH			0x0002
 #define HID_GROUP_SENSOR_HUB			0x0003
 #define HID_GROUP_MULTITOUCH_WIN_8		0x0004
+#define HID_GROUP_USI				0x0005
 
 /*
  * Vendor specific HID device groups
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index ae2e75d15b21..4ff40be7676b 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -322,7 +322,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_KEY_MAX		0x2ff
 #define INPUT_DEVICE_ID_REL_MAX		0x0f
 #define INPUT_DEVICE_ID_ABS_MAX		0x3f
-#define INPUT_DEVICE_ID_MSC_MAX		0x07
+#define INPUT_DEVICE_ID_MSC_MAX		0x09
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 225ec87d4f22..98295f71941a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -901,14 +901,20 @@
  * Misc events
  */
 
-#define MSC_SERIAL		0x00
-#define MSC_PULSELED		0x01
-#define MSC_GESTURE		0x02
-#define MSC_RAW			0x03
-#define MSC_SCAN		0x04
-#define MSC_TIMESTAMP		0x05
-#define MSC_MAX			0x07
-#define MSC_CNT			(MSC_MAX+1)
+#define MSC_SERIAL			0x00
+#define MSC_PULSELED			0x01
+#define MSC_GESTURE			0x02
+#define MSC_RAW				0x03
+#define MSC_SCAN			0x04
+#define MSC_TIMESTAMP			0x05
+/* USI Pen events */
+#define MSC_PEN_ID			0x06
+#define MSC_PEN_COLOR			0x07
+#define MSC_PEN_LINE_WIDTH		0x08
+#define MSC_PEN_LINE_STYLE		0x09
+/* TODO: Add USI diagnostic & battery events too */
+#define MSC_MAX				0x09
+#define MSC_CNT				(MSC_MAX + 1)
 
 /*
  * LEDs
-- 
2.25.1


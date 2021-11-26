Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471D745EEB6
	for <lists+linux-input@lfdr.de>; Fri, 26 Nov 2021 14:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbhKZNLO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Nov 2021 08:11:14 -0500
Received: from mga18.intel.com ([134.134.136.126]:38769 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231215AbhKZNJO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Nov 2021 08:09:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222532972"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="222532972"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:02:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="498395589"
Received: from asaechnx-mobl2.ccr.corp.intel.com (HELO tkristo-desk.intel.com) ([10.249.34.152])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:02:01 -0800
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        jikos@kernel.org, mika.westerberg@linux.intel.com,
        tero.kristo@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        peter.hutterer@who-t.net
Subject: [RFCv2 3/8] HID: core: Add support for USI style events
Date:   Fri, 26 Nov 2021 15:01:36 +0200
Message-Id: <20211126130141.1811848-4-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126130141.1811848-1-tero.kristo@linux.intel.com>
References: <20211126130141.1811848-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for Universal Stylus Interface (USI) style events to the HID
core and input layers.

Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 drivers/hid/hid-input.c                | 18 ++++++++++++++++++
 include/linux/mod_devicetable.h        |  2 +-
 include/uapi/linux/hid.h               | 10 ++++++++++
 include/uapi/linux/input-event-codes.h | 22 ++++++++++++++--------
 4 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 73c2edda742e..b428ee9b4d9b 100644
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
@@ -876,6 +880,20 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
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
diff --git a/include/uapi/linux/hid.h b/include/uapi/linux/hid.h
index 861bfbbfc565..60ef9b615a1a 100644
--- a/include/uapi/linux/hid.h
+++ b/include/uapi/linux/hid.h
@@ -255,6 +255,7 @@
 #define HID_DG_TOUCH				0x000d0033
 #define HID_DG_UNTOUCH				0x000d0034
 #define HID_DG_TAP				0x000d0035
+#define HID_DG_TRANSDUCER_INDEX			0x000d0038
 #define HID_DG_TABLETFUNCTIONKEY		0x000d0039
 #define HID_DG_PROGRAMCHANGEKEY			0x000d003a
 #define HID_DG_BATTERYSTRENGTH			0x000d003b
@@ -267,6 +268,15 @@
 #define HID_DG_BARRELSWITCH			0x000d0044
 #define HID_DG_ERASER				0x000d0045
 #define HID_DG_TABLETPICK			0x000d0046
+#define HID_DG_PEN_COLOR			0x000d005c
+#define HID_DG_PEN_LINE_WIDTH			0x000d005e
+#define HID_DG_PEN_LINE_STYLE			0x000d0070
+#define HID_DG_PEN_LINE_STYLE_INK		0x000d0072
+#define HID_DG_PEN_LINE_STYLE_PENCIL		0x000d0073
+#define HID_DG_PEN_LINE_STYLE_HIGHLIGHTER	0x000d0074
+#define HID_DG_PEN_LINE_STYLE_CHISEL_MARKER	0x000d0075
+#define HID_DG_PEN_LINE_STYLE_BRUSH		0x000d0076
+#define HID_DG_PEN_LINE_STYLE_NO_PREFERENCE	0x000d0077
 
 #define HID_CP_CONSUMERCONTROL			0x000c0001
 #define HID_CP_NUMERICKEYPAD			0x000c0002
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


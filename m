Return-Path: <linux-input+bounces-293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26E7FC6EA
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2B11C21260
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED0E42AA8;
	Tue, 28 Nov 2023 21:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP1D20Cm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7C44367;
	Tue, 28 Nov 2023 21:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0897C433CC;
	Tue, 28 Nov 2023 21:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205638;
	bh=r35zF6tK6CG/wd62AcYjyc+VrBh5X/40RNBbz8Wxvdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AP1D20CmhKvevgm87GwAJMiX3RNifW+H7y7bsdi+z0rBtSbjgymGkZXuy3MyjwuJh
	 VFT6y9lGIfw0xBDNDDti8JlkPxOI8P2XNUuhNPghmDpJ7rHfBxVFaWSBc3MIyZmjlu
	 KDvmQ7Y1hoz38CiGLL5xxFddPfCi6XlonQHglmjW+izo99OgNn/EeznCnsV/NhyzrO
	 svz3qaZpnQYoXa3xxW4P7vwEsk/2u+X9eESQZMeL9+PZi2JWbTcSSEPCxLecLnhM08
	 ogeYk1mfPQtOyA4faE2t8EIb+Sk3oERiVgKEOht3naoWyS2yr9F4iC8sLXlqZdJBau
	 0xB9tUOU4VCwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Brett Raye <braye@fastmail.com>,
	Jiri Kosina <jkosina@suse.cz>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 27/40] HID: glorious: fix Glorious Model I HID report
Date: Tue, 28 Nov 2023 16:05:33 -0500
Message-ID: <20231128210615.875085-27-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
Content-Transfer-Encoding: 8bit

From: Brett Raye <braye@fastmail.com>

[ Upstream commit a5e913c25b6b2b6ae02acef6d9400645ac03dfdf ]

The Glorious Model I mouse has a buggy HID report descriptor for its
keyboard endpoint (used for programmable buttons). For report ID 2, there
is a mismatch between Logical Minimum and Usage Minimum in the array that
reports keycodes.

The offending portion of the descriptor: (from hid-decode)

0x95, 0x05,                    //  Report Count (5)                   30
0x75, 0x08,                    //  Report Size (8)                    32
0x15, 0x00,                    //  Logical Minimum (0)                34
0x25, 0x65,                    //  Logical Maximum (101)              36
0x05, 0x07,                    //  Usage Page (Keyboard)              38
0x19, 0x01,                    //  Usage Minimum (1)                  40
0x29, 0x65,                    //  Usage Maximum (101)                42
0x81, 0x00,                    //  Input (Data,Arr,Abs)               44

This bug shifts all programmed keycodes up by 1. Importantly, this causes
"empty" array indexes of 0x00 to be interpreted as 0x01, ErrorRollOver.
The presence of ErrorRollOver causes the system to ignore all keypresses
from the endpoint and breaks the ability to use the programmable buttons.

Setting byte 41 to 0x00 fixes this, and causes keycodes to be interpreted
correctly.

Also, USB_VENDOR_ID_GLORIOUS is changed to USB_VENDOR_ID_SINOWEALTH,
and a new ID for Laview Technology is added. Glorious seems to be
white-labeling controller boards or mice from these vendors. There isn't a
single canonical vendor ID for Glorious products.

Signed-off-by: Brett Raye <braye@fastmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-glorious.c | 16 ++++++++++++++--
 drivers/hid/hid-ids.h      | 11 +++++++----
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
index 558eb08c19ef9..281b3a7187cec 100644
--- a/drivers/hid/hid-glorious.c
+++ b/drivers/hid/hid-glorious.c
@@ -21,6 +21,10 @@ MODULE_DESCRIPTION("HID driver for Glorious PC Gaming Race mice");
  * Glorious Model O and O- specify the const flag in the consumer input
  * report descriptor, which leads to inputs being ignored. Fix this
  * by patching the descriptor.
+ *
+ * Glorious Model I incorrectly specifes the Usage Minimum for its
+ * keyboard HID report, causing keycodes to be misinterpreted.
+ * Fix this by setting Usage Minimum to 0 in that report.
  */
 static __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
@@ -32,6 +36,10 @@ static __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		rdesc[85] = rdesc[113] = rdesc[141] = \
 			HID_MAIN_ITEM_VARIABLE | HID_MAIN_ITEM_RELATIVE;
 	}
+	if (*rsize == 156 && rdesc[41] == 1) {
+		hid_info(hdev, "patching Glorious Model I keyboard report descriptor\n");
+		rdesc[41] = 0;
+	}
 	return rdesc;
 }
 
@@ -44,6 +52,8 @@ static void glorious_update_name(struct hid_device *hdev)
 		model = "Model O"; break;
 	case USB_DEVICE_ID_GLORIOUS_MODEL_D:
 		model = "Model D"; break;
+	case USB_DEVICE_ID_GLORIOUS_MODEL_I:
+		model = "Model I"; break;
 	}
 
 	snprintf(hdev->name, sizeof(hdev->name), "%s %s", "Glorious", model);
@@ -66,10 +76,12 @@ static int glorious_probe(struct hid_device *hdev,
 }
 
 static const struct hid_device_id glorious_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 		USB_DEVICE_ID_GLORIOUS_MODEL_O) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 		USB_DEVICE_ID_GLORIOUS_MODEL_D) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LAVIEW,
+		USB_DEVICE_ID_GLORIOUS_MODEL_I) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, glorious_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e4d2dfd5d2536..9ed9ec03ad1bf 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -510,10 +510,6 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_010A 0x010a
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
-#define USB_VENDOR_ID_GLORIOUS  0x258a
-#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
-#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
-
 #define I2C_VENDOR_ID_GOODIX		0x27c6
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
 
@@ -744,6 +740,9 @@
 #define USB_VENDOR_ID_LABTEC		0x1020
 #define USB_DEVICE_ID_LABTEC_WIRELESS_KEYBOARD	0x0006
 
+#define USB_VENDOR_ID_LAVIEW		0x22D4
+#define USB_DEVICE_ID_GLORIOUS_MODEL_I	0x1503
+
 #define USB_VENDOR_ID_LCPOWER		0x1241
 #define USB_DEVICE_ID_LCPOWER_LC1000	0xf767
 
@@ -1159,6 +1158,10 @@
 #define USB_VENDOR_ID_SIGMATEL		0x066F
 #define USB_DEVICE_ID_SIGMATEL_STMP3780	0x3780
 
+#define USB_VENDOR_ID_SINOWEALTH  0x258a
+#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
+#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
+
 #define USB_VENDOR_ID_SIS_TOUCH		0x0457
 #define USB_DEVICE_ID_SIS9200_TOUCH	0x9200
 #define USB_DEVICE_ID_SIS817_TOUCH	0x0817
-- 
2.42.0



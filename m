Return-Path: <linux-input+bounces-16227-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4079C71BAC
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 02:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DD4E4E37E2
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 01:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CE216EB42;
	Thu, 20 Nov 2025 01:49:57 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A0C22AE45;
	Thu, 20 Nov 2025 01:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763603397; cv=none; b=h2mAuUSk/WMEY0qIOmHegLYp1mpLdsswQbz8CEpRyilD+MS2NjnmEM3Glra8m448n3QMq3e19F3XSQoUBRnq4IN8mOgSF1duWJe+kJKD4PMJE1LI0LRQU6y4N6qvxQSEotEq+oc83wco+UXyDllvu2J02NPAmR6gsUj4tguAhIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763603397; c=relaxed/simple;
	bh=GyU75L7AVN0JjnLKFIkBmG0WM9wcb7JS+erqO0Xbj74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbFEXSJ/N/On7ziB/2KZU8SkvRvv1JQj0KA/T//BM+4jY3iqKBcUsecwmyiuGSIS76Mx3cw21nRbXrfhYx1kpbQ3l0fRwCZQXLMp0/WfOtbp6IvKe+b5yOyCWuv7g1dS0HRVmXBZtkQgaB4X8r5jKaUKrx2ysT1eExvO+RVua8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from terrys-Precision-M4600.. (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 717B91CC2E26;
	Wed, 19 Nov 2025 17:49:48 -0800 (PST)
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Artem <temabiill@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] HID: Fix Report Descriptor for Evision Wireless Receiver 320f:226f
Date: Wed, 19 Nov 2025 17:49:27 -0800
Message-ID: <20251120014931.580340-1-linuxhid@cosmicgizmosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b627cfc9-0dda-4b59-ae5f-83f40cf6088b@cosmicgizmosystems.com>
References: <b627cfc9-0dda-4b59-ae5f-83f40cf6088b@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update help message for Evision driver

Add #define for Evision device ID 0x226f

Add report_fixup hook to Evision driver

The mouse portion of the device's Report Descriptor declares 5 buttons
but only declares 3 usages (Button 1 through Button 3).
As a result events for the 2 side buttons are not generated.

Detect and repair the Report Descriptor if necessary by changing the
Usage Maximum value from Button 3 to Button 5.

Reported-by: Artem <temabiill@gmail.com>
Closes: https://lore.kernel.org/all/CADYkRmrfhRf6VmQjc+su+mepyv=TsHc+aMcL6ryRZ5HTZ8pyFg@mail.gmail.com/
Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
---
 drivers/hid/Kconfig       |  1 +
 drivers/hid/hid-evision.c | 21 +++++++++++++++++++++
 drivers/hid/hid-ids.h     |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 04420a713be0..30c4f79535fe 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -383,6 +383,7 @@ config HID_EVISION
 	help
 	Support for some EVision keyboards. Note that this is needed only when
 	applying customization using userspace programs.
+	Support for some EVision devices requiring report descriptor fixups.
 
 config HID_EZKEY
 	tristate "Ezkey BTC 8193 keyboard"
diff --git a/drivers/hid/hid-evision.c b/drivers/hid/hid-evision.c
index bb5997078491..3e7f43ab80bb 100644
--- a/drivers/hid/hid-evision.c
+++ b/drivers/hid/hid-evision.c
@@ -18,6 +18,10 @@ static int evision_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		struct hid_field *field, struct hid_usage *usage,
 		unsigned long **bit, int *max)
 {
+	/* mapping only applies to USB_DEVICE_ID_EVISION_ICL01 */
+	if (hdev->product != USB_DEVICE_ID_EVISION_ICL01)
+		return 0;
+
 	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_CONSUMER)
 		return 0;
 
@@ -37,8 +41,24 @@ static int evision_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
+#define REP_DSC_SIZE 236
+#define USAGE_MAX_INDEX 59
+
+static const __u8 *evision_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+		unsigned int *rsize)
+{
+	if (hdev->product == USB_DEVICE_ID_EV_TELINK_RECEIVER &&
+	    *rsize == REP_DSC_SIZE && rdesc[USAGE_MAX_INDEX] == 0x29 &&
+	    rdesc[USAGE_MAX_INDEX + 1] == 3) {
+		hid_info(hdev, "fixing EVision:TeLink Receiver report descriptor\n");
+		rdesc[USAGE_MAX_INDEX + 1] = 5; // change usage max from 3 to 5
+	}
+	return rdesc;
+}
+
 static const struct hid_device_id evision_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_EVISION, USB_DEVICE_ID_EVISION_ICL01) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_EVISION, USB_DEVICE_ID_EV_TELINK_RECEIVER) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, evision_devices);
@@ -47,6 +67,7 @@ static struct hid_driver evision_driver = {
 	.name = "evision",
 	.id_table = evision_devices,
 	.input_mapping = evision_input_mapping,
+	.report_fixup = evision_report_fixup,
 };
 module_hid_driver(evision_driver);
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..c9e67b768bc7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -476,6 +476,7 @@
 #define USB_DEVICE_ID_EMS_TRIO_LINKER_PLUS_II 0x0118
 
 #define USB_VENDOR_ID_EVISION           0x320f
+#define USB_DEVICE_ID_EV_TELINK_RECEIVER 0x226f
 #define USB_DEVICE_ID_EVISION_ICL01     0x5041
 
 #define USB_VENDOR_ID_FFBEAST		0x045b

base-commit: 2953fb65481b262514ac13f24ffbc70eeace68c6
-- 
2.43.0



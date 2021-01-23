Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E96301777
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 19:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbhAWSEg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 13:04:36 -0500
Received: from mail.archlinux.org ([95.216.189.61]:34388 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbhAWSEd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 13:04:33 -0500
Received: from localhost.localdomain (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 6D90938F939;
        Sat, 23 Jan 2021 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1611425028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Q42KVgTFPR8rBZqsr1Y9WH/B7SfoCRG4aXTrCdBjvuY=;
        b=IppKFZH4yGpmHh03o30rEwnKRgHjYtBk+nWpHffD08KHbMG8yrimrJLH2ganN69jqEmwcW
        Z+dUMRKcYLC3iBDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1611425028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Q42KVgTFPR8rBZqsr1Y9WH/B7SfoCRG4aXTrCdBjvuY=;
        b=hV70y/yxdZyNLEVsUeXSsLImc7lGO3akNSwJn3hLNx93ufa6OKi7bVq4Df96E6Mr7n17DI
        FGu6BNjeqykes2hYVuAnQx/MEXMBGM+t4RzzhrSpkVY45fcbm6uZLHE/trYvkrFGC3dVj/
        0DnOrOuGUnIvTJf+GmfeESuZNqpGFhpPbyiTJrUSSsMIhLPQepEDVazwRXjorc0vQzZWA/
        mRnTgWUqO/UjaU5g3+uiKSRxM4glcJh3G3ofqjVdWF0oy0+1feTfPyBmyCCttg5e5Eh8N8
        0fae6aTHLw4glGbocRZqnyDKxMkZeQnCR9icuJ1X7gjTUt98MfbQyKl2rqAn4epzDowhG5
        nUaOUCiGe9icW3Rs+rUvMCoX26RFaniCvScFHsOoPFRY1avwhEHNhy8kU4wPo+e7bHqQAA
        2dpttwNCBYBKgQK74S4FHiv5tqYST/DC1JxwEmMH9SkJX1KwOxIPlIZJ4iW8+eGq95451b
        OCH4N17zjK+pX2KLFWjwblkwMmF83IAIPjfnpPRit2k7LQNxyJbSAaRwZHZwYAJFZ7NYHU
        HpvCgmO3sfhdM/Gixnj5VBndnRNg7qinavWUVM8YGO6lZMEt/l1lxegdQXi+4gXAxUv/Vd
        1R9Xd382VG+drJnPUue7aaGsPcV3TDxj8WvPa73cAildhQoFkq4Fs=
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
Subject: [PATCH 1/2] HID: logitech-dj: add support for the new lightspeed receiver iteration
Date:   Sat, 23 Jan 2021 18:03:33 +0000
Message-Id: <20210123180334.3062995-1-lains@archlinux.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Filipe Laíns <lains@riseup.net>

Tested with the G Pro X Superlight. libratbag sees the device, as
expected, and input events are passing trough.

https://github.com/libratbag/libratbag/pull/1122

The receiver has a quirk where the moused interface doesn't have a
report ID, I am not sure why, perhaps they forgot. All other interfaces
have report IDs so I am left scratching my head.
Since this driver doesn't have a quirk system, I simply implemented it
as a different receiver type, which is true, it just wouldn't be the
prefered approach :P

Signed-off-by: Filipe Laíns <lains@riseup.net>
---
 drivers/hid/hid-ids.h         |  1 +
 drivers/hid/hid-logitech-dj.c | 49 +++++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4c5f23640f9c..8eac3c93fa38 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -803,6 +803,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2	0xc547
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 1401ee2067ca..6596c81947a8 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -114,6 +114,7 @@ enum recvr_type {
 	recvr_type_dj,
 	recvr_type_hidpp,
 	recvr_type_gaming_hidpp,
+	recvr_type_gaming_hidpp_missing_mse_report_id,  /* lightspeed receiver missing the mouse report ID */
 	recvr_type_mouse_only,
 	recvr_type_27mhz,
 	recvr_type_bluetooth,
@@ -1360,6 +1361,7 @@ static int logi_dj_ll_parse(struct hid_device *hid)
 		dbg_hid("%s: sending a mouse descriptor, reports_supported: %llx\n",
 			__func__, djdev->reports_supported);
 		if (djdev->dj_receiver_dev->type == recvr_type_gaming_hidpp ||
+		    djdev->dj_receiver_dev->type == recvr_type_gaming_hidpp_missing_mse_report_id ||
 		    djdev->dj_receiver_dev->type == recvr_type_mouse_only)
 			rdcat(rdesc, &rsize, mse_high_res_descriptor,
 			      sizeof(mse_high_res_descriptor));
@@ -1605,19 +1607,35 @@ static int logi_dj_raw_event(struct hid_device *hdev,
 			data[0] = data[1];
 			data[1] = 0;
 		}
-		/*
-		 * Mouse-only receivers send unnumbered mouse data. The 27 MHz
-		 * receiver uses 6 byte packets, the nano receiver 8 bytes.
-		 */
-		if (djrcv_dev->unnumbered_application == HID_GD_MOUSE &&
-		    size <= 8) {
-			u8 mouse_report[9];
-
-			/* Prepend report id */
-			mouse_report[0] = REPORT_TYPE_MOUSE;
-			memcpy(mouse_report + 1, data, size);
-			logi_dj_recv_forward_input_report(hdev, mouse_report,
-							  size + 1);
+
+
+		if (djrcv_dev->unnumbered_application == HID_GD_MOUSE) {
+			/*
+			 * Mouse-only receivers send unnumbered mouse data. The 27 MHz
+			 * receiver uses 6 byte packets, the nano receiver 8 bytes.
+			 */
+			if (size <= 8) {
+				u8 mouse_report[9];
+
+				/* Prepend report id */
+				mouse_report[0] = REPORT_TYPE_MOUSE;
+				memcpy(mouse_report + 1, data, size);
+				logi_dj_recv_forward_input_report(hdev, mouse_report,
+								  size + 1);
+
+			/*
+			 * A variant of the ligtpseed receivers is missing the mouse
+			 * report ID.
+			 */
+			} else if (djrcv_dev->type == recvr_type_gaming_hidpp_missing_mse_report_id) {
+				u8 mouse_report[17];
+
+				/* Prepend report id */
+				mouse_report[0] = REPORT_TYPE_MOUSE;
+				memcpy(mouse_report + 1, data, size);
+				logi_dj_recv_forward_input_report(hdev, mouse_report,
+								  size + 1);
+			}
 		}
 
 		return false;
@@ -1688,6 +1706,7 @@ static int logi_dj_probe(struct hid_device *hdev,
 	case recvr_type_dj:		no_dj_interfaces = 3; break;
 	case recvr_type_hidpp:		no_dj_interfaces = 2; break;
 	case recvr_type_gaming_hidpp:	no_dj_interfaces = 3; break;
+	case recvr_type_gaming_hidpp_missing_mse_report_id: no_dj_interfaces = 3; break;
 	case recvr_type_mouse_only:	no_dj_interfaces = 2; break;
 	case recvr_type_27mhz:		no_dj_interfaces = 2; break;
 	case recvr_type_bluetooth:	no_dj_interfaces = 2; break;
@@ -1886,6 +1905,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
 	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech lightspeed receiver (0xc547) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2),
+	 .driver_data = recvr_type_gaming_hidpp_missing_mse_report_id},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
 	 .driver_data = recvr_type_27mhz},
-- 
2.30.0


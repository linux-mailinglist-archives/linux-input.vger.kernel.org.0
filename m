Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8ED30FEEB
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 21:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhBDU5z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 15:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38901 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229989AbhBDU5z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Feb 2021 15:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612472188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p0pSpQxwjxVkwG6UuO7vWyTfSyBVmQ+Fz9BBhdXmBEI=;
        b=Xz1Z2T813Du2mKgBbEgwBdmJ9OQ4U6cnYWl54ZZjawldrvrVnOXqrZPFGEpAAA6+ED5Q/p
        3qAOLmC6PARPftelsZhRSKhMrvAT+opAnPXu+pxyVPwOK7k0KkTLt9WRbjmBd1b3AUfZ23
        167W0RDQQNU6SwHVCQOR8PuBtC6Rtjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-bPrFfpUtMouGC5YHv4Ga8Q-1; Thu, 04 Feb 2021 15:56:25 -0500
X-MC-Unique: bPrFfpUtMouGC5YHv4Ga8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C88685EE69;
        Thu,  4 Feb 2021 20:56:24 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9D18E72F81;
        Thu,  4 Feb 2021 20:56:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 1/2] HID: logitech-dj: Use hid-ids.h defines for USB device-ids for all supported devices
Date:   Thu,  4 Feb 2021 21:56:16 +0100
Message-Id: <20210204205617.72527-2-hdegoede@redhat.com>
In-Reply-To: <20210204205617.72527-1-hdegoede@redhat.com>
References: <20210204205617.72527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The logitech-dj code already uses hid-ids.h defines for almost all devices
it supports. Lets be consistent: add and use hid-ids.h defines for the
G700, MX5000 and MX5500 receivers too.

Also add / update some comments to make the comment style in the
hid_device_id table consistent too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h         |  5 +++++
 drivers/hid/hid-logitech-dj.c | 40 ++++++++++++++++++++---------------
 2 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5ba0aa1d2335..119b9cf8b4b6 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -799,6 +799,7 @@
 #define USB_DEVICE_ID_LOGITECH_27MHZ_MOUSE_RECEIVER	0xc51b
 #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER	0xc52b
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER		0xc52f
+#define USB_DEVICE_ID_LOGITECH_G700_RECEIVER		0xc531
 #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2	0xc532
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
@@ -809,6 +810,10 @@
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
 #define USB_DEVICE_ID_DINOVO_EDGE	0xc714
 #define USB_DEVICE_ID_DINOVO_MINI	0xc71f
+#define USB_DEVICE_ID_MX5000_RECEIVER_MOUSE_DEV		0xc70a
+#define USB_DEVICE_ID_MX5000_RECEIVER_KBD_DEV		0xc70e
+#define USB_DEVICE_ID_MX5500_RECEIVER_KBD_DEV		0xc71b
+#define USB_DEVICE_ID_MX5500_RECEIVER_MOUSE_DEV		0xc71c
 #define USB_DEVICE_ID_LOGITECH_MOMO_WHEEL2	0xca03
 #define USB_DEVICE_ID_LOGITECH_VIBRATION_WHEEL	0xca04
 
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 45e7e0bdd382..a5d8eb1a13b1 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1851,23 +1851,27 @@ static void logi_dj_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id logi_dj_receivers[] = {
-	{HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+	{ /* Logitech unifying receiver (0xc52b) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER),
 	 .driver_data = recvr_type_dj},
-	{HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+	{ /* Logitech unifying receiver (0xc532) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2),
 	 .driver_data = recvr_type_dj},
-	{ /* Logitech Nano mouse only receiver */
+
+	{ /* Logitech Nano mouse only receiver (0xc52f) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 			 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER),
 	 .driver_data = recvr_type_mouse_only},
-	{ /* Logitech Nano (non DJ) receiver */
+	{ /* Logitech Nano (non DJ) receiver (0xc534) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 			 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2),
 	 .driver_data = recvr_type_hidpp},
+
 	{ /* Logitech G700(s) receiver (0xc531) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		0xc531),
+			 USB_DEVICE_ID_LOGITECH_G700_RECEIVER),
 	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech G602 receiver (0xc537) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
@@ -1877,17 +1881,18 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1),
 	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech powerplay receiver (0xc53a) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY),
+	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech lightspeed receiver (0xc53f) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
 	 .driver_data = recvr_type_gaming_hidpp},
+
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
 	 .driver_data = recvr_type_27mhz},
-	{ /* Logitech powerplay receiver (0xc53a) */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY),
-	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc517) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_S510_RECEIVER_2),
@@ -1896,21 +1901,22 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_27MHZ_MOUSE_RECEIVER),
 	 .driver_data = recvr_type_27mhz},
-	{ /* Logitech MX5000 HID++ / bluetooth receiver keyboard intf. */
+
+	{ /* Logitech MX5000 HID++ / bluetooth receiver keyboard intf. (0xc70e) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		0xc70e),
+		USB_DEVICE_ID_MX5000_RECEIVER_KBD_DEV),
 	 .driver_data = recvr_type_bluetooth},
-	{ /* Logitech MX5000 HID++ / bluetooth receiver mouse intf. */
+	{ /* Logitech MX5000 HID++ / bluetooth receiver mouse intf. (0xc70a) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		0xc70a),
+		USB_DEVICE_ID_MX5000_RECEIVER_MOUSE_DEV),
 	 .driver_data = recvr_type_bluetooth},
-	{ /* Logitech MX5500 HID++ / bluetooth receiver keyboard intf. */
+	{ /* Logitech MX5500 HID++ / bluetooth receiver keyboard intf. (0xc71b) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		0xc71b),
+		USB_DEVICE_ID_MX5500_RECEIVER_KBD_DEV),
 	 .driver_data = recvr_type_bluetooth},
-	{ /* Logitech MX5500 HID++ / bluetooth receiver mouse intf. */
+	{ /* Logitech MX5500 HID++ / bluetooth receiver mouse intf. (0xc71c) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		0xc71c),
+		USB_DEVICE_ID_MX5500_RECEIVER_MOUSE_DEV),
 	 .driver_data = recvr_type_bluetooth},
 	{}
 };
-- 
2.29.2


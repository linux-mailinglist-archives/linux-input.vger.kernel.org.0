Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934AF2B30FF
	for <lists+linux-input@lfdr.de>; Sat, 14 Nov 2020 22:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgKNVVN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Nov 2020 16:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30027 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbgKNVVN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Nov 2020 16:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605388871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1UjmfD6JPgUJZwodPQIycmWp3StHTKtBtsHhzBBN1bE=;
        b=YhcJjR/helfgLPYWyhmoKmxmtgQaxdiYLKpuppBGNM+petNPXG7IU+dCpCPMY+RN2/kpdB
        0pcHkvRmVGVcXC5m05sMZo6dDt7AfnIWGcPnPb8In7+Z3s7gyJpzenDvmaHVzqaANOWU3L
        D+EBXO161X3SPQtRtstWcZBGWG/vrlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-LGT2KWHNNI-7q77G_hbWvA-1; Sat, 14 Nov 2020 16:21:07 -0500
X-MC-Unique: LGT2KWHNNI-7q77G_hbWvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B96FB57088;
        Sat, 14 Nov 2020 21:21:06 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AAEEA1992D;
        Sat, 14 Nov 2020 21:21:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [RFC 2/3] HID: logitech-dj: Use hid-ids.h defines for USB device-ids for all supported devices
Date:   Sat, 14 Nov 2020 22:20:57 +0100
Message-Id: <20201114212058.19590-3-hdegoede@redhat.com>
In-Reply-To: <20201114212058.19590-1-hdegoede@redhat.com>
References: <20201114212058.19590-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index c810c7a28bdd..108081ab5ae3 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -788,6 +788,7 @@
 #define USB_DEVICE_ID_LOGITECH_27MHZ_MOUSE_RECEIVER	0xc51b
 #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER	0xc52b
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER		0xc52f
+#define USB_DEVICE_ID_LOGITECH_G700_RECEIVER		0xc531
 #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2	0xc532
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
@@ -798,6 +799,10 @@
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
index 4976ed827b3e..eaaedbb84a8d 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1857,39 +1857,44 @@ static void logi_dj_remove(struct hid_device *hdev)
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
 	{ /* Logitech lightspeed receiver (0xc539) */
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
@@ -1898,21 +1903,22 @@ static const struct hid_device_id logi_dj_receivers[] = {
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
2.28.0


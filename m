Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66843823EB
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 08:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhEQGFA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 02:05:00 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:55276 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbhEQGFA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 02:05:00 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id 8B79DF3F9D;
        Mon, 17 May 2021 14:03:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P18566T140528154826496S1621231401053565_;
        Mon, 17 May 2021 14:03:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <240da64eecbce62dcea6f5674607e489>
X-RL-SENDER: maqianga@uniontech.com
X-SENDER: maqianga@uniontech.com
X-LOGIN-NAME: maqianga@uniontech.com
X-FST-TO: jikos@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Qiang Ma <maqianga@uniontech.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-usb@vger.kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] HID: usbhid: enable remote wakeup for mouse
Date:   Mon, 17 May 2021 14:01:45 +0800
Message-Id: <20210517060145.32359-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch enables remote wakeup by default for USB mouse
devices.  Mouse in general are supposed to be wakeup devices, but
the correct place to enable it depends on the device's bus; no single
approach will work for all mouse devices.  In particular, this
covers only USB mouse (and then only those supporting the boot
protocol).

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 drivers/hid/usbhid/hid-core.c | 12 +++++++-----
 drivers/hid/usbhid/usbmouse.c |  1 +
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 86257ce6d619..592aa57a97f5 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1186,11 +1186,13 @@ static int usbhid_start(struct hid_device *hid)
 	 * In addition, enable remote wakeup by default for all keyboard
 	 * devices supporting the boot protocol.
 	 */
-	if (interface->desc.bInterfaceSubClass == USB_INTERFACE_SUBCLASS_BOOT &&
-			interface->desc.bInterfaceProtocol ==
-				USB_INTERFACE_PROTOCOL_KEYBOARD) {
-		usbhid_set_leds(hid);
-		device_set_wakeup_enable(&dev->dev, 1);
+	if (interface->desc.bInterfaceSubClass == USB_INTERFACE_SUBCLASS_BOOT) {
+		if (interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_KEYBOARD ||
+			interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_MOUSE) {
+			if (interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_KEYBOARD)
+				usbhid_set_leds(hid);
+			device_set_wakeup_enable(&dev->dev, 1);
+		}
 	}
 
 	mutex_unlock(&usbhid->mutex);
diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
index 073127e65ac1..cf785369a5ed 100644
--- a/drivers/hid/usbhid/usbmouse.c
+++ b/drivers/hid/usbhid/usbmouse.c
@@ -188,6 +188,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
 		goto fail3;
 
 	usb_set_intfdata(intf, mouse);
+	device_set_wakeup_enable(&dev->dev, 1);
 	return 0;
 
 fail3:	
-- 
2.20.1




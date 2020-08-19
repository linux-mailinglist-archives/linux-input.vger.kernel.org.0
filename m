Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E81249C96
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 13:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbgHSLwH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Aug 2020 07:52:07 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:45724 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgHSLvQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Aug 2020 07:51:16 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 0C580C0EE6;
        Wed, 19 Aug 2020 19:51:05 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (250.19.126.124.broad.bjtelecom.net [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P25957T140259910207232S1597837866680276_;
        Wed, 19 Aug 2020 19:51:06 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7df13add65a42e5e027ee7f126acc4a5>
X-RL-SENDER: penghao@uniontech.com
X-SENDER: penghao@uniontech.com
X-LOGIN-NAME: penghao@uniontech.com
X-FST-TO: jikos@kernel.org
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 5
X-System-Flag: 0
From:   penghao <penghao@uniontech.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, penghao@uniontech.com
Subject: [PATCH] USB HID: Add disabled wakeup from s3 by touchpad on byd zhaoxin notebook
Date:   Wed, 19 Aug 2020 19:51:01 +0800
Message-Id: <20200819115101.22532-1-penghao@uniontech.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

BYD Notebook built-in touch pad, USB interface,so disabled,the touch pad
device idVendor 0x0c45 idProduct 0x7056

Signed-off-by: penghao <penghao@uniontech.com>
---
 drivers/hid/usbhid/hid-core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 492dd641a25d..630a3cad211f 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1193,7 +1193,13 @@ static int usbhid_start(struct hid_device *hid)
 			interface->desc.bInterfaceProtocol ==
 				USB_INTERFACE_PROTOCOL_KEYBOARD) {
 		usbhid_set_leds(hid);
-		device_set_wakeup_enable(&dev->dev, 1);
+		/*
+		 * USB HID: Add disabled touchpad wakeup on byd zhaoxin notebook
+		 */
+		if ((hid->vendor == 0x0c45) && (hid->product == 0x7056))
+			device_set_wakeup_enable(&dev->dev, 0);
+		else
+			device_set_wakeup_enable(&dev->dev, 1);
 	}
 
 	mutex_unlock(&usbhid->mutex);
-- 
2.11.0




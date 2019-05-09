Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6830218938
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2019 13:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfEILrJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 May 2019 07:47:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52434 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbfEILrJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 May 2019 07:47:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3B4E581F1B;
        Thu,  9 May 2019 11:47:09 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-113.ams2.redhat.com [10.36.116.113])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 19FD960603;
        Thu,  9 May 2019 11:47:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-dj: Add usb-id for the 27MHz MX3000 receiver
Date:   Thu,  9 May 2019 13:47:04 +0200
Message-Id: <20190509114704.10333-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 09 May 2019 11:47:09 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Testing has shown that, as expected, the MX3000 receiver is fully
compatible with the existing 27MHz receiver support in hid-logitech-dj.c.

After this the only, presumably also compatible, receiver id left in
hid-lg.c is the USB_DEVICE_ID_S510_RECEIVER / 0xc50c id. If we can get
someone to confirm that this receiver works with the dj 27Mhz support too,
then the handling of the LG_RDESC and LG_WIRELESS quirks can be removed
from hid-lg.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg.c          | 2 --
 drivers/hid/hid-logitech-dj.c | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index 36d725fdb199..3f6be4aebfaf 100644
--- a/drivers/hid/hid-lg.c
+++ b/drivers/hid/hid-lg.c
@@ -872,8 +872,6 @@ static void lg_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id lg_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
-		.driver_data = LG_RDESC | LG_WIRELESS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_S510_RECEIVER),
 		.driver_data = LG_RDESC | LG_WIRELESS },
 
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 9b5b7b3e279b..8b3bedef9e97 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1835,6 +1835,9 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_GAMING),
 	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
+	 .driver_data = recvr_type_27mhz},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc517) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_S510_RECEIVER_2),
-- 
2.21.0


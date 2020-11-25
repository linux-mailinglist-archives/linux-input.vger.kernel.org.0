Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DD72C4AD6
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 23:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgKYWhy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 17:37:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32593 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725836AbgKYWhy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 17:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606343873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Z6pjoLA2qKaGX0X/Y4nKBQsHZLgpDq5Rqfad/3Wrvm0=;
        b=NvWx5HEMbD8jP69BertR2dfvO+yqDPmSsdFSOZKvPN4S8qHM2YjP6WPgIzptDl5j9hLTde
        sBBdNfka1cWF7iXZdZH0Z/q3i+/0MSQLz+Kbr/jsbjGuCjWsp9A9Ue53AVa17LbI507i0A
        UR+oKkmWHNyExPmUyhA3X9SvdlREAtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-vFT6M2SVPi6JGzmOBcy2ag-1; Wed, 25 Nov 2020 17:37:51 -0500
X-MC-Unique: vFT6M2SVPi6JGzmOBcy2ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 242FF184214E;
        Wed, 25 Nov 2020 22:37:50 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-35.ams2.redhat.com [10.36.112.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 46DC15D9C6;
        Wed, 25 Nov 2020 22:37:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: ite: Add support for Acer S1002 keyboard-dock
Date:   Wed, 25 Nov 2020 23:37:45 +0100
Message-Id: <20201125223745.390464-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make the hid-ite driver handle the Acer S1002 keyboard-dock, this
leads to 2 improvements:

1. The non working wifi-toggle hotkey now works.
2. Toggling the touchpad on of with the hotkey will no show OSD
notifications in e.g. GNOME3. The actual toggling is handled inside
the keyboard, this adds support for notifying evdev listeners about this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h |  1 +
 drivers/hid/hid-ite.c | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e17f252ba60f..4ec1b51a1dcb 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1133,6 +1133,7 @@
 #define USB_DEVICE_ID_SYNAPTICS_DELL_K12A	0x2819
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012	0x2968
 #define USB_DEVICE_ID_SYNAPTICS_TP_V103	0x5710
+#define USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1002	0x73f4
 #define USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003	0x73f5
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7
 
diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 742c052b0110..22bfbebceaf4 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -18,10 +18,16 @@ static __u8 *ite_report_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int
 	unsigned long quirks = (unsigned long)hid_get_drvdata(hdev);
 
 	if (quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) {
+		/* For Acer Aspire Switch 10 SW5-012 keyboard-dock */
 		if (*rsize == 188 && rdesc[162] == 0x81 && rdesc[163] == 0x02) {
-			hid_info(hdev, "Fixing up ITE keyboard report descriptor\n");
+			hid_info(hdev, "Fixing up Acer Sw5-012 ITE keyboard report descriptor\n");
 			rdesc[163] = HID_MAIN_ITEM_RELATIVE;
 		}
+		/* For Acer One S1002 keyboard-dock */
+		if (*rsize == 188 && rdesc[185] == 0x81 && rdesc[186] == 0x02) {
+			hid_info(hdev, "Fixing up Acer S1002 ITE keyboard report descriptor\n");
+			rdesc[186] = HID_MAIN_ITEM_RELATIVE;
+		}
 	}
 
 	return rdesc;
@@ -101,6 +107,11 @@ static const struct hid_device_id ite_devices[] = {
 		     USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012),
 	  .driver_data = QUIRK_TOUCHPAD_ON_OFF_REPORT },
 	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_SYNAPTICS,
+		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1002),
+	  .driver_data = QUIRK_TOUCHPAD_ON_OFF_REPORT },
+	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_SYNAPTICS,
 		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003) },
-- 
2.28.0


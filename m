Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B8C31201B
	for <lists+linux-input@lfdr.de>; Sat,  6 Feb 2021 21:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhBFUzD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Feb 2021 15:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24817 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229522AbhBFUzC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 6 Feb 2021 15:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612644815;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0ztG/GDQggF7DdpdlxebJqHqZaKxh2Xqm+Sif6z1gbU=;
        b=Tml7TSd2Jfiu7xLg0pouNrPXcph+nXqPzt2UZA50HGtk/MGq5LTX2Ki+V01jHRNDtoCfb/
        zixb8n2R/mcrBZYa9B5qiSlbsViySxLtIIOQtko1hMbWgo8OilRfERP0wvDTnawb1BCwNW
        FFe3GgUQvJGO2zDm2EyzDUK9pWw/2Qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-AXN0UmNhPyiY5fkEWK555g-1; Sat, 06 Feb 2021 15:53:33 -0500
X-MC-Unique: AXN0UmNhPyiY5fkEWK555g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F4980196E;
        Sat,  6 Feb 2021 20:53:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-18.ams2.redhat.com [10.36.112.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F2525D761;
        Sat,  6 Feb 2021 20:53:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch 10E
Date:   Sat,  6 Feb 2021 21:53:27 +0100
Message-Id: <20210206205327.45824-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Acer Aspire Switch 10E (SW3-016)'s keyboard-dock uses the same USB-ids
as the Acer One S1003 keyboard-dock. Yet they are not entirely the same:

1. The S1003 keyboard-dock has the same report descriptors as the
S1002 keyboard-dock (which has different USB-ids)

2. The Acer Aspire Switch 10E's keyboard-dock has different
report descriptors from the S1002/S1003 keyboard docks and it
sends 0x00880078 / 0x00880079 usage events when the touchpad is
toggled on/off (which is handled internally).

This means that all Acer kbd-docks handled by the hid-ite.c drivers
report their touchpad being toggled on/off through these custom
usage-codes with the exception of the S1003 dock, which likely is
a bug of that dock.

Add a QUIRK_TOUCHPAD_ON_OFF_REPORT quirk for the Aspire Switch 10E / S1003
usb-id so that the touchpad toggling will get reported to userspace on
the Aspire Switch 10E.

Since the Aspire Switch 10E's kbd-dock has different report-descriptors,
this also requires adding support for fixing those to ite_report_fixup().

Setting the quirk will also cause ite_report_fixup() to hit the
S1002/S1003 descriptors path on the S1003. Since the S1003 kbd-dock
never generates any input-reports for the fixed up part of the
descriptors this does not matter; and if there are versions out there
which do actually send input-reports for the touchpad-toggle then the
fixup should actually help to make things work.

This was tested on both an Acer Aspire Switch 10E and on an Acer One S1003.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ite.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 22bfbebceaf4..14fc068affad 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -23,11 +23,16 @@ static __u8 *ite_report_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int
 			hid_info(hdev, "Fixing up Acer Sw5-012 ITE keyboard report descriptor\n");
 			rdesc[163] = HID_MAIN_ITEM_RELATIVE;
 		}
-		/* For Acer One S1002 keyboard-dock */
+		/* For Acer One S1002/S1003 keyboard-dock */
 		if (*rsize == 188 && rdesc[185] == 0x81 && rdesc[186] == 0x02) {
-			hid_info(hdev, "Fixing up Acer S1002 ITE keyboard report descriptor\n");
+			hid_info(hdev, "Fixing up Acer S1002/S1003 ITE keyboard report descriptor\n");
 			rdesc[186] = HID_MAIN_ITEM_RELATIVE;
 		}
+		/* For Acer Aspire Switch 10E (SW3-016) keyboard-dock */
+		if (*rsize == 210 && rdesc[184] == 0x81 && rdesc[185] == 0x02) {
+			hid_info(hdev, "Fixing up Acer Aspire Switch 10E (SW3-016) ITE keyboard report descriptor\n");
+			rdesc[185] = HID_MAIN_ITEM_RELATIVE;
+		}
 	}
 
 	return rdesc;
@@ -114,7 +119,8 @@ static const struct hid_device_id ite_devices[] = {
 	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_SYNAPTICS,
-		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003) },
+		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003),
+	  .driver_data = QUIRK_TOUCHPAD_ON_OFF_REPORT },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ite_devices);
-- 
2.30.0


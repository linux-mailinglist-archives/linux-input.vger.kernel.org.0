Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EFA32FAE1
	for <lists+linux-input@lfdr.de>; Sat,  6 Mar 2021 14:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbhCFNh5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Mar 2021 08:37:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37435 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230426AbhCFNhZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 6 Mar 2021 08:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615037844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Jv6NStT3YKWBZOE2ZKDo9kaEWFKppUgBi1D22PCnAqA=;
        b=Z84Jy1A96PnOqSGYyBGK385ZLmHeO5NiZrIOSvgwnNFl/E4EntXAOOjSpdf4KCJ3rX+iQ9
        3YvQejPd57wiLL70brnTzRtteARxsnoi31MncoY7ZCpO5Q4r4SK2JQ5D+y/MrwoXBAhiZF
        S1oCqAe4tBJ1Ui8atDDZkBcCoWlOouw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-rxjadneaNs6mNhyW1b33iA-1; Sat, 06 Mar 2021 08:37:22 -0500
X-MC-Unique: rxjadneaNs6mNhyW1b33iA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A3826864;
        Sat,  6 Mar 2021 13:37:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4243C19C66;
        Sat,  6 Mar 2021 13:37:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/3] HID: asus: Cleanup Asus T101HA keyboard-dock handling
Date:   Sat,  6 Mar 2021 14:37:14 +0100
Message-Id: <20210306133716.453447-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is no need to use a quirk and then return -ENODEV from the
asus_probe() function to avoid that hid-asus binds to the hiddev
for the USB-interface for the hid-multitouch touchpad.

The hid-multitouch hiddev has a group of HID_GROUP_MULTITOUCH_WIN_8,
so the same result can be achieved by making the hid_device_id entry
for the dock in the asus_devices[] table only match on HID_GROUP_GENERIC
instead of having it match HID_GROUP_ANY.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 1dfe184ebf5a..b892aea673f9 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -79,10 +79,9 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_T100_KEYBOARD		BIT(6)
 #define QUIRK_T100CHI			BIT(7)
 #define QUIRK_G752_KEYBOARD		BIT(8)
-#define QUIRK_T101HA_DOCK		BIT(9)
-#define QUIRK_T90CHI			BIT(10)
-#define QUIRK_MEDION_E1239T		BIT(11)
-#define QUIRK_ROG_NKEY_KEYBOARD		BIT(12)
+#define QUIRK_T90CHI			BIT(9)
+#define QUIRK_MEDION_E1239T		BIT(10)
+#define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -1072,11 +1071,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	/* use hid-multitouch for T101HA touchpad */
-	if (id->driver_data & QUIRK_T101HA_DOCK &&
-	    hdev->collection->usage == HID_GD_MOUSE)
-		return -ENODEV;
-
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "Asus hw start failed: %d\n", ret);
@@ -1227,8 +1221,6 @@ static const struct hid_device_id asus_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_T100TAF_KEYBOARD),
 	  QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
-		USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD), QUIRK_T101HA_DOCK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TURBOX, USB_DEVICE_ID_ASUS_MD_5110) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_JESS, USB_DEVICE_ID_ASUS_MD_5112) },
@@ -1236,6 +1228,12 @@ static const struct hid_device_id asus_devices[] = {
 		USB_DEVICE_ID_ASUSTEK_T100CHI_KEYBOARD), QUIRK_T100CHI },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE_MEDION_E1239T),
 		QUIRK_MEDION_E1239T },
+	/*
+	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
+	 * part, while letting hid-multitouch.c handle the touchpad.
+	 */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, asus_devices);
-- 
2.30.1


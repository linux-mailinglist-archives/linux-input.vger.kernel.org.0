Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73E7374AAB
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhEEVlI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52360 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233772AbhEEVks (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620250790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gUT60/I2futOhxJeimb6HwtYWVrW8DM8lY+djOvKMuU=;
        b=OibfSAJZQqf7083Mk07kSi/CCboDgquj4pJ3QUeFxabCGz5x+mVboloV3/sNkBNy2LxvrF
        MqTQNmVhr7Z25X7xaUpTDnYOhIKaPjgDaZTZ37zA6UHBkWMXxoO2xdkKznP0PWIzGJYkRY
        J7607Cmod++oEWs/LX2tEqoxoPtBF4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-YiyaoQEJP9qPLb7GuH-_EA-1; Wed, 05 May 2021 17:39:48 -0400
X-MC-Unique: YiyaoQEJP9qPLb7GuH-_EA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DCDB107ACCA;
        Wed,  5 May 2021 21:39:47 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 415F85D6A8;
        Wed,  5 May 2021 21:39:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 5/6] HID: asus: Cleanup Asus T101HA keyboard-dock handling
Date:   Wed,  5 May 2021 23:39:34 +0200
Message-Id: <20210505213935.631351-6-hdegoede@redhat.com>
In-Reply-To: <20210505213935.631351-1-hdegoede@redhat.com>
References: <20210505213935.631351-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
index 2ab22b925941..6e24f48f211c 100644
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
@@ -1230,8 +1224,6 @@ static const struct hid_device_id asus_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_T100TAF_KEYBOARD),
 	  QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
-		USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD), QUIRK_T101HA_DOCK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TURBOX, USB_DEVICE_ID_ASUS_MD_5110) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_JESS, USB_DEVICE_ID_ASUS_MD_5112) },
@@ -1239,6 +1231,12 @@ static const struct hid_device_id asus_devices[] = {
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
2.31.1


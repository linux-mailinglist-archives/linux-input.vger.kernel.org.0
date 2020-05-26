Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD72C1E24F1
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 17:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgEZPH3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 11:07:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45954 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728205AbgEZPH2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 11:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590505647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=80gBzVUfUjSNrL5/Z0KCUykiDhfwVHhwxfTTQc/kPNs=;
        b=ZhOjvuuASohjL0xm5JsL0GPsrRlmNv6sFEE9+ubh5xeGwDRjAC5x/xYIq3EkdmspHRKjo5
        fvrBk0ad0qVDNBBamat3R65YDwti5+deV/czz6dgLorUGI2pmnrA+D0+HRvLWvDN1szdle
        kNXwbBfcQKSHYNyLOmaEHLobVhyDNmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-H5emKm5INRa0_x_D_nK6aQ-1; Tue, 26 May 2020 11:07:25 -0400
X-MC-Unique: H5emKm5INRa0_x_D_nK6aQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2091F107ACF5;
        Tue, 26 May 2020 15:07:24 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BED4760F88;
        Tue, 26 May 2020 15:07:19 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>, kai.heng.feng@canonical.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        stable@vger.kernel.org
Subject: [PATCH] HID: multitouch: enable multi-input as a quirk for some devices
Date:   Tue, 26 May 2020 17:07:17 +0200
Message-Id: <20200526150717.324783-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Two touchpad/trackstick combos are currently not behaving properly.
They define a mouse emulation collection, as per Win8 requirements,
but also define a separate mouse collection for the trackstick.

The way the kernel currently treat the collections is that it
merges both in one device. However, given that the first mouse
collection already defines X,Y and left, right buttons, when
mapping the events from the second mouse collection, hid-multitouch
sees that these events are already mapped, and simply ignores them.

To be able to report events from the tracktick, add a new quirked
class for it, and manually add the 2 devices we know about.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=207235
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-multitouch.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 03c720b47306..39e4da7468e1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -69,6 +69,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_ASUS_CUSTOM_UP		BIT(17)
 #define MT_QUIRK_WIN8_PTP_BUTTONS	BIT(18)
 #define MT_QUIRK_SEPARATE_APP_REPORT	BIT(19)
+#define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -189,6 +190,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_WIN_8				0x0012
 #define MT_CLS_EXPORT_ALL_INPUTS		0x0013
 #define MT_CLS_WIN_8_DUAL			0x0014
+#define MT_CLS_WIN_8_FORCE_MULTI_INPUT		0x0015
 
 /* vendor specific classes */
 #define MT_CLS_3M				0x0101
@@ -279,6 +281,15 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_WIN8_PTP_BUTTONS,
 		.export_all_inputs = true },
+	{ .name = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_IGNORE_DUPLICATES |
+			MT_QUIRK_HOVERING |
+			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_STICKY_FINGERS |
+			MT_QUIRK_WIN8_PTP_BUTTONS |
+			MT_QUIRK_FORCE_MULTI_INPUT,
+		.export_all_inputs = true },
 
 	/*
 	 * vendor specific classes
@@ -1714,6 +1725,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (id->group != HID_GROUP_MULTITOUCH_WIN_8)
 		hdev->quirks |= HID_QUIRK_MULTI_INPUT;
 
+	if (mtclass->quirks & MT_QUIRK_FORCE_MULTI_INPUT) {
+		hdev->quirks &= ~HID_QUIRK_INPUT_PER_APP;
+		hdev->quirks |= HID_QUIRK_MULTI_INPUT;
+	}
+
 	timer_setup(&td->release_timer, mt_expired_timeout, 0);
 
 	ret = hid_parse(hdev);
@@ -1926,6 +1942,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
 			USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_C002) },
 
+	/* Elan devices */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN, 0x313a) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
@@ -2056,6 +2077,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_STANTUM_STM,
 			USB_DEVICE_ID_MTP_STM)},
 
+	/* Synaptics devices */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_SYNAPTICS, 0xce08) },
+
 	/* TopSeed panels */
 	{ .driver_data = MT_CLS_TOPSEED,
 		MT_USB_DEVICE(USB_VENDOR_ID_TOPSEED2,
-- 
2.25.1


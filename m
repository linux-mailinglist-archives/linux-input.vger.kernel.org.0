Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350D11BC115
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 16:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgD1OXJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 10:23:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53172 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727874AbgD1OXI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588083787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dr4I/HkHF2vAt1qE0W3bb47MvaiM2Og+nY8KPsDxiH4=;
        b=Zbs9qJy2stCY2mDW0YjfR/BHJpcD555GvRx3fYQ5o09hmsnG5r4vv+mqoYISYYaK30cb5F
        JAUOI5uLea4DLzbHQPTEVg1mXZIpoq171dleCP3LwAvIlnu7fOYDw6wMl+6OFsfyM/NrNZ
        /nSiUlIzwlkAMGDGX+1jK2Fs9uxcLV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-QUIcCrH2Ntmuc3lgkWNHIA-1; Tue, 28 Apr 2020 10:23:05 -0400
X-MC-Unique: QUIcCrH2Ntmuc3lgkWNHIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8CBA464;
        Tue, 28 Apr 2020 14:23:04 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F000F605CB;
        Tue, 28 Apr 2020 14:23:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 5/6] HID: asus: Add support for multi-touch touchpad on Medion Akoya E1239T
Date:   Tue, 28 Apr 2020 16:22:53 +0200
Message-Id: <20200428142254.252063-5-hdegoede@redhat.com>
In-Reply-To: <20200428142254.252063-1-hdegoede@redhat.com>
References: <20200428142254.252063-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The multi-touch touchpad found on the Medion Akoya E1239T's keyboard-dock=
,
uses the same custom multi-touch protocol as the Asus keyboard-docks
(same chipset vendor, Integrated Technology Express / ITE).

Add support for this using the existing multi-touch touchpad support in
the hid-asus driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 26 +++++++++++++++++++++++++-
 drivers/hid/hid-ids.h  |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 6d97dbbcc287..317d7392ca8b 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -40,6 +40,7 @@ MODULE_AUTHOR("Frederik Wenigwieser <frederik.wenigwies=
er@gmail.com>");
 MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
=20
 #define T100_TPAD_INTF 2
+#define MEDION_E1239T_TPAD_INTF 1
=20
 #define T100CHI_MOUSE_REPORT_ID 0x06
 #define FEATURE_REPORT_ID 0x0d
@@ -77,6 +78,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_G752_KEYBOARD		BIT(8)
 #define QUIRK_T101HA_DOCK		BIT(9)
 #define QUIRK_T90CHI			BIT(10)
+#define QUIRK_MEDION_E1239T		BIT(11)
=20
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -170,6 +172,16 @@ static const struct asus_touchpad_info asus_t100chi_=
tp =3D {
 	.report_size =3D 15 /* 2 byte header + 3 * 4 + 1 byte footer */,
 };
=20
+static const struct asus_touchpad_info medion_e1239t_tp =3D {
+	.max_x =3D 2640,
+	.max_y =3D 1380,
+	.res_x =3D 29, /* units/mm */
+	.res_y =3D 28, /* units/mm */
+	.contact_size =3D 5,
+	.max_contacts =3D 5,
+	.report_size =3D 32 /* 2 byte header + 5 * 5 + 5 byte footer */,
+};
+
 static void asus_report_contact_down(struct asus_drvdata *drvdat,
 		int toolType, u8 *data)
 {
@@ -877,6 +889,17 @@ static int asus_probe(struct hid_device *hdev, const=
 struct hid_device_id *id)
 		drvdata->tp =3D &asus_t100chi_tp;
 	}
=20
+	if ((drvdata->quirks & QUIRK_MEDION_E1239T) &&
+	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
+		struct usb_host_interface *alt =3D
+			to_usb_interface(hdev->dev.parent)->altsetting;
+
+		if (alt->desc.bInterfaceNumber =3D=3D MEDION_E1239T_TPAD_INTF) {
+			drvdata->quirks |=3D QUIRK_SKIP_INPUT_MAPPING;
+			drvdata->tp =3D &medion_e1239t_tp;
+		}
+	}
+
 	if (drvdata->quirks & QUIRK_NO_INIT_REPORTS)
 		hdev->quirks |=3D HID_QUIRK_NO_INIT_REPORTS;
=20
@@ -1056,7 +1079,8 @@ static const struct hid_device_id asus_devices[] =3D=
 {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_JESS, USB_DEVICE_ID_ASUS_MD_5112) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_T100CHI_KEYBOARD), QUIRK_T100CHI },
-
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE_MEDION_E1239T),
+		QUIRK_MEDION_E1239T },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, asus_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b18b13147a6f..2efa823a87e4 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -639,6 +639,7 @@
 #define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
 #define USB_DEVICE_ID_ITE8595		0x8595
+#define USB_DEVICE_ID_ITE_MEDION_E1239T	0xce50
=20
 #define USB_VENDOR_ID_JABRA		0x0b0e
 #define USB_DEVICE_ID_JABRA_SPEAK_410	0x0412
--=20
2.26.0


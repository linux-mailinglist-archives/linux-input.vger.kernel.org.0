Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10BCACCD9E
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 03:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfJFBEY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 21:04:24 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:40812 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfJFBEY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 21:04:24 -0400
Date:   Sun, 06 Oct 2019 01:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570323859;
        bh=EenmT9+ylx8vIRw7BMAiWOi3ZvFwek38x/+DNgZOMEc=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=O4hOGLNfVG9gqVm9o4EGx1rNJh2PtJE2ogwUApPkqkfIBZBMTx+WDMNT17ITK5A5m
         VnRXpPSMRUNkdWHZfzXl03IlbAAExaDhuU/OAu8Zs6gAstLoMbZSLLrLuFz3mL1JLa
         NOHf/PQRoxjZcm7WgsJj1iZtLPybTFcCIVIO7noI=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lains@archlinux.org" <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v3 2/4] HID: logitech: Support HID++ devices without short reports
Message-ID: <HX248-hoZ2daaQH9Muo7s5C6sRUELL-EPBZIDcBOta2l66BTJq6-OcAjY-yYSKkZs_8bqgM3Uuc5ZdAPjkLEvsbdFMLbbkZlRIyT8iLH7yE=@protonmail.com>
Feedback-ID: 18B_FC5q-t32TXzMsVp9BgkgrdNH3iwklfW8WOrHrcxZA0WRj7JodCh5VXKxs6A3OaiHK0QNd8wi3SImKex8yQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch allows the hid-logitech-hidpp module to support devices that do
not have support for Short HID++ reports. So far, it seems that Bluetooth
HID++ 2.0 devices are missing short reports.

This has been tested and confirmed with the MX Master and MX Master 2S and
is therefore likely the case with the other Bluetooth devices.

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 37 ++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 85fd0c17cc2f..a0efa8a43213 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -71,6 +71,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_HIDPP_WHEELS=09=09BIT(29)
 #define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS=09BIT(30)
 #define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS=09BIT(31)
+#define HIDPP_QUIRK_CLASS_BLUETOOTH=09=09BIT(5)

 /* These are just aliases for now */
 #define HIDPP_QUIRK_KBD_SCROLL_WHEEL HIDPP_QUIRK_HIDPP_WHEELS
@@ -81,6 +82,9 @@ MODULE_PARM_DESC(disable_tap_to_click,
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2120 | \
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2121)

+/* Just an alias for now, may possibly be a catch-all in the future */
+#define HIDPP_QUIRK_MISSING_SHORT_REPORTS=09HIDPP_QUIRK_CLASS_BLUETOOTH
+
 #define HIDPP_QUIRK_DELAYED_INIT=09=09HIDPP_QUIRK_NO_HIDINPUT

 #define HIDPP_CAPABILITY_HIDPP10_BATTERY=09BIT(0)
@@ -340,6 +344,12 @@ static int hidpp_send_rap_command_sync(struct hidpp_de=
vice *hidpp_dev,
 =09struct hidpp_report *message;
 =09int ret, max_count;

+=09/* Force long reports on devices that do not support short reports */
+=09if (hidpp_dev->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS &&
+=09    report_id =3D=3D REPORT_ID_HIDPP_SHORT)
+=09=09report_id =3D REPORT_ID_HIDPP_LONG;
+
+
 =09switch (report_id) {
 =09case REPORT_ID_HIDPP_SHORT:
 =09=09max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
@@ -3482,6 +3492,12 @@ static bool hidpp_validate_report(struct hid_device =
*hdev, int id,

 static bool hidpp_validate_device(struct hid_device *hdev)
 {
+=09struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
+=09/* Skip the short report check if the device does not support it */
+=09if (hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)
+=09=09return hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
+=09=09=09=09=09     HIDPP_REPORT_LONG_LENGTH, false);
+
 =09return hidpp_validate_report(hdev, REPORT_ID_HIDPP_SHORT,
 =09=09=09=09     HIDPP_REPORT_SHORT_LENGTH, false) &&
 =09       hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
@@ -3775,22 +3791,29 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
 =09  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
 =09{ /* MX Anywhere 2 mouse over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
-=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
-=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{ /* MX Anywhere 2S mouse over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
-=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{ /* MX Master mouse over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
-=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
-=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
-=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{ /* MX Master 2S mouse over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
-=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{}
 };

--
2.23.0


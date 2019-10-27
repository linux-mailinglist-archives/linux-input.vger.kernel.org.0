Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7061E6497
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2019 18:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfJ0RoO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Oct 2019 13:44:14 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:52885 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbfJ0RoN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Oct 2019 13:44:13 -0400
Date:   Sun, 27 Oct 2019 17:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1572198249;
        bh=5E0VM+hKQZ3Ya5sIX3S41D1XbNmkqZv2gdoK9lSx6oU=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=b+IBYsi/3Y69DgnZk2pnAtemIEnduvT7P7Ra7ii0Cy/RhyXxN7eEyGm0UhRNsD9pS
         PsHBRml2L+X3AXwBb+RbeWmKCUcICNt8oP6uTPecu4oNIV9rV6ORwTmQrvAsbeMAw9
         JSB5UM5FPXppSiV6Pd/fWHtAjd2EVdxhz0lCps+w=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "adrian@freund.io" <adrian@freund.io>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v8 1/2] HID: logitech-hidpp: Support translations from short to long reports
Message-ID: <4_PuSu9QvgHPBub7Gk2yfxB_ZBPVYFUA877INdfVgqmiB5GeE0c7JfH57of1g2oFJF7eE775WFks-z0qtDGANo6DibtePkQApMuFOWYHFJ4=@protonmail.com>
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

This patch allows short reports to be translated into long reports.

hidpp_validate_device now returns a u8 instead of a bool which represents
the supported reports. The corresponding bits (i.e.
HIDPP_REPORT_*_SUPPORTED) are set if an HID++ report is supported.

If a short report is being sent and the device does not support it, it is
instead sent as a long report.

This patch also introduces support for the MX Master (b01e and b012).

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index e9bba282f9c1..19b315e4e91b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -49,6 +49,10 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_REPORT_LONG_LENGTH=09=0920
 #define HIDPP_REPORT_VERY_LONG_MAX_LENGTH=0964

+#define HIDPP_REPORT_SHORT_SUPPORTED=09=09BIT(0)
+#define HIDPP_REPORT_LONG_SUPPORTED=09=09BIT(1)
+#define HIDPP_REPORT_VERY_LONG_SUPPORTED=09BIT(2)
+
 #define HIDPP_SUB_ID_CONSUMER_VENDOR_KEYS=090x03
 #define HIDPP_SUB_ID_ROLLER=09=09=090x05
 #define HIDPP_SUB_ID_MOUSE_EXTRA_BTNS=09=090x06
@@ -183,6 +187,7 @@ struct hidpp_device {

 =09unsigned long quirks;
 =09unsigned long capabilities;
+=09u8 supported_reports;

 =09struct hidpp_battery battery;
 =09struct hidpp_scroll_counter vertical_wheel_counter;
@@ -340,6 +345,11 @@ static int hidpp_send_rap_command_sync(struct hidpp_de=
vice *hidpp_dev,
 =09struct hidpp_report *message;
 =09int ret, max_count;

+=09/* Send as long report if short reports are not supported. */
+=09if (report_id =3D=3D REPORT_ID_HIDPP_SHORT &&
+=09    !(hidpp_dev->supported_reports & HIDPP_REPORT_SHORT_SUPPORTED))
+=09=09report_id =3D REPORT_ID_HIDPP_LONG;
+
 =09switch (report_id) {
 =09case REPORT_ID_HIDPP_SHORT:
 =09=09max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
@@ -3458,10 +3468,11 @@ static int hidpp_get_report_length(struct hid_devic=
e *hdev, int id)
 =09return report->field[0]->report_count + 1;
 }

-static bool hidpp_validate_device(struct hid_device *hdev)
+static u8 hidpp_validate_device(struct hid_device *hdev)
 {
 =09struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
-=09int id, report_length, supported_reports =3D 0;
+=09int id, report_length;
+=09u8 supported_reports =3D 0;

 =09id =3D REPORT_ID_HIDPP_SHORT;
 =09report_length =3D hidpp_get_report_length(hdev, id);
@@ -3469,7 +3480,7 @@ static bool hidpp_validate_device(struct hid_device *=
hdev)
 =09=09if (report_length < HIDPP_REPORT_SHORT_LENGTH)
 =09=09=09goto bad_device;

-=09=09supported_reports++;
+=09=09supported_reports |=3D HIDPP_REPORT_SHORT_SUPPORTED;
 =09}

 =09id =3D REPORT_ID_HIDPP_LONG;
@@ -3478,7 +3489,7 @@ static bool hidpp_validate_device(struct hid_device *=
hdev)
 =09=09if (report_length < HIDPP_REPORT_LONG_LENGTH)
 =09=09=09goto bad_device;

-=09=09supported_reports++;
+=09=09supported_reports |=3D HIDPP_REPORT_LONG_SUPPORTED;
 =09}

 =09id =3D REPORT_ID_HIDPP_VERY_LONG;
@@ -3488,7 +3499,7 @@ static bool hidpp_validate_device(struct hid_device *=
hdev)
 =09=09    report_length > HIDPP_REPORT_VERY_LONG_MAX_LENGTH)
 =09=09=09goto bad_device;

-=09=09supported_reports++;
+=09=09supported_reports |=3D HIDPP_REPORT_VERY_LONG_SUPPORTED;
 =09=09hidpp->very_long_report_length =3D report_length;
 =09}

@@ -3536,7 +3547,9 @@ static int hidpp_probe(struct hid_device *hdev, const=
 struct hid_device_id *id)
 =09/*
 =09 * Make sure the device is HID++ capable, otherwise treat as generic HI=
D
 =09 */
-=09if (!hidpp_validate_device(hdev)) {
+=09hidpp->supported_reports =3D hidpp_validate_device(hdev);
+
+=09if (!hidpp->supported_reports) {
 =09=09hid_set_drvdata(hdev, NULL);
 =09=09devm_kfree(&hdev->dev, hidpp);
 =09=09return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
@@ -3779,6 +3792,11 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
 =09{ /* MX5500 keyboard over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 =09  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+=09{ /* MX Master mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 =09{}
 };

--
2.23.0


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DE1B1740
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2019 04:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfIMCk5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Sep 2019 22:40:57 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:38135 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfIMCk5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Sep 2019 22:40:57 -0400
Date:   Fri, 13 Sep 2019 02:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1568342455;
        bh=V4PbAJ58X+/Rvcujigi4yKfg4K9q6TNuxl6Z4Nsh+s4=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=X4VoIHWlfPPNXVjhp9jqh+Cb+7h7kAcuPtMqBGZcjHJnY6IiqRaYbibqX76//CVYE
         w9xpj/4ti9PbegiFoFDhBMIoFTVDBUWat4fvT/xp7SbylT5BckEJhUmha032gTFjjQ
         Jep0GpipevgNyk6+h8agTPGs3P2XUX89gyE//cHE=
To:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH] HID: hid-logitech-hidpp: Implement support for some Bluetooth HID++ devices
Message-ID: <M62zU6SvjXwzMOfaYM9ls_HwcF3BKMKV5nRDcJViW9i4nQZOh2wIvwX8o80CVGpYYUywrOPfJHFT3uvNvEC2ZDiA77jSoUZv5_mc9xE0HEk=@protonmail.com>
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

This patch adds support the MX Anywhere 2, MX Anywhere 2S, MX Master, and M=
X Master 2S over Bluetooth to the hid-logitech-hidpp module. This patch als=
o implements a foundation for other Bluetooth devices to be added to the mo=
dule.

Changes include:
1) Adding the device IDs for the aforementioned mice over Bluetooth (these =
IDs have been copied from the libratbag device database). Their quirks have=
 been based on their DJ device counterparts.
2) Adding an additional HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID as these dev=
ices do not support Short HID++ reports. This quirk causes short reports to=
 be sent as long reports to the device and overrides the device validation =
to only check if the long report descriptor exists. Without this quirk, the=
se devices will fail the HID++ device validation.

Note about these changes: I only own an MX Master (b01e) so I have not been=
 able to test this patch on other devices. However, I have also noticed tha=
t the MX Master 2S over Bluetooth does not pass the original HID++ report d=
escriptor tests which leads me to believe all MX Bluetooth LE devices are m=
issing short report descriptors. Further testing with the other devices may=
 be required.

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 0179f7ed77e5..a80c4486756c 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -72,6 +72,9 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS=09BIT(30)
 #define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS=09BIT(31)

+/* This is required to fix report ids on some bluetooth devices */
+#define HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID=09BIT(32)
+
 /* These are just aliases for now */
 #define HIDPP_QUIRK_KBD_SCROLL_WHEEL HIDPP_QUIRK_HIDPP_WHEELS
 #define HIDPP_QUIRK_KBD_ZOOM_WHEEL   HIDPP_QUIRK_HIDPP_WHEELS
@@ -340,6 +343,11 @@ static int hidpp_send_rap_command_sync(struct hidpp_de=
vice *hidpp_dev,
 =09struct hidpp_report *message;
 =09int ret, max_count;

+=09/* Force long reports on devices that do not support short reports */
+=09if (hidpp_dev-&gt;quirks &amp; HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID &=
amp;&amp;
+=09    report_id =3D=3D REPORT_ID_HIDPP_SHORT)
+=09=09report_id =3D REPORT_ID_HIDPP_LONG;
+
 =09switch (report_id) {
 =09case REPORT_ID_HIDPP_SHORT:
 =09=09max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
@@ -3482,6 +3490,12 @@ static bool hidpp_validate_report(struct hid_device =
*hdev, int id,

 static bool hidpp_validate_device(struct hid_device *hdev)
 {
+=09struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
+=09/* Skip the short report check if the device does not support it */
+=09if (hidpp-&gt;quirks &amp; HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID)
+=09=09return hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
+=09=09=09=09=09     HIDPP_REPORT_LONG_LENGTH, false);
+
 =09return hidpp_validate_report(hdev, REPORT_ID_HIDPP_SHORT,
 =09=09=09=09     HIDPP_REPORT_SHORT_LENGTH, false) &amp;&amp;
 =09       hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
@@ -3773,6 +3787,31 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
 =09{ /* MX5500 keyboard over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 =09  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+=09{ /* MX Anywhere 2 mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID },
+=09{ /* MX Anywhere 2S mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID },
+=09{ /* MX Master mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID },
+=09{ /* MX Master 2S mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID },
 =09{}
 };

--
2.23.0


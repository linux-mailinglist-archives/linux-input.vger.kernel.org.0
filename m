Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDCED698A
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 20:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730441AbfJNSgP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Oct 2019 14:36:15 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:34977 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729610AbfJNSgP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Oct 2019 14:36:15 -0400
Date:   Mon, 14 Oct 2019 18:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1571078171;
        bh=c8f5ffkKV2bEwQy6LxxpHQK2PcptUqivs9BKAqP8sAU=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=KZAvafxn91fdrcFyvX8LGJoyBxWZVkxtIM5VVuIKhsVoXA3TmHl+hyBeutYGJMEgr
         vBLcyK/5GBiXRSbjS0ZjVU9sNpvd7RagXwjlRKnji4IWfE2VYUNQi59pvqIvPFyKSj
         xxjYi8GsER4//GkrwV00nQ5DtM/Ykhv/H2G7pjhc=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v6 1/2] HID: logitech: Add MX Master over Bluetooth
Message-ID: <ggKipcQplIlTFmoP3hPnrQ-7_5-C0PKGd5feFymts3uenIBA8zOwz47YmKheD34H1rpkguDAGdx5YbS9UqpwfjT5Ir0Lji941liLVp--QtQ=@protonmail.com>
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

This patch adds support for the MX Master (b01e and b012) and also adds
foundational code for other Bluetooth LE HID++ devices to be added.

Some devices do not support short reports and thus have a quirk
(HIDPP_QUIRK_MISSING_SHORT_REPORTS) that forces short reports to be sent as
long reports. Since all Bluetooth LE HID++ devices seem to act this way,
HIDPP_QUIRK_CLASS_BLUETOOTH_LE aliases this quirk.

To allow for some space for future quirks, I changed the comment that
defines the bits reserved for classes from 2...20 to 2..15.

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 0179f7ed77e5..997b1056850a 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -59,7 +59,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_CLASS_G920=09=09=09BIT(3)
 #define HIDPP_QUIRK_CLASS_K750=09=09=09BIT(4)

-/* bits 2..20 are reserved for classes */
+/* bits 2..15 are reserved for classes */
+#define HIDPP_QUIRK_MISSING_SHORT_REPORTS=09BIT(20)
 /* #define HIDPP_QUIRK_CONNECT_EVENTS=09=09BIT(21) disabled */
 #define HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS=09BIT(22)
 #define HIDPP_QUIRK_NO_HIDINPUT=09=09=09BIT(23)
@@ -81,6 +82,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2120 | \
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2121)

+#define HIDPP_QUIRK_CLASS_BLUETOOTH_LE=09HIDPP_QUIRK_MISSING_SHORT_REPORTS
+
 #define HIDPP_QUIRK_DELAYED_INIT=09=09HIDPP_QUIRK_NO_HIDINPUT

 #define HIDPP_CAPABILITY_HIDPP10_BATTERY=09BIT(0)
@@ -340,6 +343,12 @@ static int hidpp_send_rap_command_sync(struct hidpp_de=
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
@@ -3482,6 +3491,12 @@ static bool hidpp_validate_report(struct hid_device =
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
@@ -3773,6 +3788,13 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
 =09{ /* MX5500 keyboard over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 =09  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+=09{ /* MX Master mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
 =09{}
 };

--
2.23.0


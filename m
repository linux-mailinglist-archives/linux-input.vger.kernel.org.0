Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52B17D46E1
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 19:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbfJKRrb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 13:47:31 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:17065 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbfJKRrb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 13:47:31 -0400
Date:   Fri, 11 Oct 2019 17:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570816047;
        bh=f373ULP+n1H+4IUhDKcM/w1IGIFFkcStr8/7eqSMQBM=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=b2bYm2cjquFzggGTgBB1u0+t5yCqDCryZZEiatxI8O7LlQ+uNlXqNesXi/vf+P1kx
         rAweFkMlQ3wAwE6HwBrFwx2dVgcpRt/gCu3erHpHMNXAt5S2xY2gBnG17q7HpZ+OCr
         R3yGGcAMwUKlSJBUIOdGGD5uvPhPxZeeKdhcm3Lg=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v5 1/2] HID: logitech: Add MX Master over Bluetooth
Message-ID: <Mbf4goGxXZTfWwWtQQUke_rNf8kezpNOS9DVEVHf6RnnmjS1oRtMOJf4r14WfCC6GRYVs7gi0uZcIJ18Va2OJowzSbyMUGwLrl6I5fjW48o=@protonmail.com>
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

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 0179f7ed77e5..3692fb883602 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -71,6 +71,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_HIDPP_WHEELS=09=09BIT(29)
 #define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS=09BIT(30)
 #define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS=09BIT(31)
+#define HIDPP_QUIRK_MISSING_SHORT_REPORTS=09BIT(32)

 /* These are just aliases for now */
 #define HIDPP_QUIRK_KBD_SCROLL_WHEEL HIDPP_QUIRK_HIDPP_WHEELS
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


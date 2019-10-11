Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 352D6D46E3
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 19:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbfJKRr7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 13:47:59 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:58204 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbfJKRr7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 13:47:59 -0400
Date:   Fri, 11 Oct 2019 17:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570816076;
        bh=mvyYHFIJXQlg65e3hoLOmXCGjj1vtnmvU+8bO7YTk+Q=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=ulyS6KHBE0Q+4tMVt5vPKWSwn0HSBvlVcN5jnd3ApYzAymbzjLAuf/8sDR0weXLUJ
         gBmV5gsbMYzy/orHFRkQT+xsHXL7TjI0wrkHaiVmgNjfgRclm3bzEnUDPlejYit7At
         DT6BehsYvyzmk33l9d8tPFXqXPlCHjg36BW+YnJ8=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v5 2/2] HID: logitech: Support WirelessDeviceStatus connect events
Message-ID: <23olKBO7VYh8VS2ZXNY_4uBAy5jnxyXdBqzXiBZdvPxVp845bPLo6Xe_vwYMuSlozOUg2LYs5ANpE4wy6UBtF9p5YnoLz1Udq6HxW89R3tE=@protonmail.com>
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

This patch allows WirelessDeviceStatus (0x1d4b) events to be detected as
connection events in the hid-logitech-hidpp module.

Devices with HIDPP_QUIRK_WIRELESS_DEVICE_STATUS use WirelessDeviceStatus
instead of traditional connect events. Since all Bluetooth LE devices seem
to act this way, HIDPP_QUIRK_CLASS_BLUETOOTH_LE aliases this quirk.

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 42 ++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 3692fb883602..0dfa9b22b536 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -72,6 +72,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS=09BIT(30)
 #define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS=09BIT(31)
 #define HIDPP_QUIRK_MISSING_SHORT_REPORTS=09BIT(32)
+#define HIDPP_QUIRK_WIRELESS_DEVICE_STATUS=09BIT(33)

 /* These are just aliases for now */
 #define HIDPP_QUIRK_KBD_SCROLL_WHEEL HIDPP_QUIRK_HIDPP_WHEELS
@@ -82,7 +83,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2120 | \
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2121)

-#define HIDPP_QUIRK_CLASS_BLUETOOTH_LE=09HIDPP_QUIRK_MISSING_SHORT_REPORTS
+#define HIDPP_QUIRK_CLASS_BLUETOOTH_LE=09(HIDPP_QUIRK_MISSING_SHORT_REPORT=
S | \
+=09=09=09=09=09 HIDPP_QUIRK_WIRELESS_DEVICE_STATUS)

 #define HIDPP_QUIRK_DELAYED_INIT=09=09HIDPP_QUIRK_NO_HIDINPUT

@@ -189,6 +191,8 @@ struct hidpp_device {

 =09struct hidpp_battery battery;
 =09struct hidpp_scroll_counter vertical_wheel_counter;
+
+=09u8 wireless_feature_index;
 };

 /* HID++ 1.0 error codes */
@@ -402,10 +406,14 @@ static inline bool hidpp_match_error(struct hidpp_rep=
ort *question,
 =09    (answer->fap.params[0] =3D=3D question->fap.funcindex_clientid);
 }

-static inline bool hidpp_report_is_connect_event(struct hidpp_report *repo=
rt)
+static inline bool hidpp_report_is_connect_event(struct hidpp_device *hidp=
p,
+=09=09=09=09=09=09 struct hidpp_report *report)
 {
-=09return (report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
-=09=09(report->rap.sub_id =3D=3D 0x41);
+=09return ((hidpp->quirks & HIDPP_QUIRK_WIRELESS_DEVICE_STATUS) &&
+=09=09(report->fap.feature_index =3D=3D hidpp->wireless_feature_index)) ||
+=09      (((report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) ||
+=09=09(hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)) &&
+=09=09(report->rap.sub_id =3D=3D 0x41));
 }

 /**
@@ -1282,6 +1290,24 @@ static int hidpp_battery_get_property(struct power_s=
upply *psy,
 =09return ret;
 }

+/* -----------------------------------------------------------------------=
--- */
+/* 0x1d4b: Wireless device status                                         =
    */
+/* -----------------------------------------------------------------------=
--- */
+#define HIDPP_PAGE_WIRELESS_DEVICE_STATUS=09=09=090x1d4b
+
+static int hidpp_set_wireless_feature_index(struct hidpp_device *hidpp)
+{
+=09u8 feature_type;
+=09int ret;
+
+=09ret =3D hidpp_root_get_feature(hidpp,
+=09=09=09=09     HIDPP_PAGE_WIRELESS_DEVICE_STATUS,
+=09=09=09=09     &hidpp->wireless_feature_index,
+=09=09=09=09     &feature_type);
+
+=09return ret;
+}
+
 /* -----------------------------------------------------------------------=
--- */
 /* 0x2120: Hi-resolution scrolling                                        =
    */
 /* -----------------------------------------------------------------------=
--- */
@@ -3077,7 +3103,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_device =
*hidpp, u8 *data,
 =09=09}
 =09}

-=09if (unlikely(hidpp_report_is_connect_event(report))) {
+=09if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
 =09=09atomic_set(&hidpp->connected,
 =09=09=09=09!(report->rap.params[0] & (1 << 6)));
 =09=09if (schedule_work(&hidpp->work) =3D=3D 0)
@@ -3624,6 +3650,12 @@ static int hidpp_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)
 =09=09hidpp_overwrite_name(hdev);
 =09}

+=09if (connected && (hidpp->quirks & HIDPP_QUIRK_WIRELESS_DEVICE_STATUS)) =
{
+=09=09ret =3D hidpp_set_wireless_feature_index(hidpp);
+=09=09if (ret)
+=09=09=09goto hid_hw_init_fail;
+=09}
+
 =09if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
 =09=09ret =3D wtp_get_config(hidpp);
 =09=09if (ret)
--
2.23.0


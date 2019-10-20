Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13479DDC96
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 06:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfJTEns (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 00:43:48 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:21481 "EHLO
        mail-40135.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJTEns (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 00:43:48 -0400
Date:   Sun, 20 Oct 2019 04:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1571546624;
        bh=me06rsc5KXNlQ4iY9NIZI/enKgYjtNZr73xM+bjnrSM=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=Ae+uASa1gzFHwBDO6MMsmBdfe4Ogsb6RvWy+1pPFf12Wg2bAuRP9NYx0/4CGfmD43
         n5yJ9legDRb+X6r/Qors5cRuF3CUctOIQuZOuZZZZPPUbvL70w1COzXabKKU40VnDW
         cAPjLhguJNmHb1pu8IOSBPEtTwYwVk5fDYoUepzM=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v7 3/3] HID: logitech-hidpp: Support WirelessDeviceStatus connect events
Message-ID: <yqo4xUWK3dmAH59Oyn2JK3cV_xDNVaULp7MRQ0afuT1IDqOPRauLpjRiOaUnTgCNeHvOL_lIL_IHzg4zs6-cHfB3Cz0awCWe2mjvuchYWFk=@protonmail.com>
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

This patch allows hidpp_report_is_connect_event to support
WirelessDeviceStatus connect events.

The WirelessDeviceStatus feature index is stored in hidpp_device when
probed. The connect event's fap feature_index is compared against it if the
device supports it.

Thanks,
Mazin

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 39 ++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 19b315e4e91b..c8b23568d0b1 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -191,6 +191,8 @@ struct hidpp_device {

 =09struct hidpp_battery battery;
 =09struct hidpp_scroll_counter vertical_wheel_counter;
+
+=09u8 wireless_feature_index;
 };

 /* HID++ 1.0 error codes */
@@ -403,10 +405,13 @@ static inline bool hidpp_match_error(struct hidpp_rep=
ort *question,
 =09    (answer->fap.params[0] =3D=3D question->fap.funcindex_clientid);
 }

-static inline bool hidpp_report_is_connect_event(struct hidpp_report *repo=
rt)
+static inline bool hidpp_report_is_connect_event(struct hidpp_device *hidp=
p,
+=09=09struct hidpp_report *report)
 {
-=09return (report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
-=09=09(report->rap.sub_id =3D=3D 0x41);
+=09return (hidpp->wireless_feature_index &&
+=09=09(report->fap.feature_index =3D=3D hidpp->wireless_feature_index)) ||
+=09=09((report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
+=09=09(report->rap.sub_id =3D=3D 0x41));
 }

 /**
@@ -1283,6 +1288,24 @@ static int hidpp_battery_get_property(struct power_s=
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
@@ -3078,7 +3101,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_device =
*hidpp, u8 *data,
 =09=09}
 =09}

-=09if (unlikely(hidpp_report_is_connect_event(report))) {
+=09if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
 =09=09atomic_set(&hidpp->connected,
 =09=09=09=09!(report->rap.params[0] & (1 << 6)));
 =09=09if (schedule_work(&hidpp->work) =3D=3D 0)
@@ -3628,6 +3651,14 @@ static int hidpp_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)
 =09=09hidpp_overwrite_name(hdev);
 =09}

+=09if (connected && hidpp->protocol_major >=3D 2) {
+=09=09ret =3D hidpp_set_wireless_feature_index(hidpp);
+=09=09if (ret =3D=3D -ENOENT)
+=09=09=09hidpp->wireless_feature_index =3D 0;
+=09=09else if (ret)
+=09=09=09goto hid_hw_init_fail;
+=09}
+
 =09if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
 =09=09ret =3D wtp_get_config(hidpp);
 =09=09if (ret)
--
2.23.0


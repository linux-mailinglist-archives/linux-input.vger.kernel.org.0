Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A11B6382
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2019 14:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfIRMoq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Sep 2019 08:44:46 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:24043 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfIRMoq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Sep 2019 08:44:46 -0400
Date:   Wed, 18 Sep 2019 12:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1568810682;
        bh=cUx3cYCCkgFSSgHC4pPEf+wrE1uu0jHweDuACqVzhng=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=fgjg+qFEQY1tOlH2u5h7yO676vmGK2ENStxAEf8Fr7T+a/ZYTqxqcO4DHOWCmMffu
         x5+EzW9+gDeJyRIDULUfKHLkP5kG5x5lGHl8wXguT/Ig41ZqMZvpFIbbw5yqYz0Vjc
         L11WuGYu8Rx4zn84Zk6n8IILS13ErYWaEA3dHY+U=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH RESEND V2] HID: hid-logitech-hidpp: Implement support for some Bluetooth HID++ devices
Message-ID: <ATZsWjU_J53a3qyKgb8BWLXY7N7UqGilAA9eAyGhQSBUw2z30AwA8rpsdNFejxH4UvYxb6dsY8-jJknYfafTVWF4mMuVDGdtXki7_x7l77g=@protonmail.com>
Feedback-ID: 18B_FC5q-t32TXzMsVp9BgkgrdNH3iwklfW8WOrHrcxZA0WRj7JodCh5VXKxs6A3OaiHK0QNd8wi3SImKex8yQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thursday, September 12, 2019 10:40 PM, Mazin Rezk <mnrzk@protonmail.com>=
 wrote:

> This patch adds support the MX Anywhere 2, MX Anywhere 2S, MX Master, and
> MX Master 2S over Bluetooth to the hid-logitech-hidpp module. This patch =
also
> implements a foundation for other Bluetooth devices to be added to the mo=
dule.
>
> Changes include:
>
> 1.  Adding the device IDs for the aforementioned mice over Bluetooth (the=
se
> IDs have been copied from the libratbag device database). Their quirks ha=
ve
> been based on their DJ device counterparts.
> 2.  Adding an additional HIDPP_QUIRK_BLUETOOTH_MISSING_SHORT_ID as these
> devices do not support Short HID++ reports. This quirk causes short repor=
ts to
> be sent as long reports to the device and overrides the device validation=
 to
> only check if the long report descriptor exists. Without this quirk, thes=
e
> devices will fail the HID++ device validation.
>
> Note about these changes: I only own an MX Master (b01e) so I have not be=
en
> able to test this patch on other devices. However, I have also noticed th=
at
> the MX Master 2S over Bluetooth does not pass the original HID++ report
> descriptor tests which leads me to believe all MX Bluetooth LE devices ar=
e
> missing short report descriptors. Further testing with the other devices =
may
> be required.

In addition to the previous changes:

I recently noticed that the patch I previously submitted does not properly =
apply
and contains a bug that would cause the added devices not to properly parse
connection events.

The added Bluetooth devices do not support 0x41 connection events and inste=
ad
use feature 0x1d4b (WirelessDeviceStatus). HIDPP_QUIRK_WIRELESS_DEVICE_STAT=
US
causes hidpp_report_is_connect_event to check if the feature ID of the even=
t is
0x1d4b instead.

In order to avoid sending device reports while processing events, an array =
of
all feature IDs is created and stored in the hidpp_device when any HID++ 2.=
0
device is probed.

This array is created by calling FeatureSet (0x0001), getting the feature c=
ount,
and setting each feature index in the array to its corresponding feature.

Since these devices are both missing a short report and use WirelessDeviceS=
tatus,
I decided to call the quirk HIDPP_QUIRK_CLASS_BLUETOOTH and I added the add=
itional
quirks HIDPP_QUIRK_MISSING_SHORT_REPORTS and HIDPP_QUIRK_WIRELESS_DEVICE_ST=
ATUS
as aliases and potential catch-alls in the future.

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 152 ++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 0179f7ed77e5..3f40d53dcfa1 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -58,6 +58,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_CLASS_K400=09=09=09BIT(2)
 #define HIDPP_QUIRK_CLASS_G920=09=09=09BIT(3)
 #define HIDPP_QUIRK_CLASS_K750=09=09=09BIT(4)
+#define HIDPP_QUIRK_CLASS_BLUETOOTH=09=09BIT(5)

 /* bits 2..20 are reserved for classes */
 /* #define HIDPP_QUIRK_CONNECT_EVENTS=09=09BIT(21) disabled */
@@ -81,6 +82,10 @@ MODULE_PARM_DESC(disable_tap_to_click,
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2120 | \
 =09=09=09=09=09 HIDPP_QUIRK_HI_RES_SCROLL_X2121)

+/* Just an alias for now, may possibly be a catch-all in the future */
+#define HIDPP_QUIRK_MISSING_SHORT_REPORTS=09HIDPP_QUIRK_CLASS_BLUETOOTH
+#define HIDPP_QUIRK_WIRELESS_DEVICE_STATUS=09HIDPP_QUIRK_CLASS_BLUETOOTH
+
 #define HIDPP_QUIRK_DELAYED_INIT=09=09HIDPP_QUIRK_NO_HIDINPUT

 #define HIDPP_CAPABILITY_HIDPP10_BATTERY=09BIT(0)
@@ -186,6 +191,9 @@ struct hidpp_device {

 =09struct hidpp_battery battery;
 =09struct hidpp_scroll_counter vertical_wheel_counter;
+
+=09u16 *features;
+=09u8 feature_count;
 };

 /* HID++ 1.0 error codes */
@@ -340,6 +348,11 @@ static int hidpp_send_rap_command_sync(struct hidpp_de=
vice *hidpp_dev,
 =09struct hidpp_report *message;
 =09int ret, max_count;

+=09/* Force long reports on devices that do not support short reports */
+=09if (hidpp_dev->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS &&
+=09    report_id =3D=3D REPORT_ID_HIDPP_SHORT)
+=09=09report_id =3D REPORT_ID_HIDPP_LONG;
+
 =09switch (report_id) {
 =09case REPORT_ID_HIDPP_SHORT:
 =09=09max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
@@ -393,9 +406,22 @@ static inline bool hidpp_match_error(struct hidpp_repo=
rt *question,
 =09    (answer->fap.params[0] =3D=3D question->fap.funcindex_clientid);
 }

-static inline bool hidpp_report_is_connect_event(struct hidpp_report *repo=
rt)
+#define HIDPP_PAGE_WIRELESS_DEVICE_STATUS=09=090x1d4b
+
+static inline bool hidpp_report_is_connect_event(struct hidpp_device *hidp=
p,
+=09=09=09=09=09=09 struct hidpp_report *report)
 {
-=09return (report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
+=09if (hidpp->quirks & HIDPP_QUIRK_WIRELESS_DEVICE_STATUS) {
+=09=09/* If feature is invalid, skip array check */
+=09=09if (report->fap.feature_index > hidpp->feature_count)
+=09=09=09return false;
+
+=09=09return (hidpp->features[report->fap.feature_index] =3D=3D
+=09=09=09 HIDPP_PAGE_WIRELESS_DEVICE_STATUS);
+=09}
+
+=09return ((report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) ||
+=09=09(hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)) &&
 =09=09(report->rap.sub_id =3D=3D 0x41);
 }

@@ -901,6 +927,84 @@ static int hidpp_root_get_protocol_version(struct hidp=
p_device *hidpp)
 =09return 0;
 }

+/* -----------------------------------------------------------------------=
--- */
+/* 0x0001: FeatureSet                                                     =
    */
+/* -----------------------------------------------------------------------=
--- */
+
+#define HIDPP_PAGE_FEATURESET=09=09=09=090x0001
+
+#define CMD_FEATURESET_GET_COUNT=09=09=090x00
+#define CMD_FEATURESET_GET_FEATURE=09=09=090x11
+
+static int hidpp20_featureset_get_feature(struct hidpp_device *hidpp,
+=09u8 featureset_index, u8 feature_index, u16 *feature_id)
+{
+=09struct hidpp_report response;
+=09int ret;
+
+=09ret =3D hidpp_send_fap_command_sync(hidpp, featureset_index,
+=09=09CMD_FEATURESET_GET_FEATURE, &feature_index, 1, &response);
+
+=09if (ret)
+=09=09return ret;
+
+=09*feature_id =3D (response.fap.params[0] << 8) | response.fap.params[1];
+
+=09return ret;
+}
+
+static int hidpp20_featureset_get_count(struct hidpp_device *hidpp,
+=09u8 feature_index, u8 *count)
+{
+=09struct hidpp_report response;
+=09int ret;
+
+=09ret =3D hidpp_send_fap_command_sync(hidpp, feature_index,
+=09=09CMD_FEATURESET_GET_COUNT, NULL, 0, &response);
+
+=09if (ret)
+=09=09return ret;
+
+=09*count =3D response.fap.params[0];
+
+=09return ret;
+}
+
+static int hidpp20_get_features(struct hidpp_device *hidpp)
+{
+=09int ret;
+=09u8 featureset_index, featureset_type;
+=09u8 i;
+
+=09hidpp->feature_count =3D 0;
+
+=09ret =3D hidpp_root_get_feature(hidpp, HIDPP_PAGE_FEATURESET,
+=09=09=09=09     &featureset_index, &featureset_type);
+
+=09if (ret =3D=3D -ENOENT) {
+=09=09hid_warn(hidpp->hid_dev, "Unable to retrieve feature set.");
+=09=09return 0;
+=09}
+
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D hidpp20_featureset_get_count(hidpp, featureset_index,
+=09=09&hidpp->feature_count);
+
+=09if (ret)
+=09=09return ret;
+
+=09hidpp->features =3D devm_kzalloc(&hidpp->hid_dev->dev,
+=09=09=09hidpp->feature_count * sizeof(u16), GFP_KERNEL);
+
+=09for (i =3D 0; i < hidpp->feature_count && !ret; i++)
+=09=09ret =3D hidpp20_featureset_get_feature(hidpp, featureset_index,
+=09=09=09=09i, &(hidpp->features[i]));
+
+=09return ret;
+}
+
 /* -----------------------------------------------------------------------=
--- */
 /* 0x0005: GetDeviceNameType                                              =
    */
 /* -----------------------------------------------------------------------=
--- */
@@ -3068,7 +3172,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_device =
*hidpp, u8 *data,
 =09=09}
 =09}

-=09if (unlikely(hidpp_report_is_connect_event(report))) {
+=09if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
 =09=09atomic_set(&hidpp->connected,
 =09=09=09=09!(report->rap.params[0] & (1 << 6)));
 =09=09if (schedule_work(&hidpp->work) =3D=3D 0)
@@ -3482,6 +3586,12 @@ static bool hidpp_validate_report(struct hid_device =
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
@@ -3619,6 +3729,17 @@ static int hidpp_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)
 =09=09=09goto hid_hw_init_fail;
 =09}

+=09/* Cache feature indexes and IDs to check reports faster */
+=09if (hidpp->protocol_major >=3D 2) {
+=09=09if (hidpp20_get_features(hidpp)) {
+=09=09=09hid_err(hdev, "%s:hidpp20_get_features returned error\n",
+=09=09=09=09__func__);
+=09=09=09goto hid_hw_init_fail;
+=09=09}
+=09} else {
+=09=09hidpp->feature_count =3D 0;
+=09}
+
 =09hidpp_connect_event(hidpp);

 =09/* Reset the HID node state */
@@ -3773,6 +3894,31 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
 =09{ /* MX5500 keyboard over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 =09  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+=09{ /* MX Anywhere 2 mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09HIDPP_QUIRK_CLASS_BLUETOOTH },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
+=09{ /* MX Anywhere 2S mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
+=09{ /* MX Master mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
+=09{ /* MX Master 2S mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
+=09=09=09 HIDPP_QUIRK_CLASS_BLUETOOTH },
 =09{}
 };

--
2.23.0


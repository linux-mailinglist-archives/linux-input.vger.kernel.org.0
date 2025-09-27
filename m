Return-Path: <linux-input+bounces-15134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D2BA64FE
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 01:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F214A210A
	for <lists+linux-input@lfdr.de>; Sat, 27 Sep 2025 23:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4788A23BF9F;
	Sat, 27 Sep 2025 23:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="WHF8+u/C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9931991B6
	for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 23:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759017005; cv=none; b=S6//HreDA4QcQjFdA30GVn4OATl3crv8fNzJ9ksoggInn38Uimbq5yNV+rzxKSHjDDng1t9T37hz8DmofqjJyVUPLephK4sQDN/ZAiUrieicsgjKB9MTjnKWLFaOP0i2tiXIpbF8kTvinnmg45/cnt1K5unx4BfUYlunKjm8UEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759017005; c=relaxed/simple;
	bh=FSyKN0XrWZ/Jkwj1OEDQa8aaGplpe4C2rW30OczU1n0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u6iVye2LFL3OYzsM8aOy615iwHg4poMEwYcG7r69y4Ae+0dZhJLNezE62B/et7hj2hTEVut7CJwQkbGWUppZ1dPvW7qvTeUU3/T3ipbZL8Xv/pXsbXlvwcwR0i5Lvxjn5Burl6C7kEmZo6cWs47USACmbigEpHRf4dGVNblprvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=WHF8+u/C; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1759016992; x=1759276192;
	bh=BqrJ3n7RBohXWxqYFeQzU5c7BOmoRaIoXA7enFhu760=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WHF8+u/CKYt8wI+3OdZ9YydqcmizjfOmzLV4anO8EtWYwZdDGBTFXfBNG0sa9oWDN
	 l/DMWUTeXywljNZ+j4dXoz704QBNu9io/JupuoaMo+3DSSu9wXZsTSb7h+DgMitWjU
	 n0aziCaq251uzzF5c5ZqvuzY9G4TeQyoi2yPXF2UN6Og6U2XGTryAy7K77VxNfmaBQ
	 gh6wHXYjEd46ZgeacMk4cQIW6JMMkSZV+ULkGMQw9bPmOixr0TpterSK6FaxilFHL0
	 hb1KDyf/dcdbI73yYowICTfPXolqKgeeRDF0P4EaetQjEzYFIhmaeVbwkxmMRb32y7
	 usYCV0hlIgKoQ==
Date: Sat, 27 Sep 2025 23:49:45 +0000
To: jikos@kernel.org, stuart.a.hayhurst@gmail.com
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net, mavchatz@protonmail.com
Subject: [PATCH v5] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <20250927234834.2635483-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 54bfc3b78376980afe6de7355e79258d1f13c9db
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This lightspeed receiver uses 13 byte mouse reports without an ID.
There are 5 additional vendor defined bytes appended to the report.
The workaround for such cases has been adjusted to handle these larger
reports.

The keyboard reports have a distinct layout with differing minimums and
maximums. Additionally, the LED reports now require a report ID of 1.

New keyboard and mouse descriptors have been added to reflect these
changes.

The devices attached to this receiver now report the status of their
battery in wireless mode, libratbag communicates with them and they can
be configured with Piper.

Fixes: 9d1bd9346241 ("HID: logitech-dj: Add support for a new lightspeed re=
ceiver iteration")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218094
Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
V4 -> V5: Added report ID 1 to LED reports, corrected MAX_RDESC_SIZE
V3 -> V4: Rebased and renamed dev id define from 1_2 to 1_3,
          gaming_kbd_descriptor to kbd_lightspeed_1_3_descriptor
V2 -> V3: Fixed regression which broke keyboard related input
V1 -> V2: Addressed review comment for commit message

I investigated "hidpp_root_get_protocol_version: received protocol error
0x08" and it occurs only when the device is in a low power state. If the
mouse is being moved constantly while the receiver is plugged in, this
message is not printed. When comparing the behaviour with a previous
receiver (046d:c539) with a G403, it behaves the exact same way, but it
returns 0x09 (HIDPP_ERROR_RESOURCE_ERROR), disconnecting the device
silently, instead of 0x08 (HIDPP_ERROR_UNKNOWN_DEVICE).

I will be sending a patch for that in the near future, but for now it
does not cause any issues as the end result is the same.

 drivers/hid/hid-ids.h         |   1 +
 drivers/hid/hid-logitech-dj.c | 118 ++++++++++++++++++++++++++++++++--
 2 files changed, 112 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 149798754570..25d52024f729 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -911,6 +911,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1=090xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1=090xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2=090xc543
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_3=090xc547
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY=090xc53a
 #define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER=090xc548
 #define USB_DEVICE_ID_SPACETRAVELLER=090xc623
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index cce54dd9884a..d66f4807311a 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -116,6 +116,7 @@ enum recvr_type {
 =09recvr_type_dj,
 =09recvr_type_hidpp,
 =09recvr_type_gaming_hidpp,
+=09recvr_type_gaming_hidpp_ls_1_3,
 =09recvr_type_mouse_only,
 =09recvr_type_27mhz,
 =09recvr_type_bluetooth,
@@ -211,6 +212,44 @@ static const char kbd_descriptor[] =3D {
 =090xC0
 };
=20
+/* Gaming Keyboard descriptor (1) */
+static const char kbd_lightspeed_1_3_descriptor[] =3D {
+=090x05, 0x01,=09=09/* Usage Page (Generic Desktop) */
+=090x09, 0x06,=09=09/* Usage (Keyboard)             */
+=090xA1, 0x01,=09=09/* Collection (Application)     */
+=090x85, 0x01,=09=09/*   Report ID (1)              */
+=090x05, 0x07,=09=09/*   Usage Page (Kbrd/Keypad)   */
+=090x19, 0xE0,=09=09/*   Usage Minimum (0xE0)       */
+=090x29, 0xE7,=09=09/*   Usage Maximum (0xE7)       */
+=090x15, 0x00,=09=09/*   Logical Minimum (0)        */
+=090x25, 0x01,=09=09/*   Logical Maximum (1)        */
+=090x75, 0x01,=09=09/*   Report Size (1)            */
+=090x95, 0x08,=09=09/*   Report Count (8)           */
+=090x81, 0x02,=09=09/*   Input (Data,Var)           */
+=090x95, 0x70,=09=09/*   Report Count (112)         */
+=090x19, 0x04,=09=09/*   Usage Minimum (0x04)       */
+=090x29, 0x73,=09=09/*   Usage Maximum (0x73)       */
+=090x81, 0x02,=09=09/*   Input (Data,Var,Abs)       */
+=090x95, 0x05,=09=09/*   Report Count (5)           */
+=090x19, 0x87,=09=09/*   Usage Minimum (0x87)       */
+=090x29, 0x8B,=09=09/*   Usage Maximum (0x8B)       */
+=090x81, 0x02,=09=09/*   Input (Data,Var,Abs)       */
+=090x95, 0x03,=09=09/*   Report Count (3)           */
+=090x19, 0x90,=09=09/*   Usage Minimum (0x90)       */
+=090x29, 0x92,=09=09/*   Usage Maximum (0x92)       */
+=090x81, 0x02,=09=09/*   Input (Data,Var,Abs)       */
+=090x95, 0x05,=09=09/*   Report Count (5)           */
+=090x85, 0x0E,=09=09/*   Report ID (14)             */
+=090x05, 0x08,=09=09/*   Usage Page (LEDs)          */
+=090x19, 0x01,=09=09/*   Usage Minimum (Num Lock)   */
+=090x29, 0x05,=09=09/*   Usage Maximum (Kana)       */
+=090x91, 0x02,=09=09/*   Output (Data,Var,Abs)      */
+=090x95, 0x01,=09=09/*   Report Count (1)           */
+=090x75, 0x03,=09=09/*   Report Size (3)            */
+=090x91, 0x03,=09=09/*   Output (Const,Var,Abs)     */
+=090xC0,=09=09=09/* End Collection               */
+};
+
 /* Mouse descriptor (2)     */
 static const char mse_descriptor[] =3D {
 =090x05, 0x01,=09=09/*  USAGE_PAGE (Generic Desktop)        */
@@ -415,6 +454,51 @@ static const char mse_high_res_descriptor[] =3D {
 =090xC0,=09=09=09/*  END_COLLECTION                      */
 };
=20
+/* Gaming Mouse descriptor with vendor data (2) */
+static const char mse_high_res_ls_1_3_descriptor[] =3D {
+=090x05, 0x01,=09=09/* Usage Page (Generic Desktop)         */
+=090x09, 0x02,=09=09/* Usage (Mouse)                        */
+=090xA1, 0x01,=09=09/* Collection (Application)             */
+=090x85, 0x02,=09=09/*   Report ID (2)                      */
+=090x09, 0x01,=09=09/*   Usage (Pointer)                    */
+=090xA1, 0x00,=09=09/*   Collection (Physical)              */
+=090x95, 0x10,=09=09/*     Report Count (16)                */
+=090x75, 0x01,=09=09/*     Report Size (1)                  */
+=090x15, 0x00,=09=09/*     Logical Minimum (0)              */
+=090x25, 0x01,=09=09/*     Logical Maximum (1)              */
+=090x05, 0x09,=09=09/*     Usage Page (Button)              */
+=090x19, 0x01,=09=09/*     Usage Minimum (0x01)             */
+=090x29, 0x10,=09=09/*     Usage Maximum (0x10)             */
+=090x81, 0x02,=09=09/*     Input (Data,Var,Abs)             */
+=090x95, 0x02,=09=09/*     Report Count (2)                 */
+=090x75, 0x10,=09=09/*     Report Size (16)                 */
+=090x16, 0x01, 0x80,=09/*     Logical Minimum (-32767)         */
+=090x26, 0xFF, 0x7F,=09/*     Logical Maximum (32767)          */
+=090x05, 0x01,=09=09/*     Usage Page (Generic Desktop)     */
+=090x09, 0x30,=09=09/*     Usage (X)                        */
+=090x09, 0x31,=09=09/*     Usage (Y)                        */
+=090x81, 0x06,=09=09/*     Input (Data,Var,Rel)             */
+=090x95, 0x01,=09=09/*     Report Count (1)                 */
+=090x75, 0x08,=09=09/*     Report Size (8)                  */
+=090x15, 0x81,=09=09/*     Logical Minimum (-127)           */
+=090x25, 0x7F,=09=09/*     Logical Maximum (127)            */
+=090x09, 0x38,=09=09/*     Usage (Wheel)                    */
+=090x81, 0x06,=09=09/*     Input (Data,Var,Rel)             */
+=090x95, 0x01,=09=09/*     Report Count (1)                 */
+=090x05, 0x0C,=09=09/*     Usage Page (Consumer)            */
+=090x0A, 0x38, 0x02,=09/*     Usage (AC Pan)                   */
+=090x81, 0x06,=09=09/*     Input (Data,Var,Rel)             */
+=090xC0,=09=09=09/*   End Collection                     */
+=090x06, 0x00, 0xFF,=09/*   Usage Page (Vendor Defined 0xFF00) */
+=090x09, 0xF1,=09=09/*   Usage (0xF1)                       */
+=090x75, 0x08,=09=09/*   Report Size (8)                    */
+=090x95, 0x05,=09=09/*   Report Count (5)                   */
+=090x15, 0x00,=09=09/*   Logical Minimum (0)                */
+=090x26, 0xFF, 0x00,=09/*   Logical Maximum (255)              */
+=090x81, 0x00,=09=09/*   Input (Data,Array,Abs)             */
+=090xC0,=09=09=09/* End Collection                       */
+};
+
 /* Consumer Control descriptor (3) */
 static const char consumer_descriptor[] =3D {
 =090x05, 0x0C,=09=09/* USAGE_PAGE (Consumer Devices)       */
@@ -520,9 +604,9 @@ static const char hidpp_descriptor[] =3D {
 /* Maximum size of all defined hid reports in bytes (including report id) =
*/
 #define MAX_REPORT_SIZE 8
=20
-/* Make sure all descriptors are present here */
+/* Make sure the largest of each descriptor type is present here */
 #define MAX_RDESC_SIZE=09=09=09=09\
-=09(sizeof(kbd_descriptor) +=09=09\
+=09(sizeof(kbd_lightspeed_1_3_descriptor) +\
 =09 sizeof(mse_bluetooth_descriptor) +=09\
 =09 sizeof(mse5_bluetooth_descriptor) +=09\
 =09 sizeof(consumer_descriptor) +=09=09\
@@ -1374,12 +1458,19 @@ static int logi_dj_ll_raw_request(struct hid_device=
 *hid,
 =09=09return -EINVAL;
=20
 =09if (djrcv_dev->type !=3D recvr_type_dj && count >=3D 2) {
+=09=09unsigned char led_report_id =3D 0;
+
 =09=09if (!djrcv_dev->keyboard) {
 =09=09=09hid_warn(hid, "Received REPORT_TYPE_LEDS request before the keybo=
ard interface was enumerated\n");
 =09=09=09return 0;
 =09=09}
+
+=09=09/* This Lightspeed receiver expects LED reports with report ID 1 */
+=09=09if (djrcv_dev->type =3D=3D recvr_type_gaming_hidpp_ls_1_3)
+=09=09=09led_report_id =3D 1;
+
 =09=09/* usbhid overrides the report ID and ignores the first byte */
-=09=09return hid_hw_raw_request(djrcv_dev->keyboard, 0, buf, count,
+=09=09return hid_hw_raw_request(djrcv_dev->keyboard, led_report_id, buf, c=
ount,
 =09=09=09=09=09  report_type, reqtype);
 =09}
=20
@@ -1426,7 +1517,11 @@ static int logi_dj_ll_parse(struct hid_device *hid)
 =09if (djdev->reports_supported & STD_KEYBOARD) {
 =09=09dbg_hid("%s: sending a kbd descriptor, reports_supported: %llx\n",
 =09=09=09__func__, djdev->reports_supported);
-=09=09rdcat(rdesc, &rsize, kbd_descriptor, sizeof(kbd_descriptor));
+=09=09if (djdev->dj_receiver_dev->type =3D=3D recvr_type_gaming_hidpp_ls_1=
_3)
+=09=09=09rdcat(rdesc, &rsize, kbd_lightspeed_1_3_descriptor,
+=09=09=09      sizeof(kbd_lightspeed_1_3_descriptor));
+=09=09else
+=09=09=09rdcat(rdesc, &rsize, kbd_descriptor, sizeof(kbd_descriptor));
 =09}
=20
 =09if (djdev->reports_supported & STD_MOUSE) {
@@ -1436,6 +1531,9 @@ static int logi_dj_ll_parse(struct hid_device *hid)
 =09=09    djdev->dj_receiver_dev->type =3D=3D recvr_type_mouse_only)
 =09=09=09rdcat(rdesc, &rsize, mse_high_res_descriptor,
 =09=09=09      sizeof(mse_high_res_descriptor));
+=09=09else if (djdev->dj_receiver_dev->type =3D=3D recvr_type_gaming_hidpp=
_ls_1_3)
+=09=09=09rdcat(rdesc, &rsize, mse_high_res_ls_1_3_descriptor,
+=09=09=09      sizeof(mse_high_res_ls_1_3_descriptor));
 =09=09else if (djdev->dj_receiver_dev->type =3D=3D recvr_type_27mhz)
 =09=09=09rdcat(rdesc, &rsize, mse_27mhz_descriptor,
 =09=09=09      sizeof(mse_27mhz_descriptor));
@@ -1695,11 +1793,12 @@ static int logi_dj_raw_event(struct hid_device *hde=
v,
 =09=09}
 =09=09/*
 =09=09 * Mouse-only receivers send unnumbered mouse data. The 27 MHz
-=09=09 * receiver uses 6 byte packets, the nano receiver 8 bytes.
+=09=09 * receiver uses 6 byte packets, the nano receiver 8 bytes,
+=09=09 * the lightspeed receiver (Pro X Superlight) 13 bytes.
 =09=09 */
 =09=09if (djrcv_dev->unnumbered_application =3D=3D HID_GD_MOUSE &&
-=09=09    size <=3D 8) {
-=09=09=09u8 mouse_report[9];
+=09=09    size <=3D 13){
+=09=09=09u8 mouse_report[14];
=20
 =09=09=09/* Prepend report id */
 =09=09=09mouse_report[0] =3D REPORT_TYPE_MOUSE;
@@ -1776,6 +1875,7 @@ static int logi_dj_probe(struct hid_device *hdev,
 =09case recvr_type_dj:=09=09no_dj_interfaces =3D 3; break;
 =09case recvr_type_hidpp:=09=09no_dj_interfaces =3D 2; break;
 =09case recvr_type_gaming_hidpp:=09no_dj_interfaces =3D 3; break;
+=09case recvr_type_gaming_hidpp_ls_1_3: no_dj_interfaces =3D 3; break;
 =09case recvr_type_mouse_only:=09no_dj_interfaces =3D 2; break;
 =09case recvr_type_27mhz:=09=09no_dj_interfaces =3D 2; break;
 =09case recvr_type_bluetooth:=09no_dj_interfaces =3D 2; break;
@@ -1987,6 +2087,10 @@ static const struct hid_device_id logi_dj_receivers[=
] =3D {
 =09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 =09=09USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2),
 =09 .driver_data =3D recvr_type_gaming_hidpp},
+=09{ /* Logitech lightspeed receiver (0xc547) */
+=09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+=09=09USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_3),
+=09 .driver_data =3D recvr_type_gaming_hidpp_ls_1_3},
=20
 =09{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 =09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER)=
,
--=20
2.43.0




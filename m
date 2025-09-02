Return-Path: <linux-input+bounces-14432-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262AEB40D48
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB5DE5483A9
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 18:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A878296BDD;
	Tue,  2 Sep 2025 18:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="BvWVF48x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF1EADC
	for <linux-input@vger.kernel.org>; Tue,  2 Sep 2025 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756838638; cv=none; b=sObGBW/x/tDZJ/P11Y+psSX5YCE2RHmtVBJ3/hQa81ZH5Zq3L6/gm1LojpaumIJBxHB45cMcUzr/s/0nhQxTAf00MHUOEJ25ZAumeBpYzcTAxV5tbark/IjbZHeear67X097bKvqhuGH0sYupLoqED3cyk3c/bwcuSUtPwT2CNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756838638; c=relaxed/simple;
	bh=2OhKNESWZbOo4+92Soj4VHsLz1uK0Ymn9fAjns/1eCk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pocigse1WrksQ1XfiUTYxQmwQYWNP3C1H42mPoVtO6cLSJNIrBBZ5Breh8bVLmGHu9rmFULnnl/jtgaQrkjuDyjFDsrf32iXNynI44KlqBbRXU58C5qghI5XgUx5b5KSrVB9I6H40W/XiT8lDflKZTG9hSkP60muHZxrDt4DBLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=BvWVF48x; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1756838633; x=1757097833;
	bh=9gjCr8+5eEsoWNbri2Q3Jk4DPWmxeMT7NFx09ZTMqTY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BvWVF48x700xOlWy2CSH78aPaxqG+mt6s4HCLofwCPiKgbXkziqRzZXzUSu4F9cjr
	 aoFzYYiLTI2BGATUXz6n1Cha7i3ZlsHjU6+cvwUA+cwayNPlZoANYgU7U/tVrKMSv+
	 nqgLMesLv6dAivRmoMr2AGkh5wWalCrfO0CwgrvHLJbHNX/H+7nKUV7MTwlrfd/831
	 OIXfgxk+eykeq4K4qGFD2+H4LRAUs8RDH9D60dPjeIg7LR/LpBKkSA615kp2fonu2f
	 V0gI7BEIRQNIBDloz7Er1Gpeder4tVnHmVOkvL4MVk8u4I7twLKV4UKzmog5TP+ElL
	 KwV8z94/XvjCw==
Date: Tue, 02 Sep 2025 18:43:46 +0000
To: jikos@kernel.org
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net, stuart.a.hayhurst@gmail.com, mavchatz@protonmail.com
Subject: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <20250902184128.4100275-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: e02624b469c1783df14af424105914f3806dd1ef
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The lightspeed receiver for the Pro X Superlight uses 13 byte mouse reports
without a report id. The workaround for such cases has been adjusted to
handle these larger packets.

The device now reports the status of its battery in wireless mode and
libratbag now recognizes the device and it can be configured with Piper.

This receiver has new descriptors, which have been added. The mouse
descriptor has 5 extra vendor defined bytes at the end, while the keyboard
one has a different report layout and minimums/maximums. As such, mice
with key press macros and keyboards that use this receiver misbehave
without them.

Fixes: 9d1bd9346241 ("HID: logitech-dj: Add support for a new lightspeed re=
ceiver iteration")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218094
Link: https://lore.kernel.org/r/CAOEevLOrTSugnLePJwpcqx2_AacNbBxFZDTqp0Qm_j=
jVpWKgFQ@mail.gmail.com/
Link: https://lore.kernel.org/r/6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.=
com/
Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
V3 -> V4: Rebased and renamed dev id define from 1_2 to 1_3,
          gaming_kbd_descriptor to kbd_lightspeed_1_3_descriptor
V2 -> V3: Fixed regression which broke keyboard related input
V1 -> V2: Addressed review comment for commit message

 drivers/hid/hid-ids.h         |   1 +
 drivers/hid/hid-logitech-dj.c | 106 ++++++++++++++++++++++++++++++++--
 2 files changed, 103 insertions(+), 4 deletions(-)

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
index cce54dd9884a..00a975b70f59 100644
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
@@ -211,6 +212,45 @@ static const char kbd_descriptor[] =3D {
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
+=090x95, 0x05,=09=09/*   Report Count (5)           */
+=090x05, 0x08,=09=09/*   Usage Page (LEDs)          */
+=090x19, 0x01,=09=09/*   Usage Minimum (Num Lock)   */
+=090x29, 0x05,=09=09/*   Usage Maximum (Kana)       */
+=090x91, 0x02,=09=09/*   Output (Data,Var,Abs)      */
+=090x95, 0x01,=09=09/*   Report Count (1)           */
+=090x75, 0x03,=09=09/*   Report Size (3)            */
+=090x91, 0x03,=09=09/*   Output (Const,Var,Abs)     */
+=090x95, 0x70,=09=09/*   Report Count (112)         */
+=090x75, 0x01,=09=09/*   Report Size (1)            */
+=090x05, 0x07,=09=09/*   Usage Page (Kbrd/Keypad)   */
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
+=090xC0,=09=09=09/* End Collection               */
+};
+
 /* Mouse descriptor (2)     */
 static const char mse_descriptor[] =3D {
 =090x05, 0x01,=09=09/*  USAGE_PAGE (Generic Desktop)        */
@@ -415,6 +455,51 @@ static const char mse_high_res_descriptor[] =3D {
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
@@ -1426,7 +1511,11 @@ static int logi_dj_ll_parse(struct hid_device *hid)
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
@@ -1436,6 +1525,9 @@ static int logi_dj_ll_parse(struct hid_device *hid)
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
@@ -1695,11 +1787,12 @@ static int logi_dj_raw_event(struct hid_device *hde=
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
@@ -1776,6 +1869,7 @@ static int logi_dj_probe(struct hid_device *hdev,
 =09case recvr_type_dj:=09=09no_dj_interfaces =3D 3; break;
 =09case recvr_type_hidpp:=09=09no_dj_interfaces =3D 2; break;
 =09case recvr_type_gaming_hidpp:=09no_dj_interfaces =3D 3; break;
+=09case recvr_type_gaming_hidpp_ls_1_3: no_dj_interfaces =3D 3; break;
 =09case recvr_type_mouse_only:=09no_dj_interfaces =3D 2; break;
 =09case recvr_type_27mhz:=09=09no_dj_interfaces =3D 2; break;
 =09case recvr_type_bluetooth:=09no_dj_interfaces =3D 2; break;
@@ -1987,6 +2081,10 @@ static const struct hid_device_id logi_dj_receivers[=
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




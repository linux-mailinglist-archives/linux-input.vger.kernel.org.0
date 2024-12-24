Return-Path: <linux-input+bounces-8755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D579FBA17
	for <lists+linux-input@lfdr.de>; Tue, 24 Dec 2024 08:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA53C161EDA
	for <lists+linux-input@lfdr.de>; Tue, 24 Dec 2024 07:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECD317B502;
	Tue, 24 Dec 2024 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="Cpwua8C7"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F417D355
	for <linux-input@vger.kernel.org>; Tue, 24 Dec 2024 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735024125; cv=none; b=ZE1pW34dryAwy/h8AC99isROpd7etcBzZpw0tH6o2s9Rzvlc4qAstmHBvwxHA75wXO0J8dO9hDgAZRcO0nIkdgtbGMq+w/VqqS1a1GpxzSMxWU4CJ/vs+mHdGUz9PNv/m7rVNIkDA7sW6ayDrDXKc8ISz94tcwr9kKH5XQSJSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735024125; c=relaxed/simple;
	bh=kuJVk3/a7NDz6VEw3JeqK372To5Da3c0uqahh4Wv2K4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:content-type; b=ZsB/cmKdUxfbXzWpKC4bOg6Tdl+F3m0pVtrqngDEoonSlwaIWwmJiLzu8a3aRRQ575COrt/DG2NyxgJ8aQyzTfMPsxGK2EtpJIo+UWLUZjdLS17XIxBKGTwDQ3JZtMcMEvhvRvhRttgsSTxzVIKw/eTtshgqTS6jUux0Fmnck9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=Cpwua8C7; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1735024122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rA1oPMPUmFSS3w9jlWQOYQD06roC5BrwaE0cWo6yF6M=;
	b=Cpwua8C7YxNAL3JwBYYnwca+P7JkCJUYmu5sDHwtOstQOSaHlRFWIqjn9Utrtil2959mcn
	/LO8hLeZEnbVivqoUKZhUdt4gCnHfupCWXSeYL/R8xKBmXoFmtNfceNhch69vrk4m1C/k9
	3gQBu0KJrWxD+k9TmOuoJ8QUgXFSb50=
Received: from g8t13016g.inc.hp.com (hpi-bastion.austin2.mail.core.hp.com
 [15.72.64.134]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-S7dmcqc7Pf-GbAxIMhYF0w-1; Tue, 24 Dec 2024 02:08:41 -0500
X-MC-Unique: S7dmcqc7Pf-GbAxIMhYF0w-1
X-Mimecast-MFC-AGG-ID: S7dmcqc7Pf-GbAxIMhYF0w
Received: from g7t16458g.inc.hpicorp.net (g7t16458g.inc.hpicorp.net [15.63.18.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by g8t13016g.inc.hp.com (Postfix) with ESMTPS id 87DDB6000ABE;
	Tue, 24 Dec 2024 07:08:38 +0000 (UTC)
Received: from mail.hp.com (unknown [15.32.134.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by g7t16458g.inc.hpicorp.net (Postfix) with ESMTPS id AC54C60000A8;
	Tue, 24 Dec 2024 07:08:36 +0000 (UTC)
Received: from cdc-linux-buildsrv17.. (localhost [127.0.0.1])
	by mail.hp.com (Postfix) with ESMTP id 22EF7A42BAA;
	Tue, 24 Dec 2024 14:56:39 +0800 (CST)
From: Wade Wang <wade.wang@hp.com>
To: jikos@kernel.org,
	tiwai@suse.com,
	bentiss@kernel.org,
	perex@perex.cz,
	linuxhid@cosmicgizmosystems.com
Cc: wade.wang@hp.com,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] HID: hid-plantronics: Add mic mute mapping and generalize quirks
Date: Tue, 24 Dec 2024 14:56:35 +0800
Message-Id: <20241224065636.1870713-1-wade.wang@hp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XYzdB2CHAz1a8DlL9Zp0dxCLz3HX1eoKKDPmCRRd7VI_1735024118
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true

From: Terry Junge <linuxhid@cosmicgizmosystems.com>

Add mapping for headset mute key events.

Remove PLT_QUIRK_DOUBLE_VOLUME_KEYS quirk and made it generic.
The quirk logic did not keep track of the actual previous key
so any key event occurring in less than or equal to 5ms was ignored.

Remove PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS quirk.
It had the same logic issue as the double key quirk and was actually
masking the as designed behavior of most of the headsets.
It's occurrence should be minimized with the ALSA control naming
quirk that is part of the patch set.

Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
Signed-off-by: Wade Wang <wade.wang@hp.com>
Cc: stable@vger.kernel.org
---
V1 -> V2: Optimize out 2 macros - no functional changes

 drivers/hid/hid-plantronics.c | 144 ++++++++++++++++------------------
 1 file changed, 67 insertions(+), 77 deletions(-)

diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index 25cfd964dc25..acb9eb18f7cc 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -6,9 +6,6 @@
  *  Copyright (c) 2015-2018 Terry Junge <terry.junge@plantronics.com>
  */
=20
-/*
- */
-
 #include "hid-ids.h"
=20
 #include <linux/hid.h>
@@ -23,30 +20,28 @@
=20
 #define PLT_VOL_UP=09=090x00b1
 #define PLT_VOL_DOWN=09=090x00b2
+#define PLT_MIC_MUTE=09=090x00b5
=20
 #define PLT1_VOL_UP=09=09(PLT_HID_1_0_PAGE | PLT_VOL_UP)
 #define PLT1_VOL_DOWN=09=09(PLT_HID_1_0_PAGE | PLT_VOL_DOWN)
+#define PLT1_MIC_MUTE=09=09(PLT_HID_1_0_PAGE | PLT_MIC_MUTE)
 #define PLT2_VOL_UP=09=09(PLT_HID_2_0_PAGE | PLT_VOL_UP)
 #define PLT2_VOL_DOWN=09=09(PLT_HID_2_0_PAGE | PLT_VOL_DOWN)
+#define PLT2_MIC_MUTE=09=09(PLT_HID_2_0_PAGE | PLT_MIC_MUTE)
+#define HID_TELEPHONY_MUTE=09(HID_UP_TELEPHONY | 0x2f)
+#define HID_CONSUMER_MUTE=09(HID_UP_CONSUMER | 0xe2)
=20
 #define PLT_DA60=09=090xda60
 #define PLT_BT300_MIN=09=090x0413
 #define PLT_BT300_MAX=09=090x0418
=20
-
-#define PLT_ALLOW_CONSUMER (field->application =3D=3D HID_CP_CONSUMERCONTR=
OL && \
-=09=09=09    (usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CONSUMER)
-
-#define PLT_QUIRK_DOUBLE_VOLUME_KEYS BIT(0)
-#define PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS BIT(1)
-
 #define PLT_DOUBLE_KEY_TIMEOUT 5 /* ms */
-#define PLT_FOLLOWED_OPPOSITE_KEY_TIMEOUT 220 /* ms */
=20
 struct plt_drv_data {
 =09unsigned long device_type;
-=09unsigned long last_volume_key_ts;
-=09u32 quirks;
+=09unsigned long last_key_ts;
+=09unsigned long double_key_to;
+=09__u16 last_key;
 };
=20
 static int plantronics_input_mapping(struct hid_device *hdev,
@@ -58,34 +53,43 @@ static int plantronics_input_mapping(struct hid_device =
*hdev,
 =09unsigned short mapped_key;
 =09struct plt_drv_data *drv_data =3D hid_get_drvdata(hdev);
 =09unsigned long plt_type =3D drv_data->device_type;
+=09int allow_mute =3D usage->hid =3D=3D HID_TELEPHONY_MUTE;
+=09int allow_consumer =3D field->application =3D=3D HID_CP_CONSUMERCONTROL=
 &&
+=09=09=09(usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CONSUMER &&
+=09=09=09usage->hid !=3D HID_CONSUMER_MUTE;
=20
 =09/* special case for PTT products */
 =09if (field->application =3D=3D HID_GD_JOYSTICK)
 =09=09goto defaulted;
=20
-=09/* handle volume up/down mapping */
 =09/* non-standard types or multi-HID interfaces - plt_type is PID */
 =09if (!(plt_type & HID_USAGE_PAGE)) {
 =09=09switch (plt_type) {
 =09=09case PLT_DA60:
-=09=09=09if (PLT_ALLOW_CONSUMER)
+=09=09=09if (allow_consumer)
 =09=09=09=09goto defaulted;
-=09=09=09goto ignored;
+=09=09=09if (usage->hid =3D=3D HID_CONSUMER_MUTE) {
+=09=09=09=09mapped_key =3D KEY_MICMUTE;
+=09=09=09=09goto mapped;
+=09=09=09}
+=09=09=09break;
 =09=09default:
-=09=09=09if (PLT_ALLOW_CONSUMER)
+=09=09=09if (allow_consumer || allow_mute)
 =09=09=09=09goto defaulted;
 =09=09}
+=09=09goto ignored;
 =09}
-=09/* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
-=09/* 'basic telephony compliant' - allow default consumer page map */
-=09else if ((plt_type & HID_USAGE) >=3D PLT_BASIC_TELEPHONY &&
-=09=09 (plt_type & HID_USAGE) !=3D PLT_BASIC_EXCEPTION) {
-=09=09if (PLT_ALLOW_CONSUMER)
-=09=09=09goto defaulted;
-=09}
-=09/* not 'basic telephony' - apply legacy mapping */
-=09/* only map if the field is in the device's primary vendor page */
-=09else if (!((field->application ^ plt_type) & HID_USAGE_PAGE)) {
+
+=09/* handle standard consumer control mapping */
+=09/* and standard telephony mic mute mapping */
+=09if (allow_consumer || allow_mute)
+=09=09goto defaulted;
+
+=09/* handle vendor unique types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
+=09/* if not 'basic telephony compliant' - map vendor unique controls */
+=09if (!((plt_type & HID_USAGE) >=3D PLT_BASIC_TELEPHONY &&
+=09      (plt_type & HID_USAGE) !=3D PLT_BASIC_EXCEPTION) &&
+=09      !((field->application ^ plt_type) & HID_USAGE_PAGE))
 =09=09switch (usage->hid) {
 =09=09case PLT1_VOL_UP:
 =09=09case PLT2_VOL_UP:
@@ -95,8 +99,11 @@ static int plantronics_input_mapping(struct hid_device *=
hdev,
 =09=09case PLT2_VOL_DOWN:
 =09=09=09mapped_key =3D KEY_VOLUMEDOWN;
 =09=09=09goto mapped;
+=09=09case PLT1_MIC_MUTE:
+=09=09case PLT2_MIC_MUTE:
+=09=09=09mapped_key =3D KEY_MICMUTE;
+=09=09=09goto mapped;
 =09=09}
-=09}
=20
 /*
  * Future mapping of call control or other usages,
@@ -105,6 +112,8 @@ static int plantronics_input_mapping(struct hid_device =
*hdev,
  */
=20
 ignored:
+=09hid_dbg(hdev, "usage: %08x (appl: %08x) - ignored\n",
+=09=09usage->hid, field->application);
 =09return -1;
=20
 defaulted:
@@ -123,38 +132,26 @@ static int plantronics_event(struct hid_device *hdev,=
 struct hid_field *field,
 =09=09=09     struct hid_usage *usage, __s32 value)
 {
 =09struct plt_drv_data *drv_data =3D hid_get_drvdata(hdev);
+=09unsigned long prev_tsto, cur_ts;
+=09__u16 prev_key, cur_key;
=20
-=09if (drv_data->quirks & PLT_QUIRK_DOUBLE_VOLUME_KEYS) {
-=09=09unsigned long prev_ts, cur_ts;
+=09/* Usages are filtered in plantronics_usages. */
=20
-=09=09/* Usages are filtered in plantronics_usages. */
+=09/* HZ too low for ms resolution - double key detection disabled */
+=09/* or it is a key release - handle key presses only. */
+=09if (!drv_data->double_key_to || !value)
+=09=09return 0;
=20
-=09=09if (!value) /* Handle key presses only. */
-=09=09=09return 0;
+=09prev_tsto =3D drv_data->last_key_ts + drv_data->double_key_to;
+=09cur_ts =3D drv_data->last_key_ts =3D jiffies;
+=09prev_key =3D drv_data->last_key;
+=09cur_key =3D drv_data->last_key =3D usage->code;
=20
-=09=09prev_ts =3D drv_data->last_volume_key_ts;
-=09=09cur_ts =3D jiffies;
-=09=09if (jiffies_to_msecs(cur_ts - prev_ts) <=3D PLT_DOUBLE_KEY_TIMEOUT)
-=09=09=09return 1; /* Ignore the repeated key. */
-
-=09=09drv_data->last_volume_key_ts =3D cur_ts;
+=09/* If the same key occurs in <=3D double_key_to -- ignore it */
+=09if (prev_key =3D=3D cur_key && time_before_eq(cur_ts, prev_tsto)) {
+=09=09hid_dbg(hdev, "double key %d ignored\n", cur_key);
+=09=09return 1; /* Ignore the repeated key. */
 =09}
-=09if (drv_data->quirks & PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS) {
-=09=09unsigned long prev_ts, cur_ts;
-
-=09=09/* Usages are filtered in plantronics_usages. */
-
-=09=09if (!value) /* Handle key presses only. */
-=09=09=09return 0;
-
-=09=09prev_ts =3D drv_data->last_volume_key_ts;
-=09=09cur_ts =3D jiffies;
-=09=09if (jiffies_to_msecs(cur_ts - prev_ts) <=3D PLT_FOLLOWED_OPPOSITE_KE=
Y_TIMEOUT)
-=09=09=09return 1; /* Ignore the followed opposite volume key. */
-
-=09=09drv_data->last_volume_key_ts =3D cur_ts;
-=09}
-
 =09return 0;
 }
=20
@@ -196,12 +193,16 @@ static int plantronics_probe(struct hid_device *hdev,
 =09ret =3D hid_parse(hdev);
 =09if (ret) {
 =09=09hid_err(hdev, "parse failed\n");
-=09=09goto err;
+=09=09return ret;
 =09}
=20
 =09drv_data->device_type =3D plantronics_device_type(hdev);
-=09drv_data->quirks =3D id->driver_data;
-=09drv_data->last_volume_key_ts =3D jiffies - msecs_to_jiffies(PLT_DOUBLE_=
KEY_TIMEOUT);
+=09drv_data->double_key_to =3D msecs_to_jiffies(PLT_DOUBLE_KEY_TIMEOUT);
+=09drv_data->last_key_ts =3D jiffies - drv_data->double_key_to;
+
+=09/* if HZ does not allow ms resolution - disable double key detection */
+=09if (drv_data->double_key_to < PLT_DOUBLE_KEY_TIMEOUT)
+=09=09drv_data->double_key_to =3D 0;
=20
 =09hid_set_drvdata(hdev, drv_data);
=20
@@ -210,29 +211,10 @@ static int plantronics_probe(struct hid_device *hdev,
 =09if (ret)
 =09=09hid_err(hdev, "hw start failed\n");
=20
-err:
 =09return ret;
 }
=20
 static const struct hid_device_id plantronics_devices[] =3D {
-=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3210_SERIES),
-=09=09.driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES),
-=09=09.driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3215_SERIES),
-=09=09.driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES),
-=09=09.driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES),
-=09=09.driver_data =3D PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS },
-=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES),
-=09=09.driver_data =3D PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS },
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
 =09{ }
 };
@@ -241,6 +223,14 @@ MODULE_DEVICE_TABLE(hid, plantronics_devices);
 static const struct hid_usage_id plantronics_usages[] =3D {
 =09{ HID_CP_VOLUMEUP, EV_KEY, HID_ANY_ID },
 =09{ HID_CP_VOLUMEDOWN, EV_KEY, HID_ANY_ID },
+=09{ HID_TELEPHONY_MUTE, EV_KEY, HID_ANY_ID },
+=09{ HID_CONSUMER_MUTE, EV_KEY, HID_ANY_ID },
+=09{ PLT2_VOL_UP, EV_KEY, HID_ANY_ID },
+=09{ PLT2_VOL_DOWN, EV_KEY, HID_ANY_ID },
+=09{ PLT2_MIC_MUTE, EV_KEY, HID_ANY_ID },
+=09{ PLT1_VOL_UP, EV_KEY, HID_ANY_ID },
+=09{ PLT1_VOL_DOWN, EV_KEY, HID_ANY_ID },
+=09{ PLT1_MIC_MUTE, EV_KEY, HID_ANY_ID },
 =09{ HID_TERMINATOR, HID_TERMINATOR, HID_TERMINATOR }
 };
=20
--=20
2.43.0



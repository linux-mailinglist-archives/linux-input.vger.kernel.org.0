Return-Path: <linux-input+bounces-4757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D691DCF8
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 12:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C99DCB2491C
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 10:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D89D13D53A;
	Mon,  1 Jul 2024 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="pk8k7Vdv"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2059.outbound.protection.outlook.com [40.92.102.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26657C9A;
	Mon,  1 Jul 2024 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719830732; cv=fail; b=Fct3SNgs9Tci/MPsSo93poHPD84POCS+pWajHyMR1uCtI1XGct8+y07tmDs3piem8x1s75Mb9XBynz5ovVASAW8meVc/wZsGIrDlK8DStI6o/395oEQGQF7tHn/hNTBoP3XAuwU1qsBeDtPv+pwHFDV7/72AYyt3n6Uehh7KZCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719830732; c=relaxed/simple;
	bh=Fw5W6Mg3CDWVxNIbWH4Q9MQvSK98cK8h35loj/05puc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ery1pxpQgECqPGbRGCGKpliZiyk5irpMZ8RZ7jptyhd5RwVCTOsOx++q1o8GmvnfT/mUFA979ogDMC+nRfgfakMwgf6EwdFXsTAzv5ssgM0VKFgTk0RMkv0nGlRiQlk8PGeZ+PHiE+WGr/NLeA7FeL6BnSPlRN1XDmB1+uxsRvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=pk8k7Vdv; arc=fail smtp.client-ip=40.92.102.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSkv11KCd9gXv7mRIROS1hSytdPGAkgzvOSnaDAxCjJs4dVPSshe1u3oisIsu9XYr79ONzkr4k1k0gZao9nJSeNzyNXygwaDJ/VoG+8Cj2L/gmKoDfuBekf5LGznU+WGRDG6LnBdcyo691lg1x+l3v7DGh9FtqCh/36OK6GPQ3HIAloiTEO3xd5cnjxs8skT9foiSethPe3w8JEJk4KvnU51mUWUIMLv9LP1n6YZM8F3eXpS2W6DMgSf1OMAYutiQkMW9LtrOidY3ZyXEZSddBnR/PqfAsa4Ar9lBiARogP2BJdIMGXu2MoUNoLk6OHOs09II8kB8+Z6hIXSX6porg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK+8Q8ctycK/JqpR1S/x6bk1jvDpwYa0GayZEaWoDdU=;
 b=JRK2cuiyWVfCKpKYCCPGNRAIDe6zSOHf8TnxPVRosvzti3aVyTBP6S1IA1JeyLHwWfbXxSJZ4A93nd9wKPTqaX4+mRYfWJ1myNrAIxF2SZv8/ytBuzExOVQuKeQOMKv3Nbf68yndWmSqE/Ew5TyeGmseEH/37W1PXmsYTvBOmqL4FW8sbE9ku4sqN7Ih1JNzwFL9Z2L94CjzA+sSew/0eoKSlQo+64hLhGv8j5s7uyWnWexkIpYPHfsn/ZU3EpWTH9Uy677zVJDi2T5nmLYBmgu6ZAbqjlqS9M6CHuMT5326mqosdByqOdDMi9X/MmrXWV4fb4G9mpR0iBMn5INJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK+8Q8ctycK/JqpR1S/x6bk1jvDpwYa0GayZEaWoDdU=;
 b=pk8k7VdvJEWIgG98krxa59nY7B4V7OfKPC6FsQgeIWbZisH2FNCxAKgHEmO556Ra05CI/+l0yc4tqpCKMxPXFtZXXAqd0w9hbliUUW0eIrcJrm8JJfXFNfwS6tNthgeP8ZyohloaS4eMcQxszV8JrFn/ItCjMoV22Prw4Sbd+rv3QSniGf0x8anQxsrz+8/qKSrxWc6Ub0dh7NGp9IgOXHNJ6zpFhyrLjzPSLOUNDuNXaerhm6mv/DlZT0jbenLAkSf1CLvFJLN6YxcggFgw+1Yd/Kn3bBv44lyv1bJsXS2JxjmNfwqs5ezf/haHtv+hONAIdNWNUF2pMTdPs0icAQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0180.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.28; Mon, 1 Jul 2024 10:45:25 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 10:45:25 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>
Subject: [PATCH] HID: apple: Add support for magic keyboard backlight on T2
 Macs
Thread-Topic: [PATCH] HID: apple: Add support for magic keyboard backlight on
 T2 Macs
Thread-Index: AQHay6PHPmmDJHTE8kuvuT8p1BrWxw==
Date: Mon, 1 Jul 2024 10:45:25 +0000
Message-ID: <B3762A0A-1355-4345-9040-AF4E5292F188@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [SPF4WkZQgmTDLAv4vo3dG6GrwOB/Hd1ubWjFzirFwTGb3Tnu3P4/eVDayxWMaYc9uBiBZArh5Vo=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0180:EE_
x-ms-office365-filtering-correlation-id: c6b02bf5-1150-40ae-9389-08dc99baea2a
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 v7YAaHTKoy1+ytK+ZAQ3r6KHq0ftRI5yReCCSWpJt/T/KGkX0MoESJhuEw1coQnacDsWCrc3NZkdJXofOtAOQtpbHX5jxfEMnlylVSZKIVPaZg/riw2t3hx7AQD/dVVlzdsfGAAgbt8Ps8gJSdzcdTZNKVg/Uur8Cz8otTRQ10Z5OT+nqEuwmEp+52O8kL7rzt7+aIpwidcen5mMB+IxV0vCKE3O6E49d4yhC1CRvmRS2SXoy8M+1P1Wq5Hv/qm8vxzyDpS8TQqBcAEPvlTEs2nw8zquMpPfuqQboZo+PS1kP88t+2VYNsOA3l+A6FC4ZaB0V8uYnOsIV2Q1RZUwQmBFM6/DdupkzPRWlmqP/qX4doIDis0EWGeFINHZq2gCojbIMA3R7xkLmaRRhh71HoMsNs1D4eWSpwzuK9lYJDyLBDPh8C/82ikKw+365+IPqz3hwFO1Aqu7OwSNccjFe2Rn9YeXt4q7l55ueifT4l23ceEFlvL3hylF0VG0a+rL7RdsuBArVtmMIbjLPklbQHxg2umaCb6Bg2KAbXL8x+pVsYhseIrIQKUEw2dptBfWjkhVhKKhseQS6p8bDbK04TcVnw363GqXZSehwCa3aygTBrrWYnYSm5yOg2M2EkPE
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?65SFwUfL5p4Th+dfpLKaDBT8D9i5H6ftpdYXHIUKZ5DIx0qZueENq7DLksST?=
 =?us-ascii?Q?C6gUm1Fo7dslXcdrhyl0Qu1Mt+PzarUI9m87DA14ouygxLmperI5+15wQYDo?=
 =?us-ascii?Q?MInc7JQvgEAR6v//X7jGikP1OW0kq+GZFJsiyFfVaG40CyC9hLXgNZ5Gqs+v?=
 =?us-ascii?Q?b6pK/20wMtGfeyBkmNvYcZt6BcNgFlRWkzecw8qt6Vh2pnKMYeuJ0VEMax8x?=
 =?us-ascii?Q?qLseFF/3sqVzkI6yjjUXkug3FTjH4HcxIuXva10QfQAz4CSNNISvGZRg8B8h?=
 =?us-ascii?Q?258LLTE2I9CBHHNpyHtnZV/2TzgrnDwQS17Jtftx7gi746TDCHzuzLovyePU?=
 =?us-ascii?Q?RTuAWaU08Er7zTVhk3aPVM9vCjzpW6T80cTKxx0yQwO5vs9jMuRHticD/wIL?=
 =?us-ascii?Q?JtClMHkT3nWhz0BPjTztqZElkd7a9BqXxqf07RMNqam9YRj15J/Ro0T/80MO?=
 =?us-ascii?Q?P2OHficS2lni8MgwWj86isz9OB3zg+Ns7IgW4r3r0qaX3mOPWUEEm9yM9UeF?=
 =?us-ascii?Q?5Ygvmq2poFBX7NhT9VdGxlzZEZwkSA7WnfYZf5hNlgoFlK0C7zIMS4pcCllt?=
 =?us-ascii?Q?dlHv1C6e9EH0OjkNTiGVvp6Pf8fOa7h/aUUJE1g4jfvy2Ufyi2jPcTmn3Kgw?=
 =?us-ascii?Q?isJe/YmwyrwUm/G4sTKMNyKkUqXV9wYy1bsO6yMlgDEh47d6S75wAx4TZBMT?=
 =?us-ascii?Q?HrPIZevREyPeLaqt5xKhoGSPdX8UYkO9+/XoMTU5p4LARBLeUaQCVKJZrLln?=
 =?us-ascii?Q?c/zVvCx937zdrcBJhDrFOsDrn9jyAkyzwX2WpeG/hCL0+IZPBwf78d9yWHmg?=
 =?us-ascii?Q?zUOhWcyU+y57LJMTcAN6g/FOTQ/HFLIIfPWqpUUTsKdN5YvbVkGcdeWEgXUK?=
 =?us-ascii?Q?QZmLd9hFJlBDQ6HW8hVkevpChtEH6kB3ZsCHPAYquMOC2xNulp1hCkEEXJuF?=
 =?us-ascii?Q?BdRflM5kHXtOxRCjTNhfXPLW5V7prY7NCZELS72fyVsSUFgYq95XOr0oPaAK?=
 =?us-ascii?Q?jc54NUWpCGy4W+niRSKfYRNSvyi0oeTofWm2ywpZ9W1rmeSxt06UM2sGFpZw?=
 =?us-ascii?Q?8iSN/WyHUh/YgCgJZczjmzOIJNYOJd65yuvghMWxb+GEZOeleZJ/YXHPxs1J?=
 =?us-ascii?Q?yaZlxWwPNZM6fPTxQjqxAupxo5nZ+CP4LEnjj+xed5A4k8bh9rg0xabdc7VZ?=
 =?us-ascii?Q?9vMquAvD99bz9fZBtVDQI4WVFhXv8iHNO8QRdFScj1gYtcNPDa88HqJdgLTn?=
 =?us-ascii?Q?Yg/ekVI+SBqyVOPh98dJ/i23o61MN5Ho0FogWXZL2B+XyMJ7yCsdQUB0aKAk?=
 =?us-ascii?Q?1txsNmGnhMs6/XtQ45jXFclN?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3EDDD37BEE915F4D9CD9F6613872E129@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b02bf5-1150-40ae-9389-08dc99baea2a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 10:45:25.1248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0180

From: Orlando Chamberlain <orlandoch.dev@gmail.com>

Unlike T2 Macs with Butterfly keyboard, who have their keyboard backlight
on the USB device the T2 Macs with Magic keyboard have their backlight on
the Touchbar backlight device (05ac:8102).=20

Support for Butterfly keyboards has already been added in 9018eacbe623
("HID: apple: Add support for keyboard backlight on certain T2 Macs.").
This patch adds support for the Magic keyboards.

Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/hid/hid-apple.c | 87 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index bd022e004..db279948c 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -8,6 +8,8 @@
  *  Copyright (c) 2006-2007 Jiri Kosina
  *  Copyright (c) 2008 Jiri Slaby <jirislaby@gmail.com>
  *  Copyright (c) 2019 Paul Pawlowski <paul@mrarm.io>
+ *  Copyright (c) 2023 Orlando Chamberlain <orlandoch.dev@gmail.com>
+ *  Copyright (c) 2024 Aditya Garg <gargaditya08@live.com>
  */
=20
 /*
@@ -23,6 +25,7 @@
 #include <linux/timer.h>
 #include <linux/string.h>
 #include <linux/leds.h>
+#include <dt-bindings/leds/common.h>
=20
 #include "hid-ids.h"
=20
@@ -37,13 +40,18 @@
 #define APPLE_NUMLOCK_EMULATION	BIT(8)
 #define APPLE_RDESC_BATTERY	BIT(9)
 #define APPLE_BACKLIGHT_CTL	BIT(10)
-#define APPLE_IS_NON_APPLE	BIT(11)
+#define APPLE_MAGIC_BACKLIGHT	BIT(11)
+#define APPLE_IS_NON_APPLE	BIT(12)
=20
 #define APPLE_FLAG_FKEY		0x01
=20
 #define HID_COUNTRY_INTERNATIONAL_ISO	13
 #define APPLE_BATTERY_TIMEOUT_MS	60000
=20
+#define HID_USAGE_MAGIC_BL			0xff00000f
+#define APPLE_MAGIC_REPORT_ID_POWER		3
+#define APPLE_MAGIC_REPORT_ID_BRIGHTNESS	1
+
 static unsigned int fnmode =3D 3;
 module_param(fnmode, uint, 0644);
 MODULE_PARM_DESC(fnmode, "Mode of fn key on Apple keyboards (0 =3D disable=
d, "
@@ -81,6 +89,12 @@ struct apple_sc_backlight {
 	struct hid_device *hdev;
 };
=20
+struct apple_magic_backlight {
+	struct led_classdev cdev;
+	struct hid_report *brightness;
+	struct hid_report *power;
+};
+
 struct apple_sc {
 	struct hid_device *hdev;
 	unsigned long quirks;
@@ -822,6 +836,72 @@ static int apple_backlight_init(struct hid_device *hde=
v)
 	return ret;
 }
=20
+static void apple_magic_backlight_report_set(struct hid_report *rep, s32 v=
alue, u8 rate)
+{
+	rep->field[0]->value[0] =3D value;
+	rep->field[1]->value[0] =3D 0x5e; /* Mimic Windows */
+	rep->field[1]->value[0] |=3D rate << 8;
+
+	hid_hw_request(rep->device, rep, HID_REQ_SET_REPORT);
+}
+
+static void apple_magic_backlight_set(struct apple_magic_backlight *backli=
ght,
+				     int brightness, char rate)
+{
+	apple_magic_backlight_report_set(backlight->power, brightness ? 1 : 0, ra=
te);
+	if (brightness)
+		apple_magic_backlight_report_set(backlight->brightness, brightness, rate=
);
+}
+
+static int apple_magic_backlight_led_set(struct led_classdev *led_cdev,
+					 enum led_brightness brightness)
+{
+	struct apple_magic_backlight *backlight =3D container_of(led_cdev,
+			struct apple_magic_backlight, cdev);
+
+	apple_magic_backlight_set(backlight, brightness, 1);
+	return 0;
+}
+
+static int apple_magic_backlight_init(struct hid_device *hdev)
+{
+	struct apple_magic_backlight *backlight;
+	int rc;
+
+	/*
+	 * Ensure this usb endpoint is for the keyboard backlight, not touchbar
+	 * backlight.
+	 */
+	if (hdev->collection[0].usage !=3D HID_USAGE_MAGIC_BL)
+		return -ENODEV;
+
+	backlight =3D devm_kzalloc(&hdev->dev, sizeof(*backlight), GFP_KERNEL);
+	if (!backlight)
+		return -ENOMEM;
+
+	backlight->brightness =3D hid_register_report(hdev, HID_FEATURE_REPORT,
+			APPLE_MAGIC_REPORT_ID_BRIGHTNESS, 0);
+	backlight->power =3D hid_register_report(hdev, HID_FEATURE_REPORT,
+			APPLE_MAGIC_REPORT_ID_POWER, 0);
+
+	if (!backlight->brightness || !backlight->power) {
+		rc =3D -ENODEV;
+		goto hw_stop;
+	}
+
+	backlight->cdev.name =3D ":white:" LED_FUNCTION_KBD_BACKLIGHT;
+	backlight->cdev.max_brightness =3D backlight->brightness->field[0]->logic=
al_maximum;
+	backlight->cdev.brightness_set_blocking =3D apple_magic_backlight_led_set=
;
+
+	apple_magic_backlight_set(backlight, 0, 0);
+
+	return devm_led_classdev_register(&hdev->dev, &backlight->cdev);
+
+hw_stop:
+	hid_hw_stop(hdev);
+	return rc;
+}
+
 static int apple_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
@@ -860,6 +940,9 @@ static int apple_probe(struct hid_device *hdev,
 	if (quirks & APPLE_BACKLIGHT_CTL)
 		apple_backlight_init(hdev);
=20
+	if (quirks & APPLE_MAGIC_BACKLIGHT)
+		apple_magic_backlight_init(hdev);
+
 	return 0;
 }
=20
@@ -1073,6 +1156,8 @@ static const struct hid_device_id apple_devices[] =3D=
 {
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATT=
ERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYB=
OARD_NUMPAD_2021),
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLI=
GHT),
+		.driver_data =3D APPLE_MAGIC_BACKLIGHT },
=20
 	{ }
 };
--=20
2.43.0



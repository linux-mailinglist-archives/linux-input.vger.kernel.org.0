Return-Path: <linux-input+bounces-4825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F09DB92677A
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 19:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B4C1C2123B
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 17:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5741836DA;
	Wed,  3 Jul 2024 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="tR8B/hG/"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2082.outbound.protection.outlook.com [40.92.103.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695C51C68D;
	Wed,  3 Jul 2024 17:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720029257; cv=fail; b=HKOBL1o1z0Scg0DfaJNx2bnRMVKlkDivBumYXAKouP5KRo9yV5eRgbk9hErakyt8l1hPwK8AcaTmV5nCvKhCC2wsT4oIF3yNZsqDxM6raH7ga4mg7V/S3L5RkqIzEN2dUOv8ELVcMIWq88O6bLE8UBSi96ySGtuvJLyNQFIxsjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720029257; c=relaxed/simple;
	bh=aco4mPPSRohab+cV20WYOO+XoF9AA3K1TTtGneE7Gt0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TT1wzR7pdDE2e116Sy/nJBGJDc3eQM1sO58YCydWKlro/LV0eVpt5twpdrTQwp9be9moBO/+pvp1GBY/2Z1TTPdS2y0HB2WS5NRssf3IGcwkEW+mijFHgjL8LGUSleiQW7UXWgsdO9ylpa7dSNivPO/yA05qhMMF/AwxA2hJmec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=tR8B/hG/; arc=fail smtp.client-ip=40.92.103.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdqIh5K7KXzk5qWj0kivJYLT3cXJ6x5cdE5mlQTVqgIVXgX/C/+p/+mcWrkAs7nq/e2d6lRyYKSdivnYu91M6bSHZDUAyX+rzjftCPoxS6LwimOosLQH0Yus60OylGlulj8kh9zu70iBCKB128OJIn7gQal7V2cMfGkfGa8ByscXBz1iIMC41YDZfkOcrDdwA1L7Th/gk5iaUlc0yGtAlItsqro5sFVRT+ciIcD2tVPz8vbeJylcpTfMzMOGSQbZquxwmSpaLihOrU1EBQAHgv6TKhwhKHnOrnAvyBxgqIn9Fudt+ENFvYbvxvHw6Aan6zmtuAQ0fN/aPCwzu16YEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5W9ENJRaSzEX7lhMUr+hH+k+9V4I3//vRcVIzNI314=;
 b=nwEx0qP4J522cqabi7HW6r9kbiNzHAcCOBuK4YAKsJm5N76UpWH2gAu1QNEJ1Da2aYcmlhxbi8EAtWXNtf6vxsVBihVfnUaZVktx0NwtAm25T3PswYhNjNZBF4RUYw/jE7A1qojHNEB8xHizzLcPcQSy10VE2XLb7efb7txN15PaRMov2myP1WkLplW2jMzeWRvG3FyTUImT7fF+x6eDLOBReV/HBHTbgXZ60nXTSmxWfJx4BCw4vi4jIDXo28vaJ2WaOTCDnBuXPuFQSLVwEiaG4Xkqb+Zk+VQ/hJv0bPJMp2BO7NZCbSmRwIvusERZFdY0OQfXisU77c9Vbv2IYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5W9ENJRaSzEX7lhMUr+hH+k+9V4I3//vRcVIzNI314=;
 b=tR8B/hG//O9ubASiwvPmKqrI6Bs7ciLRuB8EJ/vQN+jt86KhXOYECeK1ipja77/2ierHAqvo6/S4TDmSfytK+RKGFu0qVcwO8r/WL69X5Zs/cFs21QlX7LvGho9rQZBwSHPNKuVg5yN0DZDFDpSjGufxjSOSoBScrzyCK3VpvoYTQ8UmI/VY4ZFuzmOADm9kL61YM5YKDBOdpkFTejQmgQ4s94nm+CFzSukFCnX9xCT4oCEawZ4FYX3JPOIH+3y3VgnNFpyjjzwvCXuUDa9L1zhij3WNR8c/JUCJ2xcOYw1xmyIBhtYW8q/KQiu5/1AqKQGIYi/EZ9J1bAno7RVAiw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0946.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:146::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Wed, 3 Jul 2024 17:54:11 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.027; Wed, 3 Jul 2024
 17:54:11 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "bentiss@kernel.org" <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] HID: apple: Add support for magic keyboard backlight on T2
 Macs
Thread-Topic: [PATCH v3] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Thread-Index: AQHazXICmHZBGt6CaEqkFC67h4stsQ==
Date: Wed, 3 Jul 2024 17:54:11 +0000
Message-ID: <E1D444EA-7FD0-42DA-B198-50B0F03298FB@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [N8OYFk7oh9jX2t6QK4A4K+poWhcbtf/ehxA2qWCeHD5Ent7xVuSv81zMpK0v6mkp]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0946:EE_
x-ms-office365-filtering-correlation-id: f3b1ac8f-e6b4-46fa-e983-08dc9b8924fe
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 qON4KzdSyO4P/jJQ+HMf+ivde6nHjl62ttAzDVHFQSCaSpXz4Q1bSZSf04//jcJRQQmtheGhcbYp6omNPsvc8j/ZVaRCKRZEF6Hinr4cmt2aojJC2NKerywPFuE/3v2d0QbS+yhkUKiDOHZNn4EOiCj2a+x48AleUB/yYaJa0PvFKm8HZI06mNSuGFX3KGqv+2dZ3s4p44w5df/oJnSry2wVCV1ICtt6BlXQ76Pvy7YfYENjMDv/pBm961QYcH+/nJboUQDaWXyFQ0rDWwZyL+cZBWIefEBpqEcOECkwXQDfKozpkybaMZO3lmO8GuaLMDRSIpLgb5xiWdgDKdxUVGxfdazj6+0k8u0qSnA14+onz1MlSuiO2rGQEWjUyFsnGN6UDYOj++DnLm2wKJ34WYsIXl2oEMJayPpnYf4q7j6PPr+/yHit2tYAwmgF1D0qd8+8/rCRW85H3AlvGfdIAFE2p3JzMiA/hT5wKcP71LD1iotjTb+6TeENDQvAo3Ww8uW8HUMV8eNzatMj2B64Mwa2aZAyzhZuK/qcig0GHfbSQMw1tfeWhmjZQ19ikRYe5zrNpmatSV0CB1tT+F5umSPDV2STMmPw6BOTh+o5yBeaa3z2Hcsoe6phZNisbDY7
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1eBXEsJm5zkTs9Qkbig+VAlT1+zptoNPcvPvrwD3tQ1hZ9nYxw0SOUFuY+e2?=
 =?us-ascii?Q?5dVIgiQ4J1DKhqNAL5dWZCvQIXDV3Z8Kv2dmoSUGP7sOAjDwInXu4udaFiX5?=
 =?us-ascii?Q?VUTB3HT7dmswMG45alwYvY+kEN++a78jAX42wFrYXBQml9xfKLK/67erGjNl?=
 =?us-ascii?Q?HezFvSQhkCzQkL2T85sMbYpo58G5ApChl3hf/uipdM1I++sWL+/oc2ezOckq?=
 =?us-ascii?Q?Qs3CoNhZoYDfWYeKNINZYwINGQzw7j2qaEua0bbbOBcBEpz1mUd05bId7xkb?=
 =?us-ascii?Q?gLvlOpHFuCPy8DXWZnrfhgtbBwGoiRqvef1Mbr+vmcAJ3URaSgldzg8HxxHi?=
 =?us-ascii?Q?7mL7sfFE5f7MG/vaI4wj7MTA7Cr8LN6VkRNQ9Vfarng0Bdm1c7bhDcb81DOI?=
 =?us-ascii?Q?aHbCvf5raOxaZmzrgaABCBrgVpjA6lykF1gL4w97Zzdq+x8y2eXWdMmscMOo?=
 =?us-ascii?Q?PTQ4eWssoryWvAuQ9cw7l0utG+TnBxwgzb+RERT/VRGwl4O5cS5FreUYcHED?=
 =?us-ascii?Q?rlYvq34vlUMykSxben4WRvyAbR1E44V6mzTdPjFm9O1x+fubEKc8V0IHNcMM?=
 =?us-ascii?Q?VeM9cvACOi4mxh3tslKvoerIBDpsse/0WQHNj/cmlVcm70Z4qY4H9+3Z4aaS?=
 =?us-ascii?Q?c0LyCGW4tJdRSQZbI7j41S3+pZCSErU2hHpTKwji9z14v/gxYQmdr6W2w9Ze?=
 =?us-ascii?Q?BNpVwwPA0+wmF8m7C2yie6CblO4e2AJuesaE9Yo/BLY53NyVVPdYbcbk3vF/?=
 =?us-ascii?Q?0ucVWKUpfbSE9iue1ZKGaOtuyVKWd2imdRfYXo/4vb+jPhpDEJwhJmic5Iq2?=
 =?us-ascii?Q?eYYhen5EQcMCHuMMezmpri88JK+/LeE3HjJP/iLnMpS6OkX3X68OxtyMxCVf?=
 =?us-ascii?Q?/eeGEJ+mgVt+Y6eSO+72Q6AJ2jLSYunZveZ9aEyiL22rhb7t3EEjmpxrwhhs?=
 =?us-ascii?Q?dU6+ARG93RaL3ZqJOW8XEKDFMVkDuRvMkXOrZ7LRCCrT/IjTA/zsr22Dz8Mf?=
 =?us-ascii?Q?NrchTQH/zxNkvWb3eSKtMqYl/rp3VsFyL8a9FdpRRluqwOTChrKZga49p6gM?=
 =?us-ascii?Q?pKuU6mL9a9khszZA8PEORWo57jHPOoEmfcdmg8RqVRTJwflmwS3d6cU7fhUW?=
 =?us-ascii?Q?xkTkty5zka++ExGWx4O330e2VjaEOqIns5NeR+r77gz5xtxozigxE+fCD0KD?=
 =?us-ascii?Q?9H9+nyfuLh4U8gQSrK69SEscDXtuzbPVM5RiCwsHh+T1Ec6Wa3DTX5KKJZBW?=
 =?us-ascii?Q?HWBumGLT1ahe5I5Zui8Sbt6Fv33x/A2AZ6TpOei6TpLBH6SJYoK/ptqfbDDb?=
 =?us-ascii?Q?Sv/gQKVsSNYmPRn6EiFts9RK?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <98795E3215ABC74FA7548F83C1BB16E8@INDP287.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b1ac8f-e6b4-46fa-e983-08dc9b8924fe
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 17:54:11.2686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0946

From: Orlando Chamberlain <orlandoch.dev@gmail.com>

Unlike T2 Macs with Butterfly keyboard, who have their keyboard backlight
on the USB device the T2 Macs with Magic keyboard have their backlight on
the Touchbar backlight device (05ac:8102).

Support for Butterfly keyboards has already been added in 9018eacbe623
("HID: apple: Add support for keyboard backlight on certain T2 Macs.").
This patch adds support for the Magic keyboards.

Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 87 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index bd022e004..6dedb84d7 100644
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
@@ -38,12 +41,17 @@
 #define APPLE_RDESC_BATTERY	BIT(9)
 #define APPLE_BACKLIGHT_CTL	BIT(10)
 #define APPLE_IS_NON_APPLE	BIT(11)
+#define APPLE_MAGIC_BACKLIGHT	BIT(12)
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
@@ -822,6 +836,66 @@ static int apple_backlight_init(struct hid_device *hde=
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
+	struct hid_report_enum *report_enum;
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
+	report_enum =3D &hdev->report_enum[HID_FEATURE_REPORT];
+	backlight->brightness =3D report_enum->report_id_hash[APPLE_MAGIC_REPORT_=
ID_BRIGHTNESS];
+	backlight->power =3D report_enum->report_id_hash[APPLE_MAGIC_REPORT_ID_PO=
WER];
+
+	if (!backlight->brightness || !backlight->power)
+		return -ENODEV;
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
+}
+
 static int apple_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
@@ -860,7 +934,18 @@ static int apple_probe(struct hid_device *hdev,
 	if (quirks & APPLE_BACKLIGHT_CTL)
 		apple_backlight_init(hdev);
=20
+	if (quirks & APPLE_MAGIC_BACKLIGHT) {
+		ret =3D apple_magic_backlight_init(hdev);
+		if (ret)
+			goto out_err;
+	}
+
 	return 0;
+
+out_err:
+	del_timer_sync(&asc->battery_timer);
+	hid_hw_stop(hdev);
+	return ret;
 }
=20
 static void apple_remove(struct hid_device *hdev)
@@ -1073,6 +1158,8 @@ static const struct hid_device_id apple_devices[] =3D=
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



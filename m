Return-Path: <linux-input+bounces-4812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA85925F0E
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 13:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D886B27C4A
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 11:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C6E17FAB8;
	Wed,  3 Jul 2024 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="SiqJSeyy"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2071.outbound.protection.outlook.com [40.92.102.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A472180A99;
	Wed,  3 Jul 2024 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005498; cv=fail; b=kBCJvl4k5rxN8AnMOUCZwB64u3kGVIrFZrKFMnvWPEVW5/EfnuGTDfjjbkRAIzqWthNwm/ugGcpVSSqbV5nchEu5e5q85ta1A7chlfVE+zkstUYDFrj3P4gVK9NzA/JT3FXPgXWW7NLCGoitnFYtM8Uc5Aysg20QHUNtXTehqPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005498; c=relaxed/simple;
	bh=qlslJ3sBgKS9arxR3CRriJCr+pXpxssmPqBwQNqguJw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Z/CTkbNy8ZoMhbjhtbLoQQUw14iRF66n7PzhBDIQ7dsFmHTDslF6seau0+NWsVS44wR2BBXIhGjeSnm3SMFweC+CgPqVYu2e6NEzsl5ynMjPhTKdJ742rO/r8tzBGz8fLwqxoP18xy7RzmCb8wO6V/fNw4y8amz2rC1//sIxMIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=SiqJSeyy; arc=fail smtp.client-ip=40.92.102.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni/YYqfElWCrONWkYDQVw6J6xV9hSEc+ln9XnSLQvtVrJo8zDEv83ItarxmWUkgGcI8GNQDLFRcwmg0mt6vPDvHd93MkLjYjC3JhSTLN/euJHZGVhhRsmV2LKO38BtT1ASyv9OJZEHVpn/2w52xuTLNFOvsSM7nqPSzuyVTzTEEpUCPiocn/m+HiPMUGAJWKlZECbkMLe/iUqZ0F6Fa6QL/oiGh2dTQl9jtYvNdACZcmdxh5Uxoat30oHb8MKC+OJ6NkUcv8c14XT/VaSp+iuDLxS277qDoaRcJYK2fFIyAhSZss/ggqTUCBDIrYrWIX9gTepfLI+++hwQlPNO0mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xUQBECFGFtgpVSfRr7Zz6jrC3Jl9nps8hD+AiSsu/M=;
 b=OTQNsNgiX7ym8fLAy6qttdrIptsfRvRGKvNK1V8Y5lccOyQJ+dy7+UTevAJxxzrzZU6guMKGqo/SxN3AKDmDSiyHiPEX1YzC3buwhLq7VF8RzedmGELps9ThHnog9CMG9oNbGJ/5mcSc0E68UNvHXZEXBuF10+WsHnmnuMLnW4E6vButswhAUqdGAeygZFk+7PDJ/JiLTjslKBkseCdVpYXHQ3kl3lPu2Mo/LeEcJkcolqX31g+Ra2HXRCULoG5T5N5n1bObtbmY/A7MNm3muPuVpQGvwszcxclkqZio/4uD2767+Z1BJfj5vGj3ZWHra4Dhb0MC+HE77vSJRjv8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xUQBECFGFtgpVSfRr7Zz6jrC3Jl9nps8hD+AiSsu/M=;
 b=SiqJSeyyIPhLY/GP9NmEYUOGKi5KcT8EEpW8p+RDZ7V68/9DwqGNWTeOv6asollWvBAbYYStxv55AJe8FOuM/HiDEZwOK8wbxe8vQ0rBZd6zPUqOqV/Q0IL2ykTmneTzfnxpI4TQczNEnrXDlACJWcABqXj0nb/2l91NvtnKUAc9bML0sbZuGqQBdT+n/JbULSAxa2JUqGRtMJlopqS1VDVQafThI250dEOOuf7QWpIHiJOJFVmBgYNqHOiQHLO4FWnhoBOoWocodmwScvhTw3aejQNFca49pPrhzR+HbkR7rd2Gjt0MNwMLwMPDzf0FvK6dhzN4BRoJGmPCibW15Q==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0271.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ee::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Wed, 3 Jul 2024 11:18:12 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 11:18:12 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] HID: apple: Add support for magic keyboard backlight on T2
 Macs
Thread-Topic: [PATCH v2] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Thread-Index: AQHazTqxdSWB0UDPjkG8o6UyySDHEw==
Date: Wed, 3 Jul 2024 11:18:12 +0000
Message-ID: <16C35623-78AE-44B9-8D54-CA9584AEC49E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [zYFlKhsA2ZMq2pdf8J6+E8iuuEBzHn0b9onxuk8x6bG09VxNTw17KBJC2Qoot2wA34kXlHbIw9U=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0271:EE_
x-ms-office365-filtering-correlation-id: 1421a47c-c6e8-4364-a032-08dc9b51d390
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 s8e5vgXga/LWBVoCWyqRlPXVPJiwL7tCm2GTENKYAsAZCsg3WmtkjByv5kQLmF/0TNOY7oXzjNRey6QZt4S0c0AV6m3Ixpr4JWQYvtAa3lKirwUnReURyJ97lbvZj0olVT4ckgM9wXFKyJcX3Fg+zSezDAkULu0oZdNEUk67dQdMVdC08ypRbKKcR+EmrJr4/ykc8zHhM4j8+Rm98Tt3TrC9ncBOqJmMLFkm4nR3GgOp++ImTyoW4UZbq3zDBk18i6hnDYBSPie4AJH64uNirWMJypxpGO4KqPn+6TUFWOY8n1GMxmZOzstZUmd4HcI0N198vtyWYRdr4HoM2aE7JzpQrOqMSVtvwXyACcjB6FKOx1CtZZaaCrWRd/0SisdFD9hVaybvWBvd6cjYWt8F6sxDQ6dxfnJLtZVUayN5E4eia2glkMk0EZaTVSsTv8J2WVOhxYWVUuslUQ0b9Ra/b0wDbV+0rXv5VGAe6D82lI4VOX+pc9xAhp7xlW1sSM+gATvYAfr14u2B9cJH6GiOthDYQo8jq/cCTOeDKaC5f/Lvir9Zu3jFUbJgCehipfpsn8HJeiriNABgkxpANDKcqxxOyOheC0Kyy4qTWKxCIvnJCzSqPDC/Sc3k6Z8/bGDR
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kKXyWQyk8Br1ceFjQ8QEoeYqUIoSk7nUIQPaiOkuyuRgYV1F5IgjeFqsNRPu?=
 =?us-ascii?Q?B90v10iC0hN0TMicorCiRaUcAc/ckF7GEDc7nuAQdTihxrZuYW4rB0DB+2ot?=
 =?us-ascii?Q?gteHdB/ohziBEp7hDi/iK6mleS6BvJhWUopJf4tcZNgGsAA0mZNNMF3etbY/?=
 =?us-ascii?Q?+G+bCWM7Rq4gs3PoYKcXe5oH2nwMiko+74fHmlWB+RjFmpgomHPpD9UUoFgY?=
 =?us-ascii?Q?+L7e7Sz1n1blAqv+CMW2uy6uLJFNGgrR5nLetGuhiL0v7UG+UiYmHi6+ekbW?=
 =?us-ascii?Q?6+s4rwVJTCxXHn213t9Fkv7e2t+SxWHnnWj5jKkgmWFoeeAaRWDgcGg7TCWI?=
 =?us-ascii?Q?y4oUWT/XQhnBX8gXJLcbn032vq4njNHkl00v/ks0hn+3nRnqt9jQWpnZElg/?=
 =?us-ascii?Q?+aIWkDN2pfLBg2CmMevDOi1Z7MmqCFrSrPLv8B5taLTSBhM/BlK1Sr+gkEw3?=
 =?us-ascii?Q?O698VlEt4uMlTsDbFcS+73dohSBuIlOKDlS3WlmHqiNmlKrtugAUgXJuuqKl?=
 =?us-ascii?Q?8ZoeHLP1IWkTH2bP1m9DwbzCqBVfgfK1i6D5bZPcu7MYA8Usday30b2f6Ccz?=
 =?us-ascii?Q?D7TjCr7jsNj+B4gYixqFBi+ECg3rSluBbLKqAdiVPDycDpycyxWDkJgTVk4r?=
 =?us-ascii?Q?C1lKNZKgOYMnJFMVbd/SzZXcL/aB3YCUIhmzGWkLQeM+wCT6Y238UBwuPid6?=
 =?us-ascii?Q?OIO+a8ZSJLbflK1hIaI9alvNQOuw+SBkJ07EZ4qiDSizZXAtBEgYu76A2Fok?=
 =?us-ascii?Q?gEkcMV99d5ZJthK3NhfKCqsdZMZ/DePfddUnN6WJ4LhLzgKY/tsPHnG7G6Qq?=
 =?us-ascii?Q?Yoghy40witzCyx/w1C+DZg8ALZbxUsiybC2Uqj+SikC7E+ucFfMnwWncEYw2?=
 =?us-ascii?Q?CJCAz26ZFN5zsoEEd0fITXOBbGICY2RFHdKkrnBn/Tg3vDoRMBjOzI70d4JW?=
 =?us-ascii?Q?+/7V+ETK+ATYizP4s7OKJHDtyE+Lne6LowxnKdgw/D4QAHxfA+sua8skeazH?=
 =?us-ascii?Q?wPlBRaiZQ8Mum6tK72WoQ15drrOBGH2UaOIyu7pyZlBtRWe5u062Xp06MWXQ?=
 =?us-ascii?Q?vPo4urlor9LwXCeGr2bW5/5QtcIfnZ8MrylGLHBVA25zpACxpiN3BnABdDZa?=
 =?us-ascii?Q?Qq4dNxe47DI++Y86HGf31iEBHDjBudJJb6EPEcb0hW5BKOUI+XxVpvkW1OKp?=
 =?us-ascii?Q?e3BWqyIBjqN3wdS8Hjq+pSgUrS03Fsg6aiwzgFCJqTTOLJmDIDXhdK2jBjkQ?=
 =?us-ascii?Q?ZPZOSUTmeMOMJlRJge5rvey8NWIFdPL2xO1J7JknGdbrfu9NyOVLoyampgPO?=
 =?us-ascii?Q?53izGts3iamNuUYy1cPEGGXV?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D8CD4AAD6C15642AA87C0C579DE516A@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1421a47c-c6e8-4364-a032-08dc9b51d390
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 11:18:12.3702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0271

From: Orlando Chamberlain <orlandoch.dev@gmail.com>

Unlike T2 Macs with Butterfly keyboard, who have their keyboard backlight
on the USB device the T2 Macs with Magic keyboard have their backlight on
the Touchbar backlight device (05ac:8102).

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
index bd022e004356..2d1cd4456303 100644
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
@@ -860,6 +934,15 @@ static int apple_probe(struct hid_device *hdev,
 	if (quirks & APPLE_BACKLIGHT_CTL)
 		apple_backlight_init(hdev);
=20
+	if (quirks & APPLE_MAGIC_BACKLIGHT) {
+		ret =3D apple_magic_backlight_init(hdev);
+		if (ret) {
+			del_timer_sync(&asc->battery_timer);
+			hid_hw_stop(hdev);
+			return ret;
+		}
+	}
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
2.45.2



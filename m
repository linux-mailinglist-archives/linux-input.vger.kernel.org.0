Return-Path: <linux-input+bounces-10622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BACBBA56756
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 13:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8DAF3AFC69
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF04320CCF3;
	Fri,  7 Mar 2025 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ad3khcK7"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011038.outbound.protection.outlook.com [52.103.68.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23C1218851;
	Fri,  7 Mar 2025 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348813; cv=fail; b=WBcCs0IV28La5xt2ECACpccKRqSKFQavT6JNuF0XRdIgcTz1QJgMX7D8Se4D3Pfdu36pUCaR3v021Hukw1LtYxH3cBu3sB+obx+mkGctvZIg9ZFSsiIyDQ9tHHeWtjYT+j9t44tZBv1FAvjpSsaJSwpPWdEdyIN+/LtGD+9mhpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348813; c=relaxed/simple;
	bh=tLZ0OmJcy24TnMpOgxdiztEkkV/tBe7v131CDHfNEoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sMgzuBe/KQ/MPCfnOH461pDmuA9XKoSlQKmrr81t6CRw4vVxZCc+hPuYZd6TnPKuWXeD+ZnCFHMcGmyi2yoNqc6sPqaFDcJGhGJg36TnGb03qW0dfEq3L2XkaknNNownxAiFu8PGW6zaRAB/cuMFZ/R/fNpzu3SHd/cuZhEiy/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ad3khcK7; arc=fail smtp.client-ip=52.103.68.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U89NVpoe+e2amahJHjGeOkIg9Jdx6vonQMCq//WP69tXIw5lM/zNEiYxDpj4ky/VKYAuaJwdFW7yDifiwXs3FKOtxbIWx/cRLU3MfwjZUn0BBxPBFK+F5xlxES0vwaCvriFY3Eusrs2GrQA00Op2UfhQJPUD17s6RXbQPrFQIF9bBaRZsUxQjdoEKWabulkIjyEYSZrtsGFfJ8TLYVw0HQXM2QO+EYk1DlDdSkBqM6w+fez2W3JconZP8nnNi9uGA8w5rdZwq7g4Aid9SzrtoKPt0OvepCc1o5Dp9xC2Glxl/431iJsYdJiDOA3KfErcdooQF0c16X8ZaSuOKCzyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6u6sPE2HZSVk9t3KGS3iE9yURMQvASLhwWStL4o8OA=;
 b=dNqtI5hG9ejFq1lrklz2du2JeTIhF5+hz4imgIzKtEU2cGLXX8uBwc2C1pc37FEfHillkiIoevzOoVlQf96Y33HgtCSIcjgukCM9NYkROU0ikX4icZm9AFC60rz3WvIqFXWCOtfQcvBmXus12E2gl15m0HJbD+TRwQhVgv9iZazjgg6Hzz45RUevX2Frv4Z3nSHOJsB0EmhLGSY2uE1rC5Fgu2FLGMsc52KG0MCTMYtaQ7zdpW0tXgJgJ+WevFMYYFUI/U8YnwpXiheTUX6CIOocGfDUt67UzFcAevgDdTqefDq6YRwg2U0dhZ6KaknD+iexYOah+Y8H31ZPbdbGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6u6sPE2HZSVk9t3KGS3iE9yURMQvASLhwWStL4o8OA=;
 b=ad3khcK75ILJMtFIJoFJBLwr3+BBms2gNnFMPVy9SnVbzdjSsZYyMMi52gHOCJmw21n0JWq3JrpuKBAN5qNva/Stv865XyvZRLcQbEMYxkABeqPzjg92V+1VJ9N4K4YqdWk8ho1RO+O0u99x6NcmonKTqFMx3HVXe0DQyiajcRSzWV12d/ArW2hUXQjkAAVZ7KROz1je/BPtqImIc95MpM+YHL/Sxt1jC951l0bkiFtVTAVrGVGtLJ9Vutnad9JCE7mVpimZX2sz69aplWioBcU9+4fbJnDCaubzQgTqet1S963PnkuW8w+1HCbJ6B9RPtmtaUU10FPGb2yRXvS6fQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5697.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 12:00:06 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 12:00:06 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jkosina@suse.com>, Jiri Kosina <jikos@kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 4/4] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Topic: [PATCH v2 4/4] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Index: AQHbj1h3lz5O14VG10G9npfz0dlWVw==
Date: Fri, 7 Mar 2025 12:00:06 +0000
Message-ID: <0C3B8412-20CD-4523-A794-AFAB6D6471BA@live.com>
References: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
In-Reply-To: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB5697:EE_
x-ms-office365-filtering-correlation-id: 2e1a76ba-147d-4da8-e69a-08dd5d6f9a59
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|19110799003|8060799006|15080799006|461199028|8062599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bzASQcaZvSwrJCHWbPhs68AI+PcXgNvjPfdNapNij6N2JFj2hoLLwaZF1iqG?=
 =?us-ascii?Q?ONGYw76S8jql79wHlh4CeMHtrnFcjOV0tNEsfmZmmt8zBi+LnB3p4SuvqADQ?=
 =?us-ascii?Q?jqn2YSMCwZVuAZY1yqGD1h49nxgm10WoOd47OKkYG9tkDW10FekzRKuWpJ/X?=
 =?us-ascii?Q?Zk4gozodTaCEsuYjiqNLy52n57AVAzLjdkhR1cgV3ig9alT1QnGcOyDktpYL?=
 =?us-ascii?Q?vq58/opI8Pjx7JfW18FJEh7kb9eimDeNp/YLy/6pDH65K5W/KlC9sF9hIxZP?=
 =?us-ascii?Q?ZlhqEjUAoK5JPnNWa0PFy0aGgW5cz82b3rsh43WcSROT0q2WNnwYXQiF2qok?=
 =?us-ascii?Q?rr8PninFLe8Z8SvP4zxZeXDy9RhmTjg5j4tumchEi2Ro23EwUF/QOid8Sj+j?=
 =?us-ascii?Q?voLojBlfEzypGUet2BlFYHcUmj72HGSGkV81Wm/a8LwFMOQxQBKLp+KSarJ/?=
 =?us-ascii?Q?dBu8oyy+OdqChJ6X9u5pocBp8WHi0WfGi7ltaY5zpxtMwDFNj0dXuW3lcMuz?=
 =?us-ascii?Q?uE0vcGSlv9U2Imn1DT9AXYAJ8TNKWuG3RdjiPPQUC4cmQBz9SwEpUNvvSfYL?=
 =?us-ascii?Q?6QaUGuMtvWo2W7tTBXS2Por2oLfvOYHVR6uXotG/w333ECecF9ErfTLsMSwC?=
 =?us-ascii?Q?wxI4PgW/z6tsW5vAvEZUc5VznpSAKksl//ZyXWGuz0DdiTH7jdTaloVoyZo7?=
 =?us-ascii?Q?BpJkHm/PnLTavo9TV0pJ+WmnQuL4kJHfKnF/O9UVyhDGYDa73B3+poag2tt8?=
 =?us-ascii?Q?Dfi41TZ6QB/oa5bQjGuKXIqvo20vsP04bcni6BMjoJR6U9OriIAP6ao32YI5?=
 =?us-ascii?Q?+Tk1aOqG/VjFrwNIc6yBjjZkbDmLAwmzOrkLropvDziOaEtFZ5Y0Ipsk4xpu?=
 =?us-ascii?Q?OElHzcuhtIEjm12ED3TCsOxnZGOvGaSdUC9GaROnh16Nvgs0tIjYzZ0ec2sp?=
 =?us-ascii?Q?S57ZWLi5qoeERQDYI1X4naC3jTwcM/7Id9S5JHULGxZiVCjiASy28TvKx92f?=
 =?us-ascii?Q?RbQ5oGSGDGgyG4re/3DU5OnOWLNPrmzhei9x75EglQy/aLwsnS6w54sSqwiX?=
 =?us-ascii?Q?FOFoiVE/K0uVgmnq5X7tmxBP7P9T4g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LXDZaXn15/497nNz4UPaemXNFADRIRNPTvsr14miqgigmtxlbCAL1+Xz2wza?=
 =?us-ascii?Q?td7jmqVQ8th8kMNtSIrp9J4r22a5rq6fdnOrL12JvPj66T96ISgbvSoQn11q?=
 =?us-ascii?Q?ubOjxOax5KvcTzKlbYqc1wqrSrHPvjI+tHZxIeWepoj6fnMvhWX3DmU7yJPs?=
 =?us-ascii?Q?gqbOTF5AVNAIm1ZZCkzSFM2xrxQrDQ+wCbLKHfSyN2ITmtMc6bG5GR1sil+B?=
 =?us-ascii?Q?wQrh7p6KtqgHX6UWECOsvNI33Uez2PR72eTgmdFeID0uSt/TcM0r7e+bxGbV?=
 =?us-ascii?Q?bqHrgTeyKIzjGQxjRbB8j3Wa/hIcnXFS1fg/bT3rZfhMnyVpP0A0bbOjWB1o?=
 =?us-ascii?Q?sadj7CaLcdPFNrZRI3KhwzVSkPq5tXPWfN4diTom8FCbokCkUZjsPt0xBLLd?=
 =?us-ascii?Q?xkjd7cwxss2Wq0YK01hLnx1RqWTvtKCbVaVvRcdY2toOmJI6UU3viudmCE04?=
 =?us-ascii?Q?9N4YSSUJFCAyb2XpJUYXC73eScWWHhOXUXWyEHk2ylvjHf8ldz6ty7LOGVmw?=
 =?us-ascii?Q?+wViq/I/XOJg9mc789n5xeGBNjOarCJwaDf09NXL5fyrSZiTwFWUqGZoaSOd?=
 =?us-ascii?Q?kOdvwtwqBfRNLSxRq3XViAVsED1J8IBmPeB6GR5BOzOk3f7bHop4QSzC0cL1?=
 =?us-ascii?Q?xy54jcXRAR/ZTYMfr0dND8aRAjUpXP41uZPL7bxD2DGN5XzujtVsAedxteBq?=
 =?us-ascii?Q?IdgnJHAoZ00ZrTW74txjMZkYcj970Joe+ma70MM76C01x+fbxgcoXzO31nxI?=
 =?us-ascii?Q?UWPsevYF0A3PnlRAabKyEcXHS5/yaV7FWeWWVR2he+dNBa3+UuwdGKCZmFHy?=
 =?us-ascii?Q?aoN8GjLgXuivTHYCLtHZb3JqEvaofZOcp0lXjff+ktbM72SAFlWLif8XuykR?=
 =?us-ascii?Q?tJ0DvEm0EH91quz9b8Ut0Zg3rpu6uVTxi3oOWQiCo9P6FI2dz8uflKFKv7se?=
 =?us-ascii?Q?/dEzGLbTy3kWFhXwXAWxqd/N0p88u6DXa5eLKxLjET6oLaugMK04z2jGilj7?=
 =?us-ascii?Q?KXIZU+Y/xkp/zhcWyDaLB5SndTArNLNiDvYp4Oc75n2l2rzJ76e72yfsYaXH?=
 =?us-ascii?Q?S9rI+BpqNqouIq1ave4h9siyNoPVhI1Wb6gl/8mm9Wuh2sxdI4Rbxco9eulW?=
 =?us-ascii?Q?I2W21N+5uzEqrNyvTnoQiZcbswonAzHpZRrO7qoJiEfAdFqr6P5xm0Ug0cH/?=
 =?us-ascii?Q?H2IA49RBn7Szm8dEM4cIvm8HWrZMqirMLDkF4Wu/9TWv9hHgFXqXT9IEmu1Z?=
 =?us-ascii?Q?AJ6/0yylIe71FFt3wkHtPxbOnWWhAIt8q5tqkSY65A/NBsy65LfaUcGSPNXx?=
 =?us-ascii?Q?sV9//y+FjGLT8nCggyPYF7i5?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F83D42887743D4B8E8C36D25CCA1704@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1a76ba-147d-4da8-e69a-08dd5d6f9a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 12:00:06.8587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5697

From: Grigorii Sokolik <g.sokol99@g-sokol.info>

Add Apple Magic Keyboard 2024 model (with USB-C port) device ID (0321)
to those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++++++--------
 drivers/hid/hid-ids.h   |  9 +++++----
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index fde438bee..e95a54113 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -165,7 +165,7 @@ static const struct apple_key_translation magic_keyboar=
d_2015_fn_keys[] =3D {
 	{ }
 };
=20
-static const struct apple_key_translation apple2021_fn_keys[] =3D {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_=
keys[] =3D {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -482,10 +482,11 @@ static int hidinput_apple_event(struct hid_device *hi=
d, struct input_dev *input,
 			table =3D magic_keyboard_2015_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
-		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
-			table =3D apple2021_fn_keys;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+			table =3D magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
@@ -690,7 +691,7 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, apple_iso_keyboard);
 	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
 	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
 	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
 }
@@ -1165,10 +1166,6 @@ static const struct hid_device_id apple_devices[] =
=3D {
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATT=
ERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYB=
OARD_2021),
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_=
2024),
-		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATT=
ERY },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYB=
OARD_2024),
-		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_=
FINGERPRINT_2021),
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATT=
ERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYB=
OARD_FINGERPRINT_2021),
@@ -1177,6 +1174,14 @@ static const struct hid_device_id apple_devices[] =
=3D {
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATT=
ERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYB=
OARD_NUMPAD_2021),
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_=
2024),
+		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATT=
ERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYB=
OARD_2024),
+		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_=
FINGERPRINT_2024),
+		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATT=
ERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYB=
OARD_FINGERPRINT_2024),
+		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLI=
GHT),
 		.driver_data =3D APPLE_MAGIC_BACKLIGHT },
=20
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..8682e1b11 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -162,6 +162,11 @@
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS   0x0257
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015   0x0267
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015   0x026c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
@@ -183,10 +188,6 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL3	0x8241
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
=20
--=20
2.39.5 (Apple Git-154)



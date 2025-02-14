Return-Path: <linux-input+bounces-10036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A4A35B18
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 11:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF2E31890B5F
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 10:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9155202C43;
	Fri, 14 Feb 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RmCQZCF4"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010013.outbound.protection.outlook.com [52.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939122CBDC;
	Fri, 14 Feb 2025 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527535; cv=fail; b=jS6qWni2K9SfJu2uvgGSZ/cYIKerfuFr84T7Vd7kNZosCFl5pw/u5Kq7iC5uJhqslcsPR0f0S7vJZUV7P6cWZ8TaEbBl4L/8hLJ0i6ohTez8CSWQ/JT5ZQj285u1+ZMztfRGdJEIadpXDqhsU9TVlJbKZPbQjtdIO+kfzdS39/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527535; c=relaxed/simple;
	bh=XTvodwTinyy2+ufmtzjWRABOtKUW6/pPNJ9zKENxV3M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uDUS8hAu0eGokkShiEHwTs+pcAYfL6lAgtFUFi/FgrsyC2cKvcMhzM6UWQjs/uzmvRFxByW313yEb32Lm7v8Ddvlf25KlRPR4fSoCotxpqFvH6+TRPKJJQH4CdZAOxheOCq66FSj6QBIL2/sGUsKc5xgqSJDTgixrdRucdIhHFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RmCQZCF4; arc=fail smtp.client-ip=52.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgcBekfqQBc8p6UjB4xbBVhGTaE39bi6jpGLq4EKRJgp1a1yKHqlLVKwE9tHOX3i8VfR6bv2OlSx8Q6yWlDLq+//wH2ZiJCLMTPySdUlQB4FbC7Fm3nVfIo4g3kzzevRdzsTQej+sf5uj012BoSCpLoNcqUFJ1grB0Y6RJ7CeMT2ESvTqGeM4c9tPYwME2XqC3T6M9e5+6Z3Ra3tu3+pGERQLpnWaJru+58U8dLptTAQctaHwrZMKbKHGtz/o+e4bjRNL+7d8RKGkF/Zde4dK1uZZvOb+1hO1Coi8OxjX36RoPToiJwA1v6bOQ1TBdybrlPSJcbV/v/Fgx83CEkfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA6Bom3p67Ta/H6JO3JSBAAEHBKQlpKnv0VULtfz1bE=;
 b=zAZAffkVTZGoLW6LuoR7+dNaLIbk1UljQGbVq6633+8sd0xz9qRLaaio3axYriQdYupUcDZK2yOB2gsyQfjoV4NDp1XXpPGVofRnuHLuan4Stg+CH5s/dl3STbqSpzmgQcQpzA1NWj8tyMPizoOKbR/Z0X1Rw+95ToQTSdaxMrhOoLiaqJDKucW4CLNhvsOiQeJsozMK7qmCMYno2Z4I8/WKiFpum0xbGrMnW2o+R5DvpRU8IVVVnzxOmJOlbKPqqVcl9aZVHGZZBwJjjiYm4iZ/gvZvxbRY/lKDlBZ8ilF1hqXnq2gzQcthE0su537RZ33GFTLZxCxVb99+ddO3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA6Bom3p67Ta/H6JO3JSBAAEHBKQlpKnv0VULtfz1bE=;
 b=RmCQZCF4/em6TJ76vlMnq8sKpvhjU5nupaADgbZlJEyEzE+yqq7LgTMReZuB9MLZB7pjaKq6uitmrDcCbkIRgY2DSAZSRis8Cuor3+E3UxDl+oolPLtmxHPR5fK8dkV2bZxWaxO/bLVXdn68Ku4uLdpJtW0nM/TbpteNgv90kClyoxoWl32JUP731YpVObOhhwfDG+njnJFRyxo85cB97LZFwS25aEikqFG/dpH8a+X4tpIgAW7lYHbMJlCmjA+li/PeVrs8rq/Z0cinOAP5cfYlzRDzNgh4kxIchrHiY0N65awyecDSco/QOwdXTu7RitKCUU2n+aNMLY6YLHtOEA==
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:107::8)
 by MA0PR01MB10024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Fri, 14 Feb
 2025 10:05:28 +0000
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866]) by PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 10:05:28 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Alex Henrie <alexhenrie24@gmail.com>, "jose.exposito89@gmail.com"
	<jose.exposito89@gmail.com>, "bruners@gmail.com" <bruners@gmail.com>,
	"seobrien@chromium.org" <seobrien@chromium.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Topic: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Index: AQHbfsf5UD5NJWu4E0KLZernE2BrTw==
Date: Fri, 14 Feb 2025 10:05:28 +0000
Message-ID: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9615:EE_|MA0PR01MB10024:EE_
x-ms-office365-filtering-correlation-id: 66005162-e7f5-4287-be60-08dd4cdf1b91
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8062599003|8060799006|461199028|7092599003|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dtoUMI2oXONv6G0thEzCUWWx8xIepNdCeA8bcw4GyawbzuKqiqrKAOgd4+7Q?=
 =?us-ascii?Q?i4k1olX9BwDxEGifucSBXvXEKiKmvOOmXPHSgRuM9h1DLWmwWI5TxRVaqd8P?=
 =?us-ascii?Q?6x+4jcarN0Nd2szZoScHkxEaZeTlXaHw1UnOZ+6/QbM23LXqKCSuFwIi2T9i?=
 =?us-ascii?Q?sQ42Rh699sqQ7XgRaZPfQQnbVrdRcfAwMQiwol0VTBpRYBUYS8N61A/IPoHm?=
 =?us-ascii?Q?BXmGww2J2jtS3rNPyaCaPyISMDxDrJKwPgXFovOrEw4M39MwD2UMdkwZxyxh?=
 =?us-ascii?Q?qsfl5lPLv0D5jkk6piCVMgF1B5x1t+Ju5CYxcILKYtOKaYezvO7oFfsCmk2t?=
 =?us-ascii?Q?uwGEVT/V8OSh4ZNPV5UMDNs/6Tws1+1H/UoR+/6v4sB7nD7zJJZ7fVPkwFMS?=
 =?us-ascii?Q?A4swiDlJ17DjUVuBoqjvoQ9TncPkKx+xXWnGteX/5xJ5Fpec+vAEuSk4fR74?=
 =?us-ascii?Q?YU2FcKOca3PWpX0SYlKviRfXKH+kKy2m0jEDq0/kECBDlzYKjppwqzcZochO?=
 =?us-ascii?Q?pMvYSG4vtWkzMSKqARfncYnT3T/TVjSmz/3QHft0qLKq5Wm1wMdQaE3KhXlW?=
 =?us-ascii?Q?h4R4sC0eioAxD5OC8l5Be0aOVqGgiq6jS066pWmycVTCnkRfm/+WQ85j1U+0?=
 =?us-ascii?Q?EugYRg3psnUtS9ZWSNINfXQvu68QyHQVINYu4KrhE4yyfxWaIy5UrFCnE4we?=
 =?us-ascii?Q?aumujXiZ3VSahgs59HGxgtdmrpc0wkWJHuEx0AnDYBP2n+pneyh7lR2s1nM7?=
 =?us-ascii?Q?6SltbI2SXzdpLF9bqt8RoAOhyZUh0EklphwGNRWqdHbD+d1b2ivJ5yiz+NkE?=
 =?us-ascii?Q?wuzjiGnF88C3uxpFBurPt/Z2cZ7kxu9wojhmc4/SHHPjV9YMx3jZzb/o7XE3?=
 =?us-ascii?Q?uk5WYm8/Qp+bItHMFe9g6d4BMsLa85xmvsyEd8/LWYKitIRlnq3+ppNWWXC+?=
 =?us-ascii?Q?qKQnPFeQQJAU884J5qyPpN3/2tRPuHlIPI66s8LGty87DrDmJOzB1gpa1U2c?=
 =?us-ascii?Q?A1l2XgRIXtEoE8syeaLxr7ifI8vSGuAoA5nNPzaJ2/by1IDmAd3CiCQ+tqMD?=
 =?us-ascii?Q?E8H257xXyr66cxCOCzsVKOhwlRhZxQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BGTD9oTCuvaYtKHHlL34MlSdOTqVYczP1z/dh40gRaLOCu551M837y7z8ktx?=
 =?us-ascii?Q?kpZsp86JJcZtxNpeeGksxzaq8VUJVqn4hnnOTEbCnPmLE/WgbC2vsyQ965Jn?=
 =?us-ascii?Q?WGEm34UCo0TlkHAwLKOdAPk4/jYlqEFQDAhqCUcXoXby7dukv+Lg8RZnzCuM?=
 =?us-ascii?Q?CDPxTc8STxO5ZIRc8uURy4swAVYSwdRJXoe8vxhtRzALPC/sZGa6b3zu4IzJ?=
 =?us-ascii?Q?hTEXLXQxbLjv6IUr3yi9PvV65fi7SpJCYgDPUYDyvC7M1301eTbjRcAPeEk8?=
 =?us-ascii?Q?F6aXAbdBjs+3Xg69QKnl4MfgvDlV7UMYyqxALA+W6+KXJvd1ztwJJRmkfDRX?=
 =?us-ascii?Q?q8D4//MZIHnpjhE5Nwvdm1A2MlU1CvLgUoUdVhcxamF/BXhpPWloEKesJxWh?=
 =?us-ascii?Q?uYWs3NWU13vhp6pVUyRmDYxnCFX1h5dziQ7l5qxqbbF24nQf3yT6HTEMUAVj?=
 =?us-ascii?Q?x1QkFKoJjBlerDMpc5ldbVqdXQfjKIa4NEwVWTi+IDPQ6NMEi+5ukayoxpsl?=
 =?us-ascii?Q?WzqeWG4O+Dmkd3lbn/ZjymEd3hhgTbEm6g1aZYJVp5cbERP6iZGi5O6pLzDn?=
 =?us-ascii?Q?WwG8S4hmGA8fVXcyKJ+XpKdrq9bvpVsBt30ggbScNQEbVFGFXV6YMF30Gq0e?=
 =?us-ascii?Q?Y5tJuhgu+7+r+LXy1+Nh8nn5K9BfLg+SDq4bci7zdBnnp3+MC4b77bFVzquQ?=
 =?us-ascii?Q?RL8lkU0sEoUg47jCtuc1KRTTydFeepxhA+NTFmZ8E55QpROAFoQrqyELRYkg?=
 =?us-ascii?Q?ySLMBkJk5wWxYfM4qqtMiEGKtUd8Zfg/LRc9vBvqFgqwDsvAaMGzhr9PGFfV?=
 =?us-ascii?Q?AbgAObn1TB8X+4VFFjiTB+4b3y627KrBQItLhxpDh8X75tyu1KbpnSS3VvYw?=
 =?us-ascii?Q?v1rhGmIqUH8GlP96SoSffV0RQfdgZd9RdV4LwglVmpXW7JpKJ4HJPOsOdL8d?=
 =?us-ascii?Q?AHGS7+SzDONum/LWIyq9Ov9scdsOrQ2BzI+MVq/KXEGGxHpCrPSm1XNpqG0N?=
 =?us-ascii?Q?I+zAXQEZ9qsD5Fag0JmJ9RidMjbn/EZz6Vz2dZwOPCDMsa+1AjUlC5gBA8hc?=
 =?us-ascii?Q?m/AY1VwPf1vYli32d5z8M3Ku1koSlMoYW0f5cYPYtqqQuZ4jEU3Rz+P0cp3f?=
 =?us-ascii?Q?B7RE6xs7uQKHm/1Se9tSCpf7shFu8F8YmfIhFZdyYJjEciukSH7aHCLxmjcD?=
 =?us-ascii?Q?6/02kErq2k+aePP7jgQMROKaGBzUrI1/wEEfnpY75IJ4B1PgnlskwZzUn5a4?=
 =?us-ascii?Q?siLSHSG+Ibq5UrmAl/AZECqI+s9OqziknYUM7L8QpvEyubEA/cWB1ZgYjSd9?=
 =?us-ascii?Q?CqS8259wdf6olbMjEdCzvwIJ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3568FC6E05EF8340AA901D8626E5AED3@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 66005162-e7f5-4287-be60-08dd4cdf1b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:05:28.0301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10024

From: Aditya Garg <gargaditya08@live.com>

The only difference between the fn mapping of the MacBook Pros with esc key
and those without is of the presence of KEY_GRAVE in the translation table.

We can easily use a flag instead of writing the whole table again to omit
it from the models that have an esc key.

Additionally, APPLE_IGNORE_MOUSE quirk was unused in this driver, so has
been removed in this commit.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
drivers/hid/hid-apple.c | 72 ++++++++++++++++-------------------------
1 file changed, 27 insertions(+), 45 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 49812a76b..e31c9e8e8 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -30,7 +30,7 @@
#include "hid-ids.h"

#define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
#define APPLE_HAS_FN		BIT(2)
/* BIT(3) reserved, was: APPLE_HIDDEV */
#define APPLE_ISO_TILDE_QUIRK	BIT(4)
@@ -43,7 +43,8 @@
#define APPLE_IS_NON_APPLE	BIT(11)
#define APPLE_MAGIC_BACKLIGHT	BIT(12)

-#define APPLE_FLAG_FKEY		0x01
+#define APPLE_FLAG_FKEY			0x01
+#define APPLE_FLAG_DONT_TRANSLATE	0x02

#define HID_COUNTRY_INTERNATIONAL_ISO	13
#define APPLE_BATTERY_TIMEOUT_MS	60000
@@ -89,6 +90,19 @@ struct apple_sc_backlight {
	struct hid_device *hdev;
};

+struct apple_backlight_config_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight_off, backlight_on_min, backlight_on_max;
+};
+
+struct apple_backlight_set_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight;
+	u16 rate;
+};
+
struct apple_magic_backlight {
	struct led_classdev cdev;
	struct hid_report *brightness;
@@ -152,20 +166,6 @@ static const struct apple_key_translation magic_keyboa=
rd_2015_fn_keys[] =3D {
	{ }
};

-struct apple_backlight_config_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight_off, backlight_on_min, backlight_on_max;
-};
-
-struct apple_backlight_set_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight;
-	u16 rate;
-};
-
-
static const struct apple_key_translation apple2021_fn_keys[] =3D {
	{ KEY_BACKSPACE, KEY_DELETE },
	{ KEY_ENTER,	KEY_INSERT },
@@ -209,32 +209,10 @@ static const struct apple_key_translation macbookair_=
fn_keys[] =3D {
	{ }
};

-static const struct apple_key_translation macbookpro_no_esc_fn_keys[] =3D =
{
-	{ KEY_BACKSPACE, KEY_DELETE },
-	{ KEY_ENTER,	KEY_INSERT },
-	{ KEY_GRAVE,	KEY_ESC },
-	{ KEY_1,	KEY_F1 },
-	{ KEY_2,	KEY_F2 },
-	{ KEY_3,	KEY_F3 },
-	{ KEY_4,	KEY_F4 },
-	{ KEY_5,	KEY_F5 },
-	{ KEY_6,	KEY_F6 },
-	{ KEY_7,	KEY_F7 },
-	{ KEY_8,	KEY_F8 },
-	{ KEY_9,	KEY_F9 },
-	{ KEY_0,	KEY_F10 },
-	{ KEY_MINUS,	KEY_F11 },
-	{ KEY_EQUAL,	KEY_F12 },
-	{ KEY_UP,	KEY_PAGEUP },
-	{ KEY_DOWN,	KEY_PAGEDOWN },
-	{ KEY_LEFT,	KEY_HOME },
-	{ KEY_RIGHT,	KEY_END },
-	{ }
-};
-
-static const struct apple_key_translation macbookpro_dedicated_esc_fn_keys=
[] =3D {
+static const struct apple_key_translation macbookpro_fn_keys[] =3D {
	{ KEY_BACKSPACE, KEY_DELETE },
	{ KEY_ENTER,	KEY_INSERT },
+	{ KEY_GRAVE,	KEY_ESC, APPLE_FLAG_DONT_TRANSLATE },
	{ KEY_1,	KEY_F1 },
	{ KEY_2,	KEY_F2 },
	{ KEY_3,	KEY_F3 },
@@ -415,6 +393,7 @@ static int hidinput_apple_event(struct hid_device *hid,=
 struct input_dev *input,
	struct apple_sc *asc =3D hid_get_drvdata(hid);
	const struct apple_key_translation *trans, *table;
	bool do_translate;
+	bool dont_translate_flagged_key =3D false;
	u16 code =3D usage->code;
	unsigned int real_fnmode;

@@ -481,14 +460,14 @@ static int hidinput_apple_event(struct hid_device *hi=
d, struct input_dev *input,
		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
-				table =3D macbookpro_no_esc_fn_keys;
+			table =3D macbookpro_fn_keys;
		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-				table =3D macbookpro_dedicated_esc_fn_keys;
+			table =3D macbookpro_fn_keys, dont_translate_flagged_key =3D true;
		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-				table =3D apple_fn_keys;
+			table =3D apple_fn_keys;
		else if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
				hid->product <=3D USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
			table =3D macbookair_fn_keys;
@@ -525,6 +504,10 @@ static int hidinput_apple_event(struct hid_device *hid=
, struct input_dev *input,
					do_translate =3D asc->fn_on;
				}

+				if (dont_translate_flagged_key &&
+						trans->flags & APPLE_FLAG_DONT_TRANSLATE)
+					do_translate =3D false;
+
				if (do_translate)
					code =3D trans->to;
			}
@@ -680,8 +663,7 @@ static void apple_setup_input(struct input_dev *input)
	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
	apple_setup_key_translation(input, apple2021_fn_keys);
-	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
-	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
+	apple_setup_key_translation(input, macbookpro_fn_keys);
}

static int apple_input_mapping(struct hid_device *hdev, struct hid_input *h=
i,
--=20
2.43.0



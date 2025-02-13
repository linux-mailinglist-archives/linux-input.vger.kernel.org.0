Return-Path: <linux-input+bounces-10014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6148A34941
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 17:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8A53A507C
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 16:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CF4166F32;
	Thu, 13 Feb 2025 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="E11rlv/p"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011029.outbound.protection.outlook.com [52.103.68.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D3014037F;
	Thu, 13 Feb 2025 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462781; cv=fail; b=N9pk8iMzdr79pRYsQwRy5JmWrvZX1D5yYI608NIU3gSQ7ud4Ga0czp/W1xbQYmQ4tDZFmbtf4HdVhOg86ytX6tj0NfUa/Ux1xqbqmVHkNQDE5ucv/4qs4ehDgWtBYpU1SIisIxqiMDB1UC5kDaAVqsqHo6luh4WZIOStCz1JLUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462781; c=relaxed/simple;
	bh=HUjGOwGORUUdfbMj5Xtobyxi3hxsyKmzoMQ2mXDXuxE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WLd7ehDvX9Ez5ONwnyX4dqkXPBSibdmnDmOrl0w8J9wE/xNgcefOnE7JNW5LAIrxrkR6eQeVvwp3so3LWV4wYitoXUOqyb5liGHFcKyBILNslD5eLwE8bD1R+wri9NNyi8c9eO4kTbQxEEo5FGF+fjMDOiAwcPhjTEw2XOfmi1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=E11rlv/p; arc=fail smtp.client-ip=52.103.68.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqMztOi724b+sTlnuo7UBJGJI+rC1xzVnxAmbTY3Sh+QHR5cMf6JuOU8ExuD7XPg7tmMnPFD/zshrDYxj8K9JLFNLVZzZMaAnc6TwJkmQHC2A3YZz10dZJfmrN/J9nCGvkSaJD7s3QDjkZ2we1yy8666jarLVweKclAX7Xd7CyMb8IveaePtxZhqWwD2S2YMlwXebXwoRoTki7xKirvGFoDF60i3D97DB3d4vFXwPAyhjsr8fN5M5raZ4ycQLRODzwichBFQ8ClPqyl53btUf7G/E6julf3MZBTlUsW9dIULdXf3BT1PRm8x33ITvs6ytUAgeUcCaETdTwY0f6MSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln1hnXInMtsRD0oVrDyBi+11wZajyLpmLlIuaL4Oi7w=;
 b=Lst5J7UYQZGi17U2ce1szy6OHfgQyV1qvbpNut+t3Sng/sTr/P3p4UaM9wk4eAeZ0EfTcB9ZuUdb8EXlXQEbnpko/SrV6p8hKTi+MT68It2SbBmtoRhGQZNBNZfcn1iSHq9pMaRJw2Jledkh9/oHgVvorRMftNa1Mc/p6/lCPLez2XcG9hSv8GkbTszuddlZmd2OHR1t3ZPtLKe6uYESC9VVYn8oVxwukZjpre5G7U6BqB+DKQcJEl590glZ6awdvvh0QlXkXxN4US3riKHEd35wmGPkpkRWXhcGgEKJuS1IGtb4J/9tufyQcfL7Kuyj3LQXOeKyK64sOgoRr1PjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln1hnXInMtsRD0oVrDyBi+11wZajyLpmLlIuaL4Oi7w=;
 b=E11rlv/pTahIEyhqYFjMBjSPfGsYXyN6312sJ2WEbXPFSNlr5cCBrAICyRl6h3aii6G5QYC2z5YAbMS+d2/pZ9zXAfcEiBIDIk15SVLx0n5wffF53/23sKTJle5Lr4g75S6Nz+GuBVrLJrWtZ/AqOgqtfPqQS2n9sJDT7Ya4YNijedle4dAefW3gluV+ujbD2utdiy9HZ5Id1B3VIRTm4RfT91bdS1IKny5RwZLY528uBLaEfD8XTClVip+Plg7TEdTWD+805Zq91kDbJx7G8OXrCKmOEJ6L5XipdiWAnXC3SYiXOpAx6M0YobxDCnco9s80r/CkaNMHMTiWq6HDMQ==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MAZPR01MB5470.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:69::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 16:06:13 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 16:06:13 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Alex Henrie <alexhenrie24@gmail.com>, "jose.exposito89@gmail.com"
	<jose.exposito89@gmail.com>, "bruners@gmail.com" <bruners@gmail.com>,
	"seobrien@chromium.org" <seobrien@chromium.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 1/3] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Topic: [PATCH RESEND 1/3] HID: apple: Use common table for MacBook Pro
 fn mapping
Thread-Index: AQHbfjE0JC6l/xNtMEOF3BbiHe3B0w==
Date: Thu, 13 Feb 2025 16:06:13 +0000
Message-ID: <FE7D2C98-2BF5-48C2-8183-68EC1085C1EC@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MAZPR01MB5470:EE_
x-ms-office365-filtering-correlation-id: 9aa2d586-d68a-4871-3c9f-08dd4c48569c
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|7092599003|461199028|15080799006|8062599003|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QXqYWhHoyZeISGeyZTYlWMz34dJGgSiCfpRH4Vg6prGQxScrC4s8dv9Yu0F7?=
 =?us-ascii?Q?MIjU8rlcu9lH5GsEwfqBcU+mfLWXk24RUYuq2/bZ65E2fQ1pi63sfoansg2V?=
 =?us-ascii?Q?8EWgZzATRioUuAM1oHRwmbMKh5vHmrdPA9DF60awe8IBEfC8bPhOhXbFecn9?=
 =?us-ascii?Q?h5wRLg0yfkw5/zJrCP73GpF8K3CwThBrh5eHcdu+kRJgKNHX4bcCDTPQpFN5?=
 =?us-ascii?Q?eIevQ35mDaxs8n+bDUClyR0itX+j4O89P2YC0FivwXRuhVe/4AK3iYgUDH9M?=
 =?us-ascii?Q?rvfsBuo1kq8IJTF0pQxf8LT5frpcEEKYzs1v0bR597gY20LlcSFYo1+W7Vkr?=
 =?us-ascii?Q?ImfKQBfzraWyb93iQ0qNB10jk6LUVV1vq6k0i0FxCq2nLXXHAp5zFkbXUvsW?=
 =?us-ascii?Q?4VEGDSdvhT2lbLLkJkTQ8NrMUaZd0GCB2R63NWZelEZ8+dWHBFRY+wl8MlAv?=
 =?us-ascii?Q?eekRqKxW3I9F64osWVIwUW3djuV6NDmRSBrwQbIklOLt9C4p1Z8DObMODZye?=
 =?us-ascii?Q?iB1cb93P+FlKRFO6+SWgQn8CpJavdOdfUKIV4v4HpNx6234P/RgAnt2gk8S1?=
 =?us-ascii?Q?sqPT5dJdsXu3fVX0ucEvKnT6gsdwW/HeofMxtI9iXt7xGt1qhiu0/J0hJxuE?=
 =?us-ascii?Q?7iWa33duELs2pDEpUUWoOjHXJiW4+3XIt4INzYzOZ+q8izjN4XKPUv/tv9dS?=
 =?us-ascii?Q?16ld7+SLyFNvzpe6V4Q3tiB6qsJ05xmgVVa4rKxe404TkpiDhz2DsR+W9evf?=
 =?us-ascii?Q?9mveHNo1B0V8+AEszZTxeiLiaKfYsXIpyE1NgjGVnARsB9MbvAWLBTk7PquL?=
 =?us-ascii?Q?k5ZYS/3Vg00pOW3CQSzpcuT/QZzUD6p7YPxkcgV/tm4AXIOQqKD6WLPsqmmi?=
 =?us-ascii?Q?2WCAZwoBjn1gr7eyRV1wGzXVHbtG+bUQy0ebo0UNRFBM7+uOR1zva7bGBwzn?=
 =?us-ascii?Q?SeR1bXyXkzWaGdn8YUG77kBIX3ZlByGEoVM6B0QfBcXAwX4YpSWFyB2O+gZy?=
 =?us-ascii?Q?g8Rg1SePhfV4gHVjBihYIld1eomUaaE4hHzHkqaWLWhlRWir7b6pEg5wFEuM?=
 =?us-ascii?Q?0KWGxQtpqlcLdMxkn5igsRhiREsGvQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GUMEwdYi1gEPWwNjYv+0UNmIxJSSE4/G1aJUsiq9RG5ivt3HXQSW1dOqLyD0?=
 =?us-ascii?Q?UEq0uCYiVu+HT+8vmt3Ye+uELtuc/TQIuYIpzoQZDNbKgHiEIlKPA3tf1V6+?=
 =?us-ascii?Q?Jbnjta1pykXF8phvuPrGyEBv6jAbRnfvplUeumLVFsny0PywXB+6z6rZYvTw?=
 =?us-ascii?Q?uOhOB4jgcNumGiHOrzdu+dgaZaL/deJZbJaeRcbj4XqODC4cLzZpGZ4Z3Sek?=
 =?us-ascii?Q?zF/wW7RmlovmKRRcBCg88J9JrHdB5W3adzxdeMm0/iOEJlx6FWwEbdIdTj54?=
 =?us-ascii?Q?ORegQdPyEjzX3nvyVvbCXlh72INISvmMMulOFDKdvl7hGXlCx3fMHQhMBlee?=
 =?us-ascii?Q?fwPraEKJNwz/by4+GpY/TuEI7EI7dkfYH2iftxBEoyT396/WIAaYCmY2/q4b?=
 =?us-ascii?Q?Mb8BLzHe+QKZ9qnDaGmiyc6LmqNPAfA0sJ8r16ZqDxjOH4ZeRmqDO8xbjNYh?=
 =?us-ascii?Q?zjiTmMtTNjeU/VnbDyagsqqKY7XG8USQtsPw3cdw1dL5RFc2RaozFTg6ZHpL?=
 =?us-ascii?Q?O8nQ0HhpCUCqfRJDYMsr2MHLdkIYwk07ypjDi0J/02JaxIO1BpD+BSVmMeI0?=
 =?us-ascii?Q?o5fDg51JF4XBiKgruGkP77+a6NEmr6F3Y3Kf14WMkwzO8h2k+FjjGmO7aWkc?=
 =?us-ascii?Q?fKS1cDBgs72badxdemElqiateC+uQ8PnoyDNw9E2qhamF/aUKBOzSQOX2V4n?=
 =?us-ascii?Q?GporMYANj1h0NbdJAEluAgAv0LXx114hhEkpSvy+gay4wHIwIw3t+YYVa5kI?=
 =?us-ascii?Q?pYAGnbFwZ8SRTV8EGGKh2JZtDxTbXMojsea6efZ1Dm7E3WdN4sEnbE/ZW6Oo?=
 =?us-ascii?Q?bcg3Gh6pcwc+WahN7rhvM+d65qKIhX4rAsfsg5LuGhWWIre1tijVa5equuHM?=
 =?us-ascii?Q?B+ZYp7dFBOmPj8fwEpZQQJB4JviDHHuw338JxIe5WRal55dZIA8rMDj3q0uL?=
 =?us-ascii?Q?gyyDbGY4MeoQWREOxLKFcuxtwp4leNOWyoJlG7SvuGaSKW6ab4buLIkPN5zN?=
 =?us-ascii?Q?uWXdUTPDEll0V5rYojetvUGWuAMA2jdurQqF/L0N7k0V/jHn7blL+NcrEoe4?=
 =?us-ascii?Q?B4LMwgOqRl+xKzmIulQks8CT/4OLr+KSiXN1fj/XUoKU34xqKlA43hdWrDs4?=
 =?us-ascii?Q?51AzixDrjUPFmdAhz4oYksyFpaPLEXPNMKhxgi0rvdUdUVfW9PK/vKAXdszD?=
 =?us-ascii?Q?uQmU6Y9/an1T6GjKhCetmZERsV89hRDgKHoiiLIYek1YSFmC6+JFoqCcryfm?=
 =?us-ascii?Q?L1k+5pxgldxqZ/IAlx2oF/mF+FWuwQT7LYB8M7TON/S3Iw0712Jx65mJ95r4?=
 =?us-ascii?Q?ffXarIrmGMQu7YKz5ygrCxQt?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24B13D873B767A43891350ECCD6225E0@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa2d586-d68a-4871-3c9f-08dd4c48569c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 16:06:13.0406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5470

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
=20
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
@@ -43,7 +43,8 @@
 #define APPLE_IS_NON_APPLE	BIT(11)
 #define APPLE_MAGIC_BACKLIGHT	BIT(12)
=20
-#define APPLE_FLAG_FKEY		0x01
+#define APPLE_FLAG_FKEY			0x01
+#define APPLE_FLAG_DONT_TRANSLATE	0x02
=20
 #define HID_COUNTRY_INTERNATIONAL_ISO	13
 #define APPLE_BATTERY_TIMEOUT_MS	60000
@@ -89,6 +90,19 @@ struct apple_sc_backlight {
 	struct hid_device *hdev;
 };
=20
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
=20
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
=20
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
=20
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
=20
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
=20
 static int apple_input_mapping(struct hid_device *hdev, struct hid_input *=
hi,
--=20
2.43.0



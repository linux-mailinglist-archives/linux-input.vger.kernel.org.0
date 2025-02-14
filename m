Return-Path: <linux-input+bounces-10037-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522BA35B25
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 11:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841343AA705
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 10:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005FD253B51;
	Fri, 14 Feb 2025 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="prFahGZQ"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011033.outbound.protection.outlook.com [52.103.67.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8F245AFC;
	Fri, 14 Feb 2025 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527596; cv=fail; b=CSHqq3CiEs00yKwhLTv0dZEom9zoksRZ9w5bAXXJ8mH9PzWuC2imN6+iaUY3ss5cQ+TfnKeEk3TA1pjM2NSiOUWQusaBA6unjDS/AmsNk+Mw1DBJ7h5l3jeE5jJkRBezAAhk/mLwvxRIM2dk7f6Q5wi1nQr5u8coLi7Qo/fV4dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527596; c=relaxed/simple;
	bh=sD1jvvWT2rxIO6OqFtPzmcjsMrwmOYQqylV168cdCbI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=THffvBS4hMFa4OTlAQ081BJpBy8xYOwsVyYxLE2sBsA2JCscoaV6lIvQg+YNsR6fm98Hk1GXNFQwalcg7RsrL+3lbaNcs5IU4gjVOEnKM7yYkPpoUHZVECCLHlVfCXJqtXcTwO1oeUGzH3YDcWZWqqI5IprlRtQDIHC444KqH4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=prFahGZQ; arc=fail smtp.client-ip=52.103.67.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbyZTpQQfdEKl/PSkR5Ni+yPzYb5SXtXtuQY5ZCUE2d/jj15fA8MWd0Uea2cq7s9qxLEqvySxY9PJfsU9ROpBspnT6dixphELCPsT+pTw/8ek7TrgKT54ieFRuPJekiXCc9Lzx7PcekaS0LnpfBlavGvyCZhIS1j9sR3YaYTdpMK/0znJOCmbqEfhaHgWTBjoivOqGi+CTUroYLjFrrTg4ia8XpnAXupX9otFVFGhu1pgmtpTuh8MDZjNl3Et2q3ojGnI1PSTT5iF29dHtmPvB2jP2lG3VO2QRQjkgfXF+1iLN/8S9CQOIqrZd7yBCEOgJ+cNXjOO5e6ak0q0rq3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNTkrnDOQHTmcrrp4WpdDhTU3N+BTqCwYDZ6RHeBaCI=;
 b=jlEND6Sz8K/NacFl7yL1SHoQNKnRmyxSJlp0fybmJ1N7P75svhC7zZC25hFPB1jZLu7CEUw6SYsi2NQwoze4gFmGAVzUUqDEqf1qUMiRurlMqKV4fixMsS6AH++cNk59ZKAuwBMMo0+nydD1KyHAUwHQO9OGxVkK5YBds9O3NRPGbFncgfRKjAJhXYLZGhW26HSwIJQIb5P142DZrEp5spp+rcCPxdlbXU3C70x17F5JGpoJ5Zilts97PFndWJx7HH54cJTqnDgkR4AjfRvis3gRtHNQBQLkPgZPdLthGw3kach8gopHapQugDnIgrVV5LQ+2gwI03vTfeXO0tricg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNTkrnDOQHTmcrrp4WpdDhTU3N+BTqCwYDZ6RHeBaCI=;
 b=prFahGZQRIJBdipAMitzQC9skO2fn+9+jaoWOqXpn+xSeLJXhm4bmEJODCmUQhQ1UBuM5y/VvFV3VEhOeonhtyAodzE93Glu9Wq/aors1mYj6ZreShpBECtXyyysUEGdXMoAfb734yr8WuYYHuTsFt0D3+11etC5PuEAIKAE47bpHRSOJI+rtxZFRs5D8UeO3NkYoXAfRKuzeuQm+R1y//ibTb0BMXgx8G2sKx2KkODmROykHvx5JWbMI8vJ+dmDYG3ZHDIEou76Yq/tWPOC1h+WWUTEN15A0M/D3WgBDgkHf5ETZrCWJhDMRjHn6/xWKltMLYnJ2Bya1SoXYwC1EQ==
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:107::8)
 by MA0PR01MB10024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Fri, 14 Feb
 2025 10:06:29 +0000
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866]) by PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 10:06:29 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Alex Henrie <alexhenrie24@gmail.com>, "jose.exposito89@gmail.com"
	<jose.exposito89@gmail.com>, "bruners@gmail.com" <bruners@gmail.com>,
	"seobrien@chromium.org" <seobrien@chromium.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 2/4] HID: apple: Use common table for Magic Keyboard
 aluminium and 2015 fn mapping
Thread-Topic: [PATCH v2 2/4] HID: apple: Use common table for Magic Keyboard
 aluminium and 2015 fn mapping
Thread-Index: AQHbfsgdKRgIiIMrYkqoMoCRLaZDNA==
Date: Fri, 14 Feb 2025 10:06:29 +0000
Message-ID: <1DD2417C-2BC0-4B00-88CD-3A8583A36BFF@live.com>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
In-Reply-To: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9615:EE_|MA0PR01MB10024:EE_
x-ms-office365-filtering-correlation-id: 2f17cf07-7c5c-46a5-d369-08dd4cdf4000
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8062599003|8060799006|461199028|7092599003|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KV4f1zqTJAmZ7wQ11nJoNNUz1W7zFliIAXTXwMixWz7m/r1z+XAWx58Mv2j1?=
 =?us-ascii?Q?/7wDNyXZKXc9gcnKejziJEwHxE4oBPTWV9ax3KB+4jj5GHkQSzXt2xtJKSlt?=
 =?us-ascii?Q?3C/lRr+jsNJEh0SVo52E2LMqiZCL1BqUX41B7zw2CBwBdnmWHYqxSEDDtGBH?=
 =?us-ascii?Q?Ll9YZyWOVh2r5maOnKEF6/RLYEgy4M3FTFX6vHYZGcJeTzERCOI0SQ1inqsW?=
 =?us-ascii?Q?+guH+QMazIQXz96EL10H7lLuXRgscbUiQunZFGciMitYaLa9niC8fYnLb61p?=
 =?us-ascii?Q?PhTUYY8K1eedX6mYJffYi8BpE5da5CZrRU6JpLFL5AY56mE+uJqJ18+noSJ1?=
 =?us-ascii?Q?OL86d3pIHr+L73FM7SG0G7LEUFVaiQ526sBZYxVR9GIytJlr57ON9TOiBQMm?=
 =?us-ascii?Q?mBt6ajQksYuoT+xb+YlbJQqouSIr9o6zzpe9VT3re4gtO4x28ZkwMc3/xEkL?=
 =?us-ascii?Q?EXZy9/KZlYbNvmsGzSafrXr3vY4Cq83JVLrZTOyKgfxk/tyFRbpFDV6Qqrqx?=
 =?us-ascii?Q?EC+g0QGYL7VHB2juH04o+bj+OQPL1chmthz4JsCdH6xXVACTyEBNQavWNam9?=
 =?us-ascii?Q?XBpp3n6i6VFrP09ndnQL0iqoahocycNmveHd+vVxbisTzBOj72jzizuJUM5D?=
 =?us-ascii?Q?YXrDvGE32a1nuC5hiHp2t/DmhmJVvi9P1Tuhs40ZrNP4vEGhJG6kN34aIhLp?=
 =?us-ascii?Q?cT6V90EWqLPVdtidZxq6+X+sBUjcBwvdBwOGQqhjTvFzRY5Ef3OEe7knAcU0?=
 =?us-ascii?Q?KGZQ8Vmp/WdoqZP4ceCzvpRQdhHwLsmkhRk2OdQiCCxkmuhES/tbL6bql2nD?=
 =?us-ascii?Q?k9hlZRvG7GaDcM4FITFOMUkPDfRuHep1Zmp141LCRScvHizJPjD0lHsdGfYO?=
 =?us-ascii?Q?dH10Pu3xAv9CW1wxuNCcBeR1de1dSM24Bgy0Cq5P3E8H9TawzgORna9r/k3Y?=
 =?us-ascii?Q?feUxhHvcHXtURDbcg9xZN6d3nBukKIrfI2GxWD0ZNk2bM8Il3ykIIBbzClzj?=
 =?us-ascii?Q?49y+3m4o4nvpCvYMGmIxeue8NKUmuWxNIyAuZRagb6EtOekIlkvN0a2Ucl8b?=
 =?us-ascii?Q?IgHDfj3IHOi6KtVxBcBZKVHxLExYRQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nv9iqEfKOGxp3VdOyGif3zrzzJUKoz82BYYzCF8x8IwY6vP+THnO6PSzgTXw?=
 =?us-ascii?Q?/RKD0phvBYduwUjHyLGPEFXg3ePAeuJrFk/wxqIUt4z1eXq5nKjqy6E2m7Io?=
 =?us-ascii?Q?ZYeE1U8y/6gDSbQzlDjUI/i6mOhsgYhMoBscLV8UV+9LB66R43/e0dE4Si2y?=
 =?us-ascii?Q?LL+GgbRWhFZfCBNgzujRDJps9puQ/SEcmHhj2A7J+TC/01s+W+6KcZors5y9?=
 =?us-ascii?Q?s17ObkiEsW1858MCzdYWUIVnsNtn9VKq6zAAVWmTSK9wAZlV0s2D9ykIqrpO?=
 =?us-ascii?Q?w9jxOCxgRIA9Ll9UWyLyHRx4WNhCF2DHiBc0ICT717kBkz98X6nMe+K2ZmKp?=
 =?us-ascii?Q?zRg+qY2YsmU152cWt3JQuGUJyRbii0IUtKms/qd+21MiP60FpKwlvWoEVBvY?=
 =?us-ascii?Q?i3hrCIrAlH0Dfl3l4t0zDXwNQ6/4ZZEIK0NRFX1ndhAe+uDy1ZybxGJt2SzW?=
 =?us-ascii?Q?0O5Yf/23Bd47tS2O0BMdlJPKXuvkKonppyyleSB/oQa0fjNI0EFFgChEFsxp?=
 =?us-ascii?Q?BPLoixE2JPZ7VEoeKyfbqb8lrX9/qs2+U6G6NAl9FZje1eka/PZPAWK565YN?=
 =?us-ascii?Q?n4CblifnBUylHQFq4VZVjKmtZEIDeyLFy8xeQRzBHVGa8ZUDjAJO6hGICDnX?=
 =?us-ascii?Q?TWKELYmsjrwAAhMsAgAFF/tz1n0vVfkOu6fkjiyDI6deAG3/wvv4YQiFC4T7?=
 =?us-ascii?Q?N08Y56GYqX5jZWUB+52m61+iIM93j/iPJ9pnXE2WwdAncle3Cucr9lC0jJOT?=
 =?us-ascii?Q?ayb5bAF/EAmaBzD7cpEBy3nsZikGlDFMnPae0bqUqc6PtJAayrpZot4lnxq0?=
 =?us-ascii?Q?NVsEzIVfIhWGrtoPEDFtseW9JLhQsX01I1h/NAoRUdz29zImWmAswq3QX0Ff?=
 =?us-ascii?Q?Em9u3JZYIuvf6t1isJhx9fB2+tPnnNQF3afNOBTwryk2RsGcViirUvJ2zR6d?=
 =?us-ascii?Q?qNX6ypccdgf3oR++/JQaKrW8Wsm0ruR2SbvHOJY6/bS8ujEPu/StAvnHCm/k?=
 =?us-ascii?Q?6cS2mg71jXqUt5uZ5Ue6TBDJLLsN1ShNc89plSJ4eX3fstV4s/7E3VCoqifX?=
 =?us-ascii?Q?1oPh5OBOiJRuIp52GfSXXON11woR4pmsQpd4f+TO+uSfS5pzhpZGnvQZXEoF?=
 =?us-ascii?Q?nhkBbzCWNnn+YSiy+aJ7+6GzLxL0JzZtlKgxmz3BwnRWA1P1JHZZ9DvvI1KM?=
 =?us-ascii?Q?m4YCm4TGZJBdPaJUt8hzYAe7B4z5Vt12r3iKE3MtlfS3sDkOZg4GzsX4MkRW?=
 =?us-ascii?Q?MooTQ20rtWCGm2hqJs254m1d6pN66l/eQKfQDxHWj0AEbJ8L9DBOSLQxvqeb?=
 =?us-ascii?Q?hO6VO3ft9P2Mn47SZNRmhu/a?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <217FB548C2D4224394574CB17CAA6336@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f17cf07-7c5c-46a5-d369-08dd4cdf4000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:06:29.1667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10024

From: Aditya Garg <gargaditya08@live.com>

The only difference between the fn mapping of Magic Keyboard aluminium and
2015 is of the presence of KEY_F6 in the translation table.

We can easily use a flag instead of writing the whole table again to omit
it from 2015 model.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e31c9e8e8..ca462e483 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -125,14 +125,14 @@ struct apple_key_translation {
 	u8 flags;
 };
=20
-static const struct apple_key_translation magic_keyboard_alu_fn_keys[] =3D=
 {
+static const struct apple_key_translation magic_keyboard_alu_and_2015_fn_k=
eys[] =3D {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
 	{ KEY_F2,	KEY_BRIGHTNESSUP,   APPLE_FLAG_FKEY },
 	{ KEY_F3,	KEY_SCALE,          APPLE_FLAG_FKEY },
 	{ KEY_F4,	KEY_DASHBOARD,      APPLE_FLAG_FKEY },
-	{ KEY_F6,	KEY_NUMLOCK,        APPLE_FLAG_FKEY },
+	{ KEY_F6,	KEY_NUMLOCK,        APPLE_FLAG_FKEY | APPLE_FLAG_DONT_TRANSLATE=
 },
 	{ KEY_F7,	KEY_PREVIOUSSONG,   APPLE_FLAG_FKEY },
 	{ KEY_F8,	KEY_PLAYPAUSE,      APPLE_FLAG_FKEY },
 	{ KEY_F9,	KEY_NEXTSONG,       APPLE_FLAG_FKEY },
@@ -146,27 +146,7 @@ static const struct apple_key_translation magic_keyboa=
rd_alu_fn_keys[] =3D {
 	{ }
 };
=20
-static const struct apple_key_translation magic_keyboard_2015_fn_keys[] =
=3D {
-	{ KEY_BACKSPACE, KEY_DELETE },
-	{ KEY_ENTER,	KEY_INSERT },
-	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
-	{ KEY_F2,	KEY_BRIGHTNESSUP,   APPLE_FLAG_FKEY },
-	{ KEY_F3,	KEY_SCALE,          APPLE_FLAG_FKEY },
-	{ KEY_F4,	KEY_DASHBOARD,      APPLE_FLAG_FKEY },
-	{ KEY_F7,	KEY_PREVIOUSSONG,   APPLE_FLAG_FKEY },
-	{ KEY_F8,	KEY_PLAYPAUSE,      APPLE_FLAG_FKEY },
-	{ KEY_F9,	KEY_NEXTSONG,       APPLE_FLAG_FKEY },
-	{ KEY_F10,	KEY_MUTE,           APPLE_FLAG_FKEY },
-	{ KEY_F11,	KEY_VOLUMEDOWN,     APPLE_FLAG_FKEY },
-	{ KEY_F12,	KEY_VOLUMEUP,       APPLE_FLAG_FKEY },
-	{ KEY_UP,	KEY_PAGEUP },
-	{ KEY_DOWN,	KEY_PAGEDOWN },
-	{ KEY_LEFT,	KEY_HOME },
-	{ KEY_RIGHT,	KEY_END },
-	{ }
-};
-
-static const struct apple_key_translation apple2021_fn_keys[] =3D {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_=
keys[] =3D {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -448,15 +428,15 @@ static int hidinput_apple_event(struct hid_device *hi=
d, struct input_dev *input,
 		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
 		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
 		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
-			table =3D magic_keyboard_alu_fn_keys;
+			table =3D magic_keyboard_alu_and_2015_fn_keys;
 		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
 			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
-			table =3D magic_keyboard_2015_fn_keys;
+			table =3D magic_keyboard_alu_and_2015_fn_keys, dont_translate_flagged_k=
ey =3D true;
 		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
 			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
 			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_202=
1 ||
 			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
-			table =3D apple2021_fn_keys;
+			table =3D magic_keyboard_2021_and_2024_fn_keys;
 		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
 			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
 			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
@@ -660,9 +640,8 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, powerbook_fn_keys);
 	apple_setup_key_translation(input, powerbook_numlock_keys);
 	apple_setup_key_translation(input, apple_iso_keyboard);
-	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
-	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_alu_and_2015_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_fn_keys);
 }
=20
--=20
2.43.0



Return-Path: <linux-input+bounces-10015-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4765A3494B
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 17:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28C9E3A17BA
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 16:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426291CBEAA;
	Thu, 13 Feb 2025 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="rC8x9xx+"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011037.outbound.protection.outlook.com [52.103.68.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F21C863C;
	Thu, 13 Feb 2025 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462826; cv=fail; b=UonRzjeOzECz+LDKaUxirHcrxubdGjzkTa69H6SXKLXbF7kRhC+LjL2IZYbra5KsPdLxCUcbFCjlPVFqmsPvpspkU0PN1KS0Aq/W8yJTKhDipb1mK20dBcciEB55L9vKMhPwrqUeJJZK0CJu/pVGT1J/fl3MN+WbKydDXEYd0l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462826; c=relaxed/simple;
	bh=sD1jvvWT2rxIO6OqFtPzmcjsMrwmOYQqylV168cdCbI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LThEGErYUVOaUOiIIB75k2tkqfB8CpXBfUvKTYKxLkVvLxKEnKO87TLy5tzJR5scNowon6tWLyEQoAZUY4Ea7mE6RfJbKHYWR1HcaACAXTDHrPpzEj106k8bicEMa9DwtA8/qgJQKDAZ4MoPTClnT4fC5TcQ0cicXrSXufR0+R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=rC8x9xx+; arc=fail smtp.client-ip=52.103.68.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR+5VoLEuuX7A368U7ZqlMek/OKa/gIp/fqualxYriUjIPPJ/6Cae+85JbRTtF8uou0owEe9c2MwtsaXaNa9YvMpGnk3rdxeS1KozmS1nrYzHbNbW6y/mc5XKcF55xG6WutBx/rGN3TeuehIdv9n9E5jpylp0bdXJ8ymrd7v40qn7uQithkWP6bCBu4hCL/3UplBQHWDg1Z224Yd0RA7pheQ/f/NgG9H6iq6Me2YJNdyCdWH6wRbx41FramMfyoIJb+HA3TmKBLoI/TlVsWqzWokPopO494Q7f9nYA6gcOxjn/w6At8rdzByEw+VWVmzG9/0wV9Vxg7uaGk1fvba9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNTkrnDOQHTmcrrp4WpdDhTU3N+BTqCwYDZ6RHeBaCI=;
 b=w4E349p0ESPdtwYE0P4MlrobD1V3D7mJIx3oAMSEYeQ3BjrWbwhchD1MALOoIBFsOrM6SMKy9D5/YMO7nwq5vNIYTyf4IL0jdZj/tWAQqaJCr0wi6C9P/aB0rUTDU0kMhOpVttcpJf/DLDRLm2fVkqnHK2Hapo+LcUPrw1clybE+0lsDSACcNeN+izwbQmNZsrrBEfQ3sdgUTTW7yiecxVgk1ysFpTwMhD7gWTfpFcUsWBj3o5ttQI9dmzt8/GwSgqpySUIIFGkrcCU/DRcdOsin7+g875g/pnQ4EtVPyJj5gMGQ1DwgbzIPBvkg6EFG1Rk4127RM8po4mRjNg1xuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNTkrnDOQHTmcrrp4WpdDhTU3N+BTqCwYDZ6RHeBaCI=;
 b=rC8x9xx+WsY1s5HVIcQcZFhTc0SzZOKuucciVq2WgsQz+aiFN9qW63KOPkbNO6TNw6oADZbIo7q0LGQPbIXIg4A8IHFv2loBxYXq5js1D0fyjdGNU23vfTuNUkgMu9muX/NrMDetqy2aP0hSO52nTzTp1xypRCVcIypfPU4Ql/wcejvPEbOUb1It+u7HPA2fKOYNhEYFF+asLNF4/5knwmgvmOysEM0sCn59vCFDN4jJ7DYxbkhv2hj0E7X2OFWOsB77irpB8h56Tt4enq7Ihu26QJt63W6kuenwgvHomh5OgFD/1tD1Y+m6xPW1CNTjNLkm+lZJmSOvculCIPZcqg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MAZPR01MB5470.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:69::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 16:06:59 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 16:06:59 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Alex Henrie <alexhenrie24@gmail.com>, "jose.exposito89@gmail.com"
	<jose.exposito89@gmail.com>, "bruners@gmail.com" <bruners@gmail.com>,
	"seobrien@chromium.org" <seobrien@chromium.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 2/3] HID: apple: Use common table for Magic Keyboard
 aluminium and 2015 fn mapping
Thread-Topic: [PATCH RESEND 2/3] HID: apple: Use common table for Magic
 Keyboard aluminium and 2015 fn mapping
Thread-Index: AQHbfjFPSwpMxM2+uUm38qkmhukbJg==
Date: Thu, 13 Feb 2025 16:06:58 +0000
Message-ID: <68C708C5-EF7E-4CF9-B593-C538E4E730AF@live.com>
References: <FE7D2C98-2BF5-48C2-8183-68EC1085C1EC@live.com>
In-Reply-To: <FE7D2C98-2BF5-48C2-8183-68EC1085C1EC@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MAZPR01MB5470:EE_
x-ms-office365-filtering-correlation-id: fbd08ce6-3c4f-473e-8c96-08dd4c4871fb
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|7092599003|461199028|15080799006|8062599003|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?y+6JFX/lHAMSkc41EZ+W0ojfxeEesMohDAgvb9ycyHrd7eYiGYwPvsmzccsP?=
 =?us-ascii?Q?Cq7I9uhUZVkouS+0pGn59MpT0DTYpp4HAOv3+lL39YC1/wjuTYOkjI+BaCiZ?=
 =?us-ascii?Q?AS/vXvbHWNbMLzycrIvxvad8q7lL4tqOck1IdnoQmv8YPzAM5JnweiwB69fr?=
 =?us-ascii?Q?xzEPdXb8y+NAtzknKVEqVhl0YSWa2HCVSk1B+GcC+fAlqqyYPdCT7rbEqcR6?=
 =?us-ascii?Q?H3hKIFtcQOn3L1m0BUuMl2EfN1S25aFIGPmfKPY+22skKmYGRFzUrmInXUvO?=
 =?us-ascii?Q?iK/ekuGS+Nbg5d1ndWV51rYuGzG3wSIXQXZPmBFSmVRF3lY798nmFWBGYdfl?=
 =?us-ascii?Q?8edKZVJfIfdOlDIzR0NDQ8HLSvH6AeGW7PtrKBztL0bq1qs2zD/AGH4ehnhc?=
 =?us-ascii?Q?0OOYfu+34c2nSuZ4xU26RNWL1YGivS0ntm7RC1ySAXFYd/EZFEqaLhzM3cko?=
 =?us-ascii?Q?Isu5th6fNNUKGwmZG9R4BX5lExeOqHv+7PBS870T6e0yz0JovTFmKMXQJiVQ?=
 =?us-ascii?Q?SYlTEBsNF5G0+1R2xnq49X77OIn3HhXtbcjI5dP9GXqjpoiMgta5nrmOdlp6?=
 =?us-ascii?Q?H9xNRS38NTWNBRLfir9TO7eEuviGMQPRrdvWmR7NrSWl+J/mDx5DAzaiHfnS?=
 =?us-ascii?Q?HUSVfSTV0D9fEd4NYcTIsWen4LZlJciag+6RP2sShyrv5wT+zljV78x8bBB0?=
 =?us-ascii?Q?D1ZjRyJkvER0M0NqMxmHgqhtZmpbNeNqT9el3eyV8FUfhf/4X5Jr3D34j66d?=
 =?us-ascii?Q?uuElxcBEb6M+stZpqIDr7KQCQ8pshzB/G4jmDJsDb6XOl7eKGEgTQ4riZBJF?=
 =?us-ascii?Q?oHYeYn3DiaKv0DP+SBgvaA7o2isscXhu3MGioNWn/CI1SnK9H9/6ChR5PF0u?=
 =?us-ascii?Q?/ndLSKaj3lS64xll4pYsqVtMCcUyt5hhe4Bm0Ip2niwfGeDRMDL+jecgTCv+?=
 =?us-ascii?Q?IZqeVk1QLpDhiBU0LCA2Z3gPIoMbxyYBFY9wpRyBzIBZeSYjmyACzcyVRjn+?=
 =?us-ascii?Q?aEncqkLW/lYni2EUmfXBgBc5n1cg7Q0uXAD6U86yyQpgYoBJRyGACVNAyc02?=
 =?us-ascii?Q?qImOnJ9hVc4UMPkSvK7JDKERrSkBHQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TPCxUTHH59JpX7uV2E1qsLCu5WusfK98I9tNkRWetu6MrdbAyno7TrR1m4vY?=
 =?us-ascii?Q?RqHjAdwfM34r01/cX+KDn72QD3dqO+tuVV4r1Xd+loIPXA77E7oh4lt1dQsq?=
 =?us-ascii?Q?8MhLsd5nAuS0NM4Du7JvYtUYJbpbTpTWgNsUS62P/wh+Ov4CqxX3MswnLenC?=
 =?us-ascii?Q?vMLuYEr1WenYvdAT3O9VprXBIuFPWy1zYOUytBhWns2VEANR5eFti7XPICqS?=
 =?us-ascii?Q?75B5w7pIwc9MaT8E2b6+4Q9kFVJ11areV9lvN+3qpPGQwamyU7wyv5OHS+ak?=
 =?us-ascii?Q?xxcqGNvREiXo0HHk+cbwxX83l6Hvu/Ui3fVthSic+PyP1Gp9PZDLcvYITa9H?=
 =?us-ascii?Q?/i0x+ENBCJSDPQRjCYzO85B5ibMNclr6F4XU7Dvo56MRedEk2GShlQ31+8TD?=
 =?us-ascii?Q?rqBmViX1mOvXpS3VgKaiFPw/BG6A83uR3OD6YyubX4eEFEWOYBawVOy89Dtq?=
 =?us-ascii?Q?+Hd7NNGf7lMJVjff5CHJMvz0179M6Fih78xbrCs3W4z5adr3V8CkpXK+4T6W?=
 =?us-ascii?Q?2rfwsPmZdiZjXL3CC+aIer/GML4eRtC5Z0ockctr62Ft1mLnSLo43w8kyMX3?=
 =?us-ascii?Q?vWp2i0klOxHDCOVAtVnrPe+FbOEpTxNOkM2PTfXKuRG3VmjprP22yD0hoYlO?=
 =?us-ascii?Q?kocrOpzXz8yWbHGbYh7UOGteVydWqeR5hk3zxOmEo6t/Y3+CZkWp1yN7xsYm?=
 =?us-ascii?Q?Gh9s1tk2JgVbnb2Cy9lD8v/yx1Gi5zDYf8la7WSvlHP5sbmViVXv8FxT8nOL?=
 =?us-ascii?Q?FBq5LrrkIXWBDytn5v1sALVsCXZW7a4FVfBMn5+d6zl1wHWz0emj4/Wfu7t8?=
 =?us-ascii?Q?NVDyxVT0yRXpFCLEFHh0RAiZJysctcXPdy2IbO26TIoJwrgfn8cKqM8ajTgS?=
 =?us-ascii?Q?ApAevnxwOHGJmfu7xWX4xs3sjRTJsISZqjrQEaSgn/cMj4aP1SMH6fK8JW+9?=
 =?us-ascii?Q?aSTkDoQOHGJV7vqloYYuHCz5wbXYkdATMkHGb1o99BtexuirPTstJTjJyvZU?=
 =?us-ascii?Q?dWkrK6H9bfsBzCM5RD8uAmrD1eVno4Cx9c/x1guB91bKUwWlvbrm76B1Wx3G?=
 =?us-ascii?Q?PejhxNWMt3b7KNFu6rRcsVgE7AO1RaAm33XE48cmhwzwyc30wwIw/VEQ8E0a?=
 =?us-ascii?Q?ZJWeea3a1L5h2lUJ0JHHJ6LUeYDFa+c8CR0W5lysbnujhVJo920t8WeCRddA?=
 =?us-ascii?Q?tCEFMuoiU5YxlP9Ey1I8lpCYRwxoHV6p5y/6HlHRJ7hKSXbrvM0gGqSPF6is?=
 =?us-ascii?Q?2s1HJnzUTMTs/f48V7/gDU+uqPi7CXcHnizLW4lij6RUHLqMPkJOOBys5jTD?=
 =?us-ascii?Q?xrfZV/cwEJ+zt5KxfcRWApHt?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <55DAB948EAFF874695E927DDD9EC8CB1@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd08ce6-3c4f-473e-8c96-08dd4c4871fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 16:06:58.9977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5470

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



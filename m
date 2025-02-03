Return-Path: <linux-input+bounces-9724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7CA260E3
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 18:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC433A2D0C
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 17:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78421154426;
	Mon,  3 Feb 2025 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="IH71udQp"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010004.outbound.protection.outlook.com [52.103.67.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472020ADE0;
	Mon,  3 Feb 2025 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602229; cv=fail; b=OH04vOHxa1Eu/BIfsOs6/vkJyoWhbQzzY3+JWMUXOks3HhRSstEnT8+vloA1V7o6v4ctXKmKNs/GxsDfgo9/mmFpoxjA80Mv7o0UUVUl5IFYs7PurafE2UR3futei+6KwmmeTTulK7hu9OGO5goOEVn6vPAqRIqvIEsNTXvCVyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602229; c=relaxed/simple;
	bh=3mz6Axn8y/+plncvXp/+66j7MYDyHlf4AYZpWN7weFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vGH8to0kMJGG8a9t37p7U9sahGu2KpVmMJ9BU3oetw2SqgexnMsE2+mNHkibMuo7ahWVg5wUwm/rtGkn9V6M5LOGbbn3vX578kRz7+G4eQrfwxNTccYivAjHjSCUyJdpfondwGC7t3vUa3b0g3CB/tO4xR8XfJRePt4ocSZ4xLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=IH71udQp; arc=fail smtp.client-ip=52.103.67.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPVbzYiwOdpSmJFKsKh7VU8oYH+VPMozf7j1Zp5I4ZkU8lrJ458oZkaI1+VQ2mmam6ZoZSbIbRWOq5cgdSK1+GZ+9tKA4f1RLG7gyHomJmAE198yQfL5omtsn1znjcZeDwycpxt8tNktwnFxq69Sq9zDCaZ6R98X60tJvRwdYmhfKsE2hfUQMnLJ56vBxjcP7X53SI4AQgd4Wexuc07hPqG/mPS+K6+p8mp34sgRb5zM9kz70Vw8XWFt6//WY8IKA1G0lSVmFfXnLeQbpGh1MgdNBE+xk4qgGCdmWkGPjN38Uj9dLSsmqc/VkbHrdpOFkZBcGfq8X+jpG1F7iPziQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VBoik1et6ZCxTD6sE8zAbSU02w5p31wr/Vj6VJ2+EQ=;
 b=kE/ygTlKrxqs1zATR1V69lDY9lS6CUAcTdxoXLTBr9ySytcMzsJtlt6fekkvHRMJmvaKDTSFi2CxIzNK4DYTMBq0gjVOMMdgoYaKHcBZX4Inw81PYnvfPHk4/Ksruq38fw5ajRUF3GEPHDWYxUzMmbBJspMlJkDtADbWUcUnIZqm23ca5CqEFTa13BDEWUg9It5uN65SuBKaq/hhqQQ070V43o4jV3idof+Zn6kgbITmma+JtY6ZsVdAh8qKnT4PYD2BQclYtOfi3yAUsDsbKqDeGGJ/0cmY4m8zyxk4OiyvLNC3q7WGshdKNnk9ATmXwlIyNQwnpT8Mm5OHIJitCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VBoik1et6ZCxTD6sE8zAbSU02w5p31wr/Vj6VJ2+EQ=;
 b=IH71udQpqoUv3YZMFi9ytmfdAecMiGNNO1C8MXbqtLeeAytsukWP1C8/4r9D+nGRFLL/MnBazszKtSJ4M7FNh0jUiNB/UF5Kp6r6dNKQUPMneI2WJ8WhbYfeZ6Q9HsucDFls9o0rJTnbCVgBreYAb5owc/6cowtgNX0uf6J5mihwv/s8hTctfbm6WajIRoYW4LRXqBZGulRFogNxvrOOTh7lTw+webg/NLsdA/tvvTnzkvq0Xn++E0iddGDwpcRKfhtsnzMvitru0wfG3E7skOy2LEbE6+FEsRbB01xz5s0r0foyM13d3neXgduV2S2vPKP/vUjXZzlhWR1kNKnAaA==
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a7::7)
 by PN3PR01MB8673.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 17:03:42 +0000
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b]) by MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 17:03:42 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
	=?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, "jkosina@suse.cz"
	<jkosina@suse.cz>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND v2 3/4] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Topic: [PATCH RESEND v2 3/4] HID: hid-appletb-kbd: add support for fn
 toggle between media and function mode
Thread-Index: AQHbdl2TbyS8TIxTd02jq+Lk9SO2jg==
Date: Mon, 3 Feb 2025 17:03:42 +0000
Message-ID: <3AF1D5E7-77BC-461A-BE1C-2F9CA37A4984@live.com>
References: <5AEC08E1-0AEF-49BF-94F6-AA1AD71545D0@live.com>
In-Reply-To: <5AEC08E1-0AEF-49BF-94F6-AA1AD71545D0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8280:EE_|PN3PR01MB8673:EE_
x-ms-office365-filtering-correlation-id: 856abb93-fefa-4045-b6e0-08dd4474b67e
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|7092599003|15080799006|19110799003|8060799006|102099032|3412199025|440099028|12091999003|41001999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NaU3paB4f14GVhoOMbs1vP5YtqjZPrSHqDSBcMDyy1Ot+woxrBHn1LfTOg?=
 =?iso-8859-1?Q?1/epNYAwH5W4Lqgydz6JPOCdsGzbCib2NWHMwt0e/OZRF/5Oneli89riuR?=
 =?iso-8859-1?Q?oXa3Y+PgPttYUwxyWgVp95b+J+e5/i0cNWvQoNV8tPfHSLQ2KUIIrSqgyk?=
 =?iso-8859-1?Q?mmDfafeCrB+P7erl7mL0jC1K8tdzAEUL8suqRFORH/0MKpzhSWj5XnTJQ+?=
 =?iso-8859-1?Q?C74k2V8GoG2l5ColCik5MmsoRB4aedWr1ADXmkOVAqy1YyygTXgmZ2NRVH?=
 =?iso-8859-1?Q?B1SF26CA85UZjWQQxlcGt40EnAgpewlsXye12VZ8vvLtV1DSJNHe8VVleE?=
 =?iso-8859-1?Q?o5pjag+g5Mjx0OUC/oH8kLjL8M+k6zu5DBY2RVcdsZ0OOu7BqpZZlUv/OS?=
 =?iso-8859-1?Q?qPkQ10VPFdEKxkN9huSgjnP9jCggFzrmwyAKCg4qWYdJNrpACn/Paghn0g?=
 =?iso-8859-1?Q?wdpKkpiW1UTY6Aalq2gI1DHcfgLwrnV/vGWpOQdZ6S5FZBRyHHZMbXYGIP?=
 =?iso-8859-1?Q?e+8IlqhVRA0/e5DyAh3hrr7rMS1Wgj2al2yyrt2dk6zMKMZnghA4vMn+/h?=
 =?iso-8859-1?Q?WhXdBbQ4DjPFvYvd7G8eY5lRTW9k+qqYj1dR14JRCnyMFARWqC3TA+6Wws?=
 =?iso-8859-1?Q?ZMqF/lrSaAb68/SW/+ktCI1a6XNEMU8FYJ7FbbPsGIpULSuPuVpCxTRcUA?=
 =?iso-8859-1?Q?tPJ3Rs0rhqKU67ofHtie5QJy/XcNvxyl7smGTvdNucl0K3VYrC8FnW5KXr?=
 =?iso-8859-1?Q?rEREZ6uecYxN5cQAHVx9oARueguGizdCafwMrZPbrL55/yG6AyUgvvLBq/?=
 =?iso-8859-1?Q?HrY3VFIGwqeK9g7Q8gE4loRcNQEN87/VlhVJI8EOkzrEl1IJe3Le92iDQ4?=
 =?iso-8859-1?Q?xS02v16eNGkP1UykwAgvaicOTVRqzB1GiGpPuNkm/DBQEKnhJeDjQNk6WD?=
 =?iso-8859-1?Q?vNyklIp9q4y1DIf5E80dpAddKqqzt7v7hm7Mn8njRfeVhCxYlHOyVWHjPJ?=
 =?iso-8859-1?Q?HEPWDFZ3I/EiKOfNbsu74ZnuZTbusiJxLEpxEBz9q3sEVpheTyKn1qA0SQ?=
 =?iso-8859-1?Q?lo38gADQkJU9JvRv0L2kK+MpvO11MVjbNHyA+j8jes7pJTG3vtcVkzGf3R?=
 =?iso-8859-1?Q?+csmlVr4ts0W4bDUKSoNdleen0x7tR6iHTnGSli+ekkH02V/JurIPsKAE/?=
 =?iso-8859-1?Q?f8LEHwpa2wbYVA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nPPev+xbaIi1lCSdJTJzWFJW99LK58+PnOtVG/WV7yz7sP/2DUuUcx5yPZ?=
 =?iso-8859-1?Q?resqe3GKsljVcM/VpX9V0oolSH0sA15G1rVde929kZREG+WTjAE+91wbUL?=
 =?iso-8859-1?Q?+Dg7LAaFTRmOYwujJnzZ9rZ5KxWMHCkSUKGL4SkFl/fNWOKiQCJtCVlwDs?=
 =?iso-8859-1?Q?DM73GclpxY75okJ/ewvAmziwwIkLwMPnpV9eK/iUe5riC1APhgggIT5bqX?=
 =?iso-8859-1?Q?XChMQHDevUVcWsG4nvZ7yUdT5a+KtGO8UHVntwseFr4IbdQ9u67QMP7d1p?=
 =?iso-8859-1?Q?C70jMmNKxYvI2z5hxplBgWPThsAEzlN67zccPEkqqXhAV3y25IiEHGEwRy?=
 =?iso-8859-1?Q?uRIXp75xI5gYs5h22B6gE8VzGj3tqBInvvTqwJTO+z3zj1EANybkuJyOsd?=
 =?iso-8859-1?Q?IB6eMaYZolwOMdRnB8/vt4Kgvg66KUAPOWbnosDnVo/V34HNhuUKDq9ASn?=
 =?iso-8859-1?Q?17lHhS3YK1Q712mLp+I7miUkEW8Ux13UsLGF0/CknE7AmC6z8gM3YYwBOG?=
 =?iso-8859-1?Q?71YTiv0lxVBBAVcgwjPH2HTOEOmp/iEGhgm03UsbxLEpjUaT46vx2JXa39?=
 =?iso-8859-1?Q?1y0/fqrqMx6edDTn37cvlvRPMT2Ja9Tz2PP7hBUR5GxW6EpBbePsS+ZGh6?=
 =?iso-8859-1?Q?gHeIlFI0ponQYFmMMwPKRTNb6Ebeo4LLCk8k1fgKpE5KkPBG4sU6vAmn3N?=
 =?iso-8859-1?Q?i7m7P/csxMigvyAS2Qyd8sOFJeVLPPnHUv6VXTW2X/W1XxM4VfmhgToOVh?=
 =?iso-8859-1?Q?u0SQPPI6+Pf1ozZjLz1WKNlCjPZ+FwRMoN4gFiHOOniblqne9MDE7Doi4K?=
 =?iso-8859-1?Q?WrwrxKLP+qmKCYxKgxVO8jA4NrsQMjs+C51oIAjB39DdYT6PQRNUzpOfji?=
 =?iso-8859-1?Q?T1GxxrrkFku+cUdILt/Q5bagV8UGvU7/o+o+piUXIKapYduIbwrA2LETeW?=
 =?iso-8859-1?Q?RIEMKLYSSd1QF6G7MQM3vn8PcSm8uJY7BlL4aED7sabpn6sETWjTOvZSdH?=
 =?iso-8859-1?Q?1RDM1tvHnoqqp/CybdTmX4pNyeoYrCNjbyaLp4P1fZCtDxdurd0rplI8hD?=
 =?iso-8859-1?Q?oC/9axOuTnMmXhmfJD6lGKoGZckEQk4W+C4ugELKlwCCm0/NnSzMoHmCbw?=
 =?iso-8859-1?Q?m7+1YsKFg8mWia04YkEP/z9bua4pkrYqYEtKBbhBVeLijjBpfkFZmjJWhn?=
 =?iso-8859-1?Q?AZPkusDSIh4IArE4uFyDvOXl5jIQ8Uq7Td8IZBPZOwYweVLVYT7akPxgm3?=
 =?iso-8859-1?Q?NfoQtCceEeubOTKQ+b7lemXq4p0UIsmFLgJPkl4Uk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EC2A1A66163F90498DD21A46A21FE3ED@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 856abb93-fefa-4045-b6e0-08dd4474b67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 17:03:42.4634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB8673

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for the switching between the Media and Function
keys on the touchbar by pressing the Fn key on Apple Internal Keyboard.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-appletb-kbd.c | 128 ++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index 80c87396f..de5770500 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -26,6 +26,8 @@
 #define APPLETB_KBD_MODE_OFF	3
 #define APPLETB_KBD_MODE_MAX	APPLETB_KBD_MODE_OFF
=20
+#define APPLETB_DEVID_KEYBOARD	1
+
 #define HID_USAGE_MODE		0x00ff0004
=20
 static int appletb_tb_def_mode =3D APPLETB_KBD_MODE_SPCL;
@@ -35,11 +37,18 @@ MODULE_PARM_DESC(mode, "Default touchbar mode:\n"
 			 "    1 - function-keys\n"
 			 "    [2] - special keys");
=20
+static bool appletb_tb_fn_toggle =3D true;
+module_param_named(fntoggle, appletb_tb_fn_toggle, bool, 0644);
+MODULE_PARM_DESC(fntoggle, "Switch between Fn and media controls on pressi=
ng Fn key");
+
 struct appletb_kbd {
 	struct hid_field *mode_field;
=20
 	u8 saved_mode;
 	u8 current_mode;
+	struct input_handler inp_handler;
+	struct input_handle kbd_handle;
+
 };
=20
 static const struct key_entry appletb_kbd_keymap[] =3D {
@@ -172,6 +181,75 @@ static int appletb_kbd_hid_event(struct hid_device *hd=
ev, struct hid_field *fiel
 	return kbd->current_mode =3D=3D APPLETB_KBD_MODE_OFF;
 }
=20
+static void appletb_kbd_inp_event(struct input_handle *handle, unsigned in=
t type,
+			      unsigned int code, int value)
+{
+	struct appletb_kbd *kbd =3D handle->private;
+
+	if (type =3D=3D EV_KEY && code =3D=3D KEY_FN && appletb_tb_fn_toggle) {
+		if (value =3D=3D 1) {
+			kbd->saved_mode =3D kbd->current_mode;
+			if (kbd->current_mode =3D=3D APPLETB_KBD_MODE_SPCL)
+				appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_FN);
+			else if (kbd->current_mode =3D=3D APPLETB_KBD_MODE_FN)
+				appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_SPCL);
+		} else if (value =3D=3D 0) {
+			if (kbd->saved_mode !=3D kbd->current_mode)
+				appletb_kbd_set_mode(kbd, kbd->saved_mode);
+		}
+	}
+}
+
+static int appletb_kbd_inp_connect(struct input_handler *handler,
+			       struct input_dev *dev,
+			       const struct input_device_id *id)
+{
+	struct appletb_kbd *kbd =3D handler->private;
+	struct input_handle *handle;
+	int rc;
+
+	if (id->driver_info =3D=3D APPLETB_DEVID_KEYBOARD) {
+		handle =3D &kbd->kbd_handle;
+		handle->name =3D "tbkbd";
+	} else {
+		return -ENOENT;
+	}
+
+	if (handle->dev)
+		return -EEXIST;
+
+	handle->open =3D 0;
+	handle->dev =3D input_get_device(dev);
+	handle->handler =3D handler;
+	handle->private =3D kbd;
+
+	rc =3D input_register_handle(handle);
+	if (rc)
+		goto err_free_dev;
+
+	rc =3D input_open_device(handle);
+	if (rc)
+		goto err_unregister_handle;
+
+	return 0;
+
+ err_unregister_handle:
+	input_unregister_handle(handle);
+ err_free_dev:
+	input_put_device(handle->dev);
+	handle->dev =3D NULL;
+	return rc;
+}
+
+static void appletb_kbd_inp_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+
+	input_put_device(handle->dev);
+	handle->dev =3D NULL;
+}
+
 static int appletb_kbd_input_configured(struct hid_device *hdev, struct hi=
d_input *hidinput)
 {
 	int idx;
@@ -195,6 +273,40 @@ static int appletb_kbd_input_configured(struct hid_dev=
ice *hdev, struct hid_inpu
 	return 0;
 }
=20
+static const struct input_device_id appletb_kbd_input_devices[] =3D {
+	{
+		.flags =3D INPUT_DEVICE_ID_MATCH_BUS |
+			INPUT_DEVICE_ID_MATCH_VENDOR |
+			INPUT_DEVICE_ID_MATCH_KEYBIT,
+		.bustype =3D BUS_USB,
+		.vendor =3D USB_VENDOR_ID_APPLE,
+		.keybit =3D { [BIT_WORD(KEY_FN)] =3D BIT_MASK(KEY_FN) },
+		.driver_info =3D APPLETB_DEVID_KEYBOARD,
+	},
+	{ }
+};
+
+static bool appletb_kbd_match_internal_device(struct input_handler *handle=
r,
+					  struct input_dev *inp_dev)
+{
+	struct device *dev =3D &inp_dev->dev;
+
+	/* in kernel: dev && !is_usb_device(dev) */
+	while (dev && !(dev->type && dev->type->name &&
+			!strcmp(dev->type->name, "usb_device")))
+		dev =3D dev->parent;
+
+	/*
+	 * Apple labels all their internal keyboards and trackpads as such,
+	 * instead of maintaining an ever expanding list of product-id's we
+	 * just look at the device's product name.
+	 */
+	if (dev)
+		return !!strstr(to_usb_device(dev)->product, "Internal Keyboard");
+
+	return false;
+}
+
 static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_dev=
ice_id *id)
 {
 	struct appletb_kbd *kbd;
@@ -227,6 +339,20 @@ static int appletb_kbd_probe(struct hid_device *hdev, =
const struct hid_device_id
 		goto stop_hw;
 	}
=20
+	kbd->inp_handler.event =3D appletb_kbd_inp_event;
+	kbd->inp_handler.connect =3D appletb_kbd_inp_connect;
+	kbd->inp_handler.disconnect =3D appletb_kbd_inp_disconnect;
+	kbd->inp_handler.name =3D "appletb";
+	kbd->inp_handler.id_table =3D appletb_kbd_input_devices;
+	kbd->inp_handler.match =3D appletb_kbd_match_internal_device;
+	kbd->inp_handler.private =3D kbd;
+
+	ret =3D input_register_handler(&kbd->inp_handler);
+	if (ret) {
+		dev_err_probe(dev, ret, "Unable to register keyboard handler\n");
+		goto close_hw;
+	}
+
 	ret =3D appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
@@ -250,6 +376,8 @@ static void appletb_kbd_remove(struct hid_device *hdev)
=20
 	appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_OFF);
=20
+	input_unregister_handler(&kbd->inp_handler);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
--=20
2.43.0



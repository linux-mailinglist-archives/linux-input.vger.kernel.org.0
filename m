Return-Path: <linux-input+bounces-5615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE0955794
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 13:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B46282931
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 11:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5558145A1C;
	Sat, 17 Aug 2024 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="d/W5kU1K"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2084.outbound.protection.outlook.com [40.92.103.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A015577F10;
	Sat, 17 Aug 2024 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723895257; cv=fail; b=M8eEVRF8fs+d7zc84boq0v+YgxTRpgBZSAcEAKxS4RWtFtObveu6EdBmnVXtYgZFJvhi7W4H39rZE4SnANUsbZC24mLOHcWzImRxDLbUu/FF7U7ZyI+8TlH104n/dipr/YG3GNSV1w5Xgd/S+pncnrnBaBV7RHOV95K+YEr3DyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723895257; c=relaxed/simple;
	bh=k2RISSxb4tZzKL7XVTjoFwCfaJLHON8JiNyJTWMpdSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ydd9YXhG5SaiNgXTKZixKGbG4l57UDJhO2UHXE6h7sYgYSo1JVFJRROVc3Wer8eBAj34SPUxdENYYRih9N9TyjcvIzbHAqOg5/8RfkIzAHTxStSHldNZl3yy05IxaQWa2stLAt8UfN8YvmlWyCT0qEpzrkILMAAqk/34I4q7Wbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=d/W5kU1K; arc=fail smtp.client-ip=40.92.103.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpQnoYk1AY3wRIJOazhxvEIwfSZIBxhGPw9f7BjpxHoqFFQPU/Q75iWY+bjnr4AbosNJyOjYdW0r2FOAPeg8F18G8x5oJ+gUH/vnFjvj7n4W95ZgOSHqBDE/pDNUhUhYTXTfrCfrjROHhn8+CgJ17brUPIMGOv415adF8TGU1evj2/GFLWd7AQR1tx0nmx5PIP+gTp5M8Kqvx93SSvYOI8PI757GOFclwmaG+exMm6XFVCiC4Bism2JQi1TnZgYxW3sWbzBnWEaq3SvfNz4zbtrUzbOEGSGMtPO7n+mrjtVg4YgARVTzt1YZ8KwiSZqyNTW967F4Q8OTvtD7dSZ3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rksG0PShVf77+ncLm+Y6Lr8HDvgrVuZIjwB0qkcNqfw=;
 b=db1v7Vi4WksyyMPh4T2lz1qtNQ9z4INiavW1mBPELtw15UOZ1Yc2XoVuOkqN6PoEpgENeQ5oP/2/PhwWMFUR2KgLR3KPI/4cimRwozHthQPTEXng2mTE+JU1i1BjgnuawsV5hWyQwq60f75ZSHrrGcYcDUtmypG/AF/IdxVTIWYKAbiDIGwitn7pqu6S3OzEr03/vKWhRloftAb2sJQfzrkGiVQEpcQyYdwnHw8tpMQfI/hLV6kcKPOoCDgZllZXX3yp0JyBsKKSUrguC+7eYhL6W+hjl3LZoiOjK+qFpRml5Kvsca9nwpagpAwKQh7T+S2b3+P9fdkaShVy2Oq+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rksG0PShVf77+ncLm+Y6Lr8HDvgrVuZIjwB0qkcNqfw=;
 b=d/W5kU1KexMyw8Uq4EkqbjHdXIqZ7HBN65ewNzVpCenUyLmKmx5nXBQzN+MGuTtcZ0HonbxnNMzwV66Lt5qb/tDN0Acq40XC6ZWEYv6O+QZK6RLNjsgKU83Rkr+OZeWQQa4sSqiS+cWk91B+QtV0pDZ7lFEN3cFfaMg17Ui+RnbNaKocA+/GHH5gMGTU/sQfARj/S6QGi0vNwmnjVjMkbs49mxMUvMrZrf4xDCar77h0cG89VjyPWaDrGm6t0V+GaHK72nFEakQ1BqCA4/igUXp0bn1UKuXqF4y+uocuwvi4QpVUIw7vFtM3R0veezwYjh7ZOWpVzL/L4JpPtgloLQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0241.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 11:47:29 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:47:29 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	=?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 3/10] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Topic: [PATCH v5 3/10] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Index: AQHa8Js8PQ8afFSH10idm9Ss908Y+A==
Date: Sat, 17 Aug 2024 11:47:29 +0000
Message-ID: <022CB692-B465-4485-B7F3-31F965B3963D@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [AK+2/Nm9UfrWAFgU/yO+MA8I/IAN6YeuAQBLy9m8P8DZv8uJ5si7WWq6/aVRSxD1XUVI94FsOCo=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0241:EE_
x-ms-office365-filtering-correlation-id: 38867387-a24d-456d-11be-08dcbeb25f4e
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799003|8060799006|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 lrGuntFIOwp4/UkAnoQA81QJlvY57/nMCx33w8dF9MFF9kFqw8II8OwZ9yUAi6v1FoLsZXyoGOePsSzAlwl2a+Ia4x2AIfhYOsAHbRX0qFf6HYoT4yfK4lWDfYptav9LqyUu/nJfGT/fSKENU7i7yAeSFSapeJXZBzYwQiUpx/ejCMPLm2cCmg213mJb0MWKMhkuX/ixmubYNs8BVDOmfHj+uF7KjuNW0eWEd3aYFOKB4GDmLqyFpggHzhluwyiCXNX9Xrg/lfDXTrAvVbExr5RSZgI99d3o+qx2gImZAdP1+jLPXlLZp4EtyuDOx5Quxbtv3rJkiIdSt8dWgsdX1r2Q6mmuj+eC4csXFfKMaS6ZmbkWgjfSv9E3p5OJVVNaxIHTHP9xc1Squ85ffdALv3W4wgp01BTMZPhO0B+vH3f7BudxMXWapw6+ZtLueVnqAmzEII1ODN/+fKoC1hpKVCzHvDChCTtl1gRJCfEaV1mluL0rDvTSYIXIxjfJjZVw7u+Wg9erLFnmonJ+ac9F7n2H6VvM7I/WE015UPlr+k3ewPpsQp45RsV8VxHihuu4QxEFyHrJWhX3iYYEPBLl0/pDCXlbk/c0/Xj5P4FSEz4CXhLOh161/8XlvNpgZQAugeXgjrUpXI1fybjQpgmuNMLCslNRxgmvgrWls7jnVsTjyTciNzs/HUMSG1+JJ9fo
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0MfXWRV+HCqmQzXseordGwRCu6wCdsiWlbD+7YTzQkSjA0GaHIvETXsDFk?=
 =?iso-8859-1?Q?c4VnRCQDhW3eVjtyFlLfd/S85Dzc4K0UYHksXUXeAaw/zkv+Dz2y4z/x/b?=
 =?iso-8859-1?Q?F5bMx5XR6xWpBq0f3VkqX9Eb7dgeBeFuNhb3KUAEpxspbNbNxqS967zG/W?=
 =?iso-8859-1?Q?sj+W7kOZQNibwg6TmfSus1nLfnDoAHyyLWwRBDBiDWflMXA4qyWvknq/mi?=
 =?iso-8859-1?Q?diEsXPrggGkj4Oyl3dsVtifiJiFtGGCZX69q/plKo2/oq6KoxIcDo1LlWD?=
 =?iso-8859-1?Q?9Z00OWeKAfY4t6udkgGXQL3RJQorYW12FgZhAUeqBHxNSNeOy3ls65vc2B?=
 =?iso-8859-1?Q?NFzTEYthH8mL3pIG6bkYhs/7OLWVMZBF3uILe/Xc9r8uz8upgAKdLo8D9Q?=
 =?iso-8859-1?Q?fKw4NdkJyoONyCWBIjtNrEG6MuPs/h7MU1eDOIPEc73zZN7stn7WkQFTGF?=
 =?iso-8859-1?Q?S1kyTR0tMrtbtvx1Exl1ANSJjIlbQeqApkKwX3ijL+fx6WG6C5TKtiygSR?=
 =?iso-8859-1?Q?CDAXSuE4SGkQnrJm8EwQPDPhPdFaWrqjkyablshZczN+W9v7pTqgkuCJhZ?=
 =?iso-8859-1?Q?6bupt6NYM397I0+Yu1WTt3c3tziuSnG4eugzZcGNz8RB266k+p7zFDjhB5?=
 =?iso-8859-1?Q?9nYDRGmiiscBxx4ao2dUPxgpOyLSyn398hYoEwx8JqjwBAUPQMr1/Odzwi?=
 =?iso-8859-1?Q?YCh0QOpB11AtcbuBlDN0Y5GIxBjOyM01TJfNZYgiwa4oUSTz0r63LokxkD?=
 =?iso-8859-1?Q?1+EwFCMZxjVaTVTOiB7xIek3543oE8v93QfrfV8AnmUxDsxQCjblgTQ+JR?=
 =?iso-8859-1?Q?NRXwdQCQoWmbmWIoxEADoRDICvzYvqFSAJxmysO9EoSrjIBjrSMwGs3ZAA?=
 =?iso-8859-1?Q?lbFy+wYip6rKcZW6qTTDNRojwHJvWUsuySDvtUlgdKlOg8MxFJs7o59hOv?=
 =?iso-8859-1?Q?al5sprZJPzGrW6YKsmggGUUrexOMaeTqwxSm2ATbUe2NK7reJPYS+ucvOg?=
 =?iso-8859-1?Q?0v5S3nZJm8rE/wsgiOdRPFLAS2J7G71TPeGYnHyYRbr94+piLRcltzwdL0?=
 =?iso-8859-1?Q?G0ixPGRMDqmlh8n62lXEDEwDDCTEFsEZZWrTBWStIOki+NcpbOE93ZLQZz?=
 =?iso-8859-1?Q?EqvpdttOByj4KGNQHSvhhgsjLZBA6YdBk+BAdvO2HU5qBCzKLFlqu2Vs3a?=
 =?iso-8859-1?Q?zFLllXcUZ5HYQztYcKMNYJWZBrSCFSRLLQoBEH2+qQekUuKtJzrWqYP1WC?=
 =?iso-8859-1?Q?NtTjeaKSQB9HrJ7k0ByBgX3ihF/Qn0TwcAy0XVM/h5YT6Ldr4o+1Zthpey?=
 =?iso-8859-1?Q?pLnCbrC+AYZy185kEbXNEfJUsfG75QnIXMOgwBxSFMX3X5Mv6OgCKRzW2Z?=
 =?iso-8859-1?Q?W1R8da+hfF?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C45F6544BA442746881653B30116FFD0@INDP287.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 38867387-a24d-456d-11be-08dcbeb25f4e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:47:29.1628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0241

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for the switching between the Media and Function
keys on the touchbar by pressing the Fn key on Apple Internal Keyboard.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-appletb-kbd.c | 128 ++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index ecac68fc7..442c4d884 100644
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
@@ -196,6 +274,40 @@ static int appletb_kbd_input_configured(struct hid_dev=
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
@@ -228,6 +340,20 @@ static int appletb_kbd_probe(struct hid_device *hdev, =
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
@@ -251,6 +377,8 @@ static void appletb_kbd_remove(struct hid_device *hdev)
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



Return-Path: <linux-input+bounces-8817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4829FDE4B
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 10:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBBFB1882291
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B37757EA;
	Sun, 29 Dec 2024 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MXurec+X"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010013.outbound.protection.outlook.com [52.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03A2282F1;
	Sun, 29 Dec 2024 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735465485; cv=fail; b=WZhIm8U2e2ZESxkr/6Sq3L/M3qviyZEJZvo/gFaCKsMWp9nTZctWLsdkMWRBksKKIs9ubfJjhjndPNIv3ENozGIvdilbn0A+hbC/JHLsPV5bs/OBFc7+/NYGOkrRZqcACtS6+u+1n5rBMHnDqW1Dnrtp+aE4GAluMOycdR9Z0hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735465485; c=relaxed/simple;
	bh=3mz6Axn8y/+plncvXp/+66j7MYDyHlf4AYZpWN7weFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dsGzwoo2WiGJpAwr4sb414zkyhS/c5z9DSewgMVWgOfzUb6dd1IQuMV4LVhluARre+jdHfgKEAS+NVxdusko4DpsJhsyVDMOQrJmw4e1Icyd0QrsbYnXj6arw68rB0+HETKxnPRDdjROgFOr01kNczBlE5b/nlSces+U3kOI/pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MXurec+X; arc=fail smtp.client-ip=52.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gcm58Zywb59HSEYMwp2YyzBb1fu9ZXW60xUHd66hGLaWi7003raHzIMX27v9gmleP905377MTcb45Bdd+JIIrRNJdHQIf0Un6JXYHTPPL+m5ypVWKYz63dHeIMtCOqiO4FvmgupBWlR0Aetizir/Xrs7FAw6WcF4/xYiDZiidbqlbhAfLUokcdoALQabZo4nlW0sI9vvzlY6cdz8nfiYmFoLwYIRAVfIZS9G+cBH03DJcORZIEq3fdJOGgUTNZdwreuavQiSyhhoYxqZ/RLnVZBTldzz8ZuvwS3YjbummUWwlnhYlsbbG+nmMGkXlZ7I6Vs1sETnuRxYxmhDGV9Asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VBoik1et6ZCxTD6sE8zAbSU02w5p31wr/Vj6VJ2+EQ=;
 b=gIjT9ZaGfy+BlYLu/4XNw48RDWXAbhAIbSXXSrss32qlkJGRLyfUhLuwTDUEMmRxrOKiM8spW6JbwgcyN7XgjOaJRa9RUaypI3Y0WjLdHvYFuvirxK3rq1sI/tx7Kvc58dPF3K6ccHnqEXivjSMpMz3xCbtPo/4GKznCrkrnc3z74eGnLMMUYoxzAm1d64J1sC9OzL7Zsw9r42Uq2OnbDx6+8xzxw66trjk9ED3zraNEkXSw1IG525kqhvw9NXAVqEElMhbGTivS4k/JkMm0fVSxVj1K7wfaEHhLrmLy+p5eHSJOuRy6PFtbkZP+ZceB6EQyu+6SkzR7t8m7/ke84Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VBoik1et6ZCxTD6sE8zAbSU02w5p31wr/Vj6VJ2+EQ=;
 b=MXurec+Xp9GSXgnRf+L9cX6s0QNW8ol8urxA/1bBzv52/2Ku7BQpswKYC3xMfX8PeOf8eixHmxIgVAz0N8Y2udP2ueacmlBDD3V1YJC688itwyf0iSM4jmXQ0b3R+cCRgM+/bIh25YqGCRIkRlzsTXSHPoeBIgimHL4hLeK2wFR/wR24+Tmuah77qviL3+Yb0Bqn36yT2sL08pezwqUloz9ElsBBAcJRVSwDAcoYTKwfT99PyzxmSW2WcHILM7J9H+oFXMSAOcYjsjj+DxQyzo7OfrKkSyprQOtheNOo4lVxAchK+Yuyyqlqio89fTk/YbyfYZXvuZcmVy0Wv6joCQ==
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:cd::12)
 by MA0PR01MB7898.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Sun, 29 Dec
 2024 09:44:39 +0000
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06]) by PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06%3]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 09:44:39 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "jikos@kernel.org" <jikos@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] HID: hid-appletb-kbd: add support for fn toggle between
 media and function mode
Thread-Topic: [PATCH 3/4] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Index: AQHbWdZH1kWO/QwfQkSPEWEX2c2Tvg==
Date: Sun, 29 Dec 2024 09:44:38 +0000
Message-ID: <559DE2B4-74D7-4C6C-93BB-041CFBAA44EC@live.com>
References: <793F0F3B-D51C-49C8-9236-124CF130E833@live.com>
In-Reply-To: <793F0F3B-D51C-49C8-9236-124CF130E833@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB7728:EE_|MA0PR01MB7898:EE_
x-ms-office365-filtering-correlation-id: 59143d45-42f2-4163-2e0a-08dd27ed69a9
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|7092599003|461199028|19110799003|8062599003|15080799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IltvNQjp70ePstIichcPmu8ySl1g1p4+TFcZcqSv8VmAKq7S8NhrfyeT00+c?=
 =?us-ascii?Q?Wz6MYV66tF/NP0swXgkzRu+RTvbrep3nKcFsF6yTmwwgtpaBcam03ZWUYud/?=
 =?us-ascii?Q?Y3biV6IbQLq9o5+0OkDQKWjZXQ8xDF4VDVVC5ch6audamHqNCNuoGbXlYTr9?=
 =?us-ascii?Q?e2fNZbCyoyLCljGUfOBtFfdJr7WkNOFl0ph2xULxAWVxqwXfRL795QqPGQdg?=
 =?us-ascii?Q?uPuNrzEOMLHFlKeIhl0tHvIHT8mp9C3TSFnc9vZZwXec/C9AIvZ8KzH3vBe+?=
 =?us-ascii?Q?IbzaUV4QG0/R3oZNBUYSorJHS/eV/Qz/K8NGY2BzPphKtQtzzpJM1sUwsQQx?=
 =?us-ascii?Q?+UN6npXGNJLchFALd8cFcNakZsEchmk/Q+xsei2OQnEJsY8W/mSgH+1U3nV5?=
 =?us-ascii?Q?ms8ToGTMFE3yWQMyh3MoYzwy+AQFtzjStkJSpoEOjrkIQdAWScYAXtOhqrXO?=
 =?us-ascii?Q?rEcb6rx81AqtTuBD17akV0tzWPRMAZRgR3sKEnM2+L+V+txA8T77gl9tJ+M5?=
 =?us-ascii?Q?VpXIO8CE+qHhE1uQFdgqbXux/p2rFAfLXhtTxe2Qt42ne3u1EwT/WPbclzqE?=
 =?us-ascii?Q?Nzj+mrbjhBOf9bb0e3UoKy4AmbH/b2X8sQxNCPGoUfb1aWMowQIVP5eSC6ZN?=
 =?us-ascii?Q?p4mg18ooGFrhCe2RKKGwIlKECSCh4FK+WD+n2FpIblJKn5rgGOpAs2QOc0ol?=
 =?us-ascii?Q?5Mp8NX361OQZxreBOvXuVdstU6dC6Mf3Gj4Bt0hTOui0HIzJGXCYv8f114VQ?=
 =?us-ascii?Q?2zc56KkMSnXbPOHLf1tkK6lpBHZYKh3rhpAyWEXPPGhpUDpyhsThuY+cu9P4?=
 =?us-ascii?Q?yZeOsjkxvH67pVqu1xKzGjLJuC/YTTQDkRfhPoWaHWUHlHN/cRieIvYvJRn2?=
 =?us-ascii?Q?sIrnXyo7jCqO7qK7eqc3tG1/hC3VjL1/SCWWGSdWoA5SuoMqBSafMHKWzrcu?=
 =?us-ascii?Q?hBqbHISKdXSZpJ9xkEUBNI4rhkkExY9ZgMpJsr6L9hPXJOtqakiqCvDK4Jmj?=
 =?us-ascii?Q?nBcXwqXfuzDljxIyFs/Tk7/8tfEvHzebmpAhtAeNPK9B7ZZm62Xv62GHabFs?=
 =?us-ascii?Q?49QIJmfpLBAY/yPlDCHVLmo70fAivg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OkjLnTkyF8KrSmlMVAh1XVXDuKffJrLi3cZmU7filLFmwsc1OngPATfgZ63s?=
 =?us-ascii?Q?VHRzLsiq+c4qxvW7wF7dZFVGj2TJntwZZV2Fv5UYJQcemW/v0pTszb23N7Yi?=
 =?us-ascii?Q?ZE7lW5wf3wFuA9MwF9exflpTbXE8Mb4RHkAcQwyRhv8yUvKKaBlHPUAzOIBC?=
 =?us-ascii?Q?ogo4N6erv8qFelkgwQvh4mqVNNzDvEmKnKpYN/JUk0UM6E75piZcFo+y3rqj?=
 =?us-ascii?Q?VITKedr/5sb1noImuqw4N5YFQkqkKoUKCwQ9U1yjwX6Xw9742+0hJvswzXxN?=
 =?us-ascii?Q?7SLwLNujXVvzAZbAEwEcET2O//YjA2lmI3EXtS9nkz2Zble59foeqCqEaH4i?=
 =?us-ascii?Q?6suCa8v/BF/KV97nSuPDZkxSnjeBSVLS/o89dTGPyNMegbguHpGHb5S/HvyE?=
 =?us-ascii?Q?hYZcfcEyL5/AC/TpbYt03vCxsJY9JEcQo0VzwEGUx70pFL3yDUCCJc+wTWsa?=
 =?us-ascii?Q?4j+92h1ywY6fmI+Y0RdmqbZAeiD1xXFxrZ2Y2wTBlKMJGKj72JbbAaSyk8F5?=
 =?us-ascii?Q?fBLj0CqTosbFtxOSjYYhi1zY56bi7h90XT7KPdna70J5kEzr+eF4jGfV77OP?=
 =?us-ascii?Q?1utfBx+sLPZDrtqmzEEKjJOgz2E+FTm4pW8/JzI6gF2Hm1+dLLoJEcAYCfTB?=
 =?us-ascii?Q?eI2sV9sNOnDorG1tAR2fv7bjicNsYxw4ZUogWrCZrvWvd/S68Bv7oslobjwV?=
 =?us-ascii?Q?BDK0pP4JWJPgkuGuSPGUKAkp+EjjvEYAMPqeTy78Ux5aNxxfufVyRbe/BQB+?=
 =?us-ascii?Q?/DA4Wz6vilBS7q3kF5S5tcONFqZwJ2kUIzzLhMReD06wydxdlPNT/bUnCbyf?=
 =?us-ascii?Q?umhnJmoq75ho5L9Fui1101g8wShXpImFdkbBtxddSfj85BnXgOkneDoQWyrj?=
 =?us-ascii?Q?54+PLTatztTf1rxU/juLE+p3bcW8NQz06SRCpcGevZo/X+ZZbYm72aVucbDd?=
 =?us-ascii?Q?9gslTx7prjFRj7lhTcvaBa+/w5qgi7R/cam2nQ8+ZaCPIEN9nU4b/UB/bULP?=
 =?us-ascii?Q?iTxvsldaTDQAO0w7G3XIfYLpbqII0JJtJFZt4iySDh/DUPyEUvKFR1Sk4j4Q?=
 =?us-ascii?Q?TPHo6OqZN1JJlZFvw3Ax/IKEB8RI8o+p/gVSz/YsSCBfLNmfNdryGAtQfO3D?=
 =?us-ascii?Q?10LBNoXxSgVKKwM7r4QmBpfyE1fpp11zHDGpWG8EO2FHsFrvmwE9z0Et18cw?=
 =?us-ascii?Q?mG8d5SVvz8jnHDXe5Uc1js3GT8o4DeCF27uRkPGwDTgIOXdEK/LpT1c71dL5?=
 =?us-ascii?Q?eN5o2ChQLJjMHxCnA4QWBZ6pi9YmZMvrKg/uaS2CXuAcXMBwsLVOVx7MaHNZ?=
 =?us-ascii?Q?V29rOPdMEZTcsaoNI2hnQzH8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE9307D37A8BA64D930481FFF2FDDC2E@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 59143d45-42f2-4163-2e0a-08dd27ed69a9
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2024 09:44:38.9838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7898

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



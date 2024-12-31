Return-Path: <linux-input+bounces-8826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5029FF0FE
	for <lists+linux-input@lfdr.de>; Tue, 31 Dec 2024 18:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66CD93A3106
	for <lists+linux-input@lfdr.de>; Tue, 31 Dec 2024 17:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990F31A8419;
	Tue, 31 Dec 2024 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MxSiPPDL"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011029.outbound.protection.outlook.com [52.103.68.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB6E42A8C;
	Tue, 31 Dec 2024 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735666569; cv=fail; b=b3GCaEhkDmg1kLfhT3MZ7lCbLGX7EQJLhTx0BpkU0UiFQSLqT/VQY0MwZCOlUjwZBAY0mN+Xp++fDVIBpqxt7u8fbsV8rJq0qns8qJvo3yIN2i6tueUCs+PuDSUaIH7QjjdyVzKIc0Y/18J+cjBeYRJN8VG2lF1+30JV88aJv2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735666569; c=relaxed/simple;
	bh=3mz6Axn8y/+plncvXp/+66j7MYDyHlf4AYZpWN7weFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PtEX21sGBZ/Y4XEQHR8XhoRKC2GHAtw95/P6JNL2iMllZsmyFZNkeNJLSyLjyw14UJD5QWl6bqBvSdWBfSR5jlhJSpLuf+lyHJvj5OqULhkXqKpG7DkJz1kqEOg8mb1dOQJ1UkuoFNayFXNNNNZrRZvr5J5B4Wwpa/u09FQL9Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MxSiPPDL; arc=fail smtp.client-ip=52.103.68.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNON09VtJgLlpTa+0hkeSvIogle8q6P/5/N88CvFAdx27m2KeY2Nor7CfCuK3LVhd3PrN2ULo/D/TAPofbVSCJiH+mChP5NHebVdq/ril4xKUtC3bCimnCwwzHedXpqX4VTe5InzQMbrk2/4dgHvm947S7kzsdZuT2YjO68OEwCxiHACO5AWw3fblUT2wkVZG/JSJt083tFB/vjUCH4705NdfG96XicEfsx6DUyrd1B0pEUvG8CQzKZy+fxvco9rcRuC/ZIs64eZR3Cgq1sCL/0uC15/WQV1JyiFJMmxTGBWFwh6SCzoh8PZzNfMHJvDI18draRoKzfC2CTUKuWlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VBoik1et6ZCxTD6sE8zAbSU02w5p31wr/Vj6VJ2+EQ=;
 b=LaDAsIek2QdT58ORygBVL64cfGG9m3cihcbtHjoKp6fcw1BEXJJ7uXlZ016idiiEe4VmEJoE5/Hs0Z47meIYSHXxeqJS7ZHJ+Qy1CQj5jMQVhp2UV/mNqSybuepEP6jV2SLmv/f8vCkwMqodMdbmlM0rOgcjoZ+u+sBkxXZOh5aMnDCvRxwN6oc9j6TEluAmXIQj6rGZV/6abQsNq+hLyTQW0hCR8L/T01fqYh1iwUHLVQO9uV9ow5fuj4Xc0t0ZH8CFQdCx9BjXtEKikEqVSUzloBsk+S96pUMdtWvQXB7Nj3pGRm7+YGCWTt1GuaJaNHBHlcL1bbTSBiN86TnYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VBoik1et6ZCxTD6sE8zAbSU02w5p31wr/Vj6VJ2+EQ=;
 b=MxSiPPDL7lnnIZb5Dp06tywGGlIJ0+mxSgg/MgLIfRKTQfqndGbyKGCRGJiFA0Ik1OAbu3RqwLuMHID3HNId+6KbEjXCeCA9lonnlrMAGF3V6kKkq/+75I5vgst/131YE6cZuo99ZzvCjKGjAIm8/IlkzjS3BdrYOJ7asmDSWWZDVo9kGsfRUQq08cwUAy58m9135hYV1szhqum5qfOci1z62MhxZOLQh4V9YSe3477sVB0ocnsiQs3awOU4Az00ggPfH922DPN59hSiRAYrXWtHjg+BHCpsFvWUmIhiCXtATzsjg/PD+8chqwaCoSpdVFfUx//k7F1I1OxMwPwvAQ==
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:cd::12)
 by MAXPR01MB4261.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 17:36:03 +0000
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06]) by PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06%4]) with mapi id 15.20.8314.012; Tue, 31 Dec 2024
 17:36:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "jkosina@suse.cz" <jkosina@suse.cz>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Topic: [PATCH v2 3/4] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Index: AQHbW6p2kmozRkQSh06ZIEJXS4FGsA==
Date: Tue, 31 Dec 2024 17:36:02 +0000
Message-ID: <CF455CF2-A30C-40EB-8475-8DDDDB7F63FB@live.com>
References: <E5CC067F-5CC8-4B33-B50C-40163C8A46E8@live.com>
In-Reply-To: <E5CC067F-5CC8-4B33-B50C-40163C8A46E8@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB7728:EE_|MAXPR01MB4261:EE_
x-ms-office365-filtering-correlation-id: cecccd3b-9602-480d-f5a1-08dd29c1990a
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|15080799006|8062599003|7092599003|8060799006|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Pw8VNQHgadkV3+A3STWhuVPqZU6gGDBIK8kNFbJLIOEKRZ1vfUtUrcr+LHEi?=
 =?us-ascii?Q?KRugLMcoR04m9JYW8QXWe8QJW5cNxTNw9mFk5DYNcY3dr4MT7cT9vj2/uMMB?=
 =?us-ascii?Q?1sDysw8YNk07XcnXnpok/9yipjREFsNODIiTVCiITYzcI/tUsE+ACi43kq23?=
 =?us-ascii?Q?qJLwpFkLqesJhddHQlghTXwLbsJQIiGyFiswvPw4mfBptRRfoUBGVEcSrV7r?=
 =?us-ascii?Q?srpa5WfClBi141xNK4vwDJDFNol/NF4nEemZTGJMVkv4nkLnQ61Qz1YqhKfw?=
 =?us-ascii?Q?jem61F4z95Og5D00HeIy10Mn5TVOo1SMAHGjuUbOiWqeg0UtALsd7GxkVvw0?=
 =?us-ascii?Q?5EZ817XCT/6MpEBADXAHkBfnnJAepJHP6BTdykgkP3HRYwan5BnMbxez/jPV?=
 =?us-ascii?Q?xwmWkF9Y+KYNHoZswG0aI1OrtZ8hxlD1hHsbHEEOVYdsH0gdzHTammkFHDFV?=
 =?us-ascii?Q?k0CkHebBcTqrEyAILfLPGnRI0PnP9yJgh/PSzN93rIjsPyp/GhwzxWFhwsPE?=
 =?us-ascii?Q?CQLwLqfT3TlmsIy0sfP5W8Y92dT1qzUqrmNSD01aMVyMu3+077CYtkWd0dIQ?=
 =?us-ascii?Q?p+u4ZYRILBgQlL8UEFy8kELIPbG9vwH5APXofd3COj6OpPfTd/MFvUvJ2sfE?=
 =?us-ascii?Q?FQTVE2NEUYJyPYgio9hlmMWjefdpNUc3S7FtgLYgfVrQelIo1yc7xAnpxPzp?=
 =?us-ascii?Q?3BxE5XxpolSsN76wem4/u0o8Bxw6LEjNYM6Wum4tNqK9RLN9enH6VnOWGZO6?=
 =?us-ascii?Q?D+hbIh6GbuBESyXxk/a01MU4y8t+XM7CEegF6Hk7RGNREiI1oeNTicv/CEjE?=
 =?us-ascii?Q?Bd8OPQ9A63SMRpbPvryxfVi7FNQhd+Ksx5CpXkB3oNyx5zfvtN6q+ubii0sA?=
 =?us-ascii?Q?pmw06tiVFBP4C8rkAw5npUzyMXoxUPTHfioHdL3k3QxqVdwDVPeKzP+SGySe?=
 =?us-ascii?Q?Ny7MJGacOiIImrye8qezAcszY+Mr8UmHgjYhDx5iRJVp3af541fOmDbin0JD?=
 =?us-ascii?Q?5c3ucXfeNfkGXJ1od2aFWFyzVQf5aYGIJEaSc6uqwLrECkpfxZ9xmhcI3K6X?=
 =?us-ascii?Q?rZmhdWJ65Wf0OAw0idQWL8kXPI3aXQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h835CnYIY3S5LkLiBDiTritrDlB8s1UIVGjmqvzOjLMW8Sd95EuKbEk4SSS0?=
 =?us-ascii?Q?WBEPmErzi50A1r6l5rfkaEZ346MVzFwbXQUB8LrBcWBqyfE68j+nDvugVlED?=
 =?us-ascii?Q?9Tv4IHgNdEpg3UXSxzd5wPcByOTtRQlhln6G63UzDtOKXzrE9SZfsa2lzNBr?=
 =?us-ascii?Q?PEv5Pi7j8s8SvbCp4deg+FU1u0KW23j4HTHNADWiPuWSUdkAANz1ue/2bFON?=
 =?us-ascii?Q?vQApQZWKEi8qCszAxIV5AbM6MfWaNeTs73AjWauB71RZYHMi5DGqLhywUN90?=
 =?us-ascii?Q?bZzs9hPdnzCEyZiryJ67+NisX7k+fRsRxkyWjt5CmZkrC7AK9Pu0ziGLxW/Y?=
 =?us-ascii?Q?fNVE/rFDnZ0iZJUyXaUxknitVPXZQga7q9Y2Hrwk3HExvf9hP484AGHL5eTd?=
 =?us-ascii?Q?QTmBRJdTNmUVYYk7vp2hz1J5d2sS0uJb0RP/NtvzmWl+tDgcn44LOTfgNeNZ?=
 =?us-ascii?Q?f0cmsFdPgmkduJAlXwWfZ6gnHRhSVDvwxg0Gyzbe40Tp3P3KuDOziVWwhHpW?=
 =?us-ascii?Q?KzIgqtprDnKkFZWXt8QUGmkDvfHA8RZgxyWDq7SMLqrwc9TvKYLJklX/xW40?=
 =?us-ascii?Q?JLJJGN4Y/3wgOKFOcEYEFJrxSWyKSb9P9ZzZDrZ814bUl3KecV0KgIgeGGed?=
 =?us-ascii?Q?hziwQq99yzhbqXiwyIsEOYAj9/IWU0xSzJPFjR0kTlnXxy5UvGc9sREZdscH?=
 =?us-ascii?Q?3NZiIeVuGyJWzV+d/qWuTJker8348o39LQU33mGjrQrtTrpPbiARTQyPLC52?=
 =?us-ascii?Q?6+tsAxESEvdMzZtY/IX+5lair+WLLmSTHlz2RUHM4eAfyHIjlAjnirjlNDsm?=
 =?us-ascii?Q?B6rLF68bvLdBvsJyJG3quwN1utVaWAziWgww3X4hDU9x46ISssmg3a0spbko?=
 =?us-ascii?Q?4wV2dIdjnfH+2tchCzwSNL+j8XKafwdFvNxY+cor5hUKMzPcTJOPMRf0D9xx?=
 =?us-ascii?Q?x/fN1Px9MF1lJqYx3F6nL5Rz27qcjtOXbUY6zGy+hsLByMaxdc/+wOw3MMZr?=
 =?us-ascii?Q?gDMlY6YMFvAVz0Gs+YMsJPRUUSdsBFvr3EKG4hLhPhyJFieRMNdWoyy8wTSQ?=
 =?us-ascii?Q?sM3QLyTdDRiLv6sRgjCKa3tOjaCTfHUittC+628hqC6QP6Q7V2io6KKwBkpd?=
 =?us-ascii?Q?45yshuJvCE0O9WmaEOoNLVWovw9zqbc3k3+rHTAntc2Q8Mu26Vfvhu/vBCNm?=
 =?us-ascii?Q?uXrEXQuD6/7jW7oY31x6Afp9ybtjSSHgPjKHoLp/BICai3ibW4oNesItOuZR?=
 =?us-ascii?Q?R2nGU2TvEsnnFwB6225Nupyvq7ozXPSvRCvGmB3YqVJRjQ614eLqjHq0xNd9?=
 =?us-ascii?Q?yvOS1UXsKO3L5ox0e0+4qNVm?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E7F56D00E5CA64AA2D4D0A5858729C1@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cecccd3b-9602-480d-f5a1-08dd29c1990a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 17:36:02.9487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4261

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



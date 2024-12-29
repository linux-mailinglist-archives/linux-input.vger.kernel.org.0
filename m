Return-Path: <linux-input+bounces-8818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABD39FDE53
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 10:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917B916179D
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 09:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BF770838;
	Sun, 29 Dec 2024 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="KEq0Y1eg"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010008.outbound.protection.outlook.com [52.103.68.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043D282F1;
	Sun, 29 Dec 2024 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735465524; cv=fail; b=bS3qhI91OgeaLooprtq8vhMjlnFsOPfWFVKewTr1x+YwcpEtNeCRHG1vf/VsChUPnER7/yMLKcMwovZZCxYgTJsXVrWFMucO1QikciZws2gSWws5FXPc+tlIVh/y2qvfTEEv6c6OZP20Kj4kgVSD0+qI6vqikeVgFDpLfjaUZhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735465524; c=relaxed/simple;
	bh=XWRCGCOMPi6gxTSnJPJeKzQ9b1tVg7mMei/C+FjYBds=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EHEFDD7Ik+QGNXrJTIXYf0iijU6g6jmknb4/g3FQTOl8OvYP3Pf8VoQnlHohvEzwEOf0Jaxi1g2+JvHkBhkop8eDwbiZaBXTHmkSPB5Kr0oFXHW1uOtJLitVbcY0c+1pw1tejQJbcXOfEFrRezNgcorEPsoigkPpaLb4LwFOG8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=KEq0Y1eg; arc=fail smtp.client-ip=52.103.68.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc3tV2W79cg3TtdGtwu7YlEvhSJb4LdjpEVOnHgzD2gMdpT295HjpkiAzGRmHZPl/wN/LUoJczOwIfXoUQPNXakyzBwECFY9DnDu3OvSBtOh3xiV+xCoLaWzzYn4ZYiEMjnmuy/m0/A7DpbNtUB1zn4vu1zCxJ4kXXdHy4oNcXKk32XxUT3map5l/vW1NpAEPHOgqHC6pLR1haCPMSIWWKVQO9a+dmbZV0DXV2+lMM1wqhYdJ5YvVMX/8j+TEV9XbHphjRaHPvYa+NmmT3ZNbaktZS5F98gIgA9dp9ioGTjspVAS0fe5rjusJC6EaNZDkFeqWqyOHTxGKPOA64DWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYKlzpleH6bheKyvd3AKaS8Da9sIJkfumC4r9kG/Y7A=;
 b=pWor1kJm/K7wRmthknyBcJGsMKMXHexQZZtCKIrV4rlT/fgzWG0Kyg8FnKG24Gxp4vqxOJbZ3nHO0beA5KklRnu04ACo/BMxpzqwlyOlYnuW5DnAHC6EpQ0HnFjyeyxJk8EpBTpIuKHAlboE+K6hQIh3vs31aIXawtK7GGjbt8eBA26oxrSTrjEmTKYTc1CArsXOBYke4U80tcM/h7/7vxgjRGQKWFgpFQiORcV2RcBBl1GPWl7tCiuv7QbiZCOChX7XljC0tWLUWbf0ntKw/jKh49Yp4xwTKfR+bY3Zkuz1BIA/yLLw9iL4RTUix1ARunzvLe/CGoleB22ezk5O1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYKlzpleH6bheKyvd3AKaS8Da9sIJkfumC4r9kG/Y7A=;
 b=KEq0Y1egVNfQuryeUzURI+M8TxzDEGWw0GXe7Nix2XEFWXvDls7BvT2n2yLo50h3xfoKamk3sQeMK17uaaNV1pG2yu3DoUOBuPCP6348CV2bUZlY6ZbMpbojcTKmFkXoU62T4XLHLvPHUKY2W/Phm2oi9uUEUbFpyEmctmJ9RMOi1H1xAyuGdCNeBpc54U/YCOxK3+tFJeO6f6iSyVVNDkzFM3grghl7LbFaT4rmvBUEI84NHQH3MhrujV3R0jE7vrLZlPSEBxG/1GlT5xTQIN5IBVR+aRhNpebOIgpWm9YLZzxAB1rHoE+b+q8Rj9Q6XKXgIIkbXP8NSJImvC2IUQ==
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:cd::12)
 by MA0PR01MB7898.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Sun, 29 Dec
 2024 09:45:18 +0000
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06]) by PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06%3]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 09:45:18 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "jikos@kernel.org" <jikos@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Thread-Topic: [PATCH 4/4] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Thread-Index: AQHbWdZeHGC/fiwqz0KpaW55sKTtjw==
Date: Sun, 29 Dec 2024 09:45:17 +0000
Message-ID: <E3220B70-D7E6-4A47-A2A8-9CD37375E298@live.com>
References: <793F0F3B-D51C-49C8-9236-124CF130E833@live.com>
In-Reply-To: <793F0F3B-D51C-49C8-9236-124CF130E833@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB7728:EE_|MA0PR01MB7898:EE_
x-ms-office365-filtering-correlation-id: a6bd46b8-1cfc-4cac-a07a-08dd27ed80ea
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|7092599003|461199028|19110799003|8062599003|15080799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?f8191xTNJp9J6V5CbRExvDtliDPWIU0jQ5WRWfdAQrxygwoUtppD8XblkHOR?=
 =?us-ascii?Q?FMv7OPTtKcWYSpRKS2o1O9D/VOX4G8s97zJiQ7/KTI/CbbsCG6MZ6qOFaVqs?=
 =?us-ascii?Q?VSHJ4BplHHn8oP6tikbJuR6PEgeAmQEfFf81wQnQC/J7qb2whC2b+Mif/ACl?=
 =?us-ascii?Q?65gTHXrZhTl1/RMg5YyeA3OiiO1EPZvAswYMS+wei1PjCEwXWjnFyCin3Fzd?=
 =?us-ascii?Q?ktRFCYealJwu/la9J6BjrriVD41Up/1Hoycjn3uVS+i+hqfWBlI2gVPtMcWV?=
 =?us-ascii?Q?KxU8v1GBDOWhBJJIEDuy6XXZZT+PB6ynETy0hoYXNhJKBsYGTonp30XaX+fk?=
 =?us-ascii?Q?nCF0J98qkvW5kY9U+nFW5ljkJe8p+HRs60joQLImVnThnJW++XRsPXL2Ae9A?=
 =?us-ascii?Q?oVkIYaBqWDxCylhleRXTXMGOKOXzoZitYwSIOW60TWYjF+HMdxPkNChx8adZ?=
 =?us-ascii?Q?XjM68IKHOazyydHAZzFeau4Jk7rilASd32em/9uBee9sZQYTKl5y92G9shOV?=
 =?us-ascii?Q?WUup/smXFbDIqR4Z777eXifM8QkXxBQeCfp0e0TlT/Q1NK637rGg+Kl6A4Mf?=
 =?us-ascii?Q?OmLFiLAM+vL3C5zTXnqIhJB8EhPb14uEhoxg7A5yJNDSA4a+Vvocd0EfKeyX?=
 =?us-ascii?Q?O9kglVOZkWtefSeepAJXXmVjpQEMXWAkr+9/k/jiAcABhRxYMgFtrBD5Nei/?=
 =?us-ascii?Q?vTvhLxRubZJLZMNQVxwkT3hmbnHMAMn8DDl4O+73YiW0jVFh+/wAP/6TKjAi?=
 =?us-ascii?Q?bL29GOTtUzPXbQRASp6Ia14ZepDc29qLIOWAIeHwY82EhWgGYDBr6WbTmUyj?=
 =?us-ascii?Q?kZJXgEFK2qo3Y+btdzw13jlOoLe96yH0kYdy7LynlXRRYcNJK7XT2IIiJe0W?=
 =?us-ascii?Q?IczIQLrCnvHElJblEKyuJXkHuhTikUIXkNM/4B31pK4cZKW9h5RXzAjQM8co?=
 =?us-ascii?Q?cFWoazk/vjnxRgBfDSJXZ17SjQQntVrapZEQnHcptrq3X5/lhzhC0L+48Xf2?=
 =?us-ascii?Q?geVEqXhh9rNb5wdp37IKfWVCTzQwSq+rHaB9k3BEMGqkJk463vplVfook5X+?=
 =?us-ascii?Q?S8N/VMhllcqVwvHbJ9dzvjycjrkUdA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?48Uksr6/6S7DuyyxZLcydg2D8oBd2bjVgIaUUbOLF8+UCY9gxrVICO83kNDP?=
 =?us-ascii?Q?LEtaUc1FjNpSjnWwivEN33xSu0uz07DwNwlsAOBbmik5dZ7w2eHcnWf+SMML?=
 =?us-ascii?Q?Yxj/pu0SrkShkmeHbePbK5fAk5dW1VMp4Memm4Q1Ah8LSepqOntolu4TAECu?=
 =?us-ascii?Q?gcCdGiiZZSCtFa0c6RwzbFxyzLvz2zbRLjvX0/WrmxYjPdm1Wu901CkYN09g?=
 =?us-ascii?Q?9VC+VG7gTNuXVnjHdhVoG3dk80OOFDwMD65coWQjpHXtMBDC9RRq7fdFSwpS?=
 =?us-ascii?Q?pQ/iDBZQ84CedU0rNOPNGtjjQG9fAQlG5gMhzfiPPjSLygP/Vfl+IW1lqqo+?=
 =?us-ascii?Q?m5YAt7KbbGbIHid00CQ2zr3WkZ5OgfONz1u7iuLR/mIeVKu38R2SSAwftKXf?=
 =?us-ascii?Q?kUq4+PDV5cWlG8JJm7QyUoR2xXV4SZp+2Gw+EkqOW1ogE507XE0SJ5vlLA+k?=
 =?us-ascii?Q?/odr2TIOiAdvNOkly2pmfNdN+3erCRTCCT0itXplH1ms1j1ql2OPkPjJnqgq?=
 =?us-ascii?Q?3O1sbolcQ0a82ms02vHK7wQtuaHvE3Yrq0E+61bsEv9dpSBH6uYu9/bezBro?=
 =?us-ascii?Q?tPmMUZiXSo4ncNGH9tbRWi/ZqOjb5ZjIzhPXFLNwIENbP1UhBBfkWdn6LhDD?=
 =?us-ascii?Q?32ss5fLUioI8Y82kpVldd4RnqOthg5Dv3uxCFsnrUpBh0LGStuB3kxwpqhfv?=
 =?us-ascii?Q?HsNxDtg3qKupFcBNsOnVi2IxNHDrllp20EpbBzW4Cfwr5ECYUc7DCP/AV0jL?=
 =?us-ascii?Q?NKRGU1K9edeTDpYblRtSvuXWtbKbE7aEuT32HvHpoXObw1d3C6Tk3Tc5iysk?=
 =?us-ascii?Q?YahR85mINvgMvusUVmmXyrhoZVXFb1rIe3NtypDmqQmJkJHU+CRPtiyvMV0d?=
 =?us-ascii?Q?oT4upV1CYug3fm1fmdFWqezziMhQF/RIYobrfaxP1mhU9T4gW2VbbWlPGfYM?=
 =?us-ascii?Q?ThQw7dO2TYuBguFkuF8007cjM+PF0ZJvaP9Rc2b/gGyX3PB4j/jAD6RXgYTM?=
 =?us-ascii?Q?OUPNqtJXTvki7DA3eWK5Bx/z3X3R4NdOQ9HHLxtzjANKTWujrCFSUV1yoYg7?=
 =?us-ascii?Q?WCp8f8J0MioDNXoQvgeeEarJpIKABLSSApWLK4oD6a24W6vPIorfN+x6TLnR?=
 =?us-ascii?Q?y+s1xsPaNOyz1k0AiTCutUt/hmqq5kCI/GO6KP9LjNGF08WsxZ3EyFUtqIVV?=
 =?us-ascii?Q?lY41W6xzBlJoctlb72TgT0DGkp8YtqLcTk50cOaIZeKmcvPqn4SzIXuyon2y?=
 =?us-ascii?Q?CLySUc+wIogxM6biyjIy0VO2XDEbETQFw1M5FWrrcxvBqDaKk6Lw3o9eiwKr?=
 =?us-ascii?Q?rnxcoajVmnkCQ7EYHDuV0fjk?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8C9158673A4A84AA4520C8FCC801F46@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bd46b8-1cfc-4cac-a07a-08dd27ed80ea
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2024 09:45:17.9738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7898

From: Aditya Garg <gargaditya08@live.com>

On Windows, if there is no input by the user for 60 sec, the Touch Bar dims
automatically, and after further 15 sec, it turns off. On receiving input,
the Touch Bar resets the timer and goes back to full brightness. This patch
implements the same functionality.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig           |  1 +
 drivers/hid/hid-appletb-kbd.c | 80 +++++++++++++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 5b16bfadc..9b183633f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -161,6 +161,7 @@ config HID_APPLETB_BL
 config HID_APPLETB_KBD
 	tristate "Apple Touch Bar Keyboard Mode"
 	depends on USB_HID
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
 	select INPUT_SPARSEKMAP
 	help
diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index de5770500..ecc8c84f4 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -16,6 +16,8 @@
 #include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/string.h>
+#include <linux/backlight.h>
+#include <linux/timer.h>
 #include <linux/input/sparse-keymap.h>
=20
 #include "hid-ids.h"
@@ -27,6 +29,7 @@
 #define APPLETB_KBD_MODE_MAX	APPLETB_KBD_MODE_OFF
=20
 #define APPLETB_DEVID_KEYBOARD	1
+#define APPLETB_DEVID_TRACKPAD	2
=20
 #define HID_USAGE_MODE		0x00ff0004
=20
@@ -41,14 +44,29 @@ static bool appletb_tb_fn_toggle =3D true;
 module_param_named(fntoggle, appletb_tb_fn_toggle, bool, 0644);
 MODULE_PARM_DESC(fntoggle, "Switch between Fn and media controls on pressi=
ng Fn key");
=20
+static bool appletb_tb_autodim =3D true;
+module_param_named(autodim, appletb_tb_autodim, bool, 0644);
+MODULE_PARM_DESC(autodim, "Automatically dim and turn off the Touch Bar af=
ter some time");
+
+static int appletb_tb_dim_timeout =3D 60;
+module_param_named(dim_timeout, appletb_tb_dim_timeout, int, 0644);
+MODULE_PARM_DESC(dim_timeout, "Dim timeout in sec");
+
+static int appletb_tb_idle_timeout =3D 15;
+module_param_named(idle_timeout, appletb_tb_idle_timeout, int, 0644);
+MODULE_PARM_DESC(idle_timeout, "Idle timeout in sec");
+
 struct appletb_kbd {
 	struct hid_field *mode_field;
-
-	u8 saved_mode;
-	u8 current_mode;
 	struct input_handler inp_handler;
 	struct input_handle kbd_handle;
-
+	struct input_handle tpd_handle;
+	struct backlight_device *backlight_dev;
+	struct timer_list inactivity_timer;
+	bool has_dimmed;
+	bool has_turned_off;
+	u8 saved_mode;
+	u8 current_mode;
 };
=20
 static const struct key_entry appletb_kbd_keymap[] =3D {
@@ -146,6 +164,34 @@ static int appletb_tb_key_to_slot(unsigned int code)
 	}
 }
=20
+static void appletb_inactivity_timer(struct timer_list *t)
+{
+	struct appletb_kbd *kbd =3D from_timer(kbd, t, inactivity_timer);
+
+	if (kbd->backlight_dev && appletb_tb_autodim) {
+		if (!kbd->has_dimmed) {
+			backlight_device_set_brightness(kbd->backlight_dev, 1);
+			kbd->has_dimmed =3D true;
+			mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb=
_idle_timeout * 1000));
+		} else if (!kbd->has_turned_off) {
+			backlight_device_set_brightness(kbd->backlight_dev, 0);
+			kbd->has_turned_off =3D true;
+		}
+	}
+}
+
+static void reset_inactivity_timer(struct appletb_kbd *kbd)
+{
+	if (kbd->backlight_dev && appletb_tb_autodim) {
+		if (kbd->has_dimmed || kbd->has_turned_off) {
+			backlight_device_set_brightness(kbd->backlight_dev, 2);
+			kbd->has_dimmed =3D false;
+			kbd->has_turned_off =3D false;
+		}
+		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_=
dim_timeout * 1000));
+	}
+}
+
 static int appletb_kbd_hid_event(struct hid_device *hdev, struct hid_field=
 *field,
 				      struct hid_usage *usage, __s32 value)
 {
@@ -170,6 +216,8 @@ static int appletb_kbd_hid_event(struct hid_device *hde=
v, struct hid_field *fiel
 	if (slot < 0)
 		return 0;
=20
+	reset_inactivity_timer(kbd);
+
 	translation =3D sparse_keymap_entry_from_scancode(input, usage->code);
=20
 	if (translation && kbd->current_mode =3D=3D APPLETB_KBD_MODE_SPCL) {
@@ -186,6 +234,8 @@ static void appletb_kbd_inp_event(struct input_handle *=
handle, unsigned int type
 {
 	struct appletb_kbd *kbd =3D handle->private;
=20
+	reset_inactivity_timer(kbd);
+
 	if (type =3D=3D EV_KEY && code =3D=3D KEY_FN && appletb_tb_fn_toggle) {
 		if (value =3D=3D 1) {
 			kbd->saved_mode =3D kbd->current_mode;
@@ -211,6 +261,9 @@ static int appletb_kbd_inp_connect(struct input_handler=
 *handler,
 	if (id->driver_info =3D=3D APPLETB_DEVID_KEYBOARD) {
 		handle =3D &kbd->kbd_handle;
 		handle->name =3D "tbkbd";
+	} else if (id->driver_info =3D=3D APPLETB_DEVID_TRACKPAD) {
+		handle =3D &kbd->tpd_handle;
+		handle->name =3D "tbtpd";
 	} else {
 		return -ENOENT;
 	}
@@ -283,6 +336,15 @@ static const struct input_device_id appletb_kbd_input_=
devices[] =3D {
 		.keybit =3D { [BIT_WORD(KEY_FN)] =3D BIT_MASK(KEY_FN) },
 		.driver_info =3D APPLETB_DEVID_KEYBOARD,
 	},
+	{
+		.flags =3D INPUT_DEVICE_ID_MATCH_BUS |
+			INPUT_DEVICE_ID_MATCH_VENDOR |
+			INPUT_DEVICE_ID_MATCH_KEYBIT,
+		.bustype =3D BUS_USB,
+		.vendor =3D USB_VENDOR_ID_APPLE,
+		.keybit =3D { [BIT_WORD(BTN_TOUCH)] =3D BIT_MASK(BTN_TOUCH) },
+		.driver_info =3D APPLETB_DEVID_TRACKPAD,
+	},
 	{ }
 };
=20
@@ -339,6 +401,15 @@ static int appletb_kbd_probe(struct hid_device *hdev, =
const struct hid_device_id
 		goto stop_hw;
 	}
=20
+	kbd->backlight_dev =3D backlight_device_get_by_name("appletb_backlight");
+		if (!kbd->backlight_dev)
+			dev_err_probe(dev, ret, "Failed to get backlight device\n");
+		else {
+			backlight_device_set_brightness(kbd->backlight_dev, 2);
+			timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
+			mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb=
_dim_timeout * 1000));
+		}
+
 	kbd->inp_handler.event =3D appletb_kbd_inp_event;
 	kbd->inp_handler.connect =3D appletb_kbd_inp_connect;
 	kbd->inp_handler.disconnect =3D appletb_kbd_inp_disconnect;
@@ -377,6 +448,7 @@ static void appletb_kbd_remove(struct hid_device *hdev)
 	appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_OFF);
=20
 	input_unregister_handler(&kbd->inp_handler);
+	del_timer_sync(&kbd->inactivity_timer);
=20
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
--=20
2.43.0



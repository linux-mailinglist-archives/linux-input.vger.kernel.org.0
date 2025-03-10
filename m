Return-Path: <linux-input+bounces-10680-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D7A58F34
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80F4D3A7A32
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911A82248B9;
	Mon, 10 Mar 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ooTcK96b"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010015.outbound.protection.outlook.com [52.103.68.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A2221F13;
	Mon, 10 Mar 2025 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598073; cv=fail; b=kJ9sfZ6wbLJwN7uuwR6mZM+qaV4ZgoaoBOxECBafk+W+mJrqF/C2h+BOtS1svxYaqNxXHPObf7Zh6psfjsvLzRAqbyS4JkaKBvXbJXnanA2b6i+Y9HZLuEDPUU6yn5BAm0FPKfILLwlKVPGfdeiwob7p4t6wa7IY4dHnt+JN91o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598073; c=relaxed/simple;
	bh=A+RnlCnxqk/FXWtfGywQ0faeL9vDUtsw3aN3Cd9Mh8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=msmJj96UX0S+/yzEh+CQ46gpHFFF1h/XGgkRTssOxNO5kUnMooPcj/StCjb4AKrUVCG4ITtm73tubqcSZGUPubOHlxOnJGyr5S6engxKF4QwnG5n4sWx67OrrQNoxzobIcVHvhwEP4UU87ZPFSA4mrcr7c7nV5/7LMtjCcj7LpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ooTcK96b; arc=fail smtp.client-ip=52.103.68.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ1fXMWG08Qu78p5CtYF1R+UjvndRcZvHM0+kWulHT/h2uKDH/ZU3dLaK17CBu14NS309t3sK2ODmdH5eW0WMR0m0iHjZZHJbOq2MLjRHX966ECnWv6NKfuM9QtOJM+MbHEoNB/V4UKTcNLfl8BIhXt6cEaik3M0pM1LIWMJM/OJGTXXK/nmjOp56FXJLUZwFg0UQxDJJW3SXB7Qd4J6+6Bkt9MnVfltcfeWdfb3/pzRvr8B2IcttV0LNDSTXSfW8ef4WoGn7tN0Mq9zTiqnZ0ThG4iESFhW8zxh9FLgUecaYmSORLFeo3Zj56JS50Ndw7NU/+YzGacRb98FYUw1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ReDvTgeIRITbPf0iSR2vMf/gEIGRR9UeRdo6xkH+DY=;
 b=J+Wt36o21vh574unMwF3yIeLPTjI9w+xzXU4UdZfgoxOAf0B1NUaBTYuVjExRxSi8VzqTjHkuJBnfeNxF5ZohcIfv7T6hEZ7TriAqWd9VGb8Ek/mIVY5iKXw6Ho966c9j3VJbMWYByW3epSJM5lyiZ6kaJDu3k6FIOoOPlEY22yxQap6kRNdnvrCQbEQQWdJezOKVlFOwB272dm158ArABgsIbVI8Gtmhh1cklZiGKJM5A5JbZi3U3bzO2B5idgdi8mfy5fmysleEkOGETw9deKiSmUurGNsD5uVPK/uOiRh51TbcG6UizharM3PmXR+J53PSnX8qb07HIq6TnNwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ReDvTgeIRITbPf0iSR2vMf/gEIGRR9UeRdo6xkH+DY=;
 b=ooTcK96bcYJ8bdio07Me/eW/joGkQvSCaTYODqd7g3f0H2W3fuAFyWMAsuVz/xlmapR2CXW51tNdVE2q15J7vWSCm1RfbOQI0KP0GHzD4LMwW4P67ystOzgu1d5rAGqCi+jEj50ABK1fypHd3/21ot2sUTd7o+derOlgI9Vt0BhIb9rdDn8zEIEHhveikYKv6pjnNQPug+ArT7YsTEzvVhOAbLqiVSsqhcNxdqRmfYjtU9FPcjiZbwy5CT+VsTvNRKTSNzv5NWNySWIBuk/WdWMgV/1HI7k4jsZcz52MOaDoE1ulOXVL+obGQYWW+A81oPRwkD6N0X1WSzI1oSIjeg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAYPR01MB10587.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:14:25 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:14:25 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple Touch Bar
Thread-Topic: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
Thread-Index: AQHbkZzRYjd5SL1F7EiFR2eWmPVTSw==
Date: Mon, 10 Mar 2025 09:14:25 +0000
Message-ID: <90644A22-3136-4D4E-864E-7F7210D0C713@live.com>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
In-Reply-To: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAYPR01MB10587:EE_
x-ms-office365-filtering-correlation-id: 09d882a8-f647-44cd-b072-08dd5fb3f41d
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|19110799003|8060799006|8062599003|7092599003|461199028|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Rl4BNZFlNYWho8JR/6oe2WNEGHTEfrCheSU9zp2M6+z+efUzwiWCvEHmhCJC?=
 =?us-ascii?Q?LgnHQciVslFjsJaHFqBNO2Y4j0qEyKT+yaQ2ZBJP/wPjUpQMEdIS/0UDx8YA?=
 =?us-ascii?Q?2epyWQVub87Pyql2s/ANiqETtHKzDimkt0LH7NoCO0D0MhtYxIK9plCAKyA/?=
 =?us-ascii?Q?iLVHEvwZOGeZiVqRvbq+uML34FkBBkv2wlGA9TxlflhDwos6+UtD4AAZWQ8W?=
 =?us-ascii?Q?LUFsZsAQXM5XO2XAChGaTECSWyoy6e5/PQ3OSL9HYpkn6OcFeOk1/A6kklIu?=
 =?us-ascii?Q?YObgvnW/bnJGI5uNAi9IllUHY+a1WfNBzMYzp5+yIh23R8QPuAnQbe9ZGvAa?=
 =?us-ascii?Q?Fi5flFU+ebBggNbhGL3qxUXKNQdvkhkwnB4Hfe9dQ+r6MQ8c2Lp1HH1IHcIE?=
 =?us-ascii?Q?OI+zfIZ8cgNxd6OX3w9Md3vlwrrbl7Sk+DH+ps12UINne3BIYlcpTu3iZlgA?=
 =?us-ascii?Q?PLmgIL5INt0oqngH8CmbotYaySeT24ubxR1joOkyC2SmlaYsgCqz8r/B9J1H?=
 =?us-ascii?Q?NrXS7XkGP1BWNGraYYwxeH32hEKboH15Q8g0vVsf7AzaGEey+0QttN3J9zfK?=
 =?us-ascii?Q?AuK5T4FbGZJbHMzKb37xxI02ogUTQAezdGkeNNO7P9vyfh6DZoFZ18tyrmR1?=
 =?us-ascii?Q?9JlhkQKPA8idVxat1J+lg9h1eL5SEqGGGtRZYRkm2vhAE6/yvpr/cJsEHARK?=
 =?us-ascii?Q?kUaSxlzI/1JCHFzp65LFnEGqT80jYHQhMt73X3kWuMwkMkeWb95IkdGEza+5?=
 =?us-ascii?Q?BfTAeKsg0MW/n0eUr9DeYdxapHSF3JEJy4w3Y7mgQiaN3KUdCbrFEif6KFlJ?=
 =?us-ascii?Q?xuuGtglRSYc7dwCXcfkQjw54yoIJaiiqelVqfm7xIC+ScW3o8tkvrDjXHKjc?=
 =?us-ascii?Q?DSXnHwoh3aCbqd4Vimx/ImwVCcjWnddmAf+XKBkDmRGcozQ5i5B3fZdb3/KN?=
 =?us-ascii?Q?agGG+2jilKMPLpT01RwGdz5kRSEazNpwn3tXKm0WbFh9XWIz3UEJoEDzaNh3?=
 =?us-ascii?Q?orG0YPZJ0WS/5yKX+kBUqzHcFKv7zXAFFDWHoMh98WNXyKwjMDPUM7lor7+z?=
 =?us-ascii?Q?iTDGG0tTyp5O4D6PgdhoofHhQPJh407IWUpUBIfYs3bLBMCFbu8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+NmjQPkoNfR8zHJ82vEUroUEolDFQBPfGREi0fVKo3F318q4CprzF9a6mxVQ?=
 =?us-ascii?Q?nLylcdmouj0jbEKnXJW3z5NAFQ1QZgvRCCcDXDsA4w7W1q9NQ8Pa9Go9qu0g?=
 =?us-ascii?Q?/+J/Z2XkmTkr1gp0gOVAcxphbbmakiaGeyES1bSW4fIuwlqPB3rgKRA79Ig/?=
 =?us-ascii?Q?eLW5R1FFUE2LrHvIzMeEbBhA05ynmrt3+YHY1agZ9AGIt8NWW9RsFBDU3Tp+?=
 =?us-ascii?Q?CkNvS13EEnqnE96cOOeoReRwjqz67vLlgcesb129NYv/I/HOxnBNZrPPkYKK?=
 =?us-ascii?Q?jW3pRb/1eTyo8NBotb9ov/blY4UUiAqHlEktBQ0MNGcBTajDa+5CQj1wQgXD?=
 =?us-ascii?Q?x2ykFdV0nIHwsczIIDi5tz2yQ21yvyuoZZ9BxgTo7LJVHy+sfgV7tkO8Kg2f?=
 =?us-ascii?Q?wj7GKYSypHm6EvKkm119cvkivVkrKIW7VxwPaLWRlgBGIEmZJpefjUiaKCfA?=
 =?us-ascii?Q?68XncgVJxzBKDzPd2nFa4iL/5NUq8jkgzUbcwceS+JelIcSX+uOb3wTRP/S6?=
 =?us-ascii?Q?4pbLgSdJuOhtpcHWdewMlz92iVorx5MFKbViCHpez5x1Ke4buZ0IY64kMgIf?=
 =?us-ascii?Q?QcqHMRYISrU/GHhTwFiCo4wOpKcqSFj1lWZHQcKYU24JUfqgFszZ1xhVM/wt?=
 =?us-ascii?Q?q9WvmuQU8/V2KLHFV+4mHMYj/F4kZq26ZqLfFRgRVWdg/AhxIIVIvXfjjiCx?=
 =?us-ascii?Q?hVjMGHa1PyNHh1b3A7rCCc+u+zqYjciADSVxO2Gb9dxrfo9mjc+75n5ZKj9o?=
 =?us-ascii?Q?zfrv4v3u0LiWdWxxLvUbpjfaR7bEXkdO3vHeHoJc3ik729jRvf5v2Ur+nFnE?=
 =?us-ascii?Q?wqvWVZYlzSMIjlyVe5jcZc2p7vsdcR6uot6OOBiVRUx1ldnOGNLkMKQheBYl?=
 =?us-ascii?Q?s3oRkNUoNhiGlwN8NemIufdb6lBt98uI+Jly5F/ZV+AQF9yxMFhgBEr9gLDr?=
 =?us-ascii?Q?Mnl2xqLGLOW6NcvGXteZx0CA5Z41TLJ+VSpukf/6FB2MgyWx9JCV95gguSfX?=
 =?us-ascii?Q?EmtdwFDV3lOjlq4WbKZzX/9hUWmPBNdhNL0iteeFThVF8UlztgVVnLKu6IGE?=
 =?us-ascii?Q?K3F6w8xwlfTJVCH9BIfcZEe73hu72Ufd1EdKgmu0rSAACx0iks70UBfME3YS?=
 =?us-ascii?Q?GFgztBdZ+SGULVVW5SRuwtjEQq/8yN7TEJPaZtYBagmSxQfN9boN3vtSCRyf?=
 =?us-ascii?Q?T4FOajlgdzDJ3cG4NR7+MfVXCgWZ2b6Wb855M3AL+uTO6WP/jUoKpFYhXIiR?=
 =?us-ascii?Q?0FXCEGsYIwxnd4njIFLV?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4D970B6309B16E46814A7AA680A33E77@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d882a8-f647-44cd-b072-08dd5fb3f41d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 09:14:25.5349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10587

From: Kerem Karabay <kekrby@gmail.com>

This patch adds the device ID of Apple Touch Bar found on x86 MacBook Pros
to the hid-multitouch driver.

Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
appreciated.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 25 +++++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index dfc245867..727a2ed0d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -743,6 +743,7 @@ config HID_MULTITOUCH
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens
 	  - ActionStar dual touch panels
+	  - Apple Touch Bar on x86 MacBook Pros
 	  - Atmel panels
 	  - Cando dual touch panels
 	  - Chunghwa panels
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 66e33a482..078ceef62 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -221,6 +221,7 @@ static void mt_post_parse(struct mt_device *td, struct =
mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_APPLE_TOUCHBAR			0x0114
 #define MT_CLS_SIS				0x0457
=20
 #define MT_DEFAULT_MAXCONTACT	10
@@ -406,6 +407,12 @@ static const struct mt_class mt_classes[] =3D {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name =3D MT_CLS_APPLE_TOUCHBAR,
+		.quirks =3D MT_QUIRK_HOVERING |
+			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE |
+			MT_QUIRK_APPLE_TOUCHBAR,
+		.maxcontacts =3D 11,
+	},
 	{ .name =3D MT_CLS_SIS,
 		.quirks =3D MT_QUIRK_NOT_SEEN_MEANS_UP |
 			MT_QUIRK_ALWAYS_VALID |
@@ -1807,6 +1814,15 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
 		}
 	}
=20
+	ret =3D hid_parse(hdev);
+	if (ret !=3D 0)
+		return ret;
+
+	if (mtclass->name =3D=3D MT_CLS_APPLE_TOUCHBAR &&
+	    !hid_find_field(hdev, HID_INPUT_REPORT,
+			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
+		return -ENODEV;
+
 	td =3D devm_kzalloc(&hdev->dev, sizeof(struct mt_device), GFP_KERNEL);
 	if (!td) {
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
@@ -1854,10 +1870,6 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
=20
 	timer_setup(&td->release_timer, mt_expired_timeout, 0);
=20
-	ret =3D hid_parse(hdev);
-	if (ret !=3D 0)
-		return ret;
-
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
=20
@@ -2339,6 +2351,11 @@ static const struct hid_device_id mt_devices[] =3D {
 		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
 			USB_DEVICE_ID_XIROKU_CSR2) },
=20
+	/* Apple Touch Bar */
+	{ .driver_data =3D MT_CLS_APPLE_TOUCHBAR,
+		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+			USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
+
 	/* Google MT devices */
 	{ .driver_data =3D MT_CLS_GOOGLE,
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
--=20
2.43.0



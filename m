Return-Path: <linux-input+bounces-10418-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DF9A486C7
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 18:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521541889577
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 17:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425161E51EF;
	Thu, 27 Feb 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Xl94Qrpq"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011027.outbound.protection.outlook.com [52.103.68.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725D61D63CF;
	Thu, 27 Feb 2025 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677778; cv=fail; b=DW8K2ngihYUlnC0CAr3LWHCb4HhSOfpBH6RsLMDKyTeDzLn0kiI0Uqj/tmpVUZ9FEKfgce/vmxr4bzQQ/Iayms698xr5ZfoosZHgKPuVD1Ix2M2kLkiV2pUK3DVhsCIVOXLkEXPdqFAcd5WwaTGWuxSjo41JSpmQvXKNwwRijdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677778; c=relaxed/simple;
	bh=A+RnlCnxqk/FXWtfGywQ0faeL9vDUtsw3aN3Cd9Mh8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MvSLRSnoXxfHri3O9MSmuX1QuqSkBpDszgKOYkkHKLAg0U8ESyjRKYAQ0XtL90aWaYzu80IqJeDcouo0QTr/0VH8DsLr2AX+qWEGQVVEnG5LQA+X4/jX0MymUwRPuPN4KgHMdKxyCfpLo/HKPd8hmO2hiuVTpur0DkfalGMqAqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Xl94Qrpq; arc=fail smtp.client-ip=52.103.68.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwIQcLqJSt9TsNB80ZoSKS6HyNaCIcLQ6qd7K8GL6IdNBVkwOslCDQoa81ZaXv7Oh7JkW3ehdd8Pw1x25vTbnG6h06pMDl34JfS6ClKjXuLbQlNsaOyqCI4L+CleN5lSBxLTwh2RvaYhf4GTFjCw9bmiZ0RS/Ks7PtB5vEJP5qSyo3GLnoDued7ZEEjf/iPnS6opFuil+7TWQ4TFlK1iIi67wsfhufDjQ3UmLdBolBeWk9SeJpJBDZ3fnERZzibXWIDVV/gMbmoEyRpxEyVm1eF0IRYp/7F7ncLD1/Vw++bGufr925Ey+J9IFjLjGVapo00I5M5MtHArjxxzfpq5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ReDvTgeIRITbPf0iSR2vMf/gEIGRR9UeRdo6xkH+DY=;
 b=NYodZgQbNyqBNWBcM/GUsGlWz0ZzWhqYaGE5Hi5alo8QP3YAQ+wmQ4xA4gDOnTUtFVGuSV/QKU9NV8Lxl/WVAcdC5sllQ+GbKtulUpttxS52+PlzcyG8lRFfNFa+DPqIRm/AfnvjvGsncN3lRjYQ+SnVkW4Bm3jkayrdNuzmGazIPEEUPW8Ugq4sYdrmMQ5ipj7uQ5N2mlxS/5TU0Os70pmBTARoFGeP1OtjDv0jLvW5KBuRwTvUdm654qmvBhRS6p1Tazi0I7h/TK6qpayvrFP6Dbcxi4Mya9oVSYb6nDgKGcbGohhkdYPgUP31eHMpzQ4NSNJJG5EJu16FVVEx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ReDvTgeIRITbPf0iSR2vMf/gEIGRR9UeRdo6xkH+DY=;
 b=Xl94QrpqfaE+craF82KCsjrJAh3K2N7pYr+WitPI6p+4JdWJPsDsPcFmGh84iW0Ry3na1k9wGnkZkhAqRVY4DgWhSxHfZzXxbPa9Hbe272bqPxiAhjxsdbWR1DZlIiSXIt6NqEOFF8sVvOFKJtcdC9YyFryeFZ5vPHFWdRnuf3X/r2BsWs5Hvqao2TlCluR2KENNkd/cHtwGf7BVRumG39NLlrLF6eyHdBAtxPUwt9Oo5zq9KyfQ2QPYG/oFvFyo8XZQ6HXGvNbLO4tJTX5Sek2W9YEJjdG68l1M19nx9gvn1jTL+jZIS3oS9WyyP0sC/C8ioo790uvCL4V/0NLL0g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAXPR01MB4422.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:36:11 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 17:36:11 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH 5/5] HID: multitouch: add device ID for Apple Touch Bar
Thread-Topic: [PATCH 5/5] HID: multitouch: add device ID for Apple Touch Bar
Thread-Index: AQHbiT4XygWhKwXARUOQeR1AGw0jQA==
Date: Thu, 27 Feb 2025 17:36:11 +0000
Message-ID: <CEEAE215-C209-4FE0-8629-834AD5C48EE1@live.com>
References: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
In-Reply-To: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAXPR01MB4422:EE_
x-ms-office365-filtering-correlation-id: f1daa8d1-98bb-4b15-f3ce-08dd575539d4
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|19110799003|8062599003|15080799006|7092599003|8060799006|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MW7VoupqOnRQLzPPtE+9vycGfABRRsxWDnvSFGNHoS6bAfXq2j/D5Tg/QzVg?=
 =?us-ascii?Q?ahUP0cytgBdqOgMJe3hReZcvLOI1rgc/TIlhmScANdamEOzUOX6IwVG0G4bm?=
 =?us-ascii?Q?c8gcVzP+sEBROXalQ1trppyUohLWPKCl2IdqNKmrIwiwce/xJSP60OOt0z01?=
 =?us-ascii?Q?vkEA5avNeh6DbUxrpHUQNHQ4JNltsA1MRCpT7JeAulcaq3NbVtsFo6c3mtpc?=
 =?us-ascii?Q?GqNj7/8vloM3pNS1zhx9gVvNr2hpBjbhfvw36KhnISzHSv8ovrX9sPgqFD0W?=
 =?us-ascii?Q?dUUQ+lf7jZgcnq3qhiPYSAcFtRxLowRUG96kZyoWzz5WAcccnfZ4TiYESzfe?=
 =?us-ascii?Q?oPYLKsE8S19+48sxLRUHZI6996HD5cTJ3kBVanPwnwDNoVljMaOQRPApcksy?=
 =?us-ascii?Q?LgqfRD3D0OmEDqQTd41i61fIkttJK+BVU3MOJA4KdpxM/Q+dvlUFGhd9W10P?=
 =?us-ascii?Q?Wy6jenzLg1CKWkNU56Yrr0X+0fiaHw9+tqCrkv0uCBztwqGRsHrPaohvLPdJ?=
 =?us-ascii?Q?wAYlJihld8yh7EzMbKPBMWGzmB7HxDXORvbdMcBl1AYLtxHbuivKp8jzKRzW?=
 =?us-ascii?Q?toSD9hFcYuK2SIdu52+VRnBgNxR30FZ0Z8jLFkwAnmXW4BPAxH4cQxQ7JuRg?=
 =?us-ascii?Q?JvigjKP23syeMMB7GKbIKfpDbsCYu+aBY7EQREk4pXu98COp2lI/skLRjyG1?=
 =?us-ascii?Q?NMGzLYLQQKTNI6QQ/BIpTDU3yocZ0z+F4RqKd6zswRR9UedVR96XJUEyltd3?=
 =?us-ascii?Q?kvUW72Scl3Vg5xc5lOV5AfhZO2Ml6yRkKR1bIjA1Z1nFq6uy784M0uNNkRwm?=
 =?us-ascii?Q?zYvvq4uoYdV+TdsiBfqluQklIdudA8FQa3End+fcYVpNtmoiPg885zyeN7nl?=
 =?us-ascii?Q?skfkLWJHMaZdOZGAii+klaa39K7FNSJpLpQe4bOntyV6tJcIVMp6930m2cD1?=
 =?us-ascii?Q?iefYXM8BX8V3XhGCZL0zhjvkSNvV4FNHGpwoDMAYywhSuPIWm8HinO/M7RV4?=
 =?us-ascii?Q?bBPrQZq/Xp0QS+XvIyXpUYv0pwYEoZ2LjdMkaV3LGZIKyDAIxf2gidy01zyn?=
 =?us-ascii?Q?Qzych/bl6M0LbFHqtkCG8et/St9Zb0g/Ichqk285xmVAuuNB/Jw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2A4ndslnJcXrCWlaL/v5hmiifl5l2JNJ/MIYx31gFWGmY181Bz1+IHs7DkFZ?=
 =?us-ascii?Q?e5CRlleqOjso4sPnwyXc+Qe1oa0BaR3hZ+MUd18I3LCWJRjwxL7Filz1toy2?=
 =?us-ascii?Q?8volRZe36VnkedHa1+pSnntcrfopk8ehTZpLaBp0vX/iTYDo4D4Kwz3G5+ht?=
 =?us-ascii?Q?S2j5Q08vkx9umbWcMIrz4hNntblfCSWAxpfQRnGvRO/wWAhaWH/xynWp8nG3?=
 =?us-ascii?Q?DN3kVjsrszr5D3guaVgCtSDBdUxiASBhxswAW1ZlDvDJzV6L6vl+7tqyCu+m?=
 =?us-ascii?Q?50oNAtp1qDSuABdce8B4KK3GgVmtcpDuQ/GiYXekFSOFAs27eG4/oit8IjLa?=
 =?us-ascii?Q?pNVcKYlRJkSDhWvzUu4VfrQo2amnjqU9i/XSZDT9fV26qGcL62OQkZpChZrg?=
 =?us-ascii?Q?bc+NhMqsMWKxEz5JK46IEL8Qts/hxdAgs3zb+kmCxDVdJUQHRUOCeoIBQKtR?=
 =?us-ascii?Q?vLV9C83LXWNbKVOJn83nkYyNdo9USv2UGOADIuQS0XnBWtH17o/KF04ZUOi1?=
 =?us-ascii?Q?nmQwqjB4WMQhb1dOXyuAm5MNuke793RHJsTBromhb0/0Sh5+NUCizEtD1nl6?=
 =?us-ascii?Q?umdGSPm9BCVGA2FuuUvmO/3di7NhpiHK3nwpe41T9CilGzWSldiNPJEXKq56?=
 =?us-ascii?Q?JlJF2XdiUlMUu6vt1ry5L7thF/mOJG4HshwDxzdJ+GEmKuOEAfoMCPyLHgUX?=
 =?us-ascii?Q?tMVwhU4Clj5miGSjeafXVLMaHef3rCL51ha9NGeiGefhu2J6BC0jrwup3KIn?=
 =?us-ascii?Q?t3Ew0cretrGuxyx1zYc9X2ZckgaDoTNxFmB6YsXN5pTCVBLqUcDFxowrCzee?=
 =?us-ascii?Q?tsb1i4ETuv3BiPXuoiUUQwqQenV4Ot7bj4fzQ7sVbA9nsXo9mKKWljdvkm8f?=
 =?us-ascii?Q?yWkv3RyvyLSBI5dvJiWi3jRX6fzKTt19pQ9yZyP6kwW7BAYFHJJ9Ac/fBVEj?=
 =?us-ascii?Q?otgEaTn3oUwnooZ+mG2GOnDmzXy3t0UyvfDMuLbr2gFWGa8pFXO9hn9xydge?=
 =?us-ascii?Q?Gic1wBm9Ud2DBEF4dP4VrRBeH0cLOft5TPeUhsqGevLLkhpmidRCbMxcrrxa?=
 =?us-ascii?Q?etpg3HO0a8dMNmVpSvsAjAisUherOoObIRBrAk/zge9AEmkWI9OUObnrrK/0?=
 =?us-ascii?Q?h8QFDeE5PdweyDygxYrJ2OjpCPfSHPN3bebqWSTQFpO6iVSclTv8xUj2GrDB?=
 =?us-ascii?Q?hclAezy5SST1Xn7qR1ApIBLza4Y6MCjTLBUCPg6gkRwNmKuEA5dkeMjdJJy1?=
 =?us-ascii?Q?uPzGqnKLSoN79uk/KuIZ0IkXyM509NF9fnLxZPp4dd+TTNMFG3O9+VWf/Skr?=
 =?us-ascii?Q?o0uRcHSNxQETybqoSiW7/bL6?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <75AC845104370942820B4F516E02302F@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f1daa8d1-98bb-4b15-f3ce-08dd575539d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 17:36:11.0130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4422

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



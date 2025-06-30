Return-Path: <linux-input+bounces-13227-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC135AEDD06
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 14:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132B71891409
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B8E286D64;
	Mon, 30 Jun 2025 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="qvOyjn6a"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011024.outbound.protection.outlook.com [52.103.68.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14D7285079;
	Mon, 30 Jun 2025 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287041; cv=fail; b=Pz7sdlXcdZl4it9XFjBreSYCHx+XNZGzOIeaEn5CGXg6A8NANBJqjGR540G+PbrLRdEmoKn//FNovmuTn0d7w6HK9iRo1uyPeeU3tKFy64USfzvdjLIBapmv7g+FV8SZHwwDlw8QrEl0ZhM/V0iMDwQV9aFOx0+aBS9/TTQ7hNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287041; c=relaxed/simple;
	bh=37sSW56Ozdasx8m77t1x0VAUlsT+cIE/SyNsgSGU9Jc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s286N5l6dSWecbEr9cEQTuqHi9UKwDkn7SIMhD8MKeAT1kBesKHfkz7N4mdte6bbowobR8Wv+Wi1i195jYO2bJRGcZQ1E13DSZhSwRDfedfZTc7eg15NTAgp19Y7mgbCX3wP5ibLHQ/h7+Em2qRF+SjQiaplogKAf9xrEO058Ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=qvOyjn6a; arc=fail smtp.client-ip=52.103.68.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIuLW+5qf2c2yGIx7hn54fi+Wz6E+yaZ6dH/mfYVW7vFafwUwN5hxvj+idg8U1zmXj2Gdr5fdPq6pjJS6Cri/j/cHWXkoOo3pyJndB8TbVZthTVFbvGjsa/Bl++tMAadUi2eokTecloVeaq7AzMWMD4nwiBz87HCGlhIp01Tq+5GNqwIg0h/2NMrOB+9+G8xk0PRz+OFzAz66JokYmL/kn5ozj0YYODOUNEPqizRYi45XWVvpGz+XEgnkm7vkv/f2gQYCe1EGrH+agEIvG6crcBaAgALcDmuEr0CN3ZzwOAHdm2QjEkmzQlRtwknvaTTRa6/Iyt2kCs3FkSQXbYjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwFmQTHb38kFklael+Nlneoei0AFIZdirtRbnQuUqto=;
 b=uSeBffq/ZyyD044PLQgVRp0132PtOjFlnKaZGh7EHGK0M7uRXCgXRi9DP+izGW0EWQ6btSYf9tKtV0fIzdpEHQjreY8wm31uz/RHgeLRgKe1yTHfqcHB8qWnE7nG2yfSgjG0Me95yEkAJmdZX/lHvTXGhZVzKn2Ky0+++VyTNUyHow//fKqFO7hkD9JNl1CuYkIz0KbmEmloZWoj2j5UdV+2IV+ite33AJBig7fXiGaoFX1z3TdxyREM9f1ptENfDgx4k1eh6Gp3W1CPFMS06/6s7z/izBytj9D03L70sPhmqAAdAPRqe8rTZMyxUlVWQBPDswy5F6pHkDuCrxmM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwFmQTHb38kFklael+Nlneoei0AFIZdirtRbnQuUqto=;
 b=qvOyjn6avgGL1vFk7/aKvUghDd5YQVKdsJDdc2EJfBiLsdg6Gok1SmF5tHHhmq2Cfsf60cR6pgYPWCBY149C9Eha2afOdw4XEyN/MFRYQ6sKQWBn8+3opdkL00YV5pKGG7Nm6hu1ypYepojL58Ce+c4z8S/m6lRirXDcpbPwiIvnU5x7wrR0sVEHvbU+fBrLOYAJMpAcOgP4nFuZPWoOgCuJx4WjRx7Py7YVBtc7T/2LQpwfdKoPYJwUjxqpinr54GXbwqw5F9v9KcMzwxb7e8xGGdnVEM5wHHkKoYiyyDpAR6Wwd5/25vedOdKFtq1opBfF+vgH8GrznLF+ADOLcQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6210.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 12:37:13 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%3]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 12:37:13 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 1/4] HID: apple: avoid setting up battery timer for devices
 without battery
Thread-Topic: [PATCH v2 1/4] HID: apple: avoid setting up battery timer for
 devices without battery
Thread-Index: AQHb6bu0TdIM5271oEiuq6vpG9gCrA==
Date: Mon, 30 Jun 2025 12:37:13 +0000
Message-ID: <20250630123649.80395-2-gargaditya08@live.com>
References: <20250630123649.80395-1-gargaditya08@live.com>
In-Reply-To: <20250630123649.80395-1-gargaditya08@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6210:EE_
x-ms-office365-filtering-correlation-id: ad391c3d-c2e4-432a-feab-08ddb7d2d715
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799006|15080799009|41001999006|8062599006|7092599006|8060799009|461199028|38102599003|52005399003|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?F6UjZM6Js/pDE6MP78UB348lShR/XVOvQQfEBhaaztHBf0QVNcfIhjgayg?=
 =?iso-8859-1?Q?JW1gYpYlEl1UrnmV9cL/kTAS9rPyfmd9Ko8RxFcuHcs7LLGC269kPYTNAP?=
 =?iso-8859-1?Q?EUJtyNc7KjQuowI4i8K1dHoeKAUJ9NFNvcms0uoO5DtHiXW/qXIjxTz36g?=
 =?iso-8859-1?Q?p42u+oMdN5PNfXECXVDRxABpcIgonIXOrP2TXRBp9UIqEwoRpnb3fXJugX?=
 =?iso-8859-1?Q?iKdcBszcX3Li+gf4yhI+i+GXkDp0YKC2cw+Iihhd5R17mGT/BOBO/Id9Mu?=
 =?iso-8859-1?Q?8XpwEvEhGEOQ6zXcgonwu87OL2GDeWkmXYiNguk7brw++1em5tjMZ9c6+H?=
 =?iso-8859-1?Q?jj01/rM7t0iL40AWSTlu05Fe3JQaGCuerNUipQuLpKgWbn9CMB9GaeIUMH?=
 =?iso-8859-1?Q?P3vPr28ACxcqJQ1e44AgQzWIhhBXAEh5PQDaQ+vdjKdkhMCh8Pbv0tZwJe?=
 =?iso-8859-1?Q?JxNN2YFN9mtsq1EtUXSsZYzRJOApxTqnX0cE8q/tfoR9mqqNcVz9rfANFj?=
 =?iso-8859-1?Q?eljzfS89vzYXqD7kl2+N0HugHhhwHlPidHKddNQyoqV/KAacSnLxZmiiZK?=
 =?iso-8859-1?Q?23GgeoTnaV37Qze56kBsPDf3OX7uGtKbQywOGy/DQClRJks2pQMlY73qP5?=
 =?iso-8859-1?Q?+5ECSlWLKv5dzm6YAnpRxmdLVz534y0Xs9IsgZrIdmnhEorTizjtc1tqtE?=
 =?iso-8859-1?Q?kqkS97Q7kUU06yOFM+aYRfwd3jxC/x49t3+t2+rY4/rQbFkPJQaVkiWaBm?=
 =?iso-8859-1?Q?AbABB3oQZfsTZyVTQBraEZt89laeYsED8ohAlgYamaU8Xm01qi71zT7hkW?=
 =?iso-8859-1?Q?W/SAKeaVLdmCErkEW4ALHtJEzEv1VKL3A629iU1adsXqmxwmg4TxiePTOx?=
 =?iso-8859-1?Q?xrIeiKYM3FiBvMxrP3mX+3DE0nT3Y/1Rqbq2Dy3aXA1C2UHxUCXU9LTLre?=
 =?iso-8859-1?Q?qpqyjqge5/FxJh4FO7BlSKAONPmFBkBoSMNHFarKWnqy3ByV1wb4ow9t5G?=
 =?iso-8859-1?Q?X3qZHzpWYOYzizRu5iEFh+bUkI63v0D5MaRpA87oLQkaVefA1IYzUosG+w?=
 =?iso-8859-1?Q?ztjqVOfjpb9Am2CbVfb5tp/xt4q8cfTgW23tgacL/4t/pLl+r6Vi9Rd8w8?=
 =?iso-8859-1?Q?svFL23si3enw5AtNPR/ZawzvGnIRihJiAmmW73obMdfWf+HlTngDtOgB5o?=
 =?iso-8859-1?Q?B5ZrTyfBYFIlgfmoHRgMW73a1oadQKGSxBizO9O51pIj+lKWKqcbKGi7Pi?=
 =?iso-8859-1?Q?L5ao8TtohNjG3OiKf4SvrDnRfFhL7Hgq82iysWtzg=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?H7DDfCpFuydaYAxNT6TrcEX+r5Kk7EVW55gncYh42DzbmciiBo+kGbemeQ?=
 =?iso-8859-1?Q?Dd1S2BEya794iz6zh77bNDnmT1LKNEYv/ly4+rByRBi5GBGZJoq2ajrVW5?=
 =?iso-8859-1?Q?+e6NO6ErB2W30WDzMILqc9g5qiWyH6nF6se25quUVyb4D8/YzU/BnTdSaP?=
 =?iso-8859-1?Q?qyCptcgRQcedPZJaxKKESBqHSs7g6M91AId1q0jJzD+q4ko87npI6RS/Hb?=
 =?iso-8859-1?Q?Fdcv6vtoN7FMlI2bpmn+6ESzyTt/iedRsbrXeANIyyCtl0hll7pWNOYv4g?=
 =?iso-8859-1?Q?RjpT0vlTZysv52PiDtrXi7gMzBa3WPpv5b8yC9fxxg7sj9+7bnqDbOLlA/?=
 =?iso-8859-1?Q?dxSHRbHkkYqDXxsoSPEoijjHGjcE/qpHdftTrziEMD/R+auSaMOXSLiX5n?=
 =?iso-8859-1?Q?yUt3cq2YpqBhQpGTJOB/xAzg5Y7vVfuGb7htZT9YsR2q875YDD4aaXzQAe?=
 =?iso-8859-1?Q?r0dtl6UWxoasN9sYhXHPmaAUJGyhGPMyJgmfXfpna+GWwy4qk8xp5Yeams?=
 =?iso-8859-1?Q?y7JxK/3lPNXVv5FnW48Qt2ghv7JBLGAct9CErd3nKf1LD8SCi2fCl21sbp?=
 =?iso-8859-1?Q?88niAdceMnj8gnXN4DiojWkoi8YreqmDbb20OgK/YzyX8CLVgRUQn7REZZ?=
 =?iso-8859-1?Q?/k3AbHuUREKoya49ne21zmBLOlkfSsafRdDuB7+IIyfEYHDAvSeezOQQd0?=
 =?iso-8859-1?Q?eBjXvY6v6MVff3KSsvJraPrb5tiI/CETXt6R76LLmOKclaKOLhzTv28ueD?=
 =?iso-8859-1?Q?6FkYUGUo9ydY1WgK9d+Mf1+27CCjpkupWQtoWoUs9m0g+38BjVQZTB4tat?=
 =?iso-8859-1?Q?+00qn9ns0kzZq+KDL+Xy9OS0QxiduGWEwz8dU2eyKWL82+mUQlm9jNlixF?=
 =?iso-8859-1?Q?FCSYfM7keJqr9d/klpwinZuSZV+/YOaFu9FgkocUKDunk9dT9mNgun+NzV?=
 =?iso-8859-1?Q?7bJu274QljSmI8J9DMv+sKxo7Xq2uj52nHPqCkqxnJWVnC1PslFIDWyv9C?=
 =?iso-8859-1?Q?ZlYnItN76UEC29d94A1eU3wUnwrYBQWFSuuF0n2dz7lGsC+QkowkBZAXZE?=
 =?iso-8859-1?Q?8U+CpeuqJ915STEm7xaQRz7PbxtOtFCqWM3RXhVEv4tqPRwwuUhj+8a3Jt?=
 =?iso-8859-1?Q?49OWW/sxU47pBsvlqnkhB967IQcDkm1LtQAkMvZB7LCzL4T4JkPWBix5V7?=
 =?iso-8859-1?Q?LsuFv9h3NQ1Qqmn8yMpOyzCEEMXTjM0DSjpj4tDuzfDCvAWGEphMM0Q+M1?=
 =?iso-8859-1?Q?s6VTM0Lh4aSaiyO4ANUmrSloAUJfYJT4UF0uZCzmA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ad391c3d-c2e4-432a-feab-08ddb7d2d715
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 12:37:13.2794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6210

Currently, the battery timer is set up for all devices using hid-apple,
irrespective of whether they actually have a battery or not.

APPLE_RDESC_BATTERY is a quirk that indicates the device has a battery
and needs the battery timer. This patch checks for this quirk before
setting up the timer, ensuring that only devices with a battery will
have the timer set up.

Fixes: 6e143293e17a ("HID: apple: Report Magic Keyboard battery over USB")
Cc: stable@vger.kernel.org
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index b8b99eb01..c8f0e2446 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -959,10 +959,12 @@ static int apple_probe(struct hid_device *hdev,
 		return ret;
 	}
=20
-	timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
-	mod_timer(&asc->battery_timer,
-		  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
-	apple_fetch_battery(hdev);
+	if (quirks & APPLE_RDESC_BATTERY) {
+		timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
+		mod_timer(&asc->battery_timer,
+			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
+		apple_fetch_battery(hdev);
+	}
=20
 	if (quirks & APPLE_BACKLIGHT_CTL)
 		apple_backlight_init(hdev);
@@ -976,7 +978,9 @@ static int apple_probe(struct hid_device *hdev,
 	return 0;
=20
 out_err:
-	timer_delete_sync(&asc->battery_timer);
+	if (quirks & APPLE_RDESC_BATTERY)
+		timer_delete_sync(&asc->battery_timer);
+
 	hid_hw_stop(hdev);
 	return ret;
 }
@@ -985,7 +989,8 @@ static void apple_remove(struct hid_device *hdev)
 {
 	struct apple_sc *asc =3D hid_get_drvdata(hdev);
=20
-	timer_delete_sync(&asc->battery_timer);
+	if (asc->quirks & APPLE_RDESC_BATTERY)
+		timer_delete_sync(&asc->battery_timer);
=20
 	hid_hw_stop(hdev);
 }
--=20
2.49.0



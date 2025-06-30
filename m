Return-Path: <linux-input+bounces-13230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6242AEDD27
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 14:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF6C67AC98D
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A367628C03D;
	Mon, 30 Jun 2025 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="nN6LXT5e"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011036.outbound.protection.outlook.com [52.103.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03128BA90;
	Mon, 30 Jun 2025 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287052; cv=fail; b=tGk8sulprAw0DbyXiy9qNbqaf9mSk12yzi6GyBM7E5WAJ+RHd5He5DU4z6Qmg4K4nFbq4bWMn/tYnsTO6WQisiOii2yyWk7OIJupe+iZe6lkaIRqsd1C5MRsk/ApxRRiDo5tjpxRqo2xo+ojN21aI1yBrAZ9Ks7rRB1jt+FfOp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287052; c=relaxed/simple;
	bh=wDoits4n0Q3g1p/WWps4rhcduJJ4hS9C7pROUlZ+Tik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r6sQ4z/Lb2wUXBzL+dZmiOzOfm2YW/t2epTZa5vmkdE3BzO6jerrUbCDWsBF3L1EGRcmYDTLfABRaNy1wcLSZI8LxP74bPG+cO8tnS0UHWiIAsDpC7zBxDZBCgyxPywN/vxvV3qvbbI+l80v2jR3fY2BeD/ZudKwU535KfsIuV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=nN6LXT5e; arc=fail smtp.client-ip=52.103.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yel+9ToDkIHOw0P4usk1tFbhatQSRpPA5ZEaxOHUTHg/EMHcISGMomWcRPfjvcJ1zp2EztlmuSk00Y4Unt7qsT0exoUO6fdKcnkNgOluiV0tJterczEMqG0Z0v1gNim6d4PUKXe5JpPFLplCBFlBt52D7KmcbEFM1tqODZOxY0U1SyOjqP7RamzuLYlp9tMlXMU2IJyEmdv3kqVJrH0uv/ZAh4IuIglbzObZVkCVfMvdN2/Oy9zzFHbDqjoz86nK6qiEAIGx/TSGICb4VrLjF4/2V3Y3D8dLlvTTIQh/35FAbyKA7AIhiV+pquQE7n06OOsf9ksPA6emv36rvKuSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl/VbXF6dM4FyGF/wf1EP6kIomY7JYnz1BwqQaLqsOQ=;
 b=dZrl2ITMhHqirlOi+I58hxP1nv7P30dZLVDIGYNwEudbl8BQFM/bZoxdS+7eod0H7zUb138s1PWEu6kEt0eG5BMYr6WZoZj4XvZSLNIO7v0DjmVIqXyn48yatTlt1V2KZOslao6UUehvIa75EzW2AdCXgohngkP0WEsiTdCaPvgVT7hhoyqaidwic/1wxxAsoXr2MPEHTybRWit4FDymDJcWuJRrUsiQVnQvTjPyU3pgnpybgKChYLxkNiCU3nODykLW5hXtvbF2OGe6vQu7JNQieTcSmY8FufIySXlTFkBeVr2qpgIKmcUgxg5C+NODVZC+BqPvbCsasezHst+o+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl/VbXF6dM4FyGF/wf1EP6kIomY7JYnz1BwqQaLqsOQ=;
 b=nN6LXT5eJic5vaHnTzcDgELHL5TEwVoBioPrYcpJJfjkpvoNbHEII0UWTiv/VTh3150pmGsNSnNYHKUx/X+7Qu0CyNQ2ecCeYLaw2UpPF98vq4Ko6zvimxIF3AcP0XaVzX/qjPqdncH24nzc3ILG+o1m47YtrUI6HHhfHUupd82S9II25jIHU/YYFsNjzl/ohPJXyhJOmWWr9RCyorrdkXNcmUKzXufUtW8gVKW53WS21Z+t5HSNw9pmBb+hdwktjVZ50D3dkhjKJXt8O1fO/PoGzas9AEuF37nPejzcfoc7ympmdRmoTePnaMRhknqhkRN76XeocTYiFdIdlDFPLw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6210.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 12:37:15 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%3]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 12:37:15 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 3/4] HID: apple: use secs_to_jiffies() for battery timeout
Thread-Topic: [PATCH v2 3/4] HID: apple: use secs_to_jiffies() for battery
 timeout
Thread-Index: AQHb6bu1FU1FYuV0ZUSv2pnM88peTA==
Date: Mon, 30 Jun 2025 12:37:14 +0000
Message-ID: <20250630123649.80395-4-gargaditya08@live.com>
References: <20250630123649.80395-1-gargaditya08@live.com>
In-Reply-To: <20250630123649.80395-1-gargaditya08@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6210:EE_
x-ms-office365-filtering-correlation-id: 63c9cce5-6f6a-436e-e608-08ddb7d2d7e7
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799006|15080799009|8062599006|7092599006|8060799009|461199028|38102599003|52005399003|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4j3QDYGSnQQ5szqywT2MIan9/vOBbWm9X2UsDP37sFL0ILNdz0iSqEk7J7?=
 =?iso-8859-1?Q?5LMoL1mV2RayF+Sc9SzAzkp+JqvPzFHbmtDhhv+/dlSGaHEG95mT9vrK64?=
 =?iso-8859-1?Q?jLS0s98ZLkgHRrSf3sftEPL039KjUo1S6C4VKIib5LUASPc3fm1J0pmZDe?=
 =?iso-8859-1?Q?lGcq+DOiFyNd/P+a2nD9D2Iu66m35fy0IRmQYJfy20ImcQk0Fem5RFQMco?=
 =?iso-8859-1?Q?zZEqcQkyEQ0G2LEUxk6922w5Squ2raDX6AYmNiFXIzATTgQgtHwUTfh6GU?=
 =?iso-8859-1?Q?hJVEJ2U5FyuhlwjvszVtCNLvxY+V0ZbBaAaRvsQ7Y6l0cGKE2E12nDnG0K?=
 =?iso-8859-1?Q?6L5Da8QbwB1St2JcV8DuE+Sf8e4Wxr+/Y7FkBsxK7RjZ1Bx3xPzpuMe+SH?=
 =?iso-8859-1?Q?B6+jssVSCXGL/qdKr6VNChjdeqC+ed47aLDy6o5sxSIZe8azblTBzsd2R5?=
 =?iso-8859-1?Q?agJaKStVXAvk/NvH32nyhHZezhlgr47R2JLa3BFf8ITdgNnDKYCmYSG84e?=
 =?iso-8859-1?Q?wJdkgSV3Npn2sHDIpSl3WDEdSaJaD/qC87JEaN6YeyswvjSu0kKK+ItHAQ?=
 =?iso-8859-1?Q?ddaQH/5ikX+c/NkKcpzOs33tCv7tMiEwxPlB0T4f14i30ojCmjrupEUZRs?=
 =?iso-8859-1?Q?PPaEd55LeYvEDpHXqLv7Z8wMCEszyxcXoiyfZtX2uchcizYBk1CVROkQwi?=
 =?iso-8859-1?Q?UsP83PEnFTwWpk28ERPsNL53VBpM0byqmHVq69U2ac6czEveXzQJzyBoYt?=
 =?iso-8859-1?Q?W2SIgzeDzHi/bA7mMRHuu62HYvEi+H9Z3c3jknnJn2CW2jDpxwzW6d1d9h?=
 =?iso-8859-1?Q?NnhNLKq97Te+vJsNeOUuWQwSzN3iqBOSRNIIpQa0jFZwcgVyfI0RiuRzyL?=
 =?iso-8859-1?Q?6nD2SpJRBVLVeh1SvcuZB98OKRz2pdxX+RLyd4jWMJpV/E7sEU2M81bJWc?=
 =?iso-8859-1?Q?9Aa8NfCIw8r39dKCzqvZrjFMF4RYb15pJi/W5dtPED7JOVUlH6c1oW2uI5?=
 =?iso-8859-1?Q?rHbWAM0sCozKOKKexOqAspaB/1v/3gXkUo5p99He3fRxNSlS+E/JpvfUfG?=
 =?iso-8859-1?Q?VuR3MQ5nmU9/2QbJre2r9wLgdN4ptysgjq43scz6P5sDA3NtvNDVCu4UOp?=
 =?iso-8859-1?Q?PUpMW6LHumN/dBcyRfYE7Qi7hygq/Zk6mztH0G+gPRy3izgXo7zX7JMwg6?=
 =?iso-8859-1?Q?wR15/AFNOG/G1Cn5emMWmwZW1ee1WjA7frlkT/hM1WwwR0HMrdkYo446eT?=
 =?iso-8859-1?Q?B9d0GaZ+8+MynsMF6/ZQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9orFFYQqMiFTWSMGgF/HW3OKInpIyx2Lg/NUfalNVGVno+trQyTg7ZeTnW?=
 =?iso-8859-1?Q?IgW2ZSsZAa0Gbx5XbQbjiVYV9usLZ5AhYzjmEGqmJHGkJ5oMcF5g6euUzM?=
 =?iso-8859-1?Q?VBdNaZ6KA8mZ9qy+opYKAc45Fl5PZ9Oh9ZAvmMIdZexJOeFonUWATX4LN+?=
 =?iso-8859-1?Q?R/NgpYXy06a1KVjvrrKpES5Ewt2e46imK6xfQx8jWgaQmagTTWaJM60aOV?=
 =?iso-8859-1?Q?k7NgAGcqXuSXxc9M6nDAhGmzR+KFkex2DMQkhJrJkB4JQlgPHQl5/mSZt/?=
 =?iso-8859-1?Q?bUSHdsJmhxhlosnWKwaLNPt2SRWII4nlGtY1SRRlbVL1b8LPZ2U2pLjjL7?=
 =?iso-8859-1?Q?kDCkLoB1LrXqB1vgVod3f+vU23UMZlrXEsAnzasKKcLVMtNd7S3ElC7L1C?=
 =?iso-8859-1?Q?B5RSi77eMeNJFkczhKH4EYF07m5iC24DBeJExW6QTzeggQZB+sSPC69zSy?=
 =?iso-8859-1?Q?alv6t0FAWyO2oN/nmimYnwYv6k81G83Akpd9urAG6j0a8AWXdqmwk+Q2r3?=
 =?iso-8859-1?Q?9ad+mcPJ0Zp5tC2autis/n2OPdTqiAKeAPcqMrJb1p6J2YLgoYtPrXYqmG?=
 =?iso-8859-1?Q?FmQgK52kGimQZ2lEMK9zs3OYS/0alnWC5c+CCKhnafNwf05l4twLukYB8S?=
 =?iso-8859-1?Q?UTs5IG1eFXVVfqvfh9irlWc/jW2ESNHb/4jyanypoamImf1aIBMuX1HNhy?=
 =?iso-8859-1?Q?nOvVwCHiMx1XDyXYuY6956ns8w3Uls2LRkdMXm84UtmwEvYiYtB1gbPvRg?=
 =?iso-8859-1?Q?45zkhw794sXg+G+R1KHCRAa2sy0h+XgJAcot9yK0d1IpFCzSJ8/8RVDAQR?=
 =?iso-8859-1?Q?2qhA7x3gX/HTVAnW6lPSEPWHvxWwPmV2hjaf5fSksWzv15NPv8IoVlea/k?=
 =?iso-8859-1?Q?3+y2LmrBLf7qrrNhoIQfllLsI9hJdC7F/p0zDdR6DvAxK5f7ClUEey47Ra?=
 =?iso-8859-1?Q?/Ay5LE4wZfSrLGh3e3nfeLpd4/GldmvdsTUATqINAB+f0BUFa9NRjko9Xh?=
 =?iso-8859-1?Q?n36W8bN4OcPZ3A7uoriIDnoLcTy1B5cF3LYBhwnJrEKQUDJumRKqf0EU8V?=
 =?iso-8859-1?Q?ojE2oReVb61j3CfShIRMf4oleLP5ucTPGPgIkl5vXi81ei8M3e1edaAi5o?=
 =?iso-8859-1?Q?V6Nl0OLPonjEVbFHYJ0gEViyvskgiTT6f45svyUSR0dKUAvkL6PgRg3h9J?=
 =?iso-8859-1?Q?QNr90tLkg0VGQNza6gdQTDq2Nzs06t72dMwRuBSRVhie/aOjI5bLPA4NOH?=
 =?iso-8859-1?Q?LQk3cXnoq0h3qHZlUxcnePTaeuIUs3F4w4b9afNps=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c9cce5-6f6a-436e-e608-08ddb7d2d7e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 12:37:14.4669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6210

The kernel now has a secs_to_jiffies() function which expands to a simpler
code than msecs_to_jiffies(). Use the same for battery timeout which was
using 60000 milliseconds (60 seconds).

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index c8f0e2446..8ee99d603 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -48,7 +48,7 @@
 #define APPLE_FLAG_TB_FKEY	BIT(1)
=20
 #define HID_COUNTRY_INTERNATIONAL_ISO	13
-#define APPLE_BATTERY_TIMEOUT_MS	60000
+#define APPLE_BATTERY_TIMEOUT_SEC	60
=20
 #define HID_USAGE_MAGIC_BL			0xff00000f
 #define APPLE_MAGIC_REPORT_ID_POWER		3
@@ -645,7 +645,7 @@ static void apple_battery_timer_tick(struct timer_list =
*t)
=20
 	if (apple_fetch_battery(hdev) =3D=3D 0) {
 		mod_timer(&asc->battery_timer,
-			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
+			  jiffies + secs_to_jiffies(APPLE_BATTERY_TIMEOUT_SEC));
 	}
 }
=20
@@ -962,7 +962,7 @@ static int apple_probe(struct hid_device *hdev,
 	if (quirks & APPLE_RDESC_BATTERY) {
 		timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
 		mod_timer(&asc->battery_timer,
-			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
+			  jiffies + secs_to_jiffies(APPLE_BATTERY_TIMEOUT_SEC));
 		apple_fetch_battery(hdev);
 	}
=20
--=20
2.49.0



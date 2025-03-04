Return-Path: <linux-input+bounces-10517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B36A4D7A2
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 10:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04FC3AA683
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 09:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F8F1F76B5;
	Tue,  4 Mar 2025 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="NCbEMzHP"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C8262BE;
	Tue,  4 Mar 2025 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741079640; cv=fail; b=a8l4yCHrfqF1/xjjY7BYh3PkxbI/SvwD59HKFpALPziKo2C0odMOXQw1WZJhu5E4JbHqI6IO7iqaYXkLqe6rgfnQnxeiXZDk0c+QUjMwvedRtnrlomsQtLGZofMzb9c0RGu2P6Q9uucgdl/1DVbLwc0xL+19lAg+CvCRs3PCqTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741079640; c=relaxed/simple;
	bh=qv6t7bZY5D01+ziahC+gIMM2K8TLNt+f+ApHiTBq5VU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lUjIkhEcHnTZQ2TqODJLWJiK26e1EYSqGj/kAMljuokWtf9Sp9zB15xSPIjSTAiWjsfYgMI3toopHDHPDHfLnuCu3rIhhVZstXV9FUVBxUrSJne/GU2pCLaWxsGv10qowD0S1OKKiLC3s/PWnPFjWINQ8CFfgvo0/I3quF1kHVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=NCbEMzHP; arc=fail smtp.client-ip=52.103.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJ3nW3GR3wbGK9a54Y2UjTIeG39u2aj/9i9ZyoDAqRuTO/jcLEy1fHcibTB/UxCDkcvGTP+JxPs7+Mr+z2MOVdYV0rnQB4EJzE24XiKEdXZfb+4Mir+uwXcoWh/cHuH+JqzwvF+EPp2xyIDF/j7MBi+P8n7nNTg1V75uNk0WAlAcnA4JrhpYeU1yyjOie4m5FB0f8g0BfL5Lvbopl0Bkl3hNPfIEJh37ZnFNfeY5rL2x/YfMRJDsasZuKQIG9i9GmuZcr74VR+KTTILIuWSpzGhSNCGAVjS5nPXg5hbdwWwCj6VtpmrIgFGCojJdlJvEt0J03Y5Ov4CqZxM3Kr5mGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR4144hPo+jnNBd23SQCaI4buAgAUXKm++RRiddKq9w=;
 b=iE6mVyScqXdyPRhrone4IXDe90h6AQnvpAeYFGdzSUVaQ0LCkYq3jTjtao7YzfVbg5u/xEVK/zPPhgFY/oaTN1xjeDSTl+T2kZTQBQEI2ITBqww9AsCDcEMagWyJA3S8KfjUGqBMQGEOadHOLfIgH7X/PomGJ9aYXpLq+gP2dS8r1ugcbwpZexqqYnJg9gmXcrT68x2kQkdduJK78SuZoE66RH/GgGdnWAPp9z1ixwEW9sbLsAtTnVe9siNkbaa1binV1UElQUcAGxragyq5okTUidW9/Tw5YwXVzgHPIUzmNpXox9HiKZfmil8rPk1qr6nlBpC+EjJazt5FKk/hUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR4144hPo+jnNBd23SQCaI4buAgAUXKm++RRiddKq9w=;
 b=NCbEMzHPZio94j9/0XqOCm6Q72XGNQeO3J8Zi/lywOuq6hc8Q086MlA/I+GHakgvlusz8mxjFxIY8ieXfF/yExFuoYTiWlwXfe41Avkz2Pl4HNTiko+VDNXKoDxGaTa2pqxv+wQd4ZkPmDfJlikY75LvHFgRYH7KkTqZogMZN6WsF+t8y3do2JvqGsAu34APrcCYXCvp83RhejXNpXsOVRinZpRXd6xPyogeXcw4Ip7bw1C1M54IhWVpSrzcLfFFT+TdRUnOG+PVdw38x5EvkPubUbZGswTpr/GUbsVcUPZhy9Vxsh3UxgO37U8wy+b6vExE8m7ZXpSQ0orFFVpCuQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB9281.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 09:13:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 09:13:54 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH 1/2] HID: apple: move backlight report structs to other
 backlight structs
Thread-Topic: [PATCH 1/2] HID: apple: move backlight report structs to other
 backlight structs
Thread-Index: AQHbjOXAK3dp5FFPHU+4xnRvsL4IUQ==
Date: Tue, 4 Mar 2025 09:13:54 +0000
Message-ID: <A6344993-C6B7-40F1-A2A9-CCF83C90D976@live.com>
References: <F4DF8D56-7095-43AE-A788-F10B8CE477B0@live.com>
In-Reply-To: <F4DF8D56-7095-43AE-A788-F10B8CE477B0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB9281:EE_
x-ms-office365-filtering-correlation-id: e9b72118-7a05-4a15-9050-08dd5afce312
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|15080799006|8062599003|19110799003|461199028|7092599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Za/2rD+yvYhpUM2eWK0zg+v2vB0rDyTI8TI9qgr1/q/KkJ0sw6LlKfChwQ7V?=
 =?us-ascii?Q?02WO2uuUnJ24RNkhWSeqd4hSyxVvOwgeXWLMB/mkAg3WFp2KBewKuV8bDExs?=
 =?us-ascii?Q?mQzdwDI9oLk5RErDnj5aR+OzMwNr/9WCGSzHJk6jKdOM+A+yV7CGn4IktQIj?=
 =?us-ascii?Q?2/Pi1aW1q/pwsHgTT3JlWqaVgWoqSpoNaehFZMm0CiSSCX4u5dzhqZIFFGZT?=
 =?us-ascii?Q?HpbDMAIPUVgSNYR4WwVi6YvV2H6sgfpdpbxcAtyL8M3k7gjOYzyLiTIsDmsR?=
 =?us-ascii?Q?IVrjf+M/lsuhFPkOKHBCt2hONJOMbi8HkPr91oRTIpVhm1u2OoY5Xl0L9oS5?=
 =?us-ascii?Q?OpoirdCBzGMAJ5CN4wX9QilJVhmzkcKE2Ta3B61FQJ5/8QU2ouMzRVxFgKLz?=
 =?us-ascii?Q?Bg8np2zurpAlZ1YlJ2VwL1K9wXY7Jb7iHsd9noKisuS1+CkM1sHUXSuB75Lu?=
 =?us-ascii?Q?d0zldab+Sxo/k3xFEeRLhgDnRZiFrrS+SvkkpJ1ZvCKH9fLK6hgY3+3vNeIj?=
 =?us-ascii?Q?jdxRI30nA4Bbt8+ydNP9BEHawJ/vWZFHVxDnZ/g/+YBZ9Bke3Cgs1YPJM/Hg?=
 =?us-ascii?Q?JA1C7jiZtNi9QDjVQUvdb+my7t+GpBMqLP8FAoiOckskjAf3wOQAK1i9VG1X?=
 =?us-ascii?Q?gv+ulPCPLE7N+D4jWmCPjls2IkJBZfNpb7TpgD3dEhL54TV3rjDwhSubahuk?=
 =?us-ascii?Q?hnZ9YcXVgpnbUrwrLaVsFfVNWcR7T5ThfIMHmo34GFER7a4wD6IHsbs+wdYa?=
 =?us-ascii?Q?KrLtfk4oXyQwj5y4hZbGUGMAqXtd2k3DogNGIui+kOlMihv+CK3+hd9Ch4FL?=
 =?us-ascii?Q?w1uZLM4zJsSNP7Q0zW+6tY2behgD4jrhUeUorXKI54R7dR0BJOv7nA+ljOAI?=
 =?us-ascii?Q?k11isSLST59afT6uRy0NkIXnXUNT+ztRXQ5k8hWdz3U5NXYgvXoKCM6BjAcs?=
 =?us-ascii?Q?zgm2l2kPhBY+l3f2BGu6iYsH5AK2dcbAymuCAn5jTPc6h0zL7uDuh042Lvke?=
 =?us-ascii?Q?ZLrEIHpFRCdhb5fFhfpvJrAkySWoumsPY1u4yUfISyN26pJP8GezgmcJpaK2?=
 =?us-ascii?Q?jpb5CQieedovgFQQ9gLGx05EGxED+Q=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oebVHcf+Qse1AWTw1/YIie+tPysslLDcCgQP1xLUwJ5FLEb+pmGH1qWlLsRg?=
 =?us-ascii?Q?mdAWNHPW695JE2WI7B70jiGKx5PoGd279m6It+XTDfPPA5i+ERbXJ3JCVcqD?=
 =?us-ascii?Q?xtBw9rd7RIz6apwyvEjV6XhYy9sSErY7qgOM09JvJd/Ar15raXGCdnK8DaLz?=
 =?us-ascii?Q?R2PEhyfqn6eXUB6/F0I6q3NGWk6vp50Ia+xHENGYCwHMK0mDFBxST1UO7jKf?=
 =?us-ascii?Q?zaY2Oeqqctewj6CnXMB4OGUCv4ug01WQaAA0FXYg1i59az2tv8HQGaCelNun?=
 =?us-ascii?Q?N6Dkq+g4/PbFSCZVL9KYbABJ8AEmWA+DCNXIdlMuop+T323njWE35kEFavfe?=
 =?us-ascii?Q?n6S/Ft2majxdbaO0ctSnBRyYPFlKEAbFcD/fPJ5PehPX0xYGHyshhT5Yuuo9?=
 =?us-ascii?Q?lV2Qg8N3yJHANxuW5o8Plxs7Oqsgg7X/Ew5cXNWNbcV2Enlu3PoE0EP3gOvv?=
 =?us-ascii?Q?jrgXnWMY0/fwEGLxXoDdc7zk6ovWOHGEDYy1BvTSxE2uUBYHqrrXKkJJah9s?=
 =?us-ascii?Q?mXz9TRv8g+fJn/2S1zTJL8s37X3EivEpBcnN1P9qCJxOBTpHlfhYnYhbaeK2?=
 =?us-ascii?Q?gbSIg5lNbaJsE9uBitm8vMWkyOy3oK6OIJdU0EQ6cKEkAhip0xNEeE9mTNUI?=
 =?us-ascii?Q?96aIX3cqdvnIBnHGwPXcueTLKaJommBK66Ec3Q09hVHfkbw9syJ9E9ru07+s?=
 =?us-ascii?Q?dJKr1ErKhDAENMYMl0S+OwudZyG6jP8H18L1uN7WD+0xic9dsbZsE8qgpvEm?=
 =?us-ascii?Q?joV4Ex4ZUZrkKgENYee2prHJx0nF54nAcphUzltbVNLWNbW0BsYn0TBR8uHO?=
 =?us-ascii?Q?/59PT2cHtLE4IbHWjsPf2Zjdcy8P2pO2Ym+Ips4Tu6ZoVrE4HnnsvVmWbJY6?=
 =?us-ascii?Q?9gJ7qwdvkkboIR17YBn6pxKatFGLW4qRC8JHULhOF4Lv6+l84QschgXoi+HN?=
 =?us-ascii?Q?BeOnjXa7oqC+HvxoDf1M3mWRaIQr8lvwppikfeff49cjqwoLNKci3l2CelcB?=
 =?us-ascii?Q?qfYFb9mUbmXWFMiprxQQez0NiXDIgLbj4e0MWUYA1k4PfEI1BSQ+bWgqB4du?=
 =?us-ascii?Q?N9ECs+G47rl1YDg/NbGc6ZMqonbCUhDxOZG/kzCtFg97B1hHkERTsg/g7Pth?=
 =?us-ascii?Q?83qLAty7qy3CaUZ6fqCBM8gXY+wLxGRRPsnqKB2cst70qH//QVDZ68S1Srcu?=
 =?us-ascii?Q?e7VePIHQbKDtk0+oI9BhQkyR/Cuy/wugrf+o9Y2xCDg00IzFAibw5qwCzQ2k?=
 =?us-ascii?Q?88Ip7J7KT5LpNl/0Cx4ffdgfRDBrNpxeKeWIdYckLQAHaffM5poLXnQRx4do?=
 =?us-ascii?Q?f0fe7mCwlnct1uM86uO6nIim?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C50CF303D9FB0042AF8788469A8F7555@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b72118-7a05-4a15-9050-08dd5afce312
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 09:13:54.4198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9281

From: Aditya Garg <gargaditya08@live.com>

The apple_backlight_config_report and apple_backlight_set_report structs
were incorrectly placed between the translation tables. Fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 49812a76b..6fa4941b6 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -89,6 +89,19 @@ struct apple_sc_backlight {
 	struct hid_device *hdev;
 };
=20
+struct apple_backlight_config_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight_off, backlight_on_min, backlight_on_max;
+};
+
+struct apple_backlight_set_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight;
+	u16 rate;
+};
+
 struct apple_magic_backlight {
 	struct led_classdev cdev;
 	struct hid_report *brightness;
@@ -152,20 +165,6 @@ static const struct apple_key_translation magic_keyboa=
rd_2015_fn_keys[] =3D {
 	{ }
 };
=20
-struct apple_backlight_config_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight_off, backlight_on_min, backlight_on_max;
-};
-
-struct apple_backlight_set_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight;
-	u16 rate;
-};
-
-
 static const struct apple_key_translation apple2021_fn_keys[] =3D {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
--=20
2.43.0



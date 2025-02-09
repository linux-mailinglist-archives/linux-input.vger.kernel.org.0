Return-Path: <linux-input+bounces-9864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F9A2DB80
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 08:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1079F3A59B4
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 07:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE8A13213E;
	Sun,  9 Feb 2025 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="VUKwjxky"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010011.outbound.protection.outlook.com [52.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5596B24337A;
	Sun,  9 Feb 2025 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739086080; cv=fail; b=GdHIt4pEv7Chkvd07U/vFEVBW+kOK//EFShozV3Lh/LZu/j2NWsTLu0tB4RChv5XlOGCd6bSo0xrxUIqZUwoXdsn2MDkKgIRA9jEdoctRlrsODm2YDToqTu/SXaNDx+PZ9yzbi0enyuLj3DJVqZ7Sg4km2yQvZ9/2EOmO11HJk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739086080; c=relaxed/simple;
	bh=rN0XAr3fCamG7dMNctG45PyE/Rf+RoZJ99ONPZcdhZ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hW2gK+sVXql4dfs0PXiHkvj05sTlJt1XaNFH8+jpxfYKr91+PakbYBFahqOou0d7+hbHCiXYGG3jdEHvBKIpodIJET4hcO52ywoCwMQBuHwIjT0bWc9MfpSbBLOjCBgqNRQJ6woWfhYnSgPQCimiRAWcKnUsWNWaqFla779Wy4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=VUKwjxky; arc=fail smtp.client-ip=52.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9Td1u0eDjXrqFaQ+ZxE6ta88k+KcBKfF33WeYU9WxIvD6lifrPH/oyDHxZFbJqo/kZmstTRPx5exuUMFcamcW/9oMqJ8y5lMxYPVrtXUudoSgSiwDJcdJjVHjdbaVv+jLPg6cOia1SsHNddlrwK2u4bpMhJZsQ+HeKtMRlKYx3D8+S9K9v7cwv3aLldoX7DTMy1evWKX4mueMhflLAdbDtH39aL1WdkgeLFxi6tJOCEtH3pRUaiJe2ebHZTMFqB9/m2w/nWUOmGu6L7hGnvRN22QeGxWtshIdGA4rNLuQFLcH57kddK3o0LyKZdtHOJpqquYyMBxGaOE4Qoe4BYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK+66BDPZ5zYvly1XejNwZlA/TopatFDZJ9TsnWDc68=;
 b=gQn6OAWgEgDot5+4fZM3ZQEr8aNwAF/tEX98OCX8Ey32B0S+UkBaXYLP6Vd5pA1KpPUguue6lW5M6kPmAo7U1TIQJ8MTktZ1/eWKlNaEahRA7wFSjDtZhlcqOtIfGXx7IlOpkCuKIdq3pQ6VXvsE7j/5Am/pyWMglJ3Y3vuYnuJgIuuQuVOvs2ike+gFMPk0Qw3cIOGi2RCcFkiFT0S1PjgQ3QBlXMrFLcSwKTQrcZjeYMv8OtYWgRe0wxJsT92MbKGGOqnofkBl/mvs+/E5mx5rnvFIH1uq8kH74vGp/w+FrAkrZ92WK3tXxho98s32Nw7hKwKqxrXi6Zl2ujbtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK+66BDPZ5zYvly1XejNwZlA/TopatFDZJ9TsnWDc68=;
 b=VUKwjxkylRAxVqLAfi+ph6XK1oKJD+7CazgCfRRwQSeQKHp/JmZdJSGKTzheq94FCsLHZxKj9uAVxMUmAdX9i/uiXOpIhPTnN9zr2oCRd3wqeMlq+B1h4E3K/N57CYDVG3NaIFf8kiuSYHOGqYQOadMkBPl0Dx93RAb2aWvc4hFxfdOw7ocBDzL/dImncERURyzdYToriXjesUBRwJcsedP3Fy8FshMSM8y8fI91UWKHggN1H/09HShV4goC0gV51i3oGkZfX7vQFAQHxX7kR/8fVmFaQKYTbkejymAU+HB0CDVAaE/+wvgwgITe4lpZmnSbCt6yT6qwWNkTcoZVLA==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MA0PR01MB5755.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Sun, 9 Feb
 2025 07:27:52 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 07:27:52 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] HID: hid-appletb-bl: use appletb_bl_brightness_map
 instead of magic numbers to set default brightness
Thread-Topic: [PATCH 2/2] HID: hid-appletb-bl: use appletb_bl_brightness_map
 instead of magic numbers to set default brightness
Thread-Index: AQHbesQhdeRULc7s9U6qKH30xhbxng==
Date: Sun, 9 Feb 2025 07:27:52 +0000
Message-ID: <E0BFDD6F-0611-4BBA-8382-7D54AAE1772E@live.com>
References: <3AE31FDA-2F6B-4CFA-9E19-0DEECE363D30@live.com>
In-Reply-To: <3AE31FDA-2F6B-4CFA-9E19-0DEECE363D30@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MA0PR01MB5755:EE_
x-ms-office365-filtering-correlation-id: 3571c884-dd00-45d5-68b6-08dd48db43c9
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|15080799006|19110799003|7092599003|8062599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cQuLths4rq6t9HmzY2VyFu0vcli4CYRDCyTgonNTNy6yT8njD2dmioA0Z6E0?=
 =?us-ascii?Q?gadhhrMGWlu6q17gGQZigXmjIrWK1DZVHxZp/zunTKPPM6ZXHo/vSZupjlAj?=
 =?us-ascii?Q?qE33igPZYZCAzxHQFrFEkm/AZwvuYm8XsyPWjz5UTs6beEPs975eQQqqEHnH?=
 =?us-ascii?Q?q8rFIR99X5RWhHkCR6gPxPJYrXljLK4Zg3h1qULZtxIAr0gDD+GJkULtFnyG?=
 =?us-ascii?Q?LnYiEJipwZhXrhey6hXTzueBAan0lfx3EsWxYRucgbDGqUz/VcoEfqfuZnxu?=
 =?us-ascii?Q?YxJZ05XON5NZqxRgmEa95oKGw1sYNkIcr4+5/gTi1g9jTpJfbRxXkVSGAI+V?=
 =?us-ascii?Q?mtlarg5zVO4lglDA676cYf3S0I2ur8bh/1RMrVR4dXdAvpIIURg/fGK7c9vM?=
 =?us-ascii?Q?nuTKMvSlwqHlInSVVDSQ5CtAIFF9tjBKpjnWR8Pwi6M1YSayIG+KQpxKKSwC?=
 =?us-ascii?Q?O3FjFUzbya4OBcLcwB5Y8+Et0YQ2BLxFHn2Py1uv3DhvqMbXZNkVyCpmLF1x?=
 =?us-ascii?Q?BHeu0UxSBc0ABENFhQi5yGKbGGr0aL8Wi9ernPEaJy7oZjFHxjnOmOxPh2Zc?=
 =?us-ascii?Q?48jCxzcXWgp6i7hCs610IPWecGKOrUuPfDxpAmJaur9BEb6o6OTAzm3lTLit?=
 =?us-ascii?Q?yPN7kcjgxujOM6JA5PeVcOtAAZPIfhfjYXbraAz88MIoX938fLtAz8u6PbEA?=
 =?us-ascii?Q?zQfKOrW/svMBy8muHAX6g1ZfZ0Q38VVg+ZtMnLME4ejVfTxItZARSzhHAtN1?=
 =?us-ascii?Q?SwavSlXlHlaZs7tC1ZLTnybCIZBmV3lmfi2Lwu1TfdVpXfs+UPMlPptHjPJX?=
 =?us-ascii?Q?EG7Nw9QXFJ0nV6/O8StluiY/eWFYJUx2kty4zEZZic8UBEXEdYuKLrjYWY6r?=
 =?us-ascii?Q?uEjfPI7SERvgK9EZxRQ0DBBZQcPgGMIWxJ1Uyiq3rKZxCp+kJC6PBRAeU+yq?=
 =?us-ascii?Q?YNa+0+GhnFGb0EwhbilSLoRabT7XD93SZV3+rq1jrbDua/obQQ74VbPsZcMH?=
 =?us-ascii?Q?xRUoTsx6OQTX4FCr+aDeNOwehJBCO0UPqyvpRv63BrZ4ibpLrjZCDqFZavTB?=
 =?us-ascii?Q?ES9tlkJq4lFKBLdW41/Eo2UA4FPiew=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rt712vMs8CVkc2N90QPhxHO3MKV0/7nrlwNJuC6pTUnDCFSUeZ2ctyb40SKO?=
 =?us-ascii?Q?NJG3ELquGhJuGsOQWGYpOSfH2HQ+bfN0Z1ugvbS1hwZWVydfetbfouYIzrRD?=
 =?us-ascii?Q?VDlZEedtrCaMP21u78ZHEW6G/VzXt+WgKRV0YYXZTKpKSTjMAM6T1H6dcvJS?=
 =?us-ascii?Q?X0uRg9MHAmvl16X+tLK8V9U49fqwbgYQ4cFSmyVeA/GMcFHi139gKrXgYTNL?=
 =?us-ascii?Q?RhO7+AhRYX0HtUZ1dNQj78VK6d6/OoXx7ObXWT4R83/pGtQd15itm6roKgue?=
 =?us-ascii?Q?Amfr/FaBKzB1EkRppTz4lPoktykEmw3dkP6t6hkBy1GV8hR5NY34ht24Wgeo?=
 =?us-ascii?Q?qlVTqR14umZazZi5T7PBnqJ1G/F7Xl91x+5Y+laKLR/TBhX5+L7z1reUEa99?=
 =?us-ascii?Q?pblW6U8tDjAFnsIL0NFQn0mvnXrlBkrhMENOkC3vKT3tMLLS39TxcPJa82cB?=
 =?us-ascii?Q?klYi7c1b4zJs9Qq3vKqGeeYUDP1/xCauhHnMtFPStshSf4AqEPtRcCrcavDh?=
 =?us-ascii?Q?np60JVw8Rlu50T89YVSdtKL9eghO1lmRnQ+55Y7eTVhCHWK4D7G3OS1vGEqI?=
 =?us-ascii?Q?bAsggJqeFVivO7xIDZr6ub8F7+2jSnVEcFh1Kevq3jWtAEjh/mEIv1X10asE?=
 =?us-ascii?Q?xDxJjTTTQ+sDdD+KxBvkb6k9BC5pH18RDRrIJu1rXEa2zbfsBfxYBNR7TX7Y?=
 =?us-ascii?Q?0mIPKTkryjcedx9stFZVgpMmxmuuhHZG3a+ZrERlyiclZn/Twvq1DBUpJVZq?=
 =?us-ascii?Q?ytIfurItMJ1MHjDyw+zOs41IC5RoNaDMUn4o1AeTAxY7uNO9dY4zjVhTvIl0?=
 =?us-ascii?Q?M4Pq/jh/KNUacODC+aYf3LxkcZcJxddIPeiHFl/cgXaPhcI3JGQAqqvUjbNz?=
 =?us-ascii?Q?htq86vTHK08XAW9G49YoKczld9teQzzLcKYKrpQQNJjsp7KjuPpTL7Yz6Ml7?=
 =?us-ascii?Q?XvUeUnlFUFlTnYz0VZkr6nSNsnNY5NEkt6UgGp4pBBAEjBNAhxa07mAaY2hI?=
 =?us-ascii?Q?QQMIVmOKw2rCFnh/SikRB35FCmUqPYFGBTBHleF/4hcqRXQjc/gLYVFVHeHO?=
 =?us-ascii?Q?dhi9i+vmrpYg9ylh7/IhyliLNjst8e4Mw+BI3OYAdZw31tChszQHnvGzOl4L?=
 =?us-ascii?Q?JYVTISmHTm4b9IxpXxHgYX8h3zebm8LZBXj5q+5gf2BnDziCmLuDCh3b7PDQ?=
 =?us-ascii?Q?J+wTA1smhTHEwRYktRjOVAwXrpWRj9vcebWgU1UQMaVhoeUQNz8bpigLdaHl?=
 =?us-ascii?Q?TRo2duuivmmKcuBG1vU+u4m3RS59qYO70VtelADpYxt+DorO2DGpspextn2M?=
 =?us-ascii?Q?fpx+LX+0Uc3uBRt7Mg4C5qSN?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86C17957A624084981E7B4162C48DD65@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3571c884-dd00-45d5-68b6-08dd48db43c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2025 07:27:52.8184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5755

From: Aditya Garg <gargaditya08@live.com>

This commit makes use of appletb_bl_brightness_map instead of using if
statements and magic numbers to set default brightness, and thus simplifies
the code.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-appletb-bl.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-appletb-bl.c b/drivers/hid/hid-appletb-bl.c
index 819157686..1a3dcd44b 100644
--- a/drivers/hid/hid-appletb-bl.c
+++ b/drivers/hid/hid-appletb-bl.c
@@ -141,12 +141,8 @@ static int appletb_bl_probe(struct hid_device *hdev, c=
onst struct hid_device_id
 	bl->aux1_field =3D aux1_field;
 	bl->brightness_field =3D brightness_field;
=20
-	if (appletb_bl_def_brightness =3D=3D 0)
-		ret =3D appletb_bl_set_brightness(bl, APPLETB_BL_OFF);
-	else if (appletb_bl_def_brightness =3D=3D 1)
-		ret =3D appletb_bl_set_brightness(bl, APPLETB_BL_DIM);
-	else
-		ret =3D appletb_bl_set_brightness(bl, APPLETB_BL_ON);
+	ret =3D appletb_bl_set_brightness(bl,
+		appletb_bl_brightness_map[(appletb_bl_def_brightness > 2) ? 2 : appletb_=
bl_def_brightness]);
=20
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to set touch bar brightness to off\n");
--=20
2.43.0



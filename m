Return-Path: <linux-input+bounces-11787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A5A8A371
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 17:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2988D17CE7A
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 15:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192EB1F4622;
	Tue, 15 Apr 2025 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="X37U5F+C"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011037.outbound.protection.outlook.com [52.103.68.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6AB1EEA59;
	Tue, 15 Apr 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732504; cv=fail; b=Py4kTmNF/N2cO9jo7QkInifRdo0PD7mvOnmXeLGXR7m3SF4Lx6KDmV2UrNAPAFXbmGVo6wcgPgrmZPTcJIHIL1ALOrSS9cQmA0v04yQH4oUbvlL5YeJywJDPxyFg7H6h+pz1CL5DiIlEU9oTGVaeh7kIJSR6ycB/KQHhGB6wqEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732504; c=relaxed/simple;
	bh=pdDQbZWsB78lbKJhjuQHTv3JfLmbhTlg8dEI4bEF6LU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OmxJfXZpWml/AHf66GQZzNq7Rfxeae63vqxbMqKR2tmVDp5zz6Lk7oDHbk3/pSP1orAcbEOMsMl9wP2oIMIIVuHbEbdVD7D8yAClxLiFC3/bTFEiupMvAboGf6LsVjubTvP/xoCShVr6h/He9+XcBpul48kuU2a8Ai3EKBJuUzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=X37U5F+C; arc=fail smtp.client-ip=52.103.68.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV1q6tA5es8DoDLuokcvrgcCrw5iFjJNAYD9yTaFwu7fIMo9vk1wKv+rfFubAZwPNsBQP5rSyfsNzZC0AW3XpdESHf6ESNXz+6r8E/zKyXGMuMScaTuUf/Tf6/1m64nFn7whKGLMYF9t6EX2O9WHepCCePfFtY1GJTpxM5p+1QLB53u2aZWTPNIipiBgOnVqX7+ml0q7bWtAD8zP3qZgzbYOEm5U6l87Tmd/GQV+Qy/ERi7c09EXNtaRIvICyxudZdWaqZwbA9WnfZAk2DqoDnQ2i4GwefWNhxE8ASZE0pV7wPHtHgY80x2SaO5/Md5g2eEGU35qB6rQrBemuZiPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdDQbZWsB78lbKJhjuQHTv3JfLmbhTlg8dEI4bEF6LU=;
 b=XXiT3D2q+AUPXZmLFxWlQxHPKMZoRLohynneLsgSrkaUqqk2kutQpod401WpRaYbgpYuNlDCwCs0oBGK5KYK0Woqajtf6SyMYpbF5qDk9pLXy6eVQCHALtSIhrmHnqjaCXSApPtD72qwQUuz0C+vZ4kyV5/dYaoeLVF9iHBVqPGnSXzoGfDzZ0ZJe2ZBeaf3A+VBy/PWZVC4ie9MY72i8nzZFOw0v5ZJgszrHYIXzXTySVmSrE/V4eee0l1pMm982Q+lsLGre69tJJ53jj2NsI77uUTtMGnPM3V+bY4+APj1000BVoM6PGBGhBK4p1rpDUeZye6rpAgyH/krQH6+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdDQbZWsB78lbKJhjuQHTv3JfLmbhTlg8dEI4bEF6LU=;
 b=X37U5F+Cy94zascgKg0lRN5hYrehwD6oC5rV3yT/UhUO3CFQHDxQeTBWQ4kR71T6yeaKBq4vhQOctLAwvueEKz+Q4NuJwol7NbQrRPsk9c6BxLF7ewXMoPDdJakAre+JXaPHP9L3T1lQjlxhNpu5uJMScfQpj32Zxr1WEg46/sfQyvGo2VzMqfSbFQoMJjiscZDCrjadcxOICriyLl2bC1laqSO2R3Di6wohs9R3/mQB/r2e2WykhpnQN6VeqtrWOnlS2/gKHYipBwxIOxABl+C4AJXL+4X8bi6J6xvTJ01Q9NcvxZyb4TKs3L9Ch6yXfw67DFhatl1Z4WyvnPgtDA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9647.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 15:54:57 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 15:54:57 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <bentiss@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND v5 0/5] HID: apple: combine patch series for all
 patches recently sent upstream
Thread-Topic: [PATCH RESEND v5 0/5] HID: apple: combine patch series for all
 patches recently sent upstream
Thread-Index: AQHbrh68itqSO/yXLESgYucGTpXqmA==
Date: Tue, 15 Apr 2025 15:54:57 +0000
Message-ID: <665A7C7D-0AF3-45C3-BB48-DDCFF9C63B4D@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9647:EE_
x-ms-office365-filtering-correlation-id: 916a0e9b-6827-4629-6ab8-08dd7c35def0
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|19110799003|8060799006|7092599003|15080799006|440099028|3412199025|13041999003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qByV12ExQILN2Ggo6+LnZ5x55Zq9yhNJjat9Js2VKh3OmMpyXVQJ9HxT+c8G?=
 =?us-ascii?Q?crJEB+FBqgV8/N7k/DCDBFayk5c58em4DuO/pLbCKbMA/Xz7HsUGizvS7i5a?=
 =?us-ascii?Q?hNqU7M9kxTG/og3Mm1Szzr7+1z6zgVs6vyZMTzNS7iItI3kvJfgkXhsYCIDn?=
 =?us-ascii?Q?I0M3Z+iFGOhtDVcWODAN3+rSMykGyN2rzpFpCK7+b0L7adB8hRUolyZLsolm?=
 =?us-ascii?Q?qSm/bXieKYUKxm1gqUdb8vdn/2YMpdwdugRQvGA3M+e5m69ob0iU05lrkzCR?=
 =?us-ascii?Q?CoBW0a1TbNZk1Di7uDLKl0MQtN+iq6q2qzZ5jMbZswC9UUz+HlgnPp+O0Wqp?=
 =?us-ascii?Q?h1RsgUUXrx4syemApX0bBbGF6M+N7mE/cN+mJoFR42BJUr5+4Ue2qWpxKhCb?=
 =?us-ascii?Q?RNa045oezn3ToVD7Ylmlfo01ZHFT+WV9Zunv+JWxpomaAhkSXIeRYduCRbgS?=
 =?us-ascii?Q?CO5PvCEOBl/x1kg9YiC0aEmuMsrSLDyZMx/PyCuDD0eApo4jlWAlV9ZQkSX/?=
 =?us-ascii?Q?KjSjljbmaGC4RSUoUkV/suypwMwlroaMXirYMz8v1AVsfIl5dmJ/YSJt8iF8?=
 =?us-ascii?Q?wumC2Yp/Ki6/L3pcZfbjXkcKUYlGAcE4gzsofEDX3SrlUk1jvUa6D7siOwqz?=
 =?us-ascii?Q?n9eTZ/P9FGUZtM6vUx3QFryWSN004ke8Dp72fDugITxZc+5ReuCYg5dXm1Bj?=
 =?us-ascii?Q?0FT7o+jY617/DzrP5wAkyWexrOIS5XRW6zwtuo6Z3YSO8YfWqGo+SnTjSSKO?=
 =?us-ascii?Q?ZhX3Eq07sUjR9QuEtZyzy2IGD9A3M0ibepTHw6fIPMlU1ToOSWDt2FmRwiKA?=
 =?us-ascii?Q?hXhiUuf9W/c52jNvckB3Y0lNP2/BNxRC/ww8u3HOvMUHABg+tDSz6t9H2u5q?=
 =?us-ascii?Q?qvaYISPB5F11W4gpaBphGcFkZr+xS2I0w65qKUEpiNwHyk6VyLT5NOc+fGR/?=
 =?us-ascii?Q?Alg0UcMOXGHd9iYzfB7aPV6H9r8wPpKtvImqzdRLIt4lSFThcUmUKfTIr8Wb?=
 =?us-ascii?Q?ehkTHs828GDKPaDbgMPmGwaFjT2Wr5qBa+UJHz/8+pLZHlrgwKLr1QG0/Zfr?=
 =?us-ascii?Q?p2TUwOBTgThoJgeOeSqDgaRObCMeZVqubX/nEH3+GLb64eSTKCOeb/gksOmJ?=
 =?us-ascii?Q?fM2rB1qJnyG/AV7PkO3ePsk9tL8IoFzuAw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Tqo8LiOGipTWBPOzhmzPRUC5lL3ExXSikbTNNlHcRPazkS7RLe+X9kpg+e4k?=
 =?us-ascii?Q?99sn0SjI3BKuFNVT4q3uu0sWNQ4YuvKo23DKbcWbqGefGPdzqiphA9untVQE?=
 =?us-ascii?Q?xCaq8WXETx/vty0WY2KxJfnPAcnIg4hTAs/yNgbqrQCeuT3MpjnodpvYE2tP?=
 =?us-ascii?Q?CZlJywNozctU8pUGaWR1QwlRevU5xeHux6b1sPjDv0HS/Roh2pjRCTLOvBP6?=
 =?us-ascii?Q?n4feyrAutKVwkuV6TA96xT4VFC9sDtTkIY5PFwjcEdBlomFUHgJb+RyyG0vM?=
 =?us-ascii?Q?f3sBSBsh20ZcP7MztDzUP4eiAug4gfL1oQHSkwuSXL6DiVwOllxgN5xu/gG0?=
 =?us-ascii?Q?u8CPkVamcGKnwqNo4XJ5NgFO8G7VAzTNHNxI8ItkwuaUhKBg/9QTCHIoa+Z2?=
 =?us-ascii?Q?M+kBuFxyKEQs6dXknUa8n9jo+rkJfl1LpVzI9JJcqrCSjGT3VrXWEI7btSh2?=
 =?us-ascii?Q?METcU1wi3KBe1+ioWCkkQgpfKBwp9376AChhFKC8ANkJzFK/n7iQG64utmRC?=
 =?us-ascii?Q?4qgANXqotJHpGWE6kAlIh0Gs7O5qB1t+54a+XnKUmApWnSkVvH17p/p+a75a?=
 =?us-ascii?Q?RLyFS9G/eoJ4xjjlkCsvCZHk6YFJ/h8Ccbwmv3jwcCzpUScz/kdudvZF6stG?=
 =?us-ascii?Q?iZu++JQ8F2OQn3dQb3Y3XV1kyCRNOPhlnTWqgD+iyDdDi0/ZTB+RcZ+f17xr?=
 =?us-ascii?Q?ixAaLtrtOo5htzdYhXmFYdbPWpITxNsDiV3eOIhyNAle6ou2CYdcVToUicJ4?=
 =?us-ascii?Q?G05kI7WCkF+7hYC8UlguNdbQHQKpHDKGnMdg6LsRf40Vwqzy5ymtczk5Ik2T?=
 =?us-ascii?Q?ZhEnGKV5XBuYcmzidiCAvn1TH+gtXHZNwQ6u3ADHYK12JnYQ/SgFyqzaB1rI?=
 =?us-ascii?Q?foZc/6+mWXTgFEv3IOu9JvTUdnMmFvClMJVv6vuaMrQvLap5ngyDpdwG+xbd?=
 =?us-ascii?Q?KYyvzMKDKozOqjBhtrbOKf+RoWTCrTYP+aJfDMZ/apA+She7fxjys/YpjUus?=
 =?us-ascii?Q?k7Q0tJ1XmCJJv7PBX1gXKw8DI72duuwKgnNWZ/QTqFy/8a+ROEFsMUNJUIKD?=
 =?us-ascii?Q?Z09zkca93sDBbO+XLhU8wblYjNN9szV3tlNlvo+zHulR+2uGO+9XGbs3fE8V?=
 =?us-ascii?Q?1q307CrbEDPkAfarXBqEd51nwARzQXjryFLbY0SFRgC87fyL8OMArPwBDT3B?=
 =?us-ascii?Q?7mHA4JVY9goce4eE/XRm+OTwtxSNk4Ltdks2UmWq8BL9L1oMUhtg8yBhbVOn?=
 =?us-ascii?Q?qm5rgF1SaFVrrBYjL9ynOgW/gaAOOdtT9HESkWetj0EMcJvJGFdqtz//b3VW?=
 =?us-ascii?Q?yGj/CiFbMQyqYtV8H8toxue4?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A08964B97811844898D0D8F5AE03273E@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 916a0e9b-6827-4629-6ab8-08dd7c35def0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 15:54:57.1621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9647

From: Aditya Garg <gargaditya08@live.com>

Hi

This small patch series contains various pending patches for hid-apple in
a single series.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

The third patch removes the unused APPLE_IGNORE_MOUSE quirk.

The last 2 patches add Apple Magic Keyboard A3118 and A3119 USB-C support.

v2: Add A3118 Keyboard
v3: Add A3119 Keyboard
v4: The "from" email in patches authored by me was different from the one
I signed off using (thanks to outlook's weird oauth2 requirements).
Anyways, I've managed to get a workaround to get outlook working
finally, so sending them again properly.
v5: The cover letter itself failed to send in v4. Sending again.

Aditya Garg (4):
HID: apple: move backlight report structs to other backlight structs
HID: apple: use switch case to set fn translation table
HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
HID: apple: Add Apple Magic Keyboard A3119 USB-C support

Grigorii Sokolik (1):
HID: apple: Add Apple Magic Keyboard A3118 USB-C support

drivers/hid/hid-apple.c | 126 +++++++++++++++++++++++-----------------
drivers/hid/hid-ids.h | 10 ++--
2 files changed, 78 insertions(+), 58 deletions(-)

--=20
2.43.0


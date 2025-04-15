Return-Path: <linux-input+bounces-11791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B08A8A3B7
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 18:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE2F189FC96
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDD0203710;
	Tue, 15 Apr 2025 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="V8JZDdR2"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010005.outbound.protection.outlook.com [52.103.67.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAFE571;
	Tue, 15 Apr 2025 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733440; cv=fail; b=HATcsGYU7RNbqAy4JPWfe4P/D1PHSglFYcZhCUb1xRqpCQawTVlDrzRTXjGPOD+BXozERhsRLR4OAkOTnHY1i+zcOOuKZRSpPJb7KSj5Td9N48RlQfcbnJAfiPyU4vPnKRcoK4OqsfGyLD7oHoNKafWahE9L4lH66yeWksAMmZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733440; c=relaxed/simple;
	bh=IsAHxD5VYPvhJ9HGMAJoQrh5LM4wBjmXMigWhCfhIjE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sAUDA0i652hkJtcp2ERKueox0ffryCmiyLrBO3aQim3dWz9zz7VL4pUOZ0x/dAgHuuAGww2hr9XFzFcrkzFtmYxy4rPzKwZa56MIIdIAzoM5c3cVopVHYvtv+EJrfIjVZQWEEBF1mv5/4KS0nIdxnw10viznhr99+O0FMQVZGOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=V8JZDdR2; arc=fail smtp.client-ip=52.103.67.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgQbgs9U/BRAVkS+iK8Mhci35sSD50432n7AXZz07SKCbV7V2nGU+anYCbWU3l2ys34BklwAASjXIWcUi+YcTbAECecn3DId5fuZdEsFV+BFUIUs3NTBXXpGMf1mhHaeq9irt0EKuGYBn8fVyp1LTm1jAqykUf8hoGiEIJqg/pWa8z5qf16SQakbfGISQxmxGjsCHrlOM4vrAIJNGjccuKOlCacFLddn1Eq8ta/DIdHvK86a4xZPGiiyYsqHe+fbkGn9Fz6RRAeBdicR6VurqZpGKhsa6Rbb6YwNxJ5IaDNwVEnLol3u04vtLLyhYA3phNWio+nnrXSbtKRqQBwehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oklGjKnS7j0ePTpWTtEBuVFRjornnkiE0Up+JIt18xs=;
 b=x13t0QuIHCjs4YsaI0gGg1SZrqhgu0Qh5/N2cg+2XsFOyAoOtD+iUnU0xh5/ndts/Aum2WGut9nCMUNsHjoyaxxZaNRCItImC/WMt0ymaWl//uzWMM9+k8SeAS6MSdCsjQegeRQhkeG8RkVRqE1/5teBuEHcCsJ/1usE4qCAmM6oTFNS6l9K/3XoNnqQABqOPF4RTiO/HbDdVNEXBcDqLi/QtHoyL7eFJTsqKk5PAYHqYRanWRl0FKJ+f8+oSI9bLKCy5jjzFTs3q0TKU6QqH7ouX7xxBrWYo1nT6cV1m3uEW0ixT9DSyBR6VY9DXjaPspzs5grL2yjUMWWpOKyooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oklGjKnS7j0ePTpWTtEBuVFRjornnkiE0Up+JIt18xs=;
 b=V8JZDdR28Q9qn0o7soRHLg2voByDWMWMnMg525EcLU8Rli26+Ti4mo7fl4VY3Jl0L/F6pKIm24unEZuxHCPQ9Hc0rkRFUEIbIP16sCGSNS1y8HuTfjWki9bcM0PHUjVwVk1gxBOsvsMkxuD0HPXCQfQT3N/b9C6w/TF8j7K42BkSg4YZDQINMKYrx8ZygOTQ/nR2mfrV/GbGilC0pmA5spL1hnVvexx/Wwkh+cPXHChyVM6fO5lHCjkbB1DXxZRekPzYQqHEaTEvvGneg0csd7CaTEv4PKuyIBjs+oer5XJZKFGDhV6UI0l6xE3BMMOBNPzeuB1IdgR64Rw5WBTPaA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9735.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:10:33 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 16:10:33 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND v5 1/5] HID: apple: move backlight report structs to
 other backlight structs
Thread-Topic: [PATCH RESEND v5 1/5] HID: apple: move backlight report structs
 to other backlight structs
Thread-Index: AQHbriDq4TarMEXkLEGRs5WZ8t++SQ==
Date: Tue, 15 Apr 2025 16:10:33 +0000
Message-ID: <DD3CFC9A-CB33-4E57-B91C-F8C403E03BBC@live.com>
References: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
In-Reply-To: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9735:EE_
x-ms-office365-filtering-correlation-id: 791e1c48-57bf-4bd2-aa25-08dd7c380cf3
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|8060799006|19110799003|15080799006|7092599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qS+RvfoUshhHeE2298kyiQzDL3ifel6dvQBmFxew6NF/UzhD/QM/xHDjqfow?=
 =?us-ascii?Q?2ye9zfvT5451qrxUdB5cRs7LBnfu/TZMTUZLqF/p2RHKs9BXfnYfh62I3/BC?=
 =?us-ascii?Q?On7BKs+Ia+D6zfETh8pfFGVcHOxIiAdRVfL5qN23rrZDE5jmcv+aBZ6LGlIY?=
 =?us-ascii?Q?JzJukJF9nrYZao8uzCSOfAd2Y0eFeS5feErPFeJiett25ZsoZiCf1/enik6h?=
 =?us-ascii?Q?D9QozrcVk9kbv6QN/fDur0wdPXwoQGc/nJu1z432E1ycCQ2pEr8taO6Vt5tb?=
 =?us-ascii?Q?BKex7OIpsJlr+iS4uxeZcHYlQsvEmQocssvzC/hQpV/jusLX9kfHnajwA4Xk?=
 =?us-ascii?Q?ZiKUMozTMldeORSTzK0h7qI43nBoddeKjNIhnEqSyxl3pY8TuPxET3AFVkE3?=
 =?us-ascii?Q?3DixNh5LRNKYyQEcHVJ+Y3+pb/7yHs/XBpEmFJcKQZTJVlg/3A1oakUGZgDy?=
 =?us-ascii?Q?lh2XQJWW00Z/sd5MSlZWa1YNlqgeOTcOvTnhtHQDLj+kI78u4Hp+wxLdXl1A?=
 =?us-ascii?Q?WRUpC6onByXI5Vm1mMSl29elcqXCdSXJ4WPD6dg1Oi9ivzQhWV7jjcrvhGLR?=
 =?us-ascii?Q?xI0G1YSECBiDDNbgeRX9nTsmDLjyvEc4aWUHRvOgKxqVroEg4JjuTmquy504?=
 =?us-ascii?Q?GL5fvxaZEzrkAhazy1WkuDT9ZOz4EVZhI4zAbGm4+dnQ8klQVcMfV9ywOclh?=
 =?us-ascii?Q?OhkQ7XgKhIjcp235ysB53aQG656gsotdf6tF6JFF95tvUG3tPtYCMxvRQ3f7?=
 =?us-ascii?Q?l1TQ/h4SsHDQs/uCiWXkqjgRbiQFD+6F/8DI90GKy/X4Cp16TeHrGk2pOmCP?=
 =?us-ascii?Q?Wo6wV8Z5YfV6ege4Vckoc+Ti3NJmG6rnQ2eazMHmqaNR9+2Q0ghSizT1L9Mp?=
 =?us-ascii?Q?i2xeWyLwXm+w07v+MMCz4BD9OwLX2JQndlE1I5B+wnDmXUeBpy2+Cq6ki5Ur?=
 =?us-ascii?Q?xSdX3WDUGGfXa70EU31Xkm1lzfTkkFMzkc7phqM0MgEYyN6wtfBXlVXQTcxK?=
 =?us-ascii?Q?qW6Y/B45sDKqp96REvo3OW7v7LqeRRKGG7E/YrdncFOTKKfVShydELzCBoJ5?=
 =?us-ascii?Q?xsmlvm0X1RHlcalGluDjFOflxsDbTa8/p1KeLOx8+G1jQ4VUY6o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0Azw4C5zkgKZvbgRL1xLpctUkT+JxUlEuuLb4ezK6zn4EFoHwNcPPAGcNizH?=
 =?us-ascii?Q?IkRhZKdogAPXr1elINcE5pvoEC5RIKgZt4gtUFxddhW3aBwOa7YZCQ5LKd1L?=
 =?us-ascii?Q?+cq1giGHKFP5i8w2ERLP0fN6XazDyAG09tGrGwwWk9mKCM3CeFNwxlEXqJWp?=
 =?us-ascii?Q?lrWv81B24O+J8I5NxwU9Ya1Mqc7jFTPNmWOaCsoqUky84Zq+wngrK4rNwiq5?=
 =?us-ascii?Q?M6f0M18UZ8YK+LIc5BUBuRmsfQnwEOINcWEyOjOLiqGTt9Lqw7s018Rrm00i?=
 =?us-ascii?Q?RamUYTCMIEuQwK3+0IWAVARSv2mgiVK2T2B52phuxUS0VuMRKfAikzGSCouh?=
 =?us-ascii?Q?pwz7aFe8ivUQbuKR97+2SICOgOarOrVyboH+aAuqT3V7rDPJXdmzWs1+8B8t?=
 =?us-ascii?Q?hpww6oIbTVzrd7VUPCVKRUM6uIbxtgz/45vBDsJUNkELaZ8WgxWoY+p1BZg0?=
 =?us-ascii?Q?J52opsqMwho9ddxBrXPgmInBuuv22TEP5YGpMlI34WJWLgOcKHxgwz4Tz0Dc?=
 =?us-ascii?Q?GMtl66nlZXZKB7k+yXq/clXTgwEzLOThWqQJFq8xblqE9/ekiDizaQNZgRFE?=
 =?us-ascii?Q?/ef3tVXZE/gKYq97bjKyb8UPCzokDQwZ91wq9eu1Go8c/j51WONJKK2/3QvG?=
 =?us-ascii?Q?ixtragMwQdS53q3QQKB+gMz4geqO0p4m+9SyuggYv0ugrrDOiyv7l4W82/dP?=
 =?us-ascii?Q?zOfXu1q1zbc/7JC7ZrhemFSJgQMTJa9HcMJCfo2lHcXV3nk9xRDJ+cfJ35sa?=
 =?us-ascii?Q?EjoPXjdgQ/TzPyJZtNyMWvfjNRDhhno1sww2J/ScSCRTIfChy6QrmCM7YtjX?=
 =?us-ascii?Q?1OUCPs/NqGTr34lDnlO4xJnjWiF8VnxfepSbqlYQPANA+5WDdCr/wHTMKkeG?=
 =?us-ascii?Q?7iIforMEhCAULQNxeMRZ/p20n9aiNfo4Hh3Y5rh625F3zyH/rrhhf6rwDoRm?=
 =?us-ascii?Q?J3+IR7gFIeYWHaOxXeq+9jOwOsC8Qod05Uc+URRHE0HFvx2cRpVT7doXE/5r?=
 =?us-ascii?Q?HrQaa7AHTq32La9L3UWN6MYeGqw1/dIqpGUKY1abDtLmtA5Fif2R0R3JEEd4?=
 =?us-ascii?Q?+aZmPuW7iHbUWjQP2Fc/qxsvqo3ysEoxF5i0440XSGRxgBIA4XValja48jon?=
 =?us-ascii?Q?f2dhJlOZcWf/nkten+Z1tR2RKUvPMkq5kdAScA/xqNvfjCyVhGxplkbrgwfG?=
 =?us-ascii?Q?Y+BzxgZ6sOMI55Y9ZUWbhgwOavUiCaBSkWjXMEvG756PANTzKisIZxb2cVny?=
 =?us-ascii?Q?z88BB6nB75SjcnJUJCVNKifyMia/9kHGYLPPWaCdqVpwVgw8EmMAZ6+wgTo+?=
 =?us-ascii?Q?ju+PhDJf/zy6DWj9TFb3Qma4?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87C4E7F0DA66AE4E93E8137BFC33E5FC@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 791e1c48-57bf-4bd2-aa25-08dd7c380cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 16:10:33.3248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9735

From: Aditya Garg <gargaditya08@live.com>

The apple_backlight_config_report and apple_backlight_set_report structs
were incorrectly placed between the translation tables. Fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..93b990603 100644
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
2.49.0



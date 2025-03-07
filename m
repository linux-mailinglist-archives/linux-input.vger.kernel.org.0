Return-Path: <linux-input+bounces-10619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E6A56750
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2203B6F93
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825662185AC;
	Fri,  7 Mar 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="NNk+i4hD"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010002.outbound.protection.outlook.com [52.103.67.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E9321859F;
	Fri,  7 Mar 2025 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348708; cv=fail; b=QsroGBSuMPb9X1c7BmSVL1wVH4cHhh2jKO477XTMRC8tc+R62kqgaX6+qR6qFAAcjHuyMsPqaj9PiHgmpxGulqawS64ZX2MFX8RiqKuKBF0wnznU7pZG/DeXnLnzkIWUBIWAXJu4mT9DcHE6kS6O0FqgwBjViN44/I+bQ2mfQY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348708; c=relaxed/simple;
	bh=IBELxxX4q6OyeJ3zR28L3k3xcZBuzKnoHKStqwUGYKE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uy79m7uHif8F+93KRrnLGLc2Oa0G3pDiEuFiqbZCXWEFzDi5phFSSQotAPEE+SuAlL73m+v4RqU7wAJrAFn+NMcKVFQ2p+Sgl4+KVimGX4BXltbwKU91lD6OpVF8GDd4YbFKeyFp8OEz8J5C0Ngo934VK4KqGpGWfG6yOUJ2TuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=NNk+i4hD; arc=fail smtp.client-ip=52.103.67.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9zabe0fd33ivdpJMsOFCgdBkxJhFaf01b9wX0Bro6sDAa6n7vIIIbq61M2/RB22UkBvueALUO+Pma+Sk4EICAPNlwam8j3ZH6my7RD+gsrWed4hFhV1hCl2fcQwGM5tHt6+aZYrAtjwx2MZPUu/6yX+4wHDBWIrTPV81YP0/zCAjX+l1X/Ef2V6e77potO6y7VL3d6w4KVSDJBaIhOzpMD5PDEEWw2NochJ5Z5hVpPtbNX+mfrXvdwpmibLNX3SES8KuHAqUR6JsGaD0UO7Pkok9+ayLJdjSeS6Hf0g17uFJbV8TEw7fkMf89YgdDVm8bgdNLlj/NUOfvRddAEgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbqb69CIhKSDNVEO0IV4UVWv/QX03g+zHBpMQ1yvBbk=;
 b=r94+xCMWLmY1FyIht5Y6vbJPsYLfIWn03nbr0lzpw3AlxjwzUmJv3FDdAds/FzBoaVsuPErUVmjad1TA8A+8mkYySvA/HAhQN0jjcX2dRFPBD4585gLQ6SU4e2USq+lzOsuit562AeaWeCzlRmzy0/mHBQ0S4TD8v4Dj8+Qo5zscyFmHky9k6woPisjOkC2UDG1s7MToJ790WxA9LqMbdAh6Up12Qujw9QESrcJZrstYZZg0dhDGlTWkP/+sU2bldw2gJ45L6p/kl/tg3n5Ne8hbibu/Bb+LHvXDTXG/sWPZvm4sxVUsn6ZkIXDHcMc2GUtPtfVRZg82H63yEejkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbqb69CIhKSDNVEO0IV4UVWv/QX03g+zHBpMQ1yvBbk=;
 b=NNk+i4hDJVXh0VYaJYuxS7IwHrXrpT/8CjB5QS45voEZtBm/SlvFB/OHUYAPGVyhD4p7NszXpAqFSQVdi43y0s1QJzC0wWOkYm2nG4ECeA88z3Omao9eOWaBFOS5efS6arKx3+DR/cBhVrP+t5yubQ4+Q4n+M0cLfsGs883RWcmIkHA66F+bTJSzGZhUOSTfMYvNwzh5uVe1iDYT/hUpIggSD2MpqF+wx2XvVJY998S469e6C0+yXeP+4SLyIJwnPRd9uzUt3CQh+rpaSeVhPYuNWRyOCUOp777Y/RvjXoosjZbBlcD4VdWfz/weM6nuBDaWCmJxeiakpCjdTO2oLw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB10324.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 11:58:21 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 11:58:21 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jkosina@suse.com>, Jiri Kosina <jikos@kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 1/4] HID: apple: move backlight report structs to other
 backlight structs
Thread-Topic: [PATCH v2 1/4] HID: apple: move backlight report structs to
 other backlight structs
Thread-Index: AQHbj1g5xMuSKiZWhEyqAcRc5jw4Kw==
Date: Fri, 7 Mar 2025 11:58:21 +0000
Message-ID: <301ABC57-8AEC-454C-AE19-A57DECB480E9@live.com>
References: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
In-Reply-To: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB10324:EE_
x-ms-office365-filtering-correlation-id: 4e471b96-9ff7-4aab-f1ba-08dd5d6f5ba4
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|15080799006|8060799006|19110799003|461199028|8062599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VKS4qmxun8aBvIKISMRdDDhSlmPIyGryNLkLmUYwjtsqtPawCUf5eenB+s3X?=
 =?us-ascii?Q?+wtywnyg/UxNln23rRAaj2z6bnCdL21+NbJA3IjLoqSuClZSw68Zz69Air9h?=
 =?us-ascii?Q?syPhu62WFnPlzrCpcUIBxdYYqWbCu9fO9DyAA0B0JdB1EotAzoumnZxW270t?=
 =?us-ascii?Q?IllE+nlew4oIX6s7uquk0k5QCgYEJf1eHqa6BN/tkQvUL/1ivAr+V1NESnzo?=
 =?us-ascii?Q?7gbAeFQAzqymHN2RgAn/MVPqjTx3uSxFmSI4HhWypsRkYMzElQQOC9dppiUS?=
 =?us-ascii?Q?H4+1887OlkcdMD+CA+edlqF6F9al+OtWeJ/2xbuReb0/Py3k6+C+AAcJwNHb?=
 =?us-ascii?Q?HTHRFToXvrOl8oOp73lT2yLeUe8WBZRFE26Dr/3NYD+v/Zkcx0zK+9uFLU9I?=
 =?us-ascii?Q?EOQKOpjV2V2ePwmG89Bmro/YqAO3nA+oi2Oyjo0ttrQVNYM88Ld2mHvgd/Cm?=
 =?us-ascii?Q?SweYneaRlthQNn8QKbdbUseLn2x2exyCc6MqaCpRn8KeAWuH5kUHbe6NYPKa?=
 =?us-ascii?Q?udrjZRS6a4bzsk6UgaC9zkTq3RJ88tYly3VLQ95QYbS3Sd1jqR+V6nmSCmR2?=
 =?us-ascii?Q?AEukpo8Evjzjwv7QWIZyR+5TX+Kz4Qzq4J7/eZeXc8Y/12VZBxF8UiooQb2c?=
 =?us-ascii?Q?pQxLlfWSwJh5I6A36/yEctJHrTeBS8A51wH21ncVOwkF83vBQUYZNMMNUbTa?=
 =?us-ascii?Q?Os7wl05Ms8k8kgwiPH46qYin1DE9xxCf3BVMhZx+4sirUbZTOrGGzcZk3isW?=
 =?us-ascii?Q?D5uS/HW1zp6Yhh/NrDpjhqqQfQJvAEEvLPKB+LKm6U1IO1635tLf3x/pykfE?=
 =?us-ascii?Q?4Tmjp2q+s/FYgkbH2VfRkLGRKU5BbPulDPaX1biOkTkQCFW/3aggotOcFlOL?=
 =?us-ascii?Q?FETzv6VLE5ktWDKaPeAw32nkiha3ijoUElA3VVjird/DjTFqtfk3myjXru8R?=
 =?us-ascii?Q?yFvI+ed5oBjYdaOV59+habCjn25XDqV7vQ/8gJFXooZ3aJud7cLb6YJYGDoM?=
 =?us-ascii?Q?0BUneRJnuSe0DeVFGD+MTi2SOcPwPAdBr4xGl2uwb0mVhx5smgga/fjHcabY?=
 =?us-ascii?Q?XDYtuubzVd/9bpBc5GxNVAniuf6XdQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HgTtLtw8zGGKSCEVt4SgFnX07vKMybIZXwR7r2UnKwCUyJzdAKqS5/ujD627?=
 =?us-ascii?Q?kDRDcVT4oZ0L5JS4zK7u2g6T6Vj8Xcq5eHowfpmYmuLR+pWR+W0kmmTDUcd3?=
 =?us-ascii?Q?hO5r/oWGG3/oxQ5fAAE19AKapOzp7d76QEgF6EMA+lpzbV7PqBDYraj4BIcA?=
 =?us-ascii?Q?MMxJLaVjQyVgzuuT+Xrt0NttPGdEc/T9yDi8qQWYXtN3EDjPCByv3Q7w2qam?=
 =?us-ascii?Q?VjeJHyLqYUK04rEJO2XRHmMh6W6zE8E/keTfcSvRPK+TNu5dT2ZDc+Hh//nN?=
 =?us-ascii?Q?dOgE8oNgIPoUsKg0vuLOc9c93WFPJTb8b5+etkLsk7GF0yC+pnqgkADaXBZe?=
 =?us-ascii?Q?NOMlvkPaaKe7FUx+bnB5hhWR83mGwpGRwaxiAXzR5+bGkbxS34iMUin+fFB8?=
 =?us-ascii?Q?R/pUFAKty5aOznB4EUBr3aJ9kQT6iC5lH54zveTN+e/VuaKLnfBIo4GqSdUk?=
 =?us-ascii?Q?rga9XLEh3Jsg2sZEwjPgnqmubnLyO1ebJbt8/1lTpQIZvef1vINEL7jYDmoF?=
 =?us-ascii?Q?Rf7QPztORwapPK3qaMqmM64qi+03YTfDukjabmc0t6vDuH0prEbnuyP6Qq+E?=
 =?us-ascii?Q?5kfRVDQCJD7OcFEqFy3XwKzClxW5NXoR6bG25iQ88vR+liR+9NVa/xKUkdWa?=
 =?us-ascii?Q?MKMV5aQOOApIdWMQm5VtT5RYu5tFaOws6LyaK86ifGZVeaXlmziWFMOyCTCT?=
 =?us-ascii?Q?iEPsbHoaTq8uCBAi44tZexMNcwMpg7jfUjcS7hjwaG2e00AaHL8WGoygUyw3?=
 =?us-ascii?Q?Mm9oSSXvO7aQK7nxG1DpGyNURiq3Gmgpvi553rCiDSKq/1tN8P2GRyZIdYxg?=
 =?us-ascii?Q?hP3qWywn0M1dy6UcRtG8YLPBstqirJ6uV0mtWUg8BtFbFVyBKqoZLgEsXWkn?=
 =?us-ascii?Q?/OR3TI9L61R1LmJa6ZuRt7qts5dUum9su6rjV57wTpBoDvcW8h76T0O65DWH?=
 =?us-ascii?Q?OVMaDk/naf8svSrbhacf5Ek1xf5WU37224v+9LAJy+bakuMVpFOqbnyc0L9f?=
 =?us-ascii?Q?IEk/mWqtiog3cQyx/N8ky1xSJqnhanHc7BNd6Wc9AL8HZZyNqFPC/CM/TZPu?=
 =?us-ascii?Q?1skBBFiRXERWKVAjaqyGrkRvy/4lH6Wx1uH9MWOstba8961sU/QdIuu/QVFf?=
 =?us-ascii?Q?bmdGVB75KYVracr1kzJL2s1wnaEDm7yhlFinojV1LL+pua/54IqItBz4Y9jI?=
 =?us-ascii?Q?7R7AtDqxbsZMRyF8kRPvTmlhxdb3dcC85DBAapyE4cLC+cPqnzb6W7uhQLte?=
 =?us-ascii?Q?5RITwAHlgd1eGWEWuzeWn88zo/H62RnhzLdxBt4aJGIv65IRM2p1LUrOIGFj?=
 =?us-ascii?Q?1mb35ZP9UGnHVEii3nxhuaj5?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <590055BDE5C9B940AEF80559D286B12E@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e471b96-9ff7-4aab-f1ba-08dd5d6f5ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 11:58:21.6408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10324

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
2.39.5 (Apple Git-154)



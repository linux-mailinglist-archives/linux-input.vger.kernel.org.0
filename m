Return-Path: <linux-input+bounces-10038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5117FA35B29
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 11:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 890D23A8787
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 10:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35195245AFC;
	Fri, 14 Feb 2025 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="GtjqQEhr"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010015.outbound.protection.outlook.com [52.103.67.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DEF22CBDC;
	Fri, 14 Feb 2025 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527648; cv=fail; b=YYtrqza4T19IwlLqTTbDldvi41y+Y3RiW8CRARBGv4J8MJr8/wRKXQCzNiykzuoJDqtwpub6sVJz8V0i+fw8Llfd7LyHy96KkfNnqGOtqUMepmffcLIKdDCxSH652phTKF6ypEe3c/OkAL+5b/zHdi/PeL8ifXu6Y5SIXJ5eoZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527648; c=relaxed/simple;
	bh=UvQ/yw+f8qekbNOh3nQsZdSRqPXrNxZOPSyJ33/2/0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uI6kl7/K4fUmwOQ0suNP4PmJljtOZjT2k72jNdQAxf/9FJ3WeNDvvgloydbTfPsPv33Q67yNGJXGUVzxxUJrg5Nxo92XrCHUqa38O0jGyfbJ2Tqx3GZGSB15ydDHsQaf/KgPvLe1UhQHmnSClmDKgevYhF3O+7zMo/uBNQcpeLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=GtjqQEhr; arc=fail smtp.client-ip=52.103.67.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8ntgojXAxEtlghQ2GwzQlRYxtRprF07UYejInQzAk4ifmbi5zaQTd66cvNkMUZ2dAyKetjN/2OApJzS8pjy/v16OT/A8K18zlXJQW5DokktRpJJKiQn6PBmkm9XxEOQBMeZldQxngjiIzHo2JaXLLbEltx9IkLd6HlU4tvMn7k169dZ5f5CGJVRsoTCpuQBlw9w/n8LF/nWrN42pfm+sSwxVWByxZuJlhc7JmvMYW8itmd8J3n/ReGynijVRXxWN4tXdLB7EtRIlWEoqJXi2JCL0JVkrkZgIMULlR3m5hBhbDRunxCEV3yYvvrpHXnzpr5dUmaZl12P3WTKFpIQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItwaqomeXXfXTD3OCr4OIQlSxlc2adn+czrpV+564ZE=;
 b=LzmfiMV7AwixULSHJbQhJhhlHbxHeQ35pl2mbdb27B6HHab5wTfGIl696ux9O0EBtR9x7Bp1wl/PHHsavzTSZY9vS/GpOLkz+dEobS5uaUVe9ubvOQTclSEFdWVFuiLD82BSw1nt6lnEsUS/A1/xxKDmMQKIo3Ul3HX0xyD+xatdsU49iEoJuOGIr+G42HT51y8nE2tMsK6/kwAYABdrS9fGLB3jiE/qGC9XpybuwcNkiavHTxM/RZH7aYpbTJ8MgmzQq9k9Q09D4GUspnBQYUqjfijdMx5fLIe35mu8V/z6b/lzecjrgdpXDMJDeeKYpuK+7H3EXHBL8hx37mirWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItwaqomeXXfXTD3OCr4OIQlSxlc2adn+czrpV+564ZE=;
 b=GtjqQEhrrQXqRVjm3wmjleWJ2Xzqp7BW/kBeN9gpuemnZwTuUEAyHe1J6gyEQykb9J8SG6aElzKa6ZY1rEk7mjZ3OMDChgbdFWVPJszGWapqKCJHw0rxuk2Y+adXGIx0g0drESAOSiiJCrWwtqr40MBlDPHZXS5u03epkXPfk9A52lebi8ykXbFYGBh4bYwzELF1uEi8d2XE3iOBgsxyRTSFmTy9OEJxPWqFfsuxNXhh60pkWdegz+BPyLNgpkjhmchrExb92fIUXNnybt2lQxhj7E+wAbK0xXWnNWWCqlgfMVyznqDfHaQT5omWtbZshu+XjsXiBVbNJza5TCRJVg==
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:107::8)
 by MA0PR01MB10024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Fri, 14 Feb
 2025 10:07:21 +0000
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866]) by PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 10:07:21 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Alex Henrie <alexhenrie24@gmail.com>, "jose.exposito89@gmail.com"
	<jose.exposito89@gmail.com>, "bruners@gmail.com" <bruners@gmail.com>,
	"seobrien@chromium.org" <seobrien@chromium.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 3/4] HID: apple: simplify logic for swapping only left
 sided option and command keys
Thread-Topic: [PATCH v2 3/4] HID: apple: simplify logic for swapping only left
 sided option and command keys
Thread-Index: AQHbfsg86PLYS+NsLk6zNloPDQHW8A==
Date: Fri, 14 Feb 2025 10:07:20 +0000
Message-ID: <0DE60F20-1000-405B-99D7-70DB51A27BD2@live.com>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
In-Reply-To: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9615:EE_|MA0PR01MB10024:EE_
x-ms-office365-filtering-correlation-id: ac2860a8-633e-4ccf-f450-08dd4cdf5ee2
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8062599003|8060799006|461199028|7092599003|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Vl34mFngs3ekXMndR0Ipwzn8gRU8TF7gXaltaZKaO51K73UhrXQsIvx6GHbi?=
 =?us-ascii?Q?xksgCZTESvQ8pVst691ov7yG4TLUGyq/5lmEXye8zU/oJKRDRWM6Ob73Ll2W?=
 =?us-ascii?Q?OwVAAZyupdKJcMobtPkhwi1ezU1tvi5Amed+HdD1P6kw7EPNEmK/k/kIdlwt?=
 =?us-ascii?Q?iJmh2fRf7V8Mv2g+tKdnsGWNOogK0fCbEDfMlsy1YWl2Om5n37VHWGwGbkn6?=
 =?us-ascii?Q?g1Sua7U4GLuBppApTivKyxgQN5UO37Bb7wZ8tvOzKK7KPxDbIrzaXD2fDvVN?=
 =?us-ascii?Q?eGz+DIiNTN9lMP8ZXn894goJ5mw88ooM4twxzPS1G5bfceAlq6Rh+iVWDrSG?=
 =?us-ascii?Q?DRDqoDaeQg2VQRgcbBkbkOsUU67r4TsKqvOMFpy2Joe71oSqwUixswaw9+/h?=
 =?us-ascii?Q?qtBXBOEwrsTavQefdDSHOuMHZHR5r43P3GneFehgxqK6yGRUeFE9rQ24i/6M?=
 =?us-ascii?Q?ynMN+Mh2+oJOjtdTc4tU1lvp07UffLLoUI8QUKOxnh15zcE2S5xncsKd6+yF?=
 =?us-ascii?Q?l1QOZi58X0UtXuQEZiSN3hYaCP/Tiw26KaAxbibmU4T4ZOKUMYBC1NhVsQGZ?=
 =?us-ascii?Q?qoZmyKpxjACO2d5CbaqMKVW9QAQ2sUdlND9R2x/gBUD+HSF1Aa1mmcimgkkL?=
 =?us-ascii?Q?2MfN4drCoY+4IUqtezfjXDRyJViId+aNLZ6tmI0eU81d4kDvR3vNSvWzk6N0?=
 =?us-ascii?Q?WDNCg8ForPvvZXFWoK9f4HsIAlQHh3OamyXC0t76XTEbngF0Cce/xS49O/Xg?=
 =?us-ascii?Q?r4wrrzlSJ6T/A4pDA4IFwRokVgxGX869HmWcQPKOwWyx0p1LhMVH+6PaVeFi?=
 =?us-ascii?Q?+csqAJQlwPinbv74ezblvaZEwQvVgW05tNgvNdIpTR3uOFDNSsJzc1VojPMY?=
 =?us-ascii?Q?HmrOHN3jFuUqKUSyiufN3T9dig2JL8xUxouGguG3cKvWavpZ7lotuSVDfGzs?=
 =?us-ascii?Q?xbKaPJ7Y1oLQtlElPlhjHBRmnqfDXyyAUJCJLL5Qf3QB+UEWrqaSP483dMFH?=
 =?us-ascii?Q?0/+qGAb4HPnVKU63OR7Xvak3WiGwJX0wrTLO29VzrLW7e7G+ywQnEO7vxYlQ?=
 =?us-ascii?Q?qEvih7fu3Yf3EljEY0ht0RxTNWs5Vg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I8Q6O8qLPuleP4nWs5ZDQ7NqeIw6V09oGfTIrlHtbu3+smeof8QCOJ1FPTgp?=
 =?us-ascii?Q?B83dncPeVyTFacIQq0m0exjlGEqa957O2qHJ1emzCgGUSFcLfvqJ3emzOEWp?=
 =?us-ascii?Q?RhN+Lfbr1d2jxKSkihWTdT2eSzJKljtsHL5jTqOlYxdE2Q34BJyf82vB1smj?=
 =?us-ascii?Q?k7RkncduRBZy3IpUapCCl3iDEWEvNtgoBH1CzPjbYMWmNmfSAE7UDhHqVxkY?=
 =?us-ascii?Q?9XOI6JwONSgNw6AnfLi43Qv6nIlzTnzGeA4P9AEbSXsKV8QvpCsVWY3eMOQR?=
 =?us-ascii?Q?8r2vvfPTfrcDLDipzFwESgW7zh2iDQh9iC5fcX8xCNa1YKG3nzIiSYkrscle?=
 =?us-ascii?Q?PXRij44wzTZy5YSX/M89l+Jm05PKS/w5hrILWAEsA04yUU0tzbaeZUjCYwre?=
 =?us-ascii?Q?qw+DAQuqPjxrQ+rmipzeuzn8LyE1s8whkRZvSRPdCHruiUkxcvoQptLEEX3Z?=
 =?us-ascii?Q?30TA/ZxerPrx2XrS74BPJ4U7B7RnAQ2RebSmt1fKVejC+qNXM+j5PtyMpRkO?=
 =?us-ascii?Q?/rbmnqlXcUhPdW31avWu07ThYZR80wuR377WFGZQ2hatIpjzsbvoZx0SY+Yy?=
 =?us-ascii?Q?FwI8tWg7iGe2WQ32GgkwQRu1DWgo7BJRFu+QEk87I3kMM3OGaz7bNUvCebTf?=
 =?us-ascii?Q?NwqZg5+FjbMuhljSUBIYLeiIZlnw2vVf4gSP4Cy7kUd5AjYwNwo3q2f8kueH?=
 =?us-ascii?Q?wQ7pM48igNpCONFZTaH6tXrA4Nc1euxAr9y82Rup+WQDtB19H//gE5T9Z5o1?=
 =?us-ascii?Q?KmOjiZInj6XS697X5qV2r0NHZkEK4dJygF8bvkhA4adPnikEbrre7pfAPjGS?=
 =?us-ascii?Q?dUHakMdHgowQ+5luD7xFLGd/Ltfjdb+jPTZzl3HuqnP6ore47Vs/7LYk+R6J?=
 =?us-ascii?Q?RaJpv/l2dmiueJRSeZ9Qlv9Oj6DvzCfBdZGKPtVbiQq1YFTgWrKdENT+g+o9?=
 =?us-ascii?Q?wFdkLIXnrrbDbpaP2BkP1jsrhjaEGAdkpWtkuW2xEeRP6W33Fx0/d911FXC4?=
 =?us-ascii?Q?qYhZ3ArAWUoPSLxOgKZSWwTB10eM/q6Lpd+QbXOa6k1J3Z+gTZSEeMTOkAQ3?=
 =?us-ascii?Q?987PowCZF5uLMmME1rV4Hdh873V497QZiBNh28f6bjy3bZmBvgkeK6i7wzgx?=
 =?us-ascii?Q?zcpedKwfmRzzOLCzM3NPrhOJClt6pWYen8hSZB+Atf8tEeSktf2vlPyb/uPe?=
 =?us-ascii?Q?pX93KD5cCDC99OWNc+WKLTlH1u7elq22yfCF+gCKmbqTglawOxkk2rMWVJtP?=
 =?us-ascii?Q?Dvg2ZX7jgU4pKgeEYpPxvGcpqPmxKbf1kvgiD5LHI/gOzv9+JUna4pODoktd?=
 =?us-ascii?Q?joUF00NKR8ggXdTMFxW6v6dI?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <910969BB7EFAA84EB02C3B58A98A458F@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2860a8-633e-4ccf-f450-08dd4cdf5ee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:07:20.9398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10024

From: Aditya Garg <gargaditya08@live.com>

In order to swap only left sided option and command keys a separate table
was in use. This commit makes use of the APPLE_FLAG_DONT_TRANSLATE flag to
remove the need of such separate tables.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index ca462e483..c672ffc97 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -285,14 +285,8 @@ static const struct apple_key_translation apple_iso_ke=
yboard[] =3D {
 static const struct apple_key_translation swapped_option_cmd_keys[] =3D {
 	{ KEY_LEFTALT,	KEY_LEFTMETA },
 	{ KEY_LEFTMETA,	KEY_LEFTALT },
-	{ KEY_RIGHTALT,	KEY_RIGHTMETA },
-	{ KEY_RIGHTMETA, KEY_RIGHTALT },
-	{ }
-};
-
-static const struct apple_key_translation swapped_option_cmd_left_keys[] =
=3D {
-	{ KEY_LEFTALT,	KEY_LEFTMETA },
-	{ KEY_LEFTMETA,	KEY_LEFTALT },
+	{ KEY_RIGHTALT,	KEY_RIGHTMETA, APPLE_FLAG_DONT_TRANSLATE },
+	{ KEY_RIGHTMETA, KEY_RIGHTALT, APPLE_FLAG_DONT_TRANSLATE },
 	{ }
 };
=20
@@ -399,12 +393,9 @@ static int hidinput_apple_event(struct hid_device *hid=
, struct input_dev *input,
 	}
=20
 	if (swap_opt_cmd) {
-		if (swap_opt_cmd =3D=3D 2)
-			trans =3D apple_find_translation(swapped_option_cmd_left_keys, code);
-		else
-			trans =3D apple_find_translation(swapped_option_cmd_keys, code);
+		trans =3D apple_find_translation(swapped_option_cmd_keys, code);
=20
-		if (trans)
+		if (trans && !(swap_opt_cmd =3D=3D 2 && trans->flags & APPLE_FLAG_DONT_T=
RANSLATE))
 			code =3D trans->to;
 	}
=20
--=20
2.43.0



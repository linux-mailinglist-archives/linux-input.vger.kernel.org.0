Return-Path: <linux-input+bounces-10016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D76A5A34919
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 17:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE573188A856
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 16:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E440E1CBEAA;
	Thu, 13 Feb 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="PWxNedJG"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011031.outbound.protection.outlook.com [52.103.67.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E880159596;
	Thu, 13 Feb 2025 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462865; cv=fail; b=bC2R9bbr/eQvl6YjrdnhA3tvY2TJHlOdsfIabmQJLMv+wdrwRI6svmz6baJdxt9RD319s6l6L3ynBXB2FvvNcRSsIU61AfnQuEThzqj2KubIsI28qbD9L4uEz/t20E1p/zSWbKKtwiCDcP8u0YHZQJqRMgcs8AxpnVX/UQ6zINc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462865; c=relaxed/simple;
	bh=UvQ/yw+f8qekbNOh3nQsZdSRqPXrNxZOPSyJ33/2/0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dbp3XU1M1wWhv6PaMoLm14VgXBWp1iN6idVSBSbfufMFTOZB0IsIFCpYGRv2HQgM564tPlQtT4S8cL+3gsw0yKKgilyH5zUI9giMPvt2NWd+bqyQPhVWQZToUbTpz7zNecOHlREzvZhv1/rz8oMJoI3xIhkXOPjV6TxV0Xz3ckE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=PWxNedJG; arc=fail smtp.client-ip=52.103.67.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnytcGEeN6terfo1IBMNfEBFoz7szRny3vEZ85k2SjlUDfAlOdi635lTJzz1h3PFXScAqs5yKQrmlz3m9TZhV5sY6AEB6sAvCK7rUGUtnW4K7Q5RAV/l56Cw4TUBfhHqDgY3Q/bjxruzu6QbvVBz35PiHTgC4kKhQFXLHZSA4zYp1l1UP7YFFmXn3eezqUqszucY0TFZZYI7cIwaxWGNQ/XRnI4Z+5KSMkxQ0NT6justZjYQFAoZr3ARCbNAfNFqOuu+uJhhjKpt2SkPxAoXTHtWIUL/ZcHbNKCq9exL6LJulnkgn2kD0srbahJh2wgZQSe5gevq8X6Vl+NYPZyocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItwaqomeXXfXTD3OCr4OIQlSxlc2adn+czrpV+564ZE=;
 b=s80+0/X2Bv/c5qQ03/5xdep7MehM/MrcoK8hEbTNJgvA0wkmxSTBI6y8l/rtUjNJgBd2848xVWCXzFr5eKmL25MzCMNMEqcKtDZ4ADxJfvDSVAJOimOdssMmAlsPPXq7kZnkXpwAhzV29pwSa5Hi0DzoL7hsUym+M8c7UNv3YL/2DEttgEOyvBfLcUQ/Casm4TM6MfCuKurNW3tRu0pkIm67h2RpHmDERRYxYm6ybQlpUFaJ66BfxO80991g0+E5xjZYYAIwVAj10WStYQtRvZdYn2NfYXPm7ZZBLV8Gpp1WadgTX0tL7VGCn8R6aeBsi5i7M6KzqPetPl0Iegqq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItwaqomeXXfXTD3OCr4OIQlSxlc2adn+czrpV+564ZE=;
 b=PWxNedJGt7SvA3QlxvwDfDPcTdIfK2KO1xOeecvDDgG2hThAX2Q0BJ4IezcKppPD4fMnNZ3SJpgq4H1KJZR3l4O+IsGARJxRx1d2gk2M3M08vO4FoiSuoDNrSY7/DOwHu1MKu+Lm2GN+l/ug3g1EknITY75RAEANVEnJc/uu7N1EdRohCqmkWI0/KoXjlis4Kp1enJYzdGbsNFkL7NqoQe3uAe29GikIUbm5o3orAHSv8dfqbHeS5p6vDFvENdHfYfTlYzAFIsrY1QOmqkyRzk1mvXhTmQIHJrhSK2FHaoaxu/v0LrErjYTPj/gY3Gk/jp2zuGBghfzvok0GJIEuMg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MAZPR01MB5470.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:69::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 16:07:38 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 16:07:38 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Alex Henrie <alexhenrie24@gmail.com>, "jose.exposito89@gmail.com"
	<jose.exposito89@gmail.com>, "bruners@gmail.com" <bruners@gmail.com>,
	"seobrien@chromium.org" <seobrien@chromium.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 3/3] HID: apple: simplify logic for swapping only left
 sided option and command keys
Thread-Topic: [PATCH RESEND 3/3] HID: apple: simplify logic for swapping only
 left sided option and command keys
Thread-Index: AQHbfjFnvaVG20Hv+kCuivlHwYgO7w==
Date: Thu, 13 Feb 2025 16:07:38 +0000
Message-ID: <1C1C6D41-70E7-431A-850D-A5A1C15F88BE@live.com>
References: <FE7D2C98-2BF5-48C2-8183-68EC1085C1EC@live.com>
In-Reply-To: <FE7D2C98-2BF5-48C2-8183-68EC1085C1EC@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MAZPR01MB5470:EE_
x-ms-office365-filtering-correlation-id: 8e978e69-9c4f-4795-a37d-08dd4c4889bd
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|7092599003|461199028|15080799006|8062599003|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zmE0FjsFjD9pglW13wG6c0eDL7TBeZU0MMewDditQ5UrsvDc2+ylhGes5SVG?=
 =?us-ascii?Q?YaGNzPMdyCUryKhmjVMEuZ+uORK60HhBdQEESqsyKInoYbLHBvAZdCA38+eK?=
 =?us-ascii?Q?tJZy+YfsokVm5DcfCuqIV8YKSOKYIQW5hUJKtNbwFWlMHhxnF+bLjv+8WqdC?=
 =?us-ascii?Q?ZoGpUl3/fOWIP3k8xqDmIb61cMdJgtw1v55323Fu4PTMuqIFQqj0eoKGzhbJ?=
 =?us-ascii?Q?tZ6rScQtgDh1DDt37Wxz3UISIlZmDtU0Zd8wubkMnePZmnjelQnW+NpKxIA+?=
 =?us-ascii?Q?9TY7zvG6EcaYF+AK5RW8Z2haZRIhCkhfZirQNqNW3IAR4Q+wpa72PtyP/R+N?=
 =?us-ascii?Q?NGq5PMS2yMBX/ruDolY1P+PVTV3Ie1rmmmq5gByGXIfZZDhE8MVmKjn6zhCl?=
 =?us-ascii?Q?DAEnvfNSkVZAvxrihTuR8LDW3W5NJ25x2QijSlfovCNTl/cjPQ6TRpAQ8zIR?=
 =?us-ascii?Q?EPW3qYf8BEE4XVxkQC+uf0xBE9EUzJ5s6VGgZcopmldFQ4zX/MykBJAj54dE?=
 =?us-ascii?Q?6UvimHsv6sl33ujxG7pV8sSX1wLJMgFaHHx1lnB7foRx9rHJJqrOa2Bo73g+?=
 =?us-ascii?Q?Y/WOYjrxS/5JNUVpuCdTRVh1eiNQkY9Kw62F9Lf7XvhsmnFDmJj0ir2tOj0L?=
 =?us-ascii?Q?41+Dk+101NNSfPTJOhS9V7AEoW5YFouAbndOZt4t68+IPSnPIGH8GbejM6vy?=
 =?us-ascii?Q?CHoy6qpO6HfDr2qEFSlvM8Ir2Sf1ieXCKjA2IHuGF6I04/u3Ma+koxp/0yYx?=
 =?us-ascii?Q?Z4Z0jpNJWsMus+OcfMU96xdgjKmXx0DH/XYhkkUXZqXdIYYOVWKtSKvJ3SJQ?=
 =?us-ascii?Q?sTVAHOJriLRj1WzOF0fXTRNG1VuDxPP1I1F9SHRbDK4DePpq2TFVqUiPZyty?=
 =?us-ascii?Q?AkS+LgEjSS/eK3WVCBGWQRXdSDB67bWx2O/bAwzuRdaZNp8xBvcKs3vPaCLF?=
 =?us-ascii?Q?RBrXiKrirNOP0dfnQdWVIwLndQbswhl9ldGz2Lshsqizzi9GKvtzV/QohuER?=
 =?us-ascii?Q?tpnn4sf2PUB7BF/nTiaGDwbN/2P594wXdjr2RgKGjBnjguZNZ5yAvB3tX4BF?=
 =?us-ascii?Q?SkOaFbYXVDOTTQUxuOJCqX9lifIrnA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rvUN3QvdQ14km9qqeaydY0Sgkq0wx9Kz4tKpEohLsVlZVw0+ghQgjRYY1E0e?=
 =?us-ascii?Q?oULlWUeUpKPrG7tnifuBNkPDiITym+OEfCovMf0vi5B2VmZYucTl23+EK3ee?=
 =?us-ascii?Q?dYGU9simVDy5CMYECUeb3niYeyQmuBuOVHOn82X3/U9mKzwCvyiXjnfidVyJ?=
 =?us-ascii?Q?0B8lEA8h3M3slIaL2sPX2XDiRQGBz0j7mSnF0sSgSAvQx106G5Oe8XNdaLBa?=
 =?us-ascii?Q?Xz62X9ScbZGg60gFsd5lO4N9PorFcU2WpcWdP3wjtnDugqQ4cwcHAQPzy4oA?=
 =?us-ascii?Q?Z0S65Ev1hlOsLVX7H5mM4EhpcFocNTxAifUl1v4CdIdWEY71uMRDwqWQgqOx?=
 =?us-ascii?Q?Pz3BEEbNfGRD+doP1Y9rhCMqNIQR/vcDjI5yqwNJ4gAPexnmI5wZquKeWjDQ?=
 =?us-ascii?Q?0EHCzxLNwCh9Nci4KVtiZFfpkr5bW+7qYcSAAnGT8VqzmK7nP0D26hbRVWZm?=
 =?us-ascii?Q?SM9NIcnswfx1van+oj6VL6KcfPECPhvvjHKdaNVqkbbfc0OeS7aSzOawq3Lh?=
 =?us-ascii?Q?B4mI53PPxODaClpglEu5nmnmzRSh+lOB+vffEzW5vKfnKCCrExYQj1ANvJ2a?=
 =?us-ascii?Q?PKVx2mRMWtiuLFc9VoToqDI/rp7qG9idgKXiJTdFEufnPP9D7OWnliimLvq8?=
 =?us-ascii?Q?F4AYr3CY8Rn9aP/gX/56PyppLdunBRY5+HFYpMTudrzIOY3LGVGdeQQTXmCC?=
 =?us-ascii?Q?hjJlELr25/6OlYOw+eN8C3zzriEemqpN/3QkX2KlMSAwz7JiJCdjLbUbzyRw?=
 =?us-ascii?Q?X1pxOgRIrKieXXWkgV8UpOG7ffXMzbNRIGrcVOaUfsGaGU9oGJ6yCXwGG+XK?=
 =?us-ascii?Q?ORYy4kVpCFONCEFCpPHn8AwaT9pfufcutg79qJOWqeS3DLbf2+F52rCxZ1Wb?=
 =?us-ascii?Q?5cimr4OtHe8QcqTaT+TBvkG2ZyuA2jGXM3/E8Q0IZmyCyF3fhDXvabgZSHqc?=
 =?us-ascii?Q?II+PebahtOizDGSAKBjKENfDV8vyN1MhM50bq7MBQsjbV0zZ5D56032Rygxz?=
 =?us-ascii?Q?MsvMLiRxS3I07yDDyID5SmdVYDzphEtr+cBvupbgOpisKJAZ+lpZ5fafNt+X?=
 =?us-ascii?Q?fN7ynMw1XHtfoUN8R0n0j+HcM2T6yupZHdDrhWrLtG5ZiGKTqbAC7pmRga+k?=
 =?us-ascii?Q?oD+D7mx1mVsuNG6jweHtI47ao06aL8166EWDiXZ/Zb2MVP5Ck2MHITXoGBrX?=
 =?us-ascii?Q?jDUHVVH3XgdwxhCsUsK9QO++QIwIIDxtOXGQ/Ms7ktTH2p5/dTkcS3Nb/uPw?=
 =?us-ascii?Q?094tF3JVB9q+xlNGbd4tOSO3EH0Sw7qLRtU8jyFKSp4XghjQ5AU3eAgUCBK1?=
 =?us-ascii?Q?6y1ufT7JylQQZcquSQfO5CgE?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1104EDCC5939AC408786364A22D55170@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e978e69-9c4f-4795-a37d-08dd4c4889bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 16:07:38.8683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5470

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



Return-Path: <linux-input+bounces-4780-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A991E875
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 21:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867581F255BE
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 19:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED79416F26E;
	Mon,  1 Jul 2024 19:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Cybsfms9"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2064.outbound.protection.outlook.com [40.92.103.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558115DBD6;
	Mon,  1 Jul 2024 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861612; cv=fail; b=ULFodwZZWPChFd46eMHWsiCKi2le0782R9z8MVZY9YmxgB6uPL02He/v3umtfv+QfikHNC3XN5m/vOI73ZjnFiQWJYIkzZ2nlGwpFP88jtX2BKOqJf3IaYF7BcGCyp1zBXQ3GHKZ8Qq6CcgVnAeL4pcl64Uek2ODRxKbvPOC8SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861612; c=relaxed/simple;
	bh=Gx1HdONiuQnoJAJUCq46hz1xzjowdZyqsNfl2wR8HCU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZvN2vYhsOO/elYKuafxwsIrCRMnlaUR29AGQk5YXcGAgcpgJsqpDuf5cmFW3FlSu9enUbNjN7EPUUl5OjI5K5blpeo1qRNIIy+8ceS/B5Ll+TcfJhAij/H/cHUMOCsoDUc4nI1zvK/t1ut9ht7jWraRM2ih2ppujZP+hGC6QkSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Cybsfms9; arc=fail smtp.client-ip=40.92.103.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwCR8BVvY09Wluh3BHoZYTfOa7ZmltwxPjbrbsmxgkpd/IhRi2I/NZGWnpVt0WokIy194TxUelX0C+zQt5WxCJRg3YW+VNAjBabVDrLx5XTsPkNC1FxCJKOFBWSSzP2dvK5YWy2M/hnkbEA0GZN0juR/VdqeWerkoVIQ7idJwgLgyTZKm+v3aLGWkWTSwNU4dryDoVq7ALo+tHc9zTdfswgPa5I5jwarMhuuRlJWsGdkbpNkm5IR8OD4vmPz+xKQhzQs1qIauzu0SNaRkqNnhr/l5UjJraWqntCXKYaCHY/td9Roln3aL6pm1Otz6+ep4T0c9gdcwoHTpwJEDuYFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx1HdONiuQnoJAJUCq46hz1xzjowdZyqsNfl2wR8HCU=;
 b=U3mVi6xYb6OU8ItaU9Hdm1zlM/NOqAQctoaHXDdUCg1/w1xOdRC9lcSVoeOcIvWhlgKnQLZITXzViOkuVknflPnd19okrgl0w7SwZ8b7EBO5ros/QJikODAu9i2g/SYlyhsl9fx3bC0yR/s9DSvfue77+kwcag2ilIToFhYAto8nWoCxkPYyz8HgoqInXRktN6J4zXCAJQLScFVExwe1NzxxE5xvgJS5ll8/xAb70zQQI0NQmDkq0WFxIBMRIN/TZIbrGySILJZEOIic4R24Q6Bj8dhqHLc//YgVsnKU08Yp9WExWkxDVwGbkXhQbhHMoEzpdxMLC2jlNYuPMYI6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx1HdONiuQnoJAJUCq46hz1xzjowdZyqsNfl2wR8HCU=;
 b=Cybsfms90Jv6mBE7kgWor3rAzfkhMaCbli3tgIl1RDMMs86FsMBiYJd6iqysVxoVOWgELbu6QjT0TrBgNV9Zo0N0DkHTsuUVC72Ik0sq4RMj/J/84Hxv2CbsdYUfCGkLZkP3DzZK3fpVgpu1toaATxly+0H6IC5/65tbVrSqYEld24Fij04/vuNj0HFGhfi/isNxTUWQRrzrfDSazSF9a92FzHiWl1Ap9cqXwUfk2ClqBWtEA0e3mbgXSjtQTt1IbHLjtDk2O2QLWu6c25KaxRL7AZamb6bvyt2AKTIh+KNLfR4DDDOr/LLpmMdcB/+aeptKvXRNjNNTpph/P0u1KA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0651.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:157::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.33; Mon, 1 Jul 2024 19:20:04 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 19:20:04 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Pavel Machek <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
	Kerem Karabay <kekrby@gmail.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, =?iso-8859-1?Q?Thomas_Wei=DFschuh?=
	<linux@weissschuh.net>
Subject: [PATCH 1/2] Documentation: leds: standardise keyboard backlight led
 names
Thread-Topic: [PATCH 1/2] Documentation: leds: standardise keyboard backlight
 led names
Thread-Index: AQHay+utkJBjyo+8CEiDLNPducTfHQ==
Date: Mon, 1 Jul 2024 19:20:04 +0000
Message-ID: <6F9E1BB7-5F25-4BE0-AE82-903B9B81109B@live.com>
References: <3055BCC5-8F8B-4472-9E94-1319D1C6DEED@live.com>
In-Reply-To: <3055BCC5-8F8B-4472-9E94-1319D1C6DEED@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [ML52K3w48FwAiGUncbC2RXt/kiKTx43LkeRP6IE65RXqbZrvXjar1TI5eJXOuSswgLmVo/bXz3U=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0651:EE_
x-ms-office365-filtering-correlation-id: 733347e5-e730-4592-a0e2-08dc9a02cfda
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 oEYSt2JbgjZLIJpklHYyfXcdkbbvZ5iLlvJDNogGFQsWFzpLCRjx5pMbcQ2KviivvvWfu56BQKn3I0nAxvsrcH5W+PF7fbvjvH+a1hJdbLVdFenlaQ2AjPTJsb5Oh5vG9y69dgAZMa1Cs+GTo8+tR3ruZqKRew4dFPX+PiUiCL09Jctazl4wcVmFNNRbBR3hlDiQS38OQehhSAKi+wPcQv7Fe5A49QIhP3xw12fNblGxfpeVgSMd/XFLxhF/Yx7nly6BswmM3570cv2RPZwJMJRgSQ5He7ixI3rBfZOHGBqznHuRtjv2IcVgHpDNPncrWzvfkLW7opW9HP6H1OmtwRDfmt55JpWLr82euhOnslcE400zFMZmEF2OvtOQ9Deiodvu6xYE4OmCiXSQYFkVPEKOknSSaaT5LhUpUFCZH284Z58IXtsFNMS4q3ZHRddzjqlAI+RX8erKkvNPCy1562gYNTTiZBncJL0Xp4YB3x09yB3sVMmlEB92v0R1gRB28g8uAXkBSuzG9cdx+2xTc73I4FN2HADk8lteKKm28PjYYKEvoJj9ako5KLOs5beSRB0/B8Sv3E0KZEChhk5dmTiri5GOnKKPhdMe43hVithZrl7WtdzhabrZNfd+nXyY
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XAukk7xQjNn4ubCa37t8WnOHDrvNZLRHAn/ZKhDt7bvnf0j2GC90rl5Ix1?=
 =?iso-8859-1?Q?FXbKvQr2tLyeQbE3g9kQCMczta15LlMsS4sGPtAeIWsdeadAFufAvlg8QC?=
 =?iso-8859-1?Q?cZzoDyLvFnw0gzEpZPQwMc+3jmLoiG08zoZ1aJQVrKF1igwslai5WkzX5D?=
 =?iso-8859-1?Q?al/+6CbgYGV0Pltjd96bJp/KTQaVHzvzXQ6o8DLvIlO6cLq4YJLg+pyDME?=
 =?iso-8859-1?Q?cYEzLpjTtLrkaESe9uduFY0NfQ2I1F97BVULE2w7m51FXUoAtb05ldlt9d?=
 =?iso-8859-1?Q?FvxGjP1Z0mXQYsHL/VGSxPFE1ABAfmr6YuOkEdwuiRDt1/xH3o0gpFKZPb?=
 =?iso-8859-1?Q?Peh9awVvCb71hhho6UwjV861yadWQFFxpQqTGyhYWtl3qBXPv+f/RB8m79?=
 =?iso-8859-1?Q?cnft3EzmonOtKnGkj7lBAfCB+czS5s7ahdptpq0t90SZHqiYqjdNLP34Nh?=
 =?iso-8859-1?Q?UDSpoTvAMDPZDCeVsdl/t/tzFHE/lnPYLLPN/vVd7IMCRtfK2fxtFYjY9S?=
 =?iso-8859-1?Q?Q/qPJ5dEloiyHfLTZD9Kvg7mTDMbLWEtaXejwPKTlPjf4m+tn7w88/GsE2?=
 =?iso-8859-1?Q?CRCy+XPYZ0uwzjJX/mOremR1tx7z7TxC2LEFGch7Hi01ydqtUX59PCUe/q?=
 =?iso-8859-1?Q?2obUgrQyRpIMOtuYPbRXjh/+dGoToXP80Gj4/ZjNJviBAWzllGZCZRhnJ4?=
 =?iso-8859-1?Q?o9pMs43CCWuJGL4mJ7dcO+Eu043fqnJ1wc5cP9tqCXzwbYHHy0HtOTy+UQ?=
 =?iso-8859-1?Q?n0lOXvPNTu+mfRCoBVu5tDnoWweIYxvdIF24dDBXQw50ATaWIw9ABum6Ed?=
 =?iso-8859-1?Q?wcvHd2UvAxVj376B9qwiVZvytxECD2iKmNRRvO3J5kMzgxdEplwqXRENMF?=
 =?iso-8859-1?Q?EHHpL/W7Hj9d0ukiYc+S0o+RqlQXudr9c/E0J+e1rQ4i2Qmro49gwpMfEk?=
 =?iso-8859-1?Q?d09iVTwYIjUMts4wkPOfKIsbtwpI7qNdXLzWiiguKM3u+j/PZAs/VNpwc7?=
 =?iso-8859-1?Q?ts6GI81Qq9ic5ZkSXDXt+PxbLIqSetn8TJV8Eky5bQU+kTq0O2LcdDxvxz?=
 =?iso-8859-1?Q?wwAFslY/HvwF1RkY+1oxdL0JFtu+se+ZnbWsjKJq/UZh21ni8bFlTNJv2X?=
 =?iso-8859-1?Q?1ZM9U6woXCvGNDLj7HD8XVmLWgdXQ84Q8RAyhAze/SPRR0hCjOX4XORDXV?=
 =?iso-8859-1?Q?Zhsbm3jX2mCqpbkDm+7l48jaNkMXE5ERGzmm3MH1i3ozzH8MZ3cSEq2E/3?=
 =?iso-8859-1?Q?B/nLFkrXHqXBeQGytEi3Us3JmtUGBFmfIz1oveG/QXo5LzulsVrmGTmxZs?=
 =?iso-8859-1?Q?Gk1JgIooSYUZT/kEbE3KQGkyTwRnH3PgtmTJBGsUfrt+s+LrMWF71hXUNM?=
 =?iso-8859-1?Q?kLU35HlYsf?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <26C120190C045C429D8101BAA7E2B394@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 733347e5-e730-4592-a0e2-08dc9a02cfda
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 19:20:04.7096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0651

From: Orlando Chamberlain <orlandoch.dev@gmail.com>

Advice use of either "input*:*:kbd_backlight" or ":*:kbd_backlight". We
don't want people using vendor or product name (e.g. "smc", "apple",
"asus") as this information is available from sysfs anyway, and it made the
folder names inconsistent.

Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 Documentation/leds/well-known-leds.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/we=
ll-known-leds.txt
index 2160382c86be..4e5429fce4d8 100644
--- a/Documentation/leds/well-known-leds.txt
+++ b/Documentation/leds/well-known-leds.txt
@@ -44,6 +44,14 @@ Legacy: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)
=20
 Frontlight/backlight of main keyboard.
=20
+Good: ":*:kbd_backlight"
+Good: "input*:*:kbd_backlight"
+Legacy: "*:*:kbd_backlight"
+
+Many drivers have the vendor or product name as the first field of the led=
 name,
+this makes names inconsistent and is redundant as that information is alre=
ady in
+sysfs.
+
 Legacy: "button-backlight" (Motorola Droid 4)
=20
 Some phones have touch buttons below screen; it is different from main
--=20
2.39.1



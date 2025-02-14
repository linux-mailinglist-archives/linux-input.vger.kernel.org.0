Return-Path: <linux-input+bounces-10040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA37A35B39
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 11:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80D43AAA59
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 10:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA032505C2;
	Fri, 14 Feb 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="OMN/si9G"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011029.outbound.protection.outlook.com [52.103.68.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0BA2580EC;
	Fri, 14 Feb 2025 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527716; cv=fail; b=X3uHkr3Mdtzsg6tRPqKraFjinA49lGewYdamvvHowNS3Jdw8ZfhO08+ujMTdArJ7YFGDywctlkrpFULGBTH/DoCcxX+qthABXfUkq0d2gExKTJY0ZpbvyuTCnO+waj7oK0JinDsKFGZNbIpGe2+MZ7bxFFz2/aEc40PoRq7D/Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527716; c=relaxed/simple;
	bh=ofGPAB7IIijTJPJxDujjEVYNtjkO8Zs/Oq5+1TgQb8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nfEJQvNb02GCu8hzN46TfzP+6lunKykPqixOXv/bVDM62lJ0NVV0n0LUmzvXJIs3RT6JW3rrJQkoZchzVX0GLdNVJhgpnALksaHhxHiI9leOsh+EJczV9Bq4CgWfINVn8UITXvP3I8vscLPkxCdOm5U44ioNFuEAR+RlpoAHvPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=OMN/si9G; arc=fail smtp.client-ip=52.103.68.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfqrGNaLraDx97ep6Z+BKXV3+0hztxwrM8tXDriLu4hSNygkMES10Cg3rwEcRT9HA5IKC8YMfCtc9dFDcBa3qPDElXkMjQPtcOaitxxBB/HVkqcMdiVlbJqumizeJJtfXT/rSBJOxiE10FHLy6aCb2X/Ieb/K4vmpaKOO8LMhHjSzrQ1P81snveiGSSZ0SD3ya60rXU7E8solEtxvYX+F/o1wxzbbWQ3oPwEjk3xRNeIAWJ0GF1E0YeEm1rc95aUU2DpmKmIRWeeAYGxMWur4AD5MBtgfZ4fD7o2qisA2Bf/O3kj2dPH1tkIyidBDdMKTvPUdp4cxCXjy6VyjYMhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiIWcqTaT41gSdJ7meArh5mGZu5+NUROWJRm1ZONzUc=;
 b=QyqgEJnLdwlcbx+aZOc9W1nco/tHjrpmKsqP/CYm0Myl0e1VHowyCJEfAYwI4bPB//GKJVirz7GZATb4W98zGgiXV6J+shdJ0zFStp6x6bHrFwCiTlSqq0F0FJHo20Q9PIGMLwThPprx+ThvM7yX/unSKxJeRtjIHVtLU2oVh0RpH3CxClyD52MZqe6iuJnIDFB3Dzmao4ZKxrrHJoumDO28m9uZxe/IeRqoiDpEx40Hi0JbD1+E8JMXE8zjrspq886oX4wJugzQzwrEVnkGL/nka6U1s/knuEu7MEDl+PfSkn/A7VaYWICCqIYFnPmQ5eYlYoVZkfdEf22uh3wdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiIWcqTaT41gSdJ7meArh5mGZu5+NUROWJRm1ZONzUc=;
 b=OMN/si9GGpUrtOtLRwr5yxyGymVhZifdkwlHcx+50AXOD7Lsa8U4kfYZI0X5XuBNJ4fjolfxL4lone8lKYYTcdyyRaOSbC2R4MTHdOj0yjq9dFzBak97ts8gukGA9W86lybACYWB9D+lHDp9BuKhDgEUvrGsyrIin7AyVN7bI5Q51Zz4LiB8U2DQadZtIAnvkq3t2kEnRvhdeSFuTudiwOGTUGUpgqSyxK+EA1KQ/QBLweXvIcFVoolLyh0RrkRwcvlSAS+770OUiDS/cpPQsn1HJ0N9mqZWLV+pJszhwg6c/Kh5va1KFIDiBUbAZ1mqegFng9Kbep/cJJ3N6Hb2kg==
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:107::8)
 by PN2PR01MB9082.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 10:08:28 +0000
Received: from PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866]) by PN3PR01MB9615.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8bdf:4c57:be81:7866%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 10:08:28 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Alex Henrie <alexhenrie24@gmail.com>, "jose.exposito89@gmail.com"
	<jose.exposito89@gmail.com>, "bruners@gmail.com" <bruners@gmail.com>,
	"seobrien@chromium.org" <seobrien@chromium.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 4/4] HID: apple: use switch case to assign devices to their
 respective fn mapping
Thread-Topic: [PATCH v2 4/4] HID: apple: use switch case to assign devices to
 their respective fn mapping
Thread-Index: AQHbfshkmgz2/YnzI0WPBj39Y8IbiA==
Date: Fri, 14 Feb 2025 10:08:28 +0000
Message-ID: <7747D0EE-DA32-4B6A-AB63-DB30C5E856BE@live.com>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
In-Reply-To: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9615:EE_|PN2PR01MB9082:EE_
x-ms-office365-filtering-correlation-id: a3f4acf7-f79a-49d5-d4c7-08dd4cdf8725
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|15080799006|19110799003|461199028|8062599003|8060799006|3412199025|440099028|19061999003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QWC3QER91p2neh3QG78zJWrGr69xT+rvA0Uz6QkQJH0v84mbOdB95NdPR3Hn?=
 =?us-ascii?Q?wb+3ggVC6gNeH9f7K2yNcRf/cKgU/ZlyBnPIOICoGrjPcf9X/ebaeSFlrhCN?=
 =?us-ascii?Q?oX8L9M877uNimTzmOnTDoXcyW93OWoMcPRr3XJPTxMfmQMfj6af7QYNFfAuO?=
 =?us-ascii?Q?mNlb8Dh5tlmI8bfivOB4xUk8p0BszAPcngo39bGS/e753Y2Gw1p+2UXVFp4i?=
 =?us-ascii?Q?7o1f+ddlJDhctfFVQmfhV0/RGbwOMa3FDJroSgnkRvbcTf/8zOWvHQ2vZaKB?=
 =?us-ascii?Q?ZsMJtzbiLdOwnju/8igJWN9oJEoWc8TZkROGHbmCT4kOA5AoK8HctzOw8Ivz?=
 =?us-ascii?Q?N5FeF1B0mt0N1buiyVS+qDnjT71q79e7MWWREtMHuJM1UqfLbRGcKurnJfnq?=
 =?us-ascii?Q?QxNoVSY/47orj0gJhenQkdmMBkjWJV3OKu5QYQSVng9OE1lVqkMdJ2r1dftT?=
 =?us-ascii?Q?oGODWUuH9x2ih0gx6EgykERB3hlahYPTaGz0zWUl39I/1VUSXYvruxPTKMXy?=
 =?us-ascii?Q?ZcbCjuoSVcNS3l5WSFcnUFl0yYy7lLABtXDYwEz69GHKN1/jT/ybLGfVhJFz?=
 =?us-ascii?Q?oysMGVERVi8xMm/w6mTxPoVjvr+SCT9yL5tUR3UZuZpZvTnb5YYLNzBhQmpK?=
 =?us-ascii?Q?V3yRICmrQFN5+Mt+S4lseXKhr6DVyh4sU1sBKTrN+RVy+/zn1Sv2XJR1p3gd?=
 =?us-ascii?Q?7Zb8gmGfRt1wKPcavx1o0sAvIp8C38L8HScbdWoSUvXBb83TALVBgIDRJTTr?=
 =?us-ascii?Q?XyjnbibWiUkw92zIQKU6m7VJ9oElJlxwWm8JqjW31YzOuHlOjfot6VH1zmlN?=
 =?us-ascii?Q?39O6uTGrwv8sgTb2Ur0mAS1y5cnXgE6zNaaPxV6itBUQv6vsw9vVIwoowiV2?=
 =?us-ascii?Q?B2DZ4hSUhMvu9Lc9b/H6Fe3buLhkkSnWZkK2DBP44LxjQn3ItWh6W/TvtTdn?=
 =?us-ascii?Q?AgGfms/vU24QUS7WLh5+sh2T8UkEudIJbI07gwfUCcExfHtbZW116qHlMPxj?=
 =?us-ascii?Q?+Pz8kC8m2gVYDmyN/zYYLWpyIrZb/mDIzhTkgPgC/EUJUQ1m4A3uzK1466i+?=
 =?us-ascii?Q?NC5KWEjipL9hxxBJE7Q9H1etLYAdXBPzxLrbWrDw8uvZxOoAe20=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1s6ViQHwA+FLRpPm1nerAcxcq++QhjNQG+zoCUh+hNUJFKR3W+WxDpsRh1kb?=
 =?us-ascii?Q?hn08RLTa9/klC420jj5vFW/Wxee76qnDjhwAnTNdPrRMC+SoWFkEcIbhr2Zp?=
 =?us-ascii?Q?PDrVet6dvr4p6E1zhMSpu114mP46UmEKF9s5DLBO7bgpSxHUPPmPboFWW0zL?=
 =?us-ascii?Q?eF+Dst3d53ddv0fvEiu+VLDwL0WzZ9dk6E89MbkZFZxM+j+WWKXL8O3lQCd3?=
 =?us-ascii?Q?bjvOf6YACBijWge5v5X1Q4vkWXKHbuBkXQUJt2i/y9qyzygFy8XrUr4dBtcX?=
 =?us-ascii?Q?phY9Uz1q0OCGjmjBM62vEe6Q4bjXjP6Fk4aUJN03u+z4fOU5tZISQ7OhCUij?=
 =?us-ascii?Q?hUBnqc3J88rcaOmqWup/+wh6/iHvxBsS6f25LgMw/C8gH90GA6vy5pVt7n1Q?=
 =?us-ascii?Q?tlwZTJgY1xC6zp/Q4XvHntuR33TVYPssfklWCNKPytPpyNWN9M3xY0qtutHt?=
 =?us-ascii?Q?wF8F3kecGCx8EOR9Y0uLyUOqzajHAIKZgYxm08BY+8G5K5M+tILjVh7o7yh9?=
 =?us-ascii?Q?hi9ij3KiP12f5Ck0Hz2xAVC/OZiSAJaWK9JrDEpO30D5BhBps67CxMSU8Gm0?=
 =?us-ascii?Q?ALjiYm3jLJfKuER6hqw6SXHrBktCMWrZ53o8KzzIo/5aajKocVzPNXU6xKAL?=
 =?us-ascii?Q?kWzNtFQhZSJW39zMfrW4oWmvW3FAx0ke9YwP89x2KQkgQ0CZmiPteMl3696M?=
 =?us-ascii?Q?x2vMoSIOijavdtP2OREmGAMeW6tZ2VgMYqxBUhMrcU7UIztUSEqn8k1vg7yu?=
 =?us-ascii?Q?nI16dHR2299fMPWWg7NpPv6S8K/3Rv1A1qezDrlbyGbSzbl/6CZHIZ5JHdqC?=
 =?us-ascii?Q?giv132gEBQ6i0KJsbtjc+p1shJ1lxY/Gy0fx6RLoljmiKfDVn3Lpv4EsPMpf?=
 =?us-ascii?Q?7YosEll7ciVHlYr6F5PmZm65inzNQgSHcOWgXdzFzTYagHQZ5X8dX/+LPyoV?=
 =?us-ascii?Q?7oXIs+GjjVAa7S8FvAIr2y/US4hQNPi7ApGQC7fXP3aNnMr1GaJXoz6BO5bQ?=
 =?us-ascii?Q?ZsA0w6f+V5YyjNvi3WFQxf553cjtDIDZhBDOog9OiN2Su9yAvGxxOcXWXdRI?=
 =?us-ascii?Q?bfwBTcFImIM+80jT9epl3hIRuL8KH/gCa3I1NBic3SMQRAmiUL6qMd+R718q?=
 =?us-ascii?Q?e/II6V9Y2jNFsI3Syz4s3/hbnQGx60O8EDEtCvCE2wBA9jNrM/xKJHnph2pi?=
 =?us-ascii?Q?l8kRy+5Tq3cA/QH7vELkLa2KHGBlQFvz+vC5eQm2A/tAlw623sKmM/fW8zjx?=
 =?us-ascii?Q?VocSNfQsSM18g+nnFiD+CVzLhuhMBO/nckjhMYZR02YzC7W9IAu4gPztBl5v?=
 =?us-ascii?Q?BIjk1R44fvppfvMiWnUmaa90?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <560F1231F7FCE3468F39B607ED597D4C@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f4acf7-f79a-49d5-d4c7-08dd4cdf8725
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:08:28.5242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9082

From: Aditya Garg <gargaditya08@live.com>

There has been a continuous increase in the number of devices requiring
hid-apple driver during the last few years. Moreover, unlike previous
releases, the PIDs of the newer devices released cannot be combined in a
specific range, thus filling up the if else if statements with individual
device IDs. For such large table, its now more suitable to use switch case
instead of if else if for improved readability.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 75 +++++++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index c672ffc97..4e8b01793 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -410,42 +410,53 @@ static int hidinput_apple_event(struct hid_device *hi=
d, struct input_dev *input,
 		asc->fn_on =3D !!value;
=20
 	if (real_fnmode) {
-		if (hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
+		switch (hid->product) {
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS:
 			table =3D magic_keyboard_alu_and_2015_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
-			table =3D magic_keyboard_alu_and_2015_fn_keys, dont_translate_flagged_k=
ey =3D true;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_202=
1 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
+			table =3D magic_keyboard_alu_and_2015_fn_keys;
+			dont_translate_flagged_key =3D true;
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 			table =3D magic_keyboard_2021_and_2024_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
 			table =3D macbookpro_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-			table =3D macbookpro_fn_keys, dont_translate_flagged_key =3D true;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-			table =3D apple_fn_keys;
-		else if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
-				hid->product <=3D USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
-			table =3D macbookair_fn_keys;
-		else if (hid->product < 0x21d || hid->product >=3D 0x300)
-			table =3D powerbook_fn_keys;
-		else
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
+			table =3D macbookpro_fn_keys;
+			dont_translate_flagged_key =3D true;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
 			table =3D apple_fn_keys;
+			break;
+		default:
+			if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+			    hid->product <=3D USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
+				table =3D macbookair_fn_keys;
+			else if (hid->product < 0x21d || hid->product >=3D 0x300)
+				table =3D powerbook_fn_keys;
+			else
+				table =3D apple_fn_keys;
+		}
=20
 		trans =3D apple_find_translation(table, code);
=20
--=20
2.43.0



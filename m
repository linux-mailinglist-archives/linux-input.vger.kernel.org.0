Return-Path: <linux-input+bounces-10679-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9BA58F31
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B808B7A5FA7
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 09:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B29224AFA;
	Mon, 10 Mar 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="udF0NfEv"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234692248BE;
	Mon, 10 Mar 2025 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598037; cv=fail; b=mzLezebv89qxxhNRzBOuOGOBtRmBfOcfhXkjBYFsmu3c9ispluKTpMEeD4HKJhaAHCW/0a/+KSNA1LV1a0bvefyULh1QGuCRjR8vAcYE4v3ASgacAwDytMntxdNS1Jw2CbOQNS9Peh/RrHiL5yltAoOnakvcvo+k3FqmPJGnNMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598037; c=relaxed/simple;
	bh=ua7UqOGbXfUtWDjG5OtQcf/vLDUxWuiF4ryfyYw8a+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q/ZjhOBdTsrChVdzRMbzToCZThsEJ12V0egpxlKAiVRr9ltGZ3WFjiwjc0Qm9ct3keV/qATRY6pXGxnU33uUU7hxGbF6Nr9zzTDg8rI5SiWW8Y2T2EGQOhl0stzzK8NNAnVNmL9uaQjKYyRIWpe4OVol8wWqwWHLz0Bgc/FTmTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=udF0NfEv; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QD/4uiJFogSAKcKWtJsuNg4XRO584U/N3YXabhaXsyH1LAU4P4TTGxNGEBV7K3K6mvdTSj3eZ4rWAZyUb3eN2mpDsYhCby3T8J/PGUlMHVCediyO+y1cRuOiD5y8efCloRK7i0zVGnZzjiL9+ppagavX3KZqfOQUHnp7A+5G/oqduyN6dFjZVTwl3/R+eA6tS04MV1sWJ0isk2RlMCAdN4k92kKjM0bAbu0eRCk/CFD8gCg+fqFOSvwba5tyTg8nd1anRClof+ZZUz3PQCOnnPfL/EUX+aJiyGK4tdFzATVVYg8/IJHa6gZxrE+G0hz3NrJ1NgF/i6M7YGVQLBkdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/04ZaODBq15k3NKBD3BcMjYaW2C7mTU+vyha+u7ypE8=;
 b=wSB6CWaELiRDGIfuWsMp0CCmug0gBKeTZhv1/aVHFYAnJeGXY2MDEogAxnCbU8V7ncdv6w7bkROn/flIpBcjAgkibP0aqaj+63rRueXdxgIOP8ECeZTeoaVMnDNo6h2QeQjErKF3TchZ4XK7eMXhoOuYQo1n8ougX3oCfcvag1Ro9yx0rAeadbAIDxcocyGkEmKIXgJrVsD9AqDwdAcBDG9HJ1WHh4l2lheADwb6mP7tZhG0OiGFTA3YgHedVrvaLXqCNL1c1BlaM/n4wwrL3e6D1/fYLwBvDJiklCBwaqeIw5koGzfLep1+eE9EgvndxPx7wgQ23mfr6+lOM35Sfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/04ZaODBq15k3NKBD3BcMjYaW2C7mTU+vyha+u7ypE8=;
 b=udF0NfEv6GM4RNjpyD2HrDRhUjO4QVEY8xfto0TCUxZRQfGu7Y5cdpJTMjLMnmuTiz42/rRSYcbxlZT5daG95tRJXTAFKOdnxqzF83ggpBRBqGVbbWvR0fKGpCe76B2+w2e3gCPEBgzBDYjONyj0+O3rILEXJoYrgv+2rmf4mbxAS4VUb3emahfiwcK1eNi7pDU99FTwbltq+K/z0kwg5T8fmIjv9HBgklG9s/1cDuKmIqSCUVpbSZe/ypHihso7T1yWTgZdyff99zATrju7mXeoO7JebDZohT0gDsV77bEc6eF60C/3oXtYPXElIa21b6GmTyWkhmN4W7iBgAFL9A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAYPR01MB10587.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:13:51 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:13:51 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND 4/5] HID: multitouch: specify that Apple Touch Bar is
 direct
Thread-Topic: [PATCH RESEND 4/5] HID: multitouch: specify that Apple Touch Bar
 is direct
Thread-Index: AQHbkZy9rKvCUya3yk2OcQDLXpf2Yg==
Date: Mon, 10 Mar 2025 09:13:51 +0000
Message-ID: <89CE1782-36FD-4CE7-8BB6-F46D983DA00C@live.com>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
In-Reply-To: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAYPR01MB10587:EE_
x-ms-office365-filtering-correlation-id: 3b707b65-d165-45ea-588e-08dd5fb3dfa0
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|19110799003|8060799006|8062599003|7092599003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?loaxlwgObdQsMEE5vUWt45XOomQspAXrmvZCAjYysxfgoY0SbNFnCf3RSwGP?=
 =?us-ascii?Q?Ff9JHEi8sh9zTKMgC9Uy9SuGNxmxavyIPJ1kU3nQtm2wzB2XADqJkDZDI3tu?=
 =?us-ascii?Q?rGpZQkW1FOOTOgcYtHewqxfmJMkNSVjO6OpPzbzs22yvoaKNT1hbadOX57Wr?=
 =?us-ascii?Q?R5A6C/Gg9UDDrYomZ0YZN1QQDgk5jMrHPNj9+6YbHdvN7ZHlltF+XMy2t3bG?=
 =?us-ascii?Q?oacDrtodU3BUKeNZQG0wivADoZVp2TiwP+dAyLgl5JbvrCyaXDIJmY/nF24Z?=
 =?us-ascii?Q?LKn5JR5wEx5S9qN3WWsY7N4WJ6TnX5QEuTvtLH8qPaFn1iJPFIoW7ijmXrUk?=
 =?us-ascii?Q?2+c8s6f9EDVdx25ssye1Ysht4RLagLpO5iSKdApSvduhbDbKfd/U0FGcjEth?=
 =?us-ascii?Q?oRjDnVlPGmEy34r37o36FS+1QAHXg5dbH8vGfxYdmcTORayHecLe60x1bjjE?=
 =?us-ascii?Q?ySbOUuCRzlEFsclDqhR7XrFR6KO/Y9l+Ms9sZtSl3tgbWydxroc6KHPB3u+v?=
 =?us-ascii?Q?YZbgtN2GCDJ5Q/MJ7Q2h+RMerMG48j9i8NuA2AC6poYIQQ/P8JDh17JA0WlD?=
 =?us-ascii?Q?Smr+Eer+o3xuy4XZtgvpIeW3p2Pda8O/UErvqrPOSAGwryjVFMTR9Rq6Npbm?=
 =?us-ascii?Q?JSRmhWQwdPnkldan+EcVLV94P27hc9k9yz3QC7d1kQExaIwr8jHpbC+Qyni2?=
 =?us-ascii?Q?j3oWfq+NP5T4sJ7qBDgc7BoI3l7S624Ub8yggrGG/b8K7P28BAnQQzV+hcQQ?=
 =?us-ascii?Q?rxNPBH395xCxZLgT5Ct+DrNEioPQf9dRh4WdCdYqJY7YhDlTYKxyJKpdqNae?=
 =?us-ascii?Q?JUUCxNI642O8y42NGIvhFLjv3X6IG7dA/smqHfzCMdmgO9v9ioJYUvpHH6by?=
 =?us-ascii?Q?ohc8KLLwxo5mHymoR5PEtqIaoMAgUKuWSlkpKoHD+6TyIW7ugOTftIMfkW6I?=
 =?us-ascii?Q?OXBcCRePti0Ou7BmbC3LneGGlcBz8ug9RHiu+fDFfJ/EtDP8usCXP6QFxWWv?=
 =?us-ascii?Q?cYIfIJdBa2M7JKIcvSO6IOJFd6WsLrfARH4a2o3g2yeZuRgvob5yRUXWWyri?=
 =?us-ascii?Q?3WUra+q0x2JBk9Ev6HW64j0dK6KmQg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g+JoKjAEwUnI410BS6qYUcnMlKaGNbhkZlLcEh0PZx8vcU5CRTnEm83hzpUs?=
 =?us-ascii?Q?CJ82eD4l3NrbNjMhKXHV0mP/yZ95RJgHk5IXJppcRslmA/ockdFLXFyDHArA?=
 =?us-ascii?Q?x0EUVgbCLHdMRVGplwiQH5Ru7fX4IFRyx8nerrhd8oKokdVSHc48MpVpu44A?=
 =?us-ascii?Q?fwdeyJkuqQRjnS88QXTa1BctFp+PqbMGUH2SOjjgjbosYaXTodaOfeEzSMhW?=
 =?us-ascii?Q?7DoOy+PnZv/sA+lW5y/sp75kUMDmpcQVeMoKjzF0jQE/3sk69i7dsA2ij4C0?=
 =?us-ascii?Q?TeHhvEdvf1SDvUnBadLB8Cb77AsqVKaZpSQqPwrT+oZsv9YYu+V3d/IczUAJ?=
 =?us-ascii?Q?B95ujEn8MlpWIGq2POzQ8vnVKW/QEWxmgeU1qjHqVQcIVmtsVNcVc6/wVydi?=
 =?us-ascii?Q?ve2r1nC57S1Oiar7cOBKDq0IBPbrE+XIC0UUUJ6W+MmzE0/VS9FKeDczpbe6?=
 =?us-ascii?Q?FZkv+zHSzfMc5vw8Vo5mNvpnZ9m2sN7wfk52jP2RPea6HKPNbsiXOwB2Vowe?=
 =?us-ascii?Q?v2opa1HpNm/lsFzo8IIBXS0BG3XxNWzg10iwVJPE85C5sZk7fDHMKBPS/xmU?=
 =?us-ascii?Q?dGO0Ra7Fbu7SZhudYyCJWx+X68LmkaHlJ439hSZgXvnxBcvv0Jbe8ImlL0Fu?=
 =?us-ascii?Q?7yh4Ygk/ezZroa5GgI1bxf6hblY4TR4eKzWKhz8SAXSMC/Aq1wMlh0+iXy38?=
 =?us-ascii?Q?Vxv9/2eCVFtBDTIDNTrtxBevdqgiqPuzJ2xCFjPnfHwpNI36PBoZqbA8yL52?=
 =?us-ascii?Q?Ycl9ZGbVHMPvOdFcWPmNwqe4Yu+LsVuZavi9RXCJXiOA8fWU0DZikHodzYpx?=
 =?us-ascii?Q?3rOgSLw5PzLP9+rbQFSbi3GkrFCYT/ZWR10DY/lzLcTA4NPdrd6AxTLUUaa8?=
 =?us-ascii?Q?lrZRiWd/RrTNYxlaQPWewMc7qTrbXIGtnvRGOK3LkebudvPv5ez2YQoTpzMg?=
 =?us-ascii?Q?cJQ2BwHhhq1Q56/Mc29+H1uM8bUcH5UYqg6c5T598KNQ/WlF8fff1cVFL16C?=
 =?us-ascii?Q?88OkZyhNjI1yuw/6wCYyd2Ha8Fh4pPkGA5R5hvGOcCExaDExxGQiyatHeTjc?=
 =?us-ascii?Q?a4KoW1V60rTwu3XPgwXuFzSFUA7B3MqPmvKpUiPnv+HFbVXRjyOIoaqrDR3x?=
 =?us-ascii?Q?4VZIHEnVPp0V2ss2bwpF5DC8OTIYIEyWjUFbO9AGNvolDcaPL/giBbNEOb3k?=
 =?us-ascii?Q?rsX72Z2cNiGr5oIv2HxhOPoIB3fE49rYf3ghzy3UhWtW9J/DU07UnYX1hM4h?=
 =?us-ascii?Q?+3qIueeYwvqm3PGs0GNV?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82B69BD6BA976046B24B38A11579120E@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b707b65-d165-45ea-588e-08dd5fb3dfa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 09:13:51.1893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10587

From: Kerem Karabay <kekrby@gmail.com>

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bar, where
the application is HID_DG_TOUCHPAD even though this device is direct,
so add a quirk for the same.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index f7fe6aab8..66e33a482 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1349,6 +1349,13 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
=20
+	/*
+	 * The application for Apple Touch Bars is HID_DG_TOUCHPAD,
+	 * but these devices are direct.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR)
+		app->mt_flags |=3D INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |=3D INPUT_MT_POINTER;
=20
--=20
2.43.0



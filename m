Return-Path: <linux-input+bounces-10415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE24A486B7
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 18:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD683B607A
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 17:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E831C1DDC0B;
	Thu, 27 Feb 2025 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ULVmgoiA"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC181DE3B3;
	Thu, 27 Feb 2025 17:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677677; cv=fail; b=qfB1B8kqKCiuzilwHtzN4FXp0vJITUT90IZT+nQVyXvdPKx9bMAPAlESPtg5GcE+BU5r0JQMDYo9JHf85pAhEQlvmxgMHM2acEuS2jYqu1YDEfH7rKgVDvPQvjtRcDEIMy/pEp2KGZkJQ5ox8dfMK7WxMwc4jfj75cuxi8VEfJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677677; c=relaxed/simple;
	bh=Hd6y0t7ybwlnGFKggZ0+d1s87oGPE1rRMDOzDiMCMXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KFPAZLiDxkp1kdCk7wzokzRGZ4YSb+uyvDRwMai3yLxZ6I3pMaFgQZUuKqV80Hk93vphrU5BURAReN8x+zxEb8n5bIicEURKxifU5HnrTJToBcnQCbOMZTGwRtptngnvO85f0lyz19aXVq2YTj6AH9gOrr36VTegLYObEja5WOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ULVmgoiA; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzK4zx0Mfi0S1gjwIE5Sd3qZEz2hB338rSyd0sVtl6Co9HQrFwzgiR6xO7h5n+Z36J6v96PKuxQt9/td+7+Bxdl/0x8+MqeOYebt0jSnnQzn3qYzniX+SuXfawAdfYwoax7tfc+b6chODB4qb3FD2cD/oCUaam40E5X9VsykPR+CWVNJ5hpbVStiN3QvJw02USXF5mce5jyr/66lxmSo55F0QSjQzGyAZrJlsu/328pAuF66NwoiNh0e13gHcJoUZSjlx0549YP7Jo82NVIfrbSxMknR2un9379iTW9cuZXhrShoX4FlJQpMR7mT67uI3/7mqYHAIXJmRfakmSa1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74JDL78FFxPmkNw5CBr/tGtgziCBGn5Q7VmZhATL5CM=;
 b=okk2NsIrk/QUmXLgiECxN0boHn4Z8TZ3UuYzbhcrgjsyUUavqbk84G1gtGw3ZHFGHTyIqwJJmLSXozLGOhQbNkGRVIuDioo6UOQVGsLKRAbQfSG/3PA9MHAgUNl4XyZlVG79F1MyWe7hsiL6SpDaLOqnFoU/BeI0KzG1h/56ziEQMKeq0ym5jO+tlxbuvwkeLwNAOofOHSzWrMrdwomznd64CEluY3vUHM08F8Ndhpr7x4gnHq9SMCuM2s4ZGSFjJD/W5ky92qMvfyBDV5o3dI1Wc7CdLtxmym/14UmPOegpEK2aZbmTuJ7o1NbLf7VOcoo8qKrf7q31FUzlXP4OJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74JDL78FFxPmkNw5CBr/tGtgziCBGn5Q7VmZhATL5CM=;
 b=ULVmgoiA67fbR9V7KTLLboz98pBzP15C4ZwiE35QxeDvz3RSYaNJRQ5y4BCOcc08fpC0sH9vktfWc+Z4vFaYhu/uP0t7qHrN5lZrRqwsazUXRvTZZqKyjnjoypkRbYvKZjYY5JmcfXR7s54KY661bvbeNKJNTJsOPerjq8kZioReY9IHyWMVs6BLzL/DbN+AD1QE9UJD2Zme21Y63P7Hk+02GvV7wkULsK87TV6HpXcTP2hYKZYR37iNezUfYZvKG+QMr2KbeEJDZgAq0uzfYtbli8KTIpa//oWwd1cP4IyER7pLogrPBrWpyJVft1x/bc2QhCLWDbwr/d9asNsRsQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7281.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 17:34:30 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 17:34:30 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH 2/5] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields in Apple Touch Bar
Thread-Topic: [PATCH 2/5] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields in Apple Touch Bar
Thread-Index: AQHbiT3biblVR9v5zkmS907Hu3YaPg==
Date: Thu, 27 Feb 2025 17:34:30 +0000
Message-ID: <B3DDEB3B-1CB0-4291-97F5-A97024D683B9@live.com>
References: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
In-Reply-To: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7281:EE_
x-ms-office365-filtering-correlation-id: 27da2aa2-2094-47ed-5065-08dd5754fdc0
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|7092599003|8062599003|19110799003|8060799006|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NK6uvqJML3+y4LcIcV1M+C20iSWWgPwzZ5wHEuQUeHqITH8WnJQ5Jbswq7uD?=
 =?us-ascii?Q?sTXQFwzhryhpthOu/D4BJWq3UqXNp2/XCg69StFzzdKEDxESDyuTsWxnCqHQ?=
 =?us-ascii?Q?r1vUWqM6fTqzHNA4dn4tEleI15UWiTqMSVk5WzwVhCyk5CMk0rUHXwCzL+X0?=
 =?us-ascii?Q?70+8/gAf1idWy4ZRENtYlMrb9dGyclgUJXtmnVkh4BQTQbcMoTUSJc/3angH?=
 =?us-ascii?Q?pPfsx33q1LN/Hc9v7daO2YcfA0Qp1jbbqujpeve/BC7D4hKkcbOjeXOImSie?=
 =?us-ascii?Q?SeesDHfvxRu7V5tEdT/XaVh/Iv8F/OuDk4JnIodmjCEWhvWIrW2Z5KQtQiIu?=
 =?us-ascii?Q?sPGuqA77ChIqBorwFPbN6LlWv3lILcG/C4CSkH4EuYyIwpg2yTJjACXfZ2FA?=
 =?us-ascii?Q?LClbaGX5kaStBhKEonuxwS4CGqfczCZvvuo6d11kI1qysIqUmDOFV6/BfFGk?=
 =?us-ascii?Q?NCfjHeoLw4JOe3+ZwL8DFDkZpIK0juM7pGL2nb7eAeR2lo/jU+rtXA6xnXx8?=
 =?us-ascii?Q?Qnhj9maJZvp3ZZMFxqsSZr3u1ahBPoRfr4jtkWhnPl5o6os3wb2VSmxx+mfO?=
 =?us-ascii?Q?nyEgRcLmafrbPjm3RRTvRp431yhhrS0GrjhhK6c+vWol3ADuP0bNg3WgwBZk?=
 =?us-ascii?Q?aFXbsMnGvU+vwz4ODSYsyylfH5e40E8NlLFjo/IyqpJ3JBQrS3yb0tM3bOM2?=
 =?us-ascii?Q?6YN3w0ybKt4kMhJjAWjOyXfhnAJl7KuI4RzG0f4iqTROotHdu2odRLNFjjp+?=
 =?us-ascii?Q?2QduhnqSMWzKsK1JUumX5s9/3eV2o9DYlcz8/scGWG3Ybf3rdKHSgcpxR1q3?=
 =?us-ascii?Q?nmtaDg1kFo89Al1u2AbkRSaOnlLYXesGaRF/ZlyF1twqT34H56E0nGYaGvBc?=
 =?us-ascii?Q?DhGrin8iZUe3P9rSg4i88tkFcPRU2dtVPT1KBzIpBERE6Hn1gCYycXsK4ztT?=
 =?us-ascii?Q?LkdCcGFfmFDpqgqTy2ejahyGArg32IMA4fRq3/Lou01Me2jeaT7y6IIgSFIy?=
 =?us-ascii?Q?4RwrXjcM/N9NhSm66xIVkIAe09Q0izA0az+uHmVYUz4AA72FLthB4MarshCJ?=
 =?us-ascii?Q?mljCSsy6LDcU9uGX59GtY62EBAaG/6L1xuiAQauXbZwXMA73wcs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YwkJucqYCKF3tAFG9XBUiPSouReAbPgUCRTAUA6iEJfAKhnM4UsgsVQs1IdS?=
 =?us-ascii?Q?p/DhkMUJRJvizZVft2Ne0Ic3GUsyHiBM44eO5GbBW4r1J27aMCQg42vWiSFP?=
 =?us-ascii?Q?ZzKe58a8ugsTu+/CbpijwTT0zUqX/tw2tS0M5VKLyAGgRrRf54m6RZKr+Gg8?=
 =?us-ascii?Q?WisqmVnT9wh9rIcFTmC0QrH6OBolywxdwb+yY16fhdUCJH6Ovs7JS791afS6?=
 =?us-ascii?Q?hb4xXASHnG55w6j9vUGFHJz66yafQmzCkrAz6ZMClndi0K69JBDNKyiU3oJC?=
 =?us-ascii?Q?XaQ/z5KDfwgUsXGnqa5crW/PK402pZH5c6lAlm83Z5DlHfrYOiytR3p7D74o?=
 =?us-ascii?Q?8OXPFtZT2qXtQ4az1EIUtDcXHGYvWNYkHHHi1grjmg0snEDLbpedBWpsRSYy?=
 =?us-ascii?Q?ZaoXG5Lts+CtbIFJGI9jp1ubUcoK0+YbgOqg6yu925gsGL6f92XXYeQoP3MQ?=
 =?us-ascii?Q?TIhJ3+G/+0qWSGt31qVNGgEAoBmHeSsMxTxqbbOW9uR72GAkm/y0um3AC+J7?=
 =?us-ascii?Q?73W43v/Cl+4FNMoSZlQg8v3xyOijbCbttUVelcb9knlqnc2CBPMg5xuE7mOZ?=
 =?us-ascii?Q?UzaI77d0Zmjfx3c2iUilZSDfi/Q/rEkQwshZQpi6u8ufPuNhhZ85khbtPx6d?=
 =?us-ascii?Q?TggjPW/ZMAJ8MpIuw177HfeUENb7NJgCEsh4KgdCO3FXg2fNW/s7J5ske4YU?=
 =?us-ascii?Q?w7JF5tBWjGOQ3VrLGFJ+1nCCldkErkJTsIwGjv9mT8Oh32SPE9PeResP5FGV?=
 =?us-ascii?Q?gc852VCfUbTx+V6tAYN/orU+SNF5ju2Hl6Eaasssg99Xf7CbPkC/Y3rGmtHk?=
 =?us-ascii?Q?+T7IIgrxUbL069kZorsSSrpemyZBS+LKewreHDACUVHpB1aJMBf68OlNn9Y/?=
 =?us-ascii?Q?kgcoR8N9Up9WYOc2npn50wzcmk52kO7VSXH5lqij4Kd2YVso5WmR7sGzIAqg?=
 =?us-ascii?Q?3ReYvBeQRHfa3YJUqOkH9VTZXA7Y2e8mKuoXmR5gywFMFYbHbxaPdrHGkNUI?=
 =?us-ascii?Q?yD5hl9VKbuFAbQN85bYHzJTI5CGjzHvfKB560ZwNQXqqEqqbBajCTXmbRsXy?=
 =?us-ascii?Q?9Nq/S9PjbKF7wXDe8dn3Ewt/djifFi0Xf/kU7YzdPBJFXAkVzIOwUJNO8RUT?=
 =?us-ascii?Q?oLd0Wf87lZIhtoo+QxOYlKIOl3Qa3LGn/ZXBJurc4J0DKOoaMF0AuTS0Mfnc?=
 =?us-ascii?Q?ACbA4DUD9dw5ApMMKVofXoSN6uHJ0ewL49hbe/Jdy9UpaCVh8w0vDOpymWus?=
 =?us-ascii?Q?vXY9V4NrabQszumse+I17A36+jYT5CAmIG/40LQrXKCfI+OGTcAuNOgTFc8a?=
 =?us-ascii?Q?lPI/UwIAXUnSD5+KgaOAhSDG?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <638C36849192C84486245D9EFD3D369A@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 27da2aa2-2094-47ed-5065-08dd5754fdc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 17:34:30.2463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7281

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the tip state is contained in fields with the
HID_DG_TOUCH usage. This feature is gated by a quirk in order to
prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 6e7f34a47..70fdd8cf9 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -827,6 +827,17 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
=20
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * One special case here is of the Apple Touch Bars.
+			 * In these devices, the tip state is contained in
+			 * fields with the HID_DG_TOUCH usage.
+			 * Let's just ignore this field for other devices.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return -1;
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application !=3D HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -897,10 +908,6 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
--=20
2.43.0



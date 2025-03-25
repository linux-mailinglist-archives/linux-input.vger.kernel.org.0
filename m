Return-Path: <linux-input+bounces-11891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F04A95184
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 15:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433593AF177
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131F2266570;
	Mon, 21 Apr 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="GjQ8cYt2"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41E265CCB;
	Mon, 21 Apr 2025 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241715; cv=fail; b=NXEqYubPMvm5/EIQY4tXaC83kEwYg58GNkQBLumaDwNAVqLiV687OM9V0tsEN6uPR3UTFU5ztzeYhmjt0vLGq+jPRD3loZycjSY1UFWOc+W/nwHMTDXYguF8fsY2AHCBw5zM8vU6sDhBwMY8sdMBVqVPJzRaOpQXlDR6OF0KGeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241715; c=relaxed/simple;
	bh=EHwPX8gegZwSG3mNJuxoqQNkqfHpQY4vkEEEeYf2Qng=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=o4hOPk3V2caxh5W/FsLc9el+Wx8ZdtE0CJMPrYrqyg6rT1drWJ2bBHGkr6jM2JjccEf3lKH0npwkJxQoU3sTHlo5X1opnnNvXYFCnQga72aP1r03FMWlJjTAf18qi2Wn6/nanoFcwp3lHqImHTR1wbSgqi4zlDWrgL6vhxmPn30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=GjQ8cYt2; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E49vbzo4jj1IvmMx6WiLlZa5pPWjZZNicxNgJNhmjdnRm7l2hfqRbpoYpeg2V8aawjB4Icu6YEXmXvyFcZUJPCZYoaz4OZ4/uaGpsBv8EAF52apC14UwGwp9GBzoImzIInF57C3kiNTx4gzN+24MAp5FJW4KfRS6Vhz3+01uzbYX4vpZYjRAyEe+dxzL0dBFf/cQ0lHi7fulGqcGoHnv/R+vl4SnFghT+wSdXj/IcMFQo+4yWMdqsG3a2rLtDyAOdgDdJNHqE5aBVinrYBu4BYMPfbi072sgc29ohQLAJd0WFwTbJndtR+xxeozktXQMS+4sC1zG9fxYkWaXXXxN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMVgzXdkdM6NNu0I+cV+Xrb5YDpOIFrI7g0gJwXU5UE=;
 b=xFo/THycKMlC2PktcE8MmkY8GmCO2GgCiq1vkDciF4tGtJ+fFygxVxFe7geyfHyu3YnzY+gyBlz3FKqsaXZpESVYMasK5eohggq5E+uM8JSJ0TMJvOAE4VEOXpMUdtSQBuC9PvcQc00ttt/Ntkan4r4JjRs8rvg7mNWziGe+sERPvfe/IQw4rFaNiG6Gji2/wPXsqAD144rgnBQgZe6RSyYbdxoQmbYwe87nMde0QJuVmU9Vpas1HcjUclfjz5XZUYjl7v68gStQIDQ2y/EPAp/e5m/1yPh6lrmoTZHg0xWCBS/q2+6x9a4+b16dOsImpKHy5LmP5GT0CH1RC/ccEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMVgzXdkdM6NNu0I+cV+Xrb5YDpOIFrI7g0gJwXU5UE=;
 b=GjQ8cYt2trXDhz2HyeXtC5JaZ6gGkg6FiMs0naxfR5MiWpcb8tagIH1wSOOc5rr5s4spwIZHAEKuNrQmB//NpAMZps2hg+zBn3J8D1arW/MpkAEqYxyvY9OOd88mca0nYy6x+XVlxTkxV+6+u9B7FVQkMK43e6zylmnKj3Zp7CO5srgLbjUB38IcORYXk8Sh/lIEIul3Dpp1XH5pV7tTV+Cmjp5XZ6S+jor11KySPNQeFhCBXZjLdk4ZEKIyww91nuYtwQhNgWApTS/4rlp/J6QOzjWZFzsLQ796S3mgO0yDpjSWchtnETk8FnqYa8wWXiKNGP12ykrOFQeJ7nInGw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB7289.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 13:21:47 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:21:47 +0000
Message-ID:
 <PN3PR01MB9597873C6D8683135A96E29FB8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
References: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 25 Mar 2025 17:57:25 +0000
Subject: [PATCH RESEND v2 2/5] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields in Apple Touch Bar
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <bentiss@kernel.org>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <e456ded1e317c801ff4a1d0a4f6dbb5d9e2e886d.1745241627.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNXPR01MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 3682497d-3be1-4084-386f-08dd80d77803
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|7092599003|461199028|15080799006|5072599009|41001999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZsqNO3KEN2R/Q2v76ngZxP3TxERDHalVC44H2Fh37NIq3QYQ8TG5n8ca8lvR?=
 =?us-ascii?Q?5BQuXsrqv/9HIQOfHzQCks8I3kuFNibJ4PJiAburaIcdj2NJYbKMfx9hP4fu?=
 =?us-ascii?Q?j3c7iF7K439uotbcIdiPGGP1euJYR8ZXOKE3dKV6OZ0oYlzPfLAdqxMo0BaY?=
 =?us-ascii?Q?p2h3VqiTQAj89KJ1Uo/iTY6juaJ8Bzr/Z7R5KkAsXLirm0k3vpfC36JMmBC9?=
 =?us-ascii?Q?pKBev5ekj9g5o/EyZDbJUVTt7CAx59GjrUd5FKJS7BKEKtzYLYDH/9Q2AyaX?=
 =?us-ascii?Q?i+wUzCj3+P9pkRhpf3PBQPsycIefwXsd5Jen0MxnNHDHIsNtWfGajYpNK0WI?=
 =?us-ascii?Q?KdNseUdN66AB8luJiMvRzGxytxwEOj7jTq9mg1G+lXYgscEquQw5mZ9qgPqo?=
 =?us-ascii?Q?0Fs1k66rTl8xWQDTJ3fE9WYXVQXi9fDF4bpy+bJRTZEhbgQFwVT0K5nqs65a?=
 =?us-ascii?Q?g1XqBavymyYz3LmwS5V0CVKvotli+TIo/WMczbkJpXSE5rgQTwIVtwuin8iG?=
 =?us-ascii?Q?Jh8cPKsHf7/1i6NO4C7gD/RDw8ZLo9GPdOnHrBBUiVeWbjn8c08/g27nBozu?=
 =?us-ascii?Q?g1tuWCLLsdKDUfK6kYpN9pLAunK1FF3m0Fw31phfV4wYbPG9NNl4pmNnqaEg?=
 =?us-ascii?Q?Kp3MpfLLI6l25wNpU2btEpCpEvX2dx9coOlR8AKghgZbUR6BuVajyTiaCCUI?=
 =?us-ascii?Q?+bYT7Kf4q7IFQWvhMqBA5HFzytCqHL3cQkE7F8z1sxW+64RszjjarzPtPvpM?=
 =?us-ascii?Q?J7DJFl5Te5RS+MnC072PEkj23TolD91c4hd81S9IRSdchmQiT5hOD+RgaWJ7?=
 =?us-ascii?Q?HzefEb2YUb1aJ0LBdrpVLEK/5+YJrHn/OGsgxBZmjnyWvhYsXob8hbigMKDf?=
 =?us-ascii?Q?0m7+GJH3Gpj2fuLYIa81ymSQIR28v/nWNhE5+xLEgF/zZondnXsBMUm34bNE?=
 =?us-ascii?Q?t5zWgW7DA7ZqnEySfdjIoWvmKRESYiNwIfXGlGCPDt6fSxMyHEIjy+KghAqo?=
 =?us-ascii?Q?T2h2l2yoy1B6tGrg67k4kDBRYkmapPrI+qn245jdYsxvuA08/uHjGUqmWejF?=
 =?us-ascii?Q?3iGQ9uiTHWh87I6h+wa5qF4HzQr/fNPWBBHd0tQBTqpiqbCgVCesalIHpnQo?=
 =?us-ascii?Q?SJB0yPIimhfTNBUgValafYeaMg7LL77ULw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LgeDOBs4b6dK0Ankj3R78J5dnoHxTRtU0h4+8t8+2yqJYYm+IbLWvgpZgXFg?=
 =?us-ascii?Q?Vhtp3X7edanR9BDfsrfASECvpPmf43afFzT807zJxYh9ErsRlh4ZYIAG3vgc?=
 =?us-ascii?Q?+9qjwXNfYx/w5D2SIq0j01V0SSZSSi3YMDzQvp0bWuLcMwk67l3lzumFTM08?=
 =?us-ascii?Q?OYjbTW+JwHGUnDajZkX3cPiMlXzojbxOUnBnRG6DXlAMgkZ12ITYeWkK8xod?=
 =?us-ascii?Q?gwChQwC2GGx/jgtFK391mufdfyJMQIMtJMMmrOESN32mdhJF6Bfea0NChi/C?=
 =?us-ascii?Q?UFrE1ATG8p7qIw2UfSqUzcE5NXg9kEL7d4QjbRZB79tKuQTRS28rjOskff6u?=
 =?us-ascii?Q?58WRSUjapfTKNXSfBkN5ibYpz7IxO3M+AwdiHcQWzf8pGeViKtI9SF1jwfna?=
 =?us-ascii?Q?bnozKdi+ZjYWcUStXrQRl9MG3KpKFCmi0K9to1ilNsrOxnPa6x9luYs/nYqu?=
 =?us-ascii?Q?a3WAUI1TmQt773OGVL3bt4Cgm7ltwrpRqGtitjDmbcNz7lttsyFGt47poBo0?=
 =?us-ascii?Q?AolaDapGIvhOwluK9VpkaiWvqK5FqG/OvT5Nmt3uX0IhbJbHwnPQyC01riPb?=
 =?us-ascii?Q?JTMuR5UJwZGbhI/HrGzHfcG5Qm+i/+6doSfy2DqVSIOMF9PTs3+S3ddVP4BN?=
 =?us-ascii?Q?jkN8yviuReOgJZrITvQlXSWQsc5yJ3eG4Ibf4oag3EWcQqk9AEFcIs5fZvPx?=
 =?us-ascii?Q?v8MdwpQLqDBctP6s6n9WsdbUJD+51xypgf1PFi15EqeE+ErIDZ5lItCxOWo4?=
 =?us-ascii?Q?ATid7Rx2jSIjvMPcEby/yU1IU18mmSr4p63fXXdmhPbFoBrldtiZ6i0PTnW8?=
 =?us-ascii?Q?fv15CXVFvEG7lAeb1LVnFExaWYsqQ0CJbGDcau+ZYmYA9+5jv39vBsAPO5Ld?=
 =?us-ascii?Q?25XiRK1igcmaHE9Y7i6JykLS7/y5BoYWkQf4IUAz8Zim3iCp/HV9qNKsiL6h?=
 =?us-ascii?Q?eyl162bKpGdwwkmML2lUOEPip36EgsDRK3AGkWxhv/z4hzK0mKWftqFA6UlP?=
 =?us-ascii?Q?JukJ18t1o1/oZu+7ksAz5uoGz3GtoxHrzrj6vG+FMSaUtyfSuRaB0enjHZ9e?=
 =?us-ascii?Q?UunbfS1D4kQHewHIA0Ig4S+ryOHcjZmoEP1BDlp8YKOGxuh/Ofl5mVCZSWDV?=
 =?us-ascii?Q?PFZlsqAF/+jFL/c9N1EUDZdoQCNHDSmcUeWc6a+skj0A67tTJGLMO3HSy1Zi?=
 =?us-ascii?Q?qC3GCNBw/lMp+YZ+2o+w+pxcgYP4nOS2SuesdCJ5F3zOCYn/1olz9cZfj3Y?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3682497d-3be1-4084-386f-08dd80d77803
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:21:47.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7289

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the tip state is contained in fields with the
HID_DG_TOUCH usage. This feature is gated by a quirk in order to
prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
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
@@ -827,6 +827,17 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 
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
 			if (field->application != HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -897,10 +908,6 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
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
-- 
2.49.0



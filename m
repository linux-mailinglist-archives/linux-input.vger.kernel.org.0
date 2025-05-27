Return-Path: <linux-input+bounces-12599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35FAC5442
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 18:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9808B8A3DDE
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 16:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C7628134D;
	Tue, 27 May 2025 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="mp8DsQRp"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD40280303;
	Tue, 27 May 2025 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364887; cv=fail; b=tsDJXE5K+lp1Smhf9x3At0SGeMqs2wVQAtdkT6dLoAxpT3DBUuIaR8qCaHYa2PwyRVWRWtbKyvRBU6GbkEIIVVAbRSdpx2y+Jc6nJOZIA/vgrou9Swk31Hir776xJqbfmELtZS30sHva5jIG3Yulx4YRPbvFZAGJTMFfW9wUNho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364887; c=relaxed/simple;
	bh=3KcEfd7V1GFcWKGribvG/tQyODwWelMIL9ZgfwU3SbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OwC5Sc/CMA67p5EArvX5skmiVpbbMM1ofIxV5QA1+csZ5Q76u9DSGfdcH45EeN9Tq6jDYITEqNgHNnJVrjF3RHzRYKAKfxRdGnghBf0SUna+j/NXHIsWHSMtTjy3so6GpDpQ2TWhYFvSsJdMZUlKTVXIeL9c5yCvxcCzDF7UftI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=mp8DsQRp; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg2wFGXXdDdB7vWDw6fCcClqQw9us70SOZtbdjpOvl8lMOqqeK5lt1Kl+b0wuAk3FUoRFF/+9uelZswnEbDzscZV+opTVDHCt5VE7OPhB2D9RqKyhRejAwjvk0MUBD7WR9rt1lrq/2DTE/bhCl6636mFfTN7KJ4fDxpDi2yVltTIYZYo9eEEDY5P9mg/fk+9xfT3mEDOgi7TdYE+xE6wW7ZWZUI+Ayx52x4f8pwRssg0p7x3zQVFMyTjifidFazpQgsgoJ88qB+A5vk8tiMwC3jOy9zqHcTv3i2a82fT/iWGWPKC8IQB9rMM0KfgznAOPLGh6p+M01OSibtembqSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G43irMVgxdt6dCzOKULR+itLDOGfcRVcNWlwIYZAy4Q=;
 b=N9+yq/fNPfXkhAMRqL5BmRWmlwQkigy2AYgUzEA7Fy0CP+bIXJdGJWpICAxH1p4IqaW178i+2N/ZOuHgRKK/V7Fd2zomhVO4pGFhBAwwAld0RovPHFMwrQq+bBOVIi4b9haabrWzOlu/gBgCHe7zI85sJ3BCrbWzFJ0FtjRFeqZh2ChczRMcdrDAEgMbx7/NgZGQalSHL/o3AEPEsk7iHCqGnj/Eh+0Kk2LA9iorFAc64NFql23nMqYIbz+tQiFxVaowJOkftPMi+gn6/PPiV/DRCko/ewqyFnwGpfCurAc70fYth9n3W6Ma0VzQOs5WHUbkv6oXIK9XFgg6GkOfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G43irMVgxdt6dCzOKULR+itLDOGfcRVcNWlwIYZAy4Q=;
 b=mp8DsQRpyKoB0KAVCyQZEZzKUWitjUvMAu0x0gHAMq8PzZkDo8EQ2Wo3YZm5Ckwuwb2YK4zlGrNwfyBs90DOsyMCVAmD5qWBvVDFxnZoDICqx1I8BDBtwU/D3jiDw1q9OxhKN3EfS3+SGRW3v7UUXGsIysZcC6P7twh5qTz0ruFkaTJH6Gh8XZjYbEIWfdWtuYWBl5/viwFF8EQkH3pBKEDYAUjSTo5n/fztwzuYvlEk3B0/Lxvag46bCzUIXLIxFfjF1esvuAGRrz6VlQjkFcQFsV7ntgah7839osbLigwignS7fmCAjZXK5KUcJEhrmINCu9E1qqSfsqnIA80B6A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB7799.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 16:54:38 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 16:54:38 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Kerem Karabay <kekrby@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v3 2/5] HID: multitouch: support getting the tip state from HID_DG_TOUCH fields in Apple Touch Bar
Date: Tue, 27 May 2025 22:13:14 +0530
Message-ID:
 <PN3PR01MB95970F0ED9684E4AC55F5643B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250527165417.24165-3-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: f175fd9b-843a-4371-b64e-08dd9d3f2ab6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|8060799009|19110799006|15080799009|7092599006|5072599009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6OuDLGUtp28trtztsWWqJChK+HueZoO16xu+4pWUHjuFjEPZtNWF+BpdiLd8?=
 =?us-ascii?Q?0ZZj0lJ4GnGvORIFriQ1Vizrew9IzeVOmoda4t50N/BpgLhjpm+j4YRVVHiz?=
 =?us-ascii?Q?it+nQQM3OUT6jzIlSLmSt5IvSeyMw3eVVpaEYoUZVCfbUZkDzYkzjcrvFYay?=
 =?us-ascii?Q?H4Xd8LC7+tYvBPHH9rZJP0sm/XntZzTTRJwDU1XJ5iD6E9hlbBrttk28UtPb?=
 =?us-ascii?Q?FNSW55ehx8z7QF55jVSuKfzTRSLs4fiDa5pQDSJUYcPOkGIbhuVVL5qLsltS?=
 =?us-ascii?Q?4fmR6V5RcZ11t3A1aHiTpMANO4EtESsVoCYEaY8kd7Xm6uBOXNL/LlCRZBws?=
 =?us-ascii?Q?nzV28y+LbU+SBmh58V1uELED1Ilu+zjD5ytPBIQGK6FNnKawP3X9A5yL7oGd?=
 =?us-ascii?Q?sejVjmjPK0VoRA1rKQFdikvkL5jUy6MlOqDergYsbfi5EZWZ5eH0Mgf0NQkJ?=
 =?us-ascii?Q?0ebGfKZfpLLDJXLzuMxnb5X8W1e2T3u8P3ManSZh5yMo1/yglnyhyNaBBTBz?=
 =?us-ascii?Q?rLDto2kPN1eCk2/H+hQgPzvYKOYLAmNJW+DMD5xFZfuFKL80PEHhzAe01dBR?=
 =?us-ascii?Q?WlDqR5zOr/khN4qzYEVfiLZflONXfduful187nhPhYJGwCQgbHop0E3/wz5F?=
 =?us-ascii?Q?7MntPMvbcTnVmB/VxlCNuvodgM+LmnPX3ikpSTKu6z5Ox5YSPt3z+l/NBkba?=
 =?us-ascii?Q?JGFJMPo9caq2V+GrwROxQnHInAsMfQc9/IeZ4fKpjt5YD6ZfFKYazHu3DtJU?=
 =?us-ascii?Q?syJXRHveiCZa4nV5CYO2ndC7bJkrDZpB2LspBaYqKaNwPAXic1SHSM3kzgcw?=
 =?us-ascii?Q?BpRC6rsXDKjgcJdp01Z+LOHIuRaIfMFH1uEBrLhxqCoRGQwLLAZ0/wAUnSem?=
 =?us-ascii?Q?b0otO2lE2diKvtjIbiKRQkrtHu6wOLeVIGhTZG1SPwYbDcofVKVqEUPew7km?=
 =?us-ascii?Q?ovg0FxG8QJCHN5dtbe0/qGquzVE0MZV0b99m8AdMBY7wLKcvsvUx3EM69dYI?=
 =?us-ascii?Q?mDl4WAi/NgZRwVO3nCDuMJJvN9LJ8LmGRF1vYN+hCnYzFbYPbpxoRuBYJSji?=
 =?us-ascii?Q?tca6587zOnhVIU40rsGsOgo3o/Eq/kGf5sQUgXPlDXtCJniSn/ikM6iCQqyd?=
 =?us-ascii?Q?VfNVV3Y1vWSg8wl7ffmi0nvsGaA3pOm+fw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I9wUcUyTMnp/7PpPZC7+3RyzRJIEfL2LSytLV/N7qcOHiCVlaqZkkD3Z4QSv?=
 =?us-ascii?Q?4a/bPKIfocHutiDIa3ynS1igK8SZjgwEaL3fCWcCu6kwmilgU7uOqF69n/+5?=
 =?us-ascii?Q?Ulq82W2vwwSNpJ0QbfEyV7W3waAI1Iykk6/DrCz5MzSSt9bIgPVlMDhBu7K+?=
 =?us-ascii?Q?qFd3jgngSckaE/a1Rt2SWuNUGg5e4ZyOtczvRc/8lOPLDR43ESZpenhogWHt?=
 =?us-ascii?Q?5VWVPaW9NygcSyPneQoJ530r3S0YjXLqAbH9gE+r7rhdJWNHL8GtOF3yegl+?=
 =?us-ascii?Q?G5vEk3sqZx25hkMTi4K9pe81g/Mg2wu27TDFWru6tYCWO+YwpffUIMa/3Ioo?=
 =?us-ascii?Q?Rk0pFVdLrYVbvP2C3iCYzFmyUEonTItNo1i2EfqL1my43/7mNVUfiW8SLEc7?=
 =?us-ascii?Q?1mSAf+CFpqGdsVljbkvBqKr9Ff9zbIA1FYh2FgY0vzXt9h9vdV4RvU2PiBqD?=
 =?us-ascii?Q?M6GnbAQ3XixQE6ZtCqms+FRWDgyYtpE9eEs0yizWGGX9gnuFyt7vHrXXgT5S?=
 =?us-ascii?Q?XiWuxDpZH/iCZ/gF1uss2ZdLu07OI6sAic7pan21Fu+bL3GO0Fx+FnNeznyw?=
 =?us-ascii?Q?35iqrpQ5/mVCWv8/pRj2hQUDizFqSDzUOh8FhfwBFkYaupe8+Swpiy3hzv2i?=
 =?us-ascii?Q?dp9tnJ4k6s7TjlfC4+JpdmVWuWV9/ub73C8eb63WO9QVBlYjC+0U5XSGmc4r?=
 =?us-ascii?Q?k38JnhjXPhX17ztcjAInmTwB0mqIIPCjHmPljeDbH8Dgy6/rXA4WpnkRmYWT?=
 =?us-ascii?Q?QeRXla4cHOYigWcCyIUjGzOE7Mt37NOKRoDHsXSqligKs1x7SE921mSx3aso?=
 =?us-ascii?Q?04vOq1KlnkXQ0NNyvxfE4a4Vg7ZtRtlPsr6hyg0HescEJWr1iB9tSGOq7oE7?=
 =?us-ascii?Q?0w+vBfTXmSea9Uf3VGQyqv0ZGhRAw8TZNQI2Wj9QB8+eXKdkBkLyDwCMISCR?=
 =?us-ascii?Q?uVGlCTC2DkMO/Siv8DGUn875x23ckCQYu9k+7xXxPSEL1JUpu7AGrnLPbEmo?=
 =?us-ascii?Q?VucCX50nDtHNq8thifHn02LXbfSybnLXwhkBQisvILCR70dBnIOpbM2lejk7?=
 =?us-ascii?Q?v88ns0Og21mkvVdr3rwjHEeesUBb5PlYWozzCeNTIw6Fvn+OmfT024MLdOTc?=
 =?us-ascii?Q?txYL329d5EfWrQItVxf7LtS68vRX0tRnkXF2LXioH9aDwzD7Q2zDUAUcfyEs?=
 =?us-ascii?Q?7UDF8IPgZI2Rvlogul9zmvukGemvk+a2WAmGvs9ipQcErIi+xILS/vmJagWE?=
 =?us-ascii?Q?1WcZDFkdbJDdGTuFGpT+ICKJ1UtArWpJsVsz48uONT5DvxSPrXtF4kfxMtUR?=
 =?us-ascii?Q?W/k=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-18ccf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f175fd9b-843a-4371-b64e-08dd9d3f2ab6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:54:38.5296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7799

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
index 2788a081f..99ecf6c8e 100644
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
2.43.0



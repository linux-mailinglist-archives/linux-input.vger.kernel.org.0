Return-Path: <linux-input+bounces-11721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E13A84C46
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 20:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DCAD7AA490
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 18:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE5728EA63;
	Thu, 10 Apr 2025 18:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MVUskl66"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011031.outbound.protection.outlook.com [52.103.68.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE9B28EA4C;
	Thu, 10 Apr 2025 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310634; cv=fail; b=sRC/00s4JJBlok45ZSKDVu4o90ubqze1oPs4vHd9XRSPpII9z/yI1lu9bniZhSseBP+aNFujyhVacQt0rb3OLix/xOw3zzUTIjOh1rsf9FLCUyVTDm6wrxt28daDBc5KlJzIHegEnwfF4w+l4rLo9g3rDwTw2pucXQmkv/GUZ2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310634; c=relaxed/simple;
	bh=DmY887p1WKX5lnaqaaiXL/2vbBdMl1/fAZQXd7c3lm4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I9C0cwOqWDsDlKwZS3o7+NK2A7RNJfs1mL1z+Y9+oa7PETe5OYHEN53VL6u9HUg9rzzYbAYZGX57bfOPuXyi77kQfM9Ct17Uul7evIjrMyGZIUnsmosgPNy3aOh+OPhnaslY4XSbfiX1MILWJ9kuyuCSfnOQ52VuNW0upk/7RgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MVUskl66; arc=fail smtp.client-ip=52.103.68.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vblqokAZ6hQBG1xqkbl4aYwsmhAL4soaz8aFS7OM47DN5ru5071jR3dyIF51vY6Vd6wIIiZ/D19LkTxUjhT59Nsv3m6bv1kIBhTHfNmDyij9p+0qqILEm7lUjLcMqJDZ/YF+T7wOPfFcrkohh6suawYreNTsQp9GSLTuu8rZKhTW1RDFTwE3BscPn3sOnk/x4faXRs7jQTldfq/HfwkufDnixTXYPE6dR1xpb7D55LGbq0NYpfNYHjz8XO3YFggOlEVkDWwoBvpMG/l8yj8lI76kR9Pzrujtds1DWJA1rcXi0Bchl93blu92JbBVBWQrj+D0Aax5x0u72KzcqQHVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuvfQtrxFOajCLHRPepiqXZW8QwhvcCKnYPv4jVs/lA=;
 b=CubUA7Gjdy8zNtayjxxtJav6FjhAXq2sdCxaVHtKdO5d+21GMOuPz9XS1OLnAsW67w+7vCHGU4ZedWAir+SCMCx19fCufKAhyoTupk4rZ4nNW40a+IkhcPBkqE0gsWC2KbVPmfHDps0h/y6/ZCBkCimYQnd2Xq+q7obPl4A20MF01eScB8QAh3psSUuyG846Qs7HT7weaVOgWpiJRFaGwU4CDZeOPUYkjWG2UGopRxs1FcbHbKmMRZ2+at+9cetPG5Qv0fMB/zzZIesoXmLjRVxS7J8n6ZNwBhlzUBKV0fIZKnJ61gn62VjOF8g+D/gf2+wfecB4BL+3xW8llnFqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuvfQtrxFOajCLHRPepiqXZW8QwhvcCKnYPv4jVs/lA=;
 b=MVUskl66PZk7G7A1oiH8S0kyD2fD/jd09w2wpaCN8vDtY78PcmLT0zLjGdHKOzJYUIRD6Pjh2xIe4bbOXPaDjDR/tBQ8kLueQD/EySAlYUlZDps6nBFp7MrwVLg590oWq9y+oExy+MXZ9x3HwrELzk2Q1lv4KOqriu325PJkBN57grbmiES5h9pgyuTW0fsVn+b4peYG2JyMn2l9+HB5QfLnbp1fsi2/500JyqjwbfCoDdmjNR/GguEjYVPda0r+qHkBkjy2i3nO7EJh3ut+ujuA5CzzlNiaN13UpFB0prBRRjwXN7bNeZGF4+fshF8ojdhGoIqb+FJsXdlq9c4kow==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB8880.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 18:43:48 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:43:47 +0000
Message-ID:
 <PN3PR01MB9597EDA1C370B64545AE7A93B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 11 Apr 2025 00:13:45 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v2 3/5] HID: multitouch: take cls->maxcontacts into
 account for Apple Touch Bar even without a HID_DG_CONTACTMAX field
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <PN3PR01MB95973D930911AF73E262F299B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB95973D930911AF73E262F299B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::6) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <0aaf7fd7-376a-4664-829c-9c9afb67fd87@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: b7858987-13bb-4e87-278b-08dd785fa10b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|19110799003|461199028|8060799006|3412199025|440099028|12071999003|11091999006|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmlZRWxwZ0ZtOUFmOGNIZXk2TU5HMUoxeGl0S1FWOThTcUZ2dTJuTzVlQmRX?=
 =?utf-8?B?OC9Ra0lUU2Q2UUw2WkRsZnRyYUJ0WDJtd3lDS2lSWmpVU1B6dEtKeVVOK0ll?=
 =?utf-8?B?eUo5QzJDdEF1OWlVa0xsYmJabnp5ZDZWOGlYaHNMWkpMaHdDb3ZDdzgybUVD?=
 =?utf-8?B?cXFrU3pwNGtoY215TVIvOTdoM2taVFVZZUJ1TFBLcE1JalY5OGFHMCtVK2JS?=
 =?utf-8?B?MVRnMGxTSldoMW5SOVZFdjMzajU0NmVpVW9lUEdySHJDejAzeC9RTWg5d05H?=
 =?utf-8?B?THcrSW1veGtmc0xQSThFNnNVckEvZDVFYzdkTlpjNHVjMFBrdlVjUGFsNWFG?=
 =?utf-8?B?Y2w3SUdKa2IrKy9CZzkwS3NUbXRhZmdpMTZVTFhpTEU4OUdldks2cklIODlh?=
 =?utf-8?B?R3Y2Nk4vR3VmVElWRTk3MVQxZEFjcFNWYmhWQkx2TTVWWGd0aS8wYmh0Umhy?=
 =?utf-8?B?UmI2OHkyU0dQN1hxenV2Z3pMdGxPQzYwT0pUeVFnZnFLZ3V3K043MFFRRENW?=
 =?utf-8?B?ZnEzZlNVNU42amZpcDZPRDJ6bDVBMDdSRUQ5NkhPd3Vqa042SWpGRkxOZzcv?=
 =?utf-8?B?Q1l1VnBabjllem9ZaHQ3YlJYVTgvN2VVamh3UG82dzd5WHlYdTdGT3RHNzZG?=
 =?utf-8?B?d1B5dEs5T2RGY0pNaWpuclovS3Nia1pxUmx0dXRTaHVLempSUUpPQ2I1NytP?=
 =?utf-8?B?aFExZkpSZVJUWENLMEpwZnllU1NpTlJaektmcHhjeFRJMTM3MlcvUStaaVE0?=
 =?utf-8?B?YzdZLzhrUkFPck5XN0pBblJ0bWtoR3pIMXh4RDlkWHlBdjArZ1pURVRtOUV0?=
 =?utf-8?B?VGlFV28vbDEvWXlMTWFLUEk5V2ROeUZpKy9aUU5ZbUg3ZzBGb1E0b0xoZGho?=
 =?utf-8?B?MjhGZFFJRFBFMFUzK3dtVHh4USsxempQSGFYVFd6RTFaTENvR21VbHR4SVdJ?=
 =?utf-8?B?UFBKT2tsd0daME5nT2dEUEd1Z3dVeVZ0aHYzdG5iVkJCZHFKaEdDd0FoUjJH?=
 =?utf-8?B?c2tqdC9aSTR0UVZNdUY4WXF1bEpvdkJ2RkZhaDdCajMrRm42U0FsRDVuU2NG?=
 =?utf-8?B?RFVkejhvYmRZYzJHMWFQS2tzbjhWN1BhcFVBZ3hMMGY0disrQVdPd3BnN21y?=
 =?utf-8?B?WTM4ZjF3VlJyZWgyald6eWo5MCtlYU5aZi8xYzgzVTFWU2dST1RQV1h6N3lk?=
 =?utf-8?B?dG9yMjdpbUljTElDUXMrc3d4NzV2ejlPOHFIcExmbXpESDcxYXJReUo3RXFt?=
 =?utf-8?B?RzllS0ZFeDBNN3JkMjVxdHpYZGRYZW5qZUw4c0VZM2QwbGY5RU5ld1JCb1Rk?=
 =?utf-8?B?WmR0U3FFWmJRUTI0blV0dG9mVHpkeXVqRkE1em5EUFo3QktsMU13MXVyRUhU?=
 =?utf-8?B?dE5tSWFCSFkyWFhhNTk4a0RjLzVra051ejdhU29ZdnRqUkZPelhXQmp3eXRR?=
 =?utf-8?B?WW9xa2lLMjUreFVBbHkybDJMTmhpdkd0ZkJFdmJNL3pqUVhsU2FCWTZUdmVF?=
 =?utf-8?B?YnU4UnBVNVlkSFZ6NGJoRjVWU0psUDAzaEx6U0ZMNnV0S0tyTDNuc0lia2t0?=
 =?utf-8?B?U3FjSSs5UG1NOFoxeXcwaldYa1Rjekw5VXdCVDZNQTBMNWljalh3Q0Z1MU9p?=
 =?utf-8?Q?XfKF1PUGYcA9LTeva4re0H3oJkXSd5hKzUbD1Tf/cclo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWs2RzVPT0FpMktZV2pQc0M2ZTY1Vjlld2t4TWdqTSt0clU4WTJvRSs3TStu?=
 =?utf-8?B?QUV0NmlZYnNoNmFEdVRBUnFjTEJVZnIvZ0k4TkJpbE0vS2QwbUJUZVNMZncz?=
 =?utf-8?B?U1RiNnFyckNQc1ByWElTb1dIc3pScDQzNlNuVzdWTVFaeUhuTlgzOEVpWlov?=
 =?utf-8?B?WHpHTUJMOVpkcWtiU0VxNVFVVGdLd2JObUFINFFPcTdDSTV0OHM3SWxZUlUx?=
 =?utf-8?B?MTNyaklXMVpSUHhzRllLTG1hUld6NVExMG9pemVxMFBPRVVuS1JJNmNWRVRr?=
 =?utf-8?B?Uis2c2ZsV2JhakUxRjUyYWUwaHVrUEtHS0tJME1yM1FEZVU5QnBOTm9CYlNx?=
 =?utf-8?B?Qk9pOVBUVGk4eW00YkF5eU9lWVlGNXFTcUhPWDhjak9tdXV6aTBnOWhqTnBk?=
 =?utf-8?B?empHSUxLbDAzNGRSdnVsUVVtdHZOT2MwMnFCb3NjT3M1SGxqMWNDMCs5TGZN?=
 =?utf-8?B?aUZMZEdGbHNFbmRHSUFySnZTaFkyWUpLMGJSRUQrV0VyL3BMSjZSeUJIMjZC?=
 =?utf-8?B?VjB5cUR4Yk1NR0xkYWErelFTRTU4NmhHdzArOTloeStVdndoVTZ5VXZGSEtR?=
 =?utf-8?B?V0d1dE4xMjZndUIzR1lyT3JyQlV3TlJXK1BwUkhKZUZNdGdVMmxWeXk3N1d2?=
 =?utf-8?B?ajZtV0I4YVowRitScEwzTkhaVGFaa3FGSGlXU2l5MlpmOVNlbzdxakFhNGpE?=
 =?utf-8?B?bVdaYVRzb2MvVzJaZk5JdmRKdEhteWg0cHFZczgxWjJQUDhKblRlbGFGYzd1?=
 =?utf-8?B?bzY1WmN1QkZ0MmxNckZvYzVPVlo5aEdBZm1UTTh4cmlobUNZWDE4RnNGQmNE?=
 =?utf-8?B?MFdYUnhKUFpOZXZud096NXM0NEtCczlOc3JuM2h4S09aTFFCVDBEWjhoOGgv?=
 =?utf-8?B?VEI3M09oNUF2bkNLZ0huMmthRUU0QmNwZTJwUXZIUnFoSlcwUjNGbXVlSEYy?=
 =?utf-8?B?QzFOb0hkSFVLamhsWFR4cGVzVzJ3OHltR2Q2dU1va3RCandNcTFGTmZkZlV3?=
 =?utf-8?B?TkpyeUhhdnlCQ2hGdDBycm9ZYlgvYWpzR0RoT3NoYkVzaytiVFRWSUNRelZ6?=
 =?utf-8?B?bkVtZXAveU0zMEVaZlZROVd2WFk4T0o0Q01TQ2R5OFF4cEp6dFcyT1BMTk1w?=
 =?utf-8?B?dzlxeElGNEF5MCtyTVBpVlF5d3haOHUvdVpmZS9WK3BmbVI1STR4Snhub1Ax?=
 =?utf-8?B?V2NIMDFnZHh5UTBGSEtSS24xQkNMNERiOTk2QzFqVTEyQ0lMbmNWTlByakhq?=
 =?utf-8?B?ZnRDNkIrL2N3Tm9oeFVxRTlPQ1RuaWVabDlyazkyVTViamhMQWlpZ0o1L0lQ?=
 =?utf-8?B?c0VacHRpVGQ1bCtPVXlRZzVDczNKMGtIRUh2cmFiSmxHMVpwODh6V3d5T2dH?=
 =?utf-8?B?QWRDTnpTbzcrcmRyM0g5SjRleVcyTHZmbWxEd0FzUHgxaEg4bXluc2VEWHRp?=
 =?utf-8?B?MDRwQ1c5UkpXZHpIWHF1ZFc0ek1HWks0ek1IK3BWNkY2Sm1CcWExamZnTFZF?=
 =?utf-8?B?MDJtWTZNWm00Y05ZbXlPKzArQm10V002N1VmMjhSOE5xMkRQSUhtdWc4WUM4?=
 =?utf-8?B?RXNTbW9rN2xmRmNvSU5XWEl3VVlrOXVVOHhRenBibXMraGpjcEQreDYrRXl3?=
 =?utf-8?B?QVdOY2c1cEtIYmU3blhueXIwaytpYm1veWZsS3Y3Y0tDeldab0Y0bnRGQjZ4?=
 =?utf-8?B?bkxrcDRGS3hNS29md3BLTEM5S0dwYmV1SHpBb3pGcWVqWlkwVmdXdkRqYllR?=
 =?utf-8?Q?5P0nx/aLEbTTR/pOF1GrVKgQ/L5ZGth+6SJ8bW5?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b7858987-13bb-4e87-278b-08dd785fa10b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:43:47.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8880

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the HID_DG_CONTACTMAX is not present, but the maximum
contact count is still greater than the default. Add quirks for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 70fdd8cf9..f7fe6aab8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1335,6 +1335,13 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	struct input_dev *input = hi->input;
 	int ret;
 
+	/*
+	 * HID_DG_CONTACTMAX field is not present on Apple Touch Bars,
+	 * but the maximum contact count is greater than the default.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR && cls->maxcontacts)
+		td->maxcontacts = cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts = MT_DEFAULT_MAXCONTACT;
 
-- 
2.49.0




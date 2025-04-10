Return-Path: <linux-input+bounces-11722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6EA84C57
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 20:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FBA64C5A5F
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 18:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B67528F941;
	Thu, 10 Apr 2025 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="CH9xY+BA"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011033.outbound.protection.outlook.com [52.103.68.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335828EA63;
	Thu, 10 Apr 2025 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310687; cv=fail; b=blKxBoW/zH1f+kAcUceMbbf/K+tO3ylepmqngBrvb9zS/C1Agy8BDdp5I15CBX2rj266zcZDYwvUSp70004nZltwmAyFSdQAEu1GfTJISc91r6THcRF25pQjVVIlIwYo+dcXv5TTKj6mJjyrI6YRRUtj0OgzRncunh79875PNbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310687; c=relaxed/simple;
	bh=bXlLctPeVGlGJrqa34Jka5xzX/KIYnzZYX8+ZQ+432A=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BWIi8qKw9gvB9t/oUmLYEPVXxzueCOro7EZfJi8XMAAWqAG+LCmGOxMTCOO2H8l58kbgjjusMmkHmDKl5UDb2GGfDdR5QSRBdK3/Vl4yYl0xBMK57rH6DT5h4Xej5aWVkAWIpzlkEtYHxBBDZB/eyV2DaJAf/9QUJurJeSnws6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=CH9xY+BA; arc=fail smtp.client-ip=52.103.68.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVyf0mMFKWFQrkbgwBMpRpAKDqUUr6UpZqoTOKybf0jzhGahQPpJ9h2Z9HRUr1mLwBmwSkRkeBx87LLfDQSNIX1L7Y7D0wvl0xog/6lJN3+X90dEYKvZXexDW/BnQ9LILjHClGRxE88HfEIpjDYnhSVt4SzpQAiEmnstcAhjOR4Wzf5/qnqLky7Fic3bmYcS7tiPP0TxZ7jcgIajBnCjDCfqAJgUJdPHLNs8EmD5vVCEW7w7vHjriaSlYGjHoZ7Qyshq6HTYbKV68kKFHTTZiGlimCr0ADRFfj5liAg+8mEukSCYbeKN/Le3hy03+0VeWcqc6VWGxvMEi4xyLAQi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/Te0v4hGtRNcdSngXiTjjPe8iuK5NM3az5ug1NQwmw=;
 b=kE/ozNmhtAdZDK4/ygVawCiNSMJUJCtoBegp8VIbBXztR/smOaX8nzrbSnOE0/caUazWYa8WMepFLZ7tUHrGrZn3A1xE7hLEo9Bp8G0Ga0t5fYd5dWwryEuWHDcjpvPB40cF93IhsxgrFKpHjxqEBNm0sBhxyXYRoG01XrmoiwvzjYp2Nzlpn/z89jND2Mh8gKw2ZtZqmH/kSC7I42nGiagfAgbE6Y2tWOF9lQPwniIYYO5/oan6ccuLe1Yj4tsahmgcaY+yVH03BX07wawJ3vQs8wm2HM4rR6izfpgSSed9NiLX4E8nZnhFxMzTTeZ/uGnk4sfpdRhacm1LtkhLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/Te0v4hGtRNcdSngXiTjjPe8iuK5NM3az5ug1NQwmw=;
 b=CH9xY+BADlsJfEU22+TlbwSrgB/HX7228qvvCJ/TVJrCJxHIfh0/NyhuB/N5bIbE5099RhKRKfndCi+TmRUpTJPdNi7v9vaUkbtQV0Xecog3rCjavjHkKm5SxUm95zrFIoTDmlx26EczXmA/TxxpcDxG70F2+INxSy4jLq7hO7FJTvLZjpL0vxN0RNRJ1xeVpa+14ucDRCW7IUECy2f4GJbctzLA4VjZd73D6/jTQlWXze3M+7QlgiJswyVOeB0HpWGRWaqxtwMfKBLFv/OkFVaZgusnYWJDKGNjFf4il/HVmr5oNEiUUeQ3TWx6u4Zq9gpbGKuk3ntMHnAjksU8GQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB8880.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 18:44:41 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:44:41 +0000
Message-ID:
 <PN3PR01MB9597D3CBB1148FD4C74EA551B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 11 Apr 2025 00:14:37 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v2 4/5] HID: multitouch: specify that Apple Touch Bar
 is direct
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
X-ClientProxiedBy: PN3PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::15) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <79f9f637-4c34-46ae-9223-b4ca94eb4882@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: a4efb4f5-303b-4d79-0c52-08dd785fc0a8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|19110799003|461199028|8060799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkozUHRFQnhHdkhsaTBSVkZBekxmQ2hhY1B6ekdIaEVhdzBaREJQaXYyeGhz?=
 =?utf-8?B?aFVLakk2Szh4bG5kTEtJdGdKWU9xRFhvNWVTMnZtM1RtL2dOUTNabEUzMEhh?=
 =?utf-8?B?UVUxaFdxNy90ZzJQV0c4cTdPK2FUYk9WVU1tMlVIdkVoMnkvN3E0ZVgrRGk4?=
 =?utf-8?B?Mjk4MHA2Ty9OMEJpR2I3emJvcHExdGlvaitGL00wMS9mc25SQnhoYlZ2Y1Ux?=
 =?utf-8?B?MFdvbjdiTjNzSDZuMElLRGJkTzlBNDlGQkVpZktzOG4ra3lxL0djVDhJbGVF?=
 =?utf-8?B?YXZ6SG82UFhESERXNzJ4ZjhsUTlzUDFscFNSOTNhT1UwK0pLQlljT2lnMExy?=
 =?utf-8?B?YTMzQUJreUc4L1BOcWx4MXMwOTJ1aFptSTdnTmRTbzcrT3Z6dUtpcnVzbWQy?=
 =?utf-8?B?VnJyb1lYSzJPZVFKTjArN1JNdkdVdUxhTkZWNlcwLzVFZVNTZEZXL3VwUm5y?=
 =?utf-8?B?RXN6dlFLb2tscnlCdng3cmlHT2lNejlYK3dTVkVMNWEzRy9NcDJMRUNUeGpB?=
 =?utf-8?B?eTg3RDNEcytGUURUak1CTmx6UXlKS2RnSitXZURWVm84RXdrd3VzQTFoQWV5?=
 =?utf-8?B?VVI1aU5vQ29DTnprQlBtREtXbWRqY25FMVd1UTYzTVVMazVTNHBSc0Zlb3ZW?=
 =?utf-8?B?a1p3aWU1NnFvNW5hU294eU9NdXh4ajFHU0p2RWdNc21aWDZRcFRQTXowbS9S?=
 =?utf-8?B?M0hyV1loQ0VSRGZnb084eVV1dEZPeHZCMGh6Y3ZzY2N5WEV4QnFsMnhUOXdN?=
 =?utf-8?B?VVpJVmtvSW9uaEdDTVpuM0VCUS85K1ZPeTVXZU5XSmoyZk5YeDZQbWljZnk4?=
 =?utf-8?B?ZW03TC9nNHRGbU5iejNnV2NtbjdjcGNVaWRoOTY1Y1hudjVseXUyUmRPaElX?=
 =?utf-8?B?QUxBcENPNnRYcmVGMmZBS0JNbnM2amdadUFoVWJ5MVorM3ozRUo4N0xpRmMr?=
 =?utf-8?B?MVpCSlVxcjlmRk1leUpQUnBEMkJNdEd4TFBUcFhJV2ZBUHNsMFc0Rk9uaThu?=
 =?utf-8?B?THpBcXB0NzRWd2w3K3lJQzFCRVV2Z2J0Z214TzBrczdwamFkVjRUNU02RG0x?=
 =?utf-8?B?MmRYYi9mc0RuY2l1cU1GTW5VTzhxVEpaM3dZcnBJdzdVSTFaREpoZDhIMm1N?=
 =?utf-8?B?bEFOajVOczV3VkJoWWRrYWlUSlhOV1dTYi85WlM0VFNVazUwd2Y0b2JoZytz?=
 =?utf-8?B?Zkd3Zk5DNkxKRkpEUDhBSEIreGpTc1d3M25td3pWVFlvenVWcExwNlZnQTNh?=
 =?utf-8?B?RTZyN1lSeERxbUdBODdqWFpwWlBnRnhqdmc1MVB2dWZPcFYzWHhBbDdPWTA5?=
 =?utf-8?B?aFFaaDFGRU5wV0hZeVhydUE5KzZ5V3U3TDVRcHhZaEV5aGVzY09rYWVUbGhV?=
 =?utf-8?B?WUpJdEdVTnpOUVg2YlVqSHFsQXhFZlIvQkZQS3I3ME9Kb21jN0xMU1lqaFZI?=
 =?utf-8?B?TWllWGJjQjUyZTNJT0xqTmN1Y1BycUtJRWhnSkIvRXpOcUowcG56UERoM1pC?=
 =?utf-8?B?QUFVV293cU9IZWRqS0dEYjU4RTh5OEVmMnJNdUR1Mlo0NVM4emJZVFM5RjRk?=
 =?utf-8?B?a21aUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3ZjSXhSWk9FcEwyY2VOdWJLYmYxZlE3bVNmenM1bkE1SGNVcUNaOS81U1VS?=
 =?utf-8?B?emI2b1g3TWg4Y3dSUFd0dWRwZG00NU42MnBUWkpsWFcvZExZRElGcURWQ05Q?=
 =?utf-8?B?TmdoZ2N5dHRSNGQ0QXFHSzE5V2Y3enB5ZEhKeWo1ekJRS3hibFMxNmxwdnJq?=
 =?utf-8?B?bHZpSkovUVF5OXdUdHBMZWF2SkdjTm5MajBhRTRvOE10UndqQVdkZG5YdHJK?=
 =?utf-8?B?OTZscGt2dVNWUzQvaUVqZU5Gb1VMdmJ6UWhlbmYzVkRMNWM4MlFDSjRtd0E5?=
 =?utf-8?B?enZEMkZHa3QzdGtQdXlPb2N3UDlpTlp1L2VnUE9aTWdPN2s3SVFCcjdkdlpE?=
 =?utf-8?B?QUNueURiWWFhVXl4cGVsMlpDaEp1eUM3dGhSYlBVWTgxV2xtaGlwaEdtM1hT?=
 =?utf-8?B?aVVNMU00Z2U3aExNWTY4UjdSRUhSYWtaTkg1eEd1K1Q2OGlyM0k1UEJmQjZF?=
 =?utf-8?B?NGdKTEo1Z3Vyd1JnaDc2VUpzMWtqOVhLSThnNzQ3MklOdUhkT2tOb1M2Tk5n?=
 =?utf-8?B?UTUvMHM0dHFtOU9YeHBmQVhHN2xqOTVqd3FQb0w0dzgzNm9kYXd5TlJ1cUEx?=
 =?utf-8?B?c1RCeXZ6bnBPSnZtN3orbldiVFFER0hFZmxWTnFXN1lJT2ZZQzVCOTZQSERX?=
 =?utf-8?B?Mm9oVEhpMHRvUEZ2eXBFaE9CQUoxOVlmcERzeGowak1jR3lvT3hTRjZvck5i?=
 =?utf-8?B?a0ZNdnpOaGhhVW13RXZZOGFCYzZuakVJV05Rdi9yUTlyOVpRblhKaEszQzd1?=
 =?utf-8?B?Z2w5Q0JkR0tGZUQvUEdzUmFhZFVtNTM5OHJLY1hYOGVnUjE2OE9iWUhQcGdS?=
 =?utf-8?B?dmFLQ0UwbWFJU053VjhQa2dZVFloaU1zUUpDOFVWd3l4OXBXNGtLdm1xaUdm?=
 =?utf-8?B?SFJnS1BHZlN3akFldG5FYlZKWmcxcEJVemJ4Y1BQUEhvczdVRlRqZWc4WTQx?=
 =?utf-8?B?SDA4aE9ERjlXQlM0NzVDTTRVT1Jha0NaS1FhZnFDK1F0ejBzN0VlT1oyZytv?=
 =?utf-8?B?b2JtRGlJMWkzVTkrWWp3ZVhwU2xvUmpDVDlXWURnODhJK2o4bzMxY0hld2tG?=
 =?utf-8?B?YXlPOEgrTHhvZm5FU0kybktsd1kwb2RjVmVObFNnTC9EN2RrTVNtM2RQM2t4?=
 =?utf-8?B?M2pnbWpaUTE3UTBmZWsyNE5SUkw3Vm9XV2U2U1BhVXZONVdqUlB2U0wrMlQ5?=
 =?utf-8?B?SVkvTXpXdlJJM0R1Y2NoSVBxTXlwOUo5V05PWTVtdjRJVi9iMVNyUThDb0py?=
 =?utf-8?B?TFo0dEZyajdWS0diVHlEcmE0NmN3QlJyZW9GajhVbGpSeklzVWlGK1gxWUpU?=
 =?utf-8?B?UHB6b2dmdTNaVUYvSW5zQk84NTd1eEhObFF3ajJjSHRaTFlxbk9lMmJoUWVE?=
 =?utf-8?B?ODF5Tjc3RG5jK25XbTdKTUlKT3Exd0Q2SWZTZmtjK2hQRGFMam4zaGd1bmpj?=
 =?utf-8?B?S1I1WXY1Qitvdjdwc2x5SU5JMjRIbEt1Z3M5WlJJK1hCbmU3NEYzZXp0ay9u?=
 =?utf-8?B?cHJ4MWRneDMzNjBjUS9iMVJsR3NPSEx5SnlhT1hzYUVIUU5iRm5ybmIzc0Fm?=
 =?utf-8?B?QmpSODlYRHhrWVhqcnhuQUZaVkZLUitUZXRsZENBcnVoNnM1NUg5K0pWclZn?=
 =?utf-8?B?Y3VjaGtiSnBoWnhOMnptU3ErUDJONWtGSzkrYXdrL3ppck1rR2pSc1kvcHVB?=
 =?utf-8?B?eTB1bzlUOUFKY2ZWdmNkOFNTek1veHEyTnF2QW80MXVSSFJ2OVhncFFCOWUx?=
 =?utf-8?Q?dKM9LhOw8WXilJtvqEtyV4AaBxCZYjqSRE2sHFc?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a4efb4f5-303b-4d79-0c52-08dd785fc0a8
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:44:41.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8880

From: Kerem Karabay <kekrby@gmail.com>

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bar, where
the application is HID_DG_TOUCHPAD even though this device is direct,
so add a quirk for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
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
@@ -1349,6 +1349,13 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
 
+	/*
+	 * The application for Apple Touch Bars is HID_DG_TOUCHPAD,
+	 * but these devices are direct.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR)
+		app->mt_flags |= INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
-- 
2.49.0




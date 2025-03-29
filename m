Return-Path: <linux-input+bounces-11357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D736BA7557E
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 10:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C3A16EB6D
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 09:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6326618DB1D;
	Sat, 29 Mar 2025 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RtE2/cHQ"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010014.outbound.protection.outlook.com [52.103.68.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A35219004A;
	Sat, 29 Mar 2025 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241022; cv=fail; b=IPn9MrlX+lGzupAFbVOFVvdnkuFfRLq6dfXLN0REeHjQ0Ihzq9i5K4oOp6zjOLdpgDdhxtLFiGbXdtwrF3zSMjzO7SJfIfIZshDoWy4cJ4btxfOyQnR2nG16EihNAE1QOvgopAV34qnNj20AaSO5lNgFwIOIVm0Z3ab/MszXy4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241022; c=relaxed/simple;
	bh=y0jHra9XgMcl2ILOdu5UwGrt0Bl8EFarotMqjhbIiUk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nLGnoaO03OFOcZpryTv24P5dKB4LAbBGQdzGw7fOGAl9BI86j8HmvaFoZQBv84cK8hzs1GtmLFMGmm8kRJ8mxoO5bfUC2Z29pzIjvnyFu33MR8kQNLdpoHjszEbNJ96qXQX8+GO7LTX9wwpZ9fu31S8+03/G3TNjTPjHRAqkPmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RtE2/cHQ; arc=fail smtp.client-ip=52.103.68.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clBM8j0P6F+0MHztjQYzOCOSQWkMcvM8SghF9qEUrEENjeS0iNtuRb/6tmbHmgQ5PomOR19RFe7hA+H/9NFNnvf7YHJ9KmuuUGRljmyKaotiHEFnTUPwWgsWBbHIo36r0UGsWXEUxIy/IOlJH4s7Zw4RTZbNAFPNeI1SfZegkZ1OuiZjAqS/YG6XXp/BA18GX0WAaRtKtYDYexJa1/V6k6YHniIMK9YSTOlYsHA2R9hxzbQenU240dS/uQGg+I9UTOi/16D3thCeUnZkdyrU04L5q4qdsKYAek1XOx8Aa9lgyulnlPvg4VZrMr4s2bLEo5H9rHi6yY16UnK9oA/Ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9E3evAXFtqh3K8HqsNk/YDfqH3XprhMB7zuawZtJAM=;
 b=mug0G+tQkRsglxuim6jRqpwIDqvc8iVV0Xk/+zvNmV33v8VNO4okbJCkwmwQLX/HqFsSDPtqUZD6sJ6u8AX2SLO0sWYzsUfpBIjVO7gC1J5xehJa035AUxwWm5EQ/AeSHNsaE4AeJX1nswYwtVzBPIifcjnduw5wHIyc1KvghFzIY8K+v26+GoBD5u/H5hu47XtFU9CmLd8C3wBD/ZtMlPc3oHppI8c/Z/OOHCjJnuVpa5P7oYGqHrAJ9VpCdl14CHVXrowvEyXwFeSncoti0aK2WSMjT4Aq/xRs4GIs9JCiKM9/ehR0U+qS3kLno0kESbIu+o/nAzleDsvY9NGxSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9E3evAXFtqh3K8HqsNk/YDfqH3XprhMB7zuawZtJAM=;
 b=RtE2/cHQ7PYKDjxRgjQBaNRmyM+ZnUsihEVGdw5oLwcjB/rQRiTsJrAY3jPOR+X+6vtnPmxgZuPXzUKIJHXRLkRMsWLYMINTg6HNpM9hzyC3I+xpqPLr+kYnB3MmQvwP83JNQ1tYI6lMXKcaIsoSYRYmg2F0gJX5JTV9D529AN4ln1tTzfreVGtU/mkxUBGW04AsqCCUxAeFim06eT7GueMEpM/hLi3xihjeKrrNcyXK/XOLJH9d0K3ESkSJ7HZ5fuO/e6FHs6jtRbPd+lbgNzykBjHt4xz2B1dlwTkKobrB+GeIa1LCiH4MvZdkTbmbBKQbdzXUer/0q9QPhJ6lFQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 09:36:56 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.028; Sat, 29 Mar 2025
 09:36:56 +0000
Message-ID:
 <PN3PR01MB9597D2F7627323EADE6C89A0B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 29 Mar 2025 15:06:53 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 5/5] HID: apple: Add Apple Magic Keyboard A3119 USB-C
 support
From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org, jkosina@suse.com, bentiss@kernel.org,
 benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <PN3PR01MB9597CEB67FC52231276F6038B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597CEB67FC52231276F6038B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::28) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <c96614ac-c9b4-430b-a3d3-ca561e38e749@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d927c83-1a2b-4c32-8610-08dd6ea53ef6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|15080799006|7092599003|461199028|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2lXdWk1Yno0clhBY25UN2dNOW1hcGdTYVhyZHZOQUFZRDlJNHNqMFk5TjdR?=
 =?utf-8?B?TlRhMTFPY09lS3BvRFczcEloeS80Z2tOVWVnaFF0OWZBQVdjMGNzU3hxK2sw?=
 =?utf-8?B?cnNQV2kwd3VnVHhnSU01d1dPQmE4cmU5M2ZmcjJiWVJId3B2OFJyMHloQUg3?=
 =?utf-8?B?dlJXdzIrbG9xQy95Ri83WHBCejFWNnFnMExuRlBKVkZRZGZQQVI5S0hCSXlD?=
 =?utf-8?B?Nmk0SC9xL2ZxekhGVVYvRHJ2clIzRDlTVFMrYzZMUGlqQXFqeGNVa0xZZDdy?=
 =?utf-8?B?MGd4d3pveWhRekt4S1o5T3F3dTUwWWU0alFvK3hiSG9ETklNeVE1MGwxdWhU?=
 =?utf-8?B?MUQ1bExYSWNFa281NUNLRmJLNlFsSzRGZFJzOUl0SnFSbm80YnJ2bzFOYVdD?=
 =?utf-8?B?Mmpza2Q0VkZSdzllcFNHcE4zbHBhSDNlTjRMRHVRMnFuTWxvYlpNQlJ6WGVG?=
 =?utf-8?B?eE9nZy9PNisrUEpiVVdxT2tOdmJMVm5WY3dZeVQzaU5jTjJuNzNBdzh6ZGNK?=
 =?utf-8?B?SUUxNGg2M2EyeWpRNkhsT3I0VWxSQSttcjF2ZHl4YnA2d1lubWU2WGExdzZy?=
 =?utf-8?B?czNUdkpPcnhUWlZ4VDR5SWxab1E0WElFNWt3NFFSblY4d2lRSVo2NE04bE5l?=
 =?utf-8?B?UlN3eWFKYmIwRHRoMHVyUkxETk5vekxjbjhsK1VLcEVHTHFKZ2t6NTUyQy9m?=
 =?utf-8?B?cVJaUWpxbWtuS1ZuL1JnOTZ4VUNDMEI2VDBPNW5nRWJFZmkvR3JQL1ZUQmJM?=
 =?utf-8?B?bTNUODFyaEM4MHArQnZuZDRBZ2RTY0p0eHVxUHhDWnhFb083UlZDRkdtdG1Z?=
 =?utf-8?B?cnRTZ1ZNdnFjZ09vK2hVcjZlaktmeXh3eG1kZGdEeEloSEdlR21yWVN6dThH?=
 =?utf-8?B?Ukpia0szRUlwZnFVd3ZSbzVEdFpUajhadVFTQTF5Z0taZFdTUUY0SFpzVzJB?=
 =?utf-8?B?eW1hMkFYWEdEUUo1cU9CcTd6Z3RNTTd3VW9uSWN4b2xyMGJDSXlIWlBaMWMy?=
 =?utf-8?B?UVB4VGpMaHdTanZrV1RzUEE2QnNUNnFDNEtQTG5MRmdYdld6am56WWhrUEF2?=
 =?utf-8?B?R0pHbWhQWWkwRXRraG93VU5CeVBKcUlUR1NKYmxGZ3dwd2VnU1dtc0cxUmdX?=
 =?utf-8?B?Q05EVjlsYy9VSkpFQzFUWTQ2S2MvZjR4cjF5OWZ2cDF4ODRCOHBpSVNpYXF3?=
 =?utf-8?B?VmFiSmU5OUtteXBGMnNqY0JIK0lxTUt0Q1NTcUphVkExVEJCRUZMdWhyWUcr?=
 =?utf-8?B?MHI0aVBsOGx3QU52cjBrZm5NbE5leUJEaklQRzdsTVMwREdkV2Y1T1BqeDlH?=
 =?utf-8?B?d2ZpUUdHc1VGZW14TDlvNTBOeng2M1NGZk04ZEUrTVczR3FuRTFYbWJ2ZTIv?=
 =?utf-8?B?a1o3Z3JTWXc0NVIzNXROWTFPQnFhS3E4TnpINjc4SlBBbFpmekMyaVN5ZHli?=
 =?utf-8?B?WXJSVXhZeExZOGNFeGl3RVBZaGJsdEEzbS9RMjJPQXQyeDAvNmVINVFqMXdq?=
 =?utf-8?B?bm9veU5ZK2orSWZnaTl3d3VZVFBtZzN3SDlYUDJTbm5sZmtPakNhVUpBaHUv?=
 =?utf-8?B?a2tNUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1NMQ05Fdkc3aTVPa0VrMEtwclZQV2plS2E2ckRlK25XR211bFBVcE1Ub2pj?=
 =?utf-8?B?aVhwcDhlU2JGenVEdEMyQU1DWTNzZjFReXZWYUFKUTg3MGVEOHNuTkNOK1Ny?=
 =?utf-8?B?TnZsRzZYYWwvQUtqZ1V0L0VEdjV3QUthb0NjeE5ER3g5MjQ3dzhsek5uS25F?=
 =?utf-8?B?NzZPYS9jbSt0MmhRRmorVEdiRDNqS3c3V3pkYkwzRkd6eDNteDhadHNldXh4?=
 =?utf-8?B?Uk85aGRjMjAyQ3hmMmJJNUFLSmEzaWhFZGQwMkg4UWp3TGFlQk9qUmpiTnRK?=
 =?utf-8?B?aWJZeU1PQUF1bjY1YlBqZG1GZWpzbWQ1NEJzdjhXdWluWHhhRnRaWERmNGJo?=
 =?utf-8?B?VW1NSW9ETnpXUFZKSHJKazVybE5pSDJOOFE3aHpnVUkrNUVqZEpFU0tpcDdU?=
 =?utf-8?B?QzVNNllZUlZ3TWlyNk1EUktaNkU2VkwyYkdUSFdCMkNQTVNIN2RQS25TTXl4?=
 =?utf-8?B?UWYwM0xvWW81MFlIR0NjMHlJN3JYV1QxQW1pcjRqaGhkcllVMnphbTVyUTJB?=
 =?utf-8?B?Qm54ci8xV3VLeDBIZlBtdXhBUVh4d1VTUElNdlFmOEhXTXBmVFFFcmVtZzBn?=
 =?utf-8?B?TTJsMmVmNFNDZ2VWeE9iZ29IMW9NaUNobk1Qc3FuVnJGWEs1cWdsSUxFZ21E?=
 =?utf-8?B?S2FpL0w4Nzc0T2lzRE5lTHZlcUhkb2lzTkY2aTJ1RjhoQ0pTNVRMUUpONjBE?=
 =?utf-8?B?RzFzcmF6NjBxSC9xMXZqMmlyRnh0RGFiZHVzM1NzdUJjcDVHcmFNNEhEU2Jm?=
 =?utf-8?B?MnJHcWJDUG5oZFZiaGlYbnZZdEcrcU9rQWVDdnRNV0FicVFBVS9SUGgrNit5?=
 =?utf-8?B?NkR1ZGZzRFNobGV3c21FdjhzR1pEcE1BQlIrcWl1eHpSWUZJUXd3cUkwVExx?=
 =?utf-8?B?VTZodkJFN0M5dUU0ZnlVNENEbEJHL2FrT0tCQUhkc2c2NFduY2VmZnVvM1o3?=
 =?utf-8?B?NHZadFI0Y1ZLeVVsSjBpbC9valB1dUlhRWp4ak9JakRYeFZqUk5TblVQWUhP?=
 =?utf-8?B?dThsNHdyd1JrNGFoektQeHp3SjVibnpsTjVqM01tc2tOemdWNXY2RnEwSVFy?=
 =?utf-8?B?S2Y3cVZMUkJrb0NQZGlDUmNDUWhjV2tpVFdRa0xsWS9OMVhHNzVXdlE3V2Zm?=
 =?utf-8?B?c1JvS3B1OUFaRmpXSmIrOWE1ankrRmJVbmtqcnVidG42SFcrNnFDY3ZkOEtq?=
 =?utf-8?B?cFNHNVYrVFhNeVJGODl4OVlUdlluMFZid3VUQjlNaTdHTUxVRC9JK0NJU1Ev?=
 =?utf-8?B?Y0FoZVFYeUdJZmd3MDNpZzRFZytNVVNCZkJuNm56cWptU3hiYXF5NnpvY1Bu?=
 =?utf-8?B?OWx2cUhSeUlVNjkxbkpQQ1Z2MERaUnpDK3VBaEI1N1krN2tHQXFON2tGYUdT?=
 =?utf-8?B?a2dIS1lSNmhwTlhhV3FXRDczL2g1R0ZkcjRtYWhVUnRFRUhFT0Y5WDNGSjZx?=
 =?utf-8?B?WnJLbTlFNW5CUGNjeWpMM2lOUStVbWhoSXhVNW1vYm5kb3VuVDdTSTFjVzFR?=
 =?utf-8?B?L0kvL29Jb0txVEhYKzZBRGhUNUxqVE9NdENlRTM0MTZIVEpaMnVDRnIyNzg1?=
 =?utf-8?B?bXpnc1BKRGZReFc1Y3p0UnlmMEZhY0cwbmtqaCtZbnVHZU40M1pmZ3o4SkpR?=
 =?utf-8?B?TC94dk5KejVSTlFOdVdMekdsUU80blNVK2VmOVdaZjJ0MUpyNDUrNFppcEhU?=
 =?utf-8?B?SXg3c3dPUGs4UUhGWlFKd2hheTJkeVV1ckVIOW5yQklwRDNSSHhlTldhMXNs?=
 =?utf-8?Q?4m1oxXmWQfYngFMkESCg8ZeYc7EC1CFPcenvKPD?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d927c83-1a2b-4c32-8610-08dd6ea53ef6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 09:36:56.3270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10042

From: Aditya Garg <gargaditya08@live.com>

Add Apple Magic Keyboard 2024 with Touch ID and Numeric Keypad device ID
(05ac:0322) to those recognized by the hid-apple driver. Keyboard is
otherwise compatible with the existing implementation for its earlier
2021 model.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e95a54113..0524893f7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -486,6 +486,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024:
 			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
@@ -1182,6 +1183,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8682e1b11..4925bfd08 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -167,6 +167,7 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024   0x0322
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
-- 
2.43.0


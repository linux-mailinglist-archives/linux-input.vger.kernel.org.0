Return-Path: <linux-input+bounces-13553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E75B06616
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 20:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78764E81D3
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 18:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFBA188A3A;
	Tue, 15 Jul 2025 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="YhRe1Ytb"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011028.outbound.protection.outlook.com [52.103.68.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299B14286;
	Tue, 15 Jul 2025 18:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604416; cv=fail; b=bvBdFViEfvAmBzBTDQ7IXj75Ju5LC03aFi6LBcWHRSWQQPnk1n8AklERXWdRzlyDJMuRbPkRtHb9UYgqgQb9xuAl3NzM1l5T+K4JE7bQyvmRK+RhKThxzqD/Msa6P8j7/rGjADUgr0n849/FcBZ137v3KpkoPNJ8kwhpV/nlK0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604416; c=relaxed/simple;
	bh=fBkml7GnRCR0qYRJIL/jzK/Kevjle3E46L+beC13yO0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QuYp63QfO4wz/Z9PqBOE+7q/3ObY9KYyNaWvOv15DKtnLI1wGDUt9VzQm0LCY3TKFbGI2qp+iDumaJnXZZgjUpD7uy1ehdby6KpyXAzXox3SzC/TDWxs9X3koaKVkhnEYWwoDdPFqCCO/IoEkiMq0dEgBg5gZhGwXyfE8frW12Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=YhRe1Ytb; arc=fail smtp.client-ip=52.103.68.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjFlxju5EZVJX9kqVq/QfUwDG9t8d+7fI4cZEidOg9w1gaQ0D+FRYMgS8/mukls07+1Qu2F9MxmExpP9efrfF7p5eO0FXtwjzHnox3e21Mm3DGGvUkeyjN6tKoHQAVCpDuzZuHLS/tBwMad0ztzkTS3o6PentNXGPs82kIEFnBl9BQ8lNf1anDTue66Na50p6gG3o6r1pm6JHtLPOcKwzj3Uc/xuQW6mOVX5DJvWLMTDWupyt48cNZNd7dDuJuuf/R5uha6PeR8Hy+UdQ2UpkhJUgnUQJGsB3mx092vxMvFgPTbsT7GXe7BIs/m43lMbVgEwGtNnu+BQKtmHm+bu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQy8uC1ZB4gPM7rSuQbuHezTijV0Mnj5zEfd0fbsG7Y=;
 b=rfOe6twmu5pXZvUj7otPHt8IH23+ZYGyG66pmVakXIxIFTkEgQMY68b+NKuaOOBnV7Ul610h5STF687yOpLcqinMG97O1tqp7pBjxSk7ALXNZSgOdMhrF/MIX7dFXS1XU53XAoCBsnl9kLHPbvUjDvOEWsP4/yjMdJgEuB75Kst/PmFy/er44ibpGiiaUvJruX2vP16BJ+mFaVGf3aexAaMSoi9THYg0mpigxeVd2nwImEk043ri0My5oLNsXr5w61JAjqZrThLRS6oR3wu2IpznnsUiNkpfpa9eKb96Hnr20Wb4saXKptH6L4rNiouex3DYIVOGvCOWyvlL0CEFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQy8uC1ZB4gPM7rSuQbuHezTijV0Mnj5zEfd0fbsG7Y=;
 b=YhRe1YtbCe9yGP5TLv7EwVqhmLjUtneLlEOcqkf2tP5W2YBRZSwuW3ZvidhWC52eZ+43FfrQ55LWBkM/gm00MhJ/shEtFM+xqQNd6SmKGgRz/yIQ1pw/qlkBYNXdAPVVXlX1JVIH5om8aPhs1QtuuBjj5bW0v+4Qi7z/LH3xujNH1WHVorMEIdEkEpsX8BaiY+y79zLBbS5niPMpPWyonaYbyxbcOJsPHDFHEf+Q7UG3hk2Gpxf7SwLpM1O/oyQTjYqzmZVXAtcnvvWO5tvBrS+tdhnEk/LIudS+vE61fEiMXWB44WSgKvC+c+geBsgf/I/ev5yRziSL6aDGzEgsyw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7555.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 18:33:29 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 18:33:29 +0000
Message-ID:
 <PN3PR01MB9597593E4F7B8147FCC13EA5B857A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 16 Jul 2025 00:03:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: apple: validate feature-report field count to
 prevent NULL pointer dereference
To: Qasim Ijaz <qasdev00@gmail.com>, jikos@kernel.org, bentiss@kernel.org
Cc: orlandoch.dev@gmail.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250713233008.15131-1-qasdev00@gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <20250713233008.15131-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <702f8339-fbd1-4128-9c34-578aadf09f1c@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: d44cb8cd-4d00-4e14-95b5-08ddc3ce17f1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|41001999006|5072599009|15080799012|461199028|40105399003|440099028|51005399003|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MitCRmRVeEhUc3FUUVZzSmRzKzFHSWlSWGE5djlhMTRkbjAwN1NUV3psQm0r?=
 =?utf-8?B?REZ2dDJJNkFOeEZTSnZoV05DSzY5SmtqRElZYXVIb0g0eGFhTHFVOWxVZkJ5?=
 =?utf-8?B?YWZjNjJmQ1pxZG9YU29mb3hzdlJVZmtuU0p2SmZWbVJUT0xObVBhcks4eHRN?=
 =?utf-8?B?eHh2ZDBvS1k0bE1kQ2FIejJOazh3cFltNXBVTGZrMGlJVmJpejhSTEQ5U1F2?=
 =?utf-8?B?cVBpblEzMStxcXdrUkRCV29pMlJTd1EranV5dDI4NEVBOHhzWXJFeC9GT3RW?=
 =?utf-8?B?b3U0V1BxVjRtc3dCSUltYUxHdjhHMXF1cDlSK3FHTDlBZFVwWFBOcXljazEr?=
 =?utf-8?B?M0tiLzQ0ZW1KUThlblZvZlYyZUZOeGFyUGNhZGsxOHBkN1IzczNWOTRMNzN0?=
 =?utf-8?B?bUFENlVKVko0QVJIbHBFM29KallZZ2MvUmNCT2lTUWVNaTNxc3pWbHFQNHlL?=
 =?utf-8?B?eGxrQUdmdU5MTXNMWWYwNElqbW12WktCT2ZoMThCN2Y5OW16cWVUUmhIUEsv?=
 =?utf-8?B?cDl5Z210dzhkWmF4WHVLc1pEa040bWR3b2J1R2hZYldQVHBreTg5YXpwcmdZ?=
 =?utf-8?B?SVdiMzFYZVo4VzhETjFscWRIRkh2c2FPMUlZb1BmOUx2QzNLUC9TWnUrR2U3?=
 =?utf-8?B?QTlmYTFDdnVLR01FbXFKTXlBejZzaTFtYkpsaStubVVZSjFhQ05oaEZzZUUr?=
 =?utf-8?B?S2ZPT1dXNkdiUTV5WkEyUzVzbjVjYUZQR09rTHRBS254KzFMVHkwekFoOGJa?=
 =?utf-8?B?N2VnMW5ha3J2K0gxcXAwbytOUVBxTDZ0SzA2Y3pIQVdHZDlkT0U0bjNrR09o?=
 =?utf-8?B?dCtYZjJ4Ykladk5LNDNUdzhjQVZDeXE3RDlVbTdTblFRRWlITmFHWUllVFRu?=
 =?utf-8?B?akUrSFpiSVlPbjk1TWJyVi9ZRkJJUHZmZ2tULzdONVh1ZlBLcE8xcjZWd3Fi?=
 =?utf-8?B?TjlZNW02cytwd2NTNTd6aFpKTi9ySit0RzkxYmZlWVZEakh4TTA2TnN1U0FW?=
 =?utf-8?B?Umx2U091S1FJMUduWDRXSWg3U0tSMGsvUHgyZ1ZoSktWSklLQVhmbTZvSnA1?=
 =?utf-8?B?Uk9aZ2F4WUJZdHVQa2JFUkh5dnU3Yk9QbkNkeHBkNWVpUG9XNEdJSkpOMUVO?=
 =?utf-8?B?aXVMMWVMT3UremFnbFROWnBNWVhQYXJkL3FjQThBT2xLWWZsK0JnOXAyaXdJ?=
 =?utf-8?B?UTNvajVXOGZHOWJTdlNIK0NiRFF2YUpHU2RtdGxWSmdMVkF4eHhjSk9TK0Rk?=
 =?utf-8?B?WjhUVWNzclh4dWVpcjkxVk96cS9Yd1pXTS82OGpiVDBwOFNMb2luRkFqRGQ4?=
 =?utf-8?B?TWVwL29wMldWYWdsMmp2d2NEeGc4Rk9pb0J4ck5KQlBkcHJ3VlY3UjVTemxi?=
 =?utf-8?B?Q0ZkK3d6SlVGb0hQUUpTZk16UmtaZDlzZDlKZ25BblhWQ0RodzN1VVVSWGhJ?=
 =?utf-8?B?YmZNNHN3TXg1N0EwSUh6NktFS29Sa1g5YUs4dlh3bzI4Tk1GRHp5TzJuT2ph?=
 =?utf-8?B?NmlwZ3ZqWWptZWJSQ3ErT0VQckVQYS9iaEk2emliRGo3cjJCTkJONldDRXA1?=
 =?utf-8?B?SE55QT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHFkWVBhSXFtVk80QUpGRy9CK2dwTDkxUmpLMWpkSkhoNXNuazIzM1dBa28r?=
 =?utf-8?B?Nm5qK0hwTGxjODhRQzk5d00rWjVzS0F6VzhuOXBOaVROakF0dVVneTd6cXN0?=
 =?utf-8?B?cnlUNGQrTmxBN2VMbWpwUHRpWno2eUVOMVZrVkIwZkhNZW5rTzI0SHZLZE5y?=
 =?utf-8?B?T2RTZHRNUk5zMEpqUUxsVGdGT29QKzMvb09BalB6cVZGc05DOXVEdkgxaERJ?=
 =?utf-8?B?S0d3a0JXNDhQK2R3ZDBvbTRtaisvRHp4bHdEMkFjM2ZvMVBQL1E4RXRZNzl4?=
 =?utf-8?B?Ulc5alBwTHBkS0c0eXJzYnBwOFdzeGdpVGE0VVVHZ3pZVDNMOSt6KzNFMjJL?=
 =?utf-8?B?amVlSTk2dEZ2c1F0UnI2ZXBrWDloUjRzQThoQkwyajdZR2VRZXVNeDNad1Vq?=
 =?utf-8?B?VnJZU3BPUFhITkVBbGgwNWp1WVVJY3JYeFBtdGsrMmx5RTNZWEs0andMa2tQ?=
 =?utf-8?B?ZENHZU0vQUppN2M3cTJXRnJaZEZjRkRZUHFUbEtiRlp4bktvNHBkbzRkOUVY?=
 =?utf-8?B?NDlBdTJiWnliaXBZTGR3NGFtcG9taEFkci9FUVBaQ2xJOTduYWtWRXFSdE16?=
 =?utf-8?B?dEorZGZreE5jaDQ4ak9QNVdMUHhKMm5JRnplWUMxVFQvbk0zSTQzSHY0eTJN?=
 =?utf-8?B?OU55a1Eva1RNVmM0SlBLNXhnN3V1NVQ2MlRzTCtOV0kzRDZWSlBSYjV5bUgy?=
 =?utf-8?B?a1JUVjdUWFdYUFgwRE4wMUVOcU9OeXI5MHluYTZSbUE1aTUrMEl6ZS9tQ0lv?=
 =?utf-8?B?WHhmcmI4REo3TXBwYklJbkhhYXM4RjZma3FPdXFabkJqaWRRMUlmRG9HTlhs?=
 =?utf-8?B?RmxuOGNIai96YUoxQ1grVWR2bkJDTGV2S1M5UE5USWlrYUcyNkMzUzhJMFBI?=
 =?utf-8?B?L1NsODIxTHlKd3gyU1lvUEhiY0RRRlQ4Ni93dUd5cWJzYzUvVmdQdCtVWG95?=
 =?utf-8?B?MjJ0UzFsWmpGTG00VnhTZFZXaGt4aUkwYmQwMTRMN29JUGF2N1c1K0pFR1pl?=
 =?utf-8?B?S3AzWUFHZWwwZXQ2QXBvUnQ3RFI3ZE1qN3hWL0dGU2xPVkJOU2w5dVRnVFQ4?=
 =?utf-8?B?OGkrREZDU0NaMGRaL0haVFhKZDdWVXF4dytSM011bHpYeXUwWXpTQ0l1Z0hH?=
 =?utf-8?B?UzJ6N2FQUkd3ajkxanBScVFuSWdYbVB2WmJLa29nOXRzZ0x0WUs4VmNLNEZB?=
 =?utf-8?B?YW9rZkROYW5IalRnOEZFQ2Z3b28zWVdGeFhnbDFWZXV0eENPeWdOTjEyRUV2?=
 =?utf-8?B?WWE0a3pnU3JxWUE1Q3AvZWdxdUtqV0NCRzE1QlZsM2NvdjBsZUpmV3pIbXQ1?=
 =?utf-8?B?Mk01dlVBaHY1cjBQenJzMklmNi80aUo3UW1OekE3OVZJV2RWV1BNZTRibndM?=
 =?utf-8?B?WWYxSVF3KzB1dm9QaXpZUm5xYlMwRnZEOEttc05mUUt5UUZ1TW5nQU02UXBn?=
 =?utf-8?B?WDByeVZtOGFuWm9MUVlTS0l6c1lyNk9MZzg0K1dRclJtSWdDdnZOWUpjQVF3?=
 =?utf-8?B?OEJFaVFTVlllWjFhRU4wcUxvSm5JVTVwQkJxeU1Cb3dtcnE1aHZLVUxhYjY1?=
 =?utf-8?B?TXhibUVvNlo4Tzc0R2t5WmJIL251dDFOMnlzemNlMzcvK2ZCZ21HTlhvTjB5?=
 =?utf-8?B?bnRuUkdmY2JYSjlhQ05CRU5HSXlWN0xtb1hDOHV3SmRrdXI5bEJnOXkwZ0V2?=
 =?utf-8?B?NGhCR0VmZDl3emwzRzZUNjVKc2lJaVh4S2w4SGswbmpZdlVBRkprRnVFQlVE?=
 =?utf-8?Q?D1Ij9VaH6/NRHBnAZBCHZ/2ujLp/0SsNJi1NLo7?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d44cb8cd-4d00-4e14-95b5-08ddc3ce17f1
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 18:33:29.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7555



On 14/07/25 5:00 am, Qasim Ijaz wrote:
> A malicious HID device with quirk APPLE_MAGIC_BACKLIGHT can trigger a NULL
> pointer dereference whilst the power feature-report is toggled and sent to
> the device in apple_magic_backlight_report_set(). The power feature-report
> is expected to have two data fields, but if the descriptor declares one
> field then accessing field[1] and dereferencing it in
> apple_magic_backlight_report_set() becomes invalid
> since field[1] will be NULL.
> 
> An example of a minimal descriptor which can cause the crash is something
> like the following where the report with ID 3 (power report) only
> references a single 1-byte field. When hid core parses the descriptor it
> will encounter the final feature tag, allocate a hid_report (all members
> of field[] will be zeroed out), create field structure and populate it,
> increasing the maxfield to 1. The subsequent field[1] access and
> dereference causes the crash.
> 
>   Usage Page (Vendor Defined 0xFF00)
>   Usage (0x0F)
>   Collection (Application)
>     Report ID (1)
>     Usage (0x01)
>     Logical Minimum (0)
>     Logical Maximum (255)
>     Report Size (8)
>     Report Count (1)
>     Feature (Data,Var,Abs)
> 
>     Usage (0x02)
>     Logical Maximum (32767)
>     Report Size (16)
>     Report Count (1)
>     Feature (Data,Var,Abs)
> 
>     Report ID (3)
>     Usage (0x03)
>     Logical Minimum (0)
>     Logical Maximum (1)
>     Report Size (8)
>     Report Count (1)
>     Feature (Data,Var,Abs)
>   End Collection
> 
> Here we see the KASAN splat when the kernel dereferences the
> NULL pointer and crashes:
> 
>   [   15.164723] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
>   [   15.165691] KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
>   [   15.165691] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0 #31 PREEMPT(voluntary) 
>   [   15.165691] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>   [   15.165691] RIP: 0010:apple_magic_backlight_report_set+0xbf/0x210
>   [   15.165691] Call Trace:
>   [   15.165691]  <TASK>
>   [   15.165691]  apple_probe+0x571/0xa20
>   [   15.165691]  hid_device_probe+0x2e2/0x6f0
>   [   15.165691]  really_probe+0x1ca/0x5c0
>   [   15.165691]  __driver_probe_device+0x24f/0x310
>   [   15.165691]  driver_probe_device+0x4a/0xd0
>   [   15.165691]  __device_attach_driver+0x169/0x220
>   [   15.165691]  bus_for_each_drv+0x118/0x1b0
>   [   15.165691]  __device_attach+0x1d5/0x380
>   [   15.165691]  device_initial_probe+0x12/0x20
>   [   15.165691]  bus_probe_device+0x13d/0x180
>   [   15.165691]  device_add+0xd87/0x1510
>   [...]
> 
> To fix this issue we should validate the number of fields that the
> backlight and power reports have and if they do not have the required
> number of fields then bail.
> 
> Fixes: 394ba612f941 ("HID: apple: Add support for magic keyboard backlight on T2 Macs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---

Tested-by: Aditya Garg <gargaditya08@live.com>


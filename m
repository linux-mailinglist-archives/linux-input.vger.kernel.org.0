Return-Path: <linux-input+bounces-13009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAFAE6618
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 15:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478D54C31B0
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 13:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35DB29A31D;
	Tue, 24 Jun 2025 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MGViB/iV"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011038.outbound.protection.outlook.com [52.103.68.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8A327BF85;
	Tue, 24 Jun 2025 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770727; cv=fail; b=Dq9fc0mwgsyOaf4nYQjM5QNKaOCXRBi89LzXUY2PdIbKGhJlz/RQg+QWX5H21XIuzvYyGwl6qoKoJr53YVpiYSmyX5m7V+bh6oK4mb3YIM6WG0+IMBcNT0ISQPtW8qgBZdmQg49+z3rS8BJNNq9LRfkXobPiFhKdTW9DMMbTJas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770727; c=relaxed/simple;
	bh=cGJAY/wioPhfow82sP0gq+wPGIBu8JxVu7g5QijxkDI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MMRtc+l0VByry6nuDI2KWfEzHk4S9uw0mbc/W+9BNcU/rE9qnR0tZxUAPlYTb41gXnQimKwcJRZ4Pk7S8XO2OlhD5SpSolDDsKz7XZ8o7m5AAjnGMoSvhBzmPu9JbxnHoA1Ki/lJiZnz290C67UKltTSB1gSX1zSfhqeri9LidI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MGViB/iV; arc=fail smtp.client-ip=52.103.68.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAn0iD4q159UPWgh3o/XyMc0UqbrNQ8jrEJoQ6NvSM9g1an70znyW10MQ224HF7rS4erw/GAe6aG3QlG8nGZdqkVybcmZHKF36TC53Q/tcU9tpBc6ZwVAEf8vgoKfTj9A4wsTkKpPVFZf7lN4V452ANQo6KmLhlLzgvKTC8B3mJJ1zyX8cPFcoSlbL1kwYoJepYCFYDgrF+hd/zkwSzex9MMAZWkz8rbp7xghbl3ZZ/Jkk2z4t3pU8ZKlzxrM/Jx10HHWaZTrxvxzD0m7opBESxpOBFeo1mMIMOgn3F74JTxCQClVFM8jqzAElNzTRnJ2qu89TgUbA+BbD5aYh5wlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1GD0zmIerp6/ciwmFhJWzWf6iem0rKk0xgj/MWHhWA=;
 b=Wl8hmpKl9EqKrtEe041WGJ+PQDpNmCefQKveBdvmkhOYc1P6i318U90PhQl0+NQa1g5wHd7qkp78BtYoz9kzXZ3OZ4UsvT0LTIVlrpTOKI357wH0RxcLa3QMpJeAjrbwiGg8aiZMvmynB95U8TM/uQKJnAXusAQcKXdIp2Mq5qMRH5VqUzxCnjqz+rXdHAl5qkXIuZ8naz1R66offxTPOIZp0MesecrSzfkaA2DGZHX3x3a9hCEXqXSFXPffMzQc3/wk1HeBdJzKZEsbBxEF2gF66+FcDwvjpqofK8OI/OWA3z878aNTf1AFAXUjk8kC9w7/DeXG8g3G/gNcXsfxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1GD0zmIerp6/ciwmFhJWzWf6iem0rKk0xgj/MWHhWA=;
 b=MGViB/iVJoyhcWWkkvFto4oRohqLGmtI6A2M8AAR4aGhP0iQ5X6aX5iHY38vYnOQhm6v3BRjWbVQ3nSKXMbBAbE7BkymX6UynQgFwGu50wHHr/PtozHY9teRYGvtTw8ngVQMo9uVSS05vgjKW7q98tJsJOydJ0fr/+XhApo1vjGoadsnWjxlYev0v03jBOglxG5UIJIlv9jxHMGLbKrfn9sUy88R/FK182IA5krjQIzHu+QHzNLeA9UM5wtl9IX9pWJqLTxqUcaypMHTLILx8uVvuWLBtrjtpIRnbhvVdfRQlxQjeG7QNEo4rAeXPYXIOjG8b61ePjZVAvJcp8P90g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB9595.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 13:12:00 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:12:00 +0000
Message-ID:
 <PN3PR01MB95971AF4986E61E0A5A29DC7B878A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 24 Jun 2025 18:41:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: appletb-kbd: fix slab use-after-free bug in
 appletb_kbd_probe
To: Qasim Ijaz <qasdev00@gmail.com>, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250624125256.20473-1-qasdev00@gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <20250624125256.20473-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <19a7e9a6-13d4-45ec-8c57-600e3a83f60c@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e709d3-1dce-4c7a-e5d3-08ddb320b426
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|461199028|5072599009|6090799003|7092599006|15080799009|19110799006|11031999003|52005399003|3412199025|440099028|40105399003|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVVxSys1dFkyZG00c3p3Zy9qdTluM3N5bDhRMkNpcTVzNHIzTmhNWTY4ZU1P?=
 =?utf-8?B?YXpwS3VBaW9JTEoyTytxc2cyWHVTb3EvSnlDK0twZmZiUWZxZ2hIaU9EZlAx?=
 =?utf-8?B?RytFV1FsN2JwMm0yazAwNWJkbEVjU0U1MkxSWmQ4aG1OWjJROXU0RFp2Vjl1?=
 =?utf-8?B?ZDVaeUsydlhVa05aL0xveHZqT1Fid0FpamJYdUJ5SUxCaUtQeS82WVNucGN4?=
 =?utf-8?B?VXBSRlpsSUVwU2haQndxOElKT01xYkFzMmRmVDRNYWc3dTZidys4NzlJU2JS?=
 =?utf-8?B?VUYyOFdWblVhZzFpM1NZaGdTc0FMUXZ2RjR0dHNpTVh2UEl0dnQ2M2taTUky?=
 =?utf-8?B?Y2lkRkxCUDVTTE9BbktXazByTnovdkNaanJRTWd2Q3N5VCthcTNsQ2plUUlQ?=
 =?utf-8?B?Z0l4MEI1V1QyVFVEdDdRMGlURkN3MjNuKzk5dzR2MUZneDJTOXZnMmxHR0Nk?=
 =?utf-8?B?aTc3NFdEVkVhaUd5Mjh6WXBkTzNneEZwemtFamZ1UlE3WXpVNzNQKzJzVSsy?=
 =?utf-8?B?NUI0QmZEcS8yMW9DMnVoZmxKMHhvZ3c0YTZJc0I1ZDZVQlBSVWxZbC8xOTBX?=
 =?utf-8?B?V21POWQzZHpGMGltYm5BK0pUaEF2OVovL0E4MmUzeGN1eTBMNU1jdVA0Vkdo?=
 =?utf-8?B?ZmhKOFRrWGZpbU5VNWJWU25KVThnL1JqNXhDdFBTQWdmVXZIUjgwSDRvV2oy?=
 =?utf-8?B?WkdnMmpoV3IvY25hT29LVHFyaEgxWkVXU0xOOWEvb0x1UVlDbHY2cXVUZEhh?=
 =?utf-8?B?YzdidjRpVStBek9sMCtkaXBOOEN1dlNYTUR4dmxrMHczN2pib1NrK1o2RzJq?=
 =?utf-8?B?ZHpiMVg4SFM0cEVDei9NWTJYaFREcDgrNUtjMDNkaTdReEFHL1NuNEUrc2pI?=
 =?utf-8?B?ZU5hQVJ1RGk4SndCTGgxTEVoMjRtVkpGbFRZQVcwOVBpYmlDa2NLTFlmTVYx?=
 =?utf-8?B?RmwwbVEvUS8vOVh3S2FWN1VmanRVL3h3TmcwczdRYTVZTTFNQkwyMFA0R21L?=
 =?utf-8?B?TlZZVVJPM0x4eE0vUXdKS05ON0p4WGNpMC9nNWgrY2V3QnkvOHd2ZWg1NWNC?=
 =?utf-8?B?Zmtsb3dqWm10REtyQXpEOHg1cGh5ck5TR2tpZFdnQ3Y3c2NyTksrL1lBa1BB?=
 =?utf-8?B?aitlSGw0SC9ML2N1M2pKTERsUndEU1RURTFJeFd6MHdBaTdrL1dXWlhDTlNk?=
 =?utf-8?B?Qk9DTVQwOUhjV3JGb2ZtanpxTEthUHNzbTBBSFJMRnh4R3RkWU9oUDVJMTBp?=
 =?utf-8?B?cWwxZkdFRDlUNkg3bG1rMzNISG9uN21jeVFZY2kvenhLbDR2blZtUjFQbE9C?=
 =?utf-8?B?anVSekFwWTZpejFmQ2p1U3daankwOGoxVE1qZVZZOU5FUENXUE53UHZsZFR2?=
 =?utf-8?B?SVFkQWhoUWg5VjBXOGIvdU9lZDZvTFpmQitjZXRrYTU0Q1JZd3VqSFdXVGpO?=
 =?utf-8?B?OWNwY2FNSDErSGxJeU1jT29RVERnb096emRTWUNuVmZiZWVoVnFGOXNCMzY4?=
 =?utf-8?B?UzBEOGxYSUR3RW54eWpRYkpCK2JoUTQwdEMxN0pHaS9GMWFuQlgvMXZ5Q2FK?=
 =?utf-8?B?ZjZDaUJOZVNlMnNOTUFrZ3JZVFRld0ZSQjYreG1kNlpTWTkycTY3YU9RblRD?=
 =?utf-8?B?RjVtMUZQOGNiekhDUG4xZkdEVmtkdUhlcFJTb3dGcWY4N3Zac1p1TURZVjBE?=
 =?utf-8?B?MjJNUzAvdjQwb0xRUnAvd05mN2VXWnlhdTZRMWZ1eUxDZFoyUCt3UFBRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHhoeVFIMkVqZW1WeHBCYVVBczhIQWdVVnI2R2hsSWpTa0p2b1FTTGtzSG5i?=
 =?utf-8?B?Nlpua2ZrdWE2RU1Uakh5S2p2b1JJelZUSkpSS1J4dUdtTTBsK0hidkd1c0J0?=
 =?utf-8?B?eVpud2lkNjcwQUhIZDAyTnR4WDVqZ21lcGZSckFEaGlwaU1nQ3Yvc2ZmK2Ny?=
 =?utf-8?B?M0N6ajYzTUkxQnJubE9OaWZWaTZGTDloay90cVkzL1BsWk9Odjk0ckpkVk81?=
 =?utf-8?B?VzdQOUg0S2k2SEhycytFV1lVQk1LalQrMGp4M0xUOUxxTjFCV21aR0RqdUs1?=
 =?utf-8?B?dlNUNXRzOTRKR2hoVDFkQW16VlpJL0E4TWV5cncxZk1TdVlRZTlhS05RbytB?=
 =?utf-8?B?QzBBVXM5WnBTQ25vMXpVOFVwYTI4QjdvNFp4UGNRN08yK0J5TDE0cU5zQzRm?=
 =?utf-8?B?N05yMDJKWjIvZEhDMEdVSEtQaUVxNUNaV2JUejNZalhSS1VReGh4b29seDVw?=
 =?utf-8?B?REhydWVEakVxaWdnYjhpMTR3TXY4UTNWUzZibmZkV2llRXpuRk4xeGVkRnVB?=
 =?utf-8?B?K3B3bURudVNoVTE3Q29rbHhFUWlOeXd2YTRBdWlwdTZjTWJTNTFpU2JyWXI0?=
 =?utf-8?B?STBlRWRtakFBTEtKdVprZUFjMlplcklHVzh2N3VZU1VFaDZOSk9xNk83N1ZU?=
 =?utf-8?B?MVFIaVM2Q3NqZkpUclFjYnpYQlV2ZnNUOGdjbndIYTdQcUlFeTc4WVF1MUxt?=
 =?utf-8?B?QWtWT3NmT0w5RnZUUURuaHhVZDRnNjR1elpjNm5CNGpCSEdtM3AxckJxeU1t?=
 =?utf-8?B?cUdHdlpiRk93aFJrZjQ3a3BNdEpoRWQ2WHN1OWNPL1MzNmRYRFRrYlpkUGli?=
 =?utf-8?B?YU93YzR5ekJoczV3d2VkbU4yN2k3ZVBMUWJCQWdWZm5ZQzY3aGx6TzhqczZU?=
 =?utf-8?B?bnZLdFBtbDQyNkNadzBuV3V1MHJSTXQ1MkZHWlA0QUZSMi95Mm9vZW9VRUgx?=
 =?utf-8?B?V1JNdzR2djY2c3AyMnV0WDJTM2tYMDFtUnZoeER0dWMxbUt4RVFzYWh6Rmk5?=
 =?utf-8?B?Z0xqSHIrVE9WejlWZ2s3clc3azE1OTgvUG1QM0k3U1ZlRG5pRDJrbW5jUFJL?=
 =?utf-8?B?b1FTdE9KWGtPMHhNLy9TYWJNTWdyNW5mMkN5Y0tMYUd0TzFUMUM5a2k5V0Nx?=
 =?utf-8?B?VzVjdlFrUUt3UFQzelo5dEZjbjB3QkdjdVVqWlVrT0pBUC9iWVkxYUhZdUlD?=
 =?utf-8?B?eFpVUWFCNHpZeEt6V3E4ZXFmNlNIb3g2MXV3NzZCRnNWVkFDNG5ya3FVbE92?=
 =?utf-8?B?TXljb1dVc2tQdHQ5RW1sOXR5ejFyZ1NtSmJJZ0Q4eDZtUzlRVUpFdXNXQXh2?=
 =?utf-8?B?TktBVEwzQU9Ja0lRQjZOTWZYWlpsYXF5eVh6eVJFemN2OVpPelF6OEd5UG5x?=
 =?utf-8?B?RGE4aTNqb1dkamFLMzU3eHhtRmFXeFo0elVTWFh6emd0VExaZGxjSWQ5d3RV?=
 =?utf-8?B?UTVESEE4a1RqZTRtR2lBcm9mU2w4bGdiTllZeVdXWHBhQU1WZXR5VHNmSnQw?=
 =?utf-8?B?MGE2RGxIVmxYMWpYY1I3a1ZtZm90WjdyWEgyZnI5Z25ZOGRMU3Z5WTJHTzdK?=
 =?utf-8?B?YVRCK3RHOWVVWXFseDlnbHZwWG8rN2p2RFJGSExQckpHaElxV1hjdjlzc2lF?=
 =?utf-8?B?L2IyRWRldEdDNm1YL2k5dXpsWHFUMS9BMks5Tlpta3QrUVBNUCtDQ3pqMTRK?=
 =?utf-8?B?R1N2WlNXVDhzZGYydlVwQW9pMWxSN0EyZXdyOFdnT3g3QkQyUmpSbVFacE5Z?=
 =?utf-8?Q?+Gj4pT2G5u9xesHMRQnxrFyIyzNwf61JfVFfgEY?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e709d3-1dce-4c7a-e5d3-08ddb320b426
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:12:00.3417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9595



On 24/06/25 6:22 pm, Qasim Ijaz wrote:
> In probe appletb_kbd_probe() a "struct appletb_kbd *kbd" is allocated
> via devm_kzalloc() to store touch bar keyboard related data.
> Later on if backlight_device_get_by_name() finds a backlight device
> with name "appletb_backlight" a timer (kbd->inactivity_timer) is setup
> with appletb_inactivity_timer() and the timer is armed to run after
> appletb_tb_dim_timeout (60) seconds.
> 
> A use-after-free is triggered when failure occurs after the timer is
> armed. This ultimately means probe failure occurs and as a result the
> "struct appletb_kbd *kbd" which is device managed memory is freed.
> After 60 seconds the timer will have expired and __run_timers will
> attempt to access the timer (kbd->inactivity_timer) however the kdb
> structure has been freed causing a use-after free.
> 
> [   71.636938] ==================================================================
> [   71.637915] BUG: KASAN: slab-use-after-free in __run_timers+0x7ad/0x890
> [   71.637915] Write of size 8 at addr ffff8881178c5958 by task swapper/1/0
> [   71.637915] 
> [   71.637915] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.16.0-rc2-00318-g739a6c93cc75-dirty #12 PREEMPT(voluntary) 
> [   71.637915] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   71.637915] Call Trace:
> [   71.637915]  <IRQ>
> [   71.637915]  dump_stack_lvl+0x53/0x70
> [   71.637915]  print_report+0xce/0x670
> [   71.637915]  ? __run_timers+0x7ad/0x890
> [   71.637915]  kasan_report+0xce/0x100
> [   71.637915]  ? __run_timers+0x7ad/0x890
> [   71.637915]  __run_timers+0x7ad/0x890
> [   71.637915]  ? __pfx___run_timers+0x10/0x10
> [   71.637915]  ? update_process_times+0xfc/0x190
> [   71.637915]  ? __pfx_update_process_times+0x10/0x10
> [   71.637915]  ? _raw_spin_lock_irq+0x80/0xe0
> [   71.637915]  ? _raw_spin_lock_irq+0x80/0xe0
> [   71.637915]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [   71.637915]  run_timer_softirq+0x141/0x240
> [   71.637915]  ? __pfx_run_timer_softirq+0x10/0x10
> [   71.637915]  ? __pfx___hrtimer_run_queues+0x10/0x10
> [   71.637915]  ? kvm_clock_get_cycles+0x18/0x30
> [   71.637915]  ? ktime_get+0x60/0x140
> [   71.637915]  handle_softirqs+0x1b8/0x5c0
> [   71.637915]  ? __pfx_handle_softirqs+0x10/0x10
> [   71.637915]  irq_exit_rcu+0xaf/0xe0
> [   71.637915]  sysvec_apic_timer_interrupt+0x6c/0x80
> [   71.637915]  </IRQ>
> [   71.637915] 
> [   71.637915] Allocated by task 39:
> [   71.637915]  kasan_save_stack+0x33/0x60
> [   71.637915]  kasan_save_track+0x14/0x30
> [   71.637915]  __kasan_kmalloc+0x8f/0xa0
> [   71.637915]  __kmalloc_node_track_caller_noprof+0x195/0x420
> [   71.637915]  devm_kmalloc+0x74/0x1e0
> [   71.637915]  appletb_kbd_probe+0x37/0x3c0
> [   71.637915]  hid_device_probe+0x2d1/0x680
> [   71.637915]  really_probe+0x1c3/0x690
> [   71.637915]  __driver_probe_device+0x247/0x300
> [   71.637915]  driver_probe_device+0x49/0x210
> [...]
> [   71.637915] 
> [   71.637915] Freed by task 39:
> [   71.637915]  kasan_save_stack+0x33/0x60
> [   71.637915]  kasan_save_track+0x14/0x30
> [   71.637915]  kasan_save_free_info+0x3b/0x60
> [   71.637915]  __kasan_slab_free+0x37/0x50
> [   71.637915]  kfree+0xcf/0x360
> [   71.637915]  devres_release_group+0x1f8/0x3c0
> [   71.637915]  hid_device_probe+0x315/0x680
> [   71.637915]  really_probe+0x1c3/0x690
> [   71.637915]  __driver_probe_device+0x247/0x300
> [   71.637915]  driver_probe_device+0x49/0x210
> [...]
> 
> The root cause of the issue is that the timer is not disarmed
> on failure paths leading to it remaining active and accessing
> freed memory. To fix this call timer_delete_sync() to deactivate
> the timer.
> 
> Another small issue is that timer_delete_sync is called
> unconditionally in appletb_kbd_remove(), fix this by checking
> for a valid kbd->backlight_dev before calling timer_delete_sync.
> 
> Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Reviewed-by: Aditya Garg <gargaditya08@live.com>

> ---
> v2:
> - Add backlight check in remove() since we don't want to unconditionally call timer_delete_sync
> 
>  drivers/hid/hid-appletb-kbd.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 



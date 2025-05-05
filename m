Return-Path: <linux-input+bounces-12143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1466AA8C80
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 08:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 620E97A4FA1
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 06:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76771C2335;
	Mon,  5 May 2025 06:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="oZ3lWA/M"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010013.outbound.protection.outlook.com [52.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C2D1B85CC
	for <linux-input@vger.kernel.org>; Mon,  5 May 2025 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428065; cv=fail; b=KIzdUEC5faCyoZJcOFdzz8x99EZgMYjOWZB0jiroUK4i1pPtudEFJxF2iZl5NR/27q0pnENUGrZ75w/YcnjAQBxiH5Txgk85rTRL7VxkiMA3tNFi2AHFmdMhfdDZ3FFggavKx8tGgjJp6SfIFeRt/IONyeTSENa9EiXFrc3hrN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428065; c=relaxed/simple;
	bh=fnwVx+ug2JnHi1abRzkbUXOTBzQ0HpvbYKTluuinCU0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eN97zZyU7WOFSw9vg2/YA54Fn/6utJb58g/vA9jW+eHfjI1rHXXKJymsuD2u4hCG8qrpM8ItRlXU/ko/b0R7HupusofB324Qwqwx0w+FKpdz3kXxsLBW8+B/9lx7e7sHlmXn9HFf3FPb15F4ESivu6xfjDajy6a7P98xGWeUWOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=oZ3lWA/M; arc=fail smtp.client-ip=52.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXMLZfX/mhVaxgevhnbAwETAOGenmE43CaGNBps6qvkJicKKhAvYR8t+PHmNH6OvfZCckiungHcjp4LDI5cXThnLUsimVERDIHZzpR/brhif3jkU8FcK47h9e2by5Rr8Z65rIiqF10yjSUJ/fG69PMNmwVQIbtp2QRs7+/oTaehTNFXK/1wFnz+ySH3S1AlkKPZbF7BzAde1jRXJmbim6OeEh3sr0OoXUjIyjR+WFJvisdUFYEA6C8fruOzhjnTzcX/QkNVSgQ96TqONmqXmbyZWwCVbazLNzZese9JwNoOnsSoVnzR2rKuHEDRmHj6AkxNYmgbVEsQutssnSh5HZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APapJof53Po+Z9jpEgt7tDwT4oxDe0AqWf9pN7Z1nsw=;
 b=p8VtosdzIR5HfONiYOj5PNFmGbdE0+ME/nUw/xQYyFPltUpERiRvZmU1uyWZL+MBZkl1DRlq5J1vDt9OohLyPPce8KPaeYwbyRsp+JCBNQYIQaqjHnzx/XF994uoZS3R/0PbLKS9KAK2mitdZMKv0mLFBnN1kypb5gnVEDazO2JzpqFOrWMI5rvM3QTX65xAAWniUY09LuUNQTOTtPuwAoc+lJR3CBiuZr3gKyOUvN8CQzz6k1xt5MEwANPz6anEcVggWszG7u4WHJYG3hChwXo++O9wqby3uhr/KFTeBfG3SGF5ZDWl6pFKhoF7b/ixxxKqin7T6a3wGQdZg3uj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APapJof53Po+Z9jpEgt7tDwT4oxDe0AqWf9pN7Z1nsw=;
 b=oZ3lWA/MYT3gjKLaJZ8wOjJYOSjiLNuF41JySLi2E7W+WUUS3Bplz0nKfhBj/9WkT/oSbz/BKvNqQBphOP7ruCfsCnb6uih11f0fwXPgt03xfpGF08s+0ISE7seXvHI3q6Uv/j6iU/OUftsNGqpLmOxq0U1JfNYJs6DDscHi6QZHShKrckwnUv76DoXH4nGHQLHlNyFrJ/0gcziXWBCsXr+lalhKeIO1DbYUucQcmfgeGVNBBBW6KM2ixVjJdmVYxp0IriC7RP1GOvWBn5b7OZ7BVa6vriRmUh+V23niNGwhymObi/j8VVT8Uw7weHyXJKVR2Ieuf65+WN6LhNvAgw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PPF583FE092D.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 06:54:20 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 06:54:20 +0000
Message-ID:
 <PN3PR01MB9597C95C0A48ABDA83C9A5B1B88E2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 5 May 2025 12:24:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Touchpad (PNP: TOS01f6 PNP0f13) not working under PS/2,
 requires psmouse.synaptics_intertouch=1 to function via SMBus
To: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com>
 <5AD8B559-C74D-4CA2-8145-7CEADA09AD36@live.com>
 <16b1cebd-5c21-49f5-9115-d02323fac238@gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <16b1cebd-5c21-49f5-9115-d02323fac238@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0061.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::10) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <07e9f3ff-8416-4aa6-8de2-e0d154d2af31@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PPF583FE092D:EE_
X-MS-Office365-Filtering-Correlation-Id: cab204e7-02cf-4d82-1427-08dd8ba1a916
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHzgPFTkOkKHOaNyTn4nQw67cL7AeG1Nu15Qjo7A2idNf3mBh/79N5K0xq4eYSdK70viFPwCwXTwXIkXi6xMwvojojmncNHwoG30Iu8WlarrqgRnmEalwDjIV0cgaR63mvlFTAID6PgJYbDEJu3QPAwT9juymVIjOIaVXVewHCZdDgwUlBWqyE9ZSmEis+FP0Iwh+oqmeBGSqbE8HzNkcFzNVn20SLr5Uvb+ocCpQOzEE3FjrI09DJlnNdCKY8uD58AnqYO5s0ULXs/nYFPrpCrW64EnblppXxMsYQnJBBF2sGaumVpg+va+KS3oMXHa6V4OQrHjpCBAq69HS+reRyGIbPm0IFVdU/GKJOivLJ4LWyS0Y4kR06Fi1+sbeKG1+ux/OwAvANzEO4HXZYWZlfwhP/a6ZaKV/B01ds8OUsvlEmndWgYjojJt3Xz/XaJ3ZQkgJpu4yOx9jBOAL+6cVc5Ewa2Xy9iHU40VgnR0JjroziE4WTGzhWSbAu3477xgvRu0S6y2cOKh7QX5N+YuVd+9SqPcHrIugdyYA5CS0KpEosL+NXCU6RHzIfIBkz6vwzuaxz1wxXEO9HSfvUVpwHZdOXavwmaOpnu6trR5k9sxqL4/OPqZM18oWufrSQpi0PioNRw6hv4KQbJHRi82r7VCE76pFWUhhGe9u8OeR1YyFQ2tRM/IdrwSgnMtIblId2g8upYsMx5ejqUoI956C7rzTFqGuMHT1w=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799006|7092599003|8060799006|19110799003|6090799003|461199028|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXJRK1FyWW5TM2xrZy93dzBsb0s3b3Q1dUNicUtWTzZDdVVJTTE5clRDeG5Z?=
 =?utf-8?B?dGNxc0VzQnVvbGxPY01mRUk3TVFZNTVnWFNNb1BDYnI0VTRIbTRFQXBJWmFM?=
 =?utf-8?B?Q0lZOWcyYldDRW5IMkdOYVRBcUU0YVZoWlhKWC83NGlUQitWQmJXRzdwa3Nh?=
 =?utf-8?B?b05XRnNHSkxZQ0Rqam1rOGhIZWVDdFFTSGZJRWltNGdJVXFpY2JBNWEzSzVU?=
 =?utf-8?B?MlhMTnBEZUd4eDY1TWhhUi9TaUxzS1Z1K3dHUXp3RUo4MU1obFNDd2RSOVRI?=
 =?utf-8?B?TDB3VjRMOHd3R2R3QWE2d0JHMnUxZzZHcjFxelh5UnVvV2wydkpZTFAzeC82?=
 =?utf-8?B?QjJ5MzVSaE5zbitiZjh1L2Z5TkZKaytxazNMTnExVy84YWpZSElRWEhMNU1h?=
 =?utf-8?B?d3RMbm1KbldYU0ExaVF1c2s2dnF3RFlKTmZxSHMrV0RrRVJLY2RBS1pYTXZR?=
 =?utf-8?B?blhJSVFTMS9Fa0Q2Y2x2ZUZmR0ZuWWdoT2dmRGhiZXI3b0NieHRRYjc4bmRU?=
 =?utf-8?B?aTNRQXZzd2x3TGZzd2NCV1k3clBDWjRBK1I2eTBPVVN4ZUJPOWRnNFFqUEpH?=
 =?utf-8?B?UnBZQ1FjWlhhMkN6aVVFMldYUFZXVXdrWHJNeFhVcTlLOXBDMGZxanEzNDlj?=
 =?utf-8?B?WmtIa0JPM1pvUzFWMlpTL2M5ZkdBVjJDd3QyMXJMS0JTalh2MCs0SjVIUHJa?=
 =?utf-8?B?VmFnQlpaMkdCS2JNYjg2YURCbGdiazRBcHdjWURwQlZNUWxGWWFPTS9CNWl2?=
 =?utf-8?B?elBkT3M5L1EzYmVYSCtsMStBdEdEUUtsbllyZXh0QXVzTkgxYXpQRDdMYVUy?=
 =?utf-8?B?QXRKb3lwZCtRSkdWNGViaVc5T0NQdGJ5Z0pObWVzbmt0SXJoc1VXbnlTS2ZX?=
 =?utf-8?B?bE9HaEJNeTQzTm03SDN2eHdLL0VlUmtpeWZmbXkwVmtPVDVVYnZ2ZUZxVVYv?=
 =?utf-8?B?dWpWVHFGZ1BTWDhoeldGNy9jSWtGTnZ0SElESmE2VldTQkhpTVFtNXNBd2hK?=
 =?utf-8?B?V1RETGZlLzh6Q1R2eE45a043K2srQXhPd3NGZEtLM0pISERlNVlTZ0dBVm9R?=
 =?utf-8?B?UXNWblpFd2VzMGoyT0NpaTByRk1LM2NtYktFbGJVWEpkYmhaOE82MHN6Wldp?=
 =?utf-8?B?OFQ2bVZqenlXclAzK2pGaUNMOXdSckU0QUxCcExxaVIyQ3dIUjMvdlpOekx0?=
 =?utf-8?B?NU1KMlJ1emZ3Q3FETDJtZzJTNkdzTGlvVkd0LzBmRVFQRlRLV09PQWVvU004?=
 =?utf-8?B?S0xnbDIwQ016ZGZycEVuRm1sZGxSbElpUGtnLy9sSUkrQWMvdmdJUVQ1azR6?=
 =?utf-8?B?M0hxNDA1M1UvZklZWENIZzM1aHkxWStoTFNFSDlReGkvWk5uS0dXNUtWdTRn?=
 =?utf-8?B?dGNuRzg0eWtRT2R3cytHUXZQOXNmSVRzNVN4dDR3a1RZSkJxVzAyS202ajcx?=
 =?utf-8?B?RFNKaTk1WkM1a1NSTjltVGNVOW1LK3dEQ3VCZEFxVHZkd1ZRVkFvU3gzYW00?=
 =?utf-8?B?dGtXQXc1d1hqaXFDOCtPNktPMkc0eE5ibHBkRVpCbmd2ZXp6QU8yNXdLbTFG?=
 =?utf-8?Q?A2ckZQlhKELWDmQEA3sUIjxY4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU9FK0ZQenFkZGI4VmFUdkkxYVd3dEI3OU4zOUZVNVRMQjFsaDA5SEJLYnFs?=
 =?utf-8?B?MHpxTTducUNnUzBLVnV3WGdPcEtZbnNYdjduZmhWZnh0S25PRE54amhscjFS?=
 =?utf-8?B?UzR4N01WN09mdjVxTkMxTDhKU3JYcWZodXhaNkl4VXBaRm9MTUtXZzllQjZ2?=
 =?utf-8?B?c0J5NVd1SFBNMzROZXAzSC91NVQ5cHlVVWtIQXQ1M3dPVWRaVUdmWTdtWDFn?=
 =?utf-8?B?T25CYk5RSXpoWjBXWGZEa29RdytBYjdSMTMxUmF3V2JXT1l3UThBdDRzenJu?=
 =?utf-8?B?ekdEb2xsU3Z6OUhiRVh5RkdlTUpUYkxLalJyMlE3K2Y3T24vdVJPVmt3SXg2?=
 =?utf-8?B?RVpVRzNSa29IYks4aW1OWGxabkZ6RTlzOFlCMU5qaGxnZVFpZ2NpWEMrbFp6?=
 =?utf-8?B?Q2ltd1Bud1lYc2hWcmp4YXJsak9Ed2NVWVdKVnpRSmRaZ1JPOURna0p4Z1ZE?=
 =?utf-8?B?cE1lNWtlRFhqaWQxakNtQ0tWQXVTVEpQNGh2aUR6TnNNU0lIWkhjWTVCbTVr?=
 =?utf-8?B?dmZ4K0xnTmJ6T2RRYnJxVlRqRzdNVlJXSHc4eVQ1cUtwek1YcGkyeUk3OEh0?=
 =?utf-8?B?ZTVnc0d2d1JZbDE2TlMzNWJyYlRFd2tQV3lhcVZhZS9XbEtvM2ptMjZRSm95?=
 =?utf-8?B?L3d4cXVTWG5YT0VveGRJZ3ZNLy9nWUl6bG1zeXIycXdrV1JOcHZ4dThuelYw?=
 =?utf-8?B?QzhwUnRzSUNlL09RNmNQVVVwQlA2WkExVDFCVk1Za2RLM3pkWlhTNEcreURO?=
 =?utf-8?B?YzZSSlhIRDFyandzeFN6MGZOakRPT2ZMSHJFSDhHTDBXZk0vN0dtcDRFUWtR?=
 =?utf-8?B?cDBUc2traWoxWXBwNTQ1MEZWMGxISE5ka0pUTVI4Szgza1lZSHJ1QlBFd0h6?=
 =?utf-8?B?dHBRY1Q5Wm8wUVB5T2VZY1BDLzVvNVBUTWdnMC80Mjh2VFRtZkFpY3ZyOUkv?=
 =?utf-8?B?VFF6Tnk3czZwTnVnbTl6bFlsNGM5eGk4bTBNMXNNKzc4UCtvcHNNRWNXMk1R?=
 =?utf-8?B?L1ByN3dSbURabHRQK3hQSEoySkdaVUVOcmxRSEIySndVRTlzWDNYVkxxZk12?=
 =?utf-8?B?Z2E0ZHFGMHcrR0t5SUdlenpkWE9yL1lrYmo5Slc5MWRyVHFwMUxvSGRZQmpZ?=
 =?utf-8?B?WVo0V3ZDajdxOSs5eCswQmptVlB5Y2MvVGYzYzBMQXlZMmZGSEhoZE1pS3Na?=
 =?utf-8?B?RWs2U1hLSmpHUHN6YTNtRnUxcFR0RmNDVGxvYUlNaWROdkZ0L0VUM2lZbFJk?=
 =?utf-8?B?T3lVZWZLNzhaSFFyOFBHb1kzaHk1dTdDY3RXeWo3NkhQMUZzbXZWaTd1TUF6?=
 =?utf-8?B?UlBaTnpDamJSMXpEVW1PbjZXVjhCVXFaVGdwWlhKVnh5azZZQVE0MzQ3YTVQ?=
 =?utf-8?B?TjJ1SFhvejZiK0l4YzJvczFWdHExTThhckphcHdOajRydFJDc1FFYktKYnJ5?=
 =?utf-8?B?Mm9rcmpyQkZmNlRXZWRhVmxtTEhSbkxJSzY0SVQvNnRBUDErOVF3Z1lHUmdN?=
 =?utf-8?B?eHdHSkFBR080Y0Z1ak9JVU1oQmpOa0ZSYWxMbDgrYVlEMmNGUHZDTmt4aUhw?=
 =?utf-8?B?Y1A1K1h0NnNpb2ppSDNyeS9tK0hTT3VpMWg0blc2SDhQditjUWsycXVJNUcx?=
 =?utf-8?B?UDVNekMvRWQ3Q3FlamtZaHFxZkJiM3NQWTA3U3JXMWJGMFUyd2ZrWC90c1Zk?=
 =?utf-8?B?a0JQUm9FTlg4RE0rOUhLamhFaDIvVFhTc25TbFBocFZZUnB1T1A0VG1UYlE1?=
 =?utf-8?Q?/GlFceFv62vSIwVrTuzfiI8ATvikBoZ9obvRofR?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cab204e7-02cf-4d82-1427-08dd8ba1a916
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 06:54:20.1626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF583FE092D



On 05/05/25 12:11 pm, Xuntao Chi wrote:
> Hi Aditya,
> 
> Thanks for looking into this and for the patch.
> 
> 
> On 5/4/25 14:40, Aditya Garg wrote:
>> For your device, can you please test this patch and see if it works?
> Yes, I can confirm the patch fixes the problem!
>> Also, please share your laptop’s model (Eg: HP Envy 13-ad105ng)
> It's a Dynabook Portege X30L-G.  (It might be marketed as Dynabook G83/FR in some regions).
>> If you want to be credited for your report when I submit a fix, please share your full legal name and email as well.
> 
> My name is Xuntao Chi, and my email address is chotaotao1qaz2wsx@gmail.com.


Thanks
I'll send the patch soon


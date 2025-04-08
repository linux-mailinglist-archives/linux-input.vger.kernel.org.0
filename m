Return-Path: <linux-input+bounces-11571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C2A8015A
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 13:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 322B97A0F37
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 11:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBB9207E14;
	Tue,  8 Apr 2025 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="kFCs+VS0"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011031.outbound.protection.outlook.com [52.103.68.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A11835973
	for <linux-input@vger.kernel.org>; Tue,  8 Apr 2025 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112187; cv=fail; b=cbDFhijK0veKu3wfphRYY2840OIBEnXIkek/da77U0Oi+H5gMbpvc4i0fiN7mNQqpzUWnGyI0Yefh3IrSqd5sowN1VlCdZlWc3GOzxip9JtOBf6snV2oBHymudeDdNbb4NWTo0vrIqlOKI4DO8pg4CndBxd3Id6u0J7FBpFb4VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112187; c=relaxed/simple;
	bh=T10SbtguFBWL+yGL6r6AFtrlhwoPJlJoqRx7Mpb+1mc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZzQPs72QPXFfqSSzyHYjrcLSvJ8pdFaYpDbR4Kfg3/KuHQNEcxmkON2U8Id9PiEkUG1TKSc/likFZcZ0XGWwE4w83KSQ8zq0Ih4ME5GSNHPaLmUc272hZeEYFOreeQydoz6bOw/6HVPx1WmAynNVuncJQFQnTimN5cA9E1OMUVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=kFCs+VS0; arc=fail smtp.client-ip=52.103.68.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW4zWHJibo25ks/lrvgBYfz5zBsFwPh8QZ2jIj0jR33adDPEgBHiW42h4l9X75/UhmRtkJ+kVKjk8Esrwf/KppQxQrPD/EbbMFcral8f1eYHSUR8HOJSMsjTVI639o9Wzi37MfwuO24krtUi8b4ypWgbRHrCaOBO0ZFtXq/7FH6sDq5oOMxd6M7RQCYwhS19bYTt/DBkmEhQ+Jl1dCnpwR2HMn/WgXvo6+Dj9q7SgnAgjhGLZ2TO5XLTxzGq9ZVZvtwNLsDBFjfHeUxkbHOdYrlrGJ9DJE/VBGmt98u/6H+qTdOOg3+2tKmZFJy1CH+GGbtJsMzKX7yv2NHvsnQwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3+HF0GC9gd2R0XWvfXBeL/2oDRc+QFVnB9Ag++7YWE=;
 b=yK+RNXnoaleb8PbYca4HDiZZ7MIrOu24+6c4YKzTGecm2FOrCmtLU87sk6DQxrwdL7lmq+UcOQ2EvPJu1UcxjyBn26lytR4uti7MI7Gw76KO7DeGAlNZ78vLEoktYfrAq0AABW1baqNGyCOwv73Y7o4WS9FfzeYgU39nP4mMO1/kg8mx5Y9QjWx5V9WyAORZWkeDVQUInQctMiEZ5cXjTl/8j8o8BgBcKOfNxnuBUIyE//KZHQ0ysdTKN15x09uPj4xVhaf9BIR1+VKYg/C+JysIZeSWBLQl8WbbyKIpEZsxGBsYppxPE4CI+p6cRQgCdfqXjaH68XPugn0oujqWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3+HF0GC9gd2R0XWvfXBeL/2oDRc+QFVnB9Ag++7YWE=;
 b=kFCs+VS0apjAcawgxkucaDACY/kSVxxy9Jbqe84ZDrrSuqkDciQZPLuVY7ZSUtNeM8XB49I5S3FH9PyMK7Yu4TKrlRPy0wdjaGY46pLVLHdcLz0WMp8Oykj9y56E/iJRQGdmfucyVUXlFnkbZb0gen6w4q5BluF1pdvoSu5GrAqK53hISh9qEsGVLif8mExPuxAxPGif1Wdo3istX9ZwUuslcrtW7FTyKn/3RQ/YEEK3WWHpM2Mq4FcXBhfO4MNMnP1BaXFy/q4IhHdNV6spgCiEKDzhCE86LecevXCqld9DtKg7oZkbw7vReczadjry8YjZXNzPB8iW5tc+Ctwu2A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB5748.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:67::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 11:36:21 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 11:36:21 +0000
Message-ID:
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 17:06:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
To: jt <enopatch@gmail.com>, linux-input@vger.kernel.org
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::13) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <8ec9ba92-edf4-40a9-ada4-3fc11c5bdd21@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: e817f9a8-16cc-4a65-a1cf-08dd769195d8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|6090799003|8060799006|7092599003|19110799003|461199028|5072599009|1602099012|440099028|4302099013|3412199025|10035399004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFNtS1RzMEhGVmc4b0dPNWVoMllUOHRvVXEreC9QVnFxZ0ZPajJOemZlM2Jh?=
 =?utf-8?B?RXNlejdTaHhINzJKenNOVWhyRHpVRjVjZHJZcnRRa0FyR2dMaTdKQXdmWGxF?=
 =?utf-8?B?VlRSajdvemJvUFJ3Y085cFREWFBTaC9rUVoxbmcvVFJ4YVFvVFF6U0VYYnNN?=
 =?utf-8?B?RVJFTWlRYWQ5SVlnQXF5SXhWOEY3bkE4NGEvRFV6R09DTnhGVXhqeFdPbjVJ?=
 =?utf-8?B?MzJYWU1LSks1aXdnQStoSHNUeitMNmpDdUZzTFVqcDJncnU2K0Ywa3RRMlg4?=
 =?utf-8?B?UjVTUUZjYU1mMkhYWTkxZUpaNjYzNXQwckNoVGNkN2c4OHA1U0NFTDZjM2RZ?=
 =?utf-8?B?L1dncTJpMU1keFZlR3kvR0ZrejFrMGpYa08yQ3RIeW5lNDVEaWY3ZFVGaldQ?=
 =?utf-8?B?c2lkR2Y1Y2t5M05ZYXpweU5IUUpJRFRqWk1JYS9kN3JWb2lTU0lnSHVuSVM0?=
 =?utf-8?B?ZWNrTFdMb0hIcFF6Mjd4WnlkUS9aTytCOXN4V1lDODhxNzY5Rkw4OGQwRlB0?=
 =?utf-8?B?K3ZxcUdNa2pPT3Z1WW1ybnlwSW9QR3BrSXhRemhZRU1UUC81cDJaSUUrOG92?=
 =?utf-8?B?WkVKeHM0NFVvMUdJbUtLYmVHMzhHVGg5b3JCVFZaWHFENnYrTW9BREdqVEhN?=
 =?utf-8?B?dnRWVlJCZUw5V0pDdm4zaklJaW5LSW00akZlNityMDVkUi9taDA4TjNKc3Rx?=
 =?utf-8?B?dXlwaC92VlZ2NzFpVHVqc3U1U2xoQU5vTGYzWTYyNFI4R1NNRUxDc3d1K051?=
 =?utf-8?B?TXI0eFF4a2VzNEFadWs3Y3FOZ0JaUXk1MVBTY2RGNDJuWkpXMUpQMHg4Rzlh?=
 =?utf-8?B?K2lGU0U5cFlteFg4dm93R1g1WGc2S00xYi9vT1UxcCt1bW5GR2NtVkc0aU8w?=
 =?utf-8?B?Uk1FRElPR2RySmRVWElQbjVIRkhCUWJ4TVpxcUtmNDB2V2dFeFNRend4ZWZw?=
 =?utf-8?B?blhvWjBlR3E0ZEFqc1JpN3lCQjc2K2E1Vjd0SHFhbjJ1QklneTRPZEFMc2s4?=
 =?utf-8?B?cGdFdFpsMVJpb1huY2xlWC9lTEpJSnBNSDg0TzhqZXFsNW1uaE5aUmxkUGZL?=
 =?utf-8?B?ZHF0c0xiMmhnL3hVYVFVSUdYYkZHRVlmQVpOZmxQWGlGbS91ZGlZMkgxNjR6?=
 =?utf-8?B?VU1xMzRKZFdyb2JQaTFIUW81ZElwaFJGUlVWQmU1ME5zRWZJU2x1TThON0dX?=
 =?utf-8?B?enE1dEYybzFPWGJmVEkyd1JYVVFCQ2NqTVJ1Um9tTTN1a0RlNmhKcG1FZG10?=
 =?utf-8?B?cG5Sck9vNE5pcWVta3liaUV1cmVlL1QyemVSaURCSjRieS9RbEhKMk9sSW0y?=
 =?utf-8?B?UFVqalRnUGZwQVJ0SDRua3VubE1GS0FnU2YyMVoyZDRWMjIxMUVXZklUMzRo?=
 =?utf-8?B?djlKTWVYQ1BTT2U0eFlEU3pJMHNhQk1JZkRFU3ltL2l6MVdBY2NWaXVRc1o2?=
 =?utf-8?B?OHlmRXdFYS9MRXh6cWY2NGt2UGJubGxibEw0N0Y2amcwSlhPSCtqTy96akR5?=
 =?utf-8?B?K3hPQk5KMFA4c1ZLRkp5SkJYTHlVV0hsaEZGbU8rZHRST2s4a0U0VEdKckFn?=
 =?utf-8?B?eW9PaENqN3lXeW9vSTB5bEdrWnlPSkJPbUF5OUhFbXVJd1FXNm14K0ZTRU1S?=
 =?utf-8?B?TnRVOWl0V1FtZTFCYlp3b1JlNUg0RWRHTE5NUHNMR2xRZ1hrMDA3TEIrbHNI?=
 =?utf-8?Q?SZS5FWHG1H3L9CKXQbRd?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDNrVkJDZVRhQTN1eFE3N1ZGK3dOaHNKNnAzRk44RlA5aEh6b1B3S0hTNGlU?=
 =?utf-8?B?MHlXZmZGMmk4a1hTa3lEa3NSRmdhMW1PY2RxYkNUTkhscXFIdFpSSHNTQjFZ?=
 =?utf-8?B?d3BlMnoyUmRHN2xUYnhmR3ZuTEZYOWFCbEdoQ3ZkTmpLMmUzT1YrMGNqRXBY?=
 =?utf-8?B?TUhOK2ZsMTBDWE56QzQ4aDdiWGVYR3d1bEkwSFhMRWt5WU5SQWEvaUFCc3JL?=
 =?utf-8?B?RllVR2tiWjlranpLTUhxK1BWMFFHSHdHZ3VsQnhhWGs5WTg5ZVB5TFhacjFj?=
 =?utf-8?B?WThJRDMvWEJsQml4aWVwUTQwZlprL082ZHlQNkNlQWo1cXFBUy9PYWpXb3Qw?=
 =?utf-8?B?MDFtRVl2dHAvcnRMakF4bEl0QzZ5ZFN5OTZTeFZUVTdBaUU5YWJJOGtlRXl3?=
 =?utf-8?B?WjNHczRLTTFKamJua05SQVpwT214OUNqc0VWQnNjRXhkRm1yVXYzWmxCZk4r?=
 =?utf-8?B?Y2FGWlpxcnhXYTlPN3VFaXR5b0VEcDBta2tMZUJ5d1A3eCtvMmlUSWY3ZGJo?=
 =?utf-8?B?K2Z2dnY4MmZmZGJoVzRxSmJMc0p1dmhtcE8reTlITml0N2dwQmRyZk85N2ow?=
 =?utf-8?B?Y0ZBSGE2dmtNaXA1b3VuajFZR1YzRDFoemdkekVtTjNjaHUwOFllZUVTbEUy?=
 =?utf-8?B?clYwMmdMQzJwSXVkamlFMnZDYzRGZmpoaEF2NHg4QmswT3pidHpRK2pyZWt1?=
 =?utf-8?B?OWlHWjI5bUIvTnBJOEJOSWlDcHdIdm9IQ3dibVp6Z3EwTGxlZmhjZjhVTGZ2?=
 =?utf-8?B?WE14dUFrcWliblNHcDRKRVNvTTBSSWxmalFCMlZmTDdjejk0TEJ4TE1IeTdI?=
 =?utf-8?B?NEIyT0dROWlsL1BZTkxXRWZKemM2dzRnT0tqYjh5RzkwTUx4QnJ2Zi9FYjBU?=
 =?utf-8?B?MkM0R0pRK1pFMVVlTCtCaEI5ZEtiaHVFcjBnK3lpS1k2aU4vODFyTVdnRTc2?=
 =?utf-8?B?dmdGSWU3WmpUM1BMN2hLdzlRbVpYZWxiZUsxdlMwbW5uM1p5TEtveHo4bmNq?=
 =?utf-8?B?a3JUYVVqRVl1S2lMVEM2KzJCRlFsSmhOQlhxdWh3cVJpSU5Cclo5NUhlMmFX?=
 =?utf-8?B?NnB2aVlzbGViSmJGRnF2U3FsSnVNRFhSY2hWSEZQSUNISzFZdWFUc3UranZs?=
 =?utf-8?B?cmk5TWQwZCt6ZDRkazdSaXlyTllLUk1OUXJlOUliRFQvZTlJMWRMb3hIbjZE?=
 =?utf-8?B?NzAyVXpDaGRGUkN6aWZ5RVFnMkN0WkV1WDJwK0d6TmQ4WmhuQ0RwZEtkNi83?=
 =?utf-8?B?bGdQS09ybDVlWGJTN0NQL2wzVXY5Y1Rvd2NWM0JGOTVuWFdlQXFvUmtFZEhX?=
 =?utf-8?B?WTFyUitIZExZZjQwaXM2TERYMXRFWStPV05od25HU3ZMcE53NHhJR3NPQk51?=
 =?utf-8?B?RzhNN2hBS0tkOGYzTURteHBnN2hVRnlMejE4UVczQnF1ekdBRXZiQnl1TE5X?=
 =?utf-8?B?QTdsNWVVOVJjVXR2VTkraDdDb3BzWXc3NjE1TndhRmtldE91Mjc1QkR2ZGlz?=
 =?utf-8?B?L1FReFVaUGpSQnUyZGRTKzcwK01MYzVlNlNlOFIzYW93QitUYkczUElYcUFr?=
 =?utf-8?B?VWpWOUpCMExlekhxc1VvNXIrdXpMQUJleHB3L2FmUjZnS3NlSTQvazRtcGlM?=
 =?utf-8?B?ZmFlSlJvUk9VTnpGZkVqbHAwaGxNelRTZGZwUWtFVWF5YW5pSUFPR1B5bjhk?=
 =?utf-8?B?NkQzMG5pNGt1b3JCSGE3WVJkeUM4cFhTWXA0eDlqQUh0cnBncmJWTjRhSnBB?=
 =?utf-8?Q?5Ux7+OTZAFJmMQB80wwntRfDX3v4Kitgl9TmrWf?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e817f9a8-16cc-4a65-a1cf-08dd769195d8
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 11:36:21.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5748



On 01-04-2025 09:02 pm, jt wrote:
> Hi.
> 
> The trackpoint / touchpad combo on an HP EliteBook 850 G1 is detected
> under Windows 7 as:
> 
> Synaptics TouchStyk V2.0 on PS/2 Port 1
> Synaptics LuxPad V1.5 on SMB Port
> 
> Linux 6.13.9 (zabbly stable kernel on debian bookworm) detects these devices as:
> 
> PS/2 Generic Mouse
> SynPS/2 Synaptics TouchPad
> 
> I was unable to get libinput quirks working so I filed
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/1106 - Peter
> Hutterer kindly explained that the problem is that linux does not set
> the INPUT_PROP_POINTINGSTICK property on my trackpoint. He explained
> the udev hwdb workaround and he also suggested that I send a mail to
> this list.
> 
> For what it's worth, I think that this mis-detection occurs on many HP
> laptop models.
> 
> $ cat /proc/version
> Linux version 6.13.9-zabbly+ (root@gh-zabbly-linux-39666878469) (gcc
> (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40)
> #debian12 SMP PREEMPT_DYNAMIC Mon Mar 31 02:08:07 UTC 2025

Is there a driver in the Linux kernel for your trackpad? You also have simply emailed the mailing list without sending a mail to the kernel maintainers. So how will they contact you?


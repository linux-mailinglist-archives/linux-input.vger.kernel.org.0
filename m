Return-Path: <linux-input+bounces-12207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C2CAAE300
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 16:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CEC99C4E72
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691A125C6F0;
	Wed,  7 May 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RtIgnN/c"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010014.outbound.protection.outlook.com [52.103.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C254288C11
	for <linux-input@vger.kernel.org>; Wed,  7 May 2025 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627580; cv=fail; b=mpDDxNUQ16/xhrO12xDAYuOLFUrAWVOW6Ak+jvDbaYMGjmrCqq9v9g5T1fCiCUQlhT7+OZd9yukKL7z5w15jZGZuFrDKlLU8bNEzlHHl9zX/10siYYm7Ny59wtfREZjcGY49R4roOZWLzPvbO0RR/qNE7CXemRXQDSuHqnG7aiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627580; c=relaxed/simple;
	bh=ck7vlkIb8gE6XhdoQ/WCD+UM3hbus+lj3AvZj32fbTk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NFGgtL1zr2e3FXV9ufPAjvkRCIzvCAUxehShhEMkuQWcTil9oNGBQuco9StDPJk17+5FdIPaRep3pbxSIBevinPOjShxzxFW59wMNskd+n2E3ssHkoA+juBflIdrD9PV83n4ppTqoizbXgQQ0WNKx87BWstl0nKpvRzX0lGECQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RtIgnN/c; arc=fail smtp.client-ip=52.103.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6t9tewslXYrukSoj1YEMWx3SJdJkvuCaQvwmR7X5EjtenWRMAzHX2hXyIMooCECXkHg0s1CHKHTHb/O7jMl4XnMttiYbihW0oV3WGB6gItun/mjJOZnnnec7ZiWlHmcVZyyzbJeAF3qJiHGKxcNbEuazx4Sfu/Rr3bUgBznJ4bFC1TVpEUT71+yFjjgpgyWjb7W+/RF7U44zyoXZIItibl8PrIvxUgx3ADF9kuRCGEzd1kotmFrQql/yYULm9Rg9zyQpRkRI5f4k2S6Nq7ydw4IrGfzEka7ktKe2wYDs9m2dsow3xjaVa0Z3S4u+M2hqCNcZujx4XsNOvh0S4mGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBP+QQMv+06iNuvqOeUyFGUk0TVQKQmkMxfee+OH2pU=;
 b=tC4cEeWYCiib3IVd2cBKOSsNRGl16KOGeQXoLJm8L5tMYdQY1SopCNyWeb0RFtB0pSCODmSXThsZ93TKLHvQKo5zKzNO+iy/8uOf4thLUcXXxkLPh9pmlIt9mVzVZUgBOaHLmKp0oL634NvOoCDT+CSZDQ38b5+gvGH7+zojVBNnwMSSNKhLs+s74RWIplVgKdBmDYq4MI2AtVFtRttMPeC5AMlH0tZriH+1EZ4Yn3dtPWysubJ4e38zGjO3BDZsCvSlG0AYfOnWunPVXf8bPqWOQMM+relA95dUXpYeynEJTgpr9v6Gxf/Kfkeas7sOW+VuRX6Dp4kY3offSi1VWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBP+QQMv+06iNuvqOeUyFGUk0TVQKQmkMxfee+OH2pU=;
 b=RtIgnN/c8tg4aSqlgL6i0yj0xPn7enT7HwmH7yhW+59sv9O+yc3dd9T22RLtZkE2uoH/d2ql/kuXSHX3sRIvdf13DXFG8UPXfpQp5WT7MIsOP0maETKDqH+LmtHvfUreqdczfyfwIeUspj3F+WZbyTDCZobcgvvcwdQxrn444/O1gWCyodItSNW5CA/UWVU/yhnokJ2NK9wWlidwPYGbWOP/h4KdcO6twvh3xLK3qjM5NQ3AQeZSQKnYbsFIL/bM0jWZ4/uR9safvKdFn8iElFBd0f95Obw9W2+FFERkuve3aXPaD8E10fRQoPa2K0/N0bUQtnudsvHz3msK9xhOJA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB7632.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:cf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 14:19:34 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.030; Wed, 7 May 2025
 14:19:34 +0000
Message-ID:
 <PN3PR01MB9597495CD169A3D918466E7FB888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 7 May 2025 19:49:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, jt <enopatch@gmail.com>
Cc: linux-input@vger.kernel.org
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
 <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::32) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <1fb1d770-ff1e-404c-b4c2-8d3d67c500e0@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: acabf582-c8ef-4339-63a2-08dd8d723107
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|7092599006|8060799009|19110799006|461199028|6090799003|5072599009|1602099012|440099028|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFQ5QTkrM3dialhlK0Z0Sk42VFhtL1pKdWhMSmV0b0ZLY1pERkNFNjVwWkVQ?=
 =?utf-8?B?SUJuY1R3ZmxmVDNTalJyTlExdnlqL01vbUIzSWVvOFMxd0xqUlkzVjhlZ3F5?=
 =?utf-8?B?WUVVZWJuV1I2TkF4akhhM2ZQdWJ5c0lHdWlCMVlJVXJuTjlvMEpjdUlxU0Vm?=
 =?utf-8?B?bWR5Q1dwMXNNcThKcWxQZGNXWnAzQlVMS1ZkVklLajVRVnU2bndzNzNQMmRq?=
 =?utf-8?B?bk5oTlcxMGRZTkxQMVpKclhQeG1ZZHNsbWJJaWxacXBpc2t2Vm5RZXRmK291?=
 =?utf-8?B?ZUExMnppa2FrbEQ5RnJqQTM1VE1SQW5KUjQ3ZTFZNzZmSjZ6YVQ1TU1oanV3?=
 =?utf-8?B?Wk51cE9wTm1HS0NuVFpJeG1zTzNFWkl3QWpzMEZtd1BROWlvVUd5NkdCVTE3?=
 =?utf-8?B?RDFuVUl3Ynd3NnlSemRwL0pSUlRlWTlPMU4vb1l3QVVJQ2xsYTRUS1E2aWIx?=
 =?utf-8?B?UWU0T3hWUnlEUkpYd3IxNm0rYno4bHozT0hPTjMzMGc3VVZyK25ZaEIwUjE1?=
 =?utf-8?B?NUwyd1E5Q2hJaFFtTjRqenpFcFZxalEvcnNSaHlsOTdXNlFyaXRoaHRRWXNk?=
 =?utf-8?B?UHQ3RGQ1K0FDd0NMWUZ3SjhxRFQyOUkvNUdHU3ZyaDBTZDNWMFVFVjl0T21l?=
 =?utf-8?B?cGhJOHZyb2Z6RjRkejh6WVhIend2MXN2cFhGU0pMYVZLMnpMUVdNbWV6MlRU?=
 =?utf-8?B?SERYd1Z4dXlXNFJWSk9XdkludXo4TlFhNURrZnRaVDduWDNmRXJnSUErbmoy?=
 =?utf-8?B?dVArb0pCakIyTnFCV1dnVGJqWkJjVEFwdHhSRzBidUR3UlNJaU5RdW9EcWla?=
 =?utf-8?B?NkJQdm9BSGVqQ3dYSDgvcEl0R293dTc1ajJlZ29SZjFkTmorcWxMMjJwMUkr?=
 =?utf-8?B?NVJRUTdpRk85NnlSQUxRZG5MaStVQ254QUlFeDNwWHI0Y3N6SkVybW9RQnZT?=
 =?utf-8?B?Rzd6N09wZ2tmM0pMK1l2RUxHVUN3WVVGK1paaWovRWFUUW5xaEZzc0RxZjlj?=
 =?utf-8?B?a1JmalRCWGhqRVBMR2tjVWhEUzJjZVdXRFJDR29RU2UwZFBtYmx6bEtDa2p2?=
 =?utf-8?B?YXZsRkllQVhzY25wVzN4SjFLdWRlTGZJNCtSRlZaQjhNZGExQThyQUFyZWJy?=
 =?utf-8?B?cWJwL2FRU2I5dlVxUFNOL1lzcFJNanEranI2TkN2Z2dmd1lDZFNENGdtUWor?=
 =?utf-8?B?aHlCbDRBQWxjK1JNa1N1QkhNTURweTVRZm5ya1NwWjM0UlVPcExtZkUwMGEv?=
 =?utf-8?B?Qll5dC91ZFhwR0wzSkMvbEZ0SmNuNHlaSVBZV3NDSHBkalZqVGZWdnpaY3NK?=
 =?utf-8?B?azZ0dWtPalAwK2tMTGFIdUZMN1d4cGt4MGc4eVlaaTh5SXV0a1NzN0M3czVo?=
 =?utf-8?B?TTFtNU15MThEdTI1bW92ZGdDSy9TbGxNM01CSGwwQWlIS1JuL2ZpRmdRTFJI?=
 =?utf-8?B?eWpKbzZ4VkRBM1BiOFgzSXAyVURwMy9UZUZRM3oyWHZCZzR6NThGUjFFUUxm?=
 =?utf-8?B?SlVwZWpXR3doNm9Fb25pbHV0eVZnU082b3EvVks0K2Z0SldKNFZzQUVwSTk2?=
 =?utf-8?B?aTd5aDNweXhEVEdJMTRUQndDa0RMREl5UkxCdGFocnYxK2Y4YmI3bzdRV2xp?=
 =?utf-8?B?N2oyOE9yVGY4V0l5Tm9MdXZVZ0pjK2RPL0xFSGdqY3ZWa0VLL2FZWXlPMUdu?=
 =?utf-8?Q?FFCzhHWkros1yLqTW7K+?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajlPWm5tME81WXF6MXNld3RKV01LQzRyY0crZGlWcXg0aS9pTS8wS1FWdUtq?=
 =?utf-8?B?R1VkdU1JNC9acjlRWGhCLzRNcTBoS0tiK3BIampBdkxGQVAyd1RDb1VZQ2JK?=
 =?utf-8?B?OEd6YkE4UDR5SWRySDc4Z0pleE1UQlZWMWRjOTcyT1d3cmVvZ215ZU1pY1B2?=
 =?utf-8?B?MXdWb3dHcnI1TU5JRGdBekJHVnFJV3R1T3NzOEs4TU01Q0UwVUtORE9zd2Yx?=
 =?utf-8?B?bDZQWjZFcCtUYk5NTGpucFBmaGkxVVZvMUR2OHVWSytjN09MRlZ3cU9QMzly?=
 =?utf-8?B?UG5LbVU0ZUdJYWJYNWI4TmdsdWFIMHg0SWhEQ2pMbE5BMGo0Yzc4UXlBR0Yw?=
 =?utf-8?B?WWVpNEpuSmdQWDFFL21KRGpqNnpjUk5aam9mSG5MRTJDZ3gxeExDRHVXeXdi?=
 =?utf-8?B?ZWFNbXdlT1VwV2dsN3JZVitmNnVzN1JQT1NqU0JzYVRLejJ5OURCdUI0a3Vm?=
 =?utf-8?B?bU1rYXk1dmJRMFhUVXR3VWRPT1dYZkZqK2gvTFp0Y3puMXVHWkdFeG1jdkUw?=
 =?utf-8?B?VTFNN2hkVDlpL3p0WGo4UlVxSkEzYWRkbnB6WjVvKzM0NGM5Zmt3eUFCclBq?=
 =?utf-8?B?eFV5amx1SEZMc3NzaWswSkRtV0pPZWNVY3U4K1RkRWg0ZmNTSjc5ZldFOWRW?=
 =?utf-8?B?WDJWYTIwbEY3TFloUkYzZ3hQTWVQT2YzdEgzTjFzZ2o0L25tYWJGaUwxOEhh?=
 =?utf-8?B?T29rZGhLSGFTRDVXM2xVYkIxYzBYbXdtSGtqcUhnazJoRnFSVXRVUGhlNnZC?=
 =?utf-8?B?aUJ1cTVpd3JnVEpmOUNvVVdTRFpXR1M3SGRtTGVCY3NNVkpBdVQwcHkvK3Ns?=
 =?utf-8?B?SUFvb0RmOENGMFFMWjNsT0txRTAzRzRvTlA2SjIvQy9YRXpYTnhPZzJOZkVH?=
 =?utf-8?B?bGs4ODJvbU9JNjVFWjFMVzVTMGQ5UzBXV1hYZElaUzVWWEIyeG5KMXNnZ0xG?=
 =?utf-8?B?RVJFRkFzSElzc3U1WS9GV1Rtc3EvdXc0MkNXM1ZqNWpSODllVnlaSi90N3M4?=
 =?utf-8?B?NjlNRXFKVHJIOWY0MGs5V2UzUWtvN0ZDYXp1OVJPN2l0UGJBM010K2pCSlhB?=
 =?utf-8?B?SEtJZXZOTUMvQmF1R1R3ZTEweFVtYzhSMWNqOVRTdGl4QlVpcW9LbVd5SHFT?=
 =?utf-8?B?KzFiblVzQ2FTcG1HL2dkZDZpRjFDR0VXVlVDOE5laFo2Vk5KNXFCNEFVNXpn?=
 =?utf-8?B?MFByU0FTVThnZ3pQWmY5MnNhb1BRQ0U5dEkrOWczOUNOVUpDTjJzQmk2UDJ5?=
 =?utf-8?B?Q1FVNGtueFkxTHpHSFRRMS9OYitBNDJVVXpyeXhpMUxIK0dUdVlCQXR2WHpN?=
 =?utf-8?B?VFFYRWVNbXE4MlF3cWtid3oxZGNycTJVNnJURjlhbzZ1b1lZZ0NUR1RWTTRh?=
 =?utf-8?B?NFdxRGxnK0NhNWR4MDhFbVhWd1EybFNnMTREK2FJbFl2ZnFlU0lCMGpFR3JF?=
 =?utf-8?B?dnN6R0V0TUZkNE5jekdvcy9yMXB0dlVzb2lVZHRXRGh2US80ck9PUW9RdEkv?=
 =?utf-8?B?azFXT3dTVVRGZVhGMlBhR1VteCtwNnBZRFQ2Ym83dGpMeWpkOExJVFplOHFB?=
 =?utf-8?B?MFFSU21aVVBnK3dOeWJKdDFQWm5WOFduUWJ4bERURUJxZ1N4WitmaG5hT1B0?=
 =?utf-8?B?Nm1hMXZ0OWJhR1EvTm1yblFWazFidzV4ZkFNZzAybWNCSnF0SnFPNCsyMzhS?=
 =?utf-8?B?d0RoYlNjcTZWQTRHdWdCSVdrSGl0aVI1ai9ITWVIK0NtTmt4b2lnaGYyTUZy?=
 =?utf-8?Q?IFSsdhIxWqGJfGoNiA=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: acabf582-c8ef-4339-63a2-08dd8d723107
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:19:34.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7632

Hi Dmitry

 
> Peter, is there a way to add a quick based on system info to libinput to
> identify that PS/2 device as a trackpoint variant? Unfortunately HP used
> the same PNP IDs for the main touchpad and the trackpoint...
> 
> As far as the main touchpad module goes I am about to send out a patch
> to add it to the list of SMBus-enabled variants. Would you like to be
> credited as "reported by"? If so what should I use as name/email?

I've sent some patches for other models reported here:

https://lore.kernel.org/linux-input/PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM/T/#u

I can send this alongwith that if you want. Although I'm not sure what IDs to be added, since there are three in this laptop.


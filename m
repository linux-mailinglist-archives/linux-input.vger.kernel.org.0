Return-Path: <linux-input+bounces-13704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07837B13C31
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 15:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AB034E24FE
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 13:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE9827380F;
	Mon, 28 Jul 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="omH3FL0X"
X-Original-To: linux-input@vger.kernel.org
Received: from CAN01-YT3-obe.outbound.protection.outlook.com (mail-yt3can01on2122.outbound.protection.outlook.com [40.107.115.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE126F44D;
	Mon, 28 Jul 2025 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.115.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710794; cv=fail; b=mHSAL4yrM+Kk1yi2J62MKQxQxvm9PAe74uH5xfnSqN1SgbrAvm6bGbfYBkxX0Btzl0nDclKq4ssNRznP6VSAhqDp2ct0gKMhvKcjpUlfFvEPuXr01kPDA4qVToLPyvKuOUwb4Lj6iiSVYaWbctjHeQGsHjqJLSBmp2dd9/c7gU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710794; c=relaxed/simple;
	bh=QcjdfvnkJ14S5H2zuZ3YSrGdqjVb/zcXQsiMplcztQc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fz1ExEJ2OSARiIbYJZ24M9LQdO60go+/45zDQdcn/MQyFMpFZc4Y6v5wd4NlbbBJD3pcDQrmQT1j69NHqFqp/iVGCyFnLu0R28nlC9lHJ18zbJH3XcWuGfcGXBPkrddBk7auB6WtUbBLoP7AcfDzg+Yb5umMycbuj40y5tb+bhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=omH3FL0X; arc=fail smtp.client-ip=40.107.115.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqFuohGbyTJtPaiRIf5tK4HSgYK5HqJhWcRH02tdAnS9hrG9wrIeV2bBw2CmdzRlyxPTA8FHMHjo29tKx2M2rdYhMAec22D5IwHXlOwSWs20FkE7F8F/6LUC80FewzRRTy2eAr4czTZlxu92azvJVr4yj8YLpByJ4OE8B3a0i/EhchfZNoq3sA6Ttad9cIs77BSqORGxgiFS+OPuJX+geWjlr0QvmlaXrDJ3gF6zocO9/UMiZWo2iRDcEKI6HvlBrMB8wR3avFgJXzw5a6yVJ4uXH3WW3xe3UvAnpgBEevjgEiuLK9xariOnvNrtx4kc4XQZrUDElmaygycnlqzrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgujitAGqVSBOzDqr/0dZFWaPO3qwulvfrXgf/ErmbI=;
 b=yRqJYVwpcRmssgxSpQDozA2j6LvGWnmrE8j06Jh+ZEYsYrGwK7ICKF4b5iPsrALfcNs99PiTWtdXwNaf7Pi16tBTdVWk/HtjIe2Z2+0yPBLRF05tKaqQb4OJLdnz+TexNf9esXEsf/5dKvIYbipIOt0O02jAJA0SqKnffSI0/ocx9cJu0QmDEe1VN0i6u4EdvjHfHH4tcNANTGU2ur7pJYszyDetkosYLdxPmmCDXOpKttMbpv2cUPB6chhk40m+010XyT7EHaomXiLISgR9iCfYc3uU9+pE5gqOyw/1e/wd1WRX8ASslb4PlpnuFV7CX1YrG0AoFasCB4aow3D96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgujitAGqVSBOzDqr/0dZFWaPO3qwulvfrXgf/ErmbI=;
 b=omH3FL0X1KoBq1Y7eZeJrESXUPBEIP7QjKsj9HAmjPFni0a7VBsWTXMsEI/kVMb/envfhASrQ185cdk7Viph0cpH8q77UUofVqxNqucv8rr0PGly3NaO9SZhCsbB7fCNCPoX4lle5iqh+E0LCfvxMGdHNQwGfFH+3PWc9LL+ijQjx818lZy9U1mhtDjMoq3EiU7PXOkzYicHsVtSNW02TWKYjJZvLjJ2Nqs8lDqi1+cNGqAlFkPKmpce5QvvZOmJ9tBDvholJUrIT6y9GNzsbHrTrz0sxj5RcJzGkfx521SojM+5hh1JMmPPQ5RJ5Zh3jFA8WwKRYdNYVaUuI5EqqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB9216.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:60::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 28 Jul
 2025 13:53:07 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%3]) with mapi id 15.20.8964.026; Mon, 28 Jul 2025
 13:53:07 +0000
Message-ID: <c6ee2dfd-3d10-4fa6-943f-9d7b1ddc231e@efficios.com>
Date: Mon, 28 Jul 2025 09:53:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] input: Add tracepoint support
To: WangYuli <wangyuli@uniontech.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: dmitry.torokhov@gmail.com, guanwentao@uniontech.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mhiramat@kernel.org,
 niecheng1@uniontech.com, wangyuli@deepin.org, zhanjun@uniontech.com,
 Winston Wen <wentao@uniontech.com>
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
 <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
 <20250722202551.1614f59a@gandalf.local.home>
 <2b31b238-667e-47b9-b61f-76832a1f77a7@efficios.com>
 <921F8D487468018A+141227fc-070d-4ed9-8828-d446236eccd2@uniontech.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <921F8D487468018A+141227fc-070d-4ed9-8828-d446236eccd2@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::17) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: ff063860-e7e9-4681-62b4-08ddcdde148d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkVScTc3K2dpMWpaN3R5c0orbEd2djNOSkk5NVVCT1hHR3lCL0UrSWlnNlY4?=
 =?utf-8?B?WW5GRk9YZWtOK1VWMXZOa3hrYkt1UktvUGpSNDhoWWZXTzVjY0krT3NVMFFC?=
 =?utf-8?B?UFd6L08xR1IwOFVEZXZDaU9KcGZIemtuQ0toTWFEak1VSkx6WnpqWXB0MWNV?=
 =?utf-8?B?blFmVFdNYXQ3Z2VyeStad2hjc3BuclU4RFdwVnVGZjdzQVNnMTNkUTRDb2RL?=
 =?utf-8?B?RGFFUzF5TUJ6VWJPSGlRRDBEcTUzT0pUTlkxOWl0UXVWQWxqTnlwRGdIb1JS?=
 =?utf-8?B?UE9mYThnZ042SE80VEpFY0Y5UW5UVm9UUW5uZ2c1TjJRK2haaDh5MisxU2lr?=
 =?utf-8?B?WDY0dUtnQ0o2RVRmNmtLR3hHa1Y4ano1MGRTdmNGQWk1YXdwaVVHWmQyYllY?=
 =?utf-8?B?bHc3b2NWMmlyMnNJdkpLVkhxZFAwTkgvTzhaVm41Sml2ZGxvTllvZGZUajZI?=
 =?utf-8?B?Yi8raTQ2TUNFNzNlVkFDelZhR1lsS09NTW9jN01UQy85YVYySVJITm41bnZN?=
 =?utf-8?B?VnAzb3Vua2ZOK1N5akYrUUxRWHdRWWhrTGhscGkwaW1RUlgzdmxkQmxxcmd1?=
 =?utf-8?B?dkFpNDRMYmxiVmxNYTh6Ly9McktpZmgrYXBkS2FqZ2tPTEJiRDdPSjV5TzZ4?=
 =?utf-8?B?bk8zckhjM0s0WVZvalBzWEVvR1NVRHAydXBqYjh2eVJranJVRm4zc2g3NGJF?=
 =?utf-8?B?L3JJOHJQZU13RVhYajlLMEU0aHNuYktiV0RxMjNRZmxMcFRrVkh6OGUwenpq?=
 =?utf-8?B?Qm1aYTNKRGhIQktzRUlSVXN0N2xzb3N4R3Qrc1J6R3g2cUZQRHduOTJaSjlB?=
 =?utf-8?B?eUhHZzJYVjNkWXZRM29jUG53NlhLWXVjN1NxbDZqTU1GQ2o3SU90NWlpVVhj?=
 =?utf-8?B?VGYxZWdmL0dLeEJ0WFVjV3JuMzRjaUJLc2Iya01ubmtDSDFZNTMvTVFoU2I5?=
 =?utf-8?B?YkQ3Ti9OUDJBVTF6TWdjVjJ0b2NEb0hzZkpndTEvcDJOcDZMNktaOFJrbEtz?=
 =?utf-8?B?M0RtMnd5Nng2M1h5TngwZ3hiVmx6MnFvdm94N0swZGo3bERqRXJKQk1PTFpX?=
 =?utf-8?B?cXdFalcwbk9aamVnR2U1SnBZb0pkVHFxS2RkTThQTTU0ZlNXUWRLK3Vodjcx?=
 =?utf-8?B?TkRuM3NLdzFSZHJ1YzEzL3J3Z3lVQnNHS1hGWHJPOUhaYXVETFVqUkJKY1A2?=
 =?utf-8?B?UGJ2eTRESDZjcCs4VlRLQXVvcXJzZXJHL0d5U3c3aW5GZTVxN1Z4K0tzWVVy?=
 =?utf-8?B?dGw3SmwzTXFjcVhkTGVFMGJHcEVobUtKNVJPU3h6T0VmWm16QmhMNGRRRHRF?=
 =?utf-8?B?ajhNVWJVSnhDaUFDZ0FYSGJUOS9hS0FBbTFLM3c1K0V0ZCtWSURHdGdqeXRK?=
 =?utf-8?B?OHVPQ2FKRlllN0ZMY1Y5ZmJCdG0wOHJHUlNLZ1lGbjEwdHo1S2Vqdngwd2pS?=
 =?utf-8?B?OFRDNU9naHA2MTE0eVp6MVdBQkZqN1M1Q1BwOE80eDcxQ0Vyai9RSXgzUHNU?=
 =?utf-8?B?N25nV3Vqd1NYS0ZxTEFKcWlhcFdHZm80VUtXbVZGc3htUXc0NzFKdGk1elRh?=
 =?utf-8?B?Z0E1cFd1YU8rVEJzQVVGZjMyZDA3UGEvVERKZEZTRkw1RW84L2t3T0hmNnFo?=
 =?utf-8?B?Nm55S2kxeGJGWnF1cU9lOEpmZG5nT3dBV2YzRTJFbDVRZGhocXRxRnAxY0xp?=
 =?utf-8?B?dUZ1ZU9OTVNFUVpPS2lFLy9vVTJNcStOVVE1V2Vxb0V5Z2JiV1V5MjVmTFdF?=
 =?utf-8?B?cG1BRzFKYVIzNUVFZld0MHozYU40cVV0dlgvcVhlU0NLdFEwdWE2REJJZnd2?=
 =?utf-8?Q?g8ib3LJPVlA3PWDCLs4OHNaXG2LJCDPeNBRyw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDR6Q3A1MmhDdFkwNFRWeEFTZVU5SmpqMG1tUHhYK3FpTDVpRDNSV1lwQzl5?=
 =?utf-8?B?M2FYT29SVUFyRzcvdEhORG9LV0laSzdjWFk0aWlDekVxYU5oT2RyL2hUTE1I?=
 =?utf-8?B?Q05JWERCZlVoNzEvS2lFYThDeXhQNUM4SHV6aXAwQkFhUmFDRGYvcm43aWNy?=
 =?utf-8?B?a1Q3djYxU3U0WGF5NDN6TFFCZ3Z1eFFJYUhlM2VMbXEvRUtYdTk2WlJrTm9s?=
 =?utf-8?B?WElzZEZvclgyRGJDcUZkcFhFZyt5UTRLUFNTVVRGelhpblU3S1NOc0paMWpq?=
 =?utf-8?B?TjVwcHM1aXl5Q0Q0dU1neDJnNTc4VDQyTWFjeC8vMWFiRlc5Y2pxQkFVRVJ1?=
 =?utf-8?B?bW9FS0F2QjZnZklpYVVLZ0xGU2tWMzJaWU5Qbm95UkRnanB3cFVkUGJNbzJ0?=
 =?utf-8?B?N0drbFY2NlZvSGpTSDhxOWl2cEZrb3c1ZW13NmJlc29kRnVjcHM1d1lsMXM1?=
 =?utf-8?B?amRYazV5THhOVWJqZGQyYnpKQnIydnp3dGJENU9WMGdoYzJlK1pNNHlZY2xP?=
 =?utf-8?B?U3Rxc252c2Nra3JzWXF6UktSSVE2VmlJaDJmcWtNdTRFcmkxS2lITzBEZjR2?=
 =?utf-8?B?WEJNMWs5QnhUOUIzV1l3QzRrMzU4bjU1MmpDWkpNUjNzWjhXYit2a2luVDlX?=
 =?utf-8?B?dnBZZkNCYXYvVnVjcnNodG9INUhyVW5hakxnVFBITnI2TzVaL1lyL3FjNkZG?=
 =?utf-8?B?SUlEL1p1aVdhWVlLWVVlY1lwREk1WUhFZGxUMVdkaWl3a0Y3c0dXcytNdWJ5?=
 =?utf-8?B?a21nUHRwY2JLZXhHY3F2eklTMU00WXErL2RJSiswcXFEUHN0dUswMVQ3VHpn?=
 =?utf-8?B?d1RGWkZ2RHlWLytmdVhjWk1ZdkYvYm13RzdOc0hSYjFsT1lkWEFyR0VFNFpH?=
 =?utf-8?B?QW9SaVlsbzlNZW8rMjV4bmRuTnZKaStBNnFDODlMTTZTN2RCUzhnYXZnRTZD?=
 =?utf-8?B?ZGpoT2lzNlNtbWgzeW9NaHRSOThmR0NYTm9NTytyajFMOVprdmcvTURvRklT?=
 =?utf-8?B?YUtRdFMrWWJORk5hN3IweEY2aG1CYmUwd0djRHd3dWdvKzZwOGJobFBEampt?=
 =?utf-8?B?bG5JZXJYbkNBZ293bmxRTTVkMm5oNG9HSms0anlnVDM1VWErZWRYdTZybFQ0?=
 =?utf-8?B?eExISXkrenltb0hRcW9wdmd1UGF3NHEvVVJHUzhuN2QwSDE5WCtYblBMYTF5?=
 =?utf-8?B?VWhjRG1wUVZQaW03V05va3Buc25Tc1RQNDhpVENBZGRFZU5jVGIxdzRYZTVi?=
 =?utf-8?B?YVpmd2F3VHdCdkhjQk1UQllLYWZId3N0clRZYklQSDhkb211OFJ4dGR4NmJ5?=
 =?utf-8?B?dU9mWmNHK2xPOUR1ak5vNHhBamNQSm56VHZFaTMvYUhZdjlZbmtDc3oraklR?=
 =?utf-8?B?N0F4UitqL0pnQXFaU0V5YXhJWXJpZ1IyenpiU1hLV3ZNOSt6TThuRzZDUTgy?=
 =?utf-8?B?RFZGT0JkZjJ6UGdkNWlNL2psQnV3YU11bVdDQXcwSXBBTWF6bUhzaDF4Q1Bq?=
 =?utf-8?B?QkdZSkxpeWpmZFRCZldoVXNncmFvb1RNTis1bFlPYldYdFpxTDZwY1JHUXh0?=
 =?utf-8?B?WGJOUlNSYXVCYXltOWlrMVVwSmNpdmlvVTlkcGRQQWVCTitobExaY1JhT0NM?=
 =?utf-8?B?eGVLam1nRHhVM3J5enI0NXRxWXd0emRsdVJhRTVzcHptUThXTTRGV2JnNWpa?=
 =?utf-8?B?dHREVEZzRFVKQVp2UmhyNHV2N2FTdTBvMWJXbGZOVnhZU2FHaThxSG1KVWM0?=
 =?utf-8?B?RFpTcHE1K3htdDZNSVBmajBRdHBKQ2dGUElCRlVJRzhkZDMxYi8vVy9MWEhI?=
 =?utf-8?B?dTM4NDlCSUt4V2FzYmxzWnRsSnM0bm1rbVVsQngwb2g2VGQ5Szd1QWsrRldQ?=
 =?utf-8?B?Vzh3TUdkd214K1hpanBHNStveTY1anFQQjBBV01VaTdYT3d2dHhoY21MOUow?=
 =?utf-8?B?bmdRRnVFUTNSNzdyaUM0b0JKUGZ2elNjc0FmMzBGbmdHcWk3NG1JUkU2Wi9k?=
 =?utf-8?B?TEkxVlNURGRwSjN6dlRUbncwc29DOUhla2FuV21oczl1YXdFSzVlY2tFb2Zj?=
 =?utf-8?B?TEp5d0kzUFk3Vm9EajlQU1VJdTdBZ3phRUFqeDIzUmVDaDBndWtUSGN1OFNr?=
 =?utf-8?B?dnI0K2dtY0hlcVdpbHVtWnpDQUNXU0lmRU0vWGt4Y3UzcGxsUFRoU3V5dmo5?=
 =?utf-8?Q?uDGUMDBqWzpWW1BeaiRbolw=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff063860-e7e9-4681-62b4-08ddcdde148d
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 13:53:06.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5s+MSotZ00TKwrTNslHmj3idbVswabap80GIAhOH0fFbOn70B+R+l3GwnqRIUY71vXg+2A/jyUFS/9V5V1Q/pgCPQYE1R6M3JR7aG6GGHjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9216

On 2025-07-28 03:07, WangYuli wrote:
> Hi Mathieu,
> 
> On 2025/7/23 09:24, Mathieu Desnoyers wrote:
>> I've always been worried about adding tracepoint instrumentation of the
>> input subsystem that includes the actual keystrokes into the event
>> payload. What I'm trying to avoid here is people leaking their password
>> by mistake just because they happened to record a trace while
>> typing on their keyboard.
>>
> The evtest tool can also do this.
> 
> However, it doesn't fully report all events from the input subsystem.
> 
>  From a debugging perspective, adding tracepoints to the input subsystem 
> is still more convenient for debugging.
> 
>> I don't mind if this gets enabled with a new kernel command line
>> options "tracing_leak_my_credentials=yes" or such, but I'd try to
>> avoid making it easy to enable by mistake unless this information
>> is specifically needed.
>>
> I'm not sure if this is over-engineering...
> 
> I feel that adding too many command-line parameters will increase the 
> user's cognitive load.
> 
> However, the leakage of keyboard input records is indeed a very, very 
> significant risk.
> 
> As a compromise, would it be better if we added a separate Kconfig 
> option specifically for the input subsystem's tracepoints to decide 
> whether to enable them at compile time, and then documented the 
> potential risks within that Kconfig's description?

In term of mechanism to select keylogger enabling/disabling, I can
think of the following options:

- Kconfig option,
- kernel command line parameter,
- sysctl

Here is a possibly incomplete list of desiderata for this:

- Keylogger should be disabled by default.
- System administrator should be able to enable keylogger at boot.
- Users should be able to query the state of keylogger
   (enabled/disabled) during kernel execution, and this should be
   invariant until reboot,
- Selecting whether this option is enabled or not should be decided
   by the system administrator, not by the distribution vendors who
   compile the distro kernels.
- Prevent use of a kernel tracer as a keylogger by mistake without
   having the system administrator explicitly enable keylogging.

The most flexible approach would be a sysctl, because it would allow
a system administrator to enable this while the system runs. But it
is somewhat redundant with the fact that the tracers allow disabling
specific events dynamically. Also I don't think we would want to allow
changing this configuration after system boots, so users interacting
with a production system can check whether this is enabled or not to
learn whether they can trust that this keylogger feature is disabled.

This leaves Kconfig option and kernel command line. The downside of the
Kconfig option is that it requires to choose the configuration up
front for a distro kernel, not allowing the system admin to select
the behavior at boot time without recompiling a custom kernel.

This leaves the kernel command line option, which I think is a
good tradeoff. It allows sysadmins to enable keylogging at boot
from a distro kernel without recompiling their own kernel. It
also prevents enabling keylogging in a production system by
mistake after bootup. It allows users to inspect the status of
this knob by looking at the kernel command line to know whether
they are interacting with a system that has this keylogging
enabled.

Thoughts ?

Thanks,

Mathieu

>> But maybe I'm being too careful and people should really learn not
>> to share kernel traces with others.
>>
>> Thoughts ?
>>
> Thanks,


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


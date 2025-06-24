Return-Path: <linux-input+bounces-13005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59EAE5BD9
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 07:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FD522C21D7
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 05:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A99E157A6B;
	Tue, 24 Jun 2025 05:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="P0x4iPRE"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011031.outbound.protection.outlook.com [52.103.67.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7304C74;
	Tue, 24 Jun 2025 05:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750742835; cv=fail; b=EDkXPppXQ66kA13DHFJ/0AYwaUsGtsAYm3DBNSPG1VBTRasvYtGpu/DEtucBus4+B+Kz3By+b3ReszXGHEMZfNl8hmw9Ehx8wx7OVQWukO2c9KLeIOF+CODoMnM/4Tbco8Gom0m18s59Y4pT/FDyGW0paMuSErqBNCCJeL9nEtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750742835; c=relaxed/simple;
	bh=k4lkeHFH76NBSSOO/uQGIiS4ICaXjoNbw8UaMa4Anzw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=WSsoRLggFsfJlydabll3F0mnx6MKhuW2M/tZ5Z4y4nqUxYb26mfPFMkc9hStJ2hqBniAWJw6amVa0ovXzBgOpK7GnUz3j15Sf0W1T94Ww5ErwCw/JJJvAbgF13Z7uImBbiq9ktYtXxt37GRKS+VdLdGPdQb/oaU544GQPWJuzNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=P0x4iPRE; arc=fail smtp.client-ip=52.103.67.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvqbz2O50bfYGM3EhN+legR9o0+RvwoUN4tAChJEW+NTyuYL2PciUycyB/29A9q6dWt1lauEFeLWOGec+Wu3v5s/W1BJmAzD4j+jSPbViuQSWRE2nKXsZ4p3QQiJHMBvwQMlBii2l48ekNV8LVdvbvgvVl8ZzMZc95N+69qzybuawrsidO/wam0czO52ai8VyG0Go4laE2icNuOJkZMhgEwOk+qmuoj4RcYUwiAMHC2ZAUhewsNBiXq7GFriStaXu/VaUAIcqeraPJJSssT8u3o+3UPP/gthEwPLUXVLOmbVLPq6xE7qAbyLNacPW1TJlCKEIi7Wit6QP5nPJwXVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEfyjpY5TIlP2vPhQ3WNPqbPk4iMmlcV6TImeKMfi+8=;
 b=BpzoUX6//YreEqwGIfiL3vkhpUsWk7DXcZxN45fDJ2ZpHhpFyRoj9QxJxf+Me2QU06IWDycuNjqLztGGSW/Xx66242PZlIYmMbk59ZlayR/xwITvDqAPYwy7IaGD74Rh/zy3vdTVo/Gg6Rm/dnjhcpqj6FO3OY9Ay8XianK9JT8JnKjmhbdnjaneYs20tlVIxU9sNeJHk3g7Zku783rT3EHI7FVvHZDgUM4n0Hys9gAvb0qXGxUPyudz13fC0+SVMIATI+AS9MPcrrl0skQa9qWDNONq4gkTCcBIHROHHx5DiHznNZoHvktzXBaEdmJwoRcH+4AZY+CjGRjSvwp0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEfyjpY5TIlP2vPhQ3WNPqbPk4iMmlcV6TImeKMfi+8=;
 b=P0x4iPRE8h6nHMC99ujYnQwc4ZNAnowIDXmuvBFsw1+pKTWFh3VosRq3QmtDr9bVHyF4dOqr+P1b+FmO93lGmNkmEo6lkqI/z2+gqeaFH8HYt/eLDMGWDSWZXbyTX5QINJLRe1W3M5GtnzDQnO0G9dc8nUNQvmtvufAxlaAKOvFmK1qd2pqAE1aO7H5p9XRHRiy10F2w7YqzvpSRPSUQI/WLP7FyR6bOBehl6svmYqsEMXlVvjgsi9PrpaxRlI3XzB7kE2Ld4Dljsw++vtlIv+rsabt4XJmD0//dzxl0awlcYfdFIWgYek40tnAeCviRuCZmCpaWzejhCoZrtLJgNA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB8906.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 05:27:07 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:27:07 +0000
Date: Tue, 24 Jun 2025 10:57:05 +0530
From: Aditya Garg <gargaditya08@live.com>
To: Qasim Ijaz <qasdev00@gmail.com>, jikos@kernel.org, bentiss@kernel.org
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_HID=3A_appletb-kbd=3A_fix_slab_?=
 =?US-ASCII?Q?use-after-free_bug_in_appletb=5Fkbd=5Fprobe?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250623230812.31927-1-qasdev00@gmail.com>
References: <20250623230812.31927-1-qasdev00@gmail.com>
Message-ID:
 <PN3PR01MB95977E7AB0C3A8E3EFE3DA7CB878A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN4PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::12) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <ED898956-E5F9-4969-880A-F82909AFBF33@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 14870916-e1e6-4e0f-f071-08ddb2dfc2e6
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO3yEcJ8o8qPfovctyrrA305HskQE5SZ0KmF5gTPJed4IGZJi5wWkNc+AnG3UM+HaWURlhmomhl6a20RJpWwpwySSylA3MorypmVGIeONDfWT4L949s0d6X2ETfau/gcOQ/+bZVzEqt/WN05sMurVyaLtVLk4sQdSSNzOba7BP9iSitgXcNMUaQ95J3C+QBdKjiZ8GTxCtvxWOrZHRwXVNvSfXfqLpaydM2rZ7pIuRGnPf5L1O+jCtdWw46ySuYUNhHqWeNRvPBrxBqnTnkycy01+iR5eRjEwWUUt5JjUSo42aCDtVaKxm6/B+ZOFPRcyvaevix3jc/ji6UC7Xor7P0A+D7HPx7LnhloWSqyvhlepve56CIM5Zowkpi9dPLpSI0naq+JfmM0kptCUH8OHZJDiG+nRFyY9XBgxlAgkrW/SR7kRfZF6q9yIR0vO1jOgFYuoV+W7Bac1dz12sSo3nHW94j8eiF2hOkWtVhxi/0H/zFaqdWbKaEZxPyMlitarJW6gnEpAC9GzjutBu9yh+68c91kWb54PX0ExT8Xn2rfET5PTCMcE9Xb61Ful887camfjZib7S8xH+KJ8OJUOXLGKGnSv0jcHdQepuJf0yuJVNGNwm6kdkAyEdLbYic0wF0JQOtt2JfvA1c9xEto2riCRqQ1x1B+5GMNjDX7euvNQKNFxIgNJ7jpI4aYjHPttAOVZhmk6UmpagF0wn7ntOawBhSZNuR/aXMaSRXdBLwgIRe0xgEIwUYSMKGmMOuuNE=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|6090799003|41001999006|461199028|15080799009|19110799006|8060799009|5072599009|3412199025|440099028|52005399003|40105399003|11031999003|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3NZWmVSbW5ubFMyOUpYd1g4YkxtdStmb1ZWeE9jaXcvOWlCdkluTy9DaHMw?=
 =?utf-8?B?cEE1eFFZRXpsUFBwbnN0Rm5mcE0vVTJ3REFabFlsKzZ6enNhUVQ5UDliWjIz?=
 =?utf-8?B?cjJTWjNQb0d6STBZaGMvN0N0Q0UyRWJMSUt2aHUyT2RpZmZ1N1pLZ1hoa1RT?=
 =?utf-8?B?MmpDL1ZXb1lXbkNFUGM2THd3cVF2V251Vmg2R2lLTncxRktTZlFFanJqMkdP?=
 =?utf-8?B?NUhIdndJZVVMSEYwUWdsTjQyMkh5OFp0WXZuMXl4WDdXazVtWENvSVgvZEJw?=
 =?utf-8?B?S1VDQktqMHlOUlQ4WklWVkYvNWplWWcrYVpySHQ3U0MrVEZVZUxKSEhWb1R3?=
 =?utf-8?B?V20vbEY5dXc2d24ycGV0Z0VqNkRrQzBmTmQ1UFFXbkhXbjNZcXdJZko0S05k?=
 =?utf-8?B?c2hCWTk3bWhiSzl2NUJpekhxYzBjMFJrMXpBaUZlL3VOVDhjR3dPMmNEQ1N3?=
 =?utf-8?B?Vi9ubUhGa0ZvTklPcE5VN0FDa3pRRUNZVjVzQTBYSFR4TGI5SndaOUs2djRO?=
 =?utf-8?B?a0RWeVljOTBMNkVWOWJwUUI0bkN3YmI2K2pDWVpIa0RPT083dVZ4MkdCOXJj?=
 =?utf-8?B?MzN1NFJGUzBjbEZvVWRnZ2dGc1FvYXl3Z1VpMkpKb0hWK2RDa2tZdEMrY2JV?=
 =?utf-8?B?QUtOZWpFamxhNVM4cFdKQm8zNlIwRHY3MXN4ZWJYbnFxUVhINVFiai8xdFhM?=
 =?utf-8?B?TVVWS2luNk9qTGJ4aWgxRHdPc1hyM2Y0RFFKU1ROYUlScjdlVzBieldQL2tq?=
 =?utf-8?B?eExqamVkSExOZFJiTk9ISlAvZk5PSk51MmNDY240SnhGMXZjZGVIa2UyTm8r?=
 =?utf-8?B?cGZNa2d4OC9CSVhVY1I2cStPN3NTN0I1eGh4alQ5bTA3VUJ6d1JESGcxQXNs?=
 =?utf-8?B?VW1DbkJQN01RNTF1dlhZU1NKbFk5K1RDTElYRkNHS1JzMnIranBSVjgzQkph?=
 =?utf-8?B?c0xWUFI1a0R4REtTMzR2dGxLZnl0QzNQQWcvTUt3VWpEbWJyMnh4MVRVNmFM?=
 =?utf-8?B?S3I3bGJOdm9FVmtLbWdnWWxQM2ZFMEVxS1ltcGZRQ0F3YU83bENWR04wUFpl?=
 =?utf-8?B?SW11dnYrNThqdllwSnU2QzIwMzFUZjJaWDByNVRabVFrOEN3WkxKN2U3TmpV?=
 =?utf-8?B?Mkt0TzdzTVBseERUL1RuY3l4YXA1eGU0TmF2WC9zVHRrTmk4eUFPVTFvYkhy?=
 =?utf-8?B?VjNTV2hsbFh4dnBjUGpZSVNWV0JMUjgwbXYrRWZyY21RQjZZZ0xOc3NzT3hL?=
 =?utf-8?B?SmNzbFhsSG80VlVCaVFKOUpyTzhpT2x1VmpwNkFGRWtZMTY0bWIydDFUY1hO?=
 =?utf-8?B?MXVrNXVXelZOYXN3aG8vU3oyZjdjaExXVU9FQWJPQkVObHNqNlpsc3FuM2xw?=
 =?utf-8?B?KzhFQTMvenVjN0pjdm1vTnhENHRpY0Fjb2lYN0F1QmRlTWRLcDBqM2dLZDN0?=
 =?utf-8?B?WGxqT3prQnNCQ1VrcGxTMUpwY09vZHRwOXgyNlAxZGpLY3llT2NzRldjMzQr?=
 =?utf-8?B?UWY5WmIyTS9aMUtPMGx6SFpSbGFaYUg3a0gzeHAycEpoeC9aTFd5cFNVYkdY?=
 =?utf-8?B?RU9aVUZjR29pcldsZVJMeTVqRzZOUVQ0cERUQzFkRDIrQndpdWtmWitlZjRX?=
 =?utf-8?B?ZHBYaFlqRUtOb3FHRG1hVHhQckhDRmV0bVJaZjdKdDYvUngrQkljeFFQSWdD?=
 =?utf-8?B?QWFFVnBnd253bFU2M2MvSldQK3U2YXNMMFdDd0w2WiswcmJhWFZXN2I5dUU4?=
 =?utf-8?Q?2CUv1hjWl3opffP0J0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0ZFcVZwQWw2RWIrODl3dVpwYW5iQ3RSNzVsS0VFUEY4dU12NTBEV2Fib1FX?=
 =?utf-8?B?ZGtaNmdoZGlrb25saGFRUXNlS2QwNTMvdFlPYzlUanZyRllzbmx5eGtHMkp1?=
 =?utf-8?B?aW9UU3I5cnRKR1E2VzYzOFFzWjI5ZzlVcFVlZlRlbVJrbXhINE1NRWN4ZTl4?=
 =?utf-8?B?d0JJT0ZZM0JtSmluZ3J4eGVXYUZWa25vNW1xTE1vL25lbjJTNGh6NlFTUzFW?=
 =?utf-8?B?Qk1UeHNmcEtqR1hJdVFTb1BWNi9OWnQ4VWgwVXdyYmZ4N0dYcEdnS0JGU3Vq?=
 =?utf-8?B?dWV3cm5UUDNqdDBTeXd2N3hJZGVzZXhwRjhrNVVBbUhJNDkvdjMvOFc2dDR2?=
 =?utf-8?B?UEJmUldZQmhFMmlxNHVObiswRDBaWFRxcTJadU1xZS9XZkM5MnRuNy9YbWhR?=
 =?utf-8?B?cGJMS21lUjg3WFptNlZCOFRmTXdNTk1ZMi83QmhDaHBqYUtUNUhlSWUvZ2FC?=
 =?utf-8?B?QlZYKzMycXJON2NWOTJPTnNoTWIrS200cmd6R3dyOWlVdGF4YXh0cXN3a2tR?=
 =?utf-8?B?bTRhRDJnRk9XOE91aWJDY2t0RU84L25WWGpPQ0RZR1dyRllSVldURkQvcS9n?=
 =?utf-8?B?ZEF4Ym8wRGZmaVJmd09pK2FzQzZ6Vk8wNHMvK2xVa1BINlVGbFBtYlhOdU9C?=
 =?utf-8?B?Q0tzSS8xSFVzZEJGSDNFUFNKbUdGSTBOUFlWN3Z3aDhxU1crdFpLNzJkaitT?=
 =?utf-8?B?RlJvZVZlditvVDZTV2JYWGxCWWdYVzE3aklOcGJnbDQ3Qi9TQS9sRGJlbExJ?=
 =?utf-8?B?Wjh2bmZJeVJpaFZlYmhFbGczd0tMVWRISFBSMHR1d2w2b3ZneUpnTDFzMUNk?=
 =?utf-8?B?b0VlUGVwc3VHQ3c0VUtlTlBHNzhlZ0pRcngxRStWWlZna1pkR3J3Z0lGd01y?=
 =?utf-8?B?N3JSZnl6UExCUTcvTlhZTXJDTWZRcGVENnUxV0VZV1hPOVN3a3dzVmEzWFRZ?=
 =?utf-8?B?QjZWZDU4M1dPdFRERVRkUHJQM0Nud3pMN0o5WEdyQ0ZOalN2Njh3R2VDRXdG?=
 =?utf-8?B?K1RBMkVjM1VRbm4zRHgrQnJBcExzeXZRUllua1VyMVpEZDI1QzNDU3I0T08w?=
 =?utf-8?B?aUdSVjV5cjUvU3NsWkZjajJRcFdnTy9ITFQvVitFRFF5VFduVkd3ZEJPaGpt?=
 =?utf-8?B?QzZBOXBUdzBHdnJaM1hIaERnQ0tRMlA1dEFmQXdlQmF6UXVsTGVqRGNVMHBF?=
 =?utf-8?B?NWpBNDQ5MXo5VGJYdEdpQm1DaXdvUTNwajR0WEMrODdMd3ExbXZ3V1B1NWlZ?=
 =?utf-8?B?WnU4a3ZsMzlQSC9RM1duTkp0ZFg4MkpEYlE2Zk5wTHYrdFc5OUZMUTNkMlZK?=
 =?utf-8?B?WHRMaUw1RThUTzE5MXlHN2V1dDEzbmJJZUpiOFl6cTBSdHdJZ0orRUtTVVNh?=
 =?utf-8?B?b2w3dHZPczdCQWVyN2taVzZENmtwR2cwNEY0RndVOVBVeUZxRE55SmlodzMr?=
 =?utf-8?B?ZUFKcDh2S1hORWVpdmVFNkRsZkNKYkRYNk9HbW1IWTQzWmNzZHFnanlPd3pN?=
 =?utf-8?B?aFpBSkRoZVZnM3FlckF3cVUvOU5TT1FQYVBDN3psMFRZUzkxazBaWGo1NWwz?=
 =?utf-8?B?TEJwTXRYUWEwd1RRcWljMzRnNS9aNG02c1RyNkgxZmRWTG1JT2hwY1JVZ3J3?=
 =?utf-8?B?dWFMU2NscmFGZnk1TjFsQ283VzZHOVRKSFpnNjEzN2xJNDV3ZmJzTkxDWEg1?=
 =?utf-8?B?bis5dldKV2NLY29oeWk3bFI2RVNOck5Vekx3U1k4d0hWMW96bkd5TEl4Ylph?=
 =?utf-8?Q?g0GR83r5gpjlZCOkPM=3D?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 14870916-e1e6-4e0f-f071-08ddb2dfc2e6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:27:07.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8906



On 24 June 2025 4:38:12=E2=80=AFam IST, Qasim Ijaz <qasdev00@gmail.com> wro=
te:
>In probe appletb_kbd_probe() a "struct appletb_kbd *kbd" is allocated
>via devm_kzalloc() to store touch bar keyboard related data.
>Later on if backlight_device_get_by_name() finds a backlight device
>with name "appletb_backlight" a timer (kbd->inactivity_timer) is setup
>with appletb_inactivity_timer() and the timer is armed to run after
>appletb_tb_dim_timeout (60) seconds.
>
>A use-after-free is triggered when failure occurs after the timer is=20
>armed. This ultimately means probe failure occurs and as a result the=20
>"struct appletb_kbd *kbd" which is device managed memory is freed.=20
>After 60 seconds the timer will have expired and __run_timers will=20
>attempt to access the timer (kbd->inactivity_timer) however the kdb=20
>structure has been freed causing a use-after free.
>
>[   71.636938] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>[   71.637915] BUG: KASAN: slab-use-after-free in __run_timers+0x7ad/0x890
>[   71.637915] Write of size 8 at addr ffff8881178c5958 by task swapper/1/=
0
>[   71.637915]=20
>[   71.637915] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.16.0-rc2=
-00318-g739a6c93cc75-dirty #12 PREEMPT(voluntary)=20
>[   71.637915] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS=
 1.16.2-debian-1.16.2-1 04/01/2014
>[   71.637915] Call Trace:
>[   71.637915]  <IRQ>
>[   71.637915]  dump_stack_lvl+0x53/0x70
>[   71.637915]  print_report+0xce/0x670
>[   71.637915]  ? __run_timers+0x7ad/0x890
>[   71.637915]  kasan_report+0xce/0x100
>[   71.637915]  ? __run_timers+0x7ad/0x890
>[   71.637915]  __run_timers+0x7ad/0x890
>[   71.637915]  ? __pfx___run_timers+0x10/0x10
>[   71.637915]  ? update_process_times+0xfc/0x190
>[   71.637915]  ? __pfx_update_process_times+0x10/0x10
>[   71.637915]  ? _raw_spin_lock_irq+0x80/0xe0
>[   71.637915]  ? _raw_spin_lock_irq+0x80/0xe0
>[   71.637915]  ? __pfx__raw_spin_lock_irq+0x10/0x10
>[   71.637915]  run_timer_softirq+0x141/0x240
>[   71.637915]  ? __pfx_run_timer_softirq+0x10/0x10
>[   71.637915]  ? __pfx___hrtimer_run_queues+0x10/0x10
>[   71.637915]  ? kvm_clock_get_cycles+0x18/0x30
>[   71.637915]  ? ktime_get+0x60/0x140
>[   71.637915]  handle_softirqs+0x1b8/0x5c0
>[   71.637915]  ? __pfx_handle_softirqs+0x10/0x10
>[   71.637915]  irq_exit_rcu+0xaf/0xe0
>[   71.637915]  sysvec_apic_timer_interrupt+0x6c/0x80
>[   71.637915]  </IRQ>
>[   71.637915]=20
>[   71.637915] Allocated by task 39:
>[   71.637915]  kasan_save_stack+0x33/0x60
>[   71.637915]  kasan_save_track+0x14/0x30
>[   71.637915]  __kasan_kmalloc+0x8f/0xa0
>[   71.637915]  __kmalloc_node_track_caller_noprof+0x195/0x420
>[   71.637915]  devm_kmalloc+0x74/0x1e0
>[   71.637915]  appletb_kbd_probe+0x37/0x3c0
>[   71.637915]  hid_device_probe+0x2d1/0x680
>[   71.637915]  really_probe+0x1c3/0x690
>[   71.637915]  __driver_probe_device+0x247/0x300
>[   71.637915]  driver_probe_device+0x49/0x210
>[...]
>[   71.637915]=20
>[   71.637915] Freed by task 39:
>[   71.637915]  kasan_save_stack+0x33/0x60
>[   71.637915]  kasan_save_track+0x14/0x30
>[   71.637915]  kasan_save_free_info+0x3b/0x60
>[   71.637915]  __kasan_slab_free+0x37/0x50
>[   71.637915]  kfree+0xcf/0x360
>[   71.637915]  devres_release_group+0x1f8/0x3c0
>[   71.637915]  hid_device_probe+0x315/0x680
>[   71.637915]  really_probe+0x1c3/0x690
>[   71.637915]  __driver_probe_device+0x247/0x300
>[   71.637915]  driver_probe_device+0x49/0x210
>[...]
>
>The root cause of the issue is that the timer is not disarmed=20
>on failure paths leading to it remaining active and accessing=20
>freed memory. To fix this call timer_delete_sync() to deactivate=20
>the timer.
>
>Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brig=
htness control while using the touchbar")
>Cc: stable@vger.kernel.org
>Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
>---
> drivers/hid/hid-appletb-kbd.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
>index e06567886e50..a70b1c519105 100644
>--- a/drivers/hid/hid-appletb-kbd.c
>+++ b/drivers/hid/hid-appletb-kbd.c
>@@ -438,8 +438,10 @@ static int appletb_kbd_probe(struct hid_device *hdev,=
 const struct hid_device_id
> 	return 0;
>=20
> close_hw:
>-	if (kbd->backlight_dev)
>+	if (kbd->backlight_dev) {
> 		put_device(&kbd->backlight_dev->dev);
>+		timer_delete_sync(&kbd->inactivity_timer);
>+	}

Ok this makes sense. Probably execute time_delete_sync only when there is k=
bd->backlight_dev in appletb_kbd_remove as well. Currently it is being exec=
uted unconditionally.

> 	hid_hw_close(hdev);
> stop_hw:
> 	hid_hw_stop(hdev);


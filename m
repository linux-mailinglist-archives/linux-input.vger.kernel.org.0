Return-Path: <linux-input+bounces-10346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4939A4441D
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 16:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497DF1899CEB
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 15:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8221E267721;
	Tue, 25 Feb 2025 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dTCsezpz"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496625D546;
	Tue, 25 Feb 2025 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740496601; cv=fail; b=Wr85oFixSTIDFpvII1juWBwKVQgC3oEMXxhSCtq42krQObmBuekQP/k6RaLFHzvHHCO/WI9Fsupm8YYD4eczsjHFyh20FFnnVN7OUNDkV3hbC40qMUahM/AcPk3XXD63FJ83uj6TLE+KIcLOjPb4BYXGgwWiTtwbG8/fqlAlADU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740496601; c=relaxed/simple;
	bh=5S3mnaJdlZ0cgU0MJJgtZmWeOOeTGT9FSB0YyR5pasE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jw35RFN6SPBSNsXLEgp6120Cj0j8i7c392QlpKwGf/Fw/ffSMbepAexMPHXJcjtaZbNKj1pCU7pVqFAkGWajLv696Tw81l1WI7WwFlIvYhxgdEaUYkYGmUVWckVADByIgcbgJr3dmu1obureyVujH8W0vsoweR/GEGOE5uWWFeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dTCsezpz; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubWgwLcH4+/ugDFA1lXGEQA+lbPk180xUI4UvdS/E4k7oQC/1nkAEhTQIxXoyUUg1vrWEP0sctXJYvbUdAS+jSRqjRDvR5kHGRdqFT9HKEkVxmqJYLIaNGaP2x1qFlPWx+lvYTELwNc6GzSm8hJDU/Z5XmeaDn7z6ztm0eyd0LL/Db70Mw1ExEGJHvcuyqeRxDPVRQZjW1qSJi/pHkBuyjxqPbw6sMtOFuy8yXdyO67JzT8Z2USdDvt9Sae4OIRcH80embUVycRZwQKSr7/3ycmw1/4vpJOSM1X+usj6f+UbrT1njfr4VAe4iFKtACmhv+iO/puGVbuq6o1PgSkNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGdQW6e6UCCG7Jd+zEmBMA0K/G1h8tscelbhq6E42xU=;
 b=W2GgVdeQIi1nDs6OtYOFuijwh0odaQX7THPvVjhY9ulgwbAZKXSsOqtvQzZJ6yOUBSSnZeTWO4LbaoHDSMKXIjwU8dax+BmEI5PrF1eOHF+MeaODcLPwEQRKn+UHji0wlK3obkB4O13oNsmYQ493wh2vamUMwq+tMDC2AHe4rRel7jqrZfunE0xi71+IYVqRe+wyzqSMUxaE0GmEjGWy4aM2JcFAypAf07CA9q3i9MB981Wg4ZWnl+W3EgxcgCYBfYVST69T5A/QDKJufEconpUaUaBv878qqwZLxi4pAjQdRsWJ3c1pPlvQGqGKHsvwxSU1h5B9KvCpF34XhfrQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGdQW6e6UCCG7Jd+zEmBMA0K/G1h8tscelbhq6E42xU=;
 b=dTCsezpzyYiXIRalkfl3Za7EZV5E/Ql9kNB9LsOjtsHBULJURAGCS4fuCKVTENT4bMWbjBlOoJHmlXWuhejZokKFUXR+Vslm8ouG/RrpzdN8ZcvEDC/rx9xpipdI/RsP+fEBeElAYpbdW5nHqJaFEstbcGh4h11mGRZqai2BvdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Tue, 25 Feb 2025 15:16:36 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:16:36 +0000
Message-ID: <e55711bb-5e5c-40a5-a2e1-a5a4aac9816c@amd.com>
Date: Tue, 25 Feb 2025 07:16:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hid-asus: check ROG Ally MCU version and warn
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org
References: <20250225081744.92841-1-luke@ljones.dev>
 <20250225081744.92841-2-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250225081744.92841-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bb7556-97d7-48a8-67a7-08dd55af6501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW40T0YxemF3NFloTUJJa1NYTGZNSnpWcU83Sit3bGkweU52cUNXOHBpdXd0?=
 =?utf-8?B?d1JkNUJZV0dKUHJ2OUVuTWR2aFZsZVJIUDVGMVFqTzhxQUlOYTVYNjNvd0Er?=
 =?utf-8?B?MklxSUR5bk1IL0E0ckVoSnZYQXI5cUJvcG1uc0hPV1F6ZitiY3hIeWdlRVNW?=
 =?utf-8?B?bDk5UlBVVzRvT0dGVXpZVDJLZlpxZWlvekNFclNZMERVbGpGekQvVWpzRnpX?=
 =?utf-8?B?ZHYrZmpSc1VUNFprbFlyNlZMbTBydG5IUWpDTW91YWZTcnB6S0k1MkxNYlVr?=
 =?utf-8?B?K1J4aFhlaUZzaXFnNE9vUTBTcHdBSzFuRDVEc1BnQzBmU3VVaENzeHNuZEVo?=
 =?utf-8?B?YVpuTXl2eUdmajA1RngzYlpPN3FtNVBQK01PTHptWDZlazF6WTN6dStveEVq?=
 =?utf-8?B?RzdTa05JSzQyNEUweWtUQnUxWTFUc280WStTS3pSOGNWYW1wWkFnb1ZTMHJF?=
 =?utf-8?B?U2xoZFpCdmxocVdWK3BYN3Vka2czZmFSOWtGNS83NUhvRENXcUpTejRBVUNC?=
 =?utf-8?B?WnFXWkhSV0NhMDlpbzFMdTJUdWh3Q2pNUkM0enhobkhxZUZhWTFObjhXMFZP?=
 =?utf-8?B?WWhNZnhMQldhblZhZ0ZYWHZuNFZDeWljRmE3K2pWSGpUeTkrSENveUNQWjEv?=
 =?utf-8?B?QnNkZUlKY3lDSnEzaG1kaHU5dWxGaUtZZS9RNllXaHY0MkNtK29VQnd6NUEv?=
 =?utf-8?B?eWQ3Wkl1TFVucFAvZ0tRK1VMdkh6UFFna09nenVieGRMVDBnS3pzNlZYeVMx?=
 =?utf-8?B?WStSUnl0TXRJQ3l6cVp0TVZTclMwOFlGTzVFRFA3L3VZd0RYZmVjUFBTTk5z?=
 =?utf-8?B?T3NpVGxEM1BqNFdOQzJoQm1tOEpqMzNuOCt5SmlZVzBBUGNSR1JubW4xQ0pS?=
 =?utf-8?B?WGNFWTlHeEVySGtOV2R0NHY2dkRYNkFCZjJjbi85cnVqaSsvdGtBTnFlTExI?=
 =?utf-8?B?TW5jcXR0bGFqbkRic01LNEI5cTJCUFZYL3loSk1JZWhxd0l6TXBWM2Fla3N1?=
 =?utf-8?B?dTVuUXh6TDBXSG5kZGpoL25NcUhrYmlsOXNKOFkzOVcwUGo4TGg4bVI5ZlBP?=
 =?utf-8?B?MGMxRGsvYnhrQnczdXU5Q0cyeVBpNVh2dGFuTlFYTzJ5MS85a3J1NXJycklM?=
 =?utf-8?B?a0wrc3hOR0JvdmVrd2kzN1BXeHllRjlCOHVJSHFReTNrb0pIdWt3V05RcG12?=
 =?utf-8?B?TTNsbzcrczVndFlKeWkzc0FYM0NrQWl0L3JPRlgyWm8rSFJPOWtwYkFabFJl?=
 =?utf-8?B?czBkTTY1RFlnNlZIYllSdkFtOGlYMDYrd0k5YkMwOUlob0EySzJwQ1dLL0dt?=
 =?utf-8?B?ckY0alhjaHdqdmxjNnBTU1phN0UrUTEvYXNwNVdGN2tzT3B1NVhRRXV1RllX?=
 =?utf-8?B?WkpQbHdXK251aXN3VVZ1bUZvVzluSWVjcjJRWTRBK0FUa1FmTzB2amNDZTBR?=
 =?utf-8?B?SjZSb3BodFJHZnozWkp2U21MSm5HRWhjZCtlUktlalVxVGh6My8zeEY1cXJ6?=
 =?utf-8?B?UXN1eTB6TTZ5OU9HVTRPUnlQVS9hQm5YaTFDekVCMkVRTkJjdENjSUZiUVh0?=
 =?utf-8?B?d2xscXpnV1ZRR29nektHT2x2Qy9ZZXdKL0R1TExsMDFQMGNjNjN3NFdFUXhC?=
 =?utf-8?B?QWNlamR6eTNjUHNyWGlTMWcrUUJvUFdUcGtvK3pyek5QKzFRVzEwWmY2ZHVo?=
 =?utf-8?B?ODMwNFJNVEhhVEFKMUs2Zit1a2FiZVdEYnB5UUVGU2hqelVKOXFrSWZka3Iw?=
 =?utf-8?B?RE5TNlNxbnlJUXJDR25QWWV3amFjT3R5MlBEbklxWTc1T05VVm1RMzdPY2VV?=
 =?utf-8?B?d1FwSjVHeWdnY2oyWlhRQUtnM2EvT2VKcU16c2ZuMDNBMW5kb2V5RDRTSUQ1?=
 =?utf-8?Q?evR2/p3jXwBU0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTNtYnFIN0J2dEpiRkdmQXE2Q1QwQjZ5d29zcld3UWphTS9YTHJzZUg5SWVB?=
 =?utf-8?B?ZWxLQ2V0ZmVlbWVoZDVUeDJwR0RtVU9CR0FTczdMc0VKMXQ5WXVHMllGTTNB?=
 =?utf-8?B?QlV4ZlViSlNEODZSZEEvZHZqajNhQWdscEt4UEowME9WWDA0V1h4MG1LTS9t?=
 =?utf-8?B?UTdMeEkxZWFMdjNWTFdheFRobFVHRXZKcnVlWGM5UDV5VWFpblpaYWdPNlVo?=
 =?utf-8?B?cVVoMmpORWpVaHgyV3c3U1dzSktiSVVVSHlsdFpYbGlLT1FiMmE3cnNQNjU2?=
 =?utf-8?B?L0lyd2E4MkppYnNzRmZsMVZPb1JITEVqcTRMTlNVWExYN2c5Nk9Oc2R2Q09z?=
 =?utf-8?B?TXV0azFNckswZjBiQmFlZTlUMHNlOGZYRVlEQ20wcFh0NThRMjJ5bEpobGZ5?=
 =?utf-8?B?L2syd1pORzFUQU0yNXo0eGxxazNFaVkwMndSWjJPN1FZUGtPUEp0TEhRU3dt?=
 =?utf-8?B?UFdGZ2xLemNKcUdOT2FyWTdBZUU1dGtXVVZSaGNUWEdaaHJMSFhiVXJOdzlx?=
 =?utf-8?B?T3NtVUhBNU1KdFh4L1ZnSW0xZDhkWUlWZ2dyNi9wZDQyNDNZQXFYT2YxTTFk?=
 =?utf-8?B?NVhPaHAvMUlyajVBU2FKb2Jqdy83UzgvNjREY1NqTzQ5TVBiZ1BJb0FsWHdP?=
 =?utf-8?B?WUhlU2IrRTlUaTJVdUFCVzQxMGUzbVBBeWIzYUxmMVkyM2pONDBSV2hBbGRu?=
 =?utf-8?B?U3pqS3RrQnlIMy9sMU8yMEY1Ry8yRjE0d0x4RjZ5Z1ZaczZ2cnVCSmhXdlpm?=
 =?utf-8?B?QUJxWHQwZXlxVW9BZXFzZ0V5UUVnWml1UmNBcEdBczNWOUVSNXNoV3N1N0NQ?=
 =?utf-8?B?di9tN1I4d2ViekZ6TWJDQU81bENCSVJYOEdST2FVOXhwOENZY1BKY1lJZ2R1?=
 =?utf-8?B?SHRSQUowRXdjcFpkeHFRT3FOUHRKMjdDbisvRjQxTms2NGt2UTdZMVdBMGsx?=
 =?utf-8?B?UE9YVDF5S1hNTkNTazhIa2VjU1B2cDZ1MjJXenowZU1hY2VaTFV6MU1Bamhz?=
 =?utf-8?B?TkRKK2NNWUhUd0gydWxzR0w2QkdwM0FNRmU3b0NoYlR2cVZDVzhlUXk2SWdi?=
 =?utf-8?B?ekxVSXp3RU91a093WGFLYnRLam11TXc1MTE5T3NsS0VYMUdpNVd2Tjg3Y1pD?=
 =?utf-8?B?blkzY0JWR3ZjL1FISzJQY1hpRlZ3TmhzUjFqTTZpUTFYdXVOWkw0NFc4cCsy?=
 =?utf-8?B?ZXViaUEvUVpNYkdrZnlhNlUxSjJQQXhTd1p5cjNGVTVTYlNyVStka1pZZ2d2?=
 =?utf-8?B?QVp4US9RQkErQVYxVS9JK2hZa0tpV3FvVDY2SEFkMXFnT0VBQWJGVzgrcER4?=
 =?utf-8?B?TW95cStza1dCRWR4R0pRZUQ5MnJBaUQ1K0ZqWGgrSHFkdjFWQi9zRlVnQWVk?=
 =?utf-8?B?bnFpeTg4bFBTdHFuVnYxc3VtdG10cm1rQXk2VUZuZ25EQi9kQ2VPZHY5bDJl?=
 =?utf-8?B?V2FkY3Q0TjhzU3lpNVphQlM3dVBhNWVLTExhZU40ZFcwSWtuWm1XNVVBZkUr?=
 =?utf-8?B?T2pnVVFYMDc4T2dJWi9ZV2JtbmtOQnpFSGpaU2VDMzJCNUtEOFlzM2krMW5F?=
 =?utf-8?B?L29nYUFwQ0tRR0lveG00bSsrbkxPQmI4cnEwRE5tbE1sVW1KU25sTC9yNmFU?=
 =?utf-8?B?dDVpRFQ1MWJidlQrRStTL0hSV3E4QVgvVmlRLy9iVEpnS2s3b1RLYmw1cm8y?=
 =?utf-8?B?NG1Ib2VNcWZSWU95K1FnSjhCTmp1aEJKcUd5cnRDb1RjL3YzK1g0azRwdWdU?=
 =?utf-8?B?MGR3RDg2dHRwYnUxcHJXajk5WFNJN0orOFNRY2FpRWpTTjU1ZkZramw1Kzdq?=
 =?utf-8?B?azkrNWdvU3g0U1ZPN1pYR0lhNGZnRWptVjFBL1ZvZFdCaUxsWlBDVnVzeDd1?=
 =?utf-8?B?dmZvSHZUSldkcTdOWjk4dEwyTDdJL0laNGVsMmhmTFM1TDI5dFRmbWlTTkkr?=
 =?utf-8?B?THkvNnNrdXd0V05ZMi9uTXdqOTBIY09LS3VUdmlEbjE1ZGRZVTBYK0NhdDcz?=
 =?utf-8?B?NTY1bDFWb1d0V3o4QzlRUEVNYVlVdUVQajBya1RidTZMMlA2YVk0c2FRckRR?=
 =?utf-8?B?K2U5aFpGOExYZGx6U29jY1hsOHIvVVgwTm90VUc1QVMwQ3RpeXNCdmtMNW9n?=
 =?utf-8?Q?BGEqs68zDVc7dTO/m9p/IuZtW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bb7556-97d7-48a8-67a7-08dd55af6501
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:16:36.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhWNVjCWCdEYvc5/e+y+kN9azG+BZYoZrpGHf5n4KYBRzmD9dCH3xWbp9BZhgiSAeZOQf04MY4aXdPRK7POy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353

On 2/25/2025 00:17, Luke Jones wrote:
> From: "Luke D. Jones" <luke@ljones.dev>
> 
> ASUS have fixed suspend issues arising from a flag not being cleared in
> the MCU FW in both the ROG Ally 1 and the ROG Ally X.
> 
> Implement a check and a warning to encourage users to update the FW to
> a minimum supported version.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>   drivers/hid/hid-asus.c | 97 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 46e3e42f9eb5..e1e60b80115a 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -52,6 +52,10 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>   #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>   
> +#define ROG_ALLY_REPORT_SIZE 64
> +#define ROG_ALLY_X_MIN_MCU 313
> +#define ROG_ALLY_MIN_MCU 319
> +
>   #define SUPPORT_KBD_BACKLIGHT BIT(0)
>   
>   #define MAX_TOUCH_MAJOR 8
> @@ -84,6 +88,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define QUIRK_MEDION_E1239T		BIT(10)
>   #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>   #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> +#define QUIRK_ROG_ALLY_XPAD		BIT(13)
>   
>   #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>   						 QUIRK_NO_INIT_REPORTS | \
> @@ -534,9 +539,89 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>   	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
>   }
>   
> +/*
> + * We don't care about any other part of the string except the version section.
> + * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
> + */
> +static int mcu_parse_version_string(const u8 *response, size_t response_size)
> +{
> +	const u8 *end = response + response_size;
> +	const u8 *p = response;
> +	int dots, err;
> +	long version;
> +
> +	dots = 0;
> +	while (p < end && dots < 2) {
> +		if (*p++ == '.')
> +			dots++;
> +	}
> +

I think it would be good to use strsep() here.

> +	if (dots != 2 || p >= end)
> +		return -EINVAL;
> +
> +	err = kstrtol((const char *)p, 10, &version);
> +	if (err || version < 0)
> +		return -EINVAL;
> +
> +	return version;
> +}
> +
> +static int mcu_request_version(struct hid_device *hdev)
> +{
> +	const u8 request[] = { 0x5a, 0x05, 0x03, 0x31, 0x00, 0x20 };
> +	u8 *response;
> +	int ret;
> +
> +	response = kzalloc(ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
> +	if (!response)
> +		return -ENOMEM;
> +
> +	ret = asus_kbd_set_report(hdev, request, sizeof(request));
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = hid_hw_raw_request(hdev, FEATURE_REPORT_ID, response,
> +				ROG_ALLY_REPORT_SIZE, HID_FEATURE_REPORT,
> +				HID_REQ_GET_REPORT);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = mcu_parse_version_string(response, ROG_ALLY_REPORT_SIZE);
> +
> +out:
> +	if (ret < 0)
> +		hid_err(hdev, "Failed to get MCU version: %d, response: %*ph\n",
> +					ret, ROG_ALLY_REPORT_SIZE, response);
> +	kfree(response);
> +	return ret;
> +}
> +
> +static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
> +{
> +	int min_version = ROG_ALLY_X_MIN_MCU;
> +	int version;
> +
> +	version = mcu_request_version(hdev);
> +	if (version < 0)
> +		return;
> +
> +	if (idProduct == USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY)
> +		min_version = ROG_ALLY_MIN_MCU;
> +
> +	hid_info(hdev, "Ally device MCU version: %d\n", version);
> +	if (version < min_version) {
> +		hid_warn(hdev,
> +			 "The MCU firmware version must be %d or greater\n"

What do you think about:

"The MCU firmware version must be %d or greater to avoid issues with 
suspend.\n"

> +			 "Please update your MCU with official ASUS firmware release\n",
> +			 min_version);
> +	}
> +}

Thinking forward to any future hypothetical devices that don't have a 
min MCU version type of bug I have a suggestion that you put the 
min_version into a lookup method of some sort.

So the flow can be something like this:

static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
{

	int min_version = get_min_version(idProduct);

	if (!min_version)
		return;
	.
	.
	.
}

Or you can do a switch/case instead of get_min_version().

static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
{

	int min_version;

	switch(idProduct) {
	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY:
		min_version = ROG_ALLY_MIN_MCU;
		break;
	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLYX:
		min_version = ROG_ALLYX_MIN_MCU;
		break;
	default:
		return;
	}

	.
	.
	.
}

That way you have really straight forward logic that 
validate_mcu_version only runs on devices that you specify.

> +
>   static int asus_kbd_register_leds(struct hid_device *hdev)
>   {
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> +	struct usb_interface *intf;
> +	struct usb_device *udev;
>   	unsigned char kbd_func;
>   	int ret;
>   
> @@ -560,6 +645,14 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   			if (ret < 0)
>   				return ret;
>   		}
> +
> +		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> +			intf = to_usb_interface(hdev->dev.parent);
> +			udev = interface_to_usbdev(intf);
> +			validate_mcu_fw_version(hdev,
> +				le16_to_cpu(udev->descriptor.idProduct));
> +		}
> +
>   	} else {
>   		/* Initialize keyboard */
>   		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> @@ -1280,10 +1373,10 @@ static const struct hid_device_id asus_devices[] = {
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD},
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
>   	  QUIRK_ROG_CLAYMORE_II_KEYBOARD },



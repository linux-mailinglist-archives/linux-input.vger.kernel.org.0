Return-Path: <linux-input+bounces-10410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE0A481FE
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 15:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED562189D218
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 14:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBB12327A7;
	Thu, 27 Feb 2025 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tBQcvzGY"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A322F166;
	Thu, 27 Feb 2025 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666923; cv=fail; b=CtMTjwFw4sI4bMB9L6stcq4Hd19D2TGoeLs/jS/Q2K0Xjn8oDZmf9XWlQbKKvLkrYMjB0QKMDQLtk+O/BtbYabHTAyR3eJsYmCL0nVCX+W3NaK0vyYAmaDBQuK3hntDkYtyMPz7V+TFZMZVBabvBGoXTV0WkzNu+mee6uRrZOQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666923; c=relaxed/simple;
	bh=LKIK9H0e7MXTMMh6+iv0NkYB1gqxJCTrhoR/8TlbLM4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dLpwpijzhyFOaOJ+LFaJfNmtpCalK7i3AOQOPfq1F0REF2NKA498U1g+uQgzy2TCi+BiQ60Xz1+gwtaNsziaQch0rv9nAxveWfxcxZ3gquBbHiaUbZJTNYkwq+juv7wtdomm3occQwdpz5UwksZeefADtR61YOMeTBfSc7sVDsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tBQcvzGY; arc=fail smtp.client-ip=40.107.220.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szoV3/xRVdOs0IJizdfUk2mQChd+svjoHYdja58DuLn8d4skTAgJF8t991VDczUzW7J6dARjGeJ26qvmBcHgL0ArPeFl+eOIS7ap6vaVnQIXdF0krvF3w32ARJUMriCzkzi6gzatvdD/lh43ebMP2cZu7XnlPyihe11u2ZExDkNPqNgnV8Z4sarIhpEr022seCUpQakjt28kRgQDjE25BsvxtBospWC/3ZiUT3jAO5Kg9TM1Ii4goSZN2pXJD5j3COZ9RUKBpwsP3Ycjj4HhQ/iwvGSPKLPd3P5mXt0SeQ+2021SStx0rg7fPwhw7RNSPCEhqUsln1tuXa0FU9ErMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJWwKJgsxXuBSuy4xe5PtZsJYDts8SRJQ5cWzdJ+qJM=;
 b=q2+ghwCX81reM6fLEWgtH3LbFQxJYQnqAX3H57ex0YYXsgwDRepbHS5wRddCwEjI0MRW2MUVFGh4eDExcqBHsELug35YkCBu5TTbeQgSn9j+KvFq6JTdYfJ0Dq4qtOwvSdm3BL5qOj3mSAsNR2u+DSwf3MTQwzhdv4ikq0dmmf+xHVc05zsIM7j8yQLG1dIAIIsEBHZzJGZrhDZ5E2Zif2kwFb59ZBN2I697mGCAJPwJBMy81OC2ydwQCNDR66xee07oIjpnh2LhCxTaD8fPef+01UG+NMZJo8FezXD82vy/odReFFmWwpKDSLK0zdfKteGy0ASD/Br9QS9rDLqxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJWwKJgsxXuBSuy4xe5PtZsJYDts8SRJQ5cWzdJ+qJM=;
 b=tBQcvzGYa8+r4W4sOjNRqRbfwN5Y7bwQT4jcCgNW/6ch7V8Nk9M0C3pOfY5NjS0quB2udOXGkfECUU/zWejlIro8A17kFPBrTQHy2SLgAHjM7U6E3h5A6SugtFxFFfTNRyAfZurbEbnZqGsJ1zfrFZJLw9TwZaEPIewIvva1yv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB5660.namprd12.prod.outlook.com (2603:10b6:806:238::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 14:35:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 14:35:17 +0000
Message-ID: <78e96d3c-be3a-4a62-a6cb-4540f4a5c86e@amd.com>
Date: Thu, 27 Feb 2025 08:35:15 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org
References: <20250227085817.1007697-1-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250227085817.1007697-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0191.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 31900dae-ca2f-4c7b-b9f5-08dd573bf444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MytESGRnUi9CbGRYWjNLdUZ5WFoyMXFmQXNka2huUlFkVGMxbmdTRCtnTUsy?=
 =?utf-8?B?bm1nZzRVbjZVR1BKek4wSFhLcGxjMFlyYk9ldWNvLzFEOFpxWGFJbmVwYmR6?=
 =?utf-8?B?M0VRVzEyRXhCWEpOdG1YMUlSUEoyeWdpUll6bTdtTER0RUdmclgvM0ZmVEpB?=
 =?utf-8?B?S2VvQmIvdFZMSzl1ekl5VGZJTEZ5cUVsMG15Ujh5NGdqaUxNTkkxaWhYWUdK?=
 =?utf-8?B?YmpUZzZGNTNmdWp2MEhaMXVTZzBPY1lWYWo2bFlOZ3BQTDhPZDhacXpCbnNv?=
 =?utf-8?B?SVhWUW12Y1FPRmh4TnZ1bWJDQXJsM3ByQ3ZYcHdVTm9lWE5jcjhmbjk4aGUr?=
 =?utf-8?B?TDJUbW1GTjQ1WW5aNFoxa0RtSTAxZ3A3elBaYTU5a1RKdzNSbGhCWlZFVUt1?=
 =?utf-8?B?NHN2dEtzUUdXcExWZW0zNGtManEvM3Y1ZWZNR0Q5bS82eDZYbTVCdW9RUGZK?=
 =?utf-8?B?Vm1iU2VYSlNxclFGdlExVlplRDlPUTV3ZUNNanJObUg3RHN2UG5YTXpvdDVG?=
 =?utf-8?B?am5MZnZXR0RYYlF0ck00K3VsRG5jSDM5YmM4NWpyRTNXQTRnR0lnZnV4a2w0?=
 =?utf-8?B?N3BuNlo4U3g4Z2FJMi9mZVkweEUrWjdMa2d4Nnc0dmg1MTdLKzMxdFg0ckZM?=
 =?utf-8?B?YTAzSE43ZDl1NGNsUDJQRllseEZNdlpNelVWOXg1QVdOUjR2VXUvcm1ZVXFP?=
 =?utf-8?B?WmVMdHU5RTJWMnNsL2l5WURjeCtCK0FQWDR0M2YyUGY3R1dwZ2VLYzc5ZFZ5?=
 =?utf-8?B?dEhLQzRHMzVXdWJ6ZE91bFhkd29sU3pGT3crSys2d0ZWZHhsbEhWM1FHLzJP?=
 =?utf-8?B?R3pCZ0h5eXJjM0dDcTJFSW42NVBhRkQyVFNSbmhrUFR0ZTJzalBtTVk5ZFlC?=
 =?utf-8?B?ZlFEdldsK0lVUGpGZVhOMjZqbzVjaVkxRkxFbDVsNXNYeWcxN0JwWS94N0cv?=
 =?utf-8?B?WGhOYk1TTlRSS0VMREFYQVRrZkd2MGpYUGJTalpqUFRraDN2YSsySEQ2Smhw?=
 =?utf-8?B?SlRuT20zTENsamxGdGFjU3A3NDlOVjdxcnFOblFuNGlHWTZ5L0h4SlplT2p0?=
 =?utf-8?B?VklHTk9EbzJHV2JMZEVTNHNpbE9zNGFrT1h4dGJoTDY2VHh4M1NiMGZYZVVo?=
 =?utf-8?B?MWlleUladG5MYUlTclBJL2RtaW5KSW9VZUpCb2h3VUtQd0VydUpuaDVRTFha?=
 =?utf-8?B?VVR6T20veW1GVTlUZGtrUy9BdUtyUjRLQmVVR1J5ZlVzT2M0Sis5aFBqSFZ1?=
 =?utf-8?B?dnRZMjV4eFh4Qi9pOTRhS3ZINDJWQyttSEljWVdBVXZpTmFiazQ5RGlQblYv?=
 =?utf-8?B?UnlnSkZ6MHNMTzlWTlhwY0lKY2RpTktaVUg2aysvT2xNaEg4ZDJuQnVqOUdF?=
 =?utf-8?B?UlRzNGNZcEpkN3M5dFcxU1pUMWxKYS8vcVhhUTZmTUZnb29EODlNakRvZDlD?=
 =?utf-8?B?aFJHd1d3VE5oNjRjWGlNYlJ4OERsL2h4Z28vYjRmbUFpcFpmaGM1OFl0eWRD?=
 =?utf-8?B?ajNyRGdrTzBOWFhleEpNRVVQVWtFdHRwVWdnYVdCcitPS2lDQXRKTWZucE52?=
 =?utf-8?B?OFdWbE5CUVA2em85ampIRldsZ3E0SENtSFgwbHpYZFdUNlJvUGErYUR0RTRW?=
 =?utf-8?B?Nm03eVpMQnlURG5Ka243V09TOEcxcGJJSDBVV285d05LbkRqaldMOU1yWFNm?=
 =?utf-8?B?WXdaNmRjZVhZQit1eFNsWXcxbU04bEtGa1poenNyeWc4aUpjQ1NGSHFvOG8z?=
 =?utf-8?Q?jBVHuxmNaTlXEWBFHIiAK1KHyzS13L7BIt1BWTC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHB1MXlob0RFVTIzVnBOaVU2YnN5RXkwcEdIWUxlSUFLNzlsUS9QdW5ORW5W?=
 =?utf-8?B?eTVwb2RyZkJockpZSTZ2QkdtNGFDN1BaQ0pZbFZ6dCtQUm95MGtUNDFWZ1U0?=
 =?utf-8?B?Z0R6LzJjK21lb0xhem82emZkTS9IZUZqcFI3NnArSk9rQ0d6Z2RYRU0yd3Ni?=
 =?utf-8?B?Uyt6aFJHKzRyTjU1YWg1Z2xPVlIxSnN3cCsvNm5rcmFJb01NcUR0OVJmdHlC?=
 =?utf-8?B?Umx4V1RiMFZHMEpiT2JQcFpUempHN1VUcGtsYjNjUGc4UzdZN21PSlJmYWIr?=
 =?utf-8?B?dzRCb05mdnc4aXJlWWZnU2ZQaHB4R0hUdWwrUlQrNzIwa052cmZ1Ykcrb0Nr?=
 =?utf-8?B?Vmo3Ukh4dXFrQnBNd1BEelUwYjcxR0FEOFY0TDJpNWdvcTgwT0VzRk5QeWJI?=
 =?utf-8?B?ZC9uaCtNQndGakgrKzZmMkd6UGhMRndqa0gxNkFIOEUvSExmV2pJYUtvRFlC?=
 =?utf-8?B?aGY2aHdWWkx2S3Y4R1hSSC9HZS8vRUxnMENtN2J5WDJ6eFowR21BcDN1eldZ?=
 =?utf-8?B?YnN5TGtjU0tjU2gzSWlaU1F5MWxEUVNMM3c0MjJhdnNBck9VbVFLMTRKdlo2?=
 =?utf-8?B?aTkvZ3ZHdjdPYXVvNy9tbGVOSkJYMkxncUVKRVNZdUtJMUQxMmM1SFRJK2Jv?=
 =?utf-8?B?LzNFMmRLTWYrTktVZWdqanl1cW82MkUySVVWTExBZlZ6SjdQMXpFTU00dmRo?=
 =?utf-8?B?dCsrRGRodlhVaURTT3BUTVBqMVR5aGhoQ1N3NWpSak92YTJWTktKNEVtYm5r?=
 =?utf-8?B?MVo4U1VuM09GZitZUURRZU9XdU5tOE9LSEIyY3NEcS9TbzlXeS9BSjFSYm91?=
 =?utf-8?B?QktQdHpsa2Vtb09zUjA5MkNrRkpjUHJQdDdrQW1KakUwZnNpZHpkWkdyWEhy?=
 =?utf-8?B?MVh0U2xoY21FUzArZ3ozS3JHUFBsUmhNV2ZqRDVlcEc3ZzllZ2JvM2laMTRw?=
 =?utf-8?B?a3ZBZXJXS2hPTmxqZmJCWDRVOTVwRHNCaGE4bktuTDdvUFlTRmQzYndzT1ND?=
 =?utf-8?B?NFhkVlNhTzE2V01IbWdiRm5qZjcrN2FkV3pBU2pHTnM4dlBxTCtnUkd3d1ZJ?=
 =?utf-8?B?dkhxVE1obVRkTHFsK0s5WXdDSmg5RE0zYzJReGhiZWozQzZwR3NMYVRUbDFX?=
 =?utf-8?B?VEFibWVnNGJJaGtZN1RURGxGK1hIOGVCZUR2UlRSVHFVMG44RVhLamZSUjU4?=
 =?utf-8?B?ZjhiOXNBT2JtUDhOUjF0azYzUXFlci9YaHNBQ01HVlY3WDF3OEs0cXQ3eGR5?=
 =?utf-8?B?Uk5OMWpERy9zdWZkRUo4bnZGRGowb3JVMEExcXd2TVNQZC9SeW40aU02VVBT?=
 =?utf-8?B?NTdJZUc4M21GRitubFMrMVNIeEtJYTB0aWdCaHF0UStxVGxVdVFnTEp3dUhG?=
 =?utf-8?B?aU00a2dBeFNIWTl0S1A2WkdlOHc1SlhLZEgxVmFkcFd4aW9pVkVGM1pubjNo?=
 =?utf-8?B?WjVscWdZK0dwKzVpcXlSSW5aeUN4c0JtLzVMMDdjak1PTUs4bU5LdnBMU0R6?=
 =?utf-8?B?N2ZsTEtQYlJ6U3g0bXczT1g2MDNkcnZNcDFnV0VzbDR6dGJkTVdKbXFpTEZi?=
 =?utf-8?B?cEUzRmNKa1VsazZIcnQvbWNnbnVWb0krK3p0RUlHVVh6KzVqTVNMSy9BcVB6?=
 =?utf-8?B?aGVCSjAwOHJnV1JnZ1p1N092bUg5TGVYbzJFWFNSTVpQQ1ZCQjRsMUVVVS9E?=
 =?utf-8?B?Y3N4Y0k0MTJVZ2lMSVpub2NwRkNtWS8zM2dSNldEbjZzaXpOVnFDbzdTend0?=
 =?utf-8?B?WGQwQysxUnpvbDBVNjYrcmxRaVZ5Q3ZKajJOZEZTQUZ2SkRPY3BSRXJqcThW?=
 =?utf-8?B?Tk5qQksxQlRkdXZaMUxVMkJlWU8ydFJhRDN2eG1iOU5zbzBxbEl0SVBXWGd3?=
 =?utf-8?B?Rjh4aVhkdmJhS2krS2JzNXZaU3Exekt0Nng4dWh5eWFDS1FTNlUzQzdDQm5k?=
 =?utf-8?B?YVBydk9VMWNvMXVtaEowYWNDeEpaMGtsemM5NkpqMDBXa0tBaDR2aFlKMEs1?=
 =?utf-8?B?eElUZHlnSU1qLzdQa2htWldPRE1MdTZSL1B5SUcrV2lRWE0zWWxvdWl1RTJD?=
 =?utf-8?B?OFV6QnVadjJBRld2M0ZqSHluaFZId2h3d05KYjNoMzFOYktPUWZ6VERaOUhr?=
 =?utf-8?Q?4hINvfC6KcT3Ce/OKuUI+Lt/T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31900dae-ca2f-4c7b-b9f5-08dd573bf444
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 14:35:17.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RezLxZh2JanZ1ccqBrls1/tqjEj08grZrhyKvZ4nGjq59GlTCsK0EZUpjkSBtQUxI8kZLyRhv4b6ICnznwFo1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5660

On 2/27/2025 02:58, Luke Jones wrote:
> This short series refactors the Ally suspend/resume functionality in the
> asus-wmi driver along with adding support for ROG Ally MCU version checking.
> 
> The version checking is then used to toggle the use of older CSEE call hacks
> that were initially used to combat Ally suspend/wake issues arising from the MCU
> not clearing a particular flag on resume. ASUS have since corrected this
> especially for Linux in newer firmware versions.
> 
> - hid-asus requests the MCU version and displays a warning if the version is
>    older than the one that fixes the issue.
> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> version is high enough.
> 
> *Note: In review it was requested by Mario that I try strsep() for parsing
> the version. I did try this and a few variations but the result was much
> more code due to having to check more edge cases due to the input being
> raw bytes. In the end the cleaned up while loop proved more robust.
> 
> - Changelog:
>    + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
>      - Adjust warning message to explicitly mention suspend issues
>      - Use switch/case block to set min_version
>        - Set min_version to 0 by default and toggle hacks off
>    + V3
>      - Remove noise (excess pr_info)
>      - Use kstrtoint, not kstrtolong
>      - Use __free(kfree) for allocated mem and drop goto + logging
>      - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
>      - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
>        correct the message.
> 
> Luke D. Jones (2):
>    hid-asus: check ROG Ally MCU version and warn
>    platform/x86: asus-wmi: Refactor Ally suspend/resume
> 
>   drivers/hid/hid-asus.c                     | 111 +++++++++++++++++-
>   drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
>   include/linux/platform_data/x86/asus-wmi.h |  15 +++
>   3 files changed, 215 insertions(+), 41 deletions(-)
> 

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>


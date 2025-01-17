Return-Path: <linux-input+bounces-9335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03404A14E88
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 12:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6192188615C
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 11:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F2E1D8E12;
	Fri, 17 Jan 2025 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ico.es header.i=@ico.es header.b="h24nd2A5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.ico.es (mail.ico.es [90.160.63.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1891FCFEC
	for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=90.160.63.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737113698; cv=fail; b=c7gK6ZxwKZub/UzQkyR7L55kZu9QGX/0m3vpwIXpGV4lV5n7zjOEfOtSEkLIwMcELqOECddw8Pws6xbVivda/fSOcHXLkdZAUU3sbcd9RL++y5CydrJC7Zv6g7rxUTa+hfU2sfBpRl6HXkF0egIiR+4NCapV8u7oNglxkOwB5Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737113698; c=relaxed/simple;
	bh=g51lFYqWu+LUtt0UJd0fl3LiFEehLhZaViwwfqpyeqs=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=vCt68igMglaD6Bgb6e8E0y7pwzGLqYUqSsi6/JzBUNk6al0DmBz/9GI7v7r79SZh+AtRuz5hqnG39PdBQUTeWIY1wpuN067QH0rv1SKXHBAiEByKD31ZCn4sI51Jy1CkJnh9VdhGGAsXwHzlplokb4wIXbehy0MzFxXx9K7xoFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ico.es; spf=pass smtp.mailfrom=ico.es; dkim=pass (2048-bit key) header.d=ico.es header.i=@ico.es header.b=h24nd2A5; arc=fail smtp.client-ip=90.160.63.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ico.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ico.es
X-CSE-ConnectionGUID: fh/IuSSQRR2iEOAeSml67w==
X-CSE-MsgGUID: is9ydkISSoWl3DSpsD8ZFQ==
X-IronPort-AV: E=Sophos;i="6.13,212,1732575600"; 
   d="scan'208";a="19878106"
Received: from mail-francecentralazlp17013075.outbound.protection.outlook.com (HELO PA4PR04CU001.outbound.protection.outlook.com) ([40.93.76.75])
  by mail1p.ico.es with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:33:41 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIFjUM/wQFVDp+UcevJsGxmXBq8BzwjI/7XXy8u0y0c/nmFmX5+iOg6QSX5ltnchMSRpDu0dbZkuGF3WibGXqzKhkTUy5Rp7hoIeV6PNniV3gBJhCnql1aH6yGjWW63pmtI5kK6clFsbf/siCxisjb07DpP4EHBgiZ6454bUnj8nWT0BuKbLrNP2dtmcBPAawS5aodgJ+jB86dVJmmx3xW/aoqPX8X2BjVzABKw5TzN3DS1g8foQTHuVXeKzw8oNOIfeCNzfGvI7bCd+nq0z53uRf/OMAbtldFkho3aZ6NMh4AUm2Sgwrxr8cDl1wLo0TcXWtXc7LzYaMAhC8qF0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtDx3itOtJCFY1PF/YeBlRD54NLlVcWJ4VAZt2JJcQE=;
 b=rBOamQUOHlCF029UGZHctXkxaKVeGkaf916s+M25sRIOjZSmcCHixWVuGk5PpLJXYulwZsl7DKa8ga16LrNZRK3yi0EoRXhnpX6bneFQS2Q5KK3tEJStHvrHgywiWJyFhKLAiFe2XC4NIiE7PaH6ykx6VQ6dK85b3cofTeiKWf5YcEzdbMWCtoLdfMjQ1wdz2NUA0XACcnAP7Gghlj37m9lagtQvxdKTEn2qiV4Rq2s2ADEEgjix9jcRuASJLpdX8aA3KJw2y6ZrKsZ14f4ZCXkz4bOgbzvboUorV64CyGo6u46FMrAnEheyjRyq5jgGWC6e7ShaI3avkWiv2+Je8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ico.es; dmarc=pass action=none header.from=ico.es; dkim=pass
 header.d=ico.es; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ico.es; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtDx3itOtJCFY1PF/YeBlRD54NLlVcWJ4VAZt2JJcQE=;
 b=h24nd2A5TEuBMehVeOxCXlfieAPE/Fq2pAMWS7c2iPh20er46os3DYwxaxWTdaqwkS00Bkl0hZ9dHuGr+0zj39tgN6Cvx56AYWidUDFc60MBC8hqNlHmQ/sCGWtUuA9HbSZFReF/boPnsQMX1Pu4p/roopK7EoZUYV31DDM6ssL/eK5jiMxAC7u8WzEf8MIC69Zp2uLlqpQ5PHHfp4lsexnQg/KEWfQfKren10iNCPP0ZGEp6/Zw3ec2IECV7b4RFUu9ZqaKBqZKPVmO23+BXKjW2CsAurxVFNZLNo/QJCIsCgzWl0F6B9HdIe4cOSGkoUg1glyMMTsIUlfiXkW4AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ico.es;
Received: from PAVPR08MB8943.eurprd08.prod.outlook.com (2603:10a6:102:326::22)
 by DBAPR08MB5862.eurprd08.prod.outlook.com (2603:10a6:10:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 11:33:39 +0000
Received: from PAVPR08MB8943.eurprd08.prod.outlook.com
 ([fe80::e6b8:866a:7bf2:a5a3]) by PAVPR08MB8943.eurprd08.prod.outlook.com
 ([fe80::e6b8:866a:7bf2:a5a3%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 11:33:39 +0000
Message-ID: <ef1464a9-7903-43a3-86c1-4b3ad5be6547@ico.es>
Date: Fri, 17 Jan 2025 12:33:38 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
From: Pablo Barroso Cubillas <pablo.barroso@ico.es>
Subject: Synaptics trackpad freezes with kernel 6.8.0-51
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MR1P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::7) To PAVPR08MB8943.eurprd08.prod.outlook.com
 (2603:10a6:102:326::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR08MB8943:EE_|DBAPR08MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe964fd-e25e-48a8-38e9-08dd36eac9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3hIcnFFQlhWclE5Qkk4MXMzbW9yWTlhdUo3ZWhwdnNsWnpZUVZNMnB1ZkJl?=
 =?utf-8?B?MnEwa1p5alpMWm5IQzJhZmVFN1R5dGRob2VEUWFvejl0ZVFhZlRucTZiOGw1?=
 =?utf-8?B?b1N2NzRUOXpVK3RnRDdiWUhEL2Q1Y01UR00vUWxkLzRqcXNOYm1uYjAzZzRj?=
 =?utf-8?B?eStrS2ljWHowK3FYbS9jRllqUERxM2YrYlJVU3ppS0hlcjZtMmgvWUFhbzJz?=
 =?utf-8?B?Vy96MjZubUtnYlpod0NaQ0NpY0Iyc0RQT1lPMGE1OGRNeEh4VFg4bjkrZWdZ?=
 =?utf-8?B?WHo5YzFkb25DZTNJRkhITWs4em1qNFBCZEw1Y3VaNlNjaGp4dzdsRmJHK1lr?=
 =?utf-8?B?dWRaT2N5TnJDUHJ2M3RtaHdRRnU0SFdUejNkV3ErMXJnY1VRV0FmUkxQUTQ4?=
 =?utf-8?B?b0VVS29uMncxVUpsa2NCVmNKbVFQNi9reEduNHNqVE5Rb3pMejVjQWV4NkxH?=
 =?utf-8?B?NUZub3JXaXNiT09IUXRGVHBVNk4zZWtmZWlKSGx2bDdvZkg0ZDVOR1lDdFNw?=
 =?utf-8?B?MVp1RHhYclk5MndXMHd5SWh1OG9kZ1Zldy9lTHc5QWY4djFaVmIxVnBBa1U3?=
 =?utf-8?B?cUhuTTREQUUyczJWakVsVmZoK095NXRybGVqamRCeUczQVFxVTJvMU1MZW1y?=
 =?utf-8?B?VFJJckdkUUIxTENCaDdabnJxVjVEVFRFN0tSbC9WdnNaZDBMNXUxalJUZ1h1?=
 =?utf-8?B?U1VTcVBTMEd4NVdQZTlweWFFUk1sRnlnci9acU42Zm9WcCtZRU1xVGhCcEgw?=
 =?utf-8?B?anFoYnFXcTZFY0ZMbG1Ja2MwdHRINXRydTh1czZmR0VOU3JqRm12V3RqbVJP?=
 =?utf-8?B?ZnRuTFdJeTFEVVBibS85NTdVaHNjQVo5Umd2OHRLaUwzMHlVcTFtZGdwazcr?=
 =?utf-8?B?YXN5M1VsRWpwaVlSMmlnTkJRM21nS1M0VjRFSThRRCt6N0ZaNjZHWkhTZTh2?=
 =?utf-8?B?NEJjSUp1U2djcnkzK3U0U0FsdUpRcWs5WUFaUzc4MUNYL0R1c2hUQTV1Uzhw?=
 =?utf-8?B?aFQ5RndIQ0FvempRam95THlvRjNRcEpJWFEwTjd6VGtPRm1HZmtLOHlLSXBM?=
 =?utf-8?B?ZWZpVU1RWWRWcERlSDFaZFZkeU9rZmtzamJoQjBXTG9aeFJ3K2V1SnU5Q2li?=
 =?utf-8?B?VDZqUnpyVzhKWjNTTHJFdTJGQTNoWjl3N3QyRGZnQ2VxbWhPMGlEeFRBQzhP?=
 =?utf-8?B?cEZWanpCMmF1L0w5dkFtNW1pY1ltSkhNaHBlalNqSlFRR2Q3TWpCZkJHK1g3?=
 =?utf-8?B?SUs3RHU4YkVTT2x1VjhMbUhHdEJlYmNXKzExWEsrNEhlYjhUNngrQ0pVWEE1?=
 =?utf-8?B?QlUxVFpGeEsvendhZURYNGhTdTMyN2F3bTBHdlM2TTVyOC9mSEJhMElBditk?=
 =?utf-8?B?YjBmc0d1TDh3VnMzUnRUSStlREptcitNaFB6b0k0S3U2cHFlSUFKV2tMUm03?=
 =?utf-8?B?eUNPdEl3ejBjNXdsWk1XMndmSnlQSzNMYmNPWGc3c2Y5T3RYWTdTMGowQkRn?=
 =?utf-8?B?TStJOStPUHlzc2tzbjJwd0luRGxDYnphOUtCQkJrU2ZBUThJN29CUU9OQ1Zp?=
 =?utf-8?B?MmFveUl4QzZOcFBBeUJkYmhHSGdOWmFlamNHTDJRemY2OU9TN2w2RkNMVGxO?=
 =?utf-8?B?RUJIcytZYVdkOXc1emh5Wlk0YmlRZ3crYno0TW1ZTWVsd3BtVDV3M2d5YXlk?=
 =?utf-8?B?UnBONHBhVnVGUXFTUEU0R1BZeHBsMDkvejFHK2MyTTNaSDRIRDV3RFhSaEZN?=
 =?utf-8?B?dTNPTjJYOS8zZGhQTVdFMXYyb293eHlGemppWUhxaWEwdkhpaGdkdEh6dFhl?=
 =?utf-8?B?azUwSXZXU3psMEV3Y21ERGdlNVpGQzF5dTdtNi8vRmczV0FQQjBMKzRIMjYx?=
 =?utf-8?Q?1WGoaEGSiByJU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB8943.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FaZzJUYXNkWGdDT2pMelZKYlJjcGNMVDNFL1ZySzFEY3NnRjEvVDlOUTRw?=
 =?utf-8?B?OXZWZEtOMFRXK2wwVmFlYVNJOTVJMC9hYlNSLzNRem1hdFZEbE1kTjBPTTVl?=
 =?utf-8?B?eGd2cWJDVjk4b0dhTis5T1g4ZjRBYUJyNWs2eTAvNDVjWFF4WTUySHd4ZzJu?=
 =?utf-8?B?REMwWXo5TkxlZ2pCbGVsWTRsS3l0U0hIYjhSS1BKTUg3ZDg5MFpoWHYzSU5C?=
 =?utf-8?B?YkoxRVd5aWU2V2RpWHcwenpzSkplUExOT1dvMU1oajdRTUJMbDJidzJ6dlVL?=
 =?utf-8?B?dm5jRkJHQVRuOVJiMWZTZk93ZTRMeUlOSDBsN29FVTBPamJyTWVnYnBVcW9H?=
 =?utf-8?B?VTh5OHBES0YzMHUyVkxMUXRVYUx4Qk1URGZxRlc5RzRFOURpU3o2Z1FSSlFQ?=
 =?utf-8?B?anRjb1FXT2xsRVBxOS9EV2VMSDZjYW92dmtTdm1xNnhPb1lUOEVWTlJtSjRw?=
 =?utf-8?B?anlpdG8xRFgyOGxYMGtlZ1h4TFlCZHNXSFVNVEtRWVk5TkZSM2tLZU05eXQ3?=
 =?utf-8?B?Y08yekRzT3drSy9wUytsUjRHdzNwQkx2WnZEYzN6STZ0VU84czJybjE1dEJZ?=
 =?utf-8?B?QjhONm9pRnZoSnpwcmZuNGhoRUNSUmJmUDZXbUJDaFlmL3pvRGF3M0FqVEpC?=
 =?utf-8?B?aS9vc2FIVUpybW5QcWNqQnFzUXZkQzhJUmY0WXl5bm8rYTUyZnBxZkVEWWxu?=
 =?utf-8?B?OHJvdmRWVlNPSnZaR3dseUdsaXp4K0N0WWFaNmIrQ3MxZmFsMk1lY2FaU2J2?=
 =?utf-8?B?dCs4SHJpNE9QbzB1cDlRTlBKejVWQ05QbVBvK1hmdnVFYzgxU20wMnk0T09k?=
 =?utf-8?B?cERWQms0eGtDUFZoZDBGVThObUtWRVJqR1pPWjVkQ3BVL0M0Y3RCWVZJcVA2?=
 =?utf-8?B?SnZ6OXArdDkrRjBWK2RsZTk2K2xXVXZqR0F6c0hPSXk3N2VpQmlPM2tISGsr?=
 =?utf-8?B?S09QQjZBWnRuKzZ4R01QOVU4QkdPcjZBVXp3UCs4S0t2OVUvbjRwUTN5ME5F?=
 =?utf-8?B?RDVMN0t4MkEzMlJVQ2ozN1BoZjVBeXROeVZoQnlaTlk3RWlHaHhPR0NGOG9m?=
 =?utf-8?B?NnErVE1mcHp5WmllWVRQeU8rRW5lUkRDOERxRnVhSitFMlM3VVk1UHl1WHhB?=
 =?utf-8?B?bFp1NVNORkkzWGVQZFBteU14ME5zckpKMXZhMkFCRjFheHphYTFtanE4WEcv?=
 =?utf-8?B?Zmh4VVNsRTk0S1RTREpTNmJseHlBVHVJajY1d3ZhNHUyaE5XWWdqU2svcGVv?=
 =?utf-8?B?L04xcXlna0ZEa2VDYW1PMEhVVEhjTEZhbkZmOUgzbGo0YUlTVkFjaE5talVo?=
 =?utf-8?B?WUNtWjg3M0swZTk1M1V5WG9yTVhVdWx4aGhHN1k3YXVuclZkeDN1ZmQ2SVph?=
 =?utf-8?B?Y2RHaGdsWEFobnAvYzdIMGNWNFgyamZaU2Y5eXc1ZmtHdXFKTEE5b1B1QVdq?=
 =?utf-8?B?bGlFd0ZXU2pmY2pGT2ZFL0xSK045ZXhaeXozdTBzaEJLUlV0dGh3cnl4WGhY?=
 =?utf-8?B?ZkV6RVMvdU5jNFJIMWw2d0hITFIwSkxUZTFiaDZtOFV6Q29nampFOGJRSWhI?=
 =?utf-8?B?dkVUMEZISktzbTF6YnJuOSswdjlPUmJxMEgwWkdMZm4vUUYrMzVscW5zRzVu?=
 =?utf-8?B?Z3RQRkxNaXpubmM2c1k5WFlHU3VsRitVS3lGSVltZWdQWkFFMnpmMm8vd3JG?=
 =?utf-8?B?RWc2RmwrYkl4UUgvKzBvc0pUTkhsaDNUQUkyWHljRUFua0NyYStjZlJYN3Np?=
 =?utf-8?B?Q252NG5oMWYyRlhzekRrOTRhNk9LVlZSRzJhNzloM2RNc3Jqci85RUpsS1Jq?=
 =?utf-8?B?cEFPdFl4V0xMZERmM3NlKzZUWWNhd1kvMkFDUVlaV1ZoNHNoSnhJWkl4SlJi?=
 =?utf-8?B?TUdiK001bHduM3MvckljbjhPVTdCOFZCNnRVR2tTVDdUUXVXKzRuTUxHNm02?=
 =?utf-8?B?b2tQSEh5WlJ2ZGRudTdKdmF5SlV2SWVnYWU1YzBZL05obUlYWGFoQTFKaTZl?=
 =?utf-8?B?czRsRkRmL291dlFrTG9rdnkveDRLTXg3dmVERXVZaHVkbWNBNzBoY3N1cUpT?=
 =?utf-8?B?VmhQZ1A3elp2U0hRWVJmMUpWamE4aU1NNFNoTXp4Y3AwWkJkK3VROHhuMzBU?=
 =?utf-8?Q?M0rdYtjQ9s601cHQnxhEGoTIB?=
X-OriginatorOrg: ico.es
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe964fd-e25e-48a8-38e9-08dd36eac9c0
X-MS-Exchange-CrossTenant-AuthSource: PAVPR08MB8943.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 11:33:39.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1ce52a52-9c6a-4c64-a2cd-d31aca4d8629
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wy7zlf08bSZh+lDgog0SCFOAGUpNU3J8/3vW2wt5Wj9jf9CAOmy4miENCsKSU52IAshyV6L5QWWSGmT6fxpu+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5862


  In case anyone reads this:



- Dmesg from Kernel 6.8.0-51 ( touchpad NOT working) :

  input: PS/2 Generic Mouse as /devices/platform/i8042/serio2/input/input9
  psmouse serio3: synaptics: Trying to set up SMBus access
  rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics,
product: TM2768-001, fw id: 1658220

  input: Synaptics TM2768-001 as
/devices/pci0000:00/0000:00:1f.3/i2c-0/0-002c/rmi4-00/input/input17



- Dmesg from Kernel 6.8.0-49 ( touchpad working OK ) :

  psmouse serio3: synaptics: Your touchpad (PNP: SYN3015 SYN0100 SYN0002
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are
not used, you might want to try setting psmouse.synaptics_intertouch to
1 and report this to linux-input@vger.kernel.org.

  psmouse serio3: synaptics: Touchpad model: 1, fw: 8.1, id: 0x1e2b1,
caps: 0xd00123/0x840300/0x26800/0x0, board id: 2768, fw id: 1658220

  input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio3/input/input10




On thursday, 16 January 2025, 20:18:12 CET, Pablo Barroso Cubillas
<pablo_barroso@yahoo.es> wrote:


Hi Vojtech:



Sorry for spamming; found your email issuing " modinfo psmouse ".

Just to inform my Synaptics trackpad freezes after suspension with
kernel 6.8.0-51 ( working ok with kernel 6.8.0-49). 100% reproducible.
( SynPS/2 Synaptics TouchPad )


Sorry again, didn't know how to report.


________________________________
Instituto de Cr=C3=A9dito Oficial (ICO) =E2=80=93 AVISO LEGAL: este mensaje=
, su contenido y cualquier fichero transmitido con =C3=A9l est=C3=A1 dirigi=
do =C3=BAnicamente a su destinatario y es confidencial. Si Ud. no es su des=
tinatario, se le informa de que cualquier divulgaci=C3=B3n, distribuci=C3=
=B3n o copia del mismo est=C3=A1 estrictamente prohibida, en virtud de la l=
egislaci=C3=B3n vigente. En ese caso, por favor, inmediatamente notif=C3=AD=
quelo al remitente y elimine este correo electr=C3=B3nico. ADVERTENCIA DE P=
RIVACIDAD: los datos de car=C3=A1cter personal que se faciliten ser=C3=A1n =
tratados, en su caso, por el ICO exclusivamente para el desempe=C3=B1o de s=
us competencias legalmente establecidas o por requerimiento normativo, de a=
cuerdo con su pol=C3=ADtica de protecci=C3=B3n de datos, disponible en www.=
ico.es. Por tanto, los derechos de acceso, rectificaci=C3=B3n, supresi=C3=
=B3n, limitaci=C3=B3n del tratamiento, portabilidad de los datos y oposici=
=C3=B3n pueden ejercitarse ante el ICO, Paseo del Prado, 4, 28014 Madrid / =
delegado.protecciondatos@ico.es.

Instituto de Cr=C3=A9dito Oficial (ICO) =E2=80=93 DISCLAIMER: this message,=
 its content and any files transmitted with it are addressed only to its re=
cipient and is confidential. If you are not the intended recipient, you are=
 hereby informed that any dissemination, distribution or copying of this co=
mmunication is strictly prohibited under current legislation; please, you s=
hould immediately notify the sender that you have received this transmissio=
n in error, and delete it. PRIVACY WARNING: personal data provided will be =
processed by ICO solely for its legal powers, or other legal obligation, in=
 accordance with its data protection policy, available in www.ico.es. There=
fore, the rights of access, rectification, erasure, restriction of processi=
ng, data portability and object may be expressed by contacting ICO, Paseo d=
el Prado, 4, 28014 Madrid / delegado.protecciondatos@ico.es.


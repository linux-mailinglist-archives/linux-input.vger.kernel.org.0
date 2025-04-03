Return-Path: <linux-input+bounces-11491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57954A79E5F
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 10:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B413188EDDE
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 08:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BCD1A23B6;
	Thu,  3 Apr 2025 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rbexkvlx"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF071DE3A0;
	Thu,  3 Apr 2025 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669742; cv=fail; b=WikJ/0N+4ZUy+1Q8eM1VPbkLaoQWRsln47x7FmanSXHNqP+Z334SZmJhuEBF0rseXZ9fRBUs36ZHFU1ltTfcmRtneczal6503+/Yup/tN1PGp4nIRsAze+X9SQIU/Ck0DTpQBawWKALe084Bz4WzV+eR6kmTHmA10Hj49tydAxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669742; c=relaxed/simple;
	bh=2JcBifxUi6+XXxnUqTjCjWBsNpV7fKPZbFab55yGUfI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pdsWOkiP1fvkkUm/uYMIBAv003I3U1I6Tg1shhIGyGofmZPlRWQJjfxtv414uVD/I8s12GOvPd/7NEp46XZjPKD67jBTLMoQ8+ObvtyZIyae/zo9pLGS6Ps4+ansoomfZEdb107l5cloiAAK8h6B06rGY5OV/em2NOIqNBAhe78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rbexkvlx; arc=fail smtp.client-ip=40.107.100.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f10+wehW8bFpzGtijMqjt/3gsmbBh7jr98DlYil1qU5hbI/enYX/cfWVXDkOs9PpQTkWvzpkO5bF1LIoeb6zgeO+LUEPBr947XJ6X+XqvAIYDI6wvrAuoIdWeIXKezTWIbc/suaeYYSF1LJXq//FtfWLhFYlZKyeLtQuMBPSX7SZ741SeMOV/Zsg2qfADgnvNw+FTERJ15AOGXNJDa9ATwfG5GOSEdKGjP2Egh92sp1IU/NcdQnA7dKLrs8y40QTuadIpEmS0DOlKaTeDlGbYC1xBaGrgP9w445xk0+P+Z4fynaYWRfkGUrKsYE3RXtgW3lAIgyr24g6A98u8heYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El2xaTEnOOOpwm7Rskayfn1Qr90/GGP1T6VkkxEuHxg=;
 b=bZFuzY7cPKzQJ4dAOwRyRDdZe6It0uQZXQpqU7uKgW28CQQJC1frQ5hm6cmgC6OVueKfqLCMLEGM366QnlrP1DDp9pd1nSgEKR9/ju/sMOHYeqhRQInEXhGS4qIr8zzFFdMRCJzRZwMxWBqpQXPqXX7XhnT/YRGXZdj497tng9otBtib141LaW7vq/ahGklFPSzHyAapCTrYZIGYhj3R+Y/1VW+HroDeHYknEgK/nvWCbqzeAhpxNSHFb8I/xg4YXwbckiMKORwUZEMyur51Mbbxpu0bCjymB3o+bxZijNw77wCAV3fYdM/zo8q+U6MH5aPuX72H63LNShkqDIHDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El2xaTEnOOOpwm7Rskayfn1Qr90/GGP1T6VkkxEuHxg=;
 b=rbexkvlx70mMWgQJSjEgWpHvhhzx3fps+qJzcuobvp5XLEHPCw+S0N8hTgZlgxLyN6h48PvzuSKeS4IS6dp3aDE2ZMJ//ctKigqEM9WpfKCBiF9z6g67ukuVtdUiGSR7gqnWOMEl4ELaFW/ddnAFUqUF2Mel7MwXaGHD/1fzUTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 08:42:18 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%4]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 08:42:17 +0000
Message-ID: <fb2be281-4652-4bd4-939a-26b82cd790d0@amd.com>
Date: Thu, 3 Apr 2025 14:12:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Fix SRA sensor when it's the only sensor
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, bentiss@kernel.org,
 ilpo.jarvinen@linux.intel.com, Shyam-sundar.S-k@amd.com,
 akshata.mukundshetty@amd.com
Cc: Yijun Shen <Yijun.Shen@dell.com>, stable@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20250403031242.1267561-1-superm1@kernel.org>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20250403031242.1267561-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::14) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MN0PR12MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce7843a-1d7a-447a-9a65-08dd728b70bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFp4SWNaaWNXSkFwUmR0bUU2bGtwNFZNeFZwVm1FRG8zcTNvL3p5SE1LTk54?=
 =?utf-8?B?SDV0ZVdzQ1dWeitwYVRaWGovaG5FcVp2YVNreEp2WnVxSzFac2k4d2lRSnow?=
 =?utf-8?B?TEkwemwvMFlxSXZpTTlDeWtqWjQwQ3Fad1dQVTlWVlpZVi9aaGpWRmxRUEJH?=
 =?utf-8?B?aDN5RUpkaXQwNCtKMHZ4ZFVZd3dERllnaVdpcWx5VmFIeUhjU0hJdGQ1RTA1?=
 =?utf-8?B?Si9PSU9zTFhTVkM3Q2tqd0Y4cXFyOWVXZGhIMFZwenczRC9hL2tJWEFTQ1BO?=
 =?utf-8?B?b1hISCs1ckdRWWhtVlZ2c3psRHJ2Tk1Nd2EyeloydENtY05RemJZWGdJSW13?=
 =?utf-8?B?Q3R0ZTdBazdKaFFJMms0MS95WWVxUU9LZGhQYTl6TTFxNnBPNUp1Y0J4K21L?=
 =?utf-8?B?cHEzM2U4M2NLVDA3L21Pb0lHbFhZQUpkM2NTK3U0K2lkcjVKSlF3RW94TEp3?=
 =?utf-8?B?SkFsUEFCUHhvZkQ3aHFjTkpGcjVJd3QwT2Fqb1JVc1kxbVdMV3BYSDJjYncz?=
 =?utf-8?B?RGJVdllFbE5hQmdsc0FFZ2lIU1ZoL0cxczZMd2p5WGRVdU8yd0xmbUx1eXEz?=
 =?utf-8?B?MkpWYVNPTDRjTHArSjJnOFcwSzFpemppTEhrRm5lZTdZcWtKMTAvWDd4WVpV?=
 =?utf-8?B?aXNnSExMSmUvTW41NHVCSkRqWUF6eGFiWER1V0QrUG13S2FXZG43OE05OU1v?=
 =?utf-8?B?RzFqRktjVU9SdTVhT0pBMkNzQTJIVXh3Vms3Z09yNkhlbDNPQnQ1WkRwbjBV?=
 =?utf-8?B?MFUxY0R6aFlnV3hORnNTdnpqdkdpTCs1a04vYVh1NmtvM1pFcFZpYjRpTkdl?=
 =?utf-8?B?dVVkVFBNTFgyR1c2NWhhZTVNOHQvWGM4MXB4YWRRN3RZTW1FSTBCOFhJMEM0?=
 =?utf-8?B?SUJjV2l5NCtPRXdMc1ZmYlh6WXhKWStkejdmVVhNUWh0VVZWeVhMY2tKc3hC?=
 =?utf-8?B?L3dVRFBGVm1FS1FlLzE2c0paSEZOdlVqb2lQb1Y3K3U5cDVjT1NsWXI1aEk1?=
 =?utf-8?B?Tlg5OEQxdTdDeDJHL0tva2ZQYnZsTlU2cllKSGJxL0tFUVc2ekdoVk4zWklU?=
 =?utf-8?B?WUxtc0lWOS9yZFFobDB6c09uUzdaR0Qrc0Z2UGFFVmFlcVUzQU5UOWl6WkRk?=
 =?utf-8?B?RzdnWStwOGFHZnBSZ3lnQitsRURGdVZOc2JIaERXSG9OS05oNVF5bTNGRnV5?=
 =?utf-8?B?RjBFblNwSWVhQ2NtYmI0TTZsaXJPbktJd1lFd0lmNDlsZUJLQlJuOC9Xak5T?=
 =?utf-8?B?Rlg1N291bWFLam1PTFYyQkpMOG5YMzlSL1BtZzZrUEtJT0t4WlJCSzRSUFFU?=
 =?utf-8?B?azZtK2syS1VGb3NpWFZVT1JFZldueGpzVVZYM0x3ZmVtK0IxNmo2eVdJWDRz?=
 =?utf-8?B?OEdZbFpodkFtRGkxNVBaaWtvcktBUXhnZ0JJUmk5VENzUDdKdURvazIwS0Mv?=
 =?utf-8?B?RThlZzR4cUR2OGwybUVZa2JFU3hSOUtnRnBIbnNoRDVSNGdJR2xhK2l3LzhM?=
 =?utf-8?B?QjFjR2FWeFVlNDJRQ01KV3FvbDFKR2hGWGphVWlobTlYTlBoOUtLYy9leXh1?=
 =?utf-8?B?SjRlYktDaWpva1NjRTZIN1JYaDBRTnJlRW1tN1ZzRnJQVTlxQTFHRVhQS3Vn?=
 =?utf-8?B?SnFBZDF3ZExqMjgzb29WZTROcFhTTnk3b1JsZ3NVb3IzMnBROWxQblNncUZR?=
 =?utf-8?B?U0NURWJtTjFQZ2E3bytFUEVSVWRoOGtoWEM5R1FXZDEyd2p4L245VGp5WWJI?=
 =?utf-8?B?QTNnQ2pMVXdtNm8yeFBpTUxSbFNVZHcybkR1U01vVjRycWlVakFiYjM5RWk0?=
 =?utf-8?B?bXNyWkdiNWV1SlkwRThRdlR2eEEwUndIaS9kOFJWUUozZTdteHpnVDArWFhU?=
 =?utf-8?Q?pdro0gOwD+trG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZLRWtySlFjMEMwZ3BaKy9oR1BibDNxTGsxTnFRQmNWM0JyVTRHWWJiaTRO?=
 =?utf-8?B?L2RncjRZY2xOS0JUVDVMbFp6OWh3SEZnR2xjRm1Jamp6M3J2ci9hRkVBc0Nz?=
 =?utf-8?B?S3pEamQxamx3WlhsSXQ2aHVDckwzNE9haXlmZ2VFMUl0REhieTlVM0Q2TXFh?=
 =?utf-8?B?cGlJVFhrZEN5eENaRWE2VHFHdlBMRkllbzdpRkVaWmhhZ3lTam5jZWFURnM5?=
 =?utf-8?B?QmlwN1RkOEpvcFMrb0oyWmpyZEY5THVVdHp4ZEYzWW9vSXBDSkQ1c0g1aEo3?=
 =?utf-8?B?WjB1MERBdllxZ0srRDQ4cDZBck10ZFVFMEYzdElEOTVGOHhyN2E2N1RDK0xj?=
 =?utf-8?B?NzZGRkl4TzhTQzVDZVhxci9BRURPbGJpSVFQbFpHK2FiYkxJNE9oVUlOdU1x?=
 =?utf-8?B?STZWSUZiWkh2alN3dC9jUEVKRmF6RFdTKzFKSWFyK3ZTdGNvaXp5dzg3enlG?=
 =?utf-8?B?cEM2R0M1eWRYZWtFVnc4dHpOL2tLc213ZDRWLzJMYmZkWmRSU3Z1Z0JqSkRi?=
 =?utf-8?B?bkJ0L09sNGc0TVVTVFhNbW9iSFlUa3cyWjJKOGFYakQ3NmlEM0FJRms0TUIy?=
 =?utf-8?B?Y1Q1UjIyOVJPaGlremE2cTEwWE53KzZ1VlVBVzNRUEQwTGRFQ2JDejMySnNt?=
 =?utf-8?B?aFpQL2t3QkN6SEY4NU5sVDhCSGlsTGV0Slh0UVRFTUkxRWcrQ2s3V3p4d0F1?=
 =?utf-8?B?NUt2a1o3UnVDUTlGb055REJlSmR3dk1OR0dBb2Jtd25ELzhQUm5YQlc5MHlV?=
 =?utf-8?B?ak1EWG1nc2NTSnRNRlZwTGoxS3lOMGJ4N05SQW92UG1rS3pDNXhWaHBOcHAw?=
 =?utf-8?B?bDlLVXk2YStKSGY4RWwwUEtMTENHMEtacitGMUh5TW5qV1BVd1ZvQVVTTlRX?=
 =?utf-8?B?TFMreHJWZHdUU0JnV1FsMGc5ajFkNk5oV2QzVFdJQ1dyTm44T0hJVU9qMWFa?=
 =?utf-8?B?RWxNSGtUaUorN3hnQUJib3hGYjVDWUVlZVpkUmt1eWxaZ2ZpdFhXMnBIMVlJ?=
 =?utf-8?B?K2Y3K1hSMTk0Vlo2a2F2TTduQ2dzcldwOVJBb3p4SERJYSt4KzVCN1ByYVhu?=
 =?utf-8?B?OVFNTTNweVpMa2xQZWpSY0srWWhrT2g2djY0MXpBSFJCTVV4TGpubFVUcnVS?=
 =?utf-8?B?SlhvdjA3cVU0dmhwRmxnMmN4dGIxcFB0WmdkQXAzR1NaLzVpaTg4OWEvN3c2?=
 =?utf-8?B?amJvUjNKNGp1aU84Wk9rM1Bvczc2RFVtZHVJRElLQ0FTeEFGNWE0ZCt1bU1G?=
 =?utf-8?B?MGxWRlFBYUF5dk5oaHJQNlluWVJkNFVHS0owZDZ0S3pJOUZCYUtVS1ZEdkUv?=
 =?utf-8?B?OXpoS2pCY0hRYy9JM25MNUV4NXZ6OGZKczJPTm85ZlRTOE5qNkZYdjU1ckNm?=
 =?utf-8?B?MHRibWNVdS8vUlk4bDlvSmV3U2xvNHlVbGJXQ0dIRzdza0tNcXlsMkdVU2JH?=
 =?utf-8?B?S3ZVR3NqUHhVaXNINmd6N3V0ZmIxMXZ1MEZld0tGV1JZZ3hzd3hHbk9LL3BE?=
 =?utf-8?B?aTlRc3oyVnZscWhJMmoxTVhpd295MmVNQVllVXpNTmVZNDVMSVJ5SEtSNmRx?=
 =?utf-8?B?Q0tCVFZKOEFwNnBEcVNzdis2bGk5S2NpNkxDTkJFd0hISWNMRnFFTk9rSHZW?=
 =?utf-8?B?R3F6cjFVL3pmayszOXJWQ0grZFd0L0J4d250aDBFc0xlNldTWVhiT09ackhC?=
 =?utf-8?B?c21ZT1Ewd1dSV0FLUVVkYjIwY3N6cUpacmJvYmxCZlRyQnMwU2EvWTZRWUo3?=
 =?utf-8?B?RFBYOWQ0bmpOc2pySks0QVp3MGMrWVhSNDYzVHVPZFkxdEdFQmxoU0xuNWN6?=
 =?utf-8?B?VzVja0pnYUZ5UFdYZGNkYU1UMG9zVnRiRUVPQXdWc3JmL0l6bzNFd0xrMXd0?=
 =?utf-8?B?L251YUxmZDE2TmJpdXJsRTF2d0FDQkFQaHB6VGxJdTBUeit1RG5wWXplNlBa?=
 =?utf-8?B?ZVFUNmVMNUEzRVNhRjRYQkw1TjFaUHorY0NTbFk1S0p6NCtpRkxxUzVzd2xx?=
 =?utf-8?B?eVhCbFVnQlZkVytvelJIT2pPVnBMVG00Z2UwenJjdDZ2OUZPb1pJc0JnbVps?=
 =?utf-8?B?U1AraUYyWGU3ZEJnWEUxV0xWbU9GbCtwNDhuSXlKcGdkWFdlRU8weXdwKzkv?=
 =?utf-8?Q?istneVq19DDcIDff80vQUFtnq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce7843a-1d7a-447a-9a65-08dd728b70bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:42:17.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mj5zj9/yFgLsag4Q91+Y2Vd85TbtAsXZVfW38XXhrm4spO64+6QyvdN/U7+QCUv8SfOxDbTPhrQW/NU8qm7eUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199


On 4/3/2025 8:42 AM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> On systems that only have an SRA sensor connected to SFH the sensor
> doesn't get enabled due to a bad optimization condition of breaking
> the sensor walk loop.
>
> This optimization is unnecessary in the first place because if there
> is only one device then the loop only runs once. Drop the condition
> and explicitly mark sensor as enabled.
>
> Reported-by: Yijun Shen <Yijun.Shen@dell.com>
> Fixes: d1c444b47100d ("HID: amd_sfh: Add support to export device operating states")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index 25f0ebfcbd5f5..c1bdf1e0d44af 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -134,9 +134,6 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
>   		cl_data->sensor_sts[i] = SENSOR_DISABLED;
>   
> -		if (cl_data->num_hid_devices == 1 && cl_data->sensor_idx[0] == SRA_IDX)
> -			break;
> -
>   		if (cl_data->sensor_idx[i] == SRA_IDX) {
>   			info.sensor_idx = cl_data->sensor_idx[i];
>   			writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
> @@ -145,8 +142,10 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
>   
>   			cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
> -			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
> +			if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
> +				cl_data->is_any_sensor_enabled = true;
>   				privdata->dev_en.is_sra_present = true;
> +			}
>   			continue;
>   		}
>   

Looks like once SRA is enabled then SRA is not handled properly in failure cases.

Thanks,
--
Basavaraj



Return-Path: <linux-input+bounces-12744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E9AD2957
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 00:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72FEE3AEAD4
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 22:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A8921D3F4;
	Mon,  9 Jun 2025 22:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IJgP/AuS"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DABA1E521B
	for <linux-input@vger.kernel.org>; Mon,  9 Jun 2025 22:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507681; cv=fail; b=oTaFT5bw1zXsy8aXofHjTIm8zb+GZG33BkwX2f0hXW8S1dmUJwdzXkixTeLPSrMaIWFaNs4ReWFiu9ssLmc2dW+HuDAiW57PSKncx/ZdPjIt2qVnexzMCFv0ru6GNtCpDF1kF2+o8zeRWjppcLhUtaX9KNOuBWW4HiuUjrxTum4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507681; c=relaxed/simple;
	bh=DpFy7Hz6Frg/bJAS3IWMmbEF5NEQChfYje5P9IWTdG0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ud0ieINQlfXJ4wK0+hzXBXhG3aafSQjjTZ/7G60s6HmJFtnJuIsbpOoXer/Cl74K3bJMtl/I8sInWdaIYyCi9Rl5UJGhVMN5L7bXT7Tzz74ehCLo2aCU7HOP9aIiutWFgWc7Wiu0tPcWnzVF/TnHKBdQy4wXtdHux2stIueZt3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IJgP/AuS; arc=fail smtp.client-ip=40.107.93.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP6JdyUNd3VJifMNy898iROarFPM9BPEBBdSNyUZPWXi1+0xc6bJPUJDPug7Yf+FJtb3ZBCpFvCKZd8WOtgp5s52O9h5WSpCLfxBH5JxaVVd5+yzCeiUoVvrykUENAUZkJqI2w4EHFzvGXmefvodNOheHsYpf/Xt0ORYSHVKudHfleBbaj6w4ZF9cswPCrj0wUrO11WFW3V1B0dOla87eyUrlVqt5hQheuCt1L5ULolNBySwGZrQiiIxsb4Dw7Lj1kHHxxz2RhCWsU4/bz0nJBbFYJ7BK4kbVsdi2QzXj0hBJnnCD3dafAeqMtHOd/dsLxqswmsfZK86LV+ryomgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfUuDnweKI28kFYd1s7yEAStiofFTLF4h0AFxs2C5DM=;
 b=m4+nJJqHVIAWcn4Is+v8FFmkTXgbuRwm6nhuyRaoro3UrAdbS0Py2yLrXuVepZxIzZ+Io6FX9X2hjJWxK794T68C9ajsmGJmXHSsLE2LlZTqNBVcvhYRuvwS+CH1GUOPV45ysRDmWfvvgeDct2WnQqcbjsy9bTVoWWK0MRONKiLIMVQTS1pgWlpYVcCSu2G8wt/w9SGu8ooN8sRoq5dCzySqY1XRFrZQURgZhXM9k45111VQsEwa9OjHYsfKGqP+3flHBPvrysWshq5v9VjpWEGMra5+sL6nq9o4U9R5FcuK3qFJjo0eESBYimkvP22S1yoWhIl7oRZSWS7o7geH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfUuDnweKI28kFYd1s7yEAStiofFTLF4h0AFxs2C5DM=;
 b=IJgP/AuSD/eZfVMsM9DuL3vsbZrKwW1fV6zjBomHMo7mcI0pz3/Pcs1iRyDg6EUfpEyJvMEVqG18gQMnfKnmU+CGPq9Mj2fyquYFQ6CZXZWc1qS1R5LfXgZ5cUkgxuj/iCsvUYqSxJVB3Fh1XL95a0Xz4E1gIZDTwPjv+l5FxVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7302.namprd12.prod.outlook.com (2603:10b6:510:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Mon, 9 Jun
 2025 22:21:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8792.034; Mon, 9 Jun 2025
 22:21:17 +0000
Message-ID: <d63d94db-e257-4419-afeb-a661e833aa81@amd.com>
Date: Mon, 9 Jun 2025 15:21:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Enable operating mode
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, jikos@kernel.org,
 bentiss@kernel.org, Denis Benato <benato.denis96@gmail.com>
Cc: linux-input@vger.kernel.org,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>
References: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de3ae34-738b-48e8-f1b8-08dda7a3f3be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUVaS2pBcDgxVWgwNlkyRzRjSmFBeExNMTltc1JoeCtQdXZxR3lPaWVNS3NN?=
 =?utf-8?B?ckFiczBTTUZZZUt6WnlDL01tRjI5czdqdW1kOEF2czdYS0M4VlhTbjJVQ3Bi?=
 =?utf-8?B?SWNZNGxTUmVrNHk4RDI2SHVpZ1Jic2NzRTdXbm5ybkVLNm1mbDMyNE1HOC9Z?=
 =?utf-8?B?YWVLMmoxbzlXemRsUDB1eXBoSGJWYTFOUWdKaW5jcWY3UkZNUHZyTkh4NFE2?=
 =?utf-8?B?bGJpdEpFZmFhSnRUYmhRc25SRDhzVS9ERVVyYnp4NXVsWGpFZzlGZmdDQWhM?=
 =?utf-8?B?MFZYcFpyZDUzM1U2TlVYU3hIVFJ2R2k3eGxXRFpiT2ZwTHBVUU9wTGdMUHJr?=
 =?utf-8?B?c2FaNFo5b21RSUhpVkVRVHI4YzAvY2FRNEVWVC9SNU9CT0ZweTdqR0kvdGFY?=
 =?utf-8?B?cDc2Y2UxZmdrbVlkYWdYQWduMEVpUXR3K1hTSVd5bUtJYnVIR3FISTkzSkNl?=
 =?utf-8?B?Vi9seTgrdkJWWDUyK2pYVk9DajV0blhobjd1STZzbDRhcVREem5GTmsxelMv?=
 =?utf-8?B?eVdEd3hnUVd4eEFNZWQwQnhDci9McitWaitQMjYxcGlPM3JxZ1ZabnhscG9R?=
 =?utf-8?B?V1FuVlhXeWV0NXlVVldVT0tXQ0dIbGpUQUdLM1IxMW5CQzVNbENDbDc5bmI1?=
 =?utf-8?B?cUt5RXpGaXFKS3dhekRwbVJuN3ZSZHRibnpxT1dSYmFNRnRYN2plb01obmRL?=
 =?utf-8?B?azNJRnRCREtGVTh1VVNQRzd4cmZtMWUyVFRJYVdkRUdGY1UyeW83dFk3dTZz?=
 =?utf-8?B?bFMzNHo3K1owSG1IVStHK0J2c3RXTHhYVnFUemVsMUs1UnJGN0ZxR2RoOHRt?=
 =?utf-8?B?UlRpVWtLdFZUVkp1TkJtVGQrQWc5TllLWk4yenp3RURpTUtFcDhmVFBxYTRy?=
 =?utf-8?B?bTEyTlE5VWVwa01JTHRHSlM3b21SaXNTaGpYbnNFc0tuZDc2bVFDcUJRY2dw?=
 =?utf-8?B?LzlWOGM2WnpYOWt5ZXhnR2Q1Mko2QTlVb0RycG9WWlZ3ZkhkQTJkanV4MGdH?=
 =?utf-8?B?cjg4Q3JiU0phb0xTRUZFWGhoWkQ5ajJIWWVnSUUxTDZORVN3NEtla3Ivb1pY?=
 =?utf-8?B?QnNxZ2k2aXhEYXRJbjBjTWJyeG9FWlVsRHU3Z3Q0UEg1ZWVlRFdZYmttYjNL?=
 =?utf-8?B?SGxmNzRtaUZwSXoxeTRUQ2hRczN1OU1zY21aczFxWFd6SzJOZVkyd1diZ1Rj?=
 =?utf-8?B?Ylo0QXFaQnVBZ05nYTJGcXE5NnVPR2hhblBwWlljUS9NU3FWY1ExbUo4NldZ?=
 =?utf-8?B?N1Mwd1pZSzE1b3F4UGZCTnhVNnVxK2ltMS9mTzRDQUFVc3hpOURUUzhWSFBZ?=
 =?utf-8?B?K01qVHdPdmRGNG5SM1V2TUFVNW4yaWxxYklGNU5LdmVXUDhDUWhKMHBNbzRz?=
 =?utf-8?B?dmZNOTVBcTNYbWo3SEJ4ZWZianJjbFZFM28wV0FsNG5EOWw2MzJ4TVNzcWxM?=
 =?utf-8?B?UG92RW5aaFhOY1RZY3l4SGVJQXJHZmRmU2ZNQUx1anREeW9TK2YxcGtyQ2hT?=
 =?utf-8?B?OWN3dTZUUnk1YjB4RFdhRXVnTHZHNi9LV3pIYnhmeTlHUW1LeVRRdjNJU09I?=
 =?utf-8?B?RUgxK2FJNU1rK1JVZGRlNVdEYS9rSTI2a2hNNFV6M1ZyeHM2UjVkOGlKN2Rt?=
 =?utf-8?B?ald1RjIzZ2t3Wk9oS2JFcXdNYlZnbktrZlJtOWVDbjdZNFVNWVVrY0xBZisv?=
 =?utf-8?B?NkpmVElIZCt0aVRGaHhuK2FHRHMrc0F5b2Y3TDY1N1VWR3d0OXB4Q1pZbWgr?=
 =?utf-8?B?ZngrdzBkb0ozeVFNSmo0SS9Zc3NwTnB1NUd3RkNsM0tkSjc4TzdFQ0F1U1ZP?=
 =?utf-8?B?U1pRY2V3YS80bDBHeWVNTSsrSkFWVVpUeFg3bitHUUt4THc0dTBtV3ZhbSty?=
 =?utf-8?B?R2QwYUdZK1dTN0I0WkdUazNJVTdiVG0zbStGb3VabTkzV1NDRGJSWmsvYWNh?=
 =?utf-8?Q?SG+TBe6RecM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L21zbGxrd2lIS0FwdTdDc3QzcHdwclZ2MFI3ci9qM3VYcEpjMVdUSFF5V3hE?=
 =?utf-8?B?bGpJbFBMOEpERzhaVVViOFJKWndJUVQvUnhhZmNPTloxcVZxRXNNWm5wRmhH?=
 =?utf-8?B?S1ExWGdDK0hGODFMQXY4Z1hvV2ozbXgyV0ZRWFZDN2pBamxnNTd5amVkL21j?=
 =?utf-8?B?eE9DWHZkQ2Y5dGVSUzNHQkZNVm9RKzJpb09PaVZLVkRpcElxeVRWcGJOVFh2?=
 =?utf-8?B?OVJKZk1SZWdvRkc1ZHovOFRUV2h3VGE5WjJjSnNnK29Td1F3Umg4blVIY1Az?=
 =?utf-8?B?MTkyK2NCVnRVTVhaQ0diU2ZBQWdrRmsxbDV6RGN4TUxRbXBiU00yTFY2UWpo?=
 =?utf-8?B?MlU0U0syNnhQdyt1Qi9WcUYwZk04UnNKTVdyQy9Ha2lUNXBBSDh0NzRQMG9Z?=
 =?utf-8?B?a01qMDRDVzRZYzVxbHFBdHJuZFMrVnFaNUdHdG5DVENLaTg3VDNtdTRwc0pP?=
 =?utf-8?B?MkZhTHF5NW40Nkh0QnRxWVgwbEVvWnlHZ3NxdVlscEVDQjExMlQ2Ri85aVh5?=
 =?utf-8?B?ZmJ5R3ZYM2hWaWRqYVkvY1BJTGt1OWxWanJuTVVDckNXVVNyb05ld3Fwaysv?=
 =?utf-8?B?ZHc1NEpDWVZaVDFpSkk5d0R6a3JrRW1FN2VoREhKTFVFbU55b0IzRVV6N0th?=
 =?utf-8?B?MHRqR1hGZWdlalJxMEdDUSs0aGgrV1JnMlo5bTlxZExsVE5qaHNmRGxtNGJO?=
 =?utf-8?B?b3ZxYmtZNGFpdk50Y3NQVzB6QWFqNENRQm5pdXkrVzJMUFhxYnAvWjlTdXlP?=
 =?utf-8?B?S3JVWHpVU2d3U3ZValU3My84c0xUMzd1MzRKWmJvS0o3Q3lhQjJWUk4xUWgr?=
 =?utf-8?B?Q0pwMWVnTVIwV0lsSFFLbThhRVk2dXF1SS9WTm5BcGw4KzRpNmFuVnVZRW4y?=
 =?utf-8?B?NEcxenNCZXZ5M2M3UngydnpYemhxc2VoeXovSWdiMUdablhidm5KYVZPU0pi?=
 =?utf-8?B?eFdOTUlMRVhCb2k4YnZ4SXlSUERuZ1doTitPZUFESnFnUDRTMGJwM1Z3Wm9Y?=
 =?utf-8?B?K2FseDhqNVRQRGVGdzFoL3IyTDRXM2NWTEJLYzZ0d2NLTXB1Q1VHTUJ4NU1T?=
 =?utf-8?B?TE9rODlrM21UazNHRFRZc0ZiOGhxVWJyNmtobEtPcjliblRqcUU1K1BoTDlp?=
 =?utf-8?B?aytvUW1sOXNMQXFsUk4zc2NHamFmMmZVOGQ3THRYWGVNdE9sSTVDYVlhNEcx?=
 =?utf-8?B?QndsT3dFcjhnWHpwRWt5dndrSVhJV0pLbTZZMXZNSW93UmI3MzJzS3J1d2I2?=
 =?utf-8?B?Z0RKWlBqVVhJTytMb2l5aVNFb1VTZ0pVRnNsTmFPK2JTY3FjOXV4QzlEVVBO?=
 =?utf-8?B?c1R1L0FOOGgyYnVlS1k4WFAvMlAzRmFhVGhMcnVyek9IVE8vNGtpaWZSdGdq?=
 =?utf-8?B?Q3VHNTNBWWJYelZ5RVQ5MlRLRTJONUJIT29PbzZ1NW9uaVB3clZ2OTBVN2ZL?=
 =?utf-8?B?YUZrUS8vRW1uUUY5bVU1S1dnRzBCRm1TRUlBUUVzS0J3VzJmSTR5QW1QZXQw?=
 =?utf-8?B?TWg2TjE0RG0rS3ZPTHlEc3NqZ05iL2dnZVJ2Z0RCK21nL2R5OU91QktKMnc1?=
 =?utf-8?B?V0NEcy9aSlNCYmorY1NRTkV4SXc0OEFiWFd5Vy9waU9ucVFVTEVucWJEaVJI?=
 =?utf-8?B?VVFINWNVMzdRZS83dksyMUoreGlERldMcEs5dzRsemRSV1NQekJOcFB4Y29m?=
 =?utf-8?B?UmREOEhhUkYxelluUm5ydnQvVzQyT3ZEaG5YWTJoRkFwMW9ESXZ1TzNXOVpw?=
 =?utf-8?B?NThINTVTbHFmVDhTOUdSbUJYdXYrT2ZiL1JEbUJ2bjdFQXkyenZLUk4zNVN1?=
 =?utf-8?B?NHRYRzZLRjlST25JakRkZUk0bldKNmQzY3BJcXY5NERTTlo0T2ZBWDYxMHdX?=
 =?utf-8?B?VStUSHYyTm93eTdSbFhoWHVNbTlyVUNja0tQV2drZDgrS010QVNvQVdaUWxs?=
 =?utf-8?B?WnVrTXMvL1BoWldNMkIyWXo0K2o0M0J6d2V4V2pmUmxBVjBmWDdDQU1DaDNB?=
 =?utf-8?B?ZTJZZmxDMEU3QlJBeUZFeGhHVE15U1ZHY21jc0JLeFVFODlnak9yemtKcVJ2?=
 =?utf-8?B?amgxbmVyZjFmeTNwWDdrYUZ2NlZPUHh0SVgzOEU3aTE1cUVQUDBkdmlOMmNz?=
 =?utf-8?Q?LV0D98m31TWq2BU/0cXAcXmSZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de3ae34-738b-48e8-f1b8-08dda7a3f3be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:21:17.0028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KK9Dt9Rwr0wMJyePefAfqvZA1BqQSEcSK3GJ6T9iBgG8hgJBfm6CiB/D7xt/AvWvlFPqAtyZWAeUIaKvBJs93A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7302

+Denis

On 5/27/2025 4:10 AM, Basavaraj Natikar wrote:
> Add changes to enable operating modes in the driver to allow the FW to
> activate and retrieve data from relevant sensors. This enables the FW to
> take necessary actions based on the operating modes.
> 
> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Comparing this to the series that was submitted by Denis [1] I notice 
that the main tangible difference is that this isn't exported into the 
HID descriptor.  So how does userspace know the current operating mode 
with this patch?

Link: 
https://lore.kernel.org/linux-input/20250309194934.1759953-2-benato.denis96@gmail.com/ 
[1]

> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_client.c | 23 +++++++++++++++++++++++
>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  4 ++++
>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> index 3438d392920f..0f2cbae39b2b 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> @@ -146,6 +146,8 @@ static const char *get_sensor_name(int idx)
>   		return "gyroscope";
>   	case mag_idx:
>   		return "magnetometer";
> +	case op_idx:
> +		return "operating-mode";
>   	case als_idx:
>   	case ACS_IDX: /* ambient color sensor */
>   		return "ALS";
> @@ -243,6 +245,20 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
>   			rc = -ENOMEM;
>   			goto cleanup;
>   		}
> +
> +		if (cl_data->sensor_idx[i] == op_idx) {
> +			info.period = AMD_SFH_IDLE_LOOP;
> +			info.sensor_idx = cl_data->sensor_idx[i];
> +			info.dma_address = cl_data->sensor_dma_addr[i];
> +			mp2_ops->start(privdata, info);
> +			cl_data->sensor_sts[i] = amd_sfh_wait_for_response(privdata,
> +									   cl_data->sensor_idx[i],
> +									   SENSOR_ENABLED);
> +			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
> +				cl_data->is_any_sensor_enabled = true;
> +			continue;
> +		}
> +
>   		cl_data->sensor_sts[i] = SENSOR_DISABLED;
>   		cl_data->sensor_requested_cnt[i] = 0;
>   		cl_data->cur_hid_dev = i;
> @@ -303,6 +319,13 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
>   
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
>   		cl_data->cur_hid_dev = i;
> +		if (cl_data->sensor_idx[i] == op_idx) {
> +			dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
> +				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
> +				cl_data->sensor_sts[i]);
> +			continue;
> +		}
> +
>   		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>   			rc = amdtp_hid_probe(i, cl_data);
>   			if (rc)
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 1c1fd63330c9..2983af969579 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -29,6 +29,7 @@
>   #define ACEL_EN		BIT(0)
>   #define GYRO_EN		BIT(1)
>   #define MAGNO_EN	BIT(2)
> +#define OP_EN		BIT(15)
>   #define HPD_EN		BIT(16)
>   #define ALS_EN		BIT(19)
>   #define ACS_EN		BIT(22)
> @@ -232,6 +233,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
>   	if (MAGNO_EN & activestatus)
>   		sensor_id[num_of_sensors++] = mag_idx;
>   
> +	if (OP_EN & activestatus)
> +		sensor_id[num_of_sensors++] = op_idx;
> +
>   	if (ALS_EN & activestatus)
>   		sensor_id[num_of_sensors++] = als_idx;
>   
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
> index 05e400a4a83e..2eb61f4e8434 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
> @@ -79,6 +79,7 @@ enum sensor_idx {
>   	accel_idx = 0,
>   	gyro_idx = 1,
>   	mag_idx = 2,
> +	op_idx = 15,
>   	als_idx = 19
>   };
>   



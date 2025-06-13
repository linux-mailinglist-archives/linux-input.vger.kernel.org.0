Return-Path: <linux-input+bounces-12888-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5491AD8FEF
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 16:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 195F73A51A3
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 14:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FF92E11C6;
	Fri, 13 Jun 2025 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mzaXyB/t"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698A7261F
	for <linux-input@vger.kernel.org>; Fri, 13 Jun 2025 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825986; cv=fail; b=ibb7zIcgS2YTjippfw9FDtKpX89EJsbmsGKgcRhIyheaFBL5+tTpFFQ9O57CwiDVLPN+Brb/iziAmlbT4h86axEjQ9U1St63kXuXs/HwoqZLTEfdrUMKz1lhIRolg9W5aROO1nKIhA3tG+TDYE0VzzqRTofaoaLT3igGrqkYHgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825986; c=relaxed/simple;
	bh=BUhitTQtyoPkd3H9wIawR9939R8hwNzhEzXzJ3barN4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TRKPFPfVzMRP1bGvdVqR7ch8BdQBvYD1q6i0Wn9OCTIRL3GHLXhLEmZ+hso5+zNOemeeN9pt4QmzhALu0zGdvztk/T7kunsoOaAnGV9+K2zStX+ld8THj+qFrRK5x5PzDTGDipGN1dzM/TnGf/u0wWgUc16kCD7qjG1kqlHi0Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mzaXyB/t; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVmgv4cm0Yur4BSU7ov/uywbwl7z5P5ywgXvGwoqf7y2o5v0ScY8uHPqAaQo5yhRnTyosXbAoKX1aGE2saRzlxOBfKJiOEqtOZCKUSO19Xu+9s26bVhqUWmBkVkUvnVl3tNokqWCn2wunpBwHxNXpNuac6c7M/s8jtzdWh191i9clXc1b+h/qGOgrSwsdrRVGY+f6d9fobGEmDQmfFi2BPlKlopgIctPrNoDRBxNs3RTPIQAW6RvCwaQ1Z7X1I1aai5rrzxNeAtBXZsw4rqnL2JxXMNTBNskcT1OUXJBCPHRgG/lQRjDSHaJPhatTfpAx+Ii/FWFEICFTuSC4z9flw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prZSbhntBPGlhlOLh5Pm8Mn7mu2OrdmKUPuGd3hGDds=;
 b=D4gmyq/YU1RBeOZL3K5mNkS4Af9g2B0yQ7XwbEAvCaZh0ldkjamZ/WO0eCJxfg8hNurDR4ySdvVVi2zKCqP/Pe9bS4HEspkPbyouCFq8tz0/lpql+9pt/4um3PNl2GR8m2TPn4VdRYM7txDgPFonfUdBwPgSWVDRAOBDO/MbWZDO5nFkYsh4zTILQvmpHKxpNI0lMYBZgLvaFZuO1OGsHUBCzz3gWpCblsDt4og5S34FcPh5U8OGDfupKxpgfPhrTX0ISQyJkqr9P2OmxDGyEHcQy1O5tNkiueW2Nm9iw7EqVA3ycFveaFJFMV+fUzpNejsJTAB1hRBTCBOw1kz3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prZSbhntBPGlhlOLh5Pm8Mn7mu2OrdmKUPuGd3hGDds=;
 b=mzaXyB/tv6Ox4Uo9WPDHshPcbaVWT/TIQsJEpMKiMCXWrZ4TygFH3b2ry7ZsIa0WEuyhzdwalN4BWbDF5RYuvheWj9LstO/GFsNLX2B9EHFxYHcwWzYHG2RmmXkv97h/xW6hqVewLQ0NoR6AApAfeYjd20m00toXH827n1ARrmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Fri, 13 Jun
 2025 14:46:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:46:20 +0000
Message-ID: <75105471-8f60-41ef-bd51-c7c4ea255664@amd.com>
Date: Fri, 13 Jun 2025 07:46:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Enable operating mode
From: Mario Limonciello <mario.limonciello@amd.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, jikos@kernel.org,
 bentiss@kernel.org, Denis Benato <benato.denis96@gmail.com>
Cc: linux-input@vger.kernel.org,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>
References: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
 <d63d94db-e257-4419-afeb-a661e833aa81@amd.com>
Content-Language: en-US
In-Reply-To: <d63d94db-e257-4419-afeb-a661e833aa81@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b3312f-4853-42c1-3b1c-08ddaa890f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2FrL3l6Zi9Vbk9JRUp6Nm8vY0dLQndwMmcyQ0c5VVlJTHhiMFRGSDhEdUJS?=
 =?utf-8?B?YkgvWDIyb0JUQ1k3WnhIYWIyNDIrUUc0Uk1UbHBlOG1URGZCTXAxZ0wraWZB?=
 =?utf-8?B?M2pSeFA0Q0hWSSswNDlEdWRNRkJIVkFlRkpWMzU5aU8zV1B6cVBjTWlzNVJo?=
 =?utf-8?B?TkEzYW13aytCYTNsU0RzTU5MYmxFbnJWdmRiVHVSOVZ6MjF0OVo4cGRGRjAr?=
 =?utf-8?B?Wk1SRlhxakwwMzhxRHNzOXlVR2h5eld3SDVLZmFrQnVQTVNMNHpacVdZMlRC?=
 =?utf-8?B?VkprWEFwYXU3b2VmNlY4bVFvOWdDdTh5Y2EyZlRBVWQremozaXN6a1NSdG45?=
 =?utf-8?B?bkFNUG9IeDlNOTNsVjZsRnBFNUtZaVcyWUdHZDRKbWN5am9zOVpIOWd4RTAz?=
 =?utf-8?B?a0Jia0RscG9sRXBEUzlGMVFhVGZZbG1ZdVRzbHRyYkMyRkVWNXN4STVTMHpJ?=
 =?utf-8?B?UnJwM3N2WlJ3L2RrMGxoaEFMUVk4UktiRTJBNGtUaERHK3pNVkY0d0d1bTcv?=
 =?utf-8?B?SlJXZHV5NU1McjB3bWtPK2RVVVNmcTI5d3dVQUVsd0lDbEtVK2c5dCtyVDlx?=
 =?utf-8?B?Z1hlV3MzREtUdWY4czBSdEh1ckIrQndTVWVZV1llVVpzQzd5SlpWQ0k1endl?=
 =?utf-8?B?YnVOdjN3dVQydUlaajV3bzBYSTRsMEh1OHV2cGx5QzA2SW1EcmhIS3phdFk2?=
 =?utf-8?B?Y0g1djcrWk1EV3hDQVVUTTk1WFB0RHZJNzBZb01VMzNPbnRmNWpYeTB5VU14?=
 =?utf-8?B?Mlh2L3ZDUDMrYnJQZm1uOVhlUFJ5SUw1aXNQWnJGZDRCdWJLeEFrZU1mcUo2?=
 =?utf-8?B?Wm5pK1VrN2VNdzE5MnhkYlVLUzZlQTZ1SlhEODdKRWJnZ20rdG9zVHIwNkl0?=
 =?utf-8?B?WnRhQ0FWYlNjYnhvVkNxaTNySy9QQ0tyVE91QW52MkUyZlY5Tit1K2NRRDk5?=
 =?utf-8?B?eEJsT2Y0eHhXWEZ5aXBmdHorWkg1M212bElYOXl2OEc5TDJybXZiTVROK2tV?=
 =?utf-8?B?ZWFFUDF4aUM5amgzYW9aaUVJSGx4b3p5citZL1ZacUtvbGxxTXFoaTRJTnIx?=
 =?utf-8?B?N2kvRVFJcm54UHQ0K25kZlF6M0xoZGdiQzd5VUVhaHdENm1FVEtXS0M5Q0VC?=
 =?utf-8?B?ejlpbVh0WHM3SXhDdXZOWkxnb3d5VlVkZTZkQStrRTZqVG5PYzFtRXE0aG5N?=
 =?utf-8?B?US8yb1BhMHZ0RjNtTjNScXRSS2ViUEdqVWYxM3I0MktpU3B3VEptZTg3RmxW?=
 =?utf-8?B?Y3hKaloyTnJKYUFKZkplQU5uM3JZL0FHcERlSGh2U0JKbUNPNnBPQThhRFQx?=
 =?utf-8?B?MDUrM2Z3U3JTVWpVYUhVWm1LTUNzUk1EODc1aG5PWWs2THVZR3ZTSlhWMFhN?=
 =?utf-8?B?R0Vtb09YQnZiREdQZnNaOEZDdVJ3OWZqUHBWdzNFT0RiZitSWnVSdUpFeHJt?=
 =?utf-8?B?cFJnTGR2eVZ4QnY5RXExWXl3THhReWpkM2NFYUVGRWJ5QXVHdWhoelZpUjhD?=
 =?utf-8?B?WVRnbHdHV0V5aXRiZGlpVk0xY1pYRnZwa1F0blVIazE4WktTK1J0LzhnY1Zs?=
 =?utf-8?B?VmFENzVKdVpGMTdPZWlUYlFwdzhWL0dSZmpadExpcmpCeG9ya0VqZHpyM2xZ?=
 =?utf-8?B?anM4aWwwMFNKN0tCekp0UHZIVjd1SHVuVkdYcS9EdFMrSEhmYVdPZUxqczAy?=
 =?utf-8?B?RHpuNUo2RjlBVWJPMnhsQ1VVbm5ZZE5iU1g3aUdvUWVCUjgxVTNzL2RCaTZx?=
 =?utf-8?B?ay9JT2FpQ1N4UGNmcHNFU2FiSm5qNmNNaGxCVElnSGhDbHNoYTJycjA3dkVT?=
 =?utf-8?B?b3l2MjBVNENpcFR2SXUzQm1rMlJNWHlNRmRmOFBoZHpYNmxaYk5JakhsWGta?=
 =?utf-8?B?eGVkRFMzbHFsR2w4TnZtOEt4ZjJsRE9IQm9vQ3J1R1RocHJPeDBtc2s3cENy?=
 =?utf-8?Q?vtDYUT98D/Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emxaR2hmR216Sm9IekwrUHVESVBFOEk1REhxQ0JCam5oVmZRRW41bkRJaVFN?=
 =?utf-8?B?bEdBb00yMkV1SndDdUdzN055SzhzRmRYRjZJaTlxN0toWU82d0ZuUy9Kb2Rs?=
 =?utf-8?B?Qm5GU01OaE1UUGg3K0hlY25lNFNLN2dvT05pd1BrNDdreXdCZ0R1ZHNiYmNZ?=
 =?utf-8?B?d3pZbmcxZnNodjlqa3BneVh6M1k1bkZ1RjVaNS9LZFR3Znh6cXQ5anVjN20r?=
 =?utf-8?B?dHExUFVwcHVnSXRyM3JBWDNnWUw0amIxb2NTbUdJY3VORWljTEtoc1RjRnRo?=
 =?utf-8?B?SHcxSHVFTWNrNFRpTlJYQ3VXSDRncVg4NWVmWDBxaURPMVRiQnJCdnZzV0JI?=
 =?utf-8?B?VUF3a0c2RzFqaVpuZHV4aWJVbmVUN040ODlvbHg4NmZQOERMVjdKdzRUT2xl?=
 =?utf-8?B?RTcwVUZZNWxwWWtrRUF1Y3J1cGYrdTBKMjhZSXl0ejRtODBCd0xjdnUvazRJ?=
 =?utf-8?B?dmFreFUvZlRMNGdCYWFsa2ttR2lTYlBPSHFzSFM1ZVhuZEZCelhobjVJOEEv?=
 =?utf-8?B?TWN6SWh2SGsyYStzQ1U2L0svQVorZVNPUmFIVjl2OWxUMmZlbkRCWGg1OGJO?=
 =?utf-8?B?SnRWMHZDQjQ1QmlFLzdFRUlwTU5pcHgxbzVIc1BIV2ZINGUwOW5vSkhKU2NR?=
 =?utf-8?B?ajJHUkFOTVQ5OWQzVlFMMDNud3JQaTBtZkJtTzhWQVBqVVR2clhpY3pEV3Uz?=
 =?utf-8?B?WDdpdEIvaUVFVWxyT2dEcFRqYnJtZjM0NnNmOUxlR0xsRVNraFNxVkZYY0dI?=
 =?utf-8?B?d05sZDJKOFR3NHI4YVVuVkZOdlFodW4vUUgxNGlmTk12d010dU15SXAyOUd5?=
 =?utf-8?B?SXJWL3NnSEllUmp0NmtsaFNjeEpaQ3lMZjJzUnk2MTJUN2JwSitvOWZYWno2?=
 =?utf-8?B?OG53RmVyeGw3OCtXdTVEbGhQZ292R05pNnFBcVJwZzFTOElMR09PWFZsdllM?=
 =?utf-8?B?Vy9HM3ExUG54b0ZHcWcyM0hCZGV2ZzcxUzV5SXFUWU5YcUhLNVR2LzM1SGpv?=
 =?utf-8?B?ZFB6SEw5U0VEOVRKZFI1S3kvdEtXVDJ6VDY3bkFCdmhNVmYrd2tuTWZOeDZG?=
 =?utf-8?B?NUxDUTZtZ25qcnZ0aSt4U0htRlVDV2ZybDdqY0FUNG55Y3pNdnZ1dXJydDJ1?=
 =?utf-8?B?OWFpTmx1NTNKVllsV0k3cEFCZS9jb0JrRDZKS05mOXJSNHJQNU1zOGVYREVk?=
 =?utf-8?B?MkNLUmVFTU1jMmpMZ2d1RDUrczh3UE5tU21MNVhkc0syTFlnMktpMnF0eFBt?=
 =?utf-8?B?QXoxeVdad3ZpYkJIaTg5QmdGQnR4QzZPdU50YkxYTzE4NG53YlpZNnVKbEpO?=
 =?utf-8?B?bjByVmk4NDJNQzRhdmlwb0g2UTVObHUwNkhIR1FMeXVSeWV2QTFLSmpFTXZV?=
 =?utf-8?B?MndmSFJ0WmVtVmpZNUV2VlI1c3dudTBqN1RkdWxzTVpyUUgxMlBsbVVrcmd6?=
 =?utf-8?B?MldKajZUYUpMSWgrOTc3aGNkTnExcGNrRFBiRHNIS0I5WkxOeEtoTUF5eVlK?=
 =?utf-8?B?Y1JXdHJraWF2YmQ1NC9veisrQWFYZjZ1WXBXYTJ0TVQzWC94WTNsZ0dLOTd3?=
 =?utf-8?B?TVJLQ3BacWlzMS9DbFMvNFM1ZG5nUVJtYTlFKzVUS0t1RWVnSkIyZ3VsejY3?=
 =?utf-8?B?N2R0UGFSQWxlWFlIeFBad3ZmRlpHdzBDNjA2L01BRFJINFlvKzR2dWlPbjVD?=
 =?utf-8?B?b2U5NEtSSWQrbzV3Q2JYQTRNL3BmY29NV29qM25Pd1lmYWh1UTRCbnI0Qnp3?=
 =?utf-8?B?cHZ5TThjVHBJT3IrOU1LdE9iTW5mNjFqZnRwMFVaSTh3MWU4MDgxenNybVlp?=
 =?utf-8?B?a0R3SktmelJRUGxPNzdVS1RMM3dmcVdKbEpwQTRmRnkxT05wd3hicE1vOUZE?=
 =?utf-8?B?NDUvRHZDb0dpQ1pzZWh6Z3hDLzVEN3FndWVrMG5XOUhvTUpMMlVTY0o1K2Zv?=
 =?utf-8?B?cnkySGtCZ1ZmSm1TNXVhNmRCdCsvVmZPZHRyODcxN3RPNENzZUN2anVwY0NL?=
 =?utf-8?B?ZkpYT3NQcDNiclhrVXRwN3V0bVV1aHU5Nk9XWGRhYk4vWGEvUW1LWUhISURC?=
 =?utf-8?B?WWFxU2xXa2toN1k0RkZtdkcxM0psMVZXcW9aUzZYZjlpUGlqUFZ0Q0E4SHlh?=
 =?utf-8?Q?BfP7pGddJkFo4FUpP7uWqlidq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b3312f-4853-42c1-3b1c-08ddaa890f7b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:46:20.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilH/Fsp0fNh7FYhckuPhpUR8lrsTiFlIfpM8TD0KkW0aUmPdsZPT9VO462P/bVKuwJDNhXiMEDVm9ROR14SSKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115

On 6/9/2025 3:21 PM, Mario Limonciello wrote:
> +Denis
> 
> On 5/27/2025 4:10 AM, Basavaraj Natikar wrote:
>> Add changes to enable operating modes in the driver to allow the FW to
>> activate and retrieve data from relevant sensors. This enables the FW to
>> take necessary actions based on the operating modes.
>>
>> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> Comparing this to the series that was submitted by Denis [1] I notice 
> that the main tangible difference is that this isn't exported into the 
> HID descriptor.  So how does userspace know the current operating mode 
> with this patch?
> 
> Link: https://lore.kernel.org/linux-input/20250309194934.1759953-2- 
> benato.denis96@gmail.com/ [1]

Recently a bug report came in: 
https://bugzilla.kernel.org/show_bug.cgi?id=220224

It was very weird because it advertised a tablet mode switch which I 
believe comes from the patch that I linked being added to a downstream 
kernel.  So there appears to be problems with the descriptor from that 
patch.

Considering this, I think what you're doing is fine for now; appears 
firmware is notified on tablet mode.

If there is a need for userspace to react to sfh then some variation of 
a descriptor will be needed at that point.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> 
>> ---
>>   drivers/hid/amd-sfh-hid/amd_sfh_client.c | 23 +++++++++++++++++++++++
>>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  4 ++++
>>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
>>   3 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/ 
>> amd-sfh-hid/amd_sfh_client.c
>> index 3438d392920f..0f2cbae39b2b 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>> @@ -146,6 +146,8 @@ static const char *get_sensor_name(int idx)
>>           return "gyroscope";
>>       case mag_idx:
>>           return "magnetometer";
>> +    case op_idx:
>> +        return "operating-mode";
>>       case als_idx:
>>       case ACS_IDX: /* ambient color sensor */
>>           return "ALS";
>> @@ -243,6 +245,20 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev 
>> *privdata)
>>               rc = -ENOMEM;
>>               goto cleanup;
>>           }
>> +
>> +        if (cl_data->sensor_idx[i] == op_idx) {
>> +            info.period = AMD_SFH_IDLE_LOOP;
>> +            info.sensor_idx = cl_data->sensor_idx[i];
>> +            info.dma_address = cl_data->sensor_dma_addr[i];
>> +            mp2_ops->start(privdata, info);
>> +            cl_data->sensor_sts[i] = amd_sfh_wait_for_response(privdata,
>> +                                       cl_data->sensor_idx[i],
>> +                                       SENSOR_ENABLED);
>> +            if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
>> +                cl_data->is_any_sensor_enabled = true;
>> +            continue;
>> +        }
>> +
>>           cl_data->sensor_sts[i] = SENSOR_DISABLED;
>>           cl_data->sensor_requested_cnt[i] = 0;
>>           cl_data->cur_hid_dev = i;
>> @@ -303,6 +319,13 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev 
>> *privdata)
>>       for (i = 0; i < cl_data->num_hid_devices; i++) {
>>           cl_data->cur_hid_dev = i;
>> +        if (cl_data->sensor_idx[i] == op_idx) {
>> +            dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>> +                cl_data->sensor_idx[i], get_sensor_name(cl_data- 
>> >sensor_idx[i]),
>> +                cl_data->sensor_sts[i]);
>> +            continue;
>> +        }
>> +
>>           if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>>               rc = amdtp_hid_probe(i, cl_data);
>>               if (rc)
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd- 
>> sfh-hid/amd_sfh_pcie.c
>> index 1c1fd63330c9..2983af969579 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> @@ -29,6 +29,7 @@
>>   #define ACEL_EN        BIT(0)
>>   #define GYRO_EN        BIT(1)
>>   #define MAGNO_EN    BIT(2)
>> +#define OP_EN        BIT(15)
>>   #define HPD_EN        BIT(16)
>>   #define ALS_EN        BIT(19)
>>   #define ACS_EN        BIT(22)
>> @@ -232,6 +233,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev 
>> *privdata, u8 *sensor_id)
>>       if (MAGNO_EN & activestatus)
>>           sensor_id[num_of_sensors++] = mag_idx;
>> +    if (OP_EN & activestatus)
>> +        sensor_id[num_of_sensors++] = op_idx;
>> +
>>       if (ALS_EN & activestatus)
>>           sensor_id[num_of_sensors++] = als_idx;
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd- 
>> sfh-hid/amd_sfh_pcie.h
>> index 05e400a4a83e..2eb61f4e8434 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
>> @@ -79,6 +79,7 @@ enum sensor_idx {
>>       accel_idx = 0,
>>       gyro_idx = 1,
>>       mag_idx = 2,
>> +    op_idx = 15,
>>       als_idx = 19
>>   };
> 
> 



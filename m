Return-Path: <linux-input+bounces-11161-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC95A6E7F6
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 02:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DCDB16A08F
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 01:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0404E7DA7F;
	Tue, 25 Mar 2025 01:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5Hp21InH"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5A45228;
	Tue, 25 Mar 2025 01:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742866137; cv=fail; b=ryuxzbHAqy9wpIb/DCXsA4sxozukoM7WxGPU+mc2GOqlEmsTEeGf/j9vkhqHt+1Hh3xnIO4A0zxRl6vtgU76k3I2InXiKUnqTZYxssscrFmDY58syPfh4g8Gkob6qox82oA7Gjp4Bz9HV0Qn1gsmgI3xwba02lLtZAz0FZaqgVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742866137; c=relaxed/simple;
	bh=2QdovJIgPTx00IhQIQT78Fm0dS37QNs+rryfBpn8hjA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IOKI2GG3VNP9G46h+icROmLPYonBVKoO88hED34pU+JUFKvmEvuoq+ebzDyKGtqwsMtoe2ylg32mf0F3P94TBA9MpbfmITBTXjG16IYJn0BEC9N4S7SgqjXZih+ht7tGqTbKT69w61jxjxclia4smU4swcrzb/qlRMGe1STi4kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5Hp21InH; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxQ1n+EItPWSyeqlspeC10/g3fu5/XSGz5BAs/jy1eHPK1rlV3kERski8xh53YJU9Kc+ibEavzDaoYG6r/U8jqXtFqyLW9QBue7mRiveUnB8qBJYKFCbxJFJummeoCifG+69k7C6YXmtrnKvE+QgpltHBzREqGoMNljPwBWtCV15GIH1yjO2Pp7rcBAR9+T/CzSpZaEWfQ8yLiojxjYzGGaJdPjFg+2ZdWpzy3V6SqHCI5XqssZBRMuBfK2LLwDyyLjqQ9lBiLcrgH7zsRAzNLlTmytWQAiczfdsdgb3/iUKnqVKymgJK5bQsIAajWmsMepLbsz7dtO6utCryp602g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f9vutctEMPZA6zPuKQ8VC66ps9EOycu/JU1UMTQOa8=;
 b=bsBv2bv8/gxH8x6jFYfyJzFVgDrx+6toyX/R/1sF0Ts+sTOlkUMDFtCXqr+ktz0HnMem7d7g+3gKFOjrvwo+CdNvtdlw7CVh1K6YjCk0kJ+QyS/zuojvC9BbD0Kx/9rIQ8FLQoEvBxPBLXyX9+MzBHRUM7qztuIwQfla0U4aa12ieakQXTSUi87QQ077HpWO8icJq+UumHMOO17mxX+r8gyyuPyyN/HEzhC0T/NKfxGp1nPLsJifbe0iB1ttcvQRkQu+BMaI/uCA5iy5XUGYct94WSjR7ZjIxep3HeOab+e3SX+uDXHDG9wLaTCQgS1NsghRwbJqBrH52zNKluKqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f9vutctEMPZA6zPuKQ8VC66ps9EOycu/JU1UMTQOa8=;
 b=5Hp21InHSzABDiC9JpQ7OPujudxtrnb5aA7xr2VtxqVRZq0mvFVZLBoGs1Pje6cp/fljckVR72Q09XVly+bf0Niq2fCKCVoHPAX5k3EuvEsMwByLPVi0XfpPoay0E1qrvRY3ouuIASRzdwcMv7FdnHZ+3m/jtFHnGjA4Hr6zZqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 01:28:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 01:28:53 +0000
Message-ID: <4e29bb07-99f4-407d-a289-8e16d02db2d8@amd.com>
Date: Mon, 24 Mar 2025 20:28:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org, lkml@antheas.dev
References: <20250323023421.78012-1-luke@ljones.dev>
 <20250323023421.78012-3-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250323023421.78012-3-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0018.namprd12.prod.outlook.com
 (2603:10b6:806:6f::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: da81f10c-2d7a-447d-843f-08dd6b3c6795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVFadHRWQ1pKZ2JtL3U0VDVDY0dTTnoyajZYT3Q0dlE3aG1PMDlmK29MRDVu?=
 =?utf-8?B?R3lwRVBOVXFha2VYZ0I1VVhXWW5EZHlnZWg1M3hQZ1oxVmJiK2NUZGh2MFNX?=
 =?utf-8?B?N1hrUHNOWG96K3JtcmdMSGZ3VzZUSXZQNDRza00yZmRsT2pKeVdUcWFRVHRw?=
 =?utf-8?B?eWdWUkhxckVybmIyQ2F5Q3lmdTVzVkw1REVwdURMTE15anRwZzgvUWVBeXRj?=
 =?utf-8?B?T2Q1eGlQOStrTmNhVy8rRTBJYmp5M3Q3TUhubFBEcVVZVVV2dVM2WE5Udkp3?=
 =?utf-8?B?QWhRNExTV1RKNk85TVByVXZ4NW44eUJaVEI4VEpvQXdOcHBzYTA2aXE4VFRH?=
 =?utf-8?B?ZVFyenVnT1U3Y2JMRlMxb0IyYU02UkZBeDlyS3o2WlNsUFBaS3UrdlpFVVds?=
 =?utf-8?B?cElpVXJTSDZzZGRxV0VxV2QxQXJ0NDdGcW82ZlU2S3JBSVZvT2pYdHlLVXNN?=
 =?utf-8?B?TFM4cmtvNFFNSGltQ2RLNW05KzB5RGs5WjV5NlRrS0VZUWlQc2JuMFIrbWFs?=
 =?utf-8?B?VFhiWlZPY0Vyd1BTK0ZxVXBLMXpDU3BockdCVWQ3SjZRdG9pTThEM0dPZTlE?=
 =?utf-8?B?R2hCckZMQWZ3RlVWaGVRKzQ0WVhoNWl2OEJybzZvYU9jV0ozWVFocHBqUDA0?=
 =?utf-8?B?UTRwUTAwOWpUaW5hOFJFYmhGNCtEQVE5SXB0Q3JWWm93NGUxSW5iSFBwdGdM?=
 =?utf-8?B?Q2hGWENxN2RBbmdvUENuZ1lzdUlTekJFMDVhdVhwOVdzZkVHWk90b2YrUFhE?=
 =?utf-8?B?dTY2QmhrSzVoUzVFcjFZaGVtS0drQVN1K0RjQjYvMUpwZXVZWEZkV1dUWHZz?=
 =?utf-8?B?RnJ5OEdJQ2ZDcmhmcEprdzJkbFB5SFBxQVVUNjk2WExlaUsrNmdGS3R5b1Zt?=
 =?utf-8?B?V2U3eTV1UDZ2RHhNZkZFRGt6ZFFOdThzOVhHTG5HNy9LbHJpNG1JcUpjTHlK?=
 =?utf-8?B?OVk0Tk1PU2ZtU1NSZjcwN1lDME80WGwveUVZMnlkZzA3aG9tdDdsYmUyYTQ4?=
 =?utf-8?B?VWlNc1FpMVhLaUxZYUx5TG1JOVJXM3dzUWdhNTc2c0hSNXhQaVpFQ2owWGNN?=
 =?utf-8?B?SWd2cm4yQ2RWcVFwNXlvaEU5RmdmTGpvajNJSUxNVGVGeEovYVRCcVkwN0FB?=
 =?utf-8?B?Y3RKakNza1VTZ3RsME1oSGRCaWI1UmJTVlNHdk1wL2U2T2V5Z1RPOWk0NDRK?=
 =?utf-8?B?QXc3L0s2TVp4NlhWOHArQ1lqSjBMSVU1QjhLL0lKc1lUUGVGaENOdlQ0SUhJ?=
 =?utf-8?B?ZTdRVG1ONjdyY2lweVRsY0doZmNiSzJEVndSeEhFcWM3S3JZckZCTFJQcENQ?=
 =?utf-8?B?dDJYQXdRMkxFejJkWWI3Vi9TRmtMVUl6K0hQTUpna3RoZkhMZlBlT3FtOVVX?=
 =?utf-8?B?VTZEM1pyTXFmR3lGMWNYcjlxZm5UL093b0VpUENkNHJvcm9qZCtYS1lLb0ZM?=
 =?utf-8?B?TG95UVpPZDFrRDhvenVOVFdRQU51b3dMbm8vbHBiNit3djdJeXBvUlJRaGVB?=
 =?utf-8?B?U0RYYkZOYmF1KzlVS1hZdXVmdjkvOW1MZkxJTlc1dmhIYWJucCszU1g4RWVM?=
 =?utf-8?B?TWlxekhhNjdXVnQwV21PVXdVc2ozZ05xTGZZYytyTUovdE56MWJsUXQ1a094?=
 =?utf-8?B?RExUd09aQWxyYVQ2V3dwTmlOU3UzU2xZMGVvdGVyWWpKdWlXbnoyTDdhNllV?=
 =?utf-8?B?T1JXeUdaM2VIWjhmUlVKZ01kR3R6WVJkWll3MGlFRHdLSjRUaGtFSlRxSmpG?=
 =?utf-8?B?T2hjSW1yNDdXRjNEVmRDUmNlaENQT2xzeVNtRHNWUW5wRE1NeUNVY0VmeHR6?=
 =?utf-8?B?THNINXlIWExSd0Z1OC96TlFJdlNwbjk1S0JtZmE1VkhRUytCRWY2bllnWUtL?=
 =?utf-8?Q?AnS22xONHDhN1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z25pL29POHBtTWc3RGV1SC9kSVF6cXBhc3RJVUREUGorcUtFR2ZSZUxDTzFh?=
 =?utf-8?B?OHJ2cFdWa0NPVVpTMWVMOVZHejJML09YNm1HaVNaSTRDN04xdE8xWUxaM2pi?=
 =?utf-8?B?a001eU8wT3FqckNQeTVFT0tHWVRkYUhTWEdPSk91RHFFZFZBTjFMNXlxR1BO?=
 =?utf-8?B?MlJld2JHU004OEEwMzQwcm9LeGpuNktpTmpKa2hxSEczS0pqczZBdDk5ZHNw?=
 =?utf-8?B?SHJUbzEzL3lTbVh3Z3kxZWJrR1A4UUpIdjBJdE9iQVozQlpBelVvSUhNY0Jn?=
 =?utf-8?B?M0VtejQrWTl6M3YzUng4M3RBVmd1dkhWRE9HdUJPSXdiUzVud1paaWIyY0Q4?=
 =?utf-8?B?NXNROWZlT0JDREV1NWQ0NmpZNThCOTlSUCt3MThWMlRSU08zU3JFaU1HVUJM?=
 =?utf-8?B?YWlTb2FMK1RzZUxlckJzUklqd0lsSkNUM0g4M05jNklDUkVPalllYkV5bVJ5?=
 =?utf-8?B?UzZuWVRDdHhHM0xxWm5IQ3U2dHZGMDVhSjl1d3hWbnVjVE05SlQrUS9NYjIz?=
 =?utf-8?B?cUJZS0lSdTl0T05CeitKSDcrcTFnZ3Vmc3Nac1AwZ21aU0VFK2ZUUXlhZ2Rx?=
 =?utf-8?B?REJrWi9kcHhsbFcrN0hVb0VIYkp5WFNwUERlN3hzSGk5WWFzaXo0aG1qZXZK?=
 =?utf-8?B?UnhwRmx5bWE3Yk5WUVdadnVMandTWlVaRlNJakhjYjNYb2VmeHF1ZW44dDAz?=
 =?utf-8?B?TmFSWmR2ZmZBeWFtc2pWMG5SK2dMQkxkcngvRlNnUm1vSGU0K09PaVNoSThn?=
 =?utf-8?B?dFdkOEJIVEg1K1NiNkN5MjlteHFRMkk2U1RiVGVJVEFaVEx3bkVHbFZWLzRD?=
 =?utf-8?B?cHMxRXFiMGNrTWFGYk5uSzhHNUJhaXhucSt3eTlqRzVMQkJKNUpjRGhnNXhn?=
 =?utf-8?B?Q2h5Y3A4bVhRbE9SUXpIenhIdFV2enV6K3JRK2hkTk1oNzBkNDBzaXZVQ2Nu?=
 =?utf-8?B?QU9HZUFubDg2T3YvYXoxcEpsNVhKVWRZcndCL3J6Q2MxbG9WMEY3dUZrSjhL?=
 =?utf-8?B?ZGlqdUVJR0Q4WlJGOTA4YTJBK1ZnL3gxcUVPeER2eEdENXNUNTByTlVzUzRy?=
 =?utf-8?B?WGlNOFhYMGlaNmdyZmIzQVI4eURCRkw1MWp0cXF6QWJ0YTFPc2JoRjhVVzIv?=
 =?utf-8?B?ZitxS1pCcHltZUYrdUtyNkJaSFhnTDVpQmZuTE92dlJJNDVVc1NzeUh6T0dp?=
 =?utf-8?B?aW5raW9oSk13SFV1eFQ3WFd5RGtBZHROckxWcVRWKzVUSWVVTkJYa1RKVUo1?=
 =?utf-8?B?elhJbHlZZTRLUkdZOU14N05zV2dLQWo1RGtlWGJsTHl6b3phcGhzdUxXMCtK?=
 =?utf-8?B?ODVVWVo0QlBaalhpaWhocWpXVWQvOGc0ZUNMeGZaMXNMY1pnZ3k4TkFTOUox?=
 =?utf-8?B?NEN2ZkliNGNRTHJJa2JJUjIrNVpaWmRUQnFqaW1FWXJybVcrL1dGR3pIcHEr?=
 =?utf-8?B?SlFYNnJsL1BVcisrT29Qa0dnb2V3RFpZWDQyb2QxTS9UNmtXMjZ3bzhSWEl6?=
 =?utf-8?B?WmszRzlRUElKUSs5VStQMmEzd0hlUGNwRGdZSTNvWE5xOFk0bkczTlROTkJR?=
 =?utf-8?B?ZmlRYmdSN2JGSkVjY0NKV3l0N0tVZm96Y3BxTkExU3pCYW5SZU9mSDNINXhy?=
 =?utf-8?B?YldobGNQczVTUWl1SWZ2SFdWaVo3aFkxMk1ITkpMVng4TmJPNjdDbFdoTFdu?=
 =?utf-8?B?VWJMbmRmYWFXZUhxcXVma09tb054YW1sOHQvSmFPL3NPUUpxTCtDYUFiMmhl?=
 =?utf-8?B?N3JTOW1vTXBwWUEvU2RjbE8xRTJzdC9yWUE4NytVSnk2a0N5M2NLWTRWbW43?=
 =?utf-8?B?Z1JsMEo3bklFSzlKcjZmbUU5YXJndEtuOUUwTU1BNThPdUc5TDBDYlhxT3hG?=
 =?utf-8?B?dW9rS1loQlBrR0tjTUFOQXVnL3RoTXdWUm9FeFVhdEhuaFJkdnA3OEppeHJZ?=
 =?utf-8?B?eEZOWEh2WXM4UVd0VExTbTJLeXJyTW50aVFxSEhEdlNKb05ENGM2bkkxVHh6?=
 =?utf-8?B?KzJUZlVidHlHaktpaU1MTnRkcy9ocEN3MzdYako3bG9oVlBCMWoyWnZqUTNn?=
 =?utf-8?B?bmVGQmRGZUNVVHRqSEY0SXBSZEprWERZYTVoZnc2ZzU2eTRWenl6MlNaRVpl?=
 =?utf-8?Q?qv90hkIifD4DA+8dzRp3uSMIW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da81f10c-2d7a-447d-843f-08dd6b3c6795
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 01:28:53.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0XE4fY0+wE9rpwzp8IQdWcCvAe6BHWUEnkDE36KK0VO/TKkIe81NmyAQxuxJq6ItC8GozaxcP4lwgSeFgt0gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021

On 3/22/2025 21:34, Luke Jones wrote:
> From: "Luke D. Jones" <luke@ljones.dev>
> 
> Adjust how the CSEE direct call hack is used.
> 
> The results of months of testing combined with help from ASUS to
> determine the actual cause of suspend issues has resulted in this
> refactoring which immensely improves the reliability for devices which
> do not have the following minimum MCU FW version:
> - ROG Ally X: 313
> - ROG Ally 1: 319
> 
> For MCU FW versions that match the minimum or above the CSEE hack is
> disabled and mcu_powersave set to on by default as there are no
> negatives beyond a slightly slower device reinitialization due to the
> MCU being powered off.
> 
> As this is set only at module load time, it is still possible for
> mcu_powersave sysfs attributes to change it at runtime if so desired.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/hid/hid-asus.c                     |   4 +
>   drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
>   include/linux/platform_data/x86/asus-wmi.h |  19 +++
>   3 files changed, 117 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 599c836507ff..4b45e31f0bab 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -624,6 +624,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
>   		hid_warn(hdev,
>   			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
>   			min_version);
> +	} else {
> +		set_ally_mcu_hack(ASUS_WMI_ALLY_MCU_HACK_DISABLED);
> +		set_ally_mcu_powersave(true);
>   	}
>   }
>   
> @@ -1430,4 +1433,5 @@ static struct hid_driver asus_driver = {
>   };
>   module_hid_driver(asus_driver);
>   
> +MODULE_IMPORT_NS("ASUS_WMI");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..27f11643a00d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -142,16 +142,20 @@ module_param(fnlock_default, bool, 0444);
>   #define ASUS_MINI_LED_2024_STRONG	0x01
>   #define ASUS_MINI_LED_2024_OFF		0x02
>   
> -/* Controls the power state of the USB0 hub on ROG Ally which input is on */
>   #define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> -/* 300ms so far seems to produce a reliable result on AC and battery */
> -#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
> +/*
> + * The period required to wait after screen off/on/s2idle.check in MS.
> + * Time here greatly impacts the wake behaviour. Used in suspend/wake.
> + */
> +#define ASUS_USB0_PWR_EC0_CSEE_WAIT	600
> +#define ASUS_USB0_PWR_EC0_CSEE_OFF	0xB7
> +#define ASUS_USB0_PWR_EC0_CSEE_ON	0xB8
>   
>   static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>   
>   static int throttle_thermal_policy_write(struct asus_wmi *);
>   
> -static const struct dmi_system_id asus_ally_mcu_quirk[] = {
> +static const struct dmi_system_id asus_rog_ally_device[] = {
>   	{
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> @@ -274,9 +278,6 @@ struct asus_wmi {
>   	u32 tablet_switch_dev_id;
>   	bool tablet_switch_inverted;
>   
> -	/* The ROG Ally device requires the MCU USB device be disconnected before suspend */
> -	bool ally_mcu_usb_switch;
> -
>   	enum fan_type fan_type;
>   	enum fan_type gpu_fan_type;
>   	enum fan_type mid_fan_type;
> @@ -335,6 +336,9 @@ struct asus_wmi {
>   	struct asus_wmi_driver *driver;
>   };
>   
> +/* Global to allow setting externally without requiring driver data */
> +static enum asus_ally_mcu_hack use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_INIT;
> +
>   /* WMI ************************************************************************/
>   
>   static int asus_wmi_evaluate_method3(u32 method_id,
> @@ -549,7 +553,7 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>   	return 0;
>   }
>   
> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
>   				 u32 *retval)
>   {
>   	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
> @@ -1343,6 +1347,44 @@ static ssize_t nv_temp_target_show(struct device *dev,
>   static DEVICE_ATTR_RW(nv_temp_target);
>   
>   /* Ally MCU Powersave ********************************************************/
> +
> +/*
> + * The HID driver needs to check MCU version and set this to false if the MCU FW
> + * version is >= the minimum requirements. New FW do not need the hacks.
> + */
> +void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> +{
> +	use_ally_mcu_hack = status;
> +	pr_debug("%s Ally MCU suspend quirk\n",
> +		 status == ASUS_WMI_ALLY_MCU_HACK_ENABLED ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_hack, "ASUS_WMI");
> +
> +/*
> + * mcu_powersave should be enabled always, as it is fixed in MCU FW versions:
> + * - v313 for Ally X
> + * - v319 for Ally 1
> + * The HID driver checks MCU versions and so should set this if requirements match
> + */
> +void set_ally_mcu_powersave(bool enabled)
> +{
> +	int result, err;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, enabled, &result);
> +	if (err) {
> +		pr_warn("Failed to set MCU powersave: %d\n", err);
> +		return;
> +	}
> +	if (result > 1) {
> +		pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
> +		return;
> +	}
> +
> +	pr_debug("%s MCU Powersave\n",
> +		 enabled ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
> +
>   static ssize_t mcu_powersave_show(struct device *dev,
>   				   struct device_attribute *attr, char *buf)
>   {
> @@ -4711,6 +4753,21 @@ static int asus_wmi_add(struct platform_device *pdev)
>   	if (err)
>   		goto fail_platform;
>   
> +	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_INIT) {
> +		if (acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> +					&& dmi_check_system(asus_rog_ally_device))
> +			use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_ENABLED;
> +		if (dmi_match(DMI_BOARD_NAME, "RC71")) {
> +			/*
> +			 * These steps ensure the device is in a valid good state, this is
> +			 * especially important for the Ally 1 after a reboot.
> +			 */
> +			acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +						   ASUS_USB0_PWR_EC0_CSEE_ON);
> +			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +		}
> +	}
> +
>   	/* ensure defaults for tunables */
>   	asus->ppt_pl2_sppt = 5;
>   	asus->ppt_pl1_spl = 5;
> @@ -4723,8 +4780,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>   	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>   	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>   	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> -	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> -						&& dmi_check_system(asus_ally_mcu_quirk);
>   
>   	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>   		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -4910,34 +4965,6 @@ static int asus_hotk_resume(struct device *device)
>   	return 0;
>   }
>   
> -static int asus_hotk_resume_early(struct device *device)
> -{
> -	struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -	if (asus->ally_mcu_usb_switch) {
> -		/* sleep required to prevent USB0 being yanked then reappearing rapidly */
> -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> -			dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
> -		else
> -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -	}
> -	return 0;
> -}
> -
> -static int asus_hotk_prepare(struct device *device)
> -{
> -	struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -	if (asus->ally_mcu_usb_switch) {
> -		/* sleep required to ensure USB0 is disabled before sleep continues */
> -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> -			dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
> -		else
> -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -	}
> -	return 0;
> -}
> -
>   static int asus_hotk_restore(struct device *device)
>   {
>   	struct asus_wmi *asus = dev_get_drvdata(device);
> @@ -4978,11 +5005,34 @@ static int asus_hotk_restore(struct device *device)
>   	return 0;
>   }
>   
> +static void asus_ally_s2idle_restore(void)
> +{
> +	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> +		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +					   ASUS_USB0_PWR_EC0_CSEE_ON);
> +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +}
> +
> +static int asus_hotk_prepare(struct device *device)
> +{
> +	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> +		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +					   ASUS_USB0_PWR_EC0_CSEE_OFF);
> +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +	return 0;
> +}
> +
> +/* Use only for Ally devices due to the wake_on_ac */
> +static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
> +	.restore = asus_ally_s2idle_restore,
> +};
> +
>   static const struct dev_pm_ops asus_pm_ops = {
>   	.thaw = asus_hotk_thaw,
>   	.restore = asus_hotk_restore,
>   	.resume = asus_hotk_resume,
> -	.resume_early = asus_hotk_resume_early,
>   	.prepare = asus_hotk_prepare,
>   };
>   
> @@ -5010,6 +5060,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
>   			return ret;
>   	}
>   
> +	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> +	if (ret)
> +		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> +
>   	return asus_wmi_add(pdev);
>   }
>   
> @@ -5042,6 +5096,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
>   
>   void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
>   {
> +	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>   	platform_device_unregister(driver->platform_device);
>   	platform_driver_unregister(&driver->platform_driver);
>   	used = false;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 783e2a336861..8a515179113d 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -157,9 +157,28 @@
>   #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
>   #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>   
> +enum asus_ally_mcu_hack {
> +	ASUS_WMI_ALLY_MCU_HACK_INIT,
> +	ASUS_WMI_ALLY_MCU_HACK_ENABLED,
> +	ASUS_WMI_ALLY_MCU_HACK_DISABLED,
> +};
> +
>   #if IS_REACHABLE(CONFIG_ASUS_WMI)
> +void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> +void set_ally_mcu_powersave(bool enabled);
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>   #else
> +static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> +{
> +}
> +static inline void set_ally_mcu_powersave(bool enabled)
> +{
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +	return -ENODEV;
> +}
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
>   {



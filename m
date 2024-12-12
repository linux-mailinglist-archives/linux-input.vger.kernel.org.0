Return-Path: <linux-input+bounces-8522-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE09EF1FA
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 17:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79D501889252
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C65222D59;
	Thu, 12 Dec 2024 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EL2d57FX"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7E953365;
	Thu, 12 Dec 2024 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020793; cv=fail; b=Y2hr1OT1wZeaMygK9Z5+nCcCF9pP6Wx6/3ZLRD5p1wlMDFjIAomSD7E7pnYf8tZ/Ja0DaUCrBrVotGCYBoF7Q2+9+SbdMFvW3/kyBTa7KH0l5QsthtLbiPYXkv1eIyEW3J+j7Xf7fOhjWtEJ804VLh9iKqF+XjLxhc2Zreph2ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020793; c=relaxed/simple;
	bh=abkk69jJnEkfEOejQRUUHGkDj1c+22ZKWzBaYnBkZow=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7G2hKogZwxv3vlIsysncsmmIcLPywR9RLToF9hp/TVQYurDXNUJpUHEJtrxBGrVveDy5l6mAxL+o2v7yXi5XCyzDOgDsKdZPqDC6Ngc5UodUrD6b/pLnhjWMDIyGeQpja1WFWh9A6JuhSXhQdY7jKhwdVLngOQGNmEuhTeHlmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EL2d57FX; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6/t+sJ5IV5s9ihzfsjw0sodooZkG9WOqpaWzTIUHa2ypNJJjg8EZ0FhwWDl7ptefSw4PGuSagXb46t0QT7OZS9Ttx4dNwTW7qE1/l3oG7M60DQeGK3gcl+QPbnZ6w2IFGmpBL6JMB3aLf2nnuX93JWbJ1zIiFD9UCDhpH+v+ppZ56RXa6TCiQmxtJLzOJ9/UVbLX5UInlBhqqPC/p3v1g5ouIdZe/kJLGYZGSkjkHtVyGxSqaEy+e5cML/a9DH/F6X166SxBn3t51qvJiDBMxg8iujQanq+67vB/12rnDm6TZ6WK1awfpsStDltD7CLHgEpJQ2fO8X0YCbzkED5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S29FeeMgCniOr2dnBzIwgWPwSz60sTK4b54IuMOKb2Y=;
 b=U1t+5mx2OFxdo/4Gu2K9xMY07ORbA8ZzjhKukH36jCPEABOTouL0oTOLcdBrJQgdCQe/SOHd6oHihEoFqjuexTaDY6pn73AA/GuHYLDI8HK6LbJQ4egCchXIDY2TSf5G2FshKzfcMxAckeLvzC88eMJTTkve43l2eNOXc8yzctcAqyJupKMq5C4jdTaW6pzSgv/lrfgqbCTKZTwkA9IE8H54w3XoRHmUVx9b/p77sqeBMewJECq10F5AHISfF639ZywZ9V0osXTBJ/lgCsAAg+zPFhh/Q4fJrWkfPHI2Hm5owM9FZAawlZGTy9mw92V8+wwqwDmLS9G2Qkos3Ud2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S29FeeMgCniOr2dnBzIwgWPwSz60sTK4b54IuMOKb2Y=;
 b=EL2d57FXupA0f34sSvkDDxek4dzqg5FWcN52nqPxuSeSAf9vU5B+97zOVk1IYQPTaQ5RjGHkD0E/SSE+LGOX1zGJ4Ow2ls8MRRH5IY9tHVOBxOUFWf3GeK8nZZVB+Cgb+NDSWX8fXmxihfuxbvGUUqYTCGsiY4lf2Y1WnLu6ehE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Thu, 12 Dec
 2024 16:26:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 16:26:28 +0000
Message-ID: <ac9983d4-432b-4ad6-bd6c-f5f72aeb2493@amd.com>
Date: Thu, 12 Dec 2024 10:26:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Get SRA sensor data from AMD
 SFH driver
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
 <20241212151951.1922544-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241212151951.1922544-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0179.namprd04.prod.outlook.com
 (2603:10b6:806:125::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: d9589df7-a259-462d-7938-08dd1ac9baf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGlVS1BLZm5RYUt4MkFLTi9NNFdxblBTWUtxR25sTmV4SkpPT3dqWVFRTG15?=
 =?utf-8?B?dGlSVTIzWGNBMkZSNjYrNXg0TXQ4a3lKTFJpUWIxRlcwdVQ1UTh2Vkw5VVJ0?=
 =?utf-8?B?b21tMTVkKzFxa1RvbEt6cXdOYnQ1K1g0Zi9DK290NUZrcG1nWjZKVFgrb0E2?=
 =?utf-8?B?Zm1udlRNMTNUYU9WMi9sYTcvQmVpS3NlZFJSbUROYTBZN2d5cjFCR3EvN0pT?=
 =?utf-8?B?SlZ0R1grdVdzWE0vakkxNGZSVFhSaEZlMWFyT0pwTVQyUTJQQk1nUVZKTWhj?=
 =?utf-8?B?bzJxdmw0YlZBQXM0UVYzTnpxVzhWYjZJN05OaUtBc05nK1FGM21zYkJPWGg1?=
 =?utf-8?B?a2pMNUEwSS9US2UxZTcveDk0N3JwS2NwWnd5SkY2eXZMTDNlMVZXOXE4dy9r?=
 =?utf-8?B?UVRpcm1SS0FEUFdJa2RQa3I0Smt1eldsVXhHY293YjJVcnJCM0p5akNOZVFD?=
 =?utf-8?B?Wis1ckpETWk5T2c2NTRuWnk2ckVkcWRlQ3lxYThQdjdmcXFJbW1pUG1BUzI0?=
 =?utf-8?B?MDV5R3JFQ0wvL1pReERhcXU2QlpFQ0hWNHR0dmNhM0lHNmFXbGpaUnhaN2xL?=
 =?utf-8?B?ZDVDTjhqVHJtYTdzYnBOQmFaVEprV1lLc3FPMDVBQTFoV1FHYzhmV1cxdUJV?=
 =?utf-8?B?eXpBYS9Wa01ZZVJpS3RGbkhOZ0JZY2NxOGVKRUxHaUVqY0xEcEc2TlJZc2N1?=
 =?utf-8?B?VE9rUnU0YVErNWEzNU13ajg3dW9lL2pCOXhyQ1FIeVRVK2wwMDhsSDVhZTRX?=
 =?utf-8?B?TGFIaGg3VmFXRFpXd2p0QWdZTnExaTkzTVZaRjg4RkZ0U0F0ZW4yY1E5V29v?=
 =?utf-8?B?eGpJbk1uUTg3M0EvVWtmdnlmaG9CR1FuRkhZaFpuRjhiSlJaY1U1VnBISXBp?=
 =?utf-8?B?QTZWejdZTHdWUmE4MW5kNFVLUExoSWZFbDdJYXp5NXNBbm04bGtkQ3RpWXFN?=
 =?utf-8?B?bVBnZlljdFM5SnFUQ1dJTWtrS3d2ZHQvZmVnZmlra3ptbThMSHR6eTE5NGVZ?=
 =?utf-8?B?RlJEbTNkYVUvREx5cmZqWVhVYWdwd1RqK28wSHNVUTJxaXlqckRMaEU1YUVh?=
 =?utf-8?B?QU11Qmc4S1oxRTlheXNNc1pPa21QK3ZtRWlhSDRpTVZORGJ1N1NEZWhQUW1z?=
 =?utf-8?B?NVpGWDlOc3RYRjhtemxWczhGNXRIMW9oT2lwdTRhY2t1a29JVXpEeGlzc0hT?=
 =?utf-8?B?cVh4aGpOVi93ZEtwOTh1NGhNVEpheldIL1ppd1gzU3dGRTFhMVEzQmVsbVBJ?=
 =?utf-8?B?SE1Jb08ybThHRzNyR0dCNFlMc201bGRXU2ovdkZZMUZrQ3B6WjlwR2VDcFll?=
 =?utf-8?B?UTlmemNUb2wzTEpxRDQ2K0xhNFV3QUdESnlnT0hsOG9SdldscVFITCt0QUhl?=
 =?utf-8?B?VmZZeGgvUmN3MFZKMTk4dnpvYlc1WHBJeTZlbFlHQVFtUWViWEJvL2ZMWDE1?=
 =?utf-8?B?UmEwSENoUWpseVBqc25jM1B3RkNzS05EL1g0TWVPUlI1SEh2Um5WM0tlWG4r?=
 =?utf-8?B?aFNndXk0c3RkM2VTYk1zb1dqell1eXJQbFYzYWtqNFRpd3NlOEc5NmhweWhR?=
 =?utf-8?B?dnJTUm5jTzBCb0pFRG85K014V3lZOTZxdjFyTVcrV0c1WkZIbkdETWFUaW5l?=
 =?utf-8?B?Q2UzVllIRU5RQi9RMDJKMjBYcGZKRllqSGk1cE1icUhGeGkrd1p1OW5mSkp5?=
 =?utf-8?B?dU0wSVBVRXFFQzdTYndqRmFHNEcxeDZ1SHBSU0pNclhTMXlaUUJNMHhrak5r?=
 =?utf-8?B?VTF2MVN2dG15VGYxVm45NGVxdnN1WU1ndVk4RUlpZ01lcm5JYzlkcmNKTFFD?=
 =?utf-8?B?ZGxWTHljMUcxWUJnS1lhUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWRCUjdHODZLWWhnbURwME5lb0tPZE9sWVJpdFQxNmZWZ0hKR0JqM0p0WmZW?=
 =?utf-8?B?SlE2NnVyVnFNenk3L1dIU2dhWlB6QSt6MXFUQnZ4MmYyUm9LcUl4STBOaEkw?=
 =?utf-8?B?djM0Zkxva200VUVjUnRMVTh3YTQ3RzRzTjhFNm5EZi9MUXJ3T2ZmcUNMcndV?=
 =?utf-8?B?dmpBYzAxYnVFRjZSNnhiZEhtYmlTUVAyMk5lOTAvT084TktveXIxNEsrNXFz?=
 =?utf-8?B?Q0o1cGtFVnBHVFdoWGFmbXQ4b0NHT3dPVndYbnNKQzg2ZWUwVU1sVEJSMUwr?=
 =?utf-8?B?VDRXVHBRamp1UGs3aklwMnFIWEZWNnBsVGFPUklJRTREcjVOTkM2SFROYkJk?=
 =?utf-8?B?bCtHUFNNdG9Ba3ZERXc4ZmIxT0ZEVlhWZVZnc2xPRHFUTVdvS01SVmRSZmEy?=
 =?utf-8?B?dmFyRUh5ZGUwYnNxMlJQeDVmZzQzby9NY0VpZCtwcG5zdE84a1JmNXJZMm5M?=
 =?utf-8?B?dG04T2tYbnhZdkFyYnFtWDkxK3NRWENUQS9lMGQ5K2UvVnk3S0QxOUlLYWt2?=
 =?utf-8?B?ZkNnYXNlVW43TUxOQ1lpTEI2QVQzM2QyeDlBa29RZGtLWlhSVktZZGRaT1NH?=
 =?utf-8?B?SVV2TTJGTUJ0TDIxTm4zYmN2YmJJZDhlSHJnZEpxdWFpWGR3Zyt6VUxpblM3?=
 =?utf-8?B?emJlVXJBM1h1RnYzZDNIbTNZSll0a3RGNWZmV1hFZWkrZCszT3JwcU5KOXdz?=
 =?utf-8?B?NXBzQm9EVEp6RXE2cGx3TXdGbUhhdEUvWkg2eWJlcThzVzZQTm4xRzkrUUxG?=
 =?utf-8?B?ZkNIWGNpNDhESlM1RitBa2lDLy9SZmNKUjZKYTdkRmd3cHpzRmZqTlRrMU1t?=
 =?utf-8?B?NVk3Wjg2T3dBM0tVd2dqSGVIVDI4Yy9QTzlyK2tLVmtUa0c4QS9OV29nN25t?=
 =?utf-8?B?S1Q0ZXd5ZFJVak56U25aNXZSOGM2VjQ0NjN6ZjVEalVVbkd5L0NIbTZpMFkw?=
 =?utf-8?B?KzhmMlM1bThaWll3YVVDTnJVcU5VdDZpdm80cW9KWWVDTkhJU3V2UjN6N1lF?=
 =?utf-8?B?bVZTejI2blg3OUxndE1KeXdFbm5JZVJuMnA2ZHFwT3NRNWREWURCdW02NVFp?=
 =?utf-8?B?aERRK0FhZmpMZmsrRUJXd0NIM1pqckg4KzhTVnZPKzNyd2gwVDh3MDd6M3Zh?=
 =?utf-8?B?T0lDY2tjOE4wZVdvM2RNOGFEbWF2c2xRdHpXTUE1d09POEFJRTNGS1lydndP?=
 =?utf-8?B?bjRBcU44RXpqRlJmVTB4cEdKNG0yVE9Gd20yZnlHZWFOamtkUitncjVZMDVC?=
 =?utf-8?B?dXd4Z1A1V0g0NUV5bk96Tk4wMEpDMnNUUHptSlJnWlR4aDJneVJHNWpibTNB?=
 =?utf-8?B?emFqdWUwckpWL1ZVM1lOV2ttQjk5QTVFVERtRWF0cWJ5VkpyV2t3TWVtdElK?=
 =?utf-8?B?NnBhbHl2SVVvclB3N3pxWTZuMmVGbys4NWJhLzRRTjZjWHVpeTdKZmhPbGlr?=
 =?utf-8?B?VjY4U0VTSFFBb1J5OWlsb09nQVQ1R3VuQVRtM25wSXpBeGZoVW8xMzN0K0hU?=
 =?utf-8?B?MEFseU5qbUVqdkVwSUNnTDlYcjB1a1pEd01ObUJhcVZCVEdobXdRMHhFUzV4?=
 =?utf-8?B?RE56K2tMZHpCNmU5UndOTXIzMlY0UktwOW54Mlo5aHNGUVRJYXM0S1lHSXhY?=
 =?utf-8?B?VU1GVVBQcm5UZW9JN0lGOGhvYXRMeXdkYVJlUzNMZVRvcHFRRjlyNnVIaDAz?=
 =?utf-8?B?U1R2Qkxzd3RnbXNtcjZxQkd4K0xTVVR1aUJYUkV3cWlmRW1yaThNblVQb3ln?=
 =?utf-8?B?c0RDMnV0M25tUmdUWVNBdzVDbzFlSGtYVkJ6R1l2RmczSlI0Smp5RlIrUVU4?=
 =?utf-8?B?cDFGaVhlVXdFOFJPMTBUays3bVhMNFoyRjNGcmhtQU1EZkIrVkV5N0drdXJH?=
 =?utf-8?B?S3J3elZqTWQrQkRhR2RVNG9EeVFQS0o4NWpFMDNCVjF2WVdvZWdBUVZQRGNR?=
 =?utf-8?B?VnlGNi9RUEtLOXo4dVN6ZFhQU1c5S0hxOGVka04rQjEzMU9QUCs4eE5VL1VY?=
 =?utf-8?B?U1BKZ0hQcGZrNnBFaE4yaFNEME9WNkp1NldUYlppZFJPTkd6c0U3Z1k3K0Nu?=
 =?utf-8?B?RWx2cVVlUTg4RS9KWGxiWk11MFkrNDQ3cENVV0hoNFpzdWpwNTlwZnMrVm9E?=
 =?utf-8?Q?oI5HlSY+nWXygx/Lo7CoCCSXX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9589df7-a259-462d-7938-08dd1ac9baf4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 16:26:28.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDYf8Ea1Y0OAu04GKlB69BacHL/yI9OTJ9OH9P8B9PnGutm35i5y/hxCmeA2bCI+yawlgmyJMoE07+jeU1qwgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196

On 12/12/2024 09:19, Shyam Sundar S K wrote:
> The AMD SFH driver includes APIs to export SRA sensor data. This data is
> utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
> enabling the AMD PMF driver to implement the output actions specified by
> the PMF TA.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
>   drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++++++
>   2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a79808fda1d8..c343eaa84755 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -616,6 +616,20 @@ enum ta_slider {
>   	TA_MAX,
>   };
>   
> +enum platform_type {
> +	PTYPE_UNKNOWN = 0,
> +	LID_CLOSE,
> +	CLAMSHELL,
> +	FLAT,
> +	TENT,
> +	STAND,
> +	TABLET,
> +	BOOK,
> +	PRESENTATION,
> +	PULL_FWD,
> +	PTYPE_INVALID = 0Xf,
> +};
> +
>   /* Command ids for TA communication */
>   enum ta_pmf_command {
>   	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
> @@ -667,7 +681,9 @@ struct ta_pmf_condition_info {
>   	u32 device_state;
>   	u32 socket_power;
>   	u32 skin_temperature;
> -	u32 rsvd3[5];
> +	u32 rsvd3[2];
> +	u32 platform_type;
> +	u32 rsvd3_1[2];
>   	u32 ambient_light;
>   	u32 length;
>   	u32 avg_c0residency;
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 06226eb0eab3..d5f764e624b4 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -16,6 +16,46 @@
>   #include "pmf.h"
>   
>   #ifdef CONFIG_AMD_PMF_DEBUG
> +static const char *platform_type_as_str(u16 platform_type)
> +{
> +	switch (platform_type) {

I notice you're missing "LID_CLOSE" case here.

> +	case CLAMSHELL:
> +		return "CLAMSHELL";
> +	case FLAT:
> +		return "FLAT";
> +	case TENT:
> +		return "TENT";
> +	case STAND:
> +		return "STAND";
> +	case TABLET:
> +		return "TABLET";
> +	case BOOK:
> +		return "BOOK";
> +	case PRESENTATION:
> +		return "PRESENTATION";
> +	case PULL_FWD:
> +		return "PULL_FWD";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static const char *laptop_placement_as_str(u16 device_state)
> +{
> +	switch (device_state) {
> +	case ON_TABLE:
> +		return "ON_TABLE";
> +	case ON_LAP_MOTION:
> +		return "ON_LAP_MOTION";
> +	case IN_BAG:
> +		return "IN_BAG";
> +	case OUT_OF_BAG:
> +		return "OUT_OF_BAG";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
>   static const char *ta_slider_as_str(unsigned int state)
>   {
>   	switch (state) {
> @@ -47,6 +87,9 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
>   	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>   	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
> +	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
> +	dev_dbg(dev->dev, "Laptop placement: %s\n",
> +		laptop_placement_as_str(in->ev_info.device_state));
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -190,6 +233,14 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
>   	} else {
>   		dev_dbg(dev->dev, "HPD is not enabled/detected\n");
>   	}
> +
> +	/* Get SRA (Secondary Accelerometer) data */
> +	if (!amd_get_sfh_info(&sfh_info, MT_SRA)) {
> +		in->ev_info.platform_type = sfh_info.platform_type;
> +		in->ev_info.device_state = sfh_info.laptop_placement;
> +	} else {
> +		dev_dbg(dev->dev, "SRA is not enabled/detected\n");
> +	}
>   }
>   
>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)



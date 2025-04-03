Return-Path: <linux-input+bounces-11497-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB54A7A750
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 17:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968F0172704
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 15:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C6324E4B1;
	Thu,  3 Apr 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G+8GBQA+"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71F724E4A6;
	Thu,  3 Apr 2025 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743695858; cv=fail; b=JnVX4tQ+bpou0gI55BSms7ON0GzRODr/xU63MofV2SUKP5b4cK2lggA2NeNTeMyFkl5acPkrhHFXsMtZUN63IhSeoh9Wnr8ZHQ9XgxR/+1gdA34ZiUZgyAMA+qj/kr1Fl7ThWXAUNMVWuUFrXrlmzHLepesbwyD819xgANjEWnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743695858; c=relaxed/simple;
	bh=tt5dX7E4anCL/GOT08efeTMkDzc1P2kK5FE5fqRUsrw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=icyr8p3eKLXA+hzd2sfmfpOkFG5Q5orcRNjTWUtsc/1wsYPTFaVm1UZFxve1vguzPxhMNT6lyDEPCgqa7hbYle0271U8l6Ti9TCy8sb291VurFEsKMGprjXE/Vjd0mKUXQBawpRp06+SncCCLT8CyiUeepc6ievzAH4cIw2KhoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G+8GBQA+; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJksQ72lt+3lvSJe6ElvYgjcgFKLZi0k/jNlJ6Vh/jQo/9sSEARswfs4yn6f3LHYD0a1fsfRKxHXO0B8lbzPVPBDes0U7xV5ab13HnMZudybtMhVg2gE6MgYsFdCOeFL4ikql1W/Op6zj0V1o4kk9/Me1KhhuzLWvZna7DoZOAxzhlVsOpo5zn2mA+Q9AenmtJgr3gl4s4cBYjNwfGyEqg/0X6y4Xak1Mgc0tBIPF3dqyQujiwwNHbhJEUFyjzygha697llPKQUqFiupjx6VbM/iUgL/+SsKAJIdenzlBHM0nnMzGg1Hnj2m1WP+kSYAJ5hhL9eEtzTQMJ7gwFz9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzFbBtoDcVXNWQRfZjLkGymR3YLkBZJLjPj2YqhvKZQ=;
 b=GcEtjqOnwGETZ9EOEoE4RITCjH2Sv+vNa4AaLzeVPXniQ0RMlROdPAHw1pXoYqGYZ6fF+Rew2xm+QBJ/JTGFZ4CvBWD+JAxmYJ5uB8abl7dPDV8O7fhI191hY9MIpw5ipIEGLFpH2Il7PVhpDhlH8at6GeKXTdo2cFJQze7G2FWIc5da+xqChPOXSmbPJFBp+YasByX2Ge0Hqmz7UoHNqb2WegJxW9JFSdIR5ArTPMnubAqGRrhVKTLI9SlMTyYIM1UGrer3oaHbG+Cj9/NthbR0qPFOKUTL/yct4IFROhmBVnYbvWTb7wIAq+4qZKP5M7wtNv8EruZ7f6uVjFls5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzFbBtoDcVXNWQRfZjLkGymR3YLkBZJLjPj2YqhvKZQ=;
 b=G+8GBQA+ekPHjN/uVjtxKypXDh4klzavkrxlU2qH00vrSWzmatj79I+idjbjdmwcW65+aCMcgQ6cnrhLSCsQHWiINGXAdcrcIclVEMmbvlklGyN1SoN//AdpG0l2EkW7xGU3l/i+bmkkSAMRssNsQxHbeaqkqlddxBUENsii2dQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 15:57:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 15:57:32 +0000
Message-ID: <3f8ba8e1-597b-4d3e-89b2-2ab48b1cdad2@amd.com>
Date: Thu, 3 Apr 2025 10:57:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmf: Use meta + L for screen lock
 command
To: Armin Wolf <W_Armin@gmx.de>, Mario Limonciello <superm1@kernel.org>,
 Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, dmitry.torokhov@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20250321193052.2973537-1-superm1@kernel.org>
 <3b7c719f-8aa6-424f-92a0-e2cf05b12ca0@gmx.de>
 <fe47758a-ca42-41b0-92bd-4ac86e1d0a3b@kernel.org>
 <edc8986d-3414-4bc8-8aeb-9465b148ab35@amd.com>
 <b52d9855-6433-4487-b006-34eeca8e2e9d@gmx.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <b52d9855-6433-4487-b006-34eeca8e2e9d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0157.namprd04.prod.outlook.com
 (2603:10b6:806:125::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 1286854f-4b22-487b-bb1e-08dd72c83ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzFkbnpkMXVKVTYyZWNTOUcvK2QySmkvOEJpZTlpYzVwbW5CTTU1TDQyTGls?=
 =?utf-8?B?eEN4V2EvWmlnWWlqOW5YY2JhQ0kvMlZISGwvNE5NR1JhbjJQVkhZZFNnV2ht?=
 =?utf-8?B?Q3JNM01uaHBxUno5YUI2aEZGYWpLazZMWS9jZ2h3OUpZSEE4K2pQZVNXcE9t?=
 =?utf-8?B?WVFqZXM4aElsSUhZSVlIM1BHMlVlNGNxV3B2OXJlV3lyNDRTclR2NjRxbllR?=
 =?utf-8?B?SXpnRlFWeGl3bnZiNUFBOElLdGtrRHpNMGlxcVhqTy80cXdxYW43bmNJZnJY?=
 =?utf-8?B?OWFRU1FRTTJlLzJDZVI5Nnp2TlY5cElOdWVDb3VmQlhxVy9rcXN0MUxSTWcw?=
 =?utf-8?B?TldTTjBTWm1lcHlJZ2NWam9oQmVwaVdkTXFlOExlODVIWUI4VldGS0hkVm5Y?=
 =?utf-8?B?OEtBSlhGSkZvTEtSWUUwTkhWeWRmUWRJK0lsbHIyT1B2cTJxdXAvenU3UDBP?=
 =?utf-8?B?RkFqaTlYWFh4TFRsUmdXL05LSEdUYVd4VHMvbXI5QlNCU1Y2VFVjbHVhSVhQ?=
 =?utf-8?B?V3FpdlpQNDRQTmJ3b1BsUVl3R09tSXEzMHhMU0dTYW1oNDZLR2tSWTNYT2xn?=
 =?utf-8?B?eFZ6WVlSRVBNVFpzU1UzaTlmeDE0Z2IxRXIyZzN6SUFJV3NqZUxlYUdXbWFW?=
 =?utf-8?B?MHJpZ1BLV29VVGJmL1ZaQVJiTG5IVHZ4dmI3aUs0eEZ1VHFHeUJ2ZXNzWU1i?=
 =?utf-8?B?Mlh5VWNXczZOSUZqM3IrZzhDMVF1UTRXOXlCTFBGY1hQZkxwR3dOdklYMEtR?=
 =?utf-8?B?UGoxWTM2UWtZSmE4NXh1aWNjd1JYeTIrL0VaZHU2OHlRM0JXYjMyekN6cHhG?=
 =?utf-8?B?eUlMYkhnc3VNa2NWWGZIQVdPUVI0NGhkeThaK2xjT0o2dUFJTjZxaThXME4v?=
 =?utf-8?B?cmNXaGRhdUhaQ2JqS1FFOTAvbG9scDR5ODZpK21kUlNPcXMydVVFOUJaUkpR?=
 =?utf-8?B?MFRHZzZ4aEVYSDRWSEZ4b2ZiSExNbFVsZWZVdHFadlZGS3pBTlVwdFhybXBX?=
 =?utf-8?B?TWZtSFZVNHdzYklpejRHWUtwSHBYOTJNTVZhcWRmUXNZa1VBNitRZStVd0w4?=
 =?utf-8?B?cjhTZS9jK0pBU29hUWNxb1RKd1ZwMit2eFAyVnVuSzlwOFQ0QU1FY2pRRDlt?=
 =?utf-8?B?eTVtcHh5alZKYUlxWTQwcksyQTY5MFpDdmUwd1RIb0hFQXdvblZtNjROMUF1?=
 =?utf-8?B?ZGpmeUwvQ2lkeE5NRkVVT0MxMEVLOW4rOTBFUWNzVHZ6U0hJbGdTQXpFSith?=
 =?utf-8?B?TUpNazFoMVhGNUZmMUhITHU3bEZnN0R3TXY0RkgyN1k1Sm9TdVRYU0ZaQnE1?=
 =?utf-8?B?V0EyUHdSQmhka1E0SmZ2YlFCTUFqdDcwajhQcWVRZGxIWHNoQjJ3SjdEVmZ3?=
 =?utf-8?B?YVB0RUN6N0sxYVpzMEdvZU5sK3ZEK25vdDJ4dVFqS1hHUytpTHdVcjNCZ0pX?=
 =?utf-8?B?VDdNK0JnTEF6eW92QlFzblREMHFxRGpnS1BaL0s5WXdXUUZRajl5RVNaY01M?=
 =?utf-8?B?NzUyUW1VNFdiSTQrTlZlRS9UbVFQbkM0bUM0ZmRxU21LZkl5eWthOVQ4aTNz?=
 =?utf-8?B?REowVnd5NDhkMUgzNHExd2hlWGFJNmxKdnhHcXlGbHZnYXhSUEt2b2p5ejRX?=
 =?utf-8?B?bnUzVzBPM1Y3RnFiZWpaaDJxd3ZYV0tOUStwak1XSlRCUmEyOXRlY0hHakpR?=
 =?utf-8?B?Zm51dHpyT0FOV2VwR2huVjJ3UE82bVViMk1CeEJteFZuMXA3eWpHbXluVGpR?=
 =?utf-8?B?UE93Y3FWN0NEQ0lCR25OUmo3SjZoN1Y0RzVmY1k4Y2hPUGd5cTN4R2VzMmxX?=
 =?utf-8?B?QWl1Y3lwVTdVQVMwK3c5NnZQQ3B6T0x3SzViZldnTHRvODg5WVlmTlF5RUN4?=
 =?utf-8?Q?tyOKNOrSQI4hV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXlKRGlYa2VhYXEwMzlRcEQvek9kWUE4R3hnMktla1NCbmprR2dGWWFOazVx?=
 =?utf-8?B?bHpUdzNzV1hHeSs4N2lQNTlRdUxtVHdrYVdocDhVWWpFZGNweUZVRE1QYXBX?=
 =?utf-8?B?b09nMkRIdzA0NnBjaDBSbnd5WDlJaUljTjZVVFRyWFZMUG5uOVBBYXdZTnVq?=
 =?utf-8?B?MStVMXp1WkhaUjRLUmIvSEU2R0JVSHFRNkR3UXlYRXo5S0hDcnRhdk5tTTNz?=
 =?utf-8?B?UFhkek1sQzhsY0lrWUZ3QUtLdkZPQ081UTF5dlRUV2wvalBFZktqWWFWLy9L?=
 =?utf-8?B?Vzh3bEl5azBwT2Rxc3FhWTFLZVl5d3ROeU9BSEdJUWgxQUcyRjRSWjhXN2VH?=
 =?utf-8?B?VzlreXIzblVwWG9Yci9JbEJoS1d0aDAxS3hyMHJzbjdTcjBkNmYrL0RDVTM3?=
 =?utf-8?B?MHNqNERTSmtBaC9kOEpOLzFvcUQ2TVFUZlVHTC9JWjFyTTliUjRCSkNXcGRl?=
 =?utf-8?B?OWNPLzNSM1JPdkFvNHhUZU5ZTU05aVZLbzE4anVMVFZ4ZnVPalAya1h6R213?=
 =?utf-8?B?cXBCODNtY1dWRVdKaFFCV2JMN1FFeXprVjZJU2VuOUs0V2ZCWlhUa2EyR2Qr?=
 =?utf-8?B?RWZkYlF2OGxDbEpUV3ZJeEpLVUdvM3h5OEViblBMQ0tBN3k4ZW01b2Y4dWVv?=
 =?utf-8?B?VFRxZ2VQbG0wQ2dCSzdlbGFkMzdmQ015bXBxWFZIS3lTVDVBYzlHdEw4RG84?=
 =?utf-8?B?RVNGZ0pYUC96Y1FUMEo4d3hvNXdvOXp1RlN5Ym5jVFA0bVhHT0hDdGJMa3JT?=
 =?utf-8?B?YmNUZkVia2Njemc3aWh3QUpVUWRHbVh2M3NJaVo2UExqcFFoZHh6RWo0ekNS?=
 =?utf-8?B?QndTTGhjNWw2SXJhUDEzRUE1Q0NsMjhDUk4vdjFQaVNzRXQrck9WVGw2Wmo4?=
 =?utf-8?B?U1lhTFd2NGZaYzNqNExKaks2UFpjWW8vaXliU2xIVWU0OGpDM2J2R1Jhanlv?=
 =?utf-8?B?WXVqL3IwRWgyZy94OW9EVWsyQXhwR0pZMm1CTEFSYnNJazdsMlpqZmx6Tmh4?=
 =?utf-8?B?eHdxZ09kQ2RXOTA1aGhvOWpSVDA0YjBkZ1pKTlpiTGVvMWM3Q05WeThCNHp2?=
 =?utf-8?B?R1FId2FxZ3A5NTNPRFNBM2w4emRLQmZDWXlMSkljRTIwZzlXT1NmMFRpbVlU?=
 =?utf-8?B?WFFIckxKcktqMm9QaWtwVHhZMmFueTE3bXJZNFFqdzF4YmJrdm5HM2lkWlZQ?=
 =?utf-8?B?UDJ2Q3c5dWJOeXBhcWFwYWxOSHc5TXlnY1VrdVNnWVZuK1lYUmMrQ0YzVkNP?=
 =?utf-8?B?c2hEZzN2eURRQURoOWxOdytwUGtCNTQyRHUvTzQzdFU1WWc0eDQ4bkFaM2N5?=
 =?utf-8?B?V0laVzB5eE5JNWttY0Q5d2ZpQ0tLNGZtY1J3Vmdtc0lHaHpTRS9UVXpmK2dL?=
 =?utf-8?B?L3NhNDNmaEVIV213eUdEWFR5ZXdyckgrNnlKc0J0TkZxSkd6VDlITnc4YVhl?=
 =?utf-8?B?VW5uS25MSjdZVEdBOVp3a2ZSQWM4N0UrMS9zUHhTcURGU1g2R3duRGxFUmRH?=
 =?utf-8?B?WTZBeVk0UnJ1MnhwUVpmb1JBVW82cUQrSzRVSmh1dmRNRVgyN2Q1YzI4QWRR?=
 =?utf-8?B?QjA0dmQxSHlUczMxN01LdmRLcWsvSitTOG5IdjlwdUo0N0VvZ0IvTkhXMnFZ?=
 =?utf-8?B?UGk1cHVtaWk3TVM1YityYUVLUlF2L1p4TmNMV0RGbDJ4YzdleStZL1VLTFZy?=
 =?utf-8?B?M0NJMldXVzlUOTErYXlsdEtSQ1dPeGF6Z0dMWUZvODAwb09MRTd2Sy94ODhh?=
 =?utf-8?B?S1llSmtFVTJ6Zyt0ejhCcjB0SU05M2l4VHZnR1VoMDErTzJ2K1VWbWp5NGw0?=
 =?utf-8?B?a0dLUzFHZjNkOVRmeHo1RXEzT2UzRG5SMG4xNTJTdjZVNmFNN3VXa3BVNkc5?=
 =?utf-8?B?YytLcU5hOHhEdXRWTlFnN0RKS09mWUpNYW9RN05ZSEREa3NLMW1QdTRaUzMv?=
 =?utf-8?B?ZUpLOThuNzd6N0RiVnVCTldsTThtZFFrOVdtOHh5V0lKQjBobUxlRU90aGZQ?=
 =?utf-8?B?ZXpIemF1dkVhT3l1djZFT2lwWWljMlpuRWJNaFAvSXhFbDFjd0FhTWJyWlli?=
 =?utf-8?B?YWxLN2VZQVRYZHNrSy9CK2JqNVNhU1hzNHlqcm5mK2NRQU8wOVlza3N3VzZN?=
 =?utf-8?Q?R6QPN75zMs/D+WXRD4Uixt0XF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1286854f-4b22-487b-bb1e-08dd72c83ead
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 15:57:32.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hn/Fj5IHREcWHFMsikoFs/NUPzNJBJ94NOdP4bGWUK/7d2xWymDalMZ94j/xkL/8z8DpMnVsT4FlKbZBEZjWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811

On 4/2/2025 8:48 PM, Armin Wolf wrote:
> Am 31.03.25 um 19:49 schrieb Mario Limonciello:
> 
>> On 3/21/2025 5:25 PM, Mario Limonciello wrote:
>>>
>>>
>>> On 3/21/25 16:16, Armin Wolf wrote:
>>>> Am 21.03.25 um 20:30 schrieb Mario Limonciello:
>>>>
>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>
>>>>> In practice userspace software doesn't react to KEY_SCREENLOCK by
>>>>> default.  So any time that the PMF policies would suggest to lock
>>>>> the screen (for example from an HPD sensor event) userspace isn't
>>>>> configured to do it properly.
>>>>>
>>>>> However userspace is configured for meta + L as this is the default
>>>>> in the ecosystem. Adjust the PMF driver to send meta + L.
>>>>
>>>> Hi,
>>>>
>>>> KEY_SCREENLOCK is used by other drivers too, so it would make sense
>>>> to instead add support for KEY_SCREENLOCK to the userspace software
>>>> instead of having this workaround inside the driver.
>>>
>>> Right; that's actually that's the first thing I looked at when I came
>>> to this issue.
>>>
>>> I had "expected" GNOME for example to work with KEY_SCREENLOCK, but
>>> even when you program it to do so it doesn't work.
>>>
>>> https://gitlab.gnome.org/GNOME/mutter/-/issues/3990
>>>
>>> The ecosystem has moved to META + L.  My last employer (Dell) I
>>> remember there was a FN + F key that would issue a screen lock. It
>>> had a silkscreen of a lock symbol.
>>> How did it work?  Not KEY_SCREENLOCK - it emulated META + L.
>>>
>>> This is what works in Windows, GNOME and KDE.  So I am of the opinion
>>> that KEY_SCREENLOCK is likely a dinosaur that doesn't really exist
>>> anymore.
>>>
>>
>> FWIW, I found an aftermarket keyboard (Logitech Ergo K860 [1]) that
>> has a "lock" key.
>>
>> It also emits a KEY_LEFTMETA combination when this key is pressed and
>> works by default in GNOME as well with no changes.
>>
>> -event11  DEVICE_ADDED            Logitech ERGO K860 seat0 default
>> group7  cap:kp left scroll-nat scroll-button
>>
>> -event11  KEYBOARD_KEY            +4.191s       KEY_LEFTMETA (125)
>> pressed
>>  event11  KEYBOARD_KEY            +4.231s       *** (-1) pressed
>>  event11  KEYBOARD_KEY            +4.374s       *** (-1) released
>>  event11  KEYBOARD_KEY            +4.412s       KEY_LEFTMETA (125)
>> released
>>
>> [1] https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-009166
>>
> Interesting, i CCed the input maintainer so that he can decide whether 
> to keep KEY_SCREENLOCK or replace it
> with meta + L. Maybe the input subsystem could provide a generic meta + 
> L emulation for KEY_SCREENLOCK?
> 
> Thanks,
> Armin Wolf

Are you proposing input subsystem to provide a helper something like this?

/**
  * report_lock_sequence - Report key combination to lock the screen
  * @dev: input device
  *
  * Key combination used in the PC industry since Windows 7 for locking 
display
  * is META + L. This is also used in GNOME and KDE by default.
  * See 
https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec
  */
static void report_lock_sequence(struct input_dev *dev)
{
	input_report_key(dev, KEY_LEFTMETA, 1);
	input_report_key(dev, KEY_L, 1);
	input_sync(dev);
	input_report_key(dev, KEY_L, 0);
	input_sync(dev);
	input_report_key(dev, KEY_LEFTMETA, 0);
	input_sync(dev);
}

Then PMF could just call that helper when it wants to do the sequence 
(and likewise any other driver can as well).

> 
>>>>
>>>> Also please add a comment explaining what meta + L is supposed to
>>>> achieve.
>>>>
>>>
>>> Sure if we can align on doing this I will spin a V2 with a comment
>>> better explaining the situation.
>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>   drivers/platform/x86/amd/pmf/tee-if.c | 11 +++++++++--
>>>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/
>>>>> platform/ x86/amd/pmf/tee-if.c
>>>>> index 8c88769ea1d87..2c00f2baeec7b 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> @@ -151,7 +151,13 @@ static void amd_pmf_apply_policies(struct
>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>                   amd_pmf_update_uevents(dev, KEY_SUSPEND);
>>>>>                   break;
>>>>>               case 2:
>>>>> -                amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
>>>>> +                input_report_key(dev->pmf_idev, KEY_LEFTMETA, 1);
>>>>> +                input_report_key(dev->pmf_idev, KEY_L, 1);
>>>>> +                input_sync(dev->pmf_idev);
>>>>> +                input_report_key(dev->pmf_idev, KEY_L, 0);
>>>>> +                input_sync(dev->pmf_idev);
>>>>> +                input_report_key(dev->pmf_idev, KEY_LEFTMETA, 0);
>>>>> +                input_sync(dev->pmf_idev);
>>>>>                   break;
>>>>>               default:
>>>>>                   dev_err(dev->dev, "Invalid PMF policy system
>>>>> state: %d\n", val);
>>>>> @@ -422,8 +428,9 @@ static int amd_pmf_register_input_device(struct
>>>>> amd_pmf_dev *dev)
>>>>>       dev->pmf_idev->phys = "amd-pmf/input0";
>>>>>
>>>>>       input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
>>>>> -    input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
>>>>>       input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
>>>>> +    input_set_capability(dev->pmf_idev, EV_KEY, KEY_L);
>>>>> +    input_set_capability(dev->pmf_idev, EV_KEY, KEY_LEFTMETA);
>>>>>
>>>>>       err = input_register_device(dev->pmf_idev);
>>>>>       if (err) {
>>>
>>
>>



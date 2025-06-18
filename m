Return-Path: <linux-input+bounces-12950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A87FADF354
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 19:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BD9C189E130
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 17:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB821A257D;
	Wed, 18 Jun 2025 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C5enBxuk"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C22FEE29
	for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266116; cv=fail; b=Yh6PGQ/h7QWXTLHE3e6P1byIzT7A1dWPMIGeSAQACN6Yrd52C3CBDfFamQsxJJA3C76BYsBJ3O0yRF7YlH+USuFYtTbSjcq1A0I7LrpseZBxlrQZExaxnDDLDtPu1ti53Tfx9vy6Hm19ETW+Z68Qth9eRmwW4ZbV5USzpROP7n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266116; c=relaxed/simple;
	bh=yEnACsqES7i0jrdMz1cap7gJtQLDGJDPDLDG+TW529E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UburIG4mAbZ3SLGVIdjZhZ5NqmqtGRiHYHkFU3sdCSDGcJTlolyeGHAChWI5ayzNGWcXXsAImOdw2tsrpgdkGoy00vYPGFxtP2WhudoZ+KSdm8GIWB1wFo8tzu+EKDRH7DLIJfb/YW1szwXKcHoS6PqTXVjDftF/lqS9yLnKSCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C5enBxuk; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFxJ6J29Nj5Fko8k5Pw5hU3RybwE7G0GfCbACqlMEtS1ZR+YpdtL6KELc8xtSSacsaQkTIFv8U8spl7/B6uDcUlpqZtrIlZM2ZBHVPq3TN5uOQfj0OSR0Dzaiwaf7eJnoT0ErQb5085cOwK5oJlDUXZjc74JkR+ajV//Mf3V4+Ob86jYCT+WuyS3NafK3zrbLUQDwRrJ6ssnYEhUWUsPhGpCI3+1ucYQfxQJOI5VJABy5aGizhBalUPTFIdAhy9Y5CzNk8EQbFiK5934kzCjuBl37AKKQJqw0k+GKcNVSykIOZb7gc13EthlcyQ5Cuax4H2XgZw3LVVVShCAhCNWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGkE+ZvODf3OhhJv1fIEfyENdw7FYqSI9+KCpbd6Wjc=;
 b=Wt8RLFzcAVkyrTl4g9BSOigc+rl9MAUCpUKq7M68k+n1XhDkfcUpbJN8ln1NSrBP2wMwMp5HHJhvcNT3qG1s+MNzJNvzFO4+lXPJATxX0nlBSCjyM8+krexniBfueYRbTKUi3//BvoaEPiQ8M2CtkYXy01/DiRw1JadBEn9UWR/gRWyaONWfgCulTFMa4MhgaY8aI9/B1cuGiJlZ6uipyJWtRHQm/Calz+0WDYsJTythQK8s/YgCkrmn0NnCCbqfEUpjYaeGVedDS8JLkwmNaUBGOZNCnsC4jkaoRQrzd96hKgeBG69kVYsXENNTJgz3p5EXbeE2HOrBhulzjFHAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGkE+ZvODf3OhhJv1fIEfyENdw7FYqSI9+KCpbd6Wjc=;
 b=C5enBxukA8r0cmAmW61QAcSamwfhG8ItBrfhLceM848I+JdBqivi22pgd8Ao4UYVJJIWpLBzuiWpffy8A7N2qz0wEIy+wRE4+1qhdInRaREjWnrIfsJI5U9p76zuSZRMHt76tnRcg8L+Qocz7xH6zplcNFi57ocaWvKmXJvaLLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 18 Jun
 2025 17:01:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 17:01:51 +0000
Message-ID: <1755c6be-d293-446d-a6a4-22237714dc38@amd.com>
Date: Wed, 18 Jun 2025 12:01:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Enable operating mode
To: Eric Naim <dnaim@cachyos.org>,
 "MukundShetty, Akshata" <Akshata.MukundShetty@amd.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 Denis Benato <benato.denis96@gmail.com>, "jikos@kernel.org"
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
References: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
 <d63d94db-e257-4419-afeb-a661e833aa81@amd.com>
 <75105471-8f60-41ef-bd51-c7c4ea255664@amd.com>
 <5da550c2-b0d6-4114-baa2-c66070092b28@cachyos.org>
 <57eb65bc-f710-4c86-ad0e-7473cc6db135@amd.com>
 <f7be3381-6d92-40a3-b34f-90afd69a7881@cachyos.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f7be3381-6d92-40a3-b34f-90afd69a7881@cachyos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0120.namprd05.prod.outlook.com
 (2603:10b6:803:42::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a0860c-1058-4c23-b5d2-08ddae89d1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elRxdDMwMkJ3aUk2N3J6Nm5pcTNING9FbjdVb1VZTVJnWDlvV0xPZ1VPWTZB?=
 =?utf-8?B?RmdBNW5SSkRWenVyanNzUGJTSGdBa3lta2s4UFUrS1gzUU1Ga1M5UThKN3Qz?=
 =?utf-8?B?VWJBSmVoeVdoMTg2YU1KQXlxR0U2bFBZbnVYcG91OStQeXoyU3gxYkZyU0R3?=
 =?utf-8?B?RzhYWU83V1lKV05wVDNQc3NPVWx5SWM0WkhrUS9jNlJDdUFuVXBFbkYvcDFP?=
 =?utf-8?B?RFRFMTBVTkFpSjREdldFcStJb3h3dFN4b2lCc3gvYmZkc3YrNEsybjJvUVh2?=
 =?utf-8?B?UGNNR28yQnBNNDZqWlh0eTVaZzFoNnlwNGJMbTIxWitKTzAzWWxEVyt3YTZh?=
 =?utf-8?B?cy9UVW5PUWNCTEM4U0tXMXNqK2dzVW5hTEJTOUpwQy9wbkxTUzRzd2hodm1q?=
 =?utf-8?B?ZHhxK0ZxdytEbnd0QktZZkJiVTFxZWRXUXdLWHVkOU04STFSblF6YUpuSkZ0?=
 =?utf-8?B?dDArbnhoandWOEk2akcvOG5iZ0ZtOFpwb1lkQUR6TnNjLzloZXdyUGNtbzls?=
 =?utf-8?B?VVJUbzRHMTZlVS93RHFBRmtYN2F0SmZqT20vN1B5d1FQUzUzd2NYaUpncFRW?=
 =?utf-8?B?cGdJNVl2a3BDQVZvR0tSU0psUGtxWVVUUmxWWVBWN2hQOU9CTHJBZlh5Zlcv?=
 =?utf-8?B?VksxSUFJZE4xdlFRZFpOaWFLMnBxbXhFSkQ5dDZCNmhQQVVJdVJHTFE3aVJj?=
 =?utf-8?B?bTE2YTdsTGNYZ2dCeTZrTDh2aUVJWFltUFNOQjVQMmF1cE14R29JUFVRRTVl?=
 =?utf-8?B?RTNXdUdPZHJQWjJWaGZST25BZllmQ3lnM1RjL0NCdENuV2pmTWJZRW5EM3Fy?=
 =?utf-8?B?QkdLSUdxK0ZBaHFHSy9YWDM2YzgzN0RwbFZlWDQya251TkhMZVpXZkoyVGV3?=
 =?utf-8?B?TW5XaHVsSjBkWTdEeFNhTEdXTFl3V09vZ3hrclQ5Vkd4R2JiV096bVAxNElx?=
 =?utf-8?B?Wnp4MjBJejJobmg5Q1M1ODBETG9qaThYYUhpYTRwN0ZkbmdtSTVGVTFSenVh?=
 =?utf-8?B?TXF2b3dFSExwQXFodEM0bzViWU5uRWlTZXlZSm41eThlQlR5NVpUQys2WUlV?=
 =?utf-8?B?blVJTGxlWEN0WkZDaTJsWEo4U3BubUNTNFhYRVpYcEQ0bGhUQkFCODc1SkNw?=
 =?utf-8?B?YlR6cG5FcEFlZzNId2VMWmxuL0xmNU1XQzhGTis3VFNSZ1FES1RLRVlrY3Vy?=
 =?utf-8?B?blVONTFDdWZXSFBvK0tPbUtYMFBiWVZScFNETHMvdDJhcS9BU1BCK3ZHSU1q?=
 =?utf-8?B?bU1oc0FYV1NUY0JHc04rQlg4K2w4QVhPc0xVL05rRkdLMmx1eE1qakZIdnRN?=
 =?utf-8?B?MzZaeTFHR3ArS1dGWmNrbWRHeXlSWmRFdFM4SStvczNPNzNBWTIvQXRZNFdS?=
 =?utf-8?B?c29MblpBRU53bUxUNGo0bVNhN3RrekxpM2VFYVV6YjVNZHN0b3lPcjd3b1Y5?=
 =?utf-8?B?dzd1dDJBb3lTMFIxQTdKL3JabVJLQmt1YmNyWEgrRjkrOHJCUm9XaXlGRUMw?=
 =?utf-8?B?ejZ0RDdldnphRzJSaXZBSDhZRFBINzJjaXdBUitidjhxNmZHbmVSS3NlQi9R?=
 =?utf-8?B?L0R0N3JUTzhvaWlmdmhpOFNGSXpTMUtKNFVjOUp1cnc3SEw5SG1MdjJWNmFR?=
 =?utf-8?B?aDZmSkwzMVZZbEdkYVdNRmRLMEIwNGxWYm9iMS9BaS8wRUg1UXNUZ2pqdUlz?=
 =?utf-8?B?Vk1YMnhRT2loM1MwU09iYTVFb2lVMFFzZmtrNmVlQ2VycmJGdUVUbEV0TzJY?=
 =?utf-8?B?ckJ1L3FLelowUFpDVEJnVTc2d2I5Y1dwbXY2QUhWSGh4dUZSell4Q0ZYK0Zz?=
 =?utf-8?B?Z3k1Yk5hVW03bVExYk13ZWNxaGo1Q3ltbjA5bjB1K2ptd09kRk1GbUsxSjha?=
 =?utf-8?B?bU9ucjh3VXhKQURaanNpTU40ejVXTWpWREp3ZzRZazl6eDZXSXlkMFc4eHpw?=
 =?utf-8?Q?8XosVGfnhY8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anZEaCtERTNneldqUVhVS2ZDcDVKL1dKaXR0VU83Zmo1UHRaYitnZXVZdisr?=
 =?utf-8?B?MVB1aGpNbGRRbjBUMzFwMiswOC9EYTMrUlhxU041Ny9hNTZJcVJPTlNPSVhq?=
 =?utf-8?B?TW9UKzkzRGp3a1NmQmdYU29rNVdQZHZqaVBOOXk3YmdxeElQQWlEa1JGd05M?=
 =?utf-8?B?c2RLUWQ5WFZoMC9MRldWQ0pDZGdHbVNGanlCbDBhMDFxMTBPSXhnRldUWDRW?=
 =?utf-8?B?OWdOdXVMQVFodXpKQThVZjVSdmVBWW5WdGdiSUZOZ1oyRUFkdUJEeVpjZGtx?=
 =?utf-8?B?Qzg0azB6aStUNEpKVEU5VFg1MmZxdkx4T05Gc2EyTFJ5dEFnczc2SDFDTlBi?=
 =?utf-8?B?cDdCVjRSZnNySDk4eXlJSmNoSEpRRy9mKzlQYVZxaVlWZWRkT3E3VVVGQWdh?=
 =?utf-8?B?OFR6RGNsZzBaYU9PU2pIZjdHL25hUUpxQ3ByYTYwcnFxc1p4b3pQOWcxNTJS?=
 =?utf-8?B?TjFYWmpHRWVOWmNKRHFFWE9SWDdYTHp3SXVObzB6c1JOemtaMkxuLzZaQWdZ?=
 =?utf-8?B?c1ZxRkRQaEFqUFZkNCszdmRUQVRYSmNMa2x2OUJSVmx0K29SS1pYQkVlR1Vi?=
 =?utf-8?B?dVZDNnBoU2g0anFWaEo2c0FpdkZjU0l6cFdyLzE2eWx1VzZDZndtOVpqTk9r?=
 =?utf-8?B?OVRRRzNkUjJqam04Sm91U21GbWg0R1doMXN0SUdwMVR5eVJtamtpbWdzdUlV?=
 =?utf-8?B?OHo1WVhhVG9jdUczL2VwKzdXQ0k5Y3VaWjU3a1hKTWlNYWkvenJNUC9yWTIr?=
 =?utf-8?B?MFZncVBlZ295RG5wM0tFWTU4Zk0xTDUvaUhXMWdvOSsrQzNVTGlyck5ESXpS?=
 =?utf-8?B?V3F1ZWZFNzNwdExLOEhoVktMajVNWjRha1UvR2NNWVFMV0lzWTFBMDBXQUIw?=
 =?utf-8?B?bzdmdE95VE5XeU4rU0tUUUZwU0NYd3l5eGJjMldBYmt6STlVOUcrdmpucmk1?=
 =?utf-8?B?RkhlM0RZRHo3NXVWenNLcUdCR0pOeWJpTEVlS2txWDl3OXM2MmRrOGFOWEVW?=
 =?utf-8?B?THQxOTJCRDkydHNmWTV0Zml0cS8wT1ZTb002eGZUL3JxYmVKUVVGQnAycUk1?=
 =?utf-8?B?R0I1cktDa3N3MlZVbUxMNk9mQXMxa1YrZ0F4V3QyU1pYQmo5emVZaW0yVXZD?=
 =?utf-8?B?VkpZK1JtemFObnNUdEIyaGdFYXR6c0o1MmM2Y0liK213dFM2dWdwMEpXQjVE?=
 =?utf-8?B?MUJkeWROa1I4b25iSTk0V0NFbkk1SmZPY2xJaGNXazhURVV3NGk4VktYRmdw?=
 =?utf-8?B?UHhNc3hQZC9hY2JhTE9JYlVIaEYzVVZrWXJNWEdUYkdDQisxZ2hIeFFjOU11?=
 =?utf-8?B?dTM3YUNXS3Jwbjl1YVNRdkhRTXByeWlTNFFrY1h1U3dTTVlHQ1UzSUptbG1o?=
 =?utf-8?B?bUJzQ2Z1WWNSays2UDFyR2ZIeFlyR3Fsd0ViakFJV241MGtlanFEaDY2NEw3?=
 =?utf-8?B?OGZPdTZSSk1CZ1VxdWp4VE8vTTlQdGtwYkVjdlBnYmJwMnR3c3h2TTFNcGk2?=
 =?utf-8?B?VE5tOHNqM1Q5cGswZlNNcWZqMDYwaEV2RWg2ZmdzL0JqTGplTE5nTUsyNEdD?=
 =?utf-8?B?ZnpUa1N1ZVlTWUpzWWVtNUhUT09KdWhqMEllS3o0YnJpU2RQejAxa21iZVpL?=
 =?utf-8?B?K0ZvbnZydUlkN3B5QlVDaGh1a1RmSE01cUNwZy85VitKY2l3MEloNkxhRWdL?=
 =?utf-8?B?YkJYMFFvREtQenJkTlNxaTJyeUtVQTJ2U3VzaFVqWlBkZGVjZTF2Y2hqVlRL?=
 =?utf-8?B?VzJGazVaTHF5ajdMZVNOK3VSZWUweTNTMjBWd2lrUnQ1YWxLaGFXU3NwSzVh?=
 =?utf-8?B?MW1MM0x3SThId3dIYXlpRjVyVC81Z0hzODlsQjJzL1E3VlF5WFhFOURkNlM4?=
 =?utf-8?B?QzhHQkd4a0pFcVJ0S3RNVUJOVGx1MkhpUmpibm9BcTlNSkZiWWZuMHlSVDZo?=
 =?utf-8?B?WVRCQTU1SGJqTmtYdmtHTUpHY0VoLytOMTJObmlJRXZ2ZHpBV2xqTm9raDdF?=
 =?utf-8?B?U1lVSU1HNHVWcDNtaXdNL1JPeHE5RlZFdXpyZktxeHl4b29kd0hmY1RuS3Vi?=
 =?utf-8?B?djU0cjlhMTZGWERwWVlvNnlGSzBzd2w2ckdDaWNLbU8vU0F0NENoRm80cm9Q?=
 =?utf-8?Q?AD+3zv4s6rB4eaU1dpQJ/Q+Cm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a0860c-1058-4c23-b5d2-08ddae89d1df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 17:01:51.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wV5/5riNoG/1NaW75U1n2+L5lB/8frSGmTCzFMicZvo4fO2wWWPArL9tAD4FOyRcY3OtgQXoaVQ0UjWH1Ro1Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041

On 6/18/2025 12:00 PM, Eric Naim wrote:
> On 6/17/25 03:46, Limonciello, Mario wrote:
>> On 6/14/25 1:51 AM, Eric Naim wrote:
>>> On 6/13/25 21:46, Mario Limonciello wrote:
>>>> On 6/9/2025 3:21 PM, Mario Limonciello wrote:
>>>>> +Denis
>>>>>
>>>>> On 5/27/2025 4:10 AM, Basavaraj Natikar wrote:
>>>>>> Add changes to enable operating modes in the driver to allow the FW to
>>>>>> activate and retrieve data from relevant sensors. This enables the FW to
>>>>>> take necessary actions based on the operating modes.
>>>>>>
>>>>>> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>>>> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>>>
>>>>> Comparing this to the series that was submitted by Denis [1] I notice that the main tangible difference is that this isn't exported into the HID descriptor.  So how does userspace know the current operating mode with this patch?
>>>>>
>>>>> Link: https://lore.kernel.org/linux-input/20250309194934.1759953-2- benato.denis96@gmail.com/ [1]
>>>>
>>>> Recently a bug report came in: https://bugzilla.kernel.org/show_bug.cgi?id=220224
>>>>
>>>> It was very weird because it advertised a tablet mode switch which I believe comes from the patch that I linked being added to a downstream kernel.  So there appears to be problems with the descriptor from that patch.
>>>>
>>>> Considering this, I think what you're doing is fine for now; appears firmware is notified on tablet mode.
>>>
>>> Unfortunately this version of the patch is also causing problems for the user above. Attached is their journal log with the kernel traces. See [1] for the GitHub issue.
>>>
>>
>> I looked through the patch and I have a theory on the problem.  Is the
>> issue that MAX_HID_DEVICES wasn't incremented?
>>
>> Because previously there was only "6" kinda before and now this is a 7th.
>>
>> This incremental diff would fix it if so.
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>> b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>> index 1c91be8daeddf..7452b03029538 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>> @@ -11,7 +11,7 @@
>>    #ifndef AMDSFH_HID_H
>>    #define AMDSFH_HID_H
>>
>> -#define MAX_HID_DEVICES                6
>> +#define MAX_HID_DEVICES                7
>>    #define AMD_SFH_HID_VENDOR     0x1022
>>    #define AMD_SFH_HID_PRODUCT    0x0001
>>
> 
> Hi Mario,
> 
> This patch seems to work on top of patch in the main post here. Any other steps to proceed?
> 

Eric,

That's great news!

I think Akshata just needs to spin a second version of the patch 
squashing it in.

Thanks,


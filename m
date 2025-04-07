Return-Path: <linux-input+bounces-11567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEAEA7E4B2
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 17:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6CAA1899E59
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE6D1FFC42;
	Mon,  7 Apr 2025 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N3lXg1ZA"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE91FBEB3
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039838; cv=fail; b=nC5yBz+k4Dnigk6dJl1IiyrimlyMXo5dRFDxh3JoKCe4bx7WdiUmRJYstDFw+Crp+2Qjz0CHg1Y133FP8DzT50fwRMaaE2c9DSgPYKiq0aEzRfxzDIgaL4d+qeR/wtJEuMmEHKmmJNTYG2WN3/LbOS7+nzaTWhg+KjIf4WMauhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039838; c=relaxed/simple;
	bh=nCymk06A6YYqzXUo8WhkHxFP+56P70ggd6py0ICLGq4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MxU+9oQcbgQ9+VJBghLc0OrVcrFvbwtm0LL1UU33N/pBamOTwF6GNVDczm+gVHLXEk7o3DevOP/zpwVPX5YI/QgAA7Ea/QO9qpHzqZhqFN/4iu0sdnp1Zj1glrF4l/JxRilVRE5s35ilDJedTFvxSx8RFMCi3iG+68Wign/4JBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N3lXg1ZA; arc=fail smtp.client-ip=40.107.244.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFUyIzoPXBhT2Bgoj+P3LbKjROYodhSfPB5kJmcQWB4u1aXNXhDAfy0WrP5uzTBjeqOl/zpXmqtz27yj+IfK9rnp/SGBezevQdfj1W1sXfA91HAtnpLC0karGNI+zEmy6z4eKEHVmiD357+5KmEXX2DUqAm3pNzF7HUEqqnp9aKOzmmlYoBTGmKsjDIBYEXYnxKXbfbrllPv7JKTcYmr/lQqyN6TLWi+lXNw5bMuP486gVNXjNEgaobAXfzeaFC+4sx6buSsnsQzveF8575eYwxYobo9Tf5cOLhMaWnb374hKvS+VQRXwEbKBBE4eMj4w3mHK4T40ZlkhNzUc/jpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8va7iQ+iQD6LlAdpmgbFc34ngmIeI39vVk482ja1jg=;
 b=KMU3JSo3EBjqkzGV/nGq/G9cLKcf+Cfz/qMFA1BdSo7yWIU3S6zipEe9YWdpwtGXKtw0coDWkO9SMOmGIwIjPMmkdLNHwWh67q3/wnBtOS2Ic15po42BMOViNz4XAla6E7JjiXCFn2ux+f5YsYHiOhpkJK5b/JLlBm3PSsYUlfMRrOgXD558btmJtDWuGR/RNE6pA5lpMmvrV19ouEPYTdU5PeWgHpk/xFtte45YdmpYI7VplNKd8KoxzfYYVU0uFQYFz6ncXxS/s9ukLuoTxQ4eLG625/7HbgMtyq3pRGm4UYAfuFLdBg06rgLVbVC8NFq7asFmerKaNdqLYnyjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8va7iQ+iQD6LlAdpmgbFc34ngmIeI39vVk482ja1jg=;
 b=N3lXg1ZAgZLwe8n8wtn65Q/L8i1NMzCyH8h0DvtZCK0DVPaY4Ic/vhRXcf9gV1vEiVtiyfjKwhBGITpIu6En7R33ZLQzvH41M1hpSY/goJiH/6b2TQYS4ecvVR8hralH9SJz/fvGXSiVL8B9yxEFsx5C3o5h8ta4HMjfm1DVOZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 15:30:34 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 15:30:33 +0000
Message-ID: <5b435ddf-dd0a-4a50-a564-e9be3c1c9557@amd.com>
Date: Mon, 7 Apr 2025 21:00:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Fixes for SRA sensor handling
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 akshata.mukundshetty@amd.com, basavaraj.natikar@amd.com, bentiss@kernel.org,
 ilpo.jarvinen@linux.intel.com, jikos@kernel.org, Shyam-sundar.S-k@amd.com
Cc: linux-input@vger.kernel.org
References: <20250407151835.1200867-1-superm1@kernel.org>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20250407151835.1200867-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::33) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 3850dfa5-a407-40fd-e69a-08dd75e922c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2NSWUZFV0VJbUNKVGtSUE55WFVoNzJOZ3FXbXJSVnhZaUJvU1RTbUd6bVNP?=
 =?utf-8?B?bTVXSWFaSHNvazlQY2xHODJ1dldOK1pUMGhnL0dYVzMxdHphWDlxTEtPWDBM?=
 =?utf-8?B?QUk1RG02d1NEUkxka3VLQzRiV0VEWHZ6enY1REFKczR1OHBneEFFM3dBTDh6?=
 =?utf-8?B?NHFHMUMwSEUrVnpJY2lpbWp6a0V1SnRCaHdSSGxnQ3ZnZ2NxNUttRjdydE11?=
 =?utf-8?B?RVhKQmhUYVFsd2o3VzFsWWw4bHlMVTFNU2d6ZndDNTlMb0IzZG9tTk5PUm9T?=
 =?utf-8?B?UjhVc1FvK2pFV2Y4cDhpaVN5Smozc0lpTi9XaTRhak9yUkY4Qmd0VTV1Z0ZI?=
 =?utf-8?B?aDhTa0Y1ZjZBaTA3WUFQcm1XeUU0RitHTUdITTB4bmN4ZDhwbEcwcElYbFdI?=
 =?utf-8?B?TFhBdnhwU1QvUGJhYUxINFllL25GTkxmZWJXNTZBUDJVb0tyQVNYMCtVRHlU?=
 =?utf-8?B?a3c5TG00b3hUUSsyZHpKRjEzS2tEUUN2Y3N2VHYvdFJjWk81TlRsbTdBRWRN?=
 =?utf-8?B?dGxxRUtpQVBZQ1FNNkhHVUtlblJCSDd5L0x1WEU1MzdHL0owSDQxQ3VYc1Nt?=
 =?utf-8?B?SktpMU1oNUtDb1o3d2pTaHVtZzhOMFFzdzVBeGlLN1pVYmR2aHc3SGxkVVBI?=
 =?utf-8?B?SVFTdlJJc0M0RnozekVPZXZubHc1elFSbmpZRDZsdjV6RHNJd1g5Ny9RQ1lo?=
 =?utf-8?B?UkJ5SVZrMjhhc01LMDVML0hwUldlWSsyYUdTWFBET0o3YkhsLzBRdXU1MEtp?=
 =?utf-8?B?L2JGdGx6Q0FDL3ZoQTEyVkJBV2lVaFVtSzZPTmRPWHdlV0RWck5pNG1NWlMr?=
 =?utf-8?B?UkJtVm9aVWtTRkdDNnhEV2RaNnhKYVFpUHlPRVFWUUJkSlkxcEpXSTZGaTA0?=
 =?utf-8?B?bUNsNytFU3VMWlNNNEM0UHoyRFJrTXBsNDFwRDdyN05SRmtqdldCdFdtL3Jq?=
 =?utf-8?B?N2J4eEpjOEkzQjVsTThxdDl6bkUvbElSNkluaGovSnFvdW9rWW5PZFRJQmdk?=
 =?utf-8?B?eXlsaW1UUTBRLzlkMXVRSW1MMGZMV242ZmZwMUh3OElTOXZoNFFIOHR3eWdk?=
 =?utf-8?B?bC9kMTdpUnBPYTQ4d1J6MitKVTJyZnNHTE9laFA4WEU0Nmd5TklhOEdoeUVt?=
 =?utf-8?B?UkZmL0tpblBDaEdGWElGUnBUMDY3VzZNTUNzUndvOHlvZmRNYXBURXlMMUd4?=
 =?utf-8?B?MjdZcUpGc0dqYXVZQWQzbGtLS2xJbzFwTHBhMWIzNGVOMEFEeWRwckNhZDF1?=
 =?utf-8?B?M3UzbFhBbmlWY2VZdEhpNVR3TjJ2UGlyaGE1MUhQTXhuMWw3U1dzb2Jtc0xv?=
 =?utf-8?B?cUFUKzFKRUtNemVkK3dXdVFaZlJCcFd4aGVzTk1SNnFmT2ptYi96Mkh0b3Zh?=
 =?utf-8?B?elVqMGpWK1FTbGN0cUJlTnUyTEVrZm50Q2hBS1liZDFkeTFhcXovbjlLRDFv?=
 =?utf-8?B?WFVnMUVjcm9YYk1MQVBzOC9UcjlEVjVpSzN3bXE1VzAyVEhFUytBZGdndFJP?=
 =?utf-8?B?aS9tYmFVMDFPSHlWazVlRG1UeDI5VkpCSG12V1g4T2orZCtWZWVzT2gvV2d4?=
 =?utf-8?B?WGwyeWhtZEJ4WUI5NjdRNUNQSGphQlliL2RPRFRsWk5XK29KZm9sVEl0S2t2?=
 =?utf-8?B?OVlDQ214TnN3cWhMb2haOXZIQTZHRnArZ09ZQUFBZ1hmSjBKZ09rNDE3YTVS?=
 =?utf-8?B?blNhU2dwWHg0L0lsaFVobUkwSWczMTdBS1BSc3RLT0RNVEFxWUJLY0NUVWFw?=
 =?utf-8?B?YU5YSnhmL0NUVENNOFNhS3QxV25qVE9ya0VCVlJJR3piS1NzQ1VzZ3MyYkhM?=
 =?utf-8?B?TEo3ckdYNGRuYk8welpxZUxWZ01PUjB3c1cwV1k5Znd0algzN2hFM1BsSTVw?=
 =?utf-8?Q?znFaUu7t9Y22v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHNCQ3ZmNFJ3NGVJbTdEeXhka0xlZGl1YVgraytYRkVLRU1hUXBmajlZQ0tI?=
 =?utf-8?B?U2V6YnNqSjJuQlFXblp2NG5ST0FMbUY4dmpuTGs0M1dmVnZWbERCa1BDK0xn?=
 =?utf-8?B?Z0tjTFFoVk5mS05IcUpXY2dEYlprVkU5NkE3cDRZQlFqVVJ0VWFidittUkxF?=
 =?utf-8?B?N21YR0JUZjBRL3NZdEYwaDdBZjVPb3NhSFdxblpjdXFyVjZDekVmaWllUzQz?=
 =?utf-8?B?NGdpcVpEMmZtWnAzWGNqWUZFSFpqTnF6M0xSVzJ4RXRsUWk3SDJDaWdJWjUr?=
 =?utf-8?B?YVNNWnBaaXRUOXVkVmU5WnhpdGV4QkJYU3dJdHlwOXJQWG5XSm13WWl1SXZS?=
 =?utf-8?B?b2s4QTVoUzh1a3JLL3VpaWtnUXlVdVdjelc1Mng2UWZkZzRTWVFBZy85K2Nz?=
 =?utf-8?B?ZnIxVFNFZytQN2IwdUdxUVpPT2NzTU5hMTJDR0t6MlVFQkcrcFlBSDFGbXps?=
 =?utf-8?B?d3JTSkFGZTVCd3hrWU10U1ZiRkJUWUZGVlg4YjdtV0g1WkszYnhCbHNwQnhp?=
 =?utf-8?B?bVJKZUROa3pKcS9pM1dNejArZ3dvSmpSSXVnU2ZnbktJZjdpK3RIY1cyVWFp?=
 =?utf-8?B?YVFVdHN0cjZienBtRENkU1FPaGw2RFZlVGUzRWJJWGtjRVNLNThCOC9JY2VG?=
 =?utf-8?B?a2U2d2RYUHFBUGFHRFBEMFFpdWNxTmtkK2luOGdQUmErM1J0VHhwNlJwL3NX?=
 =?utf-8?B?WU5GbG5yV0cvSjZJa1h2bE8xSGhsUENhdzZKZGdNZUxpRk1hekpzSjRPb3BI?=
 =?utf-8?B?dUdRTmQ4Y3lvcG1FazluZDVTbElYRVVBQmhoWlpNM20zMm5ySzcydm5UUGFC?=
 =?utf-8?B?ek0vSm9vakdqWTNuYzJqSkRza1d5Nk1lUWdDOTRMeGx3TTBXaHZ1OC9TYWdV?=
 =?utf-8?B?UE4zeTZabVdvaVdBMFlFS2EwWiswcVE3YVRpaDRzczVOSmcyS1dTa2s4WHln?=
 =?utf-8?B?M0ZWRE13M3JpeEJUendWSHBESVVaZDliWElMdXk4ZnVJQ3pZV1dtSXYza1Iz?=
 =?utf-8?B?RDB5ak1nTjEzZUdHS1AzY2h4ZHJmT3Y4S2hVZnphWVYvVnAzbE9PR2t2b1dl?=
 =?utf-8?B?ZWRCbVdMM2V6dTRmUzFTKzBVNm1lVHpwUFBOY1FRVGVZdkw2NGNnQlZwRmph?=
 =?utf-8?B?dXBrT0w5TXJnVXc3enJPQndZazhwdmxJRnljZy9JVW1MZWlHVHBZWjNIMi95?=
 =?utf-8?B?L1JJWVNjRGc2cHBheHMrM1Qzczg3UkJKRnFUZlJCdVloTnRkV0gyNHJCZFVw?=
 =?utf-8?B?aFdGc3NHejdFMGdFMklFYVFDTEZjWWgwanhzYS8xUnZlb0pIbHNqTXV4UHFC?=
 =?utf-8?B?N1plMVVmUjJNYkNmV2FKT2g4NURGSUtwVmpQdUw0MExqYWd2emw4S3lNTGQw?=
 =?utf-8?B?N3BHTEpxdndzUUtEbmdCd2FkSzJTTGhySTQxOE9kSnVONDRBUThCdnUwSmty?=
 =?utf-8?B?Q0JFd1A4Y0ZnU0FqeFR6aGtvalZ2TmdEN3hPWE5iUjZwckcwcVNtWFh4OEhO?=
 =?utf-8?B?UkVZOXB4Mmtjc25qWXZuYVRReXhPeW9tSnVUU3hmRTBweFRRSUJRR3Yxbi9T?=
 =?utf-8?B?WjlkNUE1SGE0YzVWbldlWnZKaW1KVjJYNVAvK0NteUp0RWwwZ0wxL3VjTWdL?=
 =?utf-8?B?aDFCK0s2MGs2Z3J0WmdMb3pQeXU2QzcvZjlBK1RJWEgzV1JGbHM4NnFhYi9q?=
 =?utf-8?B?Z2lzbit0TjlETStJWU1lZTV2WG5sNGVEUGEyUTZWWC94Z1F1MWRFRS9iMGdt?=
 =?utf-8?B?NG8zU3Rza0RkNEZTZTFtSGQwdHgzeXhucGhRMTVDYmF1cVA4SEJNeFU0RDRV?=
 =?utf-8?B?a3ZxL0pQT3dkRUMzTXRjVnRaWWh4WlVmcnRJSEhjUmR3eUlZQzhLRGZscXZU?=
 =?utf-8?B?VC9LL0RRMUsweS9ueUt2UGVaeHdjZjZFd1RCNitrekc1OUw2Z056bWpZUTRa?=
 =?utf-8?B?ZElFMmVldm43cmprd1p4MHFEamkyYkdXazRuTDdyMmErTkNNblEzdDJ3N09z?=
 =?utf-8?B?VWx2eUJWVlhobG1xWHB5MFIzY1J2eTJGZ1FkcmRUV1E0SWxaZkJXYzRqZWdX?=
 =?utf-8?B?bmxwUGNCNkRpR0FxQ1lrTlMxU2d4M2ZvOGtaUVZnQk8rRStybzFsemFIQXpp?=
 =?utf-8?Q?A0Wzsr03RTBNSwz6JIymgkac/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3850dfa5-a407-40fd-e69a-08dd75e922c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:30:33.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOKrrjN+4UuOeQoNuEX6kg1dtR2VotIzOX2HwwSt1rZHEU2D2zxf1fGPtbkm+370BYXBcKokszJ6BLXEY99hFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543


On 4/7/2025 8:47 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> On systems with an SRA sensor there are some problems with both init
> and failure paths.  This series accounts for both.
>
> v3-v4:
>   * I got pinged offline with a missing cleanup case. As the patches
>     otherwise looked fine I added it to the second patch and sent it.
> Mario Limonciello (2):
>    HID: amd_sfh: Fix SRA sensor when it's the only sensor
>    HID: amd_sfh: Avoid clearing reports for SRA sensor
>
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Looks good to me.

Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Thanks,
--
Basavaraj

>



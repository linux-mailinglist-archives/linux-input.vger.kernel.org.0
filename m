Return-Path: <linux-input+bounces-8632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E45169F50F7
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 17:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3428167ECC
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 16:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCDF1F7572;
	Tue, 17 Dec 2024 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cHkExk4j"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33B1F63E8;
	Tue, 17 Dec 2024 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734452409; cv=fail; b=sA8qIffNCPXPTlHWI66RHIHFDsHb+A6GvISqOxqXJrs6IXr72N3H0Th11txZr9kWY9FkQFfMwnFmdSWOtdSNuj06QfLMPWYBqJDE1nZmSkpI6j/yUCnH4SGwtVWlQ8TqbNmjiHvemmVMjv7vUUG38ryaCVwPx2ZJ7/bdfaS7mpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734452409; c=relaxed/simple;
	bh=+bpgQMZrbXwNBYFBM0XluvNrApstLsDSpua7JCFqu+A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jXR2pPGBMOrCWAdIXWLG2apPWGQFZshuhniuwsmDGCOQDXjKg2c1jTXh7ieNEgEv4jEQ4+GjxVYItWWpXKcHZqw1Q/j8N/Ge7Qtrsybh1cxWf0XBHWd19ZFN9epUGJqLH30nyGCaTZNlrFySfDalARc5iWcLrb/70SDKZ8FzPq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cHkExk4j; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRIxK42rLCZ7ikgcFIH7fa0r73419aF2TvUExZA81JcPr035POim6vkleF8E/1kPpqnJRohQ5D3BDCGMoDCaVBY7uzy4Bk7+RrlaIX9x+haEJFBh250+Fsk+wO8CZpJuAMC9oHy9f/4/j5p3xzRTJjJ2+l+69VZliErBDUexzDG3wrtFbwSSrH+NMbtk6VhtQtSG+vfEpa9UbX6xcmxR4rgNoOUI41CWUbvfD7Y4iXc+kIj9yEOu51ybf5eugsK9E8aY53nugnTXmT0S07YPHM01prkanPM62ELAhW9VOXveM+6ygIujKi+ocK1v3dLBc1Q2dRMA9Ti54hZJ9KN5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3JL8ASyyI6To9qyGqQvG5g2W7p4Fv3TnXoZQzZYxTA=;
 b=WbdHuzRAxtyuUSGbvYrzLmarW116oKPtJSA/Ncgxrkg1nfSKDwv+4TQ3VE6dTVmHSJG5Ix5EQUUNHdTQhuiRkMXP9OWYtUtAplEGrTUUys1Oia8HXYsNvD4mReczwMItwgLyv4HhtgIwbD/p4VsgJv1tbrgxk0tZ4uBIgj/S57GkiuF+WL1wu3KevGNZ8/P0FazCvW69hwf2ywoRxfXzXjJIZ5tW3/r4GLlq7NjOmG7bZthI31pEZS+jLnwbAZalPxoHlDS7HnWmTtJBym5tZNJGSk95y0we34ZLUzgWPsPyCk96RIhb4Dmp3fuGatgbrurQEbzNJYeWORtHY+mBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3JL8ASyyI6To9qyGqQvG5g2W7p4Fv3TnXoZQzZYxTA=;
 b=cHkExk4j9QjJHiSF+CsJpmBNnAxZy8ZjxCEv1UKcmtjA+E9Fko65GLEm5Tfb1p62vB2oDbmMh4mdBWZ8DEkblhiUakilVUEt6FZ5HVQlkeG8jjhFizB+KuKyKCmWIWCPzmqPzrHc8a1DHvucGncNmzOhAF7iqaGqDwI52C4eB94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.21; Tue, 17 Dec 2024 16:20:04 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 16:20:04 +0000
Message-ID: <d7c9b038-4e3f-467e-ad6d-7db1cf728caa@amd.com>
Date: Tue, 17 Dec 2024 10:20:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add new capabilities to PMF Smart PC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::13) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a27178-853d-4d99-5997-08dd1eb6a9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm5zWG5uUUF2ZjVSRjFBMXVSNzk3eVVOVkdCL09oRzJrOTZueWMxcUhRNTlw?=
 =?utf-8?B?QVdSQ240NFFCZ3NaWU50MWJ4NnI1U1piMDZzSzk4Y1lob2VDUUN2YlUxZ3oy?=
 =?utf-8?B?U1VYanJFN0R1Z0NSSFNvTGtXR2krMTZxdG9xRUs4c2F5Y3p3RTVsT2lTMm9p?=
 =?utf-8?B?WjY2L0NoUEdJNjVkV1p0OHpQN2hSbE9rangvSSt1TGJsTnNpbERWNzBDbjBS?=
 =?utf-8?B?S3JNOFpUaWIzOVlUMFgrYVBBMGN1emo0U3pLMXNCMWl4a0xaTGRUVnJTRTFD?=
 =?utf-8?B?MmFETnRoM2YxQlJ2M0VyL0ZXbmpXdU41Z2U3Vm5sTWlGcS8zOTJpcWZudzZH?=
 =?utf-8?B?d2YzbnBBVlhscjVYRk9YU2hRQ0lCcWJ5eExEekYrNVJVQjNidkZybXA1Kzd5?=
 =?utf-8?B?dkdOUXZRYk9qaW5Uby9Od2ZPaWcxRElzVmw5RkZXdEh0enlmdWd5RzdjSlRj?=
 =?utf-8?B?YzlJYi9maVNJemxCdU95OTlXQngrdGgyaDJQRjZwSXNvQ1FJSlNBcXAwRm02?=
 =?utf-8?B?NXBEelQyVVplU0JiUXdORytnK0F1Yk5pcTlJdTJ1UjBNbjNDWXM4Q2lYc1JK?=
 =?utf-8?B?bEdBQTVIZDRvemRudzRFVHErRHk5WFREbjE4eDNmUVNVb0h5ZGZJWmxoWjFE?=
 =?utf-8?B?ZHNManZXMmNQb095RVExZmMzSTF0Q1NBT0p6dE4vOEVsUGxuVjdYdG1QVEdG?=
 =?utf-8?B?YUU0amw5OThuVEJDdlpFcTlibHIvZkNQMU4rY3YzNU5uWmNUb3ozZjdVWmdS?=
 =?utf-8?B?dDcxNS9tdWNEUW1uUXBXdU5wWDRyMmdyQlc1eXM3M2lFMXhXNGVhNmJoWUpo?=
 =?utf-8?B?RjNKcGJxRXQ0NS9scGsydU5lSXZLSmZnb0UxUTU1bVVwSnhWVVBCblZ3OWpw?=
 =?utf-8?B?SHFkSVdhNlk2ekZkZmhrTHJVdVppbXNWY1U2S2czOHdBQnR4aHhueENhZEtS?=
 =?utf-8?B?dExHZThvdFhka1F2elBjV3R3K1ovRUEzUG5uMlpkL2puYjZHMUVqYVpVeG1E?=
 =?utf-8?B?Z0pHTWpYZE43NDhXbjRtWUFWSFZCOVdocHN5N056VXRtcmJDbDh2dWJOWksr?=
 =?utf-8?B?T0IrSmVCMGJKVnBBNTJNWmFOMDk1dy82N3R5ckdZUGxTa3VTRnJoQ1dqaGtC?=
 =?utf-8?B?T1Q1clFDdFdsYWdja3p0ZW5MbjUxNlNFVk84Q2NnS0pJc1hRZ0IrYXdnekZu?=
 =?utf-8?B?S0l1dGpKVlhuQjB5TTBtVmYyc3RBbnYxekZWd0xQUGNLdHdWSU5VZWExMEhz?=
 =?utf-8?B?dFd3Y0hvVEVTeXRObXU0eWJVYW1ENXViYnVVcDFsRVYzQjRBNGJrdjVYYTRn?=
 =?utf-8?B?S1FTTnpyR3FlUUc1SzkrUUpob1dIaHF4aTZkbHpSRGliRVF1OTF0aVRqRnNE?=
 =?utf-8?B?dGoveUUxR3BDcVhSS1cwOUErS3FTOUlUcVlUZE85enhvcXlkdmJZK2RDVGxp?=
 =?utf-8?B?dGsvQzNxbFVMNnJmWlRoU29ubVBDQlZXZ3VJVU5Ia1FkMDJSM0NhZE93bVg1?=
 =?utf-8?B?UzJQbXNQcjU4aEJ3NTJJWm1HYkI3ZVg3U2ZVMU81RmlYc2t1c3hCdWNGdGdq?=
 =?utf-8?B?aDFGeDBWQzRPQXdnMjc5S204NkJBem9jQkhNc3F4NDR0Q1R6T1NSVG5KRjZR?=
 =?utf-8?B?dWYrQlhoSHhhdS9ESk8xbHlEVE9UUkVsUVY1TVFtR293WnNGY3RBUWtXOTVz?=
 =?utf-8?B?Z1ljSUdBdXFLM0VyNFJrRWNTV3ZCYjdTdHorK1drdElUb2o1aDMvMCtoRkNI?=
 =?utf-8?B?end0aGc1TktoUmRpOW82NWIyaGJybExQS1FsTU5hd1I0eFR3UkUrd1VkbC9w?=
 =?utf-8?B?aEFBNXlEZytDK043aHJuL0hUMUplbkNaOVpQZXZjVmhMWXZkdWhMcHBkdVZW?=
 =?utf-8?Q?E9jvZBq7TRyr1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QS9HSkVjKzE4czMvdGJ1ZUpyVnhjOXcxd0Y5ajR1ZXFvUjFLN2NKT0pEcHlq?=
 =?utf-8?B?K1JndGZKRVU2R1AxTG05MFBpb1VMcWZ0ZkVJV0M2elZFQ1pMNWNzbHdhYkY2?=
 =?utf-8?B?WkJhL0JhNEpGUEx2QU9vNVBkZlJMK0o2QVhTZEthbDdXSlA4Y2JpN0FzV3Ba?=
 =?utf-8?B?OWppRFZaK3d2T3Q3NnhNZmhqRVB4Uy9mQlN1Z1RSRStJbjZKYURjU0Z6WUVK?=
 =?utf-8?B?RlFMQW1zanBwU0RUa3BkZm1sTXczYWI0OUJoUWlTeTBqcW5BUDdMUFRJTnlh?=
 =?utf-8?B?WTQ2ZFAxcWY2Um9DQ201TXJiT3pSVG1CemVlR0Q5SUE1MjFsWWpmbkN0Q01V?=
 =?utf-8?B?MkxCNkdRampSaTZFQ3RJZmd2SzliOTAzWGNuN2U0a1IzTnF1NTdYSmdrb2N2?=
 =?utf-8?B?V1BvUG01Zk1TMGYxUmxtVDIyc0VMNVh6dXpoT3YxdEhIV21yN1ZxbElaNnNp?=
 =?utf-8?B?SWVrTTQvNGZsTFRlNkZ5TkUzWVcrR3VzNTJnUjZ4ZTA3cnI4cGxPd0ZlTUFF?=
 =?utf-8?B?Q1dUbGFxZVFBaW40am9YL2g5Wi9IeUJkT0YrdUVuWittUHFzOFFpbHV3L0lL?=
 =?utf-8?B?b0FMRURwL2Jldk1RYVhDcVVOQjdETmNrYUp1QlppZFVGM0tSU2hEUXZWSFd3?=
 =?utf-8?B?OVBaNUVmNEIzbHhZTzdlNnZuMTNqRngvVEJjV1JzWGJiTTc2ZjdVZ2ZpM0Zm?=
 =?utf-8?B?dTlidExxalh0YXlCaHpTTytHUHJQdDF4S0xERW5jczNVQ05EQzFyZjJ6OXFx?=
 =?utf-8?B?cXpwTCt0NmgvVysxRjdkaWxQVFhaL1BldVdkVTRjT1o2aUdFZWthdm9PdDhj?=
 =?utf-8?B?ejFRcUdmMkxFV3EwL1NITUVQMytaOTYvSWpnU2t5L3pSSHhwcDJlSmplTGQz?=
 =?utf-8?B?UFI5ekFFeitVZTZlcE9RUHJLUHdiSURXN3UyN3NaUGNOVU1aM3lJRXJKNVdl?=
 =?utf-8?B?TGpkMy9pdTZXU2VvMTllbXNDbE5FSmliZks4M2VoSllSRnpMV0JZRDZvV3Zw?=
 =?utf-8?B?SUNuK243dG96WHc1ZEhMY0ZuYktCdSs0eFdKclZhR2lJU0dvRmlkcVJ3RDVZ?=
 =?utf-8?B?bUVMZTJYYytVbGpldGo2SXlkREVwQkpoNS9WUEhLWUhCb1A5dnNqS1ZiTGRa?=
 =?utf-8?B?aHBMdlJJd2lSbGwwM2h4dldxVXdzVUt1RTBuNm54U2RLRkEzVkdVZCtOTHZX?=
 =?utf-8?B?b0lRb0VWSFdyd0txWnIyRVJtY1lCVGJOcGV4NlVlR0JoT2hXQldpajRPZ1NG?=
 =?utf-8?B?dzByQXJjaUVIRWRHdnY5SDVZWFFnR3hKejhPbDNkU0JOTUxuaVdmZkdnMEIy?=
 =?utf-8?B?Vm84V1dGVzdWODJMMVhTbHdJQ3RUTmhZU0szeVdRT1E4Nm01dDlUVHZlNDFt?=
 =?utf-8?B?ckUrTXI1VUhzU29kRnR6WGZheWZIaTErWUllalJPTFpVdURmR3lybnVwMnZR?=
 =?utf-8?B?dFhsWGZiaVVrUkZCRitMdnRlUW45S0tYMWxhekhTSjdURUdDRFVBRW16andl?=
 =?utf-8?B?d1Y2K2ViRkZ1QnE1SE9ZVWdjL3lhc3doUU9TYzhrVXVRMTdDSGZINGpwWDdL?=
 =?utf-8?B?NndONE1EZkJob2tlV1pLczM0enB4d0tFQVhFVWpZbWNIcEtBeG5JS0pWKzV2?=
 =?utf-8?B?emZaN2QyZi9xQ3VFY3lNUDVDb05vTGNiWUtobjc0WjFaOVZTT2RpczhjRnp3?=
 =?utf-8?B?YTZOdHIwUWt1MU0rc2ZsUzRCS3VhZGNWaTJhT053ZE9EeDVJMENmMjJmZTNl?=
 =?utf-8?B?WWo3SnpNU3ErdDhKT2RXaGZJUE1TSHMyTnQwQVMxTTRMejYraG1JSjJzQ2hC?=
 =?utf-8?B?QUpoYUFtcjhkVjBESU5lUUY3TS9IWUxVTW5aQ2UzMEQxTWUwUlJXZjR0cGNw?=
 =?utf-8?B?Z2FMVTlUU0t5R09XanZPRXpIdU1iTWVJcU41RlQ3OGR6ZmwrM1piQ1FmcFNN?=
 =?utf-8?B?c2hDMnNVOW1abzFoMCtodVY4NG1ldDdNUnR6TXFJYzVQTVdPbEZEVERqYWhI?=
 =?utf-8?B?R0VDVmJSbEJGSzdpV0ZlUnlGWUswc3o1aUw1SEtub1RKdmhoSEw3TVN3dW1y?=
 =?utf-8?B?U3pINTZVRVYvbUpOSXZYRU9ReW9Db0QrbWFWL2UzTGxzZFFsRHZ6c2Q1Wmkx?=
 =?utf-8?Q?DxacaC5YXX+8Q1zpbZQksdlxW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a27178-853d-4d99-5997-08dd1eb6a9d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 16:20:04.0123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyRsQfRNoYQBL9FPMrt6ROCO6sT7u0RPns6lKXPTwwC8G+KpnPyP/+QeGH3LnrV1fY1dYaRUUwrtXpq1DCmvaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

On 12/17/2024 09:16, Shyam Sundar S K wrote:
> This series introduces the following enhancements:
> 
> - Support for device operating states in the AMD SFH driver through the
> SRA sensor.
> - Functionality in the PMF driver to export SRA data from the SFH driver
> to the PMF, allowing it to be used as input for the PMF-TA in evaluating
> policy conditions that involve SRA sensor data.
> 
> v2:
> -----
> - Address cosmetic remarks from Mario
> - Remove explicit assignment to enums in SFH.
> 
> Additional notes:
> 
> 1) This series is based on Mainline(v6.13-rc3)
> 2) This series builds upon the recent commit to PMF found in
> platform-drivers-x86/review-ilpo-next
> 
> 6000bc1f5a81 ("platform/x86/amd/pmf: Enable Custom BIOS Inputs for PMF-TA")
> 
> Aside from these two points, there should be no issues when merging them.
> 
> Basavaraj Natikar (1):
>    HID: amd_sfh: Add support to export device operating states
> 
> Shyam Sundar S K (1):
>    platform/x86/amd/pmf: Get SRA sensor data from AMD SFH driver
> 
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 ++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 38 ++++++++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 24 ++++++++-
>   drivers/platform/x86/amd/pmf/pmf.h            | 18 ++++++-
>   drivers/platform/x86/amd/pmf/spc.c            | 51 +++++++++++++++++++
>   include/linux/amd-pmf-io.h                    | 15 ++++++
>   7 files changed, 166 insertions(+), 3 deletions(-)
> 

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>


Return-Path: <linux-input+bounces-10387-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D926A45627
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 08:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19FF3188EC45
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 07:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD4222DFBF;
	Wed, 26 Feb 2025 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kWQmsjjg"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483014A62A;
	Wed, 26 Feb 2025 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740553237; cv=fail; b=LBUrQ3mN0w7rJ6CND1AQvWAsHKXELxOpnTRyBzKv92oav+WAZUIBr0Nb1bs5LLhJ9q1wlKp68krOPVGj/cRlJ6dYwwyBVxOuHaxfFYBklNCOQG5cy/cp2gBvjfozPI9dW2fXCLlY7cNSzikwEvVBqLGAb3MbiciKDCa3U23F4bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740553237; c=relaxed/simple;
	bh=2b31xYgXNjlNR2R+PetEyc8/jc/rRWhe8KYSnlC+DTE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=afmzke+R0PW1xg9IZqYlSEqVWIZpjcqSwr3E6IW5KMO3X8NAjEe6kKBP3jIlBmk5NWehQa6T6hDbn2BRSlfHwlA6T9Jj+WQT0dfyBNcVAkqo8/pqwUdl2kgiYJ7+H/ZrHx6yjmIx2RgpnqnsLJHfiWCEfwr+5LXU6+Qugrt1IlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kWQmsjjg; arc=fail smtp.client-ip=40.107.100.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWjCJ1vc9H5lRyLd0Yrzrwy/hcgfm85xgvdt91MIsUalxdTLcy8s0psjg+8nt3uL924J49/37eKwG/pfxuLRU/wCxBJcKlFE7owlsya5zmqS/yt/7HxB5U4Ss2e8aaowCqGjBrAEl5M5G2glvl34CtVMBSgLD7MIVY9ne/QeGlXG79uUtkIY3VlynR+KTwg3/aOTQWfHFqRQ44smvY8QFJ81joldwokKW2xSoXP5qNDOHb8RgTx+D5Gbs6tzYcbXi4tob/Yd2ITlutcsd1GOBC3IuR5IX3Rv0OlJDRu2qRXdtXbdc6nXQyYqnpCX/mQcJDGF00f/pWqfRWihedwQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3S7WeSx+AIoNLuIVaVtllAab+O+9zeylEv2hk+E/ScU=;
 b=RYHJwvXp5h9HY83GmJ4foehGWC+eJnkw9Hi1uxPfp2Jkb++lKnE4hGNaRA2Wc8d0KoG8HUoRxuuRJKdD9FSQl2ITEYpFXmRTjSyMyq7PNnjdBug8Pu4HVMWU2IRfCPuejE0Y1opM+4nfNwmz+XwDSWze5/2xIADfELQyPEsq30+WIOSTxJUoPlmqU6lv8vOPDtG4lBetq8d4YnSGgQsPY4TjT02hpGIhhFwLTum8W9NpMkZYNhuvGUn2zJJySnjfPEhqTixHtp6zQtN5wv67vvTAVh3S72Aebunc10GMc45tPCbFjvipKYM+WIUAtSwx/cpTYjCsWM/AHfJwM0kozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S7WeSx+AIoNLuIVaVtllAab+O+9zeylEv2hk+E/ScU=;
 b=kWQmsjjgzGpi4CDJLkDQU/Fl3+HshszyFRfpwnUt7fPjm8f/ei2MlLNhT6HELy3Ybfk4wnkH6jGc0J+HXfK8eWI/SbF4wdLn75sbo/eXwjKcMfxWGcrtge8udDSSvCLnL117miDdWCUxsqBai4bGIy9gbJcNbMVUtaW2BhlRuXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 07:00:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 07:00:33 +0000
Message-ID: <64613914-1759-4008-8e56-ae220c0171fc@amd.com>
Date: Tue, 25 Feb 2025 23:00:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hid-asus: check ROG Ally MCU version and warn
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org
References: <20250226010129.32043-1-luke@ljones.dev>
 <20250226010129.32043-2-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250226010129.32043-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: bc224080-f552-47c8-c7e0-08dd56334397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVBieFNQbnNNQ080alZRQXRNeHYySGhBNjVSdzkzVnNENzNremFrWm11Q3h1?=
 =?utf-8?B?Qzl5bjdmNzYvTytJaVRMRUt6K3dkY0ZaaXFYVXd0ZnQ5OVFTQkt0SkdNRnc5?=
 =?utf-8?B?a3h1blNrK0FpaHZtbkl6ekdQWkszSGRsNmExMmtiOVJERHIyY3dqV2V1SEZH?=
 =?utf-8?B?OVh1RUVIVkliYzIzRnBxVXNHYXN5U0tDRkx3S1FCb0JXcElFbllzdE54ZjFN?=
 =?utf-8?B?VG5vNjZxaURTTVM0aW9UeTFTelJoeDh4bG5CR3pUUEF0N0hPN3p2S1Q0WkV2?=
 =?utf-8?B?Sk1XQ3gzTzc2TkIvNHhCR29uNnVRRi9wSS9HSHFMQVZFMVpSTFF0L3JZd0wr?=
 =?utf-8?B?ZG8yK2hIeE94UXgrblZseE5nbG1PbDdTcWtuWlVSRWtjV0pMRXlEcmd4MVpB?=
 =?utf-8?B?Zmd1WXBad2JybG8rUW1JL0gySkNRejJsS09JZG9ZRTdQRXpwalJUZ0FXNG1x?=
 =?utf-8?B?bEovbFpabjhPY1p5QnA0cldYWXVuVnhCSG9EdmJOMlRTTENhSnA5Y1VhSlo0?=
 =?utf-8?B?Ulhyb1lqK2tyaFYxL1NpbWY1ZVFRam9WTVJUTVhkWUswd0txMkJHZ1pIczZI?=
 =?utf-8?B?SFQwaXRmOUpneGZOS3BwbUJzMWJlZjJIY3ZkVGpaVkgwY0V4Y1FNblp1S0s2?=
 =?utf-8?B?bDNnR0lZc3EwT3NYYXNpQ3ArdU5SSEh5ZlZzbkFYZ08xMlhLYjE5RnZZb3hi?=
 =?utf-8?B?Zit4WVFYb010WjZzYjR1bDJwMFVJaW10N0pPMFUxbHp4UDdCQkM1cWZUc3hl?=
 =?utf-8?B?dm9SYzZqbHpiK1o2d2hVaVJoWXgxNGhQcWtKTk1IMDZrVG9jQS9ESzl1YThH?=
 =?utf-8?B?aHdySVFjNGhydGdNZDVKWVFhSGVXTHdSVE9QanVycVJrL0E5c0JzdzVtczJa?=
 =?utf-8?B?Y1JIZmgxdEF0TGVqV2N6OFJES1lKS3pqdTFKOG5lMVpwaGJlUlJ6cHpLd2FG?=
 =?utf-8?B?UXNNcGxTUjlVV2REc3k2T3RmZ0xleTh3UXJhRThzUkxWN3Q4VXZjVHNnM3B4?=
 =?utf-8?B?a1g3VC95aU1iNmNSaFRzZ2loTUd0di9RR3k5TzNPWkJzb3ZIWnlsTDVsUkJR?=
 =?utf-8?B?Qlg4b1ZuVXNCK0RCMG9tdE94NmttcCtlSFBDSGkyck90MHFrTDhaZDMwUUh0?=
 =?utf-8?B?c2swd28weDRuNk9JNlczTG1kZEhoNFlZMTY1QkdCZFRkWm9Nc3RTVlFOd3dp?=
 =?utf-8?B?UFhhRlU4NDdSMkxuZW9CSzgxK0J3dEE5VkVTbnZ0OWFpK3ZLbWYxMktOQUVQ?=
 =?utf-8?B?MzBHRVd5ViswVWNBOWVRZ1RBT0V0V0ltODFtYmdCcGx6bHlncDBOK3RNbnJv?=
 =?utf-8?B?bGp2bHJWeElSZEdYMHNQb0pyQzJORUNDM0p3d2l5Ukk1OUZWdXNsa1hKbGNp?=
 =?utf-8?B?dittZjhRQnRuQzMzYjd2MFBJT29XZXlLZnpCNW5QL0p3d0RpblFiVHEvM2Rz?=
 =?utf-8?B?bk14ZzhlNndXeDF1Rk9iVU81MlE4SldKWHpVazJod1JhR3VaZUl2RndQSzZl?=
 =?utf-8?B?b2JBeUVFYnlwcG5seTFLV1hXRnpFTTlrUmZMT1ZVY2R2SDVtcDA1ZTg2S0VG?=
 =?utf-8?B?cEh3ZmNkb0Y1OWpvTjZuRTduUjZ4eHdpV3VMd3NnZGxuN3UxWmpVOElGMGxl?=
 =?utf-8?B?L3hZZWJVRTRRUWtSdkZkT3FKU1F6b2QxL3pOVm5nQlIreVpxa3hJOG00NnRm?=
 =?utf-8?B?aWNOMTcrOGI4dUU1azFtakZIZS9LVkpVbGlVcFJPc1I0R1E5WVYzS3pCaGVO?=
 =?utf-8?B?Y21HL1FPS3JaMzJzMUR1dzlwYnl2dmhKdHVvNFVJaWM1Y3BMYTRMcjhYdWk5?=
 =?utf-8?B?WTcxSXlJRGdvdmhBVDc1UXN4MXhIWWVDSW5CNFZycTltaFJhKzVrUnBkY285?=
 =?utf-8?Q?GMiur4Hf9hnrA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjBINlRid0E0NXZDcWhNVG9lUUErTTVwZExaaFF1UUtPWWYwVUhYNzNzOUNW?=
 =?utf-8?B?L21mdmVnT0wwYmkxUXZxOXd5Qkd4dUMxZEVrWThIT2krZmZrRGFhNkNDM29u?=
 =?utf-8?B?UFdUODlsTHYvRk4vWFB0VFk1MmxNQ1IzQkNubDZRTjcyTU5uNStybVgvQ1JO?=
 =?utf-8?B?Y0ZKWFliQ0xWWWw2eDVvYlpHMlliV3VuNUhPeHB2cnRxM3hmWnJKSnlpTFRP?=
 =?utf-8?B?am4zQ1E3QSt1VFlzMW5jWTlwWjBrSUlEMHF6VXJibmpQTXk1M29YZ2dtcFQ1?=
 =?utf-8?B?cVpHSTFQd1RabXRKZjZsZS9hUVRGWS9vOUJsWjF6R3k2a2hSRTc4Y040czZW?=
 =?utf-8?B?V1QwT1dSaWhob2x1SFZmblI4MmVaV21BNFQ4Q1lpNnVYenNQaTd5V1NibmZW?=
 =?utf-8?B?NHFoUjA0UmJLRkNjM1pjYU56cVlWVG14aitXRGJ1NlIyQzZiSnVCK3pPYVB4?=
 =?utf-8?B?V2dwZElDYUZKaXNCR1htYnJEbGxNU3ZUa08xWjBOT2ZIcG5vN1dXSExzNUZs?=
 =?utf-8?B?b2dLanJ3UncvZXRiL0hzcnVtN3BaK3pTKzBYWHgycTFXTkpxdWdJMjBkVE96?=
 =?utf-8?B?cnZzNXdFQThFWDRzNlpGOXY0RnQyUWdneWx6WU1DZ0xpWjVQZGczZmZHazJk?=
 =?utf-8?B?SnJwZUJHZUw4T1N6eWRYQUVTZ2RJMWViQmFZTUtscnhKaU5CcVhQa1N4ODU3?=
 =?utf-8?B?N1VqZ0hjbXYwdnVUM0pLNEc0UmRES2Q1dG11cERTM2FGa1VDSFlqTTFWYkoz?=
 =?utf-8?B?TERuSGRvMlNWMFpRZmhpSG9CUHBzZm5zV1JucU83WVd3LzZVYzhsaVVFOXBr?=
 =?utf-8?B?My95ZDZyN09wOTQrbHA3MnVRUUZBQjhsK3dUZjJPKzdkTnh3RnU0QVNLVi9L?=
 =?utf-8?B?cjNwQkVLNTluZ1JYNWxPWHhTUDhtejkrcmhwa2dyNldoYnREZ2xNMytRcGw0?=
 =?utf-8?B?Q0xkb1UyZ2piMFZsdTFaSzRDRVVHcGdIOGx3dkQ4RVZUQTNRN09uYjdiUUs4?=
 =?utf-8?B?Qk8zdDVZWGRCM3Zjem1jR1FDOHpKT1IwYUpaNjBpRmc4dGZuUFFpQ3VUZk93?=
 =?utf-8?B?dlMvcW54NXMya3Q5VFNCeGVmek1SelUwQWR2Nk1hMkVPdTJ2Y3VjcHFicnRZ?=
 =?utf-8?B?VU00bDdaMHFGZzBoLytTT3NSb1UxQVZ0WGZsaFZGWklGbUVqMElvbGllbW9i?=
 =?utf-8?B?K1hoNU4rNStibUVzZytXZis0VHh5VTNzUjA5LzM3TVFaaXp6UndLa3ZZbE9K?=
 =?utf-8?B?cUxZWW5zTXVLTE9va2RzNk5FMEFiR0Z4KzNZSnBxVUpDMmFaR1VYc0dPTHAz?=
 =?utf-8?B?WE1EelkzZU5RNFR1Q1ZCdzBaWTgxU1ZJRWhCTzNUQlNhd3A1YzcyaWJpY0pj?=
 =?utf-8?B?VjNQR3V4V3NOWTdhWTlkNk1PT1hIL2hkK1F5THhRNnJwaHRmS0hwM0d3Y200?=
 =?utf-8?B?M1pWK3pIOHpaVEpQajAwdjJYU0N6UERFbURrT3RTeDRoWGh1LzlDTGtUOE9W?=
 =?utf-8?B?aVc5RGs1bkxWLzF1emNhRVFoSmF4TmhxWklqQVoxVmJBRGcraHUzaE9leDJ4?=
 =?utf-8?B?ZEpYZnRpcHV6YXZjajFxb3Z3dEtZQ0JVcXppM21oL2JXNkJ4aDVVTEs4TnJV?=
 =?utf-8?B?WDlSMEJ5K3ZaNmxobUExRnhHWnA2UE5ZNWRVT0k5SENBZlNpYnlLc1hKUEJW?=
 =?utf-8?B?ZWFzeC9mekRRa3U3VFMwNC9yRkZVeEUzK0pRMU9VVk5tNDFlMXpPQlFTdEE5?=
 =?utf-8?B?UW45cUtYUi9pQkN1d0pOK1A2MWNhL1NDVUxFeEpnZjAxVk5nR3FNcGcxc3ZZ?=
 =?utf-8?B?UnpUcCtZL2J5bjZoR0Zhcm1xcHFGbUxrNy9TbjdpNkprMk5qY1loUHVwSmN2?=
 =?utf-8?B?eks3UDc2MHZMaXg1d1dEY3dvU1lmaG4rTExySVBnZHE4dnJsSVNqN1YwTGhB?=
 =?utf-8?B?bitiY21GR0ZqcE9rWFFtUXBkYW4wUm1oSGFYcUVQR3dLZTFrTDBIdzEvOHJa?=
 =?utf-8?B?TG9GUUpTZkNubzdFTnJiamhzZ0hQQ04zV3JQMjR3elJtRG1JcUc3b3dwVFVz?=
 =?utf-8?B?Y3VkWHd3YWR1TFMxS2F6MWFmTHNLb09CMXd0UDQyRmxtTCtlYVVxajArUG5w?=
 =?utf-8?Q?3ZRoaEo7pDRxwdq5V6YXrOoz0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc224080-f552-47c8-c7e0-08dd56334397
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 07:00:33.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wj+v7N5Wmui0A0HF9AGvjvKcmKXbdReGkRHP3Q62mwjOIHuhItTsMwagkBDtAd3YEVYpAf0xx2hzroi1pc47CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283

On 2/25/2025 17:01, Luke Jones wrote:
> From: "Luke D. Jones" <luke@ljones.dev>
> 
> ASUS have fixed suspend issues arising from a flag not being cleared in
> the MCU FW in both the ROG Ally 1 and the ROG Ally X.
> 
> Implement a check and a warning to encourage users to update the FW to
> a minimum supported version.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>   drivers/hid/hid-asus.c | 103 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 101 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 46e3e42f9eb5..3cec622b6e68 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -52,6 +52,10 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>   #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>   
> +#define ROG_ALLY_REPORT_SIZE 64
> +#define ROG_ALLY_X_MIN_MCU 313
> +#define ROG_ALLY_MIN_MCU 319
> +
>   #define SUPPORT_KBD_BACKLIGHT BIT(0)
>   
>   #define MAX_TOUCH_MAJOR 8
> @@ -84,6 +88,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define QUIRK_MEDION_E1239T		BIT(10)
>   #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>   #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> +#define QUIRK_ROG_ALLY_XPAD		BIT(13)
>   
>   #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>   						 QUIRK_NO_INIT_REPORTS | \
> @@ -534,9 +539,95 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>   	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
>   }
>   
> +/*
> + * We don't care about any other part of the string except the version section.
> + * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
> + */
> +static int mcu_parse_version_string(const u8 *response, size_t response_size)
> +{
> +	const u8 *end = response + response_size;
> +	const u8 *p = response;
> +	int dots, err;
> +	long version;
> +
> +	dots = 0;
> +	while (p < end && dots < 2) {
> +		if (*p++ == '.')
> +			dots++;
> +	}

Did you miss my comment about using strsep() instead?

> +
> +	if (dots != 2 || p >= end)
> +		return -EINVAL;
> +
> +	err = kstrtol((const char *)p, 10, &version);

It seems a bit odd to me to convert to long only to then convert again 
to an int (for the return code).

Would it make more sense to jump right to an integer immediately?

Sorry I missed this the first time.

> +	if (err || version < 0)
> +		return -EINVAL;
> +
> +	return version;
> +}
> +
> +static int mcu_request_version(struct hid_device *hdev)
> +{
> +	const u8 request[] = { 0x5a, 0x05, 0x03, 0x31, 0x00, 0x20 };
> +	u8 *response;

If you're spinning away, maybe worth using a __free() macro to avoid a 
manual kfree.

You could also drop the goto statements then and return ret for the 
failures.  Although admittedly you'll lose your error message for the 
asus_kbd_set_report() and hid_hw_raw_request().

tedly > +	int ret;
> +
> +	response = kzalloc(ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
> +	if (!response)
> +		return -ENOMEM;
> +
> +	ret = asus_kbd_set_report(hdev, request, sizeof(request));
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = hid_hw_raw_request(hdev, FEATURE_REPORT_ID, response,
> +				ROG_ALLY_REPORT_SIZE, HID_FEATURE_REPORT,
> +				HID_REQ_GET_REPORT);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = mcu_parse_version_string(response, ROG_ALLY_REPORT_SIZE);
> +
> +out:
> +	if (ret < 0)
> +		hid_err(hdev, "Failed to get MCU version: %d, response: %*ph\n",
> +					ret, ROG_ALLY_REPORT_SIZE, response);
> +	kfree(response);
> +	return ret;
> +}
> +
> +static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
> +{
> +	int min_version, version;
> +
> +	version = mcu_request_version(hdev);
> +	if (version < 0)
> +		return;
> +
> +	switch (idProduct) {
> +	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY:
> +		min_version = ROG_ALLY_MIN_MCU;
> +		break;
> +	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X:
> +		min_version = ROG_ALLY_X_MIN_MCU;
> +		break;
> +	default:
> +		min_version = 0;
> +	}
> +
> +	hid_info(hdev, "Ally device MCU version: %d\n", version);
> +	if (version < min_version) {
> +		hid_warn(hdev,
> +			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
> +			min_version);
> +	}
> +}
> +
>   static int asus_kbd_register_leds(struct hid_device *hdev)
>   {
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> +	struct usb_interface *intf;
> +	struct usb_device *udev;
>   	unsigned char kbd_func;
>   	int ret;
>   
> @@ -560,6 +651,14 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   			if (ret < 0)
>   				return ret;
>   		}
> +
> +		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> +			intf = to_usb_interface(hdev->dev.parent);
> +			udev = interface_to_usbdev(intf);
> +			validate_mcu_fw_version(hdev,
> +				le16_to_cpu(udev->descriptor.idProduct));
> +		}
> +
>   	} else {
>   		/* Initialize keyboard */
>   		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> @@ -1280,10 +1379,10 @@ static const struct hid_device_id asus_devices[] = {
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD},
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
>   	  QUIRK_ROG_CLAYMORE_II_KEYBOARD },



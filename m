Return-Path: <linux-input+bounces-11570-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B602A7F718
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 09:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B2477A8145
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 07:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3551A263F21;
	Tue,  8 Apr 2025 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="UIYe0fuf"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011033.outbound.protection.outlook.com [52.103.67.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC625F996;
	Tue,  8 Apr 2025 07:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098779; cv=fail; b=FJdlGtL/GOkGAdh6G4kHE2wkq1w4T30gZRQNXRXhAocx3StJIOEDxKAQTvu8mZSbeSV1CxZ+OADHB3KpqIhbm7atmiR7N0yjw+vLTI/O/KLcm35w/fPyXGO7JwR8ccFGo1VAveYrahy82iUUS03+xk7OrNCradCGVrsIL9coAUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098779; c=relaxed/simple;
	bh=HellkLztnimcNPwFEFB597OiPxAyCFZ3oRHrkflchDY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qDQycLHvm9UGHHQwsJ53aYPb4XpKXiSIBfGYVsLKHaVP8NTVz5Y6BaRZZFOBWOlwuoI6EbfILnW2qh7YEOAiPhxt5lwGgW+fWjmQ4nPexC5npv/wMyG3mQ31sc8LJ+Y65BVObwlo2tjg8l7N2vkOQ7P3CtOc509GZ2KJsHfBshk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=UIYe0fuf; arc=fail smtp.client-ip=52.103.67.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng6F2qo8AN5lfS6FPfpNrPJD9u02FXPYtlOzgqBKanG/96Za9Z+Luli4q84xh+DCM2d2TcOq3cX8ahFwTD0lNbLdEN/qxYUfLO9UsRfzXnmWkPgFIVi5ZfzKZDoCEgOmrxm7rkYMJRixPUUZPEHX4PMmDevAo5W3lb4nHdB0EH5ykIRp3S5NrlZoOXWszDUq2vA2bcpj9yJDFqXezI8w4n0p/6+gTsm3nuCKQaYDayyErO6JPSjcHYCTqjx+6egOt+s5EPaL/UtiOu1ShrRKUYiPdevLJ8xkSB4QW63bbhiI35mm1cCDD45qSOM0FAMu/QNctiYAyzkrVft+LLxGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psJIyLWdYNdYdLuCfxZUG3zYq9FRvdvhUWVNHAxY2n8=;
 b=JWluoc0xbHKo3WOvDl2BYLFAeMQ+JYcKCON9a0eSSvjleV6O+CAAfdAWdUdxWf0QN23mpzTolPtT2reZsjaZ0zB8SuPP/zcYSLmXVp8qpUU9grwD4KQAYQDG13ju42d9zpsZxK5QWF7RMn0Jfp1KThsNEj2wVihRuiA1NHGlZ7o29jEzyrSfG6HEz0MDHAepyTXoSzH3kjN2aekR0tNiOAeTi4bWv1S4cz6r+n1KvwB+z/TcQgAVZo24rlwUMjf8hpE/S1SpRDNZ9jRGpJJAn5up3IfMnpHTV+lHA1in8W3Ed+lShqNpa9yQGwvln5DjyIq3b2w53f3ZdYpHQ8qUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psJIyLWdYNdYdLuCfxZUG3zYq9FRvdvhUWVNHAxY2n8=;
 b=UIYe0fufpqoSxvnD+yOsdSbdgtdB3BT5BVZOkrl7CG7pxjZ7uTOD4aRbkFsH1R2vMZTqGyAGHn3iR/D6RJZ/rtrSQkcaq39TaN/C2QRChDe4SCF7av+Sn+mjrEdVlwlGytv3jXGrjEVu4RzxIRMfPFkHSXYrVeLJLwe5sOPz1koAEbWoMr+mT/Z2vqyA6HJ8FfR+5qU/qVWIC7INRK6yDJadhc3GK6947hH42RddJwCibLuwvzq6ihvwPOAQ0JdT6SCG1WXJC+oDEC0TpJJhZ6FgnGU3oTjzm1rvM5+z28+/bRO8FgG7EsPKyQqA/9yX4Ul/Edg9y3XWxSk/7LQ/LQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAXPR01MB4213.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 07:52:52 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 07:52:52 +0000
Message-ID:
 <PN3PR01MB9597001E80B673AA1E4033C0B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 13:22:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: appletb-kbd: Use secs_to_jiffies() instead of
 msecs_to_jiffies()
To: Thorsten Blum <thorsten.blum@linux.dev>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407082930.742229-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <20250407082930.742229-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0121.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::8) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <a065a402-9486-4ca5-9b1c-e34cb927d909@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAXPR01MB4213:EE_
X-MS-Office365-Filtering-Correlation-Id: abb55536-5055-401d-05b8-08dd76725da6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|6090799003|8060799006|19110799003|461199028|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHJHdXdzMnJ4aEVQM3dwSmdGWlZrY3JsN1l2VXc3emhqQjZtR0tXOE81M3ZX?=
 =?utf-8?B?SjF6U2tBMGxRUjk4djNkblY1VjFudVFad2orQ1JHcXZtSkdXekp2c0lBTzBT?=
 =?utf-8?B?TDlCTkRUYjdmeGNZdGlPaWUwV1N1UWdPS2pwSXQva0lRYzVUL0JtSHZGMjFH?=
 =?utf-8?B?aEQra1dOdFBkZk1JVXFKeElPbXJhWDZ4NW5IcGppQVY3MHpHOEYwSWdPVDhp?=
 =?utf-8?B?TXpyK3pSd3hYd3pPNk9VVkE1RExadUI4M0ZyeVF0Y20rY1ZRUjFmaEFuWFM2?=
 =?utf-8?B?VUlTMWV5MEFHYnB3QzdBSEh0cmc5dmUwbU1NdFMxSDhPWGtheHBteFRNc3hI?=
 =?utf-8?B?SHFpak9Bai94d3gwdlRodjV0eGhwTktpM1RGNjY5djhvWk52Z1VoVjBTZ2N2?=
 =?utf-8?B?MzJnSUZxbm9LaTA2NldKdkdyOFVSWmhzQzBvcG5OWTN1NTkyMHdNUmVUY294?=
 =?utf-8?B?WWkyV1FaNlFHb0p5UjVxcTc4UFZBOEdhS2pyRDEwTndUY2VXUDJqUlNXeElo?=
 =?utf-8?B?enZSZzRUblRQTFZuRVlCQzBqcUx2Q1EvWFdRNTNPSlBRT0FoSlpMVWx5VzZS?=
 =?utf-8?B?N2xFZHRLdGNPd2RCVFhWNlJ2M0lWRzZhSGdXV2NqZXhoYmdJMGNHdUZCUnpN?=
 =?utf-8?B?NzV3WHJ5MHZZdE9VUkxEcW9sZU8wMTRnek8xMDdzK1RTUmZyRUw3dWUwQ0g5?=
 =?utf-8?B?TVI3Tnd6ZVRaT0ZhN205Ukt6NkhpbkRsR2xlYmxxekxhbXVhSjlQYmtEaGw1?=
 =?utf-8?B?Z2grSUt2aVZlVmxNNk1CVE1ZeDkzWmhpOWRXa210UlE3dWxBSTVZYVRqZUJI?=
 =?utf-8?B?SFlhTHgwam9yZlpkZlZOMTdrSGUvU3VXNWx2d0lncHIyVGtjZHowbyswMEhK?=
 =?utf-8?B?RW84ZFRQY3NEQzRUQnUyUWhDSE1OTHhheVREWHBaN1QvV1pTRDdJS3BGK00y?=
 =?utf-8?B?RlZKM3U4c0YxY01Wd0RZaDE5eGRyNEo3MHBacTY2cURySEZyQm9DeWM5eTFr?=
 =?utf-8?B?Z3lmK0crWmNDN2xEamR2Rlhicy9pdU9iTHg4cjZQVnpaUWlKblZMaDl3Sklo?=
 =?utf-8?B?NGs5WWJ0L2hvaWZqUTkyV0NSSytmKzRiNGtNSnFXQmFEdzNDS25JRjMzNllL?=
 =?utf-8?B?cHJwdzd3NU9qZFVHYUEyUGRFTkdIY09FdncwWmM5cG1MSjF4MWRuRG0xK3lG?=
 =?utf-8?B?SnROYlpZY0VyL1dURkp3MER6SkxEOFRldXo0VjhMeXhoQjZvMTlyZEhlc3RT?=
 =?utf-8?B?Vk5PMWRXWVZ1VzkrL0pYUmlGS2E1dWV1YmNnaG9JYUxrTExTNjRzUEFCbDQz?=
 =?utf-8?B?ZXZKRGJVQ1RzM2NoaGlBb2EzbVQ5dncreWp4VHp6aE1mZTdCMHhJQUN3ZUpt?=
 =?utf-8?B?U2lPL3l2MkZpL0xCYkIwdE0vakVhR3hLamtKWTFIK0g3N0hBaW9nTXdBYmFS?=
 =?utf-8?B?NVhQMTlSbTZRUFpGc2h1K3Q3RWhEK0IvSDBxWHI3SytUNVQ4d1BOQ29yS1JJ?=
 =?utf-8?B?TTRLYnNZUnFWSXplTjZBWHA5ZDN1K0lXNDdCaWFBNVp2cmFPQ2U0Z201OEpG?=
 =?utf-8?B?YnRndz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmF4emRFODZYbllBU1l1WjJjcXhHdmVLSFNHakRUL25KblRyUW1wNThlV202?=
 =?utf-8?B?eFNOcCtjL09WRG93S2RRL09CaUVXZlRXbGpaR2NoNCtaejVKMFZGNnRvRGFX?=
 =?utf-8?B?RGREb0VkN0FYdVdERGxjZlpqOXZOb1diQmkvSG1zMkpOZk1wQUNZeGJJYm9v?=
 =?utf-8?B?YkQ2QkU0blFuZFMrRE9IUlBmNDllWGFobXYrbm81c0UxNFVSWUFZTEYwd0Ra?=
 =?utf-8?B?c3lkYmYxdUhBT3V0aVFseUdQOWFSTzAvYnNtd2lHeERMWUx5Ny95UGdDTC9t?=
 =?utf-8?B?WVJMMWtibmJDODVZN3pzQm1idWcxQnloa3BHNTZZU1pMZFFmaXIxaDVBMURC?=
 =?utf-8?B?TkRxWFF2bzNpdUdSS1hReW0vQThjSW9yc1dybU9EZ2owcGFwWUQzQXJKckFh?=
 =?utf-8?B?b1daeE81YUh1YzFNa09Za2dpRnJHZHJjSXNsbGNwaldFR3A0eVM3N1ZlMVl3?=
 =?utf-8?B?NHN6bkxabm1rUVJqZnpqWGh4dHpETkdpcWhHZ25JdDJNRHM3MkRtVjVuL0Jt?=
 =?utf-8?B?cVEyNGg0VzhzZHczcVd4cEpONDVPSjhEN2x4VXFGZjVacTQ5bUVvUERYS0M0?=
 =?utf-8?B?aFlrTDBRNWszZTBPcDNKWFk5cWZYSjU1WEFGaDFYQk5nd3daODFCaGt4Q0kx?=
 =?utf-8?B?MHk0eVQ0UGs0YTk0S0RQL2VqTFp0ZmxUekErQUxQYmwxTUVkT2tQSHdIekhK?=
 =?utf-8?B?NzZ5VnFid3hCeFpVeW9vRTM0YWVtK014d1NFQjl3ZUdCVUxxNzBUd2xJWnF4?=
 =?utf-8?B?aFErZGdGYWRJcHhoYVE2Mk5oZ1U0d3hIZUsydnlZK25BOEVrQlN2SkF5UDgy?=
 =?utf-8?B?Q0oyUFA3bTdhT0NGR21McjlTQytvNkR3dWtSejY2WUVBdFVmeXFHTlpGOU9R?=
 =?utf-8?B?MVNxMmVWeWh4emZOUXNYVW0yU1QyK242TUhWU2xsUFlxeENBZCtBdSttSmlB?=
 =?utf-8?B?Umd0NGQ2T2Q1MitoVmZpVktBUkFscHpEUUdDazNlZWdNcHd3NUN6K1FZdXo1?=
 =?utf-8?B?em9qaFNab0g0OXFwcEE3T3oxMGNnSWI2N0lJL2M0cVlNVmVlMTZ1NW1NMzk2?=
 =?utf-8?B?dnY1QVphNTBEdzAzY3NoVk92SjlqL3hZeEowUW5Ja0RjUjZDcTNCSzd2WlBM?=
 =?utf-8?B?dG9pZDV0UFpqQk9tUGk2ZGFpNmUvNHRsWk9tUmRNR044eGN4L2FKWVBKWjlx?=
 =?utf-8?B?OHFLWklMM1ViMy9GMUVpOEJtV3pkSmR5UXpVTWRXckg2Vkx2VDJOTFlMOCsw?=
 =?utf-8?B?YUdtNjNhNUVnazdiRVhNYjM3RTJBWFFLVUlYZG5iQzhjMVRzVjBiQjhpd3VC?=
 =?utf-8?B?SWc4ajZlNlVIeXR6dG9wT3lBbzVhc3dEU25XWkNsd2s2bS9pTUxvTE0zaW9r?=
 =?utf-8?B?SG9zVHg0ZExXUW5PSkRYN1d5TVNpMEliaW5ndTBaMGJ0VVMrOEVYSUxQRG1G?=
 =?utf-8?B?OG1uNmc5Z09qSjRMYnBzS2tia0xKSWdYdUlYMnN3NEdmQnhMYTlnY1lqeU5G?=
 =?utf-8?B?SXQrcWNJdmJTRlV1RVhPZ1p4TkhzUGZ4bXB3RG0zejhyK1FENVZRbjBYK1RR?=
 =?utf-8?B?VnRWNkRjY1lHVklCb0lNNzhkbEo2akhnSXFPcHNIeUs0ZDcwWWxWQUtyVXk0?=
 =?utf-8?B?bGxJN0dJMU5La0hBTWRNRDEwdkIrR0xsZHVjVDR6S0tUL0V2aDVMM1pCcmZP?=
 =?utf-8?B?eDdSQWtoZkl6dHRtenVxSUNMK05wOUFVWTdZdEdVUUllT0xaM0sxRmxmc2ov?=
 =?utf-8?Q?OAIQAAYlMqTMtvqjHk4nx+9tUESWlaxMA/K0jKk?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: abb55536-5055-401d-05b8-08dd76725da6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 07:52:52.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4213



On 07/04/25 1:59 pm, Thorsten Blum wrote:
> Use secs_to_jiffies() instead of msecs_to_jiffies() and avoid scaling
> the module params 'appletb_tb_idle_timeout' and 'appletb_tb_dim_timeout'
> to milliseconds. secs_to_jiffies() expands to simpler code and reduces
> the size of 'hid-appletb-kbd.ko'.
> 
> Reformat the code to silence multiple checkpatch warnings.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

LGTM

Reviewed-by: Aditya Garg <gargaditya08@live.com>
Tested-by: Aditya Garg <gargaditya08@live.com>


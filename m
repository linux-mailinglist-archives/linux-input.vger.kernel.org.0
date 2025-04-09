Return-Path: <linux-input+bounces-11580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F2A8281D
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 16:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BEE117AE14
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 14:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB92266595;
	Wed,  9 Apr 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="jWttGV8w"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010008.outbound.protection.outlook.com [52.103.68.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E425F7AE;
	Wed,  9 Apr 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209352; cv=fail; b=EcxJJuO5FpPsPUWtu/rdQgzfz+Af7vKKfTSLtD7jsGkPeP4uha8HJddva+0bI1qSf6giwcFzdfIPo11qd5WAtIDZ2Czp8Gd4NkpBI9wFDSNURDR27BTfX4BF3nnJp0yo+DtxTNJDKn+UwgdQ1ErhPs+9kNmFGdYB8UbV+hgBVwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209352; c=relaxed/simple;
	bh=XXsp8J1DDcS6xRtdcHjdZ2bEfZRGLNqT98ClGch/81c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IZtEiuBYZUhTOAu8bTB8+9MW9I69x+xVhe+nG8WdHJSX94kR69S7LJvso9KAPmYAIq+wey2rK5cx4fD92q3IndHyrrTQBKw/Qj2hbdtZ29f+OPk9TSDB6c4vJiKB3HdNVJnhEvLMcScfDq9s8Ag9wkSTFg7RCRM2A6pwMcV8GkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=jWttGV8w; arc=fail smtp.client-ip=52.103.68.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbaBX4y2/oSL/KwW0XhlhI6VdKpLGrteATqrFsYKBm+8APYc8npdNafU1KX39iEsf5UmcQMB7IgJEu7a0BWM6M/upRfiLQHJvbet1XzQmIjWyT3v7wGWDaiQSeYWMGrk9jhu5V9GDq55kv4aRRxNQ0y7F4kip9ncoGfhNBk7zQG9Z283RhLckTFfPr7WdGOvNc9dSTTlHdUE+peq/MTisxZ7JN2Kn7PIUr26w/AbtSywMaYhq6NSRiOxSRvB4LOrmAWOSjQFRlxSe/cG672HlwouhEWR1PEHzqm8s+kTVzCX5oMkzRzoIj0LAfm88hsYI9R+dZokDRhJK5z+1USx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXvoazKEDGu35pzyZVVtgxCgmvPaAqG8xSrVbyuikwM=;
 b=U1H2wwTuO6/DU75ORLT4IX+ZRaa0quCuV+ugOC+3xjrkdStIBPmV4EYKA9V+yH9XqKlAS94XKl4faAryK+ADDxRGLFModZJRCP32aQYWczwZIQxd4N4nHb90I97zu/bX8UFiqmNIDn85icAxvWK8nGlxGKwXxWDeVAzWSs4wBl2SqicxLHW0SHriMt3lX1emQJIkk0RrOZtdUYVzWl9WgEsK2ZnoxMWi3qjavYXEPjfAWd3mAdrekKF3ds3xD+MuBmY24+BS9SkAGSke7XMc8FBWcGkM3+sCP7yhe88D0/89wYrM/PTIakjcBG1ngvRmaOuXYD4QK1pdekoFFm4pDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXvoazKEDGu35pzyZVVtgxCgmvPaAqG8xSrVbyuikwM=;
 b=jWttGV8wj5FXtQXKv5zDSQ7+fwLB+/ZWdsmgPMijEESSyBD05AKiba5TOZ5YBb5m/R/SsLHrzyI0uxDzYckhPzlv5B5VHH2voQoSaCneODynpkg/dwPThlhh3xj8cke52G2thfRL/h4QLvAVjpTQ5mDHhk8f+9axfMH0mTDP/w45FDX6oz9DIZO/swOW01/JJW33KBZtgKRZJhe1ZZKgIhlY7vrIKEV/80QeTt/RUeYlm5FL6f/O0mRaSoZD+Ou50DAz+jd5wAUg2MQhffx5A8osIx9PG4xUTTP4IUDXqbjbk5LKfMKwKLBCs9c3bx2wwlfk0XlnVwwlxIf35d8tcQ==
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10c::9)
 by MAZPR01MB8872.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 14:35:45 +0000
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa]) by PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 14:35:45 +0000
Message-ID:
 <PN0PR01MB95889912BB81D1B1B579C7FEB8B42@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 20:05:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on
 X86
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Kerem Karabay <kekrby@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::11) To PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:10c::9)
X-Microsoft-Original-Message-ID:
 <6e9866c7-038e-40aa-a56f-479647f3509d@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9588:EE_|MAZPR01MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 2927db22-b66e-4f39-2271-08dd7773ce75
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|8022599003|15080799006|6090799003|461199028|5072599009|7092599003|1602099012|440099028|10035399004|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHdiMkRKaXdDd2tvQS9ENFl5bkx0WWZIR0FxREhYNGlaYThLQU1EamdzZ0di?=
 =?utf-8?B?L2dkQ3h3THhxSVdxNEppZk9BTDBCUkZYKy9xSXdDQlVXR0l3UTBsMHdMOGp2?=
 =?utf-8?B?cnIxaFZkdGc2dkhtdjUvVjMzWVZ2ZXFDdUU4eUlnSzlrR0dFTlArdHNoYU9L?=
 =?utf-8?B?UThjdGY4bXVXQ2tOZVRZVlcwV1YwZ0hneElDZzBsSTdGdHVTNndEMmVHVy9a?=
 =?utf-8?B?d0NkdVJ4eERvYWpyeTFLZ1JuT2JNZUtBTkF5Vkd2S3F1WnNPZnRKZkFHeWRM?=
 =?utf-8?B?MmtFbU0yYlU2OTJva05MTVNHckZ4SEJwTDFHRE5ZbnB6NzNBaUNsaXp1WThx?=
 =?utf-8?B?SjVRcEpmRWVyRU9VVEhVTzlKVHBwT0s5TCt1UmNjbzFKK0JjV3JISjZ6Nm1M?=
 =?utf-8?B?OVJLWlhpQXI4eXVjdzRSTGZKUG9va3ZpMFE5TDhlcUo4SWE5MVpMNmhxZ0Rp?=
 =?utf-8?B?RnYyVHpsR0g2NkZsd3lkbVlDNCtTWnhQQ3hYdXZqTDFrY1QvZTNtQVBOSHA3?=
 =?utf-8?B?WTl6UWV1YTc5MUlHV2c2RFJWbys4VWh2SlUyanVnMmZzTGRPOC9EbXd6dkow?=
 =?utf-8?B?ZHdBejhUNHZ3VEFjV3JFOEwwQTJkUXp2c2I3Y0Y3cUk3emNtWVE2c3RtQXJE?=
 =?utf-8?B?MEdxaC83Qll6SDRrVE80bzFQTVd1RVRMQ2tYdnNzeElkZ1I0SXhGRmZDclRs?=
 =?utf-8?B?SkIyZWUvT0M5SUNBVFpFM0NpaURhWjhJck9YM3g0Ym9HcUNWQTM1c1p1b2Zt?=
 =?utf-8?B?dXZtcXB6aHJ2RDlSVjR0Mm9rNWd2Vjh3UG9aU2tXN2lJRnpxU0o5cWtsNk9N?=
 =?utf-8?B?RUdEbG9wS2Ztalk5Qkp4RXgzcjE1SmtIbWJvUlBLbVdjakdUVkZGczJ2VURG?=
 =?utf-8?B?VlNpRUZyZlJvYTFzOWNSOWRhbk9hZjI1cVd0Y1lwT25rMVE5NURPMVoxeEtz?=
 =?utf-8?B?U0lod05MUUlHWFBCVzR6dEk5bU16a0wyUVpmbFZvbzVwS3U3ZnNiWTMxeDNU?=
 =?utf-8?B?a1RpNEZnVUxUUHYvN3BTTzVMcHV4K2I1M0JtYXQ5NmdSdmFqbHN1L2J5VWZL?=
 =?utf-8?B?WnVTNEdCR0l0ZHJNK3hQU25iMVgzWkVRdnBEU1pKNWwwMWNBWHNpZFFNLzFq?=
 =?utf-8?B?YlR4K0UxMm9vQkhKaDYwWDFibFpuVk9pcklaQnE0a0lPbDFjVWVCREdWbXVm?=
 =?utf-8?B?RjZvdml0QVl0S3VVSDBYeDBSQkF6SzRxaUtPOGhjbjQwWkh1MHJ1NDd1NllC?=
 =?utf-8?B?OHNKdzdWSStRckpxYUtXSmR5dm5aL1FpVWhrSVZiZlMwQytTN3VqdEhSTUN4?=
 =?utf-8?B?L1pjS0lvcy9WRSt6Sm41ak1rNVZVN2JvNW1FbEdGRU10TEt1RUJFUGg3c21o?=
 =?utf-8?B?NzZDRndSR0d6T3RMaGF5eDFZc25VQ0hwUUY1SFVUWi9XbG85akp1MmEvcTZa?=
 =?utf-8?B?bnNoaDFTeWNudzIvRnpmV0NNV1pDMmtIcThKMTROeDFnbVo1eWFEMlZwM0FJ?=
 =?utf-8?B?clBOMnp2Nzd4dWZUblIrSUF5c29uYmxMdm84dXlCVUR6Yk43QVhHKys4eVR5?=
 =?utf-8?B?aWxWT0lPWllQZmlDMHgxU2tUWU5YaDFsZkdpZDlIUzhnRTRUOTlEZUZUUnRH?=
 =?utf-8?B?ZG5GVDk5cXUyUG0vRUJKaFNieS9wUER6STlLeXMyZjRXdDZuTFliazQvUUdU?=
 =?utf-8?B?UkZZdmxZUXI1ZGNBc3pBaGx4eXNNTGZkallmSVl5MTNHcVcwUlZ5TnhtVWYv?=
 =?utf-8?B?LzgzanVySXZqVlE2aExGcnV5bG5BK1ppM1RBb0VMTEp1TTB4bXdsNEpYQzlw?=
 =?utf-8?B?N0gwYjNkRmlkdlBuekJNUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3BTWmMyd2JXNytxYXpvY29pd1U2ZXZlT3NJZFZGekdtL0xjb0l2YkpMUjFm?=
 =?utf-8?B?b1dCOXJuT1NRY2Q4VGRRQmJMcE5zTlR3U3huM2lORXdnREpGaEVuQXYvSE9I?=
 =?utf-8?B?emlWc1BWMUxKNEw4aEZ3b1RwYTdCZzFyLzdRZzRIL2JCdVNJR3lteE9lNUln?=
 =?utf-8?B?d1Q1MDJpNmoxeThvYS9XV2lXVy9FSHZCRGFlTVhYRzBmeEVoVW5zMTlSOUU4?=
 =?utf-8?B?R1lzNG95NzBVT2RCbS9Xd1JHbHN0K2dsajVSZkNwSjZYRWd0OEJ4Tk9KKzdN?=
 =?utf-8?B?SThoU1lwV0hMRDA0Q2xwbmJiNHZlRXM4NVdVd2lFc0w5VDg3a2lFZVRuYjlG?=
 =?utf-8?B?Zkt2TXNOb3VxVzBGazJiazc5ZzFGdFRzNFlabWQ2TW96Z25TWFVxQjcxblRQ?=
 =?utf-8?B?V2M5VlVrdk5kMWM3cGdhSXlFWDV4cVp1bFZwL3FyemZMTFZocXREMkpBUEZP?=
 =?utf-8?B?S2xjWkxoeFpRQ0lZSlVuZm50OXN4TlpFSVUvNW1tQnJ3LzhEeDgraDlremdn?=
 =?utf-8?B?SytjVjE2R0lqdnNzZ2hpcFFCNCtGdkhYMWFJcEtOSmNaTTJ4dWVza3Z6WUdB?=
 =?utf-8?B?ZVJFQVFGWXhXTHpOSkpWTUtmbG9lZTEvclk2Ymt3WWNnYnBnU01jY3lUOG9z?=
 =?utf-8?B?eWhVSUM0eUxHalRNZ2Rjc3lWN3c0aGFuN2FWYklRbm1kYXhFaGtKblAvSkFx?=
 =?utf-8?B?NVczU0doSFBJQXFGdFFVTUcyWFBZRURTK0YwejhGT3I3RVpieVdTcGt0ZmFp?=
 =?utf-8?B?eFNhMUtBc2E4WVVFcDR3UDRLYjh5MGl6NjRxemNGb0xNYWZpR1dFV3UxajFz?=
 =?utf-8?B?aXBZdVprQ2pUS2QyYURtU0N0c3dvWnhOVnFyUUY3K0xPTjBrTWQ1Um9GeE9T?=
 =?utf-8?B?aHpTM2JUTWJkMGF1NS93dGtmZldJMTRwbkh2K0VtZWV3SHVRem5qdWlES2tU?=
 =?utf-8?B?SDdEQXZBR3VQODFRV242RktCYWNQaCtjWjcyUVZHeGpUMmhjVWVFQVUwRWli?=
 =?utf-8?B?WVlmREV3Y2JCMCt3bDRmN0ZuMDFuaVd4S0tqRytEMjh2YUIyTTB5a09hczNt?=
 =?utf-8?B?cCtwSTk5T1FmZVRWcjR3cXdmTDR6QzZKUnZWQUNiVUVIM3g2WENXL1loNC9B?=
 =?utf-8?B?cHVvb2NEeHlYa1EzUUZrczJhcFRrYy90VDFXWFZSRkk3K3Vnbmd1QXNPL2sv?=
 =?utf-8?B?Z1cwKzBkQjZNU21EcVNINmpsU0pvMGdYN0N6THJLbjN5aytxdTJjaklKTm81?=
 =?utf-8?B?aGxCdUVTL0h0aEcwL2hYWFZzejZSZ1dLK3RrWlNLeFB6Z3lOcWthYVFaTUhn?=
 =?utf-8?B?WXFmRkVrZWtVamY5bDhTMHFZQ3lKTlc5Z01SVnNZTkpvOGpGNDFaVjlSTzMr?=
 =?utf-8?B?a1p6blRsUFd5QzV0Y25zTkFKWlVhTXlsTUovRGhzUGljRy91TU1nanNjZWJz?=
 =?utf-8?B?bnlVemNkOEVnY2JQZGN4WVVJMkNIOTNsanVGZ0lKVTVRckdnckxkMXpJaDA4?=
 =?utf-8?B?K1FMc1dvMTNMTFE0SU1ZTjlzQVE0SXZld3ZuckJXTzVOcGJIUG9GczF1Q1hO?=
 =?utf-8?B?TnQ2ZGpYVDZRNG5ucmJUbmI4U3Jnc25Eb2phamhFVkdqODNyaWZpeXdhSFNB?=
 =?utf-8?B?QVZHWmRQRkI3ZHpNOVZHL3U2WERRUnJnV0Y1ZHNmemtFaGFXSlZqT1A5dDU2?=
 =?utf-8?B?NzVEOE9pQVluM21UWWd3L1FSTERNSmIxTnl2YXM3cjlYakRoZHZiNEFWWHpI?=
 =?utf-8?Q?U3T6juwqzKDrtrIQvOl8BfA3NnvCtraC/UUPKym?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2927db22-b66e-4f39-2271-08dd7773ce75
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:35:45.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8872



On 09-04-2025 02:51 pm, Geert Uytterhoeven wrote:
> The Apple Touch Bar is only present on x86 MacBook Pros.  Hence add a
> dependency on X86, to prevent asking the user about this driver when
> configuring a kernel for a different architecture.
> 
> Fixes: 1fd41e5e3d7cc556 ("HID: hid-appletb-bl: add driver for the backlight of Apple Touch Bars")
> Fixes: 93a0fc48948107e0 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")

Nit:

The commit SHA should have only the first 12 characters.

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Also, hid-appletb-kbd fix should be:

Fixes: 8e9b9152cfbd ("HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch Bars")

I would also prefer having them as 2 separate patches.
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/hid/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index a503252702b7b43c..43859fc757470caf 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -151,6 +151,7 @@ config HID_APPLEIR
>  config HID_APPLETB_BL
>  	tristate "Apple Touch Bar Backlight"
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on X86 || COMPILE_TEST
>  	help
>  	  Say Y here if you want support for the backlight of Touch Bars on x86
>  	  MacBook Pros.
> @@ -163,6 +164,7 @@ config HID_APPLETB_KBD
>  	depends on USB_HID
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on INPUT
> +	depends on X86 || COMPILE_TEST
>  	select INPUT_SPARSEKMAP
>  	select HID_APPLETB_BL
>  	help



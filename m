Return-Path: <linux-input+bounces-12139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D2CAA8460
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 08:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A18FA1899E0F
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 06:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F028C4C7C;
	Sun,  4 May 2025 06:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Kq4lZCDn"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011029.outbound.protection.outlook.com [52.103.67.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676528F4
	for <linux-input@vger.kernel.org>; Sun,  4 May 2025 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746341256; cv=fail; b=rm+/BJ5XQW+DzXPGjfLv54CPIFk9RyOzOnVnDGg1xy45GKMm3nmF7BVPGyUhNjGsu7fSG0RW+BsB1XllpTyaeIth+1CIg3JGuoJXD4Wo2bwiCv8ZAciSN5czUQR9SxS0RFi9s+l2cg/l0+bOpjmnkJHQjbHFuH5eJthQ4k0glME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746341256; c=relaxed/simple;
	bh=k6ZxwwNCBcPjbg7MOFB8/mPdoAbxZlAsiSm7aFdiYyI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=okGDXWbFiJPHFBWiuVMH2qyne2f/X+YT7xYX7zk4B1NVidUXOLzINag+PshwoWoyu2TyIsTEuy9GKgaYINTvn5WJeOtXUbdwP//9yKcejirm1ycyrYOwFKmBXDG6f11vloddwivB/DYaYCgbSgTj2XeiaqOvH59xlLlkrPTRF/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Kq4lZCDn; arc=fail smtp.client-ip=52.103.67.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu/LQ4GHcrSAA49oZUzGjtDgYk6Nz+ejg+/Y85YDP9p5jp22JHDSoyQ7iNyCyGHNo4qNfq+QnBV4G/Qy0Cdd449D5wEPulg/EJu/dVYRTIvyZ2p6b2V/1AyvJqfRisAWHAlDdWzY2PHtEDInxM10W63sJHcEqf/elG0u3hfN2ojrQi2GRucaWgP0vAsNSaQ4mVq/2KHVcn34b9Npq68vSITe8cv+DB2F9uC/gIhJQWtDWFKXAiJIUYvZdp7oaIRi3Au6vMiUHE0HoZQu4tMSHnJEg4Vj4cgI60oQ8y92MRvLPrB2/uyll1hIxcx71OYcB+NTvhD8P5Xk6K9SLvHECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6ZxwwNCBcPjbg7MOFB8/mPdoAbxZlAsiSm7aFdiYyI=;
 b=bMF0o4TRwYRoMfiJxUiZ/1a0LJgla395w4TdxkJF+jR5DLS3YtkEGSoaRlTgGhmc/8RiOfQZcnW/f6bXlJGPUHxa6oHoJH+TBVbOi4D++kilC9/4dekAhzy1uMNTcwursVWe0bzYxP87jSl+xtU3KzpN2PBpY6xrpr4TS9L0QCSccW7Vc3/5LYOWvQ2lx4Et4o1YYSd0t/IRsEOHBgRGGlDfjT5qNHoiF+eDv+An825YQ/15cl02XNjEUe/cmMegh41KnxQ3p3jKNyMJDUQiZk5JeGKV5VetlQfieltWujJxM7wbTSQ3zG7dN24RGWcxnDhNWG90eEaOEbidDVFaMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6ZxwwNCBcPjbg7MOFB8/mPdoAbxZlAsiSm7aFdiYyI=;
 b=Kq4lZCDnABUW4yCIxadg/PV4fa+EYCUeuuuo2va6+IHp6oTRNHbfCNmhhaugxXAw+/blHY6Lr7PNv4MLo5I0M4VkswHjcr2qeDaNXDusTCiAezJlWvcjLDZ2QCFGYOkFuHQPQJP4uINKWPYhu0zCPB8nRtv0ETr9wAPBqDNRP/xBDHZ7Ze00xW3AZ5qsnPOgGMi4tVq0/4dk0lSgnrrv6S2l2UM1Iq163WhuKxZ53nA/Z+YHtvSYQGSrzlzW1z5UccGeC8JXeUU3KKgeT1aADNiQJHaCTmDhqta8NLy8EZmsyyiQkm3Al9iDRPfAh2SpviIEQ0/X01mENreg2pfGKw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5693.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:61::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 4 May
 2025 06:47:31 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.019; Sun, 4 May 2025
 06:47:30 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Markus Rathgeb <maggu2810@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: reporting: psmouse.synaptics_intertouch=1 for "PNP: DLL060d
 PNP0f13"
Thread-Topic: reporting: psmouse.synaptics_intertouch=1 for "PNP: DLL060d
 PNP0f13"
Thread-Index: AQHbvMBhkahlFjeJ00yCa7s0swXMlQ==
Date: Sun, 4 May 2025 06:47:30 +0000
Message-ID: <08229F6A-8B4C-4343-BC72-E6D016885788@live.com>
References:
 <CAOcK=CMO2YKouZkDz=9oCfEjeYp-uB51trovG3Wru7J++eT31A@mail.gmail.com>
In-Reply-To:
 <CAOcK=CMO2YKouZkDz=9oCfEjeYp-uB51trovG3Wru7J++eT31A@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB5693:EE_
x-ms-office365-filtering-correlation-id: 7a10fbf8-8d40-4189-b7a1-08dd8ad78ae4
x-ms-exchange-slblob-mailprops:
 laRBL560oLR0Ybdxcp7KTbjbpYD2CblC6HzxHJjmvQaxRxjI9awcQLsSW1V6f5VYy05gOoFT4PIZ5/RgwEGNsdFdnNIsUH5rhKPJOIjxSgmawZVDXghwIKdMh8vI8SE7DFRxxVf3qGPtoKYNubuYWMIx5kM1mOHSdVehFXFq42lNwxWlIqsFW4EeOZVFf1f4VyYC9FNqxuKPS/4MuyXA7EroyTKam461pqM+zHdEpqS+v5+UHUqFjYpV8luyW6LZNb4eKIboPRLEiKf1iWoEGPNvkRmlFMJDqQw4VLMzvHjFiXaAIjUqBMIADywCQDzfAlAEb1gc9V/vW/J3oHmZIfAX3FCA7Zb81Z1x1/0AD233/vFfnwDBHesg+K4OuD6ifeWQGGVGISSvMKwrqlCcIOT/GUHltVDCYB+xCwWmMSubDlS565F7sEK1XxXhebmcWZz0qVt9iNviIGFT07QQdpSd/yq0ZqF90yTtNH7LtogsN7DgzstiowNHtAH86uCPhR85qzNvZoUPbvT1l0vv/7rmofL/xTCgXJWK8Jw+QiZBFviiW8aeS2ED2Z2yIL+QAJgELlaKpXm6fTyyVaMBtCqRSLN4IbamryOScnLDu2DgK50AywkHMFH8g7jorc/SZxDMBQYcwDEBf6MPmXr8Ja5x2ePrtScprOS7LoomF7uDVQhUabJsFmlcB4wnzIhevA4zArgC4ceKu8Tx+AZTIwlLi2YOMsGcF5SKkGRwAmJHikKp7Drt96Up6X7+lCkjDwKcsiz4bQEBA29WNk6tayYwrXk4fAda
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799006|7092599003|8060799006|8062599003|19110799003|10035399004|102099032|3412199025|440099028|34005399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXlkMEg4ZWV2bEtqa3l4NnErdWUyR05PYlJJVlFQemRvbi9CdjFDQUhDTkQ2?=
 =?utf-8?B?Y3BpRVk5dzRLZGc3TzFxMXdja3ZzTGxiczhMOHhyRU1rMjQyT2g4RGZnckgy?=
 =?utf-8?B?OGlnL292WUtWZDhYaFZQNURjWjRKMUZFZ1VKVjRHMlR2eWU1aDdsQUl2dWcx?=
 =?utf-8?B?ckRVS2dkNnFSUm1MWXFYcHlpaEZsSXN2NGVGaVpFM3EzZ3hPRWtUVWhLd3pR?=
 =?utf-8?B?NHhlWmJVSE51SS80M1B4c2kvVVNDZEc4YktuYzZMSUo2a1RwREdhT09kZEU5?=
 =?utf-8?B?VUd5d3piUGNKYnFzbUwvd2huYUwrejArbjJXV1dJVEZIUnFDeHRlVnRENG9s?=
 =?utf-8?B?WlYyRjE3c0theDBueUpMQWxrTVk1Q3ZKVk1oQXVxcmkxeEpRWHpFQXRNWkFS?=
 =?utf-8?B?alB2NE1JdlA1UXhmMThuS2t6eERERG1jV0lOMjJUYVVVVGNWR2Jva0J1RDZ1?=
 =?utf-8?B?Y2NaS1NlS2xnL2toS3BveVVrbjBwdTFod2MyQ0J4aWxERzhDV3BPOUtrQkpy?=
 =?utf-8?B?M0xQUCtCK1c0czJPS1JMWkR6STRVVTFMbVk3SzBCbFZUZWt5dVdZM2Qrd1ph?=
 =?utf-8?B?czBTQnhBS0U5aDIyU2FDYkRhOEN1UTRxbFhtQVdUWTBjWkhVRHhwWGw3cHR1?=
 =?utf-8?B?YUdUbUczMzFwWkJ5ZE1CYTZqMitWMWozdXhjRm5qY2NtMERVbmg1TW1xbVhG?=
 =?utf-8?B?bGxWSnlWR3plbStKZlhUREJjVVZxUGdVUEI3NDZFdzVWVUt4RzhwRlA0WDRH?=
 =?utf-8?B?NUxvVWo3SEwrM3g2dCt3cXNyL1M2VXNjT1FtTElRVzJ4NTY3SEFhbmpmNzdw?=
 =?utf-8?B?cXpwRnFsdGs4SS8vTi9iN0FVeWZVUjhzYnRZdStVSjFJTDJLQ0RlWWFZU3FF?=
 =?utf-8?B?K1lyOFNsUkY0MWhnZGRSQmR2Y0tsdXdOL3cxVG91MEFsUjBrYzFUTjRZQzVj?=
 =?utf-8?B?cHVoc2xmNVh4YTdSdHFrcitHc2IzMDJNQ3hSc25xUW9vakdjRFN0aXNRL2Fy?=
 =?utf-8?B?WSt1VDZUaEszbjcrMGd5SHdpeVYvVC9NcHUvZWEzTUFzOTV2VmJRWGlQakQx?=
 =?utf-8?B?RnFSN1lkSC9uSm1Na3J3VEtkcS9HWDV1SFhpblRZUUlNb25temxqU0JUSjdU?=
 =?utf-8?B?cDZ2U04ybHFocWt1eVdkdXJxMWVJNG9aWWliejI2em4weGw1T3NNdktzK2tl?=
 =?utf-8?B?WFFpU05yTkpkSFJRQW12bm9pUCtockhraW1lcGxsVFVmQWtlRUNLaWFjOTdK?=
 =?utf-8?B?OGIyU2VWbEhHTjcySXdmcWFvR1ZGRjhvZVNpQldqcDJGS0FTckxDSkpxZmxr?=
 =?utf-8?B?U2k4NWVaYTVxZ25CbC9QUlY3OWV1YWFTbGhlalh0eUZsektxdkNXNWJGallk?=
 =?utf-8?B?UVZMT1lHamtsMHJpbnppTmRZV2RWNDJkeERNenJlM1pjRW5XVGhuenZ4Mjha?=
 =?utf-8?B?QTNNNld6aG5DK2dGMWJBMEFrYkt4akVTZnRqbUNoTCtvQTJCV1cwVHB5aGZu?=
 =?utf-8?B?d045dTlpV0tFUjBkMTlRcjhrb0t6Q1dTRVk3V2ZKNFB0MFN2UldodjY4SmlE?=
 =?utf-8?Q?tJiG6By95TBa4ujKV3eOXY0aJI1JAlUvXgYiusVKGU/iBS?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzFnYTN6bTN0SHh6ck41WnJ1bjduN25OK3JDRG5zTlJYTGs2VVdmYm1RckRW?=
 =?utf-8?B?Sk1TMVZKMit3TEszeFg1UG9ZZ2hONlFsd1lYbWZTS0x5SnRhTjl4OEZ0SUM3?=
 =?utf-8?B?cG5NcWFYSmowbGxsbXBaazZxVzFZTzhSUHlucXJma2FQcU1DdFR4VW45Y05y?=
 =?utf-8?B?NDY2OWdKVkZuUmRUbnV5ZG5pSWV0RXFFTmtFMzNYNktEeFh6TVozNVpudG82?=
 =?utf-8?B?WFlsZFdGTXFJVWFUclQxbWpBSVlQZ1psWE9GVDBGNFRuT0EyUlRKeERqSDFx?=
 =?utf-8?B?cEhmNWV1SEJ6bWdNZWV3NVArZE4wcTZjK0RJZmo2TE5iMkUyYWh1VFd5RGFY?=
 =?utf-8?B?WkVQemNYWTBIRndZYXhxbWwzZ2dvNi9SVW1uVWFaMG5MOUlhcmJxWVRQcjRE?=
 =?utf-8?B?OXNsOU5GcGxkVkRVRnN0Y1VFczB1SjU1SytGSXhZaWdhS2orUFUxYmx6Vzhi?=
 =?utf-8?B?cHJ2YTd3bGF5Q1pMaVE1ZXpEVURLMHhiTVZ1NmtxcFlhTkx1cktTQ3NWcUNU?=
 =?utf-8?B?QzNvb2lCbjhheUNWRzZsdEQzcWp4eUNraUJzM0l4Yy9hNU5lL0thK2Q1VGJR?=
 =?utf-8?B?UkhEbER3Zzd4eTdXS2wzazQ3QlZJUW8xa212UUhXcVNWRnd3NS9LTUpDMDlq?=
 =?utf-8?B?MjdadEJERmM4ZWd1OHhtSzhqZS9JZXE5NWhlWDJJUHc2dDhvRkh1NEljdEdm?=
 =?utf-8?B?TERpSVdaMHhRUW9jdkRvbkxFNzBZbCtHdHZhdHEvVUJLTUY1MHZXaml5Tk9N?=
 =?utf-8?B?R1BRdG9jTFdsZC9MSVB2eWQ3ODBYc1RYUmEycGJvZ2NUbmFHRTE3VmZTN0dZ?=
 =?utf-8?B?ZEFKalE3SS8zekxxNDZVcTkyUHlCTGRnY2tsOTQ0ZjkxZjFSWlE4Yy9sV2NP?=
 =?utf-8?B?aGdES2gzV05hVyszZU4xU3JBU1RtTVJJK3FjbXVXZHZpR3hiNmg4eWZHQmJl?=
 =?utf-8?B?WVNvVksvK2lHNitjUHpwUlBaMEtZcnJqQzFJeUVGc0hJMmlOeGRINlhTTmV4?=
 =?utf-8?B?aGJXTE9NZlU3TEp2WVBmOWZzNDdDeGF5ODZJYWtxZ0ZBRUdMLzQ3RkltaGxZ?=
 =?utf-8?B?M2VCN09oeGoyMW55VS9KcytrdzdyM3l3YWVzUSttUTJNZnE5MHlNMHE1RVY0?=
 =?utf-8?B?QnhSZlcvL0FwdXFBVmtKOWNpSHpIWWMrWWhqakJBaUVjc2NvQ0V5eG9mZHBk?=
 =?utf-8?B?MUJlTVFCREp3dm5odVZqNWRxTnJFVXcwbmFpNlV0UVhMMjYyQmt4b1hVdmtx?=
 =?utf-8?B?dksrUzdIMXl3bGxHbU1PSDBxMTZMYzdvcHc0OHEwMU04QlBESDNxT3p5RWRB?=
 =?utf-8?B?ZXJSd2g1WThweHZxdWhhd3BVWGdidzFHYnQ0emtOdkdha2w3Nk9MaXNGdmY3?=
 =?utf-8?B?amY1dGxIQ1p1bWNvZXVpaFVHSG9vdW00TmVKNDJ3YTRFMURyNjI1aE5iSVBW?=
 =?utf-8?B?YXZCcVM2bFAyYWxTU3NneGU2bFVMYm5nWlJ5aUdYVjZjOHVUK2ZFaUttL01n?=
 =?utf-8?B?OTNsOXZCd0NlUERpbEx4YU9lSlRDdUhhZDRvcWRHd2kxaXNvQUlqck1wdDU5?=
 =?utf-8?B?aVljVnh0QThpeG8xUXhFUGdJOGZ0WTBFWHlFbHovREZIZ3ljdkdRSlFEVTZk?=
 =?utf-8?B?ZDdyaVNsd0FWa2dEU2NncUh2N0RkQkcxZVlVYUhoNi9Wd00yRk9JWnRabXJ6?=
 =?utf-8?B?VHUzN0tLcXArc0RXbkgvdG1OaExzY2JjQ2FIOEpFbnBkUmF6Qk9rSUEwUDlG?=
 =?utf-8?Q?jIad/HCWv/ZaseToNYLky8CEeMb3PVpmGUL4NKF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2549E5EBFE163849BB8930AD0E5681D9@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a10fbf8-8d40-4189-b7a1-08dd8ad78ae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 06:47:30.9097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5693

UkVTRU5EIE1BSUwgQVMgUExBSU4gVEVYVA0KDQpIaSBNYXJrdXMNCg0KPiBPbiAxMSBKdW4gMjAy
NCwgYXQgMjoyMOKAr0FNLCBNYXJrdXMgUmF0aGdlYiA8bWFnZ3UyODEwQGdtYWlsLmNvbT4gd3Jv
dGU6DQo+IA0KPiBIaSwNCj4gbXkga2VybmVsIGxvZyB0ZWxscyBtZSBJIGNvdWxkIHRyeSB0byBz
ZXQgcHNtb3VzZS5zeW5hcHRpY3NfaW50ZXJ0b3VjaA0KPiB0byAxIGFuZCByZXBvcnQgaXQuDQo+
IA0KPiBrZXJuZWw6IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFlvdXIgdG91Y2hwYWQgKFBO
UDogRExMMDYwZA0KPiBQTlAwZjEzKSBzYXlzIGl0IGNhbiBzdXBwb3J0IGEgZGlmZmVyZW50IGJ1
cy4gSWYgaTJjLWhpZCBhbmQgaGlkLXJtaQ0KPiBhcmUgbm90IHVzZWQsIHlvdSBtaWdodCB3YW50
IHRvIHRyeSBzZXR0aW5nDQo+IHBzbW91c2Uuc3luYXB0aWNzX2ludGVydG91Y2ggdG8gMSBhbmQg
cmVwb3J0IHRoaXMgdG8NCj4gbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnLg0KPiANCj4gQXMg
aTJjLWhpZCBhbmQgaGlkLXJtaSBtb2R1bGVzIGFyZSBub3QgdXNlZCBJIGFkZGVkDQo+ICJwc21v
dXNlLnN5bmFwdGljc19pbnRlcnRvdWNoPTEiIHRvIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGFu
ZCByZWJvb3QNCj4gdGhlIHN5c3RlbS4NCj4gDQo+IEFmdGVyIHRoYXQgdGhlIG1lc3NhZ2UgZG9l
cyBub3QgYXBwZWFyIGFueW1vcmUuDQo+IA0KPiBBRkFJSyBteSB0b3VjaHBhZCB3b3JrcyBiZWZv
cmUgYW5kIGFmdGVyIHRoYXQgY2hhbmdlIHdpdGhvdXQgYW55DQo+IHByb2JsZW1zLiBBdCBsZWFz
dCBJIGRpZCBub3QgcmVhbGl6ZSBhbnkuDQo+IA0KPiBXaXRob3V0IGVuYWJsaW5nIGludGVydG91
Y2ggdGhlIGtlcm5lbCBtZXNzYWdlIGxvb2tzIGxpa2U6DQo+IA0KPiBNYXkgMDEgMTg6NDQ6MDEg
bTM4MDAubG9jYWxkb21haW4ga2VybmVsOiBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOg0KPiBx
dWVyaWVkIG1heCBjb29yZGluYXRlczogeCBbLi41NjYwXSwgeSBbLi40NjQ2XQ0KPiBNYXkgMDEg
MTg6NDQ6MDEgbTM4MDAubG9jYWxkb21haW4ga2VybmVsOiBwc21vdXNlIHNlcmlvMTogc3luYXB0
aWNzOg0KPiBxdWVyaWVkIG1pbiBjb29yZGluYXRlczogeCBbMTM4Ni4uXSwgeSBbMTI1Mi4uXQ0K
PiBNYXkgMDEgMTg6NDQ6MDEgbTM4MDAubG9jYWxkb21haW4ga2VybmVsOiBwc21vdXNlIHNlcmlv
MTogc3luYXB0aWNzOg0KPiBZb3VyIHRvdWNocGFkIChQTlA6IERMTDA2MGQgUE5QMGYxMykgc2F5
cyBpdCBjYW4gc3VwcG9ydCBhIGRpZmZlcmVudA0KPiBidXMuIElmIGkyYy1oaWQgYW5kIGhpZC1y
bWkgYXJlIG5vdCB1c2VkLCB5b3UgbWlnaHQgd2FudCB0byB0cnkNCj4gc2V0dGluZyBwc21vdXNl
LnN5bmFwdGljc19pbnRlcnRvdWNoIHRvIDEgYW5kIHJlcG9ydCB0aGlzIHRvDQo+IGxpbnV4LWlu
cHV0QHZnZXIua2VybmVsLm9yZy4NCj4gTWF5IDAxIDE4OjQ0OjAxIG0zODAwLmxvY2FsZG9tYWlu
IGtlcm5lbDogcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczoNCj4gVG91Y2hwYWQgbW9kZWw6IDEs
IGZ3OiA4LjEsIGlkOiAweDFlMmIxLCBjYXBzOg0KPiAweGQwMDEyMy8weDg0MDMwMC8weDEyNjgw
MC8weDAsIGJvYXJkIGlkOiAyNzMzLCBmdyBpZDogMTUxNTYyNw0KPiANCj4gYW5kIGFub3RoZXIg
b25lDQo+IA0KPiBNYXkgMTggMjE6Mjc6MjYgbTM4MDAubG9jYWxkb21haW4ga2VybmVsOiBwc21v
dXNlIHNlcmlvMTogc3luYXB0aWNzOg0KPiBxdWVyaWVkIG1heCBjb29yZGluYXRlczogeCBbLi41
NjYwXSwgeSBbLi40NjQ2XQ0KPiBNYXkgMTggMjE6Mjc6MjYgbTM4MDAubG9jYWxkb21haW4ga2Vy
bmVsOiBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOg0KPiBxdWVyaWVkIG1pbiBjb29yZGluYXRl
czogeCBbMTM4Ni4uXSwgeSBbMTI1Mi4uXQ0KPiBNYXkgMTggMjE6Mjc6MjYgbTM4MDAubG9jYWxk
b21haW4ga2VybmVsOiBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOg0KPiBZb3VyIHRvdWNocGFk
IChQTlA6IERMTDA2MGQgUE5QMGYxMykgc2F5cyBpdCBjYW4gc3VwcG9ydCBhIGRpZmZlcmVudA0K
PiBidXMuIElmIGkyYy1oaWQgYW5kIGhpZC1ybWkgYXJlIG5vdCB1c2VkLCB5b3UgbWlnaHQgd2Fu
dCB0byB0cnkNCj4gc2V0dGluZyBwc21vdXNlLnN5bmFwdGljc19pbnRlcnRvdWNoIHRvIDEgYW5k
IHJlcG9ydCB0aGlzIHRvDQo+IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZy4NCj4gTWF5IDE4
IDIxOjI3OjI2IG0zODAwLmxvY2FsZG9tYWluIGtlcm5lbDogcHNtb3VzZSBzZXJpbzE6IHN5bmFw
dGljczoNCj4gVG91Y2hwYWQgbW9kZWw6IDEsIGZ3OiA4LjEsIGlkOiAweDFlMmIxLCBjYXBzOg0K
PiAweGQwMDEyMy8weDg0MDMwMC8weDEyNjgwMC8weDAsIGJvYXJkIGlkOiAyNzMzLCBmdyBpZDog
MTUxNTYyNw0KPiANCj4gQWZ0ZXIgYWRkaW5nIHRoZSBrZXJuZWwgcGFyYW1ldGVyIGl0IGxvb2tz
IGxpa2UNCj4gDQo+IEp1biAxMCAyMjoxODo1NyBtMzgwMC5sb2NhbGRvbWFpbiBrZXJuZWw6IHBz
bW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6DQo+IHF1ZXJpZWQgbWF4IGNvb3JkaW5hdGVzOiB4IFsu
LjU2NjBdLCB5IFsuLjQ2NDZdDQo+IEp1biAxMCAyMjoxODo1NyBtMzgwMC5sb2NhbGRvbWFpbiBr
ZXJuZWw6IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6DQo+IHF1ZXJpZWQgbWluIGNvb3JkaW5h
dGVzOiB4IFsxMzg2Li5dLCB5IFsxMjUyLi5dDQo+IEp1biAxMCAyMjoxODo1NyBtMzgwMC5sb2Nh
bGRvbWFpbiBrZXJuZWw6IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6DQo+IFRyeWluZyB0byBz
ZXQgdXAgU01CdXMgYWNjZXNzDQo+IEp1biAxMCAyMjoxODo1NyBtMzgwMC5sb2NhbGRvbWFpbiBr
ZXJuZWw6IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6DQo+IFNNYnVzIGNvbXBhbmlvbiBpcyBu
b3QgcmVhZHkgeWV0DQo+IEp1biAxMCAyMjoxODo1NyBtMzgwMC5sb2NhbGRvbWFpbiBrZXJuZWw6
IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6DQo+IFRvdWNocGFkIG1vZGVsOiAxLCBmdzogOC4x
LCBpZDogMHgxZTJiMSwgY2FwczoNCj4gMHhkMDAxMjMvMHg4NDAzMDAvMHgxMjY4MDAvMHgwLCBi
b2FyZCBpZDogMjczMywgZncgaWQ6IDE1MTU2MjcNCj4gSnVuIDEwIDIyOjE5OjAzIG0zODAwLmxv
Y2FsZG9tYWluIGtlcm5lbDogcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczoNCj4gcXVlcmllZCBt
YXggY29vcmRpbmF0ZXM6IHggWy4uNTY2MF0sIHkgWy4uNDY0Nl0NCj4gSnVuIDEwIDIyOjE5OjAz
IG0zODAwLmxvY2FsZG9tYWluIGtlcm5lbDogcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczoNCj4g
cXVlcmllZCBtaW4gY29vcmRpbmF0ZXM6IHggWzEzODYuLl0sIHkgWzEyNTIuLl0NCj4gSnVuIDEw
IDIyOjE5OjAzIG0zODAwLmxvY2FsZG9tYWluIGtlcm5lbDogcHNtb3VzZSBzZXJpbzE6IHN5bmFw
dGljczoNCj4gVHJ5aW5nIHRvIHNldCB1cCBTTUJ1cyBhY2Nlc3MNCj4gDQo+IFNvLCB0aGUgU01C
dXMgcGFydCBpcyBuZXcuDQo+IA0KPiBIb3BlZnVsbHkgdGhlIHJlcG9ydCBpcyBoZWxwZnVsIGZv
ciB5b3UuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IE1hcmt1cw0KPiANCg0KRm9yIHlvdXIgZGV2
aWNlLCBjYW4geW91IHBsZWFzZSB0ZXN0IHRoaXMgcGF0Y2g6DQoNCi0tLS0tPjgtLS0tLS0NCg0K
RnJvbSA0NjQ1ZDQwNThlMTk2MGVkMjNjZmRlNWM1MjlhZGEwZWQ1N2JjY2RlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4N
CkRhdGU6IFN1biwgNCBNYXkgMjAyNSAxMTo1NTo0MSArMDUzMA0KU3ViamVjdDogW1BBVENIXSBV
cGRhdGUgc3luYXB0aWNzLmMNCg0KLS0tDQogZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3Mu
YyB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYyBiL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3lu
YXB0aWNzLmMNCmluZGV4IDMwOWMzNjBhYWI1NTk3Li43YmViMjdhZmE4MGU4MCAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0aWNzLmMNCisrKyBiL2RyaXZlcnMvaW5wdXQv
bW91c2Uvc3luYXB0aWNzLmMNCkBAIC0xOTUsNiArMTk1LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCBzbWJ1c19wbnBfaWRzW10gPSB7DQogCSJTWU4zMjIxIiwgLyogSFAgMTUtYXkwMDAg
Ki8NCiAJIlNZTjMyM2QiLCAvKiBIUCBTcGVjdHJlIFgzNjAgMTMtdzAxM2R4ICovDQogCSJTWU4z
MjU3IiwgLyogSFAgRW52eSAxMy1hZDEwNW5nICovDQorCSJETEwwNjBkIiwNCiAJTlVMTA0KIH07
DQogI2VuZGlmDQoNCi0tLS0tLS0tLS0tDQoNCllvdSBjYW4gYWxzbyBkb3dubG9hZCB0aGUgcGF0
Y2ggZnJvbTogaHR0cHM6Ly9naXRodWIuY29tL0FkaXR5YUdhcmc4L2xpbnV4L2NvbW1pdC80NjQ1
ZDQwNThlMTk2MGVkMjNjZmRlNWM1MjlhZGEwZWQ1N2JjY2RlLnBhdGNoDQoNCkFsc28sIHBsZWFz
ZSBzaGFyZSB5b3VyIGxhcHRvcOKAmXMgbW9kZWwgKEVnOiBIUCBFbnZ5IDEzLWFkMTA1bmcpDQoN
ClRoYW5rcw0KQWRpdHlh


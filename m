Return-Path: <linux-input+bounces-10596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F009AA55627
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 20:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E81AA7A2373
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 19:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8565925B66A;
	Thu,  6 Mar 2025 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RJnQhCo6"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011028.outbound.protection.outlook.com [52.103.68.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD4B25A652
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287921; cv=fail; b=SU6zEfbc0wCZFItw0+w7DElpo6VY46fJ+WHc1XWiINoPlP2I5xwYZzJ3kllazPElM3rXBogt6UVPoMbAo6EKu3keSeQrV3YmooP8EsH0EIMCxp7CTbxz9ScJ5iUEEaIp8fFcTL005F6+fhURawZVkHbCG/WXXk7i8NMrzv7vPYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287921; c=relaxed/simple;
	bh=dWyIBniPW4mtpURijHIFCZP/L/k6lzyYCiIPjonJIU4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VWfOia3XIzYao3zYmioqik/KfjqFd7xhJI4oFIM6z+KmPctuhbVylKAr91nHwcWrrmxMXTljAMd/q3Ypzz4fvPPkvfJ3Ej16W+BYTHKJd1rmpt8P6gMvv4l0r7PqQToItnwXBwZ1tBIVk9/o/ka/iUviwxpfHGb2QcZB4w2PHKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RJnQhCo6; arc=fail smtp.client-ip=52.103.68.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHMKkQmk22aa1YBD0jMP023cOo1RvSYs+nDIGFpEN70DRFaYDsBbrIdffYzTigGKH9eF8WvePGlDTm/VpGOThSH3vmBqtTruIonLs/7fSDrTecYdC+c3Um1Dplu+vLaRrBrm7nzva9b9benOLm7i55l2llVrwprKdNYV+YFE8TzmxHT5hFpjBEdUsni8NNFm+VCax5OttPCeK2gBBbdyBsoAriDRQopmcuItfrdSKUAS/G282EVowrc/GqwJeXxevLEeXKi5zgKphf9KXHSNCanvW81OkVy3WdXivfSvfK1kPbXU5wofN7Upl6Zzjx0ibVqXPulGBKNqLqN1v8LKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWyIBniPW4mtpURijHIFCZP/L/k6lzyYCiIPjonJIU4=;
 b=jFoGGg3aZl2ilEtfS5VMw1+RC1cQidegr8a/1+iSpweTavoykFgig8WOWQ8exq8ngvf9jg7oJncw/D/vcfQHRuZmMyGiYr+JboTJgzCNHiN8fdviXwRx3cctt0HhE0plteLQQExmeukB5ywb/MzoTYot2SPPPE3WI9LQBR+18uE5A+6oeKSrWuYfXv0VJURHfRSncFTR+q1MgvAgiliw1rF/DlPz2FCPIIoSjz1nGRl4joAYeQ3YqqcVk3rpAnzyJt29qf5a33qIxR9XXf+yr2vH0SCULShwfB/fA7yjRFj2vE8xYMcN3zaN1QybZQ1i3ueGtaDooa3MWyukNfRlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWyIBniPW4mtpURijHIFCZP/L/k6lzyYCiIPjonJIU4=;
 b=RJnQhCo6kBUVwHyUH9I15gZIv3JUVP1U9u+NnHyw3fdUaUzGPNo9GpzFLmq7UKJvpg2V47AeTocd2KVfNLMHYOA2vCVeevVlYR9AiPnYeOaaQChuEGSDgL2uzE9MbqErDGlw/HGyXy2xQGF+HpaPryPR0ZuXtz/435SHJ7tSe3F82bW05x17rlZyhsIZYZi8G/7UYnwaOZoc4mkpP1WxBtE8n2DMLxRGT3SOJOpE2NXIpUdXGeVfImETjrQqHKaxx19zLDyPc7z8Wv27HeLADNBtgGRoIUw0mpfk2czDp00LOabniNqZPFg1uNvcbxDUqjxkk9Aul+v5CDR1HR3Iqw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB6852.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Thu, 6 Mar
 2025 19:05:15 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 19:05:15 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Grigorii Sokolik <g.sokol99@g-sokol.info>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Topic: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Index: AQHbjsktiTHRxGBV1Ee2CRRU/jlylbNmd8KA
Date: Thu, 6 Mar 2025 19:05:14 +0000
Message-ID: <C5E429C3-4838-4A9A-9D61-4138FD14BB6E@live.com>
References: <20250306070027.532052-1-g.sokol99@g-sokol.info>
 <20250306070027.532052-2-g.sokol99@g-sokol.info>
 <31E267B8-6B70-46F2-873E-4E58478E3C93@live.com>
In-Reply-To: <31E267B8-6B70-46F2-873E-4E58478E3C93@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PNXPR01MB6852:EE_
x-ms-office365-filtering-correlation-id: 2557b462-05de-45cf-3eb2-08dd5ce1d3eb
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|15080799006|8060799006|461199028|7092599003|19110799003|1602099012|10035399004|440099028|3412199025|102099032|4302099013;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2d6QWdVZXVKU2RsS2diU1NFNHYyZklRekQ4Z1NHaHRaNDdsUjJlR3Y5cmUv?=
 =?utf-8?B?M2kyYk5Rb2cxMXBaMGtnWWZiN2tkMEUzR2ZQbGtweEt6SnRzQ1dlYTRyYjdh?=
 =?utf-8?B?YVl6VkR4akM0S2RyY3dVY0xQMzNYU3Z5V21JaG1rb05sVmhmVHFkRk5TSE5v?=
 =?utf-8?B?SG1iemtNVEwydXNUY3lyQUY1TnNYeFllRU5ybHk0RUlyMDliRHVVYXovTFFQ?=
 =?utf-8?B?Z0sxUmM3MEJsR1pTbUNpdWRuQlZxa3hDVThZS2dPU0d4WmIrMFJyTHMzVGpV?=
 =?utf-8?B?TUNFQTh3ZnJ4cnI5UHdGS2ZhOGUrK0dIYjA3Y01HS2R3TzdDU0NXdzdVenpB?=
 =?utf-8?B?ellDUnlTcWx6WUpuSXlZeFU2K2xCOTBSeTQ4ZmV1N1pGYW5aOUVrekdXazFm?=
 =?utf-8?B?SmlQVFRZckw1cy8rejF2c0lzaGJRc1NPQlZ6V2dzZTltWEs5K29MclIxeC9J?=
 =?utf-8?B?N2RKZWhmTTJNLy9mamdsTVQ5a3ZYQ1AzdCtQWU4vblNrSEt5M2gyZFFMRFVt?=
 =?utf-8?B?ZHg3YWxFUkswYkxHdXIzTnBJSE4weWx2VFJNNU9wU3Z0MHZRaDAyOVptcTlX?=
 =?utf-8?B?cnVtL1VqT1dsOVFvUlFnclljU0pZV1pYeWl4emRHbU5nL2pBWHU5TlYvRWQ3?=
 =?utf-8?B?WnBRT3RpYm96NCtpcEFRSklVL1RZZnFtZUVHdUIxZ2hJQWtQY2ZIWlBkR3FC?=
 =?utf-8?B?aEp1dms3TVBSdERpa3ZBNUNscWtIaWRvZmg0SFQrNnVaREN2bzduVFVzSHk1?=
 =?utf-8?B?WFMvcjRTODMrN0dRb0N6ZTJiQkJ6ajh4aUxVbE1ZK0hocVhCZ2UvbWFtb25U?=
 =?utf-8?B?VlNkNEZTUTdKS2V5SGpxYVQ3V0hpajU0TnNFRXFGZ0o5NnpYUGg3a0RwUFFP?=
 =?utf-8?B?NGFoNXZ1Y1A3NEdwTlBxbStMbVB1V3BmQXhuWEt1bm5pL3hrdnJJWkRHcEh3?=
 =?utf-8?B?bGs4M3dkSEJ3UGxoM1QwaTRadmN4SWVrNSs1WVdScktTOUdaVUtxUEQzbGwz?=
 =?utf-8?B?ZHdRcThpWEptZ3BTeTlkMGJyRlVKQ3BQZUxhdXp1WHhVS21GT2d4Yyt6YThS?=
 =?utf-8?B?WTdhc0UwMCtRaUlpaGUvUnEzNDgxTVQ5ZitmeGI4YnZLSko1YTRuTkhibTl6?=
 =?utf-8?B?V3BxL3drYXVrdTZmeUM0VGo1NHVFRWl1NVZRZXVRcitsdWJkYnB0dTJSbnp1?=
 =?utf-8?B?bm9MYlhNTnhyU002ektjMFBzQTFmVTN2UGtNWUl5ZlRIbGdiZTNGdFhxWlpx?=
 =?utf-8?B?Q21kTFVxMlZlY2NPekVERGJrYi9mcEdjenN4N1B0MnhTY2c3UmhMOXRocTBs?=
 =?utf-8?B?OElLS1ZOYWZ3L1ZmV1hRVVFZdHlva01nLzdnM3FMNkJXQmlWbnpQK3p2K2lL?=
 =?utf-8?B?d3l4a0N1V1lKQkVTWVIrTUpGQjNuUURwbjlja1NDN1VLakZkLzNwWDZ3V1pP?=
 =?utf-8?B?TzEzVG1KNVBVaG92bFpKZWVoMjdWMkpvQVlXdGZKdVRiUjhCVGU0dC84ajRW?=
 =?utf-8?B?a016c3hHa1YxQjBzZ1ZvWWRvcXd3SlJLUVYyN2szSXVWeTJiOTNLZWtQalJ6?=
 =?utf-8?B?aEpEZXQ1b1ZnNzQrMFlWSXhqYjkxRlB5bVlkNnBvbmNURW53NnkrWitud2Qv?=
 =?utf-8?Q?ttD6/zj1MymA/pem154rmXCKOvfXyLtGjopEgQr587/U=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEhGcjFqbU9sbU5iSnhuaVZnbzMvRDErVGV5UFVzV3YzZFh3WXI0aitFT1By?=
 =?utf-8?B?djVVMTlZbnFLaEJoaElja1ArYjYyUkhDZ2hDTUpJUU1VUXZmSlBjOVlodEFu?=
 =?utf-8?B?MTBHREI1U1E0TnpnUFY5Qy9QcUNHYVN2L0YzSU9FVzhVZU53V1dvMTVkenhj?=
 =?utf-8?B?RGI0ck1EN0VYNXJYOWgzOFpjSGRVOHZaUW12OEZPRkprT0RLUTM5b0pFRUQw?=
 =?utf-8?B?eFhxTThWbWRydWJ4d210Y3ZnQ0xROThtK3ArNHAxMFl5aEJkYnpyb3JRWHMy?=
 =?utf-8?B?dUljT2RDMUR1czhhWmdSSVVyUEVYRVkxZVhiTkhMUE81VG5Rd2dubVBxc0JU?=
 =?utf-8?B?ZzFtcW5xeWRYRTF6OTVhbkZFWExQa0RGSXdEeGRMaG9kRmJQQ0ttNEhKQXM1?=
 =?utf-8?B?OUZyY1lkU040VUlsd1BUaXJBSUpKZEx6L0dQb2dXSmdCUGR0dVhFY2Nyekhs?=
 =?utf-8?B?bHQ2bWR4RnBwM2JSS2FRNjlzVytEWkpWQ1FWZnd3aXhBZzVlQ3p6QSs2dmk2?=
 =?utf-8?B?ZkRqME1zZjVQMFdqOW1GMGdrenFaQWo3alRJV2oyMDFEb3BxaWhHL3B6Z1gv?=
 =?utf-8?B?OU0zVUEzSk9QNjU3K3hWUlZUWDh5OUtRUC9oVDBIVWtaM1BPUGdXSjExSnNZ?=
 =?utf-8?B?RUZpK0Nwc2Z0MktIRnVsSXRIejBtaVNPa3plYTV2Nm1JMy9CTE85NUVxdlgy?=
 =?utf-8?B?bEswaUJHY1JwWnVTMzVOZ0VyMkc2MUl5eitDakhiallxVndkNU44SDdmSSsr?=
 =?utf-8?B?dWRvOThjbGxpc1pNbW5rNGZud0ZzeDc2NjBYK0ZpL1hLU05PeTBZTXgrQlVl?=
 =?utf-8?B?L3NPS0p4M2wyYmlFa2Vzc2tSZXk2SDl3Y2l0cWU0bS9EV21pTzhKRklFQTRQ?=
 =?utf-8?B?YVE2N2dtbSswN25RSnBsbDUzaThXRXNtbjg1Y1M0c0lLSVVWU3pSRFdXMnh5?=
 =?utf-8?B?OS9RcVpXcWJLeS9pbWJlTkRzazFYR3dZUDFaM3Z4bkFlMlJodFBTRFhFZlF0?=
 =?utf-8?B?VEFmWUVRS005MGtFMldJUGdXOHpxUXZsSGhFa2lnbU9zWnlTYVVCeEcwbk9q?=
 =?utf-8?B?ZUVKdzNpTW9QaGM0RHVtenkyMGIwMHhnUTBlSEtNVElCNzlHaC9Hcmh2Mldz?=
 =?utf-8?B?TXF1Ui9oeVB5ZTN2NkpnMzRqODdoQkV0VkVwT1pKNExkWU52amRBTXlsZ1di?=
 =?utf-8?B?TDBaWXV0V0pqMDhPSzZkYlZMdkxOY3BkditWRm5nbkpXNEQvd3cwQWY0ZVg2?=
 =?utf-8?B?SXdFT3BMdWZvcHNHeTc3dDdESkZBZTRqYVlPbXcvTlRYSFo1L3NYanV6MXVz?=
 =?utf-8?B?bHh6bFdRNkllQ1NldHFDVnRRUEpPUUI1d21oc1JPdUtPRkFuRGVpbUVPVUQr?=
 =?utf-8?B?eEhpRW1PT0VWVGwxWGRJMmRuM05nSEl3RFlRZFB0cy8xNzltdEMySEdJMkNN?=
 =?utf-8?B?dzRBYzI0Q0JYMVFtMEE2NVZLUDRuSGhhQ0xNeGd4TTNYNFduNitBeVdGMXdC?=
 =?utf-8?B?amFUM2VML2RZTWpFMTF1TmdMRWZlUHpyRHZPYlh0UkV0eEsxUTJQY2pYWTRF?=
 =?utf-8?B?TklLd0FkcmpQblA0RHY4RGxieHRvc0lwVjEvbVRUbFlYUU5tMCtzZXRFbk5Y?=
 =?utf-8?B?b1RtVnRHU1V5cjk3N0RNSERuWHNZQ2JLWWlyVzJaallxYnc0Z3dhanAwdUVm?=
 =?utf-8?B?YThlaXVDeW9lWDhhc3YyaTNIc2ErSnZuZncyV04xTkZmMDN2WHdjanVheTFK?=
 =?utf-8?Q?0TnoIbiH1VTvL/pQEEuZQbvRxKQ/w8EvFfffvOT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A141EA730B31944BAF1A72AB4962FE8A@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2557b462-05de-45cf-3eb2-08dd5ce1d3eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 19:05:14.8802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB6852

DQoNCj4gT24gNyBNYXIgMjAyNSwgYXQgMTI6MjTigK9BTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiA2IE1hciAyMDI1LCBhdCAx
MjozMOKAr1BNLCBHcmlnb3JpaSBTb2tvbGlrIDxnLnNva29sOTlAZy1zb2tvbC5pbmZvPiB3cm90
ZToNCj4+IA0KPj4gQWRkIEFwcGxlIE1hZ2ljIEtleWJvYXJkIDIwMjQgbW9kZWwgKHdpdGggVVNC
LUMgcG9ydCkgZGV2aWNlIElEICgwMzIxKQ0KPj4gdG8gdGhvc2UgcmVjb2duaXplZCBieSB0aGUg
aGlkLWFwcGxlIGRyaXZlci4gS2V5Ym9hcmQgaXMgb3RoZXJ3aXNlDQo+PiBjb21wYXRpYmxlIHdp
dGggdGhlIGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIGZvciBpdHMgZWFybGllciAyMDIxIG1vZGVs
Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBHcmlnb3JpaSBTb2tvbGlrIDxnLnNva29sOTlAZy1z
b2tvbC5pbmZvPg0KPj4gLS0tDQo+PiBkcml2ZXJzL2hpZC9oaWQtYXBwbGUuYyB8IDUgKysrKysN
Cj4+IGRyaXZlcnMvaGlkL2hpZC1pZHMuaCAgIHwgMSArDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiAtLS0gYS9kcml2ZXJzL2hpZC9oaWQtaWRzLmgNCj4+ICsr
KyBiL2RyaXZlcnMvaGlkL2hpZC1pZHMuaA0KPj4gQEAgLTE4NSw2ICsxODUsNyBAQA0KPj4gI2Rl
ZmluZSBVU0JfREVWSUNFX0lEX0FQUExFX0lSQ09OVFJPTDUgMHg4MjQzDQo+PiAjZGVmaW5lIFVT
Ql9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfMjAyMSAgIDB4MDI5Yw0KPj4gI2RlZmlu
ZSBVU0JfREVWSUNFX0lEX0FQUExFX01BR0lDX0tFWUJPQVJEXzIwMjQgICAweDAzMjANCj4+ICsj
ZGVmaW5lIFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfMjAyNF9WMiAgIDB4MDMy
MA0KDQpBMzExOCBpcyB0aGUgb25lIHdpdGggVG91Y2ggSUQuIE5hbWUgc2hvdWxkIGJlIFVTQl9E
RVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfRklOR0VSUFJJTlRfMjAyNCB0byBiZSBtb3Jl
IGNsZWFyLg0KPiANCj4gSXTigJlzIHRoZSBzYW1lIElEIGFzIFVTQl9ERVZJQ0VfSURfQVBQTEVf
TUFHSUNfS0VZQk9BUkRfMjAyNCwgd2h5IGFyZSB5b3UgYWRkaW5nIHRoaXMgYWdhaW4/IFR5cG8/
DQo+IA0KPiBBbHNvLCBwbGVhc2UgdXNlIHN3aXRjaCBjYXNlLCB5b3UgY2FuIHN1Ym1pdCB5b3Vy
IHBhdGNoIGFzIGEgcGFydCBvZjoNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWlucHV0L0E1MEMxQ0YwLUI5MjctNEZDRi04MjhGLTFGNUY3OUJBMzc2MkBsaXZlLmNvbS8NCj4g
DQo+IEp1c3QgcmVzdWJtaXQgdGhvc2UgMiBwYXRjaGVzIGFsb25nIHdpdGggeW91ciBwYXRjaCBh
bmQgbWFrZSBhIHYyLg0KDQo=


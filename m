Return-Path: <linux-input+bounces-12136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE70AA8452
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 08:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9C5A1795A7
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 06:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC05C450F2;
	Sun,  4 May 2025 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="PVCKCPVs"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB72941A8F
	for <linux-input@vger.kernel.org>; Sun,  4 May 2025 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746340489; cv=fail; b=RpDsMIDK+fBN73FKxdTzKv4xliVK7oY3d7XshdHNso0D3MBYWvPmyy6gFm/iOzxwZQjbheDKloavNDdfuelm8lnSkS1p0ACufKR2orYkRm4FOe5kMAao63vfyvoPkt9cCUSYUR7tw5rlM+a29SOd7Ia/40OUVXCe+plL7ddx2wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746340489; c=relaxed/simple;
	bh=vV7QLH4v0gFO43KBKp/PG3VKvjwEd5oKg0vFkTcUIkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eYAbioepHdD8ypupmsWicRDLUXcZLHME0JQXhzN80wVatDTu6YUBizP3GQOynqRSnwdY4ZPxQrqYnDiaTm66n1zDz71KvgnL7ierFMeK719BvqRC+UMsK0F0aFdAI8U/iNutb1UoLJEVZ1CGQWt8wkWa7bLu0crS0vKwg1Za75M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=PVCKCPVs; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNcbrNBgxsgXoJd30WWhPDPLT1xDeufEHQurwibMLP69ye0Ts8NGtZT4pxLYI/lQxPVo06ivSXRvWbgjf7nQQ7SfdxPXZqLKnLZ52EtOHiL6CNxc5HRGUeIf4HAO22/2qL4y/gSDfDlqQ9ataFq5nCO6yRbUz1UV8tru5DGGhccTla3yO6bhK9ymUMd3cDTrfUvTP6RwGSYsLWvGQJYVdERNAMJ3G1ZSEb2xJCTibyoxma7eOG8X4hZjSnha3Gc94Ao4367B8iqONkjoTrb86e6ophHUJng/0OrzQwtVUumf31FZXvC5d42oMAN4wOQpDvU5sJ4gfMVw0vCibxjCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV7QLH4v0gFO43KBKp/PG3VKvjwEd5oKg0vFkTcUIkI=;
 b=DfrAIbWA0gnlms9Sx8DUZPbbO1kTIunK8HJS9WWVfRkhAYsHRALm9FfzOUyBF1mWeB+QyvkSM4XWmL/xY6LrscSJzxjScreG48Is/hHAzMuYQff0GE5H1dTQImSq3R9EU46RCfeGklQJSF4KbGPUpX7KEuPyVsHvxMvQYqwwyhN3XdhCqgH8tm/I7RQsFnIW4eaL4m0yWUh0xAmJShUHZPRf32mjvAvzmo/1iEXtW1+WjLEIZmP/vmeG/AGL3aQldSef8Mrol4rpM74iRKFhBd2+gNwGtmC4uwNHqXrZVQhUnDF7SBd82hcLq+ixFnIanz5+qgQBlgaQQ/iNXraJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV7QLH4v0gFO43KBKp/PG3VKvjwEd5oKg0vFkTcUIkI=;
 b=PVCKCPVsiKskijp7IP+AJRc5b52yqV14u0LLwpy9/TBAVuDLaKGf8fqMeQfzTNbpEhDpLCm9UWWY/NSJsh/Qh7czt+KHIgZcuCX2bJBoJrnw+gOKarmFSidMxr6dJ6XVMxZYNzJunrAY4W0zV5CEsY83FDiGXMnwjWhaPg6S2mTZ8FVqyLmutenP534MresApCI6HzviMkcs7Ww4xn/dEActEkdLPhdZp1Mkra8yV6CFYd3UaJUIwZQUv8n5iv0N0wcvaV/xz/QkGYbeybCK4lyR89tmm/olssfEluay3leKMQmIhh+Hl2vlE1pcQI7ii/zBF4is3Hyw7s6n/s5DnA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6885.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 06:34:43 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.019; Sun, 4 May 2025
 06:34:43 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "arch.hias@eilert.tech" <arch.hias@eilert.tech>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: Synaptics touchpad not working after suspend,
 psmouse.synaptics_intertouch
Thread-Topic: Synaptics touchpad not working after suspend,
 psmouse.synaptics_intertouch
Thread-Index: AQHbvL6e6Vk9h4bUOkmFdhF6ptfePg==
Date: Sun, 4 May 2025 06:34:42 +0000
Message-ID: <3530EFD3-68F2-4890-9ACB-EF963769D079@live.com>
References: <325001b5-12e3-42db-96ec-05bd3f23ab35@eilert.tech>
In-Reply-To: <325001b5-12e3-42db-96ec-05bd3f23ab35@eilert.tech>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB6885:EE_
x-ms-office365-filtering-correlation-id: af4feaba-9583-41fc-3fc8-08dd8ad5c127
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8022599003|461199028|8062599003|7092599003|13031999003|8060799006|19110799003|102099032|1602099012|3412199025|440099028|10035399004|4302099013|34005399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGE4c1cxMTl0ZGYxMG9ZWHR1UDRvQzV0eCtneUt3M2R6cHZwSDdZRzdpcW54?=
 =?utf-8?B?WGRHVFNWTGZCQzFyKzU0dTBmclZPZXp0M3JmTG1Nd2N0c2d4THhlZDlReS9G?=
 =?utf-8?B?enhTMmpmRmcyc0hKQUNCams0MUZhVlRGMWRuYXNvdFlNcEVWbXFLK01ac2JK?=
 =?utf-8?B?VjRMNWp3KzJJN0ZOU0hOcG5vNHNpbStCRStTWHhsYi94VEZYR3JEc1h2eHcx?=
 =?utf-8?B?UUtWNTFMV1YxaWR2alVLdzJ0a3F2N0tqR2F1VDF5NnRDNU9DRENHR3YvSUpi?=
 =?utf-8?B?QTljaERwWWREWGwwOW90VVUva21DUTdlaTllY3NaMHFodjFYa0ZNWVBXdmQx?=
 =?utf-8?B?Y2NESURZWHNZaEhaR2U0a0s3d3NvWVd0bFVwVUl2VW03S0NlVGJsck9Wbjkr?=
 =?utf-8?B?S0hWUDFLL0U0UWx5Um9ma0R6alFoekthT3AwaURLMVpPZjluTzRERnFzamk2?=
 =?utf-8?B?QjhIR2ZFUEpVcHlSSU9ZQlBKbERGeW5zMjNiNnM2ekFpZUYvemZXZWhVU3pl?=
 =?utf-8?B?L2FVTy84Snc4Zm5WN3Y1Z1JFRjhSQld2OFNoZmlkVFh0M25scHp1TFRiZ3ZH?=
 =?utf-8?B?L2FDVkRYVUNPQ0RLMStxLzJwWVc1QllBYXFhM1RhSWZYYkVkdWNzTjhGTUE1?=
 =?utf-8?B?YWtMek9UVFBZU1ZBWFp3MUUweUI2RkVMYndjeVUzR0NlYlVyYmFZN3k2V1Za?=
 =?utf-8?B?V3BiRTJmS20rQXdwYVdmZ3QrT2lySDdNUU1Nd3VDY25RQVU0TVNWR3htd29l?=
 =?utf-8?B?NGF5RVZ1L0VNdFpHSll2bFB6dmtvOUtMbEhaN0pRbGlYVW13c21vcmlXbzZp?=
 =?utf-8?B?MmJ2L2MzdVFPYTNEekdFMHIwVFllcHhSdXVqcnhUSmMzNXBHZUMyR1JqUG1J?=
 =?utf-8?B?Q3Q4cFpWdkYxa2g1dkt3SGkzcURXVG9hZWZScHY0MUt5S3htUlBXTFI4aXNa?=
 =?utf-8?B?blMrSWx1R3NZWmpDbUJxRFhKZkJBdVhMaC9LSSszMmVJRjkxU0NTTCtkYTNr?=
 =?utf-8?B?eXZxdjBUemhZaTBtZTJRbnFWd0xoSzJINVBSbzZnRFhOZ1p5TTl2WUYxV0pu?=
 =?utf-8?B?SGRjTzZNcGVLc1BuT1BmbDR4Y3h2ckpnc0NnYTliMW9Qbnozd2RlNnFneTFa?=
 =?utf-8?B?Q3JMbUJQWDhOT1o1c3pqQ013YjZmY3ZoYVB1bGFoL0tMc1J4ay9VWU5ueW9U?=
 =?utf-8?B?c0FBWlJZM0xINTNJL2QxUkJtWHhudkp0K28zcGpBa2x6MTdNaVQ0cytDSnVr?=
 =?utf-8?B?eUlXcVk5WHVselVOVTdUTDFLMGRQa1VUWEMxTDBpL0U1WU5Od283OTZSUGFV?=
 =?utf-8?B?RFNIUDYzTFBzbjh5TXMvUnluSnJXcml4WUczN3Nla1U3UTAvdFRUOXBKWExh?=
 =?utf-8?B?U1hHUGVYWkYwbU9ZdzA4Tk9lK2FkU2pGcDJGWjdzenpPeDVXM3BMVnY3UlRZ?=
 =?utf-8?B?bEp1QllEZVFreUNYUU1BRkE2eFlsZ3NKbVAvTWFKMGsxWTZhWWErV2hHSG5w?=
 =?utf-8?B?Vm9QTzg4WnhXMEdGcVgyTnA0UFdycTRxMzJsTTEyeit1ZU5tSGdnTktqTFNl?=
 =?utf-8?B?V255VUpMTUNNNzZ1RUpaKzZFYTFVQXFINlJHREh2TzNnY1hVVTJ6QnFRQ3U5?=
 =?utf-8?B?b1NDY3ZKU3Z0aEhFazBLK0RsUFovOUNkWjFQd3U5SG5XdGpoYmJuS0lTOXlo?=
 =?utf-8?B?OUpqc2lhL1ljb2VyMzBvaGsyV1lJcE1Tbm1GYjhHZm9jS0ZMUFlXQU5FUXJB?=
 =?utf-8?Q?kkHHN7LxvEgD/KWTQezXzSTaU1P27L4+8ASqX4f?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWVjTFpHMk1UV3RmVnpIS2x4aGJIU215SHphV0EwQVNYYUpGcDNpTzVPTDNy?=
 =?utf-8?B?RFBjZFBMWU5UTE51Yjd6dHV3STdkT0xNUWhTcXFsMEdEMys3a05QYk4wRzZu?=
 =?utf-8?B?dklua3A5V2k5eVVKS0c2VGllak5mYWErSWNqTW41YThRVHB1TWpTamRoaDdy?=
 =?utf-8?B?dWlaNVdQM2lWTGJXV2Y3b08xMDk4WUdOOEpnQXEwN0JUejk5L1JwN3dUWklq?=
 =?utf-8?B?U3UyTmZwN0VNWVlpWWppMTZ0TkU4NXZZNDBtbUNhNFpNUlJsWVlhYTZ0Y3c5?=
 =?utf-8?B?K3hlbjVzaCtIaVg1ekdWTlFJVW5USXhrYjNIajhRcVYreTBaSjhCamNUb1RH?=
 =?utf-8?B?Y1MrV01pSUJtTGdFZjUxbFp4cGVROVFTYnBWK2FYWlFmT0xLZG1EcGhCcWdo?=
 =?utf-8?B?NW4rbnRySkdvU1Z0cC9TVG5pbGMzdXpJa1ppdk5TbVJYYTdDTzZkckhQelJV?=
 =?utf-8?B?QVVzREFjSlFYS3JXaGFTUi81clV5Zmc0TFJvanBYdUNwV0d6V1h5OFZla2Vj?=
 =?utf-8?B?LzNNK250bTdjSUNtK1RrYXUxemF0Um9DNjErL2ZaeHFmNTR2ZUM2dkhlSWFo?=
 =?utf-8?B?UjVrdlRpMExuQXY5QmVjWlRjWFE1L1NzSURqNTV1akhlZFdyNENTQXAyWDF5?=
 =?utf-8?B?bmZQVy9lWmxIY3dxbWZGbnJGKyt2azZLZVRlaXlSRmdwR0E2Ny9QN21ibDZv?=
 =?utf-8?B?ZHlsT29rSjVieFhWZzY0MktIMmM1Ym1ZSGVRejF2aDBRQ1RaaWtIR0NrQWtH?=
 =?utf-8?B?S3I3eml4SXBCbVJaWVlWRjZaWnd1UG42SUpSUWZMK1FMQ2liZmI2a1Y2dEg5?=
 =?utf-8?B?TkR6dFB3OXFERWhXODJ1VjNEQi9wbWJpTU9CQzRJM25xNGxvTGpDYXl0RWRr?=
 =?utf-8?B?UmQxV1pyZHd3cWRSOW1mRTYvLzBkS05zVTdwUGhFN3RmZk0vQTZmOUl1RWxB?=
 =?utf-8?B?dm92Tk9uUmI4SVBWZEkwRFppTk9sQ2Z0ak5oejhVUzdMNkRndnFIWlZhNnUw?=
 =?utf-8?B?SUt1NXdDTnpjTEVGV0ZFQ2tXREZIK0FDaHhkSSs5QnAzWkpXTWxXVkpmcTl4?=
 =?utf-8?B?VzBaMFB6aDQ5Y3JoRWlicjFWU0RCSnhOUnNja0JZcmJwUm9NdFNDV0oxR2Q1?=
 =?utf-8?B?MVJWUHhFbHUxbGJGeVEwbUV1N2FKTDJVNlRNay9hL0JTSTFUdFNIbHJ1dXdL?=
 =?utf-8?B?TXdNUkltTjE1RDJTZjFzdG0xVmRIR21RNHp6QmU5YzNOeVhucU5pbHVhUnU4?=
 =?utf-8?B?UEVuS1VSalQ3eXpnRHBmanB1b0dpbE1PRlBHQkhUMWlhODdLSDVONS9hL2ps?=
 =?utf-8?B?dCthQVE0UHZaTnFTdUc5MGxKcU5lcWtEZzJMUnBEZVNvclZHb3haeEFZY0Mw?=
 =?utf-8?B?TE92aWdZNHcxTmQ4aEdjSEpKK3YvWjQydm9KRisxUCsvbmtVTmhvNVdhRUtx?=
 =?utf-8?B?Y0l1OHFYdjJrRXZBUHc0RjFmd2ZZS1hUMDU5d3FVb2V5ZXU4akNNaXJYdUg4?=
 =?utf-8?B?YThyU253Yi94YkhsR1h5bXgvUWFOeHQ0cTljdTR6K0tMUm5XSE5teGlJWGZh?=
 =?utf-8?B?aGd6UkpLS2FuQ3JNSEhSSnJhR2NBekpSdnFrY3pwRzZMNXRmN25aTHIyTFVS?=
 =?utf-8?B?NDVZVmxWZStha0xESFlWRW80aGFUUnlLZUY5UzVtSmFNTFEvTXNDWjJkNVky?=
 =?utf-8?B?dlpzMkRSMSt2dnd0K0h1NE1QNXpNd0JMMTVPNnlpQjhlY0o5ZnZCR2ZJNWNH?=
 =?utf-8?Q?pH3edBSwfpETo/6qH6040DpSUMN5ixfSEVNOGcX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85BF295F714E62499081116A2F354275@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af4feaba-9583-41fc-3fc8-08dd8ad5c127
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 06:34:42.9409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6885

SGkgSGlhcw0KDQo+IE9uIDIgTWF5IDIwMjUsIGF0IDE6MzTigK9BTSwgYXJjaC5oaWFzQGVpbGVy
dC50ZWNoIHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBJJ20gZXhwZXJpZW5jaW5nIGFuIGlzc3Vl
IHdpdGggdGhlIFN5bmFwdGljcyB0b3VjaHBhZCBvbiBteSBsYXB0b3Agbm90IHdvcmtpbmcgYWZ0
ZXIgcmVzdW1pbmcgZnJvbSBzdXNwZW5kLg0KPiANCj4gVGhpcyBiZWdhbiBhZnRlciB1cGdyYWRp
bmcgZnJvbSBsaW51eC1sdHMgNi4xMi4xOS0xIC0+IDYuMTIuMjEtMSBbMl0NCj4gDQo+IA0KPiBI
YXJkd2FyZToNCj4gLSBUb3VjaHBhZDogU3luUFMvMiBTeW5hcHRpY3MgVG91Y2hQYWQgKFBOUDog
U1lOMTIyMSBQTlAwZjEzKQ0KPiAtIERpc3RybzogQXJjaCBMaW51eCBpc3N1ZSBiZWdhbiBhZnRl
ciBzeXN0ZW11cGdyYWRlIGxpbnV4LWx0cyAoNi4xMi4xOS0xIC0+IDYuMTIuMjEtMSkgKGtlcm5l
bCA2LjEyLjI0LTEtbHRzKQ0KPiANCj4gRGVzY3JpcHRpb246DQo+IEFmdGVyIHJlc3VtaW5nIGZy
b20gc3VzcGVuZCwgdGhlIHRvdWNocGFkIGlzIG5vdCBkZXRlY3RlZC4gSG93ZXZlciwgaWYgSSBz
dXNwZW5kIGFuZCByZXN1bWUgYSBzZWNvbmQgdGltZSwgaXQgd29ya3MgYWdhaW4uIFdoaWxlIGNo
ZWNraW5nIHRoZSBsb2dzLCBJIGZvdW5kIHRoZSBmb2xsb3dpbmcga2VybmVsIG1lc3NhZ2U6DQo+
IA0KPiBrZXJuZWw6IHBzbW91c2Ugc2VyaW8yOiBzeW5hcHRpY3M6IFlvdXIgdG91Y2hwYWQgKFBO
UDogU1lOMTIyMSBQTlAwZjEzKSBzYXlzIGl0IGNhbiBzdXBwb3J0IGEgZGlmZmVyZW50IGJ1cy4g
SWYgaTJjLWhpZCBhbmQgaGlkLXJtaSBhcmUgbm90IHVzZWQsIHlvdSBtaWdodCB3YW50IHRvIHRy
eSBzZXR0aW5nIHBzbW91c2Uuc3luYXB0aWNzX2ludGVydG91Y2ggdG8gMSBhbmQgcmVwb3J0IHRo
aXMgdG8gbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnLg0KPiANCj4gSSBoYWQgcHJldmlvdXNs
eSBzZXQgYHBzbW91c2Uuc3luYXB0aWNzX2ludGVydG91Y2g9MGAsIGFzIHJlY29tbWVuZGVkIGlu
IHRoZSBBcmNoIFdpa2lbMV0uDQo+IEFmdGVyIGNoYW5naW5nIGl0IHRvIGAxYCwgdGhlIHRvdWNo
cGFkIG5vdyBjb25zaXN0ZW50bHkgd29ya3MgYWZ0ZXIgc3VzcGVuZC4NCj4gDQo+IFRoaXMgc2V0
dGluZyBhcHBlYXJzIHRvIHJlc29sdmUgdGhlIGlzc3VlIGZvciBteSBkZXZpY2UuIEkgd2FudGVk
IHRvIHNoYXJlIHRoaXMgaW4gY2FzZSBpdOKAmXMgaGVscGZ1bCBmb3Igb3RoZXJzIG9yIHdvcnRo
IGNvbnNpZGVyaW5nIGZvciBkZWZhdWx0IGhhbmRsaW5nIG9mIHRoaXMgaGFyZHdhcmUuDQo+IA0K
PiAjIGxpYmlucHV0IGxpc3QtZGV2aWNlcyB8IGdyZXAgU3luYXB0aWNzIC1BNA0KPiBEZXZpY2U6
ICAgICAgICAgICAgICAgICAgU3luYXB0aWNzIFRNMzE3NS0wMDINCj4gS2VybmVsOiAgICAgICAg
ICAgICAgICAgIC9kZXYvaW5wdXQvZXZlbnQxMw0KPiBJZDogICAgICAgICAgICAgICAgICAgICAg
PHVua25vd24+OjA2Y2I6MDAwMA0KPiBHcm91cDogICAgICAgICAgICAgICAgICAgNg0KPiBTZWF0
OiAgICAgICAgICAgICAgICAgICAgc2VhdDAsIGRlZmF1bHQNCj4gDQo+ICQgdWRldmFkbSBpbmZv
IC9kZXYvaW5wdXQvZXZlbnQxMw0KPiBQOiAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWYu
NC9pMmMtNi82LTAwMmMvcm1pNC0wMC9pbnB1dC9pbnB1dDIxL2V2ZW50MTMNCj4gTTogZXZlbnQx
Mw0KPiBSOiAxMw0KPiBKOiBjMTM6NzcNCj4gVTogaW5wdXQNCj4gRDogYyAxMzo3Nw0KPiBOOiBp
bnB1dC9ldmVudDEzDQo+IEw6IDANCj4gUzogaW5wdXQvYnktcGF0aC9wY2ktMDAwMDowMDoxZi40
LWV2ZW50LW1vdXNlDQo+IEU6IERFVlBBVEg9L2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjFm
LjQvaTJjLTYvNi0wMDJjL3JtaTQtMDAvaW5wdXQvaW5wdXQyMS9ldmVudDEzDQo+IEU6IERFVk5B
TUU9L2Rldi9pbnB1dC9ldmVudDEzDQo+IEU6IE1BSk9SPTEzDQo+IEU6IE1JTk9SPTc3DQo+IEU6
IFNVQlNZU1RFTT1pbnB1dA0KPiBFOiBVU0VDX0lOSVRJQUxJWkVEPTQwNzgyMDMwDQo+IEU6IElE
X0lOUFVUPTENCj4gRTogSURfSU5QVVRfVE9VQ0hQQUQ9MQ0KPiBFOiBJRF9JTlBVVF9XSURUSF9N
TT04MQ0KPiBFOiBJRF9JTlBVVF9IRUlHSFRfTU09MzkNCj4gRTogSURfQlVTPXJtaQ0KPiBFOiBJ
RF9TRVJJQUw9bm9zZXJpYWwNCj4gRTogSURfUEFUSD1wY2ktMDAwMDowMDoxZi40DQo+IEU6IElE
X1BBVEhfVEFHPXBjaS0wMDAwXzAwXzFmXzQNCj4gRTogSURfSU5QVVRfVE9VQ0hQQURfSU5URUdS
QVRJT049aW50ZXJuYWwNCj4gRTogTElCSU5QVVRfREVWSUNFX0dST1VQPTFkLzZjYi8wOnJtaTQt
MDANCj4gRTogREVWTElOS1M9L2Rldi9pbnB1dC9ieS1wYXRoL3BjaS0wMDAwOjAwOjFmLjQtZXZl
bnQtbW91c2UNCj4gDQo+IExpbmtzOg0KPiANCj4gMTogaHR0cHM6Ly93aWtpLmFyY2hsaW51eC5v
cmcvdGl0bGUvVG91Y2hwYWRfU3luYXB0aWNzI1RvdWNocGFkX2RvZXNfbm90X3dvcmtfYWZ0ZXJf
cmVzdW1pbmdfZnJvbV9oaWJlcm5hdGUvc3VzcGVuZA0KPiANCj4gMjogaHR0cDovLzB4MC5zdC84
NGI4LnR4dA0KPiANCj4gDQo+IExldCBtZSBrbm93IGlmIEkgY2FuIHByb3ZpZGUgZnVydGhlciBJ
bmZvcm1hdGlvbiwgbG9ncyBvciB0ZXN0cy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IGhp
YXMNCj4gDQo+ICAgICAgVGhlIEFTQ0lJIFJpYmJvbiBDYW1wYWlnbg0KPiAoKSAgICAgTm8gSFRN
TC9SVEYgaW4gZW1haWwNCj4gL1wgICAgIE5vIFdvcmQgZG9jcyBpbiBlbWFpbA0KPiAgICAgUmVz
cGVjdCBmb3Igb3BlbiBzdGFuZGFyZHMNCg0KDQpQbGVhc2UgdGVzdCB0aGlzIHBhdGNoIGZvciB5
b3VyIGRldmljZToNCg0K4oCUPjjigJQNCg0KRnJvbSBhY2U3NDdkMzNmMWI5ZDMyOTMwOWMyNzc4
NzlmYThhNjMyNjA2YzkzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogQWRpdHlhIEdh
cmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCkRhdGU6IFN1biwgNCBNYXkgMjAyNSAxMTo0Njo0
NCArMDUzMA0KU3ViamVjdDogW1BBVENIXSBVcGRhdGUgc3luYXB0aWNzLmMNCg0KLS0tDQogZHJp
dmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYyB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3Mu
YyBiL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0aWNzLmMNCmluZGV4IDMwOWMzNjBhYWI1NTk3
Li4yNGRiMTNjZWFlM2JhMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0
aWNzLmMNCisrKyBiL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0aWNzLmMNCkBAIC0xOTUsNiAr
MTk1LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbWJ1c19wbnBfaWRzW10gPSB7DQog
CSJTWU4zMjIxIiwgLyogSFAgMTUtYXkwMDAgKi8NCiAJIlNZTjMyM2QiLCAvKiBIUCBTcGVjdHJl
IFgzNjAgMTMtdzAxM2R4ICovDQogCSJTWU4zMjU3IiwgLyogSFAgRW52eSAxMy1hZDEwNW5nICov
DQorCSJTWU4xMjIxIiwNCiAJTlVMTA0KIH07DQogI2VuZGlmDQoNCi0tLS0tLS0tDQoNCllvdSBj
YW4gYWxzbyBkb3dubG9hZCB0aGUgcGF0Y2ggZnJvbTogaHR0cHM6Ly9naXRodWIuY29tL0FkaXR5
YUdhcmc4L2xpbnV4L2NvbW1pdC9hY2U3NDdkMzNmMWI5ZDMyOTMwOWMyNzc4NzlmYThhNjMyNjA2
YzkzLnBhdGNoDQoNCg0KQWxzbywgcGxlYXNlIHNoYXJlIHlvdSBsYXB0b3BzIG1vZGVsIChFZzog
SFAgRW52eSAxMy1hZDEwNW5nKQ0KDQpBbmQgaWYgeW91IHdhbnQgdG8gYmUgY3JlZGl0ZWQgZm9y
IHlvdXIgcmVwb3J0LCBwbGVhc2Ugc2hhcmUgeW91ciBmdWxsIGxlZ2FsIG5hbWUgYW5kIGVtYWls
Lg0KDQpUaGFua3MNCkFkaXR5YQ==


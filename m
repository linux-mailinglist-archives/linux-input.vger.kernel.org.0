Return-Path: <linux-input+bounces-10091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDAA37AE5
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 06:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255D116CDFF
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2CF286A9;
	Mon, 17 Feb 2025 05:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="og8HkUnE"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010004.outbound.protection.outlook.com [52.103.68.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F54154BFE
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 05:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739770068; cv=fail; b=edCsktVR4FwCrO9BWjeYxnJOrf4Hq1zyLNZYsUA3Fx7Tua6wHVc75vjaUPgELhJZ5NTJ986KcXBQnD1nZi2rtzNjfOdX0LAlVCJFNUDH1mjaWqdRhqFN8uCjFVaeO+2Cpz/MKNTvs3/UHGB9s3b+eyPmS12ZL4MqlF5SAklIdz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739770068; c=relaxed/simple;
	bh=pGwRyBCh8MKPX/uiSPYOntTdIWNuRlhmaW0U/3MT1UU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jp70B8B4VhlA4FDVbnSbeRhgTyI06MmrbP0hssNhY38MZ5ZIfOO9PUahixQ8OyxzHJ36XtGGGar70iIXBXbIyuzKDHpgAzp4n+5Fj01yVj1W9wrY4p4UeAC5p3oMInJpdCpHvg/XQRnK9vJJrhqb8HvUT0zEDrVY3EWN4Tf3sCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=og8HkUnE; arc=fail smtp.client-ip=52.103.68.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEOOoOmoppF59mAcWoYwnkoC/Z1CjSHSf4lyuW+xR1exYtRV8mwKoMRd5rAVhPJkIUcEWYSBY9BVXoxbydKGlSyziZR5GUR4sudgua14aGptN29J/DZ5Bz4VsTgIxU1nd62yt2HAAJGHHVyFPjLKejKNNlazE32Cxu9FWy/jTABlaS3CRoDZLd06bPD6sRlZWAnS7ogli2NUPvlmkvNdUucKa9bS26j53wf/c48mqBZaIfDDXjGkDHd9MMJI6kwbS3wjmOvZGfY/XGgc7PhZTIC6YxXxOs5T7tNwW87u6xJWl16EomCIIBbTnXh3PRucZsV57F5M6yOvqBKyT5ZlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGwRyBCh8MKPX/uiSPYOntTdIWNuRlhmaW0U/3MT1UU=;
 b=t2pB6LF5h9cxOQ4cU+v3Ok8JPPL4P1lyYdoOFYzmWade3eLbuTy+SNaX21nMViXNOu9YSCnwYrUG7eql6jCG8aHFrGHFMJU+2rOpdR8Kq58FKM5sVwxnDNxHPY1BbGw1uu7blKCbRGPxg7n1Xm+NXZeLR5vqZhL7dyifsCFf6IMtjdAwqX2YB3aLh4br8Cnd8YpNEqWsmop8OZFyIBbtEIiePFQIbi+pvWO+DPAwGs9fdGe9GR8Fuibq3nz++vvmwz+Y/gWH/myI4E9C8KMzYiOYPlrjD4zB1FDH6W8Lr20gIsCPvHBTKHcKO1SeiJ5UOh+9n83lPEk1lbbv1nKYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGwRyBCh8MKPX/uiSPYOntTdIWNuRlhmaW0U/3MT1UU=;
 b=og8HkUnEz1Tu8mYXR/P6Hu4+a2R1RyAkDqU8YlHerSEW0nfdk68AO+tntPwmF9v+GAX7IClZy0EZ/Lj6EvFwxNsyyfFu7gJw7Z43AFRv5V0V6VrFLg7vr2HwAggjq3N5+8JYHJmFZeptJtlse65eicyjFolfMemHusDA0R5KXFTh59kfptvzvwExDtOlx/RM0sQLEvCGsAG+jekUrTW2gJVL8Ap8wlz9egFQHOo4qylfGhg1m+g8NqpXAuCjS5mZt1Em5MRx03Mrk2o0t6n/eAeE+YfUwtmlTbGNfd49iB7dzewTjzfV1ToFP3jEsEWaq8ExbonYXdEu7/a9SooNcw==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PNZPR01MB10573.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:24b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 05:27:42 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 05:27:42 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Jiri Kosina <jikos@kernel.org>,
	"jkosina@suse.com" <jkosina@suse.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [bug report] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Thread-Topic: [bug report] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Thread-Index: AQHbgLusTysZbdEyG0OE4/1rX35tpLNK7V4AgAAKcoA=
Date: Mon, 17 Feb 2025 05:27:42 +0000
Message-ID: <539DA7C2-18D0-40C3-AB5A-25037AED611D@live.com>
References: <6263a1a2-4d50-41db-aa54-cfcb3e0523a4@stanley.mountain>
 <88774FD7-0DF2-4F93-B4C7-3D26FFFC48A1@live.com>
In-Reply-To: <88774FD7-0DF2-4F93-B4C7-3D26FFFC48A1@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PNZPR01MB10573:EE_
x-ms-office365-filtering-correlation-id: 3dfea91d-0861-4a14-4488-08dd4f13cd7b
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|7092599003|19110799003|8060799006|8062599003|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?RnZGMkJxMHAvREN5ZmxQUE4yTFFDek9OSGxRaFFyVWczVHJiVTl3ZVpXR0hx?=
 =?utf-8?B?M2ZIcEhaTlRkS2hya3NNZkkwR2JDaXZsNXJiY1BCUGZBOWNpQXMzdWR5T0pZ?=
 =?utf-8?B?K1ZtY0VZMkg4dFV0WFRSVVJ6MGV5OHRhOGE3Z3BJeWdibTRNRDhpZHp6c1NK?=
 =?utf-8?B?a3F1V1lGU0VGWm9rZXpHWXg4UTkyL0tPS2lTZ0lRd3p5RVFBdkdJWDFUeGJO?=
 =?utf-8?B?djJ6eXQ3TkV1K2pwMXFibkZoY3E4dms0WFIrV2dYdHY1cFVDUFdJcWZZQ2RI?=
 =?utf-8?B?YlNXRE42Y1NwcDdjRWtSZVZJK2RMNmVmRHQyYnVpcnpROFdlZGtyNVJrQ1JC?=
 =?utf-8?B?WGEvb2NzWlpTcmowTlZOV0piVG9CNXN3M2JRQ3FoY0gvL1p1M2JTSU1oSzJu?=
 =?utf-8?B?cFpPTFRtQStpS2MreUNCYkcrVTFwWXdnekh0dndYZ2RBY0V3VVlSOWZqbGor?=
 =?utf-8?B?SUxjRGFRZFF3TXo3N1J6SEoxVEN3Zjg5bDRDT04yc256TzBZOXZ4TXYzTUFs?=
 =?utf-8?B?YUI3ZE01T29UTCtPenBCamVxK0dBaVM0bE1nNy8xT3FJSkhMcld0eG9iazNW?=
 =?utf-8?B?Zk1qSkZ5VWhORy9WcWlXLytoL25pT0lqUUpSY2tZRUhvb1VERlFsS0hMTTlR?=
 =?utf-8?B?amRqaFN1RTJ5cURUZDBHaTBhaGpvcU9Xd1MzZE5xY0ZCVHJIM0xZQlIySWRF?=
 =?utf-8?B?UnVsa1lPRVJma1d0cHZGK1NUM0ppbWJqOTJCNE1jVmRCaVpPTXU3bE9JRHd5?=
 =?utf-8?B?d3RtOHI0azVGTHB3SXhJNGlNaHVPNHdLTms2UTJHK3RCME9pOGJlTVVnaTJX?=
 =?utf-8?B?MzVLRE0zL084SUh4eG8wT3FzYnlLcEg4blozM254MVNXTVozUG1SS2dDc2k2?=
 =?utf-8?B?WEFoUC9WZmhhK040UGJ2QTVtMGRGbjV1VmZBMjl4WFNNYmdLemhnVWFZMkJO?=
 =?utf-8?B?eWl4OVYzcGlBUjNodVhlTEU3dWNxb3g1NFBRUDVCVDhvSlI4TFNoT250ekE4?=
 =?utf-8?B?UU9FU0ZEaUNoTTlwczNqa2Q5SDV0MEVweG9Cc0hzVXhmWThSNnpZZEY2dnp0?=
 =?utf-8?B?VmtRRDZrTkxhTlRSS011R2lJUmh2cndrY1BnTmtGK1pwcGVwWGJ6VjlrVWhR?=
 =?utf-8?B?Y3Qvc1RMWUk2WEIzL0ZPMy9zNEFlV1lRaGpCS3RaS3RkSkYyelRvVzdmNGtH?=
 =?utf-8?B?L3pQSHFuN0I3NWdaK3p5emFsdHZpSWI3bWZoR2crR0tuaGMySFU1Vm9oMWRh?=
 =?utf-8?B?N1U3U001Qy8wRWdoR1d6K0xOKzlGTmlKc3VLUmkyNmd0SU9QQVdhV0RLcVQ0?=
 =?utf-8?B?SlZmWVliMGRBUVh5OE9HeGVxbUdxY0lxY2ZQY3hoOXRVaWZZcjZyTldtaktu?=
 =?utf-8?B?TVplOGlyMkptQ1c5ZnE5cFNuMjR1eUVmWVhNOUJKWDNJbkMrWjRrM3BCZmkr?=
 =?utf-8?B?LzVUUUloR1N6YkdZUklQSjdLeTE5a2UyWjZ4c0hab1VBVnJDdG00S3BJcjhX?=
 =?utf-8?Q?6yaJWU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEFwbHRsUWo1b1Y1V3hJYmNxZGUrS0t1bmNFK3dtWnlscmVBaXM0YjJBZVZW?=
 =?utf-8?B?M1gyVTZlb2ZDUmlGclQ0Rk1pOFZsS2hEM0dkZkMvU0pRcEZXNGE0eWR5SklC?=
 =?utf-8?B?TldTYWxkbVpESVZ5c044a0NhQitZdkVtdjVBdGtqT01xOFE5UWdGcVNKZFhm?=
 =?utf-8?B?UjdzaDh5MGQ2VkVTZkxyNHNQS1oyTVhjMHRacjlZMUlSa2crcXFpb1BtVVF6?=
 =?utf-8?B?VlJhVjljOGYvemxVUDkzTndwWW1EdS81TGNoZEJ1Vk9LL2Y2VkhTcll5M3dB?=
 =?utf-8?B?YmQ1c0R3NVZJRktxdk1raC9Mb2wyZ3dtdzZQSTQvbVZ5T09yQytZU0ozdVhz?=
 =?utf-8?B?YUhYVmJKOUcxZlBuRlhHcS9yUXhJMTMwMnoyUzhtdEVxT2NrVXVSUzFyUm5T?=
 =?utf-8?B?SDRYejVOZ0lpaGpJZmR3MVB5bVVhbWZZQ1lIVlBUakVkWjlQZ1VORktkRkth?=
 =?utf-8?B?T3hSMUVqYkJrVXQydXpueSt4THQ5Rk5TKzFjclBNZGI5UGlycDZ3Tk1pbGNm?=
 =?utf-8?B?T1hCQTlLY05HaXYvdDVoM3RFbjAvOXJ3d3pqb25Ha2l3NXcvSURzdWtoaVJQ?=
 =?utf-8?B?dE1vbXlRUkIrNDdIa0UydTZEamI5OHhlM3F5eGJLVE1uQmJrZ2RZM0xSbEFY?=
 =?utf-8?B?VHI0NGRYMDNock94eE5XNzgzaHpyZ0F0aC83YkZvOGlFUTJteDNlR3F4SUxl?=
 =?utf-8?B?ajYzeThaMXR4YkZtK3crNWFZMTgzRFpOYmMvNkpya3BmMGplVytlYjlGTmZN?=
 =?utf-8?B?MFN4dEQ4TmU4NkNiK0RPbzhTNmxaZ1MxT3ZQN3k3dStmMTlHdWQ1cVYvbGZJ?=
 =?utf-8?B?cU13WWlxK1c0SlRiVXhJUzNDT20vb3ZpeC9jVnFYanNuRkFTYjRrUEUyOWtW?=
 =?utf-8?B?TFArK1dES3ZlTGtUME1rcHRMNXZCMk13SENYWTExb2xkZFdsRkczcEVmMUMx?=
 =?utf-8?B?MmFkUmNsUTlMUHd5bXVnT3JLb1NKZEhLT2V3ZkRnU0s4Mkh3d3FvZEFIY2p4?=
 =?utf-8?B?aWhFOVJhbmU3R09YUmVOb05rWHN2a3c1clY1MVRPdXBUcDF0WjV1dHRINWkx?=
 =?utf-8?B?UE14Y1ovaFQ1Mno0Mkd0UkpzUlg0ZGJ6RlhkeUNPbEplcmNkaE41eGZrQUpi?=
 =?utf-8?B?NENwTmZFWHVmNUlxQTA5dkxYa1VDZDFHaWdlVS9TdFZoVE85MkNodnFqYVJl?=
 =?utf-8?B?U29TR1k5UkFCeExqdTNPWi9LQkc0am1ScGsybDhodXkxWEhnVTJMb25wOFBn?=
 =?utf-8?B?UzZlY1QzdzBKcjlDQmpmY1BDZno0QmdadEdEVHlXSGN4NXdaTTZqby8vMTFy?=
 =?utf-8?B?a05jb1NhUndWbzhZcEZmeVdjY2MvWlZ3RC9Bdlc5QTA0eUFNSUF6SmVDem5P?=
 =?utf-8?B?SGMxejNqZjlXTjBmb2x2Yjg2R3ZtNzVkYjNJS3FUYUVTbTZBMzBvNkpqUkRP?=
 =?utf-8?B?S3dQdlkxU0tLeEdKa0JpdDhSV1NNbEZPaFYxRzFDOTdkYWhxMmJFUkpPTUto?=
 =?utf-8?B?VmtXMEpPYjVhMHZ5ekhrRFlzY1VDMTNhc0lMeTV5MUk3N3ptaEIyWGFoaXZ2?=
 =?utf-8?B?LzVaZWJiYU9rQjBVamQrbDd6YVoydDJ5cFg2dnVsOGtoM2VadmowQmt2MzlZ?=
 =?utf-8?B?SW55ZmdnTDRIN2VpQlMxVFB0cGhtMW1VdmIrVjUvYjdWc3dPQmJkYVlGR0Rl?=
 =?utf-8?B?OFBtcmI1V2xTSXJGcWdqdS92VVU5dHZuWFJFWjhwN0lMVnkyMFlqbzNKMWxv?=
 =?utf-8?Q?T0x/7I+2h75inPxqNEfBN12wm2i76UIWdqeVtpV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49A3DEF9E2620943A919D4A6B5487087@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfea91d-0861-4a14-4488-08dd4f13cd7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 05:27:42.6362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB10573

DQoNCj4gT24gMTcgRmViIDIwMjUsIGF0IDEwOjIw4oCvQU0sIEFkaXR5YSBHYXJnIDxnYXJnYWRp
dHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPiANCj4gSGkgRGFuDQo+IA0KPiBUaGFua3MgZm9yIHRo
ZSByZXBvcnQNCj4gDQo+PiBPbiAxNyBGZWIgMjAyNSwgYXQgMzoxMuKAr0FNLCBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPj4gDQo+PiBIZWxsbyBBZGl0
eWEgR2FyZywNCj4+IA0KPj4gQ29tbWl0IDkzYTBmYzQ4OTQ4MSAoIkhJRDogaGlkLWFwcGxldGIt
a2JkOiBhZGQgc3VwcG9ydCBmb3IgYXV0b21hdGljDQo+PiBicmlnaHRuZXNzIGNvbnRyb2wgd2hp
bGUgdXNpbmcgdGhlIHRvdWNoYmFyIikgZnJvbSBEZWMgMzEsIDIwMjQNCj4+IChsaW51eC1uZXh0
KSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljIGNoZWNrZXIgd2FybmluZzoN
Cj4+IA0KPj4gZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmM6NDA2IGFwcGxldGJfa2JkX3By
b2JlKCkNCj4+IHdhcm46IHBhc3NpbmcgemVybyB0byAnZGV2X2Vycl9wcm9iZScNCj4+IA0KPj4g
ZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMNCj4+ICAgMzcyIHN0YXRpYyBpbnQgYXBwbGV0
Yl9rYmRfcHJvYmUoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsIGNvbnN0IHN0cnVjdCBoaWRfZGV2
aWNlX2lkICppZCkNCj4+ICAgMzczIHsNCj4+ICAgMzc0ICAgICAgICAgc3RydWN0IGFwcGxldGJf
a2JkICprYmQ7DQo+PiAgIDM3NSAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZoZGV2LT5k
ZXY7DQo+PiAgIDM3NiAgICAgICAgIHN0cnVjdCBoaWRfZmllbGQgKm1vZGVfZmllbGQ7DQo+PiAg
IDM3NyAgICAgICAgIGludCByZXQ7DQo+PiAgIDM3OCANCj4+ICAgMzc5ICAgICAgICAgcmV0ID0g
aGlkX3BhcnNlKGhkZXYpOw0KPj4gICAzODAgICAgICAgICBpZiAocmV0KQ0KPj4gICAzODEgICAg
ICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiSElEIHBhcnNlIGZh
aWxlZFxuIik7DQo+PiAgIDM4MiANCj4+ICAgMzgzICAgICAgICAgbW9kZV9maWVsZCA9IGhpZF9m
aW5kX2ZpZWxkKGhkZXYsIEhJRF9PVVRQVVRfUkVQT1JULA0KPj4gICAzODQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSElEX0dEX0tFWUJPQVJELCBISURfVVNBR0VfTU9ERSk7
DQo+PiAgIDM4NSAgICAgICAgIGlmICghbW9kZV9maWVsZCkNCj4+ICAgMzg2ICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT0RFVjsNCj4+ICAgMzg3IA0KPj4gICAzODggICAgICAgICBrYmQgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmtiZCksIEdGUF9LRVJORUwpOw0KPj4gICAzODkgICAg
ICAgICBpZiAoIWtiZCkNCj4+ICAgMzkwICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsN
Cj4+ICAgMzkxIA0KPj4gICAzOTIgICAgICAgICBrYmQtPm1vZGVfZmllbGQgPSBtb2RlX2ZpZWxk
Ow0KPj4gICAzOTMgDQo+PiAgIDM5NCAgICAgICAgIHJldCA9IGhpZF9od19zdGFydChoZGV2LCBI
SURfQ09OTkVDVF9ISURJTlBVVCk7DQo+PiAgIDM5NSAgICAgICAgIGlmIChyZXQpDQo+PiAgIDM5
NiAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgaHcg
c3RhcnQgZmFpbGVkXG4iKTsNCj4+ICAgMzk3IA0KPj4gICAzOTggICAgICAgICByZXQgPSBoaWRf
aHdfb3BlbihoZGV2KTsNCj4+ICAgMzk5ICAgICAgICAgaWYgKHJldCkgew0KPj4gICA0MDAgICAg
ICAgICAgICAgICAgIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgaHcgb3BlbiBmYWlsZWRc
biIpOw0KPj4gICA0MDEgICAgICAgICAgICAgICAgIGdvdG8gc3RvcF9odzsNCj4+ICAgNDAyICAg
ICAgICAgfQ0KPj4gICA0MDMgDQo+PiAgIDQwNCAgICAgICAgIGtiZC0+YmFja2xpZ2h0X2RldiA9
IGJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X25hbWUoImFwcGxldGJfYmFja2xpZ2h0Iik7DQo+PiAg
IDQwNSAgICAgICAgICAgICAgICAgaWYgKCFrYmQtPmJhY2tsaWdodF9kZXYpDQo+PiAtLT4gNDA2
ICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQg
dG8gZ2V0IGJhY2tsaWdodCBkZXZpY2VcbiIpOw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5eXg0KPj4gcy9yZXQvLUVJTlZBTC8/DQo+IA0KPiBT
aG91bGQgYmUgLUVOT0RFVg0KPiANCj4+IA0KPj4gV2h5IGlzIHRoaXMgaW5kZW50ZWQgYW4gZXh0
cmEgdGFiPw0KPiANCj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4NCj4gDQo+IFBhdGNo
IHNlcmllcyB3aXRoIHNvbWUgaXNzdWVzIEkgbXlzZWxmIGZvdW5kIG91dCwgYWxvbmcgd2l0aCB0
aGUgb25lIHlvdSBmbGFnZ2VkIGFyZSBzZW50IGhlcmU6DQoNCg0KQnR3LCBJIHdvbmRlciB3aGF0
4oCZcyB3cm9uZyB3aXRoIGNoZWNrcGF0Y2guIEkgZGlkbid0IGdldCBhbnkgZXJyb3JzL3dhcm5p
bmdzIHJlZ2FyZGluZyB0aGVzZS4=


Return-Path: <linux-input+bounces-9357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0EA15610
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 18:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A075C165AAB
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 17:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10B21A3AB8;
	Fri, 17 Jan 2025 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="V89/0eV2"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011036.outbound.protection.outlook.com [52.103.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8121A3029;
	Fri, 17 Jan 2025 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136515; cv=fail; b=IRwJCtvPRVLDRf8FPC2aERQc5GW+cyCJu4c96GaB45eux+Un/LG82vCb5zIyEY1hLv15B+t/5JJvznSAxuooPQWleVSZSHFyG+5CLkXVcaejP0ugcwB4TIEqN0pX6i2Ltgy34sgY+3TIRhjQbhNO5ac7qsjLr0nmEdaSqRVF3zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136515; c=relaxed/simple;
	bh=FfoFaBHr4uycZfssN6+8fB7aLTFa7aBe7AfYGet2mzQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O9LGNNhfhhaiHHqIr3B5RFMdfRXQnvm8tsaCQ81pNcuzvDK7wgCgN7hb4YQuyLv9ycrkhHC3FlZjcfsm1VZboag5t6YJcRrOP9nrA9LG21ERUkQYhPCWRrbBMmJnRv9Cc2SENH3jOaFcl1o6fgIZAmvM9PBwWGagxYIqy/2Tm7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=V89/0eV2; arc=fail smtp.client-ip=52.103.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtUiOgFkeRZNaBmaL7caUGxyg/AZ/od3tT0MuSmmzeoWdxyLQ6QjdDI9L4qyzezjaquSoUtSL7/B3FPNI2e8/tXjPFkGr1WUxIwKmdtCF6bsj+pTpuNsAKdNA+NPt25Iqta+W38B+E3lM3IDfE55GTno4hBLwz7/BwNCCSLop03BDKAHhYyWeXbJ+hysV+w8J5nIDGyLbNOPczIV2+ebptt9m05mDfr5RZWf9GY5mU1UFCkpbPYs7PLbr1DHWOJuXK+s9i5fE98MYWoqgJ16ZO0cMcUoxVQwvlcsL4qUqi84pXbBfUYp0tXtK5dR96Y5HNUYDDPnDKLuEJPqdux0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfoFaBHr4uycZfssN6+8fB7aLTFa7aBe7AfYGet2mzQ=;
 b=qvwegPd9Nd1cCijNtZQsklfWb/bcOOmCyVU4DUwhOk7x8UaOojBHakTTKm6ouwhh90Ytt+ooCuBD+LqCiCbx9Oh8jLtKUPIEL+Hz84vdFbmiV7pzvIb7I7eUF7sT+DPCK3twhOHRIeB7PaLJDU9fSn09iqjrOEm1SPlfA34mWAwxhIn2F8Gdo03m2kOF3Vq2zSi7RzfTlkEFSQskQ0FNEn4di/Qzl+2bHeSa4v02EKrq8Jz3z8uv/JP7kXBNHx2ZVqXzG/UuHPN8VZaAvpLgV5zGO+qlhnOVe8UwELucfFZO1b4n+Wit6jBPlUU3Q6qLMnuIef9+crp1pvPBUBNY1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfoFaBHr4uycZfssN6+8fB7aLTFa7aBe7AfYGet2mzQ=;
 b=V89/0eV2+P3Zv0dNaIGQ1hWVe6EmwjQsPAIu+mIxXOs2JxgWemgDYql3ihgp/PkJ4qH6hPdO0ftEiIWIzIqGlOSgce8IDwOQ7Z+s+xBW41D9Y/yQB2nykR02vIF94oQlV9xVLFmGiMzVEmrg9izojFhSjblC4soj4mQuCbmw4aioVYa0kn1o7wUIjAudd2tx7OX/eiv28MbsrTPBQvJxPERgii5xQCtig/+GSbDtMRdRJJ3jRfvug9CiA2/3JwfFgCOyfeCD92pTZLIXSyCMv9RBw3CMCl3EIZD3Mv3j11LATwUgKCNxevGjcT574FNwcOqWhJyIoY3jZGCru55V4Q==
Received: from MA0PR01MB6553.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:74::9)
 by PN0PR01MB8877.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Fri, 17 Jan
 2025 17:55:08 +0000
Received: from MA0PR01MB6553.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:ef55:856e:6aac]) by MA0PR01MB6553.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:ef55:856e:6aac%5]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 17:55:08 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "jkosina@suse.cz" <jkosina@suse.cz>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<thomas@t-8ch.de>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<linux@weissschuh.net>
Subject: Re: [PATCH v2 0/4] Touch Bar driver for Apple Macs with T2 Security
 Chip
Thread-Topic: [PATCH v2 0/4] Touch Bar driver for Apple Macs with T2 Security
 Chip
Thread-Index: AQHbW6oNIzeESHcNLUGNsfN06JtudLMbWovU
Date: Fri, 17 Jan 2025 17:55:08 +0000
Message-ID:
 <MA0PR01MB6553E7942A83E9976B91F96CB81B2@MA0PR01MB6553.INDPRD01.PROD.OUTLOOK.COM>
References: <E5CC067F-5CC8-4B33-B50C-40163C8A46E8@live.com>
In-Reply-To: <E5CC067F-5CC8-4B33-B50C-40163C8A46E8@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB6553:EE_|PN0PR01MB8877:EE_
x-ms-office365-filtering-correlation-id: ac9f641e-0a9a-4c40-e823-08dd372014b0
x-microsoft-antispam:
 BCL:0;ARA:14566002|8022599003|7092599003|19110799003|8060799006|461199028|15080799006|6072599003|8062599003|440099028|102099032|3412199025|21061999003|12071999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?d2J3WVIrN3V5QUZtSWFEbitPVnRWYW5kS1pXSzVjaWNwM0I3QjNSbE1jaUp3?=
 =?utf-8?B?ZWZmQTVDeFZlZG8zcFhUK1dLdjR1MDJVWnpRRUxHanhSSTYzUmVjQTQrUnU4?=
 =?utf-8?B?eVUyRCtuOEhJSnQwbVVGRTcxeGdIdksrZ3JHL2pzTk4rNUNGcWpDZTd6U3hV?=
 =?utf-8?B?Rmc1Qi9aWnpiZGREU1BUL2tLWDFjaFlkYnlKdmtaTnMxNmV1VGxnY3V4UVBs?=
 =?utf-8?B?VTVXUFA0bnd5ZzRHbGx2S3FWTmN3NDYxcjFSWUx2NjdsUE9hQlBxczE1NC8w?=
 =?utf-8?B?dWszWUVGVEZLdWdVZnlzS0xQTXJzVXc1cjU4Y2RsOVhIM0ZaRE91L0tLTHIw?=
 =?utf-8?B?QTJwY1RnQ3MzTG1Wc05vZlVKWjNnaWd5dUorMnRDdmVNa1NRUlFtSzBaV2l5?=
 =?utf-8?B?aDkrVUN5dG81RWtPTmlqRExCSzdpZ0FFNUdaZTdJcnhGWHh1WWVrajFZWk9S?=
 =?utf-8?B?dW9jNi9rc2JxaFpCOGQyRmQvUTZrakhCQk40dUxaRGNpaXdZZXR0VHpwekxY?=
 =?utf-8?B?OU5YZ1pBZDNub3dFZENIbVN6ZkcvQmRoRlBBNnYyaTJNeHJhZmJtU0NETGIr?=
 =?utf-8?B?YmdGZFVWamhoc25vZjgxRWZIWjNsaWEza0FjK2FreEgycFdMRXpuZGs5K3hE?=
 =?utf-8?B?b2NZdUd4alN6MVlTbHZJZm9lL29vejlhMXhWVmxJaTBURXBiMUk0cU9iSkll?=
 =?utf-8?B?dWlvZWdscTJqVGdSYk5lUEpTWXpWYTVLdE5QOHV1K0JJUlJWSWYvc1VobUh6?=
 =?utf-8?B?ajA1TklEV1h1QXErdlY3cHVBTFo0Z3pnclZydHNFZzk3cUsxSWd5OEkzYko2?=
 =?utf-8?B?Zk0vL0kvdU9VRHhVaCs0a1VJRU9FdnlBc0dkQ3IxSEFDRlRvK3RPeWVEZEJs?=
 =?utf-8?B?V0FpUGRCMDYxU2ZwZ090aVUrdjZxRmdkalFGTWcwZlE3ZEhLcE1TSHFpT2FM?=
 =?utf-8?B?Mkt0ZFB5ZDJ1ZkM2LzZvN1FXajdad2NqdUI2UVRkM3FXNkdGRTZKUU5hLzFM?=
 =?utf-8?B?YnRCUGk3b1hMa2tJamJNdjF2ek81clRCN050QzJPRjM3M0NJOE1UK3h4Wkpp?=
 =?utf-8?B?ZEpFMlhZNGVqeVBCUWV3UUdhc0pxMHVJOTRKQWVyakFzcXQyTXFaSGR3L05J?=
 =?utf-8?B?eC8vVElhdjJTdFpYaFZoTmhlKytGYkVnOFJ4OUhFTkZqSTR1aGlTTDRwUVhp?=
 =?utf-8?B?WkJ0cUJOMHI0WEtqTGpFZDZxQlY2VlRZZkpFKzYxZlhiVm4xbjc5Q3ZRZGx0?=
 =?utf-8?B?ZnBSSlFsTUxTakpZcGx0akVUaXh6K3BMY042MkhneTZuN3NabzBRbGgxc1Ew?=
 =?utf-8?B?M0dRcWJBenYxc3FYLzVzeFJJK1cxVmNrUzYveTEzeGNrcUN6WUZhc0N6M096?=
 =?utf-8?B?a1NwWEZCam91TTVyWXdOUlFWNVhXdUd4OEFEVXJHbWtsN2VPU056c200VDZE?=
 =?utf-8?B?TnpYOFdlV0VZWnU5WEczTjFYc3V0bk5HQ0xTczlmcEhzWjVGTCtDU1VBaE5s?=
 =?utf-8?B?elZZbkdtRTVxeFJyWkRBLzJsVFZXQlBUbXgzdkxJS2tIc2l4R016R2liZWFx?=
 =?utf-8?B?WCtRa1VHZHNtRTlVQXZKRVhBTmNOQVJXV0NDOFozTlJjaHJBOUZRVHVFbkFS?=
 =?utf-8?B?M3hWM0FBZW8yaVRmVWpKY1JxVjV4V3c9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFJsNjJTNG5YYnNFb1gvL3FvbjZxdVp2eGhUdS9KUnJVR1VtK0hUSU9zZnho?=
 =?utf-8?B?b3dtdU9rNkExYVJ1cHpHQnkyd2pZOWV4MjIvWDcvY2tyMWR1ZWd0NTF3aW5X?=
 =?utf-8?B?a2p4RS9PU2ZaRlJQWk8xVmFEM2dxWlpmcXZWbzlWTFoxeGlIcW9FVEN2c2NK?=
 =?utf-8?B?MmlsZUtvc2hadjBTclNYQ0EzRzFiR04xcVF0U3ltY0lBNFZQOHZnMFJ0a2Zs?=
 =?utf-8?B?WXNtSUJWY2RjQzF3cUZJTkV1cWYzTnpRNnFiNHlOOVdpZmpaTTFWL0JjbGE0?=
 =?utf-8?B?WGwzcDBSV21NMUk4T2QyM3o5blhaVlhxajZjdjlyZmhwd3M2MkR6N0x2UFhR?=
 =?utf-8?B?UjlJTUFXTFhDK3h2c2xZdUFUeHNvVFJCV1FHWmxxYjRaVTlyS1BmL3dnckta?=
 =?utf-8?B?M2NGbmJvSVRvQ3U3ZVVwdjJxRDBUMmtYek9hRDJvUkZocmlNWkUxNzM4cENt?=
 =?utf-8?B?T1d3UEN0UGxkci9WVnVuaGpCMFB3cmMyOWxrTVJaT1Nnbk1CcU9XZ1Y5enVa?=
 =?utf-8?B?a08yUzI0bldsRWp6aXpuZERCNm1LaXpjZkRiS1BwcXEyMjN2ZU91cjExRnN0?=
 =?utf-8?B?clM1UnlWK2UzUkdFQ1oxdzREUzQ1NXNSZkloNC81U3djY3dlMjBvVDNsVm1w?=
 =?utf-8?B?cFpTWEJRUWpjV3NSeVVnTGoxQ3dzQWpjVFcyMG83WFo3L1A3ZHlyTGZOYTQv?=
 =?utf-8?B?NHYxSGtLK3RZNDhMNjdiZ1ZuR2Q2NURDdXJweXhEK3NxVTMzTlVaUVh3YmNv?=
 =?utf-8?B?N2JYWDlmaEVybmsvbWxCODlwSWY3NDJ3RWU3UXE5TGZDaWwxU0RGL0NUOTN4?=
 =?utf-8?B?L0JwWGNJTTNxclNQRjZBZW9GMTNxWEtoc3R1aGYySE9WczBWVUpvanRxK0J0?=
 =?utf-8?B?L3ZwZVhkTXF3WTBNTFFmajJ6ck9yd1R5OUluMXFyY0tMcUF5SDZqWkJZVHRh?=
 =?utf-8?B?VVY2Q3dwd1VleVZoTjJJbW5NS1VGTXAxRFREOS90V0p0VHJLanNPZUM4Y1lJ?=
 =?utf-8?B?VFFXdTd5ekg4MmZ4dnFKVzYxRWkweTRUbWNRQ2lNYjRienczVFYyTmRuUm5Q?=
 =?utf-8?B?MGZxNVdBSlp1VHRDSU9haHVIZ2lIeFY4eEJGSlNKNUZVS0FaeFJxenZXRVVa?=
 =?utf-8?B?akhVb0FUaHdWanBTVVUyN3RGOUtZa0dhbVFDMXZOaFlhWXNoQWJKdW5ybzg2?=
 =?utf-8?B?RkFORmxYakY4MkF2eXdEY2N6RVlWb0g2cUdRRXpScFZPMDRFWjgyOUo1Y3Jt?=
 =?utf-8?B?OWh0eXQrNXVFVkl2RExQRVBZK3BLV25PNW9Gb1M4Z2RNbERESEZIZ2FLbDYr?=
 =?utf-8?B?MjBDSTFBZFBjdXVUMVJuYmlaZy9iNzdhSGs4emIzZ2NPbTlxeXU0WDlpOFA3?=
 =?utf-8?B?Ui8zN0kyY3I1ODRlQXYwbldDYjJoMmdDcjFwazhjdVEzSE4vaTFaank0U2JY?=
 =?utf-8?B?L3RVS1BkeHFqbUJUWmlkV1lFaUtUdGMzczRMRTdlaVplQ25DaE5BQ0RJMlNR?=
 =?utf-8?B?bGhHZmVtVnR3YUlRTEgwaVBkN2JwWTlwTDJmUDQ2bTZOY2hhQXZRdVkveGJL?=
 =?utf-8?B?WG01VzdvOU1CdDBJYW1TeThjdWlCSVVvMzlLWlIxdFZKdHl5ck5tUlViS1Fn?=
 =?utf-8?B?NkRMaEZ0YlFXVFVpZVc4eXlnS3hTUUc0UjFSZGpYMWtPd2JRN2thOTdSRDdX?=
 =?utf-8?B?bVdTaEYxelZ5a3ErS0JONmJCNHkxNWxRRHFVelBadnQwTFJpTTVjcEpyMjIv?=
 =?utf-8?Q?dKncIKSWeFRajRkAv4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB6553.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9f641e-0a9a-4c40-e823-08dd372014b0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 17:55:08.1787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8877

SGkgbWFpbnRhaW5lcnMNCg0KSXQncyBiZWVuIGFyb3VuZCAxOCBkYXlzIGJ1dCBubyByZXBseSAv
cmV2aWV3IGhhcyBiZWVuIGdpdmVuIHlldC4gU2hvdWxkIEkgcmVzZW5kPw0KDQo+IE9uIDMxIERl
YyAyMDI0LCBhdCAxMTowM+KAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29t
PiB3cm90ZToNCj4gDQo+IO+7v0Zyb206IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5j
b20+DQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIFRvdWNoIEJhciBv
biBmb3VuZCBvbiBNYWNCb29rIFBybw0KPiBtb2RlbHMgd2l0aCBUMiBTZWN1cml0eSBDaGlwLiBU
aGVzZSBkcml2ZXJzIHN1cHBvcnQgdGhlIG1vZGUgZm91bmQgb24NCj4gV2luZG93cyBCb290Y2Ft
cCBkcml2ZXJzLg0KPiANCj4gVjI6IEFkZGVkIGNoZWNrcyB0byB0aGUga2V5Ym9hcmQgZHJpdmVy
IHRvIGVuc3VyZSBiYWNrbGlnaHQgZHJpdmVyIGlzDQo+IGluaXRpYWxpc2VkIGZpcnN0Lg0KPiAN
Cj4gQWRpdHlhIEdhcmcgKDIpOg0KPiAgSElEOiBoaWQtYXBwbGV0Yi1rYmQ6IGFkZCBzdXBwb3J0
IGZvciBmbiB0b2dnbGUgYmV0d2VlbiBtZWRpYSBhbmQNCj4gICAgZnVuY3Rpb24gbW9kZQ0KPiAg
SElEOiBoaWQtYXBwbGV0Yi1rYmQ6IGFkZCBzdXBwb3J0IGZvciBhdXRvbWF0aWMgYnJpZ2h0bmVz
cyBjb250cm9sDQo+ICAgIHdoaWxlIHVzaW5nIHRoZSB0b3VjaGJhcg0KPiANCj4gS2VyZW0gS2Fy
YWJheSAoMik6DQo+ICBISUQ6IGhpZC1hcHBsZXRiLWJsOiBhZGQgZHJpdmVyIGZvciB0aGUgYmFj
a2xpZ2h0IG9mIEFwcGxlIFRvdWNoIEJhcnMNCj4gIEhJRDogaGlkLWFwcGxldGIta2JkOiBhZGQg
ZHJpdmVyIGZvciB0aGUga2V5Ym9hcmQgbW9kZSBvZiBBcHBsZSBUb3VjaA0KPiAgICBCYXJzDQo+
IA0KPiAuLi4vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLWhpZC1hcHBsZXRiLWtiZCAgfCAgMTMg
Kw0KPiBkcml2ZXJzL2hpZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjUg
Kw0KPiBkcml2ZXJzL2hpZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Kw0KPiBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1ibC5jICAgICAgICAgICAgICAgICAgfCAyMDcg
KysrKysrKw0KPiBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYyAgICAgICAgICAgICAgICAg
fCA1MDYgKysrKysrKysrKysrKysrKysrDQo+IGRyaXZlcnMvaGlkL2hpZC1xdWlya3MuYyAgICAg
ICAgICAgICAgICAgICAgICB8ICAgOCArLQ0KPiA2IGZpbGVzIGNoYW5nZWQsIDc1OSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaGlkLWFwcGxldGIta2JkDQo+IGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1ibC5jDQo+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYw0KPiANCj4gLS0NCj4gMi40My4wDQo+IA0K


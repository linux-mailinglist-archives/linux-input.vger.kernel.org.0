Return-Path: <linux-input+bounces-10551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5AA4F5F4
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 05:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D57516F12F
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 04:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126F11A239B;
	Wed,  5 Mar 2025 04:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="jqLqY0oS"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011031.outbound.protection.outlook.com [52.103.67.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5819CC2E;
	Wed,  5 Mar 2025 04:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741147870; cv=fail; b=ShzE4q1gXLH7ZV5UWWvvzSOrg/wRXZxWdvhtdXaeHQE9ijXtYEiCbHybTblToDaWekDkr21htsK9jl0hSX3Z/EFiWJtv+PzGavuH6mUCWCD0dSzwf/c+cWBdbE3ZrT84GW5u3REnrVhTRLX4VflXQH88J+qiAiTSh1pimkFRUrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741147870; c=relaxed/simple;
	bh=M2oQjlAjsnkU1jzUyvBw/p4Mx+Lb0U89Z5+Ly1j5tMQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LBsm7k4stthOCc4o0c7a8dBiVWsk+GYOiApswlMWwzKvIC6UzhKq9x5o/1MVFM3/rCy+ojx3rczL7aebSC5SCgZ0pNurDk+nUftUBjwuWCsiIvSQTSKRloszWu9XnQH8FHNKm6bL9YJksfJAORU0nUxLFO1M8P/PHQjvfHZgBmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=jqLqY0oS; arc=fail smtp.client-ip=52.103.67.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7mBjP/uj/bvSdlcF2UTcwUs9dvk1RB/nFsEbe+q+ywqhTNmNwBTbkZV8YEvV7PtLc76DNQSkNnFRxjnUjMUnzvVT2W2qJFNJ7KNsaPkzJMCxofnkcRLI1BuRlqpQYTVZN5fBd7LZaoP4+bBKEsg1O0gpk6OTocr8QQT7X0A/ZTx3/s2kLTKB2MXWsMobDiH/c85VaTg2BILm3Po7wSM8MAXOtvvtmhnAquzZ9rX1ySF9XrFg6mXmezg8Fx6pg0P7gpb5QZkwVxSnEUQEWAzmeGHPMFZcUjzqcllra7Hhee72WDV7NAn80sJ+BeLAqsvE9vvJFrdTBLFbzEMhypcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2oQjlAjsnkU1jzUyvBw/p4Mx+Lb0U89Z5+Ly1j5tMQ=;
 b=bvi+CZYKQv7RdnW9A3C8oqU7PVlqdbHw/kBJqSkfPEoPqJFfCNMz2zGyIBTls94Dj0eJquA2d8YrArAuYWVusMoYg/+sUf9J5P8GAVZZV7EvHWjqMATrjEiZ6IBSiXFbHzoeJhuDXs3H7EWCYygsKofo7tPzl1+un0QL2ch4nHZd7BaW3Qr5B8nHfTWvxIAaCu/3FGmxsPmDCdkkOs2Jdfz5TfJkZNfe9jg2EMYHhu3z3I4M2CTZeYb5jwYsTRz4xICfkjtdpjcrAm7+20zIMwaXtD1SKD+P6HZoKVfsxCLkjGafS6b3XUHLaOVXDPfdNR5uFR/VSiSa8rAMlBPMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2oQjlAjsnkU1jzUyvBw/p4Mx+Lb0U89Z5+Ly1j5tMQ=;
 b=jqLqY0oS8k9/45qFsrXSfAppVM6Z6faED+MPZDSG37PWEcSHulxlMhyz5m/CHINoYbyka9X1zZhIaH/U1tgPXke91d+VeY+024r0+edxWIhfZffL8RpaQXh1zBunb/2VHexEcaBb/q9DfY7x7M5rcKqUhWvPlCCYnCZXBj4qmZk3Bw4zzJeqLOGOfwXI8kNANQY7O4zAlXZTsI5lCLXqmVoK0xYEWNJUtiY1d0kYXN6RhsuYQjOvxAdFVBMbTN2lR8ZMMghXbxGbtZLPe1Ia216VfiOtJbjYy/2SJY+b8mac5o4wmMhH5qRLk0dJ/rPg4uq8hOcDG8SzQONZQ0VV7A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB7351.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 04:11:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 04:11:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, Alex Henrie <alexhenrie24@gmail.com>,
	"jose.exposito89@gmail.com" <jose.exposito89@gmail.com>, "bruners@gmail.com"
	<bruners@gmail.com>, "seobrien@chromium.org" <seobrien@chromium.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Topic: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Index: AQHbfsf5ZtYaSMawFkyOk+zY5ixT4rNjiQ8AgAB39wCAAAqTgA==
Date: Wed, 5 Mar 2025 04:11:03 +0000
Message-ID: <EE70DDCC-1868-4BBF-B37A-6449A0D25333@live.com>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
 <sp111ppn-q3pn-20rp-92n0-rqn0p2s7s7n5@xreary.bet>
 <93E79E35-15B1-46BC-BA76-C54784351E6A@live.com>
In-Reply-To: <93E79E35-15B1-46BC-BA76-C54784351E6A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB7351:EE_
x-ms-office365-filtering-correlation-id: d78cbf79-8778-43a2-81a2-08dd5b9bbeb1
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|7092599003|8062599003|8060799006|15080799006|19110799003|10035399004|102099032|4302099013|3412199025|440099028|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?YVlFOW9XN3QvZWw4NldyeEt3aWl6U1p1L2tpMW9OLzhpOTRJaElRMlkzOTVP?=
 =?utf-8?B?K0dMbHptL2VzNnhzMUk3WGtxK3FWMGcwa3JsTXBkY2tlVnFSVktYQ0pyVU9H?=
 =?utf-8?B?WHdNWVZpTWhSc055OHpnc3lZMVZhUTA5Y0Zxa0NKTmVYRmVzWnVXMkEvSVUv?=
 =?utf-8?B?ZEUrb1hleUJweTNsa01ubUl2dktXSjVLa0lncWhPemlHbytpSkoyZ2dta3k3?=
 =?utf-8?B?aUNRcnhaWnNaS2Z4TmNwMDVnaDlGN051WWlVR296Ti9KbTRWbjc1MWhvOHpK?=
 =?utf-8?B?L1c1VjFoQkdDcUdSTkhqTFFaMTZkR0pROXE2YXFWbm9QQWlFbWViaHlmbitx?=
 =?utf-8?B?VXlXWTF2UUxhN0VaYXVrR24rOGhoNXNMVVdpVDA5S1djaC9FVkl5QWF5T2ha?=
 =?utf-8?B?V3Q2MGc1RU5HWEgzSFFnQk1Ic2hML0dYYUpLTWVJUytzTE51UnJCOTJ0eU9k?=
 =?utf-8?B?aTUvZWdSTG1TeVhVd25HSVZIaDJYNEdmQ3NpZUJSRW4wbVFSUmVCdTBzRVRR?=
 =?utf-8?B?MTJRV1ZJT3o0VVovZVAzUGN3d2Mra3Nsd0g0UDI1eUpJT3ZhS0dMOE54QUw1?=
 =?utf-8?B?TU1qbnEySlJDVXpJVkM4WStpaDJ5UDZiTWVwb2JicnFHM0dWbUpXcUVYQ3JV?=
 =?utf-8?B?ZVhaNTh4VTFrZnlSdGg1RjFKTGs2WkNPYU1tK043dXowcldaWFFDczhKNllU?=
 =?utf-8?B?ODNzaTh4ejJKZUVDR3F4MXJ4cTZlZUxrV2FqQ3M0Q0Vwbk92TGhJekxnb1Rh?=
 =?utf-8?B?NjNsZ29oaHhkclFEUzdIMnpsYXc4UUZmZXM4UnVXUUJ4a1VuWk9aYU0wNUVh?=
 =?utf-8?B?STN5YVF2VVYyaXpSWlNKdG4rWUNQMlp2T3V4Sy84a2RzTmZiblpjTEtxSWcw?=
 =?utf-8?B?NnVEbE9Gd0dlWlFlWjVhNlVjdHdqSXJvM1dRKzdGS3pzQkxydFZyZHlYZDN6?=
 =?utf-8?B?bisyTzRxYms4MWVvYUxMbW44OHdNd3pFWFU2VDEva2NGOTg5TE1vWWczeHBy?=
 =?utf-8?B?aVJYbTY3d09UZFZXWGhSeElEWnBaaGZ5ZEFXdS9iMDU3bEE4b0FYdGFKdlA4?=
 =?utf-8?B?dGg3Si9SMlJpTngrUi8raURyMEZ1d0NZb0ZPMC9nZzdjNkgyUWxENzZvZ25O?=
 =?utf-8?B?cXh2WDhiSVFOdmJBdmRBNmRmdTR1ZG5Lc2xRWmdFSjJKa3V2c3J5NnV4bTh5?=
 =?utf-8?B?dDBVZ1RQTjFCVDR5dVpWY1hKWHJ0TTRqUnVWRmlja0ZLYSt4a0tZMTNJUHEv?=
 =?utf-8?B?U0FHV0czejR0WFlVd1B3R3hIV3p5dGNaUzJpNW9xQ01IV3RoOG1md0RUODM4?=
 =?utf-8?B?dmZqbVJxQzVQTUF4dWhYOVVZWmZXaHFhd2JERzNzdkVRcjVWWnJmTHNWZUlH?=
 =?utf-8?B?T3RvRWFzVXBjTHVqWlkrZFZ5T0w0WURrNFlEYmNwRWlEVnpyT0hzVENpQTdW?=
 =?utf-8?B?aHVwSXBYL2FheUF0SGE5bkpiTzdPWXpWaVN0QnYydXBFVzFuMFRnbUZSV0Ry?=
 =?utf-8?B?M1ppcFJDa0tBblVXRm9IOUFZVjlpV0xQVUJNbk1jUks5eTByUHh5UWl4M1Jl?=
 =?utf-8?Q?z98h76zJl0jQ8aLJ0LW++00tBd06c17nERatL345AMRkfq?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlRNYzA3bDRwMlNwc2tRZG9IV1NTSHJHbG9WWkp0c00vOXNDNUEyZGlxUEc4?=
 =?utf-8?B?bHM4M0xzci9zYTJsSityTlZDMlN0YjlnVmJwbk1QbGJhdUEyVmtxalNoaXdj?=
 =?utf-8?B?V2p3dzJzNUVubGE5d3luM01TbEdQckdJYjhYcS9CYlRBN1g4V1VPbE0vT2xX?=
 =?utf-8?B?MEZIUk5zUk1MV0wyUGRYT0hxUVlRUWwzbktCWlgraGNoeHRRcmVCYU52cVpl?=
 =?utf-8?B?MTB5SzVjRk8wOVRBOTFLem5iV09TS0VlV1RmQ2tuaGsya1lyamdXVGRXWXF4?=
 =?utf-8?B?UzBLeW53REY4ZHRub0lFQW1wYUdUL0tqOXB6UnY5WmpPWHVyUTFySncwSnN5?=
 =?utf-8?B?QnYxR3MrSVQwZ2ZMMnY0WmNSMEJ0WDBvU2haaGNhbUphU041WDJPRzhIY3hk?=
 =?utf-8?B?dlExUElHYU5xWlpId2tDUElwcmczeHhCY2JLNnF6UjgxelNWaDdkdXVQYUFM?=
 =?utf-8?B?d29QRzBRQ1daS1pYWmh4R051b2RHMk1NejdXZk1rTXRPTE5lbFFZTE90ZWI1?=
 =?utf-8?B?elVESlNqOXFZRzlTMEFUNHNzWGlXM0FyL1VlQWRTTVVLVWdkZXE1Y2NJak5K?=
 =?utf-8?B?ZEVZMGlqRFBGdVJkVE5xbWM0aCtzMFhHZElOWjFLdGQ0UGc2K1NvcCtUK3Va?=
 =?utf-8?B?SWhqNHB6OE5sYmkyWFJLMlQxdWVtYTVwYUV6bVpZVGxXaWtwM1RoSzV6NFZa?=
 =?utf-8?B?ZVhiV0pVd3ZpcUU5dTVwbEVjVy9YZWRzU1lsVG9jRlZXTTd4VFBRTDJGSTFF?=
 =?utf-8?B?ZFVNbGc2RUhvY3NFNWNINEVvOHB0eHc1eUFBZ0Z2SmliN3E2dzYzNXhaSzBT?=
 =?utf-8?B?Nm15WXhlTDh5cGlaV25nakJUb2tObWFUMVM3c2JvRU5CekVtME4xZkNSZDlq?=
 =?utf-8?B?NERkaGhhREVHbGJXSnB0a0JoYStjclRTcTRvRGhlWU8zZSt6TmVJY2Z3cFhE?=
 =?utf-8?B?UzRLRGY3NVJXV21JclRVUXZqNnJVei9CWThGblYvTlVVNGliV0RBZTArS1Zi?=
 =?utf-8?B?RHRwdWpvM3RuTW1YNy9JaFZmV3pTU2VJYXBzTXNHRVNyNDBuQ0g1aloxYkZq?=
 =?utf-8?B?dXZ5STlGK1lGbjhBeU55TXFaOXJCbnp3ZTRHU0txdHpQVm95TjdxT0xRdFJF?=
 =?utf-8?B?WFRxV041bTV3Ti94endQcjhIeXhTanVQdFg3ZGI4STZPS2wzVW9Gc3NESndm?=
 =?utf-8?B?cEZkbUJXWERQNklzM1VjcGt3cDFPaHJzamd0aURncmd1Q3VnN0w2VnZEODNq?=
 =?utf-8?B?eEMvYmczTFV1WENQYnlvVXFSZEZHS2VyZlFZc0pYV2JHb0pKVEtPbnNiaFJI?=
 =?utf-8?B?WDB1a3JZaUNkbVNuTVBLd201d0JLeVdEWVZOMlFFejdHQ3R4S3dnODRWK04w?=
 =?utf-8?B?YVF0RmVta2JjdWxvRFc4LzdhclNaZ0U5anhkdVJid2xEL3pCTkplTE5uMlV5?=
 =?utf-8?B?YVpGZDhFUjEvVnhaeDNEMjJpTFY3b0RRd3A2b3o5eC8ydW9NMGQvTWUxdXJO?=
 =?utf-8?B?UjVlcC8zeFFaUjhQemEvb3lzM0o2WkEyK0dmZWI3K1VZQ3Z5WU9tRW9xeHdi?=
 =?utf-8?B?Q0w2elJYeEdpUnEzclUrMWF6ZzBGcnZMcmIra21Vb2N4dDgrWUVQQW1tUzd0?=
 =?utf-8?B?WHJzWGwwcDNhQlh4WU1kd08xaGxJSnQ5WWNvcDcvMVlNVEwvc3ZkWXZONzQ3?=
 =?utf-8?B?VDhZREVlY2pGWXI2VGx5Mk4zMFlZck1mbUtQWll3Vlc1RmlacGdXaTdROFUz?=
 =?utf-8?Q?DgjTa5znhltIJFx6jE2IU4pnMBhQH9XV5wIqsZ0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DB9E8C57B325041A03C9F27A8DE90FD@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d78cbf79-8778-43a2-81a2-08dd5b9bbeb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 04:11:03.3243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7351

DQoNCj4gT24gNSBNYXIgMjAyNSwgYXQgOTowM+KAr0FNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5
YTA4QGxpdmUuY29tPiB3cm90ZToNCj4gDQo+IEhpIEppcmkNCj4+IA0KPj4gVGhpcyBwYXRjaCBp
cyBjb3JydXB0IC0tIHRoZSBjb250ZXh0IGxpbmVzIGFyZSBtaXNzaW5nIHRoZSBsZWFkaW5nIHNw
YWNlLiANCj4+IEZvciBzb21lIHJlYXNvbiwgaXQncyBvbmx5IHRoZSAxLzQgd2hpY2ggaXMgY29y
cnVwdGVkLCB0aGUgcmVzdCBpcyBmaW5lLg0KPj4gDQo+PiBDYW4geW91IHBsZWFzZSBsb29rIGlu
dG8gdGhpcyBhbmQgcmVzdWJtaXQ/DQo+IA0KPiANCj4gSSBzZW50IGFub3RoZXIgcGF0Y2hzZXQg
eWVzdGVyZGF5IHNpbmNlIGNvbW1vbiB0YWJsZXMgd2VyZSBiZWNvbWluZyBjb25mdXNpbmcgZm9y
IHBlb3BsZSwgc28gZHJvcHBlZCB0aG9zZSBwYXRjaGVzLg0KPiANCj4gUGxlYXNlIHJldmlldyB0
aGlzIHBhdGNoc2V0Og0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW5wdXQv
RjRERjhENTYtNzA5NS00M0FFLUE3ODgtRjEwQjhDRTQ3N0IwQGxpdmUuY29tLw0KDQoNCllvdSBt
YXkgYWxzbyB3YW50IHRvIHJldmlldyB0aGlzIHNtYWxsIHBhdGNoLCB3aGljaCBpcyByZWxhdGVk
Og0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pbnB1dC80Q0JDNzE1QS01OUMyLTQ4
MTUtOEQ5MC02MjY4Mzg1MEUxNzZAbGl2ZS5jb20vVC8jdQ==


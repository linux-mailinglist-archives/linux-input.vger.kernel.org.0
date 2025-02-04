Return-Path: <linux-input+bounces-9748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B371AA26A4F
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 03:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05331161AF3
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 02:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E9B86321;
	Tue,  4 Feb 2025 02:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="V3D/yl9t"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010003.outbound.protection.outlook.com [52.103.68.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C2EC4;
	Tue,  4 Feb 2025 02:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637670; cv=fail; b=AGoMiVb9EgTF1KB2JV7pI+KT5adE2pZfpeJedIwhqKsIQrHobvYxbHl4k6nn9cB6r10BKEvSWn6sWU6M14xIXqAz6vY6n802eEtNIZ89jhvQjSj0oDOFbrxL/2zAqStX/nxTPEXUyOIg6TKgcDgmsWsohRAKVWWQfYGT9D8g4s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637670; c=relaxed/simple;
	bh=ShphQUR1qV25+HX3k5Oncx11ARmoxMEoa0URYjWRC70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ovQ8ZQWArAQCvap5fAVm5bAIr2n7Gqha9IyT7Vsm1wt0Ra9K2Kva0utExph8E3R7T1T+MOe4rb/0IvYQ1veTsgGD0O7OMFEPfTnGl5UnVQQula3VWes2nG/f1YhmPUo8Id9N/pKmWvgoanKfupQjdqNckxxMtMtWK3pkGlAUJWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=V3D/yl9t; arc=fail smtp.client-ip=52.103.68.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBReLBOmKvFXg1WfTQ7JlmTovM2oMei2aLYAaUCqfwEnG7Sjp1jSbJi1TOo/luf4KSIMoboTfbOdR8G9s+uCBXvfFxLiZrSBGYGzl4PWg1CcsrlFKX6lQLR66zRj1j7+zmAAONpBRQ0e8zkdK7vmO4QjmR/UMVCrh7RvhfUn3XLsZKjOI2WBHiOzBjYyS7jpyUhoGRNF4BrTmKrorz6uBo/dVj9MHCleeKTz0RSNqL2c+6ckiJKxH5NZVvkMCfliktvJDgk19QkXNm5rx+yN6CDRbKV8S8uDvYO4pQip0lTAIoH3PLhTunlItaMgLsHFF087IVMutvN+egGAuTEJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShphQUR1qV25+HX3k5Oncx11ARmoxMEoa0URYjWRC70=;
 b=Urt/hQbXAn+gWWzH2CnBFsHS9UM3WJ6xTfcaDhIBzU4CqIW8wY+KJU7jegB1g7HHT0iIzmKS6I46byfjIQJ2p7owZE86JUhWi9T8YqMHAIcExeguzmh9+DR6BhChd4bHJsiQEAS/ZKSxv5eL95CWZPgfxg2rvPibuWUmPW4P0OtO/djBLmaRnqGHyyl27rDvldqU4Nizv8ObEkqFh41eyI8M9piLuuLj6IZiBxCNtkb+3MT60AGe+kKliVHCV/fvheA+Hlr3ERwt1Q7AdV6/9OelWfCA4ZHFD2AhqZFQ4oNMMh4BpEVzp4s+gaIfD+tfQs6MGmLoLf1JuV1swlf9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShphQUR1qV25+HX3k5Oncx11ARmoxMEoa0URYjWRC70=;
 b=V3D/yl9thzCg9pvXNqWpmANkA3r2PJ/oLxo17ATJZKM21z3lKGGs5+d3xi1qn7BB0qRkbq+sjYWl6butiPe1PKb/IdMa5CFaTlFVgu0e3cEbUKR5hqU1O/pppbyXmZgrKlZ0wxzFPuqITqi6T+nScPYgSxznwfUL4w1YRGl1k4J85DMU5MLJJXw16Fj6f7ZxjAETlnEJE+TNUXFfJCU+50KAUuuaMLVc+c5vTIm8OeuqdXs1aCIwj6Nrlu4Xx+MbHj0g7DvBjE8cEyU+0WdmqTfpgR5kLAexra9QPd9bBEm23Foym3yskt+RB+N+xrmL1aVKr2OBHUcP9Dnbd2BChA==
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a7::7)
 by PN3PPF72BFC7774.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 02:54:23 +0000
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b]) by MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 02:54:22 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<linux@weissschuh.net>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<thomas@t-8ch.de>, Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 1/4] HID: hid-appletb-bl: add driver for the
 backlight of Apple Touch Bars
Thread-Topic: [PATCH RESEND v2 1/4] HID: hid-appletb-bl: add driver for the
 backlight of Apple Touch Bars
Thread-Index: AQHbdoZMO4XrVWR7E0WSprIec9kO9bM2ZzX6gAABlwCAAApX6A==
Date: Tue, 4 Feb 2025 02:54:22 +0000
Message-ID:
 <MAZPR01MB8280E739271702303195D417B8F42@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
References: <5AEC08E1-0AEF-49BF-94F6-AA1AD71545D0@live.com>
 <2B5BC9B0-F882-481C-9B09-1FF3978B655D@live.com>
 <4818p982-4254-985r-73r6-380497qnp41p@xreary.bet>
 <MAZPR01MB8280DB01B272D489E700C229B8F42@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
 <034oq462-2on2-9rns-q99n-1p0rn5s66n65@xreary.bet>
In-Reply-To: <034oq462-2on2-9rns-q99n-1p0rn5s66n65@xreary.bet>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8280:EE_|PN3PPF72BFC7774:EE_
x-ms-office365-filtering-correlation-id: 331d33fd-9b5d-4b74-a56f-08dd44c73a93
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8060799006|8062599003|7092599003|15080799006|461199028|6072599003|3412199025|440099028|12091999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVdkcFI2VHhpdlY1aXhQVzVmUkNsSEFiNUxKS3lmL2R4Z0tLcGRZK2poWlVn?=
 =?utf-8?B?cHJXTjJRMllhU3hhdDg0b1hIUnZ1TDl4STh1eG52ZFpjU3BaNzRSODI5RXl5?=
 =?utf-8?B?SEh2VWRFb094T3F1NmJ1aE5sV21JRldTZVl4M2NnSzh5TE9SenVVRkx4OGs0?=
 =?utf-8?B?bkV6cTkzRXdBSnFlVVNBZVNJdVJvOEJuckFGSnB5aXF4WW9QR055RUdWUzJy?=
 =?utf-8?B?dVIrang1MFhPVVgwb1pBdU1ObnBUMitrTEI0WkpHSFhtaWhhckJaT2pZb0Jp?=
 =?utf-8?B?OVMrdGx1OVBGYjcreEJMc0xoZkdmZGNNTTlNVmxidlJ6YzFSREsxb1MwL24v?=
 =?utf-8?B?aHlUSHRZbGx4ZEh2TEN1MHQ1RU0vRnZaZkxjNUcwbWkrQ2lwb2RLSnpLTUtN?=
 =?utf-8?B?VnI3aS9mV3dBdytscjNyMG5Wc2lpY2RWOC9uaXcwNk0xUHloZk9wUDJOcGd5?=
 =?utf-8?B?N2NDd3plaENnNlhLeks5ZkRUeDlTN3pGWGc2S2ZiMlpYR1p1bExMbzk0T20z?=
 =?utf-8?B?bXJXMFV6clBSdWpFQkV5eDhKSnZ1RHNLRitlSXo4WW5EeHBjQ0hMUHFocXhX?=
 =?utf-8?B?bEM4NXNrVzhBRVJaMmZXK0hJQnpFMmJjc0J5N2pVQlBWeDErbHBlQ0orbjFk?=
 =?utf-8?B?cVJzV2hxdUw3dlEvY1NlQzBWQ0VjMnRpYTJPb2FsanhRdFczSkRBb2dwTmxP?=
 =?utf-8?B?WW5CZUIvTlNIT2pTTlNzcUdkZ0dvdWJnQng2TlhpZW95Z01QallDTnZtZjIz?=
 =?utf-8?B?NDZyYlVhZThPTXRxVTNLbnUwZmZuQTNCWDFlR0YxSGhWSk1ZWVZlbHRHTGkv?=
 =?utf-8?B?aTlFQU1CbWUyZjNkeEIvUllHazI3eitQTEtRSjN1d3ExVGdlUmZHK3k3eGQw?=
 =?utf-8?B?ZGtnMVBVZldzSDQyZ0pVaW9VZVBTMURDOUV5aGgyYTZSOG91LzVqUlQxdGpF?=
 =?utf-8?B?VmpuSy9TYkNndHlDQmttNmJITndGWmY1SDBrYUlRcEhzRXBDcVV4RTg0bXBt?=
 =?utf-8?B?TVpQQzhFQ0hrcWMrTlpqL25UK0pWRWhPVjZXNkF3eE9mSkdHbWo1NmZFYVJ4?=
 =?utf-8?B?NjEzbkxtK1h3VEwzcVRORThZUXEvQi91YnBya25JdHFPRnB2d2t5WTZ0dGdZ?=
 =?utf-8?B?amFhTHpJMWVMRWVrak82M3NTQWdPaFZkYi8reTVrcnJkOTAwMVVzYWNGTllo?=
 =?utf-8?B?Z0FBekZCc3pkb2tHaHNsYnhQM2lCR1N3djFFalI2Z2VoRWJ5OGRwblY1WDlO?=
 =?utf-8?B?UVN6ZS94L0NvVU83aFN2T0lUQ1hnQW9pUVFrUWJXSDFFY3lOcWNIYVpMNGU1?=
 =?utf-8?B?anJDSW52c0FJY0lCRXlxUDJxbmR6ZEZ4Tkg1dUZWbENYWTRQSisvY2N4cEt3?=
 =?utf-8?B?M0d6NytOSFBHTUtzdkhVTGNRS2FoMlYrK29aMnJsVFlwaDlIYWIxSkl1Y2pk?=
 =?utf-8?B?M3JzUVBuK3duOU9ZR2JnbEdhSW1yTHM2aUVuM0t6RWpOTFp4Yy8wcWQrV3hI?=
 =?utf-8?B?KzNXanlabGlRTXJOR08wc0tyWEtxMjJCWWF3NnBOQjk1UVJCVzAwSGlmT2xP?=
 =?utf-8?B?Ky9JUT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1ZVT25VazNkQUI3VDl5R2ZGMTBlYzBUTWNmMXJDQkhJc0FFRzZGRkJpUVha?=
 =?utf-8?B?N01QSFZ5OGRRVzdXVEc0R29OTC90OGZhV256OU1KZGhSN0ZXTTVPRUpFMDcz?=
 =?utf-8?B?YUxJZmtVQ05ENFhtWUdONDRJbDRDNTdiWEtHOWgxQ3NWNWx6R01yUkpxMlJP?=
 =?utf-8?B?bWhIS0VMc2hMU3Q4Qk5PdVZXUmd5RXBKbzN3cTBRaVphSmpzbkdOYVdwbVdM?=
 =?utf-8?B?anlRU1pMSXRHeFpUQTdPcFd3c0NObmdtakRXMjg5YXJHdld5eE9sYkVEaEMw?=
 =?utf-8?B?dEtVVDZTeXBFU2RkQ3VITmd3OVhzQmVGWmJuNTZ2a0hkU0w3cTJWcjBWa2Z3?=
 =?utf-8?B?aHg0dlVuNzlDMlhPM1ZJK1BNcG1MRVo5Vmp3YkZmUFZ4RDNuNTJSaVZYSkZF?=
 =?utf-8?B?T2NxbW1ldGdnTmVYZGIySXB2U1NUZFYzLzBjQTdwOXdRWHp4VXI3eHQxOEc2?=
 =?utf-8?B?NTd5dHZFaEZETE1qb053Ym1LNnFzRzJmOFRRN0gxRjBtZmQzbGNjRWRtYjJF?=
 =?utf-8?B?Wm1pYWVFZXNNMU9DelpGNXZuZzRXMElPOUczYmQ0S1FvcUFlOHB0NHllT0JF?=
 =?utf-8?B?RVEzLzh2M0lSK2QvRjVnK3JRc2l1OHpnUytEdTM2SFc5dVAveit2VENBNklE?=
 =?utf-8?B?STJYK3dvV3J5TkxXQzlOWjhtTWVURWxNY0gzNzR6RFMza2hhUkVyZ2ZUOFJC?=
 =?utf-8?B?Mjh1TjR0TVZmY1hNaTdrMEJhbGVrZkxDTGZ6VlNmUUhKMjh2UWhuR05kdFlN?=
 =?utf-8?B?bzFlenFCSjMwVGVNdDk0c3ZTMDh2Z2g0clpMc0l3QlllQkNReVhucUk1ZDlM?=
 =?utf-8?B?TUZIZkNId3F0M3VQUzVoanJ6Ym5pYTMzK2I2bkR1d1VLbThmdTlqSW5vQitB?=
 =?utf-8?B?YWMyZVg2WGNzWXlDUDBQK01wY3RKMkw0c3l5SlJremV0YXNWZXg0WmFJbU1z?=
 =?utf-8?B?TjFJdk5wUitqVW00Z0QzaHgrN3c5SHJhenNGcFBFb3RuVjhsUndGT0dIc1JH?=
 =?utf-8?B?NkVHUWZLVkVYUFFZamgxK0Rad1Y5cFpIOVc4S1hhckhSRTdYNk45ZS9yTEhQ?=
 =?utf-8?B?aFEwWjcwYmhiTUt3ZTFqY1VES3YzdFhFUzlQTkhjMlFWZkFEOTZiVUNoQXlt?=
 =?utf-8?B?cDhMRFJJeUcvTmlhOGk5ZWhxUktVSTNFMkcvQVN4UVFyWXk2UDVoODN6QTRt?=
 =?utf-8?B?ZklGZVlleVpZY09admxwSjZXRXdmWUN0UyswWjhjVjd3eVB3cy96NUF5T1l2?=
 =?utf-8?B?OFJuaXlNZnlmdWVQV01YUkUzVEdIYlZwK0padlIwRmxZd0wraU1rY2tBOS9Q?=
 =?utf-8?B?bHlSVElzT0ttZDBtcGlUc0t6cnYybHpQdzNNMHJWYklvTlFmN1Nuck1SN2tW?=
 =?utf-8?B?ZFg5WXJKaGhPeFFpbEVNaXZFcUhacS9GMUFkV01GRWY1Ykx6eTV2SzFEVFpQ?=
 =?utf-8?B?MFFLYTIyTU1IMFQ4NUdTZmhNREpHTVQxNFlOZkRyUXhNbUNNVWFmSWVHZXVU?=
 =?utf-8?B?eFZ6azluaXNEdXVVSGcrczB2ZEhxcFN1cDhIR0dsUW5vVHk5bHEvLzhvNEN4?=
 =?utf-8?B?SjJqdFFmdUJkcWp5bWhHbkNMeVRpbnFvL1Z5bENTcVcvaFh1NkxaREFBb1Rt?=
 =?utf-8?B?d2NRazZ4MDlVRzQyMmwzRWY3b3RnTVVtNkVYNUdzbmRtOWxnODBiOHp1amRW?=
 =?utf-8?B?VElCSENWaTFtNFJ6cS95VGcrcEdzMzFhRUc4c2t6VCtlQlJOVjRONWFWR0tq?=
 =?utf-8?Q?cphE/Y1OgF41GK1NBM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 331d33fd-9b5d-4b74-a56f-08dd44c73a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 02:54:22.8194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF72BFC7774

DQoNCj4gT24gNCBGZWIgMjAyNSwgYXQgNzo0N+KAr0FNLCBKaXJpIEtvc2luYSA8amlrb3NAa2Vy
bmVsLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiBUdWUsIDQgRmViIDIwMjUsIEFkaXR5YSBHYXJn
IHdyb3RlOg0KPiANCj4+IFlvdSBtaWdodCBoYXZlIG5vdGljZWQgdGhhdCB0aGUgaGlkLWFwcGxl
IGRyaXZlciBoYXMgY29kZSBmb3IgdGhlIG1hZ2ljDQo+PiBiYWNrbGlnaHQuIE5vdyB3ZSBoYXZl
IGEgY2FzZSBvZiBNYWNCb29rIEFpciAyMDIwLCB3aGljaCBkb2VzIG5vdCBoYXZlIGENCj4+IHRv
dWNoYmFyIGJ1dCBzdGlsbCBzaG93cyBwcmVzZW5jZSBvZiB0aGUgdG91Y2hiYXIgYmFja2xpZ2h0
IGRldmljZSwganVzdA0KPj4gYmVjYXVzZSBpdCBuZWVkcyBpdCBmb3IgdGhlIGtleWJvYXJkIGJh
Y2tsaWdodC4gSW4gY2FzZSB3ZSBtZXJnZSBib3RoDQo+PiB0aGUgYmFja2xpZ2h0IGFuZCB0b3Vj
aGJhciBjb2RlIGluIGEgZHJpdmVyLCBvbiB0aGF0IG1vZGVsLCB0aGUNCj4+IGJhY2tsaWdodCBi
cmVha3MuIElmIGtlcHQgc2VwYXJhdGUsIHRoZSB0b3VjaGJhciBkcml2ZXIgc2ltcGx5IGRvZXNu
J3QNCj4+IGxvYWQgYW5kIGJhY2tsaWdodCB3b3Jrcy4NCj4gDQo+IFNvcnJ5IGZvciBiZWluZyBk
ZW5zZSwgYnV0IGRvZXMgdGhhdCBtZWFuIHRoYXQgaXQncyBlaXRoZXIgaGlkLWFwcGxldGItYmwN
Cj4gb3IgaGlkLWFwcGxlLCBidXQgbmV2ZXIgYm90aCB0byBtYWtlIGEgZ29vZCB1c2VyIGV4cGVy
aWVuY2Ugb24gdGhvc2UNCj4gZGV2aWNlcz8NCj4gDQo+IElmIHNvLCBjYW4geW91IHBsZWFzZSBw
b2ludCBvdXQgd2hhdCBleGFjdGx5IGlzIHRoZSByZWFzb24/DQo+IA0KPiBFaXRoZXIgdGhvc2Ug
aGF2ZSBkaWZmZXJlbnQgVklEL1BJRCBjb21iaW5hdGlvbiwgYW5kIHRoZW4gaXQgY2FuIGJlIGVh
c2lseQ0KPiBtYWRlIGNvbmRpdGlvbmFsIGJvdGggaW4gY29kZSBhbmQgaW4gcnVudGltZS4NCj4g
QXJlIHdlIHRhbGtpbmcgYWJvdXQgY29uZmxpY3RpbmcgVklEL1BJRCBjb21iaW5hdGlvbnMsIHNv
bWUgb2YgdGhlbQ0KPiBuZWVkaW5nIGN1cnJlbnQgaGlkLWFwcGxlLCBhbmQgc29tZSBvZiB0aGVt
IG5lZWRpbmcgKGluIGEgbXV0dWFsbHkNCj4gZXhjbHVzaXZlIHdheSkgaGlkLWFwcGxldGItYmw/
DQo+IA0KDQpUaGUgZHJpdmVyIHVzZXMgdGhlIDB0aCBpbnRlcmZhY2UgZm9yIG1hbmFnaW5nIHRo
ZSB0b3VjaGJhciBhbmQgdGhlIDFzdCBpbnRlcmZhY2UgZm9yIGJhY2tsaWdodCwgYnV0IHRoZXJl
IGlzIG5vIHRvdWNoYmFyIG9uIE1hY0Jvb2sgQWlyIDIwMjAsIHNvIHRoZSAwdGggaW50ZXJmYWNl
IGlzIHVzZWQgZm9yIGJhY2tsaWdodCBvbiB0aGF0Lg0KDQpJIHJlbWVtYmVyIHRoZSBhdXRob3Ig
dHJ5aW5nIHZhcmlvdXMgY29tYmluYXRpb25zLCBidXQgaGF2aW5nIGEgc2VwYXJhdGUgZHJpdmVy
IHdhcyB0aGUgbW9zdCBmZWFzaWJsZSBvcHRpb24sIGJvdGggZm9yIGJhY2tsaWdodCwgYW5kIHRo
ZSBkcml2ZXJzIGZvciB3aW5kb3dzIGFuZCBtYWNPUyBtb2RlLg0KDQo+IFRoYW5rcywNCj4gDQo+
IC0tDQo+IEppcmkgS29zaW5hDQo+IFNVU0UgTGFicw0KPiANCg==


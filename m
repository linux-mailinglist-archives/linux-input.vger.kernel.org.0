Return-Path: <linux-input+bounces-10624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD02A56772
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 13:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B92663B60C4
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1C7218587;
	Fri,  7 Mar 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ndWnKXtO"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010012.outbound.protection.outlook.com [52.103.68.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0C2185BB;
	Fri,  7 Mar 2025 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348963; cv=fail; b=LQaKt1dP9WRaz/uzprqgOtEDakxLAs1SA27AZbmnoAIis+t+bUIJB2RzqoNYy3PDiOrvhnVdjuV+WT5+4u7o3XHrbnYuBbGHkmcAoWS8YqUy2KpmvwYoh79EcPuaBCFBof6fRqGsbRoBKo21YOsqyyggNk5SxfuA+S2YIvi7zGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348963; c=relaxed/simple;
	bh=eg/vPC2J+I0aPAd7HJ9TgZ6XHIStlShv3JF7tmoVub4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oaz8j43fF6Vhl29OOfBb+kmto0J6H1bcHf8ebAc+iGxzlLUYReUsewqKagI6JCO4mqE8X2DJf7mwQWy6o3AGj9uw5+LuR0WT+LSqMdRo0fgwKqgt0d3pO52m+QciSA0XJe7a7JKQdHgtF/MdGm7P17rSKYPRsuOOs15JmFSOG+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ndWnKXtO; arc=fail smtp.client-ip=52.103.68.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Glcj9M+CrdCP+XOUwTZfS1+oRRiAGN0QIAKdMQCqZmMHAXZdQ4PGrquiP7fo01PMvT1AOp3kChomf8uJmm81CnGONIG+2lWdcPpm55IpptWOzn3nUdQh1sqsSuov1Uvau0yF2cAwmmc6h/0jeEzcE5ohS9PrxKkrNpc72FFR4PJFHN96Be7GSSsTTdupFZTE+lpSq9yKbHPsHvkZoQsHTVp6q4oFWUEGWRWsl+J3gnAasPeQmZGv7HLG8skWylUc1pGCKFzBXvRioN4I+Ooq7XDscdcUp9O1J2Ut12xrYT3Biz/eoo7sSC0KlsSN4SCAycgGO4YXT0hD2f7sxOniKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg/vPC2J+I0aPAd7HJ9TgZ6XHIStlShv3JF7tmoVub4=;
 b=nhen5LeuhqXVJt6oGFnsB8T2omZBGxsf2g7E/j4P65Y8eJVHMtfLNbkpw61nkqEP+Ybed2T7U6vPKEOA6aE/Dmtuv5PddrlxfHej9PUIce1nPXR3KHs03AIV1dRTKxP5/M4wMbWw5otRTq7r94y2duijD8HCEWT3rHHmt7dz1VdweU/xK44nc2ZEcDFQQt0xzTJTOkXpz3j/y2E5cFS/qNqkaszZOZNVLMKD/NBthCfTY+IFAC7AVEX0+sX2yYOCd12J3xf8MbX/Mm2ZPhLGjzXR8ZsvW7FA0QR0Wkg2+vdRDy0Ezx/S7uiDOlfl3q7H/pl5u+yc8S6jlzWkIUv3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg/vPC2J+I0aPAd7HJ9TgZ6XHIStlShv3JF7tmoVub4=;
 b=ndWnKXtOKrMD26BbnnZvflAmTKUhUdvyEF72LQsffLdgGZrjDy2ajA1kWEea3jRhUqHvef3B0CVDvPz1t7aYr8nymjvEXYILfhVZJWyJj84rUkeeM0aknGrksMC7THLYWrgrqc0ESIDrDX5dDqNZFJ/kblN4psRHj18v+ZP2opewsTi6vx8H1K3bWPgBFi35MCSH++xmRGaYTpg3tAcg+WZNaa8i6TOnrmUDaHmStdxJKpZRO00+YMkI6SaDsXPi2vFHQVFRK5k95ETNrJpOIxlyxsB1+0HBA6VDbYBuFx0w0vW5FmrkBQLt5OoW8s72yPlig5IuU7RkJfjdwAMQOw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB10324.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 12:02:37 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 12:02:37 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH 0/2] HID: apple: improvements for code readability
Thread-Topic: [PATCH 0/2] HID: apple: improvements for code readability
Thread-Index: AQHbjOWeYbAjq5CZZ0K66WACeM/Uw7Nnl8mA
Date: Fri, 7 Mar 2025 12:02:36 +0000
Message-ID: <DA80C1BF-4E90-4F1A-BE83-BFE25D5415A4@live.com>
References: <F4DF8D56-7095-43AE-A788-F10B8CE477B0@live.com>
In-Reply-To: <F4DF8D56-7095-43AE-A788-F10B8CE477B0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB10324:EE_
x-ms-office365-filtering-correlation-id: 80ff81db-3be7-4e1c-97ca-08dd5d6ff3d5
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|8062599003|461199028|15080799006|7092599003|3412199025|440099028|10035399004|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkVIQlBzdUJGWEJ6cyszY1gwNThNbndXV0poTlUxaWlWSXhTZ092UXVQWXRn?=
 =?utf-8?B?bnE1Q2pORDllY3lhVXo5V0FYdkRvOUs5L0FqMDJkTTJ2azVXaUJSRUM2a0xK?=
 =?utf-8?B?QzdQYmRnNEhmemFLZ1JqY0QzalNqYWdJR0grU09kYkhOYjJ3a3JEL1FYbE5q?=
 =?utf-8?B?TDIyRmF6eWplVDFlRUhWZVNPN1UrdTdoUEFGNXUxS0NrWGwrYi96Wmc5azdV?=
 =?utf-8?B?UmQrZnM5ZU5HN2hTaGJzSWpKNTFmS3g1Nm9hcGJLb1pXeHkwUG9TdUhudFo5?=
 =?utf-8?B?SDRMWHZza1Y5eHRUTHlYVFVEaDVzaGl6M0VjRDkwSy9WQ29BaVVST3ExK2Jn?=
 =?utf-8?B?VUZUb0EvT1pmRDM4NkhuN3QyV3EzL1ZSWUpYc1cxRFVLQjZ1b2xMWTA3ZXR4?=
 =?utf-8?B?WC9yWUJlL3VnQzdHZUxEM3l1VW9wM3dUSUk5WU5zWVk1Q3AvZ3c0UXhuamtk?=
 =?utf-8?B?ZzRhSjcvOGlTY05FalJmNnIyRk1wc1NQQlpVbmd6enhsRGtwRGp3OU8vbEJz?=
 =?utf-8?B?OEdYU3haTUdCZGh0Q2RDMDBjaVBoM3BZL1phcU5ydUZqVTRIZG9CWVBodzhX?=
 =?utf-8?B?RXp1VjliNkhsY0E3NHQxRnB5Uk5hazIvVndTN0NhT0JlMHI2d1RWcUUxVTRN?=
 =?utf-8?B?Z0pKSGkxK0VqVzRGc2xwbTNiOTY0T1FKNUg0aWwvQkRPclUwYlJFaUlrRUt5?=
 =?utf-8?B?dHdXZzBhdFBPanlsdjJNbTRCQjd3TE1LZE13ZlNNbkN6SkZqdXRlNllIdG1p?=
 =?utf-8?B?RS9FVEtUV1UzU2IyOStZaXJsZWNVUUxvV0V4K0hLTzVlWU84Y1E0QkwvbWtw?=
 =?utf-8?B?WG9KblFRMzJMTFZwYkNkWkJiak04SkN1UXhtTDViQTBvcnJ3bGtsN1hUZTBD?=
 =?utf-8?B?OGtsdXdHWGFJWElQbXhJcmNBMXFhcXkreTltdWtxeVk5MWZPeXMyNzVpRlFK?=
 =?utf-8?B?YUhVa2VnY2VYVlhyR3UxTGJ0cUdUeTE1WTRQd0dOajU0dmYxTFBRRzQrdFkz?=
 =?utf-8?B?bUZQNWZsWmpEeE5TbFlocXg4K2RYSEZneUo2enJ5YnZvczMraWhzMU11eGYy?=
 =?utf-8?B?Y05CRTFpZnB4cnZzS3dNTU5mZGJUTmR1V0xHUnE2TkcwRnBaby95WUk1Y00z?=
 =?utf-8?B?NCtwaUdFOFlTV01ISzV1YWRMR1JwMHc0NTR1NEQwMFEycFBqUW9idEt1RFdX?=
 =?utf-8?B?Tm50cERjN0VoSXhKeDdtQlRFbkE0MERjNDd2d2piejBNa1VsNXNFWjYvc3BM?=
 =?utf-8?B?aloxbkJRZ0JoajVhK2IxL1ZMY0xHbm5US1NYR3FGejNRd0dzbkJqY0Z4YWdx?=
 =?utf-8?B?VkRkWjNma2t4M1cySTFDN0JmOE9xVFovUFZoRkJrbnB5NHE3TWYvWHNGbER2?=
 =?utf-8?B?d2NicnNtSjBNU2h5V09ObXFKbGNZUy9vRlNhQmJqdDNOd0FaV2hKTTZ0NW1S?=
 =?utf-8?B?STJUTGdiQ2xTdlBtbWZabXZIeW5zTVFVVDl5WDVXVUptTkRVZ3p6VnBweFpG?=
 =?utf-8?B?NHVUT1hQdU5VL3BNNkFOU3N4bjl4OFBqY1VhZXdpS3Y5bEgvdDdQUzVCVzk2?=
 =?utf-8?B?UnRXbEJYOWF3RGFPa3FlNzFwL3FIUGFkOHYzQzU1ck15b1lTS2thSENYWHpw?=
 =?utf-8?B?U1F6dlNFV0RKZWFhTEMxMmh3VnB1WXc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZC8xZWJCdTdMWXJmcE5aR2g0dXE5VkJVMmdRL1F6QWJnL3pORlpwQk04MzZk?=
 =?utf-8?B?QkZoUjA5b0pVQWJtS2hSMlZSM2ovSkdFRDhNMEdNQTgrTHZ4NThJN0tscGRQ?=
 =?utf-8?B?djFpKzFPMEo0aWFMRU5YZWZxTGY4c2lLL3NOdDZGY1Q1RjBYdEpNTDdQdUp3?=
 =?utf-8?B?VUVpMUV6Q05ZVktwaXVZRWdkK05nSXF4cFNwSWZsUHpSeEVJbjJOQ0N0TzNY?=
 =?utf-8?B?c3ZZMHhNcUpXL1Q5dUh5NFgxTnFkNGZwSFhubVYxakVHeVdvcGhYMXJiYk9D?=
 =?utf-8?B?aTBjMStkY20zdElRYmc4dWhtSUFmZlI5aXozY2FsY01PNEJ4bDNVdW1YOXBw?=
 =?utf-8?B?aFFZV0V1SzMzQ1NVWTFUdFhuVGExb0lXVzBJTUhGOEUzcXF6K0MraGpLWmlZ?=
 =?utf-8?B?MHZlK0Q1aWp1N2NqUXBlTjJQUVB4dXVzYjQ3bmFVS1hvT0RtZ09aU3VMSURk?=
 =?utf-8?B?VlM2cTB4U0lyeHFtTnpNaGJuM2R2MFZOODQ5OUxYelJmUElyWm5zT0YwNGZF?=
 =?utf-8?B?bjBZYWJJUXBWalYySTQ5ZlY5KzFsYlFTVk9UTjB2OGZrWG5vZkgybnA4emNj?=
 =?utf-8?B?OUlaQk1lSEYzSDVkL0E1RVR5cVBNSlJoYTUwS25PUlZPK1QwbXdwT1MxUmU2?=
 =?utf-8?B?ZThWaWF3T0pzNWhBM0pPWHRSVkVPajNDcGlSdlRSWDREbEM1WFlLQlF2YnVL?=
 =?utf-8?B?bk85eEhMYklHQ3pncCs3S1lBZmVkSDZsWEUrTTF2K1BpcFJyNHdUYktvOXg1?=
 =?utf-8?B?ZHVrRTlNeXFPVEQ3Q29XbmhSZ21QMFNJZW5kaTFxMkEvd2ZYZzNiMXVDY3I5?=
 =?utf-8?B?V0kxcTJJSW15ZUdEbGlNK1dFTlZPUUdSTVRMWnQvVDhHTDFLZVhsS3Z0K1NU?=
 =?utf-8?B?SXNISENRTnhHWFhaRmxFZlhreFdMMkFrRFhVaVAwT0dTZFZTTFdtdnZOblpi?=
 =?utf-8?B?OFZvZlY5Zk44aFY4dzdUa0lxbjg3T1BqNUVPb295QWRaTHAwc2pUZjBPY1V4?=
 =?utf-8?B?VFRBMFFaOHhKNERBaFlZdnRCYURUMUViTlM1dUlhWXV2T05Oby9lelRZNktS?=
 =?utf-8?B?dWsveENkUEJDdyt3L3ZuU25yNVNFc29uVmlJRWhLYXpjQUUydnRnRmFwbk8z?=
 =?utf-8?B?ODdSdmxPNkxvSUpycExSQTgzU0hTNURuZDAwV21oeE1Kclh1SFJXQ2U3UEwy?=
 =?utf-8?B?Mm1HSUU0RElNV1JxWmIvZ0JKY3dlYVhjQTZRek9oWmZwN1F5d1JTMDQ2RWM0?=
 =?utf-8?B?SS9JTG1hZlc1alRUbzFySyswM1NENXhUZUpTYXcyTDRPTUJFRFlZc1dVTU5J?=
 =?utf-8?B?ZmtNZ0dqZlFPWlpyL2xBdGFxRzdpWGdHaCsvRXYvNm5Geit3dDZUZFFveDE2?=
 =?utf-8?B?cjlFQ0RuQUpmOE1sZUEraFNPblpLN3RCOGZrUUFoaEUveGNIR0FpNHRBc1VC?=
 =?utf-8?B?V0xYVkYwMzluOWp0djhFNW1oTW8rOXJ2WWNpTlJuSEE2ZFdYVHlybzVSQVpK?=
 =?utf-8?B?UzVMZDV3N1o5R0JkTHp2S0c4NUI4eEx5VVpBNW1LWS9xTDBZOEp2U0U5TGtm?=
 =?utf-8?B?SDVuOFloSVpuYSttUUJnRVpSalZ4MTVZZU4wMEpEaU9QSWVNRDFUa20rb1FM?=
 =?utf-8?B?RU01UWg4YzBCVTk5M0xOZXFYYXpCRGRpR1FKWFNkSTd0cWJrckZlK2dyUkxR?=
 =?utf-8?B?Zk9vUy83eHFXY1ptcWIvbFowWWZMc1orSzM5eVh4TGdpZlhxcG1CcWZ6UGll?=
 =?utf-8?Q?lxDb9FIw18/pYYsjWalmYzOPMGz1Ki3hn1gFQzD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD65E16DCBE28B42A4B6D91951A26BF8@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ff81db-3be7-4e1c-97ca-08dd5d6ff3d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 12:02:36.9777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10324

DQoNCj4gT24gNCBNYXIgMjAyNSwgYXQgMjo0MuKAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5
YTA4QGxpdmUuY29tPiB3cm90ZToNCj4gDQo+IEhpDQo+IA0KPiBUaGlzIHNtYWxsIHBhdGNoIHNl
cmllcyBhaW1zIHRvIGltcHJvdmUgdGhlIGNvZGUgcmVhZGFiaWxpdHkgaW4gaGlkLWFwcGxlLg0K
PiANCj4gVGhlIGZpcnN0IHBhdGNoIG1vdmVzIHRoZSBiYWNrbGlnaHQgcmVwb3J0IHN0cnVjdHMs
IHRoYXQgd2VyZSBpbmNvcnJlY3RseQ0KPiBwbGFjZWQgYmV0d2VlbiB0aGUgdHJhbnNsYXRpb24g
dGFibGVzLCB0byBvdGhlciByZWxhdGVkIGJhY2tsaWdodCBzdHJ1Y3RzLg0KPiANCj4gVGhlIHNl
Y29uZCBwYXRjaCBtYWtlcyB1c2Ugb2Ygc3dpdGNoIGNhc2Ugc3RhdGVtZW50cyBmb3IgdGhlIGV2
ZXINCj4gaW5jcmVhc2luZyBsZW5ndGh5IGRldmljZSB0YWJsZSBmb3IgZm4gdHJhbnNsYXRpb24u
DQo+IA0KPiBBZGl0eWEgR2FyZyAoMik6DQo+ICBISUQ6IGFwcGxlOiBtb3ZlIGJhY2tsaWdodCBy
ZXBvcnQgc3RydWN0cyBhbG9uZ3dpdGggb3RoZXIgYmFja2xpZ2h0DQo+ICAgIHN0cnVjdHMNCj4g
IEhJRDogYXBwbGU6IHVzZSBzd2l0Y2ggY2FzZSB0byBzZXQgZm4gdHJhbnNsYXRpb24gdGFibGUN
Cj4gDQo+IGRyaXZlcnMvaGlkL2hpZC1hcHBsZS5jIHwgMTAwICsrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyks
IDQ2IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCg0KQSB2MiB3aXRoIG1v
cmUgcGF0Y2hlcyBoYXMgYmVlbiBzZW50IGhlcmU6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWlucHV0L0E0RkJFQTU0LUM3QkEtNDg2NC05QzRFLUU0MTkzM0Q4MUZCMEBsaXZlLmNv
bS9ULyN0DQoNCg0KVGhlcmUgd2VyZSBjb25mbGljdGluZyBwYXRjaGVzIHNlbnQgdXBzdHJlYW0g
YnkgYW5vdGhlciBwZXJzb24sIHNvIGl0cyBiZXN0IHRvIGNvbWJpbmUgdGhlbSBpbiBvbmUgc2Vy
aWVzLCBtYWtpbmcgdGhpbmdzIGVhc2llciBmb3IgYm90aCBvZiB1cy4=


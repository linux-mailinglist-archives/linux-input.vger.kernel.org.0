Return-Path: <linux-input+bounces-4797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23554923AA1
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 11:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30C81F22042
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 09:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC2E15665B;
	Tue,  2 Jul 2024 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="H4krv3pN"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2049.outbound.protection.outlook.com [40.92.102.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7468156255;
	Tue,  2 Jul 2024 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719913815; cv=fail; b=YF5mMkua5ghHJyDjoaw465z27BnaNSLIeJMK8cdtyV7xZJ72aXBrETlBBRi22aQ5dJRcXtVaJ8lb4aGtGpM32qE8Nnd0TC1SYViSvK04HwOi6aOg3gx9fyLDBWggHHrVhfBa3Cf0DMKaDkC5cfMIw+3MbyYAQTuIvwFU9wdkA38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719913815; c=relaxed/simple;
	bh=SjilrZxMz7BeQW4Mn1XzrCLMv0EEEVYPUl2fcjjSCm8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kW0XoiFhETrOZ74/L1XqaVy0MNTYED3QfI5qTNAMHfuKI8nB5ZXo8NGwcwiNYS2noW3kRMqZ1Dc455Ad5ML0EPmEekkViUNEC5PxUVTWnZMovwPvOyuMxSs4WX4ZC4U2k5Drgb58Zrmbn+JfDKzFHTpKnnTmb4sPSPIa6/rSr8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=H4krv3pN; arc=fail smtp.client-ip=40.92.102.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqC2FNC+YhWtpqOqyc6rae2Hb3rPM2O/42ms7lbuJz1ztAfYgoB6WwUpB4/qUpEKjtHsoeDHmCBVGA/yyFaz1jms28WB+wCreHZcLk9s5jaeNnw1wgjpQ7LFUvTZqAjJHbTSRzrPvE+AJC03+Sx0OKmv6N16T4pUmY1KEjcjMhM+eyN6D3DIY/a0/e9QFFJSHn2q4wFpvZxm/tBryJpkoGi9u7jys73jAUM2TWx7NJfgsyOdcKlM75nIWxAGmYV4BXQqLjzKcxJg21UWp/yWoA4BCahqVcHgiVlYxvYcA7pAMPdv0owIXhycfyMhm3J2PQoVAxH0I0VZcrR4cezGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjilrZxMz7BeQW4Mn1XzrCLMv0EEEVYPUl2fcjjSCm8=;
 b=a8PJ+0pT5mEV1XbJXtz/tK3tDdX1nmksQ3zASsB0WyAhXsI+ZqS3nWYJfGTt3vV+mP5O6kThwty6QQM0rY8T+AZ8LnSQOcpEahogLEms6/o1QCo7YHDy1zy5vLOC206jLVpmoDKemXvNU3i51zSwqOqjhZ29cYjb3I5e7JRMPtI7NJgsRz0kfkJ7BljIAvl6zgMGQ08EbUHpejddywT36YLHzKJmcnhz/nafIOJ5ohsmCbcaydoZMKcMbOzJQb+5jC8glcWjxleULCYIOkFn8mesBssJzTwQs1A3S1txfZa99NXSH1Pwy/smb8Vp+Yrr4eExz/EpWSYUK0YfgyJxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjilrZxMz7BeQW4Mn1XzrCLMv0EEEVYPUl2fcjjSCm8=;
 b=H4krv3pNCZNMDB8kYqhgwCJVPAtfhUi+2NLxgRSapdVclaKsKUtOlUzuJ9OLm906nFqmvKCkfpDD5jplYlkJoXi558mk7tOnyEBcURQ1XQJrTApSlXEXqEH/hdK4eXwwZBpkUGLAIJkaL1160tudcXTMKNts/gvto5hbzPZx5QXetytT8K0h28NpqvX90usi/04HN8PvcHo0Z1uBqpb+PKXVPhKTdtOEKbVuTg2QIql+ZX0y6kHylduB2dLb/vhyeSFi2ceahRCcQsCYMVxAw27PT+1Axnlww2MqPzGWLROyoaWwysBUDbQmzgXv8oMeN6eiOtF3qdh0Wmz74g1O4g==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1418.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Tue, 2 Jul 2024 09:50:09 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 09:50:09 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Orlando Chamberlain <orlandoch.dev@gmail.com>
CC: Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: apple: Add support for magic keyboard backlight on
 T2 Macs
Thread-Topic: [PATCH] HID: apple: Add support for magic keyboard backlight on
 T2 Macs
Thread-Index: AQHay6PH5ldcO3kl80evALAvsJ3vq7HiLwsvgABLSACAAAJ3gIAAtmHr
Date: Tue, 2 Jul 2024 09:50:09 +0000
Message-ID:
 <MA0P287MB0217895AB52142877C726851B8DC2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <8DC4D384-1349-4C8A-848D-589BA25B15D2@gmail.com>
 <B28CFBDD-16ED-41AE-AE4A-92066D0DD4D8@gmail.com>
In-Reply-To: <B28CFBDD-16ED-41AE-AE4A-92066D0DD4D8@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [rpaCEpUKAsN2NMwKBoslji8RH0WxX6I87Yv+OrLjPNecHzoPiA1+YC59SZ63Sou6YRuL+h7Q5uQ=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1418:EE_
x-ms-office365-filtering-correlation-id: 597de8ca-12e0-4cdb-c023-08dc9a7c5c24
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 +UO28U9rL4d2CkMgJ1gs6f8z0D5h+ZWHSjZDvD8yIvKf7xfUnIQlRYuCH1zG4RVmiaaG8c1QXtXaBLGnQRyAO2FjB6aENS0Tt1+/DFw8sOSqaxykHk3XH4J9+ETItFOCMz6zi2CUy2VByvOC84L4wKL+/QVPz02DRk7a0iHjXofaa/bFy2nSfBPDy8qXXSbl4BUcG+G4YvPmSUxO61TIVQMszxxS+bVpE95J1LF+7o2vFUFFQbjJxElwBiVs0JJN8MdnyAUr0vg/X6vmc0JtQHY8fw2w2cBdrTNIN+e8tg9omkLihhJ3XWxWHl0k1NrbbTZc+cjohGf3MLQ3rRT43sadvEKiF+/Q/PZNxl3vBwcOq2lNklqN6Ltm1dFOUABBdmTXzdla+SdfXyOII4yCz7BDUCdYzq9Upe+Z6fvCPHoOmgS2OUJ8lvV0s/O/hYiGEcbfymPq4yxSFQUqR9cAaMnEmgQr1qpsrNjbLnqrFjQmJUIsZ/0E46gUcaAemoB8NHitGuy9h2taounDQIHnRHAn2mJSDDg8qWz9TA4x3UI3AkM//3yPVXs7gWRR2Uqu7FscI35Eqmi9JOqtfq4cTTuwP63ccFOx3ZSFzu6KQM9lTWlI246d2oM3+eBL5UOb
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjdrS3ZYS2dKNjVLeFg0cmJuTWl3djh4NWNkSW83TWg4T1dkejF6OGR6TGIx?=
 =?utf-8?B?K2lsTjdEMUljM3R4eXQyZlFkS3F1VzFCa2YrK09FZmNVNTRjNDVkb2dXRFdD?=
 =?utf-8?B?SkVndy82anZDeHNaYXE4L2V2TnRjajUySThEZDBkbzNXbUlYZlNLNytDNFFJ?=
 =?utf-8?B?RitqOGtzd3JPUnNDNDdLNWZlT0VDdUFNcU1DVWRROCtYb2toSXZvZGlVT3NG?=
 =?utf-8?B?bXJneUNjeDhueTlXR1NkYXJXbEd4Q3RZYU5WLzFCcjdBMks1TjJZaSt2Umwx?=
 =?utf-8?B?ZHRvWmd2RERWQSs1R0dsTkN1dDlKN3ZoTGZOUjFnbTJrODNLTWJtTEVvK1Zx?=
 =?utf-8?B?WWE5WHRpKzEzUUJCTkN2UmE1ejhocmZ0d2ZXSkIrNUQydHFacHhab20yZHFn?=
 =?utf-8?B?cE5iVkx6YXhqSUtIc3F0RDk4ZXgzRlJ3aWJ5ZlBhdGc5S1dDd3IyTWdCNnN1?=
 =?utf-8?B?bzF0RFVUYlVtY0lNTEpJdTg1N2JCcEJnR0ZJanQrVzgwdGFjMGVFTEhBNE1u?=
 =?utf-8?B?TmVzSkFIUG42WEZMaWdCdHJMandlM2lNT2ltOXQwaGVsTXYvcUlCWkk1eDdO?=
 =?utf-8?B?N3Z6ZTlEYUp0Y2tVb28xMlJzY1BNWjUyanNwWUJjRkV0dWcxenBoYmhUUy82?=
 =?utf-8?B?VzR4bzdGZkFnSkRSSmtVYVdpN1hHVUlsc09BdjNOdTVXZVNyTnI1Q0VMRzhH?=
 =?utf-8?B?cFg0QVpwL0VVN0RncnVIQ0dUZU95MzFoWGFoNFVoV3MraUY5dnNSV1NiRTJh?=
 =?utf-8?B?YWREckV1TGl2US83aC93enBjWmFNVlJpVGZEd0U2MDBEQVdwaG9ZbTdaRith?=
 =?utf-8?B?OHZVVFk4WCtLYnN1dEdlMk81aGxjajlhTGZTMWJkTE5hL2x6V0paQ0JxYW4w?=
 =?utf-8?B?STNUbHVqVk1hMjljeCtHNVMzSmJZdXFKQmxKRjkvUkM0MTBUdXQ0VDRmOGhS?=
 =?utf-8?B?Z2FvYm1EM1FJUjdaUkVRcjZsM3VQV1N2ZlhOditaQjlrNFBQYXRVTmV3RWNC?=
 =?utf-8?B?MDM4NEZEaGlvS1NzY2ZobVRMcFFKVDBlV0dDRVhLYWNhb1NMQnFsbEJQNWMv?=
 =?utf-8?B?OFdCd3I1ZDNhTSs4cGlvVnd2dHIzTEVZY1htcFMyVnU4MGd5REYzSGt6SW0y?=
 =?utf-8?B?RkxpNzA5RlRkRC9aODUxNGtXSkdXc00vby9kVWN3Y294ODgyZ0ZzM0lGUEZr?=
 =?utf-8?B?czhKQjNUT3NQang2V2lUMUlWbndtKzZhOStKcFJOVC9JWk5UeEFSNkhrbWJ4?=
 =?utf-8?B?dE9qa0xxd042VktURjJIRWJienptYndVeGZrdnE1bS9Qd0NpTmRXWWJYdHp0?=
 =?utf-8?B?WnEwTTFjS0FEZ2k1eG15SytTc3BVVmNCWHZvSU50SCtMVkZzeG1mTUdPTkdE?=
 =?utf-8?B?UWxQQWg2ZlpJcnJ3ZG53QWtZaGFJSlpBNkl6eVI3RW5aKzdXSmtscmdEbzRr?=
 =?utf-8?B?R0lzTGRoa3VpQ05rNU8xdTVwQ0t5YzNYNlQ0QWtvS1AwT2FJYk1FNHpCNTFS?=
 =?utf-8?B?dHdEekUzSkpRa0xYU1FuZmdoVkpocmJkMHZnSEV1Ri9iczF1NVAweUxacVRp?=
 =?utf-8?B?L2NYMjRzNWp2NHFDRE93dkN4Yklxak9uMlBKcE5zUXpmRFRpSWo0K25xenMv?=
 =?utf-8?B?OEE1UjBYS3BFR09LTGNmN29KNEZGK1BUTncxc01RQzNUL0hqU3pTYURjYmxO?=
 =?utf-8?B?RW9MaytUWXZuWGI1U3gva0g1Smdla2FxYlNFQkJ1R3hqS3diZ0d5OGpuL09w?=
 =?utf-8?Q?pWWqpTjlzE6Kdxv/Vo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 597de8ca-12e0-4cdb-c023-08dc9a7c5c24
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 09:50:09.2090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1418

SGkgT3JsYW5kbw0KDQpJIHJlc3VibWl0dGVkIHRoZSBwYXRjaCB3aGljaCBpbmNsdWRlZCBvbmx5
IHRoZSBiYWNrbGlnaHQgZHJpdmVyIGhhZCBubyByZXBsaWVzLiBMZXQncyBzZWUgaWYgamlyaSBp
cyBmaW5lIHdpdGggdGhlIHNlcGFyYXRlIGRyaXZlciBvciBub3QuDQoNCj4gT24gMiBKdWwgMjAy
NCwgYXQgNDoyN+KAr0FNLCBPcmxhbmRvIENoYW1iZXJsYWluIDxvcmxhbmRvY2guZGV2QGdtYWls
LmNvbT4gd3JvdGU6DQo+IA0KPiDvu78NCj4gDQo+Pj4gT24gMiBKdWwgMjAyNCwgYXQgODo0OOKA
r0FNLCBPcmxhbmRvIENoYW1iZXJsYWluIDxvcmxhbmRvY2guZGV2QGdtYWlsLmNvbT4gd3JvdGU6
DQo+Pj4gDQo+Pj4+IE9uIDIgSnVsIDIwMjQsIGF0IDQ6MTnigK9BTSwgQWRpdHlhIEdhcmcgPGdh
cmdhZGl0eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+Pj4g77u/QXBwYXJlbnRseSB0aGlzIHBhdGNo
IGlzIGJyZWFraW5nIHRvdWNoYmFyIGZ1bmN0aW9uYWxpdHkgaXMgc29tZSBjYXNlcy4NCj4+IA0K
Pj4gSSB0aGluayB0aGlzIGlzIGJlY2F1c2UgYXBwbGVfbWFnaWNfYmFja2xpZ2h0X2luaXQgd2ls
bCByZXR1cm4gYW4gZXJyb3Igd2hlbiBpdCBmaW5kcyB0aGUgdG91Y2hiYXIgaW50ZXJmYWNlLCBi
dXQgdGhpcyByZXR1cm4gdmFsdWUgaXMgbm90IGNoZWNrZWQsIHNvIGhpZC1hcHBsZSBzdGlsbCBi
aW5kcyB0byB0aGUgdG91Y2hiYXIgYmFja2xpZ2h0Lg0KPiANCj4gV2UgbWF5IGFsc28gbmVlZCB0
byBtYWtlIHN1cmUgaGlkX2h3X3N0b3AgaXMgY2FsbGVkIGluIHRoaXMgY2FzZS4gUGVyaGFwcyB3
ZSBjYW4gbW92ZSB0aGlzIGxvZ2ljIGZyb20gYXBwbGVfbWFnaWNfYmFja2xpZ2h0X2luaXQgdG8g
YXBwbGVfcHJvYmU/DQo+IA0KPj4gDQo+PiBUaGlzIHNob3VsZCBiZSBmaXhhYmxlIHNvIEkgZG9u
J3QgdGhpbmsgd2UgbmVlZCB0byBzdGlsbCBoYXZlIHRoZSBzZXBhcmF0ZSBkcml2ZXIuDQo+PiAN
Cj4+Pj4gDQo+Pj4+IHN0YXRpYyBpbnQgYXBwbGVfcHJvYmUoc3RydWN0IGhpZF9kZXZpY2UgKmhk
ZXYsDQo+Pj4+ICAgICBjb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCAqaWQpDQo+Pj4+IHsNCj4+
Pj4gQEAgLTg2MCw2ICs5NDAsOSBAQCBzdGF0aWMgaW50IGFwcGxlX3Byb2JlKHN0cnVjdCBoaWRf
ZGV2aWNlICpoZGV2LA0KPj4+PiBpZiAocXVpcmtzICYgQVBQTEVfQkFDS0xJR0hUX0NUTCkNCj4+
Pj4gICAgIGFwcGxlX2JhY2tsaWdodF9pbml0KGhkZXYpOw0KPj4+PiANCj4+Pj4gKyAgICBpZiAo
cXVpcmtzICYgQVBQTEVfTUFHSUNfQkFDS0xJR0hUKQ0KPj4+PiArICAgICAgICBhcHBsZV9tYWdp
Y19iYWNrbGlnaHRfaW5pdChoZGV2KTsNCj4+IA0KPj4gcmV0dXJuIHZhbHVlIGlzbid0IGNoZWNr
ZWQgaGVyZSBeLCB3ZSByZXR1cm4gMCB1bmNvbmRpdGlvbmFsbHkgYmVsb3cuDQo+PiANCj4+Pj4g
Kw0KPj4+PiByZXR1cm4gMDsNCj4+Pj4gfQ0K


Return-Path: <linux-input+bounces-4824-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B06926775
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 19:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C234AB20C6B
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 17:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90E61836DA;
	Wed,  3 Jul 2024 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="PVyGxN5u"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2058.outbound.protection.outlook.com [40.92.103.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895101C68D;
	Wed,  3 Jul 2024 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720029198; cv=fail; b=qaU/aKczkT5jSCy34TdfQQZVAIgsEMX3a0qWAKgOKtZhdI5UBYuhuKQkQmjtt3StcFzeWrsmkxTXUPC/SfrunnqFUgjm4qB9JQIaaQJ1cUrlJHjZS3MywJHKauQkwg1fMkjaD2AVu3zQzsKLqJP6nyFVLaIaW4CpTX35zXWwnzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720029198; c=relaxed/simple;
	bh=CgTfT5vIwEhMmSSbFFdyRfvMUK+V4eGZ8hN5A4B5Wic=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rtw8z55OV2mLzKp8u8cWbo41ohkBjOEwEOAiQw13Et9IW8DjZ2+KYRTYXsm9yF0MMf5/fRsGEIv13U0tXfTQjnI6KTYrZrP5297SO6TFS3J3mWKJ3pvau7ay2ZgCULgvCmm25tnc9mEOCP/Gobg44wi7Opld/CBXyGrR1GwP1hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=PVyGxN5u; arc=fail smtp.client-ip=40.92.103.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgRCWE3Osh4s9RXWwZZGGOzVYTJ95xXvzPLa9NTPKkZn2LeA/QVaQnHJOXUCqU4ZrfMt0mvWyOCQ16lgcCT6ktJF5+HBRk5i3bTcHStBq0Ixtlr6S7rcmUgzJ7OFT7+lcWfJpRKb8g+ce5370rsaNKDqxdG/qFvc5O8OUiw3DpWDtts/Q97KNJSzAuT0p5CSUhiWaMfnRUJcDZgVmweJ/LKRDuTSgPLPhDP+OXBID3uSEZyqNfU3rmtJhWr4gIVGHhpwHgjop3cv9GCGIvqQDOU9NAhuWoOX4rniONywKq1w2pmQFY/SaoWcowes2GQiN8oIMYAxtNvWA4IxsHqNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgTfT5vIwEhMmSSbFFdyRfvMUK+V4eGZ8hN5A4B5Wic=;
 b=Zs/vxafIMdnYyz6zOZHQRvGwrmzxGc0PIsNWNDC2hSVCQRZdX3NPPYXSnxw1M0x4JbdhFeZigAgsU8XgGzYNDNzKWMyJfK5ihyZBiD8Fw7PsXigp5gKHw01xW8x6q5LMqeVDASUrKZJqgWy/ZLODlrDDG53hv0zm4uuBkMR82Dmcz0hgu36RsjXp5JBsP2g9GZdWP56R4Qt8zYqsuX4HbgBJPbo6ZMTEWhhyPIB4Tplnk/rjF5ceLo4ljqBzty1sESGJ7ACpVlX65NBfGcgSjM10Nbqg7lnebQNaNUUuDaJW7PikH5UO/TVqUPVLbfvhw9VJtQnPMH0NE0DZ4QZ+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgTfT5vIwEhMmSSbFFdyRfvMUK+V4eGZ8hN5A4B5Wic=;
 b=PVyGxN5uv0m9AoM/HX0NvocFVtayO/CyM69G1xOF43ZgCtjr3BIt2vfPgiGZ9c0Y9aTlbIuImWMB3fIJNkt3XKLUt4NBnL18YwDazV468fVxo7BUB3cMrgleCSx1dSNhZZWVYZWblc5kTseWGomFOiNX18wuZ8Z8NNvhvtLVwLfVDhXpjhBw66xKyMNKIGDziuyjD+afRh95cQ6/BwY9S+l93koTAKvA8bhBOnDMrRKTKtXJ8+eFaSNSWeXg+9BiQsv2KKfZQuJYcA6L7e3v+NTS6w6D6NT42OCg66kV3dE6/VukQJlJ9OGqW2TUilUJBuZRlt9fK48CL+peB8echw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0946.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:146::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Wed, 3 Jul 2024 17:53:11 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.027; Wed, 3 Jul 2024
 17:53:11 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Thread-Topic: [PATCH v2] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Thread-Index: AQHazTqxwYBEvzaAzEqXn2eZVog3xbHlCl0AgAAtUQCAAAWTgIAAC/IA
Date: Wed, 3 Jul 2024 17:53:10 +0000
Message-ID: <AB53350C-19E2-45EB-B4D5-001411D0536D@live.com>
References: <16C35623-78AE-44B9-8D54-CA9584AEC49E@live.com>
 <cg3rwpc7wr7ppxb46qx4ruea7mklbz6q25cercv3fjr4zn4qau@gujyoheohawj>
 <B9057989-C564-4B74-91E5-E23245B7D686@live.com>
 <m2ohvezuoldiewldip3i7luaehunadlllbe6plylauxeuqihc5@i6xelxexmep4>
In-Reply-To: <m2ohvezuoldiewldip3i7luaehunadlllbe6plylauxeuqihc5@i6xelxexmep4>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Oz5T6BMlyAR4UK4wMHBhZZ/ozusdf+hq5a7Z7CCAJ/ArsrXFVMFQX3H+ewajU8CM]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0946:EE_
x-ms-office365-filtering-correlation-id: b90a62b3-0c97-4c84-74fd-08dc9b8900d2
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 o1rjzVRjUKfdRvyjoBHPRo4NE1tkJEzFuhBoo5ovCdqUFkGY0KVDGq9TKc47yG1n8SfRau5sW6af47nlikYstdjs/NbmqZlYVw9C0r2GD8Nn9KBxNBiGmd7fmxiEneHbZW5LJ2DfzHqSHFaGKyJHYxAQ6jmb5mjNFXUSC6FMMeLHnE7NHMcZ0jjjXuSFBbLbPdprC1awmMi2eVGy04dl4dAOjOFxkB3SUdZVUlr6Qgn7O2rqd8o7+4Vxk1r9hm298K46kKr4KRyEk1S5ArEmvN8dFmBkGqhjY7ERqCjQE5AcibZRlf2n7wqjNWfB9nGNvGcbleR3Nfoyarykv7powtvyOR5dxZWUggKdR/VEeF+wSTWYTKiV/GG0GO6QVURGdBXexqMRj92kK+zPQzYGb0Vcr3+mlku4JcngCYh9eRG/pT7NxnlTi6JCRpb/rwWGIJ6uhWjKiKdvkJxjhn8DuTSqB/CqMTJTuitutBBV5/dqQHyE1IXdi56aJbwUvwVCepgqdzN5zoFNAAdSYDcWMSpC0gJcPJQYvY8dv0IL415QZ0F2JbPf2HU3ketbQ12vJw0T9V2QxrFcxLfSBzYARg0JDkMG1QbRbZncmC3XwkI=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEhEcll2eHpuVUFLVVlpazYxT01iS0haZmxSZlpMMzVOZFV1UndKTkowZ1NC?=
 =?utf-8?B?eUgvZGVPNW1WY0FOQ3h2T3BLTXJOa2EvZDg0WE9NMHVWUmdrY0g1Z05lc2hK?=
 =?utf-8?B?bFFnaFpRektpVmxZZ0hBODdpcTJPbFA0NEllTTliZlNjYVZjekp6WmRJdHhj?=
 =?utf-8?B?dEZ3bHdHYU95ZVhTNHNMUkRRWlF2SFFLMmZvSVVIWk1hTldrRi8zaXpmUmxq?=
 =?utf-8?B?U2t1M01wZWlnM3VqSS83ZUR2eCtDcWNpeTllWHJiQWh4SUJzeHl0SGVNS0xo?=
 =?utf-8?B?YVNOSUFvQjRZdEs3bzNLQ1RrQWdRTitqbzFIaURQaDhFNDNFMlNqSjVnV0FW?=
 =?utf-8?B?Mi9zS24ya2VVSkVaRWpiNkhvY2x4b0tSVHRYUGYrZmRxR3lQQzRabHRPNnFH?=
 =?utf-8?B?Z3RpZTRheWhFR1M2TU5FbzVyZDgrcWQ0enBqbXBVNnd0VmpsZTFIL3k2a0lz?=
 =?utf-8?B?MWYwd0JZNlJkV2Fnc3VqU3ZvN3dOSWNHZTFibGFLQmVQdWt2QXRnZW85TEMy?=
 =?utf-8?B?SCtxdkk3R1dOVTN0ZjlicklzcytudmV5eHArTFc1RzhVSWlOZEN1dktXZWhz?=
 =?utf-8?B?UitlREszU2FpMjM4b0NXQmFJVHF6WHY1T1g1QzZWQ0lVY1lUSGRGSjhUck9p?=
 =?utf-8?B?WC8zVFF4RThENWVXVndnbmxiUEtRTG00YmZObm9VYkdqVWtFVmM1Wk83VzBm?=
 =?utf-8?B?R1pmWGFYeU05cmxXT08yVVY5SXAxcHhKY0ljWDNrdGxtY0VpdzM3VmwvYTlI?=
 =?utf-8?B?UDFZZVNQYWRNRmEwSmN4NTMxSG10Wk5YNlVVOTNlZ0JVQkxIRnBpU2tMVUdD?=
 =?utf-8?B?cldWVW5KaHI4MUIvbVJwV3lPSVBzcEEvSEVNa1dsODZFc2czK1FYT1M1d0Jw?=
 =?utf-8?B?c256OG9MeXo4TXJPL1ZiSVpYWXZvamR0dWZXejJDaWorTElIRjJpQ2hVcCtt?=
 =?utf-8?B?R0Rvc2xnc3VvTWwyUWcrMzV0dEFEU1h2TktsY25YQnRTckYwQmxyMUovK0x3?=
 =?utf-8?B?enVFeEJmUUNaQmR1aGR0YjRuMFh6SHM3b1FIN1hnN2duSjk3UWxsMTlZQXo0?=
 =?utf-8?B?QXpDUnMzZXp0NHlCemtvZHZQdkpUVFlTUndTMEhSR1lCUFhiUDRVdzhLanlw?=
 =?utf-8?B?bmFYcVZzTllCTng0ZG1zUllMU2RKS3pYOVBoUVhFVVZldzh4R0xvbzlOT1JF?=
 =?utf-8?B?cjVnbXRLK1ZDRVF4Q3pacG8xVXdrN1lHdWxvUXlUbktIcXY4Sys3N1lwYk9G?=
 =?utf-8?B?VFVoYzFrQ0R6dmMyUXdqNW9oemFZUEhlcW1yYTFHaGw2MEV6Y1ArZThWdTJr?=
 =?utf-8?B?bGJZMWxvblprT3NZaWlkUkh3em5vc29LT3kvMFRNWUl2MjNEc3gyd3FJU2xR?=
 =?utf-8?B?ZzZ5aE1YR3g1bGtuYzNsUUhFalBLRm8wU1BpZWx5R2hkYURLRHhkb0pDRlFJ?=
 =?utf-8?B?WFNwZU9JVzZDb0p6ZHU4c0J2M2hWRi91Y2xPVkI5U3NaU1NwTFlOd2NITzhs?=
 =?utf-8?B?RURiUG1tUFBRdTlwMFN4S0dsSi9Fam1lTFZmTktWVndLT0hnNklmaUFaZWNh?=
 =?utf-8?B?RlhmOFFDUnlHOENOWmd1ZlMxdmJjMGtjR1JMRXFrWFY1WEVjNk9ocnZBbWxD?=
 =?utf-8?B?TzZpWm5rOWk5RzYwR3p0WXBLNXRVcDVzUG0wcWxwa2FXS2FSVzlkREpzTHhh?=
 =?utf-8?B?aEQrQkVIRlE4Y0daeVB3MjRSNG1LQWh1aHBLMXcvWGkwWXlRazdCVVpuWi9u?=
 =?utf-8?Q?DYiGkujpI+66aFKufU+PVyk9O8zZR3MDOxQNe9b?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5ABF46FA1145F84A82A01DB7E37589C0@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b90a62b3-0c97-4c84-74fd-08dc9b8900d2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 17:53:10.5933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0946

DQoNCj4gT24gMyBKdWwgMjAyNCwgYXQgMTA6NDDigK9QTSwgQmVuamFtaW4gVGlzc29pcmVzIDxi
ZW50aXNzQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gSnVsIDAzIDIwMjQsIEFkaXR5YSBH
YXJnIHdyb3RlOg0KPj4gDQo+PiBIaSBCZW5qYW1pbg0KPj4gDQo+Pj4gT24gMyBKdWwgMjAyNCwg
YXQgNzozOOKAr1BNLCBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9yZz4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gT24gSnVsIDAzIDIwMjQsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+PiBG
cm9tOiBPcmxhbmRvIENoYW1iZXJsYWluIDxvcmxhbmRvY2guZGV2QGdtYWlsLmNvbT4NCj4+Pj4g
DQo+Pj4+IFVubGlrZSBUMiBNYWNzIHdpdGggQnV0dGVyZmx5IGtleWJvYXJkLCB3aG8gaGF2ZSB0
aGVpciBrZXlib2FyZCBiYWNrbGlnaHQNCj4+Pj4gb24gdGhlIFVTQiBkZXZpY2UgdGhlIFQyIE1h
Y3Mgd2l0aCBNYWdpYyBrZXlib2FyZCBoYXZlIHRoZWlyIGJhY2tsaWdodCBvbg0KPj4+PiB0aGUg
VG91Y2hiYXIgYmFja2xpZ2h0IGRldmljZSAoMDVhYzo4MTAyKS4NCj4+Pj4gDQo+Pj4+IFN1cHBv
cnQgZm9yIEJ1dHRlcmZseSBrZXlib2FyZHMgaGFzIGFscmVhZHkgYmVlbiBhZGRlZCBpbiA5MDE4
ZWFjYmU2MjMNCj4+Pj4gKCJISUQ6IGFwcGxlOiBBZGQgc3VwcG9ydCBmb3Iga2V5Ym9hcmQgYmFj
a2xpZ2h0IG9uIGNlcnRhaW4gVDIgTWFjcy4iKS4NCj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBv
cnQgZm9yIHRoZSBNYWdpYyBrZXlib2FyZHMuDQo+Pj4+IA0KPj4+PiBDby1kZXZlbG9wZWQtYnk6
IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IE9ybGFuZG8gQ2hhbWJlcmxhaW4gPG9ybGFuZG9jaC5kZXZAZ21haWwuY29tPg0KPj4+IA0KPj4+
IE5pdHBpY2s6IHRoZSBvcmRlcmluZyBvZiB0aGUgc2lnbmVkLW9mZiBpcyB3ZWlyZC4gSXQgc2hv
dWxkIGJlIGluIG9yZGVyDQo+Pj4gb2YgcGVyc29ucyB3aG8gdG91Y2hlZCB0aGlzIGRyaXZlci4N
Cj4+PiANCj4+PiBHaXZlbiB0aGF0IHRoZSBGcm9tIGlzIE9ybGFuZG8gYW5kIEFkaXR5YSBpcyBz
dWJtaXR0aW5nLCBJIHdvdWxkIGhhdmUNCj4+PiBleHBlY3RlZCBPcmxhbmRvLCB0aGVuIEFkaXR5
YeKApg0KPj4+IA0KPj4gDQo+PiBXaWxsIGZpeCB0aGlzLg0KPj4gDQo+Pj4+IC0tLQ0KPj4+PiBk
cml2ZXJzL2hpZC9oaWQtYXBwbGUuYyB8IDg3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWFwcGxl
LmMgYi9kcml2ZXJzL2hpZC9oaWQtYXBwbGUuYw0KPj4+PiBpbmRleCBiZDAyMmUwMDQzNTYuLjJk
MWNkNDQ1NjMwMyAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMNCj4+
Pj4gKysrIGIvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMNCj4+Pj4gQEAgLTgsNiArOCw4IEBADQo+
Pj4+ICogIENvcHlyaWdodCAoYykgMjAwNi0yMDA3IEppcmkgS29zaW5hDQo+Pj4+ICogIENvcHly
aWdodCAoYykgMjAwOCBKaXJpIFNsYWJ5IDxqaXJpc2xhYnlAZ21haWwuY29tPg0KPj4+PiAqICBD
b3B5cmlnaHQgKGMpIDIwMTkgUGF1bCBQYXdsb3dza2kgPHBhdWxAbXJhcm0uaW8+DQo+Pj4+ICsg
KiAgQ29weXJpZ2h0IChjKSAyMDIzIE9ybGFuZG8gQ2hhbWJlcmxhaW4gPG9ybGFuZG9jaC5kZXZA
Z21haWwuY29tPg0KPj4+PiArICogIENvcHlyaWdodCAoYykgMjAyNCBBZGl0eWEgR2FyZyA8Z2Fy
Z2FkaXR5YTA4QGxpdmUuY29tPg0KPj4+PiAqLw0KPj4+PiANCj4+Pj4gLyoNCj4+Pj4gQEAgLTIz
LDYgKzI1LDcgQEANCj4+Pj4gI2luY2x1ZGUgPGxpbnV4L3RpbWVyLmg+DQo+Pj4+ICNpbmNsdWRl
IDxsaW51eC9zdHJpbmcuaD4NCj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2xlZHMuaD4NCj4+Pj4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9sZWRzL2NvbW1vbi5oPg0KPj4+PiANCj4+Pj4gI2luY2x1ZGUg
ImhpZC1pZHMuaCINCj4+Pj4gDQo+Pj4+IEBAIC0zNywxMyArNDAsMTggQEANCj4+Pj4gI2RlZmlu
ZSBBUFBMRV9OVU1MT0NLX0VNVUxBVElPTiBCSVQoOCkNCj4+Pj4gI2RlZmluZSBBUFBMRV9SREVT
Q19CQVRURVJZIEJJVCg5KQ0KPj4+PiAjZGVmaW5lIEFQUExFX0JBQ0tMSUdIVF9DVEwgQklUKDEw
KQ0KPj4+PiAtI2RlZmluZSBBUFBMRV9JU19OT05fQVBQTEUgQklUKDExKQ0KPj4+PiArI2RlZmlu
ZSBBUFBMRV9NQUdJQ19CQUNLTElHSFQgQklUKDExKQ0KPj4+PiArI2RlZmluZSBBUFBMRV9JU19O
T05fQVBQTEUgQklUKDEyKQ0KPj4+IA0KPj4+IFBsZWFzZSBrZWVwIGV4aXN0aW5nIHF1aXJrcyBk
ZWZpbml0aW9uIGluIHBsYWNlLCBpdCBhZGRzIG5vaXNlIGZvcg0KPj4+IG5vdGhpbmcgaW4gdGhl
IHBhdGNoLiBBbHNvLCB0ZWNobmljYWxseSwgdGhlc2UgcXVpcmtzIGFyZSB1c2VkIGluDQo+Pj4g
LmRyaXZlcl9kYXRhIHNvIHRoZXkgYXJlIHVhcGkuDQo+Pj4gDQo+PiANCj4+IFN1cmUNCj4+IA0K
Pj4+PiANCj4+Pj4gI2RlZmluZSBBUFBMRV9GTEFHX0ZLRVkgMHgwMQ0KPj4+PiANCj4+Pj4gI2Rl
ZmluZSBISURfQ09VTlRSWV9JTlRFUk5BVElPTkFMX0lTTyAxMw0KPj4+PiAjZGVmaW5lIEFQUExF
X0JBVFRFUllfVElNRU9VVF9NUyA2MDAwMA0KPj4+PiANCj4+Pj4gKyNkZWZpbmUgSElEX1VTQUdF
X01BR0lDX0JMIDB4ZmYwMDAwMGYNCj4+Pj4gKyNkZWZpbmUgQVBQTEVfTUFHSUNfUkVQT1JUX0lE
X1BPV0VSIDMNCj4+Pj4gKyNkZWZpbmUgQVBQTEVfTUFHSUNfUkVQT1JUX0lEX0JSSUdIVE5FU1Mg
MQ0KPj4+PiArDQo+Pj4+IHN0YXRpYyB1bnNpZ25lZCBpbnQgZm5tb2RlID0gMzsNCj4+Pj4gbW9k
dWxlX3BhcmFtKGZubW9kZSwgdWludCwgMDY0NCk7DQo+Pj4+IE1PRFVMRV9QQVJNX0RFU0MoZm5t
b2RlLCAiTW9kZSBvZiBmbiBrZXkgb24gQXBwbGUga2V5Ym9hcmRzICgwID0gZGlzYWJsZWQsICIN
Cj4+Pj4gQEAgLTgxLDYgKzg5LDEyIEBAIHN0cnVjdCBhcHBsZV9zY19iYWNrbGlnaHQgew0KPj4+
PiBzdHJ1Y3QgaGlkX2RldmljZSAqaGRldjsNCj4+Pj4gfTsNCj4+Pj4gDQo+Pj4+ICtzdHJ1Y3Qg
YXBwbGVfbWFnaWNfYmFja2xpZ2h0IHsNCj4+Pj4gKyBzdHJ1Y3QgbGVkX2NsYXNzZGV2IGNkZXY7
DQo+Pj4+ICsgc3RydWN0IGhpZF9yZXBvcnQgKmJyaWdodG5lc3M7DQo+Pj4+ICsgc3RydWN0IGhp
ZF9yZXBvcnQgKnBvd2VyOw0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+PiBzdHJ1Y3QgYXBwbGVfc2Mg
ew0KPj4+PiBzdHJ1Y3QgaGlkX2RldmljZSAqaGRldjsNCj4+Pj4gdW5zaWduZWQgbG9uZyBxdWly
a3M7DQo+Pj4+IEBAIC04MjIsNiArODM2LDY2IEBAIHN0YXRpYyBpbnQgYXBwbGVfYmFja2xpZ2h0
X2luaXQoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYpDQo+Pj4+IHJldHVybiByZXQ7DQo+Pj4+IH0N
Cj4+Pj4gDQo+Pj4+ICtzdGF0aWMgdm9pZCBhcHBsZV9tYWdpY19iYWNrbGlnaHRfcmVwb3J0X3Nl
dChzdHJ1Y3QgaGlkX3JlcG9ydCAqcmVwLCBzMzIgdmFsdWUsIHU4IHJhdGUpDQo+Pj4+ICt7DQo+
Pj4+ICsgcmVwLT5maWVsZFswXS0+dmFsdWVbMF0gPSB2YWx1ZTsNCj4+Pj4gKyByZXAtPmZpZWxk
WzFdLT52YWx1ZVswXSA9IDB4NWU7IC8qIE1pbWljIFdpbmRvd3MgKi8NCj4+Pj4gKyByZXAtPmZp
ZWxkWzFdLT52YWx1ZVswXSB8PSByYXRlIDw8IDg7DQo+Pj4+ICsNCj4+Pj4gKyBoaWRfaHdfcmVx
dWVzdChyZXAtPmRldmljZSwgcmVwLCBISURfUkVRX1NFVF9SRVBPUlQpOw0KPj4+PiArfQ0KPj4+
PiArDQo+Pj4+ICtzdGF0aWMgdm9pZCBhcHBsZV9tYWdpY19iYWNrbGlnaHRfc2V0KHN0cnVjdCBh
cHBsZV9tYWdpY19iYWNrbGlnaHQgKmJhY2tsaWdodCwNCj4+Pj4gKyAgICAgIGludCBicmlnaHRu
ZXNzLCBjaGFyIHJhdGUpDQo+Pj4+ICt7DQo+Pj4+ICsgYXBwbGVfbWFnaWNfYmFja2xpZ2h0X3Jl
cG9ydF9zZXQoYmFja2xpZ2h0LT5wb3dlciwgYnJpZ2h0bmVzcyA/IDEgOiAwLCByYXRlKTsNCj4+
Pj4gKyBpZiAoYnJpZ2h0bmVzcykNCj4+Pj4gKyBhcHBsZV9tYWdpY19iYWNrbGlnaHRfcmVwb3J0
X3NldChiYWNrbGlnaHQtPmJyaWdodG5lc3MsIGJyaWdodG5lc3MsIHJhdGUpOw0KPj4+PiArfQ0K
Pj4+PiArDQo+Pj4+ICtzdGF0aWMgaW50IGFwcGxlX21hZ2ljX2JhY2tsaWdodF9sZWRfc2V0KHN0
cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2LA0KPj4+PiArICBlbnVtIGxlZF9icmlnaHRuZXNz
IGJyaWdodG5lc3MpDQo+Pj4+ICt7DQo+Pj4+ICsgc3RydWN0IGFwcGxlX21hZ2ljX2JhY2tsaWdo
dCAqYmFja2xpZ2h0ID0gY29udGFpbmVyX29mKGxlZF9jZGV2LA0KPj4+PiArIHN0cnVjdCBhcHBs
ZV9tYWdpY19iYWNrbGlnaHQsIGNkZXYpOw0KPj4+PiArDQo+Pj4+ICsgYXBwbGVfbWFnaWNfYmFj
a2xpZ2h0X3NldChiYWNrbGlnaHQsIGJyaWdodG5lc3MsIDEpOw0KPj4+PiArIHJldHVybiAwOw0K
Pj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtzdGF0aWMgaW50IGFwcGxlX21hZ2ljX2JhY2tsaWdodF9p
bml0KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2KQ0KPj4+PiArew0KPj4+PiArIHN0cnVjdCBhcHBs
ZV9tYWdpY19iYWNrbGlnaHQgKmJhY2tsaWdodDsNCj4+Pj4gKw0KPj4+PiArIC8qDQo+Pj4+ICsg
ICogRW5zdXJlIHRoaXMgdXNiIGVuZHBvaW50IGlzIGZvciB0aGUga2V5Ym9hcmQgYmFja2xpZ2h0
LCBub3QgdG91Y2hiYXINCj4+Pj4gKyAgKiBiYWNrbGlnaHQuDQo+Pj4+ICsgICovDQo+Pj4+ICsg
aWYgKGhkZXYtPmNvbGxlY3Rpb25bMF0udXNhZ2UgIT0gSElEX1VTQUdFX01BR0lDX0JMKQ0KPj4+
PiArIHJldHVybiAtRU5PREVWOw0KPj4+PiArDQo+Pj4+ICsgYmFja2xpZ2h0ID0gZGV2bV9remFs
bG9jKCZoZGV2LT5kZXYsIHNpemVvZigqYmFja2xpZ2h0KSwgR0ZQX0tFUk5FTCk7DQo+Pj4+ICsg
aWYgKCFiYWNrbGlnaHQpDQo+Pj4+ICsgcmV0dXJuIC1FTk9NRU07DQo+Pj4+ICsNCj4+Pj4gKyBi
YWNrbGlnaHQtPmJyaWdodG5lc3MgPSBoaWRfcmVnaXN0ZXJfcmVwb3J0KGhkZXYsIEhJRF9GRUFU
VVJFX1JFUE9SVCwNCj4+Pj4gKyBBUFBMRV9NQUdJQ19SRVBPUlRfSURfQlJJR0hUTkVTUywgMCk7
DQo+Pj4+ICsgYmFja2xpZ2h0LT5wb3dlciA9IGhpZF9yZWdpc3Rlcl9yZXBvcnQoaGRldiwgSElE
X0ZFQVRVUkVfUkVQT1JULA0KPj4+PiArIEFQUExFX01BR0lDX1JFUE9SVF9JRF9QT1dFUiwgMCk7
DQo+Pj4+ICsNCj4+Pj4gKyBpZiAoIWJhY2tsaWdodC0+YnJpZ2h0bmVzcyB8fCAhYmFja2xpZ2h0
LT5wb3dlcikNCj4+Pj4gKyByZXR1cm4gLUVOT0RFVjsNCj4+Pj4gKw0KPj4+PiArIGJhY2tsaWdo
dC0+Y2Rldi5uYW1lID0gIjp3aGl0ZToiIExFRF9GVU5DVElPTl9LQkRfQkFDS0xJR0hUOw0KPj4+
PiArIGJhY2tsaWdodC0+Y2Rldi5tYXhfYnJpZ2h0bmVzcyA9IGJhY2tsaWdodC0+YnJpZ2h0bmVz
cy0+ZmllbGRbMF0tPmxvZ2ljYWxfbWF4aW11bTsNCj4+PiANCj4+PiBUaGlzIGlzIHdlaXJkOiBh
IGZldyBsaW5lcyBhYm92ZSwgeW91IHJlZ2lzdGVyIGEgbmV3IHJlcG9ydCB3aXRoDQo+Pj4gaGlk
X3JlZ2lzdGVyX3JlcG9ydCgpIGFuZCBub3cgeW91IGFyZSBkaXJlY3RseSBhY2Nlc3NpbmcNCj4+
PiBmaWVsZFswXS0+bG9naWNhbF9tYXhpbXVtIGluIHRoYXQgbmV3IHJlcG9ydCwgd2hpY2ggc2hv
dWxkIGJlIHNldCB0byAwLg0KPj4+IA0KPj4+IFVubGVzcyB5b3UgYXJlIHVzaW5nIGhpZF9yZWdp
c3Rlcl9yZXBvcnQoKSB0byByZXRyaWV2ZSBhbiBleGlzdGluZw0KPj4+IHJlcG9ydCwgd2hpY2gg
aXMgYmVuZGluZyB0aGUgQVBJIGEgYml0IGJ1dCBpcyBPSywgYnV0IHlvdSBzaG91bGQgYXQNCj4+
PiBsZWFzdCBjaGVjayB0aGF0IHJlcG9ydC0+c2l6ZSBpcyA+IDAgKGFuZCBwdXQgYSBjb21tZW50
IHRoYXQgdGhlIHJlcG9ydHMNCj4+PiBleGlzdCBhbHJlYWR5KS4NCj4+PiANCj4+PiAob3IgZG8g
d2hhdCBpcyBkb25lIGluIGFwcGxlX2ZldGNoX2JhdHRlcnkoKSB0byByZXRyaWV2ZSB0aGUgY3Vy
cmVudA0KPj4+IHJlcG9ydCkNCj4+PiANCj4+IA0KPj4gSW5zdGVhZCBvZiANCj4+IA0KPj4gaWYg
KCFiYWNrbGlnaHQtPmJyaWdodG5lc3MgfHwgIWJhY2tsaWdodC0+cG93ZXIpDQo+PiByZXR1cm4g
LUVOT0RFVjsNCj4+IA0KPj4gU2hvdWxkIEkgZG8gKHdpbGwgYWxsIHByb3BlciB3aGl0ZXNwYWNl
IGFuZCBsaW5lIGZvcm1hdHRpbmcpOg0KPj4gDQo+PiBpZiAoIWJhY2tsaWdodC0+YnJpZ2h0bmVz
cyB8fA0KPj4gICAgICAgICAgICAgYmFja2xpZ2h0LT5icmlnaHRuZXNzLT5zaXplID09IDAgfHwN
Cj4+ICAgICAgICAgICAgIWJhY2tsaWdodC0+cG93ZXIgfHwNCj4+ICAgICAgICAgICAgIGJhY2ts
aWdodC0+cG93ZXItPnNpemUgPT0gMCkNCj4+IHJldHVybiAtRU5PREVWOw0KPiANCj4gVGhhdCwg
b3I6DQo+IHN0cnVjdCBoaWRfcmVwb3J0X2VudW0gKnJlcG9ydF9lbnVtOw0KPiANCj4gcmVwb3J0
X2VudW0gPSAmaGRldi0+cmVwb3J0X2VudW1bSElEX0ZFQVRVUkVfUkVQT1JUXTsNCj4gYmFja2xp
Z2h0LT5icmlnaHRuZXNzID0gcmVwb3J0X2VudW0tPnJlcG9ydF9pZF9oYXNoW0FQUExFX01BR0lD
X1JFUE9SVF9JRF9CUklHSFRORVNTXTsNCj4gYmFja2xpZ2h0LT5wb3dlciA9IHJlcG9ydF9lbnVt
LT5yZXBvcnRfaWRfaGFzaFtBUFBMRV9NQUdJQ19SRVBPUlRfSURfUE9XRVJdOw0KPiANCj4gYW5k
IHRoZW4ga2VlcCB5b3VyICJpZiAoIWJhY2tsaWdodC0+YnJpZ2h0bmVzcyB8fCAhYmFja2xpZ2h0
LT5wb3dlcikiDQoNCkxldHMgZ28gd2l0aCB0aGlzLg0KDQpTZW5kaW5nIGEgdjMuIFRoYW5rcyBm
b3IgdGhlIGhlbHAhDQo+IA0KPj4gDQo+Pj4gDQo+Pj4+ICsgYmFja2xpZ2h0LT5jZGV2LmJyaWdo
dG5lc3Nfc2V0X2Jsb2NraW5nID0gYXBwbGVfbWFnaWNfYmFja2xpZ2h0X2xlZF9zZXQ7DQo+Pj4+
ICsNCj4+Pj4gKyBhcHBsZV9tYWdpY19iYWNrbGlnaHRfc2V0KGJhY2tsaWdodCwgMCwgMCk7DQo+
Pj4+ICsNCj4+Pj4gKyByZXR1cm4gZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXIoJmhkZXYtPmRl
diwgJmJhY2tsaWdodC0+Y2Rldik7DQo+Pj4+ICsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiBzdGF0
aWMgaW50IGFwcGxlX3Byb2JlKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LA0KPj4+PiBjb25zdCBz
dHJ1Y3QgaGlkX2RldmljZV9pZCAqaWQpDQo+Pj4+IHsNCj4+Pj4gQEAgLTg2MCw2ICs5MzQsMTUg
QEAgc3RhdGljIGludCBhcHBsZV9wcm9iZShzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiwNCj4+Pj4g
aWYgKHF1aXJrcyAmIEFQUExFX0JBQ0tMSUdIVF9DVEwpDQo+Pj4+IGFwcGxlX2JhY2tsaWdodF9p
bml0KGhkZXYpOw0KPj4+PiANCj4+Pj4gKyBpZiAocXVpcmtzICYgQVBQTEVfTUFHSUNfQkFDS0xJ
R0hUKSB7DQo+Pj4+ICsgcmV0ID0gYXBwbGVfbWFnaWNfYmFja2xpZ2h0X2luaXQoaGRldik7DQo+
Pj4+ICsgaWYgKHJldCkgew0KPj4+PiArIGRlbF90aW1lcl9zeW5jKCZhc2MtPmJhdHRlcnlfdGlt
ZXIpOw0KPj4+PiArIGhpZF9od19zdG9wKGhkZXYpOw0KPj4+PiArIHJldHVybiByZXQ7DQo+Pj4g
DQo+Pj4gSW5zdGVhZCBvZiBtYW51YWxseSB1bndpbmQgdGhlIHByb2JlIGluIGVhY2ggc3ViLXF1
aXJrLCBwbGVhc2UgYWRkIGEgbmV3DQo+Pj4gZ290byBsYWJlbCBhbmQgZG8gZ290byBvdXRfZXJy
Ow0KPj4gDQo+PiBZb3UgbWVhbiB0aGlzPzoNCj4gDQo+IHllcC4gVGhpcyB3YXksIGlmIHdlIGdl
dCB0byBhZGQgbmV3IHF1aXJrcyBsYXRlciwgd2UgY2FuIHJlbHkgb24gdGhpcy4NCj4gDQo+PiAN
Cj4+IGlmIChxdWlya3MgJiBBUFBMRV9NQUdJQ19CQUNLTElHSFQpIHsNCj4+IHJldCA9IGFwcGxl
X21hZ2ljX2JhY2tsaWdodF9pbml0KGhkZXYpOw0KPj4gaWYgKHJldCkNCj4+IGdvdG8gb3V0X2Vy
cjsNCj4+IH0NCj4+IA0KPj4gcmV0dXJuIDA7DQo+PiANCj4+IG91dF9lcnI6DQo+PiBkZWxfdGlt
ZXJfc3luYygmYXNjLT5iYXR0ZXJ5X3RpbWVyKTsNCj4+IGhpZF9od19zdG9wKGhkZXYpOw0KPj4g
cmV0dXJuIHJldDsNCj4+IH0NCj4+IA0KPj4gDQo+Pj4gDQo+Pj4+ICsgfQ0KPj4+PiArIH0NCj4+
Pj4gKw0KPj4+PiByZXR1cm4gMDsNCj4+Pj4gfQ0KPj4+PiANCj4+Pj4gQEAgLTEwNzMsNiArMTE1
Niw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCBhcHBsZV9kZXZpY2VzW10g
PSB7DQo+Pj4+IC5kcml2ZXJfZGF0YSA9IEFQUExFX0hBU19GTiB8IEFQUExFX0lTT19USUxERV9R
VUlSSyB8IEFQUExFX1JERVNDX0JBVFRFUlkgfSwNCj4+Pj4geyBISURfQkxVRVRPT1RIX0RFVklD
RShCVF9WRU5ET1JfSURfQVBQTEUsIFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRf
TlVNUEFEXzIwMjEpLA0KPj4+PiAuZHJpdmVyX2RhdGEgPSBBUFBMRV9IQVNfRk4gfCBBUFBMRV9J
U09fVElMREVfUVVJUksgfSwNCj4+Pj4gKyB7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURf
QVBQTEUsIFVTQl9ERVZJQ0VfSURfQVBQTEVfVE9VQ0hCQVJfQkFDS0xJR0hUKSwNCj4+Pj4gKyAu
ZHJpdmVyX2RhdGEgPSBBUFBMRV9NQUdJQ19CQUNLTElHSFQgfSwNCj4+Pj4gDQo+Pj4+IHsgfQ0K
Pj4+PiB9Ow0KPj4+PiAtLSANCj4+Pj4gMi40NS4yDQo+Pj4+IA0KPj4+IA0KPj4+IE90aGVyIHRo
YW4gdGhvc2UgZmV3IG5pdHBpY2tzLCBwYXRjaCBsb29rcyBnb29kLiBQbGVhc2Ugcm9sbCBhIHYz
IGFuZA0KPj4+IEknbGwgYXBwbHkgaXQuDQo+Pj4gDQo+Pj4gQ2hlZXJzLA0KPj4+IEJlbmphbWlu
DQo+PiANCj4+IA0KPiANCj4gQ2hlZXJzLA0KPiBCZW5qYW1pbg0KDQoNCg==


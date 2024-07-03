Return-Path: <linux-input+bounces-4811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE1925DB3
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 13:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54457B3D026
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 11:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D244918EFCE;
	Wed,  3 Jul 2024 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MjP24S5X"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2097.outbound.protection.outlook.com [40.92.102.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7B18F2F1;
	Wed,  3 Jul 2024 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005217; cv=fail; b=n63RpOwbtse4qCJqMUAJpAe7jarh0/Dwk7NCy1GtZf46ya+UsCP5NzaiD4GLkYFs7M3UfXXXCl7iGApEhqj39FhpDe+6mVQ+drlggSzNO3x+YAlQDbGAhecg/V1mx/zZrGETTcSHGWsiHfoTIZBk+yicIePCoqaL8jKGTD7t8eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005217; c=relaxed/simple;
	bh=FDVmkRjtqhRqhiaBP4ukNCGWUOtWD5NPtuTejPgfbCY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VNptaYdXYMkNhl/fuGIAEQ1L5xql7AL9RAN259mywvPe7P36it/ERscYtzSEyRgGJFBzbstzOs0QfzlPPObLCfGmbX6fsjO+2OrHWQWBa6NumeKPW0jPbVS3gEAdznXya9FiAjAG/KSRhgq4NFdYtCMFuZ/e0NDnevwuylieT1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MjP24S5X; arc=fail smtp.client-ip=40.92.102.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfDyZsJ6RRiIq4JR4ur7l3cURr3TU4U+L9H64jI2fQpNzjv06VQy5bUj4H1C+o+n7dYPrDw/PZMo/FFbZiCA+hv7yDejoMm2lPHfBbHt1ggUMzTZqI+p005KaeW/Ikg7GvLJKFBFHY/oOdmYK2AOSFITsFYDG80IT+HtBlFSRRqhEFF7w3v5bipOrcUnNdo7rrPlA8qn3WsJR1P7W7na3UyS6kiN3YKXgAjFxXe14rA39ddgHPCuDm98cNUYVRygbhq6Wo7HWYeRK455nhHgX0Hoprm04hnBNJsTBbGjnSTkrbVTnl6BqPmzsivzEGaKB056a+KgOqofChMZSFeasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDVmkRjtqhRqhiaBP4ukNCGWUOtWD5NPtuTejPgfbCY=;
 b=NGJhVQEByk1Fo+NAPW4nt9GIjsCPwhoUlDn3plLh06EI38hCgEs3prnpEwgtvisV80OySOaUMCBAe+E+6dL/WYSIuHpGFnIgBzRhpp5tLkF8wWUhoVZpzQurhBI5omyFHgzGuo0k06xNpzNTiPlvRaMjDezIEkAHdaMhUk464aHiDzAuqsTH3d9b63XA0nPxGAE8YNkihGR1Sw2F5UrkQfK1Xj8yrzzA/8bIs468OVKa++GpQ0VKHGqSQVwHRdPhjV7eCKi2pb0TpwBotJQI/oXMGAMk9dALyqsdDdJt13U5z5M2IEUulpml/7bsKwsqcReJs42JgS4hTohilvqF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDVmkRjtqhRqhiaBP4ukNCGWUOtWD5NPtuTejPgfbCY=;
 b=MjP24S5X8wZAqdxfk4I4rNrQ58xKBihUSflqFJoTLsj0lMZHp4NzJzGf2zxXdufdQPNPcTYpCqHpdfOxcIvNaOb1KfQXNlnqpU0V7sYwYMBO7TMpW0D3Y8e1rn8/YxcoMK2ScrFjR9GN0paD9FObdlGOhJGET5gjoN4n2d/Zo2ZYtQoalD0X1q6cvI9pHbVMx9PEF3BO88HdEzGjp6TfSTdLUHXwHu74TG4wpPSmUoc5b7Zpcoqos0KnOzFFNJ/HA7CeXBmX0a9ZHFdiwr0wNSijrNY6ab0m0lvet141O6cnjL/LOI4ec9fIBoXhvj6LZKpWRiBeqvm/M515KHAi+w==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB1591.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Wed, 3 Jul 2024 11:13:31 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 11:13:31 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Orlando Chamberlain <orlandoch.dev@gmail.com>
CC: Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: apple: Add support for magic keyboard backlight on
 T2 Macs
Thread-Topic: [PATCH] HID: apple: Add support for magic keyboard backlight on
 T2 Macs
Thread-Index: AQHay6PH5ldcO3kl80evALAvsJ3vq7HiLwsvgABLSACAAAJ3gIACX+6A
Date: Wed, 3 Jul 2024 11:13:31 +0000
Message-ID: <B4053288-26A8-4FF3-BD94-FF403A965715@live.com>
References: <8DC4D384-1349-4C8A-848D-589BA25B15D2@gmail.com>
 <B28CFBDD-16ED-41AE-AE4A-92066D0DD4D8@gmail.com>
In-Reply-To: <B28CFBDD-16ED-41AE-AE4A-92066D0DD4D8@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [Qq450kPhWUedvvi8X0j19OOGks0bDNhobzap9aBBIKhkh9VrjsES/ljg8RY/ReSukuwoTmoeBKc=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB1591:EE_
x-ms-office365-filtering-correlation-id: c96a9162-86b5-4293-fe35-08dc9b512c3f
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 SjbKEPJN2KrrJS3j/X1UnVDH3qo8s20h1GrWDeLvom5mN4aaixUhF47v+6X2LhnvrPrQOSpX6sDovp2tm32pulP9HRkrQRY6zA4WxDV6eLyIlKwVRsS1yl0PUyEy5Q/0c7jfeUC85I+cF6gutjBqNTVRoN918J3FSa1az7gtraOHPBDQf6go/Kox2nnBEG6dKCQTCWLb6Hxgy6Zxa28LYYWnDuGhplV1UFesIo+fdiIvXmDFifdQJ7xjh7AF46cRQddynh+EbdQIJ6qxEWl7fdOBOfnd7CrL6/9128prOPEMvoKDNJw+edLpjG9VOvCV/zG5s2lWlHHNXITV4TGsQthKfnxUGByM0buqMdI+TNaib/TLFgZ6Vw8BkzXzR4tbq91H6GnpuFuuI3VJkETgZDS++UsUWuwo/F/bS4jkaEcGmXQOI6On1fFtKP5xhtNnvB5vuRMmxUSR8WczSJ1Fj4/q7KxcEIf8kiB4K6ZMU3trOm8lX7wI7LtCNlbtDgjUwwaAP9Blwnfcwix9rApyt7bO6k+9Qi3iFcfSok3FK3sU9FDOjTzq3FcWSRu7bzaZeIK+Z83+J1TBn8cV13Ub1DAL55GI2p6FmpIeEh5WSQfAdO8sm6xQJ6hnE4HPMigw
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHFHSzk1WXZVdzZ3SzF5MVIxQXUwbENPeDNBZ3BjNWR3Vm9KQ1JlTlNsZmhm?=
 =?utf-8?B?UmtBREVWT3k5OUNBNlJrcDR3TDFsUWYzbm5vUUNqY2puUUdoOWJOd1p2dnNU?=
 =?utf-8?B?cGVHU0hsZlZySUZOdktBSDlUcjhYMVZEelBZODJnL3FLb0YxQ1F5YW9IQldk?=
 =?utf-8?B?c2hrTzFvQ21Panl5V0Z3TEdKcGNsWG42aWY3K2FkeGV5VjI3cXZPWHk2YzJy?=
 =?utf-8?B?ZFJ3UzJxOVY3dTVrTUZJK2hDcjBob2dQV1UrQ1FnK3dXVDFwVU9iMXVJUGJ3?=
 =?utf-8?B?MnY4UENrTWQ1ekh2elF5bjdRSFBoUlJNNWRjK3J0bDBCeHZlUHVJT2VMdVFI?=
 =?utf-8?B?bDYrNkh2Y3pZTHlCdTZPZ1RHY0NRTHp4d1lpSmhLbWd1WjBJSU1PYUcxbWNa?=
 =?utf-8?B?Y2M2blIzSGx6a05oWWtFUjQ0WTE0ZE1YcHBldjNDdmRNRFd2NXQzQkRscU12?=
 =?utf-8?B?TkRycFF1dG5sUE16SWxhZ0ROU05tN3dwK2d3TkppOWVPWVdVMExQZlpsOHRi?=
 =?utf-8?B?Z3NMZ0pzQnhRVm1vVVpudy81Tm5KbVFWZVpDWENsbWVDUXVTRi95cXJTSHNr?=
 =?utf-8?B?bTgzVE5ZbWpCRW4wSndVeUR0UE5nNERteGhrMzU2Nlo4WnozbHlVNUlMUWNs?=
 =?utf-8?B?OHlvNm15WStnRzF2cDljR0xaL3I5d0xnc0QxSUYzWi9NcVoxcnhxZ0gyRk1P?=
 =?utf-8?B?TEMwZEI0SkNVMjV5N25iWWtZY3VrWEpzcnVsWldGM3BCb3lmRXZOa0gyREF5?=
 =?utf-8?B?V1FjR2NMS0ZOaTFKSVN5MHFzNFYrdFFDVzZLOHNEYVhWdUF5bkxGRVJJc3Mv?=
 =?utf-8?B?b2dsVTgvOWtUcHUyWWRRcTRCVXFNTHVoTDBzZng0S3NyMXBOVW9YT2JxbVo5?=
 =?utf-8?B?NHUrcUZWSTIzNnBUQ0hZaU1YQzRVQ0RocHBFMjdPamc5bG5vQjVIYlp5UmN3?=
 =?utf-8?B?bStZRU1rN1BsOS8xWE53cU1SMHNhTEVjc0IvK2M0UW9LUC9saWFJRFZjdXFV?=
 =?utf-8?B?clY4OEJ1cmt1cGUvUGlaQURLcCtlMEs5eVJPUktObE0ybjZHVjJwaVMwbWFX?=
 =?utf-8?B?R3FVc3k5L1MwRTkwNFpXTENWUWNjaVZqOUZYaVU1UXJ6bnNCbVN1Tkl5c2pz?=
 =?utf-8?B?eHpvamhLdkZpR0Q0RWt5MG9tdVAvei9KTGdKSHM3WVVaL1NyQzVJNTFZSWRs?=
 =?utf-8?B?S0lSTkFvSWU2R29ydW13cHM2dnBUTDJieTUxQloyODhsMVU3cndEZVpxRXow?=
 =?utf-8?B?ZmlKY3VPblJEWEZ2QUQ3SXl6VURMZUhTZU84RlBxZHBjSHhIYzViRk5OalRO?=
 =?utf-8?B?d3F6MDUzZVBsQTEwWTM2R25vb3NuRXhGN2UxVHEvbXkxVVZMeStKZWlucFJt?=
 =?utf-8?B?cGpEa1dQTk5YNVM1bzIyQlNhZXRLOFNscHJxaEtCMkJQLzllREMxQWpYandz?=
 =?utf-8?B?bEtqYzRDRUhEMTE0MWptMFYxWDBnY29WTk04TXR5NmkrZkxZWXR0dS9DanQ2?=
 =?utf-8?B?K0lpYkduc0NzUzRlS1J0SkpoVU9Ga3FZRmVyaW1jMDJ4ZldqcmtDS1dFQmE4?=
 =?utf-8?B?UEJxQ2NvazZBTDNuVjlMMXVaQXZMV1hGZ2U2dEUwQ3l2Y2crbEUycGgyRXV5?=
 =?utf-8?B?Tm9mVTFxeXFqbzZCZmZwQWNLZUdPbXJzVC85L0I1VElsTkhmTFVIVjAwWE1a?=
 =?utf-8?B?ckZxQmNhZTZjcmZGVDBCMG9Kd3VyZGNEeVVlL0ZYSlloNnN6d0ZMaG9JVWg2?=
 =?utf-8?Q?Bn0cHEnLAW0LpC/LXKv+IcU6xnAOvZFpTaiV8c5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88FEDC934E9DFA4EBF67A87CB58F5694@INDP287.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c96a9162-86b5-4293-fe35-08dc9b512c3f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 11:13:31.6565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1591

DQoNCj4gT24gMiBKdWwgMjAyNCwgYXQgNDoyN+KAr0FNLCBPcmxhbmRvIENoYW1iZXJsYWluIDxv
cmxhbmRvY2guZGV2QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAyIEp1bCAy
MDI0LCBhdCA4OjQ44oCvQU0sIE9ybGFuZG8gQ2hhbWJlcmxhaW4gPG9ybGFuZG9jaC5kZXZAZ21h
aWwuY29tPiB3cm90ZToNCj4+IA0KPj4+IE9uIDIgSnVsIDIwMjQsIGF0IDQ6MTnigK9BTSwgQWRp
dHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+Pj4g77u/QXBwYXJlbnRs
eSB0aGlzIHBhdGNoIGlzIGJyZWFraW5nIHRvdWNoYmFyIGZ1bmN0aW9uYWxpdHkgaXMgc29tZSBj
YXNlcy4NCj4+IA0KPj4gSSB0aGluayB0aGlzIGlzIGJlY2F1c2UgYXBwbGVfbWFnaWNfYmFja2xp
Z2h0X2luaXQgd2lsbCByZXR1cm4gYW4gZXJyb3Igd2hlbiBpdCBmaW5kcyB0aGUgdG91Y2hiYXIg
aW50ZXJmYWNlLCBidXQgdGhpcyByZXR1cm4gdmFsdWUgaXMgbm90IGNoZWNrZWQsIHNvIGhpZC1h
cHBsZSBzdGlsbCBiaW5kcyB0byB0aGUgdG91Y2hiYXIgYmFja2xpZ2h0Lg0KPiANCj4gV2UgbWF5
IGFsc28gbmVlZCB0byBtYWtlIHN1cmUgaGlkX2h3X3N0b3AgaXMgY2FsbGVkIGluIHRoaXMgY2Fz
ZS4gUGVyaGFwcyB3ZSBjYW4gbW92ZSB0aGlzIGxvZ2ljIGZyb20gYXBwbGVfbWFnaWNfYmFja2xp
Z2h0X2luaXQgdG8gYXBwbGVfcHJvYmU/DQo+IA0KVGhhbmtzIGZvciB5b3VyIGhlbHAgT3JsYW5k
by4gU2VuZGluZyBhIHdvcmtpbmcgYW5kIHdlbGwgdGVzdGVkIHZlcnNpb24gMg0KPj4gDQo+PiBU
aGlzIHNob3VsZCBiZSBmaXhhYmxlIHNvIEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBzdGlsbCBo
YXZlIHRoZSBzZXBhcmF0ZSBkcml2ZXIuDQo+PiANCj4+Pj4gDQo+Pj4+IHN0YXRpYyBpbnQgYXBw
bGVfcHJvYmUoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsDQo+Pj4+ICAgICBjb25zdCBzdHJ1Y3Qg
aGlkX2RldmljZV9pZCAqaWQpDQo+Pj4+IHsNCj4+Pj4gQEAgLTg2MCw2ICs5NDAsOSBAQCBzdGF0
aWMgaW50IGFwcGxlX3Byb2JlKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LA0KPj4+PiBpZiAocXVp
cmtzICYgQVBQTEVfQkFDS0xJR0hUX0NUTCkNCj4+Pj4gICAgIGFwcGxlX2JhY2tsaWdodF9pbml0
KGhkZXYpOw0KPj4+PiANCj4+Pj4gKyAgICBpZiAocXVpcmtzICYgQVBQTEVfTUFHSUNfQkFDS0xJ
R0hUKQ0KPj4+PiArICAgICAgICBhcHBsZV9tYWdpY19iYWNrbGlnaHRfaW5pdChoZGV2KTsNCj4+
IA0KPj4gcmV0dXJuIHZhbHVlIGlzbid0IGNoZWNrZWQgaGVyZSBeLCB3ZSByZXR1cm4gMCB1bmNv
bmRpdGlvbmFsbHkgYmVsb3cuDQo+PiANCj4+Pj4gKw0KPj4+PiByZXR1cm4gMDsNCj4+Pj4gfQ0K
DQo=


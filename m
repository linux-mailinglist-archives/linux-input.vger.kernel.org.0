Return-Path: <linux-input+bounces-10595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD620A55607
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 19:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB81F1894520
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 18:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FE526BDBC;
	Thu,  6 Mar 2025 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="SlAKI+wX"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011030.outbound.protection.outlook.com [52.103.67.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7C272939
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287282; cv=fail; b=GT5UHxIuy5YqzrD474LKZn3aZM0zLw0Kp3gfAwsu7OEAVkiPZy31mgqgHZwqorJ2m0J0xpL1um+xm5qn+VG3E54FW88rlIqXD/4wi0uTQAiY8tLAnR7Ex8KAp3IzRJJBKK6mONHJM/48dTW4KiRJez8K6UnNZ+DRoL+bI8b+Hw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287282; c=relaxed/simple;
	bh=s4EHGjOanOZcVriQ+qElDWrE3amgLY7ymqgC8291Eq0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C7OX2Hinsjwl7GGSBYHVQDuOLCixQjM8Ldc2OoO9hlVj/RduUnppP5jCOY+lOqCjF4jSEnXRz5YwRpruIIL6lEiwYxrClbcvoFZFxkY9JLuYdZTJ8OxLHLPjTRiQX9i1UdXH4qKiBURvCFnqH4VqvEfVIaxWCY6IbmQe66CeOM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=SlAKI+wX; arc=fail smtp.client-ip=52.103.67.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XICUizlWhQDyXUbVwDiIfL0dTL8U4WTlH/ZGWzOYzFJACtXU4Gj4lzRp/mFJ7+h7mN1lvEjZJyRRGdeo7rZuUi8I5yFf09TB0qYvOW54HUjitZ4c41vcVW4Q3byE/4mKHoxALDXd0kt7oTfjSA/PTqbGJwPAu3VFixWUc4wV49HdVc3JgAC2/1bXTpRjQOk+4A1raM5Ykz9lxFSNU4qnW5L/kdxai5u+RTqjvnnAD8YzKsjDHM69Ac6GDNn73MsxIoFiJe8s+hOdWO0PnHXmpm3vILwrUQjCkUhDl81PCHh6BPMamckK2pq13adMGdAyg9mOA43Z7J4/aoOxq8049A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4EHGjOanOZcVriQ+qElDWrE3amgLY7ymqgC8291Eq0=;
 b=d4m7b9GFpEh+iLN3bFz37jl4MnE3g3DMBrHb5SzC/uNV65TtsrwrT0FQIaGA4c/oKNJ5H2L1FdKfi/XfRYoIq6/LT4e798tvS4c9gN0V8haUu9kaOlTeT1smLJzqVWRDdTYJRVLQ2y4oBJCFbFQWTsDVsk6lxJb7CEYIaR4jEc5IQkBccgbjpJIpeCRiZhheAzukeW2vYzbzTiF9Uup0/e1EZAb09ljhZAVbab6Zp3WKpLtL/u4E2qkzlG+4Scyb+WxKX2IQs5zqtO3MfxZ3x4+oBgEqtaO0XuUKf81Bt7ole3iEN5jvWx+uBZv+W67OCDE6+RTMI3IroJ1zWxEGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4EHGjOanOZcVriQ+qElDWrE3amgLY7ymqgC8291Eq0=;
 b=SlAKI+wXS9ADkz1FXyCMi4L+YznT28+cL4H6idSUev00PvaJTPORI9LmIXv9u1+v1xJSGbaGpr22wDyotSN/RGZ74VF2d+FmxY2CgAzrsrNtppmFon2+whEfPzFguy/il69VtgALcJ0DlzVGprgyuxnmsnOE3ko2jb8rj0VlUu8OpprZtcBKKiFCg5xxNMtzt1JOyFCQFsL8gVx9iIbg275e0qAKhjs0AG2Hs9ow8hzVuRq9nuJqHDf8RwRQcsnFMgzhsDmQLMrcv7149Iu4SZK26zP2otHcl68lfSEBxqT0NyZE9a2GkK3mdcefnTVcSy6W97ZO0u6hZoTzLdoojw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPFE49B9A7B3.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::5af) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.21; Thu, 6 Mar
 2025 18:54:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 18:54:36 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Grigorii Sokolik <g.sokol99@g-sokol.info>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Topic: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Index: AQHbjsk0iTHRxGBV1Ee2CRRU/jlylQ==
Date: Thu, 6 Mar 2025 18:54:36 +0000
Message-ID: <31E267B8-6B70-46F2-873E-4E58478E3C93@live.com>
References: <20250306070027.532052-1-g.sokol99@g-sokol.info>
 <20250306070027.532052-2-g.sokol99@g-sokol.info>
In-Reply-To: <20250306070027.532052-2-g.sokol99@g-sokol.info>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PPFE49B9A7B3:EE_
x-ms-office365-filtering-correlation-id: 77bffb85-6036-4450-7ba4-08dd5ce0576b
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|8060799006|19110799003|7092599003|15080799006|461199028|10035399004|3412199025|440099028|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?UG13RGJIUGpUSmtSTlNDeGtWSHo4WVlXYjF6SHUzSmYwaFBXT1BTRTZjaDNt?=
 =?utf-8?B?OGwwMkxBejZyMTI1WkhWWW9PNjR2MEo3Q2NSdjZZdUNCeGxXT29RcTMwU3ly?=
 =?utf-8?B?dlJOaVp2SkpxS3RkYmh2V2VMSEpUb0U1TXMxdEU1ZVQxYVJOTWlFU0VXdDRM?=
 =?utf-8?B?NnZGZTJXelZVTFdWbyt0L1ptSldYSmI4ek5xNFQ2b0NSb0Y2WXZnVW91QTNn?=
 =?utf-8?B?cTdxWE1yY0JjVjR0RHFxaHBsSVlkaHFXUC9ZaEhXV3A1Q2RvSG94Vlp6TURa?=
 =?utf-8?B?LzNLeWFZVXBvZE5tYmZqb3dzV0VmSGtHYTQ3RndkRi83bHlLK0VGWWNoOGtu?=
 =?utf-8?B?b2ZkdUtaaFJJQy9CdjNhQTNRRStOSnBiSFkvcXJUY3I0VmM5UDFVRjAyS0J2?=
 =?utf-8?B?WXV4RzBCUXNHTUdUTlBoMm9jLytBUTZMNFR2aDZuZUVYZmVROS8wcmVJM2hQ?=
 =?utf-8?B?ZHQ3dUxyY0taL2hrUk1jUFV0MDVuc1NWcWJDY0ROZ1BEM2F2M2o0Q2tqdnI4?=
 =?utf-8?B?MXp6UjlQNmU4N0JSbG5yOUJtRHBvcjNZNzdtRXhZK1V3RWhLTEtmRkFQbUlo?=
 =?utf-8?B?cUFCUitVWlhaWkQyZnJLdWR3VHIzbzd2b0dybE1HcHhxRXZQVlF0WklsUklq?=
 =?utf-8?B?MksvbnFIVFh5NDFwak1XMkVHbFIrZzlzdWZIcTRiODdKSCt4RFl5V2hhTDhl?=
 =?utf-8?B?Z3VjVkNRR1RMU1dlNTlNQWlOMnRoMm1laEEyZ3VTQnYvQUgyNXB6cmE4OUhY?=
 =?utf-8?B?VGVnSzV3MTJEcjZUaEJNOGUzbXQwNUxsQ0JHK3pWVnBJT3NJckx6YWJzR0hi?=
 =?utf-8?B?ajlGN1pSdmF1KzF5MkM2ZU5PMjN6T21KK01FME5LRVRSeDlVTUxUSWN3a1kz?=
 =?utf-8?B?R0pnWGxWRHl4c2RsRTFwdmU3TitXMGxRT0JLaGloWG9CZ2xUeTZXR1M2bnNx?=
 =?utf-8?B?a3NHcXl2VGJ6V0JmMHYxcVFrY3dPcXpwR1BQOFppYSt2bjVGL3ovdVd0SitW?=
 =?utf-8?B?TWtCY2w1ZnZGMytQUkcvdHo5TER3eUhsanJLZTk1dVMwNC8xSWZWOWRCUjYw?=
 =?utf-8?B?aDhyNnNQUThHUjRlVUY3ZFRTc0cySWowY1hUbjhqeDhFMmpDdm80NTBxSmcz?=
 =?utf-8?B?ZlNCanZxT0g2UjI5NVJ5VmVDV2ZzQ1dXb2REZ2I3RW1xem1EanpuNWRRRmtY?=
 =?utf-8?B?YXhsYlJ0aDVBTGdNdWZkUW03U1Y5SzlCRmJBS1FTaCtteVJOdURYR0xRRUtQ?=
 =?utf-8?B?QStNaGhlVzNnKy80REtLY2tJNVN1RGNBU3A3cDQ3Nit2TzhTT2twODN2VkdJ?=
 =?utf-8?B?bXMvRU8zUHJrV1hPOVJnNWRzaW40Z0ZiQmpIS0Qra1B4OWJJaHBPOWQ0OC84?=
 =?utf-8?B?Uk1BcW9hMHU0M2VxQjJDcHdObTRoYnBObXZGb2VEK1NlUE1HanV2ekR4WHdy?=
 =?utf-8?B?cmRsVVpZM0o0NDZybmt3UDRPOUg3b2ZaeGpwNXcrYjVmQ1RJSjNaZ0dXdFJR?=
 =?utf-8?B?ZlJMaDdGdkErVUxjTmx5M3Q2K01pRXRRNllyZVdjeHpFNWRwWTJwNWIxcXpp?=
 =?utf-8?B?S09qU0xXQzBXbFVvUUFRUFN3WUE3ZTJaUm9rTXdQWHdZV3NIRnNGRXBaWFpk?=
 =?utf-8?Q?O8daQ1j1ENXDQNe94zBZqaCLOIdkP7DF+UNvz3yjZGxM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0hvQzJQRzZIazBrZWsrYzQvQzdaY2M5bWhEWGQ3VEl1TUFtQlhVV1ZlZ2Fv?=
 =?utf-8?B?TFJ3UStMSVY2TnQ4VlZLL0tEaUEzWjBLVmhRL2VHV3JkQmFCeU9Dc0VBZ3A3?=
 =?utf-8?B?Mit6T29MTW81TzJZRmh4UjFpYkhtUEdVUmlqRVpUampyWStydDBETHVwdDh6?=
 =?utf-8?B?blAzQld4Rkd4WHVmbnpTZU5va2tQRGdkUkFWZC9URzRmc3EwVTEvM3hmTzF2?=
 =?utf-8?B?bTg3U1JzQmZtZ0VUTVkxWUljaUxsZGpVR2Q0Mm56ZGhaVWd4eUs5RUZBdTZv?=
 =?utf-8?B?WVJxOG9lUWtTQUd5dkhiR2R5bUZmYWFEbmMyczUrNlppNFBVNDBCSkVaaEIz?=
 =?utf-8?B?Vi9Fb3hZUFByQndYbzhVK25sRHZkR2k2dXQzREY3eHd6aXlQdnVtR1lWSWMv?=
 =?utf-8?B?RjFPZmN5TEN6R1pHWi8xOE9Qa0x1VkVHbnYycmF1RlkxdDA4SUdaQUs4NldO?=
 =?utf-8?B?RWFwTHhKZ0U0cGZRWVVhd3l6Tzl0NkExMmdVVWtrZy8rQTRJbzkvTkIrZHcv?=
 =?utf-8?B?YlBmMmdyQldhTTJzZTNJZ3dsMk53R0hzSSt1ZGFDZGdUYnRhZi8xV1JSdkhE?=
 =?utf-8?B?djBDYkRRNEtqYldLL1VTc1NzN2pTS0JheWhqYVVvREczOGN0VUV2R0dxdGhF?=
 =?utf-8?B?UE9xY251WnpNbHF5SG9yM2hKc3BXZ1dia0VqZFIxR0RacFlJNEJtTFM4aWk0?=
 =?utf-8?B?VUtjcURUMkF3czVjUHVxTTh3RGo3WHY5S3FzdzBEMDdFWjV0cnZsRnJ5TTd1?=
 =?utf-8?B?SkdWd0hpZ20xbVUrcVJYdVowQ3RuVmdQbHY5MUcrU0dqQVVkYTFTWjYzRGVN?=
 =?utf-8?B?Nlk3WVBGNGlRaDQ3aXQ5ZjhvbjlLb3ZGdU1ZSTJaeXdGc2FoOWF2TjFZOEZl?=
 =?utf-8?B?OEFZSHhITUVMcXJtSDZPb3FuOXlsc0Jna3JoWjVyUkJEWGJENUJISkpzbHZL?=
 =?utf-8?B?VFpoQVNjM1ZuUXFnREF0SUo1ZWZETyttVzV6cXhNVDltZjZlNmMrWFRjOG92?=
 =?utf-8?B?dHpsc09GVHlyZlpqMkdVclZqTG9rQkFxR1RGS2l1YXplZ2xnNzY5N1pmS0JD?=
 =?utf-8?B?cmRxaEREdkUwRWRrOXdZb0k2TzcyOFpFWGJkUGN1Z3h3WWt1K0hhaFoyMFlU?=
 =?utf-8?B?THhqRThoSDg5cHlLOHBDNTI1ai9lbXBQdFdFZHpxNi9xR3Rtc1NuRVlwT25C?=
 =?utf-8?B?WG1HWDAvVXBBeUYySjdqZVFrWGIxR2M0d3Nid2haVGE2LzJOYlBsKy8zMmdz?=
 =?utf-8?B?UEtESHdZYTRjVTVaa2NFdWlMZEhBVW9LL0lBM2Q0eDdGaWVieXlmZ1VEeW9n?=
 =?utf-8?B?R1JXZDZqbWFGUEJZa0dzWkg1RnBxOTFYU0J2cGNjNXZsWG80TExqbWcvbEh1?=
 =?utf-8?B?aEpSaUYvZnRKNE5Xdy9kNGI2WldxaThxaWxpeHBzUlRNMTAxeCtvdm9semcv?=
 =?utf-8?B?K0dPbW84dzNORmZ0ZDVhRHFPYkhyRDRWVVlDVTBMR0VhQktwVC9XQjd1eTZG?=
 =?utf-8?B?YUs1WXBWVjFQakJ4Ky9pYk9sdXhONzgrWUVEbWJFWFRJZGZwbXgxQWxsUERX?=
 =?utf-8?B?UjFuRFo1dEw5blBmM0haUEpkY0JTOEgvZkoyc0tJUU44MTBxWDllUGs0MUIw?=
 =?utf-8?B?T2lnWVlkbmJkcDBmYTNQdTFsS212bEhUbTQvc0QxcnJDMFpOSVlxK2QxS3ZQ?=
 =?utf-8?B?eU1qdkRudHlGWHF0R2VDL3pPeUJLemtFNFpEZE00UWxkRXBwS0lhcWtHV21v?=
 =?utf-8?Q?qeDo7iZCj1BWWKWO6N7d9Pscg7cABXWgL4J9t8w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C16135D8751274BAA41F06ADE467AAD@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bffb85-6036-4450-7ba4-08dd5ce0576b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 18:54:36.5332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFE49B9A7B3

DQoNCj4gT24gNiBNYXIgMjAyNSwgYXQgMTI6MzDigK9QTSwgR3JpZ29yaWkgU29rb2xpayA8Zy5z
b2tvbDk5QGctc29rb2wuaW5mbz4gd3JvdGU6DQo+IA0KPiBBZGQgQXBwbGUgTWFnaWMgS2V5Ym9h
cmQgMjAyNCBtb2RlbCAod2l0aCBVU0ItQyBwb3J0KSBkZXZpY2UgSUQgKDAzMjEpDQo+IHRvIHRo
b3NlIHJlY29nbml6ZWQgYnkgdGhlIGhpZC1hcHBsZSBkcml2ZXIuIEtleWJvYXJkIGlzIG90aGVy
d2lzZQ0KPiBjb21wYXRpYmxlIHdpdGggdGhlIGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIGZvciBp
dHMgZWFybGllciAyMDIxIG1vZGVsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3JpZ29yaWkgU29r
b2xpayA8Zy5zb2tvbDk5QGctc29rb2wuaW5mbz4NCj4gLS0tDQo+IGRyaXZlcnMvaGlkL2hpZC1h
cHBsZS5jIHwgNSArKysrKw0KPiBkcml2ZXJzL2hpZC9oaWQtaWRzLmggICB8IDEgKw0KPiAyIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gLS0tIGEvZHJpdmVycy9oaWQvaGlk
LWlkcy5oDQo+ICsrKyBiL2RyaXZlcnMvaGlkL2hpZC1pZHMuaA0KPiBAQCAtMTg1LDYgKzE4NSw3
IEBADQo+ICNkZWZpbmUgVVNCX0RFVklDRV9JRF9BUFBMRV9JUkNPTlRST0w1IDB4ODI0Mw0KPiAj
ZGVmaW5lIFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfMjAyMSAgIDB4MDI5Yw0K
PiAjZGVmaW5lIFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfMjAyNCAgIDB4MDMy
MA0KPiArI2RlZmluZSBVU0JfREVWSUNFX0lEX0FQUExFX01BR0lDX0tFWUJPQVJEXzIwMjRfVjIg
ICAweDAzMjANCg0KSXTigJlzIHRoZSBzYW1lIElEIGFzIFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFH
SUNfS0VZQk9BUkRfMjAyNCwgd2h5IGFyZSB5b3UgYWRkaW5nIHRoaXMgYWdhaW4/IFR5cG8/DQoN
CkFsc28sIHBsZWFzZSB1c2Ugc3dpdGNoIGNhc2UsIHlvdSBjYW4gc3VibWl0IHlvdXIgcGF0Y2gg
YXMgYSBwYXJ0IG9mOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pbnB1dC9BNTBD
MUNGMC1COTI3LTRGQ0YtODI4Ri0xRjVGNzlCQTM3NjJAbGl2ZS5jb20vDQoNCkp1c3QgcmVzdWJt
aXQgdGhvc2UgMiBwYXRjaGVzIGFsb25nIHdpdGggeW91ciBwYXRjaCBhbmQgbWFrZSBhIHYyLg0K
DQo+ICNkZWZpbmUgVVNCX0RFVklDRV9JRF9BUFBMRV9NQUdJQ19LRVlCT0FSRF9GSU5HRVJQUklO
VF8yMDIxICAgMHgwMjlhDQo+ICNkZWZpbmUgVVNCX0RFVklDRV9JRF9BUFBMRV9NQUdJQ19LRVlC
T0FSRF9OVU1QQURfMjAyMSAgIDB4MDI5Zg0KPiAjZGVmaW5lIFVTQl9ERVZJQ0VfSURfQVBQTEVf
VE9VQ0hCQVJfQkFDS0xJR0hUIDB4ODEwMg0KPiAtLSANCj4gMi40OC4xDQo+IA0KPiANCg0K


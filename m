Return-Path: <linux-input+bounces-6836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6C988DF0
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 07:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4CA282485
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 05:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4632165F05;
	Sat, 28 Sep 2024 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="PMkf5lva"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2054.outbound.protection.outlook.com [40.92.103.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D11DFF5;
	Sat, 28 Sep 2024 05:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727502988; cv=fail; b=FmG5wKGfcT9mIBOX+FgpvmMd933JQ6brafLLdmPg/q1jJIuy9iLrptDXVTf3s1ad//cT7nvFmYT9XwWzGae5jSaVi6jU3oDw9cfJ/qY2CI8L0VE5POcYIjUexetcYy5vUlpeViWi5gH332uE3LooCH1uFD8ihHXgkqHS/av/Huc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727502988; c=relaxed/simple;
	bh=V0zTNmKhBYzLr54zXs2hyU62uGUnDuts1318UnbgY98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ws1EpFz97Pu5RBqlNgN6pTBN5tzJXWUralKrVQqnlwW9Xmz6efC5BiC0LE7PnO7BlpALEsJTYm8ZMAbGE1X7vp47KCLfbcLqYHtS2mTbVBiUNJK2g5SEmY7iE5W55IIMHOi2BHr3vpNYoyPHwQOT2cCl+cYD6f6fstAAKPWSGWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=PMkf5lva; arc=fail smtp.client-ip=40.92.103.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLlYBmvBktvdymnNn+vm96Z6qtQacpc1Vf+c19doFe7UHb0k8HndtyOjjIUhdtwKokSy07yuX5v4PvxOImh0xITzngRRZhDgcd8wgTurd5EazpyO86vX/2e5vPKvcxv8AzTBM6UqMjMafZjU5p2njQXkAgSKfMvvBCnA6H66expuKehUtGx7xM0ldDOL+PxaIDL7RZ05mvbkH6+VD6FFtDhfjjhSCJPZgZLus+aIKphpV+R7S0T4nWH+G1tpHOxvhwlIsWWeDOmIYtTMzBHbrvz/wLOfjQfP2Lto2bANsiAmm4gfba77AoaPWxr9ARW9nNVHTaKAcoDrynDjFYtsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0zTNmKhBYzLr54zXs2hyU62uGUnDuts1318UnbgY98=;
 b=N/bCoiLJ+QWCSRUYBaAvXe6CrShPXWCq1n0jAYIwvFDrdtwzhPptIkNidz0RDsiAP2a0bCXmpqKxsFWJi5ENLWCvgTbOG2i4vALWP/JB0h/011RcISA9xzbRzzKl0vHEwfDdjz45HL8F42GOTGmplEN/d0PJ3iWdhhugx2Y2mWkvAqCcj6WRyHYusmrncwMB6F9O2kChl1/6fdyyuxCcU4tfBy1hQ5sIybRJaUID8xkyClTnNMXYWxtoFsYk0yxKIRlIpZX2xZpP3gtPZCYDoV5Mnsovk2EnpXn4cgKxPA6Pdi7R41SrGyIOr9Hef+VvSUVBxw/Je81A7QaIupczAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0zTNmKhBYzLr54zXs2hyU62uGUnDuts1318UnbgY98=;
 b=PMkf5lvaAfx2EjpTe5oIr6vmba4GUAPjB8OZTaBPdFKY5eGzkiGHFpRJ0iLARz76tsTaaVNETQO9SnMNkl8xZwsN8DmG03AK/dh9k06SQQVegxOu2CmvMmEUq4lKkyS8t6mzvQG7Hmv7Th8/0pYGe8v0XOFJMEKA76hJrcWUwE8f4BuueqF4UxpU/viihGfb+M7ol5BrYdZtLCqw/nJyrBsq+bUPyHo80r30KFTsWDyiwkBUtG0E+zv7yDd3Dajix0nINi5rYlCT4+LUYlu6uI0CB4qDe/Tmyb5HENczcz9U4u7u4PC8tJTPDSofucsmT62n8uOjiFSm7jDpoiMwDg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB2058.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1cf::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.22; Sat, 28 Sep 2024 05:56:20 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.8005.024; Sat, 28 Sep 2024
 05:56:20 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/10] HID: hid-appletb-kbd: add driver for the keyboard
 mode
Thread-Topic: [PATCH v5 2/10] HID: hid-appletb-kbd: add driver for the
 keyboard mode
Thread-Index: AQHa8JsjCXhJYJnvC0KUgF7BjgrldLJsBYuAgADvhsE=
Date: Sat, 28 Sep 2024 05:56:20 +0000
Message-ID:
 <MA0P287MB021713F92E261478D84A4F5FB8742@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <0B505E00-A1D6-4D0E-BE04-311E231874C5@live.com>
 <i4kn5ftusya5ins2gliea33gkfsoubd6cxcy7lhw5zpxsww4ct@m5cg7prilvfj>
In-Reply-To: <i4kn5ftusya5ins2gliea33gkfsoubd6cxcy7lhw5zpxsww4ct@m5cg7prilvfj>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB2058:EE_
x-ms-office365-filtering-correlation-id: 96057f24-3f7f-40dc-8225-08dcdf824675
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|7092599003|8062599003|15080799006|461199028|6072599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 NIuylG7IiTRoin3M3tQ9B0mPLEA529aTauAp2uccCZuz5uccaV9jOIDUAbIrCEn0ngRjwZygjzJqTPJWEMOIpjTS0MoujqMbvd+apXm7eotaWOXD/7HM0mYkHAdIuk3tL/sa4u+wckU5GXdsGe37RVS7nn5XMWsiAj+rRY7LARGiAzoHsOmX5u2O5OTOd7cFPIO1nkOFfOVXbl6rCIw5KNUN9PefU8RyzNVXhbwrHLYTR3Np2DCUsWjZ4unMJAkld41BvQ1th7w8WaJLD/bzGwOW5RoC4/mv5exutxPRUyJfIDmXeO+2tDizEl9NRzRk9FGS62K08vrrxQvNTjh5oephbEv1+WQRa0AMEQPC6L/UlInCwB5k0BS31sxGg9Q3FLDDznCVfHZYmj3M78fx0UHoRw/khe+Jb7DF/R+KBqwPuTZER6xDCpAX0R/VlYK04DpTAdskgLvUoNJiA2kg6XmLYnn8TxkU+xI0FzBbf63HNTgSbDUEWWPC7jKRKHlp90XX3dtOhZuX5ObBDOnseQq1/LhozJTxKODHgBDtzRJkfovQhyPKI9QYrsNPBF+JrPNycSP+FeOhHbNCqPXdkhJubZZHtEkC0Mbbjly8+WTVsnWJu05k5YAE3lFzOSmzmfIDtI+36vs+JmBuFmYWw/L0PYNTk9hke80yT1jkJc6LYMj2GEFRbpx8lev4s8j11b01h/B5f80LsoI6bAWH6418NqzWrR+LWaUyaDmzl/R9eUQWjeFoul9MsXQmgPB+7/tTZ4o794PbUWUZgu+/4A==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nm1MZEZWUElYNzJ3eXhQdjFJay9RWXNKUmVMUmh6dUFDT0NqTXgxbmRmK0Ra?=
 =?utf-8?B?TGpFKzNTU01tV3l1NHJyOXZwV2U0a0ZtRWZWcWwyLzhmLzZkUC8xdGJGRHNs?=
 =?utf-8?B?TGRWbEJSam5CSEQ5NU5mWTFJSlFvVXpjZWV3V0Q5MitGYzRoT1RkaFd2TnZn?=
 =?utf-8?B?VGdEbnVCd0VSK0R6NU5YT1NMOUErOEpVNDZlanpaNFYvRmhTenFGTEZvVmhV?=
 =?utf-8?B?SlE4R1hSRVJqRDdMSEFRR1I4aEFxRmlpZzBjbGx2S1p5aEZaZzJSVGJKRTVr?=
 =?utf-8?B?K1NXUktuZlpoNlVUYWxEclZPR3ZwdGdCUGx1MmpqNEJEVldXNG9DNUIzaWVv?=
 =?utf-8?B?ZENvd2RwWVZ4dTBkOUIyMm5xY2d6WHREd0I3YTE0ajc0dFNlandOc3d5NlVk?=
 =?utf-8?B?VC8rM2hBU3RNQk94WTE5UXpkOHBLTkpjYWlEMkNZUzhoRU9KZmEwNm5RTml3?=
 =?utf-8?B?QkhQMlMwZW9ocWYxZTNxWEVLUGhYSEVLemh3NVplbDl2ZVVPUjBtOFJjbDd6?=
 =?utf-8?B?MlpSYUthMWUzMlFKMG9GSmRST3JlMVRrcWY0QzBHN0l6azRISTFheDNmaFQr?=
 =?utf-8?B?ZlIzREx0bVI1SEMyY3d5cm9hamVDU2tuZkF1ZGpmbzhrcWNobXhoejlkWlE3?=
 =?utf-8?B?b29YZkNLQ2prUmZNYWs2SUtIRVhlU2JQM0NsM3dMaXBFRy8zdzhHbzZpMVpQ?=
 =?utf-8?B?R0dVS0tBeWkvd2l3SVFIQTNCdjk3S3pNOG9NbHlMVkVwVmVuTFNTQVVOQnJm?=
 =?utf-8?B?VFRmOGNPU2UzbThXb2JpanRWV28vL045VXdwR0JsNlVTZ0d0UHRjQW9DSzhD?=
 =?utf-8?B?NVNQOVgxY2lDZ0lURnl4RmwxOEt3a3FOdm1HRUdJOWJQYUp3YlVJK2ZtcVhy?=
 =?utf-8?B?WWxiTXpUQ2k2VE1Kd3pBZmM4cy92a3RDZmhNYWxrRzcyK05PUTBxQ0s0ZmFO?=
 =?utf-8?B?cDJIdlpXeVRJWm1ET29SZXh3cUlUakJBZGpUcDQxL3ZXWTRtYUY3NFMvZk1K?=
 =?utf-8?B?T016TTBCTjRkQi9kdXYxem9wdFhMYnl1TUhud1lEdzNKZDNsN0V6RVZQTWY1?=
 =?utf-8?B?NENubkFkYlZoR0ZGM1kyN0c4cm5tOTdxU1ZoMmtLR3F6dWw0ZGx4a3o3YzVG?=
 =?utf-8?B?TUNnSHRXK0YveVdvWDBkU1IxQ3V3clcyY2JpUWZVL2pPYWdDbEdiN2dLVHRJ?=
 =?utf-8?B?WlZNaUhBeXAzbThjTk04eWNERmVOUlRNQWtkZFowcmNvT1QzbUN4dEJkcVpE?=
 =?utf-8?B?Slppeko1cmJaRElQSUVzNitiT1IvMzk5akc2U3pKaGlUOVNaY3ZWaDI4MTNV?=
 =?utf-8?B?a2J3emtGVFRUT0VGbjdFYTB4RjRjQ3Nxd0xEanloUTRIQ01NdmVwSjZoM2ww?=
 =?utf-8?B?S2NFQy9VZ05NRENQMXl5N3ZXZGJGRkdXYWpvUE1QUmkrUy9QakJQekRwamo1?=
 =?utf-8?B?bU5naWh4eXltK0p1c0RHV1JFVGpNcTljSWdob3czZThjM1ErQ04zR1FzSkdX?=
 =?utf-8?B?K2FnMmo4a1BSMFB3TlBCT2xKeXVYOTBsUnNPbytUUDNaQXJmYzZNcmd2d2tr?=
 =?utf-8?B?OFZOcjZmaGlrWnhESnpJQUZNdWwvWVRYcnNPNWpYN1JIYmYyT3FsUzVHM3p3?=
 =?utf-8?Q?6izLVLtbgHGsNS7IQGAGAzIvOcM2NbrvtkC+OIlJjpaM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 96057f24-3f7f-40dc-8225-08dcdf824675
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2024 05:56:20.0193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2058

DQoNCj4gT24gMjcgU2VwIDIwMjQsIGF0IDk6MDnigK9QTSwgQmVuamFtaW4gVGlzc29pcmVzIDxi
ZW50aXNzQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gQXVnIDE3IDIwMjQsIEFkaXR5
YSBHYXJnIHdyb3RlOg0KPj4gRnJvbTogS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4N
Cj4+IA0KPj4gVGhlIFRvdWNoIEJhcnMgZm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28gVVNC
IGNvbmZpZ3VyYXRpb25zOiBvbmUNCj4+IHdoZXJlIHRoZSBkZXZpY2UgcHJlc2VudHMgaXRzZWxm
IGFzIGEgSElEIGtleWJvYXJkIGFuZCBjYW4gZGlzcGxheQ0KPj4gcHJlZGVmaW5lZCBzZXRzIG9m
IGtleXMsIGFuZCBvbmUgd2hlcmUgdGhlIG9wZXJhdGluZyBzeXN0ZW0gaGFzIGZ1bGwNCj4+IGNv
bnRyb2wgb3ZlciB3aGF0IGlzIGRpc3BsYXllZC4gVGhpcyBjb21taXQgYWRkcyBhIGRyaXZlciBm
b3IgdGhlDQo+PiBkaXNwbGF5IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGZpcnN0IGNvbmZpZ3VyYXRp
b24uDQo+PiANCj4+IE5vdGUgdGhhdCBjdXJyZW50bHkgb25seSBUMiBNYWNzIGFyZSBzdXBwb3J0
ZWQuDQo+PiANCj4+IFRoaXMgZHJpdmVyIGlzIGJhc2VkIG9uIHByZXZpb3VzIHdvcmsgZG9uZSBi
eSBSb25hbGQgVHNjaGFsw6RyDQo+PiA8cm9uYWxkQGlubm92YXRpb24uY2g+Lg0KPj4gDQo+PiBT
aWduZWQtb2ZmLWJ5OiBLZXJlbSBLYXJhYmF5IDxrZWtyYnlAZ21haWwuY29tPg0KPj4gQ28tZGV2
ZWxvcGVkLWJ5OiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4+IC0tLQ0KPj4g
Li4uL0FCSS90ZXN0aW5nL3N5c2ZzLWRyaXZlci1oaWQtYXBwbGV0Yi1rYmQgIHwgIDEzICsNCj4+
IGRyaXZlcnMvaGlkL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArDQo+
PiBkcml2ZXJzL2hpZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0K
Pj4gZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMgICAgICAgICAgICAgICAgIHwgMzA0ICsr
KysrKysrKysrKysrKysrKw0KPj4gZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5jICAgICAgICAgICAg
ICAgICAgICAgIHwgICA0ICstDQo+PiA1IGZpbGVzIGNoYW5nZWQsIDMzMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1kcml2ZXItaGlkLWFwcGxldGIta2JkDQo+PiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLWhpZC1hcHBsZXRiLWtiZCBiL0Rv
Y3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLWhpZC1hcHBsZXRiLWtiZA0KPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMC4uMmExOTU4NGQwDQo+PiAt
LS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWRy
aXZlci1oaWQtYXBwbGV0Yi1rYmQNCj4+IEBAIC0wLDAgKzEsMTMgQEANCj4+ICtXaGF0OiAgICAg
ICAgL3N5cy9idXMvaGlkL2RyaXZlcnMvaGlkLWFwcGxldGIta2JkLzxkZXY+L21vZGUNCj4+ICtE
YXRlOiAgICAgICAgU2VwdGVtYmVyLCAyMDIzDQo+PiArS2VybmVsVmVyc2lvbjogICAgNi41DQo+
PiArQ29udGFjdDogICAgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnDQo+PiArRGVzY3JpcHRp
b246DQo+PiArICAgICAgICBUaGUgc2V0IG9mIGtleXMgZGlzcGxheWVkIG9uIHRoZSBUb3VjaCBC
YXIuDQo+PiArICAgICAgICBWYWxpZCB2YWx1ZXMgYXJlOg0KPj4gKyAgICAgICAgPT0gPT09PT09
PT09PT09PT09PT0NCj4+ICsgICAgICAgIDAgIEVzY2FwZSBrZXkgb25seQ0KPj4gKyAgICAgICAg
MSAgRnVuY3Rpb24ga2V5cw0KPj4gKyAgICAgICAgMiAgTWVkaWEvYnJpZ2h0bmVzcyBrZXlzDQo+
PiArICAgICAgICAzICBOb25lDQo+PiArICAgICAgICA9PSA9PT09PT09PT09PT09PT09PQ0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL0tjb25maWcgYi9kcml2ZXJzL2hpZC9LY29uZmlnDQo+
PiBpbmRleCA0OTg4YzFmYjIuLjcyYjY2NWVkYSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvaGlk
L0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvaGlkL0tjb25maWcNCj4+IEBAIC0xNTgsNiArMTU4
LDE3IEBAIGNvbmZpZyBISURfQVBQTEVUQl9CTA0KPj4gICAgICBUbyBjb21waWxlIHRoaXMgZHJp
dmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUNCj4+ICAgICAgbW9kdWxlIHdpbGwg
YmUgY2FsbGVkIGhpZC1hcHBsZXRiLWJsLg0KPj4gDQo+PiArY29uZmlnIEhJRF9BUFBMRVRCX0tC
RA0KPj4gKyAgICB0cmlzdGF0ZSAiQXBwbGUgVG91Y2ggQmFyIEtleWJvYXJkIE1vZGUiDQo+PiAr
ICAgIGRlcGVuZHMgb24gVVNCX0hJRA0KPj4gKyAgICBoZWxwDQo+PiArICAgICAgU2F5IFkgaGVy
ZSBpZiB5b3Ugd2FudCBzdXBwb3J0IGZvciB0aGUga2V5Ym9hcmQgbW9kZSAoZXNjYXBlLA0KPj4g
KyAgICAgIGZ1bmN0aW9uLCBtZWRpYSBhbmQgYnJpZ2h0bmVzcyBrZXlzKSBvZiBUb3VjaCBCYXJz
IG9uIHg4NiBNYWNCb29rDQo+PiArICAgICAgUHJvcy4NCj4+ICsNCj4+ICsgICAgICBUbyBjb21w
aWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUNCj4+ICsgICAg
ICBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgaGlkLWFwcGxldGIta2JkLg0KPj4gKw0KPj4gY29uZmln
IEhJRF9BU1VTDQo+PiAgICB0cmlzdGF0ZSAiQXN1cyINCj4+ICAgIGRlcGVuZHMgb24gVVNCX0hJ
RA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL01ha2VmaWxlIGIvZHJpdmVycy9oaWQvTWFr
ZWZpbGUNCj4+IGluZGV4IDFkODI1YTQ3NC4uZDkwM2M5YTI2IDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9oaWQvTWFrZWZpbGUNCj4+ICsrKyBiL2RyaXZlcnMvaGlkL01ha2VmaWxlDQo+PiBAQCAt
MzAsNiArMzAsNyBAQCBvYmotJChDT05GSUdfSElEX0FDUlVYKSAgICAgICAgKz0gaGlkLWF4ZmYu
bw0KPj4gb2JqLSQoQ09ORklHX0hJRF9BUFBMRSkgICAgICAgICs9IGhpZC1hcHBsZS5vDQo+PiBv
YmotJChDT05GSUdfSElEX0FQUExFSVIpICAgICs9IGhpZC1hcHBsZWlyLm8NCj4+IG9iai0kKENP
TkZJR19ISURfQVBQTEVUQl9CTCkgICAgKz0gaGlkLWFwcGxldGItYmwubw0KPj4gK29iai0kKENP
TkZJR19ISURfQVBQTEVUQl9LQkQpICAgICs9IGhpZC1hcHBsZXRiLWtiZC5vDQo+PiBvYmotJChD
T05GSUdfSElEX0NSRUFUSVZFX1NCMDU0MCkgICAgKz0gaGlkLWNyZWF0aXZlLXNiMDU0MC5vDQo+
PiBvYmotJChDT05GSUdfSElEX0FTVVMpICAgICAgICArPSBoaWQtYXN1cy5vDQo+PiBvYmotJChD
T05GSUdfSElEX0FVUkVBTCkgICAgKz0gaGlkLWF1cmVhbC5vDQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMgYi9kcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQu
Yw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMC4uZWNhYzY4ZmM3
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9kcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQu
Yw0KPj4gQEAgLTAsMCArMSwzMDQgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMA0KPj4gKy8qDQo+PiArICogQXBwbGUgVG91Y2ggQmFyIEtleWJvYXJkIE1vZGUgRHJp
dmVyDQo+PiArICoNCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTctMjAxOCBSb25hbGQgVHNjaGFs
w6RyDQo+PiArICogQ29weXJpZ2h0IChjKSAyMDIyLTIwMjMgS2VyZW0gS2FyYWJheSA8a2VrcmJ5
QGdtYWlsLmNvbT4NCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjQgQWRpdHlhIEdhcmcgPGdhcmdh
ZGl0eWEwOEBsaXZlLmNvbT4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjZGVmaW5lIHByX2ZtdChmbXQp
IEtCVUlMRF9NT0ROQU1FICI6ICIgZm10DQo+PiArDQo+PiArI2luY2x1ZGUgPGxpbnV4L2hpZC5o
Pg0KPj4gKyNpbmNsdWRlIDxsaW51eC91c2IuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvaW5wdXQu
aD4NCj4+ICsjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvYml0
b3BzLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPj4gKyNpbmNsdWRlIDxsaW51
eC9zdHJpbmcuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvaW5wdXQvc3BhcnNlLWtleW1hcC5oPg0K
Pj4gKw0KPj4gKyNpbmNsdWRlICJoaWQtaWRzLmgiDQo+PiArDQo+PiArI2RlZmluZSBBUFBMRVRC
X0tCRF9NT0RFX0VTQyAgICAwDQo+PiArI2RlZmluZSBBUFBMRVRCX0tCRF9NT0RFX0ZOICAgIDEN
Cj4+ICsjZGVmaW5lIEFQUExFVEJfS0JEX01PREVfU1BDTCAgICAyDQo+PiArI2RlZmluZSBBUFBM
RVRCX0tCRF9NT0RFX09GRiAgICAzDQo+PiArI2RlZmluZSBBUFBMRVRCX0tCRF9NT0RFX01BWCAg
ICBBUFBMRVRCX0tCRF9NT0RFX09GRg0KPj4gKw0KPj4gKyNkZWZpbmUgSElEX1VTQUdFX01PREUg
ICAgICAgIDB4MDBmZjAwMDQNCj4+ICsNCj4+ICtzdGF0aWMgaW50IGFwcGxldGJfdGJfZGVmX21v
ZGUgPSBBUFBMRVRCX0tCRF9NT0RFX1NQQ0w7DQo+PiArbW9kdWxlX3BhcmFtX25hbWVkKG1vZGUs
IGFwcGxldGJfdGJfZGVmX21vZGUsIGludCwgMDQ0NCk7DQo+PiArTU9EVUxFX1BBUk1fREVTQyht
b2RlLCAiRGVmYXVsdCB0b3VjaGJhciBtb2RlOlxuIg0KPj4gKyAgICAgICAgICAgICAiICAgIDAg
LSBlc2NhcGUga2V5IG9ubHlcbiINCj4+ICsgICAgICAgICAgICAgIiAgICAxIC0gZnVuY3Rpb24t
a2V5c1xuIg0KPj4gKyAgICAgICAgICAgICAiICAgIFsyXSAtIHNwZWNpYWwga2V5cyIpOw0KPj4g
Kw0KPj4gK3N0cnVjdCBhcHBsZXRiX2tiZCB7DQo+PiArICAgIHN0cnVjdCBoaWRfZmllbGQgKm1v
ZGVfZmllbGQ7DQo+PiArDQo+PiArICAgIHU4IHNhdmVkX21vZGU7DQo+PiArICAgIHU4IGN1cnJl
bnRfbW9kZTsNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga2V5X2VudHJ5
IGFwcGxldGJfa2JkX2tleW1hcFtdID0gew0KPj4gKyAgICB7IEtFX0tFWSwgS0VZX0VTQywgeyBL
RVlfRVNDIH0gfSwNCj4+ICsgICAgeyBLRV9LRVksIEtFWV9GMSwgIHsgS0VZX0JSSUdIVE5FU1NE
T1dOIH0gfSwNCj4+ICsgICAgeyBLRV9LRVksIEtFWV9GMiwgIHsgS0VZX0JSSUdIVE5FU1NVUCB9
IH0sDQo+PiArICAgIHsgS0VfS0VZLCBLRVlfRjMsICB7IEtFWV9SRVNFUlZFRCB9IH0sDQo+PiAr
ICAgIHsgS0VfS0VZLCBLRVlfRjQsICB7IEtFWV9SRVNFUlZFRCB9IH0sDQo+PiArICAgIHsgS0Vf
S0VZLCBLRVlfRjUsICB7IEtFWV9LQkRJTExVTURPV04gfSB9LA0KPj4gKyAgICB7IEtFX0tFWSwg
S0VZX0Y2LCAgeyBLRVlfS0JESUxMVU1VUCB9IH0sDQo+PiArICAgIHsgS0VfS0VZLCBLRVlfRjcs
ICB7IEtFWV9QUkVWSU9VU1NPTkcgfSB9LA0KPj4gKyAgICB7IEtFX0tFWSwgS0VZX0Y4LCAgeyBL
RVlfUExBWVBBVVNFIH0gfSwNCj4+ICsgICAgeyBLRV9LRVksIEtFWV9GOSwgIHsgS0VZX05FWFRT
T05HIH0gfSwNCj4+ICsgICAgeyBLRV9LRVksIEtFWV9GMTAsIHsgS0VZX01VVEUgfSB9LA0KPj4g
KyAgICB7IEtFX0tFWSwgS0VZX0YxMSwgeyBLRVlfVk9MVU1FRE9XTiB9IH0sDQo+PiArICAgIHsg
S0VfS0VZLCBLRVlfRjEyLCB7IEtFWV9WT0xVTUVVUCB9IH0sDQo+PiArICAgIHsgS0VfRU5ELCAw
IH0NCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgYXBwbGV0Yl9rYmRfc2V0X21vZGUoc3Ry
dWN0IGFwcGxldGJfa2JkICprYmQsIHU4IG1vZGUpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgaGlk
X3JlcG9ydCAqcmVwb3J0ID0ga2JkLT5tb2RlX2ZpZWxkLT5yZXBvcnQ7DQo+PiArICAgIHN0cnVj
dCBoaWRfZGV2aWNlICpoZGV2ID0gcmVwb3J0LT5kZXZpY2U7DQo+PiArICAgIGludCByZXQ7DQo+
PiArDQo+PiArICAgIHJldCA9IGhpZF9od19wb3dlcihoZGV2LCBQTV9ISU5UX0ZVTExPTik7DQo+
PiArICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgIGhpZF9lcnIoaGRldiwgIkRldmljZSBkaWRu
J3QgcmVzdW1lICglcGUpXG4iLCBFUlJfUFRSKHJldCkpOw0KPj4gKyAgICAgICAgcmV0dXJuIHJl
dDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXQgPSBoaWRfc2V0X2ZpZWxkKGtiZC0+bW9k
ZV9maWVsZCwgMCwgbW9kZSk7DQo+PiArICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgIGhpZF9l
cnIoaGRldiwgIkZhaWxlZCB0byBzZXQgbW9kZSBmaWVsZCB0byAldSAoJXBlKVxuIiwgbW9kZSwg
RVJSX1BUUihyZXQpKTsNCj4+ICsgICAgICAgIGdvdG8gcG93ZXJfbm9ybWFsOw0KPj4gKyAgICB9
DQo+PiArDQo+PiArICAgIGhpZF9od19yZXF1ZXN0KGhkZXYsIHJlcG9ydCwgSElEX1JFUV9TRVRf
UkVQT1JUKTsNCj4+ICsNCj4+ICsgICAga2JkLT5jdXJyZW50X21vZGUgPSBtb2RlOw0KPj4gKw0K
Pj4gK3Bvd2VyX25vcm1hbDoNCj4+ICsgICAgaGlkX2h3X3Bvd2VyKGhkZXYsIFBNX0hJTlRfTk9S
TUFMKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGlj
IHNzaXplX3QgbW9kZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICsgICAgICAgICAgICAg
c3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikNCj4+ICt7DQo+PiArICAg
IHN0cnVjdCBhcHBsZXRiX2tiZCAqa2JkID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+PiArDQo+
PiArICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVkXG4iLCBrYmQtPmN1cnJlbnRfbW9kZSk7
DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBzc2l6ZV90IG1vZGVfc3RvcmUoc3RydWN0IGRldmlj
ZSAqZGV2LA0KPj4gKyAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIs
DQo+PiArICAgICAgICAgICAgICBjb25zdCBjaGFyICpidWYsIHNpemVfdCBzaXplKQ0KPj4gK3sN
Cj4+ICsgICAgc3RydWN0IGFwcGxldGJfa2JkICprYmQgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
Cj4+ICsgICAgdTggbW9kZTsNCj4+ICsgICAgaW50IHJldDsNCj4+ICsNCj4+ICsgICAgcmV0ID0g
a3N0cnRvdTgoYnVmLCAwLCAmbW9kZSk7DQo+PiArICAgIGlmIChyZXQpDQo+PiArICAgICAgICBy
ZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKyAgICBpZiAobW9kZSA+IEFQUExFVEJfS0JEX01PREVfTUFY
KQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArICAgIHJldCA9IGFwcGxl
dGJfa2JkX3NldF9tb2RlKGtiZCwgbW9kZSk7DQo+PiArDQo+PiArICAgIHJldHVybiByZXQgPCAw
ID8gcmV0IDogc2l6ZTsNCj4+ICt9DQo+PiArc3RhdGljIERFVklDRV9BVFRSX1JXKG1vZGUpOw0K
Pj4gKw0KPj4gK3N0cnVjdCBhdHRyaWJ1dGUgKmFwcGxldGJfa2JkX2F0dHJzW10gPSB7DQo+PiAr
ICAgICZkZXZfYXR0cl9tb2RlLmF0dHIsDQo+PiArICAgIE5VTEwNCj4+ICt9Ow0KPj4gK0FUVFJJ
QlVURV9HUk9VUFMoYXBwbGV0Yl9rYmQpOw0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgYXBwbGV0Yl90
Yl9rZXlfdG9fc2xvdCh1bnNpZ25lZCBpbnQgY29kZSkNCj4+ICt7DQo+PiArICAgIHN3aXRjaCAo
Y29kZSkgew0KPj4gKyAgICBjYXNlIEtFWV9FU0M6DQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+
ICsgICAgY2FzZSBLRVlfRjEgLi4uIEtFWV9GMTA6DQo+PiArICAgICAgICByZXR1cm4gY29kZSAt
IEtFWV9GMSArIDE7DQo+PiArICAgIGNhc2UgS0VZX0YxMSAuLi4gS0VZX0YxMjoNCj4+ICsgICAg
ICAgIHJldHVybiBjb2RlIC0gS0VZX0YxMSArIDExOw0KPj4gKw0KPj4gKyAgICBkZWZhdWx0Og0K
Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgIH0NCj4+ICt9DQo+PiArDQo+PiAr
c3RhdGljIGludCBhcHBsZXRiX2tiZF9oaWRfZXZlbnQoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYs
IHN0cnVjdCBoaWRfZmllbGQgKmZpZWxkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgaGlkX3VzYWdlICp1c2FnZSwgX19zMzIgdmFsdWUpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3Qg
YXBwbGV0Yl9rYmQgKmtiZCA9IGhpZF9nZXRfZHJ2ZGF0YShoZGV2KTsNCj4+ICsgICAgc3RydWN0
IGtleV9lbnRyeSAqdHJhbnNsYXRpb247DQo+PiArICAgIHN0cnVjdCBpbnB1dF9kZXYgKmlucHV0
Ow0KPj4gKyAgICBpbnQgc2xvdDsNCj4+ICsNCj4+ICsgICAgaWYgKCh1c2FnZS0+aGlkICYgSElE
X1VTQUdFX1BBR0UpICE9IEhJRF9VUF9LRVlCT0FSRCB8fCB1c2FnZS0+dHlwZSAhPSBFVl9LRVkp
DQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgaW5wdXQgPSBmaWVsZC0+aGlk
aW5wdXQtPmlucHV0Ow0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBTa2lwIG5vbi10b3Vj
aC1iYXIga2V5cy4NCj4+ICsgICAgICoNCj4+ICsgICAgICogRWl0aGVyIHRoZSB0b3VjaCBiYXIg
aXRzZWxmIG9yIHVzYmhpZCBnZW5lcmF0ZSBhIHNsZXcgb2Yga2V5LWRvd24NCj4+ICsgICAgICog
ZXZlbnRzIGZvciBhbGwgdGhlIG1ldGEga2V5cy4gTm9uZSBvZiB3aGljaCB3ZSdyZSBhdCBhbGwg
aW50ZXJlc3RlZA0KPj4gKyAgICAgKiBpbi4NCj4+ICsgICAgICovDQo+PiArICAgIHNsb3QgPSBh
cHBsZXRiX3RiX2tleV90b19zbG90KHVzYWdlLT5jb2RlKTsNCj4+ICsgICAgaWYgKHNsb3QgPCAw
KQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIHRyYW5zbGF0aW9uID0gc3Bh
cnNlX2tleW1hcF9lbnRyeV9mcm9tX3NjYW5jb2RlKGlucHV0LCB1c2FnZS0+Y29kZSk7DQo+IA0K
PiBZb3UgYXJlIG1pc3NpbmcgYSBLY29uZmlnIGRlcGVuZHMgb3Igc2VsZWN0IGhlcmUgYmVjYXVz
ZSB3aGVuIGVuYWJsaW5nDQo+IHRoaXMgbW9kdWxlLCB3ZSBjYW4gZ2V0DQo+IA0KPiBFUlJPUjog
bW9kcG9zdDogInNwYXJzZV9rZXltYXBfc2V0dXAiIFtkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1r
YmQua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJzcGFyc2Vfa2V5bWFwX2VudHJ5
X2Zyb21fc2NhbmNvZGUiIFtkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQua29dIHVuZGVmaW5l
ZCENCj4gDQoNCkhpDQoNCkl0J3Mgc3RyYW5nZSB0aGF0ICJzZWxlY3QgSU5QVVRfU1BBUlNFS01B
UCIgaXMgY2F1c2luZyB0aGUgc2FtZSBlcnJvci4NCg0KQ2FuIHlvdSBwbGVhc2Ugc2VlIGlmIHRo
ZSBlcnJvciBpcyBzdGlsbCB0aGVyZSB3aXRoICJkZXBlbmRzIG9uIElOUFVUIiBhcyB3ZWxsIGFz
ICJzZWxlY3QgSU5QVVRfU1BBUlNFS01BUCINCg0KVGhhbmtzDQpBZGl0eWENCg0KPiBGV0lXLCBJ
IHRyaWVkICJkZXBlbmQgb24gSU5QVVRfU1BBUlNFS01BUCIgYW5kICJzZWxlY3QNCj4gSU5QVVRf
U1BBUlNFS01BUCIsIGJ1dCBpbiBib3RoIGNhc2VzIHRoZSBlcnJvciB3YXMgdGhlcmUsIHNvIEkg
c3VzcGVjdA0KPiB0aGVyZSBpcyBvbmUgZXh0cmEgY29uZmlnIHRvIHNlbGVjdCAoY291bGQgYmUg
bXkgc2NyaXB0IGJ1dCBpZiBJIGNhbg0KPiBlbnRlciB0aGlzIHN0YXRlLCBJIGJlbGlldmUgb3Ro
ZXJzIHdpbGwgZ2V0IGludG8gaXQgYXMgd2VsbCkuDQo+IENoZWVycywNCj4gQmVuamFtaW4NCj4g
DQo+PiArDQo+PiArICAgIGlmICh0cmFuc2xhdGlvbiAmJiBrYmQtPmN1cnJlbnRfbW9kZSA9PSBB
UFBMRVRCX0tCRF9NT0RFX1NQQ0wpIHsNCj4+ICsgICAgICAgIGlucHV0X2V2ZW50KGlucHV0LCB1
c2FnZS0+dHlwZSwgdHJhbnNsYXRpb24tPmtleWNvZGUsIHZhbHVlKTsNCj4+ICsNCj4+ICsgICAg
ICAgIHJldHVybiAxOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiBrYmQtPmN1cnJl
bnRfbW9kZSA9PSBBUFBMRVRCX0tCRF9NT0RFX09GRjsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGlj
IGludCBhcHBsZXRiX2tiZF9pbnB1dF9jb25maWd1cmVkKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2
LCBzdHJ1Y3QgaGlkX2lucHV0ICpoaWRpbnB1dCkNCj4+ICt7DQo+PiArICAgIGludCBpZHg7DQo+
PiArICAgIHN0cnVjdCBpbnB1dF9kZXYgKmlucHV0ID0gaGlkaW5wdXQtPmlucHV0Ow0KPj4gKw0K
Pj4gKyAgICAvKg0KPj4gKyAgICAgKiBDbGVhciB2YXJpb3VzIGlucHV0IGNhcGFiaWxpdGllcyB0
aGF0IGFyZSBibGluZGx5IHNldCBieSB0aGUgaGlkDQo+PiArICAgICAqIGRyaXZlciAodXNia2Jk
LmMpDQo+PiArICAgICAqLw0KPj4gKyAgICBtZW1zZXQoaW5wdXQtPmV2Yml0LCAwLCBzaXplb2Yo
aW5wdXQtPmV2Yml0KSk7DQo+PiArICAgIG1lbXNldChpbnB1dC0+a2V5Yml0LCAwLCBzaXplb2Yo
aW5wdXQtPmtleWJpdCkpOw0KPj4gKyAgICBtZW1zZXQoaW5wdXQtPmxlZGJpdCwgMCwgc2l6ZW9m
KGlucHV0LT5sZWRiaXQpKTsNCj4+ICsNCj4+ICsgICAgX19zZXRfYml0KEVWX1JFUCwgaW5wdXQt
PmV2Yml0KTsNCj4+ICsNCj4+ICsgICAgc3BhcnNlX2tleW1hcF9zZXR1cChpbnB1dCwgYXBwbGV0
Yl9rYmRfa2V5bWFwLCBOVUxMKTsNCj4+ICsNCj4+ICsgICAgZm9yIChpZHggPSAwOyBhcHBsZXRi
X2tiZF9rZXltYXBbaWR4XS50eXBlICE9IEtFX0VORDsgaWR4KyspIHsNCj4+ICsgICAgICAgIGlu
cHV0X3NldF9jYXBhYmlsaXR5KGlucHV0LCBFVl9LRVksIGFwcGxldGJfa2JkX2tleW1hcFtpZHhd
LmNvZGUpOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsN
Cj4+ICtzdGF0aWMgaW50IGFwcGxldGJfa2JkX3Byb2JlKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2
LCBjb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCAqaWQpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3Qg
YXBwbGV0Yl9rYmQgKmtiZDsNCj4+ICsgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmhkZXYtPmRl
djsNCj4+ICsgICAgc3RydWN0IGhpZF9maWVsZCAqbW9kZV9maWVsZDsNCj4+ICsgICAgaW50IHJl
dDsNCj4+ICsNCj4+ICsgICAgcmV0ID0gaGlkX3BhcnNlKGhkZXYpOw0KPj4gKyAgICBpZiAocmV0
KQ0KPj4gKyAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgcGFyc2Ug
ZmFpbGVkXG4iKTsNCj4+ICsNCj4+ICsgICAgbW9kZV9maWVsZCA9IGhpZF9maW5kX2ZpZWxkKGhk
ZXYsIEhJRF9PVVRQVVRfUkVQT1JULA0KPj4gKyAgICAgICAgICAgICAgICAgICAgSElEX0dEX0tF
WUJPQVJELCBISURfVVNBR0VfTU9ERSk7DQo+PiArICAgIGlmICghbW9kZV9maWVsZCkNCj4+ICsg
ICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4gKw0KPj4gKyAgICBrYmQgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKmtiZCksIEdGUF9LRVJORUwpOw0KPj4gKyAgICBpZiAoIWtiZCkNCj4+ICsg
ICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gKyAgICBrYmQtPm1vZGVfZmllbGQgPSBt
b2RlX2ZpZWxkOw0KPj4gKw0KPj4gKyAgICByZXQgPSBoaWRfaHdfc3RhcnQoaGRldiwgSElEX0NP
Tk5FQ1RfSElESU5QVVQpOw0KPj4gKyAgICBpZiAocmV0KQ0KPj4gKyAgICAgICAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgaHcgc3RhcnQgZmFpbGVkXG4iKTsNCj4+ICsNCj4+
ICsgICAgcmV0ID0gaGlkX2h3X29wZW4oaGRldik7DQo+PiArICAgIGlmIChyZXQpIHsNCj4+ICsg
ICAgICAgIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgaHcgb3BlbiBmYWlsZWRcbiIpOw0K
Pj4gKyAgICAgICAgZ290byBzdG9wX2h3Ow0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldCA9
IGFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwgYXBwbGV0Yl90Yl9kZWZfbW9kZSk7DQo+PiArICAg
IGlmIChyZXQpIHsNCj4+ICsgICAgICAgIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQg
dG8gc2V0IHRvdWNoYmFyIG1vZGVcbiIpOw0KPj4gKyAgICAgICAgZ290byBjbG9zZV9odzsNCj4+
ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBoaWRfc2V0X2RydmRhdGEoaGRldiwga2JkKTsNCj4+ICsN
Cj4+ICsgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArY2xvc2VfaHc6DQo+PiArICAgIGhpZF9od19j
bG9zZShoZGV2KTsNCj4+ICtzdG9wX2h3Og0KPj4gKyAgICBoaWRfaHdfc3RvcChoZGV2KTsNCj4+
ICsgICAgcmV0dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgYXBwbGV0Yl9r
YmRfcmVtb3ZlKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2KQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0
IGFwcGxldGJfa2JkICprYmQgPSBoaWRfZ2V0X2RydmRhdGEoaGRldik7DQo+PiArDQo+PiArICAg
IGFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwgQVBQTEVUQl9LQkRfTU9ERV9PRkYpOw0KPj4gKw0K
Pj4gKyAgICBoaWRfaHdfY2xvc2UoaGRldik7DQo+PiArICAgIGhpZF9od19zdG9wKGhkZXYpOw0K
Pj4gK30NCj4+ICsNCj4+ICsjaWZkZWYgQ09ORklHX1BNDQo+PiArc3RhdGljIGludCBhcHBsZXRi
X2tiZF9zdXNwZW5kKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LCBwbV9tZXNzYWdlX3QgbXNnKQ0K
Pj4gK3sNCj4+ICsgICAgc3RydWN0IGFwcGxldGJfa2JkICprYmQgPSBoaWRfZ2V0X2RydmRhdGEo
aGRldik7DQo+PiArDQo+PiArICAgIGtiZC0+c2F2ZWRfbW9kZSA9IGtiZC0+Y3VycmVudF9tb2Rl
Ow0KPj4gKyAgICBhcHBsZXRiX2tiZF9zZXRfbW9kZShrYmQsIEFQUExFVEJfS0JEX01PREVfT0ZG
KTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQg
YXBwbGV0Yl9rYmRfcmVzZXRfcmVzdW1lKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2KQ0KPj4gK3sN
Cj4+ICsgICAgc3RydWN0IGFwcGxldGJfa2JkICprYmQgPSBoaWRfZ2V0X2RydmRhdGEoaGRldik7
DQo+PiArDQo+PiArICAgIGFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwga2JkLT5zYXZlZF9tb2Rl
KTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKyNlbmRpZg0KPj4gKw0KPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCBhcHBsZXRiX2tiZF9oaWRfaWRzW10g
PSB7DQo+PiArICAgIC8qIE1hY0Jvb2sgUHJvJ3MgMjAxOCwgMjAxOSwgd2l0aCBUMiBjaGlwOiBp
QnJpZGdlIERpc3BsYXkgKi8NCj4+ICsgICAgeyBISURfVVNCX0RFVklDRShVU0JfVkVORE9SX0lE
X0FQUExFLCBVU0JfREVWSUNFX0lEX0FQUExFX1RPVUNIQkFSX0RJU1BMQVkpIH0sDQo+PiArICAg
IHsgfQ0KPj4gK307DQo+PiArTU9EVUxFX0RFVklDRV9UQUJMRShoaWQsIGFwcGxldGJfa2JkX2hp
ZF9pZHMpOw0KPj4gKw0KPj4gK3N0YXRpYyBzdHJ1Y3QgaGlkX2RyaXZlciBhcHBsZXRiX2tiZF9o
aWRfZHJpdmVyID0gew0KPj4gKyAgICAubmFtZSA9ICJoaWQtYXBwbGV0Yi1rYmQiLA0KPj4gKyAg
ICAuaWRfdGFibGUgPSBhcHBsZXRiX2tiZF9oaWRfaWRzLA0KPj4gKyAgICAucHJvYmUgPSBhcHBs
ZXRiX2tiZF9wcm9iZSwNCj4+ICsgICAgLnJlbW92ZSA9IGFwcGxldGJfa2JkX3JlbW92ZSwNCj4+
ICsgICAgLmV2ZW50ID0gYXBwbGV0Yl9rYmRfaGlkX2V2ZW50LA0KPj4gKyAgICAuaW5wdXRfY29u
ZmlndXJlZCA9IGFwcGxldGJfa2JkX2lucHV0X2NvbmZpZ3VyZWQsDQo+PiArI2lmZGVmIENPTkZJ
R19QTQ0KPj4gKyAgICAuc3VzcGVuZCA9IGFwcGxldGJfa2JkX3N1c3BlbmQsDQo+PiArICAgIC5y
ZXNldF9yZXN1bWUgPSBhcHBsZXRiX2tiZF9yZXNldF9yZXN1bWUsDQo+PiArI2VuZGlmDQo+PiAr
ICAgIC5kcml2ZXIuZGV2X2dyb3VwcyA9IGFwcGxldGJfa2JkX2dyb3VwcywNCj4+ICt9Ow0KPj4g
K21vZHVsZV9oaWRfZHJpdmVyKGFwcGxldGJfa2JkX2hpZF9kcml2ZXIpOw0KPj4gKw0KPj4gK01P
RFVMRV9BVVRIT1IoIlJvbmFsZCBUc2NoYWzDpHIiKTsNCj4+ICtNT0RVTEVfQVVUSE9SKCJLZXJl
bSBLYXJhYmF5IDxrZWtyYnlAZ21haWwuY29tPiIpOw0KPj4gK01PRFVMRV9ERVNDUklQVElPTigi
TWFjQm9va1BybyBUb3VjaCBCYXIgS2V5Ym9hcmQgTW9kZSBEcml2ZXIiKTsNCj4+ICtNT0RVTEVf
TElDRU5TRSgiR1BMIik7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5j
IGIvZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5jDQo+PiBpbmRleCA4MThkNDFhMzUuLjdjNTc2ZDY1
NCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvaGlkL2hpZC1xdWlya3MuYw0KPj4gKysrIGIvZHJp
dmVycy9oaWQvaGlkLXF1aXJrcy5jDQo+PiBAQCAtMzI4LDcgKzMyOCw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaGlkX2RldmljZV9pZCBoaWRfaGF2ZV9zcGVjaWFsX2RyaXZlcltdID0gew0KPj4g
ICAgeyBISURfVVNCX0RFVklDRShVU0JfVkVORE9SX0lEX0FQUExFLCBVU0JfREVWSUNFX0lEX0FQ
UExFX0dFWVNFUjFfVFBfT05MWSkgfSwNCj4+ICAgIHsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRP
Ul9JRF9BUFBMRSwgVVNCX0RFVklDRV9JRF9BUFBMRV9NQUdJQ19LRVlCT0FSRF8yMDIxKSB9LA0K
Pj4gICAgeyBISURfVVNCX0RFVklDRShVU0JfVkVORE9SX0lEX0FQUExFLCBVU0JfREVWSUNFX0lE
X0FQUExFX01BR0lDX0tFWUJPQVJEX0ZJTkdFUlBSSU5UXzIwMjEpIH0sDQo+PiAtICAgIHsgSElE
X1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9BUFBMRSwgVVNCX0RFVklDRV9JRF9BUFBMRV9UT1VD
SEJBUl9ESVNQTEFZKSB9LA0KPj4gI2VuZGlmDQo+PiAjaWYgSVNfRU5BQkxFRChDT05GSUdfSElE
X0FQUExFSVIpDQo+PiAgICB7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURfQVBQTEUsIFVT
Ql9ERVZJQ0VfSURfQVBQTEVfSVJDT05UUk9MKSB9LA0KPj4gQEAgLTM0MCw2ICszMzksOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGhpZF9kZXZpY2VfaWQgaGlkX2hhdmVfc3BlY2lhbF9kcml2ZXJb
XSA9IHsNCj4+ICNpZiBJU19FTkFCTEVEKENPTkZJR19ISURfQVBQTEVUQl9CTCkNCj4+ICAgIHsg
SElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9BUFBMRSwgVVNCX0RFVklDRV9JRF9BUFBMRV9U
T1VDSEJBUl9CQUNLTElHSFQpIH0sDQo+PiAjZW5kaWYNCj4+ICsjaWYgSVNfRU5BQkxFRChDT05G
SUdfSElEX0FQUExFVEJfS0JEKQ0KPj4gKyAgICB7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1Jf
SURfQVBQTEUsIFVTQl9ERVZJQ0VfSURfQVBQTEVfVE9VQ0hCQVJfRElTUExBWSkgfSwNCj4+ICsj
ZW5kaWYNCj4+ICNpZiBJU19FTkFCTEVEKENPTkZJR19ISURfQVNVUykNCj4+ICAgIHsgSElEX0ky
Q19ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9BU1VTVEVLLCBVU0JfREVWSUNFX0lEX0FTVVNURUtfSTJD
X0tFWUJPQVJEKSB9LA0KPj4gICAgeyBISURfSTJDX0RFVklDRShVU0JfVkVORE9SX0lEX0FTVVNU
RUssIFVTQl9ERVZJQ0VfSURfQVNVU1RFS19JMkNfVE9VQ0hQQUQpIH0sDQo+PiAtLQ0KPj4gMi40
My4wDQo+PiANCg==


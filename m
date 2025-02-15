Return-Path: <linux-input+bounces-10071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F4A37028
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 19:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D3E16F8AD
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 18:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F85A1DF964;
	Sat, 15 Feb 2025 18:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="I9XHKOCE"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010011.outbound.protection.outlook.com [52.103.68.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DA61AAA1E;
	Sat, 15 Feb 2025 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739644736; cv=fail; b=QeXFJ5jr1abcYD3n3184cD1VmjevfcWebKvZ9PT3nlfTpw67aPd+Tx6BreQdt304WEADbWbV8enFHH5ZJe+Y50ImKU3byBiphjXvWVRW5v+lbYCQ44Z9bvZ/rNjPd2y4IsAKv0LzGyhGp3yWZiIltOwj1RSdRqGw7huZpWnsRcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739644736; c=relaxed/simple;
	bh=YHlhb1ZKOY3KaiRMpdTotOYDHecZ8op+Sb3TGH9ji6Y=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OBrZDgFnw/G/shOjFYK2nitcghJsu1R4rqRcETOmsBVG1pyYPLME6YPd8SHo9COljE1cobYmPkj0ayFrwuKECt6w1ohCW/g+VRYTuUc7iLS2/nHEcTaC77AdO5Z5dyeE+KmD4tiycjF5ozP/5QRidvUivqBGN5RsdtobitZGkPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=I9XHKOCE; arc=fail smtp.client-ip=52.103.68.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JogT++XOg/vU4Q7EpQB93LHzN2niWsf7OhTadSkedKw8Z9ieNSM43/+YiECYk/DD29S92ravFfzrlTqelyOkVYwuNp3RcHGF4bt6RU/c2YWQQhJhVRFDyWtZZ5fiEPCjK8Ey/EtSRT/kR/7Z63xBSY/BXwHhU5LEsqSILQwnFX/fXgDQDLhsAuDbyI0xYZim4RwEuRKNj1L3cD19GXZq+uVNA0WzheokZ5W8Kz9bKYE3x2iHrhBjNMTCw8Qf3XZJaKRAgC/9jMLihcf+nCUD2MadjJzARDcr444VX7lvNejblKDbvtfnwEmCYwCFqwhfwtOCFXFkRtZ9sP4hVZDSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHlhb1ZKOY3KaiRMpdTotOYDHecZ8op+Sb3TGH9ji6Y=;
 b=gokWgqhE/P3xNesuu1I1P/9P0IkE5FNqbWFN5oYHPhyGamuDlpHKpRc8wv7VorsLnkUnF5vG07jgsf3Tv1FIjjxVOz6ZgLNrEL8MYgPXE0kuzb5dYUJ12wc606hheyTTUOx9hxpfLdxB7XcxU8Wz369JffocDS4uCGgDUrDeJOWWOdP996Gg4F4uc4xHag2qPNZnb3cavhkZtU19Y8zZRaJP2FeG0tegEL5pOTuZ2wMhb8ZlYk2yJY2CU0ifk0VYyL7NVpqilusEkuQbsqdPwHDsKqFaCDuA9Yh60b6BapXqSgMPgEchFnlmhkpybMa2q0JK8G7gFBFzi0HsOgdJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHlhb1ZKOY3KaiRMpdTotOYDHecZ8op+Sb3TGH9ji6Y=;
 b=I9XHKOCE35KyuHy7VsnE7vbYx4WhbnB7kAOl7r2CGJZZmAU1PZLLvrVfWPPUgPRT0TCVhcjtIKbckJkbB7TdJWFUfDAl5W9unv2l+EmzzddlRa4G8KmukxdBgHveBh+aAZmbqAMySpMH92jY3rkXasnzymODhLljXQX0PVRCFowqTBzcCbrDor0+0qHKc+EliK20urGgas7xqynrJE4S0yMmm2qq3UUCkHusrVdiZi7AkwlKIRhJ6GND/CHYLPT4KzL6yECugAqNlKSiARBmYHLabdOdIL4qMLAxJejx/PS4WODHYyCtlza2OZzmcRhHg7w60dXEi3AMDRrAxfbLjg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MA0PR01MB7817.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sat, 15 Feb
 2025 18:38:48 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.016; Sat, 15 Feb 2025
 18:38:48 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH v3 1/3] HID: hid-appletb-kbd: simplify logic used to switch
 between media and function keys on pressing fn key
Thread-Topic: [PATCH v3 1/3] HID: hid-appletb-kbd: simplify logic used to
 switch between media and function keys on pressing fn key
Thread-Index: AQHbf9jYwLElU2xFu0WS0KFMqACCew==
Date: Sat, 15 Feb 2025 18:38:46 +0000
Message-ID: <00768D5D-F9CB-45DA-8F5A-3E21E84A8AA8@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MA0PR01MB7817:EE_
x-ms-office365-filtering-correlation-id: a6ca6e74-10fb-4be8-2762-08dd4deffb6b
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|7092599003|15080799006|19110799003|8060799006|8062599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?utf-8?B?UmFJS1pTOUMyb0loQ09UWVJLaDRmRXVYL2VJL1JhajE2T1NRV3I2MWtLODlB?=
 =?utf-8?B?R1JCYVMxOWpreDV3MDZuMWpCSDUrMWpmU1VJNzRlYlBvRUgvRmp6UW9Rd0Zj?=
 =?utf-8?B?c1RWS1QvakVQaGx2WTdJcGhhTkR0K29MSDhwNFdGNFQzY2NaMmFGeDFNUFhw?=
 =?utf-8?B?eXl2TGZaRGIrWFRvMUlONGtoVUhkRkZTRUlUUEJMb28wcitRbmY5S3FFRDJx?=
 =?utf-8?B?TndnMkhWRWx2VG5tYmJ3ckxBRXRLUnZvanNqRk53eVJBNHNRL1h2V2lDV1hH?=
 =?utf-8?B?SWx3dWpSR1NTRnBEMzd1bUI3ZWVQUG9VWmZqNzRTVjBFUjBGRkxFajd2SUxj?=
 =?utf-8?B?eEh4OHlFc056N2FGY0lISmNxLzBqY1cvWWxIQXpkWnYyTVFXdFNZU3V6K0l6?=
 =?utf-8?B?RUZzRTdaVHQwekdYY0pEOG51TEpSczhCVlF2c0Q0Yk9PQ0FSRmFRQW91c0xk?=
 =?utf-8?B?RTZiWHZscDh0QlBkWWZxN00xRWJDZHp1L0s0eVA2YlFTZFE4NG85UC81ZUdN?=
 =?utf-8?B?Sm9uL1JBNTEwbFJ2T0M5eCtBcXBCUUF0Z04yUXVkLzN6dXhyUGY2SVB3cXQy?=
 =?utf-8?B?SXVXTzFQUlZpQVdWSnhSam9jYXI3K2RPdEpXQzJ1bUtsUzZmdFI5VDU4T2Q5?=
 =?utf-8?B?NnB1SjFvekZ3ajBXL0JRcnQ2Y1RwcWV2VmZacDRqQ3dCYUpuZVRoVjRCRnFw?=
 =?utf-8?B?eHFzMUplUHg5MFY4dVhneTlHRW5FWHp2WmdoOFJhOWJCd1hiRUpIVTBnaDgv?=
 =?utf-8?B?a24xSmdOVkorNjJUbWN3ZGw2Ym9uU1lQV242UWp2U2RvUmthRlJzdVIyQ2hi?=
 =?utf-8?B?YkFYYWcvbjVJTEVEQ3pmL0F6cDlkcENENVQ5OFd0LzJwVmlvUzA2d2ZkMFl2?=
 =?utf-8?B?THBETE5SV1piZG5VUVRqTGJDNE1lRWFJaTh1TlYxbUNoQ25lSDRpd2VyWXI1?=
 =?utf-8?B?c1dtMGlSK09TS2V6eTlKRjNFRGcrLzQ2SkVYbTYyMlZqc0xUYXI1bXRNYjRD?=
 =?utf-8?B?LzN5MFlRQnNwL3ZqK0hyaWxTeDZ5NnYwbk9QTXVyVHZ3UzB5NkMzTmdtL0Nt?=
 =?utf-8?B?ZjhkcVg1MjZoMEhDRUM5RHpLWkx3NnNWRDRTaHhqclk5M2N4YXN1NnpiTW5G?=
 =?utf-8?B?a1VkUi9DTTN6bWo5bEtNdTFiS29OdldqTGE3MWpjbkY3UkpWU2g0Y1lNMGlE?=
 =?utf-8?B?RTFGeW56cmUyRXdUVktqekt3RzRBb1B4Z1lwVi84SlRqQzZjWVZHVitud3ZQ?=
 =?utf-8?B?VmdyNHNTOW1wVlhmbHNZbTl0ajFnNmNVREdMY2tsbGROU0hIanRJTENtMXJU?=
 =?utf-8?B?ai9NWlBHYUV2OUdYTVkwejB3ZU8vNWhRUEZ2NHdVcG1ZNGQ5T0cxUGM2NkFv?=
 =?utf-8?B?SGY5WllOOE5ZU25vYjVlYlpUYVNUNHp3SFNlYmcyM0svaXdUYmUyUWgvYU9t?=
 =?utf-8?B?NDl4V2ZpK2RMM1U2KzJNMGd0Q1dTUzBxQnMycWNRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VlFNeW1uQ1gvUVRqMzZTd2lVeFVJL2FZWUNHb2VlZVAwNm5FZDI0TVVmbTkz?=
 =?utf-8?B?SVBUWlVzWEltd1ZRUWJjc2E3ZHl4YVlPR3ArQ1YzZEVOcmg0clM2OUdvWGl3?=
 =?utf-8?B?YkJQNHZzcUVmTGgzVTNYRzEvYk1zMEdjRmg4N0tXbDlONHM0WEhXZ2VtNmp2?=
 =?utf-8?B?bzlBZVJsMlJITDVwWE5aVFI5YVZ2MkdnUkZTUk82L0FoYkxVVXQyb0pveVVT?=
 =?utf-8?B?Mk5rTldaODJ3d1JEdm1JSzZCdjBVTE1RLzdTU1M3WEUrYVB1UWpjT1k4NXps?=
 =?utf-8?B?NDFTTTdrOC8xL3hBVlZvNTNqR0ZnY1UrQ01WOWJYYmxlazlxTURaQVpaSXhr?=
 =?utf-8?B?Wk1SMmdmby9ZQ2hjekFlNkthUzdqS2wxTkxVNmt2WFJ0eFJGaWhCeGdQYXh0?=
 =?utf-8?B?WlRWTjdPUzVwL3RCdnhtRit3akhxUzIzRWxxSG5xWW0rK2QvbEhubEtaRnhJ?=
 =?utf-8?B?RUEwbm1rWEM0bmE5emR5STBVRXlMYlNiTiswU3RSQnAwaVBZWjVuVVFTUlhJ?=
 =?utf-8?B?VUFBMkpoU3hpUjF1UFpNWStNaWJtS3Q4eXZVbHZGcEV0NGlVTk81LzNaWnZn?=
 =?utf-8?B?NTdtOFFibTlTKzl1WnpMd053dVdzTlh3d1FaaVlNdUdaL0Rpa1hXU1lsWjc3?=
 =?utf-8?B?ZDZRd1pvbVpFSlJHVEFWSzRpN242UzBCcHV3TjlUejdtQURDZFUzc3k4UXJi?=
 =?utf-8?B?T210T0VYN2NjNW5hbkoxSnFoUG1oS3RodVZXOElKMXRRSWFnMS9sTFloTHRB?=
 =?utf-8?B?NnhsZTFkM3FEQWJVcmNaOTNPSTF5L3ZWWjhETEZMWWV3WVpKa2R6LzRpZVQw?=
 =?utf-8?B?b29QRVFZYlN5TGY5VkFlWHNzUHRoVDRNdmIvdlhzYXUxZ3czOHJRd0VwdDhZ?=
 =?utf-8?B?YmIzQk5rQTRzaUVkU3lySGt0bzQ5KytwVysyWmpQUUlCSTJmNFkraXI0eW1I?=
 =?utf-8?B?R3dldVBkZk5GQ2ZiUXlMeDNyL2l5Nng5eWdsRFc1ZjFGOTVOSUpiTmM2dnN4?=
 =?utf-8?B?OU9WYVppeU5jNVFwUFc1UDJEWjd6RFUyZ0FPRndZeThBYzYyRnR1TjB5cnBx?=
 =?utf-8?B?RjJIL0JsZnFLOTVXWWU1RldyNWk5VWZyRmFWOHpjT055ekkvVlNDSzMrSUxM?=
 =?utf-8?B?UHlHNkdMY3lGa09LRzIwSy8vbmI5NnczdXYyRU9JK1FGb0JqVUpDVjlrTlF4?=
 =?utf-8?B?ZzM5a1dIcFVDeVQ2QTNDdzJFZldDaUw3YzdaMkpYbHhLNEcyS2lDZnhiaExm?=
 =?utf-8?B?NEhVOEp2TUlhNnJZRzJudVlVQjJYZ3p0Zk9aVERkc1lxR3BaMWtLNUVZRm5B?=
 =?utf-8?B?Q3lKMkF0YlcrYk9MbDNXZTB5K1liOFMwZ0U3cGRBZStkUkhHNG5SWEJUdDBF?=
 =?utf-8?B?Z2RFVG5SUWpzNitiTmR0SjVrUzlQS1g4cERQZVh3Z1lRZThVLzB6SzlOTHVN?=
 =?utf-8?B?ejFIK052N3RXcmNBaytDM2hPZThJcDlrQUFXdHNmck8wVTNEcFRZR1Y2ZGMv?=
 =?utf-8?B?S3ZUUW0vUGlpRkpYcVRnanNSZ1g2blY0b0hNd0UveE9Ydm0ydTdEUy94MFVS?=
 =?utf-8?B?U1VsSkRpRGNZSFlGTjQvNWFUNVRCYTV0SmRtMDExTTArejRNalhjdmFkTmJ4?=
 =?utf-8?B?OERZWXlSTFlUR1E5WE0zU3BiZ1dMZkFiK0pSSUs4R1RZMEk2SkdXdFN6ZjJS?=
 =?utf-8?B?RXprQWZBWmRsSjFPQnpTb3FySEppR2lRL2JEcVRYbnJ1SXVON1NmdzBCZXNh?=
 =?utf-8?Q?DvGao7x+NFSsxtKhdfDQwA2VTb+7hGWfv6CorV/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BEE9C48A8719A4C8920D1B840C45CD4@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ca6e74-10fb-4be8-2762-08dd4deffb6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 18:38:46.7092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7817

RnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCg0KVGhpcyBjb21taXQg
c2ltcGxpZmllcyB0aGUgbG9naWMgaW4gYXBwbGV0Yl9rYmRfaW5wX2V2ZW50IHVzZWQgZm9yDQpz
d2l0Y2hpbmcgYmV0d2VlbiB0aGUgbWVkaWEgYW5kIGZ1bmN0aW9uIGtleXMgb24gcHJlc3Npbmcg
dGhlIGZuIGtleS4NCg0KV2Ugbm93IGFsc28gcHJldmVudCB0b3VjaGluZyB0aGUga2JkLT5zYXZl
ZF9tb2RlIHZhcmlhYmxlIGluIGNhc2UgdGhlIGVzYw0Ka2V5IG9ubHkgbW9kZSBpcyBjaG9zZW4u
DQoNClRoZSBmb2xsb3dpbmcgc21hbGwgZml4ZXMgaGF2ZSBhbHNvIGJlZW4gZG9uZSBpbiB0aGlz
IHBhdGNoOg0KDQotIEEgc21hbGwgY29tbWVudCBzdHlsZSBlcnJvciBoYXMgYmVlbiBmaXhlZA0K
LSBGaXhlZCBzcGVsbGluZyBpbiBNT0RVTEVfREVTQ1JJUFRJT04NCi0gSSBoYXZlIGFkZGVkIG15
c2VsZiB0byBNT0RVTEVfQVVUSE9SDQoNClNpZ25lZC1vZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJn
YWRpdHlhMDhAbGl2ZS5jb20+DQotLS0NCiBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYyB8
IDE1ICsrKysrKysrLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQu
YyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQppbmRleCAzOGZjMGU1OGMuLmU0NWNj
M2FjNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQorKysgYi9k
cml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYw0KQEAgLTIzNiwxMyArMjM2LDEzIEBAIHN0YXRp
YyB2b2lkIGFwcGxldGJfa2JkX2lucF9ldmVudChzdHJ1Y3QgaW5wdXRfaGFuZGxlICpoYW5kbGUs
IHVuc2lnbmVkIGludCB0eXBlDQogDQogCXJlc2V0X2luYWN0aXZpdHlfdGltZXIoa2JkKTsNCiAN
Ci0JaWYgKHR5cGUgPT0gRVZfS0VZICYmIGNvZGUgPT0gS0VZX0ZOICYmIGFwcGxldGJfdGJfZm5f
dG9nZ2xlKSB7DQorCWlmICh0eXBlID09IEVWX0tFWSAmJiBjb2RlID09IEtFWV9GTiAmJiBhcHBs
ZXRiX3RiX2ZuX3RvZ2dsZSAmJg0KKwkJKGtiZC0+Y3VycmVudF9tb2RlID09IEFQUExFVEJfS0JE
X01PREVfU1BDTCB8fA0KKwkJIGtiZC0+Y3VycmVudF9tb2RlID09IEFQUExFVEJfS0JEX01PREVf
Rk4pKSB7DQogCQlpZiAodmFsdWUgPT0gMSkgew0KIAkJCWtiZC0+c2F2ZWRfbW9kZSA9IGtiZC0+
Y3VycmVudF9tb2RlOw0KLQkJCWlmIChrYmQtPmN1cnJlbnRfbW9kZSA9PSBBUFBMRVRCX0tCRF9N
T0RFX1NQQ0wpDQotCQkJCWFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwgQVBQTEVUQl9LQkRfTU9E
RV9GTik7DQotCQkJZWxzZSBpZiAoa2JkLT5jdXJyZW50X21vZGUgPT0gQVBQTEVUQl9LQkRfTU9E
RV9GTikNCi0JCQkJYXBwbGV0Yl9rYmRfc2V0X21vZGUoa2JkLCBBUFBMRVRCX0tCRF9NT0RFX1NQ
Q0wpOw0KKwkJCWFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwga2JkLT5jdXJyZW50X21vZGUgPT0g
QVBQTEVUQl9LQkRfTU9ERV9TUENMDQorCQkJCQkJPyBBUFBMRVRCX0tCRF9NT0RFX0ZOIDogQVBQ
TEVUQl9LQkRfTU9ERV9TUENMKTsNCiAJCX0gZWxzZSBpZiAodmFsdWUgPT0gMCkgew0KIAkJCWlm
IChrYmQtPnNhdmVkX21vZGUgIT0ga2JkLT5jdXJyZW50X21vZGUpDQogCQkJCWFwcGxldGJfa2Jk
X3NldF9tb2RlKGtiZCwga2JkLT5zYXZlZF9tb2RlKTsNCkBAIC00OTcsMTAgKzQ5NywxMSBAQCBz
dGF0aWMgc3RydWN0IGhpZF9kcml2ZXIgYXBwbGV0Yl9rYmRfaGlkX2RyaXZlciA9IHsNCiB9Ow0K
IG1vZHVsZV9oaWRfZHJpdmVyKGFwcGxldGJfa2JkX2hpZF9kcml2ZXIpOw0KIA0KLS8qIFRoZSBi
YWNrbGlnaHQgZHJpdmVyIHNob3VsZCBiZSBsb2FkZWQgYmVmb3JlIHRoZSBrZXlib2FyZCBkcml2
ZXIgaXMgaW5pdGlhbGlzZWQqLw0KKy8qIFRoZSBiYWNrbGlnaHQgZHJpdmVyIHNob3VsZCBiZSBs
b2FkZWQgYmVmb3JlIHRoZSBrZXlib2FyZCBkcml2ZXIgaXMgaW5pdGlhbGlzZWQgKi8NCiBNT0RV
TEVfU09GVERFUCgicHJlOiBoaWRfYXBwbGV0Yl9ibCIpOw0KIA0KIE1PRFVMRV9BVVRIT1IoIlJv
bmFsZCBUc2NoYWzDpHIiKTsNCiBNT0RVTEVfQVVUSE9SKCJLZXJlbSBLYXJhYmF5IDxrZWtyYnlA
Z21haWwuY29tPiIpOw0KLU1PRFVMRV9ERVNDUklQVElPTigiTWFjQm9va1BybyBUb3VjaCBCYXIg
S2V5Ym9hcmQgTW9kZSBEcml2ZXIiKTsNCitNT0RVTEVfQVVUSE9SKCJBZGl0eWEgR2FyZyA8Z2Fy
Z2FkaXR5YTA4QGxpdmUuY29tPiIpOw0KK01PRFVMRV9ERVNDUklQVElPTigiTWFjQm9vayBQcm8g
VG91Y2ggQmFyIEtleWJvYXJkIE1vZGUgZHJpdmVyIik7DQogTU9EVUxFX0xJQ0VOU0UoIkdQTCIp
Ow0KLS0gDQoyLjQzLjANCg0K


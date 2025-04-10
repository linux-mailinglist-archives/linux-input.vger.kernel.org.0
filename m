Return-Path: <linux-input+bounces-11689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD3A83C6C
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 10:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7471A3A6287
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 08:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D4C20CCD0;
	Thu, 10 Apr 2025 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="f93QJeKt"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73C20CCC2;
	Thu, 10 Apr 2025 08:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272858; cv=fail; b=uPKSaRhQjn8JuVy+x240zsr4sXidEJPlrKYaFt3rHH2Nm57teXCTqJlKXkO7PHsjRcVmmlvM3ofzvXPemT82skbjIaPt/gbRmmNx9wVgZlLAyGPqmfx0QXERra3r+soqwcr/Z0HoBVxIaxr7wVwUkES8lkquM4dSl5jMaTTaiA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272858; c=relaxed/simple;
	bh=OhoSS4ZG+yrQ2BRS5xUurXXy+C9GRgfQJvWc61R0yBo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rVVWVP8IdwD2rdebu1tN01ny0bTAiEHulT5RIjOXjHpsh4a68/rz51u/nX98WK1mFO4FaKchphcIr+XpKKW30QLDpgAeAEqBvBiVANTMoKuyRopLle++Wt7tLErAhdFMuGjfxFi88vFGwjHS7rUzJ055ohfWND3jARIeDncF8CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=f93QJeKt; arc=fail smtp.client-ip=52.103.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB0ryM3mfY8+lK3AlTJ6ViWb6Bf9O1LBIr5JvIg7NfSLqZd+JfWFqOKRzbFzkPAoJPKejFAuPKS84MuAOQ+tfWKEoeqmTEoqBw+ZNV15YH9TWLxMA9SDefVwjRupvs0fIZRMliaXltRgDbSyDYwXiDfgnYpnae6CVt5RZbqyakk1z5H86hXGAruJgY/Ahv8HPQ9zVy6B3tvJiiguicup8ZU/NYbTAK62iL/JnokfHcwyc9j00ivbyyB1eLH2+k9TYDXMcwQJNUJEFNxzpq54NWlB3cBICccWt+kSro5xrbYvEo/gCOCsqbWwEkpklzcWnQDtYgSZW9F37O2tbnhlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhoSS4ZG+yrQ2BRS5xUurXXy+C9GRgfQJvWc61R0yBo=;
 b=dYYA5kjVGU8PA9C+qcBq7H2UOh+xztZATsrmtKM0tLF0ma2kLvjP6531tCxHEgcBzb2WHgKstms1wjP7NO1VvwUqtCufzrH+c0ObXRFDZu4sfZj9aVgkvC/zZNwh1IsdUEkgKaknWjD5USc/smaU+YcXwuLUG8wVPSLHv4LNCz956LYR0zmok42EkXmXgVLx31kKEbGQXprtt14c8SIXfaESLJcDqaeNmJADdWTobv0gFEUXH9mvr+Dr6YV5XsE9y8hQlHOWq8qizJ2dwqD6qFho9TyOO392r6ZvLK9tGiUdQG7Xt9yVOfSubWqPtboFi+vSZpnnC6adWqfvBwlfaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhoSS4ZG+yrQ2BRS5xUurXXy+C9GRgfQJvWc61R0yBo=;
 b=f93QJeKt8TJTQ3mmz1j7WvSPV+rwPJ2KLbpzamR2SHkFZVlOGDS78Cy+R390yBUhcvEOAbwFXOubRUd9dZVSdwn+dSgtbfPeR2Vix+RrE1RKc09uMv0uxtFM70i37CXTKFz0jWdkdrfdTmcBu4amoaYSgYc0MGVLAak4mdS2Y2eVjXPBNVc8tBTUIGLBuPSDei33IBmuNqJNJ3NT6YGIK698mqrVwnAAO+QiwWFcLT95a8Pqjza4y2xWBkhMtiaLH4mPROdEa8w7tD9swdHwT3SmmWIDi7ghtGCCrDVKMYjfdTKA1bJPC7/Hu3qb/hTVXVdknhPbUT5rbU6oKVYcUw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB8987.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 08:14:12 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 08:14:12 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Kerem Karabay <kekrby@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on
 X86
Thread-Topic: [PATCH] HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on
 X86
Thread-Index: AQHbqVBjQOYX8iizlEK8i3Tbwf1R8LObZquAgAEmQACAAAGHDQ==
Date: Thu, 10 Apr 2025 08:14:11 +0000
Message-ID:
 <PN3PR01MB9597163E40F42312B693C649B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References:
 <4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be>
 <PN0PR01MB95889912BB81D1B1B579C7FEB8B42@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWdttY-dfyvNX1rWTrL8zQdW=X+wXguK7djM06QPgGmdw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWdttY-dfyvNX1rWTrL8zQdW=X+wXguK7djM06QPgGmdw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB8987:EE_
x-ms-office365-filtering-correlation-id: 74c03244-4cf8-4597-406e-08dd7807ad0d
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|8060799006|19110799003|15080799006|7092599003|6072599003|10035399004|440099028|3412199025|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlFGMXJxdS82RmpXNzFFZTdDVkJaK29VcUNLUnJRamY5SHZYZksyNk1zSFc4?=
 =?utf-8?B?RmhhaExTa2tCRnVQRXE0WHZxNmdSR29hYTBtOGdCRTV4TlFYMjY5TjgvcFF4?=
 =?utf-8?B?OStRZG9ITXZzVVhoSkdFK29nT2syV0xZSXBScXZrY28yK1RSOG9SeVYxUFZF?=
 =?utf-8?B?d1VUd1hhRXJzVDZNUEZ5RTdJYkkzdlFDMGdLUERHNWUrN1VYb3lZMUxsb05v?=
 =?utf-8?B?c0loaTRxNDhQbnRiU0hUT3RBbjQvcTk4dTQ2ZDVQZmVGdUoxbitwdGlwQmpy?=
 =?utf-8?B?VnI3cGFUQVlQMzE5K3YyRlJ4bGd4amFBQnNvMWlFbTAyNkZENnE5UTcxdlJY?=
 =?utf-8?B?RlhTK3ZpdURPcjZqYlhIcUJ2Q3VkOUNncDhwempKdEhOQmQ3UDV1ZkF6Mmtu?=
 =?utf-8?B?S2cwcjByNFVuWG5yYzQ1ZzVwNTNoWisvT3lJdGZxTzFKRGUrb1IxR2ZxdXRj?=
 =?utf-8?B?VWcrY2EyMTNpVjByUDVyb1IvenAzYzJEa3hZN2xOMHltUWVqcWdjMXhzaXVv?=
 =?utf-8?B?eEJZVDZGUmRkRjNWODhRYVA3U3JIa2JzRHkyTHF2dzl6M2FhRXZjdHg1NEl5?=
 =?utf-8?B?ZDVVVWdyd3hQQUxGL3dKbzRQQVZEcUFGdUJieDNFbEhpK2ZTUmljaWx6dlow?=
 =?utf-8?B?RUNPdU5CQkJwSlBTSG52c25DZ08xK3ppV3FXSVR5MHJMeEg5b1JaK0FFbk9L?=
 =?utf-8?B?bWJ0L0lZalBaOG1qLzZxbWZLcnVPdERnQ01jVXdRK1dIRGVYSzFTeml6RnFP?=
 =?utf-8?B?YmtGT3d3MS9DNm5HSXVHRCtaK1V4c2VLa2tsNHN1aE9aM1Q0bFFxbFpkN2Fh?=
 =?utf-8?B?RTlxWDZWRitEa293V2pWcUFsNUlMaGdYR1VheEJEK3ZqSDlVWUxScnE5UXhL?=
 =?utf-8?B?U3RGMXY1OE1GSkhvcTUwdi80aGNTQWVHNlQ3dUxNbFdZSEEvY21qMW9SSzFQ?=
 =?utf-8?B?ZFFKc3ZBckNwZ3MySHF4MmJFTThaZUpnNTl4KzVTSVdJMC9OQXZ4R25EeFcy?=
 =?utf-8?B?S2JwVXM3VmxTejJRYWN5ZlAyaGY0NHBybllBbFpMMWVySHFZalFna2ZSN25a?=
 =?utf-8?B?RlRCVW1ud3FFVFo4cm9pY0RjbmhmUXlIeThjQzNKS1M2L2JVa2psTW84NjQ4?=
 =?utf-8?B?ditkM05nMnZPRmJkY3cwRWtCV21SK3RCS2ZKMUhCQzJBSnZleWZhU3o0Wmdw?=
 =?utf-8?B?OTBPakVxL1pCK0JncXhaSlFIWWJicEk0djNTRUlsK1Z2SXZyUU1YVGd1V1VR?=
 =?utf-8?B?bStiQmhPa0FPNHdoeW8wRE1ZQzQwR1JBRU1xSzlPdm10czFuRncxUjZ5S3pI?=
 =?utf-8?B?YXBNNk1xcWs1emJTejI0aW92dFgzVEczandOcUVWcTE3SUF2empjOXQraGpC?=
 =?utf-8?B?Ly9HOFIyM0Fkb2U5cWY4YmZtNUZoODh3TExlZkVaOElqeUxwRDAwYWxUWFA1?=
 =?utf-8?B?ZzVZTE5BbVg1RVdCZEZCMUw0WDQ1UUJzM3cyOWEwM0JkVmZVK3plaGtpc211?=
 =?utf-8?B?T3NMZTYxRFMyNDR4cDVkVXZPcVNITzZVU1NYczN4Y2NBKzk5cVBoU3ZqSkF2?=
 =?utf-8?B?SXpDQUY1ZjQ0MXhBb3hBUFprdDBqNDdlc0hQNGlIeGQvMkhZcGRsRys5VGRw?=
 =?utf-8?B?d05sVDBjTmRYOXBXRUpLV1VRRDZIUmFHc0QzRldPR0tSUitxMFFEVHB2a25R?=
 =?utf-8?B?YnV4SlBWcnJhd1Bqa21LTkFvcm9WaFR6VStoWVp1Z2xXYTBHajdUb2VIMzl6?=
 =?utf-8?Q?R71TocfU0W+ilFGmYBin25ew07fQJsWoHi8WQeh?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDNpS0IyYk5Kbm5JMmNOZEFLT3pzYmFiMFYzb3E0MzB0RmxJRDY0c2g5dVd1?=
 =?utf-8?B?djlOMGtsMVArL1ZINGJCSzBxSll3N2JGNTczbDlndVlEOTYzOGRHa1RXWE5q?=
 =?utf-8?B?b0t3N216dDJOYTJQUXJjNVRtZldHSU1HWC9LMkczOGMza0g5YmdaWVlUdklH?=
 =?utf-8?B?L2lLWWN4ZUluMHBJTDN6WVFWQnZ2Z2dwVzVOTFNOYzBpV0hDSzI0YWo0dmhB?=
 =?utf-8?B?c2V3ak92aWtZRXcrcm4weGpMNmRPZlFBQnZKUDBIOGt2Tm5Va081REo0ai9a?=
 =?utf-8?B?STNZMGNpM29KTFZ5MjkwaG9CWVY1L1dSY2g0emlsU2Y1eldLL1E2WllFUkFY?=
 =?utf-8?B?WUtKRkg3VFVmNUw4djVBMktUV1ZKZjUxRzVrelFldkNBbmQ2Mm5HRWhsY3VN?=
 =?utf-8?B?MDJHRElHY21SdC9KczJrRTNJOXlKN3d3RDdndmk5TnJJWkFDVkkraWZZcnZy?=
 =?utf-8?B?aFZPYVZJYk9SUU93MGVXYTNwQW5iaUVFU0VERGNSZ1ExaUpBYXlNaEI5Q25H?=
 =?utf-8?B?TTM0SmhHNEF0c0txVlJpZVQrVG0wVnVYeDYyQVZ2OE1EWUpjV1ZuRTdVU2Rh?=
 =?utf-8?B?VkE1T2NwcCtGL1Q4WmRMaUNDN0F0NndSMnRhNGVRWE9nNGJFNHI1dDNUUWtB?=
 =?utf-8?B?RkZTdFVYdDdXNUtBTUVsa2xEdmtpUDllMnZpZ0I0MytydjFVSnN0YTNZcWk5?=
 =?utf-8?B?d2pTSDFwejZxQ3FBSUJHaS9IVm8vMVpFZlp0ZS85OFpnTS9IWUJFRkh6UTVJ?=
 =?utf-8?B?M0FVbURKMzdCNXN3YzU4bzV5dWJEM1A3UWFyZ3dCdEZxUTJrNzZIOWUxcS8z?=
 =?utf-8?B?eG5QNjV5RDZFT3FMMjBoem1yRWNBTFQwd1pxWG9vbjloUFdTSnFwNnViL2tQ?=
 =?utf-8?B?aW5xZGRCSExsTkl0OG1ST0JJMEFRVWpIY0YwOUF2WDlBamFGbjFmSnV6YWNp?=
 =?utf-8?B?QnhpN0tVdkhtUTlYb2h0K2FPaS9uMGVUYkloNUtmeHl6TE5DRElCSUllaTlx?=
 =?utf-8?B?MkFJNjRTYTRteW9JZnNiSFdNNGhMcElFM2hPOGFLbk1GQmZ4U05CRG5Eby8v?=
 =?utf-8?B?NkduSXF1SzdOcUxiNTVMZWpzczUxOC9yRnpZa3R0bjdBUkhxdFFXVmk3czFi?=
 =?utf-8?B?M2VCVlJpNTNGU1M5bUpGMVJxUFFZSHRmMWVKZkxhcURZdnVXU00zb0R4SUZD?=
 =?utf-8?B?R1JPMWE1QTdQR3QvN1JmZElPdUtXZGJDekxveUJHNW0xWlR6RDJoZ0J0WVo5?=
 =?utf-8?B?VUFGNlJubms3RnlNajdNUE8wVDYrTi95ODViTmVMbFZMV053NHE0bFdoWkZI?=
 =?utf-8?B?aGNCV0lCKzh2TndKQTBvcyt1OUlGWEIwMFNuK3NXakVWdWFXZjUzZjlvS0sy?=
 =?utf-8?B?T0UvcGVWTXFxRk9rZ2l1S1kzOXV3YVhJTWloclNSK0pRc1NCTnliZDZQcUcy?=
 =?utf-8?B?OUU4OGRjZ3cvWUFobzZKOGZ1SXMvUVZzc1FaR3pJSEZJQVZ2aTFOR2lvU0JP?=
 =?utf-8?B?T0hiYnNMZng1S2ZVYWJNZ2NYYnRXcDVZd1k3ckdqNFhtdmFNVUszUi92KzB2?=
 =?utf-8?B?ZWt5dG5PVEVXbEFYMUFCT1FTeldOUERyd01meG5oK3l1NFhRUytEay8rN0J5?=
 =?utf-8?Q?z5SfH4rwqkBAF+lOpcoM6LaqfDJSDFr+FcFnK5X3mFiM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c03244-4cf8-4597-406e-08dd7807ad0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 08:14:11.9450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8987

DQoNCj4gT24gMTAgQXByIDIwMjUsIGF0IDE6MznigK9QTSwgR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79IaSBBZGl0eWEsDQo+IA0KPj4g
T24gV2VkLCA5IEFwciAyMDI1IGF0IDE2OjM1LCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxp
dmUuY29tPiB3cm90ZToNCj4+PiBPbiAwOS0wNC0yMDI1IDAyOjUxIHBtLCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+Pj4gVGhlIEFwcGxlIFRvdWNoIEJhciBpcyBvbmx5IHByZXNlbnQgb24g
eDg2IE1hY0Jvb2sgUHJvcy4gIEhlbmNlIGFkZCBhDQo+Pj4gZGVwZW5kZW5jeSBvbiBYODYsIHRv
IHByZXZlbnQgYXNraW5nIHRoZSB1c2VyIGFib3V0IHRoaXMgZHJpdmVyIHdoZW4NCj4+PiBjb25m
aWd1cmluZyBhIGtlcm5lbCBmb3IgYSBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlLg0KPj4+IA0KPj4+
IEZpeGVzOiAxZmQ0MWU1ZTNkN2NjNTU2ICgiSElEOiBoaWQtYXBwbGV0Yi1ibDogYWRkIGRyaXZl
ciBmb3IgdGhlIGJhY2tsaWdodCBvZiBBcHBsZSBUb3VjaCBCYXJzIikNCj4+PiBGaXhlczogOTNh
MGZjNDg5NDgxMDdlMCAoIkhJRDogaGlkLWFwcGxldGIta2JkOiBhZGQgc3VwcG9ydCBmb3IgYXV0
b21hdGljIGJyaWdodG5lc3MgY29udHJvbCB3aGlsZSB1c2luZyB0aGUgdG91Y2hiYXIiKQ0KPj4g
DQo+PiBOaXQ6DQo+PiANCj4+IFRoZSBjb21taXQgU0hBIHNob3VsZCBoYXZlIG9ubHkgdGhlIGZp
cnN0IDEyIGNoYXJhY3RlcnMuDQo+PiANCj4+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nl
c3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwjdXNpbmctcmVwb3J0ZWQtYnktdGVzdGVkLWJ5LXJl
dmlld2VkLWJ5LXN1Z2dlc3RlZC1ieS1hbmQtZml4ZXMNCj4gDQo+ICJhdCBsZWFzdCB0aGUgZmly
c3QgMTIgY2hhcmFjdGVycyINCg0KQWggaW50ZXJlc3RpbmcuIEkgcmVtZW1iZXIgYmVpbmcgcmFu
dGVkIGJ5IHNvbWUga2VybmVsIGRldiBhYm91dCB0aGlzIGJlZm9yZS4gRGlkbid0IGtub3cgaXQg
Y2hhbmdlZC4NCj4gKEkga25vdywgYmVjYXVzZSBJIG1hZGUgdGhhdCBjaGFuZ2UgbGF0ZWx5IDst
KQ0KPiANCj4+IEFsc28sIGhpZC1hcHBsZXRiLWtiZCBmaXggc2hvdWxkIGJlOg0KPj4gDQo+PiBG
aXhlczogOGU5YjkxNTJjZmJkICgiSElEOiBoaWQtYXBwbGV0Yi1rYmQ6IGFkZCBkcml2ZXIgZm9y
IHRoZSBrZXlib2FyZCBtb2RlIG9mIEFwcGxlIFRvdWNoIEJhcnMiKQ0KPj4gDQo+PiBJIHdvdWxk
IGFsc28gcHJlZmVyIGhhdmluZyB0aGVtIGFzIDIgc2VwYXJhdGUgcGF0Y2hlcy4NCj4gDQo+IE9L
LCB3aWxsIGRvLg0KPiANClRoYW5rcw0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K


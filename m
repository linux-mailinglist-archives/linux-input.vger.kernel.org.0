Return-Path: <linux-input+bounces-10273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD6A416DA
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A40E17A1011
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 08:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E575F19B5A3;
	Mon, 24 Feb 2025 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="S4YbEHKN"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010012.outbound.protection.outlook.com [52.103.67.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115427453;
	Mon, 24 Feb 2025 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384273; cv=fail; b=leDCfNH2IMYxcroZvsnzIKbezchz42HKjjyu0GV+zzWvArylB3MMEk0a4y05QbQuYQ/GfekkGezY/M/6DYoluWh2wZ+4z+38Y2wA+2IJKDGly0a4qASPkR8MPh5HVT45A0H34YypP9pA301ZrwgJuqfuExBsBq147EIAZ4EwWRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384273; c=relaxed/simple;
	bh=hszGG9bi2qjsLUn87iRFXXoBaa84T4F/8nNtJjvRL+I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Aq7tksRVA19dmLQBegiOhyYGxHiVn6gi1hQYeq2RF5oqsPYR2o3FKUO4ctD/+1Pkfhv90yX5ssASKUOXQgSGjjdw+FQw7z9msPlglj8zjPCpioZ7FPc7UyfKUcvu9DoNN4I3guS0yWOvneEgT8cjzQ8vCm680+ZPDK9bM0U2Fts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=S4YbEHKN; arc=fail smtp.client-ip=52.103.67.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVGIuH4uWh4qekIlnYdpfq2/JaKVc+iHWWrstXK8T0F9zqakTKtVrUgH5+0qPGI//M4QPYat7H6CtDx1sskKibGaA/hNQOCKL7osrfg0+P5+UsP5uQd4y6pHDoaGWs8POq8a7Ney/jUSFeU7nZUOa8q3WAzdciJyXPLsWBkvTbtFuvt6hKsZ6io5O4nw9TAD/TkDsJnv5jWbRNhBA4mF3hdLCluUGegr+Qb6+qmfe4EAHWde1JWG0RNNtDJDHyTbTsZqjGBJbFkDtLKDPq2AKLBHp33OUPcRSigQ5SAzFvfJNss1yX+LbmdvXnoBN/X2Gaad4YlQ+AvBKAZCxArg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hszGG9bi2qjsLUn87iRFXXoBaa84T4F/8nNtJjvRL+I=;
 b=Dvx+aD01cLXCIZbhA3IdRNq8BEjMCK8/GXGz3VkDsuCNRGTWdVyDJ06zdxszJtc88+ymLPYfiMm6U1ByXHDd+g/SyNEiuzy8NdPdH11Rvh0vmLWs8JijcMACBCt1kap5OZK9Db8jGu0KIqIymeY9n/l0u58BK74OYXuGxgrUr8wc7i3HfwqCEqZNqgZTqhn5SoP0wA8gAEW/QEfwdeww55R9DhVr29HQtsFuRvt7QKVFQyY1ZuzP47nm/S/fF206nwKhtXnGPwOBghXGuK0AuJGZoc3paC9ENyYZhh2wh5oIhLsRH9VVWjHDhJAABc0B8xIIZood9fFigELmLZYrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hszGG9bi2qjsLUn87iRFXXoBaa84T4F/8nNtJjvRL+I=;
 b=S4YbEHKNSpAn7LoRvEfCaIJ3A9zansx2g/ua179T/fRIovebmNIow0Xsl/IUM6kmN29N4Yg7X/cQnOooBPgYi5PZ0m6aD/81tsIyklVXOhlQ5j6WEdcbxSJMqK9TajFGDjyl7KtOMRaIwi1gg9mtX9nIfvHanMlB9COchDcDfu/9BgBDox7b1oX99LXYw9BYtg4Lp1sKRZzegMPF4aCDH2K5a0DH0nozGV/5LTnh2GXF22Qtk1oLHulzN2aWVnIjwDvhGpwZ4batUucmV0Cdn4LRDuJDUO2yzXx/nKzLJpzsBvHwRGg/ogKGmF44J5xpbk7DceLYX1/1YtOrRJWm+A==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PR01MB9364.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 08:04:24 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 08:04:24 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "fnkl.kernel@gmail.com" <fnkl.kernel@gmail.com>
CC: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Henrik
 Rydberg <rydberg@bitmath.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa
	<neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Thread-Topic: [PATCH RESEND v6 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Thread-Index: AQHbhpK3rBSs0dtghUqqcf2Oh8XVKA==
Date: Mon, 24 Feb 2025 08:04:24 +0000
Message-ID: <73D7DB60-6265-4071-BE2A-FBBE86340476@live.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>
In-Reply-To: <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PR01MB9364:EE_
x-ms-office365-filtering-correlation-id: 0b11f884-c59d-4e3a-7e52-08dd54a9da62
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|7092599003|15080799006|8060799006|19110799003|440099028|4302099013|3412199025|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWxqYVhTdzkxRXo0ZmljKzBHdUU4ZnB2MlpsZEgyanN4V1NnRHhlVjdNSmdq?=
 =?utf-8?B?eE4rQ3d5OEtLSVlsMEE2M3ZnMWVKM3EzMDhiMFFwc2dyM3RuNDJ3UTlMUmxY?=
 =?utf-8?B?NWw3UE1wNzE1ZkFURW85aHlSbi9rS1liREpHTEhaZCtlOHNocDdrNllvZk1I?=
 =?utf-8?B?Zkd5cXpZREIwd3I4MTNhbTQwV1ZxM2svTlFMZ3l3RHR1ck0vRjJBL0VJQVE0?=
 =?utf-8?B?N3dwVzNqVG1abGxOYTE1UGd6dGhxVVBvQXJac09XV2xRV2JoQUtOZVJKZ2VP?=
 =?utf-8?B?Z3RMdGJSQVRXY0VRK1ptenIvNkFscTVlQm9ranFSRGljMVdTeElHWk80TWhR?=
 =?utf-8?B?dVF5NW1xLzc3WVRqUmhWcGMyMFBaWjRhWWtUZUd6Yi9zZE56VkFXL0dWWjhP?=
 =?utf-8?B?MG1YcVR4Vk1WTXFQRjVESWJGMmtiVlhJWUIyS3lFeS9rN0dTZ2NoYWlMcVZk?=
 =?utf-8?B?N29SdWludENRYk1qSm9tNmtyK2dpTHdmL1V3MlAra21neU1Ib2VaVEwwMWE0?=
 =?utf-8?B?aFJhVzMzVWFVN2haVklMUDVnMWNaOTQwRkg0T0wwUGRvNEdsajRxek44RWc2?=
 =?utf-8?B?aVJFVVJhVWpUU0NPcWd6eDE1RDZ5MWU4V05IR2FNODZ0UjVGaU1vbWVNbVpj?=
 =?utf-8?B?RjAzdUNpK1VFa01DRXhxRkFUZkdwYUY4ajRtb012aVN5WEZ4VVVSR3JZTVNJ?=
 =?utf-8?B?YlkrTG1nQU4vbCs3bUkxbHA5OVllOGNncE43L1VKemQ3N01GYUJ5V292Vk9U?=
 =?utf-8?B?YzVRc1JqTWdoOWpGdTFaS2xHWi9XUVczclFDK2V0YkRZMEFxYWU2ek10dGdD?=
 =?utf-8?B?U1hQMDNYVjNna0FRVGkwSlU1U0dHenBVTEFqbmd5cUNvMjNVU3NzRzBDd1lL?=
 =?utf-8?B?SE9XMUJ1c1RNQ3JsbGNQT3VSbjhLMWtnWUIzdXZONk9RTmUxYUQraWhqak5R?=
 =?utf-8?B?dTJBL3F6cDN5ajJ0ZTlSbE03Q3R1L29NVEtSRkthWDVNcmtmdk5Zc2RzOUpM?=
 =?utf-8?B?ZDVFbExTcitwbTBVWVlnZDhlei9ucmxIb3YyakRkVlFxeVhRREZhdnFjMFNC?=
 =?utf-8?B?WkM3M011VnREN042VlY4Ukd4WjNXbG9tQkx6bVlQbWR4VkRjL3BRZlh3MFdT?=
 =?utf-8?B?MXBMeEdTZUJvZ254N1dJd1ZDK25BMEd5OW8vbmJQcml2Z2dWaVdNcGQwQlA5?=
 =?utf-8?B?WEFOT2Z0R2JIdDhYNUhVWGN5OFQvNHhCQ0Vzbk9DSjJQSFpycklFZy9ZREFl?=
 =?utf-8?B?dHVyTzlvVGlnSEIxWThmcG1aSm5jcWMraHhkaTJVTmRqSGxBQ2VDWlNBQWpV?=
 =?utf-8?B?ZGZjdDBDS1E1aWRyK3FNb2NHeEEzclYyWHl0VmEvRUY5d3oyWWh6OHRUUE5l?=
 =?utf-8?B?MVNwUXJtUHZ6ejNUamVYN1JYZWhyVFhMcit5ZVNnaDNHZnBZT1ZRZTQxUEVU?=
 =?utf-8?B?dUhYT2h5SDA2aFRnNXBLbm5VemNIRnBFdTlKT2xQeE9qMzN1S2ZuS3dveXN5?=
 =?utf-8?B?Yk8wM21oTDBIcmJteXhOS0RMQ09CcUtrTVhkRG05MHE1VXlxTG5ocG9NYlJT?=
 =?utf-8?B?Q0lvR0JaNW1TT3pnUFAvVDdnNEZKL1I2cW1TblkreXkrbzdVRHNrbnE1aTY1?=
 =?utf-8?B?R09pN21EelAwdEVQRkZadDNFUWdiN0tjMWFnUlliZHhtazBCbXVHd2IzUytM?=
 =?utf-8?Q?1r251vF+WLOOKq8LQCnP?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlBwY3QyU2lqNnhHV2pxZ0NGbm80UTZRd3Npc3JXM2cwVG5TdTNXLzNGVWhR?=
 =?utf-8?B?bnEyQzlOdHNuMkY5aGpFZ1Vab1lvVVVUOUplRUhpSjdPMDNNVWtOS3hiM2ZK?=
 =?utf-8?B?MlozK3Q2dTk1ZlUxSW5ETWFjZGtQMHdiQlM1WWRiSHQ3WFBMS3R1cENMaWFJ?=
 =?utf-8?B?OHFsWGtJUSs5K2NzUVNLOFNOM0QraUtGTEcybFZPYzJUaVN6SXF2WHoyb0g0?=
 =?utf-8?B?VDEzY3F3MnRqbjFjYXRaK1lwU0RHNXMwWVR1QmR5czZsTVhPZzlDTFhLeGh3?=
 =?utf-8?B?OU83ODhrTWR2VzIxa2RvTHNwOTZjOHdUM1ZHMTZZMUhiL3ByNVg0T240bGJ5?=
 =?utf-8?B?MHJaeGErYTNObHp4eW9rbmZJdlZwSUNmbFllOUdlMFE5SHUzYTdVdStkV0Zr?=
 =?utf-8?B?Y0N0MlIxZW1ZM1pvc0MyeDA4WUU2RGxpRmwycjlSSWxUdEFVeTlTL0NINmhP?=
 =?utf-8?B?bVR5aW1hVThMbzZydU96NGcwTC9pU0s0YWtMRmJHUDFZbXZXUStBclU3TldX?=
 =?utf-8?B?L0luTkVmd1JEUGNES1V1SGM2NVpDakxwS3FVbGxKb0FvRjVCYzFRR2VNTVRz?=
 =?utf-8?B?MUZNZWtvNG45MFVYWGh0WFpGeDlmQmxJWVNWZ3lLYUxGVFhuUHdqTi82dlAv?=
 =?utf-8?B?b29zT2lrR2lFa2RuZE51L3ZLc2tLd3h1TU9TcXFhdzNKZTFLSzg0NmYxZmdN?=
 =?utf-8?B?ZFBaVGwzcGFuU1pSSG9tK1NiZ2xmZGpISURpZkFKenVUMS9vdXlLNjFLTFpp?=
 =?utf-8?B?bnRGSXBld3B4Z0RvKzNGcWU0aUJEYXNJakNWZjlTTHV5T1A3NTkwY28xa1B2?=
 =?utf-8?B?aEtOVUVlWWw5WVdDQkQ4WW1hcm5PVThwWC9NZm85VlZyK0ZqRHJpSHFqWHNJ?=
 =?utf-8?B?V1ZOcDcvdkU1ZEVJcDJDcHkrVHVlRWdpTnpodVltS0xyTG5ncDcvRGpxeVM0?=
 =?utf-8?B?aTRxK0NFMnVrVlhrdm5wSzdidm1jQmpzRXJKZktsV1BIbDNDWHR4c1hsOFhR?=
 =?utf-8?B?cTYrdHFobmZBd0Fka0lkSHIwVFd5VitCQ0g4M3JBaG4wMmIwSk9Ib0lIdzFJ?=
 =?utf-8?B?c3NqU1VGaHZnOXRiNU4yOEFJZmFDeHlFTGkrelUrVUtqMmE1N1FudTRXUGox?=
 =?utf-8?B?dHFNRmhSS2V3RnIvdStoUENpcmQyTmZtZkE1MjUzRmtVc0xVVm1YaXBOR0Ro?=
 =?utf-8?B?b3MvOGtlTXMrbkNJalM3d2xIVmE0bGtudjFIbzlHRzJrcmgySmRHQi9waGUr?=
 =?utf-8?B?YVlOSTJCRDl2UlJ5YUVKYU9lVk0xM1YwWlR3WFVMTzMrSUxhaXlvaWV6VDY3?=
 =?utf-8?B?aXI0NDRmSnA5c0VkWEd0TFBJd1NVSXVuTkVEZy9QdEpuYXc5NUZyMU1FUnkz?=
 =?utf-8?B?emtXU1BkS01GS2FILzc4ZEQvbjVOOXhwOHI4c2Q3cXp2Y1hDOElzemFicmN0?=
 =?utf-8?B?K0d3M25mQVJ3Z2d0Qm1kN29NK0owdzZPMFV2SE1odGw0eTlFUDdmeWswMVFl?=
 =?utf-8?B?bkFncW9USVhuZUtBVG0zbFVFSk5EUC9oNTQ0bmhxRTJ4UmtqNVpZV255WXA3?=
 =?utf-8?B?d3BIQW8wWUlJWWRBNmYreE1FS0NPdWR3ck00eVZHYlltbFY3UEpZR1RJRkZC?=
 =?utf-8?B?b3ZqYWlUWXlmYmdpa1pyVGJTR3FXWGhqTDRLL2dHM2NpOGZjR3ZEN2NTaFN1?=
 =?utf-8?B?MEIrUXRRTDJGdEhGVFBDSXNNQmZhZ1hoOCtYL292ODRRRU85Tk0ydHNpem90?=
 =?utf-8?Q?jrLtQoE5NcyeKc6wD7TtjarfM0mS3DZapq/RYFM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C55C3C01B458C43B4BCB968B1236A59@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b11f884-c59d-4e3a-7e52-08dd54a9da62
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 08:04:24.6463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9364

DQpIaQ0KDQo+IE9uIDE3IEZlYiAyMDI1LCBhdCA1OjA44oCvUE0sIFNhc2hhIEZpbmtlbHN0ZWlu
IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtmbmtsLmtlcm5lbC5nbWFpbC5jb21Aa2VybmVsLm9yZz4g
d3JvdGU6DQo+IA0KPiBGcm9tOiBTYXNoYSBGaW5rZWxzdGVpbiA8Zm5rbC5rZXJuZWxAZ21haWwu
Y29tPg0KPiANCj4gQWRkcyBhIGRyaXZlciBmb3IgQXBwbGUgdG91Y2hzY3JlZW5zIHVzaW5nIHRo
ZSBaMiBwcm90b2NvbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbm5lIEdydW5hdSA8akBqYW5u
YXUubmV0Pg0KPiBSZXZpZXdlZC1ieTogTmVhbCBHb21wYSA8bmVhbEBnb21wYS5kZXY+DQo+IFNp
Z25lZC1vZmYtYnk6IFNhc2hhIEZpbmtlbHN0ZWluIDxmbmtsLmtlcm5lbEBnbWFpbC5jb20+DQo+
IC0tLQ0KPiBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL0tjb25maWcgICAgfCAgMTMgKw0KPiBk
cml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL01ha2VmaWxlICAgfCAgIDEgKw0KPiBkcml2ZXJzL2lu
cHV0L3RvdWNoc2NyZWVuL2FwcGxlX3oyLmMgfCA0NzMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gMyBmaWxlcyBjaGFuZ2VkLCA0ODcgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vS2NvbmZpZyBiL2RyaXZlcnMv
aW5wdXQvdG91Y2hzY3JlZW4vS2NvbmZpZw0KPiBpbmRleCAxYTAzZGU3ZmNmYTY2YzBmNjA3Njhi
ZTE3ZDc3NmE3OWUzNmU1NzBlLi42Yzg4NWNjNThmMzIzYjM2Mjg1MzhkNDE0NjAyNDhmOGFiMWRi
ZjdkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL0tjb25maWcNCj4g
KysrIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9LY29uZmlnDQo+IEBAIC0xMDMsNiArMTAz
LDE5IEBAIGNvbmZpZyBUT1VDSFNDUkVFTl9BREMNCj4gIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIg
YXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZQ0KPiAgbW9kdWxlIHdpbGwgYmUgY2FsbGVk
IHJlc2lzdGl2ZS1hZGMtdG91Y2gua28uDQo+IA0KPiArY29uZmlnIFRPVUNIU0NSRUVOX0FQUExF
X1oyDQo+ICsgdHJpc3RhdGUgIkFwcGxlIFoyIHRvdWNoc2NyZWVucyINCj4gKyBkZWZhdWx0IEFS
Q0hfQVBQTEUNCj4gKyBkZXBlbmRzIG9uIFNQSQ0KPiArIGhlbHANCj4gKyAgU2F5IFkgaGVyZSBp
ZiB5b3UgaGF2ZSBhbiBBcHBsZSBkZXZpY2Ugd2l0aA0KPiArICBhIHRvdWNoc2NyZWVuIG9yIGEg
dG91Y2hiYXIuDQoNCklmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHksIHRoaXMgZHJpdmVyIGlzIGZv
ciBhcm0gTWFj4oCZcyBUb3VjaCBCYXIuDQpQcm9iYWJseSBtZW50aW9uIHRoZSBzYW1lIGhlcmUs
IHNpbmNlIHdlIGhhdmUgc2VwYXJhdGUgZHJpdmVycyBmb3IgeDg2IE1hY3MgdXBzdHJlYW0uDQoN
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGlu
dXgtbmV4dC5naXQvY29tbWl0L2RyaXZlcnMvaGlkP2g9bmV4dC0yMDI1MDIyMSZpZD0xZmQ0MWU1
ZTNkN2NjNTU2ZTQzZjQxNjJjYTI4YTQxZjQ4OTZjNmFkDQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0L2Ry
aXZlcnMvaGlkP2g9bmV4dC0yMDI1MDIyMSZpZD04ZTliOTE1MmNmYmRjMmE5MGE4YWNiNjhhY2Jj
MTQwN2VmNjdkMTM5DQo+ICsNCj4gKyAgSWYgdW5zdXJlLCBzYXkgTi4NCj4gKw0KPiArICBUbyBj
b21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUNCj4gKyAg
bW9kdWxlIHdpbGwgYmUgY2FsbGVkIGFwcGxlX3oyLg0KDQoNCg==


Return-Path: <linux-input+bounces-9746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FC5A269FF
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 03:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFD983A6002
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 02:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D068E86330;
	Tue,  4 Feb 2025 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="iZQZBBNp"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1025A655;
	Tue,  4 Feb 2025 02:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738635111; cv=fail; b=MPq09SeP/kbBLbd4LG06L8/6nA3TahKJTp/8uHWUMAR9lFG/Fqg+2QXJJw5tqCw2YzV4RqhYkAsSeMi/bITqnEEe57xEOwloRjpNICxwSsgNBSQSJonSndN6EixCwAyhWKG6sO/iMT1XYqk1yl6DAW8Sd4Irr5/PvfJkp/stzLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738635111; c=relaxed/simple;
	bh=yrOc728Q2zk/MwG1c13XY7ZXVe/9JActp2S6/e2grQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RiQRNLzk8hYdITI8L2BE9G2JoP5y8MXJMt+N08kuYfXd048zTvn2ZP5hNgi6No+vkr3v2zVeXOdMJPk5Z2UOjcZ+tDNiJpeBcCovdN+lqzPe05Q8C1MET9PnKU6Wnoe7II50w/weQUEYfS4k3Dm9fiwEWjlyxB/xi4lGcDqkOrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=iZQZBBNp; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onm+2hQt59MF16Y2cRuSo2As9A4qt+RekZRl/PvbnhisF2guio+zh/nu7b+pQzSmPOfB94XKm54JvPgbMgZMrrnNZCf8Y894WZ7GvreDejP+mRzzqyPApAg3Ldc8eQHiNS7ifLcDtHaHy1S8pYqO31DSYWn4FTAWDMoZKFYLYEgo3iqDhXdDiyg5gda32YHpEI0DdI3P2vJWcI9PYYXbh2bYYVR7BddiuGgbNXs62lDVMwFIMq2/j4bFcPnRwVZeqOM+mxTywANK018Wbkpd1FXIfE2l68j/MxEStMFkIScCpY0pIbdiQ/HKKDK73UvOnZpuFrMFu6+cCMM7PXdLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrOc728Q2zk/MwG1c13XY7ZXVe/9JActp2S6/e2grQs=;
 b=YrflFauHu3SrP9+eFzVptvhdmbdWgQBhRRv99By4oXfAA1qu45WjLjaRaUzgzZdKT91QuO5f2xuBroffh6/EvsyUeEh0ZAVlLcQ6zp2yLuUIi3Gx369Zq0ciXuopABr970hMcFyUvcIVLJoGtAGt4l31W0DbYghJ/LnV0o7urfo7WoNH9dps9iDrxaVrFwGaDiVSIqyHCTQdV84BP1EvCcmFrB4u5pszKb3bqK7fpu5CvshV2GBUmL8esz+Q5IdPdLYui01vYkeNmsxvFfQCWIlAKBPBDwQ9r7/TJ/8l0QWtT1lrwGWOEMz9zdttjooRxWgMF0i1Q8t2TMlXUC8LZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrOc728Q2zk/MwG1c13XY7ZXVe/9JActp2S6/e2grQs=;
 b=iZQZBBNp6M5UZYZ1LfzxbWF7Dt/XfONmYIoQlMWEgmRxdafs7i8A0s0Y/cz+CuBcz0St+wIpmTNlrR9UBiHKWMxs/bzgKgY1/h/j4o9LpumDWSuDVfzjYgvQf6XNcsrhKxCztX18f/NuaBFYxtwRLuB+F9h6x7ISjXgi9pRgAhWik3VQCBk+Xiw7I2WZdnv7olJxs7jqkfMCV8VUfY8aCUFrXV9g0EXd3tnHvVJd3fHiR4i3wIDbGg13MIuJojNXu5pc1GK/B/ggNBz1Zxz0TDlJXlyZxqj6Bf3kaI0vu1Z2HZaPs9PjS3tVGmzMXL5uddbDVylE25kPub1tjro8XQ==
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a7::7)
 by PN0PR01MB9673.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:13f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 02:11:44 +0000
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b]) by MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 02:11:44 +0000
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
Thread-Index: AQHbdoZMO4XrVWR7E0WSprIec9kO9bM2ZzX6
Date: Tue, 4 Feb 2025 02:11:44 +0000
Message-ID:
 <MAZPR01MB8280DB01B272D489E700C229B8F42@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
References: <5AEC08E1-0AEF-49BF-94F6-AA1AD71545D0@live.com>
 <2B5BC9B0-F882-481C-9B09-1FF3978B655D@live.com>
 <4818p982-4254-985r-73r6-380497qnp41p@xreary.bet>
In-Reply-To: <4818p982-4254-985r-73r6-380497qnp41p@xreary.bet>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8280:EE_|PN0PR01MB9673:EE_
x-ms-office365-filtering-correlation-id: 391d97df-00c4-4873-de54-08dd44c1458a
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8060799006|8022599003|15080799006|7092599003|8062599003|461199028|6072599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHMrbm14SHU2SVVRMUVxanJSVnp1NitaREt5UDZGeUp1L3I0RmNaKzZqZkQz?=
 =?utf-8?B?SUhQZVZ3bXgxNTQxTzgydGNtZm5FbDc4alVjY2ZqQUttTjlpeGsxUUJBUEJ6?=
 =?utf-8?B?MnlZM0hRZXVqSTBjamV2TkxXU1IranhWWmN4Z05BQTN5TUx3WUdvNWtzSkJ5?=
 =?utf-8?B?S2RRNVphZGRWcnJUQ2lZKy8zSzhkY3I5SGZLMnJiNjlwMWRsMERzSEFGVnJE?=
 =?utf-8?B?NkRwRWgyNkViVTB5T2FrMDQxMWt4blhMMzlFQmtzRXN1Q2F1QjM3OWR3YUZH?=
 =?utf-8?B?LzdEZUpKUE1TbjBESHJRdzVSSkxGNDZ0YXcwY0crTHg1bW41V1duSndrdFZy?=
 =?utf-8?B?MGRpQ3FLb3ZCdE8yQysyVmFGcGE5aVd2N0c2Y09pRngyd3N3TmJ4UUcvK2dH?=
 =?utf-8?B?dWFZbENKU3ZNMk1PUnFKVXBFN3VrZGlhWjA3WHpFS21kbms5dThBRkFtL0o2?=
 =?utf-8?B?VGlpekxockFqNE5CbVUvczBsaUQxOHB3OTk5Z0xxaDMxYXMxTWZQTXg5eWxQ?=
 =?utf-8?B?TFNMQkZ4dWhvNVVkWThBdk10RkwrVklVcEhWQXlRSEpOMG9IRXNmQ3VhWW93?=
 =?utf-8?B?SDVLdjhHV0Zac0VJMDRJL29NMEZjaFVkWVBqNEFnaW1BTkxOQ1UrK0FXOHhM?=
 =?utf-8?B?cC85aHhoVW1zUnI1U3h2c3pSQlpQSDF5NjRiV1FLMWJiUDBDeTBZQzQvdFlm?=
 =?utf-8?B?ckxrRnVXazRlY2JVNGdsM1ZwU1hQVWRrQlJsMTA4eVlIL21rUWpJMHRjUzhG?=
 =?utf-8?B?NHR2SGxGSVVGaGN3dytaQmtyaFhoWDhyTmtOTm11b3R6c0lqYzVjNit3M0Rm?=
 =?utf-8?B?L1pLbjRhVHFObE9tOHFWTkN0eUJxclhldVlXRWx2VmFNL0Q5Q29xajdETjVK?=
 =?utf-8?B?cFFPaWRGdlJtR1d4VWdHZlRtMVdCb1Q3Z3dISXBrSEgwc0lXcTgwN3dPSGVt?=
 =?utf-8?B?OGU1NGZFTm0vcng5ZGp4SFFKWGNuMjd4STdMUmZhbFpJY3BLTUxHRUJJdDRD?=
 =?utf-8?B?SFV2azdOZHhGelAxNngvNDZsNi8zUlRRbHQ5UmFNbi9OUnVTNHNvUG1QUlZi?=
 =?utf-8?B?OVRMVXhOY1FZWXIxRnpxK0ZqeWNMV014UkI1VlRBdi9rc2hpK1oxN2Y2WE0z?=
 =?utf-8?B?amxMcGwxRXY5dVg1T1lwK01NTWtBSUQyeXNhU2MvRytjaXFVWURaNVJvMWxB?=
 =?utf-8?B?OElKakRRa3lpOEJGdnlUQUJsRmczNzFVcDJzUzF3dkhlcG0rK0dEZ1FzRUJ1?=
 =?utf-8?B?VXd3QS9ENXkwRktOUWRIaS90WEthS0twRXlqN1VBR1MrQVYxUUQycG4xZFAr?=
 =?utf-8?B?eTdYVlN3WUllN2QycHpwaGlRTzhCamxHUHJyVTVxN3ovT04veFVqMzZoQkxQ?=
 =?utf-8?B?RnJZVXJaZkJsQjdLb3VUckFuZmYwL3drbXN2NEV5TzUxR2VkTGxVdWVJcUNV?=
 =?utf-8?B?aEkyVTA3Wko3bkFsT3l4TjdaVjh2VDBzT1hQbTh1bUsrZ0VISUVwbUR6bXpa?=
 =?utf-8?B?NlZaNmgrQUhNTGRsM0FFNWt5V0tYRENVWTZ3N3hqSkZUdzliVlRJRklwNkNq?=
 =?utf-8?B?SXB3UT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emJ2TDBJWmtlUFRuOWk2WUNjTzV2VkNRL3RDWE5DWEo2TldBSzlXa1RKM1A4?=
 =?utf-8?B?TXh3UlpMY0diek03eFhuTU03STRjWE81L28rQjFlZTJQNlJKbTJKb3gxT0px?=
 =?utf-8?B?SWxneFpZdU92NjQ0NGlzL2Z2TmorYUsrYXQ2NVNqWE1HbXltdTc4TWFPeDl3?=
 =?utf-8?B?MXUvUnpFT2kvN2dGQWVWYUlnT1gzU1NIQ0grOUtmK1JndTNyN0ZSdm9CbFN3?=
 =?utf-8?B?dnZSV1BRTmpDZ1RCOGJhS3l2NGFhbkxNUk4vMXdHekJXSUdRaXJYQ1dCWWlx?=
 =?utf-8?B?aWtzK2d5MnB2STh2V0ZLelNkM2dvOW1NSWR4TWZUWTNOS1BHRUk5YlR1aXUz?=
 =?utf-8?B?Qk5mMEl5L0FHMUZLTXhPZmVZcXEyRUdnWkFVQVhoU05UM2ZrbVQ1WlJsYjVN?=
 =?utf-8?B?NUlWRndMNUJsaVM0ZUs3NndTeFk0b2EvYkNOY1J6UjFVSCtHMzBuRW5Kakw4?=
 =?utf-8?B?Um15aGFPZ2JZSkVaYUtaMk9mS3VlUUhySnVhY1NPV0FuZXNwWlJYZWRUN1I2?=
 =?utf-8?B?VlpLU0o4M1ZnYmdEbW5abzlJcnpmWXNYZS9mbTY1MlF6K2VKQ1F5TmMyUWhP?=
 =?utf-8?B?ZjNHeTd5QVNDeXhnS3JqODNDSTZXV0N0UDIvRUQxV2xUSi83RFRiTDhBNDVJ?=
 =?utf-8?B?QzF3RzhVYjkyYnpQZjBpNEtvT0xmZ3dyVFFudFhlUGhET1Q3UUVRUktXRytG?=
 =?utf-8?B?bXNrKzZMekZNRE1EL04zK012aUwxRVlwcXJCUDN3TDcyNTNsakp3dThnbVJp?=
 =?utf-8?B?YW5HQ29YZTVyS3hUSUZLZUdHb2dTcFROb2xyRm5VTEgwV1RwdWR1cUNZbFJP?=
 =?utf-8?B?a1l0b1VBWVZoaDZkNk83R2dhNTFqKzZSdmZRcmZYSjFCRUpXQkNHQ0FBdU16?=
 =?utf-8?B?YkxMcVJYNHBOUTNhVTNlNm5QejArTEloVWNsSFd5SVcrTDZ4NlU1RWc1cE1v?=
 =?utf-8?B?L2JqYkpmb0JaOFdCNktOMjVqUWZVUXlhYndXMHNDKzdrWmdRUHlaNjRnZU5y?=
 =?utf-8?B?SWV5MUZ5VnRUMGkyZnFUM2dDNURTa3pCUlJuOFRFNjV2S2xWYzMzdW9wR3pQ?=
 =?utf-8?B?c2l2TXgvZkMzam5MWVNaSVh1MkNCUnJFZjdWbnlZWGpUWU5LQ2JPWW5GcjFq?=
 =?utf-8?B?MG1mMEIyNG1kZlp3ckZVbWR3NFdoQVd0YVh6WU04RTdQZk1yK0VCUFFYeGN3?=
 =?utf-8?B?Y00zUnJHOVpDR3N2dHJWSFZURUVjaDFTN2pMNkRybXhIOFBQbWpmcERjSUZI?=
 =?utf-8?B?K0Q0Y3d3ODVVN3BaVHFLTkZiNzhubHhTdkFHNU0vcjhVR2FjVTVwbmhmQk56?=
 =?utf-8?B?Vmlsc3VsSUJ2ZW9kQkxnV1o0MzdpdDNzQWh5U0IvOFk3Z2kwMVNIM1ovbmg4?=
 =?utf-8?B?cUJhVXBzczM2a0lXbGo3clFWSS9ZaDYyUGFiSm9BZTF1Z2lkRmM1ZzNVOXRD?=
 =?utf-8?B?VG1iWnlUVHNFeUxoRlhIN2UyeUl1VUZPUlg4eXZqcU1DOUd1Ujh5bEdiSkVy?=
 =?utf-8?B?M21YeW9FU2cweDhQZW1GSStIc1BXYmYvb09UYzBVcjB5SE5vQSs2Y2J6VGNr?=
 =?utf-8?B?bHJQa241Q1VXN0wxaWxiaTZLbE9FNThRNk94ZUZNQjc3ektiaVFzVEYwTk5Q?=
 =?utf-8?B?bjE1cXZWczl6bi96ZGhlc2xFK0ZlV011RHEwUVNBL0E0eVE3aU1sUm1lMnZH?=
 =?utf-8?B?SjBwZFRTOE4yL1o4c2lHMWxwSC9Ob1hxeGE0bjJYNEFvUkhENlV0Q3Nvazgx?=
 =?utf-8?Q?pyrvuCDVqhEkVqnNMo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 391d97df-00c4-4873-de54-08dd44c1458a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 02:11:44.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9673

SGkgSmlyaQ0KDQo+IE9uIDQgRmViIDIwMjUsIGF0IDM6MjXigK9BTSwgSmlyaSBLb3NpbmEgPGpp
a29zQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCAzIEZlYiAyMDI1LCBBZGl0
eWEgR2FyZyB3cm90ZToNCj4gDQo+PiBGcm9tOiBLZXJlbSBLYXJhYmF5IDxrZWtyYnlAZ21haWwu
Y29tPg0KPj4gDQo+PiBUaGlzIGNvbW1pdCBhZGRzIGEgZHJpdmVyIGZvciB0aGUgYmFja2xpZ2h0
IG9mIEFwcGxlIFRvdWNoIEJhcnMgb24geDg2DQo+PiBNYWNzLiBOb3RlIHRoYXQgY3VycmVudGx5
IG9ubHkgVDIgTWFjcyBhcmUgc3VwcG9ydGVkLg0KPj4gDQo+PiBUaGlzIGRyaXZlciBpcyBiYXNl
ZCBvbiBwcmV2aW91cyB3b3JrIGRvbmUgYnkgUm9uYWxkIFRzY2hhbMOkcg0KPj4gPHJvbmFsZEBp
bm5vdmF0aW9uLmNoPi4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogS2VyZW0gS2FyYWJheSA8a2Vr
cmJ5QGdtYWlsLmNvbT4NCj4+IENvLWRldmVsb3BlZC1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlh
MDhAbGl2ZS5jb20+DQo+PiAtLS0NCj4+IGRyaXZlcnMvaGlkL0tjb25maWcgICAgICAgICAgfCAg
MTAgKysNCj4+IGRyaXZlcnMvaGlkL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPj4gZHJpdmVy
cy9oaWQvaGlkLWFwcGxldGItYmwuYyB8IDIwNyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPj4gZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5jICAgICB8ICAgNCArLQ0KPj4gNCBm
aWxlcyBjaGFuZ2VkLCAyMjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWJsLmMNCj4+IA0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaGlkL0tjb25maWcgYi9kcml2ZXJzL2hpZC9LY29uZmlnDQo+PiBpbmRl
eCA0ZDJhODlkNjUuLmY2Njc4ZGIyNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvaGlkL0tjb25m
aWcNCj4+ICsrKyBiL2RyaXZlcnMvaGlkL0tjb25maWcNCj4+IEBAIC0xNDgsNiArMTQ4LDE2IEBA
IGNvbmZpZyBISURfQVBQTEVJUg0KPj4gDQo+PiAgICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHN1
cHBvcnQgZm9yIEFwcGxlIGluZnJhcmVkIHJlbW90ZSBjb250cm9sLg0KPj4gDQo+PiArY29uZmln
IEhJRF9BUFBMRVRCX0JMDQo+PiArICAgIHRyaXN0YXRlICJBcHBsZSBUb3VjaCBCYXIgQmFja2xp
Z2h0Ig0KPj4gKyAgICBkZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UNCj4+ICsgICAg
aGVscA0KPj4gKyAgICAgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgc3VwcG9ydCBmb3IgdGhlIGJh
Y2tsaWdodCBvZiBUb3VjaCBCYXJzIG9uIHg4Ng0KPj4gKyAgICAgIE1hY0Jvb2sgUHJvcy4NCj4+
ICsNCj4+ICsgICAgICBUbyBjb21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2Ug
TSBoZXJlOiB0aGUNCj4+ICsgICAgICBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgaGlkLWFwcGxldGIt
YmwuDQo+PiArDQo+PiBjb25maWcgSElEX0FTVVMNCj4+ICAgIHRyaXN0YXRlICJBc3VzIg0KPj4g
ICAgZGVwZW5kcyBvbiBVU0JfSElEDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvTWFrZWZp
bGUgYi9kcml2ZXJzL2hpZC9NYWtlZmlsZQ0KPj4gaW5kZXggMjRkZTQ1ZjM2Li40NDRkMjRjZWMg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2hpZC9NYWtlZmlsZQ0KPj4gKysrIGIvZHJpdmVycy9o
aWQvTWFrZWZpbGUNCj4+IEBAIC0yOSw2ICsyOSw3IEBAIG9iai0kKENPTkZJR19ISURfQUxQUykg
ICAgICAgICs9IGhpZC1hbHBzLm8NCj4+IG9iai0kKENPTkZJR19ISURfQUNSVVgpICAgICAgICAr
PSBoaWQtYXhmZi5vDQo+PiBvYmotJChDT05GSUdfSElEX0FQUExFKSAgICAgICAgKz0gaGlkLWFw
cGxlLm8NCj4+IG9iai0kKENPTkZJR19ISURfQVBQTEVJUikgICAgKz0gaGlkLWFwcGxlaXIubw0K
Pj4gK29iai0kKENPTkZJR19ISURfQVBQTEVUQl9CTCkgICAgKz0gaGlkLWFwcGxldGItYmwubw0K
PiANCj4gSXMgdGhlcmUgYSByZWFzb24gbm90IHRvIGJ1aWxkIGhpZC1hcHBsZXRiLWJsIGludG8g
aGlkLWFwcGxlKC5rbykgZHJpdmVyDQo+IHByb3Blcj8NCj4gDQoNCllvdSBtaWdodCBoYXZlIG5v
dGljZWQgdGhhdCB0aGUgaGlkLWFwcGxlIGRyaXZlciBoYXMgY29kZSBmb3IgdGhlIG1hZ2ljIGJh
Y2tsaWdodC4gTm93IHdlIGhhdmUgYSBjYXNlIG9mIE1hY0Jvb2sgQWlyIDIwMjAsIHdoaWNoIGRv
ZXMgbm90IGhhdmUgYSB0b3VjaGJhciBidXQgc3RpbGwgc2hvd3MgcHJlc2VuY2Ugb2YgdGhlIHRv
dWNoYmFyIGJhY2tsaWdodCBkZXZpY2UsIGp1c3QgYmVjYXVzZSBpdCBuZWVkcyBpdCBmb3IgdGhl
IGtleWJvYXJkIGJhY2tsaWdodC4gSW4gY2FzZSB3ZSBtZXJnZSBib3RoIHRoZSBiYWNrbGlnaHQg
YW5kIHRvdWNoYmFyIGNvZGUgaW4gYSBkcml2ZXIsIG9uIHRoYXQgbW9kZWwsIHRoZSBiYWNrbGln
aHQgYnJlYWtzLiBJZiBrZXB0IHNlcGFyYXRlLCB0aGUgdG91Y2hiYXIgZHJpdmVyIHNpbXBseSBk
b2Vzbid0IGxvYWQgYW5kIGJhY2tsaWdodCB3b3Jrcy4NCg0KSW4gdGhlIGZ1dHVyZSwgd2UgYWxz
byBzaGFsbCBzZW5kIGFub3RoZXIgZHJpdmVyLCB3aGljaCBzaGFsbCBzdXBwb3J0IHRoZSBtYWNP
UyBtb2RlIG9mIHRoZSB0b3VjaGJhciwgdGhhdCBpcyB3ZSBjYW4gdXNlIHRoZSB0b3VjaGJhciBh
cyBhIHNlY29uZCBkaXNwbGF5LiBJdCBzaGFsbCBiZSBhIGRybSBkcml2ZXIgYW5kIGJvdGggY3Vy
cmVudCBhbmQgdGhlIGRybSBkcml2ZXIgbmVlZCB0aGUgdG91Y2hiYXIgYmFja2xpZ2h0IGRyaXZl
ciBpbiBjb21tb24uDQo+IE90aGVyd2lzZSB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLCBidXQg
SSdkIHByZWZlciB0byBoYXZlIHRoaXMgYnVpbHQtaW4NCj4gYXMgd2UgZ2VuZXJhbGx5IHRyeSB0
byBrZWVwIHRoaW5ncyBjb250YWluZWQgaW4gb25lIHNpbmdsZSBwZXItdmVuZG9yIEhJRA0KPiBk
cml2ZXIuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiAtLQ0KPiBKaXJpIEtvc2luYQ0KPiBTVVNFIExh
YnMNCj4gDQo=


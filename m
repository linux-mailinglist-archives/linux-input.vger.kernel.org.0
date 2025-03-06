Return-Path: <linux-input+bounces-10594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88DA55574
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 19:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2BCA3B1627
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 18:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340D026E153;
	Thu,  6 Mar 2025 18:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="fEu/R6Aj"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010007.outbound.protection.outlook.com [52.103.68.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43C26F441
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287124; cv=fail; b=dKB7lEFnwSZwA/IJZ7pgf2j2XG8vxd/ATVnTiFItxvBZU1Qm3tXiMrfiFjAdkN8jUCLkrve0ZpMOxTZuShchjEB2bLqWwDS0l0mHfROAksG2R+DsdH3xra2aDJ+9ipcVXCYzzxSC8/aKVPYhgl4i7Qs5eMYuEtMxzd4y508SWBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287124; c=relaxed/simple;
	bh=FNZE8QGngAWlVaBd1u1FJTaCizVNS4hTHRb4aUWzmsY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hF2mt7G0M9tTmt+khLVAb9VPBC1CJ2gAu0QE8vkU1poCzjGH857q77Y0EEqwi/X669p1zH9ebNGvFnj3cPOlo34QRm+LXJxd0qBR5SZE7/2F5tNUZ7Lggy6Ud+hSKMHHugy/X9TySg0o3iTyEYNYyScYay62WaVTTjIwOYgCRjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=fEu/R6Aj; arc=fail smtp.client-ip=52.103.68.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tflOzVXj+pfFR5VncprS/a7NBVGAU+WR0U5GmrXlw/W1MYH4UoKRBVwN865O4ThYB2zIc0FXgxYd+yYQBuk9Rm8oIHmco69tkiccBtrxqiruo6Lh3iYEhO2SNWES7Ib/FDkOuWfL3BiR4jWjlRHAQ0IEw3rXUUeNli/b38Ta3v3O2YRrNbcXVjxFlN9vyk31rHKuX49W2FR9PH+cFnwTcxYMMwvpYwjHHhDhwIZtT5t+aE2hyjV4XK/RH3kRvr8mnD7xS+08n/CSITIg+G0sN6FyV/6snQsUbW51zdyJWEiA+kxacMKG2zBuGTEsJuLNYr+EaNxnExt8TB/MOUbh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNZE8QGngAWlVaBd1u1FJTaCizVNS4hTHRb4aUWzmsY=;
 b=llP7oeg/av8sXkfV/uz+hxrc2TMhyT7hVX3ZhC+SZwwgiPu5fmfE/N3pRboRQCCQOLyjvBPOxQazYUHZQjFrUvNGmIcqBtk7oPgwRhbEfA1sSdhA87RiiseY2BVUv7QI22gMgHs10XDj6KqEYC4Vpx7+CipeKXTNMV5ScQ7QTNARD6VLnM8zkoZg+JN1rWDxSb/tBhUo/BK6eMESwKWGxp07FET/kYhBeM/NFu4YR5VKzi/C2lgUxI7bACWpXlXSQ0NsHmWr1dRc2offefKWxTsOd9+z4u9TnAsKlBa+c/5tILKJhtIbzJCbJS19IbYn1jU+5Fciy9oqPvMr6bLSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNZE8QGngAWlVaBd1u1FJTaCizVNS4hTHRb4aUWzmsY=;
 b=fEu/R6Ajn23drjiu42PH2ZwZH49yUc8N5mD5YraeZi81LPFSYr1v8BdLESatNutqilEbrBze9UcVhaLtXfFXCFRPHpQQIhWzlufD0F3sYL5VvzDzmcTe4lUZusbpnbowS34eoVU1SoRBIKMMfa4rjLtTgQlcyAEBWzXg9C1eZIt+0LhPAyWAHzrPXrD0oVWeuU7ZOeBw/l8jnDA1dyiG9qvPpzyho7tbumPjIolatlSXvK2ioYnVz3gW6fDPt82l23HLV+iB+BUfaQ+rf3HUn3A70sSBCI93f5qMLOGRp2syjfqyGYmZI3pomY3n3kjLOpTkZz2u6Dfmo+ubx8glOA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPFE49B9A7B3.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::5af) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.21; Thu, 6 Mar
 2025 18:51:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 18:51:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Grigorii Sokolik <g.sokol99@g-sokol.info>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Ievgen Vovk
	<YevgenVovk@ukr.net>, Jiri Kosina <jkosina@suse.com>
Subject: Re: [PATCH 1/2] HID: hid-apple: Apple Magic Keyboard a3203 USB-C
 support (backporting)
Thread-Topic: [PATCH 1/2] HID: hid-apple: Apple Magic Keyboard a3203 USB-C
 support (backporting)
Thread-Index: AQHbjsjWw4Ihf5JLikCPHrCC11ZJNw==
Date: Thu, 6 Mar 2025 18:51:57 +0000
Message-ID: <DBEECCEF-07F4-4989-8B36-BF7AC790B320@live.com>
References: <20250306070027.532052-1-g.sokol99@g-sokol.info>
In-Reply-To: <20250306070027.532052-1-g.sokol99@g-sokol.info>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PPFE49B9A7B3:EE_
x-ms-office365-filtering-correlation-id: 0f14714c-c846-4925-7482-08dd5cdff8dc
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|7092599003|8022599003|461199028|19110799003|8060799006|8062599003|1602099012|3412199025|10035399004|440099028|4302099013|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?QlNweGk3M1lCTlFtY2IyWC9pK0NPZm1WVi9Sd0tkVnNVaHF5T1FwaEVEYlNj?=
 =?utf-8?B?dVVMZzV1SUwrekNsYjQxNmozT045VEZMdTNOQlpnUjdYblBkcVVuMlcrSEow?=
 =?utf-8?B?ODQ1Q1d1SDIrR3E3RXB0QzdnT0lFbVdsZnNhcVF0NDMxa3lWV3FGWDJnQmll?=
 =?utf-8?B?S3ZaK29ob1YycCtTV3Qzc2RjL2xzVDBGNEduWTNsWTNjS211SE05NTNuOFd4?=
 =?utf-8?B?bW5GT3plaG83SHdheDRFK2NhS0RlclBmMjNmVENtNWMxZ1M5NXFhR3dGZzFV?=
 =?utf-8?B?Z1MvWFgySlRRV0lIRkw2RVZnYWtzdytVOXZSZlhGekVDdllkMVRhQm44Z3B5?=
 =?utf-8?B?dVUvRXZkRHo0cjN3SjgzWWozTUt2UmxGWGRtMEtFVDA4MUk2ZGtGRk96T3c4?=
 =?utf-8?B?NWxqa3dVcjVnZlpOaXFDYzFsaFAreTl5Wk9xQ09pNm94NlZLM3FBTCtBQkh0?=
 =?utf-8?B?K0xmYjY5NHAxSUp6VS9jV2IzSWw3bFdtb3UxZld4dTJ4UStzcWttK3JaVmZv?=
 =?utf-8?B?WEI4WEZCWTlNNnNyWC9JYzN5dVFmQXgyVERVYnN5Wi9iZU5TQ2xvRFAzNDlz?=
 =?utf-8?B?OTVDWHVDN0w5cnFVbVc4ZjZMcko5dDI3c3paS2hIR0JsanM0VEVVbjhMVlFM?=
 =?utf-8?B?bGE3RWord09aUmgyaG1yMXp0YkxRK253cFBIRHBJOGFmc2RtMGNRRFVVeXVZ?=
 =?utf-8?B?em1PNGVmYkFmblRCYm1uN2toWDVJU0kxTUhWclRqVUNoczZ2V2NCclRXWjdH?=
 =?utf-8?B?TzBxdTBQTlpTcHkxYncwRXIvaG1wR1k0WWFwaDNqaVEwcGRZUUkrTnkyeFJa?=
 =?utf-8?B?eVdJTllSUW80MTVmbUs2UlNmNmJoZ1lsbHVYajduTUh4Sy82bEJGNEd6ZTcz?=
 =?utf-8?B?dklwUGJ6bEEwdWpsd0k4WVBWNkdqd2czQ0NHSnZBSHluVFlWWCtwdnA2VXNF?=
 =?utf-8?B?Z0ZNOUF1NTJxSU9mY0lQTHVtRmViQlZVYnNnWGxqUWkvR1pUYlhQcUVvTkdR?=
 =?utf-8?B?ckl2TGZHcXNPdmFUT2dXeFJGd1hUejdBUGEwMm1UWlY0RmhiazdHZkE4N3Yv?=
 =?utf-8?B?QWo0OFNPemFyYUtGOE1ZaFpHSlhnTXNNNTV5TGFEVWlPdlROc0JEYjU2MmhZ?=
 =?utf-8?B?bFgxNmpWNFpkaWsrZkNEWkI4bFJJSHI5S1AyS3hIT25xaXQ0eFlZaitCcEY2?=
 =?utf-8?B?b0RLdlU4T2hUcVVuZFVOL3JXWXpIWURldWNZNDNQQVRqOE1YMkcybnlNazJu?=
 =?utf-8?B?Nk1jcUhwWWc0dFo5akIvaDVnTjJOamNOZituNkhiL1dhZVFLRmQwS1BRRVRy?=
 =?utf-8?B?UGF5VWZPVTZTTE50ZVpHODdVM0pla09KY25UQVhXTlZ3d2dyZ3RMaE9XRE1E?=
 =?utf-8?B?Q0VTMFF5cnRMbGlxNGVib09rWkg0S2ZGV3dPZ2hsU2lFMWs3K1cwWkJTUDNu?=
 =?utf-8?B?Vjd1S0NxSXhNbTg3Ni9JcXRPM3QvNkk1dWREenliNGs3OStTR1krRmVqbWlC?=
 =?utf-8?B?WGFCUENTaHRIVHlFeUhtUFVkWnJuSHEzeU9MSlBDNlUrQ0xvZHVFWTM0cTFG?=
 =?utf-8?B?ZDZla1pETnlCaHp1Mm5hUFRtZ2phNVMwNGxoV3k1Vkd4Ym14SWJ0YklML3ZU?=
 =?utf-8?B?NkdRbGhueU9SVnNteWtxbGdrd25IbWFkUm4zVDFKZGErYXA1dHF1TUR4U2VI?=
 =?utf-8?B?Q3VFTmJGbVFwbmNESFo0QmRYb25jam9pRElNRHNLdEpRRHZHZUh3R2JRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3FZL3g2bnE1bHo1YUNWcjVtbTZnYkpVYnhxaTREa2JxeHN5WUVRTjlsR3VS?=
 =?utf-8?B?WW9FVXNxNXpIVHlKNUNGRVE2K0FhOERQYkZpZDlOTVlsd01XYjJPbytCTHFS?=
 =?utf-8?B?RjRRdFpUZFNyRjdiYk0vYlc5WEYrTGVYRk1mYmdxOEhLMkd0TEIxOXUrMFBD?=
 =?utf-8?B?ellYUzRJQVgyc1RFbTkxVWtvL1FseXY0bTFYby9PT2NiNUQ1NUxnRW1CNFRW?=
 =?utf-8?B?ZXBSWTBlME1XQlByOFllT2JhckYzdmxiZlNYWk1aZHYyN1RKOWRISnoyN043?=
 =?utf-8?B?TkZ6VjkxZDd5K1B0OWVSOHI3SmV6aTZNcWlGY000dU50SGNOZUE1cDB2SEtz?=
 =?utf-8?B?QWJWUmxPMFA3dEpWMzF3bFRZMVZjY2tWcTROV2FRbGo1dzVRYjRXVjg1NFNK?=
 =?utf-8?B?V2UzbmlyZFNFRGFDd1pZQm1oNFF4Y1ZCZFFjcERRQ1hGc1dHQTVnQlZ5cGx1?=
 =?utf-8?B?YkJWYzVtS3BNNTVkdittaHYwbis4VXFZYVFqbDZvSTRGRmJ0WEl4SlhXa3R0?=
 =?utf-8?B?dk9GajBzVlRUaGVMR2FNSnRoZHBMYjB4MDYycWNqOFVabWxaU2I5ZGVBcHRN?=
 =?utf-8?B?K29tNTc3cHp5SGJIVDFiQUJRYnZhTStPYnAyOWw3YlZuWHBNdWZJWE1kV0pL?=
 =?utf-8?B?alpleW9iekN2S1dNWGp0Und0QVN3Q2FyM2lNVERaMHY5SnNwWWRONjd4OHVq?=
 =?utf-8?B?Y1R5QnJ5SE5zZjF1NmZFZnMyekVCRGlNUFlxNm5zNjVyUFRQSUh3R1ZqSXl3?=
 =?utf-8?B?WTdVVkxLL3czUHYrb2hwRDgwMmNiN1VscWZseXFDekU2elJFOXM4R0tJM0hx?=
 =?utf-8?B?d0ZDcmhhZ3ZUaXl6RlNVY0JCTkRIcnRMMWRHZVlJVlVQbVhiWXA5LzZkcUs2?=
 =?utf-8?B?ZDdVWjIzeDlRa3FXSHhiU0Q0eVZhWmVGbGd0ZUpFb2VpUDN2M24xeExpVWxz?=
 =?utf-8?B?K3pwMGFvU2Rrb1Fadko1N1ZSTEVFY0hnOTR1cm5SY0pHTk4veVBzRVlqemtD?=
 =?utf-8?B?anVzTmxuaTVoMEZZV1VOTkV4L2pMamNQYnlnREhJWVlyUk1lRW1JaEdRZVE0?=
 =?utf-8?B?Wk5xaktkV1lYcjZTVEVUaENUeDBjSndDa1JnWVQ1Qk9aTGtNVW1FL2J6eDhH?=
 =?utf-8?B?RHU5U1U2N0lQMnoxcisvTHFLUmtjeUgwMVM3REFEdFo4ZGREZG9ick55YURt?=
 =?utf-8?B?YitsRlFMWGthWlp5UnFXZFlVR0pJbXdveGRSWXhYZkhzdG9mREp3ZFBCVGxB?=
 =?utf-8?B?NFhUMVk2Snk4QnkrUmV2R0pnY2JHRTduOHY4aFhHMTU5V2ZIa0tqNzBacTZJ?=
 =?utf-8?B?U2Z1OUcyRnJRamJhcE9pV3BnOVBLTDRnUzNMMUxFVkNKbEtyTGFWOUJBU0F2?=
 =?utf-8?B?bVpwSlE0bzZlR3Z6YTZqaENzNm5zdWJiQnBTNnFZQ3lSVTBpNnhUUUpFQVR3?=
 =?utf-8?B?WVp0d29YaGJwdmFOWWhWU2xnUzBNUXFMbkxVZmt4N21HMTY1dStZMHMzdXA3?=
 =?utf-8?B?MzJtczVzWXRHeU9icUpoMVVuSnpzeThBQ0FneTV5REVMNFNTeWNEQVhQcFF3?=
 =?utf-8?B?TW5ESEx1RkZEV2ZIQ245SU5Qa0VoMGliZERvUURxbHdFYnhkTElkbGs0eVFT?=
 =?utf-8?B?aE56TGYydjZJcFoyeUFjZFVRdEhEOWxudlNCSEhKK0lCQ2VNWEN5azFOMFZz?=
 =?utf-8?B?YnZYaWduajdJSHpsSFpxYlZwbEVHQ00xUGNyVkdZSWxmY0QvcklUNGYzNkp0?=
 =?utf-8?Q?iY1Y4MM5vy8unZd5gmj0sQEjzx89hAwiZTKjr3g?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D47994FC60288408418F9860C3B0715@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f14714c-c846-4925-7482-08dd5cdff8dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 18:51:57.8898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFE49B9A7B3

DQoNCj4gT24gNiBNYXIgMjAyNSwgYXQgMTI6MzDigK9QTSwgR3JpZ29yaWkgU29rb2xpayA8Zy5z
b2tvbDk5QGctc29rb2wuaW5mbz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBJZXZnZW4gVm92ayA8WWV2
Z2VuVm92a0B1a3IubmV0Pg0KPiANCj4gQmFja3BvcnRpbmcgb2YgSWV2Z2VuIFZvdmsncyBjb21t
aXQgMjgxM2UwMGRjZDc0OGNlZjQ3ZDJiZmZhYTA0MDcxZGU5M2ZkZGYwMA0KPiBGcm9tIDYuMTQt
cmM1IHRvIDYuMTMNCg0KSW4gb3JkZXIgdG8gYmFjayBwb3J0LCB5b3UgbmVlZCB0byBDYyBzdGFi
bGVAdmdlci5rZXJuZWwub3JnLg0KDQpBbnl3YXlzLCB0aGlzIHBhdGNoIGlzbuKAmXQgZWxpZ2li
bGUgZm9yIGJhY2twb3J0aW5nIElNTw0KDQpQbGVhc2UgcmVhZDogaHR0cHM6Ly93ZWIuZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLnJzdD9oPXY2LjE0LXJj
NQ0KPiANCj4gDQo+IA0KPiBTaWduZWQtb2ZmLWJ5IEdyaWdvcmlpIFNva29saWsgPGcuc29rb2w5
OUBnLXNva29sLmluZm8+DQo+IC0tLQ0KPiBbUEFUQ0hdIEhJRDogaGlkLWFwcGxlOiBBcHBsZSBN
YWdpYyBLZXlib2FyZCBhMzIwMyBVU0ItQyBzdXBwb3J0DQo+IEFkZCBBcHBsZSBNYWdpYyBLZXli
b2FyZCAyMDI0IG1vZGVsICh3aXRoIFVTQi1DIHBvcnQpIGRldmljZSBJRCAoMDMyMCkNCj4gdG8g
dGhvc2UgcmVjb2duaXplZCBieSB0aGUgaGlkLWFwcGxlIGRyaXZlci4gS2V5Ym9hcmQgaXMgb3Ro
ZXJ3aXNlDQo+IGNvbXBhdGlibGUgd2l0aCB0aGUgZXhpc3RpbmcgaW1wbGVtZW50YXRpb24gZm9y
IGl0cyBlYXJsaWVyIDIwMjEgbW9kZWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBJZXZnZW4gVm92
ayA8WWV2Z2VuVm92a0B1a3IubmV0Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKaXJpIEtvc2luYSA8amtv
c2luYUBzdXNlLmNvbT4NCj4gLS0tDQo+IGRyaXZlcnMvaGlkL2hpZC1hcHBsZS5jIHwgNSArKysr
Kw0KPiBkcml2ZXJzL2hpZC9oaWQtaWRzLmggICB8IDEgKw0KPiAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPiANCg0K


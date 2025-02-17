Return-Path: <linux-input+bounces-10086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D5A37A9E
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E70443AD1F1
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 04:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294072E403;
	Mon, 17 Feb 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="rbgsBoHN"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDA7155A52;
	Mon, 17 Feb 2025 04:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739767511; cv=fail; b=pqjxPhs9btavw7xj87kYG38pSqhZWx2f6Z7fjPW3mBhp1+xO9SHsAoVF5Xis9ZI/9ER+8DIJeyx6d20dXiy4ytjE99gtMhJNGtXhIexO2zcBE/yNhzgnItv3k92W8fOmudHZv2XRYmi3QH8aSfz9n/XVKP1R5zOmjzv3AxGz3Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739767511; c=relaxed/simple;
	bh=PPi15f63hoAy86xQcZ45uU/GC2NgZXi0T9pMc3VgLvo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IC/mIOUM0rWh7gk41US/GTZVCuER/Axq/RpludUXp57xW3U9IYLpHyksYy9CkNP0VMh5DVBk1TEtWC69SRAcTSvF2ctke3QCP3ERM86eCq7DFtYzhcGg5y/2pcDAsem0mR885WQWOgMsQln9AVl22O6ROIr3Kbdn3XtIIZgkWUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=rbgsBoHN; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR5OLWd6x5vkQqxEWmAS57LdU4I6cnUbiY6dvJnonAg3DnZY8LkWBspw1tWSZPiVuU5HmaBlDtU/qvNKJXUNDi0Qmbv4M+/NzjyM2YDRgI9tiEgIA+CDQ0MPGTljU8T4VNvIRta2JGamivNQby+PbVMZnKIO6YAHAfM+59NpYcCzsIQjACUXSMLwqHnL+eg5txMBgjeF385FzAvMRGMBMMqkdRAvCNf14MjBtHwAxIFfy6TM24vZ1MaRDkz3c2BKHR5411lDq7iyA3f1/xV0s0jgFTp3FynELxWRWDGC2KG9B2mnNz04ZNn4TEa8LPCVFeyTF2D0y/H0iDdjEYCq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPi15f63hoAy86xQcZ45uU/GC2NgZXi0T9pMc3VgLvo=;
 b=AsX8xyRCnnRL5C8vgo3olRwjOLqmiYr1DYZcT12fzknYg7TqL5l1sWc2j625ri8num2q9fHSf6TRXPF1KvbiJ5EtxPaRV/EZn26x1c9dMSnxUGIM9z5s8mTaOEusAZGZPNzGwOeSmUI4PXoZgqHmWah6weHmGKlE9/66HcS7YCk8tIQI6IzrVJBR5zHAZBhjAAOgqtRJsYmcC9Z05gwDMkdr1IwzId582RA1MUOozRAmxLJvikZBZbsDa3CwlGwfOeBDI2G/TlvRKk5G435gUHYcmnUx1PlOi4FB+eSfmh8DpkevUQHzCrq7ZB5jy3Wp7MOxBM+Rn2aFFTzw5Jj4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPi15f63hoAy86xQcZ45uU/GC2NgZXi0T9pMc3VgLvo=;
 b=rbgsBoHNrIwWaFkCVKWSc90tELOozepLpk0Bawrm1eity3LlCaylYR36Meu1g80eJbST4ItqBxVZbWMWzw0uD/oXqexxBY13x0llO+ERJ3v7S7Rtl5PjfT46tc8FtDja10y186F5GJvlcJNcveMakFq6/iF7Aifsu2sbpV1Vxo3m6T/nhaGkbEfXI/HEPpU64PFdhcU9u0WktLKwFC3CXUB4NHG0up0Xr7yFvJ8Xcikc/R4mXnD53YBq5ca5dQT2ad2FPsgU/0WygBW9WOvQXzieisBQc3qOgxQ8r+JYMnhzz5sD4St0tuuodbFC2kXxn0mOP4QJSakDa8BEFDQmzg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN3PR01MB7015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 04:45:04 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 04:45:04 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/3] HID: hid-appletb-bl: fix incorrect error message for
 default brightness
Thread-Topic: [PATCH v4 2/3] HID: hid-appletb-bl: fix incorrect error message
 for default brightness
Thread-Index: AQHbgPa24BMjEJUStUyBicLEVwkKQw==
Date: Mon, 17 Feb 2025 04:45:04 +0000
Message-ID: <3AB4CA1B-6FDB-4A21-9AAF-8D72A6F12D90@live.com>
References: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
In-Reply-To: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN3PR01MB7015:EE_
x-ms-office365-filtering-correlation-id: 2d6d20e0-06b5-4b38-cbbb-08dd4f0dd886
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|7092599003|8060799006|461199028|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?QkllNGc2ODBud2NQV0IrbDFTL2I3c1RjUUpjTVpGaUtFN0luOFhIa1prdWMz?=
 =?utf-8?B?L1RYaCtxcmdHSmhVeWpEOUlIc2ZUQ0FaMk1iZmV1M2VkcTdnK1J4aTVnQTBj?=
 =?utf-8?B?QnhKR01NNGNDVGwwWXBJSE0rMmdBV3NqdEdNQ1JkWmNNMW56UjRyWGYrampW?=
 =?utf-8?B?Qk5JVE83QXBKZnBKRXFWZ2tMQ3h0QTBPVnlTRWpSMkRwNWtjY3JBSFNsMEMr?=
 =?utf-8?B?bllpU0JNWFVHREFsMmp1MDhkOC9xR2VGTk1ta3c0bzJEZXVDb1BWa0dER1NZ?=
 =?utf-8?B?NjhrYUhnaEg1TUYwMnd1WTdlZHFHYWlDRzNXem10NkpxcTd4K0Q3TVdldWNv?=
 =?utf-8?B?L0JFc2VUVEE5ZDl4WE1JbnkyN0MvRTRxT29zemRpTC9lRzJNV2YrOWMyL3NM?=
 =?utf-8?B?a1FpYUxkbysveFJRaUNZWU15ZkpRWFhBTlBtSWdsczdXZUVaQlJDREJ3U04w?=
 =?utf-8?B?a3E2amVVS0lRbFI5SnA1bFNMTkhBdm5MS0U0UGxCTnRseFdSNmtPU1VJZmUx?=
 =?utf-8?B?L29XUjZ2SkNZaWJVWngyb3ZLMXJJV0RrLzR6RzNCZEFrVlBHeEdyRHVmcVlE?=
 =?utf-8?B?eUh2cmpoZElmaVR1cm5FVjBmdHFKMkhyNlNZU3BScWRrRGtaUTBBTktkTnNw?=
 =?utf-8?B?eHNqZU5ZY0pxam4yNjZ1WGU5cm56T005UmplS0hLWlZNRFllUnBJMG14U0pY?=
 =?utf-8?B?UTNlaXl2dmFqTnZsTm5OUU4vRG9ESGlmL3ZlYitPSjgvVmtuUWFLQ2x1TlUv?=
 =?utf-8?B?dHNwOVVvWmMyUnhUbktJRDhMQXorTHgwblBwUi81RGNXcVVxRDliUXJtdldL?=
 =?utf-8?B?NnFyZXIwb0Nib2lxRWZ4bUFrb3dRSzBRWkxUL1hSemJXVU13T1ZFcDhQNk5z?=
 =?utf-8?B?N05qZHlwZmZkeS9UNUZwRWgrUkVkcHNadFoxL2dnWjBTNjBRNk1HcThIbGJN?=
 =?utf-8?B?T1hJWSttRnc3TG96TVpUblNjTWxOMFNtUzI0Q0lTUy9PVnJLb3MwV1JtWEhV?=
 =?utf-8?B?b2ZsUkFhOEJQdldkemVKZm9JaUt0bEgvRG43R083L0dCdU5GWm5tS3BnTHZO?=
 =?utf-8?B?Q1Uwb1pMa0FROGhyOWcrUis4YllycW12czc2Q3RQYkJzVk9rbUc1SHVMMU9C?=
 =?utf-8?B?c2pEQjE3SlZsMzRjVythL0Y5MVlBdmgwZzJtL2tGZ0s1K2tSNWQwN2dxRktR?=
 =?utf-8?B?amREMlJibnB2bHQrZnF1aE1OcndDekwxMENwTnBUcnE2d3hKcDVsUmpVYWs5?=
 =?utf-8?B?TUYramtFU0RpaStLL3NUc0grc0JEeE9GQ0tHYVdCTGZjdS85UkJxSjhVSG0r?=
 =?utf-8?B?ZWZnc25valRSNXNNa2l6NElDb0FQM3JGZEx2aGJDUE9VUlJaTHo2b2pLRG4w?=
 =?utf-8?B?WjF6RHpRV1ZSMCtqM0hLc3A4U1NTTVRoWllNbWluRFhqM2Ntd2kzYU5Ra3hB?=
 =?utf-8?Q?fvlgdsS2?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXFEYllKblI3ZGhXK0srL2Njc0VxY3RjNTFkZENrSHQ3am43V2owUHg2c1pa?=
 =?utf-8?B?NTVtWGNNSm5oQXlKbUwxU0RiOUhvU0VRZHFzTU13emhDWnNnMUxqVm5SemlI?=
 =?utf-8?B?U054N3JZRlVWMXNSZUxVMGJsenFHaW1tanl6OFJyeDdPdzhsR25BRURoMktI?=
 =?utf-8?B?SVpqZHI4UExrYVVTU3FWbVV0dFBEeEFFNHpPVktxUHRMeEZSRFAydUc0SVli?=
 =?utf-8?B?djBUb05GN0VWa3orMjFPMXR5M05wZ1h5b0JleWlxN3JncElONUVOQXBVNERz?=
 =?utf-8?B?dTA3emJ4V3lERStKUGc3MG8wYjlmMWRrV2RIc3llaWtIQ3V2bzZJL1hwUUd6?=
 =?utf-8?B?blJCT3N3TkNMWTlQVnphRWNTWEMzeExZYlp6NUdBL3NSRDJPS1hXa1U0alFM?=
 =?utf-8?B?RWo5dTlDSW9iaDhFeE5BVXlFQ3lDRzVPTUN6Zm8venJ6aUdOWEszYU85enpM?=
 =?utf-8?B?bEVyLytsZjJ3YVBsVWFwY0kzTTZwL2FTeGR0OWZVR0RDMXZ6ZnpPSDl1aTV0?=
 =?utf-8?B?WlptRmMyRFl5QzI4UmJZb1QrNE1rMzVpQVNTUldWRVhobFdlRk15K0t3VVJo?=
 =?utf-8?B?RUZnbWFseTBRNldkVTA0Vm9nQWNIRmpKbS92aHo1MFJCQWY0dEZmMWhNWTJS?=
 =?utf-8?B?c05xaVE2WG1IZTZqMUx0czhYN1dNU0kxQUR1eit6SzN4bmh5YWpCd3dyQngx?=
 =?utf-8?B?anFUaC9lK1JOd29LNlQ5TFRXcVBIdzl3anRrZmUzZllkWm9MMmthalViUm85?=
 =?utf-8?B?Q2Z6bGdJQnFsK2F1dklBbHc1R1BMNUxHRldmOUFHZGlhYXVKdTM1ekpDK0hB?=
 =?utf-8?B?YUYxL3lyVmh0bEFiUHpHbFVkZjhKZi9saDRKcEd5cm0zT3hNUDJHcUdHT0Jo?=
 =?utf-8?B?akFQWnRjMTZsK3M2M1V0eUtQSVdvY2lTQWNIN2x0UWd5WlhRVy9wT2p5ZlVC?=
 =?utf-8?B?UlEwcmFwUkphY0hmNjgydndJc3NnRERzM0pSTVBIZnp3b3BFUGZtRkIyMHBt?=
 =?utf-8?B?WEJsTVp6Ym5lNndGcU5sa01leExrUHU1dkx2a050ZFp1Q2RySjF2ck5IeElY?=
 =?utf-8?B?YU15a3lvMjhHT2x2UFIyWE9NbzUxWEI5TjFUOGhTcU1ZR05CZDZsUVZEWXI4?=
 =?utf-8?B?ZWN0elVBZGptZGlGYlFFMHBrT3VHMm1Ld1p5a285TjR1d05VN2RJcmllZzVZ?=
 =?utf-8?B?U21aQkJ5azF1TzQ2R3pEaWJKZ204cHdlUXFuWHF0dDBRZkVBd3Axb1V4UWRp?=
 =?utf-8?B?dTliNjM5ays2dEdjVUVUUm9Jc21JUUtJajJEMTMvUzhDZ3pVc3RFV3UvN1V0?=
 =?utf-8?B?S3lFVUh2THk3ZFYxOXY4TjB0d1hBY2Zxd1lEcFFoVWtucmFXQm8vQkdVMmkw?=
 =?utf-8?B?eE5CYW5oMlR6VEdWVUdwT2tGN216Z1prclU0NTVCd3lzNGhnaEpBeWVsMDdw?=
 =?utf-8?B?MG5WV1dmR2l1S3NvZzZqV0kvNnBUWitpUGdlODErbVNJS1RmMnFWY09GTFN2?=
 =?utf-8?B?TTcxV3dWZEUxK29qUG5JaDlCVi9ZZzFDc3krcTE5RFFCWmlqclo2NERMcjYw?=
 =?utf-8?B?eG0xZVBxNUFiU3JmU1czdFRURjhDWkNORTY1Y0g0MzhKekJnd2JkUUczT09K?=
 =?utf-8?B?dmdQU1dTTVN6TnhkTm5HSTVJOGFBMExrbnd6byszK1dYbGVzSkRSeXNvUngw?=
 =?utf-8?B?Z0REUExDY0lVSWlsWVJYSWRWMHJoTERjUnY1a3R2dnQxT1VxUEx4R3RxcGFt?=
 =?utf-8?Q?R88G7Ue1dCzn6FokoN9U3XHEtu7KogQBHlOfsjV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD02C1D1545DF946982F1EB45585F2EC@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6d20e0-06b5-4b38-cbbb-08dd4f0dd886
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 04:45:04.1852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7015

RnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCg0KVGhlIGVycm9yIG1l
c3NhZ2UgcmVzcG9uc2libGUgdG8gc2hvdyBmYWlsdXJlIHRvIHNldCBkZWZhdWx0IGJhY2tsaWdo
dA0KYnJpZ2h0bmVzcyBpbmNvcnJlY3RseSBzaG93ZWQgdGhlIGludGVuZGVkIGJyaWdodG5lc3Mg
YXMgb2ZmIGlycmVzcGVjdGl2ZQ0Kb2Ygd2hhdCB0aGUgdXNlciBoYWQgc2V0IGl0LiBUaGlzIHBh
dGNoIGludGVuZHMgdG8gZml4IHRoZSBzYW1lLg0KDQpBbHNvLCBhIHNtYWxsIHR5cG8gaW4gTU9E
VUxFX0RFU0NSSVBUSU9OIGhhcyBiZWVuIGZpeGVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBBZGl0eWEg
R2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KLS0tDQogZHJpdmVycy9oaWQvaGlkLWFwcGxl
dGItYmwuYyB8IDUgKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWFwcGxldGItYmwuYyBi
L2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWJsLmMNCmluZGV4IDFhM2RjZDQ0Yi4uYmFkMmFlYWQ4
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQvaGlkLWFwcGxldGItYmwuYw0KKysrIGIvZHJpdmVy
cy9oaWQvaGlkLWFwcGxldGItYmwuYw0KQEAgLTE0NSw3ICsxNDUsOCBAQCBzdGF0aWMgaW50IGFw
cGxldGJfYmxfcHJvYmUoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsIGNvbnN0IHN0cnVjdCBoaWRf
ZGV2aWNlX2lkDQogCQlhcHBsZXRiX2JsX2JyaWdodG5lc3NfbWFwWyhhcHBsZXRiX2JsX2RlZl9i
cmlnaHRuZXNzID4gMikgPyAyIDogYXBwbGV0Yl9ibF9kZWZfYnJpZ2h0bmVzc10pOw0KIA0KIAlp
ZiAocmV0KSB7DQotCQlkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIHNldCB0b3Vj
aCBiYXIgYnJpZ2h0bmVzcyB0byBvZmZcbiIpOw0KKwkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwg
IkZhaWxlZCB0byBzZXQgZGVmYXVsdCB0b3VjaCBiYXIgYnJpZ2h0bmVzcyB0byAlZFxuIiwNCisJ
CQkgICAgICBhcHBsZXRiX2JsX2RlZl9icmlnaHRuZXNzKTsNCiAJCWdvdG8gY2xvc2VfaHc7DQog
CX0NCiANCkBAIC0xOTksNSArMjAwLDUgQEAgbW9kdWxlX2hpZF9kcml2ZXIoYXBwbGV0Yl9ibF9o
aWRfZHJpdmVyKTsNCiANCiBNT0RVTEVfQVVUSE9SKCJSb25hbGQgVHNjaGFsw6RyIik7DQogTU9E
VUxFX0FVVEhPUigiS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4iKTsNCi1NT0RVTEVf
REVTQ1JJUFRJT04oIk1hY0Jvb2tQcm8gVG91Y2ggQmFyIEJhY2tsaWdodCBEcml2ZXIiKTsNCitN
T0RVTEVfREVTQ1JJUFRJT04oIk1hY0Jvb2sgUHJvIFRvdWNoIEJhciBCYWNrbGlnaHQgZHJpdmVy
Iik7DQogTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KLS0gDQoyLjQzLjANCg0K


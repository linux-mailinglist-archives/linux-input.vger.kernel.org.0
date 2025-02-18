Return-Path: <linux-input+bounces-10116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C4A3A865
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3B716C222
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DE71B87D7;
	Tue, 18 Feb 2025 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="hPJXKBCu"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EB11AF0AE;
	Tue, 18 Feb 2025 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739909316; cv=fail; b=a46Q3PUbcfbuT+Tb0oaHGFu/Srwjk32It1DjT58sxOn2xFvveYhw/7mJ+7YQ4myUNkYSaU8DMmcxyT9OBNZC/3sNKTyuOlp+Xc8xujGX0zem6FG6Fk7080FDRw9o09OR1ZwdtEbyWO1ZQCwXJ3QphcPVzF1oMJTfBJDtmdngkqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739909316; c=relaxed/simple;
	bh=1bQeLTTjZ6+Gof9XEqCfIRsC/pR9I8C4aYgXRybQX1w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RCyIdz2r2RIpQzpUG2rlSVYN5bWfcqDy84oqdPkZ2JSR+h41xFji3LK/+D3bODZllaFbuZFSWVZ4Vpg2NThllUx8BZOc/ZZZamNZ2asE6SkuIrfqY3anYEJAkmt/T4RgmjhK8oLXl3MJeV3M98fKos2aAgvUFBEuxKI16AQEOh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=hPJXKBCu; arc=fail smtp.client-ip=52.103.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmh1hOep5U7CKDiZtewyp/qnIf4f39ITgdzhOjjfKg8akzasxqiulNfQ2vKeRu0JhgHcuMR1eSu9z+rwn3AszYRfjkDCLLlbbDdPLPR29YpkU+zgxXYFmBHNXxGPH6457T7pbFnw71Ng9RRDBYnPawoRXkHq+P5dXKzDnN5VfUL25cku33Zci6+dkQEYutKKKuLJL/3hBxCtWJFp2RZwrsZNsAO2QhasyhqrARtnYMAAEiFRjekkwt8ekrq/FcljKncfGRQBPmFepkoiPD4IXvvFcOBuagUJLqaawxVVB4uTVH91V6xCMeTWjsI2U/xt65qFLhyPoQj5OiIQbCs6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bQeLTTjZ6+Gof9XEqCfIRsC/pR9I8C4aYgXRybQX1w=;
 b=fgOYodzl0oba4rSIv/iAZXVBrylOk8EbfFVVD4Sys3NBzOVH6GeeiHjSNQexdeUy/hI15dXkMKCIQp7+Xse2QZ7KnJt110VpaHCfS9b7xlbLhwo9d+x360oLsV5xatnVpqAs3hRttMJDUb+/OIk29O1VQCavtUtSWku1Xe6trMEhuzcXwx9awTspZeJ8KbiFprbTJ4bBVvb07es6CwSFxKXkhXETXScDNxrjYOFTfpU8VHG5YuDbby3yInAjNVg3cqx/s+GVnCnKeB/3QvVM/H2u9y1bCWzTamn/XqS4qFZ2oEAYGDQiso6EH0+1e8ySrwRTjEDuwLBRWaKYQD+Vzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bQeLTTjZ6+Gof9XEqCfIRsC/pR9I8C4aYgXRybQX1w=;
 b=hPJXKBCuZnDpmVYaNFSkermS3ig0ccN3rC9jAJtjWK/A+bcTNub0zdXjoTXelU37m/ATwpyCrrs3D+6Y6eUr/ox8keXTiYlr+4irq/Ony+d5FUavQ2ZhEo3LygrLClfRbL8SZ/fjNRPPkKJpei4mdxOmi1axjKiiaTFKTMKbMyqZ5q4AwiE/UfS3WSZrd6qat+kjhuC+6r772CM5WlgeEKFDShMvELNPQzalJE2P/j57ulK1u2znoj+VGQc1H5tLUf3OL4mtTyRsNb/wUS/CtcMedZ8UhbCWPU3kIZP+6Xw1iXeL8IMvuYUiBefyVC3hOtEAIdiYW/Elu73lm70sjA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN0PR01MB6660.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 20:08:29 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8445.022; Tue, 18 Feb 2025
 20:08:29 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, Alex Henrie <alexhenrie24@gmail.com>,
	"jose.exposito89@gmail.com" <jose.exposito89@gmail.com>, "bruners@gmail.com"
	<bruners@gmail.com>, "seobrien@chromium.org" <seobrien@chromium.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Topic: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Index: AQHbfsf5ZtYaSMawFkyOk+zY5ixT4rNNgbwAgAACZQA=
Date: Tue, 18 Feb 2025 20:08:28 +0000
Message-ID: <AF7B572F-F5E6-45A5-9B6F-3C0F763E6E4B@live.com>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
 <p3r8538q-11op-32q6-43p7-2n3941126n51@xreary.bet>
In-Reply-To: <p3r8538q-11op-32q6-43p7-2n3941126n51@xreary.bet>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN0PR01MB6660:EE_
x-ms-office365-filtering-correlation-id: 3fabc1b3-1d9f-4c49-0fd4-08dd505802bf
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|8060799006|7092599003|15080799006|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?MFRuOFZFUWpPOVcxd0x3VW9wMFpodWhSYlZsVEdJTVphc1JrTEtTaFp1K29p?=
 =?utf-8?B?VFFpRU1IaGhlSHE3QmcwdjI3RWVvTDNUWVdZTUZMZ0RZN2pEeVVWeEFVQmhJ?=
 =?utf-8?B?a1dyb0ovbHVpdHFrc2dkb0RTYmUxRVhIR0tDdS9CUU9rU0lGa25aU3d5bVNr?=
 =?utf-8?B?U2dGTDNmVk1kUFFtMVBHOGFmRnVVbkNoaVM5L2RWcFlHV0VFZGFXM0E5eFkr?=
 =?utf-8?B?aXF1dmVDSVdMMFFxM1d0OUlIK2N6OW5jcWF0RnNGeUhkY0xVOWRyNHUzbUww?=
 =?utf-8?B?S1R1NHphVGlvWFpQQXhVZU83QUVzb3pNdmF5K0l4eW1hdnFLQ2dmRndzZGU2?=
 =?utf-8?B?QW9kUGZ5Y0RRamh1ckh0OE5ZejZ2N2FWakgyMjVVSVJGMDR2Y1hnZWwxekdN?=
 =?utf-8?B?WVB6SDBRd2FRbTNRR1plNXk5bHFMaGVlS0xOWkVYM3RxQ2tPeVBvTm1nQXVJ?=
 =?utf-8?B?VlZ4MnRzQUpObSs5czA1a1ZaZHlkMXVUV3JJSnNPcXZpU2hHRlUxMEk4VEZx?=
 =?utf-8?B?aThGY1VsM2R0RU5CYitBQUtiTDNvWUhCQVpQb1ZjaGs4WUJhY2xRSWZ5ZTFk?=
 =?utf-8?B?MzM1dUVNVVFwVURubStBcENOOHl5KzE1b1dkVVRLY2NhQkZSWHA0SkRJQzYw?=
 =?utf-8?B?Z0lmUHhkRXNqckFVZTlvckQ4QlRYZm5uWWVzaktBNk83TCtUTzVlSWxnQzFj?=
 =?utf-8?B?VXBNYXhHRGhTYjBEYkI2SnBXakZnMXBiQ0ZQdDdUM1pNVEZLNXhJcHIreHJk?=
 =?utf-8?B?V0tYcGxoYjkyYjdkRi9MWUpPK2haQk1YRU9tK0U5NXZ4eVB2UC9OUXNvQ1Ni?=
 =?utf-8?B?QlFQdm40OHM4WjBNNUk4dnQ4WDFPNHdZNmNtSG9HQ0xpaGJzWUs2ZHp1Y2V6?=
 =?utf-8?B?NkhJbHgrMkF4OUhFdFArcDByL0Z1WVJqNXdTelNzVzlFZFNnUXM5cm9WNEQy?=
 =?utf-8?B?dnNuS2FIeVBoZG5pNjNWamlGdXBmTFRsVmg4RjVQZmU1akFkbW14TUF3M0pK?=
 =?utf-8?B?NkdzS0pLdW0xcUowbytqa21DNTJqWEt6QjE4WnkydTk1QXl1Z2VpQjBQSjAx?=
 =?utf-8?B?b056eDluRkxWekRYNXRLUmptcEJ6ckIwL3pEdmE5Q3V1enpWT1VQMEJIUVVo?=
 =?utf-8?B?TXZ4OFBFZmcwVTBXWll4QnBhZWZMaHlKZW41cW1nUXoyMlFzdEU0eEdHRG01?=
 =?utf-8?B?WjJpcWltUWd4TUJSTlFwVHNMcVVyNHRrSmlaL09DSFpNcjJyZ2VaUU5OcmNQ?=
 =?utf-8?B?K3dQbTdDQ0JYUGZUUHB2MGVJTWtITCtHamF6M3ZrOGtjRUp4dXI1cWlJUVR3?=
 =?utf-8?B?UFRJN04yZXA3SVBlTGphdjRwUTQ4WWpUajRIUFM3THhDYlZ1MW85MERld0o5?=
 =?utf-8?B?MjAyeDdKRUUyNXh1YmRoR1ZQMDVPMzBxYnJKMER2cWVVamNWSUFvMU9ZZStD?=
 =?utf-8?B?cC9jbHZoWGVYbDJHMk9YUjNDeWdQNUlLOGlML3NRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1VPVzg0OWZPMnVlbVd5V2pUVlJsQ2hGc0QwSmpiZkxxR1ExcWRxTkxaUEtG?=
 =?utf-8?B?ZjJOU2JxaUN4YTBNajV6UEsxUDFTcVpidjN0THg3Vlk1cmZJYnNrd2RmM2NY?=
 =?utf-8?B?VjhDYUJPZFVIS0xLb0U2eFNTYnlvSGZZaEhtY2NwSU9EOXc1VFZpTjVoaTln?=
 =?utf-8?B?NmpQYkljMExDcGxjd1g3eXJqVmsrQTVCaEgvcjkzK0RaeXBNRWNQZFB5M3VL?=
 =?utf-8?B?WHF4OFJ1K0tFVnNvS2F3Y0JMZnQ3OUNjUmIwUE0rUmVqeWFpSlBncVJJQjFI?=
 =?utf-8?B?K2pLMDYrcCs2NDV4eis1SjZXRWRqZHdhSlpTNW40M1F1REdPUGRPOHA2S0pu?=
 =?utf-8?B?MEpWS0ZhZHZmRUVmMGN6c1JUOXcvSWZIN0V4RGtlemozZWtRN2FpazVaaDhC?=
 =?utf-8?B?RWpjblJIRWtTV2FXUGJlMWVqcnZjOWVaemp4c0NQOXRHb3gxYWFQOFY5Y1hL?=
 =?utf-8?B?cnFnQVR4L09qa1VNZzQ0Smh4ZlBVd3F2R0NnSTNTbnE3VWR0dHJvakZaOGZp?=
 =?utf-8?B?c3pQMWZuQ01aSVVHbndzL0ljZGcwWHVFVmdBVGZuZTFxTFNoQmN2OGt2OStl?=
 =?utf-8?B?elgycEpndUVJazQwNDNkRXBLOHRKK2lWcDF5VnYweGU0RVZqSXk2NExwWGI4?=
 =?utf-8?B?bmxsbFlOMnZ2M29ZSXdTNUlWYWEzbGptYjVMeCtLdTd5cWIrYzZTNGNGenRo?=
 =?utf-8?B?TExHU0tRS0l2eEQ3em9FZmt0NnA2cy9QdmNoSlM0NmFzU1FXRjlXM0FxbkpC?=
 =?utf-8?B?SnI1UjFwZVhMYjBUTjlPd1htZUpROFlYaFFmKy9xaUlydHZMUTZsWkJJVGt0?=
 =?utf-8?B?QURaK2N3V3Rwd3F3VVJkQmJkcGZuRVJIb0xoTEVsOFhBczgvU2tzSHpYMnk5?=
 =?utf-8?B?SXBGbjZXVU9EbVdIdUoyZnNveHlsL1h5dGM5YmpwQ3JPNE1BaFFQRnE1dzlW?=
 =?utf-8?B?MGQxUys2SGpKTEZXZ2c2NWw0VzBOSTJjT3luL2EvV09ibUcvVnc4SWErUUFU?=
 =?utf-8?B?d0JzOXZkdEdKT2hPWk5NLzZYditxblEraDVLV083bzZUbGt5QXZrRUQ4bEwr?=
 =?utf-8?B?QWNrTjhzYlEyOEpTZEpzbnJYQzI4YTg1cDltOENLQlE0ejdnK0hoRjdwUjNO?=
 =?utf-8?B?bi9iQXJ1aGNHcS9rbXNtcFVyeE1RaFpLbVVuamFXaXBId2l5Vmw0ZTd2ZXNn?=
 =?utf-8?B?RDNhU2tOUWpjSGFkWnE0dWREQ0ZhYkxOU1pMVlJqSUZOMVhmSDRiSTIybEJ3?=
 =?utf-8?B?dEU4NkdseHpucDJGcDBtTmpQdGVYL3FERWl0am5RU0NDSEVEcm1OR2ExM2kx?=
 =?utf-8?B?VmU1RDdVaEJ3Uzk4cHBwbGtsWm82bEFxNEFuMDBMRENJL3RjVTZ3dDY1djJn?=
 =?utf-8?B?UEVOWFVOd09aUXBMcHIyaXd6ZmFaY3hWNGNXNU1Qb2h2eFNrRmo3czd1MTA2?=
 =?utf-8?B?dWl2SjNPRFdCL1dIU3hrUVhWcFlwL1Z3aEVqMy9SU2NLM0taOWhabDBuWTYw?=
 =?utf-8?B?Yk1ZRitkT2hnYyt6ZmIvVHVVS3VUcGdxelUzajM4NUdTVmMvbEUxZVFRY3RY?=
 =?utf-8?B?dmIxcFArK3VFS09tS0RDUlJqWWtnY09XQUhiVW9MbXlRNmI3U0NLTnN3eWUr?=
 =?utf-8?B?K3hKb3ljaGlJNldVemFQQUx0d1B0djRQMnVBUXZsZFNtQ2QrTU0xRUZZQkht?=
 =?utf-8?B?aEJsZCtKNVkrQVprMHBCSERieitDTG04cUFDc1F2UkI3ME9BUTl1SGRLZHNv?=
 =?utf-8?Q?/hGjEq21OmpLWV4rBLn2IT7EJZzcpdR7XMw3yWT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C0EE9BA768977478E9BCFA39632C3FC@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fabc1b3-1d9f-4c49-0fd4-08dd505802bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 20:08:28.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6660

SGkgSmlyaQ0KDQo+IE9uIDE5IEZlYiAyMDI1LCBhdCAxOjI54oCvQU0sIEppcmkgS29zaW5hIDxq
aWtvc0BrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgMTQgRmViIDIwMjUsIEFkaXR5
YSBHYXJnIHdyb3RlOg0KPiANCj4+IEZyb206IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2
ZS5jb20+DQo+PiANCj4+IFRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgZm4gbWFwcGlu
ZyBvZiB0aGUgTWFjQm9vayBQcm9zIHdpdGggZXNjIGtleQ0KPj4gYW5kIHRob3NlIHdpdGhvdXQg
aXMgb2YgdGhlIHByZXNlbmNlIG9mIEtFWV9HUkFWRSBpbiB0aGUgdHJhbnNsYXRpb24gdGFibGUu
DQo+PiANCj4+IFdlIGNhbiBlYXNpbHkgdXNlIGEgZmxhZyBpbnN0ZWFkIG9mIHdyaXRpbmcgdGhl
IHdob2xlIHRhYmxlIGFnYWluIHRvIG9taXQNCj4+IGl0IGZyb20gdGhlIG1vZGVscyB0aGF0IGhh
dmUgYW4gZXNjIGtleS4NCj4+IA0KPj4gQWRkaXRpb25hbGx5LCBBUFBMRV9JR05PUkVfTU9VU0Ug
cXVpcmsgd2FzIHVudXNlZCBpbiB0aGlzIGRyaXZlciwgc28gaGFzDQo+PiBiZWVuIHJlbW92ZWQg
aW4gdGhpcyBjb21taXQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJn
YWRpdHlhMDhAbGl2ZS5jb20+DQo+PiAtLS0NCj4gDQo+IFdoeSBhbSBJIGdldHRpbmcgdjEsIFtS
RVNFTkQgdjFdIGFuZCB2MiBpbiB0aGUgdGltZXNwYW4gb2YgMSBkYXkgd2l0aG91dCANCj4gYW55
IGRvY3VtZW50YXRpb24gd2hhdHNvZXZlciB3aGF0IGFyZSB0aGUgY2hhbmdlcyBiZXR3ZWVuIHRo
ZSBpbmRpdmlkdWFsIA0KPiBzdWJtaXNzaW9uIGFuZCB3aHkgZG8gd2UgaGF2ZSBzbyBtYW55IG9m
IHRoZW0/DQoNCkknbGwgbWFrZSBzdXJlIGNoYW5nZWxvZyBpcyBwcm92aWRlZCBuZXh0IHRpbWUu
DQoNClJFU0VORCB3YXMgZG9uZSBiZWNhdXNlIEkgZm9yZ290IHRvIENjIHRoZSBtYWlsaW5nIGxp
c3RzLiBJdHMgbXkgZmF1bHQgaGVyZQ0KDQpWMjogSSB3YXMgc3VnZ2VzdGVkIHRvIHVzZSBzd2l0
Y2ggY2FzZSBieSBhIGNvbGxlYWd1ZSBsYXRlciB0aGF0IGRheSwgc28gYWRkZWQgNC80DQoNCj4g
DQo+IFRoYW5rcyBpbiBhZHZhbmNlIGZvciBjbGFyaWZpY2F0aW9uLA0KPiANCj4gLS0gDQo+IEpp
cmkgS29zaW5hDQo+IFNVU0UgTGFicw0KDQoNCg==


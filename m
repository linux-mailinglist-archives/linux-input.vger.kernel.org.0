Return-Path: <linux-input+bounces-10263-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F1A414D8
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B34151892041
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DD51A76AC;
	Mon, 24 Feb 2025 05:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="lx5hT3IL"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88B1428E7
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740375627; cv=fail; b=GT8Bkt4l/m+J04BQ9AfoiVSta0YLEEpCzYUO7+SJn0qyqQTRlTbnYs9rjPGVMg3DOH25IGasBwmrBMNrilyPsAAH2B6VhsUPZWiGxRxxe299uHUtMl2DrHtKTu59uEwLr35eS+eCiSt/cGDtN9ZfW1vqVQ6ozQLFrvWFjlJXQt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740375627; c=relaxed/simple;
	bh=++FFCXs9sCV1OpaUByCO7FfVxHnEpEBbWUXCbigTfcI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IvsJt9xKXV5iIZ/xSSlLeVWqpmdoE1Aw0SSz7a9d+OG6MIndCE+33TRXHdLPcRtuzxlE4UZb3P1Ip9hZr3uImnqQ+fdFIRvfCGXQ/LV8ncvBQi5J7S1x02IjR9GJHD91TnXa5fdEUNp9ktQ/SBziFCVnkirXOIyVCYwhPHwcB9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=lx5hT3IL; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wsh6wLjOLQ6/EmIx6JC+QlR5WukMrocQcCMoD2yssD3A84RiCOdsQ12FSekRXHI9/PHPoQDX341ZFyimSpc1b4TcCRSHr07gkc3o5mYWwqDWmfP802iS+UX/2RZZCcfwbcJUpXrhhPcxGhk8jlZzly+k3IyL5NRtDvtzX4GsgYznBPM0CV6tWqVnI4Kwdqh+NRheM+MYK+if+KKTpG0fcrZBH7YI0XXZ0IRAwI2loTzkupkT64IoL+0Rf02qwU9CznrhVAAavUJKP5y4+r3Ymwp9uvbV1LP8tEEYc3Vc8l4CItm+3H9dEXKsOULQmoNzKyVUQ9RU1x6ihSayAvcegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++FFCXs9sCV1OpaUByCO7FfVxHnEpEBbWUXCbigTfcI=;
 b=B7rZ0gplQnnhHMS5R5D2g6XMdEhdxA/9LxfEP6o77LvNfCa4/qNBUPFdevYdTibzKuATkWpiGFSfU10+PEQjPFXtxg0u7BWC/D8m1Ex/p/9tuDiFcVwqEiPs3N2c4XqWlMBL+NAZqfTOuxPs0bvoExIRR0Gaob8yp44Zx40nRDpuJfeVm6S0EGGSZ2MwIfqZxCcJyMzb1Y5pYP2vrBUYFr2YcTObubO+TAFYMjhStvfxgsmFyBSAlZLtugoD5GHxUHbKgq5LUegIRfGsYkI960/NWeH2Ma8Fka3bVWgKmNf+L8mWwfNVf9HBmPsTrlLcZ9uFjjR6C9EqM17aaF8tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++FFCXs9sCV1OpaUByCO7FfVxHnEpEBbWUXCbigTfcI=;
 b=lx5hT3ILUqQpRemoK9T5YqeSNdBCeNPiIvpVYbKrhfz2SUirv+VnGn5zcLWWHtYuBDW9xX4/Xe8Ht0/gxeZhD/+i3S4sgydgSKO+ISGPCMdtdP8M2drsnSYNHB5VgAwuOHaJ5LTXvYSIKLEemLxJQUAgDviuPJFcbAqr8xP2URmexsM5MnF12Uo/LHK3MHLz0yachrINqTakf4oO6HFvHTQPpixJaS4Ek3+Rs2VKdwPy7C/3s3zmhSB+PRlF7Xr0lp8P8X9AaW0lZxoQIzZEwz3FfIOnjbv1A7UTUqAiuGIhzfBOIQYwOO9p6kqANOHhKyZahq+xqCAO78L9GMCFVw==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA1PPF1F03EA81C.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a04::30b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 05:40:20 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:40:20 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, Alex Henrie <alexhenrie24@gmail.com>
Subject: Re: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
Thread-Topic: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
Thread-Index: AQHbhn4lZ9IKkTrshEyIJtvBtkR/LbNV8DEa
Date: Mon, 24 Feb 2025 05:40:19 +0000
Message-ID:
 <PNZPR01MB447838FBA8CE5A22C8096A4BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
References: <20250224053632.2800-1-alexhenrie24@gmail.com>
In-Reply-To: <20250224053632.2800-1-alexhenrie24@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA1PPF1F03EA81C:EE_
x-ms-office365-filtering-correlation-id: b3846962-74b2-413b-34cc-08dd5495b9c0
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|7092599003|15080799006|6072599003|19110799003|8060799006|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q2k5TDJiRWNxVzd6TGtUZEpMa2JkamtYb2pzYVF3c3gyK0hYa0dIR1Ewdzlk?=
 =?utf-8?B?d0lxTkhnaE5JVkUvdTIxNG5yajl5L3Bpa0dMUnJJWnJxYnRTV2M4MzZLa1li?=
 =?utf-8?B?VG51M09NbDg0dDFHZ0l3N0VHR0JrNDFqaU9zSlEzM2VKcG55bnFWb21EWEE2?=
 =?utf-8?B?T0hHKzI0M2J1QUh6VW90SEM4K1RxWmtBKzZUNFYrYmQwck9ib1JMV0pBQzRp?=
 =?utf-8?B?WUVzRitMOHNrcW1ZMkxaMWpvOTdSQ0FMbE8yQkxVWjJZTExxRmRCWWJiTHBr?=
 =?utf-8?B?TmRJZU9CSVBJK25NOGNUaHhZU29NU0U4bndqc3ArbE1vUktDUlo0cm9ydmxm?=
 =?utf-8?B?WGN3eEpoRTNpMzNhR3JnNnVjcnpwYnNOeTdDOVE3SXE5cXNQTkVRQjE4WEJI?=
 =?utf-8?B?U0VsU3hXNDhET3pBcXAyNGJnTTgxaXMzenZQT3FXZytKWW1WZk83TEVQSlVw?=
 =?utf-8?B?TjVqNFhjSXpweHd4M0NuNVpNVjllNnMrUkZuZDdvZ2pjaUQ4Y05jbG52azVr?=
 =?utf-8?B?V3hxWmdzajA0OHpTSlRDNDN2NDVtVE1YbUxCRFB1Yjc4bGcydVcyOW10TjQv?=
 =?utf-8?B?ZVVST2h6SDF5OU43VGlaVHVPSlg1YjJqQ2FDRytjNmZqSUowTzJXWklTcTN4?=
 =?utf-8?B?b0hHdit1d0MyZm9obFhHTlN0aDVGb2RlNGZwQkRQZG42b0ZCcGZnZkdtYUpU?=
 =?utf-8?B?U1ZPSnVFZU9uZ3RNKzFVTDdmOHdiUzBiMkpEcG1ZTHloeEhBaHJnVWNwRDBw?=
 =?utf-8?B?YXFRelJETHNpQzlYa3g2L2JQNUZScTVpbUJBcXFFK2ZpMmFHRksvajZEQzNO?=
 =?utf-8?B?TWN1SzliRDVGZXN4VGpLV3BHQzR5eXFFS21MUG5hSS82ZTdVOGZvdkhXcWg2?=
 =?utf-8?B?OEpqTWNqNmdLakJWc0xpc0t5ZmNqSW9HUFpGb3YxU0ZCZ3UyZm9jN1JiaWpR?=
 =?utf-8?B?bDBXbWgyZzkrZnRHVXRMWTN0R1l6ZHJDWUIySGEwMlBRSzVBQ09IdTFCRjJF?=
 =?utf-8?B?QmkySmJ3dFRJc2xvaVc4TVJCLzJXeXMwUmJ5SHJDNDhhVjc0cDAzMERRMkhN?=
 =?utf-8?B?ci9VV0QxeXlEaUhFYVdjNUoreHd5TXlKR3Z3d0hUWWRFM0o2MFJiSzErQ1Fl?=
 =?utf-8?B?MVVZaTVIUWR5RkNZSklUNnNxSjdKMVE2R1N2RkRMamlhUjNmNFRWbVk4QmY5?=
 =?utf-8?B?c3NsZzdSTmpOWnMyUUZSWTRza1JMY1JHRkRETno0eTh0emJrR1pNUWIxUEw3?=
 =?utf-8?B?Z3J2R3I2TG95dlZrK2tmR2JsNGtueDc3ZkVXaFJFRldDcU8rWlBBVzBYS0dL?=
 =?utf-8?B?VkJGMkZYWExHRWo2WkVXTERpT2s5c1VEYjhqWDlVeThkRHpRYm9Ibk1rUDA1?=
 =?utf-8?B?cmNpTTFEbk5xaFFaaXVuelRwWmlIM1NXK2RJbW5WQi9mWHRkV1BNTTFpN2o4?=
 =?utf-8?B?VEFDaWNsN2xCN1NTQ2Z0emYySUhDMmpOWndIVVl6d0MwbDgrWko0eGxQOGhz?=
 =?utf-8?B?V2Fxa1NDVmN3WUlxd29Ma2cwS2NxbGF4cjVRTVNQSFpacHBnRU0vV1VEanJ6?=
 =?utf-8?B?bWRJUT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGc2aVFDWmJrS3d6ckF5ZUNpS2RmeDFLTkQvYUx0TXFkMXhGNWR5YSsxdzJs?=
 =?utf-8?B?V3hHWGNmNFVJdUMzNC9tMEVQMU1ocE14K3pobEhGdXcyLzRtRjJ6WDFpOTcz?=
 =?utf-8?B?bjdtdG0yZkZFNyt1cHAxSW5LK3VYNERmNHVCMU1YU3BRY1IzUmhHVTlmUzJP?=
 =?utf-8?B?WUVLUFkzanZPNTRWYmxpTHJRQVhJV2hmdURJOGo2QkQ1Y3hEbW93ZGtJVUhk?=
 =?utf-8?B?a2MrTlgrUi9xOFpGOEd2TXpoVEFOeWRmRmRUTlQ5OHFSeTdZejRXYm52SVdL?=
 =?utf-8?B?dWdFQ04xbE0wZGQ4WmlwTytGcGd2bitVMmIxNTA0VHJUbWJaSERidUttSVln?=
 =?utf-8?B?SFRJYkNZZFp0VkxFMmNlSGd6aUNHMG5Eb1ZJRTF4cDNTbml0OXZxV1VZUGRu?=
 =?utf-8?B?YzdGUW9wVzZzT1Z6ekpGcUNOY1h2Q0cyelJKS2RlKzBTWld2aUJuNGsza0hZ?=
 =?utf-8?B?RzZzbys1ejJIUFlOaW11cEVaZC9ObTYwM21LZ1Jza0RXVjZVMjdudWtYdDRi?=
 =?utf-8?B?anQ3VnJKY3JjM1BsdVlKSlVicnp3UUU4MXFITi91YUgrWVl0QjMyRktzc0pQ?=
 =?utf-8?B?dFJzZWR5RERLZzhDQTJ1bmU2OFVmTE1nL1lnOFMwT3ZpMXAzRlhYUldCbStU?=
 =?utf-8?B?cW8vRktZV3NLYm45MnlHNjZPRllDbnpGS1UrNDBnZ2g1RlhKYWVCU3FhR3pQ?=
 =?utf-8?B?c3RIMzgyVUdDZUZOTmVqRUlwcHRCN200Y09UZzN4S0VxNGcvNXpaUlVMT0hm?=
 =?utf-8?B?R0tyck4rRDhtMG1IWmdKVCs5eUU4WTlPRXRQZHhQelNTdkxsaGNKcFlwZEVn?=
 =?utf-8?B?dVVvUmZZWnVwMmpSbjl6QmtmVlVsbGs4SG8zd0tjek1vbmxUOG9wTUw3YlVi?=
 =?utf-8?B?SFZjQnpUeTJVblkzb3BSWjFRTlErcDFJN0R3b3lOSkVzN3NDZ1BlUE9zYnp3?=
 =?utf-8?B?R1hzWVF3Qk9aTk90cGNkYXZpTTd2bFN3aWVkZzQrYlJweXFSTVZEZElVaVJX?=
 =?utf-8?B?NENYQzYrYzVML29iTktkT1k1MWoyc241YlA1cmVhRkUxQ3dZU2x0bkNOd0dl?=
 =?utf-8?B?TkVPMHJIL0dnYXg5TDZ2OExpR09GRk11TlNYMGRBVDNZTlhHOGd2cGhpT3BU?=
 =?utf-8?B?eG52dXV2ek9vckg1TWtEajZrNU5jdC9yeGhoVUNYMHA0ZFBoaHE2M2g3Q3pG?=
 =?utf-8?B?QmhtdHRpeHArSjdaT0Q3ODBWWWdIUTNCdmdqdTIwRCtDWWhiUzVtR1kwekJs?=
 =?utf-8?B?MldMc2oyVlpjNWRMZlZwSkowMU9DTlR0K0krdFRkUitveDRpUUFjZkUvSXc1?=
 =?utf-8?B?QnZwK0xkWkxwYndVS0h2QTZUcGhGUGxreEZ0L1BsR2h2VWZ5emQ2ZlE3Rjla?=
 =?utf-8?B?Sjd6d2toaWhFV1ZpSGVhWE1KZGF3VlYyUjNJbjFRNHlWcFVWUG96RmZjM0U1?=
 =?utf-8?B?V0R3R3NyeSsvMDhvMXdxVThFUVNoWWdneFRoWFQ3VEFWbTg0RjlOODkrZnlX?=
 =?utf-8?B?cEQ3dGFLSjhBOUxYbzIrRGp5SE51WWlqSWtzVHVncUIvdkdDUjNEMlNZczNQ?=
 =?utf-8?B?QzUwVW05MTFwdHRPYkhKQkwyeHZtTjZSajFZUnlzUEhaWnVTc1d3ZjNxQWdI?=
 =?utf-8?B?eHJuY3k2blNkaE4ySmJVeCtIckFyWDk5aDk1R2FMSHozQzV1d0lRZzltZ1cw?=
 =?utf-8?B?N1BQN0psRmVSVFJ4Zy9rU1I0NUJPcUV5Q3ZYaytMZlRxQzg0cmNOSmh1UmIr?=
 =?utf-8?Q?ttZaD5wiAwzmbZwiGM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b3846962-74b2-413b-34cc-08dd5495b9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 05:40:19.9401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PPF1F03EA81C

SSB3YXMgYWJvdXQgdG8gc2VuZCBzb21ldGhpbmcgc2ltaWxhcg0KDQo+IE9uIDI0IEZlYiAyMDI1
LCBhdCAxMTowN+KAr0FNLCBBbGV4IEhlbnJpZSA8YWxleGhlbnJpZTI0QGdtYWlsLmNvbT4gd3Jv
dGU6DQo+IA0KPiDvu79SZW1vdmUgdGhlIGZpeHVwIHRvIG1ha2UgdGhlIE9tb3RvbiBLQjA2Nidz
IEY2IGtleSBGNiB3aGVuIG5vdCBob2xkaW5nDQo+IEZuLiBUaGF0IHdhcyByZWFsbHkganVzdCBh
IGhhY2sgdG8gYWxsb3cgdHlwaW5nIEY2IGluIGZubW9kZT4wLCBhbmQgaXQNCj4gZGlkbid0IGZp
eCBhbnkgb2YgdGhlIG90aGVyIEYga2V5cyB0aGF0IHdlcmUgbGlrZXdpc2UgdW50eXBhYmxlIGlu
DQo+IGZubW9kZT4wLiBJbnN0ZWFkLCBiZWNhdXNlIHRoZSBPbW90b24ncyBGbiBrZXkgaXMgZW50
aXJlbHkgaW50ZXJuYWwgdG8NCj4gdGhlIGtleWJvYXJkLCBjb21wbGV0ZWx5IGRpc2FibGUgRm4g
a2V5IHRyYW5zbGF0aW9uIHdoZW4gYW4gT21vdG9uIGlzDQo+IGRldGVjdGVkLCB3aGljaCB3aWxs
IHByZXZlbnQgdGhlIGhpZC1hcHBsZSBkcml2ZXIgZnJvbSBpbnRlcmZlcmluZyB3aXRoDQo+IHRo
ZSBrZXlib2FyZCdzIGJ1aWx0LWluIEZuIGtleSBoYW5kbGluZy4gQWxsIG9mIHRoZSBGIGtleXMs
IGluY2x1ZGluZw0KPiBGNiwgYXJlIHRoZW4gdHlwYWJsZSB3aGVuIEZuIGlzIGhlbGQuDQo+IA0K
PiBUaGUgT21vdG9uIEtCMDY2IGFuZCB0aGUgQXBwbGUgQTEyNTUgYm90aCBoYXZlIEhJRCBwcm9k
dWN0IGNvZGUNCj4gMDVhYzowMjJjLiBUaGUgc2VsZi1yZXBvcnRlZCBuYW1lIG9mIGV2ZXJ5IG9y
aWdpbmFsIEExMjU1IHdoZW4gdGhleSBsZWZ0DQo+IHRoZSBmYWN0b3J5IHdhcyAiQXBwbGUgV2ly
ZWxlc3MgS2V5Ym9hcmQiLiBCeSBkZWZhdWx0LCBNYWMgT1MgY2hhbmdlcw0KPiB0aGUgbmFtZSB0
byAiPHVzZXJuYW1lPidzIGtleWJvYXJkIiB3aGVuIHBhaXJpbmcgd2l0aCB0aGUga2V5Ym9hcmQs
IGJ1dA0KPiBNYWMgT1MgYWxsb3dzIHRoZSB1c2VyIHRvIHNldCB0aGUgaW50ZXJuYWwgbmFtZSBv
ZiBBcHBsZSBrZXlib2FyZHMgdG8NCj4gYW55dGhpbmcgdGhleSBsaWtlLiBUaGUgT21vdG9uIEtC
MDY2J3MgbmFtZSwgb24gdGhlIG90aGVyIGhhbmQsIGlzIG5vdA0KPiBjb25maWd1cmFibGU6IEl0
IGlzIGFsd2F5cyAiQmx1ZXRvb3RoIEtleWJvYXJkIi4gQmVjYXVzZSB0aGF0IG5hbWUgaXMgc28N
Cj4gZ2VuZXJpYyB0aGF0IGEgdXNlciBtaWdodCBjb25jZWl2YWJseSB1c2UgdGhlIHNhbWUgbmFt
ZSBmb3IgYSByZWFsIEFwcGxlDQo+IGtleWJvYXJkLCBkZXRlY3QgT21vdG9uIGtleWJvYXJkcyBi
YXNlZCBvbiBib3RoIGhhdmluZyB0aGF0IGV4YWN0IG5hbWUNCj4gYW5kIGhhdmluZyBISUQgcHJv
ZHVjdCBjb2RlIDAyMmMuDQo+IA0KPiBGaXhlczogODE5MDgzY2I2ZWVkICgiSElEOiBhcHBsZTog
Zml4IHVwIHRoZSBGNiBrZXkgb24gdGhlIE9tb3RvbiBLQjA2NiBrZXlib2FyZCIpDQo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXggSGVucmllIDxhbGV4aGVucmllMjRAZ21haWwuY29tPg0KPiAtLS0NCj4g
ZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMgfCAxMSArKysrKysrLS0tLQ0KPiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaGlkL2hpZC1hcHBsZS5jIGIvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMNCj4gaW5kZXgg
NDk4MTJhNzZiN2VkLi5kOTAwZGQwNWMzMzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2hp
ZC1hcHBsZS5jDQo+ICsrKyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jDQo+IEBAIC0zNzgsNiAr
Mzc4LDEyIEBAIHN0YXRpYyBib29sIGFwcGxlX2lzX25vbl9hcHBsZV9rZXlib2FyZChzdHJ1Y3Qg
aGlkX2RldmljZSAqaGRldikNCj4gICAgcmV0dXJuIGZhbHNlOw0KPiB9DQo+IA0KPiArc3RhdGlj
IGJvb2wgYXBwbGVfaXNfb21vdG9uX2tiMDY2KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2KQ0KPiAr
ew0KPiArICAgIHJldHVybiBoZGV2LT5wcm9kdWN0ID09IFVTQl9ERVZJQ0VfSURfQVBQTEVfQUxV
X1dJUkVMRVNTX0FOU0kgJiYNCj4gKyAgICAgICAgc3RyY21wKGhkZXYtPm5hbWUsICJCbHVldG9v
dGggS2V5Ym9hcmQiKSA9PSAwOw0KPiArfQ0KPiArDQoNClNob3VsZCBiZSBtYWtlIGEgdGFibGUg
aGVyZSBzbyB0aGF0IHNpbWlsYXIga2V5Ym9hcmRzIHdobyB3YW50IGZuIHRvIGJlIGRpc2FibGVk
IGNhbiBiZSBwdXQ/DQoNCj4gc3RhdGljIGlubGluZSB2b2lkIGFwcGxlX3NldHVwX2tleV90cmFu
c2xhdGlvbihzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dCwNCj4gICAgICAgIGNvbnN0IHN0cnVjdCBh
cHBsZV9rZXlfdHJhbnNsYXRpb24gKnRhYmxlKQ0KPiB7DQo+IEBAIC01NDYsOSArNTUyLDYgQEAg
c3RhdGljIGludCBoaWRpbnB1dF9hcHBsZV9ldmVudChzdHJ1Y3QgaGlkX2RldmljZSAqaGlkLCBz
dHJ1Y3QgaW5wdXRfZGV2ICppbnB1dCwNCj4gICAgICAgIH0NCj4gICAgfQ0KPiANCj4gLSAgICBp
ZiAodXNhZ2UtPmhpZCA9PSAweGMwMzAxKSAvKiBPbW90b24gS0IwNjYgcXVpcmsgKi8NCj4gLSAg
ICAgICAgY29kZSA9IEtFWV9GNjsNCj4gLQ0KPiAgICBpZiAodXNhZ2UtPmNvZGUgIT0gY29kZSkg
ew0KPiAgICAgICAgaW5wdXRfZXZlbnRfd2l0aF9zY2FuY29kZShpbnB1dCwgdXNhZ2UtPnR5cGUs
IGNvZGUsIHVzYWdlLT5oaWQsIHZhbHVlKTsNCj4gDQo+IEBAIC03MjgsNyArNzMxLDcgQEAgc3Rh
dGljIGludCBhcHBsZV9pbnB1dF9jb25maWd1cmVkKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LA0K
PiB7DQo+ICAgIHN0cnVjdCBhcHBsZV9zYyAqYXNjID0gaGlkX2dldF9kcnZkYXRhKGhkZXYpOw0K
PiANCj4gLSAgICBpZiAoKGFzYy0+cXVpcmtzICYgQVBQTEVfSEFTX0ZOKSAmJiAhYXNjLT5mbl9m
b3VuZCkgew0KPiArICAgIGlmICgoKGFzYy0+cXVpcmtzICYgQVBQTEVfSEFTX0ZOKSAmJiAhYXNj
LT5mbl9mb3VuZCkgfHwgYXBwbGVfaXNfb21vdG9uX2tiMDY2KGhkZXYpKSB7DQo+ICAgICAgICBo
aWRfaW5mbyhoZGV2LCAiRm4ga2V5IG5vdCBmb3VuZCAoQXBwbGUgV2lyZWxlc3MgS2V5Ym9hcmQg
Y2xvbmU/KSwgZGlzYWJsaW5nIEZuIGtleSBoYW5kbGluZ1xuIik7DQoNClByb2JhYmx5IGNoYW5n
ZSB0aGUgbWVzc2FnZSBoZXJlIHRvIEZuIGtleSBub3QgZm91bmQgb3IgaGFzIGludGVybmFsIGhh
bmRsaW5nDQoNCj4gICAgICAgIGFzYy0+cXVpcmtzICY9IH5BUFBMRV9IQVNfRk47DQo+ICAgIH0N
Cj4gLS0NCj4gMi40OC4xDQo+IA0KDQpUaGFua3MNCkFkaXR5YQ==


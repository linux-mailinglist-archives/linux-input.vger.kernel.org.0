Return-Path: <linux-input+bounces-10623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60048A56761
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 13:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AC861898500
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ECC209F4F;
	Fri,  7 Mar 2025 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="qDs3CHLL"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011027.outbound.protection.outlook.com [52.103.68.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E0192D7C;
	Fri,  7 Mar 2025 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348894; cv=fail; b=LBVTeMdGd15vB5aHta/xWh2XWdC7f6YxlqHE6f3fMvOh007MlML8Ew1m89KvhB+ucne6fQhyU+Zj73yyIk9+2TC5zSBvS3KOHmOJOlvileHqKeVdXPd7lwCgoWLBrO1ElZ+d9Yb1m3bw9qoT7SDPh5ozjxZgnM1NAIomZJecK2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348894; c=relaxed/simple;
	bh=UPMYZ5YoX764auL4Aia2ng4ezAZiMABE4RPxYCtvAjs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jxXSr8VeamqWCO4J/cu11SId+ITyx5/+h2xmYnCHNXf7rxThxJXWqEg99RhcnsSbghwHdu4Vdhfwifmi8O0XC8QjaveX3GMqyNGH1EGcXLTZClEN06CsI+g4lszqwFlXQCBTK5gBMjW7eXqLmx2grN3iwz+1cc1YMFHb0nejFdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=qDs3CHLL; arc=fail smtp.client-ip=52.103.68.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRXm/0qShkaAyLIQ8loWY8gkRdmVLgqy2VLKPFz99uu8MGiEHM7EjYWQ1x8UPFmYBUbkOD+pX8BhPBEBD0LSkag/I1IiVqisuRFBxnN1660HhHgCsiOMpuFP5IABXLnWDn/42B+S3f8uJYHwo7AEiq6CqbpwCm1maPQBcagUTbWyzU29pZBXhf+vqoQlJjerK8EYUQVa2xrymZQggYS6vEm2/rJhWLwQU6h9zYcSmU+VBwvj1qEr19GDW7/uedR8d49T047CJjOODt1eBn1NdIweyqjpH50TUReJSsRJ39X4fF/mBuCMNoCq0VwRY4AGOnxx8bCftEVKNBhqcAfQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPMYZ5YoX764auL4Aia2ng4ezAZiMABE4RPxYCtvAjs=;
 b=rmLER8bF6fZDsP5jpTwHvqKRQxe2qK9GIekeaW4qySCWiyOSIRVWs0wtsXmGjygC70oKa5xL+Q3LUfur0fuk9oDJVm9KMKZVSsaDWZnC91K8MZaNk0uCIWkcP4hyTX8tFTYBA2SV30xhoVV8exP5FWLOS9devj5fx+N95ua7dlBg1AHILaKnJWOROV5uC3ofTosPvCkr0oO28J3X3kOhVNfmQzGKbHJbqwVdi202T/KcwnaMmh6apbl7Wy6IaDHV8YT7qrcSk9y82YlrR73PFtFECXobpciCErOTbKx1Ei8j71M0UAVAWZOWhF0ES37eo0OBtLHnGCOV9cV5a9XyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPMYZ5YoX764auL4Aia2ng4ezAZiMABE4RPxYCtvAjs=;
 b=qDs3CHLLv3eD0xysUFucdXrS4i4/Cx1c7Z1sVEpl/R2Il2H+V0v6oJf07vJvM/62ABId6rNHgWtLAbarpV8fOUBCHfyjDYQi/V6F2+Cv75N+9BXCvZwSOukatCXdU/2p+pMAdrLogA3stCbchIMBUxfveTHRHtTbePF28F5FFPMl6IoY4ONGYzU47NvTrP5sw6DvRQAqG90+e+LMfjGlKaLBwdSw1ZBt8VEt5pEjMrwpXPDX/yvREP30uMQXDug/LQIdEFGiBE8I8BaBaGmX2gtfRMN8xGdR0szA7m08ghZXpT85OG/6e1+GZ0KonPCYjGMO8FjpegTjSS7ALO8BNQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB10324.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 12:01:27 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 12:01:27 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Thread-Topic: [PATCH] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Thread-Index: AQHbjYP8f9SYcaFRwEq0mpP4e7ikXbNnljoA
Date: Fri, 7 Mar 2025 12:01:27 +0000
Message-ID: <58CD6E8C-DCA0-43DD-A9F7-821C596D21C6@live.com>
References: <4CBC715A-59C2-4815-8D90-62683850E176@live.com>
In-Reply-To: <4CBC715A-59C2-4815-8D90-62683850E176@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB10324:EE_
x-ms-office365-filtering-correlation-id: e26d3b06-6490-401f-eea3-08dd5d6fca6a
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|8062599003|461199028|15080799006|7092599003|3412199025|440099028|10035399004|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?dS9YQ1QvSG9TdTdSUExKRTVSTUltYTN6ODZhbkFpNWRhVTV5MlJ1bi92cXR3?=
 =?utf-8?B?UDFmeHF1LzdnbFdkOTV3MHRRRFhKQ3F3MHpoVE9XWVZSODROZzVDNGNtM0sr?=
 =?utf-8?B?aDlUQmRNNEJieUp5K1lTVXQ3SFlSK0E4c3AydVorMjhnSStQMUlwVDJ6cTFU?=
 =?utf-8?B?ZFBuSmJLVFpjYjFNR3BJUVhRYS9tYUhHcDZsTnNEQy8vc0U4M3ZaWVFRUzlj?=
 =?utf-8?B?SndBSWkybXhMTUViM1lOaFRjeWRDTWlZTmFVZXFKM2NTbEZsR3N5YXJFZitt?=
 =?utf-8?B?eUJGMGdTa3BUenQ0c1RWWFhvaDZERzh6alZnemMvRW8zaXMwVHhBWmFQaWxo?=
 =?utf-8?B?eS95dXdBLytrWDBYSjBJSlBLOXdVVkpDbXJCdGtxSzQ5YzlXb2hVSnlZQ3da?=
 =?utf-8?B?aVcrdGZyODlqaE00RE1yVjMwdUpWZXN5c1AwdmJsOTRqOHQxaWU2blYzRE9o?=
 =?utf-8?B?WWk0WXVVRTBRUk8wTUtkZjMvVVN5ZFBRZXp4aGpsOTRYdzVQbVo0c2FieU4z?=
 =?utf-8?B?Y3RscFJJbUluOUtRZkI3NU9OUFE3ejFhM0xvTlQ4OEdsVzd0S21GTm03LytG?=
 =?utf-8?B?Y0NKek81TmRxNVJicVJad3I0b3NQd2dydTE0WWtaK256b0ZIYWdGY0FYcE10?=
 =?utf-8?B?d1pINkdzOGo1OTlWdEQxWG16MXRuTURabFgxZXFHcC9SZUk0K2JwWUpVYzVo?=
 =?utf-8?B?THBaK085TVp5Q0toMG1jL21ob2NOcE9sK2VlZXk3Q2dJV2pMNHR4aW94dXB1?=
 =?utf-8?B?Kzk0cG45YU4wdjZ3WW9QdnFsV2NuZ1VvZUc2L01HWHBMWVVqcEZQc0t6SDY2?=
 =?utf-8?B?ZjBVc2NtR1hEditTeGFnRG1RMFFqcVl5SkNjZnVOQithOWlZZEh5WUJXVmFw?=
 =?utf-8?B?SG1Sb00xY21OS1FpK1QwVXZxWE1GL3FhT0RONk93NFhjdDJRZVpQbUl5Tm9O?=
 =?utf-8?B?cTBsdHhrTXJkOWF0YkhWREI4TEVDWHdzMkRoRlFzNmFiRjZhYnFzRi9NRW04?=
 =?utf-8?B?alNLK1RYTW9MeXo4V3oxbzNQa01IMUt0d25NbHo4d1ZkcmZmcXI4cVpOSWsw?=
 =?utf-8?B?UjNOMmdsVUVIaWpxWjdxdEd5ZFJQWG5oZ0xjZUhtZ1RvUWRDd1BEcUZFenJL?=
 =?utf-8?B?L1cxcjY2alpOLzFJbm9vWEhlRVE1UnVERFpjUlBTWGxoaUozVGN6U2tJdEZv?=
 =?utf-8?B?TlBEaDYxL04rZUhWMW1adlcvZFNOQ0F0NFIxdFhQcEtDRTIrL1dSL2U4SWg2?=
 =?utf-8?B?NDNCNWhHMmRrdVdEcGozcm9QS1ZvWUxTNUVoYURYbGh2aG9tbDU5QlNqR1hO?=
 =?utf-8?B?dnJqdXMzbnVXRU5iVVZFUWd3UTZYTk5QZ09TdStYMHZ4Y0ZZRU1sbkszSkhV?=
 =?utf-8?B?d1BYTlJsck5odmZVWDh5d1pNcDBtb2djZkJhMEVXWklONk42MjJNa3k3MEdG?=
 =?utf-8?B?NXZsWVJ1Q1R1cE1oZldxN0E0d1Z6R2ZLV2pTQkxVS2RBOUErbmRqSUwxT3kv?=
 =?utf-8?B?YzZnbGw3anVyRmZ6bldlOWg3MklCSWlNTFk4WHg0d1V1L2JSeXdDa3hWQmhN?=
 =?utf-8?B?ZmdPeklMcnJnVUhiUGpmL2hQN0ptcVdtWm9XdnNZUWFLYXN0bmhFaXBiSlgz?=
 =?utf-8?B?L1BaZVZTRkdRVzM4U3BFdDJBWUxiT0E9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0RHcXpqWVExcXREL1dtbmRoTmdKVW9TOUQ4SzVJZUtpcWI3cVhFTHgvOTFM?=
 =?utf-8?B?eWE3bmkrM0NiYkdBY29lR1VONVRrWWlGYU1pVUdQTDczRm9yUmxDdWRmTEtQ?=
 =?utf-8?B?QnIybkNuZ2xhUVgzZ3E5OVVIZVdoMGFKTVo1Wm1GdVlOYndqak5SMDVhODFE?=
 =?utf-8?B?RVFjL1dpTllqNWRydnlEZHkzU2M5eVJzdGdMM2NrdkVLTW4zRm95S1k4Vjk2?=
 =?utf-8?B?NjBLOTduY1FxRkExY2tIa3pRZUdTWDlmdWFqbzc2UUlCZHU3dG1aOW5qS2dC?=
 =?utf-8?B?bG1DNnJZUzdQQ2tYNml4angvdE03azNzV24rV1JtRHVJTytOQ284a05nUmJl?=
 =?utf-8?B?aUJOMGphUVF5UTdjaHVIM1R6WmtScGp0QUYwdHJZNWR0S1JnWFpReC9jdUZl?=
 =?utf-8?B?cTZVeHFiT0IzaU1vc1lzTU0zUkEzQmFLQmw5THlLNjdDZVhhVVk2Um5KeUdW?=
 =?utf-8?B?TGRLZk1HbTg4T1JNaGFKcUlhdWloUnlLTkYvWGZwNC9GSktOOUhoL3VMdlZ6?=
 =?utf-8?B?d2JjK2YwNXZ3ZmpWUTRkdDVkaEN4bVVuSnNlQ1JuT3BwbUk5cXc5R1pBTlJM?=
 =?utf-8?B?OEpiU2thMHVOVXkrZ1pNbytaMy95U01aRmc5c1k4Qzh6aU1TMEpkTUxOMXVn?=
 =?utf-8?B?aFZGbHlhVlhKQ2hYT0JHNkkzU0sxeXFLRXlWWVFBM1JBem8wRFBrb0x4UjZt?=
 =?utf-8?B?TEllQ0ZURmQ2T0xCUStqZFJKS08yV25qUmZ0WjVidzlLbmVqNi9FbDdHL2M2?=
 =?utf-8?B?dHlQa3ZiM1M2MDBlbTVpT3d0VURQS0NCRXRKSWJPeEhSWStHbldNWnM5ZWJ4?=
 =?utf-8?B?Sjh2UmJaYyt6QTR0TXAzNjlENmZMU3hvZUZHYTh1Z1l0aGlTWU5PY0tpL2FG?=
 =?utf-8?B?Qjc4Z293dkJVbmJtMnlXL3V2aVEzWmhONTZFSFVqTHpSZmtZa0srTWFZalpM?=
 =?utf-8?B?SEh3ZkhFd3JDaHpQR2dIRVhzczZTYlV2ekVJY29SSFNjYVZRMW1qYzI0UlFL?=
 =?utf-8?B?cnR1SmVaN3hhL0VIS2Yxb29oVlM1OUk2M0pkYXc0WnNDR3VoTllHRTFraG5Z?=
 =?utf-8?B?TzB0ZkpuelpoMk5mSytpREVTYlpQbVROc05aNldtbmdyWUE4UkdXT2IvRkMv?=
 =?utf-8?B?Z1ovWUc2bWdOTWx2UGprc1d5bkxkY2crNmZ2djdWSnlwOUlkQjRnd0UrZ2sr?=
 =?utf-8?B?ckUwb1VzVmtyYkdRTFV2NGxUTDl1MCtiU2R1NmlyQVhMY1FzZ2x2Zm0xbVpj?=
 =?utf-8?B?TjJEK2g5ZHNGUkl0cTdHbi9Pc3pVOWZNWFlaR1lCYjdpM1RJMkZzeTVQcWJk?=
 =?utf-8?B?NXNaRndQMTdJLzRoNmYrNDgvNlNaL21kMkthT05QbFVaQ0dxd3FtQXoyeGhR?=
 =?utf-8?B?SisxRGJLbFFxaVNyQzUzV0JwUDhPR3A0Ukg0ZGFRMVZKVFpwRGxxRUY4cTdU?=
 =?utf-8?B?bkZkMjIwcTFzSGl1dE1uMEU1WlhwZmdtMXRGdSszUFdKWEVRTHBsMWNDckM1?=
 =?utf-8?B?L25Na1cxU1NPT2pDTlkzTFhWOTQxYy9SQ3JOMzREZTIzUTRybjJTeXV1dEtV?=
 =?utf-8?B?d3pKUWwzeDNrMkc1SlgxWUxQaXhIckJzZTljZkpGWjZ3Ujl5Y1lZT2RYV25j?=
 =?utf-8?B?c2FqbmxlTVRNR0pGTk15SVkwNEFpVWxmaGlWQndSZ0hMM2xYZC9SbzFoeVdT?=
 =?utf-8?B?NE9hUkMydFZaQXQ4cWJvTDRjcEJoTmMwVTNWM1pLb0N0SEJxTHk1VDVYSjRt?=
 =?utf-8?Q?sLsVbuk14lIxhnLOgZkxtQtwxkOPuLisfkq1oMx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85BFFD830E986046B02BFC5513431568@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e26d3b06-6490-401f-eea3-08dd5d6fca6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 12:01:27.4960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10324

DQoNCj4gT24gNSBNYXIgMjAyNSwgYXQgOTozNuKAr0FNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5
YTA4QGxpdmUuY29tPiB3cm90ZToNCj4gDQo+IEZyb206IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlh
MDhAbGl2ZS5jb20+DQo+IA0KPiBUaGUgQVBQTEVfSUdOT1JFX01PVVNFIHF1aXJrIHdhcyBub3Qg
dXNlZCBhbnl3aGVyZSBpbiB0aGlzIGRyaXZlciwgc28gY2FuDQo+IGJlIHJlbW92ZWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KPiAt
LS0NCj4gZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aGlkL2hpZC1hcHBsZS5jIGIvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMNCj4gaW5kZXggM2Q3YmVm
ZTBhLi5mZGU0MzhiZWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jDQo+
ICsrKyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jDQo+IEBAIC0zMCw3ICszMCw3IEBADQo+ICNp
bmNsdWRlICJoaWQtaWRzLmgiDQo+IA0KPiAjZGVmaW5lIEFQUExFX1JERVNDX0pJUyBCSVQoMCkN
Cj4gLSNkZWZpbmUgQVBQTEVfSUdOT1JFX01PVVNFIEJJVCgxKQ0KPiArLyogQklUKDEpIHJlc2Vy
dmVkLCB3YXM6IEFQUExFX0lHTk9SRV9NT1VTRSAqLw0KPiAjZGVmaW5lIEFQUExFX0hBU19GTiBC
SVQoMikNCj4gLyogQklUKDMpIHJlc2VydmVkLCB3YXM6IEFQUExFX0hJRERFViAqLw0KPiAjZGVm
aW5lIEFQUExFX0lTT19USUxERV9RVUlSSyBCSVQoNCkNCj4gLS0gDQo+IDIuMzkuNSAoQXBwbGUg
R2l0LTE1NCkNCj4gDQoNClRoaXMgcGF0Y2ggaXMgbm93IGEgcGFydCBvZiANCg0KDQpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1pbnB1dC9BNEZCRUE1NC1DN0JBLTQ4NjQtOUM0RS1FNDE5
MzNEODFGQjBAbGl2ZS5jb20vVC8jdA==


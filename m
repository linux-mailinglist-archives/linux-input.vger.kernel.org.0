Return-Path: <linux-input+bounces-10200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E76A3C566
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A481882117
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546E920E718;
	Wed, 19 Feb 2025 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="lyRi8KNC"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAAE20E022;
	Wed, 19 Feb 2025 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983430; cv=fail; b=s6IYnQc/b5gj1WbdgyiQk2F5FG+FOTb2ssh/GZDlF9PRIxqDSisV22CdPhm9ArDEFpqy9Yu17DwaLCBEUlRiRJI6qbWHhCh9MRJfhZRQRqYxexeAyK5MSvpeN16CusiUe5Z6wO9dcYYGBS8n5TSBEwjQVEHllLPxVcQZ/cn/dAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983430; c=relaxed/simple;
	bh=VkdMfjtzR95fE7b1DMZl/jptC98nOAOIeVAwb9jt3Kg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s+c/F1wWzR4jXO4whiIkh6yfD/P7vq0rc2YdeCR8NxBPPfE5VeCrz50fBJFqn+fhMqEBkg8NfnR9Aq13Qgvfq0aY8p7eyKSo+J17+5PUQvdLVE0KDyC+AQQs132wIJbPrcWKhvJtOTwGPQDq0QbwLoZKMxmsuqdvHYBYxC2juf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=lyRi8KNC; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8jOXib1ZPxQlsewusmzMuEmJROhFjbdwPoIcOebvnqDH3nTbFwRww3cmNXq9WrHSeKUN13O5AKzGdzMLvmkfz6c0IR9Rmoo/TSsmv5ZfqPDjqBcfyGFgmO1WUD+sUhR26wSPVH/dp7CRh7d8J15hrCkbukpv4AdiYK1GVXFsfjxQMMrCtxESTXTvrJS1ezUhzEo2BspYwJiwpxqjmAOLNfw9VOA+p+M/kW4D85F641+/qLePw2HdKH7a7Gab1MLds5kp+DafAWNNryrXuz8LOr0/eqoEfjg3emllEAIPM/vcTUNOIHjFFvF54p5kwEtzdq1xAhFUWFRvrSHBkOmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkdMfjtzR95fE7b1DMZl/jptC98nOAOIeVAwb9jt3Kg=;
 b=wpP8QUCkWJVh8Py3CAzTLKUfMBlc9hgtZRFEqTh3z14jzluB9N07fZkNSChoJFXeBvWWqyzifK3Nqh9J5g6/eF2WuMDJzDoJqiyelONTXy/TWsxKQQ532JXX/3GdcaXiFBSlbgM3SqAEaVZ/U18eAfLr57oc5kZpGOEHH4IlIdjNZfBPLTBKJHhqXRixggwkCNF52IVRFtkTOuBDsBMu4F5Fs6zXoYCcG/0yDnpzxRdjW0E4KkNj4H+HaPQyvx9vEy2madW/Hbm1NY/81lmuCRZSrqrKwNAPzHpsa3pph01oFCUIGu1hQwQm2TwZV0kBS7X4BZSc0VEzDOZLfXEFDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkdMfjtzR95fE7b1DMZl/jptC98nOAOIeVAwb9jt3Kg=;
 b=lyRi8KNCNv9YA1VAaDU/dJstoaQJWlMn0TIkLhqO3LhiLd7YnMsQSfqoMS2wVvhXQzcyFt24aHh+gbGYAbK6eSyVKHgoNzmuJDk5dskrbfbvsLXksT/FCUEpvZqa2WnlzHOOdjsTZP0IGLUk1ve6cu5vWeeYd2/xsWhUlYFtmDcMKkukHzvH3RqFwpg5rm8TGrdzh6DeEUlZ4fa53v5bPAOI/qgVLTZW7keecGhg99II9c7kFaID0n1gotibA/0ZHpw6NQUFk0qmEqB12urHMkwUOQKA8enzAG13qxZfm5hk7EK3R4Trk2X3pYYcgndrc7Timc15q+7iEopi+IBJSg==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA0PR01MB7692.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 16:43:43 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:43:43 +0000
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
Thread-Index: AQHbfsf5ZtYaSMawFkyOk+zY5ixT4rNNgbwAgAACZQCAAVkteg==
Date: Wed, 19 Feb 2025 16:43:43 +0000
Message-ID:
 <PNZPR01MB4478D643BDF2E13B9BD20F5BB8C52@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
 <p3r8538q-11op-32q6-43p7-2n3941126n51@xreary.bet>
 <AF7B572F-F5E6-45A5-9B6F-3C0F763E6E4B@live.com>
In-Reply-To: <AF7B572F-F5E6-45A5-9B6F-3C0F763E6E4B@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA0PR01MB7692:EE_
x-ms-office365-filtering-correlation-id: 7147797f-da6d-4c78-18ef-08dd51049229
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|6072599003|461199028|15080799006|7092599003|8060799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?UFkxM2dXU0U5S21nU0JjOXNnWVVYaVFUeWJIUVMxdjNoZWh4LzdJZG9BL1Ni?=
 =?utf-8?B?a28wSm1FeG1tb1E3RjdtaHpIa1R0cUd3U0k3Z3V2SHJYQXJ4eVdWZkdxUkc0?=
 =?utf-8?B?OElWalZCTzRheUNQNGZQMU5vcG84YVVMYU1hTTlDbHFjbk4wYnYwY0QwQndR?=
 =?utf-8?B?bk5PdEhTajNhM25laEJyWlM4ckUxcDVObE9sSUJ0OVBFUWNYVUFzNEQ5Q0dT?=
 =?utf-8?B?OGloZUFkZXV2cU81cno1RGJaMUlBdWZ2UGNkRUtYODNsSlpoTjgyS0ZWeE9o?=
 =?utf-8?B?WDY4SlNZd3k1aVgzcGpodWVSdC93Z090UjZOZkZyZ25wWWFCWSszQVZwTHN1?=
 =?utf-8?B?am5mODlDTkZpeGllbGgyRndJL1ZFRmJCWXQ0djdPd0ljVHlnMytQdUdCRWxr?=
 =?utf-8?B?RkdoVEpkay9PRTJFUDdqbWZCekh3R0NlWUYxUjRKVWtxaDk2WEhpRFJOSGdP?=
 =?utf-8?B?ZnNXTUxDRTI4UDZCUDkxa0VEeGZ5LzFvWk1oSXVQNkEwT3RaUllKOCtsQys0?=
 =?utf-8?B?NnFXY3lpbWZPc3EzYjA1VWljNTZiZE04NmdrR09lZVBVcFIxRkt4RHhIZFVq?=
 =?utf-8?B?R1EyamROVXYxNlo5a0ZNYWVxN3plN1pxQ0JqcDZwTncxVldPckVScHI5Z2Jw?=
 =?utf-8?B?N1o5d2Q5bk5zOWh1blBFeExtb2NyampvZ2V5U1JLWm1kZ3M2eXg5TnY3d2pa?=
 =?utf-8?B?NHllUGRKR0h5enVBeVRBT0hVNVBnOW95citZWVlqckRMZkdTd1FzVGxmTFRB?=
 =?utf-8?B?elk4djJXZnMxd2pGT0dLMWMzbUh5L2JJMlAwcUg0OXd1dFg5Z0Z3TXJWaDNE?=
 =?utf-8?B?TmN4N0Z6Tzl1N1ZpZ3Q0aTV3ZzR0aTBnSlhWZHNsd0F6bWJodFZvblpiMjVa?=
 =?utf-8?B?SjB0SUJxbXFmdWR6WlltcWtWUmd6eFdDQVFxejVjSlZQUGtuRk9sakI0Sks5?=
 =?utf-8?B?blBZM2NPOC9Od3Ywd0xwWGE0S3k3M0hZTnRlQlErN1ZlVTFTUmpocVBNZ3dG?=
 =?utf-8?B?ZVh3VHRIcFVxU3RMWnRuOGpGMytBRnE2WEdWd2V3bzlGSkhBK1V5QkV0K0tY?=
 =?utf-8?B?SW5rNXBrN0tHU3NsWnlwVXdJWnFzeTZkREY2ZCtUdGg3UEJ0VGV4MElZbzhm?=
 =?utf-8?B?L1hLMzBocm41cFg5ZjdzTjlNM1pwRlZTYlhtYTdieWZVYU9VcHhiakIwZmxJ?=
 =?utf-8?B?Vnp3UEtGb0NubUQrVmF6M2RSdlpHaGN0R0pOcFBteGkzWHhmR2Q5bGRaRnBi?=
 =?utf-8?B?NlE1dkh4bGRrOFBNYmdDMllhbi83WEJFbm93bUp1by9Hei9PSW5KbkswcGZF?=
 =?utf-8?B?UE1EUXVWcUJoWnZlV3k5dm56QWhmRmo1MjBaeFZIc1d3MndxWkdHOVZaaWhS?=
 =?utf-8?B?b3lreEVPUjVRWnFDU3ZJYWo1L01FOVRpTElHZm5jby9NOEJzN21Pa3ZRaUVQ?=
 =?utf-8?B?RGsybkxHMmlzV2YzVzZIUXJxSkkwQitLaW5pS1c1OTcrV05aT0srM3BSeUtE?=
 =?utf-8?Q?4Udb5s=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUFJTmg4WFZiazE0RjRTaEdQZ1Z6ankycHJQempSTmtzNEVCQzVvQ2s1Q3VN?=
 =?utf-8?B?a1FacVdiUFN0SHdEcGdWU2s3cmJERjNWeFNsUy9BVTRJV0hkaHp5RHFLQU1v?=
 =?utf-8?B?eGdqMThlQjVKQUxlZTZlYVl5OUE5UzNoTDhuem9ieWZ2bkRGcUhDK3ZVd25l?=
 =?utf-8?B?N0pvY1dyMWhWTEVqak14bVdueUx0UGFNelg4MDMyY0V0Qk9MTzdCbTZKcGQ2?=
 =?utf-8?B?SDZpSWdCSkJRQ2QrOTFyaHlGTi9XOHNTY2Y4YVllNCtLMUdpQnNkY1JSV3Y0?=
 =?utf-8?B?cEVNMW1RczBiNzlkKy9DamUycU55dlBmYTZoWDBZcEtMSWg2VnVWY0wrLzY3?=
 =?utf-8?B?MUdyOVBocVhqVUx6cFF5RkxVdHpxTS90a0dZOGUwSzBpZ25BVGREb0N2UGR2?=
 =?utf-8?B?Vml6QjJmalhBMEFwcnc4aTd2aFJWS0ZZNjFZQ2ZoRlkzZ21BMDkxSVh2V3Bw?=
 =?utf-8?B?S1BDWU9RY011TDNNM2dKZEZtQ3c2OTZFUG5rT0diNlAySHZQWTFzOHlxUmVE?=
 =?utf-8?B?Q0ZLSHJseDQ2OGVrMUMzSitFbmJJMmRJTUlack9KcXl0Z0cvd1p5UzhudElj?=
 =?utf-8?B?aUFtVWZuQnhUY2hMUWwvVEVEb0ZZR2hxb3ZZRkR1Q0tWdm1NNER6RmdYTTR1?=
 =?utf-8?B?VXN2MS91ZlQ0c0JXcXZYNUxCUzNOK3VuQVRNNUpVMDF0Z2R5NmhrZnNPNVZQ?=
 =?utf-8?B?dm56MFVEb3JJNWsxeHZ5ODVjbkFQT0dMWjVEcWNxNjBoMTBhVlFSK3lFVnZN?=
 =?utf-8?B?T3V3YWhpZW92WHpMWGYrMVFOZjZzdXRmRzAyY0NvSVh6aGYxSU53d2tRRlJJ?=
 =?utf-8?B?dGtlOG12Q2NsVUJNd2t1TGJWVjYvRE9ZV1liTUNJSlZaa2IwcER0M1VXVTlT?=
 =?utf-8?B?aWw5Y2xudFFFVTd4YldVNzNCbzlxdm1EOGxSVnc0ZUt6aCt2NlJnems0NTFt?=
 =?utf-8?B?UUgzeGdIRUg4SjN6RFpTYzVoMks1UXpSZDVYd0UxRW9VOUc0Um84bG5XMGxX?=
 =?utf-8?B?d3RNMHM2cWtmS24yWTFyb1V4ajlPeEd6ZDR6VDJ3M1Q3bUZZeHhnRWNGdFMr?=
 =?utf-8?B?ZkQ4Ulh1cm5XaXhGcWtJc2QvcVNyenoyK2ZLSmJ0cXF6UGVWeFNmbXBXTThI?=
 =?utf-8?B?OXhOZDdPLzF2MlZDdkIrTktHYm9ObW1uczhtYWJNSjg4VzIxUnA5MnVsRGNz?=
 =?utf-8?B?ajF6OVc4YUw1N29ydlArNGRneFc2Um5VUEdOazBlRFluaDU4TGpPZVRJTlhU?=
 =?utf-8?B?MUJGN1M0NFhVV3RBYWtEVEIxWm9lWmxNQUtuNXlHbWoyV1BBaUtKZ3JWOCt1?=
 =?utf-8?B?OVdCQUpaaXNKbXZWY21EVDIra1p3aGZmVHRRYWpjWTNjeWgwaGxncjFkNmdj?=
 =?utf-8?B?Rm5FVXc1UEpNdTIyaU5ad21pNzFRQjgrZy8vcWxKUklXOUFNcUNQU0ZwUTY3?=
 =?utf-8?B?VmtUMW9RSXc2dERydHpFUXh4NkI5dFpBTXVSdXpMNXRvTVZmSUthTDFJMktT?=
 =?utf-8?B?QW5mSTNUSUc0VjJFTXB2dll0U1NFWFNBS1g0SUR0dUFoM09VdlJTNmkxczB0?=
 =?utf-8?B?cW1hUjkxVjhiSW1qa2dDVzdqczc0M3U0VkNUK0xKVGFzanV6QkxLL0hpYVhm?=
 =?utf-8?B?UGRXaUFNa1dlZ2tWUXhxN3d1V250eHBVSEF0TGZZWG1JYWY0TExoSUJxYWpU?=
 =?utf-8?B?ejBLVWRXajEyL1JQb096WUxaYUdFSlJZY0JBbkswbmpwNllPNWpEeEN2M1E2?=
 =?utf-8?Q?1SeAR5dlR2LI1ImucE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7147797f-da6d-4c78-18ef-08dd51049229
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 16:43:43.0135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7692

SGkgSmlyaQ0KDQpJIHdvdWxkIGFsc28gbGlrZSB0byBtZW50aW9uIHRoYXQgdGhlc2UgcGF0Y2hl
cyB3ZXJlIG1hZGUgZnJvbSB0aGUgZm9yLW5leHQgYnJhbmNoIG9mIHlvdXIgaGlkIHRyZWUuDQoN
Cj4gT24gMTkgRmViIDIwMjUsIGF0IDE6MzjigK9BTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEw
OEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79IaSBKaXJpDQo+IA0KPj4gT24gMTkgRmViIDIw
MjUsIGF0IDE6MjnigK9BTSwgSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5vcmc+IHdyb3RlOg0K
Pj4gDQo+Pj4gT24gRnJpLCAxNCBGZWIgMjAyNSwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4gDQo+
Pj4gRnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4+PiANCj4+PiBU
aGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGZuIG1hcHBpbmcgb2YgdGhlIE1hY0Jvb2sg
UHJvcyB3aXRoIGVzYyBrZXkNCj4+PiBhbmQgdGhvc2Ugd2l0aG91dCBpcyBvZiB0aGUgcHJlc2Vu
Y2Ugb2YgS0VZX0dSQVZFIGluIHRoZSB0cmFuc2xhdGlvbiB0YWJsZS4NCj4+PiANCj4+PiBXZSBj
YW4gZWFzaWx5IHVzZSBhIGZsYWcgaW5zdGVhZCBvZiB3cml0aW5nIHRoZSB3aG9sZSB0YWJsZSBh
Z2FpbiB0byBvbWl0DQo+Pj4gaXQgZnJvbSB0aGUgbW9kZWxzIHRoYXQgaGF2ZSBhbiBlc2Mga2V5
Lg0KPj4+IA0KPj4+IEFkZGl0aW9uYWxseSwgQVBQTEVfSUdOT1JFX01PVVNFIHF1aXJrIHdhcyB1
bnVzZWQgaW4gdGhpcyBkcml2ZXIsIHNvIGhhcw0KPj4+IGJlZW4gcmVtb3ZlZCBpbiB0aGlzIGNv
bW1pdC4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4
QGxpdmUuY29tPg0KPj4+IC0tLQ0KPj4gDQo+PiBXaHkgYW0gSSBnZXR0aW5nIHYxLCBbUkVTRU5E
IHYxXSBhbmQgdjIgaW4gdGhlIHRpbWVzcGFuIG9mIDEgZGF5IHdpdGhvdXQNCj4+IGFueSBkb2N1
bWVudGF0aW9uIHdoYXRzb2V2ZXIgd2hhdCBhcmUgdGhlIGNoYW5nZXMgYmV0d2VlbiB0aGUgaW5k
aXZpZHVhbA0KPj4gc3VibWlzc2lvbiBhbmQgd2h5IGRvIHdlIGhhdmUgc28gbWFueSBvZiB0aGVt
Pw0KPiANCj4gSSdsbCBtYWtlIHN1cmUgY2hhbmdlbG9nIGlzIHByb3ZpZGVkIG5leHQgdGltZS4N
Cj4gDQo+IFJFU0VORCB3YXMgZG9uZSBiZWNhdXNlIEkgZm9yZ290IHRvIENjIHRoZSBtYWlsaW5n
IGxpc3RzLiBJdHMgbXkgZmF1bHQgaGVyZQ0KPiANCj4gVjI6IEkgd2FzIHN1Z2dlc3RlZCB0byB1
c2Ugc3dpdGNoIGNhc2UgYnkgYSBjb2xsZWFndWUgbGF0ZXIgdGhhdCBkYXksIHNvIGFkZGVkIDQv
NA0KPiANCj4+IA0KPj4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIGNsYXJpZmljYXRpb24sDQo+PiAN
Cj4+IC0tDQo+PiBKaXJpIEtvc2luYQ0KPj4gU1VTRSBMYWJzDQo+IA0KPiANCg==


Return-Path: <linux-input+bounces-10115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8CA3A85F
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC6B3A5A70
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BD71BEF7D;
	Tue, 18 Feb 2025 20:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="YTDUG56l"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010012.outbound.protection.outlook.com [52.103.68.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16A521B9D5;
	Tue, 18 Feb 2025 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739909130; cv=fail; b=XzxusobuYUg9VIXG8MX8ys0Vfe7SMOySlqoDlHyR2UcTzEtJ+KUA/+lo+GZJCD+0FY7g+H57j6/pyLKnh5WYxMGbaVa1OZ8ex0tMcTGjFXe+fuz/FKjf08OhbQvtTcGkOz9gSBclmoj5qq8EGhZQXl0cNfAepMpoKNa9I7NlQiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739909130; c=relaxed/simple;
	bh=FOvcA5V4YlqkqSNU1LYTdec5HlmL4CyIzQLvRVp1m/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ur5Hy9jPg0G8cSivWyzR1QzbJyqI9DOTOMxYZaKiIoLTZkl5alG+ELLgT0xkZPHT370azpA7yi1O9gWeiSmoK52WLXR2nRayhNFJSuaAl1/i5bg0BiycWhgJflZBUc4rW9y6nu8Ub9dzVvsltMphpoVlfR0vPTUss25GmT5dn7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=YTDUG56l; arc=fail smtp.client-ip=52.103.68.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKquBLPo6v+ig+KT2Fd9ud+WQ7Z0CvhWsgPjmvSiCZXqnNnW5XQ5Cwn8h6KH18OIaQVrarcl4BNhO1r3P9kFTT3E4RO02BQ70BUkl93ksSh4nl0ObOYMFZbsptPtsyPYYLvIxxMn9zd2iW06NmWdsZvzKvaliEl1HNjZsfQ4fPeZXqwrVq5/ayzdIkMGzpqSEuQptHR07X7A7UTXtE8t8rGAB5WyvcqrLHZ3Zt9N2bfj+Y9grj9kKGBUAIiuh3aYgngqlZLEKkmzRqehoy+nRDvfZu8pUgcfoRn8gGtcBy1FTRueWi5DfmSjoZyYhSsyIBRn33K/2r3VCB2cVP3Lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOvcA5V4YlqkqSNU1LYTdec5HlmL4CyIzQLvRVp1m/4=;
 b=ai78Evis2WO1KMwsgPzbWLZbv8sQYSFivHenUPeF3HtjIb2rH0hLlL4ijWUH8cEF1TfRnXxxLJWmvp2cimG5Aruaw1WzLd9Nnzm9517zJHUbe8SCTaGeDaZUT23FxavmlI6uTM+o3LhEtMCHAXCWquWA8I9hcbo2tU1h8vUCuD1sQIxlgav+Ro5HD6lf7TAfZjjEvZ7XRNF14i+YSXq10dm0tJjyBSWRgmPs4D7ZOOF8TCgaNhfpwtCM7b+DtAI7vPjaumsVtwWjUVRatrwReYjbKN9Qqb3J65paqJWL017VF6HgsHSvwkC4pkUpyQafguW/GlealDHxgcUhRnEtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOvcA5V4YlqkqSNU1LYTdec5HlmL4CyIzQLvRVp1m/4=;
 b=YTDUG56lxGvPiimP0R5/unlZYHIf3n+T+OJY5F2EBmIkbOa1+F1MBy2SqFuxUW2HhlDWxJD8qM79UJAqrD2ChxiSpxn0VNlUELeW1ESXjBHBD1GhOCn8I2NNA88rQ3USBef8atrvJ4AVH7FomxvA8oxAIgxJ/D0pzHbhNNhLJTm3armMi2GxT1qpTeUk1a+/2zf6foEolvM2T7Buv6C3lH69zHDutfN2cPFlPZ4tSncGYH3UZGDpYye4Wk9fEHimRFJQc7Xd7In2gJyVN7o9zPVBdNOojRdLJeM7+sjJZ9HgQgJ5YjEWbq15ib/CYdzj79iEpFVmdvJG5fo29BHIag==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN0PR01MB6660.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 20:05:18 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8445.022; Tue, 18 Feb 2025
 20:05:18 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] HID: hid-appletb-kbd: simplify logic used to
 switch between media and function keys on pressing fn key
Thread-Topic: [PATCH v4 1/3] HID: hid-appletb-kbd: simplify logic used to
 switch between media and function keys on pressing fn key
Thread-Index: AQHbgPaOGbd24Ez6OkqOiGCnPC37rLNNfLmAgAACIQA=
Date: Tue, 18 Feb 2025 20:05:16 +0000
Message-ID: <1C357D17-FEB6-4BD3-A548-3BDE3EDBC045@live.com>
References: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
 <4n0465n0-r590-66p4-o4oq-56q1qn6rs2s1@xreary.bet>
In-Reply-To: <4n0465n0-r590-66p4-o4oq-56q1qn6rs2s1@xreary.bet>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN0PR01MB6660:EE_
x-ms-office365-filtering-correlation-id: 5022247c-2ac2-44d2-1389-08dd50578fdb
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|8022599003|8060799006|7092599003|15080799006|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUFidll6N2UrcHBBS0prdXdvVmNRaGZ5MDV1Y1N6YjVSOHRpL0FRMExxVklJ?=
 =?utf-8?B?RnVLUlNORFBGd3Y1S3hNMEFUUldUcDJ0bjR2ZzZNMUNMYTZXcWMrYkFBYjhX?=
 =?utf-8?B?Q3FzcUI3ekhMOFhwT1M4S21OMVp6emxNdm9kOTM4UmgxTDMzTzZsTURjVzBk?=
 =?utf-8?B?NmFtVWNicnRrSmFLc0xDcFNHRDkvZlBtN3lqSTJVc250T2hydmtXS1BKVHBF?=
 =?utf-8?B?ekRFRVlSSk9LR3BHVG00M0Q3Ky9WWHdJTmsxRVdhYW5sMStzc0R5Ky9NNDNy?=
 =?utf-8?B?c2FvazM3QTBoN0hDeS9nWE9TeldBeWhmRzM5T0dyazFvZGRsb0wrcFpmK3RW?=
 =?utf-8?B?Z29pb0hUUUMveHlRb1dJVllXNlA0Vks0NFBueFJMNE5iYnE0Mm9BZnVrQnc0?=
 =?utf-8?B?WTF5cVpNM1hSc2s1S2ZtakZLSG1DTnFGUHRHNXZBL2E3dDc4RXh4N05jRlkx?=
 =?utf-8?B?aEMxMXJuR3RHanpMT1NNZ2JkdGpUbG0zU1FIM3NRUFM0MkRvVzV1RjI3Y3Q1?=
 =?utf-8?B?dnJMTHBYZFZaMzc4SDZyOEg4SWNFcWEzdGt5TnlpQk4rUkVJKzhzZFN4NW8y?=
 =?utf-8?B?K3FRRWdUcnhYWWVleTlYVG1PUVZFWDNKWWZORVVhSUFRanpOWHpuYitPVjBa?=
 =?utf-8?B?Z3VMRm15VnRBSEhSQ3NwSUh3em1DNGFhQzRGWXJCZ0FHNEkvVW5FTUxDTEVa?=
 =?utf-8?B?dUhXaHJnM0lpR0p3WFhEYWJMNjk4czJsQ3ptOU9ySGhoRUo3OUUyY2ViODlT?=
 =?utf-8?B?VTh3dmlaQmYrdUpRR0JFcU8xNVdNQTJTNWxabU42ZFNqbmI0dUtseFlwaks1?=
 =?utf-8?B?Z0FhcU1DRHo3ajUwUlVBd21QZi9jZENTT2paYVp4bUpmSDZDWTZWNHNPZWJu?=
 =?utf-8?B?VDFKSlRyQzYvbnl1cUorRUl3ejdMNkNwSGJ1bTNEVkI3R0R0VkpQb3k0ZVBS?=
 =?utf-8?B?eDVZRFllbms4aERhaVNmaXMvRkpPeUwrQ05ta0xxZUVlUFdYcTZiTDNSNzBo?=
 =?utf-8?B?eDFqRldwclBwc2xvSVdiakhBemFYZm9FZjYyYlpDL3pTWDlTYWM0Z3gySUV0?=
 =?utf-8?B?SklDdlovMi9rTDFKY0hsYzFiUTQ4dFQ4TXkyaHd6YzBwRTZQeGY4QnVvVWpK?=
 =?utf-8?B?QTBKaUlmR1h3WjIydnY0YmU3NEtZdHNlSWkzcit5TGxJOHFEYSt0dkR6MkVL?=
 =?utf-8?B?aVRJY2ZSMnpBUjlHOGE5Wnc1THJjVG9RdjhPVDluUkY5emQ4cU9zMDI1dEJM?=
 =?utf-8?B?OEhWanRXOGhPRTkzRS9DTHkvTUtJNC9UR1dCOWt3enJwNFh2MHM1cUpjZkdo?=
 =?utf-8?B?OTRFWDYzaTVIV21Eczc1amJVNnVkVTdXK05JVHl6WUtsNW9IQ0hSUkhRcnIr?=
 =?utf-8?B?aVdKbzBUbnJ6YWV2aFFzQ2pqbWhVNlZkV1d5N3dDNTU3RUZlYlk1czYyQzN6?=
 =?utf-8?B?b3QxaURHUkJySWtQdTRMM0NtclB3RitwNXRjMDByZXJZRnk3YVJBUlBvQm1m?=
 =?utf-8?Q?YYTAn4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUxqQnhFc0lsZ2hZSk1uTlpFMGFNT3lGVkZraTFKc21VNVB5NTUrRENSUUJ5?=
 =?utf-8?B?VW5mOHVWOUZ0citBN1pZa2FzcERYTHQrdHJEUkN2WUtSVGY4TDlUWHdWc3cr?=
 =?utf-8?B?bXk2RWNTdVZocTFtSUErN0RrNWFCRm1QMUVFUnh4bzRINWp1Z0gxTnBwSnFr?=
 =?utf-8?B?UUtIWVVlRy80NlJ2WlRJTzQ1c1ZVYi91MnFGY0M2ZXR6YkYzeUtGWkVvT2V5?=
 =?utf-8?B?R1I2cWdPNXBUbDRzak5DN1dEVW1BdjZJVDFCeXNUa3BhalE3UFF3WVVhSWQ0?=
 =?utf-8?B?RW1WRXF0cnU1c0I1VVJueUxUMGxmY1JER2Uxc2ljTGk1T3Rmcmg0TUluME9n?=
 =?utf-8?B?akVHT2ZvbldNeVNpQkJValFlUENYMXlRbmpNNzV0cnBXVmVybEMyeFdLbjJh?=
 =?utf-8?B?aFJsS3pqVDlrMHdFNWxzdzluanJ3QVZVR1Bud3NMRE93UDdPYTN4cXI2S2RR?=
 =?utf-8?B?c1orZnFob08yWG1DOFFuNTJBTTRiQ0xDNWRoK2F6amd5NGdTRVduekt2M2hz?=
 =?utf-8?B?aWVhc0xRaGtYRTJUMUlwbjNRM1Jzd1ZNM2JCdVpQeTRHbGtxYlEvMTYxZVZt?=
 =?utf-8?B?UXVWQkZ3TFpwdUVNTFJWajFJK00vTlljd2oza011Y1RFbklWWk5WVXQxamRW?=
 =?utf-8?B?bHpqUkIzQjJ6anczb2J5aWxLd3R1Rzk1VnBnSzNBeGtxM2lVUFVjQ1p1bkpx?=
 =?utf-8?B?eHVYeGRIMXErUmZzYjdzSjFZMHJxRmhqQVJVTGZTUVdhQ1Fla0hVemtBbWZx?=
 =?utf-8?B?bUZtRzhXUXpoUTJ6clcveEV2aHBtZTRncWVocW5NWkFMZ2E0NVIrTURNTHN5?=
 =?utf-8?B?ZHB0TXU3YUl2YTU2OXVlSnlCT3NZWEhuQWIvVm9QSE9XVDgrWjYwaDh6dHoy?=
 =?utf-8?B?SUhYV0xZQjdHWWlBa1BvZUdRaS8wMGR0bnhrS0dZU0s0WWwyZW9CaHZUN21P?=
 =?utf-8?B?VE5zRm5ObUYxalk3TDNCNHJtdGRPUFJqTjQxaHl0cjRGUEdadTM1Qy81Q2hG?=
 =?utf-8?B?MUdobEZpZDBYMnRreG45UE5nYUE2eEVNNUlORTYxT1VjSGlJMGRLY3FML0hX?=
 =?utf-8?B?cFRTTExkakdobHJVK0cvcmF4ZWt1N3I4TkVQVmRiSVEzeGlCUFlUNVpuQmtr?=
 =?utf-8?B?MHF4d3hSeS9oWk1sR1cvaWJTWVA2ckZZd1l1dWlLMmFKcjA4UzZUTmNQeEhO?=
 =?utf-8?B?RFlSbDhTcFozMkpJRmJUaVVqNkNZMWltSmp5NElnY1hXN0JGRFVsV1Jhd1Bl?=
 =?utf-8?B?KzhlU3AzQUlrWTdmR003V0ticG55M2NkaElXajgwS21zNDFMaVI4OVY5OEVU?=
 =?utf-8?B?UXBBM3lZMERTOXZXcnRTTnVaWGpjSjJ5Q1VHcnhGOWx2bDlTbDVvU0lGVDFp?=
 =?utf-8?B?bmFoMUd0V3V0VXBBdk1IRmU5dW1BTFpaSzI5Ni9HQ3lad3RraTFBL3M5azBP?=
 =?utf-8?B?UDdxVmlaR1RwZlh3cHJLMFlOc3J0QTJ5R3AxYjhLN1lNS2NtbUlGQW5BNWY2?=
 =?utf-8?B?a0ROLy9CZ2JyUkRHMWRHNVM0MGpWSm1COVRQbndJazYwYWdLQjFFRTIvTTh1?=
 =?utf-8?B?NHZJZFdvMTcwYTAxMmtUdlZNelZ2NlZZNWhUQzBJWXRpRjgwVDMybDk4aWgx?=
 =?utf-8?B?aENhTTlWaURCUHJXTmcxV1Q4R1R2Y0xpQlQ1ekFVRHVrMzJPdStzWlJaUHQ4?=
 =?utf-8?B?K05ZcjJMeUkrS2RCQXZMeDBvWDNSNTJNVTlabU82a3ZuMXVRRUpJRmtXdHpo?=
 =?utf-8?Q?cEqZ+yU6xRYFyGgp0VQkMHOHxKU46sTI+/wl3T8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBEE2024E3FF054E905080CA39EBD033@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5022247c-2ac2-44d2-1389-08dd50578fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 20:05:16.1827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6660

SGkgSmlyaQ0KDQo+IE9uIDE5IEZlYiAyMDI1LCBhdCAxOjI34oCvQU0sIEppcmkgS29zaW5hIDxq
aWtvc0BrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMTcgRmViIDIwMjUsIEFkaXR5
YSBHYXJnIHdyb3RlOg0KPiANCj4+IEZyb206IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2
ZS5jb20+DQo+PiANCj4+IFRoaXMgY29tbWl0IHNpbXBsaWZpZXMgdGhlIGxvZ2ljIGluIGFwcGxl
dGJfa2JkX2lucF9ldmVudCB1c2VkIGZvcg0KPj4gc3dpdGNoaW5nIGJldHdlZW4gdGhlIG1lZGlh
IGFuZCBmdW5jdGlvbiBrZXlzIG9uIHByZXNzaW5nIHRoZSBmbiBrZXkuDQo+PiANCj4+IFdlIG5v
dyBhbHNvIHByZXZlbnQgdG91Y2hpbmcgdGhlIGtiZC0+c2F2ZWRfbW9kZSB2YXJpYWJsZSBpbiBj
YXNlIHRoZSBlc2MNCj4+IGtleSBvbmx5IG1vZGUgaXMgY2hvc2VuLg0KPj4gDQo+PiBUaGUgZm9s
bG93aW5nIHNtYWxsIGZpeGVzIGhhdmUgYWxzbyBiZWVuIGRvbmUgaW4gdGhpcyBwYXRjaDoNCj4+
IA0KPj4gLSBBIHNtYWxsIGNvbW1lbnQgc3R5bGUgZXJyb3IgaGFzIGJlZW4gZml4ZWQNCj4+IC0g
Rml4ZWQgc3BlbGxpbmcgaW4gTU9EVUxFX0RFU0NSSVBUSU9ODQo+PiAtIEkgaGF2ZSBhZGRlZCBt
eXNlbGYgdG8gTU9EVUxFX0FVVEhPUg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgR2Fy
ZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KPiANCj4gV2hhdCBhIGZsb29kIG9mIHBhdGNoc2Vy
aWVzIDopIEkgZG9uJ3Qgc2VlIGFueSBtZW50aW9ucyBvbiB3aGF0IGFyZSB0aGUgDQo+IHYxLT52
Mi0+djMtPnY0IGNoYW5nZXMsIGNvdWxkIHlvdSBwbGVhc2UgZG9jdW1lbnQgdGhhdD8NCj4gDQoN
CkV4dHJlbWVseSBzb3JyeSBmb3Igbm9yIGdpdmluZyBhIGNoYW5nZWxvZy4gSeKAmWxsIG1ha2Ug
c3VyZSBpdOKAmXMgZG9uZSBuZXh0IHRpbWUuDQoNClYyOiBTcGVsbGluZ3MgaW4gTU9EVUxFX0RF
U0NSSVBUSU9OIHdlcmUgYWxzbyBmaXhlZC4NClYzOiBUaGUgMy8zIHBhdGNoIHdhcyBhZGRlZCBz
aW5jZSB0aGUgYnVnIHdhcyBmbGFnZ2VkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90DQpWNDogRXh0cmEg
dGFicyB3ZXJlIHJlbW92ZWQgZnJvbSAzLzMgYXMgcmVwb3J0ZWQgYnkgRGFuIENhcnBlbnRlci4N
Cj4gLS0gDQo+IEppcmkgS29zaW5hDQo+IFNVU0UgTGFicw0KDQoNCg==


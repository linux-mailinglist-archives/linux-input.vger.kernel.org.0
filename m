Return-Path: <linux-input+bounces-10088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C4A37AA5
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62DBC188CFE5
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 04:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D27414D43D;
	Mon, 17 Feb 2025 04:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="l3FWo+iB"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3506333E7
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 04:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739767826; cv=fail; b=dnC7lmw8L6QnCCMOflo/uX/5OFYeFQ1ApIfUjHab5Fys761AYzcxokpz1EaIico48ZB3TZDXmyKGXUjEvTMTSHhxWUXzE4AqCdPORNkmobXRKnq2NS33GhO8daR4scogd3HrYDCONLrK4XGFySppp3ILBFdafxW6RlJE9tFlUl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739767826; c=relaxed/simple;
	bh=XoOJ38msXdMiSs5M0hRbbQwUsug+hU1YQ9LNMojROII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eLQTqpyIJshddR9pPEQW41uqV+eom0nUxhJxsdnil4LQEwBsLrPxrLamZCN8w7Rbf7ymmA1gVXSmZEk29/Q/1fx2s8PUzrICglxh2ApfKeoWkipM63sqzfSzrnGoZFztzBwWpn5lg/SNeZ1BB3tpgAagj/QVDk5FdImqVoSgF88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=l3FWo+iB; arc=fail smtp.client-ip=52.103.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYJC9JOurtmv9dkWUfKFeL9eumnb7hoPmjuz7YCHSf2ZSbIcO4KkE/mgp78c62BdhvvD6nf8HXMij5Pl4UvelIIyNmfs6AADOoUR3AEQIkvGIoAdfPek5ntnyaIVkj4HtRClqpWb+Tjv7lk05H8Aty68G7cqpIAlYHr+iwfXWUu1qy1HOKAVSKL2M3HcaodtGdSOv1GaTQvIAWfxs1dsszea3RVx34r94elU9dFGp1SC4IW/fUiHNVBTPpcr+w7VebLuyT9aU1CY6VwH+RyWjv2Dd4y2ijHfS3ZdJ/G901j782UCM1VxpUtafx630MJ765zQ1qJDAdUE+XMAFzBveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoOJ38msXdMiSs5M0hRbbQwUsug+hU1YQ9LNMojROII=;
 b=PJoXdYy2cMNxwp1jXwhEun/IaCTT5h5bTfBVjIZ6gAkUQHDm2FCmgdQS6eJ6HeRLpiDS83uDeBb9xP/1PBooQw+0MCpx8cDdWsIXKoTuI602O74lz57wnxGoz1YbggQ5urchMPuPurjGNUUsoxKJt0GrHInG40BkqnnJClO2IR8s+Z10bNuqVeAbUH9V71lU2V/1IuoZg9STpuVNUvk7ZyIusSsvHf6ZPWnLICNcxwsiPlykk4odvQxgPCuuUa/TmggZMqLlk4ORbPlbRml5W8Px/HwhWMcCdxPu5IrYPeCfKkI3GfN4k2pdE8wlHNAZ3X4IZ5m5i/VOkqpW66Hnyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoOJ38msXdMiSs5M0hRbbQwUsug+hU1YQ9LNMojROII=;
 b=l3FWo+iBDVpSXki4IpD8C3UlhVpsVPlA0VP8coXMWyviO093eCJtHWJfIpUFn3LdiwjTLGdHMCOM8h3f6LSPnHRM5a1teg9H62i6dlmQKUkIXrFRFxGjxCFqH2S6YsqtLpM3DqH9xHeXNRDjErTujIRiVURcAVwr0cKKsCRhFszA1LEpWQoqwuaIMaxnOYohWu6xkbEDco6EuxU/MVm7L3GC44gdfeWMXB+MPHAOdZlNpL1hjykh/jP3ukXflh3T1NmQ4en6Xktb53suQKNCB1q+3qjVWHpWcmLXTEr9mfox4JZbfbbP6d3GseXjyaL64oJwN18wU8S3OsX4RmKxkg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MAXPR01MB4375.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 04:50:20 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 04:50:19 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Jiri Kosina <jikos@kernel.org>,
	"jkosina@suse.com" <jkosina@suse.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [bug report] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Thread-Topic: [bug report] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Thread-Index: AQHbgLusTysZbdEyG0OE4/1rX35tpLNK7V4A
Date: Mon, 17 Feb 2025 04:50:19 +0000
Message-ID: <88774FD7-0DF2-4F93-B4C7-3D26FFFC48A1@live.com>
References: <6263a1a2-4d50-41db-aa54-cfcb3e0523a4@stanley.mountain>
In-Reply-To: <6263a1a2-4d50-41db-aa54-cfcb3e0523a4@stanley.mountain>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MAXPR01MB4375:EE_
x-ms-office365-filtering-correlation-id: cf635a46-fa90-45a6-2e5b-08dd4f0e9497
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8060799006|8062599003|15080799006|7092599003|461199028|3412199025|4302099013|440099028|10035399004|41001999003|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjFoWGVYWElXNkpiYlBmRDlQZHp5Z3RvNFJ2aC9hbHhtNmV3bEhYMVhocDhn?=
 =?utf-8?B?T0J6SjVZQmI2aDIxNk5URWVmMTJ6QmhOdTlaeGp2N0ZlcmE0ZTdYVjRxQ2xH?=
 =?utf-8?B?QjRCZmNmYkh6VjdUSWYwZWQycmFtMHovQ3hndTdHRXEzTEJPUGRZL3Z0eXNy?=
 =?utf-8?B?YzA4UlJZSU5zYnVwbFFHUGltUGpFMFozMlh0NW82MDVCc1orWVJ3VVI2bWdH?=
 =?utf-8?B?V1NkcTJsSVFyNkZtVVFaQlgrZ1J2YXVBQWFSeWFyU2hsZXJXbzI1a1JnTDkr?=
 =?utf-8?B?bFdaZEFBakdmZU9XTTBVL2NmVzcwbXFHT3FDMm9sTXIyZ3VkZFFPSEV1SUFi?=
 =?utf-8?B?WGd6NG5TNFhqQi85L3Vydm9IMnVKdEltRTVsUGhDZndSK3Awa0ttUkR6WlNx?=
 =?utf-8?B?WkZrVnY4aXdvV3ZXcVdQdzh2NStTVTdZZUhXWGJWelBJLzBxN3NSNG1uUnYz?=
 =?utf-8?B?ZFExTXRhT0dJbVJOd2hXSzg1dEV2c0k1THMvaEY3ZWFpRkZrbU9EMmlsZWFn?=
 =?utf-8?B?K2YwczJNSG1acWRlWnRja3o4NDZGV3JxT0R6VmtxRzI2dm8rOFpTZHFwd1dv?=
 =?utf-8?B?N1QyZTc4QVZuTW1CQ2hUT1lzbzRhSWp0Uk5saGtrVExqVXh2VGNibmdWUzg5?=
 =?utf-8?B?VTBuMGFKa01wVXdvN0krTDB0Yll5VjIrSkJKMFZ2dHQ3UTNhME1Oam5WZitp?=
 =?utf-8?B?NmliQk85eWJ3S3FEOE05VDFSSTVtWXN6UW92YUU4djlEdFprZ0ovYUZjNExQ?=
 =?utf-8?B?UlhjbldXTFAyS2NkOEVOcWQ5UC9obUpqc2w4cVQxZnlJdVYvbVNVNEJjWEJ2?=
 =?utf-8?B?WENBeit6b2NJbHMrVDJRaXR1Ymp4NmxTNXVQNUVaMCtLNXMwT2daL3pDOUJE?=
 =?utf-8?B?Sk1tZ3Y5bjdUenZKalJydGc0bTM3WkQ0U1BNSTNnR2RaaXM3K3VPbHllUWp1?=
 =?utf-8?B?R2IyTnowVTAyNTNXNDNqQUJzWmRtcmdCSkF1RWphazBrd1ZnWUVPeS9Qd0t6?=
 =?utf-8?B?Z1VVUzdQRjVyY3M2Y0g2N1lSbnVGc1JuOUdvb01hZmlNNnF6ajMzM1k1VXBs?=
 =?utf-8?B?T0NqZzg1aXNQYVpQQk95MU0xWUNLa1RJOXVwdjdhUERFYUZtM3UrbFk3Qkw2?=
 =?utf-8?B?dVdRUmFhcXZOelRLZlFzQ0RNaDBXOEFldUNDQk90WkwxSlNUQ0p2ZlBsdGR6?=
 =?utf-8?B?M0tCaFJOUGZDNm4xM2NiU1Q0OEs3UnZjUlBLblFMUFRoTEJZeFJzSWpja01w?=
 =?utf-8?B?RkFkZWxucUpONFgxeGM2a2FKM0orZml6WnIzMktVMlplTDdsOWpzNDgxbkUy?=
 =?utf-8?B?dnUwQ2RDRFpBdkJiZVJ4Z25uOUZKMWdzMXhjZ0w5WkFOemJhS2pEMjlyR3Rn?=
 =?utf-8?B?eXVvbUQremFEU0thaWxRbENBc1ZIUHVHNkovK0dkbnFXcFhYeE5hcVFLRU5p?=
 =?utf-8?B?MW1tb3dFOHBuWjBXUzRqb1haeGdXVDVlMDF0K0RrbEtOSk94NkpyMWFycWFZ?=
 =?utf-8?B?RWUrMVR4Y25XenAzbnhXelNubGxGRlZnRHY4SU56NjA0cUdobFdWUW5sQk84?=
 =?utf-8?B?WXA5Z3pXUXY2VDhLWUhuSUxSYS81TFhFMFZzcnhWWTlLdGlBckdJWWU0bjRN?=
 =?utf-8?B?THdFeDJoSHdiSHcra0hwc0RtTTVxQVphbnVzSmFXY3duZHNKYWtLejVVcFYy?=
 =?utf-8?B?ZU15MnhFTVpOZ25pb2lkbVBCVmV3azFyY3pEUFNsQmxJaEVia1NUallRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGFMZHFYQ0doVTdkeE42eTVQRFNLQ0hBLzdvSVlKQkRuc0xLcWpGZFFQUlJH?=
 =?utf-8?B?ekZ1SFJwcEEwb3hlOVRoemFlOHgyMDlzUW9FelYxdnk4SzVuYVVOWWsvUStU?=
 =?utf-8?B?V1A1d1kwbEtlV044YjhIZU1Eb3hRdTl4WmQzOVB6QVVLQmRHMGZ4VURYN0ZG?=
 =?utf-8?B?ZnFsdjNQL3VGalJhZUNENTJxL3NJNlhzdy9MSW9uNUdlSzJOOWVmZmVOcWJR?=
 =?utf-8?B?SzdaQWVxTTVjS3o0bjlDL3Y4VjRJYmZXeEY4amZ5Q3ZEY0w2Snk0L0w1dmNB?=
 =?utf-8?B?WTgwWEdiYjBiRnloU1ZsNU9vOExHVnZzSmNWYUZQd1dTU0dYZnJNOE9iUXNS?=
 =?utf-8?B?OHRMZlAvUUJkWCs2UXJjTjFYdjFBcjFHY1lpbEVMWSttenlRV3RyakJVS0hC?=
 =?utf-8?B?SHNkMWdXZWdoMnZXTzlMaDc3MFFLYW0xNHFlS3JqWXBhVjdEVWhwSFQ4NjRP?=
 =?utf-8?B?S3pHUkEwejNHM1EzMFJRQmNzMW1XbFo0bDhCTUdNcXNqMEJxWUphVUl3c2xL?=
 =?utf-8?B?azVkeDVGczU1V2dYbGsra1hTSW1lTENHWTVBK3dzaEJzNkdaUGMwR3gwVUhr?=
 =?utf-8?B?OHpTQW5EckpVak56Z3hEcjBQbXE2Qm9zdlRBaGhFcXdhR3R4WTFIMzltWVBp?=
 =?utf-8?B?bk9Gck5wbWZ6SXdSK1lBZXZGcWk0eGkrbTRxdTdvSDk4U0k3SUtkc3FrTzdS?=
 =?utf-8?B?Wlg0VTlYQlpnNlJnNUUvdFBjVmdZQ2QvdTFNZUJ0UEpIZmVGSkJYQnIrWHRm?=
 =?utf-8?B?dkd4R1ZHb3NVT0h1Vi96MVF6K2xKd1VKSjJuNHZEMHBBcEJzNkE4MEYwK2VL?=
 =?utf-8?B?Vmg1TFEwemtOVktsaTdBcTJBME1xYVgyNXZNTVREbzNyNWZnd3lXUnpiZDNZ?=
 =?utf-8?B?cHMzcXhxNy9qNjNOTG5pM0ZTY21jUjVIT28rejY2S2lMeG1KeHQwY3lVSzU3?=
 =?utf-8?B?M2MzbUhKaWs5c3hEaXVWaVRONGxGU0ZRZ2prYnNYcnhHTEEzcUZtVGQxOGhH?=
 =?utf-8?B?ZjFtM1pDdGpadUVsM0svdUdzSHBWc0F3SXFNTzJsSmdvMGlqM1ZRUVYzM2No?=
 =?utf-8?B?RU50T0VFNWZYMkphNXhtdVBqY1ZVd3JPTUQ4NFY0USswZkg3UWh4bXFCOUI3?=
 =?utf-8?B?ZGJnSGtHbjVid096TWZmc1VOdVJzTCtnUkwrN0g4SnljTmwyMkxLa0tmSSsw?=
 =?utf-8?B?LzlHb3hNUW9YVkFSNmRWOU1IRWF4MmV6c1laMkpJdHBEbDRpZjJ6VGY1L3NR?=
 =?utf-8?B?L0htYmZhTXg0ZjhhampPT2t4Nk8vOWdwMThTYjRzeTQ1RHR6TzNDN2xYbzlp?=
 =?utf-8?B?aDlMWU9wbWJlU3BBTTNNOU1lcWJRUUNFVVkwb0x5WmlPOXNtMzNNWUZNdXlM?=
 =?utf-8?B?WElNTkV0QUxaaFVaZjZOR3p2T2c5czMvczBQd2R1c2RIdEdsSVZNcnhZWEt2?=
 =?utf-8?B?ZCtrY1YyVnc5TkRFK1VEcy9wejVOUW9Yd3B6Y0E4TUlZSW8vYVZTNW1FZll1?=
 =?utf-8?B?NEtDb2hCTkpSQnlVbXczOXQ0em02dnZrd2g1NUx4NTdOM1FrV2J6TlVRdERG?=
 =?utf-8?B?V3FRcVlXbm5sR3RoaExBV2x2aURxMXExSkVxdWN3RFRYaXczMTk5bk5CU1B2?=
 =?utf-8?B?cG04RENxR0Y5Nk55SXR6MGY2UjhTYXM2ZmxCSnFUVGMvUnFTU0RITU82NkMy?=
 =?utf-8?B?QXluUTdMVXBzOVVabGxLcjNRdzVQdnhqYkR6YnBjUjAzSG9pL1FxQ3pkNno4?=
 =?utf-8?Q?yXodOZl365xsFik+n7PyOeeDcn6pkwvPTwbI3Qx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9C780BAFB31224E9D7E33D819A39D0F@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf635a46-fa90-45a6-2e5b-08dd4f0e9497
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 04:50:19.7185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4375

SGkgRGFuDQoNClRoYW5rcyBmb3IgdGhlIHJlcG9ydA0KDQo+IE9uIDE3IEZlYiAyMDI1LCBhdCAz
OjEy4oCvQU0sIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6
DQo+IA0KPiBIZWxsbyBBZGl0eWEgR2FyZywNCj4gDQo+IENvbW1pdCA5M2EwZmM0ODk0ODEgKCJI
SUQ6IGhpZC1hcHBsZXRiLWtiZDogYWRkIHN1cHBvcnQgZm9yIGF1dG9tYXRpYw0KPiBicmlnaHRu
ZXNzIGNvbnRyb2wgd2hpbGUgdXNpbmcgdGhlIHRvdWNoYmFyIikgZnJvbSBEZWMgMzEsIDIwMjQN
Cj4gKGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hl
Y2tlciB3YXJuaW5nOg0KPiANCj4gZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmM6NDA2IGFw
cGxldGJfa2JkX3Byb2JlKCkNCj4gd2FybjogcGFzc2luZyB6ZXJvIHRvICdkZXZfZXJyX3Byb2Jl
Jw0KPiANCj4gZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMNCj4gICAgMzcyIHN0YXRpYyBp
bnQgYXBwbGV0Yl9rYmRfcHJvYmUoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsIGNvbnN0IHN0cnVj
dCBoaWRfZGV2aWNlX2lkICppZCkNCj4gICAgMzczIHsNCj4gICAgMzc0ICAgICAgICAgc3RydWN0
IGFwcGxldGJfa2JkICprYmQ7DQo+ICAgIDM3NSAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9
ICZoZGV2LT5kZXY7DQo+ICAgIDM3NiAgICAgICAgIHN0cnVjdCBoaWRfZmllbGQgKm1vZGVfZmll
bGQ7DQo+ICAgIDM3NyAgICAgICAgIGludCByZXQ7DQo+ICAgIDM3OCANCj4gICAgMzc5ICAgICAg
ICAgcmV0ID0gaGlkX3BhcnNlKGhkZXYpOw0KPiAgICAzODAgICAgICAgICBpZiAocmV0KQ0KPiAg
ICAzODEgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiSElE
IHBhcnNlIGZhaWxlZFxuIik7DQo+ICAgIDM4MiANCj4gICAgMzgzICAgICAgICAgbW9kZV9maWVs
ZCA9IGhpZF9maW5kX2ZpZWxkKGhkZXYsIEhJRF9PVVRQVVRfUkVQT1JULA0KPiAgICAzODQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSElEX0dEX0tFWUJPQVJELCBISURfVVNB
R0VfTU9ERSk7DQo+ICAgIDM4NSAgICAgICAgIGlmICghbW9kZV9maWVsZCkNCj4gICAgMzg2ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gICAgMzg3IA0KPiAgICAzODggICAgICAg
ICBrYmQgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmtiZCksIEdGUF9LRVJORUwpOw0KPiAg
ICAzODkgICAgICAgICBpZiAoIWtiZCkNCj4gICAgMzkwICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsNCj4gICAgMzkxIA0KPiAgICAzOTIgICAgICAgICBrYmQtPm1vZGVfZmllbGQgPSBt
b2RlX2ZpZWxkOw0KPiAgICAzOTMgDQo+ICAgIDM5NCAgICAgICAgIHJldCA9IGhpZF9od19zdGFy
dChoZGV2LCBISURfQ09OTkVDVF9ISURJTlBVVCk7DQo+ICAgIDM5NSAgICAgICAgIGlmIChyZXQp
DQo+ICAgIDM5NiAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQs
ICJISUQgaHcgc3RhcnQgZmFpbGVkXG4iKTsNCj4gICAgMzk3IA0KPiAgICAzOTggICAgICAgICBy
ZXQgPSBoaWRfaHdfb3BlbihoZGV2KTsNCj4gICAgMzk5ICAgICAgICAgaWYgKHJldCkgew0KPiAg
ICA0MDAgICAgICAgICAgICAgICAgIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgaHcgb3Bl
biBmYWlsZWRcbiIpOw0KPiAgICA0MDEgICAgICAgICAgICAgICAgIGdvdG8gc3RvcF9odzsNCj4g
ICAgNDAyICAgICAgICAgfQ0KPiAgICA0MDMgDQo+ICAgIDQwNCAgICAgICAgIGtiZC0+YmFja2xp
Z2h0X2RldiA9IGJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X25hbWUoImFwcGxldGJfYmFja2xpZ2h0
Iik7DQo+ICAgIDQwNSAgICAgICAgICAgICAgICAgaWYgKCFrYmQtPmJhY2tsaWdodF9kZXYpDQo+
IC0tPiA0MDYgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vycl9wcm9iZShkZXYsIHJldCwg
IkZhaWxlZCB0byBnZXQgYmFja2xpZ2h0IGRldmljZVxuIik7DQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eDQo+IHMvcmV0Ly1FSU5WQUwvPw0K
DQpTaG91bGQgYmUgLUVOT0RFVg0KDQo+IA0KPiBXaHkgaXMgdGhpcyBpbmRlbnRlZCBhbiBleHRy
YSB0YWI/DQoNClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuDQoNClBhdGNoIHNlcmllcyB3
aXRoIHNvbWUgaXNzdWVzIEkgbXlzZWxmIGZvdW5kIG91dCwgYWxvbmcgd2l0aCB0aGUgb25lIHlv
dSBmbGFnZ2VkIGFyZSBzZW50IGhlcmU6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWlucHV0LzgzNjVDMUIzLTNBMzgtNEY2RS05NTVCLUQ2QkJBQkE2QjAwQUBsaXZlLmNvbS8NCg0K
Q2hlZXJzIQ0KQWRpdHlhDQoNCg==


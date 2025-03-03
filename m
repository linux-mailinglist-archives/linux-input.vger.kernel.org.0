Return-Path: <linux-input+bounces-10500-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB0A4C879
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 18:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB6E318884DC
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 16:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E7B215F6D;
	Mon,  3 Mar 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ZShMwRDk"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011034.outbound.protection.outlook.com [52.103.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AA020E706;
	Mon,  3 Mar 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019623; cv=fail; b=Lu3jUcGTflpcPF9t7dG4/8EkSePdT9+qOrDhDT5dCcs/jIs++YR2gnZ+cw2QOfpoAWFfvA207T/k+DNrtzb1lz4SenPakd9SYUUNZ5umqUH81oYv8hlQUa7B2p2YclT5ub1n6DCG3A5kk2utzSPjaeyoAcvxHNSLMEKgD3k5/Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019623; c=relaxed/simple;
	bh=a/2OxPVTrROsqo51mRb21ipROAZDo7MjhfK/bJjZpws=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fvmX1i9hckYp6qqcwHs1hiZaXP76Fw0If6kgKC99BgvqjaNLNEUnxRa0NJLez7H+0iIidbF0ycdcaWBUZsBPdL0C+Z78r7qVrlvCUn6xZR5KOzpyrkVD7THLl0/8wy6/ddNlsGvZV+nA32sGDKn63MVfYuxnDlG3/CNzOJ6Nwcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ZShMwRDk; arc=fail smtp.client-ip=52.103.68.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHHdvVOOEVusFjGZcnSWSsSvuqdSQuJbC0Or3HoY/IlGtwTSqwecbgpDVk5ZqU3M5IP61Ub95PprHe545ta5abyMH8h6hB66h54YRi/hp92swJM1Ev1zqx7xxWvjZryNWVkdLK5vlSz7qpIN56jgG2ikuIU9Ca7Yr9+A+hybzy4HvDZ+Ph4otgMgN48uhCXSwUfAk34P+K6rRb1HszvjoZxoliGFtvpC6k/bO6ScyjMYyjKtcMv+ufg2jVJ07rBdPsLyOByI5QiAWOWCUk6ezQtzZF1YdO7oICpfubHOm3xulmhc6CiVzevK6Ec3ZBG6SjjDIeQ90CPAsRardWT5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/2OxPVTrROsqo51mRb21ipROAZDo7MjhfK/bJjZpws=;
 b=FfOJCluqcNY+jCHeUiGrazCfD4lY7rB9FC4WBK6zbq8MA92MgP2ApUXkBdKiM0f1YXqMt712W3M9ht61ehT2wBDPlc6JhRCSSlbadivZmSO6x9g4N9cyKXgjSXH0M8gr89bRPLEkWaw4hSb4Bs3gKQEuDiOMH9fK33FV0FRtuLzsOGXVWRbEWfdaRiBcZ1+ZPeJdndYFqgFL057MztOC0zH/YQ/841slyogb/bMuHZ3CxhC/sJCzqsE7aW/pRvF7RqnPZjdAdthANsBk5SrJ3dkpkaXpEu18BPvBDtixAsTE8VdgNI3g6JELqKOrs/u5/KlR/tt9fAbVJ79jXHZ8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/2OxPVTrROsqo51mRb21ipROAZDo7MjhfK/bJjZpws=;
 b=ZShMwRDkZVfMm73mr3mMx7RsF5eLS14/jMOaDG5JRum2dMSXmZdiczWMMvA1sP/+Pd4001nkF0rhSy+tqHweYwoEWE1xsebaGOLokUg09GOlS8RDdSITCVd4BDmNfm4OOsQJp2FrYOZPvdqJb8Rk47U6o3zDg5Yi4UnrU73U/l9o4wGlDozuPtpmD8h8+vBS8KT91doS4RXsXupsUUZvpRVsJscHMwLTb3t3KsoTLGhUk9sBxCEcAG8IZ3lUTN9iPgM+P/NYiIbsHp9Lux3KA9PcUiaqEDdqiHUy+ibkckp5zNo4wMj7ZR64Q33ZZQfh6KTjGXB0ILtq3hxlm+CpAA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9604.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 16:33:31 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:33:31 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: Re: [PATCH 0/5] HID: multitouch: Add support for Touch Bars on x86
 MacBook Pros
Thread-Topic: [PATCH 0/5] HID: multitouch: Add support for Touch Bars on x86
 MacBook Pros
Thread-Index: AQHbjFn/xISGuf4PJESY9AJI3r/1CA==
Date: Mon, 3 Mar 2025 16:33:31 +0000
Message-ID:
 <PN3PR01MB95973DFB55C156A07B30CA70B8C92@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9604:EE_
x-ms-office365-filtering-correlation-id: 664e9113-0107-4866-8218-08dd5a712276
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8062599003|461199028|8060799006|7092599003|6072599003|19110799003|4295299021|440099028|102099032|3412199025;
x-microsoft-antispam-message-info:
 =?utf-8?B?K25YMVVSMmlGSC94UHA4NlpBV2tpSFVmajRkMnY5cDJYYk1IV0ZXb2Vwa1N4?=
 =?utf-8?B?bXliME9HaWFiaXJTT3RqZ0lzMURQcHlIdmlLeVgvdlRkc0R4ZjhLWWZ2eFh5?=
 =?utf-8?B?TGR1SmYwb21VUXNXVnNWRlpLNnF0bEZpY3JPc3JjQlpuVjRLZHpJMUhBZ0JS?=
 =?utf-8?B?ZmZUYVhudHBNV0ZRYzhENEtCUlZZWkE2NHZYNXdNUFZqMzhvN1JCS1JUU3F6?=
 =?utf-8?B?SkZINkF0SnlkSThBL0wveXd3eHcvcXhiRTI0Q2tKNElRUXhZeldjaExHYTFq?=
 =?utf-8?B?S3k5aXVGRGdwazhXQnFFS2tHMlpDZmJSemtNYXZHMm15MSs0TEV5SnJKQTFr?=
 =?utf-8?B?c2tFMVBBRnQyUURrRithdVljaXg3aVJvREoyWUtSVmQxZ002L2RxMThsclJ4?=
 =?utf-8?B?Uk1VaEh4UnJFcXBhcS8xYXR4eHRiRTJsQzU5TjZkSGdtYkQvaDlFczdNMEhK?=
 =?utf-8?B?dXdPUTVYODhrbXQ3R1FIamRpblJNYUdLcDdOR2tzWDkvbWtzN2ZnNmxWM2l4?=
 =?utf-8?B?bDQ5RGloUHVvQ3FIR1NGRHhtdlpJSENWWWQ2dEpHM1ByWStRblkyY201SjVG?=
 =?utf-8?B?L3FtQ1IxN21vNFhHYzNnUGJmR2ZSZCtZSjF1eHR5d0tJS0JVWkVudERZZWJa?=
 =?utf-8?B?b3VHcnIydmQxTE9DSUh4cFRrYXd2UU45OHFYZUVrQnljbjFod3lpakhjTnND?=
 =?utf-8?B?UjNRLzhJNjBSSXRRNHUwQ1RwdFV6b1BDM1JYTE5FVS93UXpsdm9ROG80c2VP?=
 =?utf-8?B?blpQYWo1RzQ3MzE1MzNWSVl2TTJGV01iei9YS2dsSndIWUxlUDFhYnlVVkQx?=
 =?utf-8?B?TU5XRGtISnkrbk4wc3pmMExPTjJWanRwZU1qOS91eXJSWitVczRUMDF5c1dk?=
 =?utf-8?B?am5PRzh6anJoamdjSjRzUmdtOTB0K0hsdy80WmFLWkFkRnUyU1VENzVBeGtT?=
 =?utf-8?B?elJ2MnI1VVdZOWZGZzV1aS9FRURubUJORDF2TldyZ1lhZW14SjJwUzRlRUFj?=
 =?utf-8?B?WXVmZmNrZXBoU0Q3OFdtWjc0WjFJZFBhRnZhTU11eUhRVzNYZ0YrdEtwOHNu?=
 =?utf-8?B?N2c2Q0QzQWFHUDQ0ZTF1Yk9WbzBTaXYvSjR6OFNYOTJoUzRBNDFXbzdZbW9x?=
 =?utf-8?B?WGtxSHhMZFIwUkdyQ2ZuNmNJWUpuSkswNm5yQm9pK3lnTlBWVnUvTGYxVit4?=
 =?utf-8?B?UkMzMG9seHlFUDZMaUJWZWY5aVdpVitDcjJPMmpIRXRIcXg1V1gwWm5KRkVU?=
 =?utf-8?B?WWZLZEZaK1ZObi9QcGh2NmczckJ4UmRZZDkzL3V1ZGhZSGhRZnVKMlZMUlQ3?=
 =?utf-8?B?THR5UC9QSmt2QmluaXF3YUREbjk1MldvQVNrOElxUk9DYzkwcU1nN1BUSGhN?=
 =?utf-8?B?M3ZJSEZxVitaWitvTGlLbDVmTlJpYVRzOXF1QUs5Vjl3NnU1QzZ2amhHRUNU?=
 =?utf-8?B?eWJCQnp6Ti9IdkoybURjV1dJSkllWHo4ekRtQm1zOElhUDZWWGt5WWhGSGRJ?=
 =?utf-8?Q?3ju4NE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFlRZDJPRiswc253d0NtTTdhZWFpZ0N0dDBzRFhEUEM2aEdoSzRRcGlaTkMv?=
 =?utf-8?B?OGRxamRyS2k3c2g1Um4vMGtUYkh1R1BaSUM0SkxNaEZZYzd2MzY3ZVgvaFZI?=
 =?utf-8?B?Nkx1T2p4UWlsc3l6WE91K2puZlA2bkpZK01LbHBGT2gxR2hycmh3MUJXWTdU?=
 =?utf-8?B?OEVqSlBsU2RyTEt3NFk4MmNUcFJLNXF0QVgyQjFXNCtzU2RQM2lVdXQzb0w0?=
 =?utf-8?B?Z0w4cjdkL3p1R05Vc3Y1VEFrNFFTTDNxVVAzRnM2YVVqV2NQM3hGM2xUTDl2?=
 =?utf-8?B?bTFpL1pYZlo1Y1dwOE5nK2I3UmZWS0d0WGp6V1VUSmYzdmVDZVRIZHBiM1Ft?=
 =?utf-8?B?UUVqbkhEb2FQZ0hKdXhMRUxIU3RuNkxaUEpjR2JURUZnSVF3YUFZNVMxRnNQ?=
 =?utf-8?B?SHIyM1h3N25sRWNSa2RJR2Q0SE0vZmdPZzJyNWtFa1pSeGdZZDAza2VQdlBs?=
 =?utf-8?B?QVN5L21VdjZMUThzMGNvZk9kRGhSUGwzU2dSWnFlWkF4Ujk2UGlaRkgrSlJu?=
 =?utf-8?B?dHI3M2pqcTlhVHhZaGhJZ0ZmdHR4SUpOMmQxdll5SzZkTjN3cUI3N2cyNFMv?=
 =?utf-8?B?bTdDSEl6WXVBZEk1UjlVMWYvRllSSmlSZFVIRjhmVTFsR1JPeUxwckMvSUxr?=
 =?utf-8?B?a1U0RDZNRWp4WVAvQTF6a3Y4RzBmcytHZW5YbHc0NG4vSmlVL1JhTUlpajBz?=
 =?utf-8?B?cWk1VGkrWUR6NTF3S3RXVFRycm1XczJ3Q2FGbU9KL0J5SjhUTEE2YXJiR1F2?=
 =?utf-8?B?TW5YMGN5di85OThxaTFZT1N6ODF6cytKWlFEYks5UlVjVmpxZUdKZzBQNmQ2?=
 =?utf-8?B?WlN2SG1UbE9PTFBsdDN6d0s1T2FXUFhvR1JDOHdoTGE0eVlCRm5NaHBiVVlx?=
 =?utf-8?B?a2Rzd3A4OCt4Vk96c3ZNS0pXWTdBRVlxTDdRT1E1ZVZ4RjVzUG4vREtNb0FB?=
 =?utf-8?B?T3pQNXh6Skd4elgxaUhXUmE4Si94bWZscTRmTHZRYU5LTFNhYXllZ3NDaHhl?=
 =?utf-8?B?V2tOYjZDSUpzZk5wRy9mdmVHcUxJZ1c0VXBBOXdneE1rTENnQVhVZVZrMER0?=
 =?utf-8?B?WXRaTkpmbmlnenhHUVBhK2FBZ0w1dTQxeFd5aXZWQTlhQ09rZUpUc3Y3TGky?=
 =?utf-8?B?Qk03TkRGZkNITG5RVTcvd25iVk0zbWZCeGdmZGtxZFFFM09tcG9Wa0pBSE5x?=
 =?utf-8?B?WWxrWDdqalF3dXFUb0RKWHRLRmtGZ2pkRXhZMWlsMTZ2aEl2ZFY0eXlLdVIx?=
 =?utf-8?B?U1F4R3k5WlByN1BqNGU2QTU3K01jMWVPY2ovY2pCODFoSUtQSk9JbzRBMGU1?=
 =?utf-8?B?MklUQWNITjgyWEJaMXV6dTEvL0tjVDFDeGdabkMydkZ1YWRzVGM4ZWZBMUFm?=
 =?utf-8?B?K3VQeFBhN2V2bWNubC9vbGp5VndudC9kWFNDT2JJNzJvWmtHVGwvOHlhdFFO?=
 =?utf-8?B?UDhtL1lDZGFRU2NlVEd2TFVmZHNOSm04N3V0UE5ZeUs2MThZZWo1Z0hma3Bs?=
 =?utf-8?B?WVU5M3liY090RUdpQm5VT29sVFdjSmhNamNIMldVUUhYVkgzQTBmbEhKMGll?=
 =?utf-8?B?eW0ydk5reDNKbTdpNWJQeFFtVzRENUE3Y0pJZ0VQekF3dEJBTUc2UGF4UTN1?=
 =?utf-8?Q?nRJpBmwAKi4i42l/gM6bb+q0c0PbjBiMLQNpn/b4QSkk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID:
 <C446DB6D53B706409D5D8A45BE9ADA7B@sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e9113-0107-4866-8218-08dd5a712276
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 16:33:31.2180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9604

DQoNCj4gT24gMjcgRmViIDIwMjUsIGF0IDExOjAz4oCvUE0sIEFkaXR5YSBHYXJnIDxnYXJnYWRp
dHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPiANCj4g77u/SGkgYWxsIQ0KPiANCj4gVGhpcyBwYXRj
aCBzZXJpZXMgYWltcyB0byBpbXByb3ZlIHRoZSBUb3VjaCBCYXIgc3VwcG9ydCBmb3IgeDg2IE1h
Y3MuDQo+IA0KPiBSZWNlbnRseSwgdGhlIGhpZC1hcHBsZXRiLWtiZCBhbmQgaGlkLWFwcGxldGIt
YmwgZHJpdmVycyB3ZXJlIHVwc3RyZWFtZWQNCj4gaW50byB0aGUgTGludXgga2VybmVsIFsxXS4g
VGhleSBlbmFibGVkIHRoZSBUb3VjaCBCYXIgdG8gZGlzcGxheSBhDQo+IHByZWRlZmluZWQgc2V0
IG9mIG1lZGlhIGFuZCBmdW5jdGlvbiBrZXlzLCBleGFjdGx5IHRoZSBzYW1lIGl0IGRvZXMgb24N
Cj4gV2luZG93cyBCb290Y2FtcC4NCj4gDQo+IE5vdyB3ZSBhcmUgYWJvdXQgdG8gZ2V0IHN1cHBv
cnQgYWRkZWQgZm9yIHRoZSBEUk0gbW9kZSBvZiB0aGUgVG91Y2ggQmFyDQo+IGFzIHdlbGwgWzJd
Lg0KDQoNClVwZGF0ZTogVGhlIERSTSBkcml2ZXIgZmluYWxseSBnb3QgdXBzdHJlYW1lZCBhbmQg
d2lsbCBiZSB0aGVyZSBpbiA2LjE1LiBOb3cgb25seSB0aGVzZSBtdWx0aXRvdWNoIHBhdGNoZXMg
YXJlIGxlZnQgZm9yIGNvbXBsZXRlIHN1cHBvcnQgZm9yIHRoZSB0b3VjaGJhci4=


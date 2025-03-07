Return-Path: <linux-input+bounces-10625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7AA56783
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 13:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C352D173FF2
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF982192E5;
	Fri,  7 Mar 2025 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="bra1oyNH"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011029.outbound.protection.outlook.com [52.103.68.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E4D218AC3
	for <linux-input@vger.kernel.org>; Fri,  7 Mar 2025 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741349211; cv=fail; b=FebK5QMrOE5PuTmynUwMVhA5sDzon8lcDeAURAInLJyJLDgADtB/IONpImwama7yQPHc83wPCvCqi1/cORZ30AIHxb6GkZxzzAyOvdvdX4d9mjFVPVQ2h7062c7y5kDZ3SZo7bKdui3t+TwmP86lRFuAet+vT6oQP4KiPx94/nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741349211; c=relaxed/simple;
	bh=QWW0Zo2N7DqbOKmzAgxLCOJUXN13ZiAZVH7zDOi5Zt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ozilx7WNfP7SFdULJnA3Iw1F+cq/5R5pbnVQkNNlIjndzi9CSP+WKSp/E56foShJgkCy9OyQ+Za6cEwOYNWqwIdR+sxY48TnX/fYVtoo6T6gaWrwPHJa53RGqLq1QCU+FdBn4c7Miorln3za4qmypUUB+b6aQn7DgM4QbNwXHeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=bra1oyNH; arc=fail smtp.client-ip=52.103.68.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZHYBOx//lGbBn5tC1dImUpbRqOENfKSw8GkeqWBc/CX8jf2jl1Rw4UMKeIQJY+6DMsMX0oXsvo2v8JjGTcZKLzOK1p5Ns/o8pXtKJwpCrA4uqX1VfCvZafUzDr1WuJGkQfYdk9g4Cec0Qmo9y986bJV6s2wgj5AGAoABr+dixaxCd9q0xgHqAIdCcgYbHWh8Lvmwuy/dWgGeDuB6zbiH0RmxLWMSlni+/8qpdcsTHYr7gyWvqCCAE1QNQ54G1iY3CssnHoPM2tmNXJUs/gqVgVFLGwIyyyC5qNUbIcOS2WjQfuO+yqvK6N+ZSvd3FZT78uhSKsCoUy4BmStbzl95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWW0Zo2N7DqbOKmzAgxLCOJUXN13ZiAZVH7zDOi5Zt4=;
 b=jdQ1hVDn6IcPiGJYZW+gyjswcerSx4FTjvKmWWTdshc2rZ7uFzdVOOi9Ms0EyvPVU8JOEgn5klQ2o0bMWO3LRQQcujbJvAQnzGGVIbV5bDMLiK7YF7mWxMfdGpnMRT5tzJ9BWbLscBIWb6dLQ3LRHPG5nJI6w+V3uxsn2SxpbN0ZpMSERUBQXglAKyPhS9ws9IQU6xFko0sFFYWRl0e7jmeXQAoxx1jFhQlU5I172IW+IdVcDUVVYMHooZWZYSYWfP3bvCFpySvTUMcpnaYEFRZpGCcF+XYD2apwq5F1qQUIpUehbwkIZGe/7uaVY8w6c/Hg93z+55y3CngWne+owA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWW0Zo2N7DqbOKmzAgxLCOJUXN13ZiAZVH7zDOi5Zt4=;
 b=bra1oyNHcPomXTvxRUUoufQEpRyx7rMZKt806S4L+abM7Z5AyR+tTA+ZxcrKL55P8DL1oSGx3+i8utnNZiv35l4tfhw3dv4dhDLKREBfzAqWCzo67KGnGEsnmEwei+yIYk4bmZpHSF6n/9cVaS4GOl2B59uhH9eQehSNdpHJz32IZ/6k3O3oC61SMHb3zXAzs2D2GD5cHkRGjjw1GJFXai1qVpEFVQhqOw7R05S8Jk9+rpHcmg91kWy61D/Cod9T4ZA7gEZtjq100zKEo40tnYiIsuZW+dV04TTIzc/9mB2rjc488o/CVdocVGpMSP3OTqDgQ2iFhkbeBfu8SjOLwQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5697.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 12:06:45 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 12:06:45 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Grigorii Sokolik <g.sokol99@g-sokol.info>, Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Ievgen Vovk
	<YevgenVovk@ukr.net>
Subject: Re: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Topic: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C
 support
Thread-Index: AQHbjsktiTHRxGBV1Ee2CRRU/jlylbNmd8KAgAAYNICAAQU0AA==
Date: Fri, 7 Mar 2025 12:06:45 +0000
Message-ID: <7E723D9E-B31A-4FB2-823A-5D3636AAA864@live.com>
References: <20250306070027.532052-1-g.sokol99@g-sokol.info>
 <20250306070027.532052-2-g.sokol99@g-sokol.info>
 <31E267B8-6B70-46F2-873E-4E58478E3C93@live.com>
 <C5E429C3-4838-4A9A-9D61-4138FD14BB6E@live.com>
 <CADjZRiS0uvKTxT68G3pQ44phQUG42rTf-Sv66i9--7uY3AwGww@mail.gmail.com>
In-Reply-To:
 <CADjZRiS0uvKTxT68G3pQ44phQUG42rTf-Sv66i9--7uY3AwGww@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB5697:EE_
x-ms-office365-filtering-correlation-id: 712af4fd-bd00-4ea6-8d5d-08dd5d7087fb
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|19110799003|8060799006|15080799006|461199028|8062599003|102099032|1602099012|440099028|4302099013|3412199025|10035399004;
x-microsoft-antispam-message-info:
 =?utf-8?B?bzZPM1djQ3JBUGVWWUlSUzZudGdlbGJGUThZcjlHVVBqNkQ5NnVLRXcwNkp4?=
 =?utf-8?B?RDBBY0JncXdjd0hCRisralNXNDQxb3kzNWVFcEtEOUJJTnlUR21hNVltYkRB?=
 =?utf-8?B?NUxxTnM2VUoyTEVLWmpBcmNIQW50ZW5vb01rYUxlTVBuWWFWbzYwbUVDYVdx?=
 =?utf-8?B?b1pNcUxWbGZVamY3ZmZzUWtLUlpOdlZveW0vMEhnM2hsaTUzZVIrVmZ2QkhS?=
 =?utf-8?B?UWF6ek1sQWtFKzJCdDZDOXU0QjVPRUpTOU1SdUVQdjM0MUJwblB0bHpWNFI4?=
 =?utf-8?B?LzhSV2QxbWZrTUdkKzdHb2djQjRudDh3TXNOUzlqR1NTSVIvaHdmTVpKT3NZ?=
 =?utf-8?B?dnBZWmlDQlpJVlNrVFdjNVY4QitHVFJWQ3ZkajJvZkN1Q3ZSb1hsNklYNEJw?=
 =?utf-8?B?MGVWTUhPL2E5VERmMXcwZ0FtSDBhQWg0RFVFMzJPUjN4TUsyWHUyUUcvUVNi?=
 =?utf-8?B?VDNJb1JSWHVSeVRyOERaM1BLallyNGo2clg4WFc2UWdWNEk4RlJqYmhXR0o2?=
 =?utf-8?B?SVRxRzF5d1Y5bWljY1Vmb1pkWk92a3h1TlhiZzZ5Z1VnMVgzWUJxWENkdjN1?=
 =?utf-8?B?cW9ScWp3TmNsK0dWS09JQnpKQXlvTkxGeDNwWTFJL3FwM1NkMFQ3elFmZU9h?=
 =?utf-8?B?MVltaStWYzh0WDdBdmI3Zng4bUttaThwYVV0RzJoMTRlNXNlUFcvd0M2U2Fz?=
 =?utf-8?B?MHNMUFVRRkpGUUx2R0pNZGJNUC9UMVdySm5ya05GQVBOeWM3MGpZUWZuM2Zi?=
 =?utf-8?B?WVpGRU9pdys0dFRwN0lBSTZrbGVURDBNY0xuUnZ5SjMwMTZsWWVUSW5WcUVG?=
 =?utf-8?B?UXE4VGtHTVNzekhaMi93UGcveCtEV0M4bUxtQVVXektFNTJkd0FCcFhrSjF6?=
 =?utf-8?B?aUYxSkkwRlZYak85VXZxZnovYmUzN1RGdU9Ga1ZSL1JBRHJ4Y2tldWZJZnNN?=
 =?utf-8?B?Z0xKWEF1dkxVZlRrVTlBYmpMcXhQUm1ObVJISWpXZC9nNlArQkZDRUdLUHZW?=
 =?utf-8?B?US9ia1ZtYTJMaGl2WFFlbktFOXZSRVJlSzB3ZEFibmZaUTNUQ3Zra253VWZo?=
 =?utf-8?B?L3lRVmRHQ0QyS0xDdnlZZERldzlwVkdyS0wzWGhTaXY1NUQ0dU1NUTZmNzZp?=
 =?utf-8?B?bmJaL0hjZXZDYTZSQ3U4OVlXek9DUHBDTDVnOWZrTTBZelkrSEJuZytLc2hU?=
 =?utf-8?B?d2R4VGpGWmNZanV1dmNmYXJLL3doUTJUN1ZmdHhOQXdVVHFFNC9ZWVZCekNv?=
 =?utf-8?B?NVEvTm5QUzdtaGZseExlWTlZNkNxSExpOFF1R3BmSkN1Q3FSRGhPT2UzZWVY?=
 =?utf-8?B?Q3JuWmF5cFd0b1Jta2U4dmFMYlo2YmU5OW1NL2RBcHFhdmNyL0w5d3lWZTZ1?=
 =?utf-8?B?SGFMMHd1SURQV1BtYWFQZkhBNG9IM1N2Q1FUNExsTmxabWRya2ZCQzhhV0Yz?=
 =?utf-8?B?elAzbGJ6TmlkK0RxTGN3c04xRjlEUnNORXhORjg5eFhNSkx5Qk1SV2tVS2Zn?=
 =?utf-8?B?RDhMNm9LbDg4WXUxejd2K2c3QWoxYkFzMldIZW9ETHBIa1IydGttVDNBSXB3?=
 =?utf-8?B?clFFTUMxUkxwWTNtRXZxSTNkS3FqbDlqM3Byam5ydi9DV0FJT2NWSFpERDd5?=
 =?utf-8?B?a05jckZ2SGVCeDJ1N0hZejRSRE5PRWc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWhjNFRjUVg3UWJ6VWhveVZ1SmVRelBHSEo0U2FmYW1jUThLVTUzU2VLc3Jp?=
 =?utf-8?B?UXNPV05kb01GNW0wNy9XQjZPWDV2STFSUWFPaldTTXRHTDdYTkVwb1dZYi9h?=
 =?utf-8?B?c1VNd2x5dGRvd0Q2WkNhY2o4K0xHSWVpWm5DSE5WTDdsOWVRbzhseHEvQ2tR?=
 =?utf-8?B?ZFMvV2RianpQS21BSm1aYktxdWdDTEN6OG8vYzExVVFjd2M3V3FKcHJVRS84?=
 =?utf-8?B?NUxGa0x2VXB0dUwxYlhaNlcvK1VxeHVVZzBwMTNHWVBLM3c5c3RDYXlDMURi?=
 =?utf-8?B?emxURHgxeHo4Zk5waitlOGRReHAvQ3UwMS9ocFExSExjeEszQVE1cmloME1L?=
 =?utf-8?B?UzhINnRoUm1IelBEZjg2WUxVbHlFbWRyS3V3dEJ0cEJDOURzOGVTQmlyVUlv?=
 =?utf-8?B?bjVnc1VPUVJWYkhNWlJkVFQxeFBzaEVlb1hKOS9lblpjVlN1U214eXFxcXh6?=
 =?utf-8?B?MlBRVE9EK1hRY2RXdUxTUHZwMHJLMzlCUGtJZmVqdXdMVFc4VHNJekE5RE8y?=
 =?utf-8?B?NjZ6M0I1N1d0RE5MTDlWQWEzY2dGNmhpR2xyRGJUbWpwS0xRRlo1Q2lPRFJm?=
 =?utf-8?B?VUgwQlhNUStCcU1iWXNRMzZZZGJMTWJnZE9EN3BxcjRTWThzWVJ4ODVCemZW?=
 =?utf-8?B?OWt6U25IYjFIOGtwQm42WHhRUVhKelV1NzJDekJJMVRLVnBHMVFjcm9zM05S?=
 =?utf-8?B?MWtNUTZuVGQ1MWIwaERXZFV0a1pCdFI3MlJlN0J5V25yUk9zTThPTjBPN0hB?=
 =?utf-8?B?QzdyMTJrNjZJM0ZScm5DeHhyTk4vQ2xXdnJOQWN3bXora2JxL1dlQlRuY0ts?=
 =?utf-8?B?SE1xQklodDFjdUFGVmErR0cxSjNjcEJ1NGJlRlBQbnRuT1ROaWRHalp6T2VC?=
 =?utf-8?B?UHM5bitBTGYwdjJEY1JJd1YydE9vYWM0bWt2bEdjb25uZDN3S05WbWpXcmYy?=
 =?utf-8?B?d1FXU244emU3OCs5ZmxVaUVnMUR2azNTRUEvNXdSdEVtLzQ3aUFMOElXMUF6?=
 =?utf-8?B?S3dTUUtudHB5aGpUVFU4c3hrbytjZkIyU0xYdk9VNjBmMXpNSlNORWx0VFVa?=
 =?utf-8?B?YmlGR2o4dnpQOStmdHNabW1ZekhVY3dqcEdFdW5IcGxqcGN5b0NxTzRhUGlO?=
 =?utf-8?B?amwrSVl2RDhSUDRpMjJKQVVxaWtDWkEzWTkrTnVocEZ0bTRBM2RUYlQwdDhr?=
 =?utf-8?B?SUJiYjBOVTQ5ekdLc1luUXpSbUtEck8xSlB2TldRT0R0cXdCeCsxZFVySndL?=
 =?utf-8?B?RUJiUVU0dnJQVVFsbGR5eEppemtKZWowbjhmRjFaQjhZRUZ3WWloRVozSHc5?=
 =?utf-8?B?WjJndTA1Ui85ODZ0dkpEYVlEcWhCTk0zM0hzT3pnak90em1Fd0MyUFVTOVlO?=
 =?utf-8?B?RW96T1hMSlprUnpXVzBHaytFOXNMc2tibGVENlc3YmlSMDRZWnFTRDNJMUQ3?=
 =?utf-8?B?TmhaN0F6QURaeWhPNEZncStQVWx5eW1DM0lQQXpYc3JPWVhXc3hORXVGK2Ew?=
 =?utf-8?B?dHUyby9xZDRpbmkxeHNOTW0rL3ppS1U2eEc4Qm5Iam1acUNFRVpSK3FkQUlt?=
 =?utf-8?B?eWYyMmxMZGNWbkdJS3M4VUtVV2REZTFiOFM1bGpKR252S202SSthYVd2cWZt?=
 =?utf-8?B?Vk12RlNSWkhFTHNEWGV2RFZCbExRdE5QWlJ1MDhrMjdrWS9Zd2J5dnhLWEs0?=
 =?utf-8?B?VitFRmZsbllFa3VwMDNSVytvQTFXNXlsaHM0SDBvVk1jOFl6dzlXNSt6cDQy?=
 =?utf-8?Q?biLld7anlGyCkTY9K0N2NSeR19hN0+p91+7i1tw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <125D7931960E0B4D90F37FB3A4FFCC5E@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 712af4fd-bd00-4ea6-8d5d-08dd5d7087fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 12:06:45.5542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5697

DQo+IE9uIDcgTWFyIDIwMjUsIGF0IDI6MDHigK9BTSwgR3JpZ29yaWkgU29rb2xpayA8Zy5zb2tv
bDk5QGctc29rb2wuaW5mbz4gd3JvdGU6DQo+IA0KPiBUaGFuayB5b3Ugc28gbXVjaC4gSGVyZSBp
cyB0aGUgZml4Og0KPiANCj4gLS0tDQo+IFtQQVRDSF0gSElEOiBoaWQtYXBwbGU6IEFwcGxlIE1h
Z2ljIEtleWJvYXJkIGEzMTE4IFVTQi1DIHN1cHBvcnQNCj4gDQo+IEFkZCBBcHBsZSBNYWdpYyBL
ZXlib2FyZCB3aXRoIGZpbmdlcnByaW50IDIwMjQgbW9kZWwgKHdpdGggVVNCLUMgcG9ydCkNCj4g
ZGV2aWNlIElEICgwMzIxKSB0byB0aG9zZSByZWNvZ25pemVkIGJ5IHRoZSBoaWQtYXBwbGUgZHJp
dmVyLiBLZXlib2FyZA0KPiBpcyBvdGhlcndpc2UgY29tcGF0aWJsZSB3aXRoIHRoZSBleGlzdGlu
ZyBpbXBsZW1lbnRhdGlvbiBmb3IgaXRzDQo+IGVhcmxpZXIgMjAyMSBtb2RlbC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEdyaWdvcmlpIFNva29saWsgPGcuc29rb2w5OUBnLXNva29sLmluZm8+DQo+
IC0tLQ0KPiBkcml2ZXJzL2hpZC9oaWQtYXBwbGUuYyB8IDUgKysrKysNCj4gZHJpdmVycy9oaWQv
aGlkLWlkcy5oICAgfCAxICsNCj4gMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0K
DQpJbiBjYXNlIHlvdSBzZW5kIGEgcmV2aXNpb24sIHBsZWFzZSBzZW5kIGl0IGFzIGEgc2VwYXJh
dGUgcGF0Y2ggd2l0aCB2MiBhZGRlZCBpbiBzdWJqZWN0Lg0KQWxzbywgdGhpcyBwYXRjaCB5b3Ug
c2VudCBhcyBhIHJlcGx5IHdhcyBjb3JydXB0Lg0KDQpZb3UgYWxzbyBkaWRu4oCZdCByZXBseSB0
byB0aGUgbWFpbnRhaW5lcnMuDQoNCknigJl2ZSBzZW50IHlvdXIgcGF0Y2ggYXMgYSBwYXJ0IG9m
IG15IHBhdGNoIHNlcmllcyBvdmVyIGhlcmU6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWlucHV0L0E0RkJFQTU0LUM3QkEtNDg2NC05QzRFLUU0MTkzM0Q4MUZCMEBsaXZlLmNvbS9U
LyN0


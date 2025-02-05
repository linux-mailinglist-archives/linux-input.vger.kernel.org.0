Return-Path: <linux-input+bounces-9785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B111A28300
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 04:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EE893A37C5
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 03:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823A02135B8;
	Wed,  5 Feb 2025 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="qE8O18u+"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011036.outbound.protection.outlook.com [52.103.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A556D1EB3E;
	Wed,  5 Feb 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738727424; cv=fail; b=eKLwAf5+Voq3zESGgZ3QTpPKb/toG3SoUQF3FVdxg8m8CpICe5hlmeZb1lLz90flg+qCe3jucI5zxKZgWQtm+BHRORWiP/YrV1/Db0mH5j7SyAjHAcBF8KyciqjHsXoNMy48+oiRAyvQWXvfpo0etYds6iWGeDzTcy+f+DMdXhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738727424; c=relaxed/simple;
	bh=xuIPIWhpOfI5Syia8L/NgZTmoWF52oAaFq4gqPEY/7Q=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Q6IrduMRvKeYeZ9/zruKbSSg/q6V8QTZTYn4oO/cDp/EYiaZylbSz4jPcFbp7ND5EZfr344D83zpreI32YLNBDmxpRzLkoJm21k7wktoeCTDzirU0zPylSar8EmQIGtJFqV2PkPz7SXVtRsDT1Ym+50/inI96toWKrHkbfXF98k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=qE8O18u+; arc=fail smtp.client-ip=52.103.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN7o5UESn1LXqrK9zTQUV2rdZzqpqjZ1zaMXLYJB9gjlOV5TiQXm7lnNMUQ2sowo581FTJ49/hSc/oyJeNQ4H+73QEmNHiFDEI4z/h5NA9Ah+A+S4BKffGCU4escEQx+8caBJkIlVzC4s11prL5PPppWmUZqqx0ls8a4O9BMkF3ltuatPQUbo6WRBgeos4BAHobcM290AMVfNAPg1QChsEB/RGmvClAZp2nb8evm5REB/6gDFPNTyCcPTB8zyudHQpElSUj0aegHq1JRIov1IF2YHUihU604fMK8WGW4iejc/KCY0ojxSvKJS1a7GvaksqH/spsopw6BoKVbWy6Eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuIPIWhpOfI5Syia8L/NgZTmoWF52oAaFq4gqPEY/7Q=;
 b=HB2+KKQ6MUbE8Ek8Nhl3fbUk9SjvtY+l0Byc4vGZ/Bzc9mDevEL3EUh0DGlpVapyDxJGhj0xbe6RucYjyZjwE7rKSMjDUFOo/e+onB50NsrPsQhYxcrDeiUFS9gFUPEVdQo52krl0Cijb/OjRbVdK5/ADa8LhEPYVkR84OqrmX9CuhM6T7GFv/LvUmm3fQkr8QjevRE8gwt1QpUNRClD0KYsN31BfiMH3k6VeEKfy40FHvQ4oP0KzzWLLXhmbXGq5ywN+EXQJV88uVC2uwhWsiYya7KTt6+ob7mQPuncLWR5yLLHpTdh967vg8lGmCuixxJW5m1ODhRDWefMyuH+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuIPIWhpOfI5Syia8L/NgZTmoWF52oAaFq4gqPEY/7Q=;
 b=qE8O18u+Yam29yjnmhemZBIo/itZnzDbSO7aO3R04wec22NoyNuzmc7yHOBtSQ37vkHDWykxUwB4R7nA9SYJv9s+xcw0ELHHIB3CK6se6Tj1jORqSqJSP2sIEbPylQWP+q2rfpqWxa05RbYsEP+uBB5fHEZmhwH8xUDa7LkCX5jej3UUQed/pdqTp7HS+d6SHq1GncctGEAsx80Rb4KBWKeGhdBm+rMaJH2BSxKg+Uf+zILGjZdIO3CtS9b2Cx0XQyIYtra4ytri7dJGf1SgNNJIJCtOUe87B4ur8p38h7cLCfAeRxeYEJA1VZGP7s9zU+RRmDsDCi5l5txeJXGqng==
Received: from PN0PR01MB8288.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:43::12)
 by MA0PR01MB5446.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 03:50:17 +0000
Received: from PN0PR01MB8288.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::965:c81d:f2c4:b9ab]) by PN0PR01MB8288.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::965:c81d:f2c4:b9ab%5]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 03:50:17 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<linux@weissschuh.net>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<thomas@t-8ch.de>, Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 1/4] HID: hid-appletb-bl: add driver for the
 backlight of Apple Touch Bars
Thread-Topic: [PATCH RESEND v2 1/4] HID: hid-appletb-bl: add driver for the
 backlight of Apple Touch Bars
Thread-Index: AQHbd4ESbpAPc8xWpkG215ZZCuk/2A==
Date: Wed, 5 Feb 2025 03:50:17 +0000
Message-ID:
 <PN0PR01MB8288DA05B1DEE461C605348DB8F72@PN0PR01MB8288.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB8288:EE_|MA0PR01MB5446:EE_
x-ms-office365-filtering-correlation-id: f3c64ec5-7491-4078-28a9-08dd459834a1
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799006|8022599003|6072599003|7092599003|8060799006|8062599003|19110799003|4295299021|102099032|440099028|3412199025|12091999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?L0ltL0d4Ky92WEV0V2tCUHJ1d1RLTCtBS2NBTVNHcllKVGR3ZXFDMHEwYzBs?=
 =?utf-8?B?cUJmZ2JaUzdIN0Y4RHVnd0JOMnY5Nk53czFYaTBnMzNwSTFxUDBid1BpVW91?=
 =?utf-8?B?SnZrY1RYM3FmTlhBanF0ZjFid0dKOWROUU9jVnRGUUtjUzBFWmJFZFZtalJr?=
 =?utf-8?B?aDlsdWNhekdqRTNNTmNLbmNUNy9tdm5YdVA1QTkxcm5ZTFArZTdUYlJRb2FB?=
 =?utf-8?B?bVlnYnZYVkZtaThnd3ViZkNueUErZmYvRDBMNWhMVURKKzA4WnpJM284Um9w?=
 =?utf-8?B?OTdyTXVaZHZsMHhLR0dRUWdaY2gydWtUaGxodnVtMUJhNDdENVVuclZlTTRZ?=
 =?utf-8?B?SENqT0lIaEhadlRRVjRGd3FXdDZsVFdRV1ZGVUphQXkxakxwdncwYzd3bXdR?=
 =?utf-8?B?eis1V1h6NUR4TEM0R2V5MkFvNDlRQ3VQaUhFRmdUZlB0c0NOazVKcisydzNs?=
 =?utf-8?B?TWtYaEFBV1dJNk1qbVJOb3JkTG9mM2xianZMeGV4RTlPOVNRd1gxWlh1NFR6?=
 =?utf-8?B?TlF3T3B4MUl1ZU4yeXk5U3RsMkxWY2VBTmlUQmJ5eE5PbzlBME5pL0dSbEJs?=
 =?utf-8?B?UzY2akFwZktYQ2I3UGlDejd1Qm9iV0FWMjhYQVRjN0JXMVJhN21ldUI0Nkp1?=
 =?utf-8?B?MjRyUDlubVRCQU9rQmljZlloZzRZTitTMlRpZ3NONVFTbGdsWnRhR0tpUDl4?=
 =?utf-8?B?YldXaWZ4RE5Md1AvUVVCN2NFcW9SUnJpOXRCMGo5a1FCdXJUbGgzVjY5SHhU?=
 =?utf-8?B?OXJWemZsY0E0aEx0UlpXanJrcXV3aVQwWE5YU2p4YjFMRVRKeFlDQ0NYMW1n?=
 =?utf-8?B?S0FNOEd3YVNvaHRONjdDT3AxeVJjZGtOaVJKY2VUWDhwL09RT21ualhIdk55?=
 =?utf-8?B?U2hEaytlUUN0b0ExbE54Q0dMbUhWRXlXdnMrbFphMnd4c3BxaGV0T1FZa3No?=
 =?utf-8?B?RlVIa1oyTnlTMXU2aEZRbVhHN2JVdmM5bVFHMUtVMG54d2thc2dmNXJtajhZ?=
 =?utf-8?B?azE5TVZjb1p1QkRlMkVmQTdWOHA5R2FhNStBRlNCVTJXeUpPdzNCRHdpdUNp?=
 =?utf-8?B?bDZNK2YrV0RxREpESlRKTDJaNlJraXJmMHVUVVlZVHZnWVJRQTRCRHY3SUZa?=
 =?utf-8?B?Q0l0Ym9JUWRXSnhxaG5FUS9RWHdJNTlGUFVsUXFKM05xZmFSbDZidmlvZis1?=
 =?utf-8?B?ZjJjeHBoUzAyVkJjcmpJVm5NWVJHL3c2eDVtSjBtVllEdGNIaEhSUC9DVHN1?=
 =?utf-8?B?VnI3Z2MrUHc5MEtLYXM1UXYxRkFHVkFqVVNMN2dRWDFVeENUbjZKa0FtZEYy?=
 =?utf-8?B?c3ZqQ25SajcwMEhPbW5Cam15UkVseTk1YTBJa2NhZlA3QXZmeCsrUnpqQ2d1?=
 =?utf-8?B?Vk1uVTU5NDJhNnMwK29JcXBPdE1aWkprYnVad3N5MXJkTXd3Mlc2QWVpKzIr?=
 =?utf-8?B?MDJIQmhhMS9mcG9YYWV0RDZqSURtUVZzdEJwOHRXTU9QYzhwSkF0MjU2YkhI?=
 =?utf-8?B?NThtZGcxV0MydURmNGxzTlNhU1ErekxoUlpFMWtHbWxQTG0zdU00dHFIdG5P?=
 =?utf-8?Q?bGh6wKWhsldNjbahAosIxFTzQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWlYUEoyZEpRMkdSb1dpRzZsWWkyRTdRM3dEWS9pd2t6VGJCbWJhcnpGU01G?=
 =?utf-8?B?d1l2RVFud29DWVd3dG1aalpiVlhMWkI5WU5iQTlyZW81VTQyWUkwYVZZY1Ns?=
 =?utf-8?B?ZHR3YzBPUTdleU85R3ZHSmlaMnZZWERVOTVjTzE0dUVpRW5xYjY0RXlPNnps?=
 =?utf-8?B?UE9LdVYvdnpUUW9MRSs5RkhrSm4rVEMwRjFianBhUXhuWXErS3JNVFNmbktI?=
 =?utf-8?B?R084dENtRzlyQmZRMk1lN2RINE9LN0FhanR3Y296eWZMam1pTmVDUDVOMExD?=
 =?utf-8?B?M01xQ2F2a05WQ1J2MllPMkhmQjJwcGJiQXUwNm92cGFrak12ZEh0TXNNVmpQ?=
 =?utf-8?B?V1hQYXd6RnprSGtXT2NPV0pXcGw1S1pJQ0MvYVptODFPWU5WaHVCQXhiL004?=
 =?utf-8?B?TWpReGhnbGtvMFRNRXR5OSt4UFhCVkZvaG1QQ2JWdEQyOVVXQjYzZ0NhK0Nt?=
 =?utf-8?B?N3dha2lwREVLM1pZNWlTcVdYcS8rbUdiVWZVSmxPdzgyc3ltYnVrUjF2b2ti?=
 =?utf-8?B?eWxLbUpVUDBsaDRsbERyZzUzUC8wMm1YdnkxS1lKdzl1Mmd4b0RzRmwzSWhs?=
 =?utf-8?B?bUlYelVPb1hKblJCcHZDeDNrVjZGakhCcHpmRGt4bWthVXV5azVKS004amU5?=
 =?utf-8?B?aSs5Q1NmNXlEbktWeVNVc3REeWF3V1k4aGJTbmR4cENJa1NSWjNyTmRPT0lx?=
 =?utf-8?B?Mzg4MStYSHI3TmFYU3VadkZ1YS80SnhncGg4MXo2MWRXdDY5MGtJR0gwbmpJ?=
 =?utf-8?B?QW5iY0ZjSVp6N0JEKzJxblJnQ0lZc0lXL3g1aGtiTWRUNlBUd3FPRXpZSTNR?=
 =?utf-8?B?Yk8xS1JtYmRjTWtuQW9vWGtqT0EzNFBIRi9PZkpONjJJclNxaGgzSjcrU25z?=
 =?utf-8?B?dTJ6SGdnakY3V0pyMi9YMzkxa2NlaTA3NERJNUlodnVzZmIxRjQxdmdPUDZH?=
 =?utf-8?B?MTIxakZzR0RDUTA4OUphU0RpY0VnQ3IyR2Y5eDJaSnRFSkQ5eU1KNS93Q0dE?=
 =?utf-8?B?QXd1dGhiaC8vY2VZWUg5OXZLclJNSDVST2hsaWZNRE5lRmlNNitsMURiUXZ6?=
 =?utf-8?B?Y3V1YmJobE1YMHJrUmtzTlVXU1FtT0VwdWpySHVjMWxHZGNRUjBtUWRIdUJs?=
 =?utf-8?B?ZWVDSTZ2SDNpcXRCYVNhWG5iVU1qMk9tRUY4NkYydmdXS1psOC9vR3lpR0t3?=
 =?utf-8?B?VTBORXRpYXZteGRlTVUraHNFMWFjeDJ2dW1jVzU4OWttNGpuUzhoRVpZWGhP?=
 =?utf-8?B?TmpDbmw1WURoVDdjVDN6TjQrcExrRzRrc1JZL1lVbGpxV0lqam51ekJYSVNI?=
 =?utf-8?B?dmhucEZiZHUyT1JRaEV0RXhiQ3dhNWxBL0ZOeUtxbC9UdnpScTdBdXFQZVJW?=
 =?utf-8?B?K3dsZUdTcnVlQkVLcFhnTnR5TUFSS285cWd5RDhZRi9MWkFPazN4S2tmUmZx?=
 =?utf-8?B?aUp6QlowMjhPaGFkUGNaeVhDeHFzWHlRMTBPN3IyNElLam90YlV6SEI0K3JL?=
 =?utf-8?B?Z3lRS08xeVEzamRoTFlCOEFGV1R2TENPSkZEMEdSbCsyc0h2bUVQUG9rV3N6?=
 =?utf-8?B?eGNKY2RMQi93Z3ZSN3l6ajB0RWJuSEFzejlxbjZSZGJYOWJlN3NRNFZNK2E5?=
 =?utf-8?Q?76d6Wa8FCYYIMzsbwm8mFWQgv/8fQAbirxztj80N8a/w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID:
 <79FB5392815F534B979771CF09B9712C@sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB8288.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c64ec5-7491-4078-28a9-08dd459834a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 03:50:17.6234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5446

DQoNCj4gT24gNCBGZWIgMjAyNSwgYXQgNzo0N+KAr0FNLCBKaXJpIEtvc2luYSA8amlrb3NAa2Vy
bmVsLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiBUdWUsIDQgRmViIDIwMjUsIEFkaXR5YSBHYXJn
IHdyb3RlOg0KPiANCj4+IFlvdSBtaWdodCBoYXZlIG5vdGljZWQgdGhhdCB0aGUgaGlkLWFwcGxl
IGRyaXZlciBoYXMgY29kZSBmb3IgdGhlIG1hZ2ljDQo+PiBiYWNrbGlnaHQuIE5vdyB3ZSBoYXZl
IGEgY2FzZSBvZiBNYWNCb29rIEFpciAyMDIwLCB3aGljaCBkb2VzIG5vdCBoYXZlIGENCj4+IHRv
dWNoYmFyIGJ1dCBzdGlsbCBzaG93cyBwcmVzZW5jZSBvZiB0aGUgdG91Y2hiYXIgYmFja2xpZ2h0
IGRldmljZSwganVzdA0KPj4gYmVjYXVzZSBpdCBuZWVkcyBpdCBmb3IgdGhlIGtleWJvYXJkIGJh
Y2tsaWdodC4gSW4gY2FzZSB3ZSBtZXJnZSBib3RoDQo+PiB0aGUgYmFja2xpZ2h0IGFuZCB0b3Vj
aGJhciBjb2RlIGluIGEgZHJpdmVyLCBvbiB0aGF0IG1vZGVsLCB0aGUNCj4+IGJhY2tsaWdodCBi
cmVha3MuIElmIGtlcHQgc2VwYXJhdGUsIHRoZSB0b3VjaGJhciBkcml2ZXIgc2ltcGx5IGRvZXNu
J3QNCj4+IGxvYWQgYW5kIGJhY2tsaWdodCB3b3Jrcy4NCj4gDQo+IFNvcnJ5IGZvciBiZWluZyBk
ZW5zZSwgYnV0IGRvZXMgdGhhdCBtZWFuIHRoYXQgaXQncyBlaXRoZXIgaGlkLWFwcGxldGItYmwN
Cj4gb3IgaGlkLWFwcGxlLCBidXQgbmV2ZXIgYm90aCB0byBtYWtlIGEgZ29vZCB1c2VyIGV4cGVy
aWVuY2Ugb24gdGhvc2UNCj4gZGV2aWNlcz8NCj4gDQo+IElmIHNvLCBjYW4geW91IHBsZWFzZSBw
b2ludCBvdXQgd2hhdCBleGFjdGx5IGlzIHRoZSByZWFzb24/DQo+IA0KPiBFaXRoZXIgdGhvc2Ug
aGF2ZSBkaWZmZXJlbnQgVklEL1BJRCBjb21iaW5hdGlvbiwgYW5kIHRoZW4gaXQgY2FuIGJlIGVh
c2lseQ0KPiBtYWRlIGNvbmRpdGlvbmFsIGJvdGggaW4gY29kZSBhbmQgaW4gcnVudGltZS4NCj4g
QXJlIHdlIHRhbGtpbmcgYWJvdXQgY29uZmxpY3RpbmcgVklEL1BJRCBjb21iaW5hdGlvbnMsIHNv
bWUgb2YgdGhlbQ0KPiBuZWVkaW5nIGN1cnJlbnQgaGlkLWFwcGxlLCBhbmQgc29tZSBvZiB0aGVt
IG5lZWRpbmcgKGluIGEgbXV0dWFsbHkNCj4gZXhjbHVzaXZlIHdheSkgaGlkLWFwcGxldGItYmw/
DQo+IA0KDQpKdXN0IHRvIGNsYXJpZnkgYSBiaXQgbW9yZSwNCg0KVGhlIHRvdWNoYmFyIGJhY2ts
aWdodCBkZXZpY2UgaXMgMDVhYzo4MTAyLCBpbiBhbGwgdGhlIG1vZGVscyB3aXRoIG1hZ2ljIGJh
Y2tsaWdodCwgdGhhdCBpcywgd2l0aCBhcyB3ZWxsIGFzIHdpdGhvdXQgdG91Y2hiYXIuIFRoZSBN
YWNCb29rIEFpciAyMDIwIGlzIHRoZSBvbmx5IG1vZGVsIHdpdGggdGhpcyBkZXZpY2UgYnV0IG5v
dCBoYXZpbmcgYSB0b3VjaGJhci4NCg0KVGhpcyBkZXZpY2UgaXMgcmVzcG9uc2libGUgZm9yIGJv
dGggdGhlIHRvdWNoYmFyIGJyaWdodG5lc3MgYW5kIHRoZSBrZXlib2FyZCBiYWNrbGlnaHQsIHRo
ZSAwdGggaW50ZXJmYWNlIGJlaW5nIHJlc3BvbnNpYmxlIGZvciBrZXlib2FyZCBiYWNrbGlnaHQg
b24gQWlyIGFuZCAxc3Qgb24gb3RoZXJzLg0KPiBUaGFua3MsDQo+IA0KPiAtLQ0KPiBKaXJpIEtv
c2luYQ0KPiBTVVNFIExhYnMNCj4gDQo=


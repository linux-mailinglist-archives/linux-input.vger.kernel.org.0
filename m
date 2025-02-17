Return-Path: <linux-input+bounces-10085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DCA37A9A
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37631188D6B6
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 04:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AEC136349;
	Mon, 17 Feb 2025 04:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="YBWvVC+0"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959CE15C0;
	Mon, 17 Feb 2025 04:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739767444; cv=fail; b=hgO7/oesYpfRjTVQo0cDC1cVTEe5LA9ChLk/SNlB7vHMy+IvuXVe0gwjRa6OcHGlTHWqrjvYmMmZfWC6jjKI/Y6h2Mr68ybUJZZYej9oGyKBDvXb4SpLCEmNKYst0INxg/kv3B7VJWYStxGvLTsQG1AZzyEPs3bvfoWsqS/0wGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739767444; c=relaxed/simple;
	bh=YHlhb1ZKOY3KaiRMpdTotOYDHecZ8op+Sb3TGH9ji6Y=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FC003lOQo1nAhvTB28XIp7UMztbISrNB/nRVA4gqYL556KyRf55i6NgplDhXL5zWLv4lzIGCRD2M9BDuPevVqZw9C9RM7MAQdW4LScsRV0uFU88iPAXtIO/a0vjZ4ptDn2eqbMv+CUIJwuNYRQN5mkWSYzi76kxcAqKroswjJhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=YBWvVC+0; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c20cgKNluBuoYnY2St0KiQMaJDa3OgPLVQW5YKXyt9Chvtwt9EcK2b3dhFlwHuSruQFDa6vcfvTcxSeoJ3Ij5mlfp+44dxI8JC2jcVpSR51y1rqkM1PBEX+ZIaeC4UgGSXLe1irfIERQwyrN5FfkFl3vVvmb6lb8yz/IqBXlUEUOKfpYHvPKMqVc4VF+anGinaHvY3fh7EVV8TxVeaVk8S4MNUepP0PcvSGwv/TKJrWV3p01PTWVYVf5nMRWGrZmtMz4Rnxdhbby/7KqxAgu5/LS4uZOJTG/NeTvtRzbMyp0ux7DTEPyJSWHoVccW5zilt2Rj875aVm7L8EhdQRWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHlhb1ZKOY3KaiRMpdTotOYDHecZ8op+Sb3TGH9ji6Y=;
 b=Gx0G75trn/AhCw90T/L6cjPvuTDD9cohI9dBs75/doq346Gm+H4vr05tIQCkI5yZi+VxCpZp2TLfEEYP6w4jVqv2//sq5cZPpft4UYg3HtTfctBVowgZZCjRGyoTXpPR7DXtxHolROcmuEm7qRjYSxUjkiLwjsVAwrlY7GxItGwE7TabxaC07c3jloBwmgGK1tz6VepC74G/umSyqAH4QFXCOEdkj7aHskyFZJC6LIXMWCy80HQWIUZHtLzOBVWWSEyQfJLCMCxcq96QlEeGBE8ZJ7oIUdQUyazRdBIjMF56Vhp8CO0WPGrI0Ca79TNjHcl9DSUouO+feeyh15ojpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHlhb1ZKOY3KaiRMpdTotOYDHecZ8op+Sb3TGH9ji6Y=;
 b=YBWvVC+0bJpUb/zT2wstI4NUTHO6zY+nctIzBuMJrmq8mlnpCV5ZXqxCy6rChfSngnqu60V7An0NFrJOzrtgfAtHttFpIM5VgwC8fotRR7ZrHLS3pN4VfSTKHZ3EhpitEZltqeGKq7rjowVO9fpCblCiCRQ81fEP77/zjLIRpf9y9MrQ5OPx507ndHnIzjZR4wWII7JG4sjk9mbSQvndPrw6kWrdzdhBWDJmCpMi7Ve/lL87APVpaA4Lzj2YC/RyMWAfiuObUzUJWmnzRWVHd0XT753PMzNyJaia1SvMKmT4gW6ckIl3KHIHZM7gQiOukmjZFuif3VKWiQIL/+pAQg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN3PR01MB7015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 04:43:57 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 04:43:57 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/3] HID: hid-appletb-kbd: simplify logic used to switch
 between media and function keys on pressing fn key
Thread-Topic: [PATCH v4 1/3] HID: hid-appletb-kbd: simplify logic used to
 switch between media and function keys on pressing fn key
Thread-Index: AQHbgPaN5rsIxIjWmES8Fil+QZv1mA==
Date: Mon, 17 Feb 2025 04:43:56 +0000
Message-ID: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN3PR01MB7015:EE_
x-ms-office365-filtering-correlation-id: 1429c17c-8fff-40c4-bc5f-08dd4f0db07a
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|7092599003|8060799006|461199028|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?b0JJcndIU0cwQWsyVElQVEgwdEFrL1B6NmNES3JzRkcwWTlUSkJ6L29jVE5T?=
 =?utf-8?B?SmJGQ3I1WGU0VWQ0M3o4L1FoM0pEUXlYZ1hzOU1JYit3L1FxdmNWR3Izd0sr?=
 =?utf-8?B?TzVFdDRWUWRETWFvZUtodmpweXRjY1QyZ1lvZ2VQM2JPaHQ3RUlUN3drTDVw?=
 =?utf-8?B?cFJITVZRWlBMd3craG1qK2R2ZkVQSjFTaDZtUllhUFl0VzNCQ095TjZaVzNV?=
 =?utf-8?B?dWphMUJnT2Q5cFZLb1gxclM1N1o1NTVWckdZMmRUYXd3bDRPYzRKMkpIZXVp?=
 =?utf-8?B?MnBmUGhncEEwUHRJWm5uWlJGOUZnYkNqVWpadTIxT21LblZsZzlSa3RVeFIr?=
 =?utf-8?B?aEVKNVJuTnlRUWtuY3BITk8vU3ZnbmJ4VWYvc1lIc2dIU2xYeVkzNnpPV0tU?=
 =?utf-8?B?L0Z1MXZESnRJazFhK05vLzM5UWFoZTNkNXIrRGtpVjY5MEdXL1ErdGk4UFdV?=
 =?utf-8?B?cXlBbzFlb1ZLekZmdlp1QkRLL0h5NE1hRHNlWmNCSVg4cmZmVHFtekRiN3FM?=
 =?utf-8?B?UDh1Q2JPWUs5bmRrRS8rLy9qSzAxcEE4ZmRWSGlXZjY1NWhwZnpTT3ZuMno3?=
 =?utf-8?B?bURDemFXemwrODNSL2pla0tPQU94NFpuOHFCYlY5QkdQdG5vbGVlZU9DNjBY?=
 =?utf-8?B?UzViS0NkTW5kOExlUEltQTNEeEVPVUVSaW9uYVlQWWg2SjVzZWMxUXhYMGVL?=
 =?utf-8?B?OG5mcXVFYWFhNG5GYjVtYlFJVXBWUjhLWG9Vdmd2Nm5vS3Z4TlNucXhCeTJL?=
 =?utf-8?B?Y0JUdU42NVpxRk1oUmNSK1R5dzE3MitGOE91SkF0aTNiYUJnUmpBemNITlZz?=
 =?utf-8?B?M0xoMWdvSmtXdnQ1SHl0ZXJIblVJWXhtNHNSODJvbEJQV2o2aDFlM1FQaEx0?=
 =?utf-8?B?RWE1SU9BRW9tMHZtQmswZFQ4QW5VVld2ckovdzdDckY0bDlya2ErbXlFNFpa?=
 =?utf-8?B?MGx5UGdVdW5wS1oxdjZFWjZvWndJWnJBcDBuS2pqdmhxbGoyWU5Yb2hTZlhu?=
 =?utf-8?B?Z015WlllSlZNQkwzUzVmRlQycElWNmNSM25hSlVVdDBnR293aWNaaWFxYXIv?=
 =?utf-8?B?Sk96L1FPdmRoS2poQllMYXZZNjZTR3h1aXFmNnkyR3lmdWdzWXlVbjZvWWFW?=
 =?utf-8?B?NkpqUmtSVk41cWZhVStBWlNOdFQxRkRNY1QwR29zWWhPcnlES2tVMmVoWTE2?=
 =?utf-8?B?dDVrZFNIUElkWm9GWHk0MEFQZ0p3WVNhdmkwWHhjczNOYTgzVnBtWXpod3Jl?=
 =?utf-8?B?ck1sREZ5TS8vRFd5TjB0allaYkV5b0hQSWFDeHN0MzI1UDdrNmVReW1rcGJu?=
 =?utf-8?B?MkwwbkNvdDNISlVyQlRzS3l2dnFWMHZNdmZsNXYxRnZtR1ozVEZ6aVJFNjhp?=
 =?utf-8?B?S2FHRXFPVDJkNFhVeEFWakJiU2Z6anlJS2l0K0ZnT0VUajV2dDgxL3o4U00z?=
 =?utf-8?B?cFdWazFlcW5HRzVrNzd4NXRyOFBOVzhCVDZjOXhRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODFncnJER2RyYllHRFRZV3AzdG1mTW00Yk8xRW1JZ1RheDZsRHJUa2FUNUFn?=
 =?utf-8?B?NW1scGZiRk9USlkxbUlYRDZzM1hyekh2MEJaaE91SWJqTXZiMTFRekVFSVFN?=
 =?utf-8?B?MUZPMVd1ZCs5aW5KamgrdXpoTWZWTHZ2c3VTczNHNXlabjUzT3dyampjaDhE?=
 =?utf-8?B?MkR0bjcwTCtsNGR4S29ySkNqVnZQb3ZSQkJINFlSbThWZ3hTZ1BtQ21nUFJt?=
 =?utf-8?B?M21jUjNpZjNNUXErQmsxWVdKdmtDOUY4SVBBNzZGL1JhdVFqWFdlZzN1Y2Mz?=
 =?utf-8?B?V1VWbi81cFBLb0JBdXNIczhLUXhJci9zRE51b3NmZmU5SXZsRFR1Nk1oRHVW?=
 =?utf-8?B?QnlRK2U4RURlb3pzNnNvM3BteGVKTE5CSkRHcStDYjZzQjFwR3JtUnN2b0xh?=
 =?utf-8?B?cU44VWlJck5PNkNid1hPZXpzUitPSk92SnF5bjZFUjhuOU51bW9RL1pOYTk3?=
 =?utf-8?B?clhuWDd0U2hYYUVReUxDTENRa0RBUXBaTTRRN2dTMHR3ckcxTmR6L2NwNWkr?=
 =?utf-8?B?eXNhSm9vN2hRZ2kzL1JXZ0lqQ2FENE9zNEZjaW9EV0ZlYmw3K2gvVzF1TURU?=
 =?utf-8?B?WVRvamk1NmVqOEtkNERTWVNqTEpBNFlJZ2djUXVLY2RQYVRuNGlRRkpTWHox?=
 =?utf-8?B?dXMxWlpmeGhyWjZyeTFlZTlDTVJDVjNXUjAxbU40WkFFMFBSUHEwNlluelA0?=
 =?utf-8?B?elNaaEZ2dlZDb1NnQTRzSGg4c09EanZpeWpuS3ZrdGtHc3BVdWtaQVc3NjRh?=
 =?utf-8?B?VXlLZ3g3T3hlL2tRa0Y0VUhTRjJ2YTQzUWJPRzRxR3R5ZDhOR1NnTWRuclE3?=
 =?utf-8?B?MmVyVkJFalhDa3JrK05mVk1CTVNtWmF2Zkg2RU1EYVFqY1AwVktyWktTaWpN?=
 =?utf-8?B?VHoxbEhxZU1FamtzMFV5N0VkOUc5MHJGbUh5bCtiODJLWHdGeXlBYjhjSXV2?=
 =?utf-8?B?aldJM1dXVlI0SEVOVkxpTWdkdmZLUXhUaEE5QS84bTBtWjF0MVRIQjNSMFhD?=
 =?utf-8?B?dk8vcGV2eG9QMXNHdzdJMVVPUmE4dEw4VnBDQVV5ekhBMlcxODkrZ2NnaTl5?=
 =?utf-8?B?SlhNSzVDSkVURGhNQjlNanVXcTh5aWc3cEhXOHMzRkw1eVVUL0ZaRWpOM2JT?=
 =?utf-8?B?aVo2NlpOME9mUUlVTmV0TkFtZmpoRi9zUXV2OU1KTGdQSjEySTJKWHZkNDh5?=
 =?utf-8?B?QmtMcktUQkpHNFNRNmRrSGEwakNkQ0MydXlBUGJBYkdTNklLNVd6a0ZGWEs4?=
 =?utf-8?B?eEd4ZGg0bEwwSmV2YVVRWWpUVTNBc3ZpVXR6alIxYXgrTEYxTHd5bS9xaS9L?=
 =?utf-8?B?Z0hOVUdCMko0WlI1Si9Icy9kckNrSGFueCt4YTBLY2Rkd200N2RtUmhWaXA0?=
 =?utf-8?B?TW5KOXp2UDR6aHoxOUJqN0dPVzNpV2tKU2pVOGsyZ2hkOVBPclRqNDlEZ21x?=
 =?utf-8?B?NEh3eHdqSGVqeHVLNVlkbmVhL21PK3U1UE5oTVVFdUtaNVpXcUszYUZleFli?=
 =?utf-8?B?aDlNSzYrUUZNUko1b2I4dTFuR0FCb0VHM0p5Sk04NWhHaFVtVER6UmtUK2c2?=
 =?utf-8?B?am5BQ3h2ck9Ea1lDVE5GYUwyOEpVekp5ME1TVUNQWWFoeWZ2SzJVUXk3dFFF?=
 =?utf-8?B?ZDJYSGxYL0c0dWJkTVZiN1ZrdVJSeUpxNk5DbHFkRWN6UlhhY0ZseDJyekts?=
 =?utf-8?B?UERGYmVwbWZlZjg2d1d5OEl0ZzUzTll0SmMvaHNNZURKMSs0aEZwMnNINzlI?=
 =?utf-8?Q?2lMbISvGylimwNxN0ye6UjD9uelDcIFmHuGNNkL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEF5B5FCB6B5BD45920784921A964BCD@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1429c17c-8fff-40c4-bc5f-08dd4f0db07a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 04:43:56.9850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7015

RnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCg0KVGhpcyBjb21taXQg
c2ltcGxpZmllcyB0aGUgbG9naWMgaW4gYXBwbGV0Yl9rYmRfaW5wX2V2ZW50IHVzZWQgZm9yDQpz
d2l0Y2hpbmcgYmV0d2VlbiB0aGUgbWVkaWEgYW5kIGZ1bmN0aW9uIGtleXMgb24gcHJlc3Npbmcg
dGhlIGZuIGtleS4NCg0KV2Ugbm93IGFsc28gcHJldmVudCB0b3VjaGluZyB0aGUga2JkLT5zYXZl
ZF9tb2RlIHZhcmlhYmxlIGluIGNhc2UgdGhlIGVzYw0Ka2V5IG9ubHkgbW9kZSBpcyBjaG9zZW4u
DQoNClRoZSBmb2xsb3dpbmcgc21hbGwgZml4ZXMgaGF2ZSBhbHNvIGJlZW4gZG9uZSBpbiB0aGlz
IHBhdGNoOg0KDQotIEEgc21hbGwgY29tbWVudCBzdHlsZSBlcnJvciBoYXMgYmVlbiBmaXhlZA0K
LSBGaXhlZCBzcGVsbGluZyBpbiBNT0RVTEVfREVTQ1JJUFRJT04NCi0gSSBoYXZlIGFkZGVkIG15
c2VsZiB0byBNT0RVTEVfQVVUSE9SDQoNClNpZ25lZC1vZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJn
YWRpdHlhMDhAbGl2ZS5jb20+DQotLS0NCiBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYyB8
IDE1ICsrKysrKysrLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQu
YyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQppbmRleCAzOGZjMGU1OGMuLmU0NWNj
M2FjNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQorKysgYi9k
cml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYw0KQEAgLTIzNiwxMyArMjM2LDEzIEBAIHN0YXRp
YyB2b2lkIGFwcGxldGJfa2JkX2lucF9ldmVudChzdHJ1Y3QgaW5wdXRfaGFuZGxlICpoYW5kbGUs
IHVuc2lnbmVkIGludCB0eXBlDQogDQogCXJlc2V0X2luYWN0aXZpdHlfdGltZXIoa2JkKTsNCiAN
Ci0JaWYgKHR5cGUgPT0gRVZfS0VZICYmIGNvZGUgPT0gS0VZX0ZOICYmIGFwcGxldGJfdGJfZm5f
dG9nZ2xlKSB7DQorCWlmICh0eXBlID09IEVWX0tFWSAmJiBjb2RlID09IEtFWV9GTiAmJiBhcHBs
ZXRiX3RiX2ZuX3RvZ2dsZSAmJg0KKwkJKGtiZC0+Y3VycmVudF9tb2RlID09IEFQUExFVEJfS0JE
X01PREVfU1BDTCB8fA0KKwkJIGtiZC0+Y3VycmVudF9tb2RlID09IEFQUExFVEJfS0JEX01PREVf
Rk4pKSB7DQogCQlpZiAodmFsdWUgPT0gMSkgew0KIAkJCWtiZC0+c2F2ZWRfbW9kZSA9IGtiZC0+
Y3VycmVudF9tb2RlOw0KLQkJCWlmIChrYmQtPmN1cnJlbnRfbW9kZSA9PSBBUFBMRVRCX0tCRF9N
T0RFX1NQQ0wpDQotCQkJCWFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwgQVBQTEVUQl9LQkRfTU9E
RV9GTik7DQotCQkJZWxzZSBpZiAoa2JkLT5jdXJyZW50X21vZGUgPT0gQVBQTEVUQl9LQkRfTU9E
RV9GTikNCi0JCQkJYXBwbGV0Yl9rYmRfc2V0X21vZGUoa2JkLCBBUFBMRVRCX0tCRF9NT0RFX1NQ
Q0wpOw0KKwkJCWFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwga2JkLT5jdXJyZW50X21vZGUgPT0g
QVBQTEVUQl9LQkRfTU9ERV9TUENMDQorCQkJCQkJPyBBUFBMRVRCX0tCRF9NT0RFX0ZOIDogQVBQ
TEVUQl9LQkRfTU9ERV9TUENMKTsNCiAJCX0gZWxzZSBpZiAodmFsdWUgPT0gMCkgew0KIAkJCWlm
IChrYmQtPnNhdmVkX21vZGUgIT0ga2JkLT5jdXJyZW50X21vZGUpDQogCQkJCWFwcGxldGJfa2Jk
X3NldF9tb2RlKGtiZCwga2JkLT5zYXZlZF9tb2RlKTsNCkBAIC00OTcsMTAgKzQ5NywxMSBAQCBz
dGF0aWMgc3RydWN0IGhpZF9kcml2ZXIgYXBwbGV0Yl9rYmRfaGlkX2RyaXZlciA9IHsNCiB9Ow0K
IG1vZHVsZV9oaWRfZHJpdmVyKGFwcGxldGJfa2JkX2hpZF9kcml2ZXIpOw0KIA0KLS8qIFRoZSBi
YWNrbGlnaHQgZHJpdmVyIHNob3VsZCBiZSBsb2FkZWQgYmVmb3JlIHRoZSBrZXlib2FyZCBkcml2
ZXIgaXMgaW5pdGlhbGlzZWQqLw0KKy8qIFRoZSBiYWNrbGlnaHQgZHJpdmVyIHNob3VsZCBiZSBs
b2FkZWQgYmVmb3JlIHRoZSBrZXlib2FyZCBkcml2ZXIgaXMgaW5pdGlhbGlzZWQgKi8NCiBNT0RV
TEVfU09GVERFUCgicHJlOiBoaWRfYXBwbGV0Yl9ibCIpOw0KIA0KIE1PRFVMRV9BVVRIT1IoIlJv
bmFsZCBUc2NoYWzDpHIiKTsNCiBNT0RVTEVfQVVUSE9SKCJLZXJlbSBLYXJhYmF5IDxrZWtyYnlA
Z21haWwuY29tPiIpOw0KLU1PRFVMRV9ERVNDUklQVElPTigiTWFjQm9va1BybyBUb3VjaCBCYXIg
S2V5Ym9hcmQgTW9kZSBEcml2ZXIiKTsNCitNT0RVTEVfQVVUSE9SKCJBZGl0eWEgR2FyZyA8Z2Fy
Z2FkaXR5YTA4QGxpdmUuY29tPiIpOw0KK01PRFVMRV9ERVNDUklQVElPTigiTWFjQm9vayBQcm8g
VG91Y2ggQmFyIEtleWJvYXJkIE1vZGUgZHJpdmVyIik7DQogTU9EVUxFX0xJQ0VOU0UoIkdQTCIp
Ow0KLS0gDQoyLjQzLjANCg0K


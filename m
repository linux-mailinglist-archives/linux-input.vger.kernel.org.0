Return-Path: <linux-input+bounces-9865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EFAA2DB82
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 08:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4680E3A595B
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 07:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED15C18035;
	Sun,  9 Feb 2025 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="QAeZKadV"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010003.outbound.protection.outlook.com [52.103.68.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D12F30
	for <linux-input@vger.kernel.org>; Sun,  9 Feb 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739086244; cv=fail; b=Ou3QhNfGkuG4LqXThu2CCPXP1qvEzehW9tHSeLV3M0EXTet6lCfyfmpuTPtwo4RvZnVvpNF1MaBMpUQzobsBfDUGEUSyFGRVFvOYZHXu0avZWM1qUNym/9clZhJOTA38ES2Xt19ye3+x6cEfk51UXP2CpIDoK9Sk/aCQynThsLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739086244; c=relaxed/simple;
	bh=lI5ggas/x1I0FrJyagnakuFe/3Sog9sQBMVij9iUTlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RvnCgoouYmA8IQlWCLXn1xAtilN4uHUgudazmytNww52NeRWMF7g+/0j4XiKTD35mgiwNP3lyWJwrTIpRa3JAdhPwq/i7bWaErV9i+zWRxoiC0KnFccX4gCK2WcCA/0Almt/+O4SGgkAJXpz17MrjMNAM3xkOwpfGtRk4LlUdrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=QAeZKadV; arc=fail smtp.client-ip=52.103.68.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KV5pxIadSKPAw419JtXY8fSaG6RIEiCyOxHNpmoGqWOcYQYRyDs9DUgqgdELCzkAXwod7ccelFfHFLWKiRKPPOAgGrTHuCpXZks/nkBCCHwtK5pCU2wbowKr14k237Mf50QQlKMa4ZiILqEnuwdISPPYuKCMAb+5mnd+ODwHTfjGbvFmFHBofmIYXcoR74vtchMcTb1A99IRzxdDDeBCOfdjU724vNGGuc+d+GIAz8WukRtbI5IiEy+8wb0BxfqVNOee7ahG+D09IEqahuy0v6HgO44xverDD2odtlieXn43C+TDHl8sSwKJ7KOztpxtzar1DLk3vePobeH9gRUt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lI5ggas/x1I0FrJyagnakuFe/3Sog9sQBMVij9iUTlQ=;
 b=DSr5DM0zsqzV2LihVFMUevfG8xwLx7A+/ydxXeuyi8cnZ+RoJC17ybbxASBZw2nMC8R0knNlVN7TZArTuDIQCTDtM99UcEQNKa8ZawPuy8ZNg5aeVhAxt07/E1u1Q+H+9hn7sy61sYxroA3mRr+M9f+xc8E9wHMIuj2moP9EyEwQwFAPI1OuBj4XJDtC1JK/pTUPGUXKGqsV2vEvBUtWY/8haXi6B0DSvpyBPXJiEC66KK/FtfEbTrp584sP/Mpdw8MmorFJClgNd9NF2BoInEQ9RteP3w299FXKvCPzIbBjGt6FoBEMEKDeADJ+OkkGfkPL/w8TcDEtILpoE7GxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI5ggas/x1I0FrJyagnakuFe/3Sog9sQBMVij9iUTlQ=;
 b=QAeZKadVlzoJ3l8LQ/t7p5fF3xjEzCsUlkkjekK832WLmyLHFXpYGUZwktJkGZRv5XnHX2zdLnC/PPkUFmOgvmr14RwQ/X2GT+q0F8PLyEeaINS6jhXWLjw3gc9rBgoGvvzjyZRIaaaf7v//LVjqzEn7FAZVxgrw2b6dJfk2NE0Z5ao7vN0BXNU50fOJVRi/NEjXViv9BH4Oio0HQAsROr7sgR9CE0tGyw23dcXSP6Rt/hZgqU4HCFIFscvn2cbCVouMnL+k4nO8UCCZKdNKLAs0aO54hZZiv+Rcq1jLUNp6m1p+TabslCsDCrdrZtSTGul/vdtd+aLVpraQwGwWaA==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN3PR01MB10379.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Sun, 9 Feb
 2025 07:30:38 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 07:30:38 +0000
From: Aditya Garg <gargaditya08@live.com>
To: kernel test robot <lkp@intel.com>
CC: Kerem Karabay <kekrby@gmail.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>
Subject: Re: [hid:for-6.15/apple 2/4] drivers/hid/hid-appletb-kbd.c:119:18:
 sparse: sparse: symbol 'appletb_kbd_attrs' was not declared. Should it be
 static?
Thread-Topic: [hid:for-6.15/apple 2/4] drivers/hid/hid-appletb-kbd.c:119:18:
 sparse: sparse: symbol 'appletb_kbd_attrs' was not declared. Should it be
 static?
Thread-Index: AQHbeqSRi0NvRdMETEuilhP4auL2hbM+k7AA
Date: Sun, 9 Feb 2025 07:30:38 +0000
Message-ID: <0D0DB51C-2D9A-401A-B471-42A027CA45E0@live.com>
References: <202502091105.ZsLoBSIh-lkp@intel.com>
In-Reply-To: <202502091105.ZsLoBSIh-lkp@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN3PR01MB10379:EE_
x-ms-office365-filtering-correlation-id: b266e36a-454d-4d28-a593-08dd48dba660
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|7092599003|8062599003|19110799003|8060799006|1602099012|10035399004|3412199025|4302099013|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?UDRlSG1jYkJ5Sjk3elZEem1BbUtadEpqSG1wMjJNRm85R3hhbXloaldxQ0F1?=
 =?utf-8?B?MWkwVW9vOU9Qdk53ZU5SMFZOelF0MmVaMFBpUXpFdzdEK0d0MG1TK1hFdzU2?=
 =?utf-8?B?dEdkVnVNTE1jVzB2K0E4TW41NGcyaGl5ZDdaTk5SZThsVzBBd0NrdktUU2Jj?=
 =?utf-8?B?MEFMVG9jaWpQWUFGZ0FWamxlTnNmZE5WeHRtWC9CQUd2T0R2b1NTTmFlODFm?=
 =?utf-8?B?c2xKamV6Zjczbmg5MkNBdGxVM0cxMmxZVG43N0NYWnlNZnRPKzJma3VLQVBI?=
 =?utf-8?B?RkdqUjViSXFYZUM1M1VNUFBtb2ZFK2RBN3ZSamRCa0cyd1NoUzZhT3RQd1Y4?=
 =?utf-8?B?UWIwQURxckVuVzNScUx4eFhKbE81QmVHYndlTk1SUWZETmRVeEIxY3lxQnd3?=
 =?utf-8?B?V3RYNHdHM2FrU0taRktyWTBrS3czdEpqeXVZcTZ5bHNIQXZXdGEzdzYyRjZs?=
 =?utf-8?B?SmRwYzJnQTdpR2tiMnRRbzRnOFg3cjdpS1F2YWFCUm1GbkEreVFIbjFjWFdp?=
 =?utf-8?B?ZWxoZVROeWREUlh1cUZ4UmdOL0loVTI1VHdWV3hlUnFJUjBoTm9OcldyWXpq?=
 =?utf-8?B?QTNjUlp2Mm9qQXMrS05QTE5Ga0lFQkFxNCtQVmQ3akZKZnJYcUZRQnlISXpx?=
 =?utf-8?B?dUIvSDNnWUtBUjQ1MUVxM0E0Yy9nSmtVMlpqR1d2SUxQY0dWc3B1aXdVS2Fm?=
 =?utf-8?B?WG5MaHpsZUpOY0RZTEJyMXR0ODNnMUc4bDZlWlNobkF0RVRwWnRRSTN1V0Na?=
 =?utf-8?B?N1c4THlNYWhiSEpkeGJOOXQvOTJIUEkrek1aWW9BUE9UWlVucGN2c0xUWklz?=
 =?utf-8?B?MWlidkQ5MmNUbzJMaWdsdlZhQ2tpZjBGbE9uNzFZMzd3SG5qRlkwcm1vRjRH?=
 =?utf-8?B?NDZXL3BZU2g4TzlRdHhSMExjMHRYRWVJT2VpMDhTVkw0WlV4L3lFTE90MlJJ?=
 =?utf-8?B?dDBoeXJocmd0RDhTdnFBOXU2bFNreE92SWdUMVVieURRdFAxbUdNRm1weDRZ?=
 =?utf-8?B?aGhkVmZ4SDVJUkRDS1dqbW1ZbnZyb3VXa1o2NllOWHFNNGRpb2Z0T2dYcDU3?=
 =?utf-8?B?RHV2Y2V0cXhPYTlnb1cvREgycTFpK3lmaVJUeXREdU0vR1JGK3hobDI5a0pE?=
 =?utf-8?B?TUtSYTlvWkU3RDIyejhVMjBERFhneVR0dnhGSTRxazNzUXI2R0J6VUZ5UnpG?=
 =?utf-8?B?MXkwd0VpREIzQndGdTZTSTRYMlN5aVBNMGp0eG5tMWFHcW9rblFKSTVRYlBJ?=
 =?utf-8?B?cFBSWWVmUHBra2YyaXJaUEFFV0NZdG1kS1JSYkJNeU9LMnFFb0NkVklMdVFS?=
 =?utf-8?B?b0QxZDdjVTZYVmJNVFk5YVVLNHhhaFNHdnVFMmNHYU5KOUpuTC9DeG9RZlBi?=
 =?utf-8?B?R1p1ZGVFQkJXL1VBMDcwTStHY0hHTkNRQWZMa0RTWTRIQlF3Qzh0K3N1ZUtk?=
 =?utf-8?B?UTE0ZElJQmtRVThMWm9OZWl3T2R0QU9Qekl4aWpIT1FDWVQ4U1k5VG5BcVBC?=
 =?utf-8?B?NzAvaUNCelk2NDN3R3F5R1c2KzdmUzNPUGlaWmV5Y3RNL0FRUVg1M09Dd3pa?=
 =?utf-8?Q?F592tV2MqKEphPEQkhAJgObCgt+wjG4BxWKCDbp8DKOl3x?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmhldGt0bE0ycUQ1Z3Q2Y3lGc29RNllSK3BXZG5oaVB1ODBmQ0tCNmVNM01i?=
 =?utf-8?B?UVNHT1JYLzQrNzBERnpQdHN0Smk0bGNUWDlVNC9ZU1RTRjFZckhMWWZISjEv?=
 =?utf-8?B?c2orb25mM1hMbDZwQy9ycE5RMSswUjd1SmdvRmFZNUpUVEVtS0Zab040Z2p4?=
 =?utf-8?B?QW9UdzZRZHdtQ2N3bitudVpMYW11K05vSGxyRGVVbGdjMVBSdnJtNHB0K3VI?=
 =?utf-8?B?NDF6ZVpMb04wZlhyVkw1V1pHdE1TL3RadkJ0MDBqSy8vM3N1WG04UXpKMkdx?=
 =?utf-8?B?RDJPSXRrY0JQdHBLY21jRzJNVElhSXpxTmkvcUErSGhmNHRma3FqTkFOLytB?=
 =?utf-8?B?USswcDBFL0FsUE1PZ0w3bkpOZlkrWVY1MEU0MHd1UTJwaDdqclp5b0Q1blVV?=
 =?utf-8?B?RXk1WGdzazlNbTdEZGMxZktKZHRnRTMyNDlJd2RjRkdLWDRsQ0xoRnZrTC9i?=
 =?utf-8?B?Nm1jektoMGVrbDFnTVVzd0dDZnlSRUp5K1hMaS9ZdFI5djhNcG9RTDROOEI2?=
 =?utf-8?B?UEdOMjAvbTFDaGh3MkZUVWlYYmkwQlhGUnJ6TlVCTVFFa3JGRkNDQXpQY3pq?=
 =?utf-8?B?N0hGdS9LbjVBMlcvdnlOTzdZRHh5N3VEUDZzRWh1b2UyTjkrOVp3M25EL3Fi?=
 =?utf-8?B?SjRId2VCTHNXTzN6TldveHZhZGNSZERMUlBRTFhBMzh3Myt4N055cjRtRWQz?=
 =?utf-8?B?UDBnRDdhNUZrT0d2SUZnbFI3UmxXN0YzdzB0dHBSSGxtZkhnUURqVEl1bzZ0?=
 =?utf-8?B?dDhTVjBXb2tEaC9BRVp4TVlyQjR2SXkrYVNUblZxZFJvajhCNmp1clgwTDht?=
 =?utf-8?B?VytoeWxPZkJPTWlTbVA0ZWt3QkhJTkRQYzBJYkhTR1hQUGg2dVBVaGJ4d1BN?=
 =?utf-8?B?WG5PU1Q1N2R5NmdYMkNETHJtT0xFUjdlVzlUdW5hZi9ndSsyc2VSY1Y0WGNF?=
 =?utf-8?B?bGIzczVZMDAzZUliTkpqSUtBOHp3enBGd0RLcVZLZ3RrSDIxNEx0cDdsZ2JK?=
 =?utf-8?B?SU9BZ0JIR2VKc0dCMExKdWJQS3FKZ1Z4cUc1emN2WHZMRlFDdSt3c1h0NTdW?=
 =?utf-8?B?UUZjUnhaeDdVNHVyWWZBanpMd29tUm5GUWFnWVplLzJnd0thTmVUZVRtWlN5?=
 =?utf-8?B?cnNQbEhGYWVOUVVEMzI2NGwrcU1xbnM0L05VZnVOejEvSXRwbW95bk5lQnZm?=
 =?utf-8?B?cG84bnJYN1JQUHJEM0J6aWtVak5NOVFYa0FpTmVaczJrZTNTTURKaWE5T2E5?=
 =?utf-8?B?ellzTnFaRWgzMk1mbUJxblVHWHNuVDZYc2NTNzhsOXpWUVkycGF0Z1pvaEVn?=
 =?utf-8?B?VjBsRk12bVRyVzFSUVMrdXBHVkM3VGpXUDNDY2hGTFI0MkN3ZEFudDFQN1pa?=
 =?utf-8?B?N0VqYzhHbm53YnFuczVoNTQ2ZjdwSGN6bllpRGdyRWk5NjdoeTdIM2RDK1Er?=
 =?utf-8?B?Q2VoTGZleUFoQ1Z3Zks2SUtEWVZuQjVIV25YdHk2dnpqQ2l2TzJQK05mYkJr?=
 =?utf-8?B?YXp1SnNXTVY4dld0eHhENFVaSDR6bGNrYkpwbzNJZkhMVFJJR051bUFIdXF2?=
 =?utf-8?B?Vy9NMUVFWXFva3NDSXRQcy9jQUk4cDRkTGl1UGtwQTgzcmNFeFh0aXNWcHVC?=
 =?utf-8?B?cDlHZVd5enhmdHptMzNMZzBObTdZRStnYllKNDI2aS9BaWx2c3djMFRDaDNX?=
 =?utf-8?B?Sit0V21ZNlNnMmM3M2xTNWgyZmtnQzJjRmluQUg1VUx4cER5MWVNMFlRVWV1?=
 =?utf-8?Q?uwSpfoOE0kM05UUj3hQ68Vu40tOy0HMCiezuxFo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC7F0DB6D17E9B45A3629BA3F53B1E24@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b266e36a-454d-4d28-a593-08dd48dba660
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2025 07:30:38.2510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10379

Rml4ZXMgc2VudCBoZXJlOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pbnB1dC8z
QUUzMUZEQS0yRjZCLTRDRkEtOUUxOS0wREVFQ0UzNjNEMzBAbGl2ZS5jb20vVC8jdA0KDQo+IE9u
IDkgRmViIDIwMjUsIGF0IDk6MTHigK9BTSwga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+IHdyb3RlOg0KPiANCj4gdHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9oaWQvaGlkLmdpdCBmb3ItNi4xNS9hcHBsZQ0KPiBoZWFkOiAgIDkz
YTBmYzQ4OTQ4MTA3ZTBjYzM0ZTFkZTIyYzNjYjM2M2E4ZjI3ODMNCj4gY29tbWl0OiA4ZTliOTE1
MmNmYmRjMmE5MGE4YWNiNjhhY2JjMTQwN2VmNjdkMTM5IFsyLzRdIEhJRDogaGlkLWFwcGxldGIt
a2JkOiBhZGQgZHJpdmVyIGZvciB0aGUga2V5Ym9hcmQgbW9kZSBvZiBBcHBsZSBUb3VjaCBCYXJz
DQo+IGNvbmZpZzogYXJjLXJhbmRjb25maWctcjEyMi0yMDI1MDIwOSAoaHR0cHM6Ly9kb3dubG9h
ZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwMjA5LzIwMjUwMjA5MTEwNS5ac0xvQlNJaC1s
a3BAaW50ZWwuY29tL2NvbmZpZykNCj4gY29tcGlsZXI6IGFyY2ViLWVsZi1nY2MgKEdDQykgMTMu
Mi4wDQo+IHJlcHJvZHVjZTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2
ZS8yMDI1MDIwOS8yMDI1MDIwOTExMDUuWnNMb0JTSWgtbGtwQGludGVsLmNvbS9yZXByb2R1Y2Up
DQo+IA0KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAo
aS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCks
IGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9vZS1rYnVpbGQtYWxsLzIwMjUwMjA5MTEwNS5ac0xvQlNJaC1sa3BAaW50ZWwuY29tLw0KPiAN
Cj4gc3BhcnNlIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pDQo+Pj4gZHJpdmVy
cy9oaWQvaGlkLWFwcGxldGIta2JkLmM6MTE5OjE4OiBzcGFyc2U6IHNwYXJzZTogc3ltYm9sICdh
cHBsZXRiX2tiZF9hdHRycycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8N
Cj4gDQo+IHZpbSArL2FwcGxldGJfa2JkX2F0dHJzICsxMTkgZHJpdmVycy9oaWQvaGlkLWFwcGxl
dGIta2JkLmMNCj4gDQo+ICAgMTE4DQo+PiAxMTkgc3RydWN0IGF0dHJpYnV0ZSAqYXBwbGV0Yl9r
YmRfYXR0cnNbXSA9IHsNCj4gICAxMjAgJmRldl9hdHRyX21vZGUuYXR0ciwNCj4gICAxMjEgTlVM
TA0KPiAgIDEyMiB9Ow0KPiAgIDEyMyBBVFRSSUJVVEVfR1JPVVBTKGFwcGxldGJfa2JkKTsNCj4g
ICAxMjQgDQo+IA0KPiAtLSANCj4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQ0KPiBodHRw
czovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL3dpa2kNCg0K


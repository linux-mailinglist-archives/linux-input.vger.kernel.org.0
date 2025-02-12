Return-Path: <linux-input+bounces-10007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E957AA32DC1
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 18:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E2F23A1021
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 17:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EDB1DEFDD;
	Wed, 12 Feb 2025 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="M3zg8DqZ"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011036.outbound.protection.outlook.com [52.103.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269425C709
	for <linux-input@vger.kernel.org>; Wed, 12 Feb 2025 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739382242; cv=fail; b=B+UffAkaQd2kJOe7/w39wHU3MXCacOgZ5InEryB+yVuJImmux9QUxHfJS0lQUEXt3Dfw3d5QETxllnCH5lJF8hI4cVcg4+FkZqHe1gD0r4rhThO2HCvRANmzcJp85ZpL2/kWxIoEni9RU8G4tMX21ZdHFqLgab42o7YToE+Qdxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739382242; c=relaxed/simple;
	bh=BsFUBsGhuo1JXtfQ0WUEVLCbwpI90QLPesE59g30ZfA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V85Lcy6GF8Z2L+OkJfgXVghzI2RFzBhbDQ/wkAlr4FJACTpia2sh+xG8Zzdu4IznQxPmzrnaSb8yqfTMW57KeEdlV4Ipvn/tNu+P5QWn2FxwzHeevzm3bfQFzwfiZRchPFPGhJCyBGtIXCc2myPCt4cdbkDQ5qwx2mGy4FieEBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=M3zg8DqZ; arc=fail smtp.client-ip=52.103.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnTZhdamsHF/iALvoJWhZYpNRB8V9YySf/2KxG+kpEZReuEW8+7wlrGb4J8cBMG+b+VQlaFCXU6ysT+56owr/caXyzkw/QO6RtAmV6vayGSO6+MgZpRBqVYYPZYv0EjYVDuejmFFV4zfka7dfJdUrvTpSGrwc/4J5gAixtI6vTXPYFWspTXzkfDaMfXUyrlDK8iKhKC04FUAFBj4BncMkQ3dtyQIWP7t5fS4Ibh1u2nzjUpOnfZZoviPPtZh/XWiLxgHAq/O8MYskB8sUytU2ICizTuVBfGa8YTlavXrxlpH1IjdawxZaZHtEY5tRyY3lqdQc0uWyKinmbOQymYaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsFUBsGhuo1JXtfQ0WUEVLCbwpI90QLPesE59g30ZfA=;
 b=dRUy0zI7a98FOBTe8abYWpcN+l7ucDkpnJlsN3vNnSrAJU+yV4MoaxDiI2ddnFqQhO1YQ8g4Izc6h4LOS/m4Ref/WXsczlmWtcSC6BekrmYZXWRcxMYF+xzH4Bx/jVQjFxK0gW0xHiwbezFc1r0QarZ2PSgfli9rpguFQXG4qHcsuGNtRTGKPxYZhn6BIVO8f+2AdhfMVONppyaPAtb3Q9FjnBUbhaMF3x0MoxLTM+cVgcT+LMxcBcuGz8tXA0o2CaHSZ6pdR5gnENYFLK+A6xXhmm7crr+MZR7gh07ydzE/lFjfg4irtViJmAwx4iIIUuGuo9JnFvfGZLGkVglfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsFUBsGhuo1JXtfQ0WUEVLCbwpI90QLPesE59g30ZfA=;
 b=M3zg8DqZN4CEr7lLM444Df3W1d3yBo2T3EBTMLzmFTUAVDAgEUmD9zRKV8LPelOe54opX1tNnM8GHPvsj4HeBGzza7DGn/p05ijFXzMY0JYnXH91tFm2VDV64SJWQOsOWpvRAQ4kpT4wyEv8p0hfVipsI31j9gtqbta/2m3bycCdifRKkumcIzD1Po+pLiAhQHMlo2K6TO6BgspUAwLB9VDzTxZancq810HUryHyBBeeT3khtjg5iYjMkjbQ11gVLSg64olc4Ay4Yb0MTVMRYF/9F5HP7X6jsgA65LiPHm2XCJaAW/qEqRzAIiT2tXp9DDTmjSE/sznFtXULsp5lwA==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN2PR01MB8704.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 17:43:56 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 17:43:56 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Topic: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Index: AQHbfXSaek/9eKHa2UOEiOnSSu3oB7ND8GeA
Date: Wed, 12 Feb 2025 17:43:56 +0000
Message-ID: <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com>
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com>
 <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
In-Reply-To: <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN2PR01MB8704:EE_
x-ms-office365-filtering-correlation-id: 6586ab4e-18a8-4398-7fc9-08dd4b8cd2d7
x-microsoft-antispam:
 BCL:0;ARA:14566002|12121999004|8062599003|8060799006|19110799003|461199028|7092599003|15080799006|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?V3NHNEkyT3RoeWZaeWxJNFZQdS9FN1pjeld0ZFNnT1VObW52OTlERUdWbS9B?=
 =?utf-8?B?S1FrUjB4UXNTL09TRzBzQjRoRlBueiswemRhaHpXcVdSMDAxckFKOFhRQjlo?=
 =?utf-8?B?SzZuR1BjbHRBQVp0dFovUGY4Z01EUjhHRE9yUy9HeXBLd2Vaek5OMjJLL1Jm?=
 =?utf-8?B?Mk9BdnVVT0s4dUphenIyNVREaHZtRGQzWG1UcUNLOG96RDY1OEFhYXNPV0c1?=
 =?utf-8?B?K1pwL1hPTkoraGpGR04yTkVzdjdFQXQyRDdwY3lHcDV3T1Q5ajZUNFZKSmRF?=
 =?utf-8?B?amM0TVVBSXRLT2FzeXJuNVRTMlhQR00rL1ROMkthTVIxaWkySTdLM0xJNlZZ?=
 =?utf-8?B?bE1SNDI2NEZZM2ZrWTBveG9SOFhpUGRyQWVyTVF3aWFHTjJJM1dHUm01bU5Q?=
 =?utf-8?B?NE5vc1B6NUlQUmZsNERlbWQrYThHdXVVeGdUdXVSVGNlamM1UVpsY2I3MGhB?=
 =?utf-8?B?RHo1YTJTdUVFL1JBYjl6VzdJSkNPN2FxNEU5aXJZemUxa2hSMTRZYXVUOUJT?=
 =?utf-8?B?TlY3NVluNHliMTd2aUZGTnpvQ2hqMzlrbkxMWDVyNnVIRjVzc0xROUxRekR6?=
 =?utf-8?B?SHVrRkkycENpTTI4cmhKSCtlZVpLdlBsRzBNTktla09JWXE3a2xZejhoL0wy?=
 =?utf-8?B?dGJlSE5HV1Uva2t5aXMwV256bXdpcmd5OWorUXVRY0k1NmROekFWVzVpMzFw?=
 =?utf-8?B?Wk9sUU5JQjBMM1FGeG5sNnNiV2UrS0hYZkxGM1pNUGRlS1pYdjdUdkpSeWU1?=
 =?utf-8?B?ZEZ6emo0RVltRHhSdVhoL1Q5WXVGd0JGeENCWEcxelhvL0FOblpJVnl6Yys3?=
 =?utf-8?B?bldPODV1K21XNHdidTNoaDhvNGFFR0dDWVlCbitQS1BQWUJDVFRzc0txbkxu?=
 =?utf-8?B?UWVSTUErb05ISVQzajN1OFVZZ2ZIbk11b2R6YzBXZ1dhOE1nYmcwV0tSTlU4?=
 =?utf-8?B?UEpuOUVzdks0cGpuM3lGMzRxS3kzOW1uNk9MWDhUWGlqSmFRV0l2b2ExcUFr?=
 =?utf-8?B?L09pajliQkdiU3pSaWYvQWthZ29Cdzk2SGRXOGdxUVNDV2hRSzFPWU9qQU5H?=
 =?utf-8?B?K3Z1ci95eXJSalIrcHlIRkxxNTdHZjF3aGtseUtMUy84TWMyanNLcXRzaEsy?=
 =?utf-8?B?WHBTNHRXMEpRdkVJMXFkRVFDZEpRZEVHOGdHZHlidzliK3dKWmpJMlY1QTB0?=
 =?utf-8?B?MllCZnk4bzg3VDBWcnhxclBHRXBqN00ydFlqRksrK0FuZjJhRmFhUmlYOFA0?=
 =?utf-8?B?U3M4d21pU0QrMEJ4dnhoVHZ5S090WmkwZHNlZ3cxOXJIZC9NekJIc0I5ZTJZ?=
 =?utf-8?B?WnlqVTE1SUI3YkJ0MGJaVXlSeGcweGZoVjRqZktERm5OYzFHblFSYTBTT1pO?=
 =?utf-8?B?OURpcWNLYmJDdkE1ZzF0QlJrckNKclVrR3hNdlJHRTVzdW5wM0U2NDZ1L2k1?=
 =?utf-8?B?czh5OUQ5dmREelhuMGkyZDl4Q055OURTNnpVNTdYSmJENzUwbytqRkVrTnVP?=
 =?utf-8?B?bUhvQkE5bzkxVDF6VmhQcHNzNFEzZFNmU2FjWGdidUJLY21MbXBOaEJUMnM5?=
 =?utf-8?B?VmtIQT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnZUaUQzcytLbW9lbmR6RGd1UkFvOTZORHdHOTRsZ3ZzSTBhTFFBbFpUM0VM?=
 =?utf-8?B?RVdOaGtGOWN6eHFIRndSSzdDbFFrZHlnU3NmcEJXc3lPRmFtdEJhTjZDYSti?=
 =?utf-8?B?bElBNklsWVl1TmptZ01TeG45YjdGUmwzUjZ5SWpGMDBydmdxeTJMWmlkV2lF?=
 =?utf-8?B?YUJScVVOWEQ5cFhUajFROStxNTRUZjRjVE0zYTh2R1RLVUFNOUlQeWVoVldG?=
 =?utf-8?B?MXBpMzBGbGRXQldDQS9YYUpyL0dUNnJTdHdUNVFkVy9ZTGEzV0lLb2ZFaUxQ?=
 =?utf-8?B?Mno0Ym5VOTRIWTJoc0FaUzZLb1V3QzJDMWhqdXhLeEExei9BOVBzQ2lKNTNP?=
 =?utf-8?B?elQzWFhIKzI3UjBsZitvMWhSQWJNUnNVSmRTbGwyYmdsRVY1eG02bVhLdVZH?=
 =?utf-8?B?MXE5SE1zQThOSE1CS0lRdkRhVFVTMnJIQ3Zjdit6U2V1YUhQbVhCT3VtbUZx?=
 =?utf-8?B?ekl6bVN5N21GNklyQUxDK0lCRWliWXExaHdaMVN5WVRpQnVac1ZRVmV2c1NQ?=
 =?utf-8?B?WlNkRDBMMTAxY0hKQlB1Q2FtcWZQbHJoS0ljaTA3WDlRSmUzbHhqN2YzMjMz?=
 =?utf-8?B?YlhTYXZPVlR3WVFrMGZHRmJXZ1dzelEwNzZ4b2thbnVUWmpoNE40Yk5jNkpD?=
 =?utf-8?B?aVhtaWNyTFk0ejBrc0lxYUtaZC8wMDZ6aUFSYWhtOWtmMlE5ZER3QmEyK2Vz?=
 =?utf-8?B?ek5nM2dROWhuTVdkZnJZUktGV2xCemo4Y21jdVZOVHA2QjB2eUtSd2xGY3Nt?=
 =?utf-8?B?Z1VLOFF1c1pXbTFaWjdGeGRMUW41L0M4ZXZiWGd4RURBeHRhTFE5ckNhMWo0?=
 =?utf-8?B?TWpVd055QTFMbnZIZVdXQ3MwMGJQaGlqejJQTnJRSzl0SG5kWWNDTEVIVG5r?=
 =?utf-8?B?UEhCOFdCWVVmaUhYeU00bTNQWDB6WXBNb3NLSEFKZDFjbWxIZXZQaWhIQUV1?=
 =?utf-8?B?Yk1rVHR3dWI2YnlnZnlhSWFnS29HajkrWlgvcEU3ZDRLQlNZZDl5RkJydUhy?=
 =?utf-8?B?UlhDKzhGYWJYZmNsL3FwTWczdkVTb01aSXllN09yaWNEN0Q2K3VHK1oraVk3?=
 =?utf-8?B?d0dVak1CTTlYQ1dOUG5jeXA2QVVNNzBkSTk5b2xEOHBaK0Z3MVh5TTdQSmts?=
 =?utf-8?B?cTlvMXJqNjVtSllaaUtVUXlvMEwwMXZOMlFXMFJIKzRaUU1FNVNneStNQjBU?=
 =?utf-8?B?czZjaVlhdytzNTF5YUJ0cldUUXdsemJ2WUFOckFURndzazNCcU94VTJpK0FO?=
 =?utf-8?B?dEVqdDZjRk9tdnpUVmdiSUVqbmNyNlN4VTZZUFV1ejVmR1kyamtINlliUFUx?=
 =?utf-8?B?NmFwZERjR0pmWjgrVFFIZkg5WFNBSEtmTEY5TjFYTUVSc0JGQUo1dmRKdWZh?=
 =?utf-8?B?KzQwdU50VXFJOG14WDVvOXNjeWJzRDdaWC9LcjhxUC9taEllK0l4WTVKejkw?=
 =?utf-8?B?Y0E1cnVxRmpNeDUzakYzaFpHUnhJaFE1Mmg3L1o4bmVGd3NvaTF0SlpUalA5?=
 =?utf-8?B?Y3RvWlVuVkR0dzNiZWgvUm16eEVlelFHYWhpeTdPRlhqVFRKaGo3b3V5TkNi?=
 =?utf-8?B?alFsc2RKL01PM2JLTSsxT0loWnRvSkFFcXJpV1QydzMveTFKK0hncFErbDhm?=
 =?utf-8?B?azFCOGxwcFIzRHFpYiszWHdFOTlLYktjR1cyNmhvTWEwcEpKakFmU3ZoR0dm?=
 =?utf-8?B?QUhMVHVkUTFFTGN6NU92SnRnbHBWdVBNbXBlOG9qTS9FbzdNRFFEdFQzdHFF?=
 =?utf-8?Q?yjYBp+QlitFfYPLlTf3NrnYLX/DGJeQomMcaiEM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AD2E9826D674C4CB3EF1BE76ABD9180@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6586ab4e-18a8-4398-7fc9-08dd4b8cd2d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 17:43:56.1280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB8704

DQoNCj4gT24gMTIgRmViIDIwMjUsIGF0IDExOjA24oCvUE0sIEFkaXR5YSBHYXJnIDxnYXJnYWRp
dHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPiANCj4gSGkgQWxleA0KPiANCj4+IE9uIDE3IEphbiAy
MDI1LCBhdCAxMTo0MuKAr0FNLCBBbGV4IEhlbnJpZSA8YWxleGhlbnJpZTI0QGdtYWlsLmNvbT4g
d3JvdGU6DQo+PiANCj4+IFRoZSBPbW90b24gS0IwNjYgaXMgYW4gQXBwbGUgQTEyNTUga2V5Ym9h
cmQgY2xvbmUgKEhJRCBwcm9kdWN0IGNvZGUNCj4+IDA1YWM6MDIyYykuIE9uIGJvdGgga2V5Ym9h
cmRzLCB0aGUgRjYga2V5IGJlY29tZXMgTnVtIExvY2sgd2hlbiB0aGUgRm4NCj4+IGtleSBpcyBo
ZWxkLiBCdXQgdW5saWtlIGl0cyBBcHBsZSBleGVtcGxhciwgd2hlbiB0aGUgT21vdG9uJ3MgRjYg
a2V5IGlzDQo+PiBwcmVzc2VkIHdpdGhvdXQgRm4sIGl0IHNlbmRzIHRoZSB1c2FnZSBjb2RlIDB4
QzAzMDEgZnJvbSB0aGUgcmVzZXJ2ZWQNCj4+IHNlY3Rpb24gb2YgdGhlIGNvbnN1bWVyIHBhZ2Ug
aW5zdGVhZCBvZiB0aGUgc3RhbmRhcmQgRjYgdXNhZ2UgY29kZQ0KPj4gMHg3MDAzRiBmcm9tIHRo
ZSBrZXlib2FyZCBwYWdlLiBUaGUgbm9uc3RhbmRhcmQgY29kZSBpcyB0cmFuc2xhdGVkIHRvDQo+
PiBLRVlfVU5LTk9XTiBhbmQgYmVjb21lcyB1c2VsZXNzIG9uIExpbnV4LiBUaGUgT21vdG9uIEtC
MDY2IGlzIGEgcHJldHR5DQo+PiBwb3B1bGFyIGtleWJvYXJkLCBqdWRnaW5nIGZyb20gaXRzIDI5
LDA1OCByZXZpZXdzIG9uIEFtYXpvbiBhdCB0aW1lIG9mDQo+PiB3cml0aW5nLCBzbyBsZXQncyBh
Y2NvdW50IGZvciBpdHMgcXVpcmsgdG8gbWFrZSBpdCBtb3JlIHVzYWJsZS4NCj4+IA0KPj4gQnkg
dGhlIHdheSwgaXQgd291bGQgYmUgbmljZSBpZiB3ZSBjb3VsZCBhdXRvbWF0aWNhbGx5IHNldCBm
bm1vZGUgdG8gMA0KPj4gZm9yIE9tb3RvbiBrZXlib2FyZHMgYmVjYXVzZSB0aGV5IGhhbmRsZSB0
aGUgRm4ga2V5IGludGVybmFsbHkgYW5kIHRoZQ0KPj4ga2VybmVsJ3MgRm4ga2V5IGhhbmRsaW5n
IGNyZWF0ZXMgdW5kZXNpcmFibGUgc2lkZSBlZmZlY3RzIHN1Y2ggYXMgbWFraW5nDQo+PiBGMSBh
bmQgRjIgYWx3YXlzIEJyaWdodG5lc3MgVXAgYW5kIEJyaWdodG5lc3MgRG93biBpbiBmbm1vZGU9
MSAodGhlDQo+PiBkZWZhdWx0KSBvciBhbHdheXMgRjEgYW5kIEYyIGluIGZubW9kZT0yLiBVbmZv
cnR1bmF0ZWx5IEkgZG9uJ3QgdGhpbmsNCj4+IHRoZXJlJ3MgYSB3YXkgdG8gaWRlbnRpZnkgQmx1
ZXRvb3RoIGtleWJvYXJkcyBtb3JlIHNwZWNpZmljYWxseSB0aGFuIHRoZQ0KPj4gSElEIHByb2R1
Y3QgY29kZSB3aGljaCBpcyBvYnZpb3VzbHkgaW5hY2N1cmF0ZS4gVXNlcnMgb2YgT21vdG9uDQo+
PiBrZXlib2FyZHMgd2lsbCBqdXN0IGhhdmUgdG8gc2V0IGZubW9kZSB0byAwIG1hbnVhbGx5IHRv
IGdldCBmdWxsIEZuIGtleQ0KPj4gZnVuY3Rpb25hbGl0eS4NCj4gDQo+IFJlZ2FyZGluZyB0aGUg
dGhlIGZubW9kZT0wIHRoaW5nLCBjb3VsZCB5b3UgdGVzdCB0aGlzIHBhdGNoOg0KPiANCj4gLS0+
OOKAlA0KPiBGcm9tIGUyYjJlZjNmNTc5ODAwZjExZWUyOTNmYjQ1ODM4YTQwMDRjY2FmMjMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxDQo+IEZyb206IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhA
bGl2ZS5jb20+DQo+IERhdGU6IFdlZCwgMTIgRmViIDIwMjUgMjI6NTc6NTggKzA1MzANCj4gU3Vi
amVjdDogW1BBVENIXSBISUQ6IGFwcGxlOiBBZGQgcXVpcmsgdG8gZGlzYWJsZSBmbiBrZXkgb24g
c29tZSBub24tYXBwbGUNCj4ga2V5Ym9hcmRzDQo+IA0KPiAtLS0NCj4gZHJpdmVycy9oaWQvaGlk
LWFwcGxlLmMgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0K
PiAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMgYi9kcml2ZXJzL2hpZC9oaWQt
YXBwbGUuYw0KPiBpbmRleCA0OTgxMmE3NmIuLjlkNGNiZTYzNiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9oaWQvaGlkLWFwcGxlLmMNCj4gKysrIGIvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMNCj4g
QEAgLTQyLDYgKzQyLDcgQEANCj4gI2RlZmluZSBBUFBMRV9CQUNLTElHSFRfQ1RMIEJJVCgxMCkN
Cj4gI2RlZmluZSBBUFBMRV9JU19OT05fQVBQTEUgQklUKDExKQ0KPiAjZGVmaW5lIEFQUExFX01B
R0lDX0JBQ0tMSUdIVCBCSVQoMTIpDQo+ICsjZGVmaW5lIEFQUExFX0RJU0FCTEVfRk4gQklUKDEz
KQ0KPiANCj4gI2RlZmluZSBBUFBMRV9GTEFHX0ZLRVkgMHgwMQ0KPiANCj4gQEAgLTg5LDYgKzkw
LDE5IEBAIHN0cnVjdCBhcHBsZV9zY19iYWNrbGlnaHQgew0KPiBzdHJ1Y3QgaGlkX2RldmljZSAq
aGRldjsNCj4gfTsNCj4gDQo+ICtzdHJ1Y3QgYXBwbGVfYmFja2xpZ2h0X2NvbmZpZ19yZXBvcnQg
ew0KPiArIHU4IHJlcG9ydF9pZDsNCj4gKyB1OCB2ZXJzaW9uOw0KPiArIHUxNiBiYWNrbGlnaHRf
b2ZmLCBiYWNrbGlnaHRfb25fbWluLCBiYWNrbGlnaHRfb25fbWF4Ow0KPiArfTsNCj4gKw0KPiAr
c3RydWN0IGFwcGxlX2JhY2tsaWdodF9zZXRfcmVwb3J0IHsNCj4gKyB1OCByZXBvcnRfaWQ7DQo+
ICsgdTggdmVyc2lvbjsNCj4gKyB1MTYgYmFja2xpZ2h0Ow0KPiArIHUxNiByYXRlOw0KPiArfTsN
Cj4gKw0KPiBzdHJ1Y3QgYXBwbGVfbWFnaWNfYmFja2xpZ2h0IHsNCj4gc3RydWN0IGxlZF9jbGFz
c2RldiBjZGV2Ow0KPiBzdHJ1Y3QgaGlkX3JlcG9ydCAqYnJpZ2h0bmVzczsNCj4gQEAgLTE1Miwy
MCArMTY2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcHBsZV9rZXlfdHJhbnNsYXRpb24gbWFn
aWNfa2V5Ym9hcmRfMjAxNV9mbl9rZXlzW10gPSB7DQo+IHsgfQ0KPiB9Ow0KPiANCj4gLXN0cnVj
dCBhcHBsZV9iYWNrbGlnaHRfY29uZmlnX3JlcG9ydCB7DQo+IC0gdTggcmVwb3J0X2lkOw0KPiAt
IHU4IHZlcnNpb247DQo+IC0gdTE2IGJhY2tsaWdodF9vZmYsIGJhY2tsaWdodF9vbl9taW4sIGJh
Y2tsaWdodF9vbl9tYXg7DQo+IC19Ow0KPiAtDQo+IC1zdHJ1Y3QgYXBwbGVfYmFja2xpZ2h0X3Nl
dF9yZXBvcnQgew0KPiAtIHU4IHJlcG9ydF9pZDsNCj4gLSB1OCB2ZXJzaW9uOw0KPiAtIHUxNiBi
YWNrbGlnaHQ7DQo+IC0gdTE2IHJhdGU7DQo+IC19Ow0KPiAtDQo+IC0NCj4gc3RhdGljIGNvbnN0
IHN0cnVjdCBhcHBsZV9rZXlfdHJhbnNsYXRpb24gYXBwbGUyMDIxX2ZuX2tleXNbXSA9IHsNCj4g
eyBLRVlfQkFDS1NQQUNFLCBLRVlfREVMRVRFIH0sDQo+IHsgS0VZX0VOVEVSLCBLRVlfSU5TRVJU
IH0sDQo+IEBAIC0zNjQsNiArMzY0LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXBwbGVfbm9u
X2FwcGxlX2tleWJvYXJkIG5vbl9hcHBsZV9rZXlib2FyZHNbXSA9IHsNCj4geyAiV0tCNjAzIiB9
LA0KPiB9Ow0KPiANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXBwbGVfbm9uX2FwcGxlX2tleWJv
YXJkIG5vbl9hcHBsZV9rZXlib2FyZHNfZGlzYWJsZV9mbltdID0gew0KPiArIHsgIk9tb3RvbiIg
fSwNCg0KWW91IGNvdWxkIHRyeSByZXBsYWNpbmcgT21vdG9uIHdpdGggT01PVE9OIGFzIHdlbGwg
aGVyZSBpZiBpdCBkb2VzIG5vdCB3b3JrLiBBbHRlcm5hdGl2ZWx5LCB5b3UgY291bGQgdHJ5IGxv
Z2dpbmcgaGRldi0+bmFtZSBmb3IgdGhpcyBkZXZpY2UgYW5kIHB1dCBpdCBpbiB0aGlzIHRhYmxl
IHRvIGdldCB0aGUgY29ycmVjdCBuYW1lLg==


Return-Path: <linux-input+bounces-10261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70367A414C0
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3C3218932BA
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5548632B;
	Mon, 24 Feb 2025 05:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="iAvn4G+7"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011030.outbound.protection.outlook.com [52.103.68.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218BC17D2
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740375055; cv=fail; b=kow/IdaTIxt3cT/eH1QudOz/WwChgjbaVzO4ZCoAZNaOerF/i/3yzOVLHTdDAMu1Q673P37LXD6seV0QdOkhBn9W2oCnnuWQWrqXr7GTfhrYyJL5zycpq+tJpIRpstNXA1QdtkZQuo3KcuDo3tU/Ujym+LH/FwsdYHmNmjSI/sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740375055; c=relaxed/simple;
	bh=ujO1gW6shaJ1S0BPcjtDJkfWmW9Mxj1V8vXcnnIrH6A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VEw6B9gw5x5rvfhmiLAXhgXotAYQiYVOv/FVBWqnoOooHMu4tZo5I3gqJfkqLoMg1iM7zitIrAZHH0YDsqy/RrfFAHB2ZDNB0ZhSs+MVIkT4D0KIzFLV3Btqbew1GwhB9t5mYOSHAWv4ctOwudkNUtj3x+ERG7dJxW2GPZm2gK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=iAvn4G+7; arc=fail smtp.client-ip=52.103.68.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYdqiH233CECa27vmYfFfhZehNvfntjtJ91hzZOKw11F0GgrFP3eaGSU+mFrW4OuH8Ekl+aDLbFEoxNmcmvav+u0ztqFBIzt6/piWaxKSo5PitCgOEAQu+CFTo4zSbwgfCjR4fYfS/ZYwK2dBwGuD6ze7lss4/DFMm84wVIISZwMLcnFgYkVP1a3wKr21SUag104xu5I2EP2FTRnDglkQjJNB0SKVs8RCnT2bjZ2aL2gc6jR+xeJWZWk4mU5SQ3xjXNKfc+oHfY9pY/2Gyp4fCisrH7OLrja1NJvCOjxAd+nUsE3QfpnNtZluB6bAFokkdQurbdCLaWIxY2NzxPjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujO1gW6shaJ1S0BPcjtDJkfWmW9Mxj1V8vXcnnIrH6A=;
 b=VvnO56jDlwDTwnCODUlhRyD7RdvdyWfheDbTUJDSD9oh/SSDdxlF+1v5FdsBsHAD1FRTkYHOGESWHs53aoYdJo3GM4bDRMAQHIFjwjKTIkt1TuHX7jGRK0w2akXFD1iDAWW/jeMRslrNH7n4Tdyxtf3+XBj5kwz0+PjUoJ7ZaCnFsf8wWRWrJYWg7G9lmmCHOSTR6cYS/rrTAd0XtWNQv68YaznwZcFM0t3mwWYarGIlnS38j15c7eaG4g+rIYNHbiRoUwqyUOuXygvb+xwo2SyRVC7VMyUtAyqCxB8YJEgDEw9hvW2kScBY4Bb8Dw7KCImsUOwBAZ8yDW/SqrCPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujO1gW6shaJ1S0BPcjtDJkfWmW9Mxj1V8vXcnnIrH6A=;
 b=iAvn4G+7h8Ob4uMNa+pbsa4KnODbqH7cK5vvu5KpwNJCaskFxm7QvdwLZjw1TtJGtZ8bdEqPHtzsvBbETt4wbsetyPwbTg8vhB+AN/UO8PH6fdTojDIePY9KflPDXo4VW6/iueqJg/R2R3PVwgjp3RNSKklgcWPNWO5nnkYiOINYgrEilB/ID2mL/oaosioZK2SQ4p1j41FZ9zP2cTXsnR0clut/SFBG8Vq966hE3WfREKRVaVuDPqIlNU75CEZrZz2//UC//aFJYCvHrKJeoGqy6OTIdlBGyoR9RSwHnpnbJoTBV71cdMoFbOfFZ52CByJYhT6uZV/BG+clEmOJCw==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB5741.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 05:30:46 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:30:46 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Topic: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Index:
 AQHbfXSaek/9eKHa2UOEiOnSSu3oB7ND8GeAgAUzRwCAAFNAAIAACtOAgAFn6wCAABI2gIAAF0+AgAA32oCACoflAIAAH6YAgAAF7jWAAAOdgIAAA3fo
Date: Mon, 24 Feb 2025 05:30:45 +0000
Message-ID:
 <PNZPR01MB4478184BF3EBAE540C876EA9B8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com>
 <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com>
 <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com>
 <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
 <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com>
 <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
 <A58096D0-D8FC-42F6-BCAE-8D099E81E3AA@live.com>
 <CAMMLpeRg8RhncwwK7yyJsT=8Q7221euMA7=-mySN3YLFpWPQjQ@mail.gmail.com>
 <CAMMLpeReEKgizVQ6Z9=Go2y9djoTBPofbB8vJbPDbjvunuLDLw@mail.gmail.com>
 <PNZPR01MB4478510C11E2D619C793D23BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
 <CAMMLpeQwAiD1_7Wc+25Gt4UHKwn6vfup+xdvekpEfr2G=-vW3g@mail.gmail.com>
In-Reply-To:
 <CAMMLpeQwAiD1_7Wc+25Gt4UHKwn6vfup+xdvekpEfr2G=-vW3g@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB5741:EE_
x-ms-office365-filtering-correlation-id: ae2b74ef-e0f2-463e-149b-08dd549463a3
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|7092599003|15080799006|8060799006|6072599003|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUQ4VDFOYUJFbmoyekNwK1BMTXNIN25CM0g2V1dDc1E5NlhYSWRScm9sdStZ?=
 =?utf-8?B?a3Zhdy92WFVEVDVGWTZ4M1dVVkNsQ01oQnhudm56Qkl3dE1JRnNkeTNTSmJk?=
 =?utf-8?B?RlI5bm5rdWdNTlI3STFUWXFvNis5Mk5qMDc1OW9BY1RtWE9JajBRVTRFRzZ0?=
 =?utf-8?B?WThXKzBkeFRQT3dJc2s1Q0Z1Q081Ty91RkF1RXRxQXV4MU1kaEkwTnpIenhD?=
 =?utf-8?B?SUtaVEx4STRiOHdRVmlqOENpTkZRMkY2WWtUaGoxTEtzSE8rNUlzYW1iYjdE?=
 =?utf-8?B?Z1A4SDUyS0dQZ1hpL3BMdStPMUMySG1Rd2hQNGRxcFRCMUJnLzIwRWQzT1p1?=
 =?utf-8?B?b3Y5WjVXV1BOQWduWmY0WjRGNXpzVDRVOVVzeTlPd3Q3Ry9tNUtOY3g2K0Vv?=
 =?utf-8?B?WStKZWdpajJkYlJUc01lZXF6K2ltVTRFRjNNMUhsdUJVOTJsMWFqSlNSRUZQ?=
 =?utf-8?B?ZkpVUXFzNzZieEdTQTZHdEZHZHFldEhOS0RDKzVvSUxKYWxKTnJmZEVVNU8x?=
 =?utf-8?B?c3Z4MWJLQmxFeUhKa1VrdjhXQ0N6dUwxYnlnTGxVSDVBMFgzTzJtbi84Z3pK?=
 =?utf-8?B?dWM1aDM1bWFoMXk3eTgrNjdPTXZNVmM1UWt5ajE1dC9oYkNiOG01QkFnYWZ3?=
 =?utf-8?B?YjlRR2loWS9xdW03dzJ1a05lVC9jYytmYVB0eUErVUVyVFU4MjM0RzRORHEz?=
 =?utf-8?B?MTl2TVFmYUxGYjkzTFNWblA4ZTJ5TFJuY25OaXBGWm5JSUZFRGZyVjZyeGJx?=
 =?utf-8?B?VWFFc1diNmZMcG9sa1NMWUwvOWRBUFpPb2pxUUt1Yzg0eWhYNytlT0lhSFp4?=
 =?utf-8?B?a1ljcmF1K3Q5cEZzcjNzbUVEblZONjJoWE41YzJEYWYybkJPQXRScDRUWi9m?=
 =?utf-8?B?LzJIT2VOZytQMWhQOTdEMjNWbHV6bEZ1Sy9INXk2Q2VTbFpLWlllS291ZlYw?=
 =?utf-8?B?Z2hFL2V2M0t3YldXcFhieUQ3eGZuM1ZESkFSczN2V0lKVHJBYldYcmZ3dCtE?=
 =?utf-8?B?dzBaNlc5OUwvWm9DakhiVXM5K1JoMUcrakxNbEVoMUtWWDJFUXBJWjhCZUph?=
 =?utf-8?B?OWp5a1pjRHhaQkVvSElET0F1NVZMSDFodTZpSkxDVUVwNVNJTGJQSTFBeGw5?=
 =?utf-8?B?dlZXaXNoeExOblF2THN1ZkJjVS91ZzIvUjFFN2gzUVByU0pxczNSM1BMaDlD?=
 =?utf-8?B?MnpyVzRkOE5uQWp6bW9qVC9IZTN2RVpvRkpFZ2dEOXl6dEtyQnRYSVpaNlNu?=
 =?utf-8?B?ZXdtVjVGLy9aYkpscDhITHJGaEtVbjdtdUxQQjNDaEtGeklzN2xQRVFDTHJX?=
 =?utf-8?B?Nmd0dG1NNk9rS0o0RWJlbTljMDdvZjJpaGluWXI2dkdndzNIKytvOEN1RTVy?=
 =?utf-8?B?azA0RCtSM0lWdlRQdFMySW8rNGsvUEhSWFIwOW5TRjIyZmE2Qm1penAwYUlC?=
 =?utf-8?B?b3BCRnFsQmJrb3Y2Tkc4Q05KNTEzWkIzaGlnbnZpQmRHK25UanZ3TnFXejZa?=
 =?utf-8?Q?oStxzo=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlArV1ZsWEwyQmdlM1lrN3FCcndTZ0ZvS0pGaFo5UkZOb09TWGRRWVh2RzI1?=
 =?utf-8?B?MXBJengvTG9yeUdmRHFXZmV6ZTEvWE5qZWpqMFlTSGFiZ2tBNFpFaEhrU0Z6?=
 =?utf-8?B?MmtKZTd2OEd4K3hXZWYwUi96U3dZNTVGWTlINzhFTGlTZnBRbkQ1UWsrZ0Ux?=
 =?utf-8?B?dHhiam9jZTMveGUvZTE4cVlPWnh6Z2xGZ0cydFQ0eFd4NmtXRjhWUHpVVUh6?=
 =?utf-8?B?eWFrQ2VqSnZYVGF2c0hkcEd3SHJLRDZxSTlGVEpFQU9qYmlWME5OL3VVanhz?=
 =?utf-8?B?Y0lsNG02ZldoTjVlRUdmbkdZRzlaN2RiNVNBUDZ0Ym41RiszVEV6MXhDbzA5?=
 =?utf-8?B?bXNxLzF4cWVrOHBSSDc3TGl6Wkc4KzdsSHE1MnptVnlyWDRzRmZPVjRja1Rq?=
 =?utf-8?B?bVBGOFFxbzdOWUl4YWtVOTVkMWtLM2dFOW5yMHNuOW5YQnFoSlRQaC96L2ZT?=
 =?utf-8?B?QnZ6ZGo1ZHNUdFVlZE9iWENXaVQwa0t5Nm5QQ2FlMUQvc1FXRXY3eC8xQ2xL?=
 =?utf-8?B?YXAwS1k2QVlWaTE4U2lncHpWZ09ka3daV0lYQitMTlpFTi8xL3B4ZVg5VmJj?=
 =?utf-8?B?dVJjQXg0ZDk4WlJPQWdaanFlcEE5V2VVMHBhTFdNcDF6VndEV2Mva1FJSURU?=
 =?utf-8?B?bTh4RkZSTVFGd3hSblhaLzY5YjQ0T2ZuODlHN1FNQ2cwNlU1SW80V0hhRmsw?=
 =?utf-8?B?V2lGU2JMN0ZFYituV0tCdmQ1aCtNMzB2V0JZWmRxSmdIVG43aHpiejduZ2Na?=
 =?utf-8?B?c1lHTU0zSUhpdC9pSERrMmdsSjRzZUkxUXFORWdyUElQL2VtV0MrT0RWeFo2?=
 =?utf-8?B?b29TY0trTWU2WVJZTzh2SzFmaDJFanVyRmtSeEJVOGhVTCtjclhzY00xckRo?=
 =?utf-8?B?cGxtcTdjVkFLNVBxOGV4RGpha1M2c0ZKeWV3Z0h2aFJuS2hEdWM4SC91dDF1?=
 =?utf-8?B?YTl1RVl5OXV3WWd5TmIwbnFaQXhFTkE4MkJHcVA0RjdPVXAxUEZvZDZlemJZ?=
 =?utf-8?B?d2NWYkNQSVdyS0Vacm5IendHc2QwRTQvU1dTeDg2dFlNRDBvcTM5ZHVaWTIz?=
 =?utf-8?B?d28zQllrRjlLWjVBVlRoU2xYeXB4TmlBYjRHUXBCZHNXdE9YdlBrWnI3dlBm?=
 =?utf-8?B?T2h1b2F6NTQycHJmQUIrLzZ2czhsVmV2SGozeFZyK3A2Sjl4UXVsblQzK3l2?=
 =?utf-8?B?YXE3L243NlcyZUV2OE0raU9KM015aE42ODNqUWFGdjJqN1VxQld5MW94UXIv?=
 =?utf-8?B?Nlg5R1JjQ01kVjdaUWdpMUJXWjVXQU4rcjRsRHgyMi8vL2p0Vk53ZEdrYTZa?=
 =?utf-8?B?TE4rN2EzRmtFQUlGZWNsL3dZTVVqTFloaDZyYUZSR24xVUt2VkMrM21VOTdl?=
 =?utf-8?B?OGtHcDhobnB6c2FKOGV0eFlvR0EwQUc3YXF6RHYwV3FOR3lNbDBKVU15WXBx?=
 =?utf-8?B?SDRKM2dOdXZjRzJSYVZiNVE1N3FFaHFPZzdQQmhKaVM5Q25KM2dUbHN5RUtv?=
 =?utf-8?B?a21BNmwwclF3bmlJVE1DY3RXU1lKOWdJQUJwY0xHVnpmVEo1dWM3STluam5s?=
 =?utf-8?B?eitFVVRDa2NjQlVQbEMydCs4UTlockdvRjhkdXk1MTRBNHp1czIrOHF6WmJz?=
 =?utf-8?B?bVV2azh3K1BMQTUzczFkWWJ6cGFHdWlrMHg2b0hXQmx5UHFqWEFEUjE4MWZD?=
 =?utf-8?B?TjRvR3J2YUo0WlVrYWhiajQ3UlBNNDAwSTZkbDJoTXV5bGVvRHZEem1zQTR1?=
 =?utf-8?Q?0KDdpn1/yWmdmFT6gU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2b74ef-e0f2-463e-149b-08dd549463a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 05:30:45.9893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5741

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDEwOjQ54oCvQU0sIEFsZXggSGVucmllIDxhbGV4aGVu
cmllMjRAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFN1biwgRmViIDIzLCAyMDI1IGF0
IDEwOjA14oCvUE0gQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+
IA0KPj4+IO+7v09uIFN1biwgRmViIDIzLCAyMDI1IGF0IDc6NTDigK9QTSBBbGV4IEhlbnJpZSA8
YWxleGhlbnJpZTI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPj4+IGZubW9kZT0wIHJlYWxseSB3
b3VsZCBiZSB0aGUgYmV0dGVyDQo+Pj4gZGVmYXVsdCBmb3IgdGhlIE9tb3Rvbi4NCj4+PiANCj4+
IFJlbW92aW5nIEFQUExFX0hBU19GTiBxdWlyayBzZWVtcyB0byBiZSBhIGJldHRlciBpZGVhIHRi
aA0KPiANCj4gSSBhZ3JlZS4gSSdsbCBzZW5kIGEgcGF0Y2ggc2hvcnRseSB0aGF0IHdpbGwgZG8g
ZXhhY3RseSB0aGF0Lg0KDQpJIGp1c3QgbWFkZSBhIHBhdGNoLiBJJ2xsIHNlbnQgaXQgc29vbi4N
Cj4gDQo+IC1BbGV4DQo=


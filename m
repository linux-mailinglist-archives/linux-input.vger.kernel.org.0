Return-Path: <linux-input+bounces-10259-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508BA4149A
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2DF189209B
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD701426C;
	Mon, 24 Feb 2025 05:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="B8JIIEOe"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BEEEA8
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740373535; cv=fail; b=aQnSGt9Ik+tE7zx2ABc9afqvBNrj5Awl3aUyPyZndu9TfHugqMLGtdjt903Hjch3SrAUvYGesa9NRipgiCxTUT9lwz6Y39sGrupaLB05WYAm9S5R1UrenPrXf4mBtFpEQiilw3r4u5BWeO70ahFwT6Eq4z+kb24Ua7ZUFRdahoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740373535; c=relaxed/simple;
	bh=WbDPhIEQ5rblo0fqc03nrxt8+bSkJIGh4SFREzeEhpk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jR/WUieHZWknVGmkVr0iCi6CLGHA0aNoaSkq1iLHzbFngZvm0JTROHhBlDm4a//C7CZ2Db+GyAuYa/m9g5SihPH5aIeOYpfixeG6hCQLIwNjrVTOD5nWR8miFyc5I3O/WV4GQIiWBqw0BEeS4uGP/btqEGweTGBpxJMD5zu8HwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=B8JIIEOe; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPvdh8A1OBMVLGxSm6gpKsFmm6eixw1FjVktqd1vf04WMqe+QN9F100Eo8KyyrAjlzrJSJMdggl2cvDSNIDOFFMF12LsaQEhbzemHZZceMABDpwl5juTjKjHlY63+JYq/4gq0wrRahD6KuI8SncLANzMH6OGF8j6kN93TbUBExmyZ2H7WKKE8xL8z73r0gP/TPmtbpcY93MywLUjiEivrvrFHKqX1aiNDVRb6r82zH0M0szrvERHKwYLz050LPFkH0Tq5tcWxmxy2qfSdxdxllhl8TJ0O0LH3tpheuu6f+CbMuoJmJI29P8K/JZShOgsgzluVuMCXk+RMwAYTXTjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbDPhIEQ5rblo0fqc03nrxt8+bSkJIGh4SFREzeEhpk=;
 b=nGDKxsOuQhZwMJU/pE1RkrqS72I13d+yGvubtO97GokfJY6bpBt9eJLO3oyGwhp6n1GbzY/FewqRWJnUNSnvyF1Pko7pJdOS/SnppAEpxzfUSJmtOjd+KKcuxUgjUK8/+gFPrN8Z8Xh/xNolRHx5KOXYdPgMzPwP8eGEXNMcyZ6XrCVkN7PtXMgnU2/xeQiXK9HHmtlnJYOTSvmh7zdIdbgP8b9p/1PSocaIkE09iMsQobUuqKg70Hb87059BcCO3c5NQGYeECJnoPmteBnUXkfte1D4W4HquaZ6MfYzsdw+P6h0R4Z91AEAzJWLghlS+eNVbD0Wh0ocj6z4rOtCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbDPhIEQ5rblo0fqc03nrxt8+bSkJIGh4SFREzeEhpk=;
 b=B8JIIEOem1BxO0FhwWhWyWNVrzyJ4ir1DXCFTjXMrYU6cltlitU+vHH7xTnGkDeXNoUmNJnUj5B/w90ftVhkRTaCBli6YMFsgoS+EooeDrTQZw6yUzq6bYWV8+LG75f1fOZXVmvUYAbWAg2E7oyBpstkG66bealP/6QqDjTouf866Zryt+RGBIMnZGvtIFNXZ9XLd/5lri5xZ/wh6uKBVLXFVt4QkQBsb4q5NPbUwHS0HOt85U12ywNbaQZPfP9xY6nYBJXX4AEBT5l9y78Y6viHSWZOuVBV7/1PFmycow23r8Ey9B7cJptTMvTH9Of5ADJETjrsiedBxGYc9cwIPg==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB9805.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 05:05:28 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:05:28 +0000
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
 AQHbfXSaek/9eKHa2UOEiOnSSu3oB7ND8GeAgAUzRwCAAFNAAIAACtOAgAFn6wCAABI2gIAAF0+AgAA32oCACoflAIAAH6YAgAAF7jU=
Date: Mon, 24 Feb 2025 05:05:28 +0000
Message-ID:
 <PNZPR01MB4478510C11E2D619C793D23BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
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
In-Reply-To:
 <CAMMLpeReEKgizVQ6Z9=Go2y9djoTBPofbB8vJbPDbjvunuLDLw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB9805:EE_
x-ms-office365-filtering-correlation-id: 7c2237d6-d3eb-4e89-9753-08dd5490db41
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|8060799006|8022599003|15080799006|6072599003|461199028|7092599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?aTVHQVhLTHpqNlJPY2g5SjAyTENTNkNBMEhiYi9xakJPc0RRZ0xnK2RwQW0v?=
 =?utf-8?B?YjlybnI5Z1pnY2NudVBraEtMekFlamRrVzFYenZvNGR0enBuQnhNWUl3WTFk?=
 =?utf-8?B?Y3RnM0FDZFBUbExsekttbnNlSkRKUmhMeHZoS25ycEc5UFA1UFJkZlNqbHlk?=
 =?utf-8?B?U3MyT3NWR1Z2eUtRTUF4RmRZUzFtcHFMaVVEcWIvZi9DL3RBelF4cjEzRCtF?=
 =?utf-8?B?MmREWHFwOHc1MVpmTW56QVhJR1pYb1ZGTXVybUN6Z09NQ1pQY2FRUGw1Wk45?=
 =?utf-8?B?Zm15ZUEvL2JYUkF2eEhrcFo5a0xPeHhkSWN2ZTY1a05BeHFMdENsVFFPdGRp?=
 =?utf-8?B?a2R4MENZbnpaanpBV3hBb2FDcWxtb25tVXRSM1AwVEc5ZHEya1RUQzFqVGQ4?=
 =?utf-8?B?a1NPbWFVamIzNW1LaTBjKzRGdGVMVTNaZlFuRkswNkhCZzdEVFpEcUdqQjlD?=
 =?utf-8?B?V1FSY0l0b1NsM2dMWkIvS0I4VVBPSVRyWUVRZ1E4OWRHZ0lqcjZHbFVkZEpt?=
 =?utf-8?B?eGZ4bTF6SlBUQjJLRDk5Q0E2WlNYQjhlVUhqbm9zVWZoRzhoZldWVE9BdGRM?=
 =?utf-8?B?VzBkditnWUhTeVZvL3RKYVlROVd4SDB4Q04yS1ZSZXVQbjZabVdnRHljalhD?=
 =?utf-8?B?Vjh1S0EyUHlvNVMzKzJBWTBDSUVqSUdhSEhpZU43YUlwckZjMjB1SVhMQ2Vm?=
 =?utf-8?B?Q3J0YmgwVm1OTUZZTHZ1ZXV3L1hzYmdXUExJWlFWWW5YR3c1UlFsa202Y2sz?=
 =?utf-8?B?L2dKWlFLVFNucG1MT05GbVdrQWYxeTJ3RE1nV09MRmozTXV3L0tmOXlvd0Vt?=
 =?utf-8?B?SkFpOGk5YWhFRDRXaklHYlUyMnhsbFJhMFpoUW9BaEVRMndGZmhkd1FHZHRT?=
 =?utf-8?B?TmJjRldRY09STjY5Qi9MOVk1UHhsV3ZIaHVBSG1IblNONUdRTmFnNzE5aEZO?=
 =?utf-8?B?cjkzRGgwa0hjTWFHUkRTZ01iL2R6ektNZjF1cE9yZFZIU3lla2MzZXQzSVQ2?=
 =?utf-8?B?RG8xMFE2amVlN2JtWEN3ai8zcDRmTGJPK0dFVUVvODh4cmlmT3Q4YzcvSjRl?=
 =?utf-8?B?WjdSY0dybG11QU02c0JqTG1Jd1VFejBNYk5KbHo5bE42eTdrdTluUDMzUWRG?=
 =?utf-8?B?aE9MREt5eFdPbVVhYVF3YVFtaUdWV2E2VHpPV3cwSE1GUDRWOWVrNnF0K0hK?=
 =?utf-8?B?OEFhcnVQdmRVMEFlRzZyMlJCYmw1TlRrbmdoWVJzUnNEUE1NcHFWRWYxTUdn?=
 =?utf-8?B?RkhObmIySzZjM0ZqcDRUNWJPTzF0d01zRVpUQUhtdjFWcWJKRXpzcE10Q29F?=
 =?utf-8?B?ODhKQ0JCR1NsaFlwajhadEFPY3dXNjhjd3l2MkNzcmRUdVpGUEx6clBicks5?=
 =?utf-8?B?Zi9MUXA4a3V6enRRend4QlpUOGd4eHViWkdSaHVyUVJzOVNtcXFnL0ZxaE13?=
 =?utf-8?B?Q1NxWmxxQ1d1QlkrL2VNa25oTXR3QS8vWTEweW5ibFhFU0hWemxMVUZLREdv?=
 =?utf-8?Q?IYxj26adYgUwgcea/u7sC04S+LV?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ViticGppeS9mTkt2SXZLdURkZ3RRUnJ4cU14RTRMR1dKdGNXL0NaMXZSUU45?=
 =?utf-8?B?QzJuL2hCQUdQdVFPallORWVvcnhuczA1VzVQT2VJc0toQTdybEt4aWVmb2hN?=
 =?utf-8?B?UmJVQ3N4YS80UWpFYzlqckR2N2hndzNRZ3hEd2d6TnB3d1lSWjBldVJBL0JV?=
 =?utf-8?B?dU5kQkkxYWF3R0Q4SmxCYjJiQm4wMFlldFhMNzcrTzBMeXZnWEVlYTZsNzh2?=
 =?utf-8?B?L0Nja3lXOEsrTVJoOVVWSmhNQWxOWVpaTWVMODVxTUMweWxYaktIQUxFZlZ4?=
 =?utf-8?B?RFZjbDdXRmlTM0wxaDR5ekU0aW80aTY3V0FSam0rcmF1dm1CUjF5VUY0MklL?=
 =?utf-8?B?dzUxRXVtdUovY1A1dlpOSmN2dldLRkoyeFF6QURJRGtNUW0wZk9SK2JLVDR4?=
 =?utf-8?B?Vk1DdmJXQ25LQ2tuRzJKSU05b29GVG9IYVVEczdOZWJnajYzdUE4UnV4U1Vr?=
 =?utf-8?B?TThuc0FJenhKaC9TbTNKYmtoaWo4OWoyaXFKbkNkSlBmcW5taURxNzBYRUlP?=
 =?utf-8?B?bkN5WWJ5TTBkb0E3dU03dkZYejUyWEQ1b0NreHJBNTdSMGhNS2Z4Rjh4cVIy?=
 =?utf-8?B?V1NxTzEzeGlyT1p4L2tyYXJmY2VFTjc2VXY2UUZDNzI4dHJDeUN2Y1R5RjZl?=
 =?utf-8?B?NnJSZFIwaldTZ3RYTGl2QzNHd3p1YjU2OVpjNEJPMTFSdG9PeHBFWW83TlBL?=
 =?utf-8?B?RVlNOEdPQURQRmpWM0Myandub0JVTnlHYjdmakV1c09id0V2b2lWQjdKR2Vx?=
 =?utf-8?B?VUZoU3R3a2Y0NkdPVmlpbEpPQUUyUVkvdUxhUFZGajhLYVY1S21YbGZIaEw4?=
 =?utf-8?B?MW9DWE5TS1ZOdzBwWVdnZlpKWnJ2MXhMbUFUdytCQ093YTNKM1NHOGQ4VnNy?=
 =?utf-8?B?QjBjcUw4MGpKNEcyVVdxbENVRHh6U0NIRHdyck1ETzJmYXJ5UHRuRTFTSkd5?=
 =?utf-8?B?WUZQaU5GWEtMZzRJcDF2cDJiQkFXeEsxUHJMRXZvUWpNd05CWnVMQmFnTyt6?=
 =?utf-8?B?YnBzcnNjWTZZSHd5TzA2KzVIM0R2bVRzbDY0WmRoM3VDNVlMK0ZYd1Jya0RU?=
 =?utf-8?B?MDIvaHRsQjBGaDVhNUNyL0tIckVjKzdyUVRJMXprcXg1M2sxdWoxczFaUVVh?=
 =?utf-8?B?R29xZTRhMEpBR0xyOHYwdG8wZExQOExkWDBHR1hCdjVGSkhZQjVMblEwKzlw?=
 =?utf-8?B?a21WamZBZ3d4K3JhYmtNWnJlTWpLT0N5U05TaGJqK2U1enFYYmZnZEt1NlA2?=
 =?utf-8?B?M0x5MEFWUzh3bUhaNFd3WWFxQ2JubmJPRVZXY1I0M2Y4bUpHbTlQUjVJallX?=
 =?utf-8?B?c09OWUZPNW5FK3A3UDlSV3dNS2xjaHdGSXZEckNzTERxNWQrVVZLMzJHb2pJ?=
 =?utf-8?B?UWpVTXFFMWlXTHAvMUFEdTB2MGRvUVhIankvOGRUcE5BMWZHYU4rYVRFS0dk?=
 =?utf-8?B?M1hWZ0J2ZTBvdTFsS243cGQ4S2pvd1E0MEFRTnJHWm9YaDVOUDQ3bE9ycHRV?=
 =?utf-8?B?eWdwYmoyY0c2UHJaTUMwZ25OeG5UK0RKTVN3dWZUMXJ4TEdKQzJxbG1DZ2lF?=
 =?utf-8?B?anpnQmJlTTVGSytQSU9rbmJnbTE4YWF2bFM5cFhHSEpCUGtrSUxSYjdGNHoz?=
 =?utf-8?B?UXQ0cFVwVHFneGhjSytlOW5RbkFTdUVSdGRQVFVmOWlHR2xEZXBnVjdheWYw?=
 =?utf-8?B?Qm43WG84MXNMK2tPSk5ZV0t5cXU1NVY1WFEycGpWVHVjMGNFY1lHeExYUzhq?=
 =?utf-8?Q?sMr6o0G0DOQ9tJ6fHE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2237d6-d3eb-4e89-9753-08dd5490db41
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 05:05:28.6495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9805

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDEwOjE04oCvQU0sIEFsZXggSGVucmllIDxhbGV4aGVu
cmllMjRAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFN1biwgRmViIDIzLCAyMDI1IGF0
IDc6NTDigK9QTSBBbGV4IEhlbnJpZSA8YWxleGhlbnJpZTI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+
IA0KPj4gZm5tb2RlPTIgaXMgZXF1aXZhbGVudA0KPj4gdG8gZm5tb2RlPTAgb24gdGhlIE9tb3Rv
bi4NCj4gDQo+IFVnaCwgSSBqdXN0IGRpc2NvdmVyZWQgdGhhdCBJIHdhcyB3cm9uZyBhYm91dCB0
aGF0IHRvbzogSW4gZm5tb2RlPTIsDQo+IEY2IGlzIHN0aWxsIGNvbnZlcnRlZCB0byBOdW0gTG9j
ay4gZm5tb2RlPTAgcmVhbGx5IHdvdWxkIGJlIHRoZSBiZXR0ZXINCj4gZGVmYXVsdCBmb3IgdGhl
IE9tb3Rvbi4NCj4gDQpSZW1vdmluZyBBUFBMRV9IQVNfRk4gcXVpcmsgc2VlbXMgdG8gYmUgYSBi
ZXR0ZXIgaWRlYSB0YmgNCj4gLUFsZXgNCg==


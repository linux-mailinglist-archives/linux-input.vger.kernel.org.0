Return-Path: <linux-input+bounces-10089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B5FA37AD4
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 06:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 191FF3A69D7
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB4B14A4DF;
	Mon, 17 Feb 2025 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="YjC5dVw+"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCAC142E67
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739769536; cv=fail; b=bS+pR/GU5vVxjui1yJZNbSGHk/9RcSXyqaJUDAP0Y9qYAnyCtrflgUAk1SnQ1T3k7v8xXFYnyHF+Fy1sePdx4MiqEFAUVsdm6f9ablAYtxqZWYICc2K+1gbVgh4OBp6mzb4tYnYAfHBq+Id4WuzH+70KPLxUY0dXrgz5PtFnakQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739769536; c=relaxed/simple;
	bh=o8ZCvgdfh9shg6eNtMhhaHR+VZMxMwiQdAA2bbxEso8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KjtLhXKW3nZp9DgMRTNQ7b3yfeeDLevintTcBuxEtRJnebZfQOuHyq7RtBGCve4EQtSyFdzo9tsVu9UERF6A4N63gfMSQcszleQYrEudpvgRYfAmKYvzQPl4I5xZoI1x4k3iHWbGQkDP+9AJ2UGaZE/ObuYk7p3W6BtmrUE5Imc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=YjC5dVw+; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRLojuW3p8wpH/WAynI8PLIL7HaqSLN1sOxKgaKtBG1t9YkxeMWURiQF94WE6/1hqX3RQEo3xR3iOr++5t/6Xr3ct52TutQzGf8KtxHASmD2tD2DljnYqzY4sNSjmAStyMdvCakGAF5Wrz0C6C9b+AiDlcwQ50XLjCl5jBPexljqZz8RzMqWBKleHczmS8QyA67INcoXHMcrbGSASKKVkgDK5aJP8LeQ5HUADdIWdECM8wtXmPYiG1RLJV9wCUzaoc2Ox+oiBorKieUAjOsesT1rnYW/w9QJOpYPdQvn+wlpAzkNjKb0r07n2dV+P/EM9SxWLjPdRNeYnOcx/6Uigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8ZCvgdfh9shg6eNtMhhaHR+VZMxMwiQdAA2bbxEso8=;
 b=wmyGDVb0b/w9ydgNDRifPq0syPobH5TngqnNMpr4hP9HAX7njZocXYMi1+hxpcHPC8/BubDQRcZmK7Izye4yKxFUrmJ5adn7BWougGVNAHh/ePEhCDoCpCuXc1WPQJ7C/Mwn3x7fAAcv8aq4OK+dIjsN26cXIP5LwnVxrvZGe3R7Dd5L8hduUgzA91X/JTNtGUieA3OG9PkFO00/R4L+rHkYruzoNZ9UQXWDqSU/QDSMAK/eVOjDaN5+ObPCqvq+HJDzOmLkmc1NM8DoXKEqGzIUV6tcsk170tcbiQa4FoHyGeC/QFx3nyOBH88Qf9v1aRzg2A+nWfuCHWPoa3TAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8ZCvgdfh9shg6eNtMhhaHR+VZMxMwiQdAA2bbxEso8=;
 b=YjC5dVw+vSYth3xLnRdjezlQe/kMtSvN8wrsiZP4YzoPFAcUWQvJkh6AzpwYDGQ12poeVpwdCNkgZHdu5AGLFIRA7Scg026rCboafMp9vDewBSEH6rewmvJFyNivTwYlKbMZTAcW5IE7kmtpVoSXSQWs/EtJ5mFu4lhCRCCUepxBuaZFK8g4LbFDqNYrjXp9nljM/rBJ0zUOEq5B9kwfkr4r+YIoCsMAp8CEejam49HwLnbFnHbGRtxRBbDGNg2irWYmRJaMSysxvmdG3dSXtqhQQ9L7lopqE2JjgN5yQLbn0s/uv66umF3No92saxuLcfHqusfroUbEZXsiRDf3Ww==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN2PR01MB9957.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 05:18:50 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 05:18:50 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Topic: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Index:
 AQHbfXSaek/9eKHa2UOEiOnSSu3oB7ND8GeAgAUzRwCAAFNAAIAACtOAgAFn6wCAABI2gA==
Date: Mon, 17 Feb 2025 05:18:49 +0000
Message-ID: <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com>
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com>
 <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com>
 <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com>
 <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
In-Reply-To:
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN2PR01MB9957:EE_
x-ms-office365-filtering-correlation-id: 69e50594-d403-413f-8fe1-08dd4f128ffd
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|8060799006|461199028|15080799006|8062599003|19110799003|102099032|1602099012|3412199025|4302099013|440099028|10035399004|41001999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWZqdmVsTWRqNXdRdzJsR1B1cENMMlVzUDZRb0pXK1FyZFJMWHVjY3k0NzJz?=
 =?utf-8?B?dnRrNlhjTW1GOHJ2cWFNdWRpTEw3RWUza2d1WFFSc0k3c3JTUVlLOGJaVWp4?=
 =?utf-8?B?OUUyWDExRU84bUJoRWxuYnZqN1FzYjNRL0lGdWpBSEsvZUJKSDRZM2I5aWpN?=
 =?utf-8?B?akliRkJXNnVGV2NuT3UvQ2lLdkRac0k0cE9Ea2JpdUNPbjVqNDVBbXRxK0lR?=
 =?utf-8?B?ajd3SWQwd09kSG43OUt5OFFNbDFuTSs3bnE5SkV4L2R5azRrUmdad3BoeGVP?=
 =?utf-8?B?RUg0aERhWFZpbjE3KzN2UmxTaGloREQxb1BkOXAvUkVaT0RCNFJiS0lrYWt4?=
 =?utf-8?B?Y2RGamlYTlQxMEJwc0NZMzdsaFJ1b3dYdkNvWlpCdk1Kd09DYnhGSVVoZ0wy?=
 =?utf-8?B?Y0FCM3l4K2tsSVhuMFdXY0JGdTVibktaL2ZBVFFyQ2h1SVhOYitWL29MSUdp?=
 =?utf-8?B?NklFTFBxRE9JRGRuZEVRWU01SkxEWDM2KzJaTVNiZ1RRWUxOMTJvN2ZCK0xu?=
 =?utf-8?B?QWxpVWk2SjZ4aDluTVVCM1dsbmIyS3VtdjVBemk5elhVNWorRnljek9vZ0Vl?=
 =?utf-8?B?aGl4WVo0T2dMclRIVFpGYUNiLzgxNlptbGlCVGJjQnVEb21jREh3d3djcDVQ?=
 =?utf-8?B?Q3FkTjZOeHdvcWdwR3lBdGo0RTltSWlPUHpYZGxTWWR2VVdxSjMvQ3J1RWhP?=
 =?utf-8?B?aXhjazVQMitUdUtza1VBMHJhMnJsRmFwdkVWRStNQ2VBOFhWdjhIclJ3NCtY?=
 =?utf-8?B?WlRtZk5hSmdJWWRrbDFDVUk3UG5oQjgrQ2lMNWlxc3RvRU9WWGpWR2Y1ejJ3?=
 =?utf-8?B?Z1dWV0JQbi9RMTlrSFJNVjV5U00xMG5INFFLTFlJTHkrdUtsaTVsQ1hHdy9a?=
 =?utf-8?B?QzdrbHJ2UFhiR2lTSGlEbzZtQ1Rxam1FUTIvM25uQm05Y2FLeWFXWVhCZ3Vt?=
 =?utf-8?B?QnpWYkN6MWZFbGZnYi92N0oyUmhsUFJBQkJ2YkFkOHZQTXBSZmxwek5ZakNo?=
 =?utf-8?B?eWF1L3RDZmFPYlEyUmkxeTJwbW00QS9OeHFVYXVpY0JlQkpjdHE0cS9zRFZp?=
 =?utf-8?B?alVDQXFpVnp6aGFFWVdFajBJZDJmaklsM0FvUkhKMVB6TVQ3RVhJQnBqRmhs?=
 =?utf-8?B?NlVsTWVxMDd1N0xnbWc5TFdUK0ZoMmwzVDJEa2pmOEJwd2NKUzhPNkFsN09o?=
 =?utf-8?B?N2dXSlZQVG0xS0tmVElvZlB5T1hzemFVRCsrUkJTYVVXSWlhcjJ1S0p1amxQ?=
 =?utf-8?B?L3VTK3pGS1RGb1hmN0x4amxtNHJKRUgrR3NNL1R0cVY4Y2J2WVBxbzlrdlJB?=
 =?utf-8?B?MmpKaTJWMGlPMUpQMGdPcVVTTWx1dWhwc252c0ZYMGRtYXZNaGNOSzhZcTRm?=
 =?utf-8?B?VDhOcXNiNU1keUM3M0xhRklWdnQyK3g4alF5dE1BVHB1anVEZzhIdjE1YmI5?=
 =?utf-8?B?V1JlempXcFFqZUNNaW91MndUb25aMkJRRTV2OEUrd1BibmkvMEwvMzlYUmVJ?=
 =?utf-8?B?Q3EzTjl6ZjRrZkh0ekRaWXVyMS9VSnNNcFUyc0lLWmh2TlBiWU5CWEFLQWpW?=
 =?utf-8?B?UzV0MVpEK1F0bFE4Yk5KMml2bGZOQ1NGNkVzSXorQmZLYjFqaEFyZ05zTEFy?=
 =?utf-8?Q?EKldWMHO6tpcgg0B6THFk0xOWU4lyNCbumaPBhDc/Jvo=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzYyWmxJc00wVlpsMllObjRyaU1UNEV2MjJUU3l4ZjA5NDlIZFVYVGlLSDQv?=
 =?utf-8?B?aDZEYkdzV0JxbmxmcGs2bCtKU0pUS0YxUldqS3dVNnZzVHBCMUZ3THY2b2w0?=
 =?utf-8?B?NE9YTXc1WWJtWjBxdk5iaEZQS1lXSU1VdW9CTXo5VytrRi9wSGNiZFBlVEhp?=
 =?utf-8?B?WFY1OWw4bXBsajBzT1lHWmlhSmlOT3cxU0F0QUY4allLVHZyMFZ1MndHYVhB?=
 =?utf-8?B?dGpwMTZrcVN1N1drOVJzL0Q1Z1NFSU5WOHVhdUw2MG93VUV3TlNidmUvODZI?=
 =?utf-8?B?SHg1R240a1IzV24yV0RQU0FyNisybVJqb1NrRU04a05pVm5STUMzdGlEUnFa?=
 =?utf-8?B?SitOVUkxVkpTdHA4MVh6WW91N0R3OG9rbnc5dmFBTTNuZjFWdGJHYzF6VDJJ?=
 =?utf-8?B?VDkzc2hNa3FMeExVcGQyVDJybHowc0JvTnZKZ0h4dWhSdjJjRVpDdUd6bktK?=
 =?utf-8?B?a2VPTDYzZDZpUVpGb1VLNkFacHZiL0MrUXI2VVRlZytGR0FoWFNpVlpPM21M?=
 =?utf-8?B?U3lodGx5RTlXQXd6SHh1UkdZU2FzU2ZwSGxNVFRWeTZ6QW05NjFqOXJ4QS9P?=
 =?utf-8?B?dE4vY0dxMHIvRFFObExkTFV2d2VES0oxcXRnbGdFWW9HRklIbWdsVlNsSzNm?=
 =?utf-8?B?clZtMVJRdEZ1SnJ3cXhmWlVjR0hGaFplWTAvWkQySmNxaXdLV0dFYStXN2dw?=
 =?utf-8?B?NUNsSW1TTHM2bU8wK2t6ZjZrQmZqdjJNWExNWnE0NkZaTEQ5NFRaMmJLVHkx?=
 =?utf-8?B?TUswODRISytpeDlWeVV4WEtHSEh4NG1JcXV2MW00c2RrMzlIeW1JMUQzTERS?=
 =?utf-8?B?U3d3Z0dXNDVzVms5cElHM0dmaWtQZVBJNU5tV0U0MHp3dTJodk1Wc0E0eGtx?=
 =?utf-8?B?dHJZMG5yN0NEd3pMSkRvVWhnQjVlV0tCd3kwcWEvbVU5NHlGSG5aL2J6S3RC?=
 =?utf-8?B?ZjNaQ0JSYk5oSHRySEp3VXJaMHp0R3JadVpjZ1hXWWNZZFBJR1ZNOHkzRjBR?=
 =?utf-8?B?dEpxNDg2RVhkOStGaitlNW1UY0xHOWlUaGU2eGhPdmlJU0Y3SUJaWkh2MEtF?=
 =?utf-8?B?WlZLVVIwdlNvY1E1NVU5U0dnTnBnalM0UkdQa3ExcXhETGlKeWVPdllaUDNv?=
 =?utf-8?B?QUhOQlpLRks4cUUrbEozdCtka1RzRmgrd1N3aU9tR1U0ZmgvcU1qWUNXblNJ?=
 =?utf-8?B?TFExVEVFV25mZDh6OHBwblIvdjRmcExYU3d3cDNQZ3FCZmdIa3VVTXB0UzhJ?=
 =?utf-8?B?S0NqUnY1ekw0eC9aWlU1RFU0SU5zMWh1UjVrcVQvR0UvdEFOcFpTKzkvTFVT?=
 =?utf-8?B?N0xac3ZzZTBweUsycXdkQmhob29zbDZVdFIzbC9jeGxQTEduQ3FEaU94bEtz?=
 =?utf-8?B?Ykg3bzkrbjZoUWZiRDY3Z3lzVk5vK0tHb09TQ2U3T085MVduSzdCZFdBREQ5?=
 =?utf-8?B?bFRYbjdrNEFXOE4rZWVZcUpvb29kMlAwYVc5aVZkVUhtd1prNHZPK3lzM2U4?=
 =?utf-8?B?NjJEck5tWnFHNUxSTmw5ejlkSGxNa0wvRWdINUVkWmkwUmd1amhMcno0R211?=
 =?utf-8?B?czU5TzFSZGIxLy9mc1JBaWRzdGxJQXUzdlh0RHREUDZsWHplZzhlZ2pEeXl5?=
 =?utf-8?B?QXpqWUVic3oraVRLc0xtaVpScFZUazUvbmxqeTBSeU5hZzVONUppeHFQN2xt?=
 =?utf-8?B?Q2l3enZid0dheEVxak5kMDMwS2hQZU1wK21KKzZUOVV1R1RRZEpxaUpHdHVm?=
 =?utf-8?Q?yrPwqR33uJ6mW5xLooSAIIOkN4jgBULls940pIT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DED6B9604ABF594C962601E1D5A962FA@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e50594-d403-413f-8fe1-08dd4f128ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 05:18:49.9829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9957

DQoNCj4gT24gMTcgRmViIDIwMjUsIGF0IDk6NDPigK9BTSwgQWxleCBIZW5yaWUgPGFsZXhoZW5y
aWUyNEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gU2F0LCBGZWIgMTUsIDIwMjUgYXQgMTE6
MDbigK9QTSBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToNCj4gDQo+
PiBJbiBjYXNlIEkgYW0gd3JvbmcsIGNhbiB5b3Ugc2hhcmUgd2hhdCBleGFjdGx5IGhhcHBlbnMg
aW4gZWFjaCBtb2RlIHdpdGggZm4gb24gYXMgd2VsbCBhcyBvZmY/DQo+IA0KPiBJbiBmbm1vZGU9
MCBhbmQgZm5tb2RlPTIsIEYxIGFuZCBGMiBhcmUgRjEgYW5kIEYyLCBhbmQgdGhlIHJlc3QgYXJl
DQo+IHNwZWNpYWwga2V5cyB3aGVuIEZuIGlzIG5vdCBoZWxkIGFuZCBvcmRpbmFyeSBmdW5jdGlv
biBrZXlzIHdoZW4gRm4gaXMNCj4gaGVsZC4NCj4gDQo+IEluIGZubW9kZT0xLCBGMSBhbmQgRjIg
YXJlIEJyaWdodG5lc3MgRG93biBhbmQgQnJpZ2h0bmVzcyBVcCwgYW5kIHRoZQ0KPiByZXN0IGFy
ZSBhbHdheXMgc3BlY2lhbCBrZXlzLCBhbHRob3VnaCBob2xkaW5nIEZuIGNoYW5nZXMgc29tZSBv
ZiB0aGUNCj4gc3BlY2lhbCBrZXlzIHRvIGRpZmZlcmVudCBzcGVjaWFsIGtleXMuDQo+IA0KPiBJ
biBhbGwgbW9kZXMsIEhvbWUgYmVjb21lcyBFc2NhcGUgd2hlbiBGbiBpcyBoZWxkLCBMb2NrICh3
aGljaCBpcw0KPiBhY3R1YWxseSBQb3dlcikgYmVjb21lcyBEZWxldGUgd2hlbiBGbiBpcyBoZWxk
LCBhbmQgRjYgYWx3YXlzIHNlbmRzIGENCj4gcmVzZXJ2ZWQga2V5IGNvZGUuDQo+IA0KDQpTbyBq
dWRnaW5nIGZyb20gdGhlc2Ugb2JzZXJ2YXRpb25zOg0KDQoxLiBGbiBrZXkgaXMgaW50ZXJuYWwg
dG8gdGhlIGtleWJvYXJkLCBhbmQgZG9lcyBub3Qgc2VuZCBLRVlfRk4gbGlrZSBBcHBsZSBLZXli
b2FyZHMNCjIuIEYxIGFuZCBGMiBhcmUgYnJva2VuIGFzIGZhciBhcyBGbiB0cmFuc2xhdGlvbiBp
cyBjb25zaWRlcmVkLg0KMy4gU2luY2UgZm5tb2RlPTAgc2hvd3MgdGhlIGFjdHVhbCBzdGF0ZSBv
ZiB0aGUga2V5Ym9hcmQsIGludGVybmFsIHRyYW5zbGF0aW9uIG9mIHJlc3Qga2V5cyBpcyBqdXN0
IGZpbmUuDQoNClRoaXMgbWFrZXMgaXQgaW1wb3NzaWJsZSB0byBmaXh1cCB0aGlzIGtleWJvYXJk
IHNpbmNlIEZuIGlzIG5vdCB0aGVyZSBpbiByYXcgSElEIHJlcG9ydHMuDQoNCldlIGNhbiB0aGVu
IGp1c3QgbWFrZSBmbm1vZGU9MCBhcyBkZWZhdWx0IGZvciB0aGlzIGtleWJvYXJkLCBhbmQgb3B0
aW9uYWxseSB0cmFuc2xhdGUgRjEgYW5kIEYyIHBlcm1hbmVudGx5IHRvIG1lZGlhIGtleXMuDQoN
CkJUVywgYXJlIHRoZXJlIGFueSBkaWZmZXJlbmNlcyBpbiBISUQgcmVwb3J0cyBpZiBGbitGMSBh
bmQgb25seSBGMSBhcmUgcHJlc3NlZD8NCg0KPiBPbiBTYXQsIEZlYiAxNSwgMjAyNSBhdCAxMTo0
NeKAr1BNIEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPj4gDQo+
PiBJIHRoaW5rIGl0cyBiZXN0IHRvIGRpc2FibGUgdGhlIGludGVybmFsIHRyYW5zbGF0aW9uIG9m
IHRoaXMga2V5Ym9hcmQgYW5kIGxldCB0aGUga2VybmVsIG1hbmFnZSBpdC4gSXQgY2FuIGJlIGRv
bmUgYnkgaW1wbGVtZW50aW5nIGEgZml4dXAgdGFibGUgdGhhdCBmaXJzdCB0cmFuc2xhdGVzIGFs
bCB0aGUgbWVkaWEgY29udHJvbHMgdG8gdGhlaXIgcmVzcGVjdGl2ZSBGIGtleXMsIGFuZCBvdGhl
ciBzaW1pbGFyIGludGVybmFsIHRyYW5zbGF0aW9ucywgc28gdGhhdCB0aGUga2V5Ym9hcmQgY2Fu
IG1pbWljIHRoZSBvcmlnaW5hbCBBcHBsZSB2ZXJzaW9uLiBMaWtlIHRoZSBhbGwgdGhlIDMgZm4g
bW9kZXMgc2hvdWxkIGFsc28gd29yay4NCj4gDQo+IFRoZSB0cm91YmxlIGlzLCB3ZSBoYXZlIG5v
IHdheSB0byByZWFkIHRoZSBzdGF0ZSBvZiB0aGUgT21vdG9uJ3MgRm4NCj4ga2V5IGluIHNvZnR3
YXJlLiBUaGUgRm4ga2V5IGlzIGVudGlyZWx5IGludGVybmFsIHRvIHRoZSBrZXlib2FyZC4gSQ0K
PiBldmVuIGxvb2tlZCBhdCB0aGUgcmF3IEhJRCByZXBvcnRzIHdpdGggYW5kIHdpdGhvdXQgRm4g
cHJlc3NlZCwgYW5kDQo+IHRoZXJlIGlzIG5vdGhpbmcuIFNvIGVpdGhlciB3ZSB0cmFuc2xhdGUg
RjEgYW5kIEYyIHRvIEJyaWdodG5lc3MgRG93bg0KPiBhbmQgQnJpZ2h0bmVzcyBVcCAoaW4gZm5t
b2RlPTEpIG9yIHdlIGRvbid0IHRyYW5zbGF0ZSB0aGVtIGF0IGFsbCAoaW4NCj4gZm5tb2RlPTAg
YW5kIGZubW9kZT0yKTsgd2UgY2FuJ3QgY29uZGl0aW9uYWxseSB0cmFuc2xhdGUgZGVwZW5kaW5n
IG9uDQo+IHRoZSBGbiBrZXkuDQo+IA0KPiBCdXQgZm9yIGFsbCB0aGUgb3RoZXIgc3BlY2lhbCBr
ZXlzLCB3aGF0IHlvdSBhcmUgc2F5aW5nIG1ha2VzIHNlbnNlDQo+IGFuZCBpcyBhIGdvb2QgaWRl
YTogSW4gZm5tb2RlPTAsIHdlIGNhbiB0cmFuc2xhdGUgYWxsIG9mIHRoZSBzcGVjaWFsDQo+IGtl
eXMgdG8gYmUgb3JkaW5hcnkga2V5cywgYW5kIGluIGZubW9kZT0yLCB3ZSBjYW4gdHJhbnNsYXRl
IHRoZW0gdG8NCj4gdGhlaXIgb3Bwb3NpdGVzLiBGb3IgZXhhbXBsZSwgaWYgdGhlIGtleWJvYXJk
IHNlbmRzIFZvbHVtZSBEb3duLCBpbg0KPiBmbm1vZGU9MCBhbmQgZm5tb2RlPTIgd2UnZCB0cmFu
c2xhdGUgaXQgdG8gRjExIChiZWNhdXNlIHRoZSBrZXlib2FyZA0KPiBvbmx5IHNlbmRzIFZvbHVt
ZSBEb3duIHdoZW4gRm4gaXMgbm90IGhlbGQpLCBhbmQgaWYgaXQgc2VuZHMgRjExLCBpbg0KPiBm
bm1vZGU9MiB3ZSdkIHRyYW5zbGF0ZSBpdCB0byBWb2x1bWUgRG93biAoYmVjYXVzZSB0aGUga2V5
Ym9hcmQgb25seQ0KPiBzZW5kcyBGMTEgd2hlbiBGbiBpcyBoZWxkKS4NCg0KTXkgaWRlYSB3YXMg
YmFzZWQgb24gdGhlIGFzc3VtcHRpb24gdGhhdCBGbiBpcyBzZW5kaW5nIEtFWV9GTi4gTm93LCBp
ZiBteSBpZGVhIGlzIGltcGxlbWVudGVkLCB0aGUgdXNlciB3b3VsZCBoYXZlIHRvIG1hbnVhbGx5
IGNoYW5nZSB0aGUgZm5tb2QgdG8gc3dpdGNoIGJldHdlZW4gbWVkaWEgYW5kIGZ1bmN0aW9uIGtl
eXMsIHdoaWNoIGlzIHF1aXRlIGluY29udmVuaWVudCwganVzdCBiZWNhdXNlIDIga2V5cyBhcmUg
YnJva2VuLg0KDQpJIHdvdWxkIGxpa2UgdG8gdGhpbmsgaXQgYXMgZm1vZGU9MCB3aXRoIEYxIGFu
ZCBGMiBicm9rZW4gYmVjYXVzZSBvZiBtYW51ZmFjdHVyaW5nIGRlZmVjdC4NCg0KWW91IGFsc28g
c2FpZCBGNiBzaG93cyBhIHJlc2VydmVkIGtleWNvZGUsIHdoaWNoIElJUkMsIHlvdSBzZW50IGlu
IGEgcGF0Y2ggdG8gdHJhbnNsYXRlIHRvIEY2LiBJcyB0aGUga2V5Y29kZSBzYW1lIHdpdGggYW5k
IHdpdGhvdXQgRm4/IEkgYW0gdGhpbmtpbmcgb2YgdXNpbmcgdGhpcyByZXNlcnZlZCBrZXljb2Rl
IGFzIGEgdG9nZ2xlIGtleSBmb3IgdGhlIGhpZC1hcHBsZSBkcml2ZXIgdG8gc3dpdGNoIHRoZSBt
b2RlcyBiZXR3ZWVuIG1lZGlhIGFuZCBmdW5jdGlvbiBrZXlzLg0KPj4gQWxzbyBsb29raW5nIGF0
IHRoZSBrZXlib2FyZCBwaWMgb24gaHR0cHM6Ly93d3cuYW1hem9uLmluL09NT1RPTi1VbHRyYS1T
bGltLUJsdWV0b290aC1LZXlib2FyZC1Db21wYXRpYmxlL2RwL0IwN1M3VlBRRzY/dGg9MSwgdGhl
IHRyYW5zbGF0aW9uIHRhYmxlIGZvciBtYWdpYyBrZXlib2FyZCBhbHVtaW5pdW0gc2VlbXMgcXVp
dGUgZGlmZmVyZW50IGZyb20gd2hhdCB0aGlzIGtleWJvYXJkIGtleXMgc2hvdy4NCj4gDQo+IExl
dCdzIHBsZWFzZSBub3QgY2hhbmdlIHRoZSBzcGVjaWFsIGtleXMgdG8gYmUgZGlmZmVyZW50IGZy
b20gd2hhdA0KPiB0aGVpciBsYWJlbHMgc2hvdy4gRm9yIGV4YW1wbGUsIEYzIGlzIFNlYXJjaCBv
biB0aGUgT21vdG9uIEtCMDY2IGFuZA0KPiBTY2FsZSBvbiB0aGUgQXBwbGUgQTEyNTUuIFBlcnNv
bmFsbHkgSSB3b3VsZG4ndCBldmVuIGNoYW5nZSBQb3dlciB0bw0KPiBTY3JlZW4gTG9jayB0byBt
YXRjaCBpdHMgaWNvbiwgYWx0aG91Z2ggSSdtIG9rYXkgd2l0aCBjaGFuZ2luZyBpdCBpZg0KPiBv
dGhlcnMgZmVlbCBzdHJvbmdseS4NCg0KSW4gY2FzZSB5b3UgaGF2ZSBhbiBBcHBsZSBBMTI1NSwg
Y291bGQgeW91IGNoZWNrIHdoZXRoZXIgaGRldi0+bmFtZSBpcyBkaWZmZXJlbnQgZnJvbSAiQmx1
ZXRvb3RoIEtleWJvYXJk4oCdLiBXZSBkb27igJl0IHJlYWxseSB3YW50IHRvIGJyZWFrIHRoZSBv
cmlnaW5hbCBBcHBsZSB2ZXJzaW9uIGp1c3QgYmVjYXVzZSBvZiB0aGlzIGRlZmVjdGl2ZSBjbG9u
ZS4NCg0K


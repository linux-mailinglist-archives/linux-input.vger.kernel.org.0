Return-Path: <linux-input+bounces-12200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA33AAE0DF
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 15:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C6A3A3CFD
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C8921CC48;
	Wed,  7 May 2025 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="B9Ljqzw8"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011034.outbound.protection.outlook.com [52.103.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD4186E2E
	for <linux-input@vger.kernel.org>; Wed,  7 May 2025 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625170; cv=fail; b=o/BMORv2j1lDuRSAsLBqUfdW4jWlyo4l5jDm7BFrA4u4/AwIje615IupDVtqbZMU9YjnTIK+WVoPfYxQ5r1DbSvtefTJM2W30qu7Zvs87Z1Sse5Hw6uQbQ6g1pcckIl8bIGECneWOGHSCIzr0Us/6FcI3FDP5MUz3G0+YJU3MbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625170; c=relaxed/simple;
	bh=if5MVRlP55g4XgQd3Z1/gKBhJW9lSjZbQQJ/RkikeO4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o3ON03gj1Gdf6v/7MBcXV6VEabXTSxJWW05d9/mAo7ZyVETe0wRDhO05fROtRFFjC9HoEwgxWc486kIeRxSTkQfMOavm5IjEMm2j27q6bJoZXWZD2GLecZdVSQfasr6Qvl9pfIEGuJv5BOmeSCbnkK18JUrr/9H/Wjgz6jGXmqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=B9Ljqzw8; arc=fail smtp.client-ip=52.103.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCzuXlm6aQKEjVJdCChnXTo0zdIE5uB+Y72Wj5AU03ba8M95XKrUslUf2DGqb5CAI/INSUOYmdOJ2gl9G4iF3POfdzJnEsgGkjElGXZoOjspCv2JhvtNZ8XUBSO/9Xn2/mU9RniiKml3KOTazpWaGCBdJcEZYuswjU7Llru8WqwEIjh5QigCVOaHO4ju5lSnky4DsOLhZJa36xBpexTiko1C+kaIHtkZLP72QfQGLOHKzC0htV/YKRbc7SSgGSpWq0gRhDv+fzqPje1f02+eoAx0dg0thfJUVagGXOtpAKeQ/fM4JtbfXRY8cyefcyxicvlxc0KfeWy1p+mqSo6E7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=if5MVRlP55g4XgQd3Z1/gKBhJW9lSjZbQQJ/RkikeO4=;
 b=pG4QxK2ooCC5elOAbq+6Xp8lPS0/IyLB0QeoNkYqviemPbgqll2XgHKbPGwgsfzxxJ29R9K/fJXjM7E5WDEjgMX6QecFrQV2zf0YEW69qsFacNbwTcyu5LNmilrBEeydyF29k8lhxQYGXyV+SYgHMc2HKikJsqJeohkcPMx0mdF3iW/68m4a/o1DbkIaPajgr8tt2L4PVjNkCO7jWEhotlAj+/C2H+q7Yz1yS9LRgbh3qwwpBpzWaJnny35Gye2+MLge98BynjR12Y6YdhO9uDHRQOTgWiFRDX3ArTOmcQFimNsAk5pD3muiwOLjcv4XDlEFwh21BdkAn7tL0zXz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if5MVRlP55g4XgQd3Z1/gKBhJW9lSjZbQQJ/RkikeO4=;
 b=B9Ljqzw8MugBd79Vo0VrLwN1hNVuyxXW2qk3W/npFfcWX5NAf3vcTAG4ezxskuLS4hQabVeueHX3dXI+TAobFLGGw4fk+E7D5hR7B6e8CmkZ0IqlXZifSX5xs2nN5OG7zjvuwViENZe0IZB+80OOjTrB1sTz9HFZPJaHsXkdJEuogSL8Jw9g6FTUSx2sTjlwlLb90erDTPsGeLerI61WljklPmVlJl+RsOsr2ttHTEBD+SLuubgwcrF8RiMJ+wUyej/7qNwpK64QwVSAbvqzSYsadT3TpNrtYMgYw9uK5AQmN3I5ZiWRKE7ySqhbwJlDvm2Gb5HzqTWpDHglhwi29A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB8140.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 13:39:24 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.030; Wed, 7 May 2025
 13:39:24 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Matthias <hias@eilert.tech>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: Synaptics touchpad not working after suspend,
 psmouse.synaptics_intertouch
Thread-Topic: Synaptics touchpad not working after suspend,
 psmouse.synaptics_intertouch
Thread-Index: AQHbvL6T6Vk9h4bUOkmFdhF6ptfePrPGF1WAgAEaBIA=
Date: Wed, 7 May 2025 13:39:24 +0000
Message-ID: <664E072E-6063-48E3-9766-CC6D6FF0DCB0@live.com>
References: <325001b5-12e3-42db-96ec-05bd3f23ab35@eilert.tech>
 <3530EFD3-68F2-4890-9ACB-EF963769D079@live.com>
 <aea15a49-4e1c-41dd-bb09-24d2169f1caa@eilert.tech>
In-Reply-To: <aea15a49-4e1c-41dd-bb09-24d2169f1caa@eilert.tech>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PNZPR01MB8140:EE_
x-ms-office365-filtering-correlation-id: 6e0dfd6d-4aae-4258-5d4b-08dd8d6c94c7
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599006|8060799009|8062599006|15080799009|19110799006|41001999006|12121999007|461199028|102099032|440099028|3412199025|34005399003|12091999003|10035399007;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZXRJME5IWHM4bVg1RTVqVUFpdWxlVGp6Vkxweko4YTdPVEszMWpwSkhOUG1Q?=
 =?utf-8?B?U2VuUnZYRXFuWHJRUVpWTmpOS201bnJHdDF6b2plOXV5MDJmWFhObEZ0ZGkw?=
 =?utf-8?B?ckgzbm04b2V5TXNJL01UV2lma2RubVlrTkhYZkkvZ3NiWXUrcS9qdmhiekQz?=
 =?utf-8?B?YStWMnQvMjdBRHpjMWQ0SDFYN3FUcFlGYnd6VGRIZXRZTjBFVmFKU3lRRDlx?=
 =?utf-8?B?eW1TU0tQSUlvNTRrclFCaFdoeTRGU0htR2pkMlo4N081bEJEaVNMZDNITVBS?=
 =?utf-8?B?cXZPeDZQcmNSN090WFBvYklmSnZERDdUSVlMVUhiNzUrSG9peStMeHFwM3lo?=
 =?utf-8?B?QllaM0czTkM0VkRYdWRuNTNhU3p5c0dCWDBYVXRmT2xJMmtwYktxWm9Ddzh3?=
 =?utf-8?B?aHhpeVdKTUsycUFXaXA3WWVsekU2cjVycWpBVnk5OERJSGFoV0U1K0N6WGhE?=
 =?utf-8?B?bURZcnc4SFFQNjhMTkdNK2k5blFzc0FobURYMlJSVVRIYkI1U2lnSVVsejZG?=
 =?utf-8?B?VWNEckZJNXR4b1pKN0RHeXBJTyszV0R6RWVaTHJiMkhBNCtweHZ5VkVNeDlQ?=
 =?utf-8?B?YVN0eVpJRSt2MDlmd1pMa1JrL0tidGJMYmhWdGhlVi9jOUtVcHhOczAycjYr?=
 =?utf-8?B?dllKOUZuNEs0VWVrNUsyUXVFQjlWc1J6Y0VETEFkM0huT213QmoxWHQ3NWQv?=
 =?utf-8?B?T0k0RmxrenluSEIyVDNnZk1FekhhQ3NNelNzWEdYd3VPN0wyeHE1b3pKQXR0?=
 =?utf-8?B?WmFRdmR5bjRubURVRG5RN0xQdzdyWThoVUJUWFYvcHpmTEhpdkk5cW9USEto?=
 =?utf-8?B?a1VEc0U3V29XR3FUeXdrQVJJMjdMS3NxakFlcVlvclkxNVZiZWsxbnZ2dHd2?=
 =?utf-8?B?SHhGY3VYcXVha1Y4Mjh5dzZobXkvNGFGOFd5MFQxemxTTC9xMGJvblpJOHdU?=
 =?utf-8?B?Wm9uQU9xOTZLdmVEZ2dhV3ZMRUNPaVhFaStqMm9TcmdTUDFhdE1OS1d6V0gr?=
 =?utf-8?B?cC80SzZyOHA0cm1TOTk0VlpDQnBqT0doRGo4RzBuY2lkUEpuM1F6UXZCaDdF?=
 =?utf-8?B?ZmsxZjgyb2JIa2JHNHVaQ08zeUhrQ2RoUkF2MWJudFZXbjJ5YzlwR3BKTmRE?=
 =?utf-8?B?dkxzZlhabGlqNnVVVTdnd2lla1ZqZUw0ODVZcFYyMWNsSXk1SU00UUd2UUpL?=
 =?utf-8?B?Tm1JZGY5a0VlbGE0dFJ0eXdJaWRia3J1cDNsc1dnZnVmemxFNkhNMHBMdTBz?=
 =?utf-8?B?dzcwNXMxQ2RXb0FEZ0JKdnVxU3VjakV2WHB1bUNtUEFTOTQwbXkzeG04Rjdy?=
 =?utf-8?B?amVqZnJKZWtNQ0JSV2twMjNXZVI0MVRQU0pGQTJzMUVQeFhLZVhINFYyTXQ2?=
 =?utf-8?B?RlRBYm9pcm5kK0dsY0xEUW9tYW81Nis1NURvWlJPYVBZaFRkWDBWUXhSaWZY?=
 =?utf-8?B?dE5KODE2U1lTYmtYZjJzM0ZmSmk5cFV5YWswZnNyNzJnN2JhZ0xHd2lxeUph?=
 =?utf-8?B?YkJ4TDBRcHhLOExCNVNEcDlrTVVvZGZkQXQ0Zjg0YktUbTVWb3luWTNCa1pG?=
 =?utf-8?B?Snh0aUtkano0aWRuNlNJODExTEI4czdRUTZabSt6R1JVTURjdCt2cnoySDlB?=
 =?utf-8?B?aTRLSERSS2xBOGdkZFZUQXVBbEYxS2tyRWFuMm9UcE5jNEZRbjdJNkZwSHht?=
 =?utf-8?B?SGpTeUV1aitscUxtck9LWUZuWGtSWDA4K1Z4YWl6Yng2UjFMZVFpZlJQOVdm?=
 =?utf-8?Q?TqTroqoGgLBe/luUm4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajd3VFhIVXJWQXdWQzZKV1l2SXZvVTdmb2plcWpXWGVCa1V2VklpSjNUdXlF?=
 =?utf-8?B?SWd2OUJ0UXdHSlp2ZVFRTEtVMnhCTEUvdkI2NUJFd1RHRlFndHpYRDF2bWhC?=
 =?utf-8?B?ZTVVRUhEVzZwZit3K29yTXovZUlOUURTSG1YVGhpc1pPZ0JsVXBreTRtZjll?=
 =?utf-8?B?RUE2OFBONm5NUXlXTEdBRGJqNWZObFc2MlFxT2dLMWdVQlVSaHIvNnJralhQ?=
 =?utf-8?B?MjdXcDRMamZteVBwYThPRENGUnVVUSt4NU8wYWx4N0Q5SEZPNlNpdzVGQW9P?=
 =?utf-8?B?MStGSUxraUNtZjVtMVFzU3pVVW40VFYzTzRsNVFsd0IycWpBT0ZsMmF1TDhl?=
 =?utf-8?B?NGQxVjVSdGJ5elJjMS9mSHhjcGtTV0JXZzE4d3crck91Qkg4S2hMdUxiOGNp?=
 =?utf-8?B?OUpCaFdtakpQLzk0TmpUSkhoVmg2RjF2WnRnN3E4SEgrVStYM1BOYTF5dThI?=
 =?utf-8?B?Y1VCVURSUElhYjNGZWlnbTZNa29aOVlpWDhadlVBd1B4Y3czS1ZtTmF4Njln?=
 =?utf-8?B?Mk8vUFNnQllPblQzMzhwZVVjWDdkQklNbFN3Q0Z2RDhWMTRCNUhGTmFUM3o2?=
 =?utf-8?B?dzYwRTBzZUkvcUROSlVYelVNYjVITHNDVE9mUkxZVjRnSHRvZVlCbDBkWStu?=
 =?utf-8?B?dVdQTkFDMllhTFJaWE1GK3VWRGhhN0FsUjZONXBlb1hWSmhXY2lMWXJsYVVz?=
 =?utf-8?B?U0pxbDRQYjdnK3B5VUhwK25lbkNpOFc0cUxFWjFUb2prck1ROXJGcHJtN2JN?=
 =?utf-8?B?SkVsWUdEMVRFanVUM2tHaFk4blI4Y01Ba2RiWWlwNm5FVFNMVlAyTXdtR1Zt?=
 =?utf-8?B?a1V1cjN4NXdmSFl0cnNUSXBGQkRSWGZwbUdTR3pIVzU0TWl3SkVwTVdBK3Rq?=
 =?utf-8?B?ekxkb3dTU1ZIc2cwYTFKMXcxT01lUEF6K0l2SnZ2SVE4UmhiMDVkTWVUK015?=
 =?utf-8?B?UDBSbnVZZm54ZDFmTnJmWFR4WE5tcHB3WDdzSCtZS3o0ZktlMmFEZGlydndK?=
 =?utf-8?B?bCswdlVqQmFnYkhqei9MN0xQR1Eyc1ZLTzRRbjlPQi9kSFk5Wkd3TjVleUJt?=
 =?utf-8?B?cFl4dnY2NTNpVmV1Q2VBeVNMM3pQNnBNUFprd2o4SkJyeWg1QzVHU25IQWtS?=
 =?utf-8?B?ZmF2YjBTTHRpb1ZJR0pVdnlWQldqMTFqV2VkbkNiMGxUOHZKWkZMa3ZCK3lL?=
 =?utf-8?B?QktRckZQTkRnWUFpNWZpQzYzak5SZzFkdk12M3NpZ0psaGc2bGFTQjVKQTFW?=
 =?utf-8?B?MStLcVRGSk9JMUpRdzl1c09KbVpiM1o1WUJ5UlJud0VOTjlUSHJNK1hyM3Np?=
 =?utf-8?B?Ry9hcGFEWmpGbWc4dnVoMU53UHh5cU9rYm0wRUcvcFJIc0Z4Z01MREZEMDZm?=
 =?utf-8?B?S0dQZksrVDErdVU5V1k5RlZ2c0sxNVkvSW5zZmkzMDVENzc2TmdoT1UxUEJU?=
 =?utf-8?B?VGJleWN2UlpGeW9HbjNOOE9OMTNUdS92bkdYOEhVbW0xVUwwcDhYUThMb1lr?=
 =?utf-8?B?R3BXVlFhRDc4eXF6VzFEMnVxV3kxMk5na3U5RUJJWUdCbVJQVGlha1pObDN2?=
 =?utf-8?B?SkFEZndxMlkybXZ6SDZ3MW82Z0VtSWZIQU9LQWFMVFFsb1V4aUxJalNzN0Jt?=
 =?utf-8?B?eHNBZFhrMXVuQnJVdk5jeEJjSTlnUXJQRFJSVVEwQWUxcHJHY2lobU5Dc24x?=
 =?utf-8?B?enBnaklqbmZwWE5uTkJlU3hMTGhYS0xmaURvZnVSRjBDU2hQNDByWFpaV3pU?=
 =?utf-8?Q?ccb8dJ/tpTjkp5rIcHXxsQ5iIDrunIt7Ayj7Qqo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDBD61553B63984A8E5625E7C1761BD5@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0dfd6d-4aae-4258-5d4b-08dd8d6c94c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 13:39:24.8538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8140

DQo+IA0KPiBUbyB0ZXN0IGl0LCBJIGZpcnN0IHJlbW92ZWQgdGhlIGtlcm5lbCBjb21tYW5kIGxp
bmUgb3B0aW9uIGBwc21vdXNlLnN5bmFwdGljc19pbnRlcnRvdWNoPTFgLg0KPiANCj4gVGhlIGlz
c3VlIHN0aWxsIG9jY3VycyB3aXRoIHRoZSB1bnBhdGNoZWQga2VybmVsIGBsaW51eC1sdHMtNi4x
Mi4yNy0xYCBmcm9tIHRoZSBBcmNoIExpbnV4IHJlcG9zaXRvcmllcyBbMV0uDQo+IA0KPiBBZnRl
ciBidWlsZGluZyBhbmQgaW5zdGFsbGluZyB0aGUgcGFja2FnZSBbMV0gd2l0aCB5b3VyIHBhdGNo
IGFwcGxpZWQsIHRoZSB0b3VjaHBhZCB3b3JrcyByZWxpYWJseSDigJQgZXZlbiB3aXRob3V0IHRo
ZSBgcHNtb3VzZS5zeW5hcHRpY3NfaW50ZXJ0b3VjaD0xYCBvcHRpb24uDQo+PiDigJQ+OOKAlA0K
Pj4gDQo+PiBGcm9tIGFjZTc0N2QzM2YxYjlkMzI5MzA5YzI3Nzg3OWZhOGE2MzI2MDZjOTMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxDQo+PiBGcm9tOiBBZGl0eWEgR2FyZzxnYXJnYWRpdHlhMDhA
bGl2ZS5jb20+DQo+PiBEYXRlOiBTdW4sIDQgTWF5IDIwMjUgMTE6NDY6NDQgKzA1MzANCj4+IFN1
YmplY3Q6IFtQQVRDSF0gVXBkYXRlIHN5bmFwdGljcy5jDQo+PiANCj4+IC0tLQ0KPj4gIGRyaXZl
cnMvaW5wdXQvbW91c2Uvc3luYXB0aWNzLmMgfCAxICsNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3lu
YXB0aWNzLmMgYi9kcml2ZXJzL2lucHV0L21vdXNlL3N5bmFwdGljcy5jDQo+PiBpbmRleCAzMDlj
MzYwYWFiNTU5Ny4uMjRkYjEzY2VhZTNiYTIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2lucHV0
L21vdXNlL3N5bmFwdGljcy5jDQo+PiArKysgYi9kcml2ZXJzL2lucHV0L21vdXNlL3N5bmFwdGlj
cy5jDQo+PiBAQCAtMTk1LDYgKzE5NSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc21i
dXNfcG5wX2lkc1tdID0gew0KPj4gICAiU1lOMzIyMSIsIC8qIEhQIDE1LWF5MDAwICovDQo+PiAg
ICJTWU4zMjNkIiwgLyogSFAgU3BlY3RyZSBYMzYwIDEzLXcwMTNkeCAqLw0KPj4gICAiU1lOMzI1
NyIsIC8qIEhQIEVudnkgMTMtYWQxMDVuZyAqLw0KPj4gKyAiU1lOMTIyMSIsDQo+PiAgIE5VTEwN
Cj4+ICB9Ow0KPj4gICNlbmRpZg0KPj4gDQo+PiAtLS0tLS0tLQ0KPj4gDQo+PiBZb3UgY2FuIGFs
c28gZG93bmxvYWQgdGhlIHBhdGNoIGZyb206aHR0cHM6Ly9naXRodWIuY29tL0FkaXR5YUdhcmc4
L2xpbnV4L2NvbW1pdC9hY2U3NDdkMzNmMWI5ZDMyOTMwOWMyNzc4NzlmYThhNjMyNjA2YzkzLnBh
dGNoDQo+PiANCj4+IA0KPj4gQWxzbywgcGxlYXNlIHNoYXJlIHlvdSBsYXB0b3BzIG1vZGVsIChF
ZzogSFAgRW52eSAxMy1hZDEwNW5nKQ0KPiANCj4gVFVYRURPIEluZmluaXR5Qm9vayBQcm8gMTQg
djUgLyBCYXJlYm9uZSBOMTR4Q1UNCj4gDQo+IA0KPiBUaGlzIGlzIG15IGZpcnN0IHRpbWUgdGVz
dGluZyBhbmQgcmVwb3J0aW5nIGEga2VybmVsIHBhdGNoLCBzbyB0aGUgcHJvY2VzcyBpcyBuZXcg
YW5kIHF1aXRlIGludGVyZXN0aW5nIHRvIG1lLiBMZXQgbWUga25vdyBpZiBJIGNhbiBoZWxwIHdp
dGggZnVydGhlciB0ZXN0aW5nIG9yIHByb3ZpZGUgYWRkaXRpb25hbCBpbmZvcy4NCj4gDQo+PiBB
bmQgaWYgeW91IHdhbnQgdG8gYmUgY3JlZGl0ZWQgZm9yIHlvdXIgcmVwb3J0LCBwbGVhc2Ugc2hh
cmUgeW91ciBmdWxsIGxlZ2FsIG5hbWUgYW5kIGVtYWlsLg0KPiBGZWVsIGZyZWUgdG8gY3JlZGl0
IHRoZSByZXBvcnQgYXMgZm9sbG93czoNCj4gTmFtZTogTWF0dGhpYXMgRWlsZXJ0DQo+IEVtYWls
OiBrZXJuZWwuaGlhc0BlaWxlcnQudGVjaA0KDQpUaGFua3MgZm9yIHRlc3RpbmcsIEnigJlsbCBz
dWJtaXQgdGhlIHBhdGNoIHNvb24uDQoNCg==


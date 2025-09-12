Return-Path: <linux-input+bounces-14629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E58B54288
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 08:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F3E75A1157
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 06:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06068846F;
	Fri, 12 Sep 2025 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.FR header.i=@OUTLOOK.FR header.b="SDa92RyP"
X-Original-To: linux-input@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011035.outbound.protection.outlook.com [52.103.12.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5672D2AD20
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657374; cv=fail; b=i4zja5BHIeUNAvKcMRXzq+dYM/j98bWhYwfoZmTOfVp/+E6hYqvsMFWj106CbDbvyBobmiyw2bf+fYCXl19b25NMyeTc9jieuyfhk93VZ4i+8MHl2SVbnesUDCbdiQ9DR95kxThD57jaSxkDBMe4NnUyWmRClT+5M/2mbD+OvGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657374; c=relaxed/simple;
	bh=dm3/UuR9LrrSTpqxNcBcGn9G8vm9O3sITMKuUpSJOHo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GJwWlgoZmVWhm1EBcbNOmD/nkALeVoMPFU4uhHBiXtSa/5bMXZ4xCAO+Vq2L4xT1fJOVXRryKg0sbbvadjkkMfalOEZJW9AMDCKIgWNklhGPNt94dX4yO4ezAqQMihBZPXne2sO4wdSgWa2+pAzgBgPHvXbJzEpFKcBVeRzCXKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.fr; spf=pass smtp.mailfrom=outlook.fr; dkim=pass (2048-bit key) header.d=OUTLOOK.FR header.i=@OUTLOOK.FR header.b=SDa92RyP; arc=fail smtp.client-ip=52.103.12.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLeJSbVsxiYnClgsIlbttGzghObMQMFNwbwyBA3viM9pwMIqRgp16GFdO003Nw0mj2odYJKVd5fhQ3I2e5pRlPmDFS4tWZK/jsqGWF1H3geELl8Ai0PQ4nqt04BwJiD13aXVxpnk73ETwGpV25RaemjoXjXb3K710d4As/djnPDTQpuuouGxIRwTOeA4Ir7GyMng1Z+86K6z93Zye7uEXqktsHWbNcyyF42EVuxTGgEpEqkZsJD71PJ2liWwujxB5uSc/YyWdtBxO/seT7Tap1u/N6qB8uzfflESYjTtLo+OBoIpqLE7G6jnPG9AMnxqJgS52BWyQLEBQkHv3IP3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm3/UuR9LrrSTpqxNcBcGn9G8vm9O3sITMKuUpSJOHo=;
 b=BYXeLHmVD+AQjgbTiEn5GXqY2337VmnfmoPm2fBo8N3MrfugWvS0+1ZlM3ergIIBS1OurMloeGYlA6xv/EpYqcOic+Au4eTMubHkx4yEwvbmGOrCozAvOkcNtdAF/vasR4tZlPn/9/X9247VgnjHNJlLoifL7Htw/t/9RlgPZhi5fAxz8vpNTLbvIrZItOpNA5mgQH5wM/IwM18YQjUT7nUPlktshQOY3GvBfY2uys0w4uqtFZx8evyPtgCGoRIax8rcf+hrWxmNSRs/8H151QYvCljxNYb3fU89fCZIpJjzPuNIgQwvxVPsMjeSCoA0ZPe4cl+99OKwjQR5lUpK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.FR;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm3/UuR9LrrSTpqxNcBcGn9G8vm9O3sITMKuUpSJOHo=;
 b=SDa92RyPAKpAxY+6W0w7GO/6auC89rFb1a0pzBAghKO9fi8UZ20wFFabncgRpxCu4MM8apK+Ru206h8dx2aq3FL/pwyYWSfIK4stcSdEpnoTGIjbxjh6J9za3o5cLeQy9MWX9V6DPPGdJ37TR2WjyMFySck5GCRUhSdZh/Z9x0PKwRrjzoVeWbm8mT+2ByLjWUimDz8cbnQKsgBPwJshVRoUWhYHH/EGij5+blJeiY0nr1ejuFAQge/AqMc3Y4xEkgPpJ5Zw9pygYyFyfUeNgYNYrz5nZ+Yy2uNf9a/v6mc1fvTeJ6PdZRfVwoCtjlqjD0dT1eSApwt09NDJKfNSTg==
Received: from MN2PR02MB7071.namprd02.prod.outlook.com (2603:10b6:208:200::14)
 by SA3PR02MB11045.namprd02.prod.outlook.com (2603:10b6:806:462::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 06:09:30 +0000
Received: from MN2PR02MB7071.namprd02.prod.outlook.com
 ([fe80::54d3:4da9:7543:87ed]) by MN2PR02MB7071.namprd02.prod.outlook.com
 ([fe80::54d3:4da9:7543:87ed%3]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 06:09:30 +0000
From: Visnupriyan Nagathurai <visnupriyan.nagathurai@outlook.fr>
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject:
 =?Windows-1252?Q?[BUG]_Dell_Premium_14_=96_Cirque_touchpad_0488:108C_not_?=
 =?Windows-1252?Q?working?=
Thread-Topic:
 =?Windows-1252?Q?[BUG]_Dell_Premium_14_=96_Cirque_touchpad_0488:108C_not_?=
 =?Windows-1252?Q?working?=
Thread-Index: AQHcI6vFJ3MDKBiM7UG8cs87EH+y0Q==
Date: Fri, 12 Sep 2025 06:09:30 +0000
Message-ID:
 <MN2PR02MB7071AFCC214BA9D15C88A590F708A@MN2PR02MB7071.namprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB7071:EE_|SA3PR02MB11045:EE_
x-ms-office365-filtering-correlation-id: 8f8b5e30-9c44-4e72-07bb-08ddf1c2eff5
x-ms-exchange-slblob-mailprops:
 HeyTOiyEx6bPi+jhwMr1wenxQ6bSrWi9pgNccYWgazJf5KzoY+tLYaE2BCylm4WNdgZKAhp3eoVq3TWALcZCEQH1bwuGe3XV5saGYl15YzXJioRUzVubqjvdAPX/990OVos9NHrtbYBEaGY0A+7nqxXZdajn5yI7xRvzc9uTA3ZQ2zSP2VkBr2j0oUEa7tPU4xJSWcIssgH1Gr/Otjgk9Mh8kOmTgTqeX8y+rXDvH3jgGf0GYBWlFprtIJmkxI2bAO04i8k7494+6AeFJydFet55eEmLfV0dn9wlP3ByogZovPVmob2AlqaUOrIjNJV4OVbOtz7cIbNLmGeIz1aWJ/NpzTruD5EMq9d5X+ZyjL23WQKfqm5ohFECI8CwchjHWDwRAFYJPM+HiJJweum7XgymyA8lJJbi+JHQcn1GhLLihdnQ2O1xroEnyFyH8aTn8+Y0bg3wTVUE47cE6nBwnZce8SjTtMSoxlM5UC0Ii7zkvUAurV2uUyrOQnXPiWRYm+GNEzlaRWn1VOoTYe6R1mWwnTmJUUba67Qc7+K7S8RqTovjLFPUKtmKRE8lSea30tZOANfSTYQXyMAYTtJsxkrAvCCTE9LQOW+07kMpZLD3tX+eggN/LCcZcYehxjQPNwMumS+sZqOxTfkTRdjbzHKySaxJ7q0CI+qnH2NeAMKmpTzygV6TIkQhyvyfiTy1FguI5RQxh9ElB8Err0JONr6f1RrNQNCFeNz+B9xXyh22gTg3VpqBd1TVNMmuERsyDx14ULuOGMysVDx2HcB4/A==
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|19110799012|461199028|31061999003|15030799006|15080799012|3412199025|440099028|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?fy/RsTWhu0LulSxPIgeVEdlLVghQmSL0n3aYABA++Txn5ak9YknSRApH?=
 =?Windows-1252?Q?FPT8JHEhH3OiTKqOt3kOjzGbCVdOcTmOqUjdjHdMuR/cvq5vrkkPBwOt?=
 =?Windows-1252?Q?WEn15GV+UT//XbGJkffJZEZ3HL935VGQGFITcNf/tVVgFsGA2S0t5VyL?=
 =?Windows-1252?Q?8en3kMPF2upgkEceFDrdWzqlziJLaGfC3SfTG44CmxZdtV+pVDesTZWy?=
 =?Windows-1252?Q?Fh22jqjEcYhukDlFrB+2bvpOui4+shBD3TX5nIL7adZDGM8Z8qxdKcew?=
 =?Windows-1252?Q?/0bG8aeba9xMnuARiCNROVFNs1QGHw3frTZzu89ZjdnTDeYHz5outSRg?=
 =?Windows-1252?Q?xPcIAClJ2yXtjEcjyQwVzpmO52VmPBlXlNPn6UziXybbdVVIbheBFAk3?=
 =?Windows-1252?Q?ccnaT69sSQ8YlEsfYdAxPJBEEBxIAo7Qviom5fgfRsXUDyDHT8Z6lBe0?=
 =?Windows-1252?Q?Sj8L80FS8mWibAAH6Ihpn37D9gforHqa1Dr/8A0i/3sOBqgEwFbWP6Ca?=
 =?Windows-1252?Q?t/Pln8dZcNwz0OlmXvsmgCGCTExPtZTcvuVOZY0kDIePPj5CkBKoN6ia?=
 =?Windows-1252?Q?ztXqS5fiGxfCQbQtmCTq7qssTf3sSEMN8SEiatQAzMbcV9c+S+Sq2dR5?=
 =?Windows-1252?Q?wo4JgNUzk3bY6FesMP2pBCTdeynKBybrygfUhK3ia5sIKco4UMUjnR1J?=
 =?Windows-1252?Q?AsJVpGlOOC1gdhHDCR0OEcPUi0luaAi2ideuIJFjCHeGBPuYrrqygalv?=
 =?Windows-1252?Q?+XWsX2P8JlZbdZOjukUsqapW6CnSapYJ7Q4Y0juDs7z5jMs9voUfckzW?=
 =?Windows-1252?Q?J0kFjK6LwKFOXKY7IKMuASInfzGmk5tK+FpzXc37gRI5oW9YvBOJNllE?=
 =?Windows-1252?Q?/ZCwtRklxEJy9EHbj3MzcNGiytYhePxAQJ8OE4zXndpaelMYFwh6Bm9M?=
 =?Windows-1252?Q?PAdX96qH7xyJk39cYp1gTcWyyRchiTRdGcKieODI4S4vIb4+7ZiyKLAo?=
 =?Windows-1252?Q?mC+m7WiNB1fiZL/f82yLuejUq+enBXkz93NIrjcv9vvHfGfavqez/AsY?=
 =?Windows-1252?Q?PVjTLAH8JxHwhcSSYQammcCuFjZd4dxyAsHMg6+NzE0CB8aG2YKJpKK+?=
 =?Windows-1252?Q?qq6j/ntLZE3b2Lw7c7RYEhhDcbL7LDfdYDZjYGpMLyuxJ9TBJxTuBV4h?=
 =?Windows-1252?Q?adbPiw6CPeSpR8ctm8yIQlHXg2Lu9RCbI25buMFu+d38pr69jJBcnw51?=
 =?Windows-1252?Q?PAnp0S2cDo9iG39EU4k=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?bkbiFp1N5LklCMxd8csug4I0725xQR7hcBoyFfc1fYuodef1SZbTD53x?=
 =?Windows-1252?Q?KVoIGIpDhDGHDQXXpIFL+uKFdDRAr667EMCPdvS6mwk5Vcft8HWKOypO?=
 =?Windows-1252?Q?ICVVs0nvgG+jrXbQW1Rra26uQiW9RwJAjZ97AHuEthLgdJ76tHDQPPK0?=
 =?Windows-1252?Q?xRbQylWTjjU5WBspVjd+GWVdZiTIv1LUHOb50Y9bJBOrpYRPIPX/NIJF?=
 =?Windows-1252?Q?lzE3JGlLBGRWqMFqFhIrc8Q6wFkblBmAdtCFiuY6uCrXAyaBDkDfaosC?=
 =?Windows-1252?Q?OLPGT+rMhOJApHrxSG0P8FaxJALwwZ5lL4HTFmDgHgd5EpJ8f6hq7hbO?=
 =?Windows-1252?Q?oqsRqemBdctCX++z5gHBrQ5Ybh46HiaIzF3QaAW6lY7YCSBCyiaxuT/I?=
 =?Windows-1252?Q?g8JsDIfXjYbD9ZP8wQyzT0gorbppvC+kdmDiB8vI3SXtK/t4Ty/+eYq5?=
 =?Windows-1252?Q?KuLg02hH0YYI3Ebdp2kjm/aHkZJ7/Y3lgpDAYroV8WO3SmlgFCcOjzxc?=
 =?Windows-1252?Q?pXvn9losnqqsYPzL4hadgN2KGcfmyVYDj/bCurep/kCMiF93OHutvshg?=
 =?Windows-1252?Q?UHkyQJtvjXEvD3Nmdkay69HoTaYnJsObc8kOkw0lhI0uolJD4Lj9gPYs?=
 =?Windows-1252?Q?hMgjf4B+ybGzK/JnyV/IMMSJasF4uVHoxbmIOIuTlbdjc27SoVFhC+dv?=
 =?Windows-1252?Q?ZzMscxZ0MOM4+k+8COPs7iBWa1xdYRih3Vf7XJdq3fokqWad+dyuR7Br?=
 =?Windows-1252?Q?ubfDmytlzbRmplHn9mAlCBW+d637bdx23alUb59z9qz5socYm59JqPxE?=
 =?Windows-1252?Q?Lxkd6dr5lrSwd2Z6XnRetXFs46MSRNJMJeJp7Md4Sc+y+ktODxLvizm3?=
 =?Windows-1252?Q?I+gFr49XCaAQr0RPww9jrmtWTD45iwMrIfHhkTeKiTJl9wGvifRDuEO4?=
 =?Windows-1252?Q?j4uRuR9hxVXwrBcBlpxU8158hE+T++3UpkGvI1jdEqu+z1e1GPUqkDSb?=
 =?Windows-1252?Q?uniszue71XV7mfdrx8R4MKAjx4F1ZtGm+0e2kpHRoc1cz809m4caQEqS?=
 =?Windows-1252?Q?XRVKDcz2V63qWjsspQ3MvbZA0MK8DqCWrq+zAUsNRYAnKJiLWHANl5qS?=
 =?Windows-1252?Q?v5TwTl8Qwmp3CytNQSYzNQCbQvMo2939iELHVuGNpN2OL3QD4k827IFs?=
 =?Windows-1252?Q?N3GS40FAJGocUoR2RMNS0IL7tItYPEjM83p4iBtH2k/jfekCgOsdxqRZ?=
 =?Windows-1252?Q?nSZPTDJo1Y7JNJcOj+AHF/6HlNPvOhjwruRINPFJbK0ErKZFXMtKLFAP?=
 =?Windows-1252?Q?JFz6aDPDIM8KBCdYkakyGZKN3DcutP/e/E23cvrMD6CYGtrH?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-f6305.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7071.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8b5e30-9c44-4e72-07bb-08ddf1c2eff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 06:09:30.7781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB11045

Hello,=0A=
=0A=
On a Dell Premium 14 ( Model: DA14250 ) laptop the Cirque I=B2C touchpad do=
es not work under Linux.=0A=
ACPI ID: VEN_0488:00, HID: 0488:108C=0A=
=0A=
Kernel tested: 6.14 (Ubuntu 24.04)=0A=
=0A=
The device is detected (evtest shows multitouch events), but the mouse poin=
ter never moves in Xorg/Wayland.=0A=
=0A=
Please add support for this touchpad in hid-multitouch.=0A=
=0A=
Thanks.=


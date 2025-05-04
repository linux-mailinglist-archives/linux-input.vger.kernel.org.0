Return-Path: <linux-input+bounces-12138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF85AA845B
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 08:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4782A3A5E9F
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 06:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C28450F2;
	Sun,  4 May 2025 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="j/E/Mnl7"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010006.outbound.protection.outlook.com [52.103.68.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403E4A29
	for <linux-input@vger.kernel.org>; Sun,  4 May 2025 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746340874; cv=fail; b=tYw5yIUazVR/oWn+PIDqUCKlQcfT5vNbY1LqRFJq2UL8B6wFe2ZAv0ggDPP2CrX+C6IcT1FlAGeq1hPGjv2/DJh4+eMCi2OesW1yKRe1LJbVNYhNSA310z9Lo+1GuAXsu134tgVRMd8z+BQbNyK2tPeHBBQLIrrttyYBHjq4HCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746340874; c=relaxed/simple;
	bh=Ncgbw0bD+G9toh8kna/6/Lm6++QjowtKaSuis4GBXN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HxyihYud5HXXe5fcp3GQMrxfs3M3kag0U7TIeCvfNzD6X4obT2LCS9HiiqDJ7qxUR1X7oIbwzyE+/2LsuoYHD6AeSVSfFIhBmq1iiTNydNGGjImr5jinLAYGvMpgjAtLvqXVhn3HR+UIcAPaPF+sIn1bzXO0qXAJeU+k99mu63g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=j/E/Mnl7; arc=fail smtp.client-ip=52.103.68.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5qaB8y51OPHPWLBdbD9q64wANAuZDDuMCLmv/W3BP6peTSGeE5fJWmhEGHlwyTSuDZAuGoqlupEyS9al5hSqVhk5t6t2+9Zm1zrhFbpvPKjsCpG3vtN1Wm5exUubc+5AQPPVxV8WNmFDJgUvu+TvflONy/RVQhSdqNhRDar2Du1DDT1ni7ru7lDJBYTSR5w0BsmbsB5TzpmZCZznIZww+R0P90k7KMzs2rCIKcLZ6zt0p+ipJHhgH/ox3DcucBuYJlIztBWA2MaqzxPzf4GC+fwRvGjmb8Dv0P6zCdbgf30Dj17uMs0kI2l0kcJHVNq6bRgaEZUKH3IpW8YFM8sGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncgbw0bD+G9toh8kna/6/Lm6++QjowtKaSuis4GBXN8=;
 b=BadQqF+krHAIuGToBwXaBRwNYsGGWOfx+b6waIxv3HtZ2EvJ8Q1ueIUwvE1oZYMP9gkc/eMRGdl2vaCm9KRg4e3CLAVLCSBl4Cx/MpOc0pl/0i3a6R2ABLZQxl8T4Wdxr1e0QSsOkDObEzVXEAqTEv/t2ILS4vD4xKAwZFfiQadP4cdpQEp8tnvGtdK/npG61fUWFRrVf0Ryf7RRP3GYawYDRPHVkADQUKrJLSBGFusqBk3+trOHQlwq/zDQyalDMjd5EjWEK5IBr0k7mKII4mcHSGvS4YaxAIlyLQ+PWRze4dfFUa1/uJxucTN34ipUvbsE9QXODgr+Ohn06oYouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncgbw0bD+G9toh8kna/6/Lm6++QjowtKaSuis4GBXN8=;
 b=j/E/Mnl7tw+UuhUU3gxtCH+NXJctbXKUH6wEH+BkRmfre1U+/h+Cv3y9OwVB6M/jkSrQZtIVwy6tWGYeI3tikzVWwfrW/ShVE3uATVHFkCiyFqJOn1KvcLPOk4bQZFoNhCX5/5nmyoASpwNv8X4Ilgyop/etEFeozuIEH5UES7EoHK4KJ1dIi3AytQ2fS0mB1TikfWEVuT4jEkj2hPfrp5eeW3Wuwwvz9tPbTMxz1nBXnG8r7a+1OS+zZfw9AZiM/p7aGPQdy6jLk6YlKqILakPi9ksIpGRl9Ir6l50lIBxiS4lAd5drh9rWzLVJfSRmJjj3cYmUEuk3LjNjNfh4/w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5693.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:61::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 4 May
 2025 06:41:08 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.019; Sun, 4 May 2025
 06:41:08 +0000
From: Aditya Garg <gargaditya08@live.com>
To: chitaotao <chotaotao1qaz2wsx@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: PROBLEM: Touchpad (PNP: TOS01f6 PNP0f13) not working under PS/2,
 requires psmouse.synaptics_intertouch=1 to function via SMBus
Thread-Topic: PROBLEM: Touchpad (PNP: TOS01f6 PNP0f13) not working under PS/2,
 requires psmouse.synaptics_intertouch=1 to function via SMBus
Thread-Index: AQHbvL9lF8ITvg3hskarcKoTWDAFpQ==
Date: Sun, 4 May 2025 06:41:08 +0000
Message-ID: <E9401F00-594A-4A5A-98E1-4B450A322473@live.com>
References: <c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com>
In-Reply-To: <c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB5693:EE_
x-ms-office365-filtering-correlation-id: 4ac4508b-7e2c-4506-bb5e-08dd8ad6a713
x-ms-exchange-slblob-mailprops:
 laRBL560oLR0Ybdxcp7KTbjbpYD2CblC153NNhx9eoYxwRS3Xkaj0xOybeivbeUYEqnlZjFKnVpTRvMTGrCv4BQP7THEZ2MK4Q+IOL/E5+IbUSzWGzRQTYJCTpjBFcO0oVYSWNekJgaK3W4A9SNJ1vAOWowRLZ2uP5+GYmelasaOxclZEDUWMD24FTzRkV5XHAcOu4grj9ji9drg/TfiExfvhrvnwEpLet7VKCRPwKATO895zt2aOisvnq916JH+B9sWUZpSvgqVgXBfFl8ycwQ6puGDAw8IJtfrXlMrXjPjqcavYBuW6W74aIysI/Zz2AtttZIeoLjz95QAFo7Rap2je9ksaqXMAxUefhZ/HqYWIIM/3eWSEeC8R8/nrYJppdzpvwkvb0nkEbZZLFec9PGHrXrygIZVCPPJ78VE35mekm8TqFumWkgJo9ZSXhe0L/J6WWiRHk3Jfs7LPmy15VzJD2VmxKfEByLqm/SW6BrsIgGkugzVHiHkH8A9nH79MAtIiUg6Pu9fqhNjxw2W+vn29qAYHfNXWlGitfpgfDKYu5aYtHlCCimSLRQSetDHyLm4cgawhFYrc3ewDVClruhfqZ5hcGkr8JZ+nYY5xF6OnTvgMe7XqjxByWF9f+bB45ifzeCa0yuv9bHlEWujdHuuCw9+E0MgYA7brOT33mYK3T736XRFn98s8fgr6xR2GD5JZKje8yoNc+ET8hd0S5Ba+Bks1t+nrZiyHpaJjFdi4tpybOKAi26WbL2RiP7tMA1Ya9Uqo6FkX2dKXQCKGMSwVNh9/Qi5
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799006|7092599003|8060799006|8062599003|19110799003|10035399004|102099032|3412199025|440099028|34005399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?anlWZDF2K3hOdkd0TlpnRWFIRUF6WmpHQW9IenJoaVZ1eTBqZWFwaDByZ1d1?=
 =?utf-8?B?bEZoM0VhVXZYakZ4ZFNDWGxlR1lyWEQrbVVFS2cwTTB2aDhobXNVWHRGQUJL?=
 =?utf-8?B?ekM4NHdiQWthemFUUlJXOVBva1NWeUNIYUVBVWpwMjJBS2JNVEdlNzRaNXZa?=
 =?utf-8?B?Q3dzamdKZzd0Z1lNM3R0bWJabk1PRk9hbjM1Y2Q3UlZhUUF4QUUxRUcrUThk?=
 =?utf-8?B?V0RsSGkySEJzNVd6aERxWXVvc2grT0E2ZnA5UXBDWTQ2clpiVlFWdk83VFBC?=
 =?utf-8?B?VXhqMWdFWTV6RCtNSDhIVk1jSDNyM09oT1hocnhlaHh6ZUtUNDZyUjZiTnJu?=
 =?utf-8?B?VDJPNmViSWh0Mmh6OFVNa3ZVWlB2dEc2bG5EMDFLWEhxYTY4blgrU0k0c2lp?=
 =?utf-8?B?UVc1WUhMUGw5MjZuNGNNbUJnQVF3TFFKZlVlL1kzdWFhelVNTVlkYXBLZUpN?=
 =?utf-8?B?Y3NrZlBxamNDNUxZVWQxK2xWNHMxd1JzV2RKbWNoWXRmeHJmM0V4VGZvSjRv?=
 =?utf-8?B?alE4bG9IT2w2M2tjVkVWbUZvSS92OUpzNGlKQ0hPZ3djL01Bc2ZHQnBpNWNF?=
 =?utf-8?B?K0FSS3I4d05admFNOWE4bng4M3RpZkRKRWhabjVYbWZUVzZESkhiVk4vbnpv?=
 =?utf-8?B?ZlZuNXJhY0oyQ1l5czFjT2VwU3pJRjZxMGFkN0xqTDBGL3dLUHdKaUNrNy9q?=
 =?utf-8?B?Y0N0TWJzb0JWRlZMMlN6czlVK2F1K1NEMzFaU1VqVjB3OEJHeTZNbnhvbmlV?=
 =?utf-8?B?SDRzajllZzNkUE1hNXc2ODBZNEcrd3Vva01jWkNzbmxyS0U0TG5FaW5CbTRS?=
 =?utf-8?B?cGlDK2RMNDdGaUVaRUo2QktHSFhrM1lQelFGSDlJQ3BpZGJKcTd2NEZrNnVm?=
 =?utf-8?B?Z0lDMXNWdmZsNUdxQ2JTci9TRERZVzdaeEd0OHNGTnJMQldPUlpQUDRrc1ZO?=
 =?utf-8?B?UFZCd0luUDRxbUFaaGJuaXI3NWxkZUpIZjBNMUZtcXRaZVFSeHVnTjZmeDJn?=
 =?utf-8?B?K3IwWTFNV1hIRiszeHlNTGs0amlMcUVFK2laejlHbEF6MW5IQmhhZG5sVzVT?=
 =?utf-8?B?WlFNL25LV0w1TzZmUDBwMWtkQnR0c3ByS0txUlBEckR3cW5PWkxLdzkrUjVq?=
 =?utf-8?B?T0loTm8xZ2dVcXVOU0lCR0hyeXJHUGc2REFYR1NGRTE5MzZQVlBaOGdXcWpt?=
 =?utf-8?B?VzRTcG14VzE1WXZTcnp1UEtCbEQrajN0OVBDNkRLa0JjZ1NEbUFJdWk2eFJs?=
 =?utf-8?B?akl6Wlp1SDExblNvMFpoRFZrRXNDM05YUXc1NW8vUWlpUTRNNFE3TUJKaEdT?=
 =?utf-8?B?Q1VGTkFDRUh4c3h5akVOZkZaYzhEdVVnY3hEWW8yMkJkeS9MVW5sSlU0SkNQ?=
 =?utf-8?B?aHp6V0JKaWw1WG1KZkN3aTBORGRjL0tlWkxlWTl1Tm9LQzd1RkhUS3pKWUd5?=
 =?utf-8?B?bVBKUVcxUENScEFXblZBQ1MyTXp0Y3k1VWcvdENJTGZ3djkxZ0RBajF4WXpI?=
 =?utf-8?B?WG9OSjIyV0lrVVAyTC9hb0FoL3NsQjFKVm1iV1pmWENid3lIWW9BMmprLzM0?=
 =?utf-8?Q?3iwUwdLJTfaMxk42pD3z2MJ7avcAcrzBrAG+Y3qQ2aeTA/?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHF4VnlRajR5NEdNcy8yQStsS0NWZzFhSmUvc0NseDdpTFFOOFN5dFBjdkxD?=
 =?utf-8?B?T1VPc0V2b1FHZHFNWUVGdFg3Zi9RdkhtZnE4K01uNzIzZXFlRXd4VUFoS1R5?=
 =?utf-8?B?WSs3dWMwZUFhSUxQQlZMelh3RzJKL1d5RC94NmVhL25uY29SS295RlVRa29r?=
 =?utf-8?B?NTU4NDhnSVhhczdOVC9QakFTQUNTYUFiTTc4YUdqUUFPU0w4WXRDMEY2dFAy?=
 =?utf-8?B?RFVzYTdVUk02OE5OZXI4S25CT1VseTRCVUJMc3hOOTY0Mzl5V1hjNnhxeEJ6?=
 =?utf-8?B?eTVwUXJKUk9hMlRlaFk2RGM2WkhmTzYveWU0dHBQT0lzNnV5eDR3OElwekM1?=
 =?utf-8?B?ME9iWGYwQWlKd2dabTlCcFByY3dnUldGVVdJMlBOeU9WMWQ4bWlRcjJIeDlo?=
 =?utf-8?B?cDJXTkVYSjVCc0VPRjRBU2dkMlhXSzJVbnF5OXV5dVlHUUMvdXllVEJoN1JP?=
 =?utf-8?B?SmtKV1hZZmJhdmFucGQyQWQ4RlBmem93Y3ZCb1UxM3B5M1dxQTh2emJnZ3hH?=
 =?utf-8?B?ZllYK1dEUmZpVy9nendBaHBlY1J1VXZGS01YTWRReTMrV3YyMk1SRCtNTy9S?=
 =?utf-8?B?WTlHc3VxdzhQQjZaYlg0b1F3Q2RINmVZaXQ5S1ZXeWFFVnF2MElhU2FWYml6?=
 =?utf-8?B?MWUxdjFnc0dWakRlRWkyTmJoQjdyS0R4UFpoYW5hNDlGZTFLemxMbE5zdEhR?=
 =?utf-8?B?NEJ6aGpiM3BrbVVaVXJVSk1yQUhra0xxVml5RlM4WFRXb3Voejg1bVpETDNz?=
 =?utf-8?B?R0ppc2tPYitUT0J3VGpnWktlODZydFRrNk81ckZUYVVqSWsxYU5xc2Jacyt1?=
 =?utf-8?B?WVJVRHlyQzBEUnBnVkQ5OE5VSjFsN2hGYnZMUE1sZFlEVEpza2k0N01aM0pK?=
 =?utf-8?B?Sjc1b1l3bld2OTZYczd4Uy91eFpPTUVhaHpjcW05VkdMWk5FNXBOSTJmcjFh?=
 =?utf-8?B?VjJTNnJTalVlZDV5eExHeFlmcXJSb25HaEVZdjBuYklEbTd6dmRFZUpVZWVE?=
 =?utf-8?B?dGRSSG51aHZOdmpHNlRsU0VuaE5GMUxERFBrNENYSW1oc2thZjQ0b3dhYnpT?=
 =?utf-8?B?WlRZYnE3MVRSaGJaamgrVXd5RzRZQWUrdWRXRlZVM2haUk80YTJFQmtqZitQ?=
 =?utf-8?B?b3d0czRFbjFOcTk0dG1MaWFXU0dEZ3MrUE1TYnYwazBRa2ROQzIyMFpjZkNu?=
 =?utf-8?B?TUZQSTRKNG9nV0V5U0lsakFwZ3EvWS9jUzl3ZndzUHdKYTVvbjJrZ2JyWitO?=
 =?utf-8?B?TkYyaG4zWTlPWG9sbExCVnpabWZXcTl4a3N5Skk4Q0NnL1V5WGR3dTR2NmpH?=
 =?utf-8?B?NEhtMjRkNXd1V0IyY0s2cVlQRjIzOFVrREowcWpEVkRMdzFZY3c2SVE3V3da?=
 =?utf-8?B?MytYSnhFemJvVWw1bEhhbyszY2plcU5ydGdOc05MTmQ2MDZqTDlRZ21NSEc0?=
 =?utf-8?B?d1FIVUJOVmU1U09ibmNqTDY3c1dPaVhQVjRzYVVzNUMwWTFMUk0rVUZ1U0dD?=
 =?utf-8?B?NitMdFFzTEg2S2tQNjdoR1c4NkVTMVJGd3FwTVdQWUVtNVk4SmJzbkxCNXhY?=
 =?utf-8?B?RGFBcVVpZy9PMWhURmpGcVZDdGFybWxiZ2ZOZWJsT2puUkt3SDYyLzdSUGRV?=
 =?utf-8?B?VFZWbVR0eFVORE5tQUY5dUNPS2E0MzY1MDV4OXN1ZU84d29jL1BIK1F5RTNl?=
 =?utf-8?B?dW11T2NVb3FBTDByd0QvbGZGOTJJbFFFRU9EVFhLekJCNDN6N2lsK3ppME1U?=
 =?utf-8?Q?xb2sVsfiGdlxsGKKRX22rraiHM3RkH77eN1Bg92?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50B439C28F88F545B33AA45E95F712E8@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac4508b-7e2c-4506-bb5e-08dd8ad6a713
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 06:41:08.7146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5693

SGkNCg0KPiBPbiAyNCBNYXIgMjAyNSwgYXQgMTA6MTHigK9BTSwgY2hpdGFvdGFvIDxjaG90YW90
YW8xcWF6MndzeEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gWzEuXSBPbmUgbGluZSBzdW1tYXJ5
Og0KPiANCj4gVG91Y2hwYWQgbWFsZnVuY3Rpb25zIHVuZGVyIFBTLzI7IHJlcXVpcmVzIHBzbW91
c2Uuc3luYXB0aWNzX2ludGVydG91Y2g9MSB0byBzd2l0Y2ggdG8gU01CdXMuDQo+IA0KPiBbMi5d
IEZ1bGwgZGVzY3JpcHRpb246DQo+IA0KPiBLZXJuZWwgbG9nIHdhcm5zOiAiWW91ciB0b3VjaHBh
ZCAoUE5QOiBUT1MwMWY2IFBOUDBmMTMpIHNheXMgaXQgY2FuIHN1cHBvcnQgYSBkaWZmZXJlbnQg
YnVzLiBJZiBpMmMtaGlkIGFuZCBoaWQtcm1pIGFyZSBub3QgdXNlZCwgeW91IG1pZ2h0IHdhbnQg
dG8gdHJ5IHNldHRpbmcgcHNtb3VzZS5zeW5hcHRpY3NfaW50ZXJ0b3VjaCB0byAxLi4uIi4NCj4g
S2VybmVsIGxvZyBjb250YWlucyBhIGxvdCBvZiAibG9zdCBzeW5jIGF0IGJ5dGUgeCIgYW5kICJp
c3N1aW5nIHJlY29ubmVjdCByZXF1ZXN0Ig0KPiBUb3VjaHBhZCBpcyB1bnJlc3BvbnNpdmUgYW5k
IG9ubHkgcmVjb2duaXppbmcgaW5wdXQgaW50ZXJtaXR0ZW50bHkgdW5kZXIgUFMvMi4gU2V0dGlu
ZyBwc21vdXNlLnN5bmFwdGljc19pbnRlcnRvdWNoPTEgcmVzb2x2ZXMgdGhlIGlzc3VlLg0KPiBU
b3VjaHBhZCBpcyBmcm9tIGxhcHRvcCBkeW5hYm9vayBHODMvRlIuIERtZXNnIGxvZyBhdCB0aGUg
ZW5kLg0KPiANCj4gDQo+IFszLl0gS2V5d29yZHM6DQo+IA0KPiBwc21vdXNlLCBoaWQtcm1pLCBp
MmMtaGlkLCB0b3VjaHBhZCwgU01CdXMsIHN5bmFwdGljc19pbnRlcnRvdWNoDQo+IA0KPiBbNC5d
IEtlcm5lbCB2ZXJzaW9uOg0KPiANCj4gTGludXggdmVyc2lvbiA2LjE0LjAtMDYxNDAwcmM3LWdl
bmVyaWMgKGtlcm5lbEBrYXRobGVlbikgKHg4Nl82NC1saW51eC1nbnUtZ2NjLTE0IChVYnVudHUg
MTQuMi4wLTR1YnVudHUyKSAxNC4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzIGZvciBVYnVudHUp
IDIuNDMuMSkgIzIwMjUwMzE3MDA0MCBTTVAgUFJFRU1QVF9EWU5BTUlDIE1vbiBNYXIgMTcgMDE6
MTE6MTMgVVRDIDIwMjUNCj4gDQo+IFs2Ll0gUmVwcm9kdWN0aW9uOg0KPiANCj4gQm9vdCB3aXRo
b3V0IHBzbW91c2Uuc3luYXB0aWNzX2ludGVydG91Y2g9MS4NCj4gT2JzZXJ2ZSB0b3VjaHBhZCBp
c3N1ZXMuDQo+IENoZWNrIGRtZXNnIGZvciB0aGUgYnVzIHdhcm5pbmcuDQo+IA0KPiBbNy5dIEVu
dmlyb25tZW50Og0KPiANCj4gWzcuMV0gU29mdHdhcmU6DQo+IA0KPiBJZiBzb21lIGZpZWxkcyBh
cmUgZW1wdHkgb3IgbG9vayB1bnVzdWFsIHlvdSBtYXkgaGF2ZSBhbiBvbGQgdmVyc2lvbi4NCj4g
Q29tcGFyZSB0byB0aGUgY3VycmVudCBtaW5pbWFsIHJlcXVpcmVtZW50cyBpbiBEb2N1bWVudGF0
aW9uL0NoYW5nZXMuDQo+IA0KPiBMaW51eCBDSEktVS1XSSA2LjE0LjAtMDYxNDAwcmM3LWdlbmVy
aWMgIzIwMjUwMzE3MDA0MCBTTVAgUFJFRU1QVF9EWU5BTUlDIE1vbiBNYXIgMTcgMDE6MTE6MTMg
VVRDIDIwMjUgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4DQo+IA0KDQpGb3IgeW91ciBk
ZXZpY2UsIGNhbiB5b3UgcGxlYXNlIHRlc3QgdGhpcyBwYXRjaCBhbmQgc2VlIGlmIGl0IHdvcmtz
Pw0KDQotLS0tLT44LS0tLQ0KDQpGcm9tIGU3OWYyODA2YzY2NjE1MjI2YmE4ZGQ1NTIyN2I0NTYx
ODY1MzBiOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpGcm9tOiBBZGl0eWEgR2FyZyA8Z2Fy
Z2FkaXR5YTA4QGxpdmUuY29tPg0KRGF0ZTogU3VuLCA0IE1heSAyMDI1IDExOjQ4OjU0ICswNTMw
DQpTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSBzeW5hcHRpY3MuYw0KDQotLS0NCiBkcml2ZXJzL2lu
cHV0L21vdXNlL3N5bmFwdGljcy5jIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L21vdXNlL3N5bmFwdGljcy5jIGIvZHJp
dmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYw0KaW5kZXggMzA5YzM2MGFhYjU1OTcuLjAwOGE1
NjJhYWQ3Y2Q4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYw0K
KysrIGIvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYw0KQEAgLTE5NSw2ICsxOTUsNyBA
QCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNtYnVzX3BucF9pZHNbXSA9IHsNCiAJIlNZTjMy
MjEiLCAvKiBIUCAxNS1heTAwMCAqLw0KIAkiU1lOMzIzZCIsIC8qIEhQIFNwZWN0cmUgWDM2MCAx
My13MDEzZHggKi8NCiAJIlNZTjMyNTciLCAvKiBIUCBFbnZ5IDEzLWFkMTA1bmcgKi8NCisJIlRP
UzAxZjYiLA0KIAlOVUxMDQogfTsNCiAjZW5kaWYNCg0KLS0tLS0tLS0tLS0tLQ0KDQpZb3UgY2Fu
IGFsc28gZG93bmxvYWQgdGhlIHBhdGNoIGZyb206IGh0dHBzOi8vZ2l0aHViLmNvbS9BZGl0eWFH
YXJnOC9saW51eC9jb21taXQvZTc5ZjI4MDZjNjY2MTUyMjZiYThkZDU1MjI3YjQ1NjE4NjUzMGI4
Yi5wYXRjaA0KDQpBbHNvLCBwbGVhc2Ugc2hhcmUgeW91ciBsYXB0b3DigJlzIG1vZGVsIChFZzog
SFAgRW52eSAxMy1hZDEwNW5nKQ0KDQpJZiB5b3Ugd2FudCB0byBiZSBjcmVkaXRlZCBmb3IgeW91
ciByZXBvcnQgd2hlbiBJIHN1Ym1pdCBhIGZpeCwgcGxlYXNlIHNoYXJlIHlvdXIgZnVsbCBsZWdh
bCBuYW1lIGFuZCBlbWFpbCBhcyB3ZWxsLg0KDQpUaGFua3MNCkFkaXR5YQ==


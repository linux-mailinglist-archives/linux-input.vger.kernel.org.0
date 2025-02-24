Return-Path: <linux-input+bounces-10267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4092EA414F1
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87D1E188A922
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB3015ADB4;
	Mon, 24 Feb 2025 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="mDJxO8iq"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010006.outbound.protection.outlook.com [52.103.68.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863571448E3
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740376474; cv=fail; b=GNZl6nrIT4yyXZMtXN+Q3UL5Z2ylgUViIlEu/3blhJKfnRAPaFWdL7/Zj66XPlo+sgXc0yTMmWkuKEflfnFv8hFztf1Wx+vZUke5FRs0AOyF3ibSunAyHkNwcYIkzNbC7PQ/ktaGGmG9Jr5vftHCga8pLgisXpMOwMZMJhKHSRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740376474; c=relaxed/simple;
	bh=3HOb31yhkeF0yDr1buIchBLRJMaVbePcEl1J+wPqx2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EqQZZD/vDlfbWhScj/Pn8irfHL0M/VF/E2ch0aMN7BneK39w5EOG5LLsHm9JnY9aq0wWZkR0/y/ZdK/C+dWVWH1PkkrWEHQK3nZecJJcac4AbroousuUWgLkfeo8Akk0PI0yxGBhIGL60VoWYNhrcZBJ5lCj/P+MlAwkpzZ2v28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=mDJxO8iq; arc=fail smtp.client-ip=52.103.68.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsk+xsRc93VP+o1Y85C8Y4d8Hoft2OA+g76ueg/OjN1ZpBvdSwoGXVQB2aKCPy0NZK6BRo5f9uUvBqjy+s51WtAgp01mJEb7ttTw8VPhVmxHH7xn/XC7m5XVJI+yyy9EWy0WCMAl7rqCHDvFdve9zvUFmR/ThCT+pxPcf20QscEH4ipVT/mo6F7oPWVdix5kjiIIuXBV0lGHMRD01XPnIls0hiXrsyOaYayY5m1mZp/TXsSmaIlo4AUqcJ3uBII56XIZurjalcC1qxzMtP5GS330qEOF9Ce4MOCuqxOBXIV4Pl0FoPIvg02fhs3/4bnOvlUv4+ahEWVovmRuA9wzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HOb31yhkeF0yDr1buIchBLRJMaVbePcEl1J+wPqx2M=;
 b=CzBEC9y8LQb/m5hw2aq53cFBDQ0mG9fyqRpphIpwquU7Z6KhnTo0kUvmvjSJdWyI8xlbz17YLsteiHFAUlOIWb3i+mgcl+A+/2qQymnUMAqK0DIslGMOBNArV3L10bfd/e12gOOtsxbPnqOuSllYNTuXNEKrEnfM689M5hHF2vqWXcdCoKUR0DDF8b9cCiVeU8yUn5TPhZ3TyZSbp0x1hIgBOwvH3UVi4CEL1E6NoS4kt14RD+OOO4lEcW+ydTqQ5g6VPRLCeG2dzNO2tw3GhWMs2m7qK/dR/nDGzgM9bQu6i3k5ze4Z02WmroFOI/N7V1yDYTOqgsRgFKyp6u3jCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HOb31yhkeF0yDr1buIchBLRJMaVbePcEl1J+wPqx2M=;
 b=mDJxO8iqQxpO3P/ZwzkfDwKYx4K6AueAwUXnsle1aErxjWZav4Hs3g2IKEwfgCIErMwp8f2FZ6IyoCK535j78Sx/STatTTvU3ApSxTOqVrXUWz2i7EXhSVlMzNH5jfc6e77c9EwOFxfn0kSNsQfRdtIvTPGjJzBERWM3cRJlPBoQjYHH0MucuJB51RWcvtg5uMLETcKGZ7e1iWAxgnhS7q33vBb3rjXk1S1Bh8R/atG5H/5FIdY7Y//cLiAxvST8Huup5tVpwXzf6Ay4wjkNnlC/qezYZEhuBP7p9k/mHWxBKNcontVsBaj1Ea8Lk1Rs5mgyzfHHNcZ35pix1n5ksA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB9742.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 05:54:28 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:54:28 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
Thread-Topic: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
Thread-Index: AQHbhn4lZ9IKkTrshEyIJtvBtkR/LbNV8DEagAACPwCAAAGmAA==
Date: Mon, 24 Feb 2025 05:54:28 +0000
Message-ID: <09C99CA5-7A3C-4DE7-9D19-0B06D3F35B10@live.com>
References: <20250224053632.2800-1-alexhenrie24@gmail.com>
 <PNZPR01MB447838FBA8CE5A22C8096A4BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
 <CAMMLpeRoxAvZGcHmB2B=Z2QU84tbwOfjY71GTudmn0AxasytGA@mail.gmail.com>
In-Reply-To:
 <CAMMLpeRoxAvZGcHmB2B=Z2QU84tbwOfjY71GTudmn0AxasytGA@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB9742:EE_
x-ms-office365-filtering-correlation-id: a00d228f-62bd-4070-1711-08dd5497b351
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|8060799006|7092599003|15080799006|461199028|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?OURieGdxU0FwS1MrVW4xSk5adzNzT0g4KzUxRDBKVndCQllFVlRscVR0b1dS?=
 =?utf-8?B?K1pSNW05V3NqV1NEK2tzdEszc25EWUNMYXNXMkMxaGNOamRqRGhqcEVuUGVG?=
 =?utf-8?B?ZEtCeTFQTVg3VmtaMFJKd21qcEwrazVLaFBEcFl3U0ZYN1RueWUvQk4xZnll?=
 =?utf-8?B?VmFXeUFlR3NibnhLaVB5YVY0cjh0bTd5WHQwbzRuM0h4aDhNZEVwTnMvN3ZC?=
 =?utf-8?B?WGlEWHJKTDAzTEdILzBBQ1Iyb3FXTGhHdmZ6N2JETGxHdTRBUlo3SE02UVJi?=
 =?utf-8?B?QUhwNHMyRXlpUDdHR0hwSDRNOHRQbXlaYURVRkh4cTZZU3NRcDl1UnU4ejVV?=
 =?utf-8?B?OXZUWkprcFd5ckVuNVRRSG41cmI0Y0pkTkhsR01sQU82RU9uTVRRc1hndW9y?=
 =?utf-8?B?dFV0ZEthYTZBMGZYNEt3MWtNeE1RNE93S1VnejV5WnpDRnp5RTdSbjN6Zjcv?=
 =?utf-8?B?aXZPWnl1SjhTQTNscnpFaFV5SE91Rk15RVNUT3VwT1JYWWtoOWc1OUxPM3Ay?=
 =?utf-8?B?c1k3Mlg3T1g3MndQaTRKOFM3bHVXZStNUXV4N1E1SGFaL0M3MUFRYVV1UXM1?=
 =?utf-8?B?VFROc1lITnN1NXFhMStGMTFpdG0xSkp6NmpiK1QyYkgrc1ZiY1BYRUROa2VR?=
 =?utf-8?B?aFduYXFBMThPekE5NS9MclF2QysrckxLKzRWK1FKcytRZmRPbXJrTzVCcExK?=
 =?utf-8?B?NTFUZlUrZ3hmanFCVjg1azREeE1DdEFabFVBNU5BNllIa1A1d1Vvck5YUGt1?=
 =?utf-8?B?NnZwb05FZ2tzQlhudnpKWDU3akQ1SThuLzZiK1k0cVJzWE5VbFBBUGE0S1dl?=
 =?utf-8?B?MkhDbFkxbVQwVnBBeDNPWEdsMHR4ZllXQi93OUwyaGNnRldnV1k1ekpXeWpL?=
 =?utf-8?B?bU5JQTNMWENlUUlmbjJTcU5ZM2d2aE9vRFUwVURTVk1jbHRhaW56eEtGY2xr?=
 =?utf-8?B?NmhKa0NCc3loRkIxamFvR2lnL0tyc1pOd0NzRDYwVlltU2VmbFlUVFdVTC93?=
 =?utf-8?B?bnNueXRRaTZXZUIwNEsrTE1HVWxmQkdVeW5kaVd5WXpTTSt3MThhMC9pa2N3?=
 =?utf-8?B?aVJhZXBQV24vcmNBTktXTHFpK3RoUDQ5MW1YdUdPMFhQYU9nRkp0QjhQR2F1?=
 =?utf-8?B?T1ZTeFdZRlovNk00M29aL1R0Q2tnOWo2Q2JmUlR4SDBkL2xHaWVuSmhkTkVm?=
 =?utf-8?B?RXBRa1ViQ2V1MmtOUFI0cXZqUlRYemE4T0Y0RHNmN2FiY0FaYmtUc0Vrd1hU?=
 =?utf-8?B?b2FhR3ZTMWJZbmF5dnFjSkNaTmxmUjlHWlZ4K1ZjejR1VGlEQkxkM0dJVDUy?=
 =?utf-8?B?RW9WUU91K1dKQmxLMXFTeWNDNytmbTlIaEw5Z1JrNk42RllWUHJHRmdQb3VK?=
 =?utf-8?B?MEN1eDlmZGh6ZXIrdEZibmJqNEtiUEZKVTUvUitlM2RkcTRjSS9Da2ZKUnJo?=
 =?utf-8?B?QktHSjdOQ1FpOFA4REs3bUt5K3BRNEFHdzgyMnZMZHlEdWZQK1lxQTRrbTdi?=
 =?utf-8?Q?+lAR2E=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkxLTmQwZ09zamF3TFBpUUxPN2cycFV4UXpOVm5jeTU2YUtTRU5xUGhyd29Z?=
 =?utf-8?B?dlJZN2xqTm1NYmdrSDBiS3RRNTFJOUdEcm1GR0VhWGlWdVpzbjJvZC9ZRTJT?=
 =?utf-8?B?NzQ5VUticzcxWldRRUNodGFmaXAzUUM5UG5QY3JLbjFEZ2xxYThYS2pxZ1V6?=
 =?utf-8?B?MDk0NnRDM1Y0Y2JHdzVuNGl0TkhZa3RFUVpvR2lvNkpOK0x5TFJYUWhXelE4?=
 =?utf-8?B?QURTODA1d093NUtmRmo4V3kzTnBoL1dteEZLc0tHSllwdnVvVk1BeDVhYTcr?=
 =?utf-8?B?cElvak1LdzZQZ1dRV2hnR0dwSDdJK0dOYTlIbjRlc1dvTTZvRWRNMTNIRjNV?=
 =?utf-8?B?OEN1eXJCVEErWHJJbkFGMlZOeEx4RTZWRjQ3MU9PRHpiSStJZVk4TWwwNUcr?=
 =?utf-8?B?UHB2OVk4b2xpeG1ZeVVmSkFwclo5THNhL3hKZk55OE5YZmllRFUxdzBBaDlR?=
 =?utf-8?B?bEdIenUrSGhMUVV6K0w4R0xmWWNNYnFlb1lZd1JDMFFoY0kyTjFtOXJ3b1VO?=
 =?utf-8?B?T20vbUxJSHViMkZ4bTU0SjBrYm9DYzlxemRiQkxWTFFGblNNS2hoQnR6Vmpx?=
 =?utf-8?B?Qkd3MU93NHBFMG9QeGZGVEFISjVudFVjUkNYa1RJMjFxbVBGNUFZcXZLWnZJ?=
 =?utf-8?B?eGdFTHFTajQvYVRxeHlGSUM5NlpBc3AzbFUxbDFLamp4bWZVKy9PcGNzd3hm?=
 =?utf-8?B?empHa1hodkpQY1FCYlNnZXIySDRkc1VaQVJJYUV6MldJaHZvakNldHVjWWZ1?=
 =?utf-8?B?QVF4OVMrU0lqZXZhT1VwNXhKU2pjSHJTcVpFL2dqd09NOTYxRDVkQkM1UmI2?=
 =?utf-8?B?SmhCMWZ3bWdTdUNLRDBqWS9XV1dVK213UGs1NmhUVElyMjBoUHRVanRPc1VQ?=
 =?utf-8?B?VndaVk1xZzZkeGhITlNMZ2pXNzBDUm1za3d5Q3o2S0FKS3V4MEtHK0lTTkhm?=
 =?utf-8?B?bWlZMWZ4WnNRd1V2RXYwWlh0a0VPa1h6czRyY0FaMytEMXludVdXeXMzNm1N?=
 =?utf-8?B?TUszZmhnUmROTC82Zk9kNWFYT3RmMkU1eW1JcDlNVTNzOUNEQ3l2bDYxTGlB?=
 =?utf-8?B?SmNHU09NWWFnU0xSODBnTTJPa3N5VmZFb01qYkxsWkRoRHhUSTdEdkFxQWE5?=
 =?utf-8?B?MTNSWWFva2VxNnhDUFpKczYvSTJGWmhjTDllL29xZVRPeEZQc0tVQnZuOTZF?=
 =?utf-8?B?QUNOV21aM0dKdmVHSjNxVi9vSVd2emY4MDBkOE1QUW1sT0ZrcEFNN1VoQ01D?=
 =?utf-8?B?dTRpdkhRYUxJOEY0c0syclE0MExIMFptS2hRRTVmaCtCVkdNNmtsVW5PNjQz?=
 =?utf-8?B?STJibk41TmVsa09WVnBodTM5SlppSXBuR0M1WVptWmFPeFBxeHNRYjBlVnVi?=
 =?utf-8?B?QTVaektOVURLZzJhMWd0eW56YWJmWFk2VmtkRTJkYlJEVXA1RTNqWVhKWWVF?=
 =?utf-8?B?ZmhxRmttTGZjbDNHdVBBZkM1THRhanVkNFNxTUtiTWNpODJuamErSC9uRXBJ?=
 =?utf-8?B?cVZDRG9pN2UzOEN2Qk9CRE5UbXNNMnYzUkZQTnBodWpjem1yT21MTkNyZXBV?=
 =?utf-8?B?VkwyUjV2MkRtQVdBRlpET2thcEZZNWNXTXVlWDRHWm5lUWs4bEtuQWVVcm1X?=
 =?utf-8?B?dkdVa0dLU3dUenp1WTd5YmJ6U1BMa3QxdUt5UHY3V1hlSS9BTmozWVBIeFk5?=
 =?utf-8?B?aUd6U0lRUXVzaFNITXpLdWZBNFovcEVtbTJNQjdjczVVaVNwNW1SZisyb1Zs?=
 =?utf-8?Q?PerLMBjfPgPqL7lmyu62W2Fb8XI9sgJeB6C79ul?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A00EE2B4EBAE4D48912F90A440B7C8E3@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a00d228f-62bd-4070-1711-08dd5497b351
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 05:54:28.1327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9742

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDExOjE44oCvQU0sIEFsZXggSGVucmllIDxhbGV4aGVu
cmllMjRAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFN1biwgRmViIDIzLCAyMDI1IGF0IDEw
OjQw4oCvUE0gQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0K
Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCAxMTowN+KAr0FNLCBBbGV4IEhlbnJpZSA8YWxleGhlbnJp
ZTI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPj4+ICtzdGF0aWMgYm9vbCBhcHBsZV9pc19vbW90
b25fa2IwNjYoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYpDQo+Pj4gK3sNCj4+PiArICAgIHJldHVy
biBoZGV2LT5wcm9kdWN0ID09IFVTQl9ERVZJQ0VfSURfQVBQTEVfQUxVX1dJUkVMRVNTX0FOU0kg
JiYNCj4+PiArICAgICAgICBzdHJjbXAoaGRldi0+bmFtZSwgIkJsdWV0b290aCBLZXlib2FyZCIp
ID09IDA7DQo+Pj4gK30NCj4+PiArDQo+PiANCj4+IFNob3VsZCBiZSBtYWtlIGEgdGFibGUgaGVy
ZSBzbyB0aGF0IHNpbWlsYXIga2V5Ym9hcmRzIHdobyB3YW50IGZuIHRvIGJlIGRpc2FibGVkIGNh
biBiZSBwdXQ/DQo+IA0KPiBTaW5jZSB0aGVyZSBpcyBvbmx5IG9uZSBrbm93biBrZXlib2FyZCB3
aXRoIHRoaXMgcHJvYmxlbSByaWdodCBub3csIGENCj4gdGFibGUgc2VlbXMgc3VwZXJmbHVvdXMs
IGJ1dCBJIHdvdWxkIGJlIGhhcHB5IHRvIGFkZCBvbmUgaWYgdGhlDQo+IG1haW50YWluZXJzIHdh
bnQgaXQuDQo+IA0KPj4+IC0gICAgaWYgKChhc2MtPnF1aXJrcyAmIEFQUExFX0hBU19GTikgJiYg
IWFzYy0+Zm5fZm91bmQpIHsNCj4+PiArICAgIGlmICgoKGFzYy0+cXVpcmtzICYgQVBQTEVfSEFT
X0ZOKSAmJiAhYXNjLT5mbl9mb3VuZCkgfHwgYXBwbGVfaXNfb21vdG9uX2tiMDY2KGhkZXYpKSB7
DQo+Pj4gICAgICAgaGlkX2luZm8oaGRldiwgIkZuIGtleSBub3QgZm91bmQgKEFwcGxlIFdpcmVs
ZXNzIEtleWJvYXJkIGNsb25lPyksIGRpc2FibGluZyBGbiBrZXkgaGFuZGxpbmdcbiIpOw0KPj4g
DQo+PiBQcm9iYWJseSBjaGFuZ2UgdGhlIG1lc3NhZ2UgaGVyZSB0byBGbiBrZXkgbm90IGZvdW5k
IG9yIGhhcyBpbnRlcm5hbCBoYW5kbGluZw0KPiANCj4gSW4gbXkgb3Bpbmlvbiwgd2UgZG9uJ3Qg
bmVlZCB0byBjaGFuZ2UgdGhlIG1lc3NhZ2UuIElmIHdlIGZvdW5kIGFuDQo+IE9tb3RvbiBrZXli
b2FyZCwgdGhhdCBtZWFucyB0aGF0IHRoZSBGbiBrZXkgdGhhdCB3ZSBmb3VuZCBpbiB0aGUgSElE
DQo+IGRlc2NyaXB0b3IgaXNuJ3QgcmVhbCwgc28gaXQncyBmYWlyIHRvIHNheSB0aGF0IHdlIGRp
ZCBub3QgZmluZCBhbiBGbg0KPiBrZXkuDQo+IA0KDQpGYWlyIGVub3VnaCwgbGV0cyBzZWUgd2hh
dCBKaXJpIGRlY2lkZXMuDQoNCg==


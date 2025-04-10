Return-Path: <linux-input+bounces-11716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B51A84BD1
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 20:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75A73BDC4E
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 18:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F716283681;
	Thu, 10 Apr 2025 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="QIr4ERBt"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E2D1EE004;
	Thu, 10 Apr 2025 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308370; cv=fail; b=V5sm0JLLZ7U4aCnDLTb/Usa3VOTwarM9yvy3VJHjmSgjnuPd7ctx2g+aQZKsOyslB6DxBZOrlAr9wkuh+B9BTEmylQzh0A11HZfYQGyyrCApZQP8q2ylgaX4H6Pq8lvyd+ZKbmnPD/J+93yqF0sCya8z4EpZZpuwWr4I93CQI68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308370; c=relaxed/simple;
	bh=4Zv0PoGl9WEX9BbpUc2Jyf4L+ajM2/xf5ACVSrl+YxQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iiDbfDaOo+BU9kzZWZ8OMgJiMCdi/kJ300lwZfWnnVjWZS9xQqswfTcjXBF6qYEeE6ZieL9MCylgA/QLtBsyGO4NCeZqbEiRKyODcVZrL+22R1vLCrwPdzdhmG8XmdZkFg9wj52rg5A3CX/7Y4s+7eUKmVzhkJKX72TtpfmHwvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=QIr4ERBt; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf2YuWE+Rj5MAerbCxSZg/GhykS2cO3FJ+SRt/uJArDzzW+wsNopsCf0RViiORKm7gZxd+UHAH4odhKLKkQdD+IqJ7OqoHmaHJKxIkLmUTiKPwuk0ZnpkjkaUs/ADh0VGmkAERqnHOtowly1D+BBmVu4jJE5E+I3OfyCzVpX356MqXhoRpQDU6LOOPruW8w7lQ3x7XU0ZitIfyz0qDHx8GhcRE4xnXp7pGWXnAro3mN2KWmrM4tLrtlr8RM+mOaohnMwiV3Gfegas3Xt7G2sySwAS3sOZfWW/oJOrf/2LFptMmPBlsSf0Ipg4MXL/W1A3cieHRgsh1jF1C5KM4KrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NckGkl7nqLmSvjkHK2gi8c37YaTHwtIPEbW0Xj6npmE=;
 b=HaeCC+EepAXqY61w8CBn0gcozsVWMJP+SjzJ22wB/SZ2RLFAsgPjXlQOqIJJMQ6INiCEgDsPHBkWlJ4GzauWZg37cVXZAKSi+/eIyhujHMOayA+yYakvJ8fFl49TekASXd4t6gylnyhQbSeLzTa8FFsV1ctlEGQ6ox17tikzxOFIkP5dYPALR8F+4z7Y+y5OLq0EYwTx3feXJdEnfCl7ASpc3wpPQj5ihrIeGoeIJztq7MizP6Owpb+LHiio2gEsEWf9twD31vZzYKg2JMMQP4SweySQWdxO1SmnO7IOPEV4yo+LOcbOxsXu1fInYTW/lKmUKcM4Zb6ugv9aTN8+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NckGkl7nqLmSvjkHK2gi8c37YaTHwtIPEbW0Xj6npmE=;
 b=QIr4ERBtbQX3PFl2pyCV8y++ku7bMFyTxI/pEiY7+K8TNOXjipCEu/jfQV+aUr/FlADvmsGBZUQfJ3TkY8tl3tz5jqvIQ/XCUJmWmKIKzjHvC0eRibUDTn/QPynijtnd+8SLREzp1oWpbVrH++E55On4F7JNyhVEXxfTmE7khcpSHsrWEL09VSvbpzkA9EmBy2QpQyo+id22rr+gG4VNxsrS7wrM2Ao+XqNzwKibqbCvMdLW4RWJnLL8Ph9HEbyDlt+jeVEoCc9C5iXw+kXkPQ0bkVog8Y8pPgGRcCrA3s6V4YMwLyEUxAm1iw8bjvKmZl/IZLOzPu350mxMM0omhw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB9236.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 18:05:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:05:58 +0000
Message-ID:
 <PN3PR01MB959746C1A0FD7CD50AD4F018B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 10 Apr 2025 23:35:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] HID: HID_APPLETB_KBD and HID_APPLETB_BL should
 depend on X86
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Kerem Karabay <kekrby@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1744273511.git.geert+renesas@glider.be>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <cover.1744273511.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <12928946-227a-4a6e-bfb1-d49427aae0e8@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fa6df7-b15b-406e-d8d0-08dd785a5816
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|6090799003|5072599009|19110799003|15080799006|7092599003|10035399004|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXJKc0FPcGVWRFlDcktUbjNzWTFJVVZlQXdLQlpnM28rMnVpTVJXSGorL3R0?=
 =?utf-8?B?cWxraDVPZVM1cmxDUGQzd1RrRlliRG02UHc3cXVZTjFmT2IyTzc2U1dZSUF0?=
 =?utf-8?B?WGlOREF5WlJMR3dOaEd2MXl1c2FtVmIxQXB1OUVUcTBQenBjWTRNbXRpU0RU?=
 =?utf-8?B?TXhuSlpkVFFPdXBNNVJEbzgrT3J2SUM3Yk9UVGhsVGtPUHVoRWUycWVCYWth?=
 =?utf-8?B?ZlhmY1BBaThORlR1VVRpc1ppMWc3UDRqcGxPQVBSUmpNL1o1WWxtZERVTUd5?=
 =?utf-8?B?TG5GaHlRLytVcURNbFVjNFdLb04yUVFaR3pINm55NVpwZ0VFNWtObjZqbC9h?=
 =?utf-8?B?RlNDVHlMRHZHZ3lURFpMNFlYYTNKdkhGeTVaVEZzWWo5ZXVJa2lwTnVkcXJL?=
 =?utf-8?B?RENoNEg3d2lJa0hUS2R3QndXb204WnBXRG9BVk9vdVZud09ROTVRZGxuUkVa?=
 =?utf-8?B?YWNCZ3ovOFJQY0gyK09RL0hVMStFUzA3OHY0T0wzZEZYajhhc0V5V1JpeUNn?=
 =?utf-8?B?NU9DQ3ZPcC9yQ0gzNUFGeFdpVm9ISFBudUdLbnBQSUUvQ3VmQ0Yvc3FDMXZK?=
 =?utf-8?B?cFhpaC9Ia3dVYVBUdmtUZlBPSEFLQ0paZnFMeVdFcTRYcEpLS2ZpQWRDMEVs?=
 =?utf-8?B?RUd4akRFbk5YY3FYaFNQVHhITytGRFI2T3pjSERnRDVoRzlVRVptVGJXK3hE?=
 =?utf-8?B?T05CdVFwOThMZkpDNUVRc0tKVTRWT0VWcmJQYU9vTUtqclN4OXprOUM4ZDJM?=
 =?utf-8?B?d1QrdWhmclBVdHZoSi91cXh0aGRicFg5UmtWV1lDdTBVbTRBSHVVSjhia3Ir?=
 =?utf-8?B?YiszNGRiVEF0T2dIY29MaHJhQlNjRS9BN2FFNUtUOVJDWngwYUFLSnpkMmdT?=
 =?utf-8?B?NERUVHVKRUZaWWdZZTZtcThGcEVUQkRyMElFVC9WT1U5d1FNL2xwdjN6aWNW?=
 =?utf-8?B?Qmg3U2RsbCtVU0U3N1ZScldYbGtTcGN3Uk5VMEhsdnZHeTQ2ZmtWZW5VTk9r?=
 =?utf-8?B?ZDZFMUpXN1ZnZlBvbVdUNWZxVEU1NEJDbHVQbGFRNXY1Y1duZDFVdlVsUHMv?=
 =?utf-8?B?cjhNTEw4QmVDWngzUThKN2daWWYyVzN6Y3BsOHdraU1FOEpVRWphQ1M2TzU4?=
 =?utf-8?B?eFlNUWNucjIvVXNWeDJvNUJWVkxXeFJnVTUwaUEwQnByN1BTeEw1d0hxeXVI?=
 =?utf-8?B?Z2VQK2Z2aFZ5a2VTK1hZbmxWZnpmK05OM1d2aEozMDJHcnU1ZnhlRGFVODhr?=
 =?utf-8?B?bjEwVFZKRWRCaUxpYy9nK3hUZzlXMVRMMWxvSUFSaVQwTHZPcWF6SmxVSlo0?=
 =?utf-8?B?TzFYQ0I5WmJ3Z3ptOUo0TGNtTWdEempnODZJSndQaS8xTEFaOGhOcWsyVHpw?=
 =?utf-8?B?aUVDaWRKcE9PRkJaRmxNMlh0blZQQmgrNHI0S21iKzBDcUNDTmtYazZNSGgr?=
 =?utf-8?B?TjRsSWIyYWtiUm9IdmlZeHBpVXEybnc4SmI2VktOUUdmSG5iUVNNUEtPWmFy?=
 =?utf-8?B?T0RwSmovLy9zUnRCS0ljOEJFbDJjSFpCRS9nQ2xaNllCa1pzdFZaU05TNnlO?=
 =?utf-8?B?a0swSXlUY1l2clk4aFNwQnQwN2IrMVhHdWFFT0ZHWEhGdTJvenUxd0RRZ3l4?=
 =?utf-8?B?SUo2ZTRRZENsS2JHSmw4V1RCNWlMNTd1ZVhxdEJiUWpTczljZklNQThpUTF2?=
 =?utf-8?B?T1Z3ZVVRK2hybklJTk9nQWFrekVydjZpenlIQlJZRHlFZC9XdjhibDljL0sx?=
 =?utf-8?Q?jgdWfN8E4VOUnj7XZhlXZkRSiu8eWek7t++u9k7?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ZmY01aVThISlE5cTVQWWlSSUU3U090VUxNb0pOUkZVWkMrelk2bi95aUdU?=
 =?utf-8?B?bUxDV3RZZXBkRWJzMXljVmFXTmQzbG1tODd5b3cvd29uc3FyUmhPQWlMcGxB?=
 =?utf-8?B?VjZsZDRpSWNScjVhOXZObWMvZFBndmdVUU9GZVMrY1hteDI2UkdBRU1iNU5F?=
 =?utf-8?B?bml0ZVJIZEM1MUpqSDN1OWdzNG1HYjJsSm1CeDBiTjhiaGV4QU43TC9SMjVT?=
 =?utf-8?B?NmVHUTV5bnRXSHVqa01qSzlkcWdLcm9rdUVhdUpGem95a0hHc3RpMVVIV3Rr?=
 =?utf-8?B?d095bHlESzNIL2diTFAwYlNaZW5LNzdIRVVuUEFnNkVYSnRLK3dOUXFNWkU1?=
 =?utf-8?B?SGxEQUVZUE5TMis0alB4MWxzQVA5WkhOQVBHQTliVS9nVU40Vk5pT0JmK1pD?=
 =?utf-8?B?NlpxbjBOM0RNazByN29kdnFjTTdVSWhxcElZbFV4d0NZL2gwTnVONkY3Yjgy?=
 =?utf-8?B?V1QrNlBsSTEwZWs2NGFLakRiMEUxd1ZCaXVjdjEydHBWRW1QWDdQcWxtODQ5?=
 =?utf-8?B?OFdSZVJvTFJJTlpSNzIzak04VVpzRTJFbVRFemxmdmpPbHY0WnpKMnhTQ3Vh?=
 =?utf-8?B?UU5OeU5FTWZPMGljTHhMRkxWcXpML244SDJnOHhzMzdZQU5rYXlZbDRRREx1?=
 =?utf-8?B?YTVhTFhpOG9sNWNpUHBWU0E1b05lMkVoZGpmeWlJU2VhTVE5MmRjTlg0ZkhT?=
 =?utf-8?B?YmNCNjFvMDFISXJ1dlBFcmtNKzc1RHFWV2RYaUF2VHpJYndNa1N5bzBzQlJR?=
 =?utf-8?B?UkhMTGRlMVRHOVFmOEcvWUU1TmpGb0l4S2xHUG9VVlFQT0REQmhMVTZYUTA2?=
 =?utf-8?B?ZUxLMUxqdzhid2FZTEFEL1pvenVUTGptY2RCTmY3enBnVEpPc2tSZ25oRHJE?=
 =?utf-8?B?MzFSREl2VzFPRk1raUNxTFBDSXhqbjVzU0JaZm5QTmpJaHUzcWdDcXl3alR0?=
 =?utf-8?B?bTNReDNWNTJUdVJMVDdMWUlyeUtGejhjVEZNbnFqazBkVUFHYm9OODhpb0Jr?=
 =?utf-8?B?SVJZWWhBb0t4cEplbTlJVWRxZTBQV09lZWVWa0tlUjlBY1AxY29ncWh1S1JT?=
 =?utf-8?B?Y21rKzNYQXZiUGNXVFFmMzV5eW9wNm03WEwvc1BTMkNhMkRVQk4wKzNVazd1?=
 =?utf-8?B?VVVUODE1RUlrMXpzdnViYVU1L09yQ0JLaGs2NFJDZmRHRVR5ekVmc3VPSVdL?=
 =?utf-8?B?czU5eThtZGFNZFNNUC9yQzFwNkJ6ZGc3S2ZTczRkLzRtemxSY0dZMC8yM2RG?=
 =?utf-8?B?TmovYms2VUJCdjd4KytUZGhacmtLa1BiazAxd0loUzZiZHNsZlVCeFJGZjFB?=
 =?utf-8?B?MFNRL1ByVjN1WnRmL1IxMStKOThia1ptSDVyTkVCTEEwc0NHbFhuOFdxQ1ZK?=
 =?utf-8?B?WTh6ZkN0cC9uZG83Wi92cWtQZlRsdm4xRjdnRFVhQU00K1EwcnU1V1lDUE1j?=
 =?utf-8?B?UDhMazU1OURKWjdYUnhRU3YxdnVNY2Zaa2RjUkVuSk9NRTVOMU5VZlhsSnp0?=
 =?utf-8?B?RG1ISmZ2UnhIc0dFeml1eGZEYjFiVml6bnRFRWpWeGpGOEN0SFdBaGJtdVJV?=
 =?utf-8?B?MTgwak5tdkg3ZDk1NGRwRHBTeGg2blBUMWEzQTRZdkZrM29maDVjRmNJc3No?=
 =?utf-8?B?UFcwc09yOEZ3VEUzMVliNUpSQzdBS1RwVHNVMXhveUdGM3pMTHltZVg5Q3ds?=
 =?utf-8?B?Y0x5dnpzNzNMVEN3ZDB6QlVyQlpGeTR2MnBjNDZBWFY1cS9XdmY1OGtZaDBY?=
 =?utf-8?Q?jB/9qtDk4OqHS7h9ycdUMESHlWHxRtqlkJm+Q5Z?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fa6df7-b15b-406e-d8d0-08dd785a5816
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:05:57.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9236



On 10-04-2025 02:00 pm, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The Apple Touch Bar is only present on x86 MacBook Pros.  Hence this
> patch series adds dependencies on X86, to prevent asking the user about
> its drivers when configuring a kernel for a different architecture.
> 
> Changes compared to v1[1]:
>   - Split in two patches,
>   - Correct Fixes.
> 
> Thanks!
> 
> [1] "HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on X86"
>     https://lore.kernel.org/4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be
> 
> Geert Uytterhoeven (2):
>   HID: HID_APPLETB_KBD should depend on X86
>   HID: HID_APPLETB_BL should depend on X86
> 
>  drivers/hid/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 

I forgot about this btw:

Reviewed-by: Aditya Garg <gargaditya08@live.com>

As far as the subject change is considered, your call.


Return-Path: <linux-input+bounces-11717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04537A84C39
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 20:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7AA51890D36
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 18:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5760A28EA48;
	Thu, 10 Apr 2025 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="uGZ1VzK1"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011037.outbound.protection.outlook.com [52.103.68.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5228D82F;
	Thu, 10 Apr 2025 18:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310472; cv=fail; b=e/V+EZGF+XqWc9lHm35WlhVbPPWZ6rQqpKpVGWQF/keLNY75F6eGukkwP5BOABHWGRf+jYAtodnr2kAX2NO8jXAAO2p2RwqcMCV2d/nWV7+C83WfGBuq1dNp/DsXH2tcLa3IqNiziC78/W35Xl5ibVXSzaP/+0mPJ7L5fLwpNTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310472; c=relaxed/simple;
	bh=3hTXF6+91lV1pyeJDK8iA9IAN7BNQdWgGDyvopsC07M=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=cqssOs7vbtMXdWjllUqXCUJVkUX7pVbAYlaF92CTizJiNYJLfnfb7ZXznHXHtJg1x3kK8Lr1MUmymNEIjtzUSfTaQ49kjCqHPipRuD0PXMsesVQvayCKOLzTzJ46qwmRGV5K7iW7ofZ10brcZyaV290yIQOH0yydfLCsCe6CK6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=uGZ1VzK1; arc=fail smtp.client-ip=52.103.68.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMuPfPMajaUs9cwT9NO41Ach58TQSzPbsIZUhtafm0t7VYzdmaZ2KngGAxnE2mli9w0zjDeqOzTTm/Qi8L6y2xf/FAI8fCOMGNskpX+djGH7d54DPqFkFd5zQZlsV3EDJH4NVwxwSFsfHsaK0P29dc+86puSXEBpCIb6OYnhbZZrCJrq3YmUXJjUHgR+HR31nft8SyPRhC0db114xK7o8WS9BHRo3LQhSF9VDjUVTcSSjAbwLvBjermR7bwU/pbDfd55yLOitnQJQHVtwMbiWD1NxTsuijhIl8rrq4wVX9FZRWFkH/8/anRCHg5xkROk7lltX/HhfDRnCDb91jPn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VDKEPWOXz3HglM76TKfkv+PxQyyRqjJdZzQLd6YLsE=;
 b=iSQXz7rXeFchgEdakkiPDyrvWPcZEPI3riIeLPvMla2r8d7TtAaro/4VbkgaFBT8ED5xPKPgFa2M0o9sayYhV5/yKXA892sNFSyox2eLGWH4jNpr/TV/uM4XbS7doqE7sxQXabn2tpAULIHtxr0+wc1Ob11PU4RGyx+NNBQUmTOReWtaZsiJ/95Of3IpAbluWSFqabEHCEk33UkiHSxfdDSA0yugb3pMzdACbUgAK0DOdM2g0WAU31P8Fk2vUfcIW/du9qhyKNOmp5DQxOS2XGCPsd6szJHxZcTJ6VZYcPRUzOBr26TcmFmapciLhKWU9yt3wuAzuf73BMliRHXJvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VDKEPWOXz3HglM76TKfkv+PxQyyRqjJdZzQLd6YLsE=;
 b=uGZ1VzK1ISwj04tasRVblkecN+75M2x4cW8R/fiHtZ+7nvazOBYcqSwnh3GZTeKRgp38YYrxrvY6RhrCQGiLgi4ggFXKN/GkXQpYGNY87J79qdIyF00mPzjVZ1VAW+2la/Hh/N3/9DaIs0zNIyiZIcIhtYN0TJ2zb5p+YXLSuLYiVzNLK57JrZV6HqCbLekr19GCaADilVdH0q9cLxjnsWH0z8vs43T4fYtiCViF6I7PTy9u5BO20fdMa2LV2jqKRFLFxTMzfBw84PeZ8lNAEALios09z5EjWRr++z0Z+PXXvlBVqKgUMyI4YiGnR8IhSuaBAuhtzHK3SunVi88jIQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB8880.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 18:41:05 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:41:05 +0000
Message-ID:
 <PN3PR01MB95973D930911AF73E262F299B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 11 Apr 2025 00:11:02 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH RESEND v2 0/5] HID: multitouch: Add support for Touch Bars on
 x86 MacBook Pros
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::30) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <5f4c22fb-1d93-4498-8833-67abf8f34e94@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dcbd6d-05b1-4bfd-80fe-08dd785f4006
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|19110799003|12121999004|461199028|8060799006|1602099012|3412199025|440099028|10035399004|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWlkUEt5RkVMS1RIUGN6ZE9ONWVpZTExRkZJZUxyUW5uOVlTeUlka1ErOEF4?=
 =?utf-8?B?aWdJUU1ucVNjM016SUVrME56RWdDaElHclZrcU9oZFdCME56YnJSbzQraGZ2?=
 =?utf-8?B?aDVzLzZvRWI2OSszZlFMaVVXb3hPMEhpNjdxQ3JKOEpXOXpoUmt4VjQrWjAw?=
 =?utf-8?B?dkpqNTVjYVZ1Um5JQklKRXllV1piVWpNWFN4SDZsbGZZSlBCWEpVME12cnlB?=
 =?utf-8?B?UVFSUmpLUXBleUVJdnpjSTdKd1dGSWJTbmNJSVhsTFp6UjExZWpFK0lVd3la?=
 =?utf-8?B?MVdlcTZvRUd1MUZkOTRMMGxuSy9TcjFFWm1nTURVUVZEbjFDZ3d5cW43OHNM?=
 =?utf-8?B?MUllRVc3RzlIalZienBGUmIxbjJJbEFZcTgvWnY1MWQvSU5LV2ZxTnkzV1p1?=
 =?utf-8?B?VndQK0d5ekhma29oYXpGSjFFUEV0ZXIyQXJBSWM1aUdCek4yOGdEUmFwcG9U?=
 =?utf-8?B?VWV0ZjJUbHlMUEs4d1JSMmY0dlJ6eEl0ODkvV0FJQlNxVENyRjk1aTM2bldR?=
 =?utf-8?B?czdpUWU1MFBab28xRE1YN3F3YTAyMnRicXdWN2RubUtJempqTzhpR084M2tU?=
 =?utf-8?B?RFYrRjArNzg1a0YwaS9IMDAwSzFBSjdIa1lzT0VLMDlXdlBzT08wc0NoUVdE?=
 =?utf-8?B?ZGpkTEVOMnpRbkRBbDgxcDkvSE1McTVCUDYyek5iTC9aUGkwUm41OWd5aTgr?=
 =?utf-8?B?UEgyTkNQSjU2SjAwY1Y3NS93ZXdYcHV2V1NBYlF4QmEzVW1jOC9BSjdBWmZO?=
 =?utf-8?B?c25TRnRsZjdTbDVPY1BHYmNyWlNBNzNaQVFEamEzMU1zS0RiK1VRbFp4cE9a?=
 =?utf-8?B?OEU3QndscHhLT1dQT0tFV2MwUUYrUVNCSmY5S1VjakRVcFdtMEhRUVJhVU1k?=
 =?utf-8?B?NW1STGNRWnlYZUZQV2I4a2RRTmpwOTJ3RmVzQ0Z6Q3dDM09nT0kxY1p3V2tI?=
 =?utf-8?B?Z0Z2QXZ1SnpaazdxTjQ0Qm9SWU5NVVpZbitjand3bERTTDdUZFdPSkVPdk1F?=
 =?utf-8?B?K2FhMGY2aVJGcFBUZVNNdFVUZ1NLaW4ranFsYlZuNWtpTWNlbjJrQ3NGR0Fu?=
 =?utf-8?B?b0oyZHVMQWovMjFWTXpYSmpLOG15M2FoV3lsTmFyeDRyalJBVkUzcjNmeDhX?=
 =?utf-8?B?UStQYTY5eWI5T2pIZ2N0aFRkK055R2VoVDB6SnRrOWJNc0VUVGtRak55dzd2?=
 =?utf-8?B?N1R6SDRyK3JkVFVVYWsvdG45MDR6dGErZFhDWmxBSUJoWUtiSTBSN25QQzRV?=
 =?utf-8?B?V01uSzlnaHhnaWlJN1VlRnlJQlpZdmI5VUFtcWJJMW9Oa3c0N2dyVEdtZk1Q?=
 =?utf-8?B?U2VLdUpRSE9mMGdLbWVuVmdUYWZnRjVqQzd0azBQYTFla21KOHBGaGxZNUtr?=
 =?utf-8?B?MnJsYnFVZlR6M0JCa1FtUnVxTzBpRm0xSnZhdS81NDFmdW11VnM2dnhhN0th?=
 =?utf-8?B?U3JHc2x5ZjN2eWNhbW1BZFFoVE9hRkFpejZ2VmJrT01RbWoxdkRSaUFzZVU2?=
 =?utf-8?B?YWY2UUVVTUxBSUhxa09lb1RSWTVyUjBEVjBScGdiOEEydk1pREJNcExiRVpG?=
 =?utf-8?B?WkRjb2J4VG1YNDgzK2M2ZHJ4b25nb0tzUnFIcFpHK0FwZzYzdmxsdmJWNnJl?=
 =?utf-8?B?c1FERXRJNVpyVmpVMkJCeENPTHNUV1NIcTBjUGVFWXFhcVJOaXdLZ0xuVXFS?=
 =?utf-8?B?RkxiYTNSRUd5OTRqRTlpZVkzc1JKUG5uYSswNnEyamllRFFKTUw2a2JISUR3?=
 =?utf-8?Q?WFJOr3TAmh5oRGidJ4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFVJQUtueFNZNklnL042WkkrblZEc0hDc2U1R2c5N29INWtBcGduc3NNTmt3?=
 =?utf-8?B?TTR1emhvNWlFZG9zcjdiSHFqTWMweEJSWlFDUXFjRURWdWtWMGdtZTk5c3Nh?=
 =?utf-8?B?bXRYNU9kSUVQT0RtZG9TT0F3eDU5UFhuVjMrRXdzRDNaTWlPTGU4a2owdWo1?=
 =?utf-8?B?T2toa1hwWDBUUjlxRWVSSkdNaUt2TDczSElEdEtlMEJNTmVCM04yUUZCN1Jj?=
 =?utf-8?B?bVd4dXZubHBJMTJONTNCdUNHeGEzQjBjUVo5dEhEM2p5Z0pVM1pucnA4VTJz?=
 =?utf-8?B?aWZzRjNFYWdjRmxZZkpJM2djUk44N245RWRxdTAxQW5aQTdRU3N5d1BvYUZB?=
 =?utf-8?B?Zk1aSkQ5STh3NXZZL0tTRVlkQkFrZDBCNjJnUk00U2Y5dzZSaVBrNHZPZjNJ?=
 =?utf-8?B?YzhRMDZJWTNHTC91d1dKUjNqbnBwWnhNQzJ0WmJ4UWgrWmEyUGc4SjFEVHlD?=
 =?utf-8?B?RmJKR09Wc2gzeVp2T280VGl2TmZSdFE1aFl1SWY1SjdvK0EvTVltNHFtTlZv?=
 =?utf-8?B?VUNRczFtNFVmRUxvTHFEdER0RzljZE1FZ3pVS1JSMXRVc0tkdmxKSEsvUkdq?=
 =?utf-8?B?dWlvZGpzY3hTNWxVQVdOTHpNL2hzQVhaTTRrQkxIMW9OWnF3bTRYVzluSS9v?=
 =?utf-8?B?SFRPbzI4S0hva21ERUVhV2swbDVRdmk2RHFQUThuUFV2aFMwbG5YcU5BMkRt?=
 =?utf-8?B?Q2UzTFhHL081WmwxUDIvOExWa1JlbktianV5cEtaWitBNHNHdGdjek8zRG4x?=
 =?utf-8?B?cjBBYngzZnBES0xaVlVxRUV3YU1MSWZEN25nY3FjOUthZUd1RDZqYm9BaWJh?=
 =?utf-8?B?QjdDMDhMb2ZTMmhNZi8yVzBoSk10WmQvbmg5MnFpbFhzNjdPKzI3UFZBTTN6?=
 =?utf-8?B?WEZQQ2s5em50cjJVQWVKUVh4dmR2VjlzRzhKQlZ6bmxkdll1SmM5YktidjN5?=
 =?utf-8?B?UkY0VHVxWmg1ZmRJRHJxazMvcmJkSzVLSForT0NhSHVrSzBoeERBd0Rzb3Vt?=
 =?utf-8?B?eDFyL0RXODJYQUZtemRYRjg2bTVVRUhhOERlYWNyeGREeWxDc0xhdzhHcEhD?=
 =?utf-8?B?bDNhNForOXpETXFyb0RyMUUzSW9vMENWMlRRNmVlRi9VV1FSeDNmaWhSQWQ1?=
 =?utf-8?B?dm5odnpFaEVvOCtIRVFsaGFVUDZNNEg4UHBzcGhuaUFMS3RRSzk2U0pWWFVa?=
 =?utf-8?B?NjU0QUdodVEwbnhTemRvWXRCWVovVUQveWJXY0xyUTlDK0RxQTdsNWgzUE9Z?=
 =?utf-8?B?KytGVElGL3BhQXhQejJyUHU4MkN3dWk3cVlvK2hMTW1qYmZ3NkNyTGxwMWN3?=
 =?utf-8?B?R3lsZlJ3L045MFBrQVl5NjdDUnRWLzlhZ2dzQ2VyZEQzckptKzRlVmc1ZTVP?=
 =?utf-8?B?RnpibVBjcVFEeS9TWTNrYjZ4aG5XanFnU0xlNSs5U25vVk1BUmxpaUhIY2Yr?=
 =?utf-8?B?aVNKaG96RndhUlBQZ1pVR0lCS3NLc3hoYmgrTlM3VjV3cXovdUM3eEZnbkxC?=
 =?utf-8?B?N2NYL01vaTE1QkhJVE1Ob1RuZ081YTFQTldybUZFS0VOa0R4RE5DOE42TmFO?=
 =?utf-8?B?R0VnYWZwY2xoQW9GQzhVQkRRZ3pzVjRRN3I3TWhCL1JrZTlIKzlXbVZJMVVJ?=
 =?utf-8?B?cGhpT3lwckkzMEFVQm1qVkZvZ1hFUTRVaG1oVWlpRjBtL01rOTFOY1ByZkp4?=
 =?utf-8?B?UEhLY1A2cGZIK0xQMzQ3cVVNd25XUThhdzhldkUrTXovRG5ZY0RWbnU3SjNp?=
 =?utf-8?Q?ENwTU4VTjPoyM835a3ZeZBrpMR3IOvrdjyfaMpU?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dcbd6d-05b1-4bfd-80fe-08dd785f4006
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:41:05.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8880

Hi all!

This patch series aims to improve the Touch Bar support for x86 Macs.

Recently, the hid-appletb-kbd and hid-appletb-bl drivers were upstreamed
into the Linux kernel [1]. They enabled the Touch Bar to display a
predefined set of media and function keys, exactly the same it does on
Windows Bootcamp.

Now we are about to get support added for the DRM mode of the Touch Bar
as well [2].

The DRM mode enables the Touch Bar to act as a second display,
just like macOS. So now you can add a widget, put a clock or anything
else on the Touch Bar as long as you can develop a daemon.

Now via these patches, in the DRM mode, we can use the Touch Bar as a
touch screen. The Touch Bar seems to be not compliant with the HID spec,
thus via these patches several tweaks have been done under the cover of
a single quirk, MT_QUIRK_APPLE_TOUCHBAR.

For the case of T2 Macs, apple-bce [3], the driver for the T2 Security
Chip is also needed for all the peripherals, including the Touch Bar
to work. It is still WIP, and will be subsequently sent later to the
appropriate tree. Till then, I'll suggest for get the driver from [3],
or more preferably, get Linux support from https://t2linux.org/.

Cheers
Aditya

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-6.15/apple
[2]: https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0670c2f56e45b3f4541985a9ebe06d04308e43b0
[3]: https://github.com/t2linux/apple-bce-drv

Kerem Karabay (5):
  HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX
    fields in case of Apple Touch Bar
  HID: multitouch: support getting the tip state from HID_DG_TOUCH
    fields in Apple Touch Bar
  HID: multitouch: take cls->maxcontacts into account for Apple Touch
    Bar even without a HID_DG_CONTACTMAX field
  HID: multitouch: specify that Apple Touch Bar is direct
  HID: multitouch: add device ID for Apple Touch Bar

 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 62 +++++++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 5 deletions(-)

-- 
2.49.0




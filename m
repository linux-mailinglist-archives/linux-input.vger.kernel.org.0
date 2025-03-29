Return-Path: <linux-input+bounces-11354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B177A75578
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 10:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F887188FC43
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 09:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452C5188A3B;
	Sat, 29 Mar 2025 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="jaWdpq19"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010002.outbound.protection.outlook.com [52.103.68.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4209D18DB1D;
	Sat, 29 Mar 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743240902; cv=fail; b=Iq8h+FET0g9rsYhXsx1xhwj+qt6kK+JMqgm/bCiO29sqM4w9ke3HHV5kd1rx30ECZAJp3hc/cJWqqfnFjYezLVpzuulUbYnn0MEbU1XXPGvSoilWXcME5OP/Doz3htDw/d3YeC99ojZ2ysFzruez8vCh6cPVWhbt1MHAx2wmVI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743240902; c=relaxed/simple;
	bh=nzq3V0lIObZXASlwj2H00r7AtQjj5AYycpE0LYSU1Js=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dnlThiAQ9rRjSTMmj/UOVYz6CK54gVFnxG2lwfGAtBnGW//W+JaBzuybfbXh3V0FAqHAySBIU9UInqRoelexinkOtukcFoG/ja8VmWebt2l1vJWaQZFB/7Imr+Q3/k3TcVy4wwnVZHmjCsbgqCGs++HkEwx2RY84H+mlni4hC3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=jaWdpq19; arc=fail smtp.client-ip=52.103.68.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD+jgRzZV/HGdxWHsrvSl+WJHbUpEAj+BrNV9luGBtN95/UdAL+F20BbZ5O9xMgCjchMYcdnYXKlCx2qH6vRjNFhg0rJlJ0xuLbHYauOiUegvcEnNaw9Mr/RL+GCTJOaavABpgb/tHzjlB8vKd1l4iLdHcgY3bblpnNQg9s42GS6UEpqsY7stM/5CMbbLkrYaVK98mGzinCoaeYOw3KPqtHHqLZshaRUaVOtHyBtI2StWjRu0flzLzcRGJFTlbhpRJyTVWezA/MySQwdV/DgMmQwqEWESKqI2r2XohHMeagu9KehznZKT8zgIslZEmhk83UGgKT3UpuxEAtfMw4nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKGanad7+drHTEl33e2KHSYUTbwACe358IBP4DV5a2U=;
 b=OcMiGXb9fPWUvPvZs+Rdpzjj7lsqHi2KpBVO3FqqzSP4DjhBUfi+Sv565MgcALTV+Z4NT3rQyD+UA7D28OolCCjdO1dRWmprUck53XPLffHg5NQSbExGSoQTZ/QyEPYbgWzGJI0JXxPHjDNcf+KzCcNJv+uV8jB2p0BT8KtVddTSnvqZXDxFPM/haNEze9zfWt/EYd7f9zUo8LhNIGm6C/zs5GQGWQ9+0Wsy+k+W/XvroiNrhKasoQMaAa8PrfG7vMVgvkBIWRKSzt+3zSxYBgA2avRjEzAxnecIlsGYjxpBetNq1yYb7NzTD8/RO8eVzM7qOIYPM1eB9Buhy7kS1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKGanad7+drHTEl33e2KHSYUTbwACe358IBP4DV5a2U=;
 b=jaWdpq19GEsoPSlvGi6kRhJvh6hJdErJ23bz81XO0f2gYL4MEAl0vVqef/d45/S4qby//wzuNq0H8OpiErb8RJOZ1OdaYigLEXuTyZiTRU3U2eykj8LqAe3aemeOCrNID6hQVzCpGkogTYBjKAcjdD0zHiWFSW1rz7YySRt91nQeFrIOV0bJ0PsoZUMZVmfnIKgQJFcgHWMDLdTx5Rhhttab3aPIsEZRgClnFZre82Awi0paz/7lfOdt3cVTlAv7Sxer4SBNY69IxHoP1zaklEHxT0+o+8j8u1RCI7127Prmn+h1BzAYdieuHw6rBSUapzXwtjT8ysyz4TrlWwan5A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 09:34:55 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.028; Sat, 29 Mar 2025
 09:34:55 +0000
Message-ID:
 <PN3PR01MB95974454D7C8409DEC063833B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 29 Mar 2025 15:04:52 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/5] HID: apple: use switch case to set fn translation
 table
From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org, jkosina@suse.com, bentiss@kernel.org,
 benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <PN3PR01MB9597CEB67FC52231276F6038B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597CEB67FC52231276F6038B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::19) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <b3605fc1-560c-4718-99de-57d995d4992f@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 05312937-eada-4ecd-0bee-08dd6ea4f6ec
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|15080799006|7092599003|461199028|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW5pS0pYWTJFaDY5ejhjbjNiRjY2cFh2TFpyLzFqeVMyNEt0UDg4OWRsM2kx?=
 =?utf-8?B?UUlQV1lvcnpLZmlLVG8zYjdSejJHZGdYU0ZEeENFM1RFbEJQTkM0Z2dvODlN?=
 =?utf-8?B?cEJSVmFGQUlvUDBmQlF4OTFuSDVMVHlEMFFESnlsVHFjck1EQlFabnduVVR6?=
 =?utf-8?B?YlZHRmwyVHRvL0dqcktVbURMYndMTTdpbE9WNW1aSHdDKzE3RDV0UWxucmpY?=
 =?utf-8?B?djZGYmlwcWVWY0dkZTZyVWxnZkxvODRPRGs1UXFLYWZ1RU9jTFljSG5oVEZz?=
 =?utf-8?B?ZmxwMVJoSTNhVDcvNElXWWsvQnJpRStoL1lWMjFjd0JnK0RTU3BDUWZ1clov?=
 =?utf-8?B?V0xYTFJ0M0RzVUZTeFJ1TlZuWHFHMFJ6WjY2NzAySml6Z0kxZVBpZVlHQlJ6?=
 =?utf-8?B?TlF2UU9TNkpsT0FIMXkrQjNWWUhLNDIvcDM3ZjZsNDhLUGM0VW4rZ253Y0J2?=
 =?utf-8?B?N3ZqUlNGdndkYUZuRmpjbnlJeTVsZXVDWWR4YmRJZ2pDb3k1S3QvZUZyN3Rv?=
 =?utf-8?B?aC8rQlZ4RjRSRHgrd0h4bk1PNFJzTmRhNDFsaWpRWUZwYTh0dDJaN1VlaU9D?=
 =?utf-8?B?emdUM09xOE1hU2FKK0loUUNSL0JzMWJsNEVmY2tZeGQ4djlZNEhTZlBoUmFL?=
 =?utf-8?B?NUtpVkhpcUdhMWRBQkhmd1ZMZFZ3Nm9QZGFYblk2bGZVaTZkYWxuVWpEYkNi?=
 =?utf-8?B?U2JTbm9jVWk0M0EraSsrZVMyS0dHTXJHRDl4bGZhVm5zQktmWWFQckRLRkdF?=
 =?utf-8?B?ZFVlU0t6Sy8rV1JPV3U4QXhTbkRQZU5VRnJONHVlNkt0OGdSdW1ORkRXbUtZ?=
 =?utf-8?B?L3dMN1JIKzkzUEZWS0J3TXVrazBDU1NkaC9hRlFFVHFjSEJpaFZMczhPd1Fx?=
 =?utf-8?B?L1poeXNFcWZtOFozU2dNKys5NUx4TWkzZWlZWFliMUVtSXVUSG54M21yY2Qw?=
 =?utf-8?B?YmFaQ0N0TlpKM05OQ0pYMkM5RG10WWR2VVY0SSswTWtKK0k2ODRhVjFGUlRO?=
 =?utf-8?B?MG84ZGRPZWRLMXBhbUo2dEhlUUtEcHZpMERmNEpNbU53bG5ENDI1SERaM2hM?=
 =?utf-8?B?NGM2bkdoRGRMSW5XdUNwcTdXVis3YVRGMFBlSDRacUgyUkd2WFZTd0JSazJB?=
 =?utf-8?B?UFBmZmpsNkdQcXlMOWlDa1VYZ29TMmFQdzc0VkJ2cU1tY2o0Qm1EQTJDK25C?=
 =?utf-8?B?eGhwQTlQcW5NbW5xcG5WU2htdzg0cVlwSzhQM2QzV2FFaXRTamdUUDNLelZh?=
 =?utf-8?B?T1hNTVFMNEFicjdkcmdyUW1wdkhKd2kxYllHM2kvS1JuWHByWU1Ra3ROSnFt?=
 =?utf-8?B?VXVLNElQTTRSdy9XTEx2WVEzQmpFaTlJVDBXdDFtbUcxcVNTMDkwaDk1T2FY?=
 =?utf-8?B?SmlVZDZCSlh5NFBtdVF1VVM2TWJrdTBNYkVWZWZaa1h5VUFLbk1pdGpUUUdM?=
 =?utf-8?B?MGJEeGpvUU8vSWUzTFdBVUorVzhrYXRtTmw3YWNReE9Ia3JZRFVuYmJNWHNu?=
 =?utf-8?B?VFM0akxCTk5mbitPZSsxaFVSOGhmVEZzWTBpRUwyN3FPOWVHK1Vzc3FLUGdC?=
 =?utf-8?B?bjdJdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkFzMWlFckVFejlrZk5HMzdPUmRhMHdLTEFFSy9TdlM1Y3hpell3d0p6cUN6?=
 =?utf-8?B?bjI3OGZhS3FhZVR2WmN6RUNBQ1pQdXJLZHB3V1pjRkpHYlYrb0Y0M20rVFBE?=
 =?utf-8?B?Qm5PdS9VQ3BheDIxUTNpWGlreGk5RE1lcFhrR2ptS0s4dUVuUTBabUpjM1dj?=
 =?utf-8?B?VjBBd256STFVNFRFZ1JJM1dMbERIQkNhbWRqN2NxZzFCZWZLYkZEOGYxTm9Y?=
 =?utf-8?B?bFNFQWZ6RW9leGtEbmc0cTJiaHhrSDVvVTdxMEwyaXh2L2NTTFFmdTI5SnRi?=
 =?utf-8?B?NEVOZ3NwRDQ3Um5BWXB1T1ozcXVxcVNpNmIzbWZSYURQVkl0K3IxK1o0UlVj?=
 =?utf-8?B?UUVDM09GWGNoa2UwaFdpZWl2YUYvNmZSeVR2b1FDeXd3Qy94RjAwN2RlOHNx?=
 =?utf-8?B?d2FtbDA1VDJTcks5OWxQSXBEa0RsVUtMK1dSajFMcTBUMVZhMWJ5SU1NUXMx?=
 =?utf-8?B?TGdncDM4VDc0NmNrWERNQnRXc0YvYnJBbnJoOUkyeTlLenZnVlFudVFpVlJn?=
 =?utf-8?B?WnRWRS9iZmFGQ1I0OTdHWVdnTTRFNU93dTdlNFVuams2RVlaR1IxcEJCN0ZW?=
 =?utf-8?B?RnZ4VUpEekk5andIOUhDTVJIZXpNMjFsVGYzQ1VhcEQyQkVOcGtvaHloNEVL?=
 =?utf-8?B?SXF6aHRIR1puWSszbXlnZEtpQ3BWcCthd1JGczRsekpMWVpFcmRUb3dibVFy?=
 =?utf-8?B?RDlpa3VLa0x6S2hNTDYrajEwWFRUTFBTblVpWTY2RFRWOUI3YWk1WEZVSWlP?=
 =?utf-8?B?a2x2R0Z0NzRId3J5L0N6cyt0WDBEQ2UzbUI4UEx2WnZCNkV5TWhaZ2lZTGhw?=
 =?utf-8?B?WGpaSndRQ1RINWxqTThkUlc1anlyYlNVMTJ0U01XRExqSTVlK29oOEYyeUdR?=
 =?utf-8?B?azVWMFNNdjJtUGsxQ0RVQ2lCSS9XaFcxeVNhU1p6OWRYdlB4TE0za1BEZ29u?=
 =?utf-8?B?V0ZzMSt3RnBMbHNOZmZ3Wjd5bmtEUUpXU2hBWEtoUENkMmlyU2UzK1ZwUk16?=
 =?utf-8?B?N2JDbFN6U3Z6cW1BN25kRVZMQklvZGJIZ0NwcEEwNC8wV1o0cDl0WUlqUU9T?=
 =?utf-8?B?c21BM1o2UFBBQ0U4bGZGSUpQZ3VYWk9ueEFKRGdNVUw1TkpKRVpJOHBmRTVH?=
 =?utf-8?B?cEtjbzVGcmFVUEhTUjJ4RUJCOFlacndRdVJGUS81a1ZGVnptYXdwM3pobktE?=
 =?utf-8?B?a0lZSkNZbC8yS0VHYWtTbzFTcGhITDllZis1QVZicCs2bTg3Ni9xcnVmRzNR?=
 =?utf-8?B?RVhlR2g3RUNNN3NHa1pSNWZ0clcxTi9xUE9xcDdVZjVMY3hPQ1hVV0JncmhR?=
 =?utf-8?B?YVFvdGovdUxWODJFZEZxUmpDWXlFcWtqUEY5S2UzUHcrRFh5eGkxMGhzR3p0?=
 =?utf-8?B?T3hWc2U1MFRWNUI5SzBBV2hQN2FvZzZ1WFhmQUZyOGljWnpnU2Jsbk9leHNG?=
 =?utf-8?B?MUFLMHpQM2FQaDVIRHZVQnE4UVdZK00zVVc1RDQ4Zm8welZuRTNLSHF4NmtY?=
 =?utf-8?B?WUMxeHRoUnVreHBHTDVHMDBlMWVKbXd4T2xlTllmR2UxSlRnd09EUUticGlB?=
 =?utf-8?B?RXhOMFhuYURpTkkwaGtzbkZYR2tRRXhTbVpuTG5MbVhVZ01CdzFubUdzV1Nk?=
 =?utf-8?B?M1pneld6RGQxSTBuU1IvdzZHVWFGQXZ1bWRhMWJ3aGVOZFdZM1RIR2w2N3Zt?=
 =?utf-8?B?K0hKNUxYeGhMd1VzbEFCVGxycGs1NW83TFlJanI5T1djMlFkaCt1cFcxUUs4?=
 =?utf-8?Q?2XtFfgzocA32hsIjt2Gam97cnx9vZkam9JYcrqF?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 05312937-eada-4ecd-0bee-08dd6ea4f6ec
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 09:34:55.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10042

From: Aditya Garg <gargaditya08@live.com>

There has been a continuous increase in the number of devices requiring
hid-apple driver during the last few years. Moreover, unlike previous
releases, the PIDs of the newer devices released cannot be combined in a
specific range, thus filling up the if else if statements with individual
device IDs. For such large table, its now more suitable to use switch case
instead of if else if for improved readability.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 93b990603..3d7befe0a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -465,42 +465,51 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		asc->fn_on = !!value;
 
 	if (real_fnmode) {
-		if (hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
+		switch (hid->product) {
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS:
 			table = magic_keyboard_alu_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
 			table = magic_keyboard_2015_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 			table = apple2021_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
-				table = macbookpro_no_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-				table = macbookpro_dedicated_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-				table = apple_fn_keys;
-		else if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
-				hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
-			table = macbookair_fn_keys;
-		else if (hid->product < 0x21d || hid->product >= 0x300)
-			table = powerbook_fn_keys;
-		else
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
+			table = macbookpro_no_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
+			table = macbookpro_dedicated_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
 			table = apple_fn_keys;
+			break;
+		default:
+			if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+			    hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
+				table = macbookair_fn_keys;
+			else if (hid->product < 0x21d || hid->product >= 0x300)
+				table = powerbook_fn_keys;
+			else
+				table = apple_fn_keys;
+		}
 
 		trans = apple_find_translation(table, code);
 
-- 
2.43.0



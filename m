Return-Path: <linux-input+bounces-11352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F960A75574
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 10:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381D43AC4BA
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 09:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2CC19004A;
	Sat, 29 Mar 2025 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="qxX+Fz/v"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF429A5;
	Sat, 29 Mar 2025 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743240793; cv=fail; b=fzV0tgrNnJ++baZz/bk6O8gHMK4KxvLc3MgyQWY/uwGerzyFcg9jZougQAy+xzUzaGrSJkRubesvuQNLh+jkoWoed2i80cNfOHuRHpNkqmOn/76xHV12P6tHQwqKlcECDbtqImHsqjGe6sZHn9NqvfQJWuyx/mx0JKdhDLTyzcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743240793; c=relaxed/simple;
	bh=v8jQTp//xO6pBxRLmi43eDzlgmCmOHHOzieyiMQZPIU=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=MNSMeYGxDI28rgCE62obr9/VFycXGaSk/c/H2R5STgiL4gmRamlB2MNTLsaaQvNyOGWXy9sBvhRGhDjYROSTk+zRO5PjdqQq/454qycwwX1CXPc7CKD+imoccHGeYddJY1WJj8CFo/yFRNtYSwCkLd5SjC6o4XCN4eBThrzPx7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=qxX+Fz/v; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbLsR26PF0OayV5B4ys44efkIVcHdcKk3/rntaNYsr/Uh3oecNic1Dh5/1K20eCZaB2sRORAhfq9yhzbMUN3j5LYLDAMaVFcpJ4DLbWZAlrr1PPV2EFTWM8rGdXF1nuMlErdO1YNLwZf4F3JpWcDoTuOeOzhDnuTockCb5toHFDrJfneIa8Oz84Jjk3E5vcAksFQLYqTzRI2k4Z3ajjkVGQfwrLrNqwnvcs5l9PvQJZJwfw49YabOpL8TQdGFp/dUH/UotKnhZtHwCl6Rg4mqRlpnSjY2cXfAbSyLDzbq5RbCHCs5sB/Oscbs3gfG0+mV43S1hlPctjO9dVeQWC1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aad8UFlvX0uTHyA+fbxovsry/eavzPic4OS7+aDrRmc=;
 b=MYSY8alD76sNUGReKaRh4vJuV9wd5Y7Baj+SiMwZZ7qvsVX79nwsGGxNOMOMkIl2eV3mdsdLUZrCWY2DQGZwYe1F8j0kWXFHrnJ6TjCTwGahoALZTGVjWmvCp9YsXvptxJhQc0vC60UPvCZIQO4rNhgky6J57ucWcfXg8eAxTIEoP7dv6XLkf/YlJMguASERhly1xynhZoKiAeLK7w16S9LMrohiXkVaMvTyvtZXfUOHMSEmMAccoO/+KRfpr6zKXwzgUpbZGXh2civfxZ2pf6jp2qs9x8mmxUAhc9+nBCANz9z0vw1FSz+soRm00xIDm+P4lX9LoggAU3J4HufA1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aad8UFlvX0uTHyA+fbxovsry/eavzPic4OS7+aDrRmc=;
 b=qxX+Fz/vwrzlPWeIQub4sxZNTVgxu0rVC/Ej9WAkf++M6AK2A58+zkXVZWZ2yQ64QZuLlTzPwbc4OgvaaUIW2wgwgvp1hYxyDeonWpDSigeqwCfx2KM7/N1mKj2/T1/Jreb23vyPJC4qFuFwM7F8M5EWYIj7rGP8skEprX+laYTMiHdHd2uMXKs62WvZZ0GgQp2aw55uxiS/URnolXiyfppsTW/8KASwyMzHce1edTrCmRR+mrEIuOL53d+lw79gSoVzySEhsrtIWaA1MulMsAIcO0Gd2UKHPXs+Fxai7tWS2DjENs0sOtWmTzwsqlzzOdSVoI5/yqQhxHn4aJ1Hbg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 09:33:06 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.028; Sat, 29 Mar 2025
 09:33:06 +0000
Message-ID:
 <PN3PR01MB9597CEB67FC52231276F6038B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 29 Mar 2025 15:03:04 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jikos@kernel.org, jkosina@suse.com, bentiss@kernel.org,
 benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v5 0/5] HID: apple: combine patch series for all patches
 recently sent upstream
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <dd5354c1-47e5-49c3-97a0-ffa46fc6c686@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd65b17-b5e2-474d-44c3-08dd6ea4b622
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|15080799006|7092599003|461199028|6090799003|5072599009|5062599005|13041999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFlqN0RtYkduZzlXMk11SjV4VDVlMjZtRVljRUtHbzFyNmhaUEJaNDN0S2pl?=
 =?utf-8?B?U0xTVWw4RXZ1UEhjL2Q0V25sWXZWWDBrMDQ5dFloTHE0U2hRSUZvUnkrbDFQ?=
 =?utf-8?B?dmZwWVZFU3dCN0ZJUEt5U3dDNHM0VHRJdU13Z2pCeFZNWWpta2J4b3FEb3dl?=
 =?utf-8?B?RDR1VDNkZFFYcjlsTHdySEpmNWc2emNQMDltbm9oQVVxOW9DMy8xQ1p6dEhS?=
 =?utf-8?B?bTJBenUvYy95U2JnKzg4a1FaS0F3UU96SEtwbUpyVWpTdnhqOHlxRmxhSWpo?=
 =?utf-8?B?Nk43Y0JWRkx4V2o2MnptZHMrZ3pSNmpaV0E5Z2JmWSswNXFkTUxYYzhLL2Jy?=
 =?utf-8?B?anJTeXpuSjZqcHloUVFIZFoySWxLNFh1RGVmekppNGlVbFdmcHlXZEwrQUlC?=
 =?utf-8?B?bTNuT2ZsazBjTmlDY3lxdWtwbnJJQ1lVbk54K1QzSFpzWVg0aGszTC9zN1hL?=
 =?utf-8?B?WVZmY0FZOTdiK2dYZ2xSaUJKTGRMaklxSVhJUHpxRmFNL2RCckhvcDNKVS9y?=
 =?utf-8?B?Vk5QdU9sbzBWYWdjZUN3TjN1UzE3SVRlbiswd1Fsak5tKzg1Q3VBRTBTTGpZ?=
 =?utf-8?B?SjFoTDhOeWdQTGVzckVwYXZiNjFPY09BSW1EeENQTzdJNFRYdzUrZ3EwVTJ0?=
 =?utf-8?B?YkdjOWJIOXNXNG9RcmQrZXVCdTQxaU43MHcvOU9HWUVHTUM3dGxuZFIveTVO?=
 =?utf-8?B?Y2FGb2oranVwRDVQWTdEMWtsMkpwYVd1U1VEZGx2dW96d3BHck9UcGh3eWl5?=
 =?utf-8?B?Q2FWQ21MYkhQK1VWZlNveEV1bTNvd1dpVEpscXZLeUVnNzB4ZHVHMytVVjRE?=
 =?utf-8?B?cHhDMEJrSEUrU1JLc2g1UHUraVZVWjdGaTUzWnQzKzBTMXhRMzhWL0JBcTVu?=
 =?utf-8?B?c28zZ2hWTStLYjFFT0NubmhVMEc2ZkV4QlpObytkOS9mRGxIU0xEU0J4ai9s?=
 =?utf-8?B?UzF6anMzUnNOK3FxcVgzSVpGcEZPZUxiYjU2VEFYZkxhbkpnNmVZSUoxUkNT?=
 =?utf-8?B?RXd2eFB6Mm55N0ZoTU44alVaR2kyRlpjZmU0NVRDTmxSdnNZM25RYUdGRjV5?=
 =?utf-8?B?MDVucmZwb0pNdGI1NjdEbDhObXJsaHdEVHExRUlFOUlNSHdZUFRSVVpkNVBR?=
 =?utf-8?B?dExUa1RJRDBZa004T1hYMEs5N245ODRBNjJ2RFFCNUM3QjJqZjV4eGhLdmlp?=
 =?utf-8?B?STJRTGY5U2IwUlh3Q212MGFWdTdXdGk4RWd5d2ZCLzJZRVZ5N2dTbXpidkFH?=
 =?utf-8?B?RC8xVjd0bVhUUFlDWVZWcHdaeWJxYTlsV1lRMjVwd0hQbElqUldRdnh1MjdD?=
 =?utf-8?B?UVgxdUgvc1E3amszb3I5OVRMVk9qZlNZb3pNbkY0MEpiZmFsWHg5enFHands?=
 =?utf-8?B?TzFMU0J5UnJ2OC9kdE1hNmlpU3ZnTGVMNTd3UnVxOWUrdUFyS3czcU56OHJ2?=
 =?utf-8?B?bzFseklZY2hqWThTSkNGdlNiT2NucUxweGRMOUU2a2tralBZbCtCdjdHK2VF?=
 =?utf-8?B?Tk1PazI2V29UakQvMS9TRnFFTEg1a09kREpIOHR2R085OVpSTDlScFJlOW0v?=
 =?utf-8?B?VjNyNkg5RFJybkVETTVKQnphOUJoZnQvUng0M1ljQ1JoQ2kramlLMnZOaHg1?=
 =?utf-8?B?Ri9zdk5SQXZqZFMxblVJcmFYdjFucnc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTRCbDZGei84NGtEdGRkN0tsTmdXNHlwdEE3a2h3NG9kMUV3cmpuOFMwS2tE?=
 =?utf-8?B?WjFWMzBXc24rQS9vK1dSNmRsVjBtclBWUC9mTkhkd0EzMzlJQU85eDVCV3lH?=
 =?utf-8?B?UWRzVnJya2E1amI4Q1lqL2VZeGREcHkwcVdZUmkwblNwZ2RHN1BZQXJnWEo3?=
 =?utf-8?B?b2RoclF1MXJBUHdpVU1uN3ZieXRxdDBsd1JXek1ZTkFQYzdqVXhjY0xRdEtU?=
 =?utf-8?B?NEdKbWx6NVg5WjM5Q1U1cDczV2ZYSGJ6ZHRWM0o5c01CeE05ZTZWQTZzR2Jv?=
 =?utf-8?B?bEtRTUlmQ1hYNTBMMGh0ZGJMTGpML09tUHdYaVNjN1JFSEhPK3Y3Z2FpVGFP?=
 =?utf-8?B?UUd5UmRXK2owbUxRdExMVVJRK2s3b004TTdsQm8yTmswZS95Q2xHNmJEUW9Y?=
 =?utf-8?B?dlFoRkFSRFFBejdSVlMvUFpKc3hJSFZBVmlzM2pSem5zaW85aHJBL0Jvckd6?=
 =?utf-8?B?TU9xekoza0sxcDIrdDViWEhoTURQcUZ1MVEyVUlMUTNidHAzVTQrR3JFeG44?=
 =?utf-8?B?L3REMTlYMlc4R25kWFc3a0FQcWU0aW92UVRRdkQycm1TRXhZSzRpSUV5UHpj?=
 =?utf-8?B?Z0lKY1Y0TmJFS1NKNmMxWHpINHRNTCt0Nm8rQVJWdzErOHZoVWdGVW1rKzdI?=
 =?utf-8?B?dUlTMCtwdWV1b3VUeWY4MjIyOG1Mb3c3SXBmV3lUWUJUczU0RHBPalUyTUxX?=
 =?utf-8?B?QWhPamtDRFhJb1hYTHFMNXF0aGVvME1QaTFJSnFmYlFwaHBwa1Y1K3NLUTdw?=
 =?utf-8?B?bVFsN055TktJek9QREFhQ3ltY2RESlB3NHZkU3hGb01TWHExbWQ5d21aeld5?=
 =?utf-8?B?clFVZWEwRCtvWjJYVTl0K3IyNSthS1J0cWNCUGRvTmlnV0h2ZXZRYjAvdk4r?=
 =?utf-8?B?amZMUVB1cmZEb1hwQStvQ08zVlJSMmtaTUxQSmxyKzNlMUJzRnFqQ3V4QXVM?=
 =?utf-8?B?TERKV1VCTVRYNzV1QjNuOXdWZEdCVk1wNjNHNmR3alZ5eGNmMGxMcUtvU3dD?=
 =?utf-8?B?ZFhwTWNYNkpmSlAzRnBPa3JjQ0JySU9iRjU5OE0wbXJLeGo5NmFHOWpZTkNI?=
 =?utf-8?B?ampKVWh0L2ZEVkNhYnc4djRocW0ycGorVEZkTXQ2S1JMc1c2T1B5VjFudWxq?=
 =?utf-8?B?aTB0MTJVeUtOdG9KajFocm1xU2NrTDViQmdzVFhmLzRHYXFpZHZVd3o1U21w?=
 =?utf-8?B?YXNQTVRkT2xCdHBVN09HanNlRnlmakhOSlZWVDZUdVBJaWNvbkhwRGU3Y2xk?=
 =?utf-8?B?ZlQrK2l3S0lJSW1udm1Ib3lGc0c1aWlpb0x1SjJEZnJJR2ZjS2JjOVdKWFFO?=
 =?utf-8?B?c3JINWJlOTYxMGRQcysvNjdMOUMvOWppejN5ejc1ZnhpOUxNODJwZzZaYTg2?=
 =?utf-8?B?Y2ZENnNmTVg3cGJUN0w1b09WUGdlU0IzYmdvYnBGcis1VHRDWTdGcVIrZkRz?=
 =?utf-8?B?YmRscVo4aEVlY1U0QVJIM3N2aWZCaSs5Q2JzUjVkMzU2czhkb2hjOWhsalYv?=
 =?utf-8?B?UDh2WlZEMjlQcDh3OURrNVRFWThwSWpIcElOSjY5L2g0dkV4VFFKTkI5WHFT?=
 =?utf-8?B?V2hmeVROK0JCa0s0d1BSL01vL0I1NjA3Tm9pVXVnTlJkSlhlYkpBbm9jc2s2?=
 =?utf-8?B?ZlRyclNyM3hYTkRzZzhMaTJyY2VOMVlDRVVpYmp1RXpKOThrWnpOS3JYMmpj?=
 =?utf-8?B?c2dVTGZqWVduQUt3a3dEaUNjYzVsNHpZRFZQdkYyeHdXVnF1SEloK2J0ZTNK?=
 =?utf-8?Q?0HNhIDBIx9cosx1AJ7tIHReh7aS3Ad4TFkT/hcr?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd65b17-b5e2-474d-44c3-08dd6ea4b622
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 09:33:06.7941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10042

From: Aditya Garg <gargaditya08@live.com>

Hi

This small patch series contains various pending patches for hid-apple in
a single series.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

The third patch removes the unused APPLE_IGNORE_MOUSE quirk.

The last 2 patches add Apple Magic Keyboard A3118 and A3119 USB-C support.

v2: Add A3118 Keyboard
v3: Add A3119 Keyboard
v4: The "from" email in patches authored by me was different from the one
    I signed off using (thanks to outlook's weird oauth2 requirements).
    Anyways, I've managed to get a workaround to get outlook working
    finally, so sending them again properly.
v5: The cover letter itself failed to send in v4. Sending again.

Aditya Garg (4):
  HID: apple: move backlight report structs to other backlight structs
  HID: apple: use switch case to set fn translation table
  HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
  HID: apple: Add Apple Magic Keyboard A3119 USB-C support

Grigorii Sokolik (1):
  HID: apple: Add Apple Magic Keyboard A3118 USB-C support

 drivers/hid/hid-apple.c | 126 +++++++++++++++++++++++-----------------
 drivers/hid/hid-ids.h   |  10 ++--
 2 files changed, 78 insertions(+), 58 deletions(-)

-- 
2.43.0


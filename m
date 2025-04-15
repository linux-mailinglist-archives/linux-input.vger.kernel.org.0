Return-Path: <linux-input+bounces-11794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3364A8A3C6
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 18:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ADDD7A9BE9
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975F929899D;
	Tue, 15 Apr 2025 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="WGd10ofT"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A758D20AF9C;
	Tue, 15 Apr 2025 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733603; cv=fail; b=E7OHD0lhvFd9VNRLqaatbEL31VllYYBj+I5Mervy0qvxTvUAR3QMoLZskaRYmrkHdLW6jiquO6NzEQiEXPF7HYiFZPCI/BkQDSq2OmxtLR/jO+gNV6wEbENx1r1XIAElfo+V4n4+GrLh8+w9FoMfhx/XaUSOzChwB8bniBmj44Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733603; c=relaxed/simple;
	bh=FS7hBHvXyqLE+Clhwk5Ap0AeWggtrPNArMYSNfkgerM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hgZM7waPVVXKg3E0PFy1HfnPqm89O+2sI5WSzt+erb6iCbOCJ1HvG1EYeq9jxLmiQ78Yen6rxAUaU5opqp9dkwm2ePW5d5kZN9C7brPJRIbHoH/6J9wsRjp1TpRDlskvjJdA8GXjIt+/xqFU2Fss6dHSqoIhC4IxINKHiBVf0YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=WGd10ofT; arc=fail smtp.client-ip=52.103.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IC3pdHj7pTL0racm0MXPyK6cUt5z/lNAnO0O+KTDwIxM4tP0uAkNjbnSY7McZvSM/1cg3TWAQSQd4HQwJcC1PgcKmGfEfU0LNcjwVUbN9elYbi4guS34Rga/m7kaCvFDihVTFG9kl8MN/RqYsk8OHGtPYFr0osUU9ja7v403ApEEiMGWuAM/PZKCkVrsWJVDFOoWiyw5DwSIUHEWJKrLCy2siFy4bj3dzHYJ7zCfa/Be6l6/onZvAXkZTTbY4PBIfn/BC6TFxdMWciMffob2TxGqIsTytxzM3V6M6dCOwPUkDdfB/K891r9mbWhm1oqqCZN4yblDJ1g202DvHACLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gtc+M+CQmqzmrC0LRrLgaPI0HpccnUQG4WHu9ptieOc=;
 b=nYXsH8Jdr+/viD2WilUD/bw1BFFV3ajqm502YNzZLtcHujX4oV2B0b2F+cA0LC+fzQGWRZu47eSs1R+9JEqC+4apghSRaNAgkpXu+KRZ8OmnT5Jvx2DOZjx/CcUyNQXe5tLU7MsV48JHWxhXrO9qux1CYnN84QzA1mcJQKFLCtAeGbBJbkV7AkungwAkLRfzPRHCfh0bZTw0iw4AH7nqYG8jl5rrR0sk+cQTeApXrcQOsTcQOCGrMnGodp1FehJqxDKp4A4mKHyHeDEoEEiG9ytimrCrUkuHFZibZqirbBl/Hqf/yqvK7NmZJx/rm9hDD9Z8VgkYPfRPFlsE81336g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gtc+M+CQmqzmrC0LRrLgaPI0HpccnUQG4WHu9ptieOc=;
 b=WGd10ofTjRT5TyHr8MPSHEkm1WH0gp0Qed3ywv2Gk1+RdiWd+xAFNIKmspMP4CDoSO4jXu4qlzBOCIlD//giJwUuP5pwT+og32prRA6CZ9/16tGTfJiErprhcdnEsR0lihRZjiLlVNV01ftT+GEkdt6nFB5hzL/XJgsJv/S6504GOeYSOAkI/czn5QdidMPYIgA0sA19oiRjOqkiRKB1VBTGge+N5J1ccBL4Yx9ad/4bFcmBS15hWwbcfatPGB79lJ6nWxb5iGbaQ54n1/VTblwo/Mj+QH6SsZQRS07brPV38NIdyPvJufPQiUNxdt982rrhY9EozwQTagbqxRlDOg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9735.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:13:17 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 16:13:17 +0000
Message-ID:
 <PN3PR01MB9597FCBB8741CD49349DDA12B8B22@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 15 Apr 2025 21:43:14 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v5 4/5] HID: apple: Add Apple Magic Keyboard A3118
 USB-C support
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-input@vger.kernel.org
References: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
Content-Language: en-US
In-Reply-To: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <ebd4b0f3-be6e-4b80-a24b-7182c9dd8fd8@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: af53ffd2-2894-4015-e583-08dd7c386e84
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|6090799003|19110799003|5072599009|15080799006|7092599003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWZCOEY2WXpYekVRdmJUN1ZSMStVNU9xMEtTUUl3UDZQVEZCc0szWVYzMjRH?=
 =?utf-8?B?SjlTeHl2ZHhhbjVIanJEeHlkUGZxSjRuRWs3NER2L000dEV4cDhDcGx4NjZE?=
 =?utf-8?B?SS9QTkw4UGJYM3RQNThsNVN5aENpNnZiTHFxeE40OGorT08xa1Flc3RaYUpR?=
 =?utf-8?B?Ykh1TFNpV0ZJT2xha1A1VDd4SWRIT1lYZUl0YjRUaTZtdVpBNGNHU2IxNThV?=
 =?utf-8?B?K09yYnJ4amdvZk12UEExdzJiemJhRExQZmdzalpmR29wYTZ1VzIwd2Zxa0J5?=
 =?utf-8?B?blNhamNBd1FXN05kTlI1UnVMb1ZqbEgrZmhZdzdlSVJISUswdkR5a3lacGtD?=
 =?utf-8?B?QktURVozKzJmMEZKRnpqTU41K3ZiM3E1M1pPeUJPUUJqbXk1clptcEhadTFY?=
 =?utf-8?B?WWdSRXdNT3owZVNEWUlCZ2hzT2g1L1U2QTg3MTI3U1BIQXNNRFhtRkhaRkhs?=
 =?utf-8?B?Qk5id3ZBbktSclk4M0cxMGNrLzhOckhkL1J5WUlDZUtuSks0NEw4SDhvNkU1?=
 =?utf-8?B?UmE1Yk5hYzRvRHZNc1NSRjdSN1dYUUJDUHZuT0svNXp2dUpLVHhuYWJ4UXB2?=
 =?utf-8?B?MEVsWFJSZ1JtZXRMM0tZK0JaeHA3Wm5oL3F0ZHpDRWE1L1ZOdFF4NjZQWmlp?=
 =?utf-8?B?NUtoVGpNQmR4YUhOSlVCK2VSeEVYTDNramZJamNjdlQvb2MwUk5tSStsK3Vj?=
 =?utf-8?B?VVZWOWlOdnRDSGpHRGYwUWR6andLQ1VSVHowaW0vMzdsbXJLdXRJdmg2TS9y?=
 =?utf-8?B?QXJZajN6d0xaa25MUTB2WFpPR0ZJZytVWFUrWVJkSEl4dzF1THVYZGJkV08x?=
 =?utf-8?B?SENHQnRQRTR1ZmsvS1ZoOE9aQXBkU0pvYWtYVDFqRklWdkdVRU8vTHRHYmg3?=
 =?utf-8?B?TDVZM3NQVVlINHBtbTJlNlRGSFR1ZjhtU0RLOU1ZRytmMFlwK2Y0YTBIcTFS?=
 =?utf-8?B?YjZPaWRHTWlQN0IyL0d2azk2ZmkvRXBPVnFtWGxnSHpVK1BEQVdrOVd4ZDVQ?=
 =?utf-8?B?VnU1U3JQZzE1QjZFV1BBSVZ1cXdQeXlERGJnaHBmUzAwTFZKWnVmYi9hMFBx?=
 =?utf-8?B?NzlqSVZrK2VtSnlRZkQ4SjVJYWx2YldaVWtZWmlvT2QzSjRpRDFHTC92WFJ3?=
 =?utf-8?B?aHlWYkE2SW9CeW9YZHA5Q0V6QlhxMmJyeXVnSTNRSWZHRXA5S3NTQWpheTIv?=
 =?utf-8?B?SzcrSGpZUTJUMTIreEJpMGgxSm9MK3gzT1FJVzdlYWNMQUxubk1CQXZjNW1m?=
 =?utf-8?B?V0wvR0k2NlRmL2JvS1dwZElXOHhzakp6d1c3eUlrOEFSTThoOE10NFB2TXM1?=
 =?utf-8?B?Nk1zUnNsTHFvRmpZWGVQQlpjenhvNDF6RWUyMXNaMlZRa01LZDhJeHZRMXR6?=
 =?utf-8?B?RHU4TVF6ZHZNd3lHUGlUTExFNzB5TVkzeGluTDBvaDk0U3VyWXBiSFVWRGN0?=
 =?utf-8?B?ako4emlHL0hiR3ZHTVV6eWc4RVFRL2JINmhqcXVsUzhTdWdnamdqZStPM0Ey?=
 =?utf-8?B?ME1Ld0ZIbXFoR3dsQnVuY1pvVnB4OGNXS1NaMzhDZU0rU1hCZ3lQZWZFamJJ?=
 =?utf-8?B?YzJXUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHhBM2FKZFBNWURxWmR0ZmJyZTVFMFM3M3A1bDhWMmFkRmV4Qy9RNWcxSXEx?=
 =?utf-8?B?Rmk5eDR3QzBWanhPSWNkRDE2bWR1N0xEbU92bGtXTTQ3NkkvaXlpaThWT2Mv?=
 =?utf-8?B?bWFYSWRYNkFoUGNtT1BYaWFZcXJuYW94ejFwV20rTGI2dHJKVUIvR0F6bG1a?=
 =?utf-8?B?eVNPcmFFOGd6SjdZZTZPRzFaeERVSkwyeGV4VVZ0bFVrZHExcGJHYUpTQ200?=
 =?utf-8?B?REN3Z1Y2bFVRcTRvcmZhOGxhYVpneTV3bmFpNXhMbnE5dllnajJIalFrTjQx?=
 =?utf-8?B?MmxidmpkMHVIdnNuZWFyTEdUVFdqcFRUd0hycGZxYXM4aWxoUU8wTWU1L1BE?=
 =?utf-8?B?THNVZHZVTjRjc3MwUjc1SkFMMGJTMkYwck93UTZUbHNOS1hWNno3T3lzb3ZL?=
 =?utf-8?B?NjdkUDI3WUs2M3ZxMVpNR0xuOS9XM3FIUWE4ZnNseTJnNmE4emFpMWJobXcw?=
 =?utf-8?B?Vi9ZYmlJd2tmNDVJZHFQU085bWJmakVlMkVTaTZydEtQY09yWjdpeml5eGwr?=
 =?utf-8?B?b0NMTjBIbXRZMUFuT0JQdXRmdlZnWnduM1huKzZWRnJqTlhNWmJTWHJSYkp1?=
 =?utf-8?B?cDN6NXZSRHEzSE5JbktQVENhWTN3NHRUYWtCejJ4cFIyWWVka28xWHpoUUli?=
 =?utf-8?B?ZDB0UEh2ZS9UMFYxWEFROHFRMW1wWktpQ1BVSEc4KzMyU3JPQmhwdjlwRG9x?=
 =?utf-8?B?ZXpJdXRqRFRyRUNleFdYZGgvZWdrTjR6UEFIeEpSUXkzcjc5WVk5VkRFalVp?=
 =?utf-8?B?d2o0SmV1bTRoNmtSZno5eGhwa2FvcXhaOW1kMkhUMDBYRGE4K2VjVTJRQmwx?=
 =?utf-8?B?M0lBMm9lb3d2VC8xc0lEYTFpOG4vaWFhL0k2cGxadkJwa1hlSWFscnEyM3p0?=
 =?utf-8?B?UGN4MlJvTk43eGV4MEphM1dmOGxibFNUM0tWNGZBZXNtTzc0dXk4d0pSUE1M?=
 =?utf-8?B?TmJJY1VsNHd6cjdPTVNNMG9tNGlmQnNLNFQ2QjZMTVlzSDZQckpVb25oM2Y2?=
 =?utf-8?B?Yjc4emFKZUpvbUdiSmdjR1ZGM254NUJmQ3VzL2Y5YUNlekNlN2pyQWxIS3U5?=
 =?utf-8?B?WTZ6dFZTN3FmSWdZVmdJS3k5SStJRTIvMWdBZnI3NDgzZUpJWlRhMFFTUXNt?=
 =?utf-8?B?aCt4OVpIcGZnTGJiSzc4dnlreE5DT3paZ1c2WHFFZ3NQM1h0N0NZdEJ3T0tx?=
 =?utf-8?B?OWYwV2RSb0pneC85d2tyN016Sm1qNURPQm1mWUtmdlpMWXpVSE04Q0NIczZy?=
 =?utf-8?B?SG5WTHk2SURITFhsWlErN3ZXMzdUaVh1U2IyUEVTOGx2U1hqbmhGSFFGbGNL?=
 =?utf-8?B?MjV5ZWsza1F5S294Q2N5dDJ6aVNvcEE0RG1QSWZ3VjVEaVBhMjNzbVZ1TVVj?=
 =?utf-8?B?UTdRdWdianYxR2JhR0FOWlJ4YlhJNWt5VWN1QnpTSE4zVEQrQ0lIbnhBdjV0?=
 =?utf-8?B?UDZXSnlSNnJyZjk5Nkd1b29SOWVKeXQ1Vk11MmJ6VmhzRU02eXRuQnhVSHJZ?=
 =?utf-8?B?MjZIMXdSS0FZSEEzcDJpT1hyV0gvWDVyeFQ4TFh2aFRPdFRiUnNVeWZTd3p3?=
 =?utf-8?B?UjZTSTRYcE1LdnN4a25mdUJFdFBlS3pCYlJvRHJta3lDaWVEdk0wYUQ1Z2pW?=
 =?utf-8?B?MG1yOGsxUStSUlhrSmcrdWRuWmQwZ0RXSHpsdUxIcVVseXN1SllHU2M5Yksr?=
 =?utf-8?B?NEtmM0t4eE8vSFphWldCVTg0VmhwbTdCUzFlbU14U3lESkRWY0lSNmhKQ3o1?=
 =?utf-8?Q?vfuXYzYvNyGydyycm1vY356v/5oYSd3Qw2ee2Kl?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: af53ffd2-2894-4015-e583-08dd7c386e84
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:13:17.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9735

From: Grigorii Sokolik <g.sokol99@g-sokol.info>

Add Apple Magic Keyboard 2024 with Touch ID device ID (05ac:0321) to
those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++++++--------
 drivers/hid/hid-ids.h   |  9 +++++----
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index fde438bee..e95a54113 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -165,7 +165,7 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-static const struct apple_key_translation apple2021_fn_keys[] = {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -482,10 +482,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			table = magic_keyboard_2015_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
-		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
-			table = apple2021_fn_keys;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
@@ -690,7 +691,7 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, apple_iso_keyboard);
 	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
 	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
 	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
 }
@@ -1165,10 +1166,6 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
@@ -1177,6 +1174,14 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..8682e1b11 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -162,6 +162,11 @@
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS   0x0257
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015   0x0267
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015   0x026c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
@@ -183,10 +188,6 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL3	0x8241
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
-- 
2.49.0



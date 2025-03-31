Return-Path: <linux-input+bounces-11371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 081F2A76030
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 09:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AD7E188A7D5
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 07:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C574718CBE1;
	Mon, 31 Mar 2025 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RFzLZijn"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701C198A2F;
	Mon, 31 Mar 2025 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406615; cv=fail; b=HFZ6Zbbm4LzZgDeRVgYs9PaSmAR+o6jr3/IP25QmokbvyAaMq4AHnkL/KMz5Un2g40k4EhOTG5ysqO6wKZ62hajVoKvb4jkRJdBKbBs2f+r7OCTixavGcru5pJjHJD9Cf436rd0/tCesQIkeQQ+A0UNl0qPmwCHAcKCAhSkIuyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406615; c=relaxed/simple;
	bh=qyHPhdxuTXVmRk6F4TT+jNTVTxBiNq8j+KSo981uBMo=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=XakEOUcEoYefpO6yoeNpfj99MnHTmdbR2bLVLD9GcdBx1snyQebz2zI6l067EyMNnJh2hikmKN07FE0OXmzjEDFFdxFEb8SUG1JvnjlNYK8z4E9r2t63b0BQmMosN0bidvBbsbhTCVKhWd3KTiar+R+sx78fSauUQQbAvkfEZMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RFzLZijn; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1coPgtVrpDurUhtsES2fjrqcIfCyUOXeANSKziuqrkfWDqetZui4267giMsEHqkyn2fJxaiU54eWQniAzY8VqsJL6n2p1cJxlrXvTHPfUtZEBDD9T8ra78HsKhxk2LFsuBhF62grR6UYpD25DSXe/LIZHgd1Y/lUHGmF9tMIEFeF/pzA+ebK1pwdt5aGUAXGLQNMHNDEFu6YLkgPTmpXK33a5MJshDhu5eYBIl8mueqko1MdcwTEVRxhQMxz4KzFy4LNeWTc7JWiQ9bq1ctBgSFNvsdMJEZBLEIn7wx8urkKolKspbY+k7W/ltOsmhksLAlEFobK5LzaelqC6JR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d5TPBGzPVuv8dhuiBtkCWJeSbJvSiPEpNg9Ibr2w/s=;
 b=f/x/4OxImMxBUQhYdzWBbDiZI5baKD3PWCvwelD2kUDyxEIkwwY96HeM2yGnnKAretLBwLJYHy2pnvPYH6FcZRAA4HY8q2liR250R9qbxtLdEBmxIF+DvfWRQFd3tgzd5NX5HvNo6yQeMStrfgIHD4KySaVQSHCpyxTezZIiE48OhrjtIbhLo2mNrVBl4xwVebn1azfGueXcrwEtOT6a0nlg5vDJAGcBMBDrEGM1N82RfFB3HIo6//41X7zFTwnaNIxrQXHUuViJRtRhzjXx6opo9QyRUJzg/i8JJtXWb6o5TV1KpjSkIekBTsVSL6HeYn4bLFAddzQBxaoGFYVOSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d5TPBGzPVuv8dhuiBtkCWJeSbJvSiPEpNg9Ibr2w/s=;
 b=RFzLZijnYhU/eMRZd9mQFNaCTe/PIKtLMnWKYIR9YgQydljySwMth2tW6jWQKiVS7gpiktgKYYX6ytCE5zg0lbtczNc1NWNcj3KB6z5g1XLaTsCleLVpDA+T7JqxnHitKRTIpdjC7OV3lXKpftOM69OBkez54GRxKUfN8ZWn2pjRTY39jQFWETWuHN6yC1nHAyQ/gsCVK2aDeqMYWOwGQCN3xKcRYU3pJNiqiQRc4cCTj2Xdk/ObVfqwceNaYfuiaVn7ASYF71P1sLIpqDKoJ66ue/EtwaeKBPHqcMB2lTPyScjgbec/+VIIHNceREA3JKjO3CHU9lzi5UuMEKxJwQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB10322.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 07:36:49 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 07:36:49 +0000
Message-ID:
 <PN3PR01MB9597EF3E56A1EE2191490E92B8AD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 31 Mar 2025 13:06:47 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jikos@kernel.org, jkosina@suse.com, bentiss@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH] HID: magicmouse: Apple Magic Mouse 2 USB-C support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <af08a57f-bda8-4ab8-b3f8-886205a72fee@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB10322:EE_
X-MS-Office365-Filtering-Correlation-Id: 387602c3-2b2c-4cc3-a634-08dd7026cc0d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|8060799006|7092599003|6090799003|19110799003|5072599009|461199028|5062599005|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qjc5WG54NGorWEZ2RHRObjc0SWlaTHEzTTN0enJwclVjbytORFdBdjg0emRx?=
 =?utf-8?B?eWhPTlZvWVVwb0JNaUV4djdrVDlxNzI1WEVyc3FuR0lVV0FtUjVhM3FTcjd5?=
 =?utf-8?B?ZFEybm84YWZSWU01VUlaS0F5aXd3eFYxSHZ6V3A2cHlia2J5blZKME8xUFRK?=
 =?utf-8?B?VzNheUhHczFQN0o2Uk41QUtXSGNDdWN5MFJLajVJZUw0d3NMOCtSdXNXVkpv?=
 =?utf-8?B?K1NOaGorWWRGYlg0TFhnS3VYYU5jMEl3UHNQQ3A5bzhpUUt0YVdwRTBsQWxN?=
 =?utf-8?B?N25vNFZQdzFIdGhlMWNMaG93Z3VUTGpEM2hvd0NMOE9GVEZkOXlTSXBZM1E3?=
 =?utf-8?B?Y2tuUjBWQWlzWlk4TU5wYUVDUG9EZDQrV1c0VEJHbzNEM1doaXIxVElud2Fz?=
 =?utf-8?B?bmhKQ3FWa2RodkNMYVBWeHFJc29FZlBzRUpNSGd3S2RyaEN3VCtkdjNGWEJr?=
 =?utf-8?B?b3MwOXhYQlRHcENFeDRHcjRVNnlIYUdBRVd1akJmNmdsWVhHNGdoM2plbmJZ?=
 =?utf-8?B?Nlh4OUlSWU5aVjh0b0lORzFUZ1ZIZStZNFZUOTNwQUNyTHU3T1NwWmpEc0pm?=
 =?utf-8?B?bHJPblluRmc2RDg4UEQ0dVpjQk5ISzlMRS9ZUXlXd1NmT0xxZTFjUWRLcFky?=
 =?utf-8?B?cGR2cUEzZzlvcVRTM21EamlwZi8xOGlkUE9NdmpXNUdVb0xwY0ZVUzdqQmdm?=
 =?utf-8?B?K0NUalBhT1hLZW5EQkZtM1dwNDM3Q1d3anZqQnQxZWVaUGJpdmwzWGxwTnpp?=
 =?utf-8?B?aUprZFBrZ1B6VmNQaDkyWUxYRnFQcjFpTjNJM3J3RDVFcGU0K0YvcmZ2ckVa?=
 =?utf-8?B?bHBER3Q4L2Z6cFVGZTM4VDJyaFVmSDh2ODhrV1VXbFpRR09hS3dhZEl2bERH?=
 =?utf-8?B?dE1LdTNtenBLRUdkSEdRM2hVVEloMmkwSk5QK1NwNE1TZ3JIUjZkbWdyV21q?=
 =?utf-8?B?cWhjcFR3Qmt1bFNMNnZmQmxNcW1INm9CemsrN0lpSDI4VlFwWWJjVjlXbUkr?=
 =?utf-8?B?dS9FbUtzU0kwT0VDOGJ3TVpBVkRKeUFDU29HU2MzS1NYUVNmaFY5TG04K3VO?=
 =?utf-8?B?M2wvYk4rTzNzUWp6ME55ZUtueHl2TlFRc05aN2YzY1lRS3JmMDZaK082WGdR?=
 =?utf-8?B?T1F2aU1YNjRDL1lKSnh6ZVRXbmZOeVVvaEhUSW5XeFRvd2dRREY3MHAzSWJV?=
 =?utf-8?B?NG5Fbkl2RGdNcFZOam9zVzdSNGJzZDhsbWpHQ3diOEU0NG05UDlwSjlhRFBj?=
 =?utf-8?B?VTNRb3c0UFN2REc3ZU5qMVpxdHN4QUhlYjJ6Y2NjUzYya2JBWDM4RmhhSit6?=
 =?utf-8?B?NjNIWnI5aEIyVjZ1ZXM1bWxDckcrTFhWU25OUmI4dForelF3cGFBdllwaTAv?=
 =?utf-8?B?dzFNVzdhclRLczhEZ2pVem9CWGtPU0dHMTAyT2w4cm91V0c2b3dyOG80RUc3?=
 =?utf-8?B?U2Z4NHQwVnh6aTZPZG5lakFUbjQvQWFIOUN3eDJzbVUyc0ZCNy8yVkw3N1dR?=
 =?utf-8?B?YWFzQmlaZ2NLU3BQQmVpT1FQVXErZkx4Y0VKeEh3VzNBT1BIZXRYeGMxbWZz?=
 =?utf-8?Q?7BDy7nrSGn0PnX38Z6iPzbLa9ppNZNAIGZaLVM7xWr8bb+?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFJsMG51Z1V5ZmQ0ajRhWW5LNytFRW9IOGpEOGc0WFZqTkZGc1JRSmlQbHkr?=
 =?utf-8?B?dDNtV0RYUFIxMy9ZZEFrMWVJM1JOZHRUZ2d1ci9Bdy9KanZWRVYrK05HZG54?=
 =?utf-8?B?MjcvN0pIalo3Z2pBUFJCRkkxa1FNQ0NtQUgwVzV4eGRJUExlR0hkSWZkOUh3?=
 =?utf-8?B?VTRwQWZ1Vk9FMXhGZit4TXNoeXJxaDJFT3lzcFNPQ3FzSGRoRk80NkJFN0kr?=
 =?utf-8?B?U3h3YWc5RGtpRzNCd0QwZkE4dmJFK3lvYnF0WmRqd0pzaW13RnI3TjlWaVRu?=
 =?utf-8?B?OUhPS3lhRHFPbEV4VjFGdkhWYnowYmh4OXA5VmxXOTVNMGtBYTZVS1dWb2xL?=
 =?utf-8?B?NUdxcmYyNStBRnVBbjhWRXg1dDhiT1ZKVWZWeDBJTGdUb08zeXJmZ05jekp1?=
 =?utf-8?B?OGUrUUhNMnpJNHZsRlRWakYvSWRMQjdCT2FWOFJoTnlpKzBXQ1FrZW1vMmwx?=
 =?utf-8?B?V1ZaOUZKYzJQRnkrWkZsTUg5Z1FZTzdrQVUwSXFGUEZaMFNWNzdnV0FpcmI1?=
 =?utf-8?B?T1hkVnpZTlZQY3JJd21YajZGRmIvUDZtY1VPSTZ5LzBsMTdHbCtaTVNKV3la?=
 =?utf-8?B?Q01IZXRxR1pLcXFkTG1ueXFHZjZ3SXRvems2ZUJydTNaOEVOSzZ5UWtoWEdv?=
 =?utf-8?B?WFdBQXo1dVQyTXczOTYzRFZJK3Vnd3doMDlya1YwQ2p4K0xNSXo5UzV2UEdN?=
 =?utf-8?B?V2Q0RnR2amR6MVBXUzVJVWxLMytWZUNHQ0FVSytzc3RZOE96emswMDRrWGd3?=
 =?utf-8?B?S0Qzbm1HaEhyRTh6Sjd6bkxzM015eStxK3VybUFnSWd6eTFFSlEvRnJJampQ?=
 =?utf-8?B?d1A0Z1MzV016RmlqNGhTVDdIOXhMdXBjbml4bGRRcTM0Z3BJWEVnRjBTSTA4?=
 =?utf-8?B?czdXdGlIRzNFeG10SkVLZTFhbnI4MkI2dDJXMmNXRG44dlZ3NzY3Qnk5RHBT?=
 =?utf-8?B?NDc3UUhyOU1hallnWE5FcVFKWHp6VGp1Qy80MldhTFhpbDVPWlEyTHI3TVlS?=
 =?utf-8?B?cURXR3pRRGlmVkV0bTNVSCtWanVJUG9pNVlPN1NXTEF2YWpKdDEyY2swWjVp?=
 =?utf-8?B?OC9PZER6ZWo0M1Vpd0tzQitBS2Y0ZGhjZjFmY2swZnNKeFV5Q2IxRlpQN0hD?=
 =?utf-8?B?YXlOU0FyOEt2MldYc2NRQTI2RDF1QlZqVGNTMi8wQzN3bnBhS2FIZjFxQ1E0?=
 =?utf-8?B?KzBYTFpnS2FMMnlIakZPdlhScGJ5RVJ4Rmd3Si9ITnJUdWYyVk1scTZENi9J?=
 =?utf-8?B?ckNuYVZqKzNXZ1dXbmsyZDh2ZXNpUEwzZ1dxdWc5aVRoVEtRejQ4eUFlYURz?=
 =?utf-8?B?dFF5OGV4cDJ4UWN6WVJQMVpiZ05Ja0prMGZPMFhVV29oVDNtVUFyM0QzOTFH?=
 =?utf-8?B?N0UwdGVmakJ6WEJYQWNnKzJMVHg2K1JOeGJ6VTJtQnh1Q0lCWXNFeVZ3dDVE?=
 =?utf-8?B?ejFWYVVqWVRHM3JUNStBWW1KMkRneng4WVIvV0FZaHRzNnJmaERDQjBsSjc3?=
 =?utf-8?B?WUIwamt4YWdXMXFtM3FFR1RNbm5QSkVDRWtNM3RsRGR0cytJSkdvd3U0TjBS?=
 =?utf-8?B?TnJhOHJNR3RaR0MyUW9sYS9QRTUzT3QxSThYNHp0dmZkRWU2RmZLbmN1TzRE?=
 =?utf-8?B?R0ppWCt2dGlmakJKcDFpUlpQUHhrSmg0R0JORGtYRnNkcjd5ZzdIazcvRlFO?=
 =?utf-8?B?VWR6UXhCNG9KbGFYNElUZENIZUFTdXdMbGFRekdhS0VqY2xwRXk0TFQwQUFZ?=
 =?utf-8?Q?NSea1y+Z9R3TXilWkLHjNPDOyd62FJYQntdpcUS?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 387602c3-2b2c-4cc3-a634-08dd7026cc0d
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 07:36:49.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10322

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for USB-C model of Apple Magic Mouse 2.

Except for the hardware ID, it should resemble the existing configuration
for the older Magic Mouse 2.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-magicmouse.c | 74 ++++++++++++++++++++++++------------
 2 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..2d3f96af6 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -92,6 +92,7 @@
 #define USB_DEVICE_ID_APPLE_MIGHTYMOUSE	0x0304
 #define USB_DEVICE_ID_APPLE_MAGICMOUSE	0x030d
 #define USB_DEVICE_ID_APPLE_MAGICMOUSE2	0x0269
+#define USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC	0x0323
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD	0x030e
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2	0x0265
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC	0x0324
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index a76f17158..423d50702 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -218,7 +218,8 @@ static void magicmouse_emit_touch(struct
magicmouse_sc *msc, int raw_id, u8 *tda
 	int pressure = 0;

 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		id = (tdata[6] << 2 | tdata[5] >> 6) & 0xf;
 		x = (tdata[1] << 28 | tdata[0] << 20) >> 20;
 		y = -((tdata[2] << 24 | tdata[1] << 16) >> 20);
@@ -370,7 +371,8 @@ static void magicmouse_emit_touch(struct
magicmouse_sc *msc, int raw_id, u8 *tda

 		if (report_undeciphered) {
 			if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
+			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC)
 				input_event(input, EV_MSC, MSC_RAW, tdata[7]);
 			else if (input->id.product !=
 					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
@@ -497,7 +499,8 @@ static int magicmouse_raw_event(struct hid_device *hdev,
 	}

 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		magicmouse_emit_buttons(msc, clicks & 3);
 		input_report_rel(input, REL_X, x);
 		input_report_rel(input, REL_Y, y);
@@ -519,7 +522,8 @@ static int magicmouse_event(struct hid_device *hdev,
struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
-	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
+	if ((msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) &&
 	    field->report->id == MOUSE2_REPORT_ID) {
 		/*
 		 * magic_mouse_raw_event has done all the work. Skip hidinput.
@@ -540,7 +544,8 @@ static int magicmouse_setup_input(struct input_dev
*input, struct hid_device *hd
 	__set_bit(EV_KEY, input->evbit);

 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		__set_bit(BTN_LEFT, input->keybit);
 		__set_bit(BTN_RIGHT, input->keybit);
 		if (emulate_3button)
@@ -625,7 +630,8 @@ static int magicmouse_setup_input(struct input_dev
*input, struct hid_device *hd
 	 * inverse of the reported Y.
 	 */
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		input_set_abs_params(input, ABS_MT_ORIENTATION, -31, 32, 1, 0);
 		input_set_abs_params(input, ABS_MT_POSITION_X,
 				     MOUSE_MIN_X, MOUSE_MAX_X, 4, 0);
@@ -741,19 +747,25 @@ static int magicmouse_enable_multitouch(struct
hid_device *hdev)
 	int ret;
 	int feature_size;

-	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
-	    hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
-		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
+	switch (hdev->product) {
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2:
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC:
+		switch (hdev->vendor) {
+		case BT_VENDOR_ID_APPLE:
 			feature_size = sizeof(feature_mt_trackpad2_bt);
 			feature = feature_mt_trackpad2_bt;
-		} else { /* USB_VENDOR_ID_APPLE */
+			break;
+		default: /* USB_VENDOR_ID_APPLE */
 			feature_size = sizeof(feature_mt_trackpad2_usb);
 			feature = feature_mt_trackpad2_usb;
 		}
-	} else if (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+		break;
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2:
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC:
 		feature_size = sizeof(feature_mt_mouse2);
 		feature = feature_mt_mouse2;
-	} else {
+		break;
+	default:
 		feature_size = sizeof(feature_mt);
 		feature = feature_mt;
 	}
@@ -787,6 +799,7 @@ static int magicmouse_fetch_battery(struct
hid_device *hdev)

 	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
 	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC &&
 	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
 	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
 		return -1;
@@ -857,6 +870,7 @@ static int magicmouse_probe(struct hid_device *hdev,

 	if (id->vendor == USB_VENDOR_ID_APPLE &&
 	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
 	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
 	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	      hdev->type != HID_TYPE_USBMOUSE)))
@@ -868,21 +882,27 @@ static int magicmouse_probe(struct hid_device *hdev,
 		goto err_stop_hw;
 	}

-	if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE)
-		report = hid_register_report(hdev, HID_INPUT_REPORT,
-			MOUSE_REPORT_ID, 0);
-	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
-		report = hid_register_report(hdev, HID_INPUT_REPORT,
-			MOUSE2_REPORT_ID, 0);
-	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
-		 id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
-		if (id->vendor == BT_VENDOR_ID_APPLE)
+	switch (id->product) {
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE:
+		report = hid_register_report(hdev, HID_INPUT_REPORT, MOUSE_REPORT_ID, 0);
+		break;
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2:
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC:
+		report = hid_register_report(hdev, HID_INPUT_REPORT,
MOUSE2_REPORT_ID, 0);
+		break;
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2:
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC:
+		switch (id->vendor) {
+		case BT_VENDOR_ID_APPLE:
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
 				TRACKPAD2_BT_REPORT_ID, 0);
-		else /* USB_VENDOR_ID_APPLE */
+			break;
+		default:
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
 				TRACKPAD2_USB_REPORT_ID, 0);
-	} else { /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
+		}
+		break;
+	default: /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
 			TRACKPAD_REPORT_ID, 0);
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
@@ -909,7 +929,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 		hid_err(hdev, "unable to request touch data (%d)\n", ret);
 		goto err_stop_hw;
 	}
-	if (ret == -EIO && id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	if (ret == -EIO && (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+			    id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC)) {
 		schedule_delayed_work(&msc->work, msecs_to_jiffies(500));
 	}

@@ -945,6 +966,7 @@ static const __u8 *magicmouse_report_fixup(struct
hid_device *hdev, __u8 *rdesc,
 	 */
 	if (hdev->vendor == USB_VENDOR_ID_APPLE &&
 	    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
 	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
 	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    *rsize == 83 && rdesc[46] == 0x84 && rdesc[58] == 0x85) {
@@ -971,6 +993,10 @@ static const struct hid_device_id magic_mice[] = {
 		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC), .driver_data = 0 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
-- 
2.49.0.windows.1



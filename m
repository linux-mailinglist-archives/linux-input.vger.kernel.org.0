Return-Path: <linux-input+bounces-11577-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3401A825A0
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 15:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4351A3BD7A7
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 13:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6E125E820;
	Wed,  9 Apr 2025 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="IbDS8paU"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010004.outbound.protection.outlook.com [52.103.67.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896C29A0;
	Wed,  9 Apr 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204380; cv=fail; b=Wf5oQEzbFWMFBY3Ytr82j5Nszp4ZAYTn4twA2JVKPkOs9wP68+fe0291EkSpc+B2OtcAaDPoB0VxMSvBic3YoMrnxnBHH/Njeo/51vlGVbzvoUKEF/FAH+vZvTU4TAn0dNm5QEcI13J0na70aRYeECqFWXRW+Fn4RTmrzbZxUe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204380; c=relaxed/simple;
	bh=kWnkqGmb4g6Askmybg+1eKZXKnBANORnQqKnQWrsO64=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=lBR5Ua+GlGt+UisZUmrQMqs4PsjtnvsVMv9XE3g0U7Kn4/wtrmjPltK7YQPQ2fol3EVNilW2/IEjr9fCXxT1sdnZ46JXMrgd9EcER2jUrN8IXW0xB0tEe55r37bAX52mUqDzCUQIxkd4Let6YqmiNdkpiDBL7QKvLT+uPcAX/Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=IbDS8paU; arc=fail smtp.client-ip=52.103.67.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZA531R/OxUKZqFQvKEWIsUhk5FQGP8bGxP9ynUOMy6haZYHC3CTeXzSHxrWHLGPcUH8aHHJXzCVOgenl3pVgkOTV4D03BCetttXp7BTcnRd7wlizfX5Sa3KxAfo71Tj/IZjpCFfl6u4JudV9WKzBlbf+Z9bZ2ioCVLsuy37+H/AUHSqb7OikDMSh37Dwf6t5WmiNWRFyxUsO4jhf5u3UdQpulj8GoqikcluLSSW/BDef+jLtfCsIAmZ2GTkmc6zLW8hme3FHa2iffk9idNSQrf5st91xSwhyCJlkFzMIwdRTkv/XICWaHPOEqDONiYYNW4lkc4L/eaAvQbnvU96inQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xbdb3Q23KDbzMapeISquzFQrHEt5ZEKz4vyQX8oNvk=;
 b=tmJ0aaOZL/5jNahH80DewuhJG9YKgP8Z/7Ohv9DzVLPUhIT9BSY8bu5019k9q7NEilQUgLIXFS5iaV9ASLx9UPjhgnH7izafjylzxh9VlxlZXUrSqhnBFXkRhjJcI4Gkwm5ccWcHwxWeQM1Ka6/JGmw3lJ7Ili3pVxf3rfSVx9s4/9p4mVwuRf9ryFys2cvAmzZfND7bpJDgMD5+sPN26bRNxB4DUwn5GL4XwSnVDIOSLGPhvkkEThqVIw4Lgf1qsQj/AYOcRX/lbhH1QaZxxi3dtzsl8FdQt7dofK9Lu8p6HJb5HrxSB1Wrdi2er0NWf6BMcMAXpvmhwQLZ1JXOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xbdb3Q23KDbzMapeISquzFQrHEt5ZEKz4vyQX8oNvk=;
 b=IbDS8paUFxEuOpp6qqg14FKg7e93cUhavDZ4uxUlfLLaL8CPinUnPqT+YIzXUu+u6u7PgnNQc2XLz9dC0/63xCpltBruVxg0zSjfaHwmOP72dssOCG4+J/os8qqgVGKX9Rd+WeSnGTCyfdfW2u2Xz2SDfYSCH1+2CnWwNG2UhW48QGPX1qU1Lq8uFYwowrRh7e8EczisXsQEIFf+L8b/plJqEKlcLT8g96tUPaw6nzBHohjCNYcIT9ENLVce7RCEU8fXkLMD7+MCJAu61IQYRdUkf9SnRoTDKeB30Q+lC7xdBVB/2hW5jGq1BYbJxyx8fNy77dMslUgTH7lSh9+gEQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8936.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 13:12:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:12:54 +0000
Message-ID:
 <PN3PR01MB95971412A515ED896F8536E6B8B42@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 18:42:51 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>, jkosina@suse.com,
 Benjamin Tissoires <bentiss@kernel.org>, benjamin.tissoires@redhat.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-input@vger.kernel.org
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH RESEND] HID: hid-appletb-kbd: Fix wrong date and kernel
 version in sysfs interface docs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::14) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <3f46588b-3c65-4847-877e-b6a2d3f7ac7e@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: d59d15f4-e7a2-4bb9-ad73-08dd77683d01
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|5062599005|19110799003|5072599009|8060799006|461199028|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHg3MDBUdHViR3p3dVliQWJ2RzdoR1dnUGN1N21UaFdqWmpnczJPVitRVmxZ?=
 =?utf-8?B?REZMUjdCSzdxQmlNcFQ3SkE4Ylpab2N2dzZnY1Bvd0VCK2g2NTcvb0NsTUtT?=
 =?utf-8?B?b1ZzMFV1NHAvbGZBakxaMTVGbnZ6ZTJNbVk0emEvU2pGZnRSSENwRkQwMDJC?=
 =?utf-8?B?TkhKemgrWkhjUzg1bW52WGtObDlIQnRjWnhobHNpVXl1R2lBZGZGb2N2UXEv?=
 =?utf-8?B?N2ExelhBV0RIc3Nxc21JbmNVejZjZDJCT3ovdzJETUtyNTl5aHd6WXNXY1FX?=
 =?utf-8?B?ejVSR1I2U1BscTJjNXNjMTB4NmIzTVB1aWRLMVpTQnhXOGtUaGRLeHRJc1FT?=
 =?utf-8?B?UWdBblBhTUk3WlJ5REpsSE1iOWVTNDRvanJHMXVBRWF5ZUNHV0MwQ2p1WTBh?=
 =?utf-8?B?LzI5VlV5cS96TkwwZk9Bc2oreTJYejlSblFYZlBuZ2NIRXAva3V5Z2hEWlM1?=
 =?utf-8?B?T2NXL0s3cGZwYnpZdDhLQ01YRzh1NnZnVmhKaUJJQ1dwOERtYUpFcEN1dVhR?=
 =?utf-8?B?SVJDdEVocVQ5akxpMnoxZWZSMEpkbU9DOG1rclE4d2V3UW51MFp6ZlJBNm12?=
 =?utf-8?B?ZUJ2anhkcFo5QjJobUg1dmkwMnkySHJKTmhENFB1MW5uV1cxTk9LQlNVU3Vk?=
 =?utf-8?B?bHVVMm9oRWNsaVNwTFhiejhGM1d0aVBqN3V2Y05TZWgxN243L1ZqQWkvMWZ4?=
 =?utf-8?B?OWZ3SFpseUwremI5cHowNXcwdFo1SW9UcVprZzNKR2pwbTlZVGxMNWx1SWdn?=
 =?utf-8?B?TTJITDQ5UEJwSWxjZVBuNktrRXYxVGVadmp5allSQW9ETFlUWGNXN0tiWjFx?=
 =?utf-8?B?SGg2ZFBwVGFNTGNCMXpnbzVVUStKWTQ5SXVtQ3NEeE4xR0ZKZTZQNjhySEMy?=
 =?utf-8?B?eWhubWp6S1c3aXNhbnhKZTdyS2JGZUROZlFDL1FQVGJtSy9rWFFSM1BTV1B2?=
 =?utf-8?B?L3E3b0VMZ3BQRjBrSjhFc3BjY1FrTFBrQ09zcnNkNDdKWmYyWUVGTzA4Qk1y?=
 =?utf-8?B?K2N4bWhRU2hiTFRSTFhUWlRXL1A1d1Z3RG1IV3krWmtlTy9wd1lualJLbWV5?=
 =?utf-8?B?Q2xjdHJuY1o5MVByMU93VWNPNEliUDNJMTRZa3dua3diSjF1MkNNSTZabjJL?=
 =?utf-8?B?anVzRVFoQUVBTWdTMm9JRzcxTTZncWJCYUhIc0hoTUxZQks3ZUhGRURJaGtG?=
 =?utf-8?B?ZDE0b29QaUJQOG9Gb2hxMUhiMmNuODZLMHJMOXNmREZ5UXJ5WnBTN0VXVVN6?=
 =?utf-8?B?a1F5VVhIOXE4dXA3QVZ5RHA1QThCL1NOVE5sY2twdWxTQ3Ztc0JtQnh3NHo2?=
 =?utf-8?B?SzNUT1FkQzVlSGNKSDlTNG5LSVFhSWNMOWFva1g4WEFmKy9xRHhTRkhaZE1p?=
 =?utf-8?B?ZDc2UWtmbElKS3RYdHlqWEJkeEViaktNS1ArL09LRElrSGdjTkVlbGtPdmtx?=
 =?utf-8?B?MVV5OWtVcEV1UjNsVThMeEI2WDRjenlzM1p4ZXZiaWZHYitXR2hEa0daN2Nm?=
 =?utf-8?B?OVdNK1dyL2NtWHRDQ214VE80ME1RempiVC9JWTd3ejlGdUUxSjVtTWtBOE80?=
 =?utf-8?Q?ZvnSyyu9ffjcE+YWGfHyqiouE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anUzdU5qSTgrcEdwTUxFVFhEVmJvSEF0ZjFNOTB3ZEsrSkN6MXZlNXkydnlO?=
 =?utf-8?B?Q1kzVmN3b1JWUWQ0VHNHSTRvRTA3RkM1eFN4TWVRZDNkdllwVVMveGxLQ0Nz?=
 =?utf-8?B?Wm1wd2xKZjZqSGhVeFlSSnF0UEhGMW4wOGxQanpSc0VuYkpuRlFjcWkyRDNk?=
 =?utf-8?B?VzRpbFBPMTU0dHFTc2E2WktxUVdTK3lnQU00R2ltSjdpWXNKdyt0bjhZbFZq?=
 =?utf-8?B?QkVaVFZZbDVNbDArYUw0eFFmNVdMRXZhZGZwWmNncWJCUHc5OG5iOEpFd2Ez?=
 =?utf-8?B?UTdJaVA3eGd3cEtTTHVQcXhNUGM1dE9SN25hZk1nRlQ5OFl0OThaZWFwdnVK?=
 =?utf-8?B?SEE1Ulp5M0ZEcTVnR2laOUhQZFdRNGVva09TTGV2Zk53UEN6VlhhNXZ0V25u?=
 =?utf-8?B?Rml5cksvNWVrLzd2czhVdy9ieGdFS05FQm1kY3pjNFRTYzRBeVdMOTZlSUxv?=
 =?utf-8?B?QS9VNW10VTBxZitNcDkweHgrWTNqNFBaamZ4aDhaYzRXVnpuT0E3SXRqUkFB?=
 =?utf-8?B?dTNQbHh1YlZmUDk5NUR6VXlid1pHdmg2Y1dDUFN1bzZJQkN5TEtCdVpQTUMz?=
 =?utf-8?B?aDJlYnRTc3g0Y24zYTRwT3hLL3dSbVFZSHdocEY0dVI4aVI0MVgxY1I2VGIv?=
 =?utf-8?B?SkE0UEdQaVU5MHE3SnJjaXBOSHVTQWdxS1IxT0dFK2dPbXp3S0phVkhwVFdZ?=
 =?utf-8?B?V1lLakowMHM0RTdQSlNnSW5NcjhWTG1VOFlZc3ROREV1aWJzdVh3eW5jVmtB?=
 =?utf-8?B?eFlEY09vRnlkTmJ1VTFDSTFmQ3Z0MncxUFd4TWxtT3BXWG54OFlqOXg3WldB?=
 =?utf-8?B?WFdzcEJUYUdBckxFSVNtTjdBSnFXWVUwRGVUN1k4YWNYM2xNM3ovVXMxcHZ2?=
 =?utf-8?B?K3ltR0pJNHNVOG5tVGV6Qi9DM0RFR05VWVNuMHR0cFhReTR2VDVOdzRzUjRp?=
 =?utf-8?B?SVIwYjR5azZoalN3eGdOVkVyVkZ3WVpaZ0lWVWExWG9udGp4ZW1RM2d2RFVh?=
 =?utf-8?B?d1BKelJWbU9MZmdFbHJFTGo4T2JiMXg3MDNkemRyL2dQTWI1cXZGRFZJQ1dN?=
 =?utf-8?B?VGt3QXc1YXVBRkNTOTM1UFJoazhDcTN1c3NaUnJpTUw5RnRjenF0Q0hucktJ?=
 =?utf-8?B?R3Y2ampnUXcvemt1YUM5ak9idHFsUmppQjRNcktrUzB5NHdVVVFCSDh6WGN2?=
 =?utf-8?B?alhYblkrWEJwRnN5MU45c1NPVUhVU08rOVRueWtpcDV6Njhtd3VQbFYvbjE4?=
 =?utf-8?B?YWw3UzNIRzA4NGJPcTEralNQRzYzZFJaYktzdXlZN09mQll0M1JIVWxuMGpn?=
 =?utf-8?B?T3Y5b1VPV2cvS2RCNzk5bTdxZUhLUFM2STVmRTg3eEJQd3F3WmovWXFRam12?=
 =?utf-8?B?RWo4TjFMdm5PeXFuenV0VDloaFAzWmYzd0U1VmRQVEMxbGk3T3AvaURVUHVt?=
 =?utf-8?B?ZXRqSzA2MmNPK1IwUFUwdlZJZjMxamltMWpWNFgwb2YrOGx0QmgvTVltV2kx?=
 =?utf-8?B?UE1yUW1WOW9xNmZzMERydEtaY2tZSmRCUVZ6NWlnRmQ0Zlo2TXE1YkJjL050?=
 =?utf-8?B?ZFU1eGNCRisvOCtjQm5PRGtLM2Q4MkRzVm91Z1A1Kys5aTVpSTg4Mk5TSFVp?=
 =?utf-8?B?MHp4U1VadnQ2WUw4anhsY0ZFUVVTNmR3MUl2NlRxN05QQUdaTzk5OWlrNmVQ?=
 =?utf-8?B?RWZ2TXh1Y2RRQmplWENpZys2QUYxSS9KRmtiSlFZSVlndkVNZ3hXWi9uc0Nx?=
 =?utf-8?Q?Q1wDuUM0S9W4coeZ4RPLRg7Nj2quEb+RRES0bN7?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d59d15f4-e7a2-4bb9-ad73-08dd77683d01
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:12:54.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8936

From: Aditya Garg <gargaditya08@live.com>

The driver hid-appletb-kbd was upstreamed in kernel 6.15. But, due to an
oversight on my part, I didn't change the kernel version and expected
date while upstreaming the driver, thus it remained as 6.5, the original
kernel version when the driver was developed for downstream. This commit
should fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
index 2a19584d0..8c9718d83 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
+++ b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
@@ -1,6 +1,6 @@
 What:		/sys/bus/hid/drivers/hid-appletb-kbd/<dev>/mode
-Date:		September, 2023
-KernelVersion:	6.5
+Date:		March, 2025
+KernelVersion:	6.15
 Contact:	linux-input@vger.kernel.org
 Description:
 		The set of keys displayed on the Touch Bar.
-- 
2.49.0


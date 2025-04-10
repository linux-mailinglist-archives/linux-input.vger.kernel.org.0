Return-Path: <linux-input+bounces-11723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89842A84C5D
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 20:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B395178ACF
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 18:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4481A1EB197;
	Thu, 10 Apr 2025 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="UrCs/oFu"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010011.outbound.protection.outlook.com [52.103.68.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B51E5732;
	Thu, 10 Apr 2025 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310729; cv=fail; b=RVE1HWaYwb+wlUEbROZLo1Tm8350Hvy/Xiz99zxN/BGTSIOx+5HT7kInmkiQcypP2dc1xETqJOGu3MrJe8+UnwOr2nqgi3wBtGkYF9oOeHZEvuhzKiNIm+A7dmThXinyLOQbbQ0ywzKKwIjENwPEA+30G68DeWqftb+TSDU6wZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310729; c=relaxed/simple;
	bh=8/uMRBh3mK796+LKtfMh2T6yfdl7GLGGRlyEhsLeeyo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eZ8wKMxvAlnxmHQVPcuVw5YWJg0LMke8y6hIe9zdUqUhm268R8XjAkoMrEc+xn3n7VZNtV+99O+Cz/7YBTnhwo5GCsTaQ/RhH2IE6xtpF3HDcI2scJyM3/RsU3jXIHmZ/G9DhdgPjjHOoXbOk4haWuHjQEdGSiMlywqdin2mde0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=UrCs/oFu; arc=fail smtp.client-ip=52.103.68.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQBWjMsmmh6DplVlT4HdOHY4eKPTS7REWcAnx/bLeNqluDkQ9JVJPG0ab5cAo5ofr+4zt2A4fauN6CBnal5mfcoFDF6VMuk0E+ovtxx4mmqTRHgeXcyJVwMDPEHQLs+M32ZThfRDHdctDk1YnxQc6bHUkXqQeTLEdMfA8HGHYHvJC/BFjf1ROHmW1w2GjEVhIPVuoR0+4FHjW1aHnuSVoRne0bkcEWGvv6Z6W9YIyvH7cc0khQ1wo9/MpcEKCYjAvs4+kUm70QhN4iVxbtK1nLOACoyI2Z1T043sY8D6Tro0dAtouGn7IsvI0o0wKR6wR3iDb6+U320iqjHTkd8meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYYHBv15Cr/EVMsakWkXkgVhCcei5/+8+zGzUiU2emo=;
 b=q89QGvCv6lBEakykCnsTouxuseFTmJEw9T3fXO4srhPmjWQFm136UE+RhiWGe82EVrBvWSZzkS+4zn8Dqx8jMEXTstNmCT7Vg+Qoyaud11SkpRk8Obun9FoV38uZ9PTsQCAvlpACGq/RpNlrp3OoFsBWObUC9+IPoSZ09HgI47MlvnUofvts6B8tTmAPoAquI1uXJJ8ObVJWaejDOmqsOrOSqEFTfxrx4g/5xAudGuuaJcK614BuNQwP+a7MZevtAQUyxMFt/M7+A2pwnpfLVnvZ+rXqOurR16yq3s83EQxySoYLWfHUZz/FSnTyTHgcXpvsKXYpHZkXq/ynN5RNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYYHBv15Cr/EVMsakWkXkgVhCcei5/+8+zGzUiU2emo=;
 b=UrCs/oFueMKIUupbozaZJj2/Wl32RptLFlBXQ5onK6IKxB7dkmwvyWAKjwAmV1+WE+vpcB3QIC1dWQ47vbyWyKYphXIJHai24VMvob07A3gLeH4h+2URHvMzU9UO9plK564+lojUxRu831YFAkkzCZwJVZV5PYA+NS/FsNgX3uLyjkKKYOlVtx4ZVf6G8YXmsZyIaQuBQjfEmVy6v+lmiWGr4UhL2CMVaS61aCg+G9C98TNi0DP0YHLKDdV9W7zRo6/zT49o09vVVE/i7aX+tfyNeiNXiDxUwi8lK+8j9UzRKo1Z1H6FWdxqA8nbWOfGcCGNKKx6/aNh7wbH/M3zRQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB8880.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 18:45:23 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:45:22 +0000
Message-ID:
 <PN3PR01MB959728B1D8580588F0C1ADAEB8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 11 Apr 2025 00:15:20 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v2 5/5] HID: multitouch: add device ID for Apple Touch
 Bar
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <PN3PR01MB95973D930911AF73E262F299B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB95973D930911AF73E262F299B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <7d01b937-ccdd-4916-94fd-3be8545a9f69@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 66107ceb-ead3-46e4-4138-08dd785fd9b1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|19110799003|461199028|8060799006|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WitLVGJMbWl5Y0U1OWMrUWdGalhESzhsSjF5M3E0a24ybDdaMXRaMU5HYURm?=
 =?utf-8?B?R1lPdUpyTEFKRzU2SnJ1UmM2R1dySjArK2cvTGJDQ2g5NnBVV0FsS1o4MW1U?=
 =?utf-8?B?eVBwZnM0VVR5cXZOQldNc3RuMW9VeXRXdFNRaE95TzJ0dDEyNFFhUFBwNGk3?=
 =?utf-8?B?MUFzRTdvMXJsZTNtV2xWUWlKYXBwUWVEK1pmb0JUN25CYzJveDN6eklmUm9O?=
 =?utf-8?B?ZVFWVVI0Y1pSRTU3UE8ralJHajUzbnU2K3U0cnh1a2JRSmh5M0p4blVQK3d5?=
 =?utf-8?B?SWFRcW95Vys5bHgrVTBJbWMwd2p6YjdicUlBbExaOHRPT3JMQVk1SHkrQmpp?=
 =?utf-8?B?d29tN0pTcllWcm80WHQvR0dHTEdEdEFIc0lRd0FoRlk0UTJjdXlFTmMybERX?=
 =?utf-8?B?OUFHd0FXWGtJM0w1T1lYaUdHcVRYZUJHK2l0U2hwK3hKWW0xWkpLOEcxQjdz?=
 =?utf-8?B?bmlSS2MwMU1UcVkvdmx1bnljTHQrUDUyeVE0OUJ3K0FkVWNPQ2ZyNG13RWtQ?=
 =?utf-8?B?di80dTZtWVJpUUFHdHBRaWRlK2tiZFp5SldIZDQ1MWVvNTdvaXl2UzcybGJo?=
 =?utf-8?B?eXc2L2VPSE45NFlielZLckQwQlFWdHVOTm5TeDNHSjE2OVo3NEwvMUJyQ0J4?=
 =?utf-8?B?bjNSL3h3VGs2S2lVRXBMSUhrdWxsY3ZUSzA3b3hnZUgxeGREVWc5dHVtNldR?=
 =?utf-8?B?QmZhODRFMUtpSGVoVG9ZSitjT2U3QnBDU3UxbmJkMmtYMGxkN2tQamtUb1dl?=
 =?utf-8?B?Zjh6M3ZCUWhUTnhFdG9INVp4NW03QjdpVzdHam1iRlg0NGdSaTNzbi9kQXlu?=
 =?utf-8?B?MTdEemZQUDVoL2NXcktsODMrMHdzRmM1c3k0TGRnMndGYy9mWWZuSGlZTlZW?=
 =?utf-8?B?RmsrekRxbkZwb2VkTEVFK2hrcEF4aGwvN1VTZkhIUENpcC9qQXVhKzVoa0xH?=
 =?utf-8?B?ZUF3Umt0SHFWQVN2UERoSm5NYTdNWWVLRmpBb21CL3FHcExLdnhlMnZ5SHVu?=
 =?utf-8?B?SXFGN0xVUWdQdUVVOWdGbjVabVEzeXUwOUxJL2JxdWFKNVkvWHRobTRVK3Fw?=
 =?utf-8?B?V0pQTnR3cmlpYnh1QVdCdzgzUG9adGtsaHN3ZVdFd0hnMk5UZE9rTW9EQWhK?=
 =?utf-8?B?TnpsUzlwd0s5QVpUMGp4ekxXaFJMdUtiSFRUS0dxL1UveU1qMVgxOTR3cFdM?=
 =?utf-8?B?YzZ5TnFhSk1FMXBYM3BScTBWejRkeXBZc1FzQ2czT3VGdU10YS9HMEZKZi9I?=
 =?utf-8?B?UXdWeXJyRDFhNGxHVy9CRlUzWFFqcmxzWlBrdVk0bUtpY3RBaXdtdVBIaFhp?=
 =?utf-8?B?RkJNRXcvRFY5enhwbXhoTFNJSHZvc2wyTHFSUHViSGJtWmVoT3pqNWVOZDhI?=
 =?utf-8?B?ZXZHQi9mQXlWUXhFZllMT0kvUk5NVytySGNHbW9qWW1xbEhSNHpSU05qMG5z?=
 =?utf-8?B?ajJTRnNkVzNOZFpUZkt2RXVwbnpGNnRPV0ZBZm5KUkF4YUNrQkNDcXp0YTJF?=
 =?utf-8?B?RFBLWlZuL1NOS3RMSUJCMEl0VEhqV3d0WkhDVE1CMUthZzRnZnlVZVdPZTdm?=
 =?utf-8?Q?OF42w+v3dNEPIMN0Swszb7J9A=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi9IRU5WMVd2UDFPaDBwR3NnbGI2RG5FSEJ2a3orZXlJZ2kxdWI0c0xGbjV0?=
 =?utf-8?B?eWZNTHpEN3VFSFBYZUpFUy9XcTVPS1pyTDhDTWhqU0ZnMS9vVm9pVzVVV2I2?=
 =?utf-8?B?WmlkSlZkajdyd1VGS1lwNGcvSE9Bek03L0ZFOTdST0t6THlaY2RZcHZrVWRi?=
 =?utf-8?B?QldlZjl5ZkxWaWhML1U3NjhuZDBMSWNTNzNWN0ZJek5MODZMWThHUEFSbk1I?=
 =?utf-8?B?NmU0N3h4UjA0ZG9kUzZzeGpwVDh3QmY4SlU4aVdoOXluVWZyRkhRMGdCdVZ3?=
 =?utf-8?B?OWFwWlE0bnZRVU1Gc3BIODdhd1gwZDdWQlpiZlIzaW1SZEpEMmtKT2JFbVRr?=
 =?utf-8?B?eFBzeElnSU5kdkNUWjFZZlJnSXVzMGtleXd0Mmo2SjNHTTluVThiZEZYa2xF?=
 =?utf-8?B?K2NuRDNGYXRjd0I0NnVIaXlyeTZjSjBSbGw5K2ZDWkhnUGRmMHYzazJxVTRO?=
 =?utf-8?B?RjRLV3o0SkxNSHVtTWxreDNKTkZKSmc4VzcvVm9EQW1HQ2VGQXE2em9lbHFU?=
 =?utf-8?B?d3VydFo4RFZyWlJVRkRNMGdKTElYMHNJRHN5T1huMHRzVnFqUVZSc0RRRXFZ?=
 =?utf-8?B?clZpYmEzOVY0dmIxVmhlTjd0bmJPVnVVR0dzVElKa1o2ZVp6V0ZIc2VsMENU?=
 =?utf-8?B?R0cwbzBCcVNFQzlqSm1nT2FOQnFNcXc0NkFWNWtYeFQydEFlUldYRkZmMWNm?=
 =?utf-8?B?Rm5mb2FCMGY5T1VEd29HRS9mOEszRHV5SEwvUUZlMWF2YVlCT25PL1ZzaG8v?=
 =?utf-8?B?N1phaGlvZDdOVXdoenIzeUtnTHZYOVhZelRGN0hHOGIwdDJLVW9NanFUVC91?=
 =?utf-8?B?N3lBTVpLaGluUVQyenloQ2U0QWZaWWRiQndBUno0YUo0aDRPc0pwV0lsL2Jk?=
 =?utf-8?B?SHdkQW9vS2ZRbU1UN0x3TVRTcWFCZS9Mb2R6Y3FBWGFwd1RNMHNVWGtrdkZ5?=
 =?utf-8?B?ZU83Q2hsUzVxTUlRYW80cXpUTVVRYms3NjBsS003bk1xVFZEK3B6OFBxRHhn?=
 =?utf-8?B?emZ2NU5Jb0hUdTdkV245VHl3VlhsMzNWWEVqODg2WnA2ZTYyVEo0VDdXRzdX?=
 =?utf-8?B?aHN2eDdVTE04SzFEMWYyNEJiNzNCMENWUDdSaDc4TjhzWVZ6UWVsaVBoT0E0?=
 =?utf-8?B?c3VnODF6WmFNdE1QNmdhSXdjNXNveDcxb1h1RUtJWEF3bUhHYk93akVzeEt1?=
 =?utf-8?B?aVU4eXpDc3p5WDU4V2VCMWZtamQ4ZUNNWU1nTGpDMkVMNFlrU1ZsNzZXb3Qz?=
 =?utf-8?B?ZE1YNzhFb0o2azN1UTUrd21UVy9Zb2xBMys5QVlCRkx1d2Jkb1pMb2pVeVA0?=
 =?utf-8?B?VkZydytoWkVmck0xNmd5R2xIdWE1TWtrOGdBek0rVDMwNUpiS2VDTGNQZG5q?=
 =?utf-8?B?czJteGRmVE90K2xmYTNnS3FzOHBTeEF5ZW9GTHF1eHhnNFRHUkx5REtacTdj?=
 =?utf-8?B?TVRaY2VIUlM5Q1l6VUNnYlA2VmVmR3J2bXM4VmR3bEZIOG1BUGl3ZE43ODNW?=
 =?utf-8?B?RU5Wa1dLeWFxUk40b2p1UEwvUjFMSStYOWhLVGw0SEliWTdUMFgzOW5rR2lT?=
 =?utf-8?B?NldUQWlsNVIyZGxKWE5PSHhMWERTR1N5UzMrSHExR0oyZm9lZXh1U3NRK1V0?=
 =?utf-8?B?T0FxbUxManZLYUMzc29wVUhqZjlRc25Eb09ZZ2g1TXJQL0R3b3hOTHUwelFz?=
 =?utf-8?B?RUd0eUQ1RnhnN3dkOUpNWkVpaDV3YnRPOWxTcmRyaDlQakZhWU9OemRqYkp5?=
 =?utf-8?Q?ejqOjvEanTNcKWrJIeLmFrZhXjGNqMRXZDpWLTM?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 66107ceb-ead3-46e4-4138-08dd785fd9b1
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:45:22.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8880

From: Kerem Karabay <kekrby@gmail.com>

This patch adds the device ID of Apple Touch Bar found on x86 MacBook Pros
to the hid-multitouch driver.

Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
appreciated.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a50325270..403f4517f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -769,6 +769,7 @@ config HID_MULTITOUCH
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens
 	  - ActionStar dual touch panels
+	  - Apple Touch Bar on x86 MacBook Pros
 	  - Atmel panels
 	  - Cando dual touch panels
 	  - Chunghwa panels
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 66e33a482..41d206f80 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -221,6 +221,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_APPLE_TOUCHBAR			0x0114
 #define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
@@ -406,6 +407,12 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name = MT_CLS_APPLE_TOUCHBAR,
+		.quirks = MT_QUIRK_HOVERING |
+			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE |
+			MT_QUIRK_APPLE_TOUCHBAR,
+		.maxcontacts = 11,
+	},
 	{ .name = MT_CLS_SIS,
 		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
 			MT_QUIRK_ALWAYS_VALID |
@@ -1858,6 +1865,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret != 0)
 		return ret;
 
+	if (mtclass->name == MT_CLS_APPLE_TOUCHBAR &&
+	    !hid_find_field(hdev, HID_INPUT_REPORT,
+			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
+		return -ENODEV;
+
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
 
@@ -2339,6 +2351,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
 			USB_DEVICE_ID_XIROKU_CSR2) },
 
+	/* Apple Touch Bar */
+	{ .driver_data = MT_CLS_APPLE_TOUCHBAR,
+		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+			USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
+
 	/* Google MT devices */
 	{ .driver_data = MT_CLS_GOOGLE,
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
-- 
2.49.0



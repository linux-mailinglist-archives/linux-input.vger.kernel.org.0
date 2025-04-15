Return-Path: <linux-input+bounces-11793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E3A8A3BF
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 18:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CA99189C2B2
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9139420ADE6;
	Tue, 15 Apr 2025 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MIPwdAiP"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52051F5434;
	Tue, 15 Apr 2025 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733566; cv=fail; b=un/qrRIJ9byOxXZ9BGtrC/1g1CXEm95zIkyxCOMpPkEFa4FieNlgD781rY2tN55hQFb65DNyKQL3LEYcwm3hxOyT4xGNocrftFkjVa60zUgjz5rhmJ+IUhrt6QaqY/2uVdQjmI/24qMJFdCHIrGuN25eQDekfnpu1ShNaUzCJ4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733566; c=relaxed/simple;
	bh=5Tx+ToFKEej0FRFLmgCMR9Q+LKDvLFC2UIzpNzM6Kr4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n6EcyW1CF3YQnXG5VfI0xeOPXWApMC3PrJE+mB+W5Xj7btANLkfQC1JApleZ6DYQ4WinjIM5sK2wzWsy6mCVCsJpEZQzriEUIl/Sj+IGIatuVuCSvkvNY9SfWFp5O4Awb+l6sGTzvTOHTgB1eCBpHZCExfdoHNfu5YrD0EteaQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MIPwdAiP; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMtapFSx2Xcf8F40M8xXZw9euy6k40O946dg3STUEQwQcgd/MvJ1oO816jqL5usnTF77YkS3uEn61WHdWBigEERyr/eLX+LTAeBzKADDT8U14dxAH0HgNKmvXHC+plQBkSCFrVK6YPaevtEc2epUWenw0l1Z0MzVFNDhcPo7WM4nmmeCInIZOea0vSUe6eOqi22d1uHlqkKBIFhtWxEVljjhvyupWKeVy3AAQhTjG81y0QysN4IA6FVIJ1BKh4b95VNVTiYDu84h5IOqMl2UvSldKkC6HUGKVfcQoff4Unxt5E/4yZ4tl2oSVRr0apbJ4bMfELwN38JMHEXB+6NOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwptqMdlGzxr66m2sTe3iqOC8vt3EIf8xP4xUDidl1E=;
 b=k2cZQKGswFx2TQiuJa8AIkxMFyPcLHEHXounWUC0MWGvNTKl54+oNNw7ZufU/5MOm/Ju75lOS5hz30mIDAHxChx/Mof/ddrusbXZPmbtzB593s61kC3jTwivAFpmT+IelI22xX2/kIa5aRnHn2maLgnqigzaQ1pkHD3rh6UTWhSj+4f+Yh7XrjLYIwfOnOOeDtsMeCbwtUj8kFeWFu6b/LDbk2IUYTH44TL34ImZFGJSV7wKLj4b7llUGhxmHivbWSMXydzd29Mw/GHJ/x/ygRDpEMOnMyssuyOuMBAooOON4aAVCxxmuWZpIZdSZkaLYExL23hWg+q9+c/IEa44Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwptqMdlGzxr66m2sTe3iqOC8vt3EIf8xP4xUDidl1E=;
 b=MIPwdAiP973I8/ZfLGrRQxbyHM8jI31tNsWwZXShmsHr6EMFbfzPWgzsNaLCy7WuZ9dlVlGbyckqHsItbOV5hQysdMqyF2TdV6fGmFxPi1wAJbqosLeYOfPc3oSFReV0c0gKS6oe2j9J9t+ABEJgnSaHuvImsGv59y45qdMZmNBFzZ53MGjWxWa2Lv3MU1BJvES9BdeKjq6Y/kEgzm9N7hvKqAAhihCmeIo3XmsiUd7BscsDU+Qpi9mDoRc1nqYg1BYnrIr3ESGbW7WpFRiYvNLAdWqtyLVqLdZtllrhmCx8qGNiQ78TXxy/NBmEzKdlkGLLRQGhyl/nwye8qRtCpQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9735.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:12:38 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 16:12:38 +0000
Message-ID:
 <PN3PR01MB959785DA292ABDC730CD78E9B8B22@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 15 Apr 2025 21:42:33 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v5 3/5] HID: apple: remove unused APPLE_IGNORE_MOUSE
 quirk
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
X-ClientProxiedBy: BM1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::33) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <6476b6c8-7b79-46b9-acfc-b562f3ce63b7@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2f9e61-3e94-473d-9168-08dd7c3855ef
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|6090799003|19110799003|5072599009|15080799006|7092599003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0hFRmdRejBsV1BxeW03dGVHbXZJOWt5SXFzYTk3YVFHZHQxRWc1SU85a1Z1?=
 =?utf-8?B?N0NxZmx2a0dSYmZWQUVTb0hLVmNYU29ORjErMjBSUDJGUDBsMm5UbTZVUUtB?=
 =?utf-8?B?REJLS3Q3dUY4NWVRY3hrbEFyNGM2QXlJN2IvZWVNVnUrejRuQTRpb2dkK1Bl?=
 =?utf-8?B?SmpOeXhadzRnR05FazhFZzg4MW5IRUhDUk5OaEdYamJLZFdUb2paN3U2Sk1z?=
 =?utf-8?B?cHVvNENxdFJyVVU1WkpOS2JoNHN2K2N2WDhDLzlpN2lRVXJXTUhqTDlnUkRD?=
 =?utf-8?B?Mmd3dFFxRGJrR1FhZlVVeHFyTnJ1cGwvdGloWHVuSVliOGhULzJQbVo1bEhU?=
 =?utf-8?B?aXl1Y3I3V0o0YS9IMzZTcEhwQW5EVUc1VlNJYWxXSlNpeUE1Ny9JVVhDTktE?=
 =?utf-8?B?UERWeVFFNkp0SWVRcDN6cWg1bzdKRFpoUG5Pb044Qm4zL3l6TS9sRFdjdzFI?=
 =?utf-8?B?QnpmRzNjNnpJTzJIZmNLeTlVenR4NXBjNStTQjdBSFVJWUhpa2l6aW1WV0NT?=
 =?utf-8?B?Zk9ubVNvRWswcXhEZ0RvZS9XdW4wSnZHZVhXdkFGUVBsYzN5T1FKS3lVMXFW?=
 =?utf-8?B?UWpBOUR0K3FTRDhYVXp4VlRIYnkxSEhjWE5nVk5ORFRBQ0dJck9Nd1lOWmNF?=
 =?utf-8?B?T3JDWEt1N1g2MVdQVGVVQm5qNjNJN0UzNE43d2RYSmd4OVJFOEo1T1hZVzhC?=
 =?utf-8?B?bjdDZG1hcTB0c2RpK1JYMG9uK2FtSDVmbjhnQnlXWWE1aXgxb1lZaGZEdTIv?=
 =?utf-8?B?TFBCUlFIQ2VONGd5ZVFFOUVzeTV0NHlZbE9rMUp0UG80bDNMV0thSGtzSWNE?=
 =?utf-8?B?VENYUmFZcjVRQ2hGMWdWNFF5ZklUck5xdFZVeHk1UmFlVmsza1lDQ3hmSDFY?=
 =?utf-8?B?cUNOWVNmY0FjL2x3UTEwRmpQMGNSQWlBbzkvQ3lpd2tCMUlYRGJEbkNjYUZJ?=
 =?utf-8?B?ZDVTNzBEY1V3NFB2cTNHNGdySWtRemw4VmR2TEdRTnVibmhub1RtSjV5bklG?=
 =?utf-8?B?RXZYanlFUmp3alZpM25VZy9mdTR1UVVTZjl5TU9mSUhkVEE4NHgzbFNRKysw?=
 =?utf-8?B?Y2J5QU9rS0FhZ3k2NEdkMjhQRTB4SmQvUmVBeGQvM2hDeE9mU2tyZENLZXBZ?=
 =?utf-8?B?T09tVVdKZEs4a2xPRUFrTzVWcG5vSDN5bGMwYUtXWjBHN1NnTVNacFUrODNU?=
 =?utf-8?B?Z09FSTFhajF5WmdQQTlpcXlPRzJybGxuRFRQNFhpV0QrNDdTV0NVdE5hOTg1?=
 =?utf-8?B?S3RQTGhRM2lCMC8zY0UzMXd6SDluUDFiV0hQcDU4TExrOG5qL3ZWTXBRNm9x?=
 =?utf-8?B?aU5BRjg5TWIyYVVqZHlCcVhBVEs3UWlaSCtPOFZudzBVQ0JUcndsZXRuNEpC?=
 =?utf-8?B?RmRxeG5oNjZ3R3pVdGJUZTVyS0JSWFpRRStnWEVFMFhsRHZMQlNmaTJjY08x?=
 =?utf-8?B?ZTVRSjJwMUpZR05lOG9zZ1RnQ0NrUC82M0NDb3Jad281NEN3Myt3Z3ZBeEJW?=
 =?utf-8?B?R3hCazMxQVZmamV2TkNXRXpnWUVYMVprdUQ5cEF3S0RteFB1bzBjVmFxa3M2?=
 =?utf-8?B?ZVFuZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eitmY3dQWExVL3VLNzhGaUdpWUZUbzNjamtOTXR6OHM1M2lQSXNBcDljdGxm?=
 =?utf-8?B?SnN5dFdtRWd5V1BlY0FHdE15dFM0dnQwOXJCYjdlaGhmQmdiVXAyemYvT1Bm?=
 =?utf-8?B?TncxaXVOMTJXdlZWRzhtRnF4SjBMTWRJOWtETGpHNXpEbWpmdFMweWl0Q3Ez?=
 =?utf-8?B?dWoyY2ZNcXl6dWE1S0wwY3VzbjFaQnN1SFQvN3dSZW1aL1g5bG5tVXlYRjdm?=
 =?utf-8?B?UUdmcUJ4UldlS05peE93TkFKK0EwWlNpdUtYR2gvRDZWUjNpZXljdUI5dTE1?=
 =?utf-8?B?c1UwRno0QUpmUzJic2I1NGR5RzVNRHZ5dTZOaTN6R3FoS1ZEOGdTTU9vLzVy?=
 =?utf-8?B?cjFkOElCcnRXRjlwSjhyK0tQODMyRS9FQ2w3bklpQ0tXYVd5UEc2cEdUZENK?=
 =?utf-8?B?REhjL01LUlFlb3RCR0RkaDZ3MEdUK1lBMSt0aGNjMnRhdlBkUTFPYXNQVlNY?=
 =?utf-8?B?eGpncjA4KzcwUW1lRGxIWVJYT2hiamtoU1JFRmFucW9qZmRqYWhYNUYrcGw5?=
 =?utf-8?B?NDRmSUhYZ0VROExtd1gzVDlMencraHNCUHcramNqVENpRldoNUZpRittcS9s?=
 =?utf-8?B?TkRHVlJHZ1ZMQ1lHblRoK1RzMFY0NGhYV3JBcnYzSm5MMEd5UnVWM0I4M2pI?=
 =?utf-8?B?QWp6YmZHRHBiS1EyMEQ5ZjFOZGZ6QnNZTWJUc0tMK3BZVDVRczMzbm9iSnAw?=
 =?utf-8?B?d3BrOXIxTUZwRk5rdVQ4dm9EMVhuc3k1eTdibm9mck50YURNd1VaSE14SG1l?=
 =?utf-8?B?ejlvN0d4UUtwT3k5MEQyU25NQ2x0b1Bob2g1NUNGcGF3RjNyY3R0N2x6ai9v?=
 =?utf-8?B?ekpFeDZ4cFU4QmU0L2UvUDc5RDUwOC9SRXBUZllBeFdJaEYxQWdvdmVmSlZE?=
 =?utf-8?B?NnZRWnBKOU1IUFE1QWhTUTJ6aGdkbkx3K1hpTFpEWDdSNzJ0aDkrQmh2bG9t?=
 =?utf-8?B?cG1IY2VhSGpwQ3JXOHF3ZWkzRHRqZjF5ZXNUcFhZc21uV0dSZnZSREtMMFRY?=
 =?utf-8?B?UERHM1c4Q3piL0d1UzJua3NGSWlHcnErRlZNbWxZMFhhV3RMdXBTblF6K3JJ?=
 =?utf-8?B?dmhrbWw4aHhjc0xRU2ZPZmlzRkMxaThSSCs3Q1dwcVRleUU2RWw3WE1kaDI4?=
 =?utf-8?B?dHpFSHdkeFN2VTZLSnJSWFFXS01Ud20yYUo0MXZ5WFZoMHJUdHZXL1VaQjBq?=
 =?utf-8?B?Q3lqOFBVNWNDbzQvWXZZSC94eXJxN0pNOVJXOTdaVjJyMUFZbmpsc3REcVRv?=
 =?utf-8?B?cVRydk1ZMHJmeGVYOGlxbEpXditLSzIyaDlHSzkvS3IyMzVBZG9LcHBOMnc5?=
 =?utf-8?B?c1M4TUoxSUpSMzJCcm9jR0Y1Q3ZBRm9RM0tGdmtyNUZXTXpNazhuYWNCcUg3?=
 =?utf-8?B?bStSTUVMc2Y5N0JrT0pndlUwRkdDMXdUTXJ2Vi8xckFTWXNhMHd1Mit0cjVW?=
 =?utf-8?B?RnVmRWxmbnk0S2REemRFOXhTQXNnbUZXZXRRQmlZa2hQc0p3WFZCblNHL1RJ?=
 =?utf-8?B?czFiajBKSW5wSktNd1VFWVBVa3V6SlFuYU44OWd2aFhBc0lXQ2NUUkFLQndF?=
 =?utf-8?B?TFVFZjEreE1TeXZOa0V4QjdiWjdRTUR1ZTY1ZFlITGJYd2ZqNlloV1FMWnI3?=
 =?utf-8?B?V3djQkYrdVVVWVNkaVR6V01zM1lJdjRiS1FhcVg1Tk9FK1UySjV1ZjZJTkZE?=
 =?utf-8?B?N2tBRHE2c01aNmJmaS9uNzFablBhWmxmbTF0YUQ5L3NnRjdRRWtXNXQwby9B?=
 =?utf-8?Q?85odZhSM+b81SLK6AVlaThwEVL+wrOpGHP5N+et?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2f9e61-3e94-473d-9168-08dd7c3855ef
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:12:36.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9735

From: Aditya Garg <gargaditya08@live.com>

The APPLE_IGNORE_MOUSE quirk was not used anywhere in this driver, so can
be removed.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3d7befe0a..fde438bee 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -30,7 +30,7 @@
 #include "hid-ids.h"
 
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
-- 
2.49.0




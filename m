Return-Path: <linux-input+bounces-11373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD9A76094
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 09:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FB17188B879
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 07:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276B31C84A0;
	Mon, 31 Mar 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="uieJzZvk"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010007.outbound.protection.outlook.com [52.103.67.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE331D5147;
	Mon, 31 Mar 2025 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407585; cv=fail; b=Hzx4tEPowmeLznVDuBsIdJVDAPVx/HL6sX5BvF6LHlJEYIvTThjBQ0Q9KTrBdMnhOzvK0SuA4jAuZcp1Pb9cTCF6v1Z5FyxSHlZAoMPVeuBiPkngmLBBEuxXyq0b0F547VihemURso/WYv36H2qMv6MFMdLt6DIKdKVFOgp73aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407585; c=relaxed/simple;
	bh=LCk9i/j/BhvloRvlrwVcZXldErQNzEJy0uNCdgACbtc=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=agduN9tk7AgL9opM8nBy0sF/mOE0Yme7mVkKHDSjco7KL4zM+3pmnZUP2qUtpu1KJky/HEWHz9bDFPeVjkBizgXBnHN9BCigambey0eQBBd8Xd+7GUck8kZSl3hGaECKFP6RSGvu4qtjscj2GWicv7NUxehIMJQsjLiYtuoWvUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=uieJzZvk; arc=fail smtp.client-ip=52.103.67.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/LG0vcLCUneSqNrb4EbzcKrD+NiC3XMnN+CPfNuOug8G4sthavSmPNi+1P8r4Ak3TuaNfdZWeMr2UebYSU1BOYGLV0CRqobJWnUAG6MtCwVP2Wd5KjfxvQG1hQePqIDiuW+kamXiZwdlNiZ5Wd+6FJng0Uz7rrusyhTJbMitVJDi6sTFipY1ivnyPOeQpeTz0SwXsBfEaCpZP1/iY1IPXKAOKay4S73bi7hDAF2Rde0hIQczdxTf727z7uCkr6Kc6IhthQD3fAtk1jtrR7HPk0FlLDJtBDYGKCUUBci01fkFp6KNQi2FKuSE0PVnAOapDQx0jdhYdSG0iXVSZXH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfhgnReNOkT4JdoJm3g9gNI4Uz3uOoqKYEDdE0SAEG8=;
 b=HSHrhrCBH+wONAAg5QAQ8z18Wthq/Li5O7OarFfj5r2nudoSqOvlkOvbF+2uC9j/2apMeDHSrv1JD2f3HwIlmnGZzo8Jls+nQH7NnYQ5SY9rqmOeG0tL9L5c7xy3ebMi0pUsA+QyNVHiB+lj/El7hh92bEUQKdOutykK9Z8buwazgBB/Qrmv5DbnfgVfUj1yiilwsDWBxl0w3Lx9EVfsmdFapZLLbY4t52o60yStDmYObmN7oww9AwGX5AvrZY2cw76+FQYdKMeYjPR65EpKqgvmQmZnjC75WMZ+O4SYxhqYB1S8RjiJp3ZA/BvKgBJndoJwO/XQBm9lPFNBR3tnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfhgnReNOkT4JdoJm3g9gNI4Uz3uOoqKYEDdE0SAEG8=;
 b=uieJzZvkK40hgSxjnfGihaXKpCRdDKSP2ZB4cJn5D8CXhricKauPDc77G6fl1IcQjaBsSaQI95DHeGdhr9Z9+ZJL5eOksBHZuP0bgX43HSWp52V78FTt23Yh0nI8mlW7iHBaqni7gyuzR3mEJuBrkVXlPtzCdIIdaF25HtYGVnYcLc6+fSBiqJJrnc24HriII1mRBokR0fBkzUmDrnXBC2+hm5F+rxQYjtlQ6vuVv1IDNx2/vjXe/xYCCW1RP0tco/c594IdKL3TXW3oiezK3ajHzXBCzhHApFMVyBvWye0gJjTXPrCXdCvZCQh+F5LtvqZhjQDbUjK8YuFvgNd05w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8860.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 07:52:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 07:52:58 +0000
Message-ID:
 <PN3PR01MB95973E14FB234C6BCB6417A7B8AD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 31 Mar 2025 13:22:56 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jikos@kernel.org, jkosina@suse.com, bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v2] HID: magicmouse: Apple Magic Mouse 2 USB-C support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::14) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <9f98dfe8-006b-4cb4-9ed3-a1c57b491f5e@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5e232a-5453-4389-66fa-08dd70290d96
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|8060799006|7092599003|6090799003|19110799003|5072599009|461199028|5062599005|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnZWMkdWd2xNdEpzaE80eDRFeHlMRU5sTm91d01jWWY3UmNvMG9zdmhYQ3pO?=
 =?utf-8?B?YXhnQzl2REd2ODJqSmdTdVh2bSszQm95R0lwTFlqbUhXblBTY08xdGFtNFdI?=
 =?utf-8?B?dkVTRFhtRmQ1VXQyNGZRYlBYc1VqWnZRZUM0MCs0ZmZyaUVQbVBrbk5wd3hh?=
 =?utf-8?B?RFV3bE5qbk9WRVpPVG5vc2pGU3VvNitTcE54QnRjeU9UUDJBTk1SOGZ1aDlR?=
 =?utf-8?B?ZmMxMEZoZlcwS3c5RGdwSWZmTlV1QkNxemhGZjUzUzBJUXpKekIzd0pNelYv?=
 =?utf-8?B?MTdQaFM0em5icEZLVGsyWjFTUVhsdXR6S1l2OWFIRjFqYTFoOE5aL3lXRGRh?=
 =?utf-8?B?SFZMbEdOaE9BM3hGbUx0OVZOTVREOHdvQlp1TW1RS0lGTDZnbGwrZ0pGQ3hq?=
 =?utf-8?B?Rk1jZENhMTdVVmtNcW1KMXd5dkN6M3NmbnRGL1hxeU9ydytpeXRQRFJET1VF?=
 =?utf-8?B?TlZTR2NwWDdxOEhOT2NuOUZsbFVjV2VoekJNRnc1dGxmVERlQ3M3a1hRWXJ2?=
 =?utf-8?B?Q0hzMGJKNVJiV092Mk5HM3ptcE1oTGlLaWtKVDZIb3ZFbmQ0UjNtSHhqWC9R?=
 =?utf-8?B?OXh4RzBIMS9Wc0QvVmJCcEp4VDc2Yzc2VHh5Y2ZJNSt6a2pCOGFMQ2gwbGU2?=
 =?utf-8?B?VU8rK3M0TmI5R2xOTU85azhKclBVS2RSem9MRkloNCs3REpPdERlNXlPbzlp?=
 =?utf-8?B?aUFTNElCU25TeWR0bzR1NlJzbGFGNlVYd0FRMlgvTysrM3l1aWE0OW0ySzRW?=
 =?utf-8?B?NGpIQldwTGV0Y0lmR2ZrSWJKQWhLTHBuUFFvN1Y4NkdJd1dpN1oyRjlyaUlG?=
 =?utf-8?B?L3hRT3VtZUpPNFpINGFtT2VKbkRjQ0VpSm9RcGVWUkxXQkxOTXgyTThEVEor?=
 =?utf-8?B?Y2dBVmlCaEdHRGJqK245bm5LK0dabzlPeUxTblpRVHovdXZ4ZUhvaEU3MitF?=
 =?utf-8?B?UW83OHdaUk5FNHBMS3JRaXozOU1BbFhLWHZ1UmlOOHRFaGR6KzFKbllwazEw?=
 =?utf-8?B?bE42MExmSGlHQ3puaU5UcVNEQlJzUng2dUpCWVpYQXQwVXcrVWsvdjRNWS9v?=
 =?utf-8?B?OHBCMkx5N0NZUTVueU9oeEU2Ny9XN3JrZFlsQlZLTDVYeGduakVJaDVDNmJE?=
 =?utf-8?B?cS9naUg3MFRBODVnTlZWVWQ5d2d2OTBYU3h6bjRqdXlLWHZQTWdMVmFwdTBU?=
 =?utf-8?B?REtVaXIrRysyRGZzTjA3Nk9yMFBjN045b1laQ2I2V2p1QjNsU1lXRUdmbTcr?=
 =?utf-8?B?R3BjVTdyQnpoUDRXY2lvaFZpT2cxc3RvZWRWWkFEa3hFNGNybG9pekYvR2l1?=
 =?utf-8?B?WkNpYTNjTEszdDdhTDNTbWxZNytCTlovaUxpM0kvWTlNSWRGOVFqNDZVTnM3?=
 =?utf-8?B?KzY4YWRqb3VTVllYcXRvSVdLWDJIczk0Sk5KM1p5RUVlbWUxTTlRNThYeFpv?=
 =?utf-8?B?anpydFZ5eEUrM1dEcU9KVEZXNGg2L3EvWE4yQmkyQUV2NDY2NUFRSlUzT2ky?=
 =?utf-8?B?QzdtcjM2VVRubjZHME1wRm1uL2JraUJEc01keGJiaUNyaHBWYUw3R1oyc2ZU?=
 =?utf-8?B?bk00K3psM2YvcU5RRGVra3Z3TTdoYk1UbmF5bGFob1VwaU5vZXQwZ0tzU2NB?=
 =?utf-8?B?a0s3KzFqbjBKZTdYY0hGWi9wOS8wNUE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2RUcVhsdWdNWkZmNE1jR3djcjlhenJPNWcveFQvdWtPSSsvTkZCR0x5bStF?=
 =?utf-8?B?dEVnaGVVMmtBNDNOZ01iUWRobUhQZEdZRkthVTVVek85dzB6RXpRZ2d5blE4?=
 =?utf-8?B?ZytqWnBmTW9TVzRTVCtKSGFWS3lsTW1hdCtvWnBrbHpSSXUrK2Y3T0wwNlJu?=
 =?utf-8?B?ci9KQlloQkNFSjMrbGw0V3RYTC92NXovRi9LYndjS3U5WDJwSWJQWWd5TGEv?=
 =?utf-8?B?WkNSK2xuZDY3eEVtdDJ4ZjBmb0NCRDJmVHlWRDFjVW1ZUUZzT2ZWUzlRcndt?=
 =?utf-8?B?ajRqK0dLdEowd2tCc21CSk1BaXh0RUhtMFAzYlV4aElON1ErNkpNejhCV1hi?=
 =?utf-8?B?Z2tvVmFIdDRHNmlxRUs2S2laNEZsbUhkTG1JcmtsUVErUFlPR2JQWnNvYjhk?=
 =?utf-8?B?MUdDbWIwV2kvTTV1elFBNEgzNWtUSmJycndzNjVSUjczajhkL2ZzTVRhWTBn?=
 =?utf-8?B?Q0VjSXRyOXJ4eFNUdVJUdEpNaFh2c2V2ZVZBMks5dUt5dStRS1lQRFBhZmVS?=
 =?utf-8?B?ZVhCaXc5anpleW1JZXptMjlJaW83TU5PekdkbFNyY1VxZ016a1hINU9zM0VK?=
 =?utf-8?B?M2FGN1Q3TEFqMWo4QitLZXFIVm5wQjlMblljVDVyZnltVWp6MHBseTc1WVcz?=
 =?utf-8?B?dUtQSU9DTCtQT0FoWGx3NDE0SXI5VE1aMTlaQjFpRjhWOGtCazJOeDJVdFAv?=
 =?utf-8?B?OGcvbE14bzBqYlovY0RPTkdvYjlaOUJrekpwcXN0VlY1U2JKdjRTd1lNeWFO?=
 =?utf-8?B?bmcxM0hYYXljSTRpM1ZFSEl4V1FLYzd2MXphZ2ZWNkpybXJ6amo2Z1N5TTUx?=
 =?utf-8?B?TzZmQTl5b3g0aXJ3R2x0eHFRTlNObWRHTVZpc29RZ2R0UTlPKzlDWkdHREhJ?=
 =?utf-8?B?OEk3eGV0bGc0ck04WGt5aytaYTFDeVNTV0syU1hhVU1YRk04V3ROdU9QT01S?=
 =?utf-8?B?d0c5WU11ZlVydnQvcmpjbzBXL29MNUl0STF0UElnS1hPTjBtZHkxYnBWVWdY?=
 =?utf-8?B?SE1PN2k0MVFBL1lBbDF3bkVRcEF3KzkyNTFlUE95Z2FScnJqS2o5aUJNbXI2?=
 =?utf-8?B?UEhqdU5kcTZRUmY1Z1FOcFIyVno4QTJQSzJaSCtzeWNUMEVyL1g5VzArWHVR?=
 =?utf-8?B?Q1p6aTdOeFh3dUcvTW5GNTlad2hCUGQrRXdHYURNenBrV1ZDRGZ5ZEd2ZzRP?=
 =?utf-8?B?SnNlakFvMlFCVGkxeVRCTEs1bHg3VTVpa2JyOHFYRGVZTGVrVlR4czRRZUdL?=
 =?utf-8?B?QnZrZjdkZjhLdFdCam1LNmxUb1hKcWxtMkh5S0o2SG0zcDRlcDBzM0FUSVpZ?=
 =?utf-8?B?SW44VG5oUnFUM25xZXRuaHlOS0dIOUpOdjFIWlJBZDQrNHRYVzlSazVUV2pY?=
 =?utf-8?B?aUxsUWY0QmRVV3RoYi9uWk1Kbitkbm1jdERNVWh6L0dtWmhDanJZSFBRdGtE?=
 =?utf-8?B?ZmZYeWZhVTVuUUtkNWIyNUdGYno5WHFKWVRkL0dMRGpSbTlWaStNc1gwVVMx?=
 =?utf-8?B?NHNsVjdQdndQZEhUYi9xcCtZRWJHSWVod3ZxemdORXNqSU16OEZORVhzOGdE?=
 =?utf-8?B?dXdLeGtkU2lTK3RmcW54NEZkbFBHNXdBakh1TEJvVXhaeWNsd0JrcGJ5R3Zi?=
 =?utf-8?B?dXhBMENMb0FwRkRKNisrSVBPV0tRRzJqZk5SRFd5bzFyYTJpVU5waFJad2VP?=
 =?utf-8?B?Y1pzNiszL3JyV2U3dmkrT0ExcXdHVE82U0NCcHVFbWUxek5aWVJZU1dRYm5Q?=
 =?utf-8?Q?IKAfj74bPXcQgUINyMBB7mNzwa7PAH1ZUtxDviW?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5e232a-5453-4389-66fa-08dd70290d96
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 07:52:58.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8860

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for USB-C model of Apple Magic Mouse 2.

Except for the hardware ID, it should resemble the existing configuration
for the older Magic Mouse 2.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
v2: Fix broken patch
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
@@ -218,7 +218,8 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 	int pressure = 0;
 
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		id = (tdata[6] << 2 | tdata[5] >> 6) & 0xf;
 		x = (tdata[1] << 28 | tdata[0] << 20) >> 20;
 		y = -((tdata[2] << 24 | tdata[1] << 16) >> 20);
@@ -370,7 +371,8 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 
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
@@ -519,7 +522,8 @@ static int magicmouse_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
-	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
+	if ((msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) &&
 	    field->report->id == MOUSE2_REPORT_ID) {
 		/*
 		 * magic_mouse_raw_event has done all the work. Skip hidinput.
@@ -540,7 +544,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	__set_bit(EV_KEY, input->evbit);
 
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		__set_bit(BTN_LEFT, input->keybit);
 		__set_bit(BTN_RIGHT, input->keybit);
 		if (emulate_3button)
@@ -625,7 +630,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	 * inverse of the reported Y.
 	 */
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		input_set_abs_params(input, ABS_MT_ORIENTATION, -31, 32, 1, 0);
 		input_set_abs_params(input, ABS_MT_POSITION_X,
 				     MOUSE_MIN_X, MOUSE_MAX_X, 4, 0);
@@ -741,19 +747,25 @@ static int magicmouse_enable_multitouch(struct hid_device *hdev)
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
@@ -787,6 +799,7 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
 
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
+		report = hid_register_report(hdev, HID_INPUT_REPORT, MOUSE2_REPORT_ID, 0);
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
 
@@ -945,6 +966,7 @@ static const __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
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



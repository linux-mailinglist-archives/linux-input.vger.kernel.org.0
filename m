Return-Path: <linux-input+bounces-11718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EF3A84C40
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 20:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DF794C4D5F
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 18:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8882E28EA5A;
	Thu, 10 Apr 2025 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="IvFRmJjz"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010006.outbound.protection.outlook.com [52.103.68.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D228EA50;
	Thu, 10 Apr 2025 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310532; cv=fail; b=YAJ7UOKEsPD34HoHk7JvfxwG4BWi3SqH4dKwBJzsb/n7nWhUPiNPYhOb8lRLDiP1cxlDYH8AjfcMake7sDiiETW6X6ZKPyCBZsj3Rokpy7M04MX67d48+JsCqKCJmKZxguN4+q3TsoMwKMc0fDRIKdeuf76V+PglGAogGT6Vq9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310532; c=relaxed/simple;
	bh=AABUJV60jkoyk9pf4/HftEI1WuCcagwn1KgS4S9M+Ec=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OuDOUEzmOI3bYwibLc85/yFa5u+eK/cXTz9Eal2BoFD5Ac7COOdD3dToxCfEtV2tvCGG6q5F+Sofc3lHIEP3EmLYOJEsxXRPiy20r8BD5YAjJpi1v3aP5DKIuhE6bPdy8s06CNLOqjb6ms+pJOk/X6PpudR/v+D6HLNgUMZjG7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=IvFRmJjz; arc=fail smtp.client-ip=52.103.68.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qN8gg3Z6EG29QTT3RBsyxluQkiKxVGDyi0kONMtounH2Nr58c5UzkPNPgihKgdzFCnhDhVpOMtTCH/JuiatCXeKIEoqNJC/P8cYZFbEsMuhKYYwYbl9eeMtjsnPiUZcXSVRUUKoeWLwZOSpA4cJq+fPKDq9dkMLW6zbOoXh6KNWfM0Y9Dj9S9x4Ad1ePljKGmsxdc/LJT9d1DTDWbgIOw0OXukc67X8lnTJ4NP5MUfJ0IfDoHB9DYpAB8MYTUPSjufyWkRLeaHcr96GKS0H2tFRB8p/v3FnnXqrrs4irflzYggjffEOKFUue06KOjIUhfsmMrAlHtzlIarWm8Wsd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYHWEs+E0rUU0Aaji7IOwn3khWFDU08OfBnWr8FMw+E=;
 b=sRRGSk1Kgg/NKpiI3uwTP4W8HAVn1X3df8O3pAOKaDaLGiQSLLu8cOTH8xoGiTuI+b5u/7isarRa807gSJZsh9lF8cKrkBAc8qBv+vYT/1PtNDb1eyp/MoTLVsL9PIpuqTZugI5fam68CwNg5FXlcwuzb0+ycKmZpnsI6klRbQ5jqBFjAToGUWzdmsIOM26eXyZx9/VjYEF7a5ooyod9MHaIc1yoWNnAmksCq0ovSpygVnmEVFpnxbFaNSbeqEa39gbGLEUWfbanEpKt0BAVxoAz5PS3msT+o0Kj5jqaK4+NNavuoV8On4SjyR8wlcMM3C4/oCd061Cu3JSpWtf6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYHWEs+E0rUU0Aaji7IOwn3khWFDU08OfBnWr8FMw+E=;
 b=IvFRmJjzELgrHQRk5BBv4TYlpPwoDwqA1T0USfcKOb7E4/BZ9HE3kl4OxNFJZjRYHyvYRGgahGeTFClasm5nYKATkV9fIuoGGVzbTRbgTSTsKZoM/4ql/cmlwGCE12MubJySdPPhK9ez5Im1wYmRDmPNEQ9stTTJcrGBAOPh3G7NfmgnDZv31cuIcl+TqAhdkDemiUJM0W70TeOH/7Ml0YwmHuUlJRz+6kdN87ypLX9BxdtZ6a2bHLO68J8bEOmYd1v0rfogF6bYPokbIBf2ihs/ysi9Q2UBkiHbkthffdMnP5n+IR2D30f+1VoIS3hPnCKCFGgMvCZPEj0UlJcvaQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB8880.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 18:42:05 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:42:05 +0000
Message-ID:
 <PN3PR01MB9597210260BA668139E6E0E6B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 11 Apr 2025 00:12:02 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v2 1/5] HID: multitouch: Get the contact ID from
 HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
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
X-ClientProxiedBy: PN3PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::13) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <e556d6f2-db86-4d51-a42f-f625e9e8decf@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 48db4b5c-9131-4483-b775-08dd785f63d6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|19110799003|461199028|8060799006|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cktUbS8veVRvc2pFOEV0YzVHTmVyTG5ROHZHUVNjelBTUjRxTUM5citXM21l?=
 =?utf-8?B?RU1SZmk1OU45dnAydXg5M2Z0cHZnTDNJZUZxM3RFZG5IbmxxOUhuakF2SWdR?=
 =?utf-8?B?S3grTy9nZEtUU1B4VzZyMWRRWFp2QTkyOHJsRFpFbys0R0hkeG00a2xPQkMy?=
 =?utf-8?B?R0FwQTMwQldvMDA1UzMxRGs2V2tpWEtCdElqZ2FRTUIwbHhiK1hFcE5QNlVv?=
 =?utf-8?B?cE9BU2VXS2tGc3A0ZzJTanJTNStTYmtya2ZCZkNBK1NIT0xNRXRvdVNYQjdn?=
 =?utf-8?B?VFYzU2JheDAvSDFGZlpSRS8vVVlxM0MvZHAyVWVRb3hheFh4RzZxVEcyWkJx?=
 =?utf-8?B?cGhRdkdBd2V5K0VVd0NycVdPSjY0RTN5YlIrNStRVFdETzVKUXFRaUZwSjFP?=
 =?utf-8?B?NlVFUWc3N1J6a3orZVBVVFRLWHd3ZFVJNHBFTGJidGVXSjFyRE5uVUdMQXlZ?=
 =?utf-8?B?NWFrYktFcjhFZEJ2ZnZnQ3dVNnNKbW1HTU1jRVpBUUF6YVVVUUhkcnl5VFlm?=
 =?utf-8?B?cXZaN0ZjQ2t6cGYzNDdIN2pjMjY2TEpxRm1WU1JHY3YrVmpTTnRGNWZ3TWhp?=
 =?utf-8?B?TXhYWlovQ0o0TVpoMVZidzd3U3lRMTdiQUp2VzVmVEZMTXo3L1pGbHRSOUx2?=
 =?utf-8?B?eUxGUSt1WERpVVN6NWhaZ1VjMXFaZktLM1lpSzBnUCtTNDc5Z2N6WmVlNGE1?=
 =?utf-8?B?cFUyanlYd1NaWFZjYTFLZEpvanpUNkxNL1FwZS9wYWloZkh6amRFNXBHMSt4?=
 =?utf-8?B?OFJCQlNhOFBUZk45ZUpDdEtaMGozd09ZVFkxUElUWnF0YkdhMTYwb2JRdEtZ?=
 =?utf-8?B?cEYvVXNLVXFleGpFYzlpZXlvdUZQUFlvUHQrc1p2TndCMWZvTW1zcTZkVWVG?=
 =?utf-8?B?dDlCKzZYSHhmU28xVHZOVlBHSy91azZMVXdvVHlQQ3NSbW16NGhYaCtoaDVK?=
 =?utf-8?B?cHc1d0srL3FFamxvcVd3Y3NYZ1hvRFp3ekdtWmsyWjJjMEtxMHVidXZScjdM?=
 =?utf-8?B?Rm1GUE5wZk5HWFU0dGFSdVQ0WEt5OW5ISlRGc3F1Z0dPMlFidGFkaVJUMVZz?=
 =?utf-8?B?d3JGQUtuRlU3UHg0OTkyTTE2dVhXVVVZdU9ITnZpNzVaSzd4TW02bFU1RHR5?=
 =?utf-8?B?L2s3M2J0ZWt6VVVIN0FnUUR6TmR5dktNVjJNdGpJSUNlZGdOdHgzVEYxdGRo?=
 =?utf-8?B?T2hZNmpGTXRrWVkwa3RwYzBhaUJxNzVWTndSaWdzc0IxVDNlaExuM0pXa3dI?=
 =?utf-8?B?NDlyeXlKbWFEekVLMFp6UkZFQ1g3bWpyS2tPYzh2MGFMMEhHMEk0em16S2hP?=
 =?utf-8?B?emxmSHNEclZFVm9FOGErbFYxamJ5SmNkMkZIZnBWU2ZBdC9iZFdsYjI0cFF0?=
 =?utf-8?B?OXY5VmpSZEd1R0dSRjZ4WE9ja2FTN0NBWDZzRXhyMmNSTHR0Wmx4QkIzTWIy?=
 =?utf-8?B?a1czUmM2R2ZmUTNtMktnaE9EcmJ2aCtLVnN1RVAvdGptZDZ2UWp0UDRZQ0Ry?=
 =?utf-8?B?Q1pIUEF0QzhSdU1mUTQ5YTRhV1MvMUlIVDdpdHhZSTIybHN5b09lRUFFQmU5?=
 =?utf-8?Q?jIHLeSGxhC7hEDbEibx0Uv7kU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzRYNE9Iaklibnl3Z3A4SDJkNm43Rm5HV2o2T2pkRnNlbWI3N1BpQWhZOHU3?=
 =?utf-8?B?T1MreHN1bTNJWkwzT0hONGpPME44Ujc5VTBwQmh4T2xqUkM0T2twaHhyYzF5?=
 =?utf-8?B?UXF1MDBFQ2gxZU1pOHlpWWpxRzlieExjSEZIbFVmUFUxZmlqTDZQOFEwNGJJ?=
 =?utf-8?B?VlVFS2NWY1ZHR0N1VTRVSmRyN1V4V1VCQVcyZWtYRDgwanpsRWFMTWgvOVJW?=
 =?utf-8?B?Ri9UamtIb2FEUzMza05sT1RCM01saW9FK0J1b1g3VktZeGtGSUJTRy93OFR0?=
 =?utf-8?B?N1oxanEvZVNqZGJQa2xOSEhxRmFWdVgyaGU2NFBjUGRZa0VpTklFZkI0cWlY?=
 =?utf-8?B?WGFYYnN0UzM2V2NmdHRZTGloL2paMjVQWk9HR2pnenVKRTQ4SHBWVENLOVZZ?=
 =?utf-8?B?SHI1dEtDZEVvR3cwUGlRdWdlcHNTTlAzTXFWUkdZcGhkaTA1OWhKRzFNNlVu?=
 =?utf-8?B?UTZCK1ZZOVlpVC94cU9td3owbElmU3VMWFNoVjE5WXpEekw2dmZ6WFlrQTg1?=
 =?utf-8?B?bjg1V1k5SDkzY1dBcmt4ckF5MEhUVXFpd0tFbHlESmNtTndWZStGdmtOa0pY?=
 =?utf-8?B?ZFdISmNIRjFKQ0YyNG9nV1M3ZEJsb1pKZmR4QWVIQzdJaEwzSUoxVGVENVJw?=
 =?utf-8?B?VU1mOWVtd2lySS9XWVpKc25RdVdTSXVscENjUEFqNThMZTJkbTVNTXRySEpi?=
 =?utf-8?B?aHV2dWFQbVpDb3A3OHNoNXNPUllDV2FLVWhkaVo1bk80Sk8vakxmLzJla0ln?=
 =?utf-8?B?Q3REZjdQa2lzR3ByUytRMHFna2JqNGk5NVJIY3hJMmUvWnlHNkd6SUtDV2U2?=
 =?utf-8?B?QnR2V25Oc2ZSNDJQUzV5TEZ0VHBzb01DZUtMZ3kyWS9JZW84L3NZbXFNWWtL?=
 =?utf-8?B?ZjU0eW1KUVZ4R01aQ2QzbnpMKzg1OUNGeVFIcExFYmJnRVlvVDJxNDBiejVD?=
 =?utf-8?B?eW5NYzhVSEtvOXhFNGd3SUhORkc0U2x0TFh2SDFvZmJONEJxTGljTXVqY0lp?=
 =?utf-8?B?K2NnM1JsRjduQXc0cFRzQ1d4eE1MQkV2Z2NNOGVvbWx2RTNybHJmZkJWUmNN?=
 =?utf-8?B?Y2grT05OTklrYUZiRnZ6Q3pWKzRYT2pSRnlFMDFPRFpYbGxzc1QzUUhRY1RF?=
 =?utf-8?B?MUFHWFJPTjBqNy93M1VaQXNNUExCQ3cvYUR6S1A3U29obUZLNE4xNHVkZ3Vh?=
 =?utf-8?B?UWNxMm52WDdQUFkxbmhKcSttZ1ZGQkdZTk01N1phV0Nwd1ZZd3pwYzV6WC9J?=
 =?utf-8?B?ZUJRckgydEdqTUZReXVqb3RoVjMvZ2ZobTViR3FoUVFFblByN1llOE4zUUxk?=
 =?utf-8?B?WHB4Rzd5aVVPa3dWbEFURVB4ZUU3RkRFTmJpVjBmdUNqeHBQVC8wb0s4OVRv?=
 =?utf-8?B?WFAzSmk0TXYrN2hsd2dsdWFvOFh2ZldOVFlEUG9pSW15cEZFcDhVSmRObmha?=
 =?utf-8?B?ZlVSbWRNeXhrWVIyR2NoOGVxQ01TYlcycnRLYnhJekN0dkliV1lvcGgwbEZm?=
 =?utf-8?B?NXNnK1l4K0dQaUNmcUVEdW9vcnk4d3dNWjlxQjVINC9yc1dEM2pDakZwOFN0?=
 =?utf-8?B?RkNkcElZK1N0ck15NW1VUWhsZmNRaVAzc1V1UWd6U0h3R3lJRkQ0WlpZc2Ri?=
 =?utf-8?B?ZWxWL3dwQUdtRURCQ2N2Wk9waHMwNnNKRlA5cFhnd05wTjg4Q3BxVk0yNGs3?=
 =?utf-8?B?Ukk1YTlFWm1Ya1VGdzgrTFdsYjRkWHpHYUpkVm5SUElZM253Nk93d1pkeXNk?=
 =?utf-8?Q?M+mR7+Lody8YBHYRXiJw1A6Qol1K082H2x3QANj?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 48db4b5c-9131-4483-b775-08dd785f63d6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:42:05.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8880

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the contact ID is contained in fields with the
HID_DG_TRANSDUCER_INDEX usage rather than HID_DG_CONTACTID, thus differing
from the HID spec. Add a quirk for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e50887a6d..6e7f34a47 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -73,6 +73,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -625,6 +626,7 @@ static struct mt_application *mt_find_application(struct mt_device *td,
 static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 						      struct hid_report *report)
 {
+	struct mt_class *cls = &td->mtclass;
 	struct mt_report_data *rdata;
 	struct hid_field *field;
 	int r, n;
@@ -649,7 +651,11 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 
 		if (field->logical == HID_DG_FINGER || td->hdev->group != HID_GROUP_MULTITOUCH_WIN_8) {
 			for (n = 0; n < field->report_count; n++) {
-				if (field->usage[n].hid == HID_DG_CONTACTID) {
+				unsigned int hid = field->usage[n].hid;
+
+				if (hid == HID_DG_CONTACTID ||
+				   (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR &&
+				   hid == HID_DG_TRANSDUCER_INDEX)) {
 					rdata->is_mt_collection = true;
 					break;
 				}
@@ -827,6 +833,14 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 						     EV_KEY, BTN_TOUCH);
 			MT_STORE_FIELD(tip_state);
 			return 1;
+		case HID_DG_TRANSDUCER_INDEX:
+			/*
+			 * Contact ID in case of Apple Touch Bars is contained
+			 * in fields with HID_DG_TRANSDUCER_INDEX usage.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return 0;
+			fallthrough;
 		case HID_DG_CONTACTID:
 			MT_STORE_FIELD(contactid);
 			app->touches_by_report++;
-- 
2.49.0



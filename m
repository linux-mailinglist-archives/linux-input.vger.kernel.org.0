Return-Path: <linux-input+bounces-11355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D96A7557A
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 10:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56FB16E41A
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 09:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114A219004A;
	Sat, 29 Mar 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="k/iZRzkl"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010011.outbound.protection.outlook.com [52.103.68.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6862AEED;
	Sat, 29 Mar 2025 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743240945; cv=fail; b=T/ektEVcAJYT1+qF2C3tqU2nJoTOWDeXLsizOIYPRk3hH0iUVuac6m12H1Rpu25kQJ5nI+YRwVF2RqxPVoiIPGmLl7JfkWkse2gLmRokgrdW9L35b6cgkEuG7jJHrXfvnsUPAC8pNybOKWcWxrxhko3ED/NfZRONGOYVPVPXT2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743240945; c=relaxed/simple;
	bh=Uao/vznF7YPzQjjvKQ/e4G+dYT4N981eknNNcO6OVi4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j4/4ntbPTT5Qdbxb2XYHAyi1TW7+y9eCTFxwYfsdYENuqgEea472oyXEbdMDWu8rJgP/xvXcGNZxOOHGsY7Gx2Otb5xJ+3iPEcCy78KhQ7M0P6yOLewCPFdLVSbBen8TEFxwiug+7IvQq9I1Nl4AFYQ6rTTVp0rfWfGseQv7D/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=k/iZRzkl; arc=fail smtp.client-ip=52.103.68.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xckDG/SLK5g427+c0MqG3iegAxADXcVlZjaHEnUPfh5vd3RJyct0Gjc66/J8caydAlCTc9yqWVzcUYLrn1U97twY9uAUBPg2HJhKjk0JOMaUhgMIG8kF5m4eKmMF/R3F8tOJku4KtC5Nk4lXnmIj5Yc2001MauyCOlAdOg4XBxevWcH7j2mJoR+XDg8c8CRaeUvH+Xsw4X02lHNzV+LznxOQLaxgjmZEWk629mPqvDpVVR54knroC66CsSoTBno68/SL1wohIEDdrZkomVpX0sAoJ3yX/j+1dXHsr784HfIojroOGv/NFaSYAeyuOBG3xQ+3gqbvF+vy+8yPDRDeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PFcD4dPmw5tMmpyN6Ma3j5dl2+e1S7E7ca/EbbGmoI=;
 b=STVpIUGrc2w+tsQiXUUZmiJYFMVr9i6eNqZJ5OnM+ITt06iMA320YLCWntJjyjSnzqiy/Vf6C4Zhcf4q9QEzB0zbg0bhTOdDvBZeap+lGahCrYgF/ei/9D2NNAWGp5pdvBylCm7o0U/v7iVtomGPl9Xa7yZpk7g9yE+sD0rm6qVMzKNHJWxd1qFtEYR5A+WdHtAFbw9V/z5N3im4a4DT5TRwT2JPKlbJ2QQyMUKGbZcMk7/Y77RdDs6VasJiTUNwAegWv012gR+bqvIGclKcmpvrdWuasECFirR1Aq5qftjoj2+bXp8UYfkmqHsF4TGxXwe1WQU7oNZzFWR6/SwdrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PFcD4dPmw5tMmpyN6Ma3j5dl2+e1S7E7ca/EbbGmoI=;
 b=k/iZRzklI7WXjRIn8GSbL7FzPowVdhFNO+9ACWovOCZeCGs6MIcaG7oXtyXa7f2dIFQ9ecQboXLdX6hUPm9v2evV66/Iw7R2vfVxzIb1oj+7JRBUNPCrjVrrphOzukFK4g2sBWDXx+qFu5KJ9f0a2a76He+e7Weme/1Rm1PvdO0JiARtCuc2vZ+3vrNpi7ru2jd9QDlt+VSUWxEQFx0bZFol0E1/5L+3Gip3UiRRDl6prAGUvD24fGQT97Bf+1wosOlyopsD1ib7k5OBe4dMWpkVYMcT0G5NtRJGbZA7KIP4DavQa/1cWimZivm0lMICeKLKNDjHlocdoMUeX13mrQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 09:35:38 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.028; Sat, 29 Mar 2025
 09:35:38 +0000
Message-ID:
 <PN3PR01MB9597C66FEEF97020B896DEF4B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 29 Mar 2025 15:05:36 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/5] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
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
X-ClientProxiedBy: PN2PR01CA0244.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::13) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <9bcd5d50-42d1-4188-9dc4-86bda5ad95f8@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ff6a04-70b5-44e0-43e9-08dd6ea510d0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|15080799006|7092599003|461199028|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzRRWGRpdzcwR2t4dnUvNGVaN2piQVE4ZXMrN3BoQnlFd0ZPVm1JWnpyYjBB?=
 =?utf-8?B?UUVaOEtQSDMrMkkyNXpsbmJrdWdOWFl1TTI0aUhIWHVwQ0Y4VnZQM1pZaVB0?=
 =?utf-8?B?WmFuOGhLSWwwcFV1eWFmb1BVbytNM2JRbG1MMnFmVzB2RjNHS2U2MzU4bnA4?=
 =?utf-8?B?TUd6b21seHVKVWd5V0JsZUVQS2prVjJlWUE0QitYTHhxOHpISEZ1VC9QQnRO?=
 =?utf-8?B?WTRKT1VVOVNmTXN1aVkvVEJ5bkc3b3FpYVFrUTBRYU9ScnVKd3FoYS9VdFRk?=
 =?utf-8?B?clNVcmRyOHFUTStaa0wzSENrRGtOeUJUdGtSRFdlNFhMY2x5aGg0ekVEVjNy?=
 =?utf-8?B?c0kwbVVKd1FnK3dmdENocmc3d1VDUVROTGNNL2t5OEpWOW0yOHFRU09OcU9V?=
 =?utf-8?B?ZlVWZFdYQWFWZnR1ZzR4eVZYVzlNbnRtbS8vS1UvZWoralZoZ3BNdktmZHI4?=
 =?utf-8?B?VmNmdm81UDEvaVdSb0w1eHMzWjNWcW9KM0Zkc0lleEViQnBWY3JteDlGQkkr?=
 =?utf-8?B?YjRwZE9QRElFaU1GUTdCWDNLVmw3WXpReVh3WVU0THM5Q3RHZ3hzbVI3dVRJ?=
 =?utf-8?B?Qll1T09RcitSNUl1QXJiazV1Y2tXMDI0Z0dTby84U1BzSzY3YnRaV2NRVXhC?=
 =?utf-8?B?VG4wK3dGUlZnKytNZkVPV1d5R2J5Y1EvN2FJOU9US09tZWNPSmN4allsbWE1?=
 =?utf-8?B?YkE3Q0pVL2dyeS9jVHJya25WSDFuZTVWRlFLWDhzRzVaanZ4NkY1U3JseE0y?=
 =?utf-8?B?R0hWSzdrMGpHTS9oczRVRjExOXVqc25HRUg1M2o0UUlRY1hTcUNndFFSSjEx?=
 =?utf-8?B?U2ZTM1FBTEk5L3pBUFFPcUpIa1RCd0FPejVMdGJ2TnJROFE0NzZOR2xYYXRp?=
 =?utf-8?B?V2RJS3BUUUxPajlQYWFaekdJT3FxU1BTTjRyTFJtNkptSHoweWdod3ppQ1l1?=
 =?utf-8?B?Rng1QUdjc1F3SHNUSTMrcDErRHovZWdJd0MxNHM1NW1tTTBmRUxSUTIwZFJC?=
 =?utf-8?B?UHp1NVBDWThNc25vQllzWjhHUWVoMXhad3pSLzFhV3JGcUpHb0FYNFcyeWd6?=
 =?utf-8?B?dVF2R29SRm41SnZxbE52SmpiaFBBZHFSd3Z5NEFFNHRLN2FRZzRtTGRka3NK?=
 =?utf-8?B?TU9Sd0daWk1ORHdTZk5zQmtWNkg3K1NYT2tKSUVKeEpmWTlFdUFFMXFpNkYr?=
 =?utf-8?B?SnBtTTkzVHZwM2ZEVGoySDhPSEtrS2VPZERKck9aZEtBcDFOZm1rQzRQZCtm?=
 =?utf-8?B?UHcraVExT3VZaUhSd2NuU2pxU0FkOHBTWG91VjFETHlNZE9McVVBYkRRT2pZ?=
 =?utf-8?B?QldGUjEzNXlGYVp3eWZvZitJSUFNcmNwOVdleEVOYTBhdjRYVXQwM01BSldG?=
 =?utf-8?B?TThKVjNuWDlWWERtUytERnRvOEJZZXViYkRqd1NEMmZvYk1iQmI5U0FWL2Jw?=
 =?utf-8?B?bWxyeHZ0ZzVaQ0VSTEZGTkx2Q1IwOFl2SFh5QnRJTTBMekZieVNPUnFBWlUw?=
 =?utf-8?B?N25IY0tQR1dzTFBFMVFYR0NqTGJVbGxtMUVFN1ZTdXNyTms3RXBWU1dEZ0tJ?=
 =?utf-8?B?WjdpZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVNMN0d3VXFBdlNhT1FKMHJPdWdjYmRHMEVPNnN1L24ySDR5N1QwR3VUOVdO?=
 =?utf-8?B?dHo3MkNWNncrNDhaUEtldDBiRUU5ZjFzTnFNNzNtN3BnSkV2K0FpT1N6OWNY?=
 =?utf-8?B?bTJJdjR5cElmVklBVFluaWdXR3UrRDJCdkVNOEx4T3JWc05kZXMyd3N3d0NM?=
 =?utf-8?B?UHVReWRzQ2s3b3pILy9PdmRQL3c0a0FKdSswRDkwNlJEM2p6OUhSMG5LRUpV?=
 =?utf-8?B?UmhTUnoxS01PR1NLNjFaWUY2UDhPYnBDR0ZaS0c3WC9oenEwdHRzZUxzR1dK?=
 =?utf-8?B?S01wbVhXWkFyU2NQM1pQelYrcFZPQ2ZPaGowOWtCa3dJc3YwcEdmOGFxYmZC?=
 =?utf-8?B?Q2VZUW41alRVYlkyZHkrdFhUTjFVWnNIS2VZNDNLOHBqc1F0OFhJUVlsTjU0?=
 =?utf-8?B?bmJEL0dNMHQ1blE2WjQ1M2wwSmh0QjJ3SWRMcW5ER3RsNjlOODQyZDNsVHdS?=
 =?utf-8?B?TlNyQzFPbEhtU0pFOG9lcFB2ckNoMFU4eDk3WUJzRlNPRmhoVXBhaUpoNlo4?=
 =?utf-8?B?SkhibG9jdCs3ZDZWN2NZaTNHSVR6U1l6TC9rNFhRd3lvUTR5am9tUlZsdTZo?=
 =?utf-8?B?dHE4b2FVWFpuV2EwWXNHK0p3QUh3VkUwSXYyMWdWdHNUYnprR0owRGNhSWtN?=
 =?utf-8?B?elZqMUFwNVJIclNCL3JzZmlRMFZwYU9BRWxNQjAxT0lZUXZ3RTRGQXVvMUtE?=
 =?utf-8?B?L1dZcnh6akEzN3NjRGF0Rm5XZlI2WFMzalQxZk5FQ0lzTWYvZG1QYWdZaDVS?=
 =?utf-8?B?RXM2VS9NUnhqS2dCSFVwT1AvTEJVcFZQUXJkQkg0ak5taXBZK1oxTHN4MkhL?=
 =?utf-8?B?V1NpYVNsTGU4bzFkQk02VGI1ajgyVkF3UFBHT3NFMG5rOWpQSE14QkR4YjFX?=
 =?utf-8?B?bGJ5bnN3RG4yU1NDd2duWTc0aG91c0w1T3pNUWZLdHR0MjdlSGhOaElIOXVN?=
 =?utf-8?B?N1hESk93elBTejc3NEg4THZkN01LaHhNYVZXZXh2M0cxc0pJQ2hIYkRoaDNp?=
 =?utf-8?B?OU9aRVhWZDVJRmRDZ3JzeDBIQ1lOelY5KzRCR294QnUrRkpBNS9LeGozVEhM?=
 =?utf-8?B?VzRGVENOWmQ4NHpRdW5PVFd5YVlqNWFpVzhQOGxKSmlyKzh5Z0h6T1RCcFRY?=
 =?utf-8?B?Tnowb0VVNUxOc0xNc2RTOVJsYW9kdjZ1Z3l4d21rSFc1MkR5UGdTbnBxaGZy?=
 =?utf-8?B?QmZIUWs4WlpxdXQ3L2t4U2crTG9TU1BYS0E2QUFkMS9QZjZvS0xURThQcVZS?=
 =?utf-8?B?aXRQTHVnZ3J6cE83dDE2bmI5OVRoLyt4S2tBLzJ3a1FDYTB3V2dkRm1ZSUlE?=
 =?utf-8?B?MVJZME5tSzRjUUlRaWZsMlR2cFVvYXAwR3pOZ2JibXJPQjZ2OGZ3RnhQOVp1?=
 =?utf-8?B?V0dNNWhYalR2TkM5Q1VkTVhkTnM4eHZnczdYQWg1Q016UVpIaWd6aGw0MzFS?=
 =?utf-8?B?TktBS0JTZkh2RDNaa0VzYlR1UGVjQnR4RkZ5NXZHdjdCeThZdnB4cVVTc0hk?=
 =?utf-8?B?cFpVVnNoaE55QjJjV0VyMFFMdDZZaGxrSzQ3S1cxaW9EcVAvNjQ3WmVuZFF1?=
 =?utf-8?B?a0d1NWU1cTA4NUd3WWRhakV1eU92RktEb3dwRDVNT3BWaSs5N21BUDcwR2RK?=
 =?utf-8?B?a1BBMWI5V1dUQWFlRzFvOXFxK3Y0VHMyZWtiUzZXSGdsZ2p6L094cktHVzNL?=
 =?utf-8?B?NDB2a2xDWktQZ2J2dUpjQlpET0FkNEV5YTRSNmYvRUpSbmdiLzhzV2xESkNm?=
 =?utf-8?Q?I+hLdGS7VF+SWc9KQ6slrrWAO225ZnMhwHDuc1B?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ff6a04-70b5-44e0-43e9-08dd6ea510d0
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 09:35:38.8963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10042

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
2.43.0



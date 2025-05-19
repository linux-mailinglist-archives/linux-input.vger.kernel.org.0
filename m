Return-Path: <linux-input+bounces-12438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 482A3ABBDBE
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C3907A714A
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F19827979C;
	Mon, 19 May 2025 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Xrcpq+4r"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011035.outbound.protection.outlook.com [52.103.67.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E13E27934E;
	Mon, 19 May 2025 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657693; cv=fail; b=ZBEd8sV7Bx/48vfC0wnVFqDgDoSYVAzOk2vLQ6iBHRDJQN/wegNNtur2aJZRfu24SqTRoWQ6nJwewQE68MVaGQ49836Cv2CCv8fs7ela6P5mCj/fiHzgdKjux9Ug5Tr0/ebfQHJnfwqi5KO0CPdL+c6zT+vg2klajnmxHLD6p08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657693; c=relaxed/simple;
	bh=O5YtdydOPgNxjvJlU+xxM+hbCQGovwAreOfN1Rqpm/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A3hjHRr2BbB7LiRqCjFjcgO9aMq1DCheUP8FSGb8OVVHL+u1s0vYiUHqTOnzKCJykEAB0fv3WfxUiL3fya+ELoHdNO60F6xv24yvSlrhQrzU+q8Ffkxuqqo8J0HyPXCNGva4qv8qp3/DVRRrEQLh7SU6WVYvMIdeqQfQQawsvgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Xrcpq+4r; arc=fail smtp.client-ip=52.103.67.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/8WdV6wVJUCbI32qo4n+gGoTr9mI4HtTugzQFuv8++O9H0DPlC4eEi47dOSh3H3tk/2MH3KzJXPB+LxDnQmN+G0L4EC3w0nIwg4Epp0Le9zWNiiMxHYw+qmFJ6RaCe/nt6LnfrTdGqQHfDoaUIHyeKxnKnZRuWOAMdM2ePWlQXUM4g4itNNuG6L6V6H7/mSdkigqg6xuuQW26F7WMIEt48AT5sQe40zglWU9pglftqRg450YKChcsVz/A4PrH56dy3F3tUsK0znJmW8f+8gjOt8/xAgvgvCocY0l+qtTu92bQk2rTWehjf8I2XWj8hxUh0BAJz8c9lqQAk86vVvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEosvstSM3HRPP5zVgdm+T4O9B3QaTwOBPsbYU7GWzc=;
 b=yOPU497o7mA6BNnhPMHxeW5pwdN5Fsmrf+eVb4dfOy6tJIMM9HEIIaRk81ovrM+gknpsGBps7UtSubUN50Ky9xu5n8BRIFOYxKzbX6rI3WIKkzz6VuWx5HZ4aslRKPh/EJGFUmphoVkv5FsCGR1Fmo05OfHoUhAfJx/jc9EXuKP+MhuHp9CHpKx9z+sBborlNNIKxWO/03dbrpRENi1jhzJYsV2yAJRVaj5G3/otgchxoYPG3N7VVoORbgJlumATdWMCUPsdhxd+6rZdHw70qdyoxG9CKhtRzzaSRncfxaH9kAqVkmotcHvgC6+iYB3Z7pkL6nL2135wxbM0RE5fkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEosvstSM3HRPP5zVgdm+T4O9B3QaTwOBPsbYU7GWzc=;
 b=Xrcpq+4rty3eABloEau/9XxN2eHJxQncoQqOOpb6AzAdWYEEBuxNfVe0UlR+aahiIQwt2y7acaDYImw4NCh4AzWAtQihcysqm2khFi/NEGUYWbwhEQZZUyH4EvxM+ZxHsU9hE4imHyDKWj5rvm1a1JwFT5ECAGfksZimgwtOohUUqLR9IE5HaMXIm2vZbAASMcQWScmfQKozv+Sm8oa0sa62M6QwT3BDmK/TvXQ2kurzFnnrTFNu5LUc8cuyLzYMvVJZVMflsvXrIamuhU8hpbz/amCgPbDm0b0tRGWDYYmF8fdt4FwVfmI2v8pKqKq4rWeDUwfMQg8tVnKsz0jxng==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:28:01 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:28:01 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 7/8] HID: quirks: remove T2 devices from hid_mouse_ignore_list
Date: Mon, 19 May 2025 17:46:22 +0530
Message-ID:
 <PN3PR01MB959730B6AC73A6283D9BB207B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-8-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: fb23cb73-1de9-4d45-a98b-08dd96d09863
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEtcr2c4tCEtcDL52RpKSIIcWRzIN1aOj8HUl4a8wllyq5B2b7fyEfDpV365MfLe7R9UJO9Ugf77TbK3i7UDH5rhVFMs5++R0FY7Kc6CJQvvhYuey+tyb5PkGcCVZTBe74c9+3036ZOXW0CLPZRo3id4LO6ksjCdIcVFwAJFyM+7RJqztf1V0NLYAmV88wTe1pPBlQezOj/fSNRTMEzbQ1TSF8ck5nsLAfc6lCcDWOE3W8lS9J7JouyEMJTDODAmLjJQws5PkEHhHXtIXvGx3CmSSqS742jkEJ6uR6AzYCzqzkUfRyGaGk7Lj7mqzfacHYo7EwyOPyPwORVpQzLgGVUD44b+uR7dF2s/6J7xSTT8DEreUh0fEtmSAmmMNkA+cVeU6Mont9gcW+tEodtploUe4P6cPCs7I2V1wMM9xZNUVLRDIWkW3biAQpaCIHHRt3oqoz/u8f0dksAfWDN5mELV/9OxtpTB91bw/NRPfFgvxVfONwQZkTAq9YfsFcKTgSpF+16a1zAzgAhR0ZshFEuThp5Se4ot2wd8zJ4k2wyuoE0pyFiQO5iPd6h8HSfST/lKanE63QkXmAjLLB5P6c0Z5jTw+EHCMsCOopM5X3jFuoh4PDYaQ1vX1usDXMRWPO54RfHUNtbUt0PsQroqYHUxGnbdZ5JOmOY0vr+WYDGhNPtxVQKwOHKok6pcZlkZQpJQ9WLXyl0/opbVQl2luG+rbK7ImL5YQ5TtmW4TyeWjfU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b83axbSZdjZt7VS3MEoTv3TbirguovsK2p1qCr5B7JiCQsKS0TJs43cLc8HQ?=
 =?us-ascii?Q?cN9YG48qaAofHNl/nZZMNU9J9g1gS2/o2AJ0I4hOuuNoZeS0PdeJh2FtPLaF?=
 =?us-ascii?Q?yBpFIDtyLecH8pgYAaqk4WVlFPjU1M8T7vdIjkwExFh6H67PF1e9g160sEA/?=
 =?us-ascii?Q?L90Rls1uBCISDVaHvbe/DNCgm0HPUxkcJ2nGwPMBZEBSjsu8ATQL3L8g14bm?=
 =?us-ascii?Q?ZUJ58dHSKa7gI40oipmZwL4TmY3YZM/P3t/ZyJYXAYXUeeekMrUG/y+fP7rD?=
 =?us-ascii?Q?A70YvAGmgBpmUBaN5ur08Kr2ApmHuQ+z4M6NHMLBUpeWqfj6M+9ojakkiL6j?=
 =?us-ascii?Q?JhKhp6ynmLXrM1bPgIzvzTawpP1GIfGMQTFeUlqXU1sIroVSK/LjNEfd3bWG?=
 =?us-ascii?Q?21TitD8D2pvzgV4IXqw4RTT1DDxUNHn49+dz1thSQ6QZJ0oNIEtid2MTPzUT?=
 =?us-ascii?Q?aZ2LUjKUVRvXJAaK0qPLhnkWGvljbcSeX7gxz2jxC7jEZcM+R/l8lZIIOn9v?=
 =?us-ascii?Q?9BSKXXoLv12r0qcNYJpD2vJzXdMDLdK0oFeUrH9e8sU8nUJMQddfqsQMRG6d?=
 =?us-ascii?Q?xwJS0eNk7aTRPZdCt5AuNga70FYd6jV+4Es85MZ+gLowc2qDTEbfm++RlNGy?=
 =?us-ascii?Q?FH4w/DBROzh84FfaglZf3NhKYlTDjAkBvihrPLO61tcy9nxGzEaFVs0K6RLC?=
 =?us-ascii?Q?jRp0BcVdF95jRqHHlpLdL3Mpwh9du9cKW2HSg4SPhzUNN25l83/vpR9uV/2P?=
 =?us-ascii?Q?HbwNuMVNP9GBoEY+yYWocIBoW/SWVZ8cdHi1CTAGGR+mc94fWQOBrHIVepMD?=
 =?us-ascii?Q?0LvrOkO+wt+hgZACm1Fl8QYpvjk0Q/QV0Mx2Wr5b/B0+Qr/TRWpITis8p1aq?=
 =?us-ascii?Q?rFIYfPdSfF1MG7oISoO304n8/WIc7OkdVYn2iIRkdtmhsihbUmKYi7pjRI1y?=
 =?us-ascii?Q?y9vMJGiesqmQHgrj3YqAvg2o05Y/AVF5Mc8CJHcDwX+SJthZNNU9X9p1MEti?=
 =?us-ascii?Q?M0HwzGMiU++6aQBIxlrWPL+bJdsLVR0bl+O7Y1jEzvPjC4tP7uxPFOAvfnAK?=
 =?us-ascii?Q?ojTdin2z9VX5/B7FqdzhskRet2rz7mJh9MXV2Bd+Zg1vL1tyS30=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J1uY1os62rUJ8dp+JURotXoYtr98JpZ+jnN/OjpuqkRGG6LDZfaBFoXpnHrk?=
 =?us-ascii?Q?Vt7gwRxKORKOMcbiteHw4uDN3k60jszZnlBiPslsD9zHC7aan20NZD7sf7uE?=
 =?us-ascii?Q?PxXXZrZsXcBVcIBR90EpaBpi5+xrLscQ1QCIt81PWm9p4JigJhK6iRfyu4s2?=
 =?us-ascii?Q?se8uR770iA+XM2DHhkkRGNisZALiJCfVXCYoK9pashS07rCmKvUFOxsgrSo+?=
 =?us-ascii?Q?01P52jUTU7kEDzGfoXlG3RJOFSeem2Fvi7bBGdjRRDJ2F0ap7zqISwV4IUf3?=
 =?us-ascii?Q?yWC3G3IwcCgkXfFTc2dgyPfj32+KohuTat6QsuZJ4RH6gmBWy13LNk8D0GvV?=
 =?us-ascii?Q?ujAN3ox5vfIGQ0pndlKf//fHs750j6vShGBdRO5U+jlUmuLZuDDuWST/2+Gs?=
 =?us-ascii?Q?rhZ0UONrcckeWH/AZ5JQiJmoJdI1AE8iGLn55jV1gse9XgCgXbSUPQLMX3KK?=
 =?us-ascii?Q?UyuXAVELUrgCm3V8pj/He+TOELQI+aIxt0Tj3+v33yTujI+iUj+fhcNAqfAg?=
 =?us-ascii?Q?H/ayBzqIfMwnGafKOml5Tb7JA1OC6iTMbhHoeSlQ33ej6by9Bc2+lStwOemJ?=
 =?us-ascii?Q?xox3BmGULbHtjDQ3wamvqhzh2DeAs8aozmC4pWvjI9FqXh2nQQ1AarSFC0Nk?=
 =?us-ascii?Q?5A6GKHhlpe9A/8Yjss51Q0iTCY3nTLEssDIMXirnY8/w5sjNmuSRhS/syX98?=
 =?us-ascii?Q?u0+u/DZaxuu9cfFa8iqiNnCfUTLYTfMCMgJNaNgmzeiQyBOnq41pM1+2wz5w?=
 =?us-ascii?Q?ykU2WJraugbnPFLzYFTYqc9xl5gSpBBl13PtJWZY3HEaZpRdZGA9SaIOQHEJ?=
 =?us-ascii?Q?PfOo741jAG6RqA4zmxUQxgIOsAYW4whsHmaWwyfeBoPMh+TC0V4wJedfFvI+?=
 =?us-ascii?Q?livbqRMhfJ6YqqjOCGdAGBfvJsK1BK2B/WdORBG50jtOaW+pWXaN2MtERhKg?=
 =?us-ascii?Q?+9625Sq6w8FtZenbn1DdOgoaWXFSHRcbjPElF7kv5tScsz4TVyXp7HtMw4K5?=
 =?us-ascii?Q?aa5i1Gvu9vKcT07jmPJj8BsuR5AwpGcFw8++IXS5mSvhu682ETPs8TCkF/xx?=
 =?us-ascii?Q?cz2ER9vNDEozTfU/fRBOkgO5q6DESf4JIrc+dSoVWtzLk2BlDFsNcFmTAswR?=
 =?us-ascii?Q?DHy0ZbP8d6BjMc16ET1vXC42oBs3Q2FVe/lC0Q0EU3CgQTTUcav+zHnFCey2?=
 =?us-ascii?Q?I354OSRNq/CzVLIeBR5n4umXLIUnOM9scB16ZFkjAXCTb9qV8HYgX+zL22GW?=
 =?us-ascii?Q?Mjqi3tF9g986bKSpR4qR9GmMZgrq7w8a5PBzlsDUPsqrCQPFwibhWaclomOu?=
 =?us-ascii?Q?3mU=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fb23cb73-1de9-4d45-a98b-08dd96d09863
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:28:01.3673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

While the T2 devices have been added to hid_mouse_ignore_list, no
driver exists outside the HID subsystem for their trackpads. So,
remove them and let the trackpad be at least used without the
gestures. This patch will also enable using hid-magicmouse for
these trackpads later, which is currently wip downstream.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-quirks.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 7fefeb413..8a418f487 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -969,14 +969,6 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING9_ANSI) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING9_ISO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING9_JIS) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
 	{ }
-- 
2.43.0



Return-Path: <linux-input+bounces-12437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC414ABBDBC
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 751CF7A4B07
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398B3279784;
	Mon, 19 May 2025 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="bjrwApNq"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E6C279321;
	Mon, 19 May 2025 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657692; cv=fail; b=dNDm6tVgufbDy4eUMnPCrYvzi95SL1BlQjyVaiI0fCh5ZhKVG8Ubi0Z6thQWDQPvlp76bb2Ka2J8r9g9NjtLIjhPoIMP83e+fSIoGzmzPhPPOhqLn+AZFslKJyffoR6UZdAlClh2w0XRhYTwWQBxIVnrts6fZxGWhhZPHF/JuGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657692; c=relaxed/simple;
	bh=FC6SB5nngNZmMzfZMium0bhvtNSjriTNAQRk6PXFeNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYegeXsSH1n2QhnLgZ+1I1E9QESCNXQOZMXYjV5YBlB20MgS/0mXocCBBz+gCxrohqI3F8e5EHZ4CyuBlvS2eBLKhXvtAY3cA2RpYBkZ3NY58xnIo/0/11WZljFlqCe32OlmwIN2JxDBkAhlzHBmMmc0xODs6zY3i8YvjXlqPAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=bjrwApNq; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxpUccgbasRqkfDaKdrlOobxnlXxq6jIj0gONxcXqufifK2LLkAuuUMxUNOxGR+e4EMuRD3iZJT1s4b4NeoPu++ONUDZJuw7u4rXziQXYpLGeUvoydkssDRAXKjPWTTVAUwTuFzGFrO9l1MA5SaOiJLKWGNrm/BMoKZbhOUnbnX0kYMYYQ/BtSU6DI5oNHzgYbOVEBFyt7GykbhrGIBrwvJhobxouVYfA8SjGDDbYTg69ms7rKCiWbDRZyXazjZtMIdQpGy7p5vN6jFR9z1D/K2hUsJ6MyT+z0b1YWHjv95L4nnPjIfCE5KFjpbhXXCWMmtMgUu0GJ27spq29JrJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCXLBhBvDEq0CSpN91HfATP5fVvGjbDakk45yoGaN5k=;
 b=CJ41qmX4idL26P0WC7xvIXdtXO7Myv2gqAf7vuI7LjTkrVWkVkY8GVfyog8Lr8liFkiIvq6Hx1LSn2XZEtEowbHk/WmTXmWh9mpB/Bsy3+Rae/Ab4huCQT8699lPRJx9uUBvVfHhMVZz+vljM0wWCbw07533OmnbI6PgtlWowkpcvsFxA45mxIAH7nvVdKQRq314PtqMV+YagQq4Mp0jICZ2nam8hm0LbPGgnvlhlHKcMp0ATwskG9FFnq9uVS5KlZFt+xHNHWI6UQf3I36ZGdPEPugJ1IkS4pcIwFXzayoso6xiWloYh0qT63WRq6w5hYgtRaWH0Rx200nh198kfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCXLBhBvDEq0CSpN91HfATP5fVvGjbDakk45yoGaN5k=;
 b=bjrwApNqWCMrRqY6eLxdnruZCjoOMBpbuQdC8uK7xsSRfG12jOvRStM5F9SJj5vAew4gK3JPBmxDR6DuPMfqm/tD1vwMfIX7oMUmH7KI90LCBhryuj81xbANXGOTrWTQo1cPN0IHw16RsNmteU/Jpy2JpM6q+GYtur0VGusPmfNSOqjdd+5JAC/ZShCPInCp1UVfMVKxeoMJ6RAhvdxmrC+G6F64BVrOj1tqkmk47BxJnKPY2eF3TXiitMSh+kdD8xoN3TRLtuQCM8GxWI25GUnaiVYjaIU5cbzpE26u5G3jbRkWFZiOnWWXLfFebcs+P4GmFqy0OZRWPM/fyPXAbw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:28:00 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:28:00 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 6/8] HID: apple: add fnmode=4 to disable translation of fkeys and make it default on Macs with Touch Bar
Date: Mon, 19 May 2025 17:46:21 +0530
Message-ID:
 <PN3PR01MB9597EE7FCFAB92D463EEBE90B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-7-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb7aa09-0490-4312-90a2-08dd96d097e6
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEtfiswKGk3G9YVB6es5fHiEJuD/ya/rX1v+QKRfXFHHu9hLfhS7MnbGt5fpJ6R6fMY29jn/Thmo2ommHMdJhOUhQGx1zQKTPEGoxJHlzp/h2xanwmojSzqzV+QUSs9ICJ6NF0o+PXW39ECPMs/3qc/+FNlimzx97s7ssZgqdCBDbcfq5vUPF4LPq0mkH2/UpWIEIczQ/6etTfdatGqkVCWwQgR7pIDFIdli5IuGBg9ShUr6iyZHkJKr98pLysInHPm/G0lUQoqJLIpwlmax8TbOnm6Y5RKmf5EGj2VNAaMm82NW94tdTLO7OutKSfvMiiIoIasC593nX414cZYqkl8LiKTQ33tCgQJ9M+/HFfXTjYey0SZ5OSDST3JJvRfvciNv22lKf+mGKFH7hbIkoZIhXx2CGROOngKRnFrumnsclAj/NdmrO1rbgkTjp/rNzqz6meSVOr8NYfHiiUr3XF50OHID/E8KTHTY3rEsAg47SD+eJ6BMKHWkKwvx5gUbyGljmPWrJ/0dwQgiB2Yj9w+85RggNjPrEQnmYLpS7U1292ZF6tojAwY1h/a02hqTd9HXlf/fGxt678J3HxPRRFwFSwDSLiYpTp9tsVL8UXnV25/PYeQ+u0/hWFdnJlG5VtJ/qCJfwuMenynblCl61k3LhKOoCKJCMCoA+mqFniALl7S92fF+R8UVXIEdXw7GuAsL0vbaANAsc4kx8dlIB/UYRKDTyWRtwGEN+rFZvxS0OQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bBeKDvE6XmHJd5uCD3p1Kg/Nbg+9tYQDa3kyFRt8PibSVGRTCvXklsl36oXB?=
 =?us-ascii?Q?o1Mn5l5pj99Jjk26r/tPbf6mnJzDXUIDLvWP1yV8frK4B9PyYy/2HfOi9pvG?=
 =?us-ascii?Q?Nze74JO0UopVZKAHsyUDwJYUJO2OfkQBL7QbFS46vllxAYccqCVd8KqkEVdD?=
 =?us-ascii?Q?UXaFem5m8I+1prw3Oh7jcfkIXumyQwzKkfyHWU+Nq5liFHEyLvx+2DTYKa1Q?=
 =?us-ascii?Q?TN58YQ2oDqsgt4V+kIwPDCgB93fuwoCTh2sIzU5k9+iawNOnTVv9n9E0BqQN?=
 =?us-ascii?Q?Wr8aAaJEDJUR4I9txogKzbCW33HoLPcXs4zWsYbvoTptJXzZozHS0HOdra5M?=
 =?us-ascii?Q?M2Sw2EA24h5mU0phLYFswliUnjCvJSCFdPwW9GCxeWPV4n1/J8GbKxYKyhMx?=
 =?us-ascii?Q?SWETrxKjyAL8EfxxteYMnpMyOi3dleaoAIWMcxk4r+LNcFB2S40C7SfLNDXp?=
 =?us-ascii?Q?xfWywwApOYNwfuWIKmHkY92jhsRWnpW57EYm+MDZBUt3Y6QPINU5D3IYPmHx?=
 =?us-ascii?Q?1bCyw3WW9bAYkjK9E+oCMZCsrhafcMpNOUCvzGSZG7ypD7oV9dOvQxHv8uj1?=
 =?us-ascii?Q?0G6ogkvsdPWuldsRnGMaMNvZLyaqwxwB+XRamVWZRumNW1AhGtV5sY9pPrC1?=
 =?us-ascii?Q?52ijg4MegthSXp83z7eB4ayo/em2jL7e47SPDvkpN3NGmDyMuoOLWEH3GyUA?=
 =?us-ascii?Q?3iDQKRaoQtQ4eRVCr/+Jd1q1j0DiXRTCCWNDShiTu2mOTbgrtVG2Rlzf5VLu?=
 =?us-ascii?Q?xx5SiUWrQJXfjHW75FsRO9HSWP06wdpuJkvMKuGmU7KSg+6DSzNdo2NiNv7z?=
 =?us-ascii?Q?gM5GBmPzSpBTHqABIPr1nmVpeFU2Z0BesrXhlW3LejG0m5YVG8jvufM6FTqn?=
 =?us-ascii?Q?/yzWIXj4yiFULtV0scVTjz4zQPepEZOMTUJsED1f/TqmtpLQIQvjLCFZNFUd?=
 =?us-ascii?Q?VLVaxnIM96YLUb2TuMHyRm3K3RJT/cH/dOsWOSmCIK6uS4yGM7YeIbj8J6E0?=
 =?us-ascii?Q?KcTA0rT5js2//bZ6pH9ZeKUVGNQ7/VRZ1C7kORYq1BdQuIC7zKC1MsXJICj6?=
 =?us-ascii?Q?ZHgB1SFfKytfWugwaK9eDuZacbIdY0kcK9xBajv3yBopM5Tib14=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ttWzwbBWODXF8UgsptpcOkq1ccRH929cikRbQqQd2r9cXzNy/0LPP9+zHO9?=
 =?us-ascii?Q?GtJIAg6hWau1tlxqDeWUQqEnvtJ305biXToej0xqGSI78NTa+jcQVkVRzC+U?=
 =?us-ascii?Q?TLcrDW5uF+rjI7NB2sTYj8b9oB3EcPevIZcnnuBFOPnOxhdW7URhk2kHxW/9?=
 =?us-ascii?Q?Ou4hsJSqRRPxp1qrAYFYAeN9I5VKZLhSyNipcgbPnuaDMyFCg/YtvvEvFjnH?=
 =?us-ascii?Q?R84OCgvew8hu0/kEHHjv9UGYNfF7uE0QvkEEvoc3yknXW9zYg2KA1vATvb72?=
 =?us-ascii?Q?vkHvgFvRSkQ0456sz8SLmc0LQytbsCywIhNFypvXMst20J2JAKcBKfsIUy+k?=
 =?us-ascii?Q?5eqtTDcFQ5npcOgiwttqXV2znk4Qaf6+4jK11FRAY4I9CLz6XbmbP3pHG968?=
 =?us-ascii?Q?blLnySxhhLEk5Gur9IiFAj9ZTpjsnNE7vL7CtR5QYVsgYq7QZi0Oo3Pl67Qy?=
 =?us-ascii?Q?igWaQO8Y2rxBh/wyvwSzX9vDRRMLrmMdB43nUjHXvHRTCYJRbeDv5SUZUrso?=
 =?us-ascii?Q?9T8Gh4EchA8SLWTDTWzAn8xkcIHSGWCa/V2XHY0CojmyB/Az/fIZjJ8Ow2yt?=
 =?us-ascii?Q?YAv3iy3fVbdoZbXVXmCptbl6Dk9wU00Jp3ssHaQQCri0HaN+wklDy/Fkg+xO?=
 =?us-ascii?Q?E1NF459SWnCOw6+dKO1qjj+VCg2M/tD9U0sI8rIkGJ//tPl54bFIu1PWRMmW?=
 =?us-ascii?Q?K3uIRqx5wQJFGZEkUbK7Hdu24lNcKiAjbM44BN27CPJWFu7YlYTEPhGGO+Eo?=
 =?us-ascii?Q?ay4UnAT+QL2usGVgW4fM7JedNM/Fz2rWl0O3O+QwPs++6I2i3+6U6rM56t0v?=
 =?us-ascii?Q?A004a6GXuLEv/LEqPSdCLuNpjg8gb1WLZUmZWiSfpydnQaXRljLDgzyi2QWK?=
 =?us-ascii?Q?RTTG4MiQZzEvIEOc9HtZiMs2v/d9p8Fr7c5W1b99ZkYzMlztJ8sC1mlQVo3v?=
 =?us-ascii?Q?PYgnDfVqgMVgSuexO/XPd47Acpm2sU0zPLtlEAA/Tn3ZV3BaJrwXwoBBCcMK?=
 =?us-ascii?Q?tXjfNKW5lMeLVIqtFyIO+SD2i7jCLnBQqEk83qWoNWdPcEXZ1tT/BGybj7fT?=
 =?us-ascii?Q?66G0u12m1KXL+4YovJ1xvo715iz7go1Jyi6Ay9jif1ovGwjHpDKEk1/XxFz2?=
 =?us-ascii?Q?+/PaPaYovmJJsb5Q4O2X4jTLczCR7tnbMmfkJk/IcWpd3/DR1G4fR6Hkaftg?=
 =?us-ascii?Q?GRvZSp4RiFUqWFS0/+vI+70IBDwEbGqXibmpddUS31J+nEyKRT/ctrnUJ1Af?=
 =?us-ascii?Q?37HYwyaxri6mzt7glg2fGJlGQtgE0BnN13BPOliXxXGYp5eXgBbyovE+TVo/?=
 =?us-ascii?Q?pdg=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb7aa09-0490-4312-90a2-08dd96d097e6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:28:00.5133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

The kernel now has a dedicated driver for Touch Bar on Macs. Since
function keys can now be accessed via the Touch Bar, emulating them
using non standard ways like Fn+1=F1 should be avoided.

This patch adds an fnmode=4 which ignores only the Function key
translation, and is enabled by default on MacBook Pros with a Touch
Bar.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 90 ++++++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 36 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 0524893f7..b6a48845d 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -42,8 +42,10 @@
 #define APPLE_BACKLIGHT_CTL	BIT(10)
 #define APPLE_IS_NON_APPLE	BIT(11)
 #define APPLE_MAGIC_BACKLIGHT	BIT(12)
+#define APPLE_DISABLE_FKEYS	BIT(13)
 
-#define APPLE_FLAG_FKEY		0x01
+#define APPLE_FLAG_FKEY		BIT(0)
+#define APPLE_FLAG_TB_FKEY	BIT(1)
 
 #define HID_COUNTRY_INTERNATIONAL_ISO	13
 #define APPLE_BATTERY_TIMEOUT_MS	60000
@@ -55,7 +57,7 @@
 static unsigned int fnmode = 3;
 module_param(fnmode, uint, 0644);
 MODULE_PARM_DESC(fnmode, "Mode of fn key on Apple keyboards (0 = disabled, "
-		"1 = fkeyslast, 2 = fkeysfirst, [3] = auto)");
+		"1 = fkeyslast, 2 = fkeysfirst, [3] = auto, 4 = fkeysdisabled)");
 
 static int iso_layout = -1;
 module_param(iso_layout, int, 0644);
@@ -121,7 +123,7 @@ struct apple_sc {
 struct apple_key_translation {
 	u16 from;
 	u16 to;
-	u8 flags;
+	unsigned long flags;
 };
 
 static const struct apple_key_translation magic_keyboard_alu_fn_keys[] = {
@@ -211,19 +213,19 @@ static const struct apple_key_translation macbookair_fn_keys[] = {
 static const struct apple_key_translation macbookpro_no_esc_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
-	{ KEY_GRAVE,	KEY_ESC },
-	{ KEY_1,	KEY_F1 },
-	{ KEY_2,	KEY_F2 },
-	{ KEY_3,	KEY_F3 },
-	{ KEY_4,	KEY_F4 },
-	{ KEY_5,	KEY_F5 },
-	{ KEY_6,	KEY_F6 },
-	{ KEY_7,	KEY_F7 },
-	{ KEY_8,	KEY_F8 },
-	{ KEY_9,	KEY_F9 },
-	{ KEY_0,	KEY_F10 },
-	{ KEY_MINUS,	KEY_F11 },
-	{ KEY_EQUAL,	KEY_F12 },
+	{ KEY_GRAVE,	KEY_ESC, APPLE_FLAG_TB_FKEY },
+	{ KEY_1,	KEY_F1,  APPLE_FLAG_TB_FKEY },
+	{ KEY_2,	KEY_F2,  APPLE_FLAG_TB_FKEY },
+	{ KEY_3,	KEY_F3,  APPLE_FLAG_TB_FKEY },
+	{ KEY_4,	KEY_F4,  APPLE_FLAG_TB_FKEY },
+	{ KEY_5,	KEY_F5,  APPLE_FLAG_TB_FKEY },
+	{ KEY_6,	KEY_F6,  APPLE_FLAG_TB_FKEY },
+	{ KEY_7,	KEY_F7,  APPLE_FLAG_TB_FKEY },
+	{ KEY_8,	KEY_F8,  APPLE_FLAG_TB_FKEY },
+	{ KEY_9,	KEY_F9,  APPLE_FLAG_TB_FKEY },
+	{ KEY_0,	KEY_F10, APPLE_FLAG_TB_FKEY },
+	{ KEY_MINUS,	KEY_F11, APPLE_FLAG_TB_FKEY },
+	{ KEY_EQUAL,	KEY_F12, APPLE_FLAG_TB_FKEY },
 	{ KEY_UP,	KEY_PAGEUP },
 	{ KEY_DOWN,	KEY_PAGEDOWN },
 	{ KEY_LEFT,	KEY_HOME },
@@ -234,18 +236,18 @@ static const struct apple_key_translation macbookpro_no_esc_fn_keys[] = {
 static const struct apple_key_translation macbookpro_dedicated_esc_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
-	{ KEY_1,	KEY_F1 },
-	{ KEY_2,	KEY_F2 },
-	{ KEY_3,	KEY_F3 },
-	{ KEY_4,	KEY_F4 },
-	{ KEY_5,	KEY_F5 },
-	{ KEY_6,	KEY_F6 },
-	{ KEY_7,	KEY_F7 },
-	{ KEY_8,	KEY_F8 },
-	{ KEY_9,	KEY_F9 },
-	{ KEY_0,	KEY_F10 },
-	{ KEY_MINUS,	KEY_F11 },
-	{ KEY_EQUAL,	KEY_F12 },
+	{ KEY_1,	KEY_F1,  APPLE_FLAG_TB_FKEY },
+	{ KEY_2,	KEY_F2,  APPLE_FLAG_TB_FKEY },
+	{ KEY_3,	KEY_F3,  APPLE_FLAG_TB_FKEY },
+	{ KEY_4,	KEY_F4,  APPLE_FLAG_TB_FKEY },
+	{ KEY_5,	KEY_F5,  APPLE_FLAG_TB_FKEY },
+	{ KEY_6,	KEY_F6,  APPLE_FLAG_TB_FKEY },
+	{ KEY_7,	KEY_F7,  APPLE_FLAG_TB_FKEY },
+	{ KEY_8,	KEY_F8,  APPLE_FLAG_TB_FKEY },
+	{ KEY_9,	KEY_F9,  APPLE_FLAG_TB_FKEY },
+	{ KEY_0,	KEY_F10, APPLE_FLAG_TB_FKEY },
+	{ KEY_MINUS,	KEY_F11, APPLE_FLAG_TB_FKEY },
+	{ KEY_EQUAL,	KEY_F12, APPLE_FLAG_TB_FKEY },
 	{ KEY_UP,	KEY_PAGEUP },
 	{ KEY_DOWN,	KEY_PAGEDOWN },
 	{ KEY_LEFT,	KEY_HOME },
@@ -424,7 +426,12 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 	unsigned int real_fnmode;
 
 	if (fnmode == 3) {
-		real_fnmode = (asc->quirks & APPLE_IS_NON_APPLE) ? 2 : 1;
+		if (asc->quirks & APPLE_DISABLE_FKEYS)
+			real_fnmode = 4;
+		else if (asc->quirks & APPLE_IS_NON_APPLE)
+			real_fnmode = 2;
+		else
+			real_fnmode = 1;
 	} else {
 		real_fnmode = fnmode;
 	}
@@ -534,8 +541,16 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 						do_translate = asc->fn_on;
 						break;
 					default:
-						/* should never happen */
+						/* case 4 */
+						do_translate = false;
+					}
+				} else if (trans->flags & APPLE_FLAG_TB_FKEY) {
+					switch (real_fnmode) {
+					case 4:
 						do_translate = false;
+						break;
+					default:
+						do_translate = asc->fn_on;
 					}
 				} else {
 					do_translate = asc->fn_on;
@@ -1139,19 +1154,22 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K),
 		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132),
-		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK |
+			APPLE_DISABLE_FKEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680),
-		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK |
+			APPLE_DISABLE_FKEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213),
-		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK |
+			APPLE_DISABLE_FKEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_DISABLE_FKEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_DISABLE_FKEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_DISABLE_FKEYS },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO),
-- 
2.43.0



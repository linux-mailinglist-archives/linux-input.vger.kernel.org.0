Return-Path: <linux-input+bounces-13036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDCFAE85F4
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 16:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1D0B178456
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 14:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB0C265284;
	Wed, 25 Jun 2025 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="oqR8MTm5"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011027.outbound.protection.outlook.com [52.103.68.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442025BF0F;
	Wed, 25 Jun 2025 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860985; cv=fail; b=VKiSMK0ARuO4OmmhxFvOiWnR7iP1s7nea4If23SjzzqLdtHhNeVrgl4M0ABmnfzJyGAY0vsXDnX9o/rFkQaVT7nh012jXI6xjCH2GQbc7Z4LQBdLKJY1ZAlnx1wAtVtyJ6HI5hOXAtcUA6ArQvL9Yn9HkdHNN0AnXT+CYvS/a9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860985; c=relaxed/simple;
	bh=fX32WhIZwch6xBBuhpEtzcqtCA+OANhM+ISdG8ldkO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HX5iBaMwc+fHBYfqDIgf5wAwpgz3CrXxSeMrA3Bv07RSTW9mUV49ApCWsFT0suo+EfCcW+NPwxOIbR8GBAqkGIeuP4Da7lm2sH75Ls4WiKFYJDNBy6wGSuBb6VYiE0cxkhG/NV+CPZBuoKOpAvQn8CBCKKEMKSS1FBAXe9INQYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=oqR8MTm5; arc=fail smtp.client-ip=52.103.68.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6I3RznQmL9YjBgGcwkNnoMCyYs0voxvaLjsug6MUm0m6i8gJ/3zi7h+r5lYiw1ZuBAiU+2+kb4UprzZwYvqLViqYy1oJt1g7NfpCRyMwJdFlv87bIU2RldxqcA2L5j/Vxv+7SX2dGKy46rP1hDunaEMaJO2xeYKUoKpz51azerz4s0yfMurrWFOq0Vd6mnHHmlEYmjmUveLUs5yNSjGR2nH+f5gtHeLjOyEMeGq9BUYEsv/oiAMZvdtFE5c4sR8m+HJZHEhAZRxKvF4soESmdFSN3y5q+PTd+OGKZgeWzkEjOxr1Db4Acd8A1yL47QdRuUfkmwOBVMcQfS25XvmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSiwcWVte/O0L8VbxuJVTXHGCFuPMp8ue+LChg7USjQ=;
 b=IoYMVgO/X+EeOj4MFannGKAQ2waFg058DF0EK9hHJoFa1Ut+gI7QBY3yoHTtXwIw7OSe+16HtgTeaK8HQxVXx7v88LvNZ6BLtqRk8GhVltR8rOnyPWcXi8UGJXaapcRVxEKVpKzSSDJrx3CXAQO32kEcMynUm6sNLWvK0scl70coOvVTtkEJfjiOnNRA/AsY8qYBoAdXYgx71G0c3OqZ8AYAspE+IMR/CgcjVA3RC9snr7YERgcZkN6lGpRcIJ6EXF0DpqVBOhXRbWAyMfqwg2e9Rt9kHarYT8Q9Xx4yHiBdA/5KBrG+EzfjnVBxXU5OsVgHCj0ZQixno1f9rAkjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSiwcWVte/O0L8VbxuJVTXHGCFuPMp8ue+LChg7USjQ=;
 b=oqR8MTm5OFE0G4nVbSViBFNiF20OeciJ4L4Tbz1YUErZ/hkMUjGFHv/69Kw6kiu0CQBO8WwErD58PpICr33c6ZrfHA9gVGBCP2G+sLInzswssC+kgjl89MDJEkceiCYxnzphj5KtxKIcwmibmMseZ8zYyxQyIG1qPaMdSPB2qOWcd9WidGVpXRIGINr/1Zav64cbI0ezKHCrykzawxZhblFMAk302PXVT5QAovrr3B8qAv4RctBzCmiUtae0gzC4YsDFdhsVwbPtUd08QXt1w6b1EN2OMqgfAwjq6NI1nYd5K9tkQvlH6oWAkwLDc9pY6w0DpdKkcdHKH54neeXB+A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB8883.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 14:16:18 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:16:18 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] HID: magicmouse: avoid setting up battery timer when not needed
Date: Wed, 25 Jun 2025 19:46:04 +0530
Message-ID:
 <PN3PR01MB95970C5D46483D0367C1D63CB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250625141604.35609-3-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 2731efa0-439f-4d93-a35d-08ddb3f2da30
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|461199028|5072599009|19110799006|8060799009|7092599006|41001999006|440099028|52005399003|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XKGZ7Nqk6a7VWO/Vle1E1uwmn43cIuOqDArHM78mJ/P2wg2zKjLvZwB3UcTJ?=
 =?us-ascii?Q?NOeRhhYyYO/WtUIFopK+0U0g2+cDanYnx932G0d8d2qKEcJcka7YB4PLyxGE?=
 =?us-ascii?Q?xF2ysAV41YYxAri8uR5PRyGT3e6s5CvoUSctMWVIZ5qbchT/FiSxnlCTx+Qi?=
 =?us-ascii?Q?M3FKyiMwf47bZeAEmL3/0XChHYs9+WXsfh77uH5Pk2pVUZ4RA3IXZ1eMmbbV?=
 =?us-ascii?Q?RWUbHsYxZBkE3aHKGmH29dNEcABk7n6l/PmdwnCoyMNP0LQA7vb3Uz+wEu2Z?=
 =?us-ascii?Q?d4wJOw7k8Xy5dZldiEg3Ffk2Eq8/zqzMyY3XbGO0jPSd0NkGWoBm+L5VjIKJ?=
 =?us-ascii?Q?ELK6zf7I59mabJn/WRw3MN6ePkwueSohpLABVaX2hjjKO4l9+5pXsKnT0rAj?=
 =?us-ascii?Q?OcFJxhlxbtR3v6bfRDpxpYKWBz7h7k1w4eGIP3o8G/+KPpAf4NnUs95GLlVZ?=
 =?us-ascii?Q?/Ies9atV4OuOTdT6T8mJzjRKHW5VUg9u3MPPXvXC8aaiZQl4nFxc4bUgc3Gn?=
 =?us-ascii?Q?Z1/YGURLuYm46DvFMkyuvVMePhfMyEXO+PGLieBCDJzPb8R/WOhdYXJ+8hEh?=
 =?us-ascii?Q?BmRBb40qCowtLaosqgGZ4l5g3SF9zXN0apR8d/htvl819CupPvHGziG1L3Zv?=
 =?us-ascii?Q?NPZpXtry3SGffhvxaftimnE7whJfA7hcMiYQgZr/jVdxDdHa2UsfbmYJVgU6?=
 =?us-ascii?Q?U/kUQdc3KdopCd+NOgrUkYjliZY2QE3BjU2yrBHippRb9cg8G1WhQCh+MS45?=
 =?us-ascii?Q?Ghjus2KtQ8tUZgYaLUr0dXesQB7XVd3Oc3mP45kLt4gRLcLYrbv5r+iMVK+7?=
 =?us-ascii?Q?Nh4a0PJW16cIT4mY+8rsAMD5+P/ujw26E1r1E/Hsf8Zb8i2K/aaOnpPRV0zQ?=
 =?us-ascii?Q?CcR4HcJkSL0vCW7HfqW1CguxBtf3u6J3MQlNE2RerG56hiSJ5TFUV9OW/2Ue?=
 =?us-ascii?Q?1l/CI61uukYaCMtKM9oLypSEZR+dvvqjE80i7NVqgn2shavPkZZVS7w8xcv9?=
 =?us-ascii?Q?ZzDR+rzf/jPM0DNhgclvVUWneYMT4kXgUV5PDoO8t+uUhq3izLY977XYtn/I?=
 =?us-ascii?Q?5x34hCkjxtaaij/FYUUtKV1FOdG3JOS2NA17ClBk5BeKbq9gI19NzsMR5OPP?=
 =?us-ascii?Q?dTYZIpSkQruUbMlI/4Xr1KFGSDgjMPkzIdLAfW9pb/9DVEXkGr9Enn9ICwNB?=
 =?us-ascii?Q?J2FVWfrRyIAw7+6iWxp3lBLUTVq3Xu27rE3QTA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hyv+nVxsnmQv53GdI6YLWnipChF77VWNSsZH+oln1vR5ECfLFMJGD+OGCDmr?=
 =?us-ascii?Q?PTgjMVTXC21D3jTqHUmqTBJnQdxiZN57ZkeXAYP3HTENglAnm+6XJvYBWq20?=
 =?us-ascii?Q?1CEgcQwGmuL7lBaQSfnxBuwbcUGjgF/0eLNkmvVeJZ57m12NVK3NJk3D2kMJ?=
 =?us-ascii?Q?L3NXwWdsoDSKY5i1YLMdEggVPSd74MU0Z1xds7QbNPOQghP0PzzzJq/a7MmW?=
 =?us-ascii?Q?jq+z1j70xLBAy0LmbXREIflNQkTq72ljsfirF96b9V3h3ryTXYCpXdXmNvE6?=
 =?us-ascii?Q?VPirtyGau9ydfraQ6Z3UTX/T6KCiYkrg8+GM8ELy2a0DYO1127TnV7rBZLvU?=
 =?us-ascii?Q?FxS2GwDlij5Sv/rGFrzSniupGdat7mwwTbb0nwwuo53pzDNWDx8HRmxWC48k?=
 =?us-ascii?Q?BIgnxqBcKdsw8wWjKGzzIpCyr8fYDz0CUASi89Pin/u9PwzhM2D2JeF7vABA?=
 =?us-ascii?Q?BXq0bXJUPulRpy0pcCfdw1/G7lpChvesrHc8tSxYtm5jK8warO/3lPIjkABT?=
 =?us-ascii?Q?cwNa+gkuRk45HNgf6OX/twkkPzVnQgcNSJaQ4DiuL4mkpz9xWoHeABEL3Xza?=
 =?us-ascii?Q?q/bFPW4ukhhxdsU79at6x9LfUnay5SsBZqvYFQ+Mv6sm6S7e2h/x555qOkbr?=
 =?us-ascii?Q?HcXPi6WRqI4E2QG/dpA6/0C0Z9lyRu9OjH0UYxXRZZb3k7UzuZWGCIDyEMQ5?=
 =?us-ascii?Q?sxOwDwyqR5HUaJmXiQXb9KxXQ761HoHlLETkaMqYz8tkb9uS5FZqkIPzOepm?=
 =?us-ascii?Q?C6NaruLmHkbZ93uWwyVS1UEk3H2tamE0jrJQcwm8qpI4wBYIE5mgy5T9qX9H?=
 =?us-ascii?Q?+zNCknNl9qMRFJVnT2dc88WSKYgqJ50bZzQ1pdp74sxngNfw2Hqothj2XY7V?=
 =?us-ascii?Q?RQlaFDA6jVPfSCjLinIiTq0DhqNsAGwDeJuqOjSgFg5J1/Y6LrXfTLmdxlOc?=
 =?us-ascii?Q?/AZlm2RE4rDb5DsbFRYJDop88bSk2UX27SEC0BF4EfFAE9f3gmqFTj/5FFit?=
 =?us-ascii?Q?dh9yPsY40kJhOMPvPwiDexF4neCb2RMa/ymFmNJ98CHXgKnV3uSqEn58PFM7?=
 =?us-ascii?Q?rboa/uZGHnOsIwDTdyFmJ4V5D8Vp7fvOIEXb7L/2mHRmnj3OvZ7tKeE3LeuG?=
 =?us-ascii?Q?3sOn2d3+Bf4z48qr4IUqupaoXOWPv4iKk6FNkD92SJ5FQJJn95Y4fDvjQQ/g?=
 =?us-ascii?Q?LiRu3WyKvT9kbmLekuVc/D/JDbY3OSZGyXwMa6CebaDCpu6AkB5Be+LHqoU9?=
 =?us-ascii?Q?EIlJtTKfwsPxQwH3c2FgZzzRvTLeRn8FX5RK9YLOC1DWQEESbBGjetg8nTsO?=
 =?us-ascii?Q?eVPHrVb2EyWTijsn9btbUZar?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2731efa0-439f-4d93-a35d-08ddb3f2da30
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:16:18.4498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8883

Currently, the battery timer is set up for all devices using
hid-magicmouse, irrespective of whether they actually need it or not.

The current implementation requires the battery timer for Magic Mouse 2
and Magic Trackpad 2 when connected via USB only. Add checks to ensure
that the battery timer is only set up when they are connected via USB.

Fixes: 0b91b4e4dae6 ("HID: magicmouse: Report battery level over USB")
Cc: stable@vger.kernel.org
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-magicmouse.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index f49405d38..3e531905b 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -863,18 +863,22 @@ static int magicmouse_probe(struct hid_device *hdev,
 		return ret;
 	}
 
-	timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
-	mod_timer(&msc->battery_timer,
-		  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
-	magicmouse_fetch_battery(hdev);
-
-	if (id->vendor == USB_VENDOR_ID_APPLE &&
-	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
-	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
-	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
-	      hdev->type != HID_TYPE_USBMOUSE)))
-		return 0;
+	if (id->vendor == USB_VENDOR_ID_APPLE) {
+		bool is_mouse2 = (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+				  id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC);
+		bool is_trackpad2 = (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+				     id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC);
+
+		if (is_mouse2 || is_trackpad2) {
+			timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
+			mod_timer(&msc->battery_timer,
+				  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
+			magicmouse_fetch_battery(hdev);
+		}
+
+		if (is_mouse2 || (is_trackpad2 && hdev->type != HID_TYPE_USBMOUSE))
+			return 0;
+	}
 
 	if (!msc->input) {
 		hid_err(hdev, "magicmouse input not registered\n");
@@ -947,7 +951,13 @@ static void magicmouse_remove(struct hid_device *hdev)
 
 	if (msc) {
 		cancel_delayed_work_sync(&msc->work);
-		timer_delete_sync(&msc->battery_timer);
+		if (hdev->vendor == USB_VENDOR_ID_APPLE &&
+		    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+		     hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
+		     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
+
+			timer_delete_sync(&msc->battery_timer);
 	}
 
 	hid_hw_stop(hdev);
-- 
2.43.0



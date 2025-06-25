Return-Path: <linux-input+bounces-13035-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D6AE85F3
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 16:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 821567B41CE
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 14:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD48478F54;
	Wed, 25 Jun 2025 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="C+2XWMUM"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011027.outbound.protection.outlook.com [52.103.68.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0E8615A;
	Wed, 25 Jun 2025 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860983; cv=fail; b=qx/piTORwC1L+c+eYPm9Hw5L0X0fOYtVuKWt7F5/8kyh3APxTPNwlDddsn7SBeh0zX6rseQKFvv+gqLxEVPfHgWyTb58vgPrgM705sIwZvsRJKVK7Mc47KJDA3Z8JK4cYDTX1EY2NMv4h+wMI6N0EA5cIBBPvwRn/0xMjudz/IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860983; c=relaxed/simple;
	bh=J6dxF0O5iPOD5OOEkFCI3XVdBG73zj9AamaNiLD9aFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YlemPdzRhfYAZa0YI8eJwap0t+emEIctjXo7gKWi/YBVWmJJ9h2nswdAJmrJdq3fj+Nf3TssnRNmTCdq60jd1DBCV5bErPVVLYPCOEM+DpfWzNafuAoYwn+hZb3INlyJc85smLddF6rFlx/fk8eQA/kZHOvmqVTQzF3wAmcKpgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=C+2XWMUM; arc=fail smtp.client-ip=52.103.68.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlJybmzaTkaR9Sn+sibM8G9UYGuRC4dB8honHqqEV8iQuD0gFGEBX7sW1/bS+c00F6U662Nbq8vsIOOEGCfzAXD0Bv4PADR/mrivfE91bbr8g2D2+4ObTXDMR6UptRE0Ahld0ZM7zlkBUNCgdCOTuGd+Cs4fh1UE7/CZXZV1x9cQubAEfydbjLtV1xvLp0i/4bI0m0aMEBTV0YViwSucboOgFbHlC0Wq9YeQjiW5BB+jxeOHTpSvMBW+UNDDTusrcKZrU1JT51AVjA9gfjhAndH/VeaU7YjxR7kQYk6QTCd94hLJ3tqXnU8H+TudIVRqhtk4RDv4WAE686EkUkdCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzruIjDc+SKGVNU+bs86Xj7JX1KWond+nOGkZzESBBo=;
 b=qeXlUDtI+wZ5Pklqmm06kuV+toCSE2cfDTjFughkBIAaqU4JDjo0OH/LR0jirWowXXXvPSywo2b5S/GEeX4yuK9lzs4tGdCedKJpPAvgUREspYbmWw13X+a50OlFxARQBtlQUBv8XwfXegw+SzTPXL27U6bNXL/wA68SaFcow0kHdjOTaEbhJXLyjU9y0cYbCMsrZre52AYeWqzkQQM40qZyDtvXaZxvgwOexjBIGwmo7p/nj6yTpp6/CyU/6p5zLzXnI1zyJLq3lTJrRY29rP7xECvnakFB3Q4OED1zH4pl+9rsZbwW3kClchN7TEeDa8RPGUyQ8rEbnBociCV81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzruIjDc+SKGVNU+bs86Xj7JX1KWond+nOGkZzESBBo=;
 b=C+2XWMUMrcSWi+uWOlVd/QPw/Heh0a6pTZtntXAHZqdKiejFgHIBVLlbf8l4RaQPYtFv5kG9b/ZzA3N4eoYI0AIbWlangfKBT6ShAWzgZ0yxUqL3m/8GbyeenjljpLMYUT6B48D4rXIktTjttMfHrHvlyxazbaUnXjWzz/wJM0/3bo9LhJ4yJxkHzYGDfzj/5CnSUnQCMd9yvgzEhYDVg1Ru6zS5W73NcXLM1ebdLlbvb5MB57IHdYn1eYGpRa3riKhQYl3vKWBsxO7JNsYlG7JDNaakNht5PIS0hDEs2xDpsmYs2erP4p75xsqJXbEv78vFzPU8ROo7Z/xZWAaoVQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB8883.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 14:16:17 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:16:17 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] HID: apple: avoid setting up battery timer for devices without battery
Date: Wed, 25 Jun 2025 19:46:03 +0530
Message-ID:
 <PN3PR01MB9597321C9A619D3CB336FB23B87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250625141604.35609-2-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: aebc2ebc-1e58-450f-72bd-08ddb3f2d96b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|461199028|5072599009|19110799006|8060799009|7092599006|41001999006|440099028|52005399003|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lu5t6d5LfYBPgz1Q4OvBNBnDKOHXYeVvR/mA+8dKwoLHceJs92LOkd5jRIrM?=
 =?us-ascii?Q?N30Z176wbCt0JV52makZkTxZCvanl9j2W+bQedCzBV7wz7oyNZQ7C/pC2Tah?=
 =?us-ascii?Q?Oe82Zd+Kl0+QPqWTotKTy7e/FvpApYc674PtMHqT2HjmWOCR2gnfsYY+QSRq?=
 =?us-ascii?Q?qrWTSsxuMBtkSVDLkObTBOcgizp56WTJTqU9oAUnGcgaAiIy7U0lOE7CZ/vD?=
 =?us-ascii?Q?C8lTmUf4fxXgTvlY9EBVTochvuFLklU4wO9VEEHq/Kml3YBalSCaM7RQIiMB?=
 =?us-ascii?Q?YsFcq0FiQBOWcYVrZwvXwOHzSQqtA6pTJE+liASoG+++O5WHp0p7NRPIhuoC?=
 =?us-ascii?Q?rET0HHJ5J2Y9vX8ZzM1Qz+nGxxvSCLP7nfcuo5IFfXfiTBVKP7G64EB2GkyT?=
 =?us-ascii?Q?DUTz0PQS3+iCxSXxitilV/zUA+wLMXC8D3hHVHvwBomOLdProZ7euVTNUrrj?=
 =?us-ascii?Q?Fe45PG88cNvCwW7nxxl2scXKAIlHkr/pVR5LkxEv44eTsAcr6WkcRZFmqPgh?=
 =?us-ascii?Q?GRh+UyUKBeP0XnRku7BcjDoPYU7Vj2jvfKkSVt/NI73mozLt9lpbtwSUOE7D?=
 =?us-ascii?Q?P8T8yB1x+pIVP+i2q4IKLHMNfIcodNQNiv3tMogk2lNzqcSx8DbK/J9v+7ys?=
 =?us-ascii?Q?6aOodEvGBnH3GciN2nHztd8ycfqy9fjwA4ZPdeur8u0wvGFykuWX3lZBhQ5G?=
 =?us-ascii?Q?pywYdYRDxCSBc+hQd+W5bx+hre615J+cqdln+FwYcci8pF1bOOyaRLjMiXyp?=
 =?us-ascii?Q?+kk07M6GKGUDIKch44XLcB50gkhjZX2H++Bo5Dk7YoS8krDEw75Ln+Mjz3u8?=
 =?us-ascii?Q?VIho6p6WBhsDZDuq/CWf7X0EaByyg9PT7N5HPEQmpjG7d8bmTDOynU851xNq?=
 =?us-ascii?Q?G2ZnYpO+kJLeyCnxXEvIl0/XqegcpIDTRiKHZSN2t7wRaZldzOo50fIDnr5N?=
 =?us-ascii?Q?JU1Ge5VTDE4J0xmlO/dCycJhm9jCfqjPfBWYeaxaFucoWtMnpjUH6hGvrl73?=
 =?us-ascii?Q?tPDRgGaGuiPZ48zK7RlppIwHXwRjvVxkVpasmvIBzzz3ln0FKy+0wZ57VuMf?=
 =?us-ascii?Q?ogj619GSLlTPuN7LX6ntpyrEWnq6rR7Jyh/SkDIgI1m3gnnMkxMYJH4buqY7?=
 =?us-ascii?Q?aRwGoXK0MfV08YbAyF7IU8GddO2Vj1XyUQJ86ZSTWWvMnE3BhNz6cDqTPdZi?=
 =?us-ascii?Q?K/hu12KbWzWAyTUay9Qq7G//mLglVMe2DraJoA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZlpTwFNBb1DVZx5xw5J4TpSl8WrCEotKAIn6mTJlmhsmYR+mlZ5JI+9dEJcq?=
 =?us-ascii?Q?MnWt6atJZ0/VWANzrm1AwWImWN1m60HUcbRC32ZTrWNq7s4XUd3hLFgczgNk?=
 =?us-ascii?Q?cxv8CybnSRAxCjRIUTNHndZi2MJHMNWyIWHOwAlQzAQNASLDuku2msFJQPOK?=
 =?us-ascii?Q?OExFmUQLmdW3FKVm6c7lRTvzYgIdGRtIvT8yK6GA/CAszUlPCNKOvVbM91yf?=
 =?us-ascii?Q?qMLu70qP4TYNWHBcJwJuf9coDIgcG/VZyaDxtfP0bK7mC2txjVoUzYgxc2JG?=
 =?us-ascii?Q?C8QcOgUuWynrNKIJAZwBX6YGtreY7iyWtjHeDM5o8wmkgzfM2N8I60SRZ2Ts?=
 =?us-ascii?Q?4mb7N98mkP+fWMAZOfhoP73+CYFtY/7ycBpNXW8cW5zYUQiEiik+kamg3kDH?=
 =?us-ascii?Q?6zRhwHWDbWbe4EtiIW9vB8dqUvDv6zYjLi2j0jC4fswN6xWcfOvSuAxd+JrC?=
 =?us-ascii?Q?0mG4XT7tuWLeOg2JZSwytT7Dq1I2+ui8OybP4HXcxH6ZBpajYrhkzZTmsi1P?=
 =?us-ascii?Q?Z+Dbg9nZ9IdGAu59EYcMfOmRDwHIe2b56qnGDHvaVGE+/dLDDwXiqv9Wjn89?=
 =?us-ascii?Q?KCYbqoDDfNhT9+DNIKmRBIf7ObhywutyamjDm5j0tl3W7h7gy6jPZI976wt+?=
 =?us-ascii?Q?Dgux1dHTZh3IoHfswagAtwIRdXjqX+fDF6Y6kwxBTVA+7KbtRQpc0gBKhtxO?=
 =?us-ascii?Q?nKDaJGXMrBzK6nDQt7yA8jZ1p4u8Ii+j+s3e8ROKCdYGF8DZOPzmA59LQtYD?=
 =?us-ascii?Q?W4UjIjutPSZnM4Gor8sRRTszBEwNcWamhBnbNRIgvOCCX+XQxIHqFcZgypup?=
 =?us-ascii?Q?BLaqUhbw6Q079VJQq10GPsVAHvprsyYkL/7/7jXWBqEOTGUHUFb0dnrVjP5X?=
 =?us-ascii?Q?PH6NaQvwxY5TfMqtLJAzBe4POhA7elQjgpQWORApDnlEtGoTfh+akqB2QRdB?=
 =?us-ascii?Q?RaxR8R7773+lMgqgJc5PXLcABs5xMeUIJYmuETCX8psLXVhEfQUs3GWt+yr/?=
 =?us-ascii?Q?3x6onakJAus/JnyeXMW9svc/iQ2mMXCg8fBHRxpXxb0tgKQjfm9cHx7MaSyK?=
 =?us-ascii?Q?wJ+RbmXPGv2LSRiEXYxg+w78uxltcjGZ9o/5HIAc71hc+wr1bFtA87rulkDw?=
 =?us-ascii?Q?QCdwcVxV7rGiye++Ladql73uwi4lN6p3EbE71llXdeNukKsv49SE2ICXp92F?=
 =?us-ascii?Q?5ApfovxP7PL+dMcuCDWoKyghAlUhZKcEFCI1DK/d7rry256XTD1l/pe81XE/?=
 =?us-ascii?Q?GLHZrmjqh5Ofq7tgGdEPkJgc+h9h+nEkV8qrACgqmqmcqo49eZD0fRuI4K71?=
 =?us-ascii?Q?ZTnzbwpA/DV2mLbjGiFiRLfS?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: aebc2ebc-1e58-450f-72bd-08ddb3f2d96b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:16:17.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8883

Currently, the battery timer is set up for all devices using hid-apple,
irrespective of whether they actually have a battery or not.

APPLE_RDESC_BATTERY is a quirk that indicates the device has a battery
and needs the battery timer. This patch checks for this quirk before
setting up the timer, ensuring that only devices with a battery will
have the timer set up.

Fixes: 6e143293e17a ("HID: apple: Report Magic Keyboard battery over USB")
Cc: stable@vger.kernel.org
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index b8b99eb01..b9f45c089 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -959,10 +959,12 @@ static int apple_probe(struct hid_device *hdev,
 		return ret;
 	}
 
-	timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
-	mod_timer(&asc->battery_timer,
-		  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
-	apple_fetch_battery(hdev);
+	if (quirks & APPLE_RDESC_BATTERY) {
+		timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
+		mod_timer(&asc->battery_timer,
+			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
+		apple_fetch_battery(hdev);
+	}
 
 	if (quirks & APPLE_BACKLIGHT_CTL)
 		apple_backlight_init(hdev);
@@ -985,7 +987,8 @@ static void apple_remove(struct hid_device *hdev)
 {
 	struct apple_sc *asc = hid_get_drvdata(hdev);
 
-	timer_delete_sync(&asc->battery_timer);
+	if (asc->quirks & APPLE_RDESC_BATTERY)
+		timer_delete_sync(&asc->battery_timer);
 
 	hid_hw_stop(hdev);
 }
-- 
2.43.0



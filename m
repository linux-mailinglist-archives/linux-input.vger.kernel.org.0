Return-Path: <linux-input+bounces-7097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D359099169F
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 14:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DB971F22A81
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 12:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FE114F9FF;
	Sat,  5 Oct 2024 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="nmohr6h0"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B52C14C588;
	Sat,  5 Oct 2024 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728129828; cv=none; b=oomoHCnxFQkSe61JDXW/GOnIF3q09V9PF26YE/IF+BAGCdKnsGZhhw+YEyjEFdQI7nkYJXTJ4DxaJPZsbD5Arptc4CUX7HfGKGAZTW1SvSO29/elCcn+iZkrQIco9BL+6sLhP4O6TecuQb4hfIGD5g83QKmt3avvRQwVZlji528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728129828; c=relaxed/simple;
	bh=AoUTk7ZVTlWqnA+1WPmBYFqGmH1zgass1Hv6K/Ac7lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqXpuSxBQCResPo2eXuBW6ix0f5SZK3XJzruViWnWBoD2BQOBuc/mfXoSbpq24aDT5MMZqisOz4NBG5WQhMSgkFAUwVpk7RzK8hw4uqGOQ3DHOIBthI8LwAxd4itB0JSv4RgrPg1cNyIJEWZq3cpUvcf/9wndz5tzq07RYwJebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=nmohr6h0; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XLPFq5s4Wz9tcl;
	Sat,  5 Oct 2024 14:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1728129823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ObizGCt7UEBiFDSHwDfQQHRbYHPcrHTfQHYppe1aSA=;
	b=nmohr6h0gJRq+a4XCiQDYnDLhglwquwT3ojMCtlVIiuQW8mDBXOHpzFSyLvM/RzInvsyIw
	9Qzak8cvclvHaROdNy/OSyTj30N2jnkpPPFa091HaxGAIcfn3+4G3iXAQTL7iDrWHKRtWi
	zEGyj21kKlZTHm6ydSDKtvq2GBjAcWTwA5K4u28E/9tCUvVHuL9HzUwxSkuqCsjf7lFLDG
	2Pq//eu2J+9EMOHtibP4NHnFTVLwbwckXOP/KC7WZWGVmjadtbIUG/aHwwpnWC28OyM/Qr
	KN07abgr45WQFHPMam+0ewYCsfdJ4s/WA3e3p+3xtHJhBhjwK6YnId6ggne6+A==
From: Lode Willems <me@lodewillems.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH 3/4] HID: Kysona: check battery status every 5s using a workqueue
Date: Sat,  5 Oct 2024 13:57:05 +0200
Message-ID: <20241005120256.13847-4-me@lodewillems.com>
In-Reply-To: <20241005120256.13847-1-me@lodewillems.com>
References: <20241005120256.13847-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a workqueue to periodically check the battery status

Signed-off-by: Lode Willems <me@lodewillems.com>
---
 drivers/hid/hid-kysona.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-kysona.c b/drivers/hid/hid-kysona.c
index 91e359c31fa1..403bdc4a5e12 100644
--- a/drivers/hid/hid-kysona.c
+++ b/drivers/hid/hid-kysona.c
@@ -12,6 +12,8 @@
 
 #include "hid-ids.h"
 
+#define BATTERY_TIMEOUT_MS 5000
+
 #define BATTERY_REPORT_ID 4
 
 struct kysona_drvdata {
@@ -21,6 +23,7 @@ struct kysona_drvdata {
 	u8 battery_capacity;
 	bool battery_charging;
 	u16 battery_voltage;
+	struct delayed_work battery_work;
 };
 
 static enum power_supply_property kysona_battery_props[] = {
@@ -104,6 +107,17 @@ static void kysona_fetch_battery(struct hid_device *hdev)
 			"Battery query failed (err: %d)\n", ret);
 }
 
+static void kysona_battery_timer_tick(struct work_struct *work)
+{
+	struct kysona_drvdata *drv_data = container_of(work,
+		struct kysona_drvdata, battery_work.work);
+	struct hid_device *hdev = drv_data->hdev;
+
+	kysona_fetch_battery(hdev);
+	schedule_delayed_work(&drv_data->battery_work,
+			      msecs_to_jiffies(BATTERY_TIMEOUT_MS));
+}
+
 static int kysona_battery_probe(struct hid_device *hdev)
 {
 	struct kysona_drvdata *drv_data = hid_get_drvdata(hdev);
@@ -134,7 +148,11 @@ static int kysona_battery_probe(struct hid_device *hdev)
 	}
 
 	power_supply_powers(drv_data->battery, &hdev->dev);
+
+	INIT_DELAYED_WORK(&drv_data->battery_work, kysona_battery_timer_tick);
 	kysona_fetch_battery(hdev);
+	schedule_delayed_work(&drv_data->battery_work,
+			      msecs_to_jiffies(BATTERY_TIMEOUT_MS));
 
 	return ret;
 }
@@ -188,6 +206,16 @@ static int kysona_raw_event(struct hid_device *hdev,
 	return 0;
 }
 
+static void kysona_remove(struct hid_device *hdev)
+{
+	struct kysona_drvdata *drv_data = hid_get_drvdata(hdev);
+
+	if (drv_data->battery)
+		cancel_delayed_work_sync(&drv_data->battery_work);
+
+	hid_hw_stop(hdev);
+}
+
 static const struct hid_device_id kysona_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYSONA, USB_DEVICE_ID_KYSONA_M600_DONGLE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYSONA, USB_DEVICE_ID_KYSONA_M600_WIRED) },
@@ -199,7 +227,8 @@ static struct hid_driver kysona_driver = {
 	.name			= "kysona",
 	.id_table		= kysona_devices,
 	.probe			= kysona_probe,
-	.raw_event		= kysona_raw_event
+	.raw_event		= kysona_raw_event,
+	.remove			= kysona_remove
 };
 module_hid_driver(kysona_driver);
 
-- 
2.46.1



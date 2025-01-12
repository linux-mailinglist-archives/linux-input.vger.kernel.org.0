Return-Path: <linux-input+bounces-9153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA2EA0A8D2
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74D663A6394
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 11:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA6F1AB530;
	Sun, 12 Jan 2025 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="ZWpfD/jG"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7C1AA7A6;
	Sun, 12 Jan 2025 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682866; cv=none; b=PnYje93D6yYDNHL4Pz3UIbvLnzrF1BUVIBBZvfp4q79g9g1qKVaGTdWMunfXwVDzZ3Xl3E6Yh259RcT02EZej7ITWkMmfavakXvRnlpT6R+/9iXuiPy4O6pDUsjpstmzOHZbSOh0eZ1ea1zOGFObClb6bjjCUcKVQTbIn75iuhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682866; c=relaxed/simple;
	bh=nqBlht6PLkjaqE1mMZtDv1vYeIhXn3G/s/GZRuYr2mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWa5EbZ8SLy8yad11S1V3uycJbHTWIhgSuUp9sJyG8PO8gPoeysYJWYcMmzfuOPzZ2oX6qfUAL2DAIcV6J5NnN1uNkL+knhf6Jk8U8v1XdPf9va7VCHdfehDVdiO9FNmHQKLElrbf/Drd8IX5xALsvXPFQ9ZNDp33SUgo9af0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=ZWpfD/jG; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4YWD9S2VyDz82nZ;
	Sun, 12 Jan 2025 12:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736682348; bh=nqBlht6PLkjaqE1mMZtDv1vYeIhXn3G/s/GZRuYr2mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWpfD/jGBRbHYXu3zuMQQa8Ico/IGykst9L/qEwTAS75cndDwxtJrP9WB7Fls2qFq
	 mMRqEZLkzPWRXqSkKKchvXXMCfClJY3pUNrvxUnkGFnHMROdFX3Vteg3vBwzNUgx++
	 15XIGsbynijoVLGRCdQZjb6oEglTN5D5I9uMJl6ZZ8jRp2MYXgZQ0m2P8x2t9l7Qty
	 JR3DfiSTtcD6/MKJWGiRjXEKu4pXSgyT3ApifNSWqIVKYeIo9Fr63oUpcmuM3LbzfV
	 tfsf++8uJF7aBw37TmJlNIjDieZthw4+azpOLgX7pIvGSaew99zp5EA78h7cTDBDsZ
	 SQFCijLN2y3hQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4YWD9S26CDz4y3x;
	Sun, 12 Jan 2025 12:45:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YWD9R46Mjz8tYH;
	Sun, 12 Jan 2025 12:45:47 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id F19251C020D;
	Sun, 12 Jan 2025 12:45:42 +0100 (CET)
Authentication-Results: mxe85d;
	spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=git@mayer-bgk.de smtp.helo=localhost.localdomain
Received-SPF: pass (mxe85d: connection is authenticated)
From: Christian Mayer <git@mayer-bgk.de>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>,
	Christian Mayer <git@mayer-bgk.de>
Subject: [PATCH v2 2/5] HID: steelseries: add SteelSeries Arctis 9 support
Date: Sun, 12 Jan 2025 11:44:03 +0000
Message-ID: <20250112114438.2196-3-git@mayer-bgk.de>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250112114438.2196-1-git@mayer-bgk.de>
References: <20250112114438.2196-1-git@mayer-bgk.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173668234333.17581.6933279873829176323@mxe85d.netcup.net>
X-Rspamd-Queue-Id: F19251C020D
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: NY/xQFHmUdNfwij+wdW7HViO+ollAXLm1SUNq+QDkplxjiiZN3s=

Add support for the SteelSeries Arctis 9 headset. This driver
will export the battery information like it already does for
the Arcits 1 headset.

Signed-off-by: Christian Mayer <git@mayer-bgk.de>
---
 drivers/hid/hid-steelseries.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index dc4ab55d7c22..2b98db7f8911 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -19,6 +19,7 @@
 
 #define STEELSERIES_SRWS1		BIT(0)
 #define STEELSERIES_ARCTIS_1		BIT(1)
+#define STEELSERIES_ARCTIS_9		BIT(2)
 
 struct steelseries_device {
 	struct hid_device *hdev;
@@ -375,7 +376,9 @@ static void steelseries_srws1_remove(struct hid_device *hdev)
 #define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS	3000
 
 #define ARCTIS_1_BATTERY_RESPONSE_LEN		8
+#define ARCTIS_9_BATTERY_RESPONSE_LEN		64
 static const char arctis_1_battery_request[] = { 0x06, 0x12 };
+static const char arctis_9_battery_request[] = { 0x00, 0x20 };
 
 static int steelseries_headset_request_battery(struct hid_device *hdev,
 	const char *request, size_t len)
@@ -395,6 +398,7 @@ static int steelseries_headset_request_battery(struct hid_device *hdev,
 		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
 		ret = -ENODATA;
 	}
+
 	kfree(write_buf);
 	return ret;
 }
@@ -407,6 +411,9 @@ static void steelseries_headset_fetch_battery(struct hid_device *hdev)
 	if (sd->quirks & STEELSERIES_ARCTIS_1)
 		ret = steelseries_headset_request_battery(hdev,
 			arctis_1_battery_request, sizeof(arctis_1_battery_request));
+	else if (sd->quirks & STEELSERIES_ARCTIS_9)
+		ret = steelseries_headset_request_battery(hdev,
+			arctis_9_battery_request, sizeof(arctis_9_battery_request));
 
 	if (ret < 0)
 		hid_dbg(hdev,
@@ -522,9 +529,22 @@ static int steelseries_headset_battery_register(struct steelseries_device *sd)
 	INIT_DELAYED_WORK(&sd->battery_work, steelseries_headset_battery_timer_tick);
 	steelseries_headset_fetch_battery(sd->hdev);
 
+	if (sd->quirks & STEELSERIES_ARCTIS_9) {
+		/* The first fetch_battery request can remain unanswered in some cases */
+		schedule_delayed_work(&sd->battery_work,
+				msecs_to_jiffies(STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS));
+	}
+
 	return 0;
 }
 
+static bool steelseries_is_vendor_usage_page(struct hid_device *hdev, uint8_t usage_page)
+{
+	return hdev->rdesc[0] == 0x06 &&
+		hdev->rdesc[1] == usage_page &&
+		hdev->rdesc[2] == 0xff;
+}
+
 static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct steelseries_device *sd;
@@ -550,6 +570,10 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
 	if (ret)
 		return ret;
 
+	if (sd->quirks & STEELSERIES_ARCTIS_9 &&
+			!steelseries_is_vendor_usage_page(hdev, 0xc0))
+		return -ENODEV;
+
 	spin_lock_init(&sd->lock);
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
@@ -606,6 +630,15 @@ static const __u8 *steelseries_srws1_report_fixup(struct hid_device *hdev,
 	return rdesc;
 }
 
+static uint8_t steelseries_headset_map_capacity(uint8_t capacity, uint8_t min_in, uint8_t max_in)
+{
+	if (capacity >= max_in)
+		return 100;
+	if (capacity <= min_in)
+		return 0;
+	return (capacity - min_in) * 100 / (max_in - min_in);
+}
+
 static int steelseries_headset_raw_event(struct hid_device *hdev,
 					struct hid_report *report, u8 *read_buf,
 					int size)
@@ -637,6 +670,32 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 		}
 	}
 
+	if (sd->quirks & STEELSERIES_ARCTIS_9) {
+		hid_dbg(sd->hdev,
+			"Parsing raw event for Arctis 9 headset (%*ph)\n", size, read_buf);
+		if (size < ARCTIS_9_BATTERY_RESPONSE_LEN) {
+			if (!delayed_work_pending(&sd->battery_work))
+				goto request_battery;
+			return 0;
+		}
+
+		if (read_buf[0] == 0xaa && read_buf[1] == 0x01) {
+			connected = true;
+
+			/*
+			 * Found no official documentation about min and max.
+			 * Values defined by testing.
+			 */
+			capacity = steelseries_headset_map_capacity(read_buf[3], 0x68, 0x9d);
+		} else {
+			/*
+			 * Device is off and sends the last known status read_buf[1] == 0x03 or
+			 * there is no known status of the device read_buf[0] == 0x55
+			 */
+			connected = false;
+		}
+	}
+
 	if (connected != sd->headset_connected) {
 		hid_dbg(sd->hdev,
 			"Connected status changed from %sconnected to %sconnected\n",
@@ -672,6 +731,10 @@ static const struct hid_device_id steelseries_devices[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12b6),
 	.driver_data = STEELSERIES_ARCTIS_1 },
 
+	{ /* SteelSeries Arctis 9 Wireless for XBox */
+	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12c2),
+	  .driver_data = STEELSERIES_ARCTIS_9 },
+
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, steelseries_devices);
@@ -690,3 +753,4 @@ MODULE_DESCRIPTION("HID driver for Steelseries devices");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
 MODULE_AUTHOR("Simon Wood <simon@mungewell.org>");
+MODULE_AUTHOR("Christian Mayer <git@mayer-bgk.de>");
-- 
2.47.1



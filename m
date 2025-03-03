Return-Path: <linux-input+bounces-10493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E434EA4C063
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 13:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704E93A6339
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 12:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039532AD25;
	Mon,  3 Mar 2025 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="nqQxDPLN"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B35661;
	Mon,  3 Mar 2025 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005121; cv=none; b=GNY47cqt7DVogciHDiwwoCSwSQaiWe33gez8/4iZOlOhLwO6m8TWa5oEEEcdq9twZde1e8PrZWjLzCxQ5qhUI6JWGJL/+1cnoek8vuXFPVDaT1vgOOnAWetiloZnOpT1AL4j+j1Q7+c0c0HzIFucqfK4qJF8NyKOw5Y81wGQctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005121; c=relaxed/simple;
	bh=gagOntmUOKs7s/ZA88qS4PKYLjTS5R1ysGSHJfH1Pjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgE3Tu0i++ZrXJMonBobBJRVOxormJ3ReuBa+J/wAPm+ceKa7i/5IHm4+SqWRF97SC/eoUberz+vwditwQIHdNyRId8o2L1CI/3JNWERcL+GuAlXirnPoOsOn9SVG9B2JhjYscj8vXHB+3gCc+S6XxRpPYbjjIt4hfYmx8Wr0Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=nqQxDPLN; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z5yqV0lHqz9sV2;
	Mon,  3 Mar 2025 13:31:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1741005110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w0z31W3/zSJDKXvZaWqF0G0zeeEUb7BYE0kz46facZM=;
	b=nqQxDPLNx40p0EwQY2AiSJYsu52DxzGBkcIIakHgeNwm0y6eupJ5bbbf2eIAFUWUQLu7cQ
	SMpQ+JOtgKs+tWr3gxkCKAw0E6lLP9e7y41oNRkyy8yu6Dz9q7D33iky79zsPMuxMUGmNj
	O+liqOFZ4X8jcuArMr1Xa2foGqKHgOr7reRBz6A5sPO/cICwUqrXfb4wV8JrGV42DgXM7f
	bw5jrsiK7KYMw6lT6IBXgKKcxHQkl0lJpkc5okFV0CCU6v9lbC7Buo8RXJAkR4yVAmcqQ2
	TiDQqtgtM0x1M9Ocbndn7Gr4Z7lcTn5t9Nr7eME8jRCAb+u9VgIC+Uk6RfIU/A==
From: Lode Willems <me@lodewillems.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH] HID: Kysona: Add periodic online check
Date: Mon,  3 Mar 2025 13:30:42 +0100
Message-ID: <20250303123118.31627-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a periodic online check at the same interval the battery
status gets requested.
With this change the driver can detect when the mouse is turned off while
the dongle is still plugged in.

Tested with a Kysona M600 V-HUB Special Edition.

Signed-off-by: Lode Willems <me@lodewillems.com>
---
 drivers/hid/hid-kysona.c | 46 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-kysona.c b/drivers/hid/hid-kysona.c
index d4c0406b3323..09bfe30d02cb 100644
--- a/drivers/hid/hid-kysona.c
+++ b/drivers/hid/hid-kysona.c
@@ -14,6 +14,7 @@
 
 #define BATTERY_TIMEOUT_MS 5000
 
+#define ONLINE_REPORT_ID 3
 #define BATTERY_REPORT_ID 4
 
 struct kysona_drvdata {
@@ -80,11 +81,46 @@ static int kysona_battery_get_property(struct power_supply *psy,
 	return ret;
 }
 
+static const char kysona_online_request[] = {
+	0x08, ONLINE_REPORT_ID, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4a
+};
+
 static const char kysona_battery_request[] = {
 	0x08, BATTERY_REPORT_ID, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x49
 };
 
+static int kysona_m600_fetch_online(struct hid_device *hdev)
+{
+	u8 *write_buf;
+	int ret;
+
+	/* Request online information */
+	write_buf = kmemdup(kysona_online_request, sizeof(kysona_online_request), GFP_KERNEL);
+	if (!write_buf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, kysona_online_request[0],
+				 write_buf, sizeof(kysona_online_request),
+				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+	if (ret < (int)sizeof(kysona_online_request)) {
+		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
+		ret = -ENODATA;
+	}
+	kfree(write_buf);
+	return ret;
+}
+
+static void kysona_fetch_online(struct hid_device *hdev)
+{
+	int ret = kysona_m600_fetch_online(hdev);
+
+	if (ret < 0)
+		hid_dbg(hdev,
+			"Online query failed (err: %d)\n", ret);
+}
+
 static int kysona_m600_fetch_battery(struct hid_device *hdev)
 {
 	u8 *write_buf;
@@ -121,6 +157,7 @@ static void kysona_battery_timer_tick(struct work_struct *work)
 		struct kysona_drvdata, battery_work.work);
 	struct hid_device *hdev = drv_data->hdev;
 
+	kysona_fetch_online(hdev);
 	kysona_fetch_battery(hdev);
 	schedule_delayed_work(&drv_data->battery_work,
 			      msecs_to_jiffies(BATTERY_TIMEOUT_MS));
@@ -160,6 +197,7 @@ static int kysona_battery_probe(struct hid_device *hdev)
 	power_supply_powers(drv_data->battery, &hdev->dev);
 
 	INIT_DELAYED_WORK(&drv_data->battery_work, kysona_battery_timer_tick);
+	kysona_fetch_online(hdev);
 	kysona_fetch_battery(hdev);
 	schedule_delayed_work(&drv_data->battery_work,
 			      msecs_to_jiffies(BATTERY_TIMEOUT_MS));
@@ -206,12 +244,16 @@ static int kysona_raw_event(struct hid_device *hdev,
 {
 	struct kysona_drvdata *drv_data = hid_get_drvdata(hdev);
 
-	if (drv_data->battery && size == sizeof(kysona_battery_request) &&
+	if (size == sizeof(kysona_online_request) &&
+	    data[0] == 8 && data[1] == ONLINE_REPORT_ID) {
+		drv_data->online = data[6];
+	}
+
+	if (size == sizeof(kysona_battery_request) &&
 	    data[0] == 8 && data[1] == BATTERY_REPORT_ID) {
 		drv_data->battery_capacity = data[6];
 		drv_data->battery_charging = data[7];
 		drv_data->battery_voltage = (data[8] << 8) | data[9];
-		drv_data->online = true;
 	}
 
 	return 0;
-- 
2.48.1



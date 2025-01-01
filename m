Return-Path: <linux-input+bounces-8835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEEF9FF449
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2025 16:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995FA161675
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2025 15:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955E31E1C3B;
	Wed,  1 Jan 2025 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="TDamURGK"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACE41773A;
	Wed,  1 Jan 2025 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735744858; cv=none; b=amkGQYmQa8dx1OX6X/HYk6y2WgbrhNKmMFt//WfmB6pppxDznJq8CytENbtp6gtRVwGCVzFOGzWaO9xQxusOM1s1suc0dVLKW0vec9McL3WsvQ2623uU7HbcuhFdYRmTWcT+Q18SDFc62RnqjGv8/Q5qS7aOZa3bNIIVVHFN8bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735744858; c=relaxed/simple;
	bh=mRmNPJKVZBfGhd9BoOamnRNpSYGw9TkH/23FsAKmGYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAtjv0i63iifc+NoNKnP/XuQ8HNStU0NBIH3AfYw9hH3hrOiAtNDjHtvzxbJor3m0FkoXDhDAhY1MIy56l0i73CnB6frvl434dV3PP36sPL7D4vVCytvBfF/OAiDgs0W6W9lF6ficJNKvYBxRy8ZLZ4yM5qKD0vbkDG4CLimoXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=TDamURGK; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4YNYJ22gDNz62SD;
	Wed,  1 Jan 2025 16:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1735744402; bh=mRmNPJKVZBfGhd9BoOamnRNpSYGw9TkH/23FsAKmGYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TDamURGKHIP7ycOhXfHsugj8VrQ37P+YPIjfNZtS59pMlEh08nhO3BpNLCtSGrVO9
	 8DVgD0zRdqAjzBZXFsi0/h4aXlrh2Bpe5W5R04iRN12DXhxQtVgE34stKheuysDRjf
	 WbfGHrUTwY3uKAVbm/Rl7v5Z7eQ4GMF2q4vNTQqDXX06zg0Gaj0wQNk+BLRr2JW0lK
	 IfwQ1Zbk7MTyTdL8xRNGqDItdDUz26NHAJI0c9ShwGshaKY2ED9IM/kkmi6ztXeboR
	 wAo7hNyLsv4I/aYBEsDOB8N0HjIrYwa2RBqnRqG0jpVVRcCPeqC5LMwdftZWia7v0j
	 T7luAWhbP0C5A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4YNYJ21ywQz4xmv;
	Wed,  1 Jan 2025 16:13:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YNYJ155qgz8sfD;
	Wed,  1 Jan 2025 16:13:21 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id F2A451C020D;
	Wed,  1 Jan 2025 16:13:16 +0100 (CET)
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
Subject: [PATCH 2/3] HID: steelseries: export charging state for the
 SteelSeries Arctis 9 headset
Date: Wed,  1 Jan 2025 15:11:33 +0000
Message-ID: <20250101151209.100072-3-git@mayer-bgk.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250101151209.100072-1-git@mayer-bgk.de>
References: <20250101151209.100072-1-git@mayer-bgk.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173574439748.16926.15174893276622874344@mxe85d.netcup.net>
X-Rspamd-Queue-Id: F2A451C020D
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: ZGOrU8rS6W4/oKjnb7prEm2Mu9W8gUXJEAv9/i5hcpAxNNFPloc=

The Arctis 9 headset provides the information if
the power cable is plugged in and charging via the battery report.
This information can be exported.

Signed-off-by: Christian Mayer <git@mayer-bgk.de>
---
 drivers/hid/hid-steelseries.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index f102045a9b6b..d11296bc0e1e 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -33,6 +33,7 @@ struct steelseries_device {
 	struct power_supply *battery;
 	uint8_t battery_capacity;
 	bool headset_connected;
+	bool battery_charging;
 };
 
 #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
@@ -450,9 +451,12 @@ static int steelseries_headset_battery_get_property(struct power_supply *psy,
 		val->intval = 1;
 		break;
 	case POWER_SUPPLY_PROP_STATUS:
-		val->intval = sd->headset_connected ?
-			POWER_SUPPLY_STATUS_DISCHARGING :
-			POWER_SUPPLY_STATUS_UNKNOWN;
+		if (sd->headset_connected) {
+			val->intval = sd->battery_charging ?
+				POWER_SUPPLY_STATUS_CHARGING :
+				POWER_SUPPLY_STATUS_DISCHARGING;
+		} else
+			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
 		break;
 	case POWER_SUPPLY_PROP_SCOPE:
 		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
@@ -514,6 +518,7 @@ static int steelseries_headset_battery_register(struct steelseries_device *sd)
 	/* avoid the warning of 0% battery while waiting for the first info */
 	steelseries_headset_set_wireless_status(sd->hdev, false);
 	sd->battery_capacity = 100;
+	sd->battery_charging = false;
 
 	sd->battery = devm_power_supply_register(&sd->hdev->dev,
 			&sd->battery_desc, &battery_cfg);
@@ -650,6 +655,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 	struct steelseries_device *sd = hid_get_drvdata(hdev);
 	int capacity = sd->battery_capacity;
 	bool connected = sd->headset_connected;
+	bool charging = sd->battery_charging;
 	unsigned long flags;
 
 	/* Not a headset */
@@ -685,6 +691,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 
 		if (read_buf[0] == 0xaa && read_buf[1] == 0x01) {
 			connected = true;
+			charging = read_buf[4] == 0x01;
 
 			/*
 			 * Found no official documentation about min and max.
@@ -697,6 +704,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 			 * there is no known status of the device read_buf[0] == 0x55
 			 */
 			connected = false;
+			charging = false;
 		}
 	}
 
@@ -717,6 +725,15 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 		power_supply_changed(sd->battery);
 	}
 
+	if (charging != sd->battery_charging) {
+		hid_dbg(sd->hdev,
+			"Battery charging status changed from %scharging to %scharging\n",
+			sd->battery_charging ? "" : "not ",
+			charging ? "" : "not ");
+		sd->battery_charging = charging;
+		power_supply_changed(sd->battery);
+	}
+
 request_battery:
 	spin_lock_irqsave(&sd->lock, flags);
 	if (!sd->removed)
-- 
2.47.1



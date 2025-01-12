Return-Path: <linux-input+bounces-9149-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E17CA0A8BC
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A857188480A
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 11:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62271A8F71;
	Sun, 12 Jan 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="b4kR6zGp"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF30F24B254;
	Sun, 12 Jan 2025 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682362; cv=none; b=HoGJt8e9q8GLHMzCyfFxYNhDYrZuc6kq1PZTnIRTfwBsVsvfk+rvX7frzJaSq1CLD4IDzYa6Job0OLqsSEjnVLZHnDlSfrdsHDmJQhcbdjzKOCQvfPMkEjedsJQmyAfUZZUsH5Y7OcS6x+dNN7zUfnQC7fG+Al8rjLb1abX1qrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682362; c=relaxed/simple;
	bh=rTEVsmoC9nP3W3gZ2WPh+yMqQSQCcCzHCt8rTbkZLu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSOjdVV5XGadFYybu+mTUP76pXf0RUzyQ/llGFOZPwFNNLbY2LQtmwL8k/h2KitjIqKOs62FLHRqtHQ9zOGGaWtpZTOYNB0G6rLCcKPkxSYkrq7QwyXQ5nTTKTvLRJiRwLCItxTvmYwSFyTaQ2uyyHp8YC0u3mjX1rUwKtuIAcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=b4kR6zGp; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YWD9X4H58z91DF;
	Sun, 12 Jan 2025 12:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736682352; bh=rTEVsmoC9nP3W3gZ2WPh+yMqQSQCcCzHCt8rTbkZLu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b4kR6zGp2pO2tZAUrj0jI2v4SxQ4VAqg62nmC603WdR5UkkG3+jfdWqO+HsFw9vTu
	 aEtE2XNQ+z7UpNc2xD8QiYjNIx9cGv3Mp0XbJ8TbxYXwzHmSAUxtnodQOdRTbfKror
	 KX3fhjfrHAYDCSl74rX8SL+nSXHCjiD5r9pcXnMdOfM3BHj3FRRTD94tCqXWw5nHfi
	 FWf7FCjZ9Vb2WEUo722psgrn7EmAEMcKehE9AaZzfXfvXSpcnZlNeQcuO0AXQILqlx
	 vZF8IvarhmQzKCJH0Hq7/oBEWG6wrACjDVIl3po85T0fKf50cJIbW3RwD8hahKFupa
	 +Cz349Nc2A0cQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YWD9X3bXwz7xcw;
	Sun, 12 Jan 2025 12:45:52 +0100 (CET)
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4YWD9X1Zd1z8sb8;
	Sun, 12 Jan 2025 12:45:52 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id 8CEEF1C0241;
	Sun, 12 Jan 2025 12:45:47 +0100 (CET)
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
Subject: [PATCH v2 3/5] HID: steelseries: export charging state for the
 SteelSeries Arctis 9 headset
Date: Sun, 12 Jan 2025 11:44:04 +0000
Message-ID: <20250112114438.2196-4-git@mayer-bgk.de>
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
X-PPP-Message-ID: <173668234791.24538.18307518253673257588@mxe85d.netcup.net>
X-Rspamd-Queue-Id: 8CEEF1C0241
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: qbWT0wvedST9Z/DdjiD4GT/TKurJM+OedzuvxIBJ5UMlGNe5jT8=

The Arctis 9 headset provides the information if
the power cable is plugged in and charging via the battery report.
This information can be exported.

Signed-off-by: Christian Mayer <git@mayer-bgk.de>
---
 drivers/hid/hid-steelseries.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 2b98db7f8911..2ee1a6f01852 100644
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
@@ -646,6 +651,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 	struct steelseries_device *sd = hid_get_drvdata(hdev);
 	int capacity = sd->battery_capacity;
 	bool connected = sd->headset_connected;
+	bool charging = sd->battery_charging;
 	unsigned long flags;
 
 	/* Not a headset */
@@ -681,6 +687,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 
 		if (read_buf[0] == 0xaa && read_buf[1] == 0x01) {
 			connected = true;
+			charging = read_buf[4] == 0x01;
 
 			/*
 			 * Found no official documentation about min and max.
@@ -693,6 +700,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 			 * there is no known status of the device read_buf[0] == 0x55
 			 */
 			connected = false;
+			charging = false;
 		}
 	}
 
@@ -713,6 +721,15 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
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



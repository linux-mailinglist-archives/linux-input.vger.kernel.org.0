Return-Path: <linux-input+bounces-9154-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A3A0A8D4
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 841311672BC
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 11:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD7F1AB530;
	Sun, 12 Jan 2025 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="RRLUYKLD"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26711AA1C0;
	Sun, 12 Jan 2025 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682903; cv=none; b=AOFvdXaMVV5doG0lQJT86JPh8h/1odxNIoa+fMdDB5f9AGpfc4KevRxUW56FNy+HMA/1pP/oOqbQV7NhzokPTKsLGq15LjberQaOw5b/EYEGCEiSeCwJ4VjjJuFwSkbTBWJrHOfjt/mdPiIJBWq75GY748S1OrLres9Zvq8TwnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682903; c=relaxed/simple;
	bh=h2jJMA4mrHQMGvfB4zJKFlu4n261Lxg9g8UMza6F5P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsjR16rM31LsoLsicWW0qBsCZBlobvH5lS/04cnxRnikD+9tPl29a1WV7mL7XRHGF46JkwqPxdKGJu7NzqVWz1D12J8wXSnVz4QdEYyjzI0+KTrF+aGt/DobdGV+OkhySqO8YyMtQctC4IqY+v8oiLOaXGTve8fNmHGDlWTQzYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=RRLUYKLD; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4YWD9d2193z8bWt;
	Sun, 12 Jan 2025 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736682357; bh=h2jJMA4mrHQMGvfB4zJKFlu4n261Lxg9g8UMza6F5P0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RRLUYKLDr8hqsLC2cQexSyu9FV4jhKwEvPiwVC+wzwOWEzUYn4jerfHZc4A4AsppR
	 8OnBRlKYAU1hICsBQAplQKOO3NRZnOBKqF2/Ep9YPClEagf27ZPNMqY44rfKWos0yb
	 PiFv2az75sAlkDYsWjbmyO7NhLaQxhPmrfM9PwuWRFj3nqwE5LEyFsJ2BBv3yuKuRN
	 uQ7Kk6s3jwS7MzlMRKW0GfvPgNjZEABzZ6527x9j2VzCkaMStUm6GbDC2ADqQ2KCMZ
	 EXo1YvHPGz6vsRA0Vi2V3WVQgnPcdrfccajsn0YeHnyiyf+J+wpwPW4Fsz8QmNsplh
	 6VMITISbQT8hw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4YWD9d1H7Sz8bWb;
	Sun, 12 Jan 2025 11:45:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YWD9c51v6z8tYM;
	Sun, 12 Jan 2025 12:45:56 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id 1FF5F1C020D;
	Sun, 12 Jan 2025 12:45:52 +0100 (CET)
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
Subject: [PATCH v2 4/5] HID: steelseries: export model and manufacturer
Date: Sun, 12 Jan 2025 11:44:05 +0000
Message-ID: <20250112114438.2196-5-git@mayer-bgk.de>
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
X-PPP-Message-ID: <173668235247.32019.8018917105283969233@mxe85d.netcup.net>
X-Rspamd-Queue-Id: 1FF5F1C020D
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: rSRxbZDr/iU+29iRTISce5l6spE3dxZfBna+fQCbD0NsqXY4rBU=

Export model and manufacturer with the power supply properties.
This helps identifing the device in the battery overview.
In the case of the Arctis 9 headset, the manufacturer is prefixed twice in
the device name.

Signed-off-by: Christian Mayer <git@mayer-bgk.de>
---
 drivers/hid/hid-steelseries.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 2ee1a6f01852..1a935802880a 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -439,6 +439,9 @@ static void steelseries_headset_battery_timer_tick(struct work_struct *work)
 	steelseries_headset_fetch_battery(hdev);
 }
 
+#define STEELSERIES_PREFIX "SteelSeries "
+#define STEELSERIES_PREFIX_LEN strlen(STEELSERIES_PREFIX)
+
 static int steelseries_headset_battery_get_property(struct power_supply *psy,
 				enum power_supply_property psp,
 				union power_supply_propval *val)
@@ -447,6 +450,14 @@ static int steelseries_headset_battery_get_property(struct power_supply *psy,
 	int ret = 0;
 
 	switch (psp) {
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = sd->hdev->name;
+		while (!strncmp(val->strval, STEELSERIES_PREFIX, STEELSERIES_PREFIX_LEN))
+			val->strval += STEELSERIES_PREFIX_LEN;
+		break;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = "SteelSeries";
+		break;
 	case POWER_SUPPLY_PROP_PRESENT:
 		val->intval = 1;
 		break;
@@ -490,6 +501,8 @@ steelseries_headset_set_wireless_status(struct hid_device *hdev,
 }
 
 static enum power_supply_property steelseries_headset_battery_props[] = {
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_SCOPE,
-- 
2.47.1



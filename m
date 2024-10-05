Return-Path: <linux-input+bounces-7098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9E9916A2
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 14:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81B771F22AF6
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 12:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41401531D5;
	Sat,  5 Oct 2024 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="nmGMpM6l"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5214C5B0;
	Sat,  5 Oct 2024 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728129829; cv=none; b=QccfC9uP6pcGYBtKFrlrAZtnqaW1Dl+JL34Gsht1SNJui9+3bfDK9Z2gao4x7KgTG0plix5zy2n45GJ4hHgx3t24EMCLRNuFg3DbEt/dJbiHZ//IiDLuPMGJyZhuZkM08xOB+dEEE8n5+GwviMQqnZ1xLOp986TdkkRszQk1uJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728129829; c=relaxed/simple;
	bh=soBxRlhZVFPtz2pp25QZslJmcMPycIduAafeKmQthB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuBIGa0x/UF8Tvbqh4hT6KXvYB5mhe1BDlL0uoM6XMyLmovb2wWvw/Ol6depXPAmKj8ExUDcfR4noV1QUqPit5+7Wej3B/TbyEI1wn0VzYhEeVrEqsUJVGorwqpfDenhJxm0RPdJCM3INE2P9iEq/P+2gz184nF//eQSny9k+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=nmGMpM6l; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XLPFr3hh2z9tdC;
	Sat,  5 Oct 2024 14:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1728129824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evj8B3A64fh6mBbSeZ/neCXQL4H1yrwJBIr1g7QFat4=;
	b=nmGMpM6lBZYp7U75cTd3ZdBJxWVchSKBLdDzvau8MxB5WHCnOgOfuHV7uDgigDmbfBSrvT
	bFuKFWxeSm8lIt/JgWM8MDr8WI7Mkm6Xnvcv8/0mMK+9+b5Kr102W8zoQkR8wpITrNeHfK
	v+Dj+bC3lexKqO8b4I6FLm0zZG3oBZu1TOabCQ/DBtUIxQaEhSsRXKLTYsQQUlycYyFad5
	jcLXjqpVZL04D8BRNZBFy3GXWCIvamn2LpNV13YnHdydEGhNXSDPoFnT5gsSH0h43PMd02
	5YXk+0daufy59S7A8PjitvXJoiBkeGP1h74O7emuTdF455BHXeIPrAw554AgTg==
From: Lode Willems <me@lodewillems.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH 4/4] HID: Kysona: add basic online status
Date: Sat,  5 Oct 2024 13:57:06 +0200
Message-ID: <20241005120256.13847-5-me@lodewillems.com>
In-Reply-To: <20241005120256.13847-1-me@lodewillems.com>
References: <20241005120256.13847-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XLPFr3hh2z9tdC

Wait for a response to the battery status request to set the device as
online. This prevent wrong power info when the dongle is connected but
the mouse is turned off.

Signed-off-by: Lode Willems <me@lodewillems.com>
---
 drivers/hid/hid-kysona.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-kysona.c b/drivers/hid/hid-kysona.c
index 403bdc4a5e12..d4c0406b3323 100644
--- a/drivers/hid/hid-kysona.c
+++ b/drivers/hid/hid-kysona.c
@@ -18,6 +18,8 @@
 
 struct kysona_drvdata {
 	struct hid_device *hdev;
+	bool online;
+
 	struct power_supply_desc battery_desc;
 	struct power_supply *battery;
 	u8 battery_capacity;
@@ -32,7 +34,8 @@ static enum power_supply_property kysona_battery_props[] = {
 	POWER_SUPPLY_PROP_CAPACITY,
 	POWER_SUPPLY_PROP_SCOPE,
 	POWER_SUPPLY_PROP_MODEL_NAME,
-	POWER_SUPPLY_PROP_VOLTAGE_NOW
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_ONLINE
 };
 
 static int kysona_battery_get_property(struct power_supply *psy,
@@ -46,11 +49,16 @@ static int kysona_battery_get_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_PRESENT:
 		val->intval = 1;
 		break;
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = drv_data->online;
+		break;
 	case POWER_SUPPLY_PROP_STATUS:
-		// TODO: check if device is online
-		val->intval = drv_data->battery_charging ?
-			POWER_SUPPLY_STATUS_CHARGING :
-			POWER_SUPPLY_STATUS_DISCHARGING;
+		if (drv_data->online)
+			val->intval = drv_data->battery_charging ?
+					POWER_SUPPLY_STATUS_CHARGING :
+					POWER_SUPPLY_STATUS_DISCHARGING;
+		else
+			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
 		break;
 	case POWER_SUPPLY_PROP_SCOPE:
 		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
@@ -124,7 +132,9 @@ static int kysona_battery_probe(struct hid_device *hdev)
 	struct power_supply_config pscfg = { .drv_data = drv_data };
 	int ret = 0;
 
+	drv_data->online = false;
 	drv_data->battery_capacity = 100;
+	drv_data->battery_voltage = 4200;
 
 	drv_data->battery_desc.properties = kysona_battery_props;
 	drv_data->battery_desc.num_properties = ARRAY_SIZE(kysona_battery_props);
@@ -201,6 +211,7 @@ static int kysona_raw_event(struct hid_device *hdev,
 		drv_data->battery_capacity = data[6];
 		drv_data->battery_charging = data[7];
 		drv_data->battery_voltage = (data[8] << 8) | data[9];
+		drv_data->online = true;
 	}
 
 	return 0;
-- 
2.46.1



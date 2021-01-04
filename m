Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB1A2E9D0A
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 19:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbhADSa1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 13:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbhADSa1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 13:30:27 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EE5C061574
        for <linux-input@vger.kernel.org>; Mon,  4 Jan 2021 10:29:47 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id DACFE34593D;
        Mon,  4 Jan 2021 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1609784984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=B5oGaLTgWZnR00iU8GR4J4fHEAsnWKAvc4TXo8d/Ef8=;
        b=x7RgNGrH/vhT8cjvDYiK2ZbUiVZmicCPiH1oJY1ETzoLXf4tTBMle9fZEMHFUOm73CTvlO
        +/H5idr95dn8woLb0SwVlRG4bFZhUwGL7YUDjl8HJE55HUBQksKIxywnhA22sHDdHkbNdT
        U4og7PNVvVJFhSy40ooeCY5JaDKJOXgLDWpQliQzWXBItG57WOHbKIw0OKE0OUTSNeuZKy
        24BB1pvWtRgwBWdMYYv+r2QCQniYDsuAAB2j0x4JCNd72byf7XMghWocJVlJlluqr5U2R0
        Jbfrmtp5gQWxuHbh3QcAhd0G/vcuHNaGyasuiFljvHgf4RdWvOxZrjz/orrlDZ+seT3AFX
        lDTfnKXxAko3HqmG+aNo/m3zZhQUacJReEjk/n0RxsysdK2uYf9maRterDCKRNy1Fvpljc
        6LC8F2QdvawK915/uJIObagHONnXMfvPNas3jm0cqXRo5W1wHcDYcFvfFXXmCobEOH1aLO
        RIrX9Ekr7LPw3+n48fKQEaAzrSo7EScy4YcOvlMmxObsRoYh36rif8K/rHRaYv0HdQY4TB
        tSoTZ8yYqa9HzkdJHiHuQKOO2QiRk4404nb7o9nQe2DiVpAVCNUz6mE7EeiuY1kztxqxQF
        wj17SLl3mkJQqS0Pznx3lMrVUlf5lhKadXCEegQGZ8TlBGgnElpIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1609784984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=B5oGaLTgWZnR00iU8GR4J4fHEAsnWKAvc4TXo8d/Ef8=;
        b=eJChxdQVasZQFcr2CcQZeHsBaSfnKpR5nXJp8QMmvpgcnnW9T7JbSffAAHnSiqzLUb/aqf
        Oo7Df0/MqgAh4GBg==
From:   lains@archlinux.org
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
Subject: [PATCH] HID: logitech-hidpp: add support for Unified Battery (1004) feature
Date:   Mon,  4 Jan 2021 18:29:37 +0000
Message-Id: <20210104182937.1472673-1-lains@archlinux.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Filipe Laíns <lains@archlinux.org>

This new feature present in new devices replaces the old Battery Level
Status (0x1000) feature. It keeps essentially the same information for
levels (reporting critical, low, good and full) but makes these levels
optional, the device exports a capability setting which describes which
levels it supports. In addition to this, there is an optional
state_of_charge paramenter that exports the battery percentage.

This patch adds support for this new feature. There were some
implementation choices, as described below and in the code.

If the device supports the state_of_charge parameter, we will just
export the battery percentage and not the levels, which the device might
still support.

Since this feature can co-exist with the Battery Voltage (0x1001)
feature and we currently only support one battery feature, I changed the
battery feature discovery to try to use 0x1000 and 0x1004 first and only
then 0x1001, the battery voltage feature.
In the future we could uncouple this and make the battery feature
co-exists with 0x1000 and 0x1004, allowing the device to export voltage
information in addition to the battery percentage or level.

I tested this patch with a MX Anywhere 3, which supports the new
feature. Since I don't have any device that doesn't support the
state_of_charge parameter of this feature, I forced the MX Anywhere 3 to
use the level information, instead of battery percentage, to test that
part of the implementation.
I also tested with a MX Master 3, which supports the Battery Level
Status (0x1000) feature, and a G703 Hero, which supports the Battery
Voltage (0x1001) feature, to make sure nothing broke there.

Signed-off-by: Filipe Laíns <lains@archlinux.org>
---
 drivers/hid/hid-logitech-hidpp.c | 244 ++++++++++++++++++++++++++++++-
 1 file changed, 237 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index f85781464807..291c6b4d26b7 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -92,6 +92,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_CAPABILITY_BATTERY_MILEAGE	BIT(2)
 #define HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS	BIT(3)
 #define HIDPP_CAPABILITY_BATTERY_VOLTAGE	BIT(4)
+#define HIDPP_CAPABILITY_BATTERY_PERCENTAGE	BIT(5)
+#define HIDPP_CAPABILITY_UNIFIED_BATTERY	BIT(6)
 
 #define lg_map_key_clear(c)  hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
 
@@ -152,6 +154,7 @@ struct hidpp_battery {
 	int voltage;
 	int charge_type;
 	bool online;
+	u8 supported_levels_1004;
 };
 
 /**
@@ -1171,7 +1174,7 @@ static int hidpp20_batterylevel_get_battery_info(struct hidpp_device *hidpp,
 	return 0;
 }
 
-static int hidpp20_query_battery_info(struct hidpp_device *hidpp)
+static int hidpp20_query_battery_info_1000(struct hidpp_device *hidpp)
 {
 	u8 feature_type;
 	int ret;
@@ -1208,7 +1211,7 @@ static int hidpp20_query_battery_info(struct hidpp_device *hidpp)
 	return 0;
 }
 
-static int hidpp20_battery_event(struct hidpp_device *hidpp,
+static int hidpp20_battery_event_1000(struct hidpp_device *hidpp,
 				 u8 *data, int size)
 {
 	struct hidpp_report *report = (struct hidpp_report *)data;
@@ -1380,6 +1383,222 @@ static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
 	return 0;
 }
 
+/* -------------------------------------------------------------------------- */
+/* 0x1004: Unified battery                                                    */
+/* -------------------------------------------------------------------------- */
+
+#define HIDPP_PAGE_UNIFIED_BATTERY				0x1004
+
+#define CMD_UNIFIED_BATTERY_GET_CAPABILITIES			0x00
+#define CMD_UNIFIED_BATTERY_GET_STATUS				0x10
+
+#define EVENT_UNIFIED_BATTERY_STATUS_EVENT			0x00
+
+#define FLAG_UNIFIED_BATTERY_LEVEL_CRITICAL			BIT(0)
+#define FLAG_UNIFIED_BATTERY_LEVEL_LOW				BIT(1)
+#define FLAG_UNIFIED_BATTERY_LEVEL_GOOD				BIT(2)
+#define FLAG_UNIFIED_BATTERY_LEVEL_FULL				BIT(3)
+
+#define FLAG_UNIFIED_BATTERY_FLAGS_RECHARGEABLE			BIT(0)
+#define FLAG_UNIFIED_BATTERY_FLAGS_STATE_OF_CHARGE		BIT(1)
+
+static int hidpp20_unifiedbattery_get_capabilities(struct hidpp_device *hidpp,
+						   u8 feature_index)
+{
+	struct hidpp_report response;
+	int ret;
+	u8 *params = (u8 *)response.fap.params;
+
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS ||
+	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE) {
+		/* we have already set the device capabilities, so let's skip */
+		return 0;
+	}
+
+	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
+					  CMD_UNIFIED_BATTERY_GET_CAPABILITIES,
+					  NULL, 0, &response);
+	/* Ignore these intermittent errors */
+	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
+		return -EIO;
+	if (ret > 0) {
+		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
+			__func__, ret);
+		return -EPROTO;
+	}
+	if (ret)
+		return ret;
+
+	/* if the device supports state of charge (battery percentage) we won't
+	   export the battery level information. there are 4 possible battery
+	   levels and they all are optional, this means that the device might
+	   not support any of them, we are just better off with the battery
+	   percentage. */
+	if (params[1] & FLAG_UNIFIED_BATTERY_FLAGS_STATE_OF_CHARGE) {
+		hidpp->capabilities |= HIDPP_CAPABILITY_BATTERY_PERCENTAGE;
+		hidpp->battery.supported_levels_1004 = 0;
+	} else {
+		hidpp->capabilities |= HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS;
+		hidpp->battery.supported_levels_1004 = params[0];
+	}
+
+	return 0;
+}
+
+static int hidpp20_unifiedbattery_map_status(struct hidpp_device *hidpp,
+					     u8 charging_status,
+					     u8 external_power_status)
+{
+	int status;
+
+	switch (charging_status) {
+		case 0: /* discharging */
+			status = POWER_SUPPLY_STATUS_DISCHARGING;
+			break;
+		case 1: /* charging */
+		case 2: /* charging slow */
+			status = POWER_SUPPLY_STATUS_CHARGING;
+			break;
+		case 3: /* complete */
+			status = POWER_SUPPLY_STATUS_FULL;
+			break;
+		case 4: /* error */
+			status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+			hid_info(hidpp->hid_dev, "%s: charging error",
+				 hidpp->name);
+			break;
+		default:
+			status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+			break;
+	}
+
+	return status;
+}
+
+static int hidpp20_unifiedbattery_map_level(struct hidpp_device *hidpp,
+					    u8 battery_level)
+{
+	/* cler unsupported level bits */
+	battery_level &= hidpp->battery.supported_levels_1004;
+
+	if (battery_level & FLAG_UNIFIED_BATTERY_LEVEL_FULL)
+		return POWER_SUPPLY_CAPACITY_LEVEL_FULL;
+	else if (battery_level & FLAG_UNIFIED_BATTERY_LEVEL_GOOD)
+		return POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
+	else if (battery_level & FLAG_UNIFIED_BATTERY_LEVEL_LOW)
+		return POWER_SUPPLY_CAPACITY_LEVEL_LOW;
+	else if (battery_level & FLAG_UNIFIED_BATTERY_LEVEL_CRITICAL)
+		return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
+
+	return POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
+}
+
+static int hidpp20_unifiedbattery_get_status(struct hidpp_device *hidpp,
+					     u8 feature_index,
+					     u8 *state_of_charge,
+					     int *status,
+					     int *level)
+{
+	struct hidpp_report response;
+	int ret;
+	u8 *params = (u8 *)response.fap.params;
+
+	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
+					  CMD_UNIFIED_BATTERY_GET_STATUS,
+					  NULL, 0, &response);
+	/* Ignore these intermittent errors */
+	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
+		return -EIO;
+	if (ret > 0) {
+		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
+			__func__, ret);
+		return -EPROTO;
+	}
+	if (ret)
+		return ret;
+
+	*state_of_charge = params[0];
+	*status = hidpp20_unifiedbattery_map_status(hidpp, params[2], params[3]);
+	*level = hidpp20_unifiedbattery_map_level(hidpp, params[1]);
+
+	return 0;
+}
+
+static int hidpp20_query_battery_info_1004(struct hidpp_device *hidpp)
+{
+	u8 feature_type;
+	int ret;
+	u8 state_of_charge;
+	int status, level;
+
+	if (hidpp->battery.feature_index == 0xff) {
+		ret = hidpp_root_get_feature(hidpp,
+					     HIDPP_PAGE_UNIFIED_BATTERY,
+					     &hidpp->battery.feature_index,
+					     &feature_type);
+		if (ret)
+			return ret;
+	}
+
+	ret = hidpp20_unifiedbattery_get_capabilities(hidpp,
+					hidpp->battery.feature_index);
+	if (ret)
+		return ret;
+
+	ret = hidpp20_unifiedbattery_get_status(hidpp,
+						hidpp->battery.feature_index,
+						&state_of_charge,
+						&status,
+						&level);
+	if (ret)
+		return ret;
+
+	hidpp->capabilities |= HIDPP_CAPABILITY_UNIFIED_BATTERY;
+	hidpp->battery.capacity = state_of_charge;
+	hidpp->battery.status = status;
+	hidpp->battery.level = level;
+	hidpp->battery.online = true;
+
+	return 0;
+}
+
+static int hidpp20_battery_event_1004(struct hidpp_device *hidpp,
+				 u8 *data, int size)
+{
+	struct hidpp_report *report = (struct hidpp_report *)data;
+	u8 *params = (u8 *)report->fap.params;
+	int state_of_charge, status, level;
+	bool changed;
+
+	if (report->fap.feature_index != hidpp->battery.feature_index ||
+	    report->fap.funcindex_clientid != EVENT_UNIFIED_BATTERY_STATUS_EVENT)
+		return 0;
+
+	state_of_charge = params[0];
+	status = hidpp20_unifiedbattery_map_status(hidpp, params[2], params[3]);
+	level = hidpp20_unifiedbattery_map_level(hidpp, params[1]);
+
+	changed = status != hidpp->battery.status ||
+		  (state_of_charge != hidpp->battery.capacity &&
+		   hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE) ||
+		  (level != hidpp->battery.level &&
+		   hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS);
+
+	if (changed) {
+		hidpp->battery.capacity = state_of_charge;
+		hidpp->battery.status = status;
+		hidpp->battery.level = level;
+		if (hidpp->battery.ps)
+			power_supply_changed(hidpp->battery.ps);
+	}
+
+	return 0;
+}
+
+/* -------------------------------------------------------------------------- */
+/* Battery feature helpers                                                    */
+/* -------------------------------------------------------------------------- */
+
 static enum power_supply_property hidpp_battery_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_STATUS,
@@ -3307,7 +3526,10 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 	}
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
-		ret = hidpp20_battery_event(hidpp, data, size);
+		ret = hidpp20_battery_event_1000(hidpp, data, size);
+		if (ret != 0)
+			return ret;
+		ret = hidpp20_battery_event_1004(hidpp, data, size);
 		if (ret != 0)
 			return ret;
 		ret = hidpp_solar_battery_event(hidpp, data, size);
@@ -3443,9 +3665,14 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
 			ret = hidpp_solar_request_battery_event(hidpp);
 		else {
-			ret = hidpp20_query_battery_voltage_info(hidpp);
+			/* we only support one battery feature right now, so let's
+			   first check the ones that support battery level first
+			   and leave voltage for last */
+			ret = hidpp20_query_battery_info_1000(hidpp);
+			if (ret)
+				ret = hidpp20_query_battery_info_1004(hidpp);
 			if (ret)
-				ret = hidpp20_query_battery_info(hidpp);
+				ret = hidpp20_query_battery_voltage_info(hidpp);
 		}
 
 		if (ret)
@@ -3473,7 +3700,8 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 
 	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
 
-	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE)
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE ||
+	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY;
 
@@ -3650,8 +3878,10 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 	} else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
 		if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
 			hidpp20_query_battery_voltage_info(hidpp);
+		else if (hidpp->capabilities & HIDPP_CAPABILITY_UNIFIED_BATTERY)
+			hidpp20_query_battery_info_1004(hidpp);
 		else
-			hidpp20_query_battery_info(hidpp);
+			hidpp20_query_battery_info_1000(hidpp);
 	}
 	if (hidpp->battery.ps)
 		power_supply_changed(hidpp->battery.ps);
-- 
2.30.0


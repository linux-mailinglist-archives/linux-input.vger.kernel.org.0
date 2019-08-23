Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D48F9B3E3
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 17:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436557AbfHWPu5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 11:50:57 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:58813 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732803AbfHWPu5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 11:50:57 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id D0BE736B;
        Fri, 23 Aug 2019 11:50:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 23 Aug 2019 11:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=fm3; bh=9+cK5I8pdd9D+
        2pWKvxSGyfQkIc04yCaBWFq3refJuQ=; b=ay4AB7nHpbPdgwyWaCIVJRFMWa0F7
        OhG++37d37fRuqTktGTFYan9Sw83X5v0kCtyh86ZhhXBkMxXpiOOvDWhNqmplRlX
        Pkjwp6vnihR45k8z2wKBpi+JkNLonCyi47VIKUz192KSKljB/E/hIgDSGltg/UtY
        QEOd0voTnLU8rbOTVMD9+GO81smmuY6wmNXVwFuuaHopq1IrCD17T+AiI1DvaTXJ
        SH2QeLKQI2q98pWuUQ9j2Wc9JEl8RZ+z3aJT484hxihcayzkjjZ0JTZrkgx7Xjtf
        GNlxjBYuYsDsKBH+Lm6BpeYx7wk2j47gXDYo5jdJyx5B9mFcJs5HOSnEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9+cK5I8pdd9D+2pWK
        vxSGyfQkIc04yCaBWFq3refJuQ=; b=Vq3GKVoeuckn1cy0kBI7Mu5yZaDqR8BtH
        9oi11bD0oojPlNLB4hQmjmOwtaMGlOKnGduhkx6QTZJVwjWhXqy2U3Zo0anKUhDy
        cvHpkpRNVaVa+IiV0DFd/J7/ZLujEi9twVoXGjQlYr7Q6TxD1Hr4GBNuXp51dogj
        tg15Pu4V62QmydOEUYK1npONu4ue7GzoC6eZX9dtJT1LxWMgQOaYswYZbn0XIaze
        YN6onzz4la8bdaUxogfIFWNdAk2010VuUUa0xw2df+Y/0N1PWLCaxcSaMeiOOLPp
        oRpQp6lcDM0ypMJObEEWHkXr6nJlWK9Tw9UL9RZqRqLslAcH76zCg==
X-ME-Sender: <xms:XgtgXTV4zNPY4U3YuCuLqePr1p5izxvUqGqwgdm-TMLzsozqYzxSzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvggurhhoucgg
    rghniigvlhhlrgcuoehpvggurhhosehpvggurhhovhgrnhiivghllhgrrdgtohhmqeenuc
    fkphepudejgedrkeekrdelrddugeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvggu
    rhhosehpvggurhhovhgrnhiivghllhgrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:XgtgXT0nT3wzkLdOr_aDNKE7urFZlivFM70oCBJjV_s64wrzfvotpg>
    <xmx:XgtgXdPlmqTh5g34QL4kD54-90gyTfnh-Xm1ZxRgO_fjJDngjFCQvw>
    <xmx:XgtgXTSxzG0SqBF5XqpDjWsaaCHB4-vmeFh19jNSyG2RPzxfGoB4vQ>
    <xmx:XwtgXdvJbMz4GqFarW_IsMNkMQ9lAFfQMS5wVGasRBNvCstX1495ww>
Received: from localhost (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id BB1F3D60062;
        Fri, 23 Aug 2019 11:50:54 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     lains@archlinux.org, Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] hid-logitech-hidpp: read battery voltage from newer devices
Date:   Fri, 23 Aug 2019 11:49:52 -0400
Message-Id: <20190823154952.7525-1-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Newer Logitech mice report their battery voltage through feature 0x1001
instead of the battery levels through feature 0x1000.

When the device is brought up and we try to query the battery, figure
out if it supports the old or the new feature. If it supports the new
feature, record the feature index and read the battery voltage and
its status.

If everything went correctly, record the fact that we're capable
of querying battery voltage.

Note that the protocol only gives us the current voltage in millivolts.

Like we do for other ways of interacting with the battery for other
devices, refresh the battery status and notify the power supply
subsystem of the changes in voltage and status.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 140 ++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0179f7ed77e5..5c9c3133d2ae 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -87,6 +87,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_CAPABILITY_HIDPP20_BATTERY	BIT(1)
 #define HIDPP_CAPABILITY_BATTERY_MILEAGE	BIT(2)
 #define HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS	BIT(3)
+#define HIDPP_CAPABILITY_BATTERY_VOLTAGE	BIT(4)
 
 /*
  * There are two hidpp protocols in use, the first version hidpp10 is known
@@ -135,12 +136,14 @@ struct hidpp_report {
 struct hidpp_battery {
 	u8 feature_index;
 	u8 solar_feature_index;
+	u8 voltage_feature_index;
 	struct power_supply_desc desc;
 	struct power_supply *ps;
 	char name[64];
 	int status;
 	int capacity;
 	int level;
+	int voltage; /* in millivolts */
 	bool online;
 };
 
@@ -1219,6 +1222,122 @@ static int hidpp20_battery_event(struct hidpp_device *hidpp,
 	return 0;
 }
 
+/* -------------------------------------------------------------------------- */
+/* 0x1001: Battery voltage                                                    */
+/* -------------------------------------------------------------------------- */
+
+#define HIDPP_PAGE_BATTERY_VOLTAGE 0x1001
+
+#define CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE 0x00
+
+static int hidpp20_battery_map_status_voltage(u8 data[3], int *voltage)
+{
+	int status;
+
+	switch (data[2]) {
+	case 0x00: /* discharging */
+		status = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	case 0x10: /* wireless charging */
+	case 0x80: /* charging */
+		status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case 0x81: /* fully charged */
+		status = POWER_SUPPLY_STATUS_FULL;
+		break;
+	default:
+		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+	}
+
+	*voltage = (data[0] << 8) + data[1];
+
+	return status;
+}
+
+static int hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
+					       u8 feature_index,
+					       int *status, int *voltage)
+{
+	struct hidpp_report response;
+	int ret;
+	u8 *params = (u8 *)response.fap.params;
+
+	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
+					  CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE,
+					  NULL, 0, &response);
+
+	if (ret > 0) {
+		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
+			__func__, ret);
+		return -EPROTO;
+	}
+	if (ret)
+		return ret;
+
+	hidpp->capabilities |= HIDPP_CAPABILITY_BATTERY_VOLTAGE;
+
+	*status = hidpp20_battery_map_status_voltage(params, voltage);
+
+	return 0;
+}
+
+static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
+{
+	u8 feature_type;
+	int ret;
+	int status, voltage;
+
+	if (hidpp->battery.voltage_feature_index == 0xff) {
+		ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_BATTERY_VOLTAGE,
+					     &hidpp->battery.voltage_feature_index,
+					     &feature_type);
+		if (ret)
+			return ret;
+	}
+
+	ret = hidpp20_battery_get_battery_voltage(hidpp,
+						  hidpp->battery.voltage_feature_index,
+						  &status, &voltage);
+
+	if (ret)
+		return ret;
+
+	hidpp->battery.status = status;
+	hidpp->battery.voltage = voltage;
+	hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
+
+	return 0;
+}
+
+static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
+					 u8 *data, int size)
+{
+	struct hidpp_report *report = (struct hidpp_report *)data;
+	int status, voltage;
+	bool changed;
+
+	if (report->fap.feature_index != hidpp->battery.voltage_feature_index ||
+	    report->fap.funcindex_clientid !=
+		    EVENT_BATTERY_LEVEL_STATUS_BROADCAST)
+		return 0;
+
+	status = hidpp20_battery_map_status_voltage(report->fap.params,
+						    &voltage);
+
+	hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
+
+	changed = voltage != hidpp->battery.voltage ||
+		  status != hidpp->battery.status;
+
+	if (changed) {
+		hidpp->battery.voltage = voltage;
+		hidpp->battery.status = status;
+		if (hidpp->battery.ps)
+			power_supply_changed(hidpp->battery.ps);
+	}
+	return 0;
+}
+
 static enum power_supply_property hidpp_battery_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_STATUS,
@@ -1228,6 +1347,7 @@ static enum power_supply_property hidpp_battery_props[] = {
 	POWER_SUPPLY_PROP_SERIAL_NUMBER,
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
+	0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
 };
 
 static int hidpp_battery_get_property(struct power_supply *psy,
@@ -1265,6 +1385,9 @@ static int hidpp_battery_get_property(struct power_supply *psy,
 		case POWER_SUPPLY_PROP_SERIAL_NUMBER:
 			val->strval = hidpp->hid_dev->uniq;
 			break;
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+			val->intval = hidpp->battery.voltage;
+			break;
 		default:
 			ret = -EINVAL;
 			break;
@@ -3083,6 +3206,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 		ret = hidpp_solar_battery_event(hidpp, data, size);
 		if (ret != 0)
 			return ret;
+		ret = hidpp20_battery_voltage_event(hidpp, data, size);
+		if (ret != 0)
+			return ret;
 	}
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
@@ -3204,12 +3330,16 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 
 	hidpp->battery.feature_index = 0xff;
 	hidpp->battery.solar_feature_index = 0xff;
+	hidpp->battery.voltage_feature_index = 0xff;
 
 	if (hidpp->protocol_major >= 2) {
 		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
 			ret = hidpp_solar_request_battery_event(hidpp);
-		else
+		else {
 			ret = hidpp20_query_battery_info(hidpp);
+			if (ret)
+				ret = hidpp20_query_battery_voltage_info(hidpp);
+		}
 
 		if (ret)
 			return ret;
@@ -3234,7 +3364,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	if (!battery_props)
 		return -ENOMEM;
 
-	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 2;
+	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE)
 		battery_props[num_battery_props++] =
@@ -3244,6 +3374,10 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY_LEVEL;
 
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+		battery_props[num_battery_props++] =
+			POWER_SUPPLY_PROP_VOLTAGE_NOW;
+
 	battery = &hidpp->battery;
 
 	n = atomic_inc_return(&battery_no) - 1;
@@ -3408,6 +3542,8 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 			hidpp10_query_battery_status(hidpp);
 	} else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
 		hidpp20_query_battery_info(hidpp);
+		if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+			hidpp20_query_battery_voltage_info(hidpp);
 	}
 	if (hidpp->battery.ps)
 		power_supply_changed(hidpp->battery.ps);
-- 
2.23.0


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C96E09A0FC
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 22:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392883AbfHVUTC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 16:19:02 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:43823 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391015AbfHVUTB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 16:19:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 0901C21785;
        Thu, 22 Aug 2019 16:19:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 22 Aug 2019 16:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=qkfXD75N/WbVbWSZPQ2M/eiRK0PmPJET2OhfHsAzWVk=; b=LR1he
        JJ6T/Op3zCVqhd06cp44GaLC3CkMYAjYhF0GU5zk+TYynbbsnGEVV6vpozitbCOl
        q9hXchBqzJ0OEqiNENSLKsVLpaQQ7dNPt2bzI2IGgxGIZDVl0joZ5Q2lw7zYBYCh
        d8nruZ+OSdYZSr31VqSI2H6EbOPqjLmPpTH5Uxf/bFZgSwkDCAbZYhxJpnFtITkm
        JwlSdLI0ymczggty4DnJ6CZry3Rv5PKjIp2G5+7JwWusu7sDa2YpwbqtyYQYSWp2
        BwBCvVEpL45waHEt0/3Sk86TRdP5cfOvHxNweKKOdxa/BmdMMtFOo01xNwJN8ofc
        GI90GMbvGQI0X24Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=qkfXD75N/WbVbWSZPQ2M/eiRK0PmPJET2OhfHsAzWVk=; b=W357AqkZ
        MvZnz89PYjnZQFIEf20jYNb954c4aJOseJYbGX3Xcubk2l/RyAit3nhjddDG9M1W
        c2xLjcTnQKGj+HJzYe7I+5CnAXxcSv5Yy0UyDWgfOL0oHYBChNaUJmfbWutYyxd3
        Nbgrd8+Wgo/eLPhiUDWFFytq3sjGSsJGor/3NpAMUrlPPAfg030TqiOltT3XwiQd
        f7dCP9R4imNPxwqKJwK6riLl1iLwxPv3X2zIvy3O9PmuCKpSCsCEpkiKRIruKgTj
        VJzAh2/vfWtihXX+8lHOcci06ZZkThzeI8vozKwTPfEdTYITMir7NwvA5uqMdrYX
        M3vtanV/PHPOQg==
X-ME-Sender: <xms:tPheXWcO-UslDQfX9f46PlZdigIcu8mZ2XDouUoSuAkYUr9mtiS7GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegiedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppedujeegrdekkedrledrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:tPheXbq9OLQ1b33ugLFQ0thD4nnUMepLC82IyZuGbGftp-PsRS6QIA>
    <xmx:tPheXWMKBzopmYV4PkADIPVX0FiYwl2FurUEfngcNWTKPqE6SJi48w>
    <xmx:tPheXRGNOs5uS58vyJ4x8LhgUpuhjmSO9AY23NerVJceUwAfXeKIjA>
    <xmx:tPheXTGC6kuHtnLGhyeosQiHgc0qL7y9l7q9hU2BMXRs-6bElllwag>
Received: from localhost (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 85F5F80059;
        Thu, 22 Aug 2019 16:19:00 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     lains@archlinux.org, Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] hid-logitech-hidpp: add function to query battery voltage
Date:   Thu, 22 Aug 2019 16:18:46 -0400
Message-Id: <20190822201849.28924-3-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190822201849.28924-1-pedro@pedrovanzella.com>
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When the device is brought up, if it's one of the devices we know
supports battery voltage checking, figure out the feature index
and get the battery voltage and status.

If everything went correctly, record the fact that we're capable
of querying battery voltage.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 95 ++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 402ddba93adc..e1ddc9cdcc8b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -88,6 +88,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_CAPABILITY_HIDPP20_BATTERY	BIT(1)
 #define HIDPP_CAPABILITY_BATTERY_MILEAGE	BIT(2)
 #define HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS	BIT(3)
+#define HIDPP_CAPABILITY_BATTERY_VOLTAGE	BIT(4)
 
 /*
  * There are two hidpp protocols in use, the first version hidpp10 is known
@@ -136,12 +137,14 @@ struct hidpp_report {
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
 
@@ -1220,6 +1223,93 @@ static int hidpp20_battery_event(struct hidpp_device *hidpp,
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
 static enum power_supply_property hidpp_battery_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_STATUS,
@@ -3205,10 +3295,13 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 
 	hidpp->battery.feature_index = 0xff;
 	hidpp->battery.solar_feature_index = 0xff;
+	hidpp->battery.voltage_feature_index = 0xff;
 
 	if (hidpp->protocol_major >= 2) {
 		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
 			ret = hidpp_solar_request_battery_event(hidpp);
+		else if (hidpp->quirks & HIDPP_QUIRK_BATTERY_VOLTAGE_X1001)
+			ret = hidpp20_query_battery_voltage_info(hidpp);
 		else
 			ret = hidpp20_query_battery_info(hidpp);
 
@@ -3409,6 +3502,8 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
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


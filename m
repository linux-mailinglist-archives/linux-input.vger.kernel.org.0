Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68CC6F9618
	for <lists+linux-input@lfdr.de>; Sun,  7 May 2023 02:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjEGAjn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 May 2023 20:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbjEGAip (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 May 2023 20:38:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2374A18DFC;
        Sat,  6 May 2023 17:36:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C53D5614D1;
        Sun,  7 May 2023 00:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234C7C433D2;
        Sun,  7 May 2023 00:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683419812;
        bh=kqisi5RhcTPN+W4YhUPvMiK/q7C+x7h7Mz8XYZanvCw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tJEDoPAdoa+l8+1eXnIPHXTmWf5gRXt2T05oqUzbotbc29ZNRjPR68we74UfLvhV/
         HVqdYerQkO4jvDxcj7cTDyrYR8jw+zCjg6bDslMCesR2KHATxVW8RLyuiEC9EaoumG
         WHBYKlZ5Bj7ifIWUtlKUnBUHYR41lz5MATtWNawb/LRT7G5/ddNHvZ+5IuZJaoP5X7
         YNvbO3i67fVuMRlY4+m5I7H5LhDgJuArOzyMPT0I0JE+BtqI0gxWxvMZhKW5Ax3wj8
         LzPdVMB1jjeMvDJM9qLInb9CZFe/goItIWldiGYLMEd4tQdC0Sn6T9VeB3m/8LuOp8
         u88rfrNI+K1Xw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jason Gerecke <killertofu@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        ping.cheng@wacom.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 6/9] HID: wacom: generic: Set battery quirk only when we see battery data
Date:   Sat,  6 May 2023 20:36:33 -0400
Message-Id: <20230507003637.4080781-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003637.4080781-1-sashal@kernel.org>
References: <20230507003637.4080781-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jason Gerecke <killertofu@gmail.com>

[ Upstream commit bea407a427baa019758f29f4d31b26f008bb8cc6 ]

Some devices will include battery status usages in the HID descriptor
but we won't see that battery data for one reason or another. For example,
AES sensors won't send battery data unless an AES pen is in proximity.
If a user does not have an AES pen but instead only interacts with the
AES touchscreen with their fingers then there is no need for us to create
a battery object. Similarly, if a family of peripherals shares the same
HID descriptor between wired-only and wireless-capable SKUs, users of the
former may never see a battery event and will not want a power_supply
object created.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217062
Link: https://gitlab.gnome.org/GNOME/gnome-control-center/-/issues/2354
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Tested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/wacom_wac.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index bc4d6474d8f54..68d68eb94b246 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1831,18 +1831,7 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 static void wacom_wac_battery_usage_mapping(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage)
 {
-	struct wacom *wacom = hid_get_drvdata(hdev);
-	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
-	struct wacom_features *features = &wacom_wac->features;
-	unsigned equivalent_usage = wacom_equivalent_usage(usage->hid);
-
-	switch (equivalent_usage) {
-	case HID_DG_BATTERYSTRENGTH:
-	case WACOM_HID_WD_BATTERY_LEVEL:
-	case WACOM_HID_WD_BATTERY_CHARGING:
-		features->quirks |= WACOM_QUIRK_BATTERY;
-		break;
-	}
+	return;
 }
 
 static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_field *field,
@@ -1863,18 +1852,21 @@ static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_field *f
 			wacom_wac->hid_data.bat_connected = 1;
 			wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
 		}
+		wacom_wac->features.quirks |= WACOM_QUIRK_BATTERY;
 		break;
 	case WACOM_HID_WD_BATTERY_LEVEL:
 		value = value * 100 / (field->logical_maximum - field->logical_minimum);
 		wacom_wac->hid_data.battery_capacity = value;
 		wacom_wac->hid_data.bat_connected = 1;
 		wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
+		wacom_wac->features.quirks |= WACOM_QUIRK_BATTERY;
 		break;
 	case WACOM_HID_WD_BATTERY_CHARGING:
 		wacom_wac->hid_data.bat_charging = value;
 		wacom_wac->hid_data.ps_connected = value;
 		wacom_wac->hid_data.bat_connected = 1;
 		wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
+		wacom_wac->features.quirks |= WACOM_QUIRK_BATTERY;
 		break;
 	}
 }
@@ -1890,18 +1882,15 @@ static void wacom_wac_battery_report(struct hid_device *hdev,
 {
 	struct wacom *wacom = hid_get_drvdata(hdev);
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
-	struct wacom_features *features = &wacom_wac->features;
 
-	if (features->quirks & WACOM_QUIRK_BATTERY) {
-		int status = wacom_wac->hid_data.bat_status;
-		int capacity = wacom_wac->hid_data.battery_capacity;
-		bool charging = wacom_wac->hid_data.bat_charging;
-		bool connected = wacom_wac->hid_data.bat_connected;
-		bool powered = wacom_wac->hid_data.ps_connected;
+	int status = wacom_wac->hid_data.bat_status;
+	int capacity = wacom_wac->hid_data.battery_capacity;
+	bool charging = wacom_wac->hid_data.bat_charging;
+	bool connected = wacom_wac->hid_data.bat_connected;
+	bool powered = wacom_wac->hid_data.ps_connected;
 
-		wacom_notify_battery(wacom_wac, status, capacity, charging,
-				     connected, powered);
-	}
+	wacom_notify_battery(wacom_wac, status, capacity, charging,
+			     connected, powered);
 }
 
 static void wacom_wac_pad_usage_mapping(struct hid_device *hdev,
-- 
2.39.2


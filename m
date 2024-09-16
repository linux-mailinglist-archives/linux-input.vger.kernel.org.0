Return-Path: <linux-input+bounces-6569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B797A095
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 13:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1374628384C
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 11:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0024962E;
	Mon, 16 Sep 2024 11:55:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EC2154423;
	Mon, 16 Sep 2024 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726487739; cv=none; b=LLC8Ymmqfb+SXgOTfYhYygvVpCYydJKj5QC3DLMJ0CaVPM6mCKiVtIZ5rygbT/puKHBMSk1unCC8rt6QOyfvKmJnpaPTPfylR7HydStk1Rf5OVMtaeINJ7rVbVvfgP4SwlOTN49ARTNqRv3rHmtz2dl/AC1EYrgFGfB899fE2iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726487739; c=relaxed/simple;
	bh=VC5wpxnQ6yJTJBsqI1DtX5GFQ7WriRWDfXUIgHpq2kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axnRDrE3IvEjFFSyvmWkvl8OoiIv9nVffKSWCwEc10ur+DJTSR894jhhvLkwo37rlrfpu6oVM4RDNBwtyNTFHVPgJ54VNY+FavAau4E55npYJuUDw1WUecllhlXOGriy9HbbRYWw34pULFTSjpx2DNJ6AsL6E5r4XWTPfGacV/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0AACFF805;
	Mon, 16 Sep 2024 11:55:33 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	"Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Nestor Lopez Casado <nlopezcasad@logitech.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH] HID: logitech-hidpp: Remove feature_type from hidpp_root_get_feature()
Date: Mon, 16 Sep 2024 13:55:27 +0200
Message-ID: <20240916115532.1806755-1-hadess@hadess.net>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

Nobody uses that variable after it gets assigned, so this saves us from
having to declare it in the first place.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-logitech-hidpp.c | 66 +++++++++-----------------------
 1 file changed, 19 insertions(+), 47 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 400d70e6dbe2..6981559b3092 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -928,7 +928,7 @@ static int hidpp_unifying_init(struct hidpp_device *hidpp)
 #define CMD_ROOT_GET_PROTOCOL_VERSION			0x10
 
 static int hidpp_root_get_feature(struct hidpp_device *hidpp, u16 feature,
-	u8 *feature_index, u8 *feature_type)
+	u8 *feature_index)
 {
 	struct hidpp_report response;
 	int ret;
@@ -945,7 +945,6 @@ static int hidpp_root_get_feature(struct hidpp_device *hidpp, u16 feature,
 		return -ENOENT;
 
 	*feature_index = response.fap.params[0];
-	*feature_type = response.fap.params[1];
 
 	return ret;
 }
@@ -1012,13 +1011,11 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 static int hidpp_get_serial(struct hidpp_device *hidpp, u32 *serial)
 {
 	struct hidpp_report response;
-	u8 feature_type;
 	u8 feature_index;
 	int ret;
 
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_DEVICE_INFORMATION,
-				     &feature_index,
-				     &feature_type);
+				     &feature_index);
 	if (ret)
 		return ret;
 
@@ -1125,7 +1122,6 @@ static int hidpp_devicenametype_get_device_name(struct hidpp_device *hidpp,
 
 static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 {
-	u8 feature_type;
 	u8 feature_index;
 	u8 __name_length;
 	char *name;
@@ -1133,7 +1129,7 @@ static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 	int ret;
 
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_GET_DEVICE_NAME_TYPE,
-		&feature_index, &feature_type);
+		&feature_index);
 	if (ret)
 		return NULL;
 
@@ -1300,15 +1296,13 @@ static int hidpp20_batterylevel_get_battery_info(struct hidpp_device *hidpp,
 
 static int hidpp20_query_battery_info_1000(struct hidpp_device *hidpp)
 {
-	u8 feature_type;
 	int ret;
 	int status, capacity, next_capacity, level;
 
 	if (hidpp->battery.feature_index == 0xff) {
 		ret = hidpp_root_get_feature(hidpp,
 					     HIDPP_PAGE_BATTERY_LEVEL_STATUS,
-					     &hidpp->battery.feature_index,
-					     &feature_type);
+					     &hidpp->battery.feature_index);
 		if (ret)
 			return ret;
 	}
@@ -1489,14 +1483,12 @@ static int hidpp20_map_battery_capacity(struct hid_device *hid_dev, int voltage)
 
 static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
 {
-	u8 feature_type;
 	int ret;
 	int status, voltage, level, charge_type;
 
 	if (hidpp->battery.voltage_feature_index == 0xff) {
 		ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_BATTERY_VOLTAGE,
-					     &hidpp->battery.voltage_feature_index,
-					     &feature_type);
+					     &hidpp->battery.voltage_feature_index);
 		if (ret)
 			return ret;
 	}
@@ -1692,7 +1684,6 @@ static int hidpp20_unifiedbattery_get_status(struct hidpp_device *hidpp,
 
 static int hidpp20_query_battery_info_1004(struct hidpp_device *hidpp)
 {
-	u8 feature_type;
 	int ret;
 	u8 state_of_charge;
 	int status, level;
@@ -1700,8 +1691,7 @@ static int hidpp20_query_battery_info_1004(struct hidpp_device *hidpp)
 	if (hidpp->battery.feature_index == 0xff) {
 		ret = hidpp_root_get_feature(hidpp,
 					     HIDPP_PAGE_UNIFIED_BATTERY,
-					     &hidpp->battery.feature_index,
-					     &feature_type);
+					     &hidpp->battery.feature_index);
 		if (ret)
 			return ret;
 	}
@@ -1834,14 +1824,9 @@ static int hidpp_battery_get_property(struct power_supply *psy,
 
 static int hidpp_get_wireless_feature_index(struct hidpp_device *hidpp, u8 *feature_index)
 {
-	u8 feature_type;
-	int ret;
-
-	ret = hidpp_root_get_feature(hidpp,
-				     HIDPP_PAGE_WIRELESS_DEVICE_STATUS,
-				     feature_index, &feature_type);
-
-	return ret;
+	return hidpp_root_get_feature(hidpp,
+				      HIDPP_PAGE_WIRELESS_DEVICE_STATUS,
+				      feature_index);
 }
 
 /* -------------------------------------------------------------------------- */
@@ -1952,14 +1937,11 @@ static bool hidpp20_get_adc_measurement_1f20(struct hidpp_device *hidpp,
 
 static int hidpp20_query_adc_measurement_info_1f20(struct hidpp_device *hidpp)
 {
-	u8 feature_type;
-
 	if (hidpp->battery.adc_measurement_feature_index == 0xff) {
 		int ret;
 
 		ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_ADC_MEASUREMENT,
-					     &hidpp->battery.adc_measurement_feature_index,
-					     &feature_type);
+					     &hidpp->battery.adc_measurement_feature_index);
 		if (ret)
 			return ret;
 
@@ -2014,15 +1996,13 @@ static int hidpp_hrs_set_highres_scrolling_mode(struct hidpp_device *hidpp,
 	bool enabled, u8 *multiplier)
 {
 	u8 feature_index;
-	u8 feature_type;
 	int ret;
 	u8 params[1];
 	struct hidpp_report response;
 
 	ret = hidpp_root_get_feature(hidpp,
 				     HIDPP_PAGE_HI_RESOLUTION_SCROLLING,
-				     &feature_index,
-				     &feature_type);
+				     &feature_index);
 	if (ret)
 		return ret;
 
@@ -2049,12 +2029,11 @@ static int hidpp_hrw_get_wheel_capability(struct hidpp_device *hidpp,
 	u8 *multiplier)
 {
 	u8 feature_index;
-	u8 feature_type;
 	int ret;
 	struct hidpp_report response;
 
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_HIRES_WHEEL,
-				     &feature_index, &feature_type);
+				     &feature_index);
 	if (ret)
 		goto return_default;
 
@@ -2076,13 +2055,12 @@ static int hidpp_hrw_set_wheel_mode(struct hidpp_device *hidpp, bool invert,
 	bool high_resolution, bool use_hidpp)
 {
 	u8 feature_index;
-	u8 feature_type;
 	int ret;
 	u8 params[1];
 	struct hidpp_report response;
 
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_HIRES_WHEEL,
-				     &feature_index, &feature_type);
+				     &feature_index);
 	if (ret)
 		return ret;
 
@@ -2111,14 +2089,12 @@ static int hidpp_solar_request_battery_event(struct hidpp_device *hidpp)
 {
 	struct hidpp_report response;
 	u8 params[2] = { 1, 1 };
-	u8 feature_type;
 	int ret;
 
 	if (hidpp->battery.feature_index == 0xff) {
 		ret = hidpp_root_get_feature(hidpp,
 					     HIDPP_PAGE_SOLAR_KEYBOARD,
-					     &hidpp->battery.solar_feature_index,
-					     &feature_type);
+					     &hidpp->battery.solar_feature_index);
 		if (ret)
 			return ret;
 	}
@@ -3098,11 +3074,10 @@ static int wtp_get_config(struct hidpp_device *hidpp)
 {
 	struct wtp_data *wd = hidpp->private_data;
 	struct hidpp_touchpad_raw_info raw_info = {0};
-	u8 feature_type;
 	int ret;
 
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_TOUCHPAD_RAW_XY,
-		&wd->mt_feature_index, &feature_type);
+		&wd->mt_feature_index);
 	if (ret)
 		/* means that the device is not powered up */
 		return ret;
@@ -3362,12 +3337,11 @@ static int k400_disable_tap_to_click(struct hidpp_device *hidpp)
 	struct k400_private_data *k400 = hidpp->private_data;
 	struct hidpp_touchpad_fw_items items = {};
 	int ret;
-	u8 feature_type;
 
 	if (!k400->feature_index) {
 		ret = hidpp_root_get_feature(hidpp,
 			HIDPP_PAGE_TOUCHPAD_FW_ITEMS,
-			&k400->feature_index, &feature_type);
+			&k400->feature_index);
 		if (ret)
 			/* means that the device is not powered up */
 			return ret;
@@ -3439,14 +3413,13 @@ static int g920_get_config(struct hidpp_device *hidpp,
 			   struct hidpp_ff_private_data *data)
 {
 	struct hidpp_report response;
-	u8 feature_type;
 	int ret;
 
 	memset(data, 0, sizeof(*data));
 
 	/* Find feature and store for later use */
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_G920_FORCE_FEEDBACK,
-				     &data->feature_index, &feature_type);
+				     &data->feature_index);
 	if (ret)
 		return ret;
 
@@ -3735,17 +3708,16 @@ static int hidpp_initialize_hires_scroll(struct hidpp_device *hidpp)
 
 	if (hidpp->protocol_major >= 2) {
 		u8 feature_index;
-		u8 feature_type;
 
 		ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_HIRES_WHEEL,
-					     &feature_index, &feature_type);
+					     &feature_index);
 		if (!ret) {
 			hidpp->capabilities |= HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL;
 			hid_dbg(hidpp->hid_dev, "Detected HID++ 2.0 hi-res scroll wheel\n");
 			return 0;
 		}
 		ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_HI_RESOLUTION_SCROLLING,
-					     &feature_index, &feature_type);
+					     &feature_index);
 		if (!ret) {
 			hidpp->capabilities |= HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL;
 			hid_dbg(hidpp->hid_dev, "Detected HID++ 2.0 hi-res scrolling\n");
-- 
2.46.0



Return-Path: <linux-input+bounces-13022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B805AE71D8
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7223E17BF58
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A5125B319;
	Tue, 24 Jun 2025 21:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L6T0Y7v9"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709D25B31F;
	Tue, 24 Jun 2025 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802269; cv=none; b=M1n8RBNfmuaSGDwvqFczOuP211As1Tx6+EQxAWXZIdHDtncYWe4BbJaDexVkga363hkUWas+MCyAcCcxAcWgRD+lRxfZ6EbBosm3Pf11xHQe99R1hnaX0Bn1qERPKwqbrMeX+P9HAENaqv/fGjHCh4MyTGjzf+vPOwt2nso9mnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802269; c=relaxed/simple;
	bh=WH6KZnz8X0ABb3IEBH6quxQhTPJ8h7pBVg/hK9QyCF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9ijZEJQgDN8Bxe2DI77PjkvpvRNx0YPhod2D79dJi2Ya9a3UyXgq8JWxr4ROzDDn0cmG1FGZHuomMUE8jNdfKSwU/ryCEvcy0zjWRYZKg5rkh5tpfdvWv4JuQnelbiXX9wmkVm8crfA6vxMtWg1w8aAtcCdycFtCMAR1Bw1cCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L6T0Y7v9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802265;
	bh=WH6KZnz8X0ABb3IEBH6quxQhTPJ8h7pBVg/hK9QyCF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L6T0Y7v95i73ze6n2miqYhoRP+F9LhiAN/dF1edKRHBqzJlqLHpLL29NAmW7ZTVDQ
	 hXFU5DqOGxX3VNntYkM4NH/P9Id+dYkjXCKljHCnLEyDAgjMYoqhEZsHBSWU4DV2yY
	 hpgMeRQi/oLrQSF7kBHbdf3C1EGw17PZ9pusoaxkyxQ14d33JJm/rxTKqivF9pO4K6
	 9WNeGs8uvY3V0CCrbAQFAIgXI1KgctY6m5f1P6JuoWFPFDL0rY+tZEgbrt53CgH+M9
	 oiCY1f49re6MC/5XA+0PXr9AaaZNpktIwxC4EZzhjT065Mpn22H4fQBM3XMMm+eKro
	 iGZ4kdSbCHR2w==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id D2E5617E05BD;
	Tue, 24 Jun 2025 23:57:44 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:50 +0300
Subject: [PATCH v2 06/11] HID: playstation: Fix all alignment and line
 length issues
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-6-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Format code to address the following checkpatch.pl reports:

  CHECK: Alignment should match open parenthesis
  CHECK: line length of <N> exceeds 100 columns
  CHECK: Please don't use multiple blank lines

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 163 +++++++++++++++++++++++-------------------
 1 file changed, 89 insertions(+), 74 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 349d6cac964a5b4fb1a311498b9573e03a3b7a01..811b0b90c0e277fe6a511a9a766790125d9602c5 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -572,7 +572,7 @@ static int ps_devices_list_add(struct ps_device *dev)
 	list_for_each_entry(entry, &ps_devices_list, list) {
 		if (!memcmp(entry->mac_address, dev->mac_address, sizeof(dev->mac_address))) {
 			hid_err(dev->hdev, "Duplicate device found for MAC address %pMR.\n",
-					dev->mac_address);
+				dev->mac_address);
 			return -EEXIST;
 		}
 	}
@@ -607,7 +607,8 @@ static void ps_device_release_player_id(struct ps_device *dev)
 	dev->player_id = U32_MAX;
 }
 
-static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
+static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev,
+					       const char *name_suffix)
 {
 	struct input_dev *input_dev;
 
@@ -622,8 +623,8 @@ static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const ch
 	input_dev->uniq = hdev->uniq;
 
 	if (name_suffix) {
-		input_dev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s %s", hdev->name,
-				name_suffix);
+		input_dev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s %s",
+						 hdev->name, name_suffix);
 		if (!input_dev->name)
 			return ERR_PTR(-ENOMEM);
 	} else {
@@ -643,8 +644,8 @@ static enum power_supply_property ps_power_supply_props[] = {
 };
 
 static int ps_battery_get_property(struct power_supply *psy,
-		enum power_supply_property psp,
-		union power_supply_propval *val)
+				   enum power_supply_property psp,
+				   union power_supply_propval *val)
 {
 	struct ps_device *dev = power_supply_get_drvdata(psy);
 	u8 battery_capacity;
@@ -688,7 +689,7 @@ static int ps_device_register_battery(struct ps_device *dev)
 	dev->battery_desc.num_properties = ARRAY_SIZE(ps_power_supply_props);
 	dev->battery_desc.get_property = ps_battery_get_property;
 	dev->battery_desc.name = devm_kasprintf(&dev->hdev->dev, GFP_KERNEL,
-			"ps-controller-battery-%pMR", dev->mac_address);
+						"ps-controller-battery-%pMR", dev->mac_address);
 	if (!dev->battery_desc.name)
 		return -ENOMEM;
 
@@ -720,8 +721,9 @@ static bool ps_check_crc32(u8 seed, u8 *data, size_t len, u32 report_crc)
 	return crc == report_crc;
 }
 
-static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
-		int (*play_effect)(struct input_dev *, void *, struct ff_effect *))
+static struct input_dev *
+ps_gamepad_create(struct hid_device *hdev,
+		  int (*play_effect)(struct input_dev *, void *, struct ff_effect *))
 {
 	struct input_dev *gamepad;
 	unsigned int i;
@@ -758,8 +760,8 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	return gamepad;
 }
 
-static int ps_get_report(struct hid_device *hdev, u8 report_id, u8 *buf, size_t size,
-		bool check_crc)
+static int ps_get_report(struct hid_device *hdev, u8 report_id, u8 *buf,
+			 size_t size, bool check_crc)
 {
 	int ret;
 
@@ -795,17 +797,20 @@ static int ps_get_report(struct hid_device *hdev, u8 report_id, u8 *buf, size_t
 }
 
 static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
-		const struct ps_led_info *led_info)
+			   const struct ps_led_info *led_info)
 {
 	int ret;
 
 	if (led_info->name) {
-		led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
-				"%s:%s:%s", ps_dev->input_dev_name, led_info->color, led_info->name);
+		led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL, "%s:%s:%s",
+					   ps_dev->input_dev_name, led_info->color,
+					   led_info->name);
 	} else {
-		/* Backwards compatible mode for hid-sony, but not compliant with LED class spec. */
-		led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
-				"%s:%s", ps_dev->input_dev_name, led_info->color);
+		/* Backwards compatible mode for hid-sony, but not compliant
+		 * with LED class spec.
+		 */
+		led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL, "%s:%s",
+					   ps_dev->input_dev_name, led_info->color);
 	}
 
 	if (!led->name)
@@ -829,7 +834,7 @@ static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
 
 /* Register a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
 static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc *lightbar_mc_dev,
-	int (*brightness_set)(struct led_classdev *, enum led_brightness))
+				int (*brightness_set)(struct led_classdev *, enum led_brightness))
 {
 	struct hid_device *hdev = ps_dev->hdev;
 	struct mc_subled *mc_led_info;
@@ -850,7 +855,7 @@ static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc
 
 	led_cdev = &lightbar_mc_dev->led_cdev;
 	led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s:rgb:indicator",
-			ps_dev->input_dev_name);
+					ps_dev->input_dev_name);
 	if (!led_cdev->name)
 		return -ENOMEM;
 	led_cdev->brightness = 255;
@@ -866,8 +871,8 @@ static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc
 	return 0;
 }
 
-static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range, int accel_res,
-		int gyro_range, int gyro_res)
+static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range,
+					   int accel_res, int gyro_range, int gyro_res)
 {
 	struct input_dev *sensors;
 	int ret;
@@ -903,8 +908,8 @@ static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_ra
 	return sensors;
 }
 
-static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width, int height,
-		unsigned int num_contacts)
+static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
+					    int height, unsigned int num_contacts)
 {
 	struct input_dev *touchpad;
 	int ret;
@@ -932,8 +937,7 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 }
 
 static ssize_t firmware_version_show(struct device *dev,
-				struct device_attribute
-				*attr, char *buf)
+				     struct device_attribute *attr, char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct ps_device *ps_dev = hid_get_drvdata(hdev);
@@ -944,8 +948,7 @@ static ssize_t firmware_version_show(struct device *dev,
 static DEVICE_ATTR_RO(firmware_version);
 
 static ssize_t hardware_version_show(struct device *dev,
-				struct device_attribute
-				*attr, char *buf)
+				     struct device_attribute *attr, char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct ps_device *ps_dev = hid_get_drvdata(hdev);
@@ -983,7 +986,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_CALIBRATION, buf,
-			DS_FEATURE_REPORT_CALIBRATION_SIZE, true);
+			    DS_FEATURE_REPORT_CALIBRATION_SIZE, true);
 	if (ret) {
 		hid_err(ds->base.hdev, "Failed to retrieve DualSense calibration info: %d\n", ret);
 		goto err_free;
@@ -1037,8 +1040,9 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	 */
 	for (i = 0; i < ARRAY_SIZE(ds->gyro_calib_data); i++) {
 		if (ds->gyro_calib_data[i].sens_denom == 0) {
-			hid_warn(hdev, "Invalid gyro calibration data for axis (%d), disabling calibration.",
-					ds->gyro_calib_data[i].abs_code);
+			hid_warn(hdev,
+				 "Invalid gyro calibration data for axis (%d), disabling calibration.",
+				 ds->gyro_calib_data[i].abs_code);
 			ds->gyro_calib_data[i].bias = 0;
 			ds->gyro_calib_data[i].sens_numer = DS_GYRO_RANGE;
 			ds->gyro_calib_data[i].sens_denom = S16_MAX;
@@ -1074,8 +1078,9 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	 */
 	for (i = 0; i < ARRAY_SIZE(ds->accel_calib_data); i++) {
 		if (ds->accel_calib_data[i].sens_denom == 0) {
-			hid_warn(hdev, "Invalid accelerometer calibration data for axis (%d), disabling calibration.",
-					ds->accel_calib_data[i].abs_code);
+			hid_warn(hdev,
+				 "Invalid accelerometer calibration data for axis (%d), disabling calibration.",
+				 ds->accel_calib_data[i].abs_code);
 			ds->accel_calib_data[i].bias = 0;
 			ds->accel_calib_data[i].sens_numer = DS_ACC_RANGE;
 			ds->accel_calib_data[i].sens_denom = S16_MAX;
@@ -1087,7 +1092,6 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	return ret;
 }
 
-
 static int dualsense_get_firmware_info(struct dualsense *ds)
 {
 	u8 *buf;
@@ -1098,7 +1102,7 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_FIRMWARE_INFO, buf,
-			DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, true);
+			    DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, true);
 	if (ret) {
 		hid_err(ds->base.hdev, "Failed to retrieve DualSense firmware info: %d\n", ret);
 		goto err_free;
@@ -1131,7 +1135,7 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_PAIRING_INFO, buf,
-			DS_FEATURE_REPORT_PAIRING_INFO_SIZE, true);
+			    DS_FEATURE_REPORT_PAIRING_INFO_SIZE, true);
 	if (ret) {
 		hid_err(ds->base.hdev, "Failed to retrieve DualSense pairing info: %d\n", ret);
 		goto err_free;
@@ -1145,7 +1149,7 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 }
 
 static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
-	enum led_brightness brightness)
+					     enum led_brightness brightness)
 {
 	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
 	struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
@@ -1189,8 +1193,8 @@ static int dualsense_player_led_set_brightness(struct led_classdev *led, enum le
 	return 0;
 }
 
-static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
-		void *buf)
+static void dualsense_init_output_report(struct dualsense *ds,
+					 struct dualsense_output_report *rp, void *buf)
 {
 	struct hid_device *hdev = ds->base.hdev;
 
@@ -1241,7 +1245,7 @@ static inline void dualsense_schedule_work(struct dualsense *ds)
  * for Bluetooth reports.
  */
 static void dualsense_send_output_report(struct dualsense *ds,
-		struct dualsense_output_report *report)
+					 struct dualsense_output_report *report)
 {
 	struct hid_device *hdev = ds->base.hdev;
 
@@ -1322,7 +1326,7 @@ static void dualsense_output_worker(struct work_struct *work)
 }
 
 static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *report,
-		u8 *data, int size)
+				  u8 *data, int size)
 {
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
@@ -1339,10 +1343,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	 * the full report using reportID 49.
 	 */
 	if (hdev->bus == BUS_USB && report->id == DS_INPUT_REPORT_USB &&
-			size == DS_INPUT_REPORT_USB_SIZE) {
+	    size == DS_INPUT_REPORT_USB_SIZE) {
 		ds_report = (struct dualsense_input_report *)&data[1];
 	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS_INPUT_REPORT_BT &&
-			size == DS_INPUT_REPORT_BT_SIZE) {
+		   size == DS_INPUT_REPORT_BT_SIZE) {
 		/* Last 4 bytes of input report contain crc32 */
 		u32 report_crc = get_unaligned_le32(&data[size - 4]);
 
@@ -1677,7 +1681,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	ps_dev->input_dev_name = dev_name(&ds->gamepad->dev);
 
 	ds->sensors = ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_PER_G,
-			DS_GYRO_RANGE, DS_GYRO_RES_PER_DEG_S);
+					DS_GYRO_RANGE, DS_GYRO_RES_PER_DEG_S);
 	if (IS_ERR(ds->sensors)) {
 		ret = PTR_ERR(ds->sensors);
 		goto err;
@@ -1731,7 +1735,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	 * can change behavior.
 	 */
 	hid_info(hdev, "Registered DualSense controller hw_version=0x%08x fw_version=0x%08x\n",
-			ds->base.hw_version, ds->base.fw_version);
+		 ds->base.hw_version, ds->base.fw_version);
 
 	return &ds->base;
 
@@ -1754,7 +1758,8 @@ static void dualshock4_dongle_calibration_work(struct work_struct *work)
 		 * DS4 hotplug is detect from sony_raw_event as any issues
 		 * are likely resolved then (the dongle is quite stupid).
 		 */
-		hid_err(ds4->base.hdev, "DualShock 4 USB dongle: calibration failed, disabling device\n");
+		hid_err(ds4->base.hdev,
+			"DualShock 4 USB dongle: calibration failed, disabling device\n");
 		dongle_state = DONGLE_DISABLED;
 	} else {
 		hid_info(ds4->base.hdev, "DualShock 4 USB dongle: calibration completed\n");
@@ -1798,14 +1803,17 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 		 */
 		for (retries = 0; retries < 3; retries++) {
 			ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
-					DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
+					    DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
 			if (ret) {
 				if (retries < 2) {
-					hid_warn(hdev, "Retrying DualShock 4 get calibration report (0x02) request\n");
+					hid_warn(hdev,
+						 "Retrying DualShock 4 get calibration report (0x02) request\n");
 					continue;
 				}
 
-				hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+				hid_warn(hdev,
+					 "Failed to retrieve DualShock4 calibration info: %d\n",
+					 ret);
 				ret = -EILSEQ;
 				goto transfer_failed;
 			} else {
@@ -1820,7 +1828,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 		}
 
 		ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION_BT, buf,
-				DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, true);
+				    DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, true);
 
 		if (ret) {
 			hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
@@ -1914,8 +1922,9 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	for (i = 0; i < ARRAY_SIZE(ds4->gyro_calib_data); i++) {
 		if (ds4->gyro_calib_data[i].sens_denom == 0) {
 			ds4->gyro_calib_data[i].abs_code = ABS_RX + i;
-			hid_warn(hdev, "Invalid gyro calibration data for axis (%d), disabling calibration.",
-					ds4->gyro_calib_data[i].abs_code);
+			hid_warn(hdev,
+				 "Invalid gyro calibration data for axis (%d), disabling calibration.",
+				 ds4->gyro_calib_data[i].abs_code);
 			ds4->gyro_calib_data[i].bias = 0;
 			ds4->gyro_calib_data[i].sens_numer = DS4_GYRO_RANGE;
 			ds4->gyro_calib_data[i].sens_denom = S16_MAX;
@@ -1930,8 +1939,9 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	for (i = 0; i < ARRAY_SIZE(ds4->accel_calib_data); i++) {
 		if (ds4->accel_calib_data[i].sens_denom == 0) {
 			ds4->accel_calib_data[i].abs_code = ABS_X + i;
-			hid_warn(hdev, "Invalid accelerometer calibration data for axis (%d), disabling calibration.",
-					ds4->accel_calib_data[i].abs_code);
+			hid_warn(hdev,
+				 "Invalid accelerometer calibration data for axis (%d), disabling calibration.",
+				 ds4->accel_calib_data[i].abs_code);
 			ds4->accel_calib_data[i].bias = 0;
 			ds4->accel_calib_data[i].sens_numer = DS4_ACC_RANGE;
 			ds4->accel_calib_data[i].sens_denom = S16_MAX;
@@ -1954,7 +1964,7 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 	 * lacks CRC support, so must be disabled in ps_get_report.
 	 */
 	ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_FIRMWARE_INFO, buf,
-			DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, false);
+			    DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, false);
 	if (ret) {
 		hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 firmware info: %d\n", ret);
 		goto err_free;
@@ -1980,7 +1990,7 @@ static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 			return -ENOMEM;
 
 		ret = ps_get_report(hdev, DS4_FEATURE_REPORT_PAIRING_INFO, buf,
-				DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, false);
+				    DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, false);
 		if (ret) {
 			hid_err(hdev, "Failed to retrieve DualShock4 pairing info: %d\n", ret);
 			goto err_free;
@@ -1993,9 +2003,9 @@ static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 			return -EINVAL;
 
 		ret = sscanf(hdev->uniq, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",
-				&ds4->base.mac_address[5], &ds4->base.mac_address[4],
-				&ds4->base.mac_address[3], &ds4->base.mac_address[2],
-				&ds4->base.mac_address[1], &ds4->base.mac_address[0]);
+			     &ds4->base.mac_address[5], &ds4->base.mac_address[4],
+			     &ds4->base.mac_address[3], &ds4->base.mac_address[2],
+			     &ds4->base.mac_address[1], &ds4->base.mac_address[0]);
 
 		if (ret != sizeof(ds4->base.mac_address))
 			return -EINVAL;
@@ -2030,7 +2040,7 @@ static enum led_brightness dualshock4_led_get_brightness(struct led_classdev *le
 }
 
 static int dualshock4_led_set_blink(struct led_classdev *led, unsigned long *delay_on,
-		unsigned long *delay_off)
+				    unsigned long *delay_off)
 {
 	struct hid_device *hdev = to_hid_device(led->dev->parent);
 	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
@@ -2098,7 +2108,7 @@ static int dualshock4_led_set_brightness(struct led_classdev *led, enum led_brig
 }
 
 static void dualshock4_init_output_report(struct dualshock4 *ds4,
-		struct dualshock4_output_report *rp, void *buf)
+					  struct dualshock4_output_report *rp, void *buf)
 {
 	struct hid_device *hdev = ds4->base.hdev;
 
@@ -2213,7 +2223,7 @@ static void dualshock4_output_worker(struct work_struct *work)
 }
 
 static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *report,
-		u8 *data, int size)
+				   u8 *data, int size)
 {
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
@@ -2230,14 +2240,15 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	 * the full report using reportID 17.
 	 */
 	if (hdev->bus == BUS_USB && report->id == DS4_INPUT_REPORT_USB &&
-			size == DS4_INPUT_REPORT_USB_SIZE) {
-		struct dualshock4_input_report_usb *usb = (struct dualshock4_input_report_usb *)data;
+	    size == DS4_INPUT_REPORT_USB_SIZE) {
+		struct dualshock4_input_report_usb *usb =
+			(struct dualshock4_input_report_usb *)data;
 
 		ds4_report = &usb->common;
 		num_touch_reports = usb->num_touch_reports;
 		touch_reports = usb->touch_reports;
 	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS4_INPUT_REPORT_BT &&
-			size == DS4_INPUT_REPORT_BT_SIZE) {
+		   size == DS4_INPUT_REPORT_BT_SIZE) {
 		struct dualshock4_input_report_bt *bt = (struct dualshock4_input_report_bt *)data;
 		u32 report_crc = get_unaligned_le32(&bt->crc32);
 
@@ -2408,7 +2419,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 }
 
 static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_report *report,
-		u8 *data, int size)
+					  u8 *data, int size)
 {
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
 	bool connected = false;
@@ -2419,7 +2430,8 @@ static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_r
 	 * parsing code.
 	 */
 	if (data[0] == DS4_INPUT_REPORT_USB && size == DS4_INPUT_REPORT_USB_SIZE) {
-		struct dualshock4_input_report_common *ds4_report = (struct dualshock4_input_report_common *)&data[1];
+		struct dualshock4_input_report_common *ds4_report =
+			(struct dualshock4_input_report_common *)&data[1];
 
 		connected = ds4_report->status[1] & DS4_STATUS1_DONGLE_STATE ? false : true;
 
@@ -2546,11 +2558,14 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	 * existing applications (e.g. Android). Nothing matches against MAC address.
 	 */
 	static const struct ps_led_info lightbar_leds_info[] = {
-		{ NULL, "red", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
-		{ NULL, "green", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
-		{ NULL, "blue", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
-		{ NULL, "global", 1, dualshock4_led_get_brightness, dualshock4_led_set_brightness,
-				dualshock4_led_set_blink },
+		{ NULL, "red", 255, dualshock4_led_get_brightness,
+		  dualshock4_led_set_brightness },
+		{ NULL, "green", 255, dualshock4_led_get_brightness,
+		  dualshock4_led_set_brightness },
+		{ NULL, "blue", 255, dualshock4_led_get_brightness,
+		  dualshock4_led_set_brightness },
+		{ NULL, "global", 1, dualshock4_led_get_brightness,
+		  dualshock4_led_set_brightness, dualshock4_led_set_blink },
 	};
 
 	ds4 = devm_kzalloc(&hdev->dev, sizeof(*ds4), GFP_KERNEL);
@@ -2620,7 +2635,7 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	ps_dev->input_dev_name = dev_name(&ds4->gamepad->dev);
 
 	ds4->sensors = ps_sensors_create(hdev, DS4_ACC_RANGE, DS4_ACC_RES_PER_G,
-			DS4_GYRO_RANGE, DS4_GYRO_RES_PER_DEG_S);
+					 DS4_GYRO_RANGE, DS4_GYRO_RES_PER_DEG_S);
 	if (IS_ERR(ds4->sensors)) {
 		ret = PTR_ERR(ds4->sensors);
 		goto err;
@@ -2659,7 +2674,7 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	 * can change behavior.
 	 */
 	hid_info(hdev, "Registered DualShock4 controller hw_version=0x%08x fw_version=0x%08x\n",
-			ds4->base.hw_version, ds4->base.fw_version);
+		 ds4->base.hw_version, ds4->base.fw_version);
 	return &ds4->base;
 
 err:
@@ -2668,7 +2683,7 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 }
 
 static int ps_raw_event(struct hid_device *hdev, struct hid_report *report,
-		u8 *data, int size)
+			u8 *data, int size)
 {
 	struct ps_device *dev = hid_get_drvdata(hdev);
 

-- 
2.49.0



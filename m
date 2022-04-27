Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABA951257E
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 00:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbiD0WtV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Apr 2022 18:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbiD0WtT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Apr 2022 18:49:19 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D65D2C13B
        for <linux-input@vger.kernel.org>; Wed, 27 Apr 2022 15:46:07 -0700 (PDT)
Received: from localhost.localdomain (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id 3EBD2A1E6;
        Wed, 27 Apr 2022 15:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651099566; bh=0eKaw8XAkNEXzVJE+7PSO5iBS8o1os/X4wo9arSo0Vk=;
        h=From:To:Cc:Subject:Date:From;
        b=EbfqHbB6j+vlD28Opw/jq8CaQfpvDhWtfC9GBXJa654BhE7VY77jTQuN2pjFjMrOC
         uJ+tYtGWxzbDhjwGf4AGrcyplCATINXrCKNu2loOty9V6WJVPfcj7ugUC6jfvst0LO
         eXuXcm0h2cBzitIuRBpxkFkV2pkkf/mgjTSEZ0vJp5AhL9+wAu/ms1TurjFQs4JnWt
         qAHqvBnxTVSkKrM//FXiJXH68VoazynLHBgOC6WQh8qu9fVDX9UcVASpVyZy7kS+xh
         IMd8TBZ/jd1zg8om4CxABXrieG3VzXpKvdoMLHX0omtm2XzgoqFV+PCJIkXDSmyNll
         EYss4bAzQn9qg==
From:   Vicki Pfau <vi@endrift.com>
To:     linux-input@vger.kernel.org
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
Date:   Wed, 27 Apr 2022 15:45:21 -0700
Message-Id: <20220427224526.35657-1-vi@endrift.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This allows the touchpad input_dev to be removed and have the driver remain
functional without its presence. This will be used to allow the touchpad to
be disabled, e.g. by a module parameter.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-playstation.c | 60 +++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ab7c82c2e886..f859a8dd8a2e 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -29,6 +29,7 @@ static DEFINE_IDA(ps_player_id_allocator);
 struct ps_device {
 	struct list_head list;
 	struct hid_device *hdev;
+	struct mutex mutex;
 	spinlock_t lock;
 
 	uint32_t player_id;
@@ -130,7 +131,7 @@ struct dualsense {
 	struct ps_device base;
 	struct input_dev *gamepad;
 	struct input_dev *sensors;
-	struct input_dev *touchpad;
+	struct input_dev __rcu *touchpad;
 
 	/* Calibration data for accelerometer and gyroscope. */
 	struct ps_calibration_data accel_calib_data[3];
@@ -590,6 +591,22 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 	return touchpad;
 }
 
+static void dualsense_unregister_touchpad(struct dualsense *ds)
+{
+	struct input_dev *touchpad;
+
+	rcu_read_lock();
+	touchpad = rcu_dereference(ds->touchpad);
+	rcu_read_unlock();
+
+	if (!touchpad)
+		return;
+
+	RCU_INIT_POINTER(ds->touchpad, NULL);
+	synchronize_rcu();
+	input_unregister_device(touchpad);
+}
+
 static ssize_t firmware_version_show(struct device *dev,
 				struct device_attribute
 				*attr, char *buf)
@@ -888,6 +905,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
 	struct dualsense_input_report *ds_report;
+	struct input_dev *touchpad = NULL;
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	uint32_t sensor_timestamp;
@@ -1002,24 +1020,29 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_event(ds->sensors, EV_MSC, MSC_TIMESTAMP, ds->sensor_timestamp_us);
 	input_sync(ds->sensors);
 
-	for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
-		struct dualsense_touch_point *point = &ds_report->points[i];
-		bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
+	rcu_read_lock();
+	touchpad = rcu_dereference(ds->touchpad);
+	rcu_read_unlock();
+	if (touchpad) {
+		for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
+			struct dualsense_touch_point *point = &ds_report->points[i];
+			bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
 
-		input_mt_slot(ds->touchpad, i);
-		input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
+			input_mt_slot(ds->touchpad, i);
+			input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
 
-		if (active) {
-			int x = (point->x_hi << 8) | point->x_lo;
-			int y = (point->y_hi << 4) | point->y_lo;
+			if (active) {
+				int x = (point->x_hi << 8) | point->x_lo;
+				int y = (point->y_hi << 4) | point->y_lo;
 
-			input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
-			input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
+				input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
+				input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
+			}
 		}
+		input_mt_sync_frame(ds->touchpad);
+		input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
+		input_sync(ds->touchpad);
 	}
-	input_mt_sync_frame(ds->touchpad);
-	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
-	input_sync(ds->touchpad);
 
 	battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
 	charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
@@ -1141,6 +1164,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
 	struct ps_device *ps_dev;
+	struct input_dev *touchpad;
 	uint8_t max_output_report_size;
 	int ret;
 
@@ -1157,6 +1181,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	ps_dev = &ds->base;
 	ps_dev->hdev = hdev;
 	spin_lock_init(&ps_dev->lock);
+	mutex_init(&ps_dev->mutex);
 	ps_dev->battery_capacity = 100; /* initial value until parse_report. */
 	ps_dev->battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 	ps_dev->parse_report = dualsense_parse_report;
@@ -1204,11 +1229,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
-	ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
-	if (IS_ERR(ds->touchpad)) {
-		ret = PTR_ERR(ds->touchpad);
+	touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
+	if (IS_ERR(touchpad)) {
+		ret = PTR_ERR(touchpad);
 		goto err;
 	}
+	rcu_assign_pointer(ds->touchpad, touchpad);
 
 	ret = ps_device_register_battery(ps_dev);
 	if (ret)
-- 
2.36.0


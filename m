Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA451257A
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 00:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbiD0WtY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Apr 2022 18:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbiD0WtX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Apr 2022 18:49:23 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF18A3135A
        for <linux-input@vger.kernel.org>; Wed, 27 Apr 2022 15:46:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id BF4C6A302;
        Wed, 27 Apr 2022 15:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651099570; bh=ImZAmCXXztV7HcGmpYwrljAL1R5jTQeW8QMrlzqz3x0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bFr+6Toe2ioXRT4Yy6HHQwf+UeLy0SrMZjCG7A4W+NYeXt1wc8YDn0WeHJI2P6AM3
         O/CnGN2L9czJ4iw7JGAKi5ulMyrsUvg1IAA7qAsWmYuf4wjMcO3PFjxueWWyMbhp/G
         SjEX4+UjERfZhv7P+XATQ5FGUrend7drl3URLVlvjCZP7N8lN0s4J6GyJS8MnctPnM
         J0/F55LWOZcbauY9RS2p+l7WlNsxkb4r4fl2uwRFJV9Ymx8GZyDiIdmOPqNneJIlsY
         bnfP0yu3ICeO7oe8gNHATSbt69wjt8GGHluzaVsoLlWtNOoZoHaS2y79Ch5c1hnuzz
         1Bk5yMAAfVFYQ==
From:   Vicki Pfau <vi@endrift.com>
To:     linux-input@vger.kernel.org
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH 6/6] HID: hid-sony: Disable touchpad reporting when hidraw open
Date:   Wed, 27 Apr 2022 15:45:26 -0700
Message-Id: <20220427224526.35657-6-vi@endrift.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224526.35657-1-vi@endrift.com>
References: <20220427224526.35657-1-vi@endrift.com>
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

When using the hidraw node directly, disable the touchpad endpoint to prevent
it from sending separate mouse-like reports. This is accomplished in the same
way that the hid-steam driver does it, by creating and attaching an input_dev
with a custom low-level transport driver, which monitors and reports when the
hidraw node is opened or closed. Reports sent by the real device are reported
to the "fake" device, and the real device is prevented from creating a hidraw
node. This "fake" device is connected with only a hidraw node, and is exposed
with identifying information that is identical to the original device, so the
"fake" device's hidraw node appears as the node associated with the dev.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-sony.c | 167 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 155 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index c4ccad95ee9a..5b6f1e5ae8db 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -457,6 +457,8 @@ static enum power_supply_property sony_battery_props[] = {
 	POWER_SUPPLY_PROP_STATUS,
 };
 
+static struct hid_ll_driver sony_client_ll_driver;
+
 struct sixaxis_led {
 	u8 time_enabled; /* the total time the led is active (0xff means forever) */
 	u8 duty_length;  /* how long a cycle is in deciseconds (0 means "really fast") */
@@ -558,7 +560,7 @@ enum sony_worker {
 struct sony_sc {
 	spinlock_t lock;
 	struct list_head list_node;
-	struct hid_device *hdev;
+	struct hid_device *hdev, *client_hdev;
 	struct input_dev __rcu *touchpad;
 	struct input_dev *sensor_dev;
 	struct led_classdev *leds[MAX_LEDS];
@@ -569,6 +571,7 @@ struct sony_sc {
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
 	struct mutex mutex;
+	bool client_opened;
 	int device_id;
 	unsigned fw_version;
 	bool fw_version_created;
@@ -947,7 +950,7 @@ static u8 *sony_report_fixup(struct hid_device *hdev, u8 *rdesc,
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
 
-	if (sc->quirks & (SINO_LITE_CONTROLLER | FUTUREMAX_DANCE_MAT))
+	if (!sc || (sc->quirks & (SINO_LITE_CONTROLLER | FUTUREMAX_DANCE_MAT)))
 		return rdesc;
 
 	/*
@@ -1345,6 +1348,22 @@ static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *rd, int size)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
+	int ret;
+
+	/*
+	 * Check if we're the client hdev, which is only used for a separate
+	 * hidraw device. If so, there's nothing to be done here.
+	 */
+	if (hdev->ll_driver == &sony_client_ll_driver)
+		return 0;
+
+	if (sc->client_opened) {
+		ret = hid_input_report(sc->client_hdev, HID_INPUT_REPORT, rd, size, 0);
+		if (ret) {
+			hid_err(hdev, "can't send input report to client hdev: %d\n", ret);
+			return ret;
+		}
+	}
 
 	/*
 	 * Sixaxis HID report has acclerometers/gyro with MSByte first, this
@@ -3034,6 +3053,92 @@ static int sony_input_configured(struct hid_device *hdev,
 	return ret;
 }
 
+static int sony_client_ll_parse(struct hid_device *hdev)
+{
+	struct sony_sc *sc = hdev->driver_data;
+
+	return hid_parse_report(hdev, sc->hdev->dev_rdesc,
+			sc->hdev->dev_rsize);
+}
+
+static int sony_client_ll_start(struct hid_device *hdev)
+{
+	return 0;
+}
+
+static void sony_client_ll_stop(struct hid_device *hdev)
+{
+}
+
+static int sony_client_ll_open(struct hid_device *hdev)
+{
+	struct sony_sc *sc = hdev->driver_data;
+
+	mutex_lock(&sc->mutex);
+	sc->client_opened = true;
+	mutex_unlock(&sc->mutex);
+
+	if (sc->quirks & DUALSHOCK4_CONTROLLER)
+		sony_unregister_touchpad(sc);
+
+	return 0;
+}
+
+static void sony_client_ll_close(struct hid_device *hdev)
+{
+	struct sony_sc *sc = hdev->driver_data;
+
+	mutex_lock(&sc->mutex);
+	sc->client_opened = false;
+	mutex_unlock(&sc->mutex);
+
+	if (sc->quirks & DUALSHOCK4_CONTROLLER)
+		sony_register_ds4_touchpad(sc);
+}
+
+static int sony_client_ll_raw_request(struct hid_device *hdev,
+				unsigned char reportnum, u8 *buf,
+				size_t count, unsigned char report_type,
+				int reqtype)
+{
+	struct sony_sc *sc = hdev->driver_data;
+
+	return hid_hw_raw_request(sc->hdev, reportnum, buf, count,
+			report_type, reqtype);
+}
+
+static struct hid_ll_driver sony_client_ll_driver = {
+	.parse = sony_client_ll_parse,
+	.start = sony_client_ll_start,
+	.stop = sony_client_ll_stop,
+	.open = sony_client_ll_open,
+	.close = sony_client_ll_close,
+	.raw_request = sony_client_ll_raw_request,
+};
+
+static struct hid_device *sony_create_client_hid(struct hid_device *hdev)
+{
+	struct hid_device *client_hdev;
+
+	client_hdev = hid_allocate_device();
+	if (IS_ERR(client_hdev))
+		return client_hdev;
+
+	client_hdev->ll_driver = &sony_client_ll_driver;
+	client_hdev->dev.parent = hdev->dev.parent;
+	client_hdev->bus = hdev->bus;
+	client_hdev->vendor = hdev->vendor;
+	client_hdev->product = hdev->product;
+	client_hdev->version = hdev->version;
+	client_hdev->type = hdev->type;
+	client_hdev->country = hdev->country;
+	strlcpy(client_hdev->name, hdev->name,
+			sizeof(client_hdev->name));
+	strlcpy(client_hdev->phys, hdev->phys,
+			sizeof(client_hdev->phys));
+	return client_hdev;
+}
+
 static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret;
@@ -3041,6 +3146,19 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct sony_sc *sc;
 	unsigned int connect_mask = HID_CONNECT_DEFAULT;
 
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		return ret;
+	}
+
+	/*
+	 * The virtual client_dev is only used for hidraw.
+	 * Also avoid the recursive probe.
+	 */
+	if (hdev->ll_driver == &sony_client_ll_driver)
+		return hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+
 	if (!strcmp(hdev->name, "FutureMax Dance Mat"))
 		quirks |= FUTUREMAX_DANCE_MAT;
 
@@ -3060,12 +3178,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_set_drvdata(hdev, sc);
 	sc->hdev = hdev;
 
-	ret = hid_parse(hdev);
-	if (ret) {
-		hid_err(hdev, "parse failed\n");
-		return ret;
-	}
-
 	if (sc->quirks & VAIO_RDESC_CONSTANT)
 		connect_mask |= HID_CONNECT_HIDDEV_FORCE;
 	else if (sc->quirks & SIXAXIS_CONTROLLER)
@@ -3080,12 +3192,32 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (sc->quirks & (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER))
 		hdev->version |= 0x8000;
 
+	/* For DualShock 4 controllers, we create a client_hid device so that
+	 * we can tell when it's been opened directly and disable the touchpad
+	 * from being used as a mouse at the same time.
+	 */
+	if (sc->quirks & DUALSHOCK4_CONTROLLER) {
+		connect_mask &= ~HID_CONNECT_HIDRAW;
+		sc->client_hdev = sony_create_client_hid(hdev);
+		if (IS_ERR(sc->client_hdev))
+			return PTR_ERR(sc->client_hdev);
+		sc->client_hdev->driver_data = sc;
+	}
+
 	ret = hid_hw_start(hdev, connect_mask);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
 		return ret;
 	}
 
+	if (sc->client_hdev)
+		ret = hid_add_device(sc->client_hdev);
+	if (ret) {
+		hid_err(hdev, "client hw start failed\n");
+		hid_hw_stop(hdev);
+		return ret;
+	}
+
 	/* sony_input_configured can fail, but this doesn't result
 	 * in hid_hw_start failures (intended). Check whether
 	 * the HID layer claimed the device else fail.
@@ -3096,6 +3228,8 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	 */
 	if (!(hdev->claimed & HID_CLAIMED_INPUT)) {
 		hid_err(hdev, "failed to claim input\n");
+		if (sc->client_hdev)
+			hid_destroy_device(sc->client_hdev);
 		hid_hw_stop(hdev);
 		return -ENODEV;
 	}
@@ -3113,6 +3247,13 @@ static void sony_remove(struct hid_device *hdev)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
 
+	if (!sc || hdev->ll_driver == &sony_client_ll_driver) {
+		hid_hw_stop(hdev);
+		return;
+	}
+	if (sc->client_hdev)
+		hid_destroy_device(sc->client_hdev);
+
 	if (sc->quirks & GHL_GUITAR_PS3WIIU)
 		del_timer_sync(&sc->ghl_poke_timer);
 
@@ -3186,10 +3327,12 @@ static int sony_param_set_touchpad_mouse(const char *val,
 	mutex_lock(&sony_dev_list_lock);
 	list_for_each_entry(sc, &sony_device_list, list_node) {
 		mutex_lock(&sc->mutex);
-		if (touchpad_mouse)
-			sony_register_ds4_touchpad(sc);
-		else
-			sony_unregister_touchpad(sc);
+		if (!sc->client_opened) {
+			if (touchpad_mouse)
+				sony_register_ds4_touchpad(sc);
+			else
+				sony_unregister_touchpad(sc);
+		}
 		mutex_unlock(&sc->mutex);
 	}
 	mutex_unlock(&sony_dev_list_lock);
-- 
2.36.0


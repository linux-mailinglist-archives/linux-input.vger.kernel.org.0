Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9486A512579
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 00:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbiD0WtW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Apr 2022 18:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbiD0WtV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Apr 2022 18:49:21 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAACA2E683
        for <linux-input@vger.kernel.org>; Wed, 27 Apr 2022 15:46:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id A82F9A280;
        Wed, 27 Apr 2022 15:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651099568; bh=p8+VYzUhmpUfHrNxOPRwhnvd7sDVJgUwT40132Cf/a0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RBSwmpHjyIJ84/qpetmzbaRxnOKFBeg3sm4pFaaZWlpCQCWzfBWXs5UEMYHCzZFRW
         5Gtp4eivaBg0nnrojsBna/27By+R2TqgNtKGDHgpxWOh5/2gjlTQjXNKMYuxrwWO1T
         OGX6mAWMTbGRX18JJf6QxLVysDCnAehka9AOwcLNafFg/9sIjhzE3dxalyJeEQcVOo
         gWwM8QorMedP7nz1434Or35HXdak/Mtz5sQXw6gamNzx/ipcLquSJD7LDnXxYlzcU4
         QoX32hQ9SKSOQN5uE5eBY/K4gGDdKISqQGbz9WNXVqE/wsbyhnfIQJLhwW+jpVAgWI
         W0CMib5xaR+Tg==
From:   Vicki Pfau <vi@endrift.com>
To:     linux-input@vger.kernel.org
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/6] HID: hid-playstation: Disable touchpad reporting when hidraw open
Date:   Wed, 27 Apr 2022 15:45:23 -0700
Message-Id: <20220427224526.35657-3-vi@endrift.com>
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
 drivers/hid/hid-playstation.c | 144 +++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ad0da4470615..3746c9c550d6 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -30,9 +30,10 @@ static bool touchpad_mouse = true;
 /* Base class for playstation devices. */
 struct ps_device {
 	struct list_head list;
-	struct hid_device *hdev;
+	struct hid_device *hdev, *client_hdev;
 	struct mutex mutex;
 	spinlock_t lock;
+	bool client_opened;
 
 	uint32_t player_id;
 
@@ -643,6 +644,102 @@ static const struct attribute_group ps_device_attribute_group = {
 	.attrs = ps_device_attributes,
 };
 
+static int ps_client_ll_parse(struct hid_device *hdev)
+{
+	struct ps_device *dev = hdev->driver_data;
+
+	return hid_parse_report(hdev, dev->hdev->dev_rdesc,
+			dev->hdev->dev_rsize);
+}
+
+static int ps_client_ll_start(struct hid_device *hdev)
+{
+	return 0;
+}
+
+static void ps_client_ll_stop(struct hid_device *hdev)
+{
+}
+
+static int ps_client_ll_open(struct hid_device *hdev)
+{
+	struct ps_device *dev = hdev->driver_data;
+	struct dualsense *ds;
+
+	mutex_lock(&dev->mutex);
+	dev->client_opened = true;
+	mutex_unlock(&dev->mutex);
+
+	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+		ds = container_of(dev, struct dualsense, base);
+		dualsense_unregister_touchpad(ds);
+	}
+
+	return 0;
+}
+
+static void ps_client_ll_close(struct hid_device *hdev)
+{
+	struct ps_device *dev = hdev->driver_data;
+	struct dualsense *ds;
+	struct input_dev *touchpad;
+
+	mutex_lock(&dev->mutex);
+	dev->client_opened = false;
+	mutex_unlock(&dev->mutex);
+
+	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+		ds = container_of(dev, struct dualsense, base);
+		touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
+		if (IS_ERR(touchpad))
+			return;
+		rcu_assign_pointer(ds->touchpad, touchpad);
+	}
+}
+
+static int ps_client_ll_raw_request(struct hid_device *hdev,
+				unsigned char reportnum, u8 *buf,
+				size_t count, unsigned char report_type,
+				int reqtype)
+{
+	struct ps_device *dev = hdev->driver_data;
+
+	return hid_hw_raw_request(dev->hdev, reportnum, buf, count,
+			report_type, reqtype);
+}
+
+static struct hid_ll_driver ps_client_ll_driver = {
+	.parse = ps_client_ll_parse,
+	.start = ps_client_ll_start,
+	.stop = ps_client_ll_stop,
+	.open = ps_client_ll_open,
+	.close = ps_client_ll_close,
+	.raw_request = ps_client_ll_raw_request,
+};
+
+static struct hid_device *ps_create_client_hid(struct hid_device *hdev)
+{
+	struct hid_device *client_hdev;
+
+	client_hdev = hid_allocate_device();
+	if (IS_ERR(client_hdev))
+		return client_hdev;
+
+	client_hdev->ll_driver = &ps_client_ll_driver;
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
 static int dualsense_get_calibration_data(struct dualsense *ds)
 {
 	short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
@@ -1190,6 +1287,11 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	INIT_WORK(&ds->output_worker, dualsense_output_worker);
 	hid_set_drvdata(hdev, ds);
 
+	ps_dev->client_hdev = ps_create_client_hid(hdev);
+	if (IS_ERR(ps_dev->client_hdev))
+		return ERR_CAST(ps_dev->client_hdev);
+	ps_dev->client_hdev->driver_data = ps_dev;
+
 	max_output_report_size = sizeof(struct dualsense_output_report_bt);
 	ds->output_report_dmabuf = devm_kzalloc(&hdev->dev, max_output_report_size, GFP_KERNEL);
 	if (!ds->output_report_dmabuf)
@@ -1280,8 +1382,20 @@ static int ps_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *data, int size)
 {
 	struct ps_device *dev = hid_get_drvdata(hdev);
+	int ret = 0;
+
+	if (!dev)
+		return 0;
 
-	if (dev && dev->parse_report)
+	if (dev->client_opened) {
+		ret = hid_input_report(dev->client_hdev, HID_INPUT_REPORT, data, size, 0);
+		if (ret) {
+			hid_err(hdev, "can't send input report to client hdev: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (dev->parse_report)
 		return dev->parse_report(dev, report, data, size);
 
 	return 0;
@@ -1291,6 +1405,7 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct ps_device *dev;
 	int ret;
+	unsigned int connect_mask = 0;
 
 	ret = hid_parse(hdev);
 	if (ret) {
@@ -1298,12 +1413,22 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (hdev->ll_driver == &ps_client_ll_driver)
+		connect_mask = HID_CONNECT_HIDRAW;
+
+	ret = hid_hw_start(hdev, connect_mask);
 	if (ret) {
 		hid_err(hdev, "Failed to start HID device\n");
 		return ret;
 	}
 
+	/*
+	 * The virtual client_dev is only used for hidraw. Since we've already
+	 * started the hw, return early to avoid the recursive probe.
+	 */
+	if (hdev->ll_driver == &ps_client_ll_driver)
+		return ret;
+
 	ret = hid_hw_open(hdev);
 	if (ret) {
 		hid_err(hdev, "Failed to open HID device\n");
@@ -1325,9 +1450,19 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_close;
 	}
 
+	if (dev->client_hdev)
+		ret = hid_add_device(dev->client_hdev);
+	if (ret) {
+		hid_err(hdev, "Failed to start client device failed\n");
+		goto err_close;
+	}
+
 	return ret;
 
 err_close:
+	if (dev->client_hdev)
+		hid_destroy_device(dev->client_hdev);
+
 	hid_hw_close(hdev);
 err_stop:
 	hid_hw_stop(hdev);
@@ -1341,6 +1476,9 @@ static void ps_remove(struct hid_device *hdev)
 	ps_devices_list_remove(dev);
 	ps_device_release_player_id(dev);
 
+	if (dev->client_hdev)
+		hid_destroy_device(dev->client_hdev);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.36.0


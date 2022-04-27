Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3334051257B
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 00:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbiD0WtV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Apr 2022 18:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235141AbiD0WtU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Apr 2022 18:49:20 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2088A2B269
        for <linux-input@vger.kernel.org>; Wed, 27 Apr 2022 15:46:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id F0971A276;
        Wed, 27 Apr 2022 15:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651099567; bh=Fhen1b3U4qY0y8pPJVLjOgAj2TmislX9tcDOzO998lo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0YNXvqCduox3qiEMVfFSZ+vjv0J5vzLdbfMjjy0BXr7K0XS6VehH0xDL3q2sThOpK
         UwShgU0KvmSdp8mN60gXNlANxcGNlwB5pW78QbhJoVMa7+WWwbIpqUHszwJcdsCKyD
         KavGBXdBf/MSQF+Q43C5WnuYIgoHdZFUrUum/9awYS2xrP9UDuGADxFNrpOpRVNhZC
         NUaKnqch0Nv0J3313p1JLEudf0u022v0etFXg/UXTo94fuoXNerFXt0g6SWWeu5Xe1
         jHWS83vVNlTu6cvHHHfcvZcJMA/0E2FjpDeyguYQUyJ8KOruDj5ltWVCfAFEmmoc2c
         alnIYoXI/2aMA==
From:   Vicki Pfau <vi@endrift.com>
To:     linux-input@vger.kernel.org
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/6] HID: hid-playstation: Add touchpad_mouse param
Date:   Wed, 27 Apr 2022 15:45:22 -0700
Message-Id: <20220427224526.35657-2-vi@endrift.com>
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

Add parameter "touchpad_mouse" to enable disabling or re-enabling exposing the
touchpad input_dev, which can be changed while the module is loaded.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-playstation.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f859a8dd8a2e..ad0da4470615 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -23,6 +23,8 @@ static LIST_HEAD(ps_devices_list);
 
 static DEFINE_IDA(ps_player_id_allocator);
 
+static bool touchpad_mouse = true;
+
 #define HID_PLAYSTATION_VERSION_PATCH 0x8000
 
 /* Base class for playstation devices. */
@@ -1343,6 +1345,45 @@ static void ps_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
+static int ps_param_set_touchpad_mouse(const char *val,
+					const struct kernel_param *kp)
+{
+	struct ps_device *dev;
+	struct dualsense *ds;
+	struct input_dev *touchpad;
+	int ret;
+
+	ret = param_set_bool(val, kp);
+	if (ret)
+		return ret;
+
+	mutex_lock(&ps_devices_lock);
+	list_for_each_entry(dev, &ps_devices_list, list) {
+		mutex_lock(&dev->mutex);
+		if (dev->hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+			ds = container_of(dev, struct dualsense, base);
+			if (touchpad_mouse) {
+				touchpad = ps_touchpad_create(dev->hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
+				if (IS_ERR(touchpad))
+					continue;
+				rcu_assign_pointer(ds->touchpad, touchpad);
+			} else
+				dualsense_unregister_touchpad(ds);
+		}
+		mutex_unlock(&dev->mutex);
+	}
+	mutex_unlock(&ps_devices_lock);
+	return 0;
+}
+
+static const struct kernel_param_ops ps_touchpad_mouse_ops = {
+	.set	= ps_param_set_touchpad_mouse,
+	.get	= param_get_bool,
+};
+
+module_param_cb(touchpad_mouse, &ps_touchpad_mouse_ops, &touchpad_mouse, 0644);
+MODULE_PARM_DESC(touchpad_mouse, "Enable mouse emulation using the touchpad");
+
 static const struct hid_device_id ps_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
-- 
2.36.0


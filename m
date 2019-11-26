Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC6710A300
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2019 18:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbfKZRIB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Nov 2019 12:08:01 -0500
Received: from baruwa.lunarpages.net ([64.50.173.10]:64996 "EHLO
        baruwa.lunarpages.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728637AbfKZRIB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Nov 2019 12:08:01 -0500
X-Greylist: delayed 1022 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Nov 2019 12:08:01 EST
X-Lunarpages-BaruwaFW-From: me@danielturton.net
X-Lunarpages-BaruwaFW: Found to be clean
X-Lunarpages-BaruwaFW-ID: 1iZe3A-00071w-BZ
X-Lunarpages-BaruwaFW-Information: Please contact Lunarpages Web Hosting for more information
Received: from balsa.lunarbreeze.com ([216.227.215.110])
        by baruwa.lunarpages.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Baruwa 2.0)
        (envelope-from <me@danielturton.net>)
        id 1iZe3A-00071w-BZ ret-id none;
        for linux-input@vger.kernel.org; Tue, 26 Nov 2019 08:50:52 -0800
Received: from [98.156.176.16] (port=41796 helo=[192.168.1.135])
        by balsa.lunarbreeze.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <me@danielturton.net>)
        id 1iZe3A-0005QT-5S
        for linux-input@vger.kernel.org; Tue, 26 Nov 2019 08:50:52 -0800
To:     linux-input@vger.kernel.org
From:   Daniel Turton <me@danielturton.net>
Subject: [PATCH] USB: magicmouse: Make Magic Trackpad 2 to work after
 sleep/wake cycle
Message-ID: <e8a4fcfc-c7da-624c-5bd6-ed4deb952452@danielturton.net>
Date:   Tue, 26 Nov 2019 10:49:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Baruwa-Relayed-From: 216.227.215.110
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The hid-magicmouse driver is not handling the Apple Magic Trackpad 2 device properly after a sleep/wake session, where single clicks were recognized, but mouse movement and other clicks were not. The remedy has been to remove and re-connect the device, allowing it to work once again.  More background on the issue is available here: https://github.com/robotrovsky/Linux-Magic-Trackpad-2-Driver/issues/37

This patch allows the device to operate properly after a sleep/wake session, but it returns a -32 (broken pipe) error code with the call to hid_hw_raw_request within the magicmouse_hdev_resume function below. In the original code, the prior developer(s) commented that some trackpads will send back an I/O error, and account for that in the if test below the hid_hw_raw_request call.

At this time, I'm not sure why the -32 error is being returned. I'm continuing the search on my end, but any assistance or pointers would be appreciated.

--- /home/dturton/kernel_hacking/linux/drivers/hid/hid-magicmouse.c 2019-11-24 16:28:11.150005796 -0600
+++ /home/dturton/kernel_hacking/magic_trackpad2_fix/linux/drivers/hid/hid-magicmouse.c 2019-11-26 10:37:14.450633946 -0600
@@ -700,6 +700,54 @@
  };
  MODULE_DEVICE_TABLE(hid, magic_mice);

+static int magicmouse_hdev_resume(struct hid_device *hdev)
+{
+    int ret;
+    int feature_size;
+    u8 *buf;
+    const u8 *feature;
+    const u8 feature_mt[] = { 0xD7, 0x01 };
+    const u8 feature_mt_trackpad2_usb[] = { 0x02, 0x01 };
+    const u8 feature_mt_trackpad2_bt[] = { 0xF1, 0x02, 0x01 };
+
+    if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+        if (hdev->vendor == BT_VENDOR_ID_APPLE) {
+            feature_size = sizeof(feature_mt_trackpad2_bt);
+            feature = feature_mt_trackpad2_bt;
+        } else { /* USB_VENDOR_ID_APPLE */
+            feature_size = sizeof(feature_mt_trackpad2_usb);
+            feature = feature_mt_trackpad2_usb;
+        }
+    } else {
+        feature_size = sizeof(feature_mt);
+        feature = feature_mt;
+    }
+
+    buf = kmemdup(feature, feature_size, GFP_KERNEL);
+    if (!buf) {
+        ret = -ENOMEM;
+        goto err_stop_hw;
+    }
+
+    ret = hid_hw_raw_request(hdev, buf[0], buf, feature_size,
+                HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+    kfree(buf);
+    if (ret != -EIO && ret != feature_size) {
+        hid_err(hdev, "unable to request touch data (%d)\n", ret);
+        goto err_stop_hw;
+    }
+    return 0;
+    err_stop_hw:
+            hid_hw_stop(hdev);
+            return ret;
+    }
+
+static int magicmouse_hdev_suspend(
+    struct hid_device *hdev,
+    struct pm_message ignored
+){
+    return 0;
+}
  static struct hid_driver magicmouse_driver = {
      .name = "magicmouse",
      .id_table = magic_mice,
@@ -707,6 +755,8 @@
      .raw_event = magicmouse_raw_event,
      .input_mapping = magicmouse_input_mapping,
      .input_configured = magicmouse_input_configured,
+    .reset_resume = magicmouse_hdev_resume,
+    .suspend = magicmouse_hdev_suspend,
  };
  module_hid_driver(magicmouse_driver);


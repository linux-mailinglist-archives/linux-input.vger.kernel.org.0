Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA432E8D4
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2019 01:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfE2XKu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 19:10:50 -0400
Received: from mga02.intel.com ([134.134.136.20]:15944 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfE2XKt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 19:10:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 16:10:49 -0700
X-ExtLoop1: 1
Received: from hyungwoo-ubuntu.sc.intel.com ([10.3.62.78])
  by orsmga005.jf.intel.com with ESMTP; 29 May 2019 16:10:49 -0700
From:   Hyungwoo Yang <hyungwoo.yang@intel.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     jikos@kernel.org, linux-input@vger.kernel.org,
        rushikesh.s.kadam@intel.com, jettrink@chromium.org
Subject: [PATCH v3] HID: intel-ish-hid: fix wrong driver_data usage
Date:   Wed, 29 May 2019 16:10:48 -0700
Message-Id: <1559171448-28467-1-git-send-email-hyungwoo.yang@intel.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, in suspend() and resume(), ishtp client drivers are using
driver_data to get "struct ishtp_cl_device" object which is set by
bus driver. It's wrong since the driver_data should not be owned bus.
driver_data should be owned by the corresponding ishtp client driver.
Due to this, some ishtp client driver like cros_ec_ishtp which uses
its driver_data to transfer its data to its child doesn't work correctly.

So this patch removes setting driver_data in bus drier and instead of
using driver_data to get "struct ishtp_cl_device", since "struct device"
is embedded in "struct ishtp_cl_device", we introduce a helper function
that returns "struct ishtp_cl_device" from "struct device".

Signed-off-by: Hyungwoo Yang <hyungwoo.yang@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c |  4 ++--
 drivers/hid/intel-ish-hid/ishtp/bus.c        | 15 ++++++++++++++-
 include/linux/intel-ish-client-if.h          |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index 56777a4..19102a3 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -899,7 +899,7 @@ static int hid_ishtp_cl_reset(struct ishtp_cl_device *cl_device)
  */
 static int hid_ishtp_cl_suspend(struct device *device)
 {
-	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
+	struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
 	struct ishtp_cl *hid_ishtp_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
 
@@ -920,7 +920,7 @@ static int hid_ishtp_cl_suspend(struct device *device)
  */
 static int hid_ishtp_cl_resume(struct device *device)
 {
-	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
+	struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
 	struct ishtp_cl *hid_ishtp_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index fb8ca12..4b4a604 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -479,7 +479,6 @@ static struct ishtp_cl_device *ishtp_bus_add_device(struct ishtp_device *dev,
 	}
 
 	ishtp_device_ready = true;
-	dev_set_drvdata(&device->dev, device);
 
 	return device;
 }
@@ -648,6 +647,20 @@ void *ishtp_get_drvdata(struct ishtp_cl_device *cl_device)
 EXPORT_SYMBOL(ishtp_get_drvdata);
 
 /**
+ * ishtp_dev_to_cl_device() - get ishtp_cl_device instance from device instance
+ * @device: device instance
+ *
+ * Get ish_cl_device instance which embeds device instance in it.
+ *
+ * Return: pointer to ishtp_cl_device instance
+ */
+struct ishtp_cl_device *ishtp_dev_to_cl_device(struct device *device)
+{
+	return to_ishtp_cl_device(device);
+}
+EXPORT_SYMBOL(ishtp_dev_to_cl_device);
+
+/**
  * ishtp_bus_new_client() - Create a new client
  * @dev:	ISHTP device instance
  *
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index 16255c2..0d6b4bc 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -103,6 +103,7 @@ int ishtp_register_event_cb(struct ishtp_cl_device *device,
 void ishtp_get_device(struct ishtp_cl_device *cl_dev);
 void ishtp_set_drvdata(struct ishtp_cl_device *cl_device, void *data);
 void *ishtp_get_drvdata(struct ishtp_cl_device *cl_device);
+struct ishtp_cl_device *ishtp_dev_to_cl_device(struct device *dev);
 int ishtp_register_event_cb(struct ishtp_cl_device *device,
 				void (*read_cb)(struct ishtp_cl_device *));
 struct	ishtp_fw_client *ishtp_fw_cl_get_client(struct ishtp_device *dev,
-- 
1.9.1


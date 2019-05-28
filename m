Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 712F02D10D
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 23:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfE1Vg6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 17:36:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:37573 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbfE1Vg6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 17:36:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 May 2019 14:36:57 -0700
X-ExtLoop1: 1
Received: from hyungwoo-ubuntu.sc.intel.com ([10.3.62.78])
  by FMSMGA003.fm.intel.com with ESMTP; 28 May 2019 14:36:57 -0700
From:   Hyungwoo Yang <hyungwoo.yang@intel.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     jikos@kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
Date:   Tue, 28 May 2019 14:36:56 -0700
Message-Id: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

"struct device" is embedded in "struct ishtp_cl_device".
so the conversion should be done by container_of() method.

Change-Id: Idcbafe724e216ee6275f9d1e35a3b79cee5ce88c
Signed-off-by: Hyungwoo Yang <hyungwoo.yang@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 4 ++--
 drivers/platform/chrome/cros_ec_ishtp.c      | 4 ++--
 include/linux/intel-ish-client-if.h          | 1 +
 3 files changed, 5 insertions(+), 4 deletions(-)

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
 
diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index e504d25..430731c 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -707,7 +707,7 @@ static int cros_ec_ishtp_reset(struct ishtp_cl_device *cl_device)
  */
 static int __maybe_unused cros_ec_ishtp_suspend(struct device *device)
 {
-	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
+	struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
 	struct ishtp_cl	*cros_ish_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
 
@@ -722,7 +722,7 @@ static int __maybe_unused cros_ec_ishtp_suspend(struct device *device)
  */
 static int __maybe_unused cros_ec_ishtp_resume(struct device *device)
 {
-	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
+	struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
 	struct ishtp_cl	*cros_ish_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
 
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


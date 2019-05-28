Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3792D10E
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 23:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfE1Vg6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 17:36:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:37573 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726812AbfE1Vg6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
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
Subject: [PATCH 2/2] HID: intel-ish-hid: fix wrong driver_data setting
Date:   Tue, 28 May 2019 14:36:57 -0700
Message-Id: <1559079417-32039-2-git-send-email-hyungwoo.yang@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
References: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

driver_data of HECI client device should be managed(set/get) by
corresponding HECI client driver. Bus shouldn't set it.

Change-Id: I128e36663e3b1f88b53dac7a9d8b846475215875
Signed-off-by: Hyungwoo Yang <hyungwoo.yang@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index fb8ca12..036aa43 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -479,7 +479,6 @@ static struct ishtp_cl_device *ishtp_bus_add_device(struct ishtp_device *dev,
 	}
 
 	ishtp_device_ready = true;
-	dev_set_drvdata(&device->dev, device);
 
 	return device;
 }
@@ -647,6 +646,13 @@ void *ishtp_get_drvdata(struct ishtp_cl_device *cl_device)
 }
 EXPORT_SYMBOL(ishtp_get_drvdata);
 
+
+struct ishtp_cl_device *ishtp_dev_to_cl_device(struct device *device)
+{
+	return container_of(device, struct ishtp_cl_device, dev);
+}
+EXPORT_SYMBOL(ishtp_dev_to_cl_device);
+
 /**
  * ishtp_bus_new_client() - Create a new client
  * @dev:	ISHTP device instance
-- 
1.9.1


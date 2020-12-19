Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D032DED7A
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgLSGZB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgLSGZB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:01 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75B2C0611C5
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:46 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id c12so2841841pfo.10
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xiom21k8ouKY1sgtAKcfpq0w+T/ah4O7YYXgyd7k2Qc=;
        b=bNJVvQtU5HM13JMzZxT62qcs5qfHKppFcSmtu2BimoOkLhVErD4svw+fGvUEk7iAs1
         LU3RH8wQR7Mngm2X/38ecDlAjzPXc/3d9DhMnPHD9y+z6cZRFEok9VNW7+74CPb9hICo
         xrjW9cd8AmUPzG/8LuWnpJRvoAcYxMm5OVaZt3tmUmJjhG/HLh2n4u62tF3mRp6oBto/
         NI6AE6Y/zyigWxsKNmyKWT9IoE2w7BYX5a+qvupLSxszeeA0f02yyUJgpZ9OkBV14cPj
         FvVSVzYa9/qKLjDNymtRcp6CAKv0G+KwUDjHZ7xy0lsTp5FmJNoD4+S+W/yXvtvJxAgy
         Zv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xiom21k8ouKY1sgtAKcfpq0w+T/ah4O7YYXgyd7k2Qc=;
        b=tETiLrdoYUoxEVTjxnZ4ONFR86Q0+BeqRM2Sk2fQsZS3/+Q8eMQwJRwBgU+7O+8251
         gRG6Quj+dvN+jRCEJT+C7I1C8Tm77dsrmf9l8YdY6VtXlGc2IhOpIxIBKQqPI7zNlqfu
         MY3jX0/y1pCLA5gGZn3afYn7u6Yd+hFV0MwMFPQWY32MxCIgt2rGwWow2zFq1CGBKpTh
         uJqPqcLwlD60ajiQVKTUnEmcf4OR1HWglo1jJdnloGshNc/aTUrpqcsIWrzt7b3bX+6h
         Zti5ZOE62T4kxlkvwIux0kqWN1FBL01hXxFpHLCrmjMqd3XqPpVMUQztfy8m4d/ZviVF
         Lf8A==
X-Gm-Message-State: AOAM530SB2CDLG8/FxMmxdIydpaOFSP/TPuiW/vRFltXhs9M4Go/vt0M
        dGx2odhA2o9ye8+JVOyYVsb5OyfrEeZT2w==
X-Google-Smtp-Source: ABdhPJwMsERqpWjFG2rIshnDXmwk7J+YrB7IzQZVJT6fk3tkjUnHbbmH/3YA9xkS4uQwDTwMu8PX4Q==
X-Received: by 2002:a63:1110:: with SMTP id g16mr7109160pgl.357.1608359026455;
        Fri, 18 Dec 2020 22:23:46 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:46 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 06/13] HID: playstation: track devices in list.
Date:   Fri, 18 Dec 2020 22:23:29 -0800
Message-Id: <20201219062336.72568-7-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Track devices in a list, so we can detect when a device is connected
twice when using Bluetooth and USB.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ea64f73e0b84..b0c0286cfd2b 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -14,8 +14,13 @@
 
 #include "hid-ids.h"
 
+/* List of connected playstation devices. */
+static DEFINE_MUTEX(ps_devices_lock);
+static LIST_HEAD(ps_devices_list);
+
 /* Base class for playstation devices. */
 struct ps_device {
+	struct list_head list;
 	struct hid_device *hdev;
 	spinlock_t lock;
 
@@ -145,6 +150,37 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
 	{0, 0}
 };
 
+/* Add a new ps_device to ps_devices if it doesn't exist.
+ * Return error on duplicate device, which can happen if the same
+ * device is connected using both Bluetooth and USB.
+ */
+static int ps_devices_list_add(struct ps_device *dev)
+{
+	struct ps_device *entry;
+
+	mutex_lock(&ps_devices_lock);
+	list_for_each_entry(entry, &ps_devices_list, list) {
+		if (!memcmp(entry->mac_address, dev->mac_address, sizeof(dev->mac_address))) {
+			hid_err(dev->hdev, "Duplicate device found for MAC address %pMR\n",
+					dev->mac_address);
+			mutex_unlock(&ps_devices_lock);
+			return -EEXIST;
+		}
+	}
+
+	list_add_tail(&dev->list, &ps_devices_list);
+	mutex_unlock(&ps_devices_lock);
+	return 0;
+}
+
+static int ps_devices_list_remove(struct ps_device *dev)
+{
+	mutex_lock(&ps_devices_lock);
+	list_del(&dev->list);
+	mutex_unlock(&ps_devices_lock);
+	return 0;
+}
+
 static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
 {
 	struct input_dev *input_dev;
@@ -613,6 +649,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = ps_devices_list_add((struct ps_device *)ds);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
 	ret = dualsense_get_calibration_data(ds);
 	if (ret < 0) {
 		hid_err(hdev, "Failed to get calibration data from DualSense\n");
@@ -645,6 +685,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return (struct ps_device *)ds;
 
 err:
+	ps_devices_list_remove((struct ps_device *)ds);
 	return ERR_PTR(ret);
 }
 
@@ -706,6 +747,10 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 static void ps_remove(struct hid_device *hdev)
 {
+	struct ps_device *dev = hid_get_drvdata(hdev);
+
+	ps_devices_list_remove(dev);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.26.2


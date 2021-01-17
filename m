Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912472F9619
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730640AbhAQXL3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730600AbhAQXL1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:11:27 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF72AC0613CF
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:06 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id b8so7615459plh.12
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bc6VKzpYcxsddrF4QSdav8aOf5GfQVJ8Cxb0wIxyXRA=;
        b=Llx8F/XffmRzTYeo6SiD8fC1Or1EMxsoXPxWovA3xqXf5SxlrdtJc3wOkjr2JeMi3P
         esipbwK4oxk8Zjp2aGcMPN8qCa4lPq0mduVq204Ri5JxncjqNUJDI/r0murXVwNqtCZt
         7fwY5DLCvIQ0Loy4RftarEvUVHNtlJcSMOlFCPCbwMgTnVGTmEpEPNlTIqDOw3ZyEAH9
         uLuY2AxNbjlZV20wDrGzobdlc1ii6tRuLpdGNfqtD8TubM3RgJ+Ltm5v4DonMy8SHOED
         1yPJSGVn407ABfFXgcUVQE9xSPRvqWYHAVXekJzHjt5tSs5HWYizKqNOaebHW7rTXXyE
         PHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bc6VKzpYcxsddrF4QSdav8aOf5GfQVJ8Cxb0wIxyXRA=;
        b=B5I7w93lJjhg4CfuIx3oBScS9OkhW+FWqkrZXsJso7cVD24OokqCvPgwhXn+OLtSB3
         AajJVrpfOh0CZcCwDAPM/EPI+t7BlIkcWc+1s4mFc7LJdz7Cg1YjXp9R8BzLRM2rPBRC
         +fsbs9+d36yYtFrlkmKzWkOEM0RFvi+TqLZz0X0ASmff36/EN+mkoddb4MzVziAhXDZM
         akAUGQKJYhfzfKE/QEFf8wLF5/9R7zYnp0NNSsQz3zQcxS2ZpN20XdyVG733eYjDaaaF
         oLrTB1YtcozNJecH01YpQ8Uo1mB5Zm5FBvYXOHEsVTjqI5bkDUw601HUGN2T6uOc/mSz
         +gGA==
X-Gm-Message-State: AOAM531zqj5jd3ywlMPdlJTLTFRKq+g4Mb4qcfeJh2nciNy0Rjf9pMI0
        vty+cojmeCGk7hRXHnhozhMs5Q==
X-Google-Smtp-Source: ABdhPJxfjepzHe5rwjvBNx77k3QdwAPoqRkJ1FiWkxERjYLwpqn/pMoSUGGtapxS9oy+4T1qm4CZGQ==
X-Received: by 2002:a17:90a:540c:: with SMTP id z12mr12456999pjh.34.1610925006422;
        Sun, 17 Jan 2021 15:10:06 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:10:05 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 05/12] HID: playstation: track devices in list.
Date:   Sun, 17 Jan 2021 15:09:49 -0800
Message-Id: <20210117230956.173031-6-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
References: <20210117230956.173031-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index cde7d7fe5bac..a14c33a52c8f 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -15,10 +15,15 @@
 
 #include "hid-ids.h"
 
+/* List of connected playstation devices. */
+static DEFINE_MUTEX(ps_devices_lock);
+static LIST_HEAD(ps_devices_list);
+
 #define HID_PLAYSTATION_VERSION_PATCH 0x8000
 
 /* Base class for playstation devices. */
 struct ps_device {
+	struct list_head list;
 	struct hid_device *hdev;
 	spinlock_t lock;
 
@@ -160,6 +165,38 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
 	{0, 0},
 };
 
+/*
+ * Add a new ps_device to ps_devices if it doesn't exist.
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
+			hid_err(dev->hdev, "Duplicate device found for MAC address %pMR.\n",
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
@@ -666,6 +703,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = ps_devices_list_add(ps_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = dualsense_get_calibration_data(ds);
 	if (ret) {
 		hid_err(hdev, "Failed to get calibration data from DualSense\n");
@@ -698,6 +739,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return &ds->base;
 
 err:
+	ps_devices_list_remove(ps_dev);
 	return ERR_PTR(ret);
 }
 
@@ -755,6 +797,10 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
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


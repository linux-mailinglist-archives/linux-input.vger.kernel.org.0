Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF9F3127A6
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 22:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhBGVug (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 16:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhBGVuf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 16:50:35 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED7BC06178C
        for <linux-input@vger.kernel.org>; Sun,  7 Feb 2021 13:49:20 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id x23so6966548pfn.6
        for <linux-input@vger.kernel.org>; Sun, 07 Feb 2021 13:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9EWmbIgvYUW7OM2AxzyZexv1FTAkEK5SrqDnJdoartU=;
        b=jcSFF2vJoYFmlStYFs3fGNeXQOAnr1sZX24mFFZY70diYHwfv/AD8m2G7zusGoUnBC
         XFzNPAs1+Ksk4zbnOh0Dmf/a3X2h0MrVceymgB585T9Wb0D8rF5MGi7WugfYlyvoiJWt
         qrE50ajCgyDwm6hSPlQb3IPyzEUH+fKegj1tLA7Sp0sBwoZGgeDE8mYqrZieC50jktLz
         5dwBI0r9YXNAtvFeNWNZk2Iv8V0s90o1dobkDEDo9vklk4b2A3QrCAhLKlb4V9B8Jemi
         T6mYN0JUGiO7dud8sfW4zRTpmcAIn5MEGqC4zydW8qJFxg4fZMaJFhCWp/kZLzThjQeM
         hXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9EWmbIgvYUW7OM2AxzyZexv1FTAkEK5SrqDnJdoartU=;
        b=P40XcyODDS712tksXxCWskoCVt+FMYCBvOnFQSSZyavGkNCV7BcXNbv1ZBnESihjUw
         WFrabVF79XC/OyjqUdZdJ52gu7EiSRWg9WlgoWwDleTLYiEbPCPXeLbIiVssI+139ja8
         IrQ8MX7Tjq06V466ln9r+2sAI9KQNy0BILqv9ctdGiL+hukSyFdclKZOoy/FFpVGA/sd
         yLqOmeOHOwDR2yG+xBf+iuLBQpYIxVPUvtbNfkvliIrAWc7yoYmO8N8ea3NGCnRnF7Xi
         CBEOiy3oGamXJjY5ddkGqLH29u5Ksy8B7toG17O9ISRgfUa3iw657FbRqFkvddvQ6q1j
         SxZw==
X-Gm-Message-State: AOAM532lEAxGm2mLeokVeW2Wgoe4rXSO0AxfTRmmgJUYN2hNnN/ETqoC
        gniRfD+gvuFJu5/OdW2/UvClYA==
X-Google-Smtp-Source: ABdhPJz5hF2jQ+cdEXit+IKKgK5pogt6reDeGIMO3eBmLwR5NKZ7ywTdexebzKHF/ySQJlQMDbBjhg==
X-Received: by 2002:a63:c741:: with SMTP id v1mr14224860pgg.316.1612734560438;
        Sun, 07 Feb 2021 13:49:20 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a141sm16578991pfa.189.2021.02.07.13.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 13:49:20 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 06/13] HID: playstation: track devices in list.
Date:   Sun,  7 Feb 2021 13:49:01 -0800
Message-Id: <20210207214908.79573-7-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207214908.79573-1-roderick@gaikai.com>
References: <20210207214908.79573-1-roderick@gaikai.com>
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
index b09ec604cd27..20fe29fc61c0 100644
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
@@ -675,6 +712,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = ps_devices_list_add(ps_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = dualsense_get_calibration_data(ds);
 	if (ret) {
 		hid_err(hdev, "Failed to get calibration data from DualSense\n");
@@ -707,6 +748,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return &ds->base;
 
 err:
+	ps_devices_list_remove(ps_dev);
 	return ERR_PTR(ret);
 }
 
@@ -764,6 +806,10 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
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


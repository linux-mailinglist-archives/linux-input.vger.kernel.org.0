Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1932D2F9664
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbhAQXrt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730357AbhAQXpb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:31 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D768C0613ED
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:51 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id m5so8575981pjv.5
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cfp3uHNO+9480U467rwYUoRR7dsHtCIHJqX+1ZPrA78=;
        b=qksbclq7lbh5EmVPtVtta3zev47TOOc/VbpbQn9URIpsIHANJlGnGie5cExM2Nq0hb
         fqRqz92M1eyKQWsngZfWDE3Tj43wE4pZyNUBvZnALijqdg89ZRE4dnYBKG4Z4IBXknaD
         Sg2YcgXw1wzENtcuQBLLcJAvF3abGb0IefowXB3i+3E3MDbBm3TxDY04qQLDszQXb4bc
         w/J5nTuP6ig6LUVXSeIDVCfhCjmXjFxOQgWL1NLVHwl+qEPdHBfZy/SBngt3jyp76kL8
         0x2kOasAI2/utof6MbWtMWaodo5oKaEnjngSInKQQBrfNE24fpINplw6FpHu2xFnTDXa
         /Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cfp3uHNO+9480U467rwYUoRR7dsHtCIHJqX+1ZPrA78=;
        b=uVQjawhktb9xILd/wr4ulhoJJnQHWaBxX3N+zZtddqS02516CQiW6fSQI3JvgjP7Ny
         SQhHgu4/EgPLr75z4qUu78tn29mQULuOUny5lbn7jTRXprNu42s3RPFPp1NwsW8l/9pI
         HZ174Pe4WJmO9L1HRWR6WnBlkLzrKQlMaFKfvpiSzrlhDNgnkojFvHqoXO9u1yB0VZCQ
         a8eFzCIFLSMmC70WZrBNRhIc6xumSHrFyPhO6tDMwGJOvseIE/V92NGaO7YUF/xQcqWr
         ssIVrufyMZbofTx8/VpdRQhaMPxjn3zltY5fWBx9yKsZjeWQLunL7dX8Cez54d7fsqwD
         5nhA==
X-Gm-Message-State: AOAM5327c9J5gqfSr3WZrfUIDM4/53qocEEAddK+bnNFdC7yi+gh54+H
        i2H//56LH8jxQOrofZorGey2NA==
X-Google-Smtp-Source: ABdhPJzNTCQn3+C3wigkVd4MVHhWtlMdPWODI1d4Erij3FsQzhyRBCmU2HHaCc1j+tDPuxVJl6d5ng==
X-Received: by 2002:a17:90a:a415:: with SMTP id y21mr23580502pjp.88.1610927091168;
        Sun, 17 Jan 2021 15:44:51 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:50 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 06/13] HID: playstation: track devices in list.
Date:   Sun, 17 Jan 2021 15:44:28 -0800
Message-Id: <20210117234435.180294-7-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
References: <20210117234435.180294-1-roderick@gaikai.com>
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
index ef8da272cf59..483f790aca71 100644
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
@@ -629,6 +666,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = ps_devices_list_add(ps_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = dualsense_get_calibration_data(ds);
 	if (ret) {
 		hid_err(hdev, "Failed to get calibration data from DualSense\n");
@@ -661,6 +702,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return &ds->base;
 
 err:
+	ps_devices_list_remove(ps_dev);
 	return ERR_PTR(ret);
 }
 
@@ -718,6 +760,10 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
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


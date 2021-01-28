Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86721307C74
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbhA1R3u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhA1R11 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:27 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F0FC06178A
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:11 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id q2so3723499plk.4
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kthstTBuIthT3JV0ye2xCQlLzGRaqCx1dUZ6xTxvsNo=;
        b=Ao8UPtKu15jKR6EQkOJdbBgnj4O3fqw9PrnD6wcemhkw4r4S2JmPI/WBUnVv677g+8
         9opwk/h2pNnel7udMOmcMx7UUoF+0cvml8rihbv9su2C7zENi9Mq99bQQpWHCdg4uIZ8
         U+RpdKV5M5JwNO4JSiZYY0Kz37AHKLk8ZzAYxq8NqAubI+0jaQ/bNkDyA9E0TqhmSjJW
         gMse4I5Nb5TohjJwugofyjD6SufNor3QboWY0Kh+/oLRAOAUu6Ar5iGT11utJjSsskUV
         TAlepFAv9MzANAtnnV9s6ZRlz6Kt8WFBA7xb4luNA/0O74CgbPenHT+i+VCnc0xk1kA1
         EY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kthstTBuIthT3JV0ye2xCQlLzGRaqCx1dUZ6xTxvsNo=;
        b=F+qIZ+o0PdAToXr2daAapsr7xPKFPPy4qCCIyzpxMslRtdvRquR0LkXgaiOZLwCme0
         ygL4XRgroAvhCdbqav1OSAvTkKInv31G+uHB14reMXl/dkp8RvJaVzSGfIpDY+HFhG7B
         DjLYzaCEjaAqRka6+KU8QpwwsrAKEaOtG1KUmd5Hlur5k/nr6ZWK4vyTPVVB+E8EcGay
         h0J2AxvLUDAoY9fKeL1ULQguJuEhITDnaqMdeG0NAHsNrDBBDsZtaEzvOfo7KCIfN4MW
         dRr5hh5MYFdj7ilYpb8q6Wwz856K0ykX3hSOQBbGJdlOwf0qGyWYYn/BTSE8ZXOCsoZq
         c+/A==
X-Gm-Message-State: AOAM530yYGACEByS4FMpBOc9LSD/XEsKug6l8pINpgm6TD0cQGje7JcB
        uM/Odw1u6kpgzXsG/1qzoVjTRUlLRs8N8Q==
X-Google-Smtp-Source: ABdhPJyu4PQ7nYhZjSUoic3Bw3XFqppZixFF4MwDvGo9abhpW82yBj/IHkYNn58/1O8TFYQxSirlHg==
X-Received: by 2002:a17:90a:a88e:: with SMTP id h14mr414292pjq.59.1611854831456;
        Thu, 28 Jan 2021 09:27:11 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:11 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 06/13] HID: playstation: track devices in list.
Date:   Thu, 28 Jan 2021 09:26:50 -0800
Message-Id: <20210128172657.24516-7-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
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
index bcdeb2fd45d7..0c3956756bf0 100644
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


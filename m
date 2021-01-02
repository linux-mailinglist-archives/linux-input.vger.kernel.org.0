Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01922E8900
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbhABWc4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbhABWcz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:55 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD5BC061795
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:39 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id v3so12447223plz.13
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KCweL6Qig7RJ+65JoXarNe44zFqX3DH84uwrsxo8p88=;
        b=gQzKpQtRJd7vOemBwqgmYlGRzL5Bm+u785xzpea0ErGN8H0B15AqOWRsGpWOgLNyFo
         gL9P7lSCfOnWSoOwyCFswPWn1QP8+1fIHI9+L9dhFuTvZ9qmEY4eQvI5WFUy5iC2EXGX
         LjSdQBs16H5Yb3MTTrT+yjK9TGyTrcKDNe7IRIH55oVQppkTPScYgGgfdEJY2Td9yAnA
         wCu5VS9u6LjwIY4C5MBGpINNi0GcrZwqbBOlN6Z9YTVAwgQvRiRdSSJMwtOZsHrizfAv
         LY9j9saR6TG/FERTHSx3cLlfc0+aNK9T1ryY4+GF6npTvdL/kCyDrU9xfWfNCUufWrcb
         LcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KCweL6Qig7RJ+65JoXarNe44zFqX3DH84uwrsxo8p88=;
        b=BJtJf1z+dWHvUBlrpzEpAKUagJwO2ocg95NoHQ/bvl57+kGaC/5suPy2Cy5U2Cpti6
         Inp1YcsflI2jWpgYS+0PcL+cjHrBbC0K5qfZeCWbb/zzaG+5MZH755J4ryUpgk+7f7V+
         XowcPILRvl4TkHWMU5tsowPgCsQbliC4TvjHlXeRAOejF7r9V4gkeTFYqC6eqLGSjq3t
         NaOdIm/HyD2jFbg281x9eYOb6TewroF/iZr/Yx+tfam2N1S0ii95j1HeLonwPZJa2y7L
         JUD7mfSsltNREajf3aw8A7wzpCCQoSIWIBEw9D49CtJu051PR/dI6xXrFGVASZsJNq8p
         tUsA==
X-Gm-Message-State: AOAM533vhm/7fa/mm4Wjok3zmRq4EBXIdNnzxAcDdWjHz/xSex3fJBc+
        FX7rpeJAEFhk6pasLbyw/L5il9hzB0kZpQ==
X-Google-Smtp-Source: ABdhPJwlYyiYOUxtrMAoaHcG5wCQwTrGB8GzAZpxOnxVKIAbCqVw68u4RGbElOr/FOY/QcTWasDtQA==
X-Received: by 2002:a17:90a:e60d:: with SMTP id j13mr23743628pjy.52.1609626699403;
        Sat, 02 Jan 2021 14:31:39 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:39 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 06/13] HID: playstation: track devices in list.
Date:   Sat,  2 Jan 2021 14:31:02 -0800
Message-Id: <20210102223109.996781-7-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
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
index 80b0dcdbfe41..91f3ed005fce 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -16,10 +16,15 @@
 
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
 
@@ -155,6 +160,37 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
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
@@ -635,6 +671,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = ps_devices_list_add(ps_dev);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
 	ret = dualsense_get_calibration_data(ds);
 	if (ret < 0) {
 		hid_err(hdev, "Failed to get calibration data from DualSense\n");
@@ -667,6 +707,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return &ds->base;
 
 err:
+	ps_devices_list_remove(ps_dev);
 	return ERR_PTR(ret);
 }
 
@@ -724,6 +765,10 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
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


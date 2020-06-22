Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995F6204420
	for <lists+linux-input@lfdr.de>; Tue, 23 Jun 2020 00:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730932AbgFVW5w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jun 2020 18:57:52 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34787 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730785AbgFVW5w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jun 2020 18:57:52 -0400
Received: by mail-qt1-f195.google.com with SMTP id u17so14069034qtq.1;
        Mon, 22 Jun 2020 15:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3SWzKz0p9REo5AG+rEzf+EL/HmWPqcGnTPkGL4NRt6g=;
        b=JQyko3pjOlv3SuQWp9RvhznJAbof5ke23IuWONO0m5vAPoq1+OOlCViKGVIB6LbqAz
         Utr2miR8aVf2YEofsx1j2Yj50n+JaUhOphvtokBCZy1JbHiPPzezuJTS2mEUL1aM7LgZ
         Ko5GAKzlImoP6OEypZbTBrzWVOnleTjPzQ10RjF04JgUqtMIwq4f0x7OfzJHgl/MPef9
         5i6wz5Ri+HTRfpuaAs8GEMjN+5JJ/HE6t6yEXWGMpezxhU46QOFORgYMne0VFNMwaPZV
         3gxKze6xmwqibxJl3Has+de+JVAHgKbIVGO9AG+EVIzXpp79ogb2xvqZBXW4TOLeoHWm
         4Pyw==
X-Gm-Message-State: AOAM531J5jAV4LX/WslGzkvdINAWDm78DFmMu+kXdfjQl7dH/bk6tEf7
        x1RU/9v3QQpojP6VzjqGITU=
X-Google-Smtp-Source: ABdhPJz07pRLojVo6iaDZq1+9SP1RfJbAmaKQUNaLdRv2BM+LUav331mprF5fs4UjGNL3Ms1EGPvQg==
X-Received: by 2002:ac8:33d7:: with SMTP id d23mr4803425qtb.204.1592866668931;
        Mon, 22 Jun 2020 15:57:48 -0700 (PDT)
Received: from DEK-X230.gerbilsoft.gsft (pool-108-24-134-99.cmdnnj.fios.verizon.net. [108.24.134.99])
        by smtp.googlemail.com with ESMTPSA id z4sm4532273qkb.66.2020.06.22.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:57:48 -0700 (PDT)
From:   David Korth <gerbilsoft@gerbilsoft.com>
To:     David Herrmann <dh.herrmann@googlemail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Korth <gerbilsoft@gerbilsoft.com>
Subject: [PATCH 1/2] HID: wiimote: Initialize the controller LEDs with a device ID value
Date:   Mon, 22 Jun 2020 18:57:28 -0400
Message-Id: <20200622225728.330-1-gerbilsoft@gerbilsoft.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Based on a similar commit for Sony Sixaxis and DualShock 4 controllers:
HID: sony: Initialize the controller LEDs with a device ID value

Wii remotes have the same player LED layout as Sixaxis controllers,
so the wiimote setup is based on the Sixaxis code.

Signed-off-by: David Korth <gerbilsoft@gerbilsoft.com>
---
 drivers/hid/hid-wiimote-core.c    | 57 ++++++++++++++++++++++++++++++-
 drivers/hid/hid-wiimote-modules.c |  7 ----
 drivers/hid/hid-wiimote.h         |  1 +
 3 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 92874dbe4d4a..9662c2ce5e99 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -14,9 +14,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
+#include <linux/idr.h>
 #include "hid-ids.h"
 #include "hid-wiimote.h"
 
+static DEFINE_IDA(wiimote_device_id_allocator);
+
 /* output queue handling */
 
 static int wiimote_hid_send(struct hid_device *hdev, __u8 *buffer,
@@ -694,6 +697,10 @@ static void wiimote_modules_unload(struct wiimote_data *wdata)
 	wdata->state.devtype = WIIMOTE_DEV_UNKNOWN;
 	spin_unlock_irqrestore(&wdata->state.lock, flags);
 
+	if (wdata->device_id >= 0)
+		ida_simple_remove(&wiimote_device_id_allocator,
+					wdata->device_id);
+
 	/* find end of list */
 	for (iter = mods; *iter != WIIMOD_NULL; ++iter)
 		/* empty */ ;
@@ -802,6 +809,20 @@ static const char *wiimote_devtype_names[WIIMOTE_DEV_NUM] = {
 	[WIIMOTE_DEV_PRO_CONTROLLER] = "Nintendo Wii U Pro Controller",
 };
 
+static __u8 wiimote_set_leds_from_id(int id)
+{
+	static const __u8 wiimote_leds[10] = {
+		0x01, 0x02, 0x04, 0x08,
+		0x09, 0x0A, 0x0C, 0x0D,
+		0x0E, 0x0F
+	};
+
+	if (id < 0)
+		return wiimote_leds[0];
+
+	return wiimote_leds[id % 10];
+}
+
 /* Try to guess the device type based on all collected information. We
  * first try to detect by static extension types, then VID/PID and the
  * device name. If we cannot detect the device, we use
@@ -810,8 +831,10 @@ static void wiimote_init_set_type(struct wiimote_data *wdata,
 				  __u8 exttype)
 {
 	__u8 devtype = WIIMOTE_DEV_GENERIC;
+	__u8 leds;
 	__u16 vendor, product;
 	const char *name;
+	int device_id;
 
 	vendor = wdata->hdev->vendor;
 	product = wdata->hdev->product;
@@ -858,6 +881,24 @@ static void wiimote_init_set_type(struct wiimote_data *wdata,
 			 wiimote_devtype_names[devtype]);
 
 	wiimote_modules_load(wdata, devtype);
+
+	/* set player number to stop initial LED-blinking */
+	device_id = ida_simple_get(&wiimote_device_id_allocator, 0, 0,
+				GFP_KERNEL);
+	if (device_id < 0) {
+		/* Unable to get a device ID. */
+		/* Set LED1 anyway to stop the blinking. */
+		leds = WIIPROTO_FLAG_LED1;
+		wdata->device_id = -1;
+	} else {
+		/* Device ID obtained. */
+		leds = wiimote_set_leds_from_id(device_id);
+		wdata->device_id = device_id;
+	}
+
+	spin_lock_irq(&wdata->state.lock);
+	wiiproto_req_leds(wdata, leds);
+	spin_unlock_irq(&wdata->state.lock);
 }
 
 static void wiimote_init_detect(struct wiimote_data *wdata)
@@ -1750,6 +1791,8 @@ static struct wiimote_data *wiimote_create(struct hid_device *hdev)
 	wdata->state.drm = WIIPROTO_REQ_DRM_K;
 	wdata->state.cmd_battery = 0xff;
 
+	wdata->device_id = -1;
+
 	INIT_WORK(&wdata->init_worker, wiimote_init_worker);
 	timer_setup(&wdata->timer, wiimote_init_timeout, 0);
 
@@ -1879,7 +1922,19 @@ static struct hid_driver wiimote_hid_driver = {
 	.remove = wiimote_hid_remove,
 	.raw_event = wiimote_hid_event,
 };
-module_hid_driver(wiimote_hid_driver);
+
+static int __init wiimote_init(void)
+{
+	return hid_register_driver(&wiimote_hid_driver);
+}
+
+static void __exit wiimote_exit(void)
+{
+	ida_destroy(&wiimote_device_id_allocator);
+	hid_unregister_driver(&wiimote_hid_driver);
+}
+module_init(wiimote_init);
+module_exit(wiimote_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Herrmann <dh.herrmann@gmail.com>");
diff --git a/drivers/hid/hid-wiimote-modules.c b/drivers/hid/hid-wiimote-modules.c
index 2c3925357857..0cdd6c219b5d 100644
--- a/drivers/hid/hid-wiimote-modules.c
+++ b/drivers/hid/hid-wiimote-modules.c
@@ -362,13 +362,6 @@ static int wiimod_led_probe(const struct wiimod_ops *ops,
 	if (ret)
 		goto err_free;
 
-	/* enable LED1 to stop initial LED-blinking */
-	if (ops->arg == 0) {
-		spin_lock_irqsave(&wdata->state.lock, flags);
-		wiiproto_req_leds(wdata, WIIPROTO_FLAG_LED1);
-		spin_unlock_irqrestore(&wdata->state.lock, flags);
-	}
-
 	return 0;
 
 err_free:
diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
index b2a26a0a8f12..800849427947 100644
--- a/drivers/hid/hid-wiimote.h
+++ b/drivers/hid/hid-wiimote.h
@@ -160,6 +160,7 @@ struct wiimote_data {
 	struct wiimote_queue queue;
 	struct wiimote_state state;
 	struct work_struct init_worker;
+	int device_id;
 };
 
 /* wiimote modules */
-- 
2.27.0


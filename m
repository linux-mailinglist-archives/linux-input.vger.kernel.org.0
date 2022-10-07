Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7DB5F7D68
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiJGSag (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiJGSa2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:28 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC671A3F7B
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:25 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id bv10so4903494wrb.4
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eX6NDYV/kFbZUS0kGHYJJXlnLzcSdyJKSxZSY1+oaU=;
        b=CL5yorzAuk3/FEJQ3DOJx5oryef81XS3hoWOkzXu6dbmbiltb0YfMQiKj6QDXCihzx
         cdqofGG0enePb2IK06Taeaz5DLyHUjoEEI+uwQjICxBkXS+NPNRr7u/aPgjd4yL+3VkB
         X1iAVuRTGVN4NwYEXnVzaZQFBl4UbiZ0cV9aKxfB1zQKyDtM7xwaGGBOlQsBBkofr0nk
         8XBg8EwNniUHRtNzBvweoVpiaSCgbrjXPhptGBeXY1cZs1pzcUvvbgO0LKX0i9Kh+bqz
         syiDdxzrS+s8zE5Ai42M2LArD8qlxifZIaaNJkx6iHTNcg2tWXlCYcXL/qvOYiThX++N
         wqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eX6NDYV/kFbZUS0kGHYJJXlnLzcSdyJKSxZSY1+oaU=;
        b=NzkOVd2fNwN9VZAABbl1MeWZVXl/qQNHA9zLWW4d5KHdmPF4FLzziFJtn8GY1OLxgv
         WIzF6PzKOFLHO6GJJipmo8Vzu/ib93PR/wUg91koUTKo93u3rTtqE1zmamlSqavTP+Xr
         M4jcxLCO/6EtqCZBH74lhLiUOJ2kqnX7dfbB0CnsX/2/PsyYwEjdt3rUlNCdJwuFJLS6
         HQUVugSBFBMPG8DEJb35h66tFulOeGV6aIW5BedDg5rDUyUhGWo6kmCRFTL9/0+VChFU
         mg5MQgRzudyACucNYkV8LTxj+Xe3BnthvX/8ltMASWHWjrEZ9bloqvRpC38yICk6QPMA
         amMA==
X-Gm-Message-State: ACrzQf3TSya9va0w5kTgsmKIUNFl/tpwYRG/l1n/EOTYOVV+bJiy7TqB
        7zZpCG6PWNBBk9TrO1uNG5J7Z8RQXyE+7DWF
X-Google-Smtp-Source: AMsMyM5OzizpBWT68dAUHglD4LJyxbmCkc3qQEyu9VaQf1AuuqtdkNqSKQru4NwA1pzfj2zWRDC0lQ==
X-Received: by 2002:a5d:47a6:0:b0:22e:80a3:ac95 with SMTP id 6-20020a5d47a6000000b0022e80a3ac95mr3262678wrb.507.1665167424277;
        Fri, 07 Oct 2022 11:30:24 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:23 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 17/17] HID: multitouch: Add lid handler for touchpad on Redrix chromebook
Date:   Fri,  7 Oct 2022 18:29:45 +0000
Message-Id: <20221007182945.1654046-18-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If user closes the lid the touchscreen gets close to the touchpad surface,
which causes interference and makes the touchpad enter noise mode.
Right after opening the lid the cursor is unresponsive because of the mode
mentioned.
To fix this issue we switch the surface off and on so that Elan's FW
performs recalibration once the lid has been opened.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-multitouch.c | 220 ++++++++++++++++++++++++++++++++++-
 1 file changed, 219 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index f492becbab374..92541ed153557 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -32,11 +32,14 @@
  */
 
 #include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/input/mt.h>
 #include <linux/jiffies.h>
+#include <linux/sched.h>
 #include <linux/string.h>
 #include <linux/timer.h>
 
@@ -159,6 +162,7 @@ struct mt_report_data {
 };
 
 struct mt_device {
+	struct list_head list;	/* for list of devices needing input handler */
 	struct mt_class mtclass;	/* our mt device class */
 	struct timer_list release_timer;	/* to release sticky fingers */
 	struct hid_haptic_device *haptic;	/* haptic related configuration */
@@ -173,8 +177,15 @@ struct mt_device {
 
 	struct list_head applications;
 	struct list_head reports;
+
+	struct work_struct lid_work;
+	struct mutex mode_mutex;
+	bool lid_switch;
 };
 
+static struct workqueue_struct *mt_mode_wq;
+static LIST_HEAD(mt_devices_with_lid_handler);
+
 static void mt_post_parse_default_settings(struct mt_device *td,
 					   struct mt_application *app);
 static void mt_post_parse(struct mt_device *td, struct mt_application *app);
@@ -404,6 +415,91 @@ static const struct mt_class mt_classes[] = {
 	{ }
 };
 
+static void mt_input_lid_event(struct input_handle *handle, unsigned int type,
+			     unsigned int code, int value)
+{
+	struct mt_device *td, *n;
+
+	if (type == EV_SW && code == SW_LID && !value) {
+		list_for_each_entry_safe(td, n, &mt_devices_with_lid_handler, list)
+			queue_work(mt_mode_wq, &td->lid_work);
+	}
+}
+
+struct mt_input_lid {
+	struct input_handle handle;
+};
+
+static int mt_input_lid_connect(struct input_handler *handler,
+				struct input_dev *dev,
+				const struct input_device_id *id)
+{
+	struct mt_input_lid *lid;
+	char *name;
+	int error;
+
+	lid = kzalloc(sizeof(*lid), GFP_KERNEL);
+	if (!lid)
+		return -ENOMEM;
+
+	name = kasprintf(GFP_KERNEL, "hid-mt-lid-%s", dev_name(&dev->dev));
+	if (!name) {
+		error = -ENOMEM;
+		goto err_free_lid;
+	}
+
+	lid->handle.dev = dev;
+	lid->handle.handler = handler;
+	lid->handle.name = name;
+	lid->handle.private = lid;
+
+	error = input_register_handle(&lid->handle);
+	if (error)
+		goto err_free_name;
+
+	error = input_open_device(&lid->handle);
+	if (error)
+		goto err_unregister_handle;
+
+	return 0;
+
+err_unregister_handle:
+	input_unregister_handle(&lid->handle);
+err_free_name:
+	kfree(name);
+err_free_lid:
+	kfree(lid);
+	return error;
+}
+
+static void mt_input_lid_disconnect(struct input_handle *handle)
+{
+	struct mt_input_lid *lid = handle->private;
+
+	input_close_device(handle);
+	input_unregister_handle(handle);
+
+	kfree(handle->name);
+	kfree(lid);
+}
+
+static const struct input_device_id mt_input_lid_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT | INPUT_DEVICE_ID_MATCH_SWBIT,
+		.evbit = { BIT_MASK(EV_SW) },
+		.swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
+	},
+	{ },
+};
+
+static struct input_handler mt_input_lid_handler = {
+	.event =	mt_input_lid_event,
+	.connect =	mt_input_lid_connect,
+	.disconnect =	mt_input_lid_disconnect,
+	.name =		"hid-mt-lid",
+	.id_table =	mt_input_lid_ids,
+};
+
 static ssize_t mt_show_quirks(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
@@ -558,6 +654,83 @@ static struct mt_usages *mt_allocate_usage(struct hid_device *hdev,
 	return usage;
 }
 
+static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
+			 bool surface_switch, bool button_switch);
+
+static void lid_work_handler(struct work_struct *work)
+{
+
+	struct mt_device *td = container_of(work, struct mt_device,
+					    lid_work);
+	struct hid_device *hdev = td->hdev;
+
+	mutex_lock(&td->mode_mutex);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, false, false);
+	/* Elan's touchpad VID 323B needs this delay to handle both switch
+	 * surface off and switch surface on and trigger recalibration
+	 * properly.
+	 */
+	msleep(50);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mutex_unlock(&td->mode_mutex);
+}
+
+static const struct dmi_system_id mt_lid_handler_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Redrix"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Redrix4ES"),
+		},
+	},
+	{}
+};
+
+static int mt_create_lid_handler(void)
+{
+	int error = 0;
+
+	if (!dmi_check_system(mt_lid_handler_dmi_table))
+		return 0;
+
+	mt_mode_wq = alloc_ordered_workqueue("hid-mt-lid", WQ_FREEZABLE);
+	if (mt_mode_wq == NULL)
+		return -ENOMEM;
+
+	error = input_register_handler(&mt_input_lid_handler);
+	if (error)
+		goto remove_wq;
+
+	return 0;
+
+remove_wq:
+	destroy_workqueue(mt_mode_wq);
+	mt_mode_wq = NULL;
+	return error;
+}
+
+static void mt_configure_lid_handler(struct mt_device *td)
+{
+	struct hid_device *hdev = td->hdev;
+
+	if (hdev->bus != BUS_I2C)
+		return;
+
+	td->lid_switch = true;
+	list_add_tail(&td->list, &mt_devices_with_lid_handler);
+}
+
+static void mt_destroy_lid_handler(void)
+{
+	input_unregister_handler(&mt_input_lid_handler);
+	destroy_workqueue(mt_mode_wq);
+}
+
 static struct mt_application *mt_allocate_application(struct mt_device *td,
 						      struct hid_report *report)
 {
@@ -581,6 +754,8 @@ static struct mt_application *mt_allocate_application(struct mt_device *td,
 	if (application == HID_DG_TOUCHPAD) {
 		mt_application->mt_flags |= INPUT_MT_POINTER;
 		td->inputmode_value = MT_INPUTMODE_TOUCHPAD;
+		if (mt_mode_wq)
+			mt_configure_lid_handler(td);
 	}
 
 	mt_application->scantime = DEFAULT_ZERO;
@@ -1778,6 +1953,10 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	INIT_LIST_HEAD(&td->applications);
 	INIT_LIST_HEAD(&td->reports);
 
+	INIT_LIST_HEAD(&td->list);
+	INIT_WORK(&td->lid_work, lid_work_handler);
+	mutex_init(&td->mode_mutex);
+
 	if (id->vendor == HID_ANY_ID && id->product == HID_ANY_ID)
 		td->serial_maybe = true;
 
@@ -1841,12 +2020,18 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct hid_haptic_device *haptic = td->haptic;
 
+	/* Wait for switch on completion */
+	if (td->lid_switch)
+		flush_workqueue(mt_mode_wq);
+
+	mutex_lock(&td->mode_mutex);
 	/* High latency is desirable for power savings during S3/S0ix */
 	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
 	    !hid_hw_may_wakeup(hdev))
 		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
 	else
 		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
+	mutex_unlock(&td->mode_mutex);
 
 	if (td->is_haptic_touchpad)
 		hid_haptic_suspend(hdev, haptic);
@@ -1860,7 +2045,10 @@ static int mt_reset_resume(struct hid_device *hdev)
 	struct hid_haptic_device *haptic = td->haptic;
 
 	mt_release_contacts(hdev);
+
+	mutex_lock(&td->mode_mutex);
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mutex_unlock(&td->mode_mutex);
 
 	if (td->is_haptic_touchpad)
 		hid_haptic_resume(hdev, haptic);
@@ -1879,7 +2067,9 @@ static int mt_resume(struct hid_device *hdev)
 
 	hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
 
+	mutex_lock(&td->mode_mutex);
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mutex_unlock(&td->mode_mutex);
 
 	if (td->is_haptic_touchpad)
 		hid_haptic_resume(hdev, haptic);
@@ -1897,7 +2087,9 @@ static int mt_reset(struct hid_device *hdev)
 		return -ENODEV;
 
 	mt_release_contacts(hdev);
+	mutex_lock(&td->mode_mutex);
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mutex_unlock(&td->mode_mutex);
 
 	if (td->is_haptic_touchpad)
 		hid_haptic_reset(hdev, haptic);
@@ -1913,6 +2105,8 @@ static void mt_remove(struct hid_device *hdev)
 
 	sysfs_remove_group(&hdev->dev.kobj, &mt_attribute_group);
 	hid_hw_stop(hdev);
+
+	list_del(&td->list);
 }
 
 /*
@@ -2325,4 +2519,28 @@ static struct hid_driver mt_driver = {
 #endif
 	.reset = mt_reset,
 };
-module_hid_driver(mt_driver);
+
+static int __init mt_init(void)
+{
+	int ret;
+
+	ret = hid_register_driver(&mt_driver);
+	if (ret)
+		return ret;
+
+	ret = mt_create_lid_handler();
+	if (ret)
+		hid_unregister_driver(&mt_driver);
+
+	return ret;
+}
+module_init(mt_init);
+
+static void __exit mt_exit(void)
+{
+	if (mt_mode_wq)
+		mt_destroy_lid_handler();
+
+	hid_unregister_driver(&mt_driver);
+}
+module_exit(mt_exit);
-- 
2.38.0.rc1.362.ged0d419d3c-goog


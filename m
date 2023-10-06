Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080257BB2E6
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 10:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjJFITx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 04:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjJFITw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 04:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBAEE4
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696580348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=08nYJkbaV3Kkvb8bdQaO3igrrqm3tGjSO1L7fdRIweM=;
        b=WlYJmuIX0G47uwjb/DxFGzqO9YzXqC+v8lm8OQSNRXhw0XFlitL/utRKmIuzZjVmpHRkKd
        AhYfLgc56dO2s42zJ0vVKh+xNyFJxJ7IF5LLhzLW/2RKGXZ7rtgGLaHEwe45LZl+SRRjSf
        JKYUUXqvVVjwDi3Y8bOG6A+l1sCitxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-ekj7CWkHOoKgL2EnC50xrQ-1; Fri, 06 Oct 2023 04:19:06 -0400
X-MC-Unique: ekj7CWkHOoKgL2EnC50xrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CF1185A5A8;
        Fri,  6 Oct 2023 08:19:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6CBF8140E950;
        Fri,  6 Oct 2023 08:19:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH 1/2] HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe() restarts IO
Date:   Fri,  6 Oct 2023 10:18:57 +0200
Message-ID: <20231006081858.17677-2-hdegoede@redhat.com>
In-Reply-To: <20231006081858.17677-1-hdegoede@redhat.com>
References: <20231006081858.17677-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hidpp_probe() restarts IO after setting things up, if we get a connect
event just before hidpp_probe() stops all IO then hidpp_connect_event()
will see IO errors causing it to fail to setup the connected device.

Add a new io_mutex which hidpp_probe() locks while restarting IO and
which is also taken by hidpp_connect_event() to avoid these 2 things
from racing.

Hopefully this will help with the occasional connect errors leading to
e.g. missing battery monitoring.

Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 35 ++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index a209d51bd247..33f9cd98485a 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -181,6 +181,7 @@ struct hidpp_scroll_counter {
 struct hidpp_device {
 	struct hid_device *hid_dev;
 	struct input_dev *input;
+	struct mutex io_mutex;
 	struct mutex send_mutex;
 	void *send_receive_buf;
 	char *name;		/* will never be NULL and should not be freed */
@@ -4207,36 +4208,39 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 		return;
 	}
 
+	/* Avoid probe() restarting IO */
+	mutex_lock(&hidpp->io_mutex);
+
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
 		ret = wtp_connect(hdev, connected);
 		if (ret)
-			return;
+			goto out_unlock;
 	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560) {
 		ret = m560_send_config_command(hdev, connected);
 		if (ret)
-			return;
+			goto out_unlock;
 	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_K400) {
 		ret = k400_connect(hdev, connected);
 		if (ret)
-			return;
+			goto out_unlock;
 	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS) {
 		ret = hidpp10_wheel_connect(hidpp);
 		if (ret)
-			return;
+			goto out_unlock;
 	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS) {
 		ret = hidpp10_extra_mouse_buttons_connect(hidpp);
 		if (ret)
-			return;
+			goto out_unlock;
 	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS) {
 		ret = hidpp10_consumer_keys_connect(hidpp);
 		if (ret)
-			return;
+			goto out_unlock;
 	}
 
 	/* the device is already connected, we can ask for its name and
@@ -4245,7 +4249,7 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 		ret = hidpp_root_get_protocol_version(hidpp);
 		if (ret) {
 			hid_err(hdev, "Can not get the protocol version.\n");
-			return;
+			goto out_unlock;
 		}
 	}
 
@@ -4256,7 +4260,7 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 						   "%s", name);
 			kfree(name);
 			if (!devm_name)
-				return;
+				goto out_unlock;
 
 			hidpp->name = devm_name;
 		}
@@ -4291,12 +4295,12 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 
 	if (!(hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT) || hidpp->delayed_input)
 		/* if the input nodes are already created, we can stop now */
-		return;
+		goto out_unlock;
 
 	input = hidpp_allocate_input(hdev);
 	if (!input) {
 		hid_err(hdev, "cannot allocate new input device: %d\n", ret);
-		return;
+		goto out_unlock;
 	}
 
 	hidpp_populate_input(hidpp, input);
@@ -4304,10 +4308,12 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 	ret = input_register_device(input);
 	if (ret) {
 		input_free_device(input);
-		return;
+		goto out_unlock;
 	}
 
 	hidpp->delayed_input = input;
+out_unlock:
+	mutex_unlock(&hidpp->io_mutex);
 }
 
 static DEVICE_ATTR(builtin_power_supply, 0000, NULL, NULL);
@@ -4450,6 +4456,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		will_restart = true;
 
 	INIT_WORK(&hidpp->work, delayed_work_cb);
+	mutex_init(&hidpp->io_mutex);
 	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
 
@@ -4519,6 +4526,9 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	flush_work(&hidpp->work);
 
 	if (will_restart) {
+		/* Avoid hidpp_connect_event() running while restarting */
+		mutex_lock(&hidpp->io_mutex);
+
 		/* Reset the HID node state */
 		hid_device_io_stop(hdev);
 		hid_hw_close(hdev);
@@ -4529,6 +4539,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 		/* Now export the actual inputs and hidraw nodes to the world */
 		ret = hid_hw_start(hdev, connect_mask);
+		mutex_unlock(&hidpp->io_mutex);
 		if (ret) {
 			hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
 			goto hid_hw_start_fail;
@@ -4553,6 +4564,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
 	cancel_work_sync(&hidpp->work);
 	mutex_destroy(&hidpp->send_mutex);
+	mutex_destroy(&hidpp->io_mutex);
 	return ret;
 }
 
@@ -4568,6 +4580,7 @@ static void hidpp_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 	cancel_work_sync(&hidpp->work);
 	mutex_destroy(&hidpp->send_mutex);
+	mutex_destroy(&hidpp->io_mutex);
 }
 
 #define LDJ_DEVICE(product) \
-- 
2.41.0


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D791CDB896
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440211AbfJQUm2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:28 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34047 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfJQUm1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id b128so2392237pfa.1;
        Thu, 17 Oct 2019 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IR9wXPx+VgMHzXyTssPlOjBdtYa1XMszXx3amY1GdBs=;
        b=aG9qiAf2i+m9OGvs7MBGnS64P7Nnat81BEJrK94hz3F6AE4OHX7n9Zqf5pHUSQMiN8
         hpu4QK8j5+lim/xX1ydTdUD3pd9TE0+YmSiF5/nP3laJc1hLQfI76tELt2JPmz3qlg+M
         vEYWNfbV2ONJIzdzGz+duZkzLgl+HRMsQzIKrTL76FQ+lqs/VxzyzF4yoHrmwMSUBEaA
         HZB8RdB920kDXdjrVheVqVNgkmSGiVQHxJCsQ85G9nkNP26fqUTT5+cnB1YtRezoo3qp
         c6aWBEB0xVDRMH7VmZtPZTGJqoYyVlT1XnUAqwH8YyqvJiZxYlzA7AnbYdk+mfZabavQ
         oaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IR9wXPx+VgMHzXyTssPlOjBdtYa1XMszXx3amY1GdBs=;
        b=MeWxqjbRc095a0JKEvZ8s5OEGfOCeTfjP87Q+AK7IJpd2ul8pvmFl0uqyDOwDlZYmj
         xBF8GlfcK0gFEW4J9RT22LwQpncws4YzuWvU2hT4p8emDG3gds1cfmaq2JgnkWL6bvt8
         xmniTn9gl8w+/AD7gwnuoeu0oy4wvuNj6YPIW+k+NPMtyQ1wOKmBXwUKcqk1zXMryKad
         dWgAdVjk1it4t1MNedEyslHg2C7LOqgcI8Kqo7iBIOgD/3AHqNwIzUfzM82+2VVHs//x
         NqxCJ3hVzA7WhADqzC9obxDlyGVoFI+QYuKN1slGybS5EdWgfUNdp13Bo2jFfmqjbTLj
         Smlg==
X-Gm-Message-State: APjAAAXPtcjDkRAa4A3+mV1yPfY1p/Y7ILD00KNOHJNXtdWg+8/Y5CBc
        UvVBz7f8klI2OFZcALsZdF0xQkbd
X-Google-Smtp-Source: APXvYqyGY/xepLpzs7oKpDHQvq+XzriiJXpToXeF8sqZS77YlSA+n97vplCXT19O3CjX6GcfLUJkSA==
X-Received: by 2002:a63:4d8:: with SMTP id 207mr6448499pge.168.1571344944516;
        Thu, 17 Oct 2019 13:42:24 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:23 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Allison Randal <allison@lohutok.net>,
        Anders Roxell <anders.roxell@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jeff LaBundy <jeff@labundy.com>,
        Martin Kepplinger <martink@posteo.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/22] Input: sur40 - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:41:56 -0700
Message-Id: <20191017204217.106453-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We have added polled mode to the normal input devices with the intent of
retiring input_polled_dev. This converts sur40 driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/Kconfig |  1 -
 drivers/input/touchscreen/sur40.c | 92 ++++++++++++++++++-------------
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 00e7a9f218bc..df9cb92166c3 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1209,7 +1209,6 @@ config TOUCHSCREEN_SUR40
 	tristate "Samsung SUR40 (Surface 2.0/PixelSense) touchscreen"
 	depends on USB && MEDIA_USB_SUPPORT && HAS_DMA
 	depends on VIDEO_V4L2
-	select INPUT_POLLDEV
 	select VIDEOBUF2_DMA_SG
 	help
 	  Say Y here if you want support for the Samsung SUR40 touchscreen
diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 00cb1ba2d364..04638900fe0e 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -27,7 +27,7 @@
 #include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/printk.h>
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/usb/input.h>
 #include <linux/videodev2.h>
@@ -206,7 +206,7 @@ struct sur40_state {
 
 	struct usb_device *usbdev;
 	struct device *dev;
-	struct input_polled_dev *input;
+	struct input_dev *input;
 
 	struct v4l2_device v4l2;
 	struct video_device vdev;
@@ -370,6 +370,10 @@ static int sur40_init(struct sur40_state *dev)
 		goto error;
 
 	result = sur40_command(dev, SUR40_GET_VERSION, 0x03, buffer, 12);
+	if (result < 0)
+		goto error;
+
+	result = 0;
 
 	/*
 	 * Discard the result buffer - no known data inside except
@@ -381,22 +385,22 @@ static int sur40_init(struct sur40_state *dev)
 }
 
 /*
- * Callback routines from input_polled_dev
+ * Callback routines from input_dev
  */
 
 /* Enable the device, polling will now start. */
-static void sur40_open(struct input_polled_dev *polldev)
+static int sur40_open(struct input_dev *input)
 {
-	struct sur40_state *sur40 = polldev->private;
+	struct sur40_state *sur40 = input_get_drvdata(input);
 
 	dev_dbg(sur40->dev, "open\n");
-	sur40_init(sur40);
+	return sur40_init(sur40);
 }
 
 /* Disable device, polling has stopped. */
-static void sur40_close(struct input_polled_dev *polldev)
+static void sur40_close(struct input_dev *input)
 {
-	struct sur40_state *sur40 = polldev->private;
+	struct sur40_state *sur40 = input_get_drvdata(input);
 
 	dev_dbg(sur40->dev, "close\n");
 	/*
@@ -448,10 +452,9 @@ static void sur40_report_blob(struct sur40_blob *blob, struct input_dev *input)
 }
 
 /* core function: poll for new input data */
-static void sur40_poll(struct input_polled_dev *polldev)
+static void sur40_poll(struct input_dev *input)
 {
-	struct sur40_state *sur40 = polldev->private;
-	struct input_dev *input = polldev->input;
+	struct sur40_state *sur40 = input_get_drvdata(input);
 	int result, bulk_read, need_blobs, packet_blobs, i;
 	u32 uninitialized_var(packet_id);
 
@@ -613,10 +616,9 @@ static void sur40_process_video(struct sur40_state *sur40)
 }
 
 /* Initialize input device parameters. */
-static void sur40_input_setup(struct input_dev *input_dev)
+static int sur40_input_setup_events(struct input_dev *input_dev)
 {
-	__set_bit(EV_KEY, input_dev->evbit);
-	__set_bit(EV_ABS, input_dev->evbit);
+	int error;
 
 	input_set_abs_params(input_dev, ABS_MT_POSITION_X,
 			     0, SENSOR_RES_X, 0, 0);
@@ -637,8 +639,14 @@ static void sur40_input_setup(struct input_dev *input_dev)
 
 	input_set_abs_params(input_dev, ABS_MT_ORIENTATION, 0, 1, 0, 0);
 
-	input_mt_init_slots(input_dev, MAX_CONTACTS,
-			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	error = input_mt_init_slots(input_dev, MAX_CONTACTS,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(input_dev->dev.parent, "failed to set up slots\n");
+		return error;
+	}
+
+	return 0;
 }
 
 /* Check candidate USB interface. */
@@ -649,7 +657,7 @@ static int sur40_probe(struct usb_interface *interface,
 	struct sur40_state *sur40;
 	struct usb_host_interface *iface_desc;
 	struct usb_endpoint_descriptor *endpoint;
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	int error;
 
 	/* Check if we really have the right interface. */
@@ -670,8 +678,8 @@ static int sur40_probe(struct usb_interface *interface,
 	if (!sur40)
 		return -ENOMEM;
 
-	poll_dev = input_allocate_polled_device();
-	if (!poll_dev) {
+	input = input_allocate_device();
+	if (!input) {
 		error = -ENOMEM;
 		goto err_free_dev;
 	}
@@ -681,26 +689,33 @@ static int sur40_probe(struct usb_interface *interface,
 	spin_lock_init(&sur40->qlock);
 	mutex_init(&sur40->lock);
 
-	/* Set up polled input device control structure */
-	poll_dev->private = sur40;
-	poll_dev->poll_interval = POLL_INTERVAL;
-	poll_dev->open = sur40_open;
-	poll_dev->poll = sur40_poll;
-	poll_dev->close = sur40_close;
-
 	/* Set up regular input device structure */
-	sur40_input_setup(poll_dev->input);
-
-	poll_dev->input->name = DRIVER_LONG;
-	usb_to_input_id(usbdev, &poll_dev->input->id);
+	input->name = DRIVER_LONG;
+	usb_to_input_id(usbdev, &input->id);
 	usb_make_path(usbdev, sur40->phys, sizeof(sur40->phys));
 	strlcat(sur40->phys, "/input0", sizeof(sur40->phys));
-	poll_dev->input->phys = sur40->phys;
-	poll_dev->input->dev.parent = &interface->dev;
+	input->phys = sur40->phys;
+	input->dev.parent = &interface->dev;
+
+	input->open = sur40_open;
+	input->close = sur40_close;
+
+	error = sur40_input_setup_events(input);
+	if (error)
+		goto err_free_input;
+
+	input_set_drvdata(input, sur40);
+	error = input_setup_polling(input, sur40_poll);
+	if (error) {
+		dev_err(&interface->dev, "failed to set up polling");
+		goto err_free_input;
+	}
+
+	input_set_poll_interval(input, POLL_INTERVAL);
 
 	sur40->usbdev = usbdev;
 	sur40->dev = &interface->dev;
-	sur40->input = poll_dev;
+	sur40->input = input;
 
 	/* use the bulk-in endpoint tested above */
 	sur40->bulk_in_size = usb_endpoint_maxp(endpoint);
@@ -709,11 +724,11 @@ static int sur40_probe(struct usb_interface *interface,
 	if (!sur40->bulk_in_buffer) {
 		dev_err(&interface->dev, "Unable to allocate input buffer.");
 		error = -ENOMEM;
-		goto err_free_polldev;
+		goto err_free_input;
 	}
 
 	/* register the polled input device */
-	error = input_register_polled_device(poll_dev);
+	error = input_register_device(input);
 	if (error) {
 		dev_err(&interface->dev,
 			"Unable to register polled input device.");
@@ -796,8 +811,8 @@ static int sur40_probe(struct usb_interface *interface,
 	v4l2_device_unregister(&sur40->v4l2);
 err_free_buffer:
 	kfree(sur40->bulk_in_buffer);
-err_free_polldev:
-	input_free_polled_device(sur40->input);
+err_free_input:
+	input_free_device(input);
 err_free_dev:
 	kfree(sur40);
 
@@ -813,8 +828,7 @@ static void sur40_disconnect(struct usb_interface *interface)
 	video_unregister_device(&sur40->vdev);
 	v4l2_device_unregister(&sur40->v4l2);
 
-	input_unregister_polled_device(sur40->input);
-	input_free_polled_device(sur40->input);
+	input_unregister_device(sur40->input);
 	kfree(sur40->bulk_in_buffer);
 	kfree(sur40);
 
-- 
2.23.0.866.gb869b98d4c-goog


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04D26D4E0
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 21:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391373AbfGRTlp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jul 2019 15:41:45 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:34897 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfGRTll (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 15:41:41 -0400
Received: by mail-vs1-f73.google.com with SMTP id 66so1907846vsp.2
        for <linux-input@vger.kernel.org>; Thu, 18 Jul 2019 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=NyDDuPcwfKxqjN9VK9vgGqLXXuUUhCPRqo1nWMqUF1g=;
        b=jcY2CBffEmchmiRjAf/pm1/FeJLqCiDq5um50nqrO2GRUmQc9vmAKY3qqmeZpeEcb4
         OUxlwAIspNwOOAjJTw2LfUYNYdKdTy9x+eSVRFDtupponDaa+SDb8aeryX2t3RnmPIOm
         6QAcB4qcixDj/Gj23xGwFKr/fJhCjkTKA25A3AH4dXlJc8uNpEZsH//7xvHA4onufzje
         1VblSW8vhZWaTrGW4CgyI54pHVMEjwIavLuyykWQBfP3lf9RFEm+5VvIcpxCn2WOyNxF
         f18BT4dSJsq6o4IMShzZ1Hr+7jNkyFM+0ix3z2hQqUMpdENXlUH6kdEfcssvjSPC7QxE
         ZBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=NyDDuPcwfKxqjN9VK9vgGqLXXuUUhCPRqo1nWMqUF1g=;
        b=NkCDu5uzrdcANh30V9KMC+otqQ0vvaJ8qvyxe227g+YqJmdhA/1yppSDPBITyrh9rd
         d7eNkBl7+4fNc7gGcee5VIXf+nZI4O68AOKEqbjbT3NJ/NjyKyjnVbPJkAEWekKFxIQe
         WZcIpR4HM/A9kZo5/mgWy8LuOGjUJy00s7St8kBkI/M19FJA8q1RXlnkquXm13r9bbbw
         vKOyTq/GZLpHISw9SkZIjOC4FXq6FVywBER38RnA2zVOSfJxVvyzKH7MNM0CIX6g703P
         hNo4UZ2NRF6gCZHfNdvaHuZn9kBe+cLNPkn+Ool7RqT/v1IPOjapreIGobXIfldYab+u
         AdmQ==
X-Gm-Message-State: APjAAAXLjdZGQ+EL0joNaIKbzXQdOAdKyhJD6rkiFY+3t97ILhcN8utV
        xpz0cHL75Aql3XXelXokxUKkXBQeBvqqMHU=
X-Google-Smtp-Source: APXvYqwXqcZXkM5Ps6Nmi5nJ0iqzxvaoGR8zYdsRgH1OcvmtSFMGN0PyLHnpBNha9oOHO3/IwHPKxmc7jyTiz/4=
X-Received: by 2002:a1f:1288:: with SMTP id 130mr19236937vks.12.1563478899563;
 Thu, 18 Jul 2019 12:41:39 -0700 (PDT)
Date:   Thu, 18 Jul 2019 12:41:33 -0700
Message-Id: <20190718194133.64034-1-atifniyaz@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v2] input: API for Setting a Timestamp from a Driver
From:   Atif Niyaz <atifniyaz@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Atif Niyaz <atifniyaz11@gmail.com>,
        Siarhei Vishniakou <svv@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atif Niyaz <atifniyaz@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, evdev stamps events with timestamps acquired in evdev_events.
However, this timestamping may not be accurate in terms of measuring
when the actual event happened. This API allows any 3rd party driver to
be able to call input_set_timestamp, and provide a timestamp that can be
utilized in order to provide a more accurate sense of time for the
event

Signed-off-by: Atif Niyaz <atifniyaz@google.com>
---
 drivers/input/evdev.c | 43 +++++++++++++++++--------------------------
 drivers/input/input.c | 16 ++++++++++++++++
 include/linux/input.h | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 26 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 867c2cfd0038..3160b2223955 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -25,13 +25,6 @@
 #include <linux/cdev.h>
 #include "input-compat.h"
 
-enum evdev_clock_type {
-	EV_CLK_REAL = 0,
-	EV_CLK_MONO,
-	EV_CLK_BOOT,
-	EV_CLK_MAX
-};
-
 struct evdev {
 	int open;
 	struct input_handle handle;
@@ -53,7 +46,7 @@ struct evdev_client {
 	struct fasync_struct *fasync;
 	struct evdev *evdev;
 	struct list_head node;
-	unsigned int clk_type;
+	enum input_clock_type clk_type;
 	bool revoked;
 	unsigned long *evmasks[EV_CNT];
 	unsigned int bufsize;
@@ -150,16 +143,19 @@ static void __evdev_flush_queue(struct evdev_client *client, unsigned int type)
 static void __evdev_queue_syn_dropped(struct evdev_client *client)
 {
 	struct input_event ev;
-	ktime_t time;
 	struct timespec64 ts;
+	ktime_t *time = input_get_timestamp(client->evdev->handle.dev);
 
-	time = client->clk_type == EV_CLK_REAL ?
-			ktime_get_real() :
-			client->clk_type == EV_CLK_MONO ?
-				ktime_get() :
-				ktime_get_boottime();
+	switch (client->clk_type) {
+	case INPUT_CLK_REAL:
+	case INPUT_CLK_MONO:
+		ts = ktime_to_timespec64(time[client->clk_type]);
+		break;
+	default:
+		ts = ktime_to_timespec64(time[INPUT_CLK_BOOT]);
+		break;
+	}
 
-	ts = ktime_to_timespec64(time);
 	ev.input_event_sec = ts.tv_sec;
 	ev.input_event_usec = ts.tv_nsec / NSEC_PER_USEC;
 	ev.type = EV_SYN;
@@ -185,21 +181,21 @@ static void evdev_queue_syn_dropped(struct evdev_client *client)
 	spin_unlock_irqrestore(&client->buffer_lock, flags);
 }
 
-static int evdev_set_clk_type(struct evdev_client *client, unsigned int clkid)
+static int evdev_set_clk_type(struct evdev_client *client, clockid_t clkid)
 {
 	unsigned long flags;
-	unsigned int clk_type;
+	enum input_clock_type clk_type;
 
 	switch (clkid) {
 
 	case CLOCK_REALTIME:
-		clk_type = EV_CLK_REAL;
+		clk_type = INPUT_CLK_REAL;
 		break;
 	case CLOCK_MONOTONIC:
-		clk_type = EV_CLK_MONO;
+		clk_type = INPUT_CLK_MONO;
 		break;
 	case CLOCK_BOOTTIME:
-		clk_type = EV_CLK_BOOT;
+		clk_type = INPUT_CLK_BOOT;
 		break;
 	default:
 		return -EINVAL;
@@ -307,12 +303,7 @@ static void evdev_events(struct input_handle *handle,
 {
 	struct evdev *evdev = handle->private;
 	struct evdev_client *client;
-	ktime_t ev_time[EV_CLK_MAX];
-
-	ev_time[EV_CLK_MONO] = ktime_get();
-	ev_time[EV_CLK_REAL] = ktime_mono_to_real(ev_time[EV_CLK_MONO]);
-	ev_time[EV_CLK_BOOT] = ktime_mono_to_any(ev_time[EV_CLK_MONO],
-						 TK_OFFS_BOOT);
+	ktime_t *ev_time = input_get_timestamp(handle->dev);
 
 	rcu_read_lock();
 
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 7f3c5fcb9ed6..b8d711980bdd 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1894,6 +1894,22 @@ void input_free_device(struct input_dev *dev)
 }
 EXPORT_SYMBOL(input_free_device);
 
+/**
+ * input_get_timestamp - get timestamp for input events
+ * @dev: input device to get timestamp from
+ *
+ * A valid timestamp is a timestamp of non-zero value.
+ */
+ktime_t *input_get_timestamp(struct input_dev *dev)
+{
+	const ktime_t invalid_timestamp = ktime_set(0, 0);
+
+	if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timestamp))
+		input_set_timestamp(dev, ktime_get());
+	return dev->timestamp;
+}
+EXPORT_SYMBOL(input_get_timestamp);
+
 /**
  * input_set_capability - mark device as capable of a certain event
  * @dev: device that is capable of emitting or accepting event
diff --git a/include/linux/input.h b/include/linux/input.h
index 510e78558c10..cf8c69abb342 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -33,6 +33,13 @@ struct input_value {
 	__s32 value;
 };
 
+enum input_clock_type {
+	INPUT_CLK_REAL = 0,
+	INPUT_CLK_MONO,
+	INPUT_CLK_BOOT,
+	INPUT_CLK_MAX
+};
+
 /**
  * struct input_dev - represents an input device
  * @name: name of the device
@@ -114,6 +121,8 @@ struct input_value {
  * @vals: array of values queued in the current frame
  * @devres_managed: indicates that devices is managed with devres framework
  *	and needs not be explicitly unregistered or freed.
+ * @timestamp: storage for a timestamp set by input_set_timestamp called
+ *  by a driver
  */
 struct input_dev {
 	const char *name;
@@ -184,6 +193,8 @@ struct input_dev {
 	struct input_value *vals;
 
 	bool devres_managed;
+
+	ktime_t timestamp[INPUT_CLK_MAX];
 };
 #define to_input_dev(d) container_of(d, struct input_dev, dev)
 
@@ -382,6 +393,32 @@ void input_close_device(struct input_handle *);
 
 int input_flush_device(struct input_handle *handle, struct file *file);
 
+/**
+ * input_set_timestamp - set timestamp for input events
+ * @dev: input device to set timestamp for
+ * @timestamp: the time at which the event has occurred
+ *   in CLOCK_MONOTONIC
+ *
+ * This function is intended to provide to the input system a more
+ * accurate time of when an event actually occurred. The driver should
+ * call this function as soon as a timestamp is acquired ensuring
+ * clock conversions in input_set_timestamp are done correctly.
+ *
+ * The system entering a suspend between timestamp acquisition and
+ * calling input_set_timestamp can result in inaccurate conversions.
+ *
+ */
+static inline void input_set_timestamp(struct input_dev *dev,
+	ktime_t timestamp)
+{
+	dev->timestamp[INPUT_CLK_MONO] = timestamp;
+	dev->timestamp[INPUT_CLK_REAL] = ktime_mono_to_real(timestamp);
+	dev->timestamp[INPUT_CLK_BOOT] = ktime_mono_to_any(
+		timestamp, TK_OFFS_BOOT);
+}
+
+ktime_t *input_get_timestamp(struct input_dev *dev);
+
 void input_event(struct input_dev *dev, unsigned int type, unsigned int code, int value);
 void input_inject_event(struct input_handle *handle, unsigned int type, unsigned int code, int value);
 
-- 
2.22.0.510.g264f2c817a-goog


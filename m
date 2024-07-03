Return-Path: <linux-input+bounces-4835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D4926A77
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA4A2861D8
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C4119755E;
	Wed,  3 Jul 2024 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEasnpxc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7655B19415E;
	Wed,  3 Jul 2024 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042694; cv=none; b=bFyR8IWb37Jlw99SeniuSjKTP+12vQzXVOw1QGw8aQrHIACEJ+qXMlx71rkuL3Mdub4/K+YyEbGVoLuJn8tGqOqKNz2+Mf8/fi8nwt9jjegzt3dHVHKUuR9ERQ9zqHsNNO2TWMT1HQ2JM1qWC/q4pqe/PLS6+zXhAHdvhyXpaW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042694; c=relaxed/simple;
	bh=q+QrJBtJ9Ru3AkGe9faD1DkMjCMtANc9rET3Xa76QL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LY0OEFFd5sJF5E/Lv3djxl2ocJi6oi38fiAUhtr66hphz8KQ0RdE/C15O1fI/KX4g2MdzX/BckXZQ/YZCnPtxxsu/puHv/pXdygl3QWsJvuGYlwwCCwU06WL+AOJKfPcN27igq1RYYHkRnilL1gF2xSEiMOT9ROGTWacxJzWucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEasnpxc; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-711b1512aeaso4403186a12.3;
        Wed, 03 Jul 2024 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042692; x=1720647492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAbVgj6nnqU9EhhwABC3OfN6AUT4/aiKn495mgpM2Zs=;
        b=VEasnpxcLCDlyIfYYiFhDUQVkjMo0esb7PKNf5hcXN61WagyY/Tz6GdRak/XE9sTkQ
         UGHM80g5poyzL0XIAw/CWPgBnox54CPpUYeAhZcFmGp1simqWiyVi3NTv8F0dljRSavE
         uOXA1jSVXooSXraBaYKEvqRRtxLRnFlJn0BYdURqsQKhz+uzMXXAaQHT3Eb9gjP8/DH3
         5BF/D+xSnlns2wII5AzU/b/TooWMl/il4n1qMmfdxSGiCWFEezSocsR8l34UUjYuLb0w
         c2Lge+P2o8SYjsqe+6lwNyMLZDhfCmQsj+aGH0r0eJp2D/FdhVUHsbAg+udhnT3SP4Nv
         rBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042692; x=1720647492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAbVgj6nnqU9EhhwABC3OfN6AUT4/aiKn495mgpM2Zs=;
        b=mI2I/Z9RUxRc18iL6su3ff7Lq//jVpXhQKcJLMkykdEkmoYJGdJDNZKevVojJ7MYB3
         2rRAWbWNXIO3gHz3OK29agM3UGxycd/MvZ3LM5UNZVVlt70MSkH8gS1pWH0AwEsZa2Wy
         LEVm4e+kgpEw/BOFfmPyZtoWQWXhSiEo6FsXKJR9yOV7tPNN6maP1kUkSHY8rSNY0LnX
         eXmaGx/45z9IQa15N3kd7wbf+4nVR+gz5IMmG791efvG+VZ4B4G/6W+/TZrl+ZiTS6SX
         CwqA2JU1j2kJg+tHkX5KGu7OIUfkCogcWXArIcVWFQ8dVENogBnB8ce9t4fKMjlTGtHP
         8uhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLcoujXwpIj5ukgaDs1rZoBhzFiy29fXz9ldcMxGHRdgjAtU1N3viY3WRaW7NBQTK3EVEycMvWPWD8+T0a15C0yegqweFQh7/lP3Bw
X-Gm-Message-State: AOJu0Yzqdj4LasezxZydTvIm2A6zqo4g4vTmZ5oiaNG/zwJ6oqXqskTy
	ZNUdHqJcnv08qZ3QcTta7847RLW6sF4ZirCfh9dUCvHf7V8GLtcs0VczbA==
X-Google-Smtp-Source: AGHT+IHGF9sjbwVCkKE54mdplTZfQXmbT9G4nqgBwzZEgaTPdyk47G2mFUKtjnW5HiJkPQkdyNzKuw==
X-Received: by 2002:a05:6a20:a106:b0:1bd:22e0:f725 with SMTP id adf61e73a8af0-1bef611b976mr17946211637.29.1720042692143;
        Wed, 03 Jul 2024 14:38:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] Input: preallocate memory to hold event values
Date: Wed,  3 Jul 2024 14:37:53 -0700
Message-ID: <20240703213756.3375978-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preallocate memory for holding event values (input_dev->vals) so that
there is no need to check if it was allocated or not in the event
processing code.

The amount of memory will be adjusted after input device has been fully
set up upon registering device with the input core.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 61 +++++++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 9981fdfaee9f..4e12fa79883e 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -323,9 +323,6 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
 	if ((disposition & INPUT_PASS_TO_DEVICE) && dev->event)
 		dev->event(dev, type, code, value);
 
-	if (!dev->vals)
-		return;
-
 	if (disposition & INPUT_PASS_TO_HANDLERS) {
 		struct input_value *v;
 
@@ -1985,6 +1982,18 @@ struct input_dev *input_allocate_device(void)
 	if (!dev)
 		return NULL;
 
+	/*
+	 * Start with space for SYN_REPORT + 7 EV_KEY/EV_MSC events + 2 spare,
+	 * see input_estimate_events_per_packet(). We will tune the number
+	 * when we register the device.
+	 */
+	dev->max_vals = 10;
+	dev->vals = kcalloc(dev->max_vals, sizeof(*dev->vals), GFP_KERNEL);
+	if (!dev->vals) {
+		kfree(dev);
+		return NULL;
+	}
+
 	mutex_init(&dev->mutex);
 	spin_lock_init(&dev->event_lock);
 	timer_setup(&dev->timer, NULL, 0);
@@ -2344,6 +2353,35 @@ bool input_device_enabled(struct input_dev *dev)
 }
 EXPORT_SYMBOL_GPL(input_device_enabled);
 
+static int input_device_tune_vals(struct input_dev *dev)
+{
+	struct input_value *vals;
+	unsigned int packet_size;
+	unsigned int max_vals;
+
+	packet_size = input_estimate_events_per_packet(dev);
+	if (dev->hint_events_per_packet < packet_size)
+		dev->hint_events_per_packet = packet_size;
+
+	max_vals = dev->hint_events_per_packet + 2;
+	if (dev->max_vals >= max_vals)
+		return 0;
+
+	vals = kcalloc(max_vals, sizeof(*vals), GFP_KERNEL);
+	if (!vals)
+		return -ENOMEM;
+
+	spin_lock_irq(&dev->event_lock);
+	dev->max_vals = max_vals;
+	swap(dev->vals, vals);
+	spin_unlock_irq(&dev->event_lock);
+
+	/* Because of swap() above, this frees the old vals memory */
+	kfree(vals);
+
+	return 0;
+}
+
 /**
  * input_register_device - register device with input core
  * @dev: device to be registered
@@ -2371,7 +2409,6 @@ int input_register_device(struct input_dev *dev)
 {
 	struct input_devres *devres = NULL;
 	struct input_handler *handler;
-	unsigned int packet_size;
 	const char *path;
 	int error;
 
@@ -2399,16 +2436,9 @@ int input_register_device(struct input_dev *dev)
 	/* Make sure that bitmasks not mentioned in dev->evbit are clean. */
 	input_cleanse_bitmasks(dev);
 
-	packet_size = input_estimate_events_per_packet(dev);
-	if (dev->hint_events_per_packet < packet_size)
-		dev->hint_events_per_packet = packet_size;
-
-	dev->max_vals = dev->hint_events_per_packet + 2;
-	dev->vals = kcalloc(dev->max_vals, sizeof(*dev->vals), GFP_KERNEL);
-	if (!dev->vals) {
-		error = -ENOMEM;
+	error = input_device_tune_vals(dev);
+	if (error)
 		goto err_devres_free;
-	}
 
 	/*
 	 * If delay and period are pre-set by the driver, then autorepeating
@@ -2428,7 +2458,7 @@ int input_register_device(struct input_dev *dev)
 
 	error = device_add(&dev->dev);
 	if (error)
-		goto err_free_vals;
+		goto err_devres_free;
 
 	path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
 	pr_info("%s as %s\n",
@@ -2458,9 +2488,6 @@ int input_register_device(struct input_dev *dev)
 
 err_device_del:
 	device_del(&dev->dev);
-err_free_vals:
-	kfree(dev->vals);
-	dev->vals = NULL;
 err_devres_free:
 	devres_free(devres);
 	return error;
-- 
2.45.2.803.g4e1b14247a-goog



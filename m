Return-Path: <linux-input+bounces-4745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE63191D7DF
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 08:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F4131C221CE
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 06:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC30D7E58D;
	Mon,  1 Jul 2024 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB8AQtZ7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8878C84;
	Mon,  1 Jul 2024 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813971; cv=none; b=etlcOIOZz1CeMYwhiLpg8iLjqUK4Wnc9qCPePr/91sKfnOG4C/YFHW8J9txKTGdsYxk1j/5WKvA/RlGCiN2M4ZtSYt3bUkrI+lGEiP7sxros2qeYiT3i37J6xksbQ7vwIjcrH5huWxgx4M2WZB+Ft8jWuQr65MabBeCOYaDBp24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813971; c=relaxed/simple;
	bh=5Ov3xhl7a3MciO7T5L90lpaI7/f9++PrLfZIIrGutFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpLflDQAsEP+csjzHdy0AnPkhTeqpLlLoPe1Xmjr4TfhyehuOH3Bet9rQxmk6Cl4rcKj2DLpi8FRaR7rQSc8r/YA1jD/Q+3eN5gbUO7GxM8eP8/HRN3j35vufMYM8zn/AXABHBmQj015gCmaoXg6Fy+eDgWpavSkpxOgfYwVSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CB8AQtZ7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f9e2affc8cso14056835ad.2;
        Sun, 30 Jun 2024 23:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719813969; x=1720418769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nhPcyqnl79AzLZ7it3TCiWLlmrHTFsaC4jGYPqN0fI=;
        b=CB8AQtZ7DaacT18iFCeujFr1Kzbb9yYmfsyK6TjA/CViHACdXtyni6AiPPDqycoTBX
         jEOpotn+q9fdNPLHSM0/czM5RbqCeJesZzTfwH0ZsGfpalOgQVl5ycReZPZax62JaShE
         4UPvaAG7Xsi5etXpMPCzbnI9lPx9tEuM8hJrPUiI6+h6hq7ZHmKTekZrcfCAu+K2wp/J
         oIVnAOzVmc5agV8MXWbrowqraYb5/Tp668bRL+hqUShl2LRVrMl1/rpaK5mNhqQyeJoS
         XcQP5ikQC/Dp+Jx8UbQEXGDcKtOVW+NSWGkNDdObAin/dovuPLuJIMHECD5T3VcnVmW1
         vbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813969; x=1720418769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nhPcyqnl79AzLZ7it3TCiWLlmrHTFsaC4jGYPqN0fI=;
        b=WcrcgZ8/O+pOpevpiJzdpz0aXlcJGAQ7Fe4Pda1l9ekmxiBRt4uslT5TCrU5yXqu0d
         UX18darEP4ZmPLt00iRG0Fl03yoR6fTSzLSXLm64Mc9PkLt6D90EEShHo380hv4E5IuU
         0cyj69mWwAliWsLwFyJef3FZQnvIjEuWioVNM6mlfjEkNHWklotfEGToKYDuTN84Z0Jv
         95gXAg6CPNkMlB0ghMYFztl+PBfBNq1wE7hwsoXFOYpW7DgQYwmjOqC7/l4I7gyzU5lr
         b61aX6RkyAFGvF4QIgbAh3QAFshCUCSo2naTWeKQw+AC5v212JF+0U7tBqNmECxWiVZq
         Y51Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSJuP3+I0tBCxy4kwbz/AUowesHYdO7Q5ZIFQDSBy31iO3PELMptPwMYRNmObybxaUKZGidmm9f01XojhB8PEK0nknANgfJ8v/T3VS
X-Gm-Message-State: AOJu0YwrslSRmt1PS0ANTov8sErj3eUm0lcL2aZ1nV/76DM3hDr5uGM3
	l5nltj6sEpQmjPZY12ZBmN/Mn+BkSVV8yD2TwomuSBS3auXYqU188VvtFg==
X-Google-Smtp-Source: AGHT+IEBe6okwdlbG3pqvHVTbtq7wuEBMU0veXpP8lACPMnMNrQs9MPrXVEdvJadG04SABmVbObYsw==
X-Received: by 2002:a17:903:1cf:b0:1f6:9122:2c2 with SMTP id d9443c01a7336-1fadbc8addfmr25666065ad.15.1719813969138;
        Sun, 30 Jun 2024 23:06:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad304311csm44588205ad.31.2024.06.30.23.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:06:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Input: preallocate memory to hold event values
Date: Sun, 30 Jun 2024 23:05:52 -0700
Message-ID: <20240701060553.869989-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
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
 drivers/input/input.c | 98 ++++++++++++++++++++++++++++---------------
 1 file changed, 64 insertions(+), 34 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index eeb755cb12e7..b65b645d9478 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -112,9 +112,6 @@ static void input_pass_values(struct input_dev *dev,
 
 	lockdep_assert_held(&dev->event_lock);
 
-	if (!count)
-		return;
-
 	rcu_read_lock();
 
 	handle = rcu_dereference(dev->grab);
@@ -320,9 +317,6 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
 	if ((disposition & INPUT_PASS_TO_DEVICE) && dev->event)
 		dev->event(dev, type, code, value);
 
-	if (!dev->vals)
-		return;
-
 	if (disposition & INPUT_PASS_TO_HANDLERS) {
 		struct input_value *v;
 
@@ -1979,22 +1973,41 @@ struct input_dev *input_allocate_device(void)
 	struct input_dev *dev;
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (dev) {
-		dev->dev.type = &input_dev_type;
-		dev->dev.class = &input_class;
-		device_initialize(&dev->dev);
-		mutex_init(&dev->mutex);
-		spin_lock_init(&dev->event_lock);
-		timer_setup(&dev->timer, NULL, 0);
-		INIT_LIST_HEAD(&dev->h_list);
-		INIT_LIST_HEAD(&dev->node);
-
-		dev_set_name(&dev->dev, "input%lu",
-			     (unsigned long)atomic_inc_return(&input_no));
-
-		__module_get(THIS_MODULE);
+	if (!dev)
+		return NULL;
+
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
 	}
 
+	mutex_init(&dev->mutex);
+	spin_lock_init(&dev->event_lock);
+	timer_setup(&dev->timer, NULL, 0);
+	INIT_LIST_HEAD(&dev->h_list);
+	INIT_LIST_HEAD(&dev->node);
+
+	dev->dev.type = &input_dev_type;
+	dev->dev.class = &input_class;
+	device_initialize(&dev->dev);
+	/*
+	 * From this point on we can no longer simply "kfree(dev)", we need
+	 * to use input_free_device() so that device core properly frees its
+	 * resources associated with the input device.
+	 */
+
+	dev_set_name(&dev->dev, "input%lu",
+		     (unsigned long)atomic_inc_return(&input_no));
+
+	__module_get(THIS_MODULE);
+
 	return dev;
 }
 EXPORT_SYMBOL(input_allocate_device);
@@ -2334,6 +2347,34 @@ bool input_device_enabled(struct input_dev *dev)
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
+	kfree(vals);
+
+	return 0;
+}
+
 /**
  * input_register_device - register device with input core
  * @dev: device to be registered
@@ -2361,7 +2402,6 @@ int input_register_device(struct input_dev *dev)
 {
 	struct input_devres *devres = NULL;
 	struct input_handler *handler;
-	unsigned int packet_size;
 	const char *path;
 	int error;
 
@@ -2389,16 +2429,9 @@ int input_register_device(struct input_dev *dev)
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
@@ -2418,7 +2451,7 @@ int input_register_device(struct input_dev *dev)
 
 	error = device_add(&dev->dev);
 	if (error)
-		goto err_free_vals;
+		goto err_devres_free;
 
 	path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
 	pr_info("%s as %s\n",
@@ -2448,9 +2481,6 @@ int input_register_device(struct input_dev *dev)
 
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



Return-Path: <linux-input+bounces-7945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E59BFEE9
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD29FB22A75
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E72B1DD529;
	Thu,  7 Nov 2024 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JY0Gfk18"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349EC1DB349;
	Thu,  7 Nov 2024 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963759; cv=none; b=SlAqP1xdyslMJq6NClFDaQ0XzO2RjjLztXt++zJuxBvcuKcwMqcfvZ/CIVar9B35SLKRDfqash2M6y4igXrV5hLgqfFPT3PmvgYJl82hfENJRAwjMRKtUnl/YPJ8pNsvH8S4+9XxqrD0/Qh9moYPVIh8t4G1G8oCsw8NtuQiftQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963759; c=relaxed/simple;
	bh=/RUaVUpDQ7T5tTxPo6zLJB7T4fE2ssNRXsspSUPn3E8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMDnd12uNDn28mEU5sDcuQSz1n53ZUk6k/r+bl3pyZtfHAQhqBbOxFiZxqUI5AYqevTpiCM6hAzBw4/nG0W41QNvOjYaz+d+ZO2/9Wor0Ad85TAYtpDy8gj6bG757NqRKTMgQ47kH2GxbTaMOZxCCHJqnQZiUZKPE8+/c8R1KRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JY0Gfk18; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c7edf2872so14730975ad.1;
        Wed, 06 Nov 2024 23:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963756; x=1731568556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytENwwVCnR/pe/wHV6/c4qrD5DdYDBL06kZXp7xsQIQ=;
        b=JY0Gfk183evf9l92NCUk3Y7XdgIzFSfQx4rJgm7/rGPPRsvaqAMTODjCrOPLIZ+oLE
         87VWwWuzkRIY59gTDzXoYnbVYE2/ndtGNsovUsi6yJ9KTuyozydB7vczZSb3vyReyh38
         omFj2W4VQBQr/J/TsA1og2ax7rliwR5D5o+mH3txaJDXpnoWydM7Gf3atwUemeM4wlaj
         O/IybSWLhXL+6S+6wwdjlBCDeWO2DjueySNw2LSD9CnSl5pRRjanpoi0H6dyTllHanov
         3osdi0mgkpOLMNnKW87ABnRJTdM3pg5ncGAKMYOaQUF0VmddTPJEOKO29wM06/0g1Dy/
         S9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963756; x=1731568556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytENwwVCnR/pe/wHV6/c4qrD5DdYDBL06kZXp7xsQIQ=;
        b=ABYc1af/SYeZfqWG7yjAt6nVKEJNpNXBzkR8SiGMZBW33eM1d7bLSrHvdRqmBZAOS6
         I67cdYRFRHyn+wuvlahsJIRp7TXsAZT5xS54sGbF7HNYQeaSfKGph4URWpubBa7AfkAY
         K6C/TVJRwzQY/dwuegxYhmwQwYCrVsuf+dBsnMvNhnDHUbne91Xq5+7I0mD95siL+XfR
         1no4KI5SBHb43hbbCKlJsOLjQzsn8vSbHnJTFA/tdWOh+y2VGHHikQLf1DOyLNonuEH0
         ihe50bUlWGr53N6P1Sc8b5GHNrycwmwwSW2ci4tRJB0fYgiOvWFIFUY7XrknVYVnN/TN
         XMuw==
X-Forwarded-Encrypted: i=1; AJvYcCWvTAapfjz5ALXVw80i8b4drrPJkIYs+TgimowG/QTlwmlWCE7Ux5Rj4XlDEMLbCagMKmRbspoSunbVctU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNkRDwuOAkNzOTkaxTgsUM8n6QAX9Xi9avc+UE3CZmM1PR+OqG
	sztnG3RxtH4Ro8g5l0ZUDXjfEnWPgnaqbCDWdvbAIziT9mjuszmMCvL0og==
X-Google-Smtp-Source: AGHT+IGAstm/8rheuADwv1sysMP2AgMwEVXoCVKFTdZdwpFnT2jAg1u1jWT8D/u2FJnBjgP2K6vgPA==
X-Received: by 2002:a17:902:e54e:b0:20c:8f98:5dbb with SMTP id d9443c01a7336-2117d1a208dmr860775ad.16.1730963756331;
        Wed, 06 Nov 2024 23:15:56 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:55 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] Input: use guard notation in input core
Date: Wed,  6 Nov 2024 23:15:35 -0800
Message-ID: <20241107071538.195340-9-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch input core to use "guard" notation when acquiring spinlocks and
mutexes to simplify the code and ensure that locks are automatically
released when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 339 ++++++++++++++++--------------------------
 1 file changed, 131 insertions(+), 208 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index fd9d40286b75..d73231e695f8 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -115,23 +115,23 @@ static void input_pass_values(struct input_dev *dev,
 
 	lockdep_assert_held(&dev->event_lock);
 
-	rcu_read_lock();
+	scoped_guard(rcu) {
+		handle = rcu_dereference(dev->grab);
+		if (handle) {
+			count = handle->handle_events(handle, vals, count);
+			break;
+		}
 
-	handle = rcu_dereference(dev->grab);
-	if (handle) {
-		count = handle->handle_events(handle, vals, count);
-	} else {
-		list_for_each_entry_rcu(handle, &dev->h_list, d_node)
+		list_for_each_entry_rcu(handle, &dev->h_list, d_node) {
 			if (handle->open) {
 				count = handle->handle_events(handle, vals,
 							      count);
 				if (!count)
 					break;
 			}
+		}
 	}
 
-	rcu_read_unlock();
-
 	/* trigger auto repeat for key events */
 	if (test_bit(EV_REP, dev->evbit) && test_bit(EV_KEY, dev->evbit)) {
 		for (v = vals; v != vals + count; v++) {
@@ -390,13 +390,9 @@ void input_handle_event(struct input_dev *dev,
 void input_event(struct input_dev *dev,
 		 unsigned int type, unsigned int code, int value)
 {
-	unsigned long flags;
-
 	if (is_event_supported(type, dev->evbit, EV_MAX)) {
-
-		spin_lock_irqsave(&dev->event_lock, flags);
+		guard(spinlock_irqsave)(&dev->event_lock);
 		input_handle_event(dev, type, code, value);
-		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 }
 EXPORT_SYMBOL(input_event);
@@ -417,18 +413,15 @@ void input_inject_event(struct input_handle *handle,
 {
 	struct input_dev *dev = handle->dev;
 	struct input_handle *grab;
-	unsigned long flags;
 
 	if (is_event_supported(type, dev->evbit, EV_MAX)) {
-		spin_lock_irqsave(&dev->event_lock, flags);
+		guard(spinlock_irqsave)(&dev->event_lock);
+		guard(rcu)();
 
-		rcu_read_lock();
 		grab = rcu_dereference(dev->grab);
 		if (!grab || grab == handle)
 			input_handle_event(dev, type, code, value);
-		rcu_read_unlock();
 
-		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 }
 EXPORT_SYMBOL(input_inject_event);
@@ -526,22 +519,15 @@ EXPORT_SYMBOL(input_copy_abs);
 int input_grab_device(struct input_handle *handle)
 {
 	struct input_dev *dev = handle->dev;
-	int retval;
 
-	retval = mutex_lock_interruptible(&dev->mutex);
-	if (retval)
-		return retval;
+	scoped_cond_guard(mutex_intr, return -EINTR, &dev->mutex) {
+		if (dev->grab)
+			return -EBUSY;
 
-	if (dev->grab) {
-		retval = -EBUSY;
-		goto out;
+		rcu_assign_pointer(dev->grab, handle);
 	}
 
-	rcu_assign_pointer(dev->grab, handle);
-
- out:
-	mutex_unlock(&dev->mutex);
-	return retval;
+	return 0;
 }
 EXPORT_SYMBOL(input_grab_device);
 
@@ -576,9 +562,8 @@ void input_release_device(struct input_handle *handle)
 {
 	struct input_dev *dev = handle->dev;
 
-	mutex_lock(&dev->mutex);
+	guard(mutex)(&dev->mutex);
 	__input_release_device(handle);
-	mutex_unlock(&dev->mutex);
 }
 EXPORT_SYMBOL(input_release_device);
 
@@ -592,67 +577,57 @@ EXPORT_SYMBOL(input_release_device);
 int input_open_device(struct input_handle *handle)
 {
 	struct input_dev *dev = handle->dev;
-	int retval;
-
-	retval = mutex_lock_interruptible(&dev->mutex);
-	if (retval)
-		return retval;
-
-	if (dev->going_away) {
-		retval = -ENODEV;
-		goto out;
-	}
+	int error;
 
-	handle->open++;
+	scoped_cond_guard(mutex_intr, return -EINTR, &dev->mutex) {
+		if (dev->going_away)
+			return -ENODEV;
 
-	if (handle->handler->passive_observer)
-		goto out;
+		handle->open++;
 
-	if (dev->users++ || dev->inhibited) {
-		/*
-		 * Device is already opened and/or inhibited,
-		 * so we can exit immediately and report success.
-		 */
-		goto out;
-	}
+		if (handle->handler->passive_observer)
+			return 0;
 
-	if (dev->open) {
-		retval = dev->open(dev);
-		if (retval) {
-			dev->users--;
-			handle->open--;
+		if (dev->users++ || dev->inhibited) {
 			/*
-			 * Make sure we are not delivering any more events
-			 * through this handle
+			 * Device is already opened and/or inhibited,
+			 * so we can exit immediately and report success.
 			 */
-			synchronize_rcu();
-			goto out;
+			return 0;
 		}
-	}
 
-	if (dev->poller)
-		input_dev_poller_start(dev->poller);
+		if (dev->open) {
+			error = dev->open(dev);
+			if (error) {
+				dev->users--;
+				handle->open--;
+				/*
+				 * Make sure we are not delivering any more
+				 * events through this handle.
+				 */
+				synchronize_rcu();
+				return error;
+			}
+		}
 
- out:
-	mutex_unlock(&dev->mutex);
-	return retval;
+		if (dev->poller)
+			input_dev_poller_start(dev->poller);
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL(input_open_device);
 
 int input_flush_device(struct input_handle *handle, struct file *file)
 {
 	struct input_dev *dev = handle->dev;
-	int retval;
 
-	retval = mutex_lock_interruptible(&dev->mutex);
-	if (retval)
-		return retval;
-
-	if (dev->flush)
-		retval = dev->flush(dev, file);
+	scoped_cond_guard(mutex_intr, return -EINTR, &dev->mutex) {
+		if (dev->flush)
+			return dev->flush(dev, file);
+	}
 
-	mutex_unlock(&dev->mutex);
-	return retval;
+	return 0;
 }
 EXPORT_SYMBOL(input_flush_device);
 
@@ -667,7 +642,7 @@ void input_close_device(struct input_handle *handle)
 {
 	struct input_dev *dev = handle->dev;
 
-	mutex_lock(&dev->mutex);
+	guard(mutex)(&dev->mutex);
 
 	__input_release_device(handle);
 
@@ -688,8 +663,6 @@ void input_close_device(struct input_handle *handle)
 		 */
 		synchronize_rcu();
 	}
-
-	mutex_unlock(&dev->mutex);
 }
 EXPORT_SYMBOL(input_close_device);
 
@@ -726,11 +699,10 @@ static void input_disconnect_device(struct input_dev *dev)
 	 * not to protect access to dev->going_away but rather to ensure
 	 * that there are no threads in the middle of input_open_device()
 	 */
-	mutex_lock(&dev->mutex);
-	dev->going_away = true;
-	mutex_unlock(&dev->mutex);
+	scoped_guard(mutex, &dev->mutex)
+		dev->going_away = true;
 
-	spin_lock_irq(&dev->event_lock);
+	guard(spinlock_irq)(&dev->event_lock);
 
 	/*
 	 * Simulate keyup events for all pressed keys so that handlers
@@ -743,8 +715,6 @@ static void input_disconnect_device(struct input_dev *dev)
 
 	list_for_each_entry(handle, &dev->h_list, d_node)
 		handle->open = 0;
-
-	spin_unlock_irq(&dev->event_lock);
 }
 
 /**
@@ -901,14 +871,9 @@ static int input_default_setkeycode(struct input_dev *dev,
  */
 int input_get_keycode(struct input_dev *dev, struct input_keymap_entry *ke)
 {
-	unsigned long flags;
-	int retval;
+	guard(spinlock_irqsave)(&dev->event_lock);
 
-	spin_lock_irqsave(&dev->event_lock, flags);
-	retval = dev->getkeycode(dev, ke);
-	spin_unlock_irqrestore(&dev->event_lock, flags);
-
-	return retval;
+	return dev->getkeycode(dev, ke);
 }
 EXPORT_SYMBOL(input_get_keycode);
 
@@ -923,18 +888,17 @@ EXPORT_SYMBOL(input_get_keycode);
 int input_set_keycode(struct input_dev *dev,
 		      const struct input_keymap_entry *ke)
 {
-	unsigned long flags;
 	unsigned int old_keycode;
-	int retval;
+	int error;
 
 	if (ke->keycode > KEY_MAX)
 		return -EINVAL;
 
-	spin_lock_irqsave(&dev->event_lock, flags);
+	guard(spinlock_irqsave)(&dev->event_lock);
 
-	retval = dev->setkeycode(dev, ke, &old_keycode);
-	if (retval)
-		goto out;
+	error = dev->setkeycode(dev, ke, &old_keycode);
+	if (error)
+		return error;
 
 	/* Make sure KEY_RESERVED did not get enabled. */
 	__clear_bit(KEY_RESERVED, dev->keybit);
@@ -962,10 +926,7 @@ int input_set_keycode(struct input_dev *dev,
 				    EV_SYN, SYN_REPORT, 1);
 	}
 
- out:
-	spin_unlock_irqrestore(&dev->event_lock, flags);
-
-	return retval;
+	return 0;
 }
 EXPORT_SYMBOL(input_set_keycode);
 
@@ -1802,26 +1763,21 @@ static void input_dev_toggle(struct input_dev *dev, bool activate)
  */
 void input_reset_device(struct input_dev *dev)
 {
-	unsigned long flags;
-
-	mutex_lock(&dev->mutex);
-	spin_lock_irqsave(&dev->event_lock, flags);
+	guard(mutex)(&dev->mutex);
+	guard(spinlock_irqsave)(&dev->event_lock);
 
 	input_dev_toggle(dev, true);
 	if (input_dev_release_keys(dev))
 		input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
-
-	spin_unlock_irqrestore(&dev->event_lock, flags);
-	mutex_unlock(&dev->mutex);
 }
 EXPORT_SYMBOL(input_reset_device);
 
 static int input_inhibit_device(struct input_dev *dev)
 {
-	mutex_lock(&dev->mutex);
+	guard(mutex)(&dev->mutex);
 
 	if (dev->inhibited)
-		goto out;
+		return 0;
 
 	if (dev->users) {
 		if (dev->close)
@@ -1830,54 +1786,50 @@ static int input_inhibit_device(struct input_dev *dev)
 			input_dev_poller_stop(dev->poller);
 	}
 
-	spin_lock_irq(&dev->event_lock);
-	input_mt_release_slots(dev);
-	input_dev_release_keys(dev);
-	input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
-	input_dev_toggle(dev, false);
-	spin_unlock_irq(&dev->event_lock);
+	scoped_guard(spinlock_irq, &dev->event_lock) {
+		input_mt_release_slots(dev);
+		input_dev_release_keys(dev);
+		input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
+		input_dev_toggle(dev, false);
+	}
 
 	dev->inhibited = true;
 
-out:
-	mutex_unlock(&dev->mutex);
 	return 0;
 }
 
 static int input_uninhibit_device(struct input_dev *dev)
 {
-	int ret = 0;
+	int error;
 
-	mutex_lock(&dev->mutex);
+	guard(mutex)(&dev->mutex);
 
 	if (!dev->inhibited)
-		goto out;
+		return 0;
 
 	if (dev->users) {
 		if (dev->open) {
-			ret = dev->open(dev);
-			if (ret)
-				goto out;
+			error = dev->open(dev);
+			if (error)
+				return error;
 		}
 		if (dev->poller)
 			input_dev_poller_start(dev->poller);
 	}
 
 	dev->inhibited = false;
-	spin_lock_irq(&dev->event_lock);
-	input_dev_toggle(dev, true);
-	spin_unlock_irq(&dev->event_lock);
 
-out:
-	mutex_unlock(&dev->mutex);
-	return ret;
+	scoped_guard(spinlock_irq, &dev->event_lock)
+		input_dev_toggle(dev, true);
+
+	return 0;
 }
 
 static int input_dev_suspend(struct device *dev)
 {
 	struct input_dev *input_dev = to_input_dev(dev);
 
-	spin_lock_irq(&input_dev->event_lock);
+	guard(spinlock_irq)(&input_dev->event_lock);
 
 	/*
 	 * Keys that are pressed now are unlikely to be
@@ -1889,8 +1841,6 @@ static int input_dev_suspend(struct device *dev)
 	/* Turn off LEDs and sounds, if any are active. */
 	input_dev_toggle(input_dev, false);
 
-	spin_unlock_irq(&input_dev->event_lock);
-
 	return 0;
 }
 
@@ -1898,13 +1848,11 @@ static int input_dev_resume(struct device *dev)
 {
 	struct input_dev *input_dev = to_input_dev(dev);
 
-	spin_lock_irq(&input_dev->event_lock);
+	guard(spinlock_irq)(&input_dev->event_lock);
 
 	/* Restore state of LEDs and sounds, if any were active. */
 	input_dev_toggle(input_dev, true);
 
-	spin_unlock_irq(&input_dev->event_lock);
-
 	return 0;
 }
 
@@ -1912,7 +1860,7 @@ static int input_dev_freeze(struct device *dev)
 {
 	struct input_dev *input_dev = to_input_dev(dev);
 
-	spin_lock_irq(&input_dev->event_lock);
+	guard(spinlock_irq)(&input_dev->event_lock);
 
 	/*
 	 * Keys that are pressed now are unlikely to be
@@ -1921,8 +1869,6 @@ static int input_dev_freeze(struct device *dev)
 	if (input_dev_release_keys(input_dev))
 		input_handle_event(input_dev, EV_SYN, SYN_REPORT, 1);
 
-	spin_unlock_irq(&input_dev->event_lock);
-
 	return 0;
 }
 
@@ -1930,13 +1876,11 @@ static int input_dev_poweroff(struct device *dev)
 {
 	struct input_dev *input_dev = to_input_dev(dev);
 
-	spin_lock_irq(&input_dev->event_lock);
+	guard(spinlock_irq)(&input_dev->event_lock);
 
 	/* Turn off LEDs and sounds, if any are active. */
 	input_dev_toggle(input_dev, false);
 
-	spin_unlock_irq(&input_dev->event_lock);
-
 	return 0;
 }
 
@@ -2277,18 +2221,16 @@ static void __input_unregister_device(struct input_dev *dev)
 
 	input_disconnect_device(dev);
 
-	mutex_lock(&input_mutex);
-
-	list_for_each_entry_safe(handle, next, &dev->h_list, d_node)
-		handle->handler->disconnect(handle);
-	WARN_ON(!list_empty(&dev->h_list));
+	scoped_guard(mutex, &input_mutex) {
+		list_for_each_entry_safe(handle, next, &dev->h_list, d_node)
+			handle->handler->disconnect(handle);
+		WARN_ON(!list_empty(&dev->h_list));
 
-	del_timer_sync(&dev->timer);
-	list_del_init(&dev->node);
+		del_timer_sync(&dev->timer);
+		list_del_init(&dev->node);
 
-	input_wakeup_procfs_readers();
-
-	mutex_unlock(&input_mutex);
+		input_wakeup_procfs_readers();
+	}
 
 	device_del(&dev->dev);
 }
@@ -2311,9 +2253,8 @@ static void devm_input_device_unregister(struct device *dev, void *res)
 static void input_repeat_key(struct timer_list *t)
 {
 	struct input_dev *dev = from_timer(dev, t, timer);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dev->event_lock, flags);
+	guard(spinlock_irqsave)(&dev->event_lock);
 
 	if (!dev->inhibited &&
 	    test_bit(dev->repeat_key, dev->key) &&
@@ -2327,8 +2268,6 @@ static void input_repeat_key(struct timer_list *t)
 			mod_timer(&dev->timer, jiffies +
 					msecs_to_jiffies(dev->rep[REP_PERIOD]));
 	}
-
-	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
 /**
@@ -2373,10 +2312,10 @@ static int input_device_tune_vals(struct input_dev *dev)
 	if (!vals)
 		return -ENOMEM;
 
-	spin_lock_irq(&dev->event_lock);
-	dev->max_vals = max_vals;
-	swap(dev->vals, vals);
-	spin_unlock_irq(&dev->event_lock);
+	scoped_guard(spinlock_irq, &dev->event_lock) {
+		dev->max_vals = max_vals;
+		swap(dev->vals, vals);
+	}
 
 	/* Because of swap() above, this frees the old vals memory */
 	kfree(vals);
@@ -2468,18 +2407,15 @@ int input_register_device(struct input_dev *dev)
 		path ? path : "N/A");
 	kfree(path);
 
-	error = mutex_lock_interruptible(&input_mutex);
-	if (error)
-		goto err_device_del;
+	error = -EINTR;
+	scoped_cond_guard(mutex_intr, goto err_device_del, &input_mutex) {
+		list_add_tail(&dev->node, &input_dev_list);
 
-	list_add_tail(&dev->node, &input_dev_list);
+		list_for_each_entry(handler, &input_handler_list, node)
+			input_attach_handler(dev, handler);
 
-	list_for_each_entry(handler, &input_handler_list, node)
-		input_attach_handler(dev, handler);
-
-	input_wakeup_procfs_readers();
-
-	mutex_unlock(&input_mutex);
+		input_wakeup_procfs_readers();
+	}
 
 	if (dev->devres_managed) {
 		dev_dbg(dev->dev.parent, "%s: registering %s with devres.\n",
@@ -2559,20 +2495,17 @@ int input_register_handler(struct input_handler *handler)
 	if (error)
 		return error;
 
-	INIT_LIST_HEAD(&handler->h_list);
+	scoped_cond_guard(mutex_intr, return -EINTR, &input_mutex) {
+		INIT_LIST_HEAD(&handler->h_list);
 
-	error = mutex_lock_interruptible(&input_mutex);
-	if (error)
-		return error;
-
-	list_add_tail(&handler->node, &input_handler_list);
+		list_add_tail(&handler->node, &input_handler_list);
 
-	list_for_each_entry(dev, &input_dev_list, node)
-		input_attach_handler(dev, handler);
+		list_for_each_entry(dev, &input_dev_list, node)
+			input_attach_handler(dev, handler);
 
-	input_wakeup_procfs_readers();
+		input_wakeup_procfs_readers();
+	}
 
-	mutex_unlock(&input_mutex);
 	return 0;
 }
 EXPORT_SYMBOL(input_register_handler);
@@ -2588,7 +2521,7 @@ void input_unregister_handler(struct input_handler *handler)
 {
 	struct input_handle *handle, *next;
 
-	mutex_lock(&input_mutex);
+	guard(mutex)(&input_mutex);
 
 	list_for_each_entry_safe(handle, next, &handler->h_list, h_node)
 		handler->disconnect(handle);
@@ -2597,8 +2530,6 @@ void input_unregister_handler(struct input_handler *handler)
 	list_del_init(&handler->node);
 
 	input_wakeup_procfs_readers();
-
-	mutex_unlock(&input_mutex);
 }
 EXPORT_SYMBOL(input_unregister_handler);
 
@@ -2618,19 +2549,17 @@ int input_handler_for_each_handle(struct input_handler *handler, void *data,
 				  int (*fn)(struct input_handle *, void *))
 {
 	struct input_handle *handle;
-	int retval = 0;
+	int retval;
 
-	rcu_read_lock();
+	guard(rcu)();
 
 	list_for_each_entry_rcu(handle, &handler->h_list, h_node) {
 		retval = fn(handle, data);
 		if (retval)
-			break;
+			return retval;
 	}
 
-	rcu_read_unlock();
-
-	return retval;
+	return 0;
 }
 EXPORT_SYMBOL(input_handler_for_each_handle);
 
@@ -2718,27 +2647,22 @@ int input_register_handle(struct input_handle *handle)
 {
 	struct input_handler *handler = handle->handler;
 	struct input_dev *dev = handle->dev;
-	int error;
 
 	input_handle_setup_event_handler(handle);
 	/*
 	 * We take dev->mutex here to prevent race with
 	 * input_release_device().
 	 */
-	error = mutex_lock_interruptible(&dev->mutex);
-	if (error)
-		return error;
-
-	/*
-	 * Filters go to the head of the list, normal handlers
-	 * to the tail.
-	 */
-	if (handler->filter)
-		list_add_rcu(&handle->d_node, &dev->h_list);
-	else
-		list_add_tail_rcu(&handle->d_node, &dev->h_list);
-
-	mutex_unlock(&dev->mutex);
+	scoped_cond_guard(mutex_intr, return -EINTR, &dev->mutex) {
+		/*
+		 * Filters go to the head of the list, normal handlers
+		 * to the tail.
+		 */
+		if (handler->filter)
+			list_add_rcu(&handle->d_node, &dev->h_list);
+		else
+			list_add_tail_rcu(&handle->d_node, &dev->h_list);
+	}
 
 	/*
 	 * Since we are supposed to be called from ->connect()
@@ -2774,9 +2698,8 @@ void input_unregister_handle(struct input_handle *handle)
 	/*
 	 * Take dev->mutex to prevent race with input_release_device().
 	 */
-	mutex_lock(&dev->mutex);
-	list_del_rcu(&handle->d_node);
-	mutex_unlock(&dev->mutex);
+	scoped_guard(mutex, &dev->mutex)
+		list_del_rcu(&handle->d_node);
 
 	synchronize_rcu();
 }
-- 
2.47.0.277.g8800431eea-goog



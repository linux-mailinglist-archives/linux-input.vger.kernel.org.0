Return-Path: <linux-input+bounces-4982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA392EDC2
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 19:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F40B31C21D2A
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 17:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B0016EB6E;
	Thu, 11 Jul 2024 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi2ZbDAM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9312616E878;
	Thu, 11 Jul 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718857; cv=none; b=MoaqaNvihLja1s4EAnSH/Sz4nWKycTfjV+dBrTo3Ng5M+PRv3Bmqc2QVRhSoxEH3A2T0PC/YojAxsIL/f7nzUwXO40kxTZ4l7ubsXOFtD72cWGQi28X1Wd0rHnQcRM9dd8bHIgMNq1lU929EEuUkmmBHuc7ZAoc6jVDGYMwOUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718857; c=relaxed/simple;
	bh=vilKhUUp1F+MZIj0uO7zSq7oX8Zcara/icd/g4/7Kxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XR7Cxfoydk9t5RY7ndZdt5iPI8kzOVGaeqiPXEZP+ebwfQQrK4v/o1YZ/jY/bDMi5edX0zzBheRYC4AJfNeZhl1JKSQVuw2eLLR4zdaAlBxFsu4Lcu6YdN4YcjjEVxKVZD3znZjB9v5vu4UvAQSUa8vHf9OthYz+81rXLYz4BU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pi2ZbDAM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso7407575ad.2;
        Thu, 11 Jul 2024 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720718855; x=1721323655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4mDefsZgBQ378aN495JR7WYtld5yrNiQ6vTJoNaTSI=;
        b=Pi2ZbDAMWCSJVwnlG+UOXtIoDc/U14W97bnG+Me2vUXOWuIHHGcxS7I2qLNB9HYrCh
         hzFmvg+iMz8cmnRbcKjFodXSvXndtxCHEyBbD0kW+hGcObFnh/fyB4P4SNluuT/El7eM
         fS3yrFRopLOANHTX7++snBpTvYp646FKI4EbByb+JvMB492TLKcA7mfLezC/KUgqLcaY
         M1N8c/mSoL6YUB2JatHuX9QC8sxeC9awRsxag+yipfSyDogdstobUnS9ZOI782US1z/u
         ctFChaLkB6B6ZeQBG+Hp4cCX/MZWiivpbVqT8EIrxjZgr8+ig+j5MTVFoJt4AJrzkzxo
         G2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718855; x=1721323655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4mDefsZgBQ378aN495JR7WYtld5yrNiQ6vTJoNaTSI=;
        b=r/aNEUAp3YIRjekfDDLiQABuEkSIRDYgT/C2sb+5RCf6hndfVZMq5qUkc7xh23Dj4P
         81G9byYLMRqwvwHKNnGT5uiQxHYmd5eFUZghLGOOmGuToaCWQYB0KsacH+LgGLgkgzOv
         qyASYNh9mbr/9DFCWdXSWelqKXsvDFuFZfPThsAzYn2AkD29zVKXNX2K40fEYJC19hqJ
         RNcqUqqzziNCmuOmIjQIrIAAj+aLqSs/3wjKMjpWyxYBhf1e91aOJTet7OY6LSoRKpxZ
         XTfRAViKQ0dBjVHko5vJZ5sxCjNkhWdodtOd2r1AuqmpJyYnRq2M6MHenfo5YUEIxCQf
         VLnw==
X-Gm-Message-State: AOJu0YzzoAwzSG3r2kC7w7MTG1Xkl0Ptz1Yrd/lrmOsAURaJW79jbhAc
	ZCr3wBgngzohVy+1SGzbZBVdVJedAa4LTHoYBBSOqmpJi09picvqJordDQ==
X-Google-Smtp-Source: AGHT+IEMZS/+bfL3E/AK+mXvX5H71jbxTYFuRFI2y7uRAbgJRaA8A6XKdaeXhbn/oYqMPYMNzc8fBA==
X-Received: by 2002:a17:902:d646:b0:1fb:3d7:1cfc with SMTP id d9443c01a7336-1fbb6d03e06mr54400055ad.20.1720718854522;
        Thu, 11 Jul 2024 10:27:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac0c47sm52976845ad.192.2024.07.11.10.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:27:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] Input: tsc2004/5 - use guard notation when acquiring mutexes/locks
Date: Thu, 11 Jul 2024 10:27:17 -0700
Message-ID: <20240711172719.1248373-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
References: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc200x-core.c | 182 ++++++++++-------------
 1 file changed, 81 insertions(+), 101 deletions(-)

diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index 90a4ace22395..df39dee13e1c 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -136,7 +136,6 @@ static void tsc200x_update_pen_state(struct tsc200x *ts,
 static irqreturn_t tsc200x_irq_thread(int irq, void *_ts)
 {
 	struct tsc200x *ts = _ts;
-	unsigned long flags;
 	unsigned int pressure;
 	struct tsc200x_data tsdata;
 	int error;
@@ -182,13 +181,11 @@ static irqreturn_t tsc200x_irq_thread(int irq, void *_ts)
 	if (unlikely(pressure > MAX_12BIT))
 		goto out;
 
-	spin_lock_irqsave(&ts->lock, flags);
-
-	tsc200x_update_pen_state(ts, tsdata.x, tsdata.y, pressure);
-	mod_timer(&ts->penup_timer,
-		  jiffies + msecs_to_jiffies(TSC200X_PENUP_TIME_MS));
-
-	spin_unlock_irqrestore(&ts->lock, flags);
+	scoped_guard(spinlock_irqsave, &ts->lock) {
+		tsc200x_update_pen_state(ts, tsdata.x, tsdata.y, pressure);
+		mod_timer(&ts->penup_timer,
+			  jiffies + msecs_to_jiffies(TSC200X_PENUP_TIME_MS));
+	}
 
 	ts->last_valid_interrupt = jiffies;
 out:
@@ -198,11 +195,9 @@ static irqreturn_t tsc200x_irq_thread(int irq, void *_ts)
 static void tsc200x_penup_timer(struct timer_list *t)
 {
 	struct tsc200x *ts = from_timer(ts, t, penup_timer);
-	unsigned long flags;
 
-	spin_lock_irqsave(&ts->lock, flags);
+	guard(spinlock_irqsave)(&ts->lock);
 	tsc200x_update_pen_state(ts, 0, 0, 0);
-	spin_unlock_irqrestore(&ts->lock, flags);
 }
 
 static void tsc200x_start_scan(struct tsc200x *ts)
@@ -232,12 +227,10 @@ static void __tsc200x_disable(struct tsc200x *ts)
 {
 	tsc200x_stop_scan(ts);
 
-	disable_irq(ts->irq);
-	del_timer_sync(&ts->penup_timer);
+	guard(disable_irq)(&ts->irq);
 
+	del_timer_sync(&ts->penup_timer);
 	cancel_delayed_work_sync(&ts->esd_work);
-
-	enable_irq(ts->irq);
 }
 
 /* must be called with ts->mutex held */
@@ -253,80 +246,79 @@ static void __tsc200x_enable(struct tsc200x *ts)
 	}
 }
 
-static ssize_t tsc200x_selftest_show(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf)
+/*
+ * Test TSC200X communications via temp high register.
+ */
+static int tsc200x_do_selftest(struct tsc200x *ts)
 {
-	struct tsc200x *ts = dev_get_drvdata(dev);
-	unsigned int temp_high;
 	unsigned int temp_high_orig;
 	unsigned int temp_high_test;
-	bool success = true;
+	unsigned int temp_high;
 	int error;
 
-	mutex_lock(&ts->mutex);
-
-	/*
-	 * Test TSC200X communications via temp high register.
-	 */
-	__tsc200x_disable(ts);
-
 	error = regmap_read(ts->regmap, TSC200X_REG_TEMP_HIGH, &temp_high_orig);
 	if (error) {
-		dev_warn(dev, "selftest failed: read error %d\n", error);
-		success = false;
-		goto out;
+		dev_warn(ts->dev, "selftest failed: read error %d\n", error);
+		return error;
 	}
 
 	temp_high_test = (temp_high_orig - 1) & MAX_12BIT;
 
 	error = regmap_write(ts->regmap, TSC200X_REG_TEMP_HIGH, temp_high_test);
 	if (error) {
-		dev_warn(dev, "selftest failed: write error %d\n", error);
-		success = false;
-		goto out;
+		dev_warn(ts->dev, "selftest failed: write error %d\n", error);
+		return error;
 	}
 
 	error = regmap_read(ts->regmap, TSC200X_REG_TEMP_HIGH, &temp_high);
 	if (error) {
-		dev_warn(dev, "selftest failed: read error %d after write\n",
-			 error);
-		success = false;
-		goto out;
-	}
-
-	if (temp_high != temp_high_test) {
-		dev_warn(dev, "selftest failed: %d != %d\n",
-			 temp_high, temp_high_test);
-		success = false;
+		dev_warn(ts->dev,
+			 "selftest failed: read error %d after write\n", error);
+		return error;
 	}
 
 	/* hardware reset */
 	tsc200x_reset(ts);
 
-	if (!success)
-		goto out;
+	if (temp_high != temp_high_test) {
+		dev_warn(ts->dev, "selftest failed: %d != %d\n",
+			 temp_high, temp_high_test);
+		return -EINVAL;
+	}
 
 	/* test that the reset really happened */
 	error = regmap_read(ts->regmap, TSC200X_REG_TEMP_HIGH, &temp_high);
 	if (error) {
-		dev_warn(dev, "selftest failed: read error %d after reset\n",
-			 error);
-		success = false;
-		goto out;
+		dev_warn(ts->dev,
+			 "selftest failed: read error %d after reset\n", error);
+		return error;
 	}
 
 	if (temp_high != temp_high_orig) {
-		dev_warn(dev, "selftest failed after reset: %d != %d\n",
+		dev_warn(ts->dev, "selftest failed after reset: %d != %d\n",
 			 temp_high, temp_high_orig);
-		success = false;
+		return -EINVAL;
 	}
 
-out:
-	__tsc200x_enable(ts);
-	mutex_unlock(&ts->mutex);
+	return 0;
+}
 
-	return sprintf(buf, "%d\n", success);
+static ssize_t tsc200x_selftest_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct tsc200x *ts = dev_get_drvdata(dev);
+	int error;
+
+	scoped_guard(mutex, &ts->mutex) {
+		__tsc200x_disable(ts);
+
+		error = tsc200x_do_selftest(ts);
+
+		__tsc200x_enable(ts);
+	}
+
+	return sprintf(buf, "%d\n", !error);
 }
 
 static DEVICE_ATTR(selftest, S_IRUGO, tsc200x_selftest_show, NULL);
@@ -368,46 +360,42 @@ static void tsc200x_esd_work(struct work_struct *work)
 	int error;
 	unsigned int r;
 
-	if (!mutex_trylock(&ts->mutex)) {
-		/*
-		 * If the mutex is taken, it means that disable or enable is in
-		 * progress. In that case just reschedule the work. If the work
-		 * is not needed, it will be canceled by disable.
-		 */
-		goto reschedule;
-	}
-
-	if (time_is_after_jiffies(ts->last_valid_interrupt +
-				  msecs_to_jiffies(ts->esd_timeout)))
-		goto out;
-
-	/* We should be able to read register without disabling interrupts. */
-	error = regmap_read(ts->regmap, TSC200X_REG_CFR0, &r);
-	if (!error &&
-	    !((r ^ TSC200X_CFR0_INITVALUE) & TSC200X_CFR0_RW_MASK)) {
-		goto out;
-	}
-
 	/*
-	 * If we could not read our known value from configuration register 0
-	 * then we should reset the controller as if from power-up and start
-	 * scanning again.
+	 * If the mutex is taken, it means that disable or enable is in
+	 * progress. In that case just reschedule the work. If the work
+	 * is not needed, it will be canceled by disable.
 	 */
-	dev_info(ts->dev, "TSC200X not responding - resetting\n");
+	scoped_guard(mutex_try, &ts->mutex) {
+		if (time_is_after_jiffies(ts->last_valid_interrupt +
+					  msecs_to_jiffies(ts->esd_timeout)))
+			break;
 
-	disable_irq(ts->irq);
-	del_timer_sync(&ts->penup_timer);
+		/*
+		 * We should be able to read register without disabling
+		 * interrupts.
+		 */
+		error = regmap_read(ts->regmap, TSC200X_REG_CFR0, &r);
+		if (!error &&
+		    !((r ^ TSC200X_CFR0_INITVALUE) & TSC200X_CFR0_RW_MASK)) {
+			break;
+		}
 
-	tsc200x_update_pen_state(ts, 0, 0, 0);
+		/*
+		 * If we could not read our known value from configuration
+		 * register 0 then we should reset the controller as if from
+		 * power-up and start scanning again.
+		 */
+		dev_info(ts->dev, "TSC200X not responding - resetting\n");
 
-	tsc200x_reset(ts);
+		scoped_guard(disable_irq, &ts->irq) {
+			del_timer_sync(&ts->penup_timer);
+			tsc200x_update_pen_state(ts, 0, 0, 0);
+			tsc200x_reset(ts);
+		}
 
-	enable_irq(ts->irq);
-	tsc200x_start_scan(ts);
+		tsc200x_start_scan(ts);
+	}
 
-out:
-	mutex_unlock(&ts->mutex);
-reschedule:
 	/* re-arm the watchdog */
 	schedule_delayed_work(&ts->esd_work,
 			      round_jiffies_relative(
@@ -418,15 +406,13 @@ static int tsc200x_open(struct input_dev *input)
 {
 	struct tsc200x *ts = input_get_drvdata(input);
 
-	mutex_lock(&ts->mutex);
+	guard(mutex)(&ts->mutex);
 
 	if (!ts->suspended)
 		__tsc200x_enable(ts);
 
 	ts->opened = true;
 
-	mutex_unlock(&ts->mutex);
-
 	return 0;
 }
 
@@ -434,14 +420,12 @@ static void tsc200x_close(struct input_dev *input)
 {
 	struct tsc200x *ts = input_get_drvdata(input);
 
-	mutex_lock(&ts->mutex);
+	guard(mutex)(&ts->mutex);
 
 	if (!ts->suspended)
 		__tsc200x_disable(ts);
 
 	ts->opened = false;
-
-	mutex_unlock(&ts->mutex);
 }
 
 int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
@@ -573,7 +557,7 @@ static int tsc200x_suspend(struct device *dev)
 {
 	struct tsc200x *ts = dev_get_drvdata(dev);
 
-	mutex_lock(&ts->mutex);
+	guard(mutex)(&ts->mutex);
 
 	if (!ts->suspended && ts->opened)
 		__tsc200x_disable(ts);
@@ -583,8 +567,6 @@ static int tsc200x_suspend(struct device *dev)
 	if (device_may_wakeup(dev))
 		ts->wake_irq_enabled = enable_irq_wake(ts->irq) == 0;
 
-	mutex_unlock(&ts->mutex);
-
 	return 0;
 }
 
@@ -592,7 +574,7 @@ static int tsc200x_resume(struct device *dev)
 {
 	struct tsc200x *ts = dev_get_drvdata(dev);
 
-	mutex_lock(&ts->mutex);
+	guard(mutex)(&ts->mutex);
 
 	if (ts->wake_irq_enabled) {
 		disable_irq_wake(ts->irq);
@@ -604,8 +586,6 @@ static int tsc200x_resume(struct device *dev)
 
 	ts->suspended = false;
 
-	mutex_unlock(&ts->mutex);
-
 	return 0;
 }
 
-- 
2.45.2.993.g49e7a77208-goog



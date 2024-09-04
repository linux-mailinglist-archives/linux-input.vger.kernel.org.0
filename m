Return-Path: <linux-input+bounces-6132-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29C96AFED
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E876E286CBC
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF3E84A21;
	Wed,  4 Sep 2024 04:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/b1ghwm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D1681749;
	Wed,  4 Sep 2024 04:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424984; cv=none; b=uGaqOH48gy9Y5AuC5HU6M4KPq33/G+W3IkYieDr19eKOCHUBKLWV2jgujBkn5SM3W3wWOjRrFBonRJcdCy+aXL2YU7zVdsX0SeY7VcanMPgZ5BpCIAeRdw59T8y+XDuKz5BHfeZ7Jj1keCSfg+tYdh3NvK+QUZsLzMNwHSms8/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424984; c=relaxed/simple;
	bh=qfvlCrBeuMgTvWKCSq3+kjGo3PjVwBhBNztu9yeU170=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZojKgbGxkkTNRJBIB5TX8dU6jPvwm1MrbfIEtmh6xYO/zbMRphfgoCiKkUcqmpWG0YLH2dfLX10U9q0TMcgL1lU4K915CrSEELGuwym72s6nza+KpAHpWoc2uxOrCQZ2Vh2ycpStY4/Nntq+4NhPybumO1Qwrckk2sEUnxejKmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/b1ghwm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20693995f68so3055075ad.1;
        Tue, 03 Sep 2024 21:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424982; x=1726029782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JojHCZ9pdFR3fnOlIkAMjYzH0C7qL1RERgC3ObqXljU=;
        b=m/b1ghwmmUMY8kGNfe2tQWE6PHBZfjjnM09PbTNL2M/ncvoUiLYcl7R4oEMZEpFjdA
         VvGbjH0ti73pQV0KNW1nqPQebzzta2rKvapRCxn6e+t62eoc1SBUpWKNrffObat4DtCS
         1s0ub8w/e631gJ2Qa5nGPZQEinLapOeWcHpYdhZKR4vHAAsf3/Ln0KP6LtcDoR1f3PmR
         ZuTLY6PS8kEa+w2ErqCp4Uv7sKlP4o3ZXhLRoZMBfVIzQekeDiZASdliaG0j9ac9PAIT
         Of6x8D3edaFAvazSIqmZ6P/2ObqOb+yB/IH6QBUJ61inNqUcmS3S7V2cpS5LGqfKurht
         ERaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424982; x=1726029782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JojHCZ9pdFR3fnOlIkAMjYzH0C7qL1RERgC3ObqXljU=;
        b=svxGiQTu9FNKu75QrY0LkWhZSfO7eY3Slqh8pm0RL7fF7cGZyRN9U9foWkWcCSHVTM
         BGRBCuJabjkRQoY88UH3b+rRF7FwVIgwmoJ1wgfm+djp6EDzG0/TDY9ZqCcPRWzx5DwW
         IbqBD1IKjPvdfgMRXaa869H5i+v1osLibiev03Cx1xi2veuZvpP6Vbk9IsVfyHd+fpev
         l20CYnwf+2nVQUh2/KBx8sCfTToBNbwJdIP9UjMCcY6wfJu0upxGZgjVUp5zo8ehn5mz
         izvo6UI15fU+AE+I/s5gY8Y9A/PYeTYzJL/Yw16YTvetfhqE5XeqAdFGR+8XDOl7bMNL
         ai8w==
X-Forwarded-Encrypted: i=1; AJvYcCX0FYCll0Y2RmrkZq1GabVdD80Gds66R4IyZ9KtqSefD86cwStB9JarGQm4KAgEQdO40XJiNwrWAt3+Wl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2XsPV0GN/LFnLfyJzIFiyeImNCp61jp1dLPbp7TvZS3i+LrQ
	KgBu5sStZ40X66ZAIDlxzSDg9bVdnq70G+FjQnAlovG/aEPT+izBTgzvLw==
X-Google-Smtp-Source: AGHT+IGOFFEns1wNokErTakojm3rlnCIKY69vUPMATabICZ8Hi+3xBILYaG/Vcr0BBQXHQu1oMKz/Q==
X-Received: by 2002:a17:902:e852:b0:206:94f5:c2e6 with SMTP id d9443c01a7336-20694f5c61amr49940535ad.7.1725424982220;
        Tue, 03 Sep 2024 21:43:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/22] Input: cm109 - use guard notation when acquiring mutex and spinlock
Date: Tue,  3 Sep 2024 21:42:23 -0700
Message-ID: <20240904044244.1042174-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/cm109.c | 167 ++++++++++++++++++-------------------
 1 file changed, 79 insertions(+), 88 deletions(-)

diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index 728325a2d574..0cfe5d4a573c 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -355,6 +355,35 @@ static void cm109_submit_buzz_toggle(struct cm109_dev *dev)
 			__func__, error);
 }
 
+static void cm109_submit_ctl(struct cm109_dev *dev)
+{
+	int error;
+
+	guard(spinlock_irqsave)(&dev->ctl_submit_lock);
+
+	dev->irq_urb_pending = 0;
+
+	if (unlikely(dev->shutdown))
+		return;
+
+	if (dev->buzzer_state)
+		dev->ctl_data->byte[HID_OR0] |= BUZZER_ON;
+	else
+		dev->ctl_data->byte[HID_OR0] &= ~BUZZER_ON;
+
+	dev->ctl_data->byte[HID_OR1] = dev->keybit;
+	dev->ctl_data->byte[HID_OR2] = dev->keybit;
+
+	dev->buzzer_pending = 0;
+	dev->ctl_urb_pending = 1;
+
+	error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
+	if (error)
+		dev_err(&dev->intf->dev,
+			"%s: usb_submit_urb (urb_ctl) failed %d\n",
+			__func__, error);
+}
+
 /*
  * IRQ handler
  */
@@ -362,8 +391,6 @@ static void cm109_urb_irq_callback(struct urb *urb)
 {
 	struct cm109_dev *dev = urb->context;
 	const int status = urb->status;
-	int error;
-	unsigned long flags;
 
 	dev_dbg(&dev->intf->dev, "### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x\n",
 	     dev->irq_data->byte[0],
@@ -401,32 +428,7 @@ static void cm109_urb_irq_callback(struct urb *urb)
 	}
 
  out:
-
-	spin_lock_irqsave(&dev->ctl_submit_lock, flags);
-
-	dev->irq_urb_pending = 0;
-
-	if (likely(!dev->shutdown)) {
-
-		if (dev->buzzer_state)
-			dev->ctl_data->byte[HID_OR0] |= BUZZER_ON;
-		else
-			dev->ctl_data->byte[HID_OR0] &= ~BUZZER_ON;
-
-		dev->ctl_data->byte[HID_OR1] = dev->keybit;
-		dev->ctl_data->byte[HID_OR2] = dev->keybit;
-
-		dev->buzzer_pending = 0;
-		dev->ctl_urb_pending = 1;
-
-		error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
-		if (error)
-			dev_err(&dev->intf->dev,
-				"%s: usb_submit_urb (urb_ctl) failed %d\n",
-				__func__, error);
-	}
-
-	spin_unlock_irqrestore(&dev->ctl_submit_lock, flags);
+	cm109_submit_ctl(dev);
 }
 
 static void cm109_urb_ctl_callback(struct urb *urb)
@@ -434,7 +436,6 @@ static void cm109_urb_ctl_callback(struct urb *urb)
 	struct cm109_dev *dev = urb->context;
 	const int status = urb->status;
 	int error;
-	unsigned long flags;
 
 	dev_dbg(&dev->intf->dev, "### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]\n",
 	     dev->ctl_data->byte[0],
@@ -449,35 +450,31 @@ static void cm109_urb_ctl_callback(struct urb *urb)
 				    __func__, status);
 	}
 
-	spin_lock_irqsave(&dev->ctl_submit_lock, flags);
+	guard(spinlock_irqsave)(&dev->ctl_submit_lock);
 
 	dev->ctl_urb_pending = 0;
 
-	if (likely(!dev->shutdown)) {
-
-		if (dev->buzzer_pending || status) {
-			dev->buzzer_pending = 0;
-			dev->ctl_urb_pending = 1;
-			cm109_submit_buzz_toggle(dev);
-		} else if (likely(!dev->irq_urb_pending)) {
-			/* ask for key data */
-			dev->irq_urb_pending = 1;
-			error = usb_submit_urb(dev->urb_irq, GFP_ATOMIC);
-			if (error)
-				dev_err(&dev->intf->dev,
-					"%s: usb_submit_urb (urb_irq) failed %d\n",
-					__func__, error);
-		}
-	}
+	if (unlikely(dev->shutdown))
+		return;
 
-	spin_unlock_irqrestore(&dev->ctl_submit_lock, flags);
+	if (dev->buzzer_pending || status) {
+		dev->buzzer_pending = 0;
+		dev->ctl_urb_pending = 1;
+		cm109_submit_buzz_toggle(dev);
+	} else if (likely(!dev->irq_urb_pending)) {
+		/* ask for key data */
+		dev->irq_urb_pending = 1;
+		error = usb_submit_urb(dev->urb_irq, GFP_ATOMIC);
+		if (error)
+			dev_err(&dev->intf->dev,
+				"%s: usb_submit_urb (urb_irq) failed %d\n",
+				__func__, error);
+	}
 }
 
 static void cm109_toggle_buzzer_async(struct cm109_dev *dev)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->ctl_submit_lock, flags);
+	guard(spinlock_irqsave)(&dev->ctl_submit_lock);
 
 	if (dev->ctl_urb_pending) {
 		/* URB completion will resubmit */
@@ -486,8 +483,6 @@ static void cm109_toggle_buzzer_async(struct cm109_dev *dev)
 		dev->ctl_urb_pending = 1;
 		cm109_submit_buzz_toggle(dev);
 	}
-
-	spin_unlock_irqrestore(&dev->ctl_submit_lock, flags);
 }
 
 static void cm109_toggle_buzzer_sync(struct cm109_dev *dev, int on)
@@ -556,32 +551,30 @@ static int cm109_input_open(struct input_dev *idev)
 		return error;
 	}
 
-	mutex_lock(&dev->pm_mutex);
-
-	dev->buzzer_state = 0;
-	dev->key_code = -1;	/* no keys pressed */
-	dev->keybit = 0xf;
+	scoped_guard(mutex, &dev->pm_mutex) {
+		dev->buzzer_state = 0;
+		dev->key_code = -1;	/* no keys pressed */
+		dev->keybit = 0xf;
 
-	/* issue INIT */
-	dev->ctl_data->byte[HID_OR0] = HID_OR_GPO_BUZ_SPDIF;
-	dev->ctl_data->byte[HID_OR1] = dev->keybit;
-	dev->ctl_data->byte[HID_OR2] = dev->keybit;
-	dev->ctl_data->byte[HID_OR3] = 0x00;
+		/* issue INIT */
+		dev->ctl_data->byte[HID_OR0] = HID_OR_GPO_BUZ_SPDIF;
+		dev->ctl_data->byte[HID_OR1] = dev->keybit;
+		dev->ctl_data->byte[HID_OR2] = dev->keybit;
+		dev->ctl_data->byte[HID_OR3] = 0x00;
 
-	dev->ctl_urb_pending = 1;
-	error = usb_submit_urb(dev->urb_ctl, GFP_KERNEL);
-	if (error) {
-		dev->ctl_urb_pending = 0;
-		dev_err(&dev->intf->dev, "%s: usb_submit_urb (urb_ctl) failed %d\n",
-			__func__, error);
-	} else {
-		dev->open = 1;
+		dev->ctl_urb_pending = 1;
+		error = usb_submit_urb(dev->urb_ctl, GFP_KERNEL);
+		if (!error) {
+			dev->open = 1;
+			return 0;
+		}
 	}
 
-	mutex_unlock(&dev->pm_mutex);
+	dev->ctl_urb_pending = 0;
+	usb_autopm_put_interface(dev->intf);
 
-	if (error)
-		usb_autopm_put_interface(dev->intf);
+	dev_err(&dev->intf->dev, "%s: usb_submit_urb (urb_ctl) failed %d\n",
+		__func__, error);
 
 	return error;
 }
@@ -590,17 +583,15 @@ static void cm109_input_close(struct input_dev *idev)
 {
 	struct cm109_dev *dev = input_get_drvdata(idev);
 
-	mutex_lock(&dev->pm_mutex);
-
-	/*
-	 * Once we are here event delivery is stopped so we
-	 * don't need to worry about someone starting buzzer
-	 * again
-	 */
-	cm109_stop_traffic(dev);
-	dev->open = 0;
-
-	mutex_unlock(&dev->pm_mutex);
+	scoped_guard(mutex, &dev->pm_mutex) {
+		/*
+		 * Once we are here event delivery is stopped so we
+		 * don't need to worry about someone starting buzzer
+		 * again
+		 */
+		cm109_stop_traffic(dev);
+		dev->open = 0;
+	}
 
 	usb_autopm_put_interface(dev->intf);
 }
@@ -823,9 +814,9 @@ static int cm109_usb_suspend(struct usb_interface *intf, pm_message_t message)
 
 	dev_info(&intf->dev, "cm109: usb_suspend (event=%d)\n", message.event);
 
-	mutex_lock(&dev->pm_mutex);
+	guard(mutex)(&dev->pm_mutex);
+
 	cm109_stop_traffic(dev);
-	mutex_unlock(&dev->pm_mutex);
 
 	return 0;
 }
@@ -836,9 +827,9 @@ static int cm109_usb_resume(struct usb_interface *intf)
 
 	dev_info(&intf->dev, "cm109: usb_resume\n");
 
-	mutex_lock(&dev->pm_mutex);
+	guard(mutex)(&dev->pm_mutex);
+
 	cm109_restore_state(dev);
-	mutex_unlock(&dev->pm_mutex);
 
 	return 0;
 }
-- 
2.46.0.469.g59c65b2a67-goog



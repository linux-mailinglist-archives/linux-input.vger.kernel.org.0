Return-Path: <linux-input+bounces-6147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9252D96B01D
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB072866BA
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A6281751;
	Wed,  4 Sep 2024 04:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpEzmcG5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5142882486;
	Wed,  4 Sep 2024 04:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425329; cv=none; b=tXD5dURA/cCzdcDI+jZbfU29tL5Bhf4fcPLrcG9XWOBOSu65wCq1n7aLow7sIXLjl5U//xhS4QqMHMtV/cWhNUF25fdJCISLWhSW2/bUMVsK2NPBLFQs+IAL6v2Owc2FOCFN0v4cP87cOD0qRSrLbb0O2AsKnZSpHf7/EQyYs3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425329; c=relaxed/simple;
	bh=qYXli+rMDzDdxksshgRO0eamRjvRQceGJSKtyCxtcoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRGGC4WNW+nhVUStq6BFfulbqaBFucMqRnIiUOAXSVKIvl65hVzoTLwtvdCLnKOVT19Ue4rtdDtWTMMsmIpEs3FbQ3cIwCWB84mitM+1mqd0jatI6bDHYERaR1nxGc/X/Qshn3btSns/aVrmYGYHlgxdPqdGmUYig/yvY9Eo+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpEzmcG5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20696938f86so12097875ad.3;
        Tue, 03 Sep 2024 21:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425327; x=1726030127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5yyqOr6cGCL7nTVS+XsLNq9IrclibEZcZLI/ZlueT8=;
        b=cpEzmcG5rBiSoBEjk7mdoHP3IeXXbCq2dq/n+TQPA8KyYwvrfuq1shT3pINhGpt7Fc
         KOyNOkvJgX+QR7iGSH0EevHFjJ/EmIBGaON3grEj9IpMMYxpNNrTiBRa2P8PUbA30IfT
         isR/dAwAe/9q/VoM/7tFYNPgH03Ta9DVJWDtuk87/cWVGQxoSHCxvkIMagV9nGw6cQ7A
         uC/N0p41Q5EBlor6fGjptZMH5lbJlfeaHWYtMn5Lye5o7uiiUHyNsnbIgKYsyjW/GWjv
         9pFRajsj3roWw2woEOrHsPBooJ3qiivRV65cGmKwuhBWPJ2BVowhQJ0K1sPxcrxWftda
         lLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425327; x=1726030127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5yyqOr6cGCL7nTVS+XsLNq9IrclibEZcZLI/ZlueT8=;
        b=BJ0AVyi9eAYN3hRDCHL1j/FzjlHOSgqSFlvM3F9IaOYsvTev38E6/fcu9y2BjTSST2
         PLWNcP1OaRT4OF2t5+rrCm0iO2rjLrS1R8uB7+/SW2PpAj/SgfT6WYtn0euGPp7Zl4eJ
         /Y74fKaqKS3IUSG/31FeHSVrczrf+nod7ofOam23fqcLQKsxOilBxZ7adHRNCqIRwtib
         26L9rWrs1p+Wz/0BVd1IRIporHOA8jxdL2UXdJBdE50mfPV3lNDM1dPseuYtgYROAbeg
         XSKJd8CXGvWWSRMwB5c4sSV18RNI44prUkNnhIiKkagSmy2668slhQ03wmZiZm4yn2lE
         rgCw==
X-Forwarded-Encrypted: i=1; AJvYcCWCsIs9TFeFioyw1r5+SBS8UG/Q9ffw3ZSiYbHrMi0GouGT5+4fyDjdwPeO/b5bkcVmoYie/kvg9daLqpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOMUBFT/WbBzgT7Byhuvx3Yk1+0BdQP/8uS1VgVbzLQF7Nvda
	Ffbx7mxgI+jg0lurIu2HU11F/hHvRV0h0x/jDUhHIELwCo0G0qlrIrQ1+w==
X-Google-Smtp-Source: AGHT+IGtfLzPi3XmtSZZfqjZoloiJmZZ2HyIixI1FkpsrYzpRUo8YsaJMsNneqbi1+dpPdkyXlsPFw==
X-Received: by 2002:a17:902:f650:b0:206:88fa:54a6 with SMTP id d9443c01a7336-20688fa580emr59269835ad.21.1725425327293;
        Tue, 03 Sep 2024 21:48:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea56918sm5652615ad.218.2024.09.03.21.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:48:47 -0700 (PDT)
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
Subject: [PATCH 17/22] Input: pegasus_notetaker - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:48:41 -0700
Message-ID: <20240904044842.1048638-1-dmitry.torokhov@gmail.com>
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
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/tablet/pegasus_notetaker.c | 86 +++++++++++++-----------
 1 file changed, 48 insertions(+), 38 deletions(-)

diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index a68da2988f9c..e1dc8365bfe9 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -214,6 +214,28 @@ static void pegasus_init(struct work_struct *work)
 			error);
 }
 
+static int __pegasus_open(struct pegasus *pegasus)
+{
+	int error;
+
+	guard(mutex)(&pegasus->pm_mutex);
+
+	pegasus->irq->dev = pegasus->usbdev;
+	if (usb_submit_urb(pegasus->irq, GFP_KERNEL))
+		return -EIO;
+
+	error = pegasus_set_mode(pegasus, PEN_MODE_XY, NOTETAKER_LED_MOUSE);
+	if (error) {
+		usb_kill_urb(pegasus->irq);
+		cancel_work_sync(&pegasus->init);
+		return error;
+	}
+
+	pegasus->is_open = true;
+	return 0;
+}
+
+
 static int pegasus_open(struct input_dev *dev)
 {
 	struct pegasus *pegasus = input_get_drvdata(dev);
@@ -223,39 +245,25 @@ static int pegasus_open(struct input_dev *dev)
 	if (error)
 		return error;
 
-	mutex_lock(&pegasus->pm_mutex);
-	pegasus->irq->dev = pegasus->usbdev;
-	if (usb_submit_urb(pegasus->irq, GFP_KERNEL)) {
-		error = -EIO;
-		goto err_autopm_put;
+	error = __pegasus_open(pegasus);
+	if (error) {
+		usb_autopm_put_interface(pegasus->intf);
+		return error;
 	}
 
-	error = pegasus_set_mode(pegasus, PEN_MODE_XY, NOTETAKER_LED_MOUSE);
-	if (error)
-		goto err_kill_urb;
-
-	pegasus->is_open = true;
-	mutex_unlock(&pegasus->pm_mutex);
 	return 0;
-
-err_kill_urb:
-	usb_kill_urb(pegasus->irq);
-	cancel_work_sync(&pegasus->init);
-err_autopm_put:
-	mutex_unlock(&pegasus->pm_mutex);
-	usb_autopm_put_interface(pegasus->intf);
-	return error;
 }
 
 static void pegasus_close(struct input_dev *dev)
 {
 	struct pegasus *pegasus = input_get_drvdata(dev);
 
-	mutex_lock(&pegasus->pm_mutex);
-	usb_kill_urb(pegasus->irq);
-	cancel_work_sync(&pegasus->init);
-	pegasus->is_open = false;
-	mutex_unlock(&pegasus->pm_mutex);
+	scoped_guard(mutex, &pegasus->pm_mutex) {
+		usb_kill_urb(pegasus->irq);
+		cancel_work_sync(&pegasus->init);
+
+		pegasus->is_open = false;
+	}
 
 	usb_autopm_put_interface(pegasus->intf);
 }
@@ -411,10 +419,10 @@ static int pegasus_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct pegasus *pegasus = usb_get_intfdata(intf);
 
-	mutex_lock(&pegasus->pm_mutex);
+	guard(mutex)(&pegasus->pm_mutex);
+
 	usb_kill_urb(pegasus->irq);
 	cancel_work_sync(&pegasus->init);
-	mutex_unlock(&pegasus->pm_mutex);
 
 	return 0;
 }
@@ -422,31 +430,33 @@ static int pegasus_suspend(struct usb_interface *intf, pm_message_t message)
 static int pegasus_resume(struct usb_interface *intf)
 {
 	struct pegasus *pegasus = usb_get_intfdata(intf);
-	int retval = 0;
 
-	mutex_lock(&pegasus->pm_mutex);
+	guard(mutex)(&pegasus->pm_mutex);
+
 	if (pegasus->is_open && usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
-		retval = -EIO;
-	mutex_unlock(&pegasus->pm_mutex);
+		return -EIO;
 
-	return retval;
+	return 0;
 }
 
 static int pegasus_reset_resume(struct usb_interface *intf)
 {
 	struct pegasus *pegasus = usb_get_intfdata(intf);
-	int retval = 0;
+	int error;
+
+	guard(mutex)(&pegasus->pm_mutex);
 
-	mutex_lock(&pegasus->pm_mutex);
 	if (pegasus->is_open) {
-		retval = pegasus_set_mode(pegasus, PEN_MODE_XY,
+		error = pegasus_set_mode(pegasus, PEN_MODE_XY,
 					  NOTETAKER_LED_MOUSE);
-		if (!retval && usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
-			retval = -EIO;
+		if (error)
+			return error;
+
+		if (usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
+			return -EIO;
 	}
-	mutex_unlock(&pegasus->pm_mutex);
 
-	return retval;
+	return 0;
 }
 
 static const struct usb_device_id pegasus_ids[] = {
-- 
2.46.0.469.g59c65b2a67-goog



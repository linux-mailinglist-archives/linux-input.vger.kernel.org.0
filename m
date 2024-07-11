Return-Path: <linux-input+bounces-4958-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA192DF45
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 07:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F877284385
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 05:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB88620312;
	Thu, 11 Jul 2024 05:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU6ubHW4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6D2882B;
	Thu, 11 Jul 2024 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720674215; cv=none; b=DtVic/BDTysuPKuZs5Eur1Q6ZU0uVOwS1b+PjAJrL/95HzypaBNPWtSFrYxtNUmZxqfaWzCh2cWbEYj5LvEjshSrT02JEFzesv5+FeKpg1bpdx4Qsar6r7dyuXcJXT2o4Mze+Cpr4P2oLa9OpyulyrUA8z2+6zLjmOdlmETR9s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720674215; c=relaxed/simple;
	bh=vnJAXZTDkOXrqHQXaMRAQwfmz535qk1IJMT8KGUzkrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlsxAIuR1xkDc/GzQ1jWoPdLG7jp3vUco4/fruff9XSdh2B7ud/DqzUDxYq7NLtdn8JTwALfLpA1AsX1Z4Y7sJdrVGfT9FTqlxjz1NN8Mqs1JEuMTBNsn5iALmxfEQBM6DG16rI6wILNcW6SdRR2MbxpHlcyw1YXZAJWxcUvcVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU6ubHW4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb05b0be01so2790075ad.2;
        Wed, 10 Jul 2024 22:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720674213; x=1721279013; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsmgzrrQnEcsHkBwihVFrsoxGl5qjoJzf1cJOX7ODA8=;
        b=LU6ubHW43NX0ldnT+z2Slp0urD/7gosU9R/Uu07w4T+KeTMsmqevHFvh8uyXrD+p02
         46bskjySB89NiC6kXQjzzNjJF363Q5cFs4kr0ugG4kx7mJn0mHFsFS3LgbKJtnkynPrc
         QB/Q24AKRBwAkZVUbY9gBZVleWQ/49+aGwGQOf9ThYp4SnjJoSxImgiJorR0+MXspLbT
         Ofcc+Ano3jDDqxLl1UgsvmzZbYSbP3aAGmu/8ERDSiWcg4G7T+hMRwicIoe3khdkv3iZ
         fNdKyjGgGGnYpAw9rc32jwzK6ZI8gGTjYi6sjUYfqguqeWhNncfgFnB/quqVQEg4Snx0
         6H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720674213; x=1721279013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsmgzrrQnEcsHkBwihVFrsoxGl5qjoJzf1cJOX7ODA8=;
        b=MrTMZk0F9tI7yBhQ/q8Omx8jfbGR69rM5ohwxR7lOjb/c0XUHLZKDhLi1WKTL7G24v
         d9rQvYIvjc3YGRN6HEa2adGSptqGZsI+N0FIXh6g72gOntVO97Am0XR9bl94Q+/I4tIF
         9tRg/5IIThJaIJ9iy5+Wm9Opae5qiTanDbko/OsREevPNgEkZg+dyQdQWKokNR6BmQMi
         fQKQmf99QF7bgbFUV2725mrrZFViAkd7H1bi3SuPx3vpoF9n4AYjQ5xtxC3IwkVzMCIq
         O4TBEvy+ZxAxDa3kfp+A3HY3VKSlvOq5/Akw7xFCA+h5rGsMyihn6P+jrFSSrRaoypjb
         LwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQoqP4RtYO8blp76JD8tb/7DjV9Fuw59L7h3r5N69EwM7OaxKLW3eimrd2FRvtLg9qYymnxcY6HtfITMwLhSaRBHB+1n0l0SvZOHIc
X-Gm-Message-State: AOJu0YzrDKKw1lNC5HbOMD3Ys7Vc8Lp5k5g0OSJvDtMRQA/QkxAqKGK4
	QMRBBSg/Qyg0s7kedL/KZ3mqJk5cVUWmZEdTdDFyi772A3oUHs99e6P/7Q==
X-Google-Smtp-Source: AGHT+IFnPjPoyW9X78a3Srv6l+KGbhq9jWip4GcKefKW7Imlq1cD1wVSvULW/jH0rqnCsvv8BlbKEg==
X-Received: by 2002:a17:902:e846:b0:1fa:221b:a7ef with SMTP id d9443c01a7336-1fbb6d71573mr66949045ad.41.1720674213122;
        Wed, 10 Jul 2024 22:03:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad3829sm41620005ad.299.2024.07.10.22.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 22:03:32 -0700 (PDT)
Date: Wed, 10 Jul 2024 22:03:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: omap-keypad -  use driver core to instantiate device
 attributes
Message-ID: <Zo9nofWJ1xg9MgKs@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Instead of manually creating driver-specific device attributes
set struct driver->dev_groups pointer to have the driver core
do it.

This also fixes issue with the attribute not being deleted on driver
unbind.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/omap-keypad.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index 16f936db7305..57587541110b 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -171,6 +171,12 @@ static ssize_t omap_kp_enable_store(struct device *dev, struct device_attribute
 
 static DEVICE_ATTR(enable, S_IRUGO | S_IWUSR, omap_kp_enable_show, omap_kp_enable_store);
 
+static struct attribute *omap_kp_attrs[] = {
+	&dev_attr_enable.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(omap_kp);
+
 static int omap_kp_probe(struct platform_device *pdev)
 {
 	struct omap_kp *omap_kp;
@@ -214,10 +220,6 @@ static int omap_kp_probe(struct platform_device *pdev)
 	kp_tasklet.data = (unsigned long) omap_kp;
 	tasklet_enable(&kp_tasklet);
 
-	ret = device_create_file(&pdev->dev, &dev_attr_enable);
-	if (ret < 0)
-		goto err2;
-
 	/* setup input device */
 	input_dev->name = "omap-keypad";
 	input_dev->phys = "omap-keypad/input0";
@@ -235,12 +237,12 @@ static int omap_kp_probe(struct platform_device *pdev)
 					 pdata->rows, pdata->cols,
 					 omap_kp->keymap, input_dev);
 	if (ret < 0)
-		goto err3;
+		goto err2;
 
 	ret = input_register_device(omap_kp->input);
 	if (ret < 0) {
 		printk(KERN_ERR "Unable to register omap-keypad input device\n");
-		goto err3;
+		goto err2;
 	}
 
 	if (pdata->dbounce)
@@ -252,17 +254,15 @@ static int omap_kp_probe(struct platform_device *pdev)
 	if (omap_kp->irq >= 0) {
 		if (request_irq(omap_kp->irq, omap_kp_interrupt, 0,
 				"omap-keypad", omap_kp) < 0)
-			goto err4;
+			goto err3;
 	}
 	omap_writew(0, OMAP1_MPUIO_BASE + OMAP_MPUIO_KBD_MASKIT);
 
 	return 0;
 
-err4:
+err3:
 	input_unregister_device(omap_kp->input);
 	input_dev = NULL;
-err3:
-	device_remove_file(&pdev->dev, &dev_attr_enable);
 err2:
 	kfree(omap_kp);
 	input_free_device(input_dev);
@@ -293,6 +293,7 @@ static struct platform_driver omap_kp_driver = {
 	.remove_new	= omap_kp_remove,
 	.driver		= {
 		.name	= "omap-keypad",
+		.dev_groups = omap_kp_groups,
 	},
 };
 module_platform_driver(omap_kp_driver);
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry


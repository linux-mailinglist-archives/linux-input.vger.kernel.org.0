Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809E4DB893
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502500AbfJQUmk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:40 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35941 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502438AbfJQUmi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23so2026884pgk.3;
        Thu, 17 Oct 2019 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ee91/xG94vrK174Ap37BZY7hPtCqG3wuDv6y0inOwfc=;
        b=tPdmfa5GhJgDexdot7dFaorP9ntzYJ8XkuMaPkGiQYZXsUiaEaq13F9ak56x6kExDM
         t/6JYqXr8/TTdnf2vwoAAGnWG9poQ501bHa9wp3jfXSu0/KNqc7wPpsTbrJGpyv2RGs9
         MgRG+LAaHdh4AxyHBxKvV85UPYJJUlPvMvktXV8VzF79jwjHa7dTKu8NWRJ3IIIrFAry
         cfvXqfNnmaf720tOcGV4avokQN//I6NYgyniyx7Qyi77bf6DswKdFk4V74A+I8Tu+f61
         iibwv2BFy1mi9SNR/Tb1d3f96H2fzUjqfQHR8BaFooaeVG1J8gx61Rfda3ZYkaSLqbzu
         iIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ee91/xG94vrK174Ap37BZY7hPtCqG3wuDv6y0inOwfc=;
        b=A50rwOSLaOw6Gi+y4kLzwAQyBNGC3LAOnnybpt9lxomR2abJbpbk6m1kViy6gvkhGq
         83ZDEQ/BRTGyEaCIP97DEQH4CPWLsaP2Wmj02CrWroea4pUDGjKJ+K6rVfoWLR2Hya6x
         dz68P26meq8rO4ZRXc4vUnAMQvJNQ5OgNrIGWJLLNrp8oYva22w2tyFfSbytBm7pWGub
         l/PSM1nRnS/kfuP+rqe+9ff9Ks02ze6EP5WQ5+F9alwysAcTnqkMZyxoZWska78OdcUG
         2fu2nyvyu0wnK6U5Z01Qc3ctUgYWhfYjkgjfL3N8XnRA0sSh8nf8FFIsfqGD7lHhHxrg
         fo4Q==
X-Gm-Message-State: APjAAAXasom7sFxnQWaHgdTuAZL8qmkE9XcDUfvC5+DmAPMaYhesY3R+
        neR8OF5wsOJo5WnyG1CwBqBQ+ELM
X-Google-Smtp-Source: APXvYqxoeUXnaHbIqvzA0E+PMO+WkVecyxIlVsndoY6dz9fRUAkrKiYqUKP/1oSTGpP4Z52H6aWgKw==
X-Received: by 2002:a17:90a:aa97:: with SMTP id l23mr6574076pjq.7.1571344956347;
        Thu, 17 Oct 2019 13:42:36 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:35 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jilayne Lovejoy <opensource@jilayne.com>,
        Steve Winslow <swinslow@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/22] Input: cobalt_btns - convert to use managed resources
Date:   Thu, 17 Oct 2019 13:42:05 -0700
Message-Id: <20191017204217.106453-12-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This simplifies error handling and allows to remove cobalt_buttons_remove()
method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/cobalt_btns.c | 57 ++++++++++----------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/input/misc/cobalt_btns.c b/drivers/input/misc/cobalt_btns.c
index bcf6174bbd5d..f7c1693fc6bb 100644
--- a/drivers/input/misc/cobalt_btns.c
+++ b/drivers/input/misc/cobalt_btns.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 2007-2008  Yoichi Yuasa <yuasa@linux-mips.org>
  */
 #include <linux/input-polldev.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -26,7 +27,6 @@ static const unsigned short cobalt_map[] = {
 };
 
 struct buttons_dev {
-	struct input_polled_dev *poll_dev;
 	unsigned short keymap[ARRAY_SIZE(cobalt_map)];
 	int count[ARRAY_SIZE(cobalt_map)];
 	void __iomem *reg;
@@ -67,15 +67,24 @@ static int cobalt_buttons_probe(struct platform_device *pdev)
 	struct resource *res;
 	int error, i;
 
-	bdev = kzalloc(sizeof(struct buttons_dev), GFP_KERNEL);
-	poll_dev = input_allocate_polled_device();
-	if (!bdev || !poll_dev) {
-		error = -ENOMEM;
-		goto err_free_mem;
-	}
+	bdev = devm_kzalloc(&pdev->dev, sizeof(*bdev), GFP_KERNEL);
+	if (!bdev)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EBUSY;
+
+	bdev->reg = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!bdev->reg)
+		return -ENOMEM;
 
 	memcpy(bdev->keymap, cobalt_map, sizeof(bdev->keymap));
 
+	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
+	if (!poll_dev)
+		return -ENOMEM;
+
 	poll_dev->private = bdev;
 	poll_dev->poll = handle_buttons;
 	poll_dev->poll_interval = BUTTONS_POLL_INTERVAL;
@@ -84,7 +93,6 @@ static int cobalt_buttons_probe(struct platform_device *pdev)
 	input->name = "Cobalt buttons";
 	input->phys = "cobalt/input0";
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = &pdev->dev;
 
 	input->keycode = bdev->keymap;
 	input->keycodemax = ARRAY_SIZE(bdev->keymap);
@@ -96,39 +104,9 @@ static int cobalt_buttons_probe(struct platform_device *pdev)
 		__set_bit(bdev->keymap[i], input->keybit);
 	__clear_bit(KEY_RESERVED, input->keybit);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		error = -EBUSY;
-		goto err_free_mem;
-	}
-
-	bdev->poll_dev = poll_dev;
-	bdev->reg = ioremap(res->start, resource_size(res));
-	dev_set_drvdata(&pdev->dev, bdev);
-
 	error = input_register_polled_device(poll_dev);
 	if (error)
-		goto err_iounmap;
-
-	return 0;
-
- err_iounmap:
-	iounmap(bdev->reg);
- err_free_mem:
-	input_free_polled_device(poll_dev);
-	kfree(bdev);
-	return error;
-}
-
-static int cobalt_buttons_remove(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct buttons_dev *bdev = dev_get_drvdata(dev);
-
-	input_unregister_polled_device(bdev->poll_dev);
-	input_free_polled_device(bdev->poll_dev);
-	iounmap(bdev->reg);
-	kfree(bdev);
+		return error;
 
 	return 0;
 }
@@ -141,7 +119,6 @@ MODULE_ALIAS("platform:Cobalt buttons");
 
 static struct platform_driver cobalt_buttons_driver = {
 	.probe	= cobalt_buttons_probe,
-	.remove	= cobalt_buttons_remove,
 	.driver	= {
 		.name	= "Cobalt buttons",
 	},
-- 
2.23.0.866.gb869b98d4c-goog


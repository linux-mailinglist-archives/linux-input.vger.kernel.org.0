Return-Path: <linux-input+bounces-4298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEFD902736
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 18:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929511C22F5A
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 16:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7288D15B0E6;
	Mon, 10 Jun 2024 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESqtbOFy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1215A845;
	Mon, 10 Jun 2024 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037792; cv=none; b=dlW5fBbF+hOItvhvhGtV/lW3/OPDIoW4VI3KKweF+SdgRCeLvaJOJVxpvBQcRyb1spbwlqgFeaZCj9TFQnUXclbyWX2qlkU1cg+gQ1SE0YCwSQ26Ej63ugxfvc2wtbC2195f3xva8k6mrgp5HUMkAQiCoitskfixjTAIEuFwT90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037792; c=relaxed/simple;
	bh=D89hi+sdibiMQAf1g7xscCENQKQ9UJmk0Nvka5Dz68w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paWyzNNq7tIl98La3zzE9uGIW0GACaEBT9uX3Fu5HH99pRe0EkvSVRUgDDUsiXJY52ROb7jQxzZvgHTqGFTOWV0nlo1vRxOo6lirZC/zHtRiCWucQLOigLvUFX7IC8iPB5Ja90fjgkZxCGfIyybO0vhott5rAqcKFBXVoekksZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESqtbOFy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f47f07acd3so42753315ad.0;
        Mon, 10 Jun 2024 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718037788; x=1718642588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C4W70CjfEJH5pz0br4wsskAYmKKP3LWorEljkJPqPw=;
        b=ESqtbOFyG+KzEwC11yXlrj8TZxlN7c57mr3w4s2glK0z4CU3oF4qtKwR1fuiJo8de/
         Nb9yu3x5FXi7dhHfl7cFJ1//ka/h85QyRJisaDpU9gU8jjgYKyJa46RVJMutiX264bWf
         qdlj35mfYX0SDJcpnErfv3gf3ywlxNUyRLQcgwiE4bGF1cRN3Y76HP+kS4TTof7hgb4G
         1Bj0jyO8uf6+ShgBtlZTQI/IwroGphB2sMR5VFoZDBnQcrwSRliUCzgQKnHBHahtCzNw
         PNhDdIb087iUCt+eIV4lenZngWIJRb0h+CrcDyboksMmtpia0ZNMJfmv6e7a/2rgV//L
         R/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037788; x=1718642588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C4W70CjfEJH5pz0br4wsskAYmKKP3LWorEljkJPqPw=;
        b=xIfZJ0faWxUjGg36I7H/vPuGl/1ta0rBNnZ7Xdj3f8rOEQy6QhzNk/Dml5jaTOvzFy
         NEnToh1B8liPXzutv1F65v6fR+hQI8PW8QA9puZAY4mzrWUjrbhNotzE7XfeO79ozQ5e
         xGUc5tI1cKGQDWvcVeyzCKnkhVtTJG28iZqvAW1dkaILIQpN6FtyWPr6pMvs49I66zcc
         B7PCdsYU2YfzmIRxTQrlZhsif8koR5gFsDx2NL/KIELzsC24P7lEqXc5L1AwzQ4HTGg/
         3tV9blVzmg1qTj82SKUaFPCdDeSOHk4tEaxLm5cPu9K8G3rFbI4zWC79WdLeNtYw25NV
         g7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXB9/CP/2k7nqRN0WD0wP+sbwUh2swqkMzoZJRpwvnIZrh3FVm5C5OUFk/XAQ84FECcIx57JIL/TZDbSGBPTxThJ5xLZ89qdgLs/cq6
X-Gm-Message-State: AOJu0Yx33AAnJ0Y9UluZI+7i+9P8njgcqjnVlLJaQz64gzcqFK1CL3z3
	tqD1fX1LPen+7gSrs+XB5LICTB2o3ao/I/CbMh+BKA864+BYOzh+J4HePQ==
X-Google-Smtp-Source: AGHT+IHyAEGEjvoLS0vtHowBWSZElS/ceu4mg4IV3QiUbIZTx2HuMs5gYTO3ZxllcRxgbmo7Jzd7EA==
X-Received: by 2002:a17:902:da8b:b0:1f6:65d3:296 with SMTP id d9443c01a7336-1f6d02f7476mr118783245ad.29.1718037788138;
        Mon, 10 Jun 2024 09:43:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:83cc:2314:b3bd:bf64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f72479ab2esm5235845ad.308.2024.06.10.09.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:43:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Nuno Sa <nuno.sa@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] Input: adxl34x - switch to using managed resources
Date: Mon, 10 Jun 2024 09:42:59 -0700
Message-ID: <20240610164301.1048482-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
References: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the driver to use managed resources to simplify error handling.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: conversion to using input_set_capability() moved to a separate patch

 drivers/input/misc/adxl34x-i2c.c |  8 -----
 drivers/input/misc/adxl34x-spi.c |  8 -----
 drivers/input/misc/adxl34x.c     | 53 ++++++++++----------------------
 drivers/input/misc/adxl34x.h     |  1 -
 4 files changed, 17 insertions(+), 53 deletions(-)

diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34x-i2c.c
index 7531c7b2d657..c05d898898e8 100644
--- a/drivers/input/misc/adxl34x-i2c.c
+++ b/drivers/input/misc/adxl34x-i2c.c
@@ -98,13 +98,6 @@ static int adxl34x_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void adxl34x_i2c_remove(struct i2c_client *client)
-{
-	struct adxl34x *ac = i2c_get_clientdata(client);
-
-	adxl34x_remove(ac);
-}
-
 static const struct i2c_device_id adxl34x_id[] = {
 	{ "adxl34x" },
 	{ }
@@ -137,7 +130,6 @@ static struct i2c_driver adxl34x_driver = {
 		.of_match_table = adxl34x_of_id,
 	},
 	.probe    = adxl34x_i2c_probe,
-	.remove   = adxl34x_i2c_remove,
 	.id_table = adxl34x_id,
 };
 
diff --git a/drivers/input/misc/adxl34x-spi.c b/drivers/input/misc/adxl34x-spi.c
index 2befcc4df0be..fd716d861832 100644
--- a/drivers/input/misc/adxl34x-spi.c
+++ b/drivers/input/misc/adxl34x-spi.c
@@ -87,13 +87,6 @@ static int adxl34x_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
-static void adxl34x_spi_remove(struct spi_device *spi)
-{
-	struct adxl34x *ac = spi_get_drvdata(spi);
-
-	adxl34x_remove(ac);
-}
-
 static struct spi_driver adxl34x_driver = {
 	.driver = {
 		.name = "adxl34x",
@@ -101,7 +94,6 @@ static struct spi_driver adxl34x_driver = {
 		.pm = pm_sleep_ptr(&adxl34x_pm),
 	},
 	.probe   = adxl34x_spi_probe,
-	.remove  = adxl34x_spi_remove,
 };
 
 module_spi_driver(adxl34x_driver);
diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index 830acf29c32b..c6c34005f5d2 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -707,21 +707,21 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 	struct adxl34x *ac;
 	struct input_dev *input_dev;
 	const struct adxl34x_platform_data *pdata;
-	int err, range, i;
+	int error, range, i;
 	int revid;
 
 	if (!irq) {
 		dev_err(dev, "no IRQ?\n");
-		err = -ENODEV;
-		goto err_out;
+		return ERR_PTR(-ENODEV);
 	}
 
-	ac = kzalloc(sizeof(*ac), GFP_KERNEL);
-	input_dev = input_allocate_device();
-	if (!ac || !input_dev) {
-		err = -ENOMEM;
-		goto err_free_mem;
-	}
+	ac = devm_kzalloc(dev, sizeof(*ac), GFP_KERNEL);
+	if (!ac)
+		return ERR_PTR(-ENOMEM);
+
+	input_dev = devm_input_allocate_device(dev);
+	if (!input_dev)
+		return ERR_PTR(-ENOMEM);
 
 	ac->fifo_delay = fifo_delay_default;
 
@@ -754,14 +754,12 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 		break;
 	default:
 		dev_err(dev, "Failed to probe %s\n", input_dev->name);
-		err = -ENODEV;
-		goto err_free_mem;
+		return ERR_PTR(-ENODEV);
 	}
 
 	snprintf(ac->phys, sizeof(ac->phys), "%s/input0", dev_name(dev));
 
 	input_dev->phys = ac->phys;
-	input_dev->dev.parent = dev;
 	input_dev->id.product = ac->model;
 	input_dev->id.bustype = bops->bustype;
 	input_dev->open = adxl34x_input_open;
@@ -816,16 +814,16 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 
 	AC_WRITE(ac, POWER_CTL, 0);
 
-	err = request_threaded_irq(ac->irq, NULL, adxl34x_irq,
-				   IRQF_ONESHOT, dev_name(dev), ac);
-	if (err) {
+	error = devm_request_threaded_irq(dev, ac->irq, NULL, adxl34x_irq,
+					  IRQF_ONESHOT, dev_name(dev), ac);
+	if (error) {
 		dev_err(dev, "irq %d busy?\n", ac->irq);
-		goto err_free_mem;
+		return ERR_PTR(error);
 	}
 
-	err = input_register_device(input_dev);
-	if (err)
-		goto err_free_irq;
+	error = input_register_device(input_dev);
+	if (error)
+		return ERR_PTR(error);
 
 	AC_WRITE(ac, OFSX, pdata->x_axis_offset);
 	ac->hwcal.x = pdata->x_axis_offset;
@@ -884,26 +882,9 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 	ac->pdata.power_mode &= (PCTL_AUTO_SLEEP | PCTL_LINK);
 
 	return ac;
-
- err_free_irq:
-	free_irq(ac->irq, ac);
- err_free_mem:
-	input_free_device(input_dev);
-	kfree(ac);
- err_out:
-	return ERR_PTR(err);
 }
 EXPORT_SYMBOL_GPL(adxl34x_probe);
 
-void adxl34x_remove(struct adxl34x *ac)
-{
-	free_irq(ac->irq, ac);
-	input_unregister_device(ac->input);
-	dev_dbg(ac->dev, "unregistered accelerometer\n");
-	kfree(ac);
-}
-EXPORT_SYMBOL_GPL(adxl34x_remove);
-
 EXPORT_GPL_SIMPLE_DEV_PM_OPS(adxl34x_pm, adxl34x_suspend, adxl34x_resume);
 
 MODULE_AUTHOR("Michael Hennerich <hennerich@blackfin.uclinux.org>");
diff --git a/drivers/input/misc/adxl34x.h b/drivers/input/misc/adxl34x.h
index 67e0ddc5c3eb..718e90c2046d 100644
--- a/drivers/input/misc/adxl34x.h
+++ b/drivers/input/misc/adxl34x.h
@@ -23,7 +23,6 @@ struct adxl34x_bus_ops {
 struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 			      bool fifo_delay_default,
 			      const struct adxl34x_bus_ops *bops);
-void adxl34x_remove(struct adxl34x *ac);
 
 extern const struct dev_pm_ops adxl34x_pm;
 extern const struct attribute_group *adxl34x_groups[];
-- 
2.45.2.505.gda0bf45e8d-goog



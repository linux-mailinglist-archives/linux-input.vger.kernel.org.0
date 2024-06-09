Return-Path: <linux-input+bounces-4276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4B9018C4
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A415280E8B
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57E955E4C;
	Sun,  9 Jun 2024 23:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOM99RUM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2070433B9;
	Sun,  9 Jun 2024 23:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976489; cv=none; b=jxh3AgWufVCQhNIzmFJhtj5RCSFJkGO0EI06X+MOw6I4wWGPlc1NxKI7b0VWBbA5NK9UqlnUNWYk3tqkrX7oiRAn+NN7yD510RDuKkJykH1KGPgIs6H0+cssHLJOC48KHi12SkdkJqEn8oX8bEMtRY/ulUirSlPb4/pW1I56qoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976489; c=relaxed/simple;
	bh=ntgJztE4F89P2PEWbMoeHcqBZfd6r4aZ47nZrjFRF+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWKN+c8Vh+EI020TdtuX6/+fov3M5G5vlb7KZ+WefsHIEjtgXecNhUz1aF/riSe8UZRIdy/bu45jXtlnDqWxDidG+BK6KlD2QM2B/OuApbF4J1L3ZqXnFU0fUpSwH//rlOMvXQ/mzs0WYAZosTL0WE29D8GEqA2lsXT0r9izFjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOM99RUM; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6e57506bb2dso1383870a12.0;
        Sun, 09 Jun 2024 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717976487; x=1718581287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sJaSjLtZ3/B6OU1iQnaZxDdyVnLfeMIdvF3m4sdin4=;
        b=LOM99RUMaPHZKhQ1qQA9Q1nD+w50+d5FVt3TBbbGIgw9ObxhdbBWepPtGLvKmNxOPB
         ceh2J+z2goJesIxxQhodIszb/nY+Izg6WfZz6JdEJ/h4xVfNyYCx7T9fGjBFyItMSEma
         P3qcIETLK4k/2qToS0lcgzkG0dfxx1Hna4HnwJXD/H00zMVLUqhC0mi/CpQsXKXUxu+B
         AYnWJVNNq5avrSIFD9ih9NU7K34+gc0sqDK2fZXXDctqSa7wquWeiVYATPqdkvNcA154
         YI2u9uUmaK9PuguBEQc7cefkd0VCaDkpyslquBbCe+1rb/0jGVReGiIksp5qliHcXqLO
         oxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717976487; x=1718581287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sJaSjLtZ3/B6OU1iQnaZxDdyVnLfeMIdvF3m4sdin4=;
        b=xOc4eUtbmeNO9gBFRnkp5lwcOMLO6uh3rQXEntSBPN+VUg4CV441SVMiNgdiN3ToC1
         3mUpSZbx/SejftJ+0KjzXPBX2YdBZWXKtNn+eeU9pFvo0N+qEiL105QCSjgYAIs9HWHI
         9f/Kxz9fDbHotr5eU3TKdCWd3dTz3tIJl6njjeoCSQP8T4VXGMmypCae6LPGhMzt0l1w
         ClbQoXIn2cpL19MO4Wbr4hwhoMR1vwm60ShAzmxk15geBi6zGPtBs9Ul7pervX0l1uc0
         F7ofIgEQJY2VKPdplF73f+q/MwoO6fF865vbE0x528LuKJsJOPce8M6oPsfXt5prJPGm
         gCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3EoFhwoB89iR9+Bdeyli8RS04eZuhbbZot2OocJAruHn+LqCbmxl+6+4iMmSpcW7lQjfjt0VWxRjETsndbXX6jhhsOB5ZN+DUgn5J
X-Gm-Message-State: AOJu0YwwjXxY/hjjY9x6Hatm6wuCWoY4AVkJDGCEpabx3jwYq3FOvrpS
	oDAmZFfMKfhVZ2PDVXkdKoIfKnoDn5d0ye6Pcl441csPGiMzjSSkKxrawA==
X-Google-Smtp-Source: AGHT+IFqrgd/VUBa0p38MmWEN/obbFtkgmYHYawuI5JsQZ2UCdRUDmDKlRAUY+xb2BePr+c4QdgdFA==
X-Received: by 2002:a05:6a20:7288:b0:1b5:d00e:98e2 with SMTP id adf61e73a8af0-1b5d00e9b6amr3326485637.26.1717976486884;
        Sun, 09 Jun 2024 16:41:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041edb91cdsm3246877b3a.213.2024.06.09.16.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:41:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: adxl34x - switch to using managed resources
Date: Sun,  9 Jun 2024 16:41:19 -0700
Message-ID: <20240609234122.603796-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
References: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/adxl34x-i2c.c |  8 ---
 drivers/input/misc/adxl34x-spi.c |  8 ---
 drivers/input/misc/adxl34x.c     | 85 +++++++++++---------------------
 drivers/input/misc/adxl34x.h     |  1 -
 4 files changed, 30 insertions(+), 72 deletions(-)

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
index fbe5a56c19d1..c6c34005f5d2 100644
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
@@ -769,18 +767,12 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 
 	input_set_drvdata(input_dev, ac);
 
-	__set_bit(ac->pdata.ev_type, input_dev->evbit);
-
 	if (ac->pdata.ev_type == EV_REL) {
-		__set_bit(REL_X, input_dev->relbit);
-		__set_bit(REL_Y, input_dev->relbit);
-		__set_bit(REL_Z, input_dev->relbit);
+		input_set_capability(input_dev, EV_REL, REL_X);
+		input_set_capability(input_dev, EV_REL, REL_Y);
+		input_set_capability(input_dev, EV_REL, REL_Z);
 	} else {
 		/* EV_ABS */
-		__set_bit(ABS_X, input_dev->absbit);
-		__set_bit(ABS_Y, input_dev->absbit);
-		__set_bit(ABS_Z, input_dev->absbit);
-
 		if (pdata->data_range & FULL_RES)
 			range = ADXL_FULLRES_MAX_VAL;	/* Signed 13-bit */
 		else
@@ -791,18 +783,18 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 		input_set_abs_params(input_dev, ABS_Z, -range, range, 3, 3);
 	}
 
-	__set_bit(EV_KEY, input_dev->evbit);
-	__set_bit(pdata->ev_code_tap[ADXL_X_AXIS], input_dev->keybit);
-	__set_bit(pdata->ev_code_tap[ADXL_Y_AXIS], input_dev->keybit);
-	__set_bit(pdata->ev_code_tap[ADXL_Z_AXIS], input_dev->keybit);
+	input_set_capability(input_dev, EV_KEY, pdata->ev_code_tap[ADXL_X_AXIS]);
+	input_set_capability(input_dev, EV_KEY, pdata->ev_code_tap[ADXL_Y_AXIS]);
+	input_set_capability(input_dev, EV_KEY, pdata->ev_code_tap[ADXL_Z_AXIS]);
 
 	if (pdata->ev_code_ff) {
 		ac->int_mask = FREE_FALL;
-		__set_bit(pdata->ev_code_ff, input_dev->keybit);
+		input_set_capability(input_dev, EV_KEY, pdata->ev_code_ff);
 	}
 
 	if (pdata->ev_code_act_inactivity)
-		__set_bit(pdata->ev_code_act_inactivity, input_dev->keybit);
+		input_set_capability(input_dev, EV_KEY,
+				     pdata->ev_code_act_inactivity);
 
 	ac->int_mask |= ACTIVITY | INACTIVITY;
 
@@ -822,16 +814,16 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 
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
@@ -874,13 +866,13 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 
 		if (pdata->orientation_enable & ADXL_EN_ORIENTATION_3D)
 			for (i = 0; i < ARRAY_SIZE(pdata->ev_codes_orient_3d); i++)
-				__set_bit(pdata->ev_codes_orient_3d[i],
-					  input_dev->keybit);
+				input_set_capability(input_dev, EV_KEY,
+						     pdata->ev_codes_orient_3d[i]);
 
 		if (pdata->orientation_enable & ADXL_EN_ORIENTATION_2D)
 			for (i = 0; i < ARRAY_SIZE(pdata->ev_codes_orient_2d); i++)
-				__set_bit(pdata->ev_codes_orient_2d[i],
-					  input_dev->keybit);
+				input_set_capability(input_dev, EV_KEY,
+						     pdata->ev_codes_orient_2d[i]);
 	} else {
 		ac->pdata.orientation_enable = 0;
 	}
@@ -890,26 +882,9 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
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



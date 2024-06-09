Return-Path: <linux-input+bounces-4275-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6CC9018C2
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312682812E6
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E75A4DA10;
	Sun,  9 Jun 2024 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAz5uo4a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C37179AE;
	Sun,  9 Jun 2024 23:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976487; cv=none; b=ruRt3TiERI3yUWpQmNClXffkPYJiRZ1uXkJinbQ05IFK72+8gOnTaAaUdGO6Br8cjAHywm9Xr3U4vj8PKtVaUh+eZkKZ3J11nWmuxbhmHcXPX+npvDgmNZ7rIn6d/kri2//PHk8mV95QE0qLFkHCSgxQSRYGFohtPPtPzSPISac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976487; c=relaxed/simple;
	bh=V4gvi9QbgIplDqrrmfrFHDBs7rFL44Z29wS0y+f08LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=We6xe2taBFqrh/0enF7lbS6+SZmvnyimK5t76/8zEseeFmMMv4QcvWWcnNSBGWau1QQweGGqOkwyDwjl6E0KyakFXjZwG9SMiafF9advNl1NDcHGIbQkfXvgBnVQJxhIZX0FVDF2i8yb+KykPcn5EQdCLf506tDPpH2S17uCKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAz5uo4a; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-704261a1f67so977850b3a.3;
        Sun, 09 Jun 2024 16:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717976485; x=1718581285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBDOkzz4pnRdAXapJDOO0B+7PQlNzo7SjqIZYQEkjvQ=;
        b=IAz5uo4aiUT/d43Hk8ozOJfHvZrU8eb+ntMSS5DNM4yYV/JLM8fg+pZ8UKZoNQqZ59
         RPUoCkqXHdXgXSpcD3QudZDg+JOyjyGqGcpXuq1M1ZnC95MKK2jfWjUYKAFhCU73oo1r
         EuiYjVaQkisGjGoyZkTwA0ekzu3CGGEK1lhkzz4YosvshjzK2kNmGnymY5zY8N9gnVga
         EuytDONxsGO6qT6wZ5vbd8p/zmPCsSxFXkq6MHH86e+cKIWIiGZtQ5JCO/WEr5MW9OoP
         8ZpYV1mXWaQEWtweckIEgfvFsHgf1qkfOZO3hsfJ4PotzUFE8Vk/WQJHTRXTbprM5eyE
         PMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717976485; x=1718581285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBDOkzz4pnRdAXapJDOO0B+7PQlNzo7SjqIZYQEkjvQ=;
        b=eAyHhAHWbBkxxwJaHRt6jBmHn2QNGr8rKpitKgahwPd+hn8asEiYGHE/4WNe/JeAX2
         bBaF/XV49cWcUUf+G1C+6G601q+PAavELEXHh+P7xUmH4BjUiM/h2EpwNvVJCIWtwl4c
         UmmirvKUtsW6PkWFvKgtqZV/LdWE/YNNy8COxq5MjzgBoL+8dBOO6mFKwrrdoyjjXiDU
         ZfNFzmozvAoGyyh+MIhUeom9jPWmDH5yaYc+r8zwIxAFUR0opuMR1XddCjZSxlu5O6Le
         ndoJSuG14wFfxfZnrHYGRbbHNia+vmasmcScgngaYJSsqtVZcJRzpJ14gaJ7fBaVoaiH
         K7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXRMkm4Ynv+DJHfygCZW6eX2KFLKOmjaThuq2rDmJYJZkKb9DYExX/rwz/NhgQvYgDqxPVBxUvBLNrxrSahHUgkDS058RWx8Flj2sAh
X-Gm-Message-State: AOJu0YwzQUql3Dgkrj/efdQnfG0UXvaOrTr/7IZ/EN68XUzHQ9xaQD8l
	jvACHpbeWkIMyNG0lBfshbU+QvVoypljxcxKQq/dM542eU/UgAuKSuETrA==
X-Google-Smtp-Source: AGHT+IHZVmmd/ZGRcIZ8iMI6+RrPRA6YG5OR63N6XyYnN3Y/jG4fHZZOVUtjyYtVUnoQY4OMT2goUQ==
X-Received: by 2002:a05:6a00:124b:b0:705:9748:7bb7 with SMTP id d2e1a72fcca58-70597487f60mr1381393b3a.22.1717976485479;
        Sun, 09 Jun 2024 16:41:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041edb91cdsm3246877b3a.213.2024.06.09.16.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:41:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: adxl34x - use device core to create driver-specific device attributes
Date: Sun,  9 Jun 2024 16:41:18 -0700
Message-ID: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of creating driver-specific device attributes with
sysfs_create_group() have device core do this by setting up dev_groups
pointer in the driver structure.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/adxl34x-i2c.c |  1 +
 drivers/input/misc/adxl34x-spi.c |  1 +
 drivers/input/misc/adxl34x.c     | 15 +++++++--------
 drivers/input/misc/adxl34x.h     |  1 +
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34x-i2c.c
index d4014e367c77..7531c7b2d657 100644
--- a/drivers/input/misc/adxl34x-i2c.c
+++ b/drivers/input/misc/adxl34x-i2c.c
@@ -132,6 +132,7 @@ MODULE_DEVICE_TABLE(of, adxl34x_of_id);
 static struct i2c_driver adxl34x_driver = {
 	.driver = {
 		.name = "adxl34x",
+		.dev_groups = adxl34x_groups,
 		.pm = pm_sleep_ptr(&adxl34x_pm),
 		.of_match_table = adxl34x_of_id,
 	},
diff --git a/drivers/input/misc/adxl34x-spi.c b/drivers/input/misc/adxl34x-spi.c
index f1094a8ccdd5..2befcc4df0be 100644
--- a/drivers/input/misc/adxl34x-spi.c
+++ b/drivers/input/misc/adxl34x-spi.c
@@ -97,6 +97,7 @@ static void adxl34x_spi_remove(struct spi_device *spi)
 static struct spi_driver adxl34x_driver = {
 	.driver = {
 		.name = "adxl34x",
+		.dev_groups = adxl34x_groups,
 		.pm = pm_sleep_ptr(&adxl34x_pm),
 	},
 	.probe   = adxl34x_spi_probe,
diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index a3f45e0ee0c7..fbe5a56c19d1 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -664,6 +664,12 @@ static const struct attribute_group adxl34x_attr_group = {
 	.attrs = adxl34x_attributes,
 };
 
+const struct attribute_group *adxl34x_groups[] = {
+	&adxl34x_attr_group,
+	NULL
+};
+EXPORT_SYMBOL_GPL(adxl34x_groups);
+
 static int adxl34x_input_open(struct input_dev *input)
 {
 	struct adxl34x *ac = input_get_drvdata(input);
@@ -823,13 +829,9 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 		goto err_free_mem;
 	}
 
-	err = sysfs_create_group(&dev->kobj, &adxl34x_attr_group);
-	if (err)
-		goto err_free_irq;
-
 	err = input_register_device(input_dev);
 	if (err)
-		goto err_remove_attr;
+		goto err_free_irq;
 
 	AC_WRITE(ac, OFSX, pdata->x_axis_offset);
 	ac->hwcal.x = pdata->x_axis_offset;
@@ -889,8 +891,6 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 
 	return ac;
 
- err_remove_attr:
-	sysfs_remove_group(&dev->kobj, &adxl34x_attr_group);
  err_free_irq:
 	free_irq(ac->irq, ac);
  err_free_mem:
@@ -903,7 +903,6 @@ EXPORT_SYMBOL_GPL(adxl34x_probe);
 
 void adxl34x_remove(struct adxl34x *ac)
 {
-	sysfs_remove_group(&ac->dev->kobj, &adxl34x_attr_group);
 	free_irq(ac->irq, ac);
 	input_unregister_device(ac->input);
 	dev_dbg(ac->dev, "unregistered accelerometer\n");
diff --git a/drivers/input/misc/adxl34x.h b/drivers/input/misc/adxl34x.h
index f9272a2e7a96..67e0ddc5c3eb 100644
--- a/drivers/input/misc/adxl34x.h
+++ b/drivers/input/misc/adxl34x.h
@@ -26,5 +26,6 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 void adxl34x_remove(struct adxl34x *ac);
 
 extern const struct dev_pm_ops adxl34x_pm;
+extern const struct attribute_group *adxl34x_groups[];
 
 #endif
-- 
2.45.2.505.gda0bf45e8d-goog



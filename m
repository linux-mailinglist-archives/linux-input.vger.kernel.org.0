Return-Path: <linux-input+bounces-4296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB9902760
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 19:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ADBDB2AE63
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 16:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD1315956E;
	Mon, 10 Jun 2024 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGN7TOZO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67192158DCA;
	Mon, 10 Jun 2024 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037789; cv=none; b=fQNVaUQLeV1esEOipyzaG4Ok+8IGzJbAjeOeoHhnjkfs6pUZ2sGVgI/RZVJ6jSMIruay8S5W6XRHJrP4kVKB32+x3lRWS8ylLnFT9dP7X3ouHBmW4L5LFb43Mh678I7xk75J+klQvQklbfqi1teVtSC1xLrKrVukZ56JHLYZasw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037789; c=relaxed/simple;
	bh=IwQTSFOWJavyEcAjjcodGL3Y5hzxqdXA53v2nXnt/u8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1rEOwdQJGUXCffzdheiDf6OKbe6J0JjuCH1+K9K2931WyDoD9kYup9irjBoE+6EW1TsM29+uC49NDlB1q/l0XYG1d1jlyQSYV2GsziUVzLPj0I9jMogyv8OO/IognXm6z9MBxiCYUnb4+0KYmRfPgT7hE96fZz542yphF9yIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGN7TOZO; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6819d785528so3075427a12.3;
        Mon, 10 Jun 2024 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718037786; x=1718642586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aknRXtfNpDT3/xW3+oSc9LSjDIZNf+C1csd3Fn/F4Pc=;
        b=WGN7TOZOtukQpT1tcpzEXy4aTNFYSqav5snLmMslY8wEDIDGWl6/4Kadmvr8KFiyoD
         6MDEAmn6I0IvWHd+p76bZZEZOKRgstO5sT0W0U1G1ULwXmxFG9wH1DT4eOSa4nabwyuJ
         cESrvSpJT6StggS+DLSj+W/ChodXoVYg7wJw7244qaJuWgpnxksJWvI/NzNMm3IniHgH
         w6hUL5gKjs4tL+t+0LCUwmBZuYJGIO2MBX6fjS8kIvHw4j+6llGJ6JDP8dfxOon+cn9I
         x8B9MbiO2or52h2E26la5x0Vpd949exOCysyaEgB0gfiu3nONbiAPlBgOnt0Cx4yU29K
         ZoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037786; x=1718642586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aknRXtfNpDT3/xW3+oSc9LSjDIZNf+C1csd3Fn/F4Pc=;
        b=UOUEftlUaHv/r2mVvW+6Ma8gAIIabQY1UWGAhhdNKqn0N795xTBgmfriElzPF+5FQT
         2zn1PTGRAPWLprdQB1XgDnGTP2IS/LhlkdVKKlwA/feVjaG88iP9GG8R03PbCswEfsZG
         bw/Up3lK1Veay3ePStwTBeQc+zBN9YHJ8T+GcpZsUQaTD5BOvKTEHd9MN89/VUcMxuXm
         uIcb3gDS0D2/H+bCruf1P0JZgmPLCeN8K1ab3MopmTh2JZr4zGZ1Czu7G0HYWztm3huY
         viOLsJ0DZNFIF7UztaaXZpJHxMVLYbfOoUQqRGLurD4JDcXnN/g8Bscq6WB4ZQSPfeZE
         goMg==
X-Forwarded-Encrypted: i=1; AJvYcCXv9vVKl4cIcwbvMPNRSK8nSFNhkqF1ZzIK8KvYCyzu+qs6Fpxf9vn7HP0ZF3kCZRmARhEGoCi+i6+AnYskRsx4F5bIzj/sranuCLwp
X-Gm-Message-State: AOJu0YzmtEMuLtrrA7tASWnrTHYjzYLYYodtu/yIOJMNf/napmkCf166
	zoPbSF69mtScIQ0bk17mQAjYZFPGLrEMoqRfcJTlQSFb3PcTN7qiIWvXSw==
X-Google-Smtp-Source: AGHT+IGQYbGCW3K8Egt7GL8o0/riJ5NpNxqOn/9udrMNHxZvhUzXPvqmDpxeSsd78eWiFeGORJ2cow==
X-Received: by 2002:a17:902:c404:b0:1f7:2135:ce7c with SMTP id d9443c01a7336-1f72135cfdfmr15024635ad.28.1718037786016;
        Mon, 10 Jun 2024 09:43:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:83cc:2314:b3bd:bf64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f72479ab2esm5235845ad.308.2024.06.10.09.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:43:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Nuno Sa <nuno.sa@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] Input: adxl34x - use device core to create driver-specific device attributes
Date: Mon, 10 Jun 2024 09:42:57 -0700
Message-ID: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
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

Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: added Nono's ACK

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



Return-Path: <linux-input+bounces-3484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB728BCD23
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 13:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2822C1F20FF4
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 11:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF353142E84;
	Mon,  6 May 2024 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrWzEpQt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F90B14262C;
	Mon,  6 May 2024 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714996090; cv=none; b=rlYSOKIyxXX59PwNiYprBj97GawEnsfKM7E5zg8XCxY578ZurWVArrMRbPqZX25pMQAcrlk0ENDq5gzbzANVQZNdn0+SZ/xK9AtaXYvNAO0IbJ/xwLAhb+axbNrhSFOq6aiNGaYOQMDMgCm+wqc6+63IQ3xDCzdFtIuTgAIoJ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714996090; c=relaxed/simple;
	bh=dHUDLNO/bYSGT88FUt383tTwFHou2Is7zXUiBaBmYZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7NW4TP+Lxb54muAHri4+Eq5Sk0GB96rnk5RWwPjNDSDxkuATwNlXbWsiZCF/3+2ieQl41MPuyNUHHyGCkPbNPlHFlhze2eHPjANpz8ZlPKm+cYQGN/YtoDSwXzKq0C3zKmBXyDX8I739Ge3XKeFpqvEhxntdJk9QHT6r47kJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrWzEpQt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso8841895ad.2;
        Mon, 06 May 2024 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714996089; x=1715600889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ULKSrlLF8CoXgv8cd5QtkaVd/T2IyLOBhgECVTg6BYQ=;
        b=YrWzEpQtOh+CL0NMboQceOfVfTZCs7M0JTby4kfJvXZt8CzHOWQq07hEV5c7iSsBCn
         +Ik2rGjRqWKz7MsXXMu4Thb306g+oHkkF402eoKnBrlYNPnnJsOh6sx+YzF9IguBuIG+
         VbRO6WFYjEUUkjKTPW/Af7Rz9b65jtqr/6uK2N64XeoPtDHOKI1wOO9CloRK04+ND38v
         4A3JVi3YwezcROONkiH5nf7oWz+34yQbRAUk4z7696r2qk323Da0KBTgnzMsEHnx5B9d
         TbI73OeY4BgTppFwfwRlZpTDRa+VasKo4YpruQ+J0Yqxmbsaxv2rAGOjfx3GzR5Frs68
         UE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714996089; x=1715600889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULKSrlLF8CoXgv8cd5QtkaVd/T2IyLOBhgECVTg6BYQ=;
        b=TSDZrh2e2EnHtpI1pUL3AOyIk7GEhD4U9vfbk26HpOZxyx0R9pmwjSvkb3HHTQDvb8
         xGXkNZG7+mgcACWBhlk532WX79QhJX+Dz8Ftx2UIXYH+ndZ2ihKnQeyS7eXlDRwuTE/J
         qJioviI455hftOz1BcDlv3N/thhcwHbsfbX0uJ9keB1va2kBihHJPVaXdvKfoK/XMZrs
         FcOJCzUsrKXD41GgCyX6JRr6KjYzwnBFp9r72TsQz6vFWpNegFBM6g7DlGb586auY2Pb
         GjOGFW3XjiTdYkwZsd9wZb9UUZ8bucf771VnJEWaXaLGBS0otMpDstGOp1Y7qBVy2R5R
         +EfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYjBh3V54QLA6NEiLMH1wxgNHUTqMQue78JFVBbREQbWRWSApkGlm+R/Aj/8e0oiKNUVWnAqI3HUeyEO2xXyuNInnU05vrRaJokUJE
X-Gm-Message-State: AOJu0YyG6ErEuPiXAMeepxn2Ss+sUCBamh9JNNVtwDXVK74VVAIDO7OX
	8WdXw3wn7+x/8ilvY60rC8CXswGAcEQk8QD8WGgXPEZc7oTCwgw0
X-Google-Smtp-Source: AGHT+IFjPvXBILiyYfw9gqME2YadttKH18Uss1PusNBk+PXqGwSyLa73BHGDIWbqBG6iixQPcL/Qaw==
X-Received: by 2002:a17:902:e808:b0:1de:fbc3:8e4a with SMTP id u8-20020a170902e80800b001defbc38e4amr11827809plg.52.1714996088490;
        Mon, 06 May 2024 04:48:08 -0700 (PDT)
Received: from mb-board.. ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id j1-20020a17090276c100b001e49428f327sm8073242plt.176.2024.05.06.04.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 04:48:08 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: hadess@hadess.net,
	hdegoede@redhat.com,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	charles.goodix@gmail.com
Subject: [PATCH] Input: goodix-berlin - Add sysfs interface for reading and writing touch IC registers
Date: Mon,  6 May 2024 19:47:52 +0800
Message-ID: <20240506114752.47204-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export a sysfs interface that would allow reading and writing touchscreen
IC registers. With this interface many things can be done in usersapce
such as firmware updates. An example tool that utilizes this interface
for performing firmware updates can be found at [1].

[1] https://github.com/goodix/fwupdate_for_berlin_linux

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 drivers/input/touchscreen/goodix_berlin.h     |  2 +
 .../input/touchscreen/goodix_berlin_core.c    | 52 +++++++++++++++++++
 drivers/input/touchscreen/goodix_berlin_i2c.c |  6 +++
 drivers/input/touchscreen/goodix_berlin_spi.c |  6 +++
 4 files changed, 66 insertions(+)

diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
index 1fd77eb69..1741f2d15 100644
--- a/drivers/input/touchscreen/goodix_berlin.h
+++ b/drivers/input/touchscreen/goodix_berlin.h
@@ -19,6 +19,8 @@ struct regmap;
 int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 			struct regmap *regmap);
 
+void goodix_berlin_remove(struct device *dev);
+
 extern const struct dev_pm_ops goodix_berlin_pm_ops;
 
 #endif
diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index e7b41a926..e02160841 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -672,6 +672,44 @@ static void goodix_berlin_power_off_act(void *data)
 	goodix_berlin_power_off(cd);
 }
 
+static ssize_t goodix_berlin_registers_read(struct file *filp, struct kobject *kobj,
+	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
+{
+	struct goodix_berlin_core *cd;
+	struct device *dev;
+	int error;
+
+	dev = kobj_to_dev(kobj);
+	cd = dev_get_drvdata(dev);
+
+	error = regmap_raw_read(cd->regmap, (unsigned int)off,
+				buf, count);
+
+	return error ? error : count;
+}
+
+static ssize_t goodix_berlin_registers_write(struct file *filp, struct kobject *kobj,
+	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
+{
+	struct goodix_berlin_core *cd;
+	struct device *dev;
+	int error;
+
+	dev = kobj_to_dev(kobj);
+	cd = dev_get_drvdata(dev);
+
+	error = regmap_raw_write(cd->regmap, (unsigned int)off,
+				 buf, count);
+
+	return error ? error : count;
+}
+
+static struct bin_attribute goodix_berlin_registers_attr = {
+	.attr = {.name = "registers", .mode = 0600},
+	.read = goodix_berlin_registers_read,
+	.write = goodix_berlin_registers_write,
+};
+
 int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 			struct regmap *regmap)
 {
@@ -743,6 +781,14 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 
 	dev_set_drvdata(dev, cd);
 
+	error = sysfs_create_bin_file(&cd->dev->kobj,
+				      &goodix_berlin_registers_attr);
+
+	if (error) {
+		dev_err(dev, "unable to create sysfs file, err=%d\n", error);
+		return error;
+	}
+
 	dev_dbg(dev, "Goodix Berlin %s Touchscreen Controller",
 		cd->fw_version.patch_pid);
 
@@ -750,6 +796,12 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 }
 EXPORT_SYMBOL_GPL(goodix_berlin_probe);
 
+void goodix_berlin_remove(struct device *dev)
+{
+	sysfs_remove_bin_file(&dev->kobj, &goodix_berlin_registers_attr);
+}
+EXPORT_SYMBOL_GPL(goodix_berlin_remove);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Goodix Berlin Core Touchscreen driver");
 MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
index 6ed9aa808..35ef21cc8 100644
--- a/drivers/input/touchscreen/goodix_berlin_i2c.c
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -46,6 +46,11 @@ static int goodix_berlin_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
+static void goodix_berlin_i2c_remove(struct i2c_client *client)
+{
+	goodix_berlin_remove(&client->dev);
+}
+
 static const struct i2c_device_id goodix_berlin_i2c_id[] = {
 	{ "gt9916", 0 },
 	{ }
@@ -66,6 +71,7 @@ static struct i2c_driver goodix_berlin_i2c_driver = {
 		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
 	},
 	.probe = goodix_berlin_i2c_probe,
+	.remove = goodix_berlin_i2c_remove,
 	.id_table = goodix_berlin_i2c_id,
 };
 module_i2c_driver(goodix_berlin_i2c_driver);
diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
index 4cc557da0..8ffbe1289 100644
--- a/drivers/input/touchscreen/goodix_berlin_spi.c
+++ b/drivers/input/touchscreen/goodix_berlin_spi.c
@@ -150,6 +150,11 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
+static void goodix_berlin_spi_remove(struct spi_device *spi)
+{
+	goodix_berlin_remove(&spi->dev);
+}
+
 static const struct spi_device_id goodix_berlin_spi_ids[] = {
 	{ "gt9916" },
 	{ },
@@ -169,6 +174,7 @@ static struct spi_driver goodix_berlin_spi_driver = {
 		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
 	},
 	.probe = goodix_berlin_spi_probe,
+	.remove = goodix_berlin_spi_remove,
 	.id_table = goodix_berlin_spi_ids,
 };
 module_spi_driver(goodix_berlin_spi_driver);
-- 
2.43.0



Return-Path: <linux-input+bounces-5811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164595DBFF
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7EA1F22F7A
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BDF153BD9;
	Sat, 24 Aug 2024 05:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MygKJ7W/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D4314EC73;
	Sat, 24 Aug 2024 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478661; cv=none; b=mFxKTY8qOyqkmh3AVmCRv7E2vG0GvMlpWBkCvDNMGd5TcQfVHdZJYSY1tBEc/eMcrj9rhyaHn6l7wNBpqe9SLREtVVv+uMVQbWBPYLf/elXXWMLZTeVibMFXPm5zYUH8IZ5YWZ4ewvxGFm2CAd34nJzImMw/6fYmDlYyT4kE5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478661; c=relaxed/simple;
	bh=d8/cwb9Pxb7IHUK4X6fnXxfxirqKTGGnG0GqI7TveIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEtS8NVVFLzqeZL2c+IGZ0p+iyjPz+pIgKRBoe+YVFyvIUPhwDRNf/SM+kc7rGd4k7w43Qubn5jFJmWtHFKc2ksiJTjRbWLWQiOIs67IMDrBpvwuXIELrB0WURpb+0y+ukXdyfxm/rtLhuFGzoHXFVWGzoljkDiaN189ZSZoFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MygKJ7W/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-713edc53429so2151505b3a.2;
        Fri, 23 Aug 2024 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478659; x=1725083459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezKHKr+4RbEaJ839QztElord5F93gI6kBwoAwsgFbkA=;
        b=MygKJ7W/pX5AhFDyh5WOdxXWEuk9EDeOrpURW5TOPGA0HEhmk61VZhQXXaMOOiUBgj
         ESuy4iAL3IHFFEYohrvKJeqVM/viz91nn+0OHLKWRuxsE+FFjBx5dps285YXw4sn6rnT
         UlgKFvA1G3zwAc1T+LCVPPTatqOVcqOZ/KWiEguKeoHR/nQBf8xX4HRt01IfdINHU60P
         G+8NGVl/4kKebSamqoSY6XfKEUK+winp2l4evb4oaPf3zDz3My+oJVCg7cpCPwNkd+SO
         stpH5121s+viReKM/dc5NXfJVvjsfYqqvSkGx6ych6j67u958m++gkLnNNNE+5KZ2ydN
         GslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478659; x=1725083459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezKHKr+4RbEaJ839QztElord5F93gI6kBwoAwsgFbkA=;
        b=WhDXj/XwhpOKWJekY3129iNqC21/15uNEigvX0efAlY205aRTfglGo5xHaX8NuAD8D
         u5QQC9Pk1s2YxCxyuqtuAX0Ly2lz9RETPQe72cgAWStfWNzD7MQyhUjpqkhWQdY5lvHR
         5qQb9jPjmDgUt0JngdUY3DRgrTyMw+20PpqM+VeCr2g14PwRnBUO5XbmBfMYGs/PWGMI
         TC3Il7nfek29iSGFbsZJrXbg4cs/RJ2elFT2FhUz2re+mIUmfL1HPyy/QL76CvhI36p8
         fJvY4yPQtg+2ENoHvxQE7VTFyxoWny/HUqhRuEY1yaPQP/B+BZF/zlVyvAd2ZHDyDFtb
         XV9g==
X-Forwarded-Encrypted: i=1; AJvYcCUMLG6ynX84OGqZcwLgJvWxWoSvXNXiZ0oQBHPHsF0m74fv9ehQApZMA2TSYHQQZSJ4uo13z6HUykwNC/Zp@vger.kernel.org, AJvYcCXgOor+jPeCF7h7fbF/xaixkEc1FDFF8QyzI4TZovGUT9UArQlw/P2rEDSZeILFYcO8Pxyj7e9dQ0NGiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCDqn/p+kcA0rmvKKu2s2w5duHkfzJoKC5xhp0MhtK9HsJhADY
	/PMWbFUcAzWLXHCqY67C+eJ0UyK55zxJjCln+0xodOm8kmfzyks2
X-Google-Smtp-Source: AGHT+IHee2poCvIqv8q30/gbA7K9/auSgR1h2+m/fDfSDibHM8ef10E/0QFTp/qy3a+4yYl5mEJDpw==
X-Received: by 2002:a05:6a20:cf90:b0:1c4:23f1:114 with SMTP id adf61e73a8af0-1cc89d65b39mr4922763637.20.1724478659280;
        Fri, 23 Aug 2024 22:50:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:50:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/18] Input: zforce_ts - remove support for platfrom data
Date: Fri, 23 Aug 2024 22:50:27 -0700
Message-ID: <20240824055047.1706392-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of platform data and any new ones should
either use device tree or static device properties, so let's remove
platform data support.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c   | 56 +++++++------------------
 include/linux/platform_data/zforce_ts.h | 15 -------
 2 files changed, 16 insertions(+), 55 deletions(-)
 delete mode 100644 include/linux/platform_data/zforce_ts.h

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 350cec8508a3..5a8f79b800e6 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -9,21 +9,19 @@
  * Author: Pieter Truter<ptruter@intrinsyc.com>
  */
 
-#include <linux/module.h>
-#include <linux/hrtimer.h>
-#include <linux/slab.h>
-#include <linux/input.h>
-#include <linux/interrupt.h>
-#include <linux/i2c.h>
 #include <linux/delay.h>
-#include <linux/gpio/consumer.h>
 #include <linux/device.h>
-#include <linux/sysfs.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
-#include <linux/platform_data/zforce_ts.h>
-#include <linux/regulator/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 
 #define WAIT_TIMEOUT		msecs_to_jiffies(1000)
 
@@ -108,7 +106,6 @@ struct zforce_ts {
 	struct i2c_client	*client;
 	struct input_dev	*input;
 	struct touchscreen_properties prop;
-	const struct zforce_ts_platdata *pdata;
 	char			phys[32];
 
 	struct regulator	*reg_vdd;
@@ -702,39 +699,24 @@ static void zforce_reset(void *data)
 		regulator_disable(ts->reg_vdd);
 }
 
-static struct zforce_ts_platdata *zforce_parse_dt(struct device *dev)
+static void zforce_ts_parse_legacy_properties(struct zforce_ts *ts)
 {
-	struct zforce_ts_platdata *pdata;
-	struct device_node *np = dev->of_node;
-
-	if (!np)
-		return ERR_PTR(-ENOENT);
+	u32 x_max = 0;
+	u32 y_max = 0;
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "failed to allocate platform data\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	of_property_read_u32(np, "x-size", &pdata->x_max);
-	of_property_read_u32(np, "y-size", &pdata->y_max);
+	device_property_read_u32(&ts->client->dev, "x-size", &x_max);
+	input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, x_max, 0, 0);
 
-	return pdata;
+	device_property_read_u32(&ts->client->dev, "y-size", &y_max);
+	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, y_max, 0, 0);
 }
 
 static int zforce_probe(struct i2c_client *client)
 {
-	const struct zforce_ts_platdata *pdata = dev_get_platdata(&client->dev);
 	struct zforce_ts *ts;
 	struct input_dev *input_dev;
 	int ret;
 
-	if (!pdata) {
-		pdata = zforce_parse_dt(&client->dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
-
 	ts = devm_kzalloc(&client->dev, sizeof(struct zforce_ts), GFP_KERNEL);
 	if (!ts)
 		return -ENOMEM;
@@ -822,7 +804,6 @@ static int zforce_probe(struct i2c_client *client)
 	mutex_init(&ts->access_mutex);
 	mutex_init(&ts->command_mutex);
 
-	ts->pdata = pdata;
 	ts->client = client;
 	ts->input = input_dev;
 
@@ -837,12 +818,7 @@ static int zforce_probe(struct i2c_client *client)
 	__set_bit(EV_SYN, input_dev->evbit);
 	__set_bit(EV_ABS, input_dev->evbit);
 
-	/* For multi touch */
-	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0,
-			     pdata->x_max, 0, 0);
-	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0,
-			     pdata->y_max, 0, 0);
-
+	zforce_ts_parse_legacy_properties(ts);
 	touchscreen_parse_properties(input_dev, true, &ts->prop);
 	if (ts->prop.max_x == 0 || ts->prop.max_y == 0) {
 		dev_err(&client->dev, "no size specified\n");
diff --git a/include/linux/platform_data/zforce_ts.h b/include/linux/platform_data/zforce_ts.h
deleted file mode 100644
index 2463a4a856a6..000000000000
--- a/include/linux/platform_data/zforce_ts.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* drivers/input/touchscreen/zforce.c
- *
- * Copyright (C) 2012-2013 MundoReader S.L.
- */
-
-#ifndef _LINUX_INPUT_ZFORCE_TS_H
-#define _LINUX_INPUT_ZFORCE_TS_H
-
-struct zforce_ts_platdata {
-	unsigned int x_max;
-	unsigned int y_max;
-};
-
-#endif /* _LINUX_INPUT_ZFORCE_TS_H */
-- 
2.46.0.295.g3b9ea8a38a-goog



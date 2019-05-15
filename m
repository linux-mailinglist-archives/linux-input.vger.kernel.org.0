Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F3C1FC93
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 00:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfEOWfF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 18:35:05 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41119 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfEOWfF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 18:35:05 -0400
Received: by mail-ed1-f65.google.com with SMTP id m4so2029858edd.8
        for <linux-input@vger.kernel.org>; Wed, 15 May 2019 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4z1t32FdEzj8XZPm7eJqjTmXhy1MX24MxU4NWCyxaNA=;
        b=Sa5ItKI7IldE0KhpRmLZWjMqxMMdGZo8s6GhwP8ocVWt54Dx3hUSxHOjBHeALIzBFx
         js+HqPIooCbGX5RZ9ChOZ3pH7X7UnB8Cl0v0x0B5Fi5wh8EkpYhGKaQgGaBAHtsmO5O3
         BIKLmhEsairgYtVX4oYlwV/mTQljmmB0ouVLamWpckGwTdgmCqHIZ+TYR/KVJG7cryjn
         ehQe62fZjy4gcOL7Hzh5H8GGr8q9z9WkO6Hhbl9p5C3Iv1obfiV108aqaqUIIQANLuM2
         wv7+0qPAEQvMp7jC9N7aIRQRcPNjlqqS0NjAQj6Etr9JsXBlr38tqBt197h4j95TrE34
         eudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4z1t32FdEzj8XZPm7eJqjTmXhy1MX24MxU4NWCyxaNA=;
        b=UxDv9+wL23vxSKap8AFzf/mIiOqTIzFLCNgx3P0/XyEfeKdlprhQjzPS15DYzEbHHC
         qfOwz/tNG/2LfBia4HwdEkAIiUdB78MYlKziVgtv7Osbj+WeZRqEV9rOblXbp9ccGMp0
         cHnLDtbDGc9FYC15UafMRxO+tGLEaa5HbWA/SkGO2yWqcWG8kzfAvcF6Tm+eSnlvl26Z
         zUDZYsk2NVibcECREeW2fAJW9ZstH7ofkxPL1waTNro1OOHg4h/O76+ZuLTFLeMzKJ2/
         uhOFQGODzQi8YKnNW69HDE3VkNJmTLwk79O5zLLNSMRETuy82BZjjOBGxkbOMXtLPHZ9
         1D0A==
X-Gm-Message-State: APjAAAVmZJocQyxcOBbelZVxf4FxmRnQJvQwgVO3q9J13HOpv8wySxJM
        Kl0xEgvPHdGGRpC1JK7tGTQcPA==
X-Google-Smtp-Source: APXvYqxn2E1Hqz3p2AVbSx6ZLmWl7guB/4opI8uCLhnGgU5+isY75OrlFYuSPuUcQog0QpfxZvtk8A==
X-Received: by 2002:a50:ba1a:: with SMTP id g26mr46843043edc.90.1557959703240;
        Wed, 15 May 2019 15:35:03 -0700 (PDT)
Received: from msi.localhost ([185.54.207.135])
        by smtp.gmail.com with ESMTPSA id a17sm1178498edt.63.2019.05.15.15.35.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 15:35:02 -0700 (PDT)
From:   Martijn Braam <martijn@brixit.nl>
To:     dmitry.torokhov@gmail.com
Cc:     m.felsch@pengutronix.de, robh@kernel.org, martijn@brixit.nl,
        linux-input@vger.kernel.org
Subject: [PATCH v2 1/2] Input: edt-ft5x06 - add vdd supply
Date:   Thu, 16 May 2019 00:34:20 +0200
Message-Id: <20190515223420.13609-1-martijn@brixit.nl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190515044116.ss6usdlc2yb2aqwe@pengutronix.de>
References: <20190515044116.ss6usdlc2yb2aqwe@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a regulator supply request for the controller power

Signed-off-by: Martijn Braam <martijn@brixit.nl>
---
 drivers/input/touchscreen/edt-ft5x06.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 702bfda7ee77..226c623f8d46 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -29,6 +29,7 @@
 #include <linux/ratelimit.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/regulator/consumer.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
@@ -103,6 +104,7 @@ struct edt_ft5x06_ts_data {
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *wake_gpio;
+	struct regulator *vdd;
 
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *debug_dir;
@@ -1092,6 +1094,22 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(tsdata->vdd)) {
+		error = PTR_ERR(tsdata->vdd);
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev,
+				"Failed to get vdd regulator: %d\n", error);
+		return error;
+	}
+
+	/* power the controller */
+	error = regulator_enable(tsdata->vdd);
+	if (error) {
+		dev_err(&client->dev, "Controller fail to enable vdd\n");
+		return error;
+	}
+
 	tsdata->wake_gpio = devm_gpiod_get_optional(&client->dev,
 						    "wake", GPIOD_OUT_LOW);
 	if (IS_ERR(tsdata->wake_gpio)) {
@@ -1204,6 +1222,7 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
 {
 	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
 
+	regulator_disable(tsdata->vdd);
 	edt_ft5x06_ts_teardown_debugfs(tsdata);
 
 	return 0;
-- 
2.21.0


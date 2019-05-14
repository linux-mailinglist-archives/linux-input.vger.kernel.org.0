Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657081D138
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 23:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfENVXJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 May 2019 17:23:09 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36369 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfENVXJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 May 2019 17:23:09 -0400
Received: by mail-ed1-f68.google.com with SMTP id a8so932691edx.3
        for <linux-input@vger.kernel.org>; Tue, 14 May 2019 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4z1t32FdEzj8XZPm7eJqjTmXhy1MX24MxU4NWCyxaNA=;
        b=eCGItw0CnQKKjvqxQrfaZZa9A97NYE85apw2z4xVar3FnTLMaZt2rnzrRmVSv/jZXR
         H94qNtY6fWBVcJL5KMUmBmRMls0XS2Hzq3SqISKrghB8ltI5sJavrbHvMYuY4Rr6N89x
         k1HiYmykvEgf/JaxDXSrvqUL2IcJ1MW4jRUKNzu+o6PkknBbCxXF4d1aXH1t+x7dCZAz
         sxKZfuk36bhTDJwWuGEmhDePeu3kSYl7TeOmOJ7Wi9MfCup55vNMEc2wW6uCy7WHt7EI
         cV9c9pXEBMw4GBQfz0A/p7vAJNd66dmxvkPrWdhcxTlgfW7BySOV2lIsdEkzavvJeREs
         1PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4z1t32FdEzj8XZPm7eJqjTmXhy1MX24MxU4NWCyxaNA=;
        b=cBZqFlXH9e67XC+AP5dosi/CDywhW8AMLzpGpNxYtVVolObmH0m0nnA/dbCMFytMbP
         O17yfeHCXKmKGXl5WtrLenVrngTACSajyyIibcxnbH5y0Ga3r6MAwDgFKYMdssL6KTxw
         5oudi2LrQx6mHJrR2r79eN54ACoeWMV1ZV3FUZrPfHuD70NwsAG6HuvDoX0MaZHZMVzQ
         mupcJU4ODmAz6sr0LvTJHQ3kndDDWa/KJathCKmk/FHAEIx6ubc4udTllZr9/rVyK9TT
         EXwe3Ntd4jstdD1C+nEjbSb5pM8+7QOlJIc8VEQ1Irov+3KSvSks/Qj8XFK1xZY52SF0
         OlGg==
X-Gm-Message-State: APjAAAXxNsn+0EOJGiANwSUMLoS0fuscOGL1k2TgwWN7vQDlx7cRfJFb
        Qs/Kc+m8rZwh3c4ApJ1rT5CXZw==
X-Google-Smtp-Source: APXvYqy0eVy+pNLXr/v4eBg7mxAWxgTL3oLjv4mPb/yXVBLxj0orbXdBmVLkMAeseWJml77SVYaRGQ==
X-Received: by 2002:a50:e705:: with SMTP id a5mr39094047edn.270.1557868987408;
        Tue, 14 May 2019 14:23:07 -0700 (PDT)
Received: from msi.localhost ([185.54.207.135])
        by smtp.gmail.com with ESMTPSA id dd15sm34849ejb.74.2019.05.14.14.23.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 14:23:06 -0700 (PDT)
From:   Martijn Braam <martijn@brixit.nl>
To:     dmitry.torokhov@gmail.com
Cc:     m.felsch@pengutronix.de, robh@kernel.org, martijn@brixit.nl,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: edt-ft5x06 - add vdd supply
Date:   Tue, 14 May 2019 23:21:11 +0200
Message-Id: <20190514212111.21742-1-martijn@brixit.nl>
X-Mailer: git-send-email 2.21.0
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


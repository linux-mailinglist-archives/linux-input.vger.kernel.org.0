Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F30DCE156
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 14:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfJGMP4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 08:15:56 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43023 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGMP4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 08:15:56 -0400
Received: by mail-qt1-f193.google.com with SMTP id c4so6060784qtn.10
        for <linux-input@vger.kernel.org>; Mon, 07 Oct 2019 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=asfBcHJibpsJFbJQecNPvn4OdThp7y8UZFFMErCqUDQ=;
        b=p0WEmNNcAvnzZsXOA+/X2D6H2tYxDUcKc7t2MfeFdL4YIUEDuirXCrzFmCFY7GEO7g
         nmril3D+FARKGnAlMbY0eKQATnjGmw1I5EcwNBP4eVKfe5m3rDRKGvu8JSatlmZIcp0Q
         wENX+W0D+CpWs6B1TA6iF+UKSCUtadmDhJqXFL/9zV1+hsmA6DLJaVJHwyGCzCxJhclY
         uNpmJsqLnWj2wnOKMcbsZfY20xQkqnwlXWUJchTFPSj+uqSHTNtvW7t8x93OXLNpQjGn
         MWkK7uWo8slk1FPAxas0Vyr6TqOc88eJc7wm9mSdS2OGDd886K0gCKs4XJ3qkSI+BALP
         T2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=asfBcHJibpsJFbJQecNPvn4OdThp7y8UZFFMErCqUDQ=;
        b=bVXFIf6NaPdH1YOKB8JlhU4gvkED221ExdPARlKQyGRmqsdUA88K7HblpJawitzUlt
         LTs4M9vZnNzySzYEZyL40pUpQ7CsArpWQCLu9n2kYwtDnhvQgA67Hc8RWr+0z5gTFAdS
         kl1W4SARtAaJ86wIq9/qthZFPEIY9swIxAiphIhYUebwhpTSWWTCp23eFm80zOvdXqFz
         zB4c+jS3ju590aR4bfGUT9tkYoPyu7+pZMXamWP77THDRdFgiY+JQ9YZIE41YXWg0Oqc
         JwjmsO4ZxSEr9e2/KXH46GoEVPzUNXFE+BCY+YDK8ThPrK6taYwg4UzrZv7w5aRjS/Gb
         hvug==
X-Gm-Message-State: APjAAAW5x+NwfnVYilPgbrZtZe934JZg4lzCre9ljdmAqPA/x/E4MY9T
        xnC3hEw23W9Heif89beCiss=
X-Google-Smtp-Source: APXvYqzyk8aGZmeJrMNDRldnZYKByNv/dj70FJCnlQE8W2ZZgLj+foNl3m25UC9VZ3alXQeDhdrdtw==
X-Received: by 2002:a0c:88f0:: with SMTP id 45mr26452041qvo.78.1570450555082;
        Mon, 07 Oct 2019 05:15:55 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id g194sm8221678qke.46.2019.10.07.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 05:15:54 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jcbian@pixcir.com.cn, rogerq@ti.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/5] Input: pixcir_i2c_ts: Print register address in decimal
Date:   Mon,  7 Oct 2019 09:16:06 -0300
Message-Id: <20191007121607.12545-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007121607.12545-1-festevam@gmail.com>
References: <20191007121607.12545-1-festevam@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pixcir datasheet lists the registers addresses in decimal and
so are PIXCIR_REG_POWER_MODE and PIXCIR_REG_INT_MODE defined in decimal.

Change the error messages to print the register addresses in decimal
instead of hexadecimal for better readability.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/pixcir_i2c_ts.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index af2336da6954..c8a35e97b595 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -249,7 +249,7 @@ static int pixcir_set_power_mode(struct pixcir_i2c_ts_data *ts,
 
 	ret = i2c_smbus_read_byte_data(ts->client, PIXCIR_REG_POWER_MODE);
 	if (ret < 0) {
-		dev_err(dev, "%s: can't read reg 0x%x : %d\n",
+		dev_err(dev, "%s: can't read reg %d : %d\n",
 			__func__, PIXCIR_REG_POWER_MODE, ret);
 		return ret;
 	}
@@ -262,7 +262,7 @@ static int pixcir_set_power_mode(struct pixcir_i2c_ts_data *ts,
 
 	ret = i2c_smbus_write_byte_data(ts->client, PIXCIR_REG_POWER_MODE, ret);
 	if (ret < 0) {
-		dev_err(dev, "%s: can't write reg 0x%x : %d\n",
+		dev_err(dev, "%s: can't write reg %d : %d\n",
 			__func__, PIXCIR_REG_POWER_MODE, ret);
 		return ret;
 	}
@@ -288,7 +288,7 @@ static int pixcir_set_int_mode(struct pixcir_i2c_ts_data *ts,
 
 	ret = i2c_smbus_read_byte_data(ts->client, PIXCIR_REG_INT_MODE);
 	if (ret < 0) {
-		dev_err(dev, "%s: can't read reg 0x%x : %d\n",
+		dev_err(dev, "%s: can't read reg %d : %d\n",
 			__func__, PIXCIR_REG_INT_MODE, ret);
 		return ret;
 	}
@@ -303,7 +303,7 @@ static int pixcir_set_int_mode(struct pixcir_i2c_ts_data *ts,
 
 	ret = i2c_smbus_write_byte_data(ts->client, PIXCIR_REG_INT_MODE, ret);
 	if (ret < 0) {
-		dev_err(dev, "%s: can't write reg 0x%x : %d\n",
+		dev_err(dev, "%s: can't write reg %d : %d\n",
 			__func__, PIXCIR_REG_INT_MODE, ret);
 		return ret;
 	}
@@ -321,7 +321,7 @@ static int pixcir_int_enable(struct pixcir_i2c_ts_data *ts, bool enable)
 
 	ret = i2c_smbus_read_byte_data(ts->client, PIXCIR_REG_INT_MODE);
 	if (ret < 0) {
-		dev_err(dev, "%s: can't read reg 0x%x : %d\n",
+		dev_err(dev, "%s: can't read reg %d : %d\n",
 			__func__, PIXCIR_REG_INT_MODE, ret);
 		return ret;
 	}
@@ -333,7 +333,7 @@ static int pixcir_int_enable(struct pixcir_i2c_ts_data *ts, bool enable)
 
 	ret = i2c_smbus_write_byte_data(ts->client, PIXCIR_REG_INT_MODE, ret);
 	if (ret < 0) {
-		dev_err(dev, "%s: can't write reg 0x%x : %d\n",
+		dev_err(dev, "%s: can't write reg %d : %d\n",
 			__func__, PIXCIR_REG_INT_MODE, ret);
 		return ret;
 	}
-- 
2.17.1


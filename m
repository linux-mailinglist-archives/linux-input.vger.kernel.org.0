Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1CA88743
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbfHJAUs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:48 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35364 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729714AbfHJAUr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so46892430pfn.2;
        Fri, 09 Aug 2019 17:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=43lIaCnwNb5i7KXi0HAI5ROLrfdEirdpKgchyS2WhC8=;
        b=kKxy4aKUhqEz2uV3LrJ0wWXBF7M+rvbDeApQiL1fTEN+jFdQEdVTROLJB7owshd+9t
         K7UlVDIIu7nS5zPkiciDXWx6X9vBhAnneBoXl7DRvOkuYl+QKYDr+MQZ3q/n7BCjFHbO
         52A5kPnT/jFDIoQzPxE558/EFEfSM/YEMXZ/ScPt4VLQ4pT0Na7sT2yOa0tE5++EGvkd
         mL1gl2gWvCtXTcySfwEecpGkaU8wAMopuudigHL2k9CEMwXPM77nYle/jNFijTaQPaPE
         qVnEbsuE4NQMYhydTpbEDPpw9zvgluWdbPLYq9za6gFmcMoQbuyh8D9eZuDpZ4N7O1t/
         SVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=43lIaCnwNb5i7KXi0HAI5ROLrfdEirdpKgchyS2WhC8=;
        b=T/f7n02Rop2K5q0o7nYELuamdqqt11UAwDWuPSmP4KnLEXxlzviBAibMcEZsAi0Ldn
         PqKcT2peJqcBuW903/NiKRORTphHP47aN7icHtzssT+oRqLOFjqBHtS1bOC2fOHgRi/R
         DgyfrWBv4XpSaUVG4KeIySFipXw2UNFf3uANP3cCt8sr4Stk2MipiHiEYhTGhe6qRHw/
         GQ6a2jTvxtyqNHZjFjDOZxze/4a0KDI7Yi3ia8kLSP49Z0vfWNbDBLgNijwSUTMdVDVi
         0G4p+RzQduqnOkcmKuv0Va3B5IASj3ezXO2P+btITnHrS35zwinFC4LSSKpP0txGjeU+
         OpnQ==
X-Gm-Message-State: APjAAAU2LPrXXIC6aY1YlyDBaDQLFvIoxIia6+yYQVs3riqULxWMyvlT
        zpiCS5hu7+LuQec5aYwNwwg=
X-Google-Smtp-Source: APXvYqymotV7dLIkt7TSNnr8paZ6DVYAXEP0h8hdEQ+J0PCtLWK1bBjd3ZhywDwR8//7I1ZYbOanqQ==
X-Received: by 2002:aa7:915a:: with SMTP id 26mr24302574pfi.247.1565396446168;
        Fri, 09 Aug 2019 17:20:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:45 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] Input: bu21013_ts - remove useless comments
Date:   Fri,  9 Aug 2019 17:20:33 -0700
Message-Id: <20190810002039.95876-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The comments for individual functions in the driver do not provide any
additional information beyond what function names indicate.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 61 +-------------------------
 1 file changed, 2 insertions(+), 59 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 0bdadd24296f..a5230f6ea5f0 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -159,14 +159,6 @@ struct bu21013_ts {
 	bool touch_stopped;
 };
 
-/**
- * bu21013_read_block_data(): read the touch co-ordinates
- * @data: bu21013_ts structure pointer
- * @buf: byte pointer
- *
- * Read the touch co-ordinates using i2c read block into buffer
- * and returns integer.
- */
 static int bu21013_read_block_data(struct bu21013_ts *ts, u8 *buf)
 {
 	int ret, i;
@@ -182,13 +174,6 @@ static int bu21013_read_block_data(struct bu21013_ts *ts, u8 *buf)
 	return -EINVAL;
 }
 
-/**
- * bu21013_do_touch_report(): Get the touch co-ordinates
- * @data: bu21013_ts structure pointer
- *
- * Get the touch co-ordinates from touch sensor registers and writes
- * into device structure and returns integer.
- */
 static int bu21013_do_touch_report(struct bu21013_ts *ts)
 {
 	u8	buf[LENGTH_OF_BUFFER];
@@ -243,14 +228,7 @@ static int bu21013_do_touch_report(struct bu21013_ts *ts)
 
 	return 0;
 }
-/**
- * bu21013_gpio_irq() - gpio thread function for touch interrupt
- * @irq: irq value
- * @device_data: void pointer
- *
- * This gpio thread function for touch interrupt
- * and returns irqreturn_t.
- */
+
 static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
 {
 	struct bu21013_ts *ts = device_data;
@@ -273,13 +251,6 @@ static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
 	return IRQ_HANDLED;
 }
 
-/**
- * bu21013_init_chip() - power on sequence for the bu21013 controller
- * @data: device structure pointer
- *
- * This function is used to power on
- * the bu21013 controller and returns integer.
- */
 static int bu21013_init_chip(struct bu21013_ts *ts)
 {
 	struct i2c_client *client = ts->client;
@@ -468,14 +439,6 @@ bu21013_parse_dt(struct device *dev)
 }
 #endif
 
-/**
- * bu21013_probe() - initializes the i2c-client touchscreen driver
- * @client: i2c client structure pointer
- * @id: i2c device id pointer
- *
- * This function used to initializes the i2c-client touchscreen
- * driver and returns integer.
- */
 static int bu21013_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -606,13 +569,7 @@ static int bu21013_probe(struct i2c_client *client,
 
 	return error;
 }
-/**
- * bu21013_remove() - removes the i2c-client touchscreen driver
- * @client: i2c client structure pointer
- *
- * This function uses to remove the i2c-client
- * touchscreen driver and returns integer.
- */
+
 static int bu21013_remove(struct i2c_client *client)
 {
 	struct bu21013_ts *ts = i2c_get_clientdata(client);
@@ -634,13 +591,6 @@ static int bu21013_remove(struct i2c_client *client)
 	return 0;
 }
 
-/**
- * bu21013_suspend() - suspend the touch screen controller
- * @dev: pointer to device structure
- *
- * This function is used to suspend the
- * touch panel controller and returns integer
- */
 static int __maybe_unused bu21013_suspend(struct device *dev)
 {
 	struct bu21013_ts *ts = dev_get_drvdata(dev);
@@ -657,13 +607,6 @@ static int __maybe_unused bu21013_suspend(struct device *dev)
 	return 0;
 }
 
-/**
- * bu21013_resume() - resume the touch screen controller
- * @dev: pointer to device structure
- *
- * This function is used to resume the touch panel
- * controller and returns integer.
- */
 static int __maybe_unused bu21013_resume(struct device *dev)
 {
 	struct bu21013_ts *ts = dev_get_drvdata(dev);
-- 
2.23.0.rc1.153.gdeed80330f-goog


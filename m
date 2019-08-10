Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CA188744
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730003AbfHJAUw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:52 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45595 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729714AbfHJAUv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:51 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so46601796pgp.12;
        Fri, 09 Aug 2019 17:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6kWKlAW9wj5JQmZ8QSnl0jKgAy5Z7kKQuJdduHW+BK0=;
        b=Z2AZScTJKxlhFrkGUdxX/CgiWrGZ71pmm5AlWvu5iwQKGp29b57jM1z3VGNIhw1I05
         jiP7pXT6c+Ab/gjNOh2oi4QohtUZpJyfd1FxEhszh+3I3u2W+q07uwnDBrWaKpTBqgeG
         VzAjrlKYJ/+lSK0oMcgEU0nBld7lCn8AWpFhugCqdkNH103wcayXkOzQFqD5CGDECWn9
         0yEP0lixOgpBzkIuh8AsJvHz3KCaEAEWCjZM1nnFenMFl9AVsniz6oxsbtb/NppUSb6H
         fnjrIs098hcMRVaDdPyYRoTzTfds557riF0u6fgX+ChFVoNR2jKhYl7eYFvzbr4ldjkA
         p2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6kWKlAW9wj5JQmZ8QSnl0jKgAy5Z7kKQuJdduHW+BK0=;
        b=kPvwIM5Cndz20HDoABb9+UZeKXO+Zu1Vcz6TWKlKyfiGMekZIx8UiwAYCEf9bXUKVD
         aTFvPrrcp3NpHVZrflolVfhFrttD/CAZ1BVTQ6plx36I8C/eDNGtCk4facbiBW5zGTD4
         twXyy9OAhZxH5bf196neIDvOdcHZcctqmFYQUk9ep2ZgApVj4fm8ZSuzFXfW5WwGie5g
         P/8xmbRidu3oqFndKagyp/LaUmR320XsGv6RfSkHDM9AAII/0//aluE0wo2AOJY8esIe
         EoWWBTiYUeiGhPrUFIlcT6T+RjouzUMoArTQJ7cZIfTJmF23jHs/XqBymhoZhWOZdasf
         uJgQ==
X-Gm-Message-State: APjAAAX0Zy20i+hqjD3Ys3nkEAOu3SsVXot/cv8J4ZLOIXEji2MrT7hv
        Bi1/sjcpHcggUjk26RzqW84=
X-Google-Smtp-Source: APXvYqxpKFcLLkz141v32wgIPDawaSVidkIF4RjQMZZ3hymtHHXTXTdRP0i9AZPPzi25nVtGrJo4mQ==
X-Received: by 2002:a62:3347:: with SMTP id z68mr24939461pfz.174.1565396450481;
        Fri, 09 Aug 2019 17:20:50 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:50 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] Input: bu21013_ts - fix suspend when wake source
Date:   Fri,  9 Aug 2019 17:20:37 -0700
Message-Id: <20190810002039.95876-10-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the touchscreen is configured as wakeup source we should not be cutting
off power to it.

Also, now that the driver relies on I2C client to supply IRQ, we do not
need to explicitly enable and disable IRQ for wakeup: if device is created
as wakeup source, I2C core will mark interrupt as wakeup one.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 48 +++++++++++++-------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index d745643861cb..d7e16e915743 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -547,44 +547,44 @@ static int bu21013_remove(struct i2c_client *client)
 
 static int __maybe_unused bu21013_suspend(struct device *dev)
 {
-	struct bu21013_ts *ts = dev_get_drvdata(dev);
-	struct i2c_client *client = ts->client;
+	struct i2c_client *client = to_i2c_client(dev);
+	struct bu21013_ts *ts = i2c_get_clientdata(client);
 
 	ts->touch_stopped = true;
-	if (device_may_wakeup(&client->dev))
-		enable_irq_wake(client->irq);
-	else
-		disable_irq(client->irq);
+	mb();
+	disable_irq(client->irq);
 
-	regulator_disable(ts->regulator);
+	if (!device_may_wakeup(&client->dev))
+		regulator_disable(ts->regulator);
 
 	return 0;
 }
 
 static int __maybe_unused bu21013_resume(struct device *dev)
 {
-	struct bu21013_ts *ts = dev_get_drvdata(dev);
-	struct i2c_client *client = ts->client;
-	int retval;
+	struct i2c_client *client = to_i2c_client(dev);
+	struct bu21013_ts *ts = i2c_get_clientdata(client);
+	int error;
 
-	retval = regulator_enable(ts->regulator);
-	if (retval < 0) {
-		dev_err(&client->dev, "bu21013 regulator enable failed\n");
-		return retval;
-	}
+	if (!device_may_wakeup(&client->dev)) {
+		error = regulator_enable(ts->regulator);
+		if (error) {
+			dev_err(&client->dev,
+				"failed to re-enable regulator when resuming\n");
+			return error;
+		}
 
-	retval = bu21013_init_chip(ts);
-	if (retval < 0) {
-		dev_err(&client->dev, "bu21013 controller config failed\n");
-		return retval;
+		error = bu21013_init_chip(ts);
+		if (error) {
+			dev_err(&client->dev,
+				"failed to reinitialize chip when resuming\n");
+			return error;
+		}
 	}
 
 	ts->touch_stopped = false;
-
-	if (device_may_wakeup(&client->dev))
-		disable_irq_wake(client->irq);
-	else
-		enable_irq(client->irq);
+	mb();
+	enable_irq(client->irq);
 
 	return 0;
 }
-- 
2.23.0.rc1.153.gdeed80330f-goog


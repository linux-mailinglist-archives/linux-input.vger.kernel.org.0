Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C452B39993B
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhFCEkb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:40:31 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:34594 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFCEka (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:40:30 -0400
Received: by mail-pl1-f177.google.com with SMTP id u9so2170616plr.1;
        Wed, 02 Jun 2021 21:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwoFt+YDQyQhxfnq961VZU5Jf/+5sxsJJaX0acjEBXE=;
        b=C3DXv7NMl/Uw80vgRKQfdquRd/YoCx8tRMrG/BDd/N1mjJ77Mi01CSrNSbkKkmmwYB
         IMoXTND/eW0oLppwffL+MpyRj+uRxEp4cyyOT6DK+aLvKKsrfBqOphxqRWR63U63cwM4
         M6bufKVt9T1NCIEwcN6qF9qUaGS7ztfR3FE7iR290Rg3tc7HV2++Chjm9Z72S3Y0okQ/
         TJWOcip9ogAEOSclWPpX4b94XCSW45RbhzidzQ+FzBhz625GuMVEcxQ1kQ582rE/Lwj8
         wNz4ii1HCdOK+AHIe3pzF0rb82Cj5rNdk6KyWQWyZMzEck7cf4mwnXMmprF4hCV+W6Jn
         DcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwoFt+YDQyQhxfnq961VZU5Jf/+5sxsJJaX0acjEBXE=;
        b=kMLG6cgzxjBHNxLMYkma/B2+SeirSZ/WuckedgTfTTYmZjFwnE7M9PqNzmJg/aJcvn
         AUXdyGJkhnJ6gd570iOK2XJkRx5BV/TUnduO9j1fm8mja5J/vNJyfEfsOl7NRTTwk0F6
         K15RF3iY3JzTU6kvPKTzhVSYqp+QyMkfhG8URHhzjDPCvToGXrN1d2g89jL40HJ4vNNk
         1zkmeTeokv+ZyFz9gCZSSieEXDLUvU+jQsNkCmcCObmBF6bHW0dCOTB8hDQDvQatcs5c
         W1EEaUocq46yDJ4eo/Frwh8uL3KyrH80yqI0pcCQQUgJ9HVg7EIoxLUQK0Azg4qMQScF
         ML5A==
X-Gm-Message-State: AOAM530QiO+jObhK/DcezczP8Wfr5t2uboDNQ6BLVW8zUOxFzheXeX4d
        8GmFI93uVMsHqG/eRq1Fn9ef8vWD2tc=
X-Google-Smtp-Source: ABdhPJwQXXCQGpLHiBRaSEb/7Erz/reTDL3D8w099btb2Xvd717wf5IqDBRnNY5XudQd4eBQTxhhxA==
X-Received: by 2002:a17:90a:5282:: with SMTP id w2mr34770518pjh.145.1622695049797;
        Wed, 02 Jun 2021 21:37:29 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id f28sm1132414pgb.12.2021.06.02.21.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:37:28 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] Input: cy8ctmg110_ts - rely on platform code to supply interrupt
Date:   Wed,  2 Jun 2021 21:37:20 -0700
Message-Id: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of using platform data to specify GPIO that is used as interrupt
source, rely on the platform and I2C core to set it up properly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 32 +----------------------
 include/linux/input/cy8ctmg110_pdata.h    |  1 -
 2 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index f465bae618fe..691f35f1bdd7 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -46,7 +46,6 @@ struct cy8ctmg110 {
 	char phys[32];
 	struct i2c_client *client;
 	int reset_pin;
-	int irq_pin;
 };
 
 /*
@@ -191,7 +190,6 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 	ts->client = client;
 	ts->input = input_dev;
 	ts->reset_pin = pdata->reset_pin;
-	ts->irq_pin = pdata->irq_pin;
 
 	snprintf(ts->phys, sizeof(ts->phys),
 		 "%s/input0", dev_name(&client->dev));
@@ -222,38 +220,13 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 	cy8ctmg110_power(ts, true);
 	cy8ctmg110_set_sleepmode(ts, false);
 
-	err = gpio_request(ts->irq_pin, "touch_irq_key");
-	if (err < 0) {
-		dev_err(&client->dev,
-			"Failed to request GPIO %d, error %d\n",
-			ts->irq_pin, err);
-		goto err_shutoff_device;
-	}
-
-	err = gpio_direction_input(ts->irq_pin);
-	if (err < 0) {
-		dev_err(&client->dev,
-			"Failed to configure input direction for GPIO %d, error %d\n",
-			ts->irq_pin, err);
-		goto err_free_irq_gpio;
-	}
-
-	client->irq = gpio_to_irq(ts->irq_pin);
-	if (client->irq < 0) {
-		err = client->irq;
-		dev_err(&client->dev,
-			"Unable to get irq number for GPIO %d, error %d\n",
-			ts->irq_pin, err);
-		goto err_free_irq_gpio;
-	}
-
 	err = request_threaded_irq(client->irq, NULL, cy8ctmg110_irq_thread,
 				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 				   "touch_reset_key", ts);
 	if (err < 0) {
 		dev_err(&client->dev,
 			"irq %d busy? error %d\n", client->irq, err);
-		goto err_free_irq_gpio;
+		goto err_shutoff_device;
 	}
 
 	err = input_register_device(input_dev);
@@ -266,8 +239,6 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 
 err_free_irq:
 	free_irq(client->irq, ts);
-err_free_irq_gpio:
-	gpio_free(ts->irq_pin);
 err_shutoff_device:
 	cy8ctmg110_set_sleepmode(ts, true);
 	cy8ctmg110_power(ts, false);
@@ -318,7 +289,6 @@ static int cy8ctmg110_remove(struct i2c_client *client)
 
 	free_irq(client->irq, ts);
 	input_unregister_device(ts->input);
-	gpio_free(ts->irq_pin);
 	if (ts->reset_pin)
 		gpio_free(ts->reset_pin);
 	kfree(ts);
diff --git a/include/linux/input/cy8ctmg110_pdata.h b/include/linux/input/cy8ctmg110_pdata.h
index 77582ae1745a..ee1d44545f30 100644
--- a/include/linux/input/cy8ctmg110_pdata.h
+++ b/include/linux/input/cy8ctmg110_pdata.h
@@ -5,7 +5,6 @@
 struct cy8ctmg110_pdata
 {
 	int reset_pin;		/* Reset pin is wired to this GPIO (optional) */
-	int irq_pin;		/* IRQ pin is wired to this GPIO */
 };
 
 #endif
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


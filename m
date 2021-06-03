Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA66B399939
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhFCEkZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:40:25 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54]:51105 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhFCEkY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:40:24 -0400
Received: by mail-pj1-f54.google.com with SMTP id i22so2944368pju.0;
        Wed, 02 Jun 2021 21:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sId2ExzAnq7rqy61mih6ScWMic6zfpfyFkAfotLhFTg=;
        b=UGpvhahrKOZD62tyRn42uCscBYd4ckwMgN1rN6/zg6EjQRUdkJaD8JxEbkh9QIb5+7
         OXNJofE42BQMwFkqYqLvGIgyXOS0suux7wNLeDoGbVmDXlsvD5suZ/aeiIKwABCHAZid
         czQKdZxYOV6aCsn6uuCaFIFMG25LiJ6JxubglKSjTlxyVdejmN/m78mIud9ByPjIjOYP
         nkNu2fxkA7Ak2WeRDXDU5DcaTMACOpRYnJPlewICA03o4utgLMDi5MGfhoUJLaCs7l+N
         u5+9Y/Irn579fw3cUMhXBlIsoCDZysS57rxol50RG4NRDugZIacGFCSmxyNcpwx7cJW6
         K9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sId2ExzAnq7rqy61mih6ScWMic6zfpfyFkAfotLhFTg=;
        b=n8VV8TpklJEOl+KZNRlgylgU1T3tsebaqY9QMD6Y6z0B9NmhGec9x8932mEBo4bHNQ
         qT34UtNAHMwJgO3ce3hrpWlpsuiI5Za73JihxaMRtD1qB2RS0sz0tAmSydozd60GaWVS
         SzOAFyXnnlp1HkLAKTmpaeFdqKVxZptOnPJZdyQx34IuwoXc3CConbKCbnCmKCpd+cSn
         dAYZnTJ5BNmUUWWbwFWegRFNxldU181yAeNjoOq+jGLmnysqyjxbcKTVds63FrWG5icz
         4aj0UIjLFNOB9IZLxoZRxuGC0i2xL7kzeB56YyxjSeLF+E9Aycnj4hpxzkrMZchhOV+k
         W8fw==
X-Gm-Message-State: AOAM530DS1XFyaY24pXW5gfwzhQvcF8uMXtwoNOb3Ui5mNbzz17tGZ5H
        T11htx5I4lUVuepLap6f5At18o5qIZk=
X-Google-Smtp-Source: ABdhPJx8dOYSl4dbKAnA6zL2QvbS9lBitKuBAyNnPH5FZnsBem9tK10fBdC/+kwHv+ythNtVUfnsMg==
X-Received: by 2002:a17:90b:1283:: with SMTP id fw3mr30106775pjb.133.1622695059852;
        Wed, 02 Jun 2021 21:37:39 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id f28sm1132414pgb.12.2021.06.02.21.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:37:39 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] Input: cy8ctmg110_ts - switch to using gpiod API
Date:   Wed,  2 Jun 2021 21:37:26 -0700
Message-Id: <20210603043726.3793876-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of legacy gpio API let's use newer gpiod API. This also allows us
to get rid of platform data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 41 +++++++++--------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index 33ccb31cad52..3e2d64fb1620 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -7,15 +7,13 @@
  * Some cleanups by Alan Cox <alan@linux.intel.com>
  */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
+#include <linux/i2c.h>
 #include <linux/input.h>
-#include <linux/slab.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/input/cy8ctmg110_pdata.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
 #include <asm/byteorder.h>
 
 #define CY8CTMG110_DRIVER_NAME      "cy8ctmg110"
@@ -46,7 +44,7 @@ struct cy8ctmg110 {
 	struct input_dev *input;
 	char phys[32];
 	struct i2c_client *client;
-	int reset_pin;
+	struct gpio_desc *reset_gpio;
 };
 
 /*
@@ -55,8 +53,8 @@ struct cy8ctmg110 {
  */
 static void cy8ctmg110_power(struct cy8ctmg110 *ts, bool poweron)
 {
-	if (ts->reset_pin)
-		gpio_direction_output(ts->reset_pin, 1 - poweron);
+	if (ts->reset_gpio)
+		gpiod_set_value_cansleep(ts->reset_gpio, !poweron);
 }
 
 static int cy8ctmg110_write_regs(struct cy8ctmg110 *tsc, unsigned char reg,
@@ -172,17 +170,10 @@ static void cy8ctmg110_shut_off(void *_ts)
 static int cy8ctmg110_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
-	const struct cy8ctmg110_pdata *pdata = dev_get_platdata(&client->dev);
 	struct cy8ctmg110 *ts;
 	struct input_dev *input_dev;
 	int err;
 
-	/* No pdata no way forward */
-	if (pdata == NULL) {
-		dev_err(&client->dev, "no pdata\n");
-		return -ENODEV;
-	}
-
 	if (!i2c_check_functionality(client->adapter,
 					I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -EIO;
@@ -197,7 +188,6 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 
 	ts->client = client;
 	ts->input = input_dev;
-	ts->reset_pin = pdata->reset_pin;
 
 	snprintf(ts->phys, sizeof(ts->phys),
 		 "%s/input0", dev_name(&client->dev));
@@ -212,14 +202,13 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 	input_set_abs_params(input_dev, ABS_Y,
 			CY8CTMG110_Y_MIN, CY8CTMG110_Y_MAX, 4, 0);
 
-	if (ts->reset_pin) {
-		err = devm_gpio_request(&client->dev, ts->reset_pin, NULL);
-		if (err) {
-			dev_err(&client->dev,
-				"Unable to request GPIO pin %d.\n",
-				ts->reset_pin);
-			return err;
-		}
+	ts->reset_gpio = devm_gpiod_get_optional(&client->dev, NULL,
+						 GPIOD_OUT_HIGH);
+	if (IS_ERR(ts->reset_gpio)) {
+		err = PTR_ERR(ts->reset_gpio);
+		dev_err(&client->dev,
+			"Unable to request reset GPIO: %d\n", err);
+		return err;
 	}
 
 	cy8ctmg110_power(ts, true);
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


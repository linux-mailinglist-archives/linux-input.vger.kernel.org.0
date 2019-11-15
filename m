Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC81FD9D7
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 10:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfKOJvD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 04:51:03 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39560 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfKOJun (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 04:50:43 -0500
Received: by mail-pg1-f193.google.com with SMTP id 29so5730562pgm.6
        for <linux-input@vger.kernel.org>; Fri, 15 Nov 2019 01:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8qEr97gtfYUdODVXHrydCPKcBmcl3QXX/86ZlTEe98E=;
        b=QQJOZQ06EiJLVWSjbduoLf4LkNGaqh8phPLZ2h1DtySMpWDgIgVtmGo8SdsS6PLc0c
         f6ZXatYcHKtikdAUYMGBCAPDqNFiWFhwygSSgIqDlTydVnZ0nEvxeOqI85YVEjKcBxeB
         lR3b7KrDUgaEdr0AwPZyhrigtJ6pBiDenxUjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8qEr97gtfYUdODVXHrydCPKcBmcl3QXX/86ZlTEe98E=;
        b=WONPa50sH8SaTl6V29lmMjIxLpAxoTUEwFxpQC31wp8Z2prfSOCkodJB09R/cOmD82
         q5UT6wex3/R+PWViiIqR7ZFhIEYO7QDO8GyiuzYNWQqr8UCLiQpfy9+OLFaASH6wOT7s
         lYupl1RKZjDnC5yUjUH7SSiD8Llfc1j6R973sQwk0DVTKx/lsqULSDQ8W6OO4ZdIKbAo
         5d/E1NJlr5f1y4ar+Qnk3A87WEQgHFc4PkbE8cARVzW62YTMC0xQyJvGpXXOKI5d3eP8
         Ws3ImcNe1S/Kw+ZaZw0PwjUGEDgGKna12ro1ZD1ObfGbZsoElEqEcN8HfrPqpAnIGGsD
         PiDA==
X-Gm-Message-State: APjAAAX4YJhZI57OFQz+AF6KM8NsekcBOEoKD4kKrRu1XmJRrDVhpP+9
        TtWWAabbLo0sA9WCt2Y8FCXIyg==
X-Google-Smtp-Source: APXvYqyQ11sgdQrhLcso9u2x5OGzo0gON/8oVYygh1e1I0YMu7O+Xj+8qff4KGAEy4JXO3F05HFRWw==
X-Received: by 2002:a17:90a:244a:: with SMTP id h68mr18333547pje.79.1573811442433;
        Fri, 15 Nov 2019 01:50:42 -0800 (PST)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
        by smtp.gmail.com with ESMTPSA id k190sm11401295pga.12.2019.11.15.01.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 01:50:42 -0800 (PST)
From:   Gwendal Grignou <gwendal@chromium.org>
To:     dmitry.torokhov@gmail.com, groeck@chromium.org,
        briannorris@chromium.org, jic23@kernel.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, lee.jones@linaro.org,
        bleung@chromium.org, enric.balletbo@collabora.com,
        dianders@chromium.org, fabien.lahoudere@collabora.com
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Gwendal Grignou <gwendal@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 15/18] iio: cros_ec: Remove pm function
Date:   Fri, 15 Nov 2019 01:34:09 -0800
Message-Id: <20191115093412.144922-16-gwendal@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191115093412.144922-1-gwendal@chromium.org>
References: <20191115093412.144922-1-gwendal@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since cros_ec_sensorhub is shutting down the FIFO when the device
suspends, no need to slow down the EC sampling period rate.
It was necesseary to do that before command CMD_FIFO_INT_ENABLE was
introduced, but now all supported chromebooks have it.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
Changes in v5:
  Added ack.
No changes in v4, v3.
New in v2.

 .../cros_ec_sensors/cros_ec_lid_angle.c       |  1 -
 .../common/cros_ec_sensors/cros_ec_sensors.c  |  1 -
 .../cros_ec_sensors/cros_ec_sensors_core.c    | 47 -------------------
 drivers/iio/light/cros_ec_light_prox.c        |  1 -
 .../linux/iio/common/cros_ec_sensors_core.h   |  5 --
 5 files changed, 55 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c b/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c
index e30a59fcf0f9..af801e203623 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c
@@ -127,7 +127,6 @@ MODULE_DEVICE_TABLE(platform, cros_ec_lid_angle_ids);
 static struct platform_driver cros_ec_lid_angle_platform_driver = {
 	.driver = {
 		.name	= DRV_NAME,
-		.pm	= &cros_ec_sensors_pm_ops,
 	},
 	.probe		= cros_ec_lid_angle_probe,
 	.id_table	= cros_ec_lid_angle_ids,
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index 62a0dd970988..9d0b8ad7a0a5 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -315,7 +315,6 @@ MODULE_DEVICE_TABLE(platform, cros_ec_sensors_ids);
 static struct platform_driver cros_ec_sensors_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-sensors",
-		.pm	= &cros_ec_sensors_pm_ops,
 	},
 	.probe		= cros_ec_sensors_probe,
 	.id_table	= cros_ec_sensors_ids,
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index cffc712c32a7..a34f6295fe34 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -723,52 +723,5 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_write);
 
-static int __maybe_unused cros_ec_sensors_prepare(struct device *dev)
-{
-	struct iio_dev *indio_dev = dev_get_drvdata(dev);
-	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
-
-	if (st->curr_sampl_freq == 0)
-		return 0;
-
-	/*
-	 * If the sensors are sampled at high frequency, we will not be able to
-	 * sleep. Set sampling to a long period if necessary.
-	 */
-	if (st->curr_sampl_freq < CROS_EC_MIN_SUSPEND_SAMPLING_FREQUENCY) {
-		mutex_lock(&st->cmd_lock);
-		st->param.cmd = MOTIONSENSE_CMD_EC_RATE;
-		st->param.ec_rate.data = CROS_EC_MIN_SUSPEND_SAMPLING_FREQUENCY;
-		cros_ec_motion_send_host_cmd(st, 0);
-		mutex_unlock(&st->cmd_lock);
-	}
-	return 0;
-}
-
-static void __maybe_unused cros_ec_sensors_complete(struct device *dev)
-{
-	struct iio_dev *indio_dev = dev_get_drvdata(dev);
-	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
-
-	if (st->curr_sampl_freq == 0)
-		return;
-
-	if (st->curr_sampl_freq < CROS_EC_MIN_SUSPEND_SAMPLING_FREQUENCY) {
-		mutex_lock(&st->cmd_lock);
-		st->param.cmd = MOTIONSENSE_CMD_EC_RATE;
-		st->param.ec_rate.data = st->curr_sampl_freq;
-		cros_ec_motion_send_host_cmd(st, 0);
-		mutex_unlock(&st->cmd_lock);
-	}
-}
-
-const struct dev_pm_ops cros_ec_sensors_pm_ops = {
-#ifdef CONFIG_PM_SLEEP
-	.prepare = cros_ec_sensors_prepare,
-	.complete = cros_ec_sensors_complete
-#endif
-};
-EXPORT_SYMBOL_GPL(cros_ec_sensors_pm_ops);
-
 MODULE_DESCRIPTION("ChromeOS EC sensor hub core functions");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 698b2ee81ebf..ccdc6d8958c6 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -256,7 +256,6 @@ MODULE_DEVICE_TABLE(platform, cros_ec_light_prox_ids);
 static struct platform_driver cros_ec_light_prox_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-light-prox",
-		.pm	= &cros_ec_sensors_pm_ops,
 	},
 	.probe		= cros_ec_light_prox_probe,
 	.id_table	= cros_ec_light_prox_ids,
diff --git a/include/linux/iio/common/cros_ec_sensors_core.h b/include/linux/iio/common/cros_ec_sensors_core.h
index b8f573ca9dcc..96ea4551945e 100644
--- a/include/linux/iio/common/cros_ec_sensors_core.h
+++ b/include/linux/iio/common/cros_ec_sensors_core.h
@@ -30,9 +30,6 @@ enum {
  */
 #define CROS_EC_SAMPLE_SIZE  (sizeof(s64) * 2)
 
-/* Minimum sampling period to use when device is suspending */
-#define CROS_EC_MIN_SUSPEND_SAMPLING_FREQUENCY 1000  /* 1 second */
-
 typedef irqreturn_t (*cros_ec_sensors_capture_t)(int irq, void *p);
 
 /**
@@ -117,8 +114,6 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 			       struct iio_chan_spec const *chan,
 			       int val, int val2, long mask);
 
-extern const struct dev_pm_ops cros_ec_sensors_pm_ops;
-
 /* List of extended channel specification for all sensors */
 extern const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[];
 
-- 
2.24.0.432.g9d3f5f5b63-goog


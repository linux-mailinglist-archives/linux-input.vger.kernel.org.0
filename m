Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7484DFD9D4
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 10:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbfKOJux (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 04:50:53 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36284 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbfKOJus (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 04:50:48 -0500
Received: by mail-pl1-f196.google.com with SMTP id d7so4310911pls.3
        for <linux-input@vger.kernel.org>; Fri, 15 Nov 2019 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I9AbLmgzL5HUPtfBQKW+OjtLwXvk5FwPkDoc4yLO7ss=;
        b=DvpAZTexvsub7TX9ZqjZXUrcKemFjUjBMyJ7cJkNuKveMkD9UMcpeWFV5s5oDPBlGv
         RBJVIMql3IinXWp3vqkHJOFbHCcAFP24ZmurMYdgWaqNDtYy8yABVqFWeoTVxRT6L+QK
         tj0fsZKuF7jLXJBKMkfmOAhJ15gtA4Cv1Ga0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I9AbLmgzL5HUPtfBQKW+OjtLwXvk5FwPkDoc4yLO7ss=;
        b=B7InXeZ1vWRXV6VpkLKfD9CRh6htIswt5gOseB7xr8gRZvffSpujCeHF9DKUqOJibL
         AEypLnzyfPkbPpmX3x8QqGYov69LGyPz3d5tDzKWnTOZPguP/Myoixy7mcAAD5a7Txe1
         7Sjcc0st0uzqJrJrvUgF0i/ngUKmyBZ8EfuJGe4qEqRhW6fiDXHl6jTgkIP68cToSTUJ
         z8cslbhUZqpO3/QBRmhZyGnWKg6L2tLqfE5wNwH9410vGVYJfZo0m1QHc1xLs4wcBbHb
         pFGthe0U2+ffvCwfnmwIflw2tLISLoL77nX0bG27fa/EaRU6peQuOIiglp3FkF58jFP8
         +ZQw==
X-Gm-Message-State: APjAAAWY7BlgKlJtaFkHYq8/xwDyza8DIl+ZRJUEwtDVFnLCEKteLKi+
        kIvOVWbvWjVHxAxzoMB9myEe+Q==
X-Google-Smtp-Source: APXvYqxQeXhfbPFi9eiwtw1t1ct3rvU/HQXO5ayAR79Oztze8OW/vFW07MOaKHZRLEPAQZpobXAyRg==
X-Received: by 2002:a17:90a:e90:: with SMTP id 16mr18509959pjx.65.1573811446436;
        Fri, 15 Nov 2019 01:50:46 -0800 (PST)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
        by smtp.gmail.com with ESMTPSA id y123sm9487481pfg.64.2019.11.15.01.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 01:50:46 -0800 (PST)
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
Subject: [PATCH v5 18/18] iio: cros_ec: Use Hertz as unit for sampling frequency
Date:   Fri, 15 Nov 2019 01:34:12 -0800
Message-Id: <20191115093412.144922-19-gwendal@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191115093412.144922-1-gwendal@chromium.org>
References: <20191115093412.144922-1-gwendal@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To be compliant with other sensors, set and get sensor sampling
frequency in Hz, not mHz.

Fixes: ae7b02ad2f32 ("iio: common: cros_ec_sensors: Expose
cros_ec_sensors frequency range via iio sysfs")

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes in v5:
  Added ack.
Changes in v4:
- Check patch with --strict option
    Alignement
No changes in v3.
No changes in v2.

 .../cros_ec_sensors/cros_ec_sensors_core.c    | 32 +++++++++++--------
 .../linux/iio/common/cros_ec_sensors_core.h   |  6 ++--
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index cd095426fc11..a00ba144c10c 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -254,6 +254,7 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 	struct cros_ec_dev *ec = sensor_hub->ec;
 	struct cros_ec_sensor_platform *sensor_platform = dev_get_platdata(dev);
 	u32 ver_mask;
+	int frequencies[ARRAY_SIZE(state->frequencies) / 2] = { 0 };
 	int ret, i;
 
 	platform_set_drvdata(pdev, indio_dev);
@@ -304,20 +305,22 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 			state->calib[i].scale = MOTION_SENSE_DEFAULT_SCALE;
 
 		/* 0 is a correct value used to stop the device */
-		state->frequencies[0] = 0;
 		if (state->msg->version < 3) {
 			get_default_min_max_freq(state->resp->info.type,
-						 &state->frequencies[1],
-						 &state->frequencies[2],
+						 &frequencies[1],
+						 &frequencies[2],
 						 &state->fifo_max_event_count);
 		} else {
-			state->frequencies[1] =
-			    state->resp->info_3.min_frequency;
-			state->frequencies[2] =
-			    state->resp->info_3.max_frequency;
+			frequencies[1] = state->resp->info_3.min_frequency;
+			frequencies[2] = state->resp->info_3.max_frequency;
 			state->fifo_max_event_count =
 			    state->resp->info_3.fifo_max_event_count;
 		}
+		for (i = 0; i < ARRAY_SIZE(frequencies); i++) {
+			state->frequencies[2 * i] = frequencies[i] / 1000;
+			state->frequencies[2 * i + 1] =
+				(frequencies[i] % 1000) * 1000;
+		}
 
 		ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 						      trigger_capture, NULL);
@@ -713,7 +716,7 @@ int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
 			  struct iio_chan_spec const *chan,
 			  int *val, int *val2, long mask)
 {
-	int ret;
+	int ret, frequency;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
@@ -725,8 +728,10 @@ int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
 		if (ret)
 			break;
 
-		*val = st->resp->sensor_odr.ret;
-		ret = IIO_VAL_INT;
+		frequency = st->resp->sensor_odr.ret;
+		*val = frequency / 1000;
+		*val2 = (frequency % 1000) * 1000;
+		ret = IIO_VAL_INT_PLUS_MICRO;
 		break;
 	default:
 		ret = -EINVAL;
@@ -761,7 +766,7 @@ int cros_ec_sensors_core_read_avail(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*length = ARRAY_SIZE(state->frequencies);
 		*vals = (const int *)&state->frequencies;
-		*type = IIO_VAL_INT;
+		*type = IIO_VAL_INT_PLUS_MICRO;
 		return IIO_AVAIL_LIST;
 	}
 
@@ -783,12 +788,13 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 			       struct iio_chan_spec const *chan,
 			       int val, int val2, long mask)
 {
-	int ret;
+	int ret, frequency;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
+		frequency = val * 1000 + val2 / 1000;
 		st->param.cmd = MOTIONSENSE_CMD_SENSOR_ODR;
-		st->param.sensor_odr.data = val;
+		st->param.sensor_odr.data = frequency;
 
 		/* Always roundup, so caller gets at least what it asks for. */
 		st->param.sensor_odr.roundup = 1;
diff --git a/include/linux/iio/common/cros_ec_sensors_core.h b/include/linux/iio/common/cros_ec_sensors_core.h
index bc26ae2e3272..7bc961defa87 100644
--- a/include/linux/iio/common/cros_ec_sensors_core.h
+++ b/include/linux/iio/common/cros_ec_sensors_core.h
@@ -51,6 +51,8 @@ typedef irqreturn_t (*cros_ec_sensors_capture_t)(int irq, void *p);
  *				is always 8-byte aligned.
  * @read_ec_sensors_data:	function used for accessing sensors values
  * @fifo_max_event_count:	Size of the EC sensor FIFO
+ * @frequencies:		Table of known available frequencies:
+ *				0, Min and Max in mHz
  */
 struct cros_ec_sensors_core_state {
 	struct cros_ec_device *ec;
@@ -74,9 +76,7 @@ struct cros_ec_sensors_core_state {
 				    unsigned long scan_mask, s16 *data);
 
 	u32 fifo_max_event_count;
-
-	/* Table of known available frequencies : 0, Min and Max in mHz */
-	int frequencies[3];
+	int frequencies[6];
 };
 
 int cros_ec_sensors_read_lpc(struct iio_dev *indio_dev, unsigned long scan_mask,
-- 
2.24.0.432.g9d3f5f5b63-goog


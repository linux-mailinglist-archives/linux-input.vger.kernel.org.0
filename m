Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6ACFD9DC
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 10:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKOJvN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 04:51:13 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43085 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfKOJuj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 04:50:39 -0500
Received: by mail-pf1-f193.google.com with SMTP id 3so6356514pfb.10
        for <linux-input@vger.kernel.org>; Fri, 15 Nov 2019 01:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+yTCYl1jNvvCObBLOcFJSOfwKyx7pQf7cZxoCfZ1EFU=;
        b=lPSPGRICa/5wbP1vWoY0gWSR4ahd0vouQdWU+P5juDGdxqse4qrZ20uBjJ+4THUyqk
         tYu5+Cl9XSCctJqcQeo9k/jAJVaxKufHIBbiDecSPhV6KMRykipIUsIwRcnbk3JwPOsr
         FMp9CbThhcpQbqcJG/raiXqAH1xmuGcEVwUgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yTCYl1jNvvCObBLOcFJSOfwKyx7pQf7cZxoCfZ1EFU=;
        b=hRR00E+BMadw7F1vHe6AEdsPV3XK5o/WZ9I7eostHn7q6Vxkwze5VN32oPgaFZX+S9
         3KBEHr9tRaOV58hhiJ+IxyU0iPuJRU2MLWDRrXttYob1vNDkDDUe64RtsfWIaL9DlgXy
         sJgpNkw9ei8CdSyfcjQuOxJCD5TqLbHDDtcmJa13881Srwrv8FUL+9D7apfscNAg1rJi
         C0+NvWbEVOUC5zUwMYJTKhQlZweSr7+PcnNRDi7pJYMYoGIJDRV0BWhQbY++8oHrRJox
         sh6gx0lCmZSK9RUEeg6y1AMhDW48M3ams6S1JuRptP4bzF/8ZtsFt4yrtRiP6WzGmlBQ
         H1Sw==
X-Gm-Message-State: APjAAAXXormSHYcXtFzkOljYKAh+3yvJagJuYvvv1bNDR5Vj3M/fQgIL
        nT40dUVJLMHmQFMtSzehRP5liQ==
X-Google-Smtp-Source: APXvYqzi7vWcp3Vjuo/85JblzYEh+rL0d8pOLEyEkdIEETr5liY0b8F754HjFADclxjA/xM3hftBkA==
X-Received: by 2002:a62:1b50:: with SMTP id b77mr16305389pfb.187.1573811438144;
        Fri, 15 Nov 2019 01:50:38 -0800 (PST)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
        by smtp.gmail.com with ESMTPSA id x2sm9147834pfn.167.2019.11.15.01.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 01:50:37 -0800 (PST)
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
Subject: [PATCH v5 12/18] iio: cros_ec: Move function description to .c file
Date:   Fri, 15 Nov 2019 01:34:06 -0800
Message-Id: <20191115093412.144922-13-gwendal@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191115093412.144922-1-gwendal@chromium.org>
References: <20191115093412.144922-1-gwendal@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To prevent comment rot, move function description to
cros_ec_sensors_core.c.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes in v5:
  Added ack.
No changes in v4.
Changes in v3:
  fix spelling.
New in v2.

 .../cros_ec_sensors/cros_ec_sensors_core.c    | 69 ++++++++++++++++
 .../linux/iio/common/cros_ec_sensors_core.h   | 80 -------------------
 2 files changed, 69 insertions(+), 80 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 81a7f692de2f..b47da497a3c3 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -83,6 +83,14 @@ static void get_default_min_max_freq(enum motionsensor_type type,
 	}
 }
 
+/**
+ * cros_ec_sensors_core_init() - basic initialization of the core structure
+ * @pdev:		platform device created for the sensors
+ * @indio_dev:		iio device structure of the device
+ * @physical_device:	true if the device refers to a physical device
+ *
+ * Return: 0 on success, -errno on failure.
+ */
 int cros_ec_sensors_core_init(struct platform_device *pdev,
 			      struct iio_dev *indio_dev,
 			      bool physical_device)
@@ -160,6 +168,16 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_init);
 
+/**
+ * cros_ec_motion_send_host_cmd() - send motion sense host command
+ * @state:		pointer to state information for device
+ * @opt_length:	optional length to reduce the response size, useful on the data
+ *		path. Otherwise, the maximal allowed response size is used
+ *
+ * When called, the sub-command is assumed to be set in param->cmd.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
 int cros_ec_motion_send_host_cmd(struct cros_ec_sensors_core_state *state,
 				 u16 opt_length)
 {
@@ -422,6 +440,14 @@ int cros_ec_sensors_read_lpc(struct iio_dev *indio_dev,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_read_lpc);
 
+/**
+ * cros_ec_sensors_read_cmd() - retrieve data using the EC command protocol
+ * @indio_dev:	pointer to IIO device
+ * @scan_mask:	bitmap of the sensor indices to scan
+ * @data:	location to store data
+ *
+ * Return: 0 on success, -errno on failure.
+ */
 int cros_ec_sensors_read_cmd(struct iio_dev *indio_dev,
 			     unsigned long scan_mask, s16 *data)
 {
@@ -446,6 +472,18 @@ int cros_ec_sensors_read_cmd(struct iio_dev *indio_dev,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_read_cmd);
 
+/**
+ * cros_ec_sensors_capture() - the trigger handler function
+ * @irq:	the interrupt number.
+ * @p:		a pointer to the poll function.
+ *
+ * On a trigger event occurring, if the pollfunc is attached then this
+ * handler is called as a threaded interrupt (and hence may sleep). It
+ * is responsible for grabbing data from the device and pushing it into
+ * the associated buffer.
+ *
+ * Return: IRQ_HANDLED
+ */
 irqreturn_t cros_ec_sensors_capture(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
@@ -481,6 +519,16 @@ irqreturn_t cros_ec_sensors_capture(int irq, void *p)
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_capture);
 
+/**
+ * cros_ec_sensors_core_read() - function to request a value from the sensor
+ * @st:		pointer to state information for device
+ * @chan:	channel specification structure table
+ * @val:	will contain one element making up the returned value
+ * @val2:	will contain another element making up the returned value
+ * @mask:	specifies which values to be requested
+ *
+ * Return:	the type of value returned by the device
+ */
 int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
 			  struct iio_chan_spec const *chan,
 			  int *val, int *val2, long mask)
@@ -521,6 +569,17 @@ int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_read);
 
+/**
+ * cros_ec_sensors_core_read_avail() - get available values
+ * @indio_dev:		pointer to state information for device
+ * @chan:	channel specification structure table
+ * @vals:	list of available values
+ * @type:	type of data returned
+ * @length:	number of data returned in the array
+ * @mask:	specifies which values to be requested
+ *
+ * Return:	an error code, IIO_AVAIL_RANGE or IIO_AVAIL_LIST
+ */
 int cros_ec_sensors_core_read_avail(struct iio_dev *indio_dev,
 				    struct iio_chan_spec const *chan,
 				    const int **vals,
@@ -542,6 +601,16 @@ int cros_ec_sensors_core_read_avail(struct iio_dev *indio_dev,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_read_avail);
 
+/**
+ * cros_ec_sensors_core_write() - function to write a value to the sensor
+ * @st:		pointer to state information for device
+ * @chan:	channel specification structure table
+ * @val:	first part of value to write
+ * @val2:	second part of value to write
+ * @mask:	specifies which values to write
+ *
+ * Return:	the type of value returned by the device
+ */
 int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 			       struct iio_chan_spec const *chan,
 			       int val, int val2, long mask)
diff --git a/include/linux/iio/common/cros_ec_sensors_core.h b/include/linux/iio/common/cros_ec_sensors_core.h
index bb331e6356a9..0af918978f97 100644
--- a/include/linux/iio/common/cros_ec_sensors_core.h
+++ b/include/linux/iio/common/cros_ec_sensors_core.h
@@ -79,95 +79,25 @@ struct cros_ec_sensors_core_state {
 	int frequencies[3];
 };
 
-/**
- * cros_ec_sensors_read_lpc() - retrieve data from EC shared memory
- * @indio_dev:	pointer to IIO device
- * @scan_mask:	bitmap of the sensor indices to scan
- * @data:	location to store data
- *
- * This is the safe function for reading the EC data. It guarantees that the
- * data sampled was not modified by the EC while being read.
- *
- * Return: 0 on success, -errno on failure.
- */
 int cros_ec_sensors_read_lpc(struct iio_dev *indio_dev, unsigned long scan_mask,
 			     s16 *data);
 
-/**
- * cros_ec_sensors_read_cmd() - retrieve data using the EC command protocol
- * @indio_dev:	pointer to IIO device
- * @scan_mask:	bitmap of the sensor indices to scan
- * @data:	location to store data
- *
- * Return: 0 on success, -errno on failure.
- */
 int cros_ec_sensors_read_cmd(struct iio_dev *indio_dev, unsigned long scan_mask,
 			     s16 *data);
 
 struct platform_device;
-/**
- * cros_ec_sensors_core_init() - basic initialization of the core structure
- * @pdev:		platform device created for the sensors
- * @indio_dev:		iio device structure of the device
- * @physical_device:	true if the device refers to a physical device
- *
- * Return: 0 on success, -errno on failure.
- */
 int cros_ec_sensors_core_init(struct platform_device *pdev,
 			      struct iio_dev *indio_dev, bool physical_device);
 
-/**
- * cros_ec_sensors_capture() - the trigger handler function
- * @irq:	the interrupt number.
- * @p:		a pointer to the poll function.
- *
- * On a trigger event occurring, if the pollfunc is attached then this
- * handler is called as a threaded interrupt (and hence may sleep). It
- * is responsible for grabbing data from the device and pushing it into
- * the associated buffer.
- *
- * Return: IRQ_HANDLED
- */
 irqreturn_t cros_ec_sensors_capture(int irq, void *p);
 
-/**
- * cros_ec_motion_send_host_cmd() - send motion sense host command
- * @st:		pointer to state information for device
- * @opt_length:	optional length to reduce the response size, useful on the data
- *		path. Otherwise, the maximal allowed response size is used
- *
- * When called, the sub-command is assumed to be set in param->cmd.
- *
- * Return: 0 on success, -errno on failure.
- */
 int cros_ec_motion_send_host_cmd(struct cros_ec_sensors_core_state *st,
 				 u16 opt_length);
 
-/**
- * cros_ec_sensors_core_read() - function to request a value from the sensor
- * @st:		pointer to state information for device
- * @chan:	channel specification structure table
- * @val:	will contain one element making up the returned value
- * @val2:	will contain another element making up the returned value
- * @mask:	specifies which values to be requested
- *
- * Return:	the type of value returned by the device
- */
 int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
 			      struct iio_chan_spec const *chan,
 			      int *val, int *val2, long mask);
 
-/**
- * cros_ec_sensors_core_read_avail() - get available values
- * @indio_dev:		pointer to state information for device
- * @chan:	channel specification structure table
- * @vals:	list of available values
- * @type:	type of data returned
- * @length:	number of data returned in the array
- * @mask:	specifies which values to be requested
- *
- * Return:	an error code, IIO_AVAIL_RANGE or IIO_AVAIL_LIST
- */
 int cros_ec_sensors_core_read_avail(struct iio_dev *indio_dev,
 				    struct iio_chan_spec const *chan,
 				    const int **vals,
@@ -175,16 +105,6 @@ int cros_ec_sensors_core_read_avail(struct iio_dev *indio_dev,
 				    int *length,
 				    long mask);
 
-/**
- * cros_ec_sensors_core_write() - function to write a value to the sensor
- * @st:		pointer to state information for device
- * @chan:	channel specification structure table
- * @val:	first part of value to write
- * @val2:	second part of value to write
- * @mask:	specifies which values to write
- *
- * Return:	the type of value returned by the device
- */
 int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 			       struct iio_chan_spec const *chan,
 			       int val, int val2, long mask);
-- 
2.24.0.432.g9d3f5f5b63-goog


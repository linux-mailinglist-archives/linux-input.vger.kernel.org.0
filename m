Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992F55F17AD
	for <lists+linux-input@lfdr.de>; Sat,  1 Oct 2022 02:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbiJAAwk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 20:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiJAAwj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 20:52:39 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9F115D854
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 17:52:38 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id g23so3662106qtu.2
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 17:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yNhCyplIk7hFF6L+RQG60LJiofe2O5/nfA2qcsGAJqg=;
        b=FC8QmrfagLfPRpHm1HJz36o/k9mLeEP46i0GsyVeqIDMtBtRWlndnKqM9nbOAZ9hPW
         7VGohjyZs1s7Sn8rrgQqjd59kbQJMC9aQLYpCuLh7J/eepXMSqiTZX1KGxGobwa/UfzJ
         hTChBohSQyXwKixdjbm8Fr0mezfY4tiVHY7v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yNhCyplIk7hFF6L+RQG60LJiofe2O5/nfA2qcsGAJqg=;
        b=bt0PmdiYfvZJxXkYh+HJqrpSiR+m2nN3K4Q5jIk+/5eO6aaP+sMee0I3cmWznaAz+S
         Hh9OyBlDz/8BSE/WS+G16lK13aipWkjpIDTbP+UGsFNiwGpEAw+Ezui3F2yhZrUlDFNw
         V/rhQGlVKXL/taTky3aEsdA72vk8LsVHIPHJSALaUIartep1XkTtFegyK7J+PGLT592Z
         QmgFQiH0ipVOf/k8MFvucW1MakHh9RCcIqvxtg3djTyBuJcSWDliejcOKis7fd28a7sp
         CPH+MZ06R7WcivInZ9PcV7EFppIv2jy6e3G17b6jbc79QMPUDOEYD0A4++ODd0NXOLl0
         4mMw==
X-Gm-Message-State: ACrzQf2Mt+2weeCNrrXnXHi2m/ye/NuykhWUL4p11j6twpU2qf7bpbmx
        chfMchACqazSipN3dxMZhzaYfQ==
X-Google-Smtp-Source: AMsMyM7B5F6qNX3e3Fm2Sj5gQmNVRNVnam4t/DiEw/9BDbmh91su1xx4m0Zw/lz1E2QidzcHleFVOQ==
X-Received: by 2002:ac8:5952:0:b0:35c:2f9b:3be5 with SMTP id 18-20020ac85952000000b0035c2f9b3be5mr9009219qtz.44.1664585557585;
        Fri, 30 Sep 2022 17:52:37 -0700 (PDT)
Received: from localhost.localdomain ([185.193.125.71])
        by smtp.gmail.com with ESMTPSA id r10-20020a05622a034a00b0035ce8965045sm3224817qtw.42.2022.09.30.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 17:52:37 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v6 3/3] HID: mcp2221: add ADC/DAC support via iio subsystem
Date:   Fri, 30 Sep 2022 17:52:08 -0700
Message-Id: <20221001005208.8010-4-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221001005208.8010-1-matt.ranostay@konsulko.com>
References: <20221001005208.8010-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for 3x 10-bit ADC and 1x DAC channels registered via the iio
subsystem.

To prevent breakage and unexpected dependencies this support only is
only built if CONFIG_IIO is enabled, and is only weakly referenced by
'imply IIO' within the respective Kconfig.

Additionally the iio device only gets registered if at least one channel
is enabled in the power-on configuration read from SRAM.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/Kconfig       |   1 +
 drivers/hid/hid-mcp2221.c | 258 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 258 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 745fc38794ad..17cce4c50e8d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1253,6 +1253,7 @@ config HID_MCP2221
 	tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
 	depends on USB_HID && I2C
 	imply GPIOLIB
+	imply IIO
 	help
 	Provides I2C and SMBUS host adapter functionality over USB-HID
 	through MCP2221 device.
diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index fb54f1c6fd9c..2b3c3a483300 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -10,12 +10,14 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/hid.h>
 #include <linux/hidraw.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
+#include <linux/iio/iio.h>
 #include "hid-ids.h"
 
 /* Commands codes in a raw output report */
@@ -30,6 +32,9 @@ enum {
 	MCP2221_I2C_CANCEL = 0x10,
 	MCP2221_GPIO_SET = 0x50,
 	MCP2221_GPIO_GET = 0x51,
+	MCP2221_SET_SRAM_SETTINGS = 0x60,
+	MCP2221_GET_SRAM_SETTINGS = 0x61,
+	MCP2221_READ_FLASH_DATA = 0xb0,
 };
 
 /* Response codes in a raw input report */
@@ -89,6 +94,7 @@ struct mcp2221 {
 	struct i2c_adapter adapter;
 	struct mutex lock;
 	struct completion wait_in_report;
+	struct delayed_work init_work;
 	u8 *rxbuf;
 	u8 txbuf[64];
 	int rxbuf_idx;
@@ -97,6 +103,18 @@ struct mcp2221 {
 	struct gpio_chip *gc;
 	u8 gp_idx;
 	u8 gpio_dir;
+	u8 mode[4];
+#if IS_REACHABLE(CONFIG_IIO)
+	struct iio_chan_spec iio_channels[3];
+	u16 adc_values[3];
+	u8 adc_scale;
+	u8 dac_value;
+	u16 dac_scale;
+#endif
+};
+
+struct mcp2221_iio {
+	struct mcp2221 *mcp;
 };
 
 /*
@@ -713,7 +731,7 @@ static int mcp_get_i2c_eng_state(struct mcp2221 *mcp,
 static int mcp2221_raw_event(struct hid_device *hdev,
 				struct hid_report *report, u8 *data, int size)
 {
-	u8 *buf;
+	u8 *buf, tmp;
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
 	switch (data[0]) {
@@ -745,6 +763,9 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				break;
 			}
 			mcp->status = mcp_get_i2c_eng_state(mcp, data, 8);
+#if IS_REACHABLE(CONFIG_IIO)
+			memcpy(&mcp->adc_values, &data[50], sizeof(mcp->adc_values));
+#endif
 			break;
 		default:
 			mcp->status = -EIO;
@@ -816,6 +837,66 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 		complete(&mcp->wait_in_report);
 		break;
 
+	case MCP2221_SET_SRAM_SETTINGS:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			mcp->status = 0;
+			break;
+		default:
+			mcp->status = -EAGAIN;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
+	case MCP2221_GET_SRAM_SETTINGS:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			memcpy(&mcp->mode, &data[22], 4);
+#if IS_REACHABLE(CONFIG_IIO)
+			mcp->dac_value = data[6] & GENMASK(4, 0);
+#endif
+			mcp->status = 0;
+			break;
+		default:
+			mcp->status = -EAGAIN;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
+	case MCP2221_READ_FLASH_DATA:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			mcp->status = 0;
+
+			/* Only handles CHIP SETTINGS subpage currently */
+			if (mcp->txbuf[1] != 0) {
+				mcp->status = -EIO;
+				break;
+			}
+
+#if IS_REACHABLE(CONFIG_IIO)
+			/* DAC scale value */
+			tmp = FIELD_GET(GENMASK(7, 6), data[6]);
+			if ((data[6] & BIT(5)) && tmp)
+				mcp->dac_scale = tmp + 4;
+			else
+				mcp->dac_scale = 5;
+
+			/* ADC scale value */
+			tmp = FIELD_GET(GENMASK(4, 3), data[7]);
+			if ((data[7] & BIT(2)) && tmp)
+				mcp->adc_scale = tmp - 1;
+			else
+				mcp->adc_scale = 0;
+#endif
+
+			break;
+		default:
+			mcp->status = -EAGAIN;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
 	default:
 		mcp->status = -EIO;
 		complete(&mcp->wait_in_report);
@@ -838,6 +919,176 @@ static void mcp2221_remove(struct hid_device *hdev)
 {
 }
 
+#if IS_REACHABLE(CONFIG_IIO)
+static int mcp2221_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *channel, int *val,
+			    int *val2, long mask)
+{
+	struct mcp2221_iio *priv = iio_priv(indio_dev);
+	struct mcp2221 *mcp = priv->mcp;
+	int ret;
+
+	if (mask == IIO_CHAN_INFO_SCALE) {
+		if (channel->output)
+			*val = 1 << mcp->dac_scale;
+		else
+			*val = 1 << mcp->adc_scale;
+
+		return IIO_VAL_INT;
+	}
+
+	mutex_lock(&mcp->lock);
+
+	if (channel->output) {
+		*val = mcp->dac_value;
+		ret = IIO_VAL_INT;
+	} else {
+		/* Read ADC values */
+		ret = mcp_chk_last_cmd_status(mcp);
+
+		if (!ret) {
+			*val = le16_to_cpu(mcp->adc_values[channel->address]);
+			if (*val >= BIT(10))
+				ret =  -EINVAL;
+			else
+				ret = IIO_VAL_INT;
+		}
+	}
+
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
+static int mcp2221_write_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int val, int val2, long mask)
+{
+	struct mcp2221_iio *priv = iio_priv(indio_dev);
+	struct mcp2221 *mcp = priv->mcp;
+	int ret;
+
+	if (val < 0 || val >= BIT(5))
+		return -EINVAL;
+
+	mutex_lock(&mcp->lock);
+
+	memset(mcp->txbuf, 0, 12);
+	mcp->txbuf[0] = MCP2221_SET_SRAM_SETTINGS;
+	mcp->txbuf[4] = BIT(7) | val;
+
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 12);
+	if (!ret)
+		mcp->dac_value = val;
+
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
+static const struct iio_info mcp2221_info = {
+	.read_raw = &mcp2221_read_raw,
+	.write_raw = &mcp2221_write_raw,
+};
+
+static int mcp_iio_channels(struct mcp2221 *mcp)
+{
+	int idx, cnt = 0;
+	bool dac_created = false;
+
+	/* GP0 doesn't have ADC/DAC alternative function */
+	for (idx = 1; idx < MCP_NGPIO; idx++) {
+		struct iio_chan_spec *chan = &mcp->iio_channels[cnt];
+
+		switch (mcp->mode[idx]) {
+		case 2:
+			chan->address = idx - 1;
+			chan->channel = cnt++;
+			break;
+		case 3:
+			/* GP1 doesn't have DAC alternative function */
+			if (idx == 1 || dac_created)
+				continue;
+			/* DAC1 and DAC2 outputs are connected to the same DAC */
+			dac_created = true;
+			chan->output = 1;
+			cnt++;
+			break;
+		default:
+			continue;
+		};
+
+		chan->type = IIO_VOLTAGE;
+		chan->indexed = 1;
+		chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+		chan->info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE);
+		chan->scan_index = -1;
+	}
+
+	return cnt;
+}
+
+static void mcp_init_work(struct work_struct *work)
+{
+	struct iio_dev *indio_dev;
+	struct mcp2221 *mcp = container_of(work, struct mcp2221, init_work.work);
+	struct mcp2221_iio *data;
+	static int retries = 5;
+	int ret, num_channels;
+
+	hid_hw_power(mcp->hdev, PM_HINT_FULLON);
+	mutex_lock(&mcp->lock);
+
+	mcp->txbuf[0] = MCP2221_GET_SRAM_SETTINGS;
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+
+	if (ret == -EAGAIN)
+		goto reschedule_task;
+
+	num_channels = mcp_iio_channels(mcp);
+	if (!num_channels)
+		goto unlock;
+
+	mcp->txbuf[0] = MCP2221_READ_FLASH_DATA;
+	mcp->txbuf[1] = 0;
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 2);
+
+	if (ret == -EAGAIN)
+		goto reschedule_task;
+
+	indio_dev = devm_iio_device_alloc(&mcp->hdev->dev, sizeof(*data));
+	if (!indio_dev)
+		goto unlock;
+
+	data = iio_priv(indio_dev);
+	data->mcp = mcp;
+
+	indio_dev->name = "mcp2221";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &mcp2221_info;
+	indio_dev->channels = mcp->iio_channels;
+	indio_dev->num_channels = num_channels;
+
+	devm_iio_device_register(&mcp->hdev->dev, indio_dev);
+
+unlock:
+	mutex_unlock(&mcp->lock);
+	hid_hw_power(mcp->hdev, PM_HINT_NORMAL);
+
+	return;
+
+reschedule_task:
+	mutex_unlock(&mcp->lock);
+	hid_hw_power(mcp->hdev, PM_HINT_NORMAL);
+
+	if (!retries--)
+		return;
+
+	/* Device is not ready to read SRAM or FLASH data, try again */
+	schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(100));
+}
+#endif
+
 static int mcp2221_probe(struct hid_device *hdev,
 					const struct hid_device_id *id)
 {
@@ -921,6 +1172,11 @@ static int mcp2221_probe(struct hid_device *hdev,
 		return ret;
 #endif
 
+#if IS_REACHABLE(CONFIG_IIO)
+	INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
+	schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(100));
+#endif
+
 	return 0;
 }
 
-- 
2.37.2


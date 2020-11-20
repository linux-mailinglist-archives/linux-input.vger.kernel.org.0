Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4629D2BA0B4
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgKTDBL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgKTDBK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:01:10 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A62C0613CF
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 19:01:10 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id d142so9033476wmd.4
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 19:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxp9eNFNmsE69DeJsSRHEVLPwFoncBXvzzsUjorn/1k=;
        b=Jp0TzNqAsUoP3OzXmPiRApipgFDeRl1WuWxbM7rEWrZ6IGC52qTWDK6nhbJsJEg8zN
         Jjc/dF4m/nkimBewSpmqrjs11E/qBSKSlj1kDbumRrkzjiDm6EDfVbgXCG0ntZJFcBJ+
         QGspJyOICyxIEcY55vBo368dxzJUzaI4FH/lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxp9eNFNmsE69DeJsSRHEVLPwFoncBXvzzsUjorn/1k=;
        b=C6FPB4zT+JDckrf7gK5BulaMM8HfmwD0yYh0wmwYlpjq0te4SE3hsXiF/+ylg3Sw1f
         Ii/jh8O9Wg/beOsmZ65R2YrhxP5uj+y1sUX/wGAbwYarrn8xcYu3Y3vmNbcLWj0VfLG6
         VYoIHX9qn7cnhOTiaUGuctu+AkVXhfFlnb2V3oblfi6qryW8K/f2WTrkvFewkNJOQ/aC
         V4OYPFx3BVRa1AVm/gr9vRXe0WuRhqmMr8dl0JpoO7DVn5v08a+mmnrWB7rh2A7eUgjP
         jZ6Kis3s6UoRlQOtf8m75C3cKvQ3Ls4NtsZE+5t+xsBZrsm3VFgkih0zoaVgnmmVYroU
         C50g==
X-Gm-Message-State: AOAM531r+GnbjqKlRPVuQLskTZSvl3ieexHE6UR834GGl9yWbe3asyxW
        o0XpOpbsBHzWy6cFOrQnRPSqCA==
X-Google-Smtp-Source: ABdhPJwotFHbN2gt9kmn2s8cGJ8jXEDEhCcnP6d4M/dimIuAuzO0E6YNClGEqLpSnsJ/EhwBxUyq+g==
X-Received: by 2002:a1c:dc82:: with SMTP id t124mr5480541wmg.94.1605841269017;
        Thu, 19 Nov 2020 19:01:09 -0800 (PST)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a21sm2530579wmb.38.2020.11.19.19.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:01:08 -0800 (PST)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Rishi Gupta <gupt21@gmail.com>
Subject: [PATCH] HID: mcp2221: add ADC support
Date:   Fri, 20 Nov 2020 05:01:03 +0200
Message-Id: <20201120030103.36138-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the three 10-bit ADC channels registered via
the IIO subsystem.

Cc: linux-input@vger.kernel.org
Cc: linux-iio@vger.kernel.org
CC: Rishi Gupta <gupt21@gmail.com>
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/Kconfig       |  1 +
 drivers/hid/hid-mcp2221.c | 65 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 05315b434276..4795744d9979 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1157,6 +1157,7 @@ config HID_MCP2221
 	tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
 	depends on USB_HID && I2C
 	depends on GPIOLIB
+	depends on IIO
 	help
 	Provides I2C and SMBUS host adapter functionality over USB-HID
 	through MCP2221 device.
diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0d27ccb55dd9..7e62f1dc54d3 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -18,6 +18,9 @@
 #include <linux/gpio/driver.h>
 #include "hid-ids.h"
 
+#include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
+
 /* Commands codes in a raw output report */
 enum {
 	MCP2221_I2C_WR_DATA = 0x90,
@@ -56,6 +59,7 @@ enum {
  */
 struct mcp2221 {
 	struct hid_device *hdev;
+	struct iio_dev *indio_dev;
 	struct i2c_adapter adapter;
 	struct mutex lock;
 	struct completion wait_in_report;
@@ -67,6 +71,11 @@ struct mcp2221 {
 	struct gpio_chip *gc;
 	u8 gp_idx;
 	u8 gpio_dir;
+	u16 adc_values[3];
+};
+
+struct mcp2221_iio {
+	struct mcp2221 *mcp;
 };
 
 /*
@@ -712,6 +721,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				break;
 			}
 			mcp->status = mcp_get_i2c_eng_state(mcp, data, 8);
+			memcpy(&mcp->adc_values, &data[50], 6);
 			break;
 		default:
 			mcp->status = -EIO;
@@ -791,11 +801,54 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
+static int mcp2221_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *channel, int *val,
+			    int *val2, long mask)
+{
+
+	struct mcp2221_iio *priv = iio_priv(indio_dev);
+	struct mcp2221 *mcp = priv->mcp;
+	int ret;
+
+	mutex_lock(&mcp->lock);
+
+	/* Read ADC values */
+	ret = mcp_chk_last_cmd_status(mcp);
+	if (ret < 0)
+		return ret;
+
+	*val = le16_to_cpu(mcp->adc_values[channel->channel]);
+
+	mutex_unlock(&mcp->lock);
+
+	return IIO_VAL_INT;
+}
+
+static const struct iio_info mcp2221_info = {
+	.read_raw = &mcp2221_read_raw,
+};
+
+#define MCP2221_ADC_CHANNEL(idx) \
+	{ \
+		.type = IIO_VOLTAGE, \
+		.indexed = 1, \
+		.channel = idx, \
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
+		.scan_index = -1, \
+	}
+
+static const struct iio_chan_spec mcp2221_channels[] = {
+	MCP2221_ADC_CHANNEL(0),
+	MCP2221_ADC_CHANNEL(1),
+	MCP2221_ADC_CHANNEL(2),
+};
+
 static int mcp2221_probe(struct hid_device *hdev,
 					const struct hid_device_id *id)
 {
 	int ret;
 	struct mcp2221 *mcp;
+	struct mcp2221_iio *iio;
 
 	mcp = devm_kzalloc(&hdev->dev, sizeof(*mcp), GFP_KERNEL);
 	if (!mcp)
@@ -869,8 +922,17 @@ static int mcp2221_probe(struct hid_device *hdev,
 	if (ret)
 		goto err_gc;
 
-	return 0;
+	mcp->indio_dev = devm_iio_device_alloc(&hdev->dev, sizeof(*iio));
+	iio = iio_priv(mcp->indio_dev);
+	iio->mcp = mcp;
+
+	mcp->indio_dev->name = "mcp2221_adc";
+	mcp->indio_dev->modes = INDIO_DIRECT_MODE;
+	mcp->indio_dev->info = &mcp2221_info;
+	mcp->indio_dev->channels = mcp2221_channels;
+	mcp->indio_dev->num_channels = ARRAY_SIZE(mcp2221_channels);
 
+	return iio_device_register(mcp->indio_dev);
 err_gc:
 	i2c_del_adapter(&mcp->adapter);
 err_i2c:
@@ -884,6 +946,7 @@ static void mcp2221_remove(struct hid_device *hdev)
 {
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
+	iio_device_unregister(mcp->indio_dev);
 	i2c_del_adapter(&mcp->adapter);
 	hid_hw_close(mcp->hdev);
 	hid_hw_stop(mcp->hdev);
-- 
2.20.1


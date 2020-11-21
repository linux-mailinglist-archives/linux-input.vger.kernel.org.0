Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340972BBDCB
	for <lists+linux-input@lfdr.de>; Sat, 21 Nov 2020 08:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgKUH2r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 21 Nov 2020 02:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgKUH2r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 21 Nov 2020 02:28:47 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D2EC061A48
        for <linux-input@vger.kernel.org>; Fri, 20 Nov 2020 23:28:45 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 10so13116797wml.2
        for <linux-input@vger.kernel.org>; Fri, 20 Nov 2020 23:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WnKGIdfS38YrTil3LFSb66Hf1M9I8iJmfkl1md/Hs8c=;
        b=boAzf9B6C2T39rhSD7MPWFsj3Cs/c89tqGNUmR5F6gA1kwNror7283lVzj+Hak9mAH
         kldTYfgEoZ94IIOu1CRI5X+1FWhi51c1XHcIzASQLt0h57+CgGO6sCkOWEa7dfhZYj5l
         l2bEUa5r2zVCrQnbbqa3ZLtijuPPMDdsutTGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WnKGIdfS38YrTil3LFSb66Hf1M9I8iJmfkl1md/Hs8c=;
        b=ZN26Mcohgbt8Ze/Awxi6UPB6vkGp6Y0fuTFpwh6d2RZm3XIiCVyprzpnIE4fdGHLzx
         sTnr7JiGsAAqxd0BZMkAzFpYske6GLU5lr4xVSq0VbzcrwoaF5SYHxg6R7ooVohpfOZh
         4WPYsTRCpvG/dWO9Rkh/P9VTtcdaN/HzwVRlf6pmS1PkXBSVLjU/FtRPU/Aj0liJpuAP
         DFyk7JwJLoCZgZh4W2ANSN4XKgmvm09DSVPQ6UXA3qMTmGjufQ2O6nFEy27r+qT/pOZ8
         riGWvapEZk66s7SXkgTHFRelk3WeFqnK386E5lV0Mz+NqUUcvAkyKlGcgKk66UrHec/v
         t8LQ==
X-Gm-Message-State: AOAM531E8p7gKo8i0aFH+easN5ZKeOP6bhcOVUqdcCshqhaN13Ve4y7A
        QpJUWn9bA0YVSUvjiQXTTKkI7Q==
X-Google-Smtp-Source: ABdhPJy7w6OYWzC3JqBUQP4emf6DqNvTnSTmMM+WrwvEfK5U2U4gaiirgRhEyoeU2JUfBtVAVmYHjw==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr13477796wmk.65.1605943724130;
        Fri, 20 Nov 2020 23:28:44 -0800 (PST)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o21sm823328wra.40.2020.11.20.23.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 23:28:42 -0800 (PST)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     lars@metafoo.de
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>
Subject: [PATCH v2] HID: mcp2221: add ADC support
Date:   Sat, 21 Nov 2020 09:28:33 +0200
Message-Id: <20201121072833.40326-1-matt.ranostay@konsulko.com>
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

Changes from v1:

* Removed 'select IIO' from Kconfig
* Removed useless iio/sysfs.h include
* Add IS_REACHABLE checks for IIO subsystem 

 drivers/hid/hid-mcp2221.c | 89 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0d27ccb55dd9..36fa9336c4c5 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -16,6 +16,7 @@
 #include <linux/hidraw.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
+#include <linux/iio/iio.h>
 #include "hid-ids.h"
 
 /* Commands codes in a raw output report */
@@ -56,6 +57,7 @@ enum {
  */
 struct mcp2221 {
 	struct hid_device *hdev;
+	struct iio_dev *indio_dev;
 	struct i2c_adapter adapter;
 	struct mutex lock;
 	struct completion wait_in_report;
@@ -67,6 +69,11 @@ struct mcp2221 {
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
@@ -712,6 +719,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				break;
 			}
 			mcp->status = mcp_get_i2c_eng_state(mcp, data, 8);
+			memcpy(&mcp->adc_values, &data[50], 6);
 			break;
 		default:
 			mcp->status = -EIO;
@@ -791,6 +799,79 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
+#if IS_REACHABLE(CONFIG_IIO)
+
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
+static int mcp2221_register_adcs(struct device *dev, struct mcp2221 *mcp)
+{
+	struct mcp2221_iio *iio;
+
+	mcp->indio_dev = devm_iio_device_alloc(dev, sizeof(*iio));
+	if (!mcp->indio_dev)
+		return -ENOMEM;
+
+	iio = iio_priv(mcp->indio_dev);
+	iio->mcp = mcp;
+
+	mcp->indio_dev->name = "mcp2221_adc";
+	mcp->indio_dev->modes = INDIO_DIRECT_MODE;
+	mcp->indio_dev->info = &mcp2221_info;
+	mcp->indio_dev->channels = mcp2221_channels;
+	mcp->indio_dev->num_channels = ARRAY_SIZE(mcp2221_channels);
+
+	return iio_device_register(mcp->indio_dev);
+}
+
+#else
+
+static int mcp2221_register_adcs(struct device *dev, struct mcp2221 *mcp)
+{
+	return 0;
+}
+
+#endif
+
 static int mcp2221_probe(struct hid_device *hdev,
 					const struct hid_device_id *id)
 {
@@ -869,6 +950,10 @@ static int mcp2221_probe(struct hid_device *hdev,
 	if (ret)
 		goto err_gc;
 
+	ret = mcp2221_register_adcs(&hdev->dev, mcp);
+	if (ret)
+		goto err_gc;
+
 	return 0;
 
 err_gc:
@@ -884,6 +969,10 @@ static void mcp2221_remove(struct hid_device *hdev)
 {
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
+#if IS_REACHABLE(CONFIG_IIO)
+	iio_device_unregister(mcp->indio_dev);
+#endif
+
 	i2c_del_adapter(&mcp->adapter);
 	hid_hw_close(mcp->hdev);
 	hid_hw_stop(mcp->hdev);
-- 
2.20.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C26D9FEE7
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfH1Jx4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:53:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42906 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfH1Jx4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:53:56 -0400
Received: by mail-pf1-f194.google.com with SMTP id i30so1372673pfk.9
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vjiSpM+ep/75nQ1vZWqSkhpYEt77QZKnrxYYvma4X3w=;
        b=mA91kive7zKdE3YkuUpGUofFxs7Aykrrl07AiGDqf/UBWhDBVyWiwHCyq+xqnVAHdc
         lTFcVF6+fcbKT01UtIITrSSzGuPdc/zHpzAZHwq/iKRaMz6rCtt3aoQwL9suCv0r7BWk
         k7d4KUsjwkITx9sWBqwWTvyb28gpUXUMrydCh2ZaK51p1UAJ9e/zIm6Vurd97XE6Ysl3
         koLN9VYQB0NQlbKVFVUSFRVrChMagADADcI5FwHKXOTH6W3uQkDCNyNpe7gU2uzlNbb+
         yCeBx/2fvNcmapChihsHuhY2tgJEVR1dQbz1XZasisKTdbv35paZZnbbepFHBeksgreh
         jiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vjiSpM+ep/75nQ1vZWqSkhpYEt77QZKnrxYYvma4X3w=;
        b=WFrtzrntcQxmbjXmwD4Wv4LPvPMoH+l1qfuUY7qqAAk4Snts+xlY7vr1Rdabs9ADbY
         ykK2mYnJHqt6cOW8yFWqeMJAy7TTJfGi0Tq4+3QkGdQdXvU/fM5j1I7szeV634N9Tcsw
         pspzGS6xi2KASCrsA0VvKFx5qox6ria6NCmx7yA0a7aYWOa8+QGENhhWXMQ2L1STPn53
         RNPeH76rbKLyXDZYd+06X5Er4diSaUCWwwaYDeQ5NDJ5nijkIyYD6b92esQ6JDV6d+GU
         bbqI4+XXrad6DlH0YOB9jDyTDV0egCQrGVa9Wo1WNIG3WcmvJdWJnu9dxEg3y3xhbhxb
         RLRQ==
X-Gm-Message-State: APjAAAWvZnB2kboi3wJaots5/nWsL6AUvn41g5SOFXHMlJuBXaUhxWRS
        V4TsN508f7MLdYz57VKlEUR3yoq9
X-Google-Smtp-Source: APXvYqxntn02doHrWoUg7f+Wi8ZXnF9oL0Ch5iUCmCCRB+swythX+ha53L82AcSrAQXI/xo6zfVKBQ==
X-Received: by 2002:a63:5754:: with SMTP id h20mr2595132pgm.195.1566986035362;
        Wed, 28 Aug 2019 02:53:55 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:53:54 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.com>
Subject: [PATCH 1/8] Input: atmel_mxt_ts - eanble calibration via sysfs
Date:   Wed, 28 Aug 2019 18:53:42 +0900
Message-Id: <20190828095349.30607-1-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.com>

Make interface to calibrate touchscreen ic so that we
can do calibration in user space.

Change-Id: Ied8262d6451ae4478e87efc205bf07708422027f
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 24c4b691b1c9..4fe2059fa3c1 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -189,6 +189,7 @@ enum t100_type {
 
 /* Delay times */
 #define MXT_BACKUP_TIME		50	/* msec */
+#define MXT_CAL_TIME		25	/* msec */
 #define MXT_RESET_GPIO_TIME	20	/* msec */
 #define MXT_RESET_INVALID_CHG	100	/* msec */
 #define MXT_RESET_TIME		200	/* msec */
@@ -753,6 +754,21 @@ static int mxt_write_object(struct mxt_data *data,
 	return mxt_write_reg(data->client, reg + offset, val);
 }
 
+static int mxt_recalibrate(struct mxt_data *data)
+{
+	struct device *dev = &data->client->dev;
+	int error;
+
+	dev_dbg(dev, "Recalibration ...\n");
+	error = mxt_write_object(data, MXT_GEN_COMMAND_T6,
+				 MXT_COMMAND_CALIBRATE, 1);
+	if (error)
+		dev_err(dev, "Recalibration failed %d\n", error);
+	else
+		msleep(MXT_CAL_TIME);
+	return error;
+}
+
 static void mxt_input_button(struct mxt_data *data, u8 *message)
 {
 	struct input_dev *input = data->input_dev;
@@ -2663,6 +2679,19 @@ static int mxt_configure_objects(struct mxt_data *data,
 	return 0;
 }
 
+static ssize_t mxt_calibrate_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	disable_irq(data->irq);
+	ret = mxt_recalibrate(data);
+	enable_irq(data->irq);
+	return ret ?: count;
+}
+
 /* Firmware Version is returned as Major.Minor.Build */
 static ssize_t mxt_fw_version_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -2910,12 +2939,14 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
+static DEVICE_ATTR(calibrate, S_IWUSR, NULL, mxt_calibrate_store);
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_attrs[] = {
+	&dev_attr_calibrate.attr,
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_object.attr,
-- 
2.17.1


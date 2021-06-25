Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E213B400D
	for <lists+linux-input@lfdr.de>; Fri, 25 Jun 2021 11:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhFYJLH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Jun 2021 05:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhFYJLH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Jun 2021 05:11:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE2DC061574
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 02:08:46 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id d11so9829978wrm.0
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=nQLpNqH9Q62lwj8TZnGuZUrf+AHa/sGCjIjmBPI4YLA=;
        b=BSAkzAD/IQkhEK31HU/2IDIiYcQqS6oHPOpUV1+wrYbmDiWG2bQ5uq4P4Bc+RFGHnm
         sXxrX3e85Bz/kUeIHq7G365T1ujKrG8VxDcxCq2wLTiRo2dxROWmFLUw4uhYPIeyZBeS
         LeRhgi6kC7YFzwvWghlpkh1aSsyxkvWH4+eJhY3Oa89kLMbmvHv03VuMIZKM2fw71Hkq
         4KtcmRy8jGSkULnpsPF64FbXjdHX4H/noHjzlI7Fz51193EE39/1nDOC2ydu4eR7Phdx
         r7ZEGsZnd0L6y5He0OJ/f7EV9Op4I0BEs66HYL59V1VZ6XaAEDk/b/Y3fiTKo98g/qfl
         SKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nQLpNqH9Q62lwj8TZnGuZUrf+AHa/sGCjIjmBPI4YLA=;
        b=t6GVJ3/liEf9LwmE1EF1EcUOyc0gNDSR4jKgXxCsQRfEkR/IsyY7HVilaO/pvHvObi
         L7WnoYrem4OuAGvNjn3iPPs3EqCu5cqHCFjZ213nqr//QQp4vG8TJsrJsmxelCrjAcFq
         fEQ9XJl663JcHtbaunsVKWxhrksZCm1b3T+Slpr1avFW4RY8Ao2jOBMIYYeCeHOISOTI
         yAxoXr4hYu5XiZFKo+N0N9NTwr7NybMVOa+iZ3I8Bh03qorD3hwgIvL2YWw7NHcGYdtv
         lCTaelUiEbH9I3U3k2IEYO0c38smtHakCA1q3yQVd0yropP9clcEhdJOgFstItnI3DUg
         wooQ==
X-Gm-Message-State: AOAM5315QfqxBpHwoiT2NmKqpSzl/fJ+yc+EMNqpE/RcTh+jMQ48B9mZ
        FfzdepyiHejlq/cch3W/hPgR/A==
X-Google-Smtp-Source: ABdhPJxXwokYZLNq6LacatgZqVkC/CbmvmkBE+J7bbcbvei303DZmRAc+Ywf0Cm8p0/CBcDkUoEsMg==
X-Received: by 2002:a05:6000:246:: with SMTP id m6mr9734723wrz.116.1624612124921;
        Fri, 25 Jun 2021 02:08:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:78f0:ea41:c81:639b])
        by smtp.gmail.com with ESMTPSA id n29sm51879wms.34.2021.06.25.02.08.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Jun 2021 02:08:43 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] Input: atmel_mxt_ts: Add selftest support
Date:   Fri, 25 Jun 2021 11:18:47 +0200
Message-Id: <1624612727-31762-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add selftest support via T25 function. Selftest is exposed as a sysfs
attribute which can be written with a test code and read to get the
test result (PASS or FAIL).

The supported test codes seem to be device specific, so refer to the
device documentation for getting an exhausive list.

So far I've validated the following tests:
Signal limit test: code 0x17
AVdd test: code 0x01
All tests: code 0xfe
pin-fault test: code 0x12 (or 0x11)

Example:
$ echo 0x17 > /sys/bus/i2c/devices/*/selftest
$ cat /sys/bus/i2c/devices/*/selftest
PASS

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 133 +++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 05de92c..12dfeb8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -222,6 +222,13 @@ enum t100_type {
 
 #define MXT_PIXELS_PER_MM	20
 
+#define MXT_T25_RESULT_STATUS_SUCCESS   0xFE
+#define MXT_T25_RESULT_STATUS_INVALID   0xFD
+#define MXT_T25_RESULT_STATUS_NOAVDD    0x01
+#define MXT_T25_RESULT_STATUS_PINFAULT  0x11
+#define MXT_T25_RESULT_STATUS_PINFAULT2 0x12
+#define MXT_T25_RESULT_STATUS_SIGFAULT  0x17
+
 struct mxt_info {
 	u8 family_id;
 	u8 variant_id;
@@ -266,6 +273,11 @@ enum mxt_suspend_mode {
 	MXT_SUSPEND_T9_CTRL	= 1,
 };
 
+struct t25_result_msg {
+	u8 status;
+	u8 info[5];
+} __packed;
+
 /* Config update context */
 struct mxt_cfg {
 	u8 *raw;
@@ -328,6 +340,8 @@ struct mxt_data {
 	u8 T9_reportid_max;
 	u16 T18_address;
 	u8 T19_reportid;
+	u16 T25_address;
+	u8 T25_reportid;
 	u16 T44_address;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
@@ -341,6 +355,9 @@ struct mxt_data {
 	/* for config update handling */
 	struct completion crc_completion;
 
+	/* store selftest result */
+	struct t25_result_msg t25_result;
+
 	u32 *t19_keymap;
 	unsigned int t19_num_keys;
 
@@ -999,6 +1016,41 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	data->update_input = true;
 }
 
+static void mxt_proc_t25_message(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+
+	memcpy(&data->t25_result, &msg[1], sizeof(data->t25_result));
+
+	if (data->t25_result.status == MXT_T25_RESULT_STATUS_SUCCESS)
+		return;
+
+	switch (data->t25_result.status) {
+	case MXT_T25_RESULT_STATUS_INVALID:
+		dev_err(dev, "Invalid test code\n");
+		break;
+	case MXT_T25_RESULT_STATUS_NOAVDD:
+		dev_err(dev, "AVdd is not present\n");
+		break;
+	case MXT_T25_RESULT_STATUS_PINFAULT:
+	case MXT_T25_RESULT_STATUS_PINFAULT2:
+		dev_err(dev, "Pin fault (seqnum=%02x)\n",
+			data->t25_result.info[0]);
+		break;
+	case MXT_T25_RESULT_STATUS_SIGFAULT:
+		dev_err(dev, "Signal limit fault\n");
+		break;
+	default:
+		dev_err(dev, "Status %02x\n", data->t25_result.status);
+		break;
+	}
+
+	dev_err(dev, "info: %02x %02x %02x %02x %02x\n",
+		data->t25_result.info[1], data->t25_result.info[2],
+		data->t25_result.info[3], data->t25_result.info[4],
+		data->t25_result.info[5]);
+}
+
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
@@ -1023,6 +1075,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id == data->T19_reportid) {
 		mxt_input_button(data, message);
 		data->update_input = true;
+	} else if (report_id == data->T25_reportid) {
+		mxt_proc_t25_message(data, message);
 	} else {
 		mxt_dump_message(data, message);
 	}
@@ -1231,6 +1285,36 @@ static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
 	return 0;
 }
 
+static int mxt_t25_command(struct mxt_data *data, u8 test_code)
+{
+	int timeout_counter = 0;
+	u16 reg;
+	int ret;
+	u8  val[2];
+
+	reg = data->T25_address;
+	val[0] = 0x3;
+	val[1] = test_code;
+
+	ret = __mxt_write_reg(data->client, reg, sizeof(val), val);
+	if (ret)
+		return ret;
+
+	do {
+		msleep(100);
+		ret = __mxt_read_reg(data->client, reg, sizeof(val), &val);
+		if (ret)
+			return ret;
+	} while ((val[1] != 0) && (timeout_counter++ <= 20));
+
+	if (timeout_counter > 20) {
+		dev_err(&data->client->dev, "Command failed!\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int mxt_acquire_irq(struct mxt_data *data)
 {
 	int error;
@@ -1691,6 +1775,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T9_reportid_max = 0;
 	data->T18_address = 0;
 	data->T19_reportid = 0;
+	data->T25_address = 0;
+	data->T25_reportid = 0;
 	data->T44_address = 0;
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
@@ -1767,6 +1853,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
 		case MXT_SPT_COMMSCONFIG_T18:
 			data->T18_address = object->start_address;
 			break;
+		case MXT_SPT_SELFTEST_T25:
+			data->T25_address = object->start_address;
+			data->T25_reportid = min_id;
+			break;
 		case MXT_SPT_MESSAGECOUNT_T44:
 			data->T44_address = object->start_address;
 			break;
@@ -3002,16 +3092,59 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
+static ssize_t mxt_selftest_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+
+	if (!data->T25_address)
+		return -EOPNOTSUPP;
+
+	if (!data->t25_result.status)
+		return -ENODATA;
+
+	if (data->t25_result.status == MXT_T25_RESULT_STATUS_SUCCESS)
+		return scnprintf(buf, PAGE_SIZE, "PASS\n");
+
+	return scnprintf(buf, PAGE_SIZE, "FAIL\n");
+}
+
+static ssize_t mxt_selftest_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	u8 test_code;
+	int ret;
+
+	if (!data->T25_address)
+		return -EOPNOTSUPP;
+
+	/* Refer to documentation for available seltest codes */
+	if (kstrtou8(buf, 0, &test_code))
+		return -EINVAL;
+
+	data->t25_result.status = 0;
+
+	ret = mxt_t25_command(data, test_code);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
+static DEVICE_ATTR(selftest, S_IWUSR | S_IRUGO, mxt_selftest_show, mxt_selftest_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_object.attr,
 	&dev_attr_update_fw.attr,
+	&dev_attr_selftest.attr,
 	NULL
 };
 
-- 
2.7.4


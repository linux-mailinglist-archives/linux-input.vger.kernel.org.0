Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79719FEEE
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfH1JyY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:54:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36213 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfH1JyY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:54:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id w2so1391610pfi.3
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H99pz8hJRALi07IvORKmej1UWm69GcBOFPDW+oTWEQY=;
        b=oLVaBKho4x17A6fx60576uVdEm5Ec6Kur4sF1rCZKP5Vd3vXKq/j1IQ2Q3C5gShSQP
         Q7UrT6WeHpCrA0Z/WVintWhHyxCXNbh7mm325T8HgsxJ1vlmckQ1opw5S45U6dWmOuc5
         Bd2giiqx4x6iAF2Db7EPo+9fFTQTqZPDeUVcNbeskfESqZC1sIo0fQ4JfrIFh7Kil0K4
         WjUy29wR4Lab3ZZQWnPVOix/vm0w+THsGEUXR6p0WuRhNNd1iywQhq6wLfcXBSbZO5+4
         itbp7U4A6PTvGeA8vDUJs1MLRimJ/0Sw0z4qa+4a7m7cDMfT2gkmJUk1cbXioAjlO911
         SQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H99pz8hJRALi07IvORKmej1UWm69GcBOFPDW+oTWEQY=;
        b=KF8vLMn67EXO5eyZespnznirVay7KzxgbY7AMgB0jWhmL6y/M2ZJsWedVHv9mSADMV
         8EF856L+rR7Gzi5eDhx8TO9tdwjC12ymOdbLTIZ3jQ9jy93hnkIh8DHSKjoq8S+561XA
         ixuQ9Ej5EiIOO5slB3xt2lGTfk/ZIlWSWtDFlP9KbegOsvIEcsmcjhXXTA0bfb17Flmy
         r0AKDT5vibKoVKbTav6V/RD04TyXaqulctYVGfT97mU/osVSL+fzmjYfo0Aru6EpE5Wb
         BZS0ItZmaEIfMOpOLk1pbD6sj+m4JHnCLmrXsYgfE6MsdJG4q3ltUtuL7LEYYV6dQSkl
         1eCQ==
X-Gm-Message-State: APjAAAUw3Bda27369KSHy1gIFqkLS0lhagnUcs+O5eSGf1PuDzKc8zFQ
        afOBN+ELEGOm9MaPd5rlesgBDiMG
X-Google-Smtp-Source: APXvYqx/Y4cB/YDSKkkyAng422qFflMduovsBqEuBIjK0wigs8+fhOXRVApogqbciSvoiqOklJdvpg==
X-Received: by 2002:a17:90a:22c9:: with SMTP id s67mr3384299pjc.22.1566986062607;
        Wed, 28 Aug 2019 02:54:22 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:54:22 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>
Subject: [PATCH 7/8] Input: atmel_mxt_ts - add interface to read/write config file name.
Date:   Wed, 28 Aug 2019 18:53:48 +0900
Message-Id: <20190828095349.30607-7-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828095349.30607-1-jongpuls@gmail.com>
References: <20190828095349.30607-1-jongpuls@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>

Add interface to change config/firmware file name easily.
So, we can pass file name to kernel space before we update
config/firmware.

Change-Id: I5b0253feb47e62d7013148f5ef117a9f2ba0b162
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 97 ++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 3a17adf04e2a..2f1013c97433 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -334,6 +334,12 @@ struct mxt_data {
 	/* for config update handling */
 	struct completion crc_completion;
 
+	/* firmware file name */
+	char *fw_file;
+
+	/* config file name */
+	char *config_file;
+
 	u32 *t19_keymap;
 	unsigned int t19_num_keys;
 
@@ -2681,6 +2687,42 @@ static int mxt_configure_objects(struct mxt_data *data,
 	return 0;
 }
 
+static int mxt_update_file_name(struct device *dev, char **file_name,
+				const char *buf, size_t count)
+{
+	char *new_file_name;
+
+	/* Simple sanity check */
+	if (count > 64) {
+		dev_warn(dev, "File name too long\n");
+		return -EINVAL;
+	}
+
+	/* FIXME: devm_kmemdup() when available */
+	new_file_name = devm_kmalloc(dev, count + 1, GFP_KERNEL);
+	if (!new_file_name) {
+		dev_warn(dev, "no memory\n");
+		return -ENOMEM;
+	}
+
+	memcpy(new_file_name, buf, count + 1);
+
+	dev_dbg(dev, "new file name %s\n", new_file_name);
+
+	/* Echo into the sysfs entry may append newline at the end of buf */
+	if (new_file_name[count - 1] == '\n')
+		count--;
+
+	new_file_name[count] = '\0';
+
+	if (*file_name)
+		devm_kfree(dev, *file_name);
+
+	*file_name = new_file_name;
+
+	return 0;
+}
+
 static ssize_t mxt_backupnv_store(struct device *dev,
 				  struct device_attribute *attr,
 				  const char *buf, size_t count)
@@ -2718,6 +2760,45 @@ static ssize_t mxt_config_csum_show(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%06x\n", data->config_crc);
 }
 
+static ssize_t mxt_config_file_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", data->config_file);
+}
+
+static ssize_t mxt_config_file_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = mxt_update_file_name(dev, &data->config_file, buf, count);
+	return ret ? ret : count;
+}
+
+static ssize_t mxt_fw_file_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", data->fw_file);
+}
+
+static ssize_t mxt_fw_file_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = mxt_update_file_name(dev, &data->fw_file, buf, count);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 /* Firmware Version is returned as Major.Minor.Build */
 static ssize_t mxt_fw_version_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -2985,6 +3066,10 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 static DEVICE_ATTR(backupnv, S_IWUSR, NULL, mxt_backupnv_store);
 static DEVICE_ATTR(calibrate, S_IWUSR, NULL, mxt_calibrate_store);
 static DEVICE_ATTR(config_csum, S_IRUGO, mxt_config_csum_show, NULL);
+static DEVICE_ATTR(config_file, S_IRUGO | S_IWUSR, mxt_config_file_show,
+		   mxt_config_file_store);
+static DEVICE_ATTR(fw_file, S_IRUGO | S_IWUSR, mxt_fw_file_show,
+		   mxt_fw_file_store);
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(info_csum, S_IRUGO, mxt_info_csum_show, NULL);
@@ -2996,6 +3081,8 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_backupnv.attr,
 	&dev_attr_calibrate.attr,
 	&dev_attr_config_csum.attr,
+	&dev_attr_config_file.attr,
+	&dev_attr_fw_file.attr,
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_info_csum.attr,
@@ -3167,6 +3254,16 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (error)
 		return error;
 
+	error = mxt_update_file_name(&client->dev, &data->fw_file, MXT_FW_NAME,
+				     strlen(MXT_FW_NAME));
+	if (error)
+		return error;
+
+	error = mxt_update_file_name(&client->dev, &data->config_file,
+				     MXT_CFG_NAME, strlen(MXT_CFG_NAME));
+	if (error)
+		return error;
+
 	data->reset_gpio = devm_gpiod_get_optional(&client->dev,
 						   "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(data->reset_gpio)) {
-- 
2.17.1


Return-Path: <linux-input+bounces-5849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D695E21B
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E233B2125E
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181142AD02;
	Sun, 25 Aug 2024 05:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsK38udI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD5B2BB0D;
	Sun, 25 Aug 2024 05:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563729; cv=none; b=nSQMaH1Y4ZokoEzzqDU33clCYOIIdLRWp68S7L+dk8UB0v1E80RTmiTECgsR8jj3PULMGR8QHafBtMmLXYEg9d0qgLwaFtEjRkFKXUR4lkQJx/TJ3YkIhrwuN450ZG/za+fIf5Myo23iJr/4+IFcVUw90XP3lBTp01eRq2Mvu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563729; c=relaxed/simple;
	bh=Op2j/2cKa4jTxZC+lcTqUSYahxqaCbP7gUd9ncj6zq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cr8g/0YTQlratIiLdgBbjDgFeoh4YTXQi/sAA16OoTQRRU1fGhrawr2FY0rcX2FyA/PZTfgCUnYgQjLN1xTJEp+VPp6xsCiwbNpeaWhCSwqiIKNTRKNazRWqL3FOeK4X40NYaUWuCrC5HMIBm5+gtgV4GHzk3huoHDO/a/k3h9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsK38udI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2021c03c13aso24254295ad.1;
        Sat, 24 Aug 2024 22:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563726; x=1725168526; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRY5qFplegfnSDjygCsEhu8KchdIfxmfcLBIljn8AKI=;
        b=QsK38udIlVQolgoWMBI3nq6XDGzWg8CCw/eGJCAHdeSXHPBaW+5LXpUWT1TQCYX9DG
         OVL4Cg/CcGqOj/oOCbqymIKlGXgfqL1Sbl84795xWesVEC87z/4U/kQnmsCCaOzucGiP
         WbvcNm0NSrC0VBW1w0DcQfJGjx8Wcpl040bUwsMV9PHIXg9vAc96/Ykc6Qpe+JOBYqs9
         MRGB5V7fuiTwWFHSyhKkkqwf0OZ01aARaoMGY0cSn78muxZRdQSIOjBg1ruDlzwZy70h
         gySn8IOcOsKQYs9qPyJcK6H+Ng++xotRjSt1B8Yhno8ewzJrgDkxDtXMQmiaNPmOhndG
         PAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563726; x=1725168526;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRY5qFplegfnSDjygCsEhu8KchdIfxmfcLBIljn8AKI=;
        b=vbqqGs7loxgL1sT9bAXDGgpXGv+Hap8bDszjB2JKldM/sXfDGVHbunAHIj7Vgk3ik8
         dlR5syciAJk7VVDdxp3YKHjeIqKHbAZvugiXauwUo0TChQb4xxMfYcxoLPFoZvhW2O2k
         jyROEEdV0apLzrgoGmOeqBMbGdzSkP+CIuOJnOfoXKmZko3vGr6/gVjTcJVKm9Ug3C+P
         yzYM2C5/Xkq54X56kkDRPRokdqigJYZRQjG6HmsTKeNJW4WCrehA2SNxrt3EGMRq/EjA
         QRP1iaa0nZZ9fv7mr5P1q5/vmbjzzGkigiQbw8j6fK6brzta3q3hEL71rkSTKVz2SIdR
         DbZw==
X-Forwarded-Encrypted: i=1; AJvYcCVqDeWLFovRQMf2/praPlEcMBpfNv9WJ40FVSmlSvoyyYo+Nm1kjr+wXacyTEhW5EG01GmVhGIHR15hZHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX8QEcSHElfbfwZGPW/eczZS874oMtVstNR/nb48V+i/yonQBT
	wbpiWJMxy1h2wvZZfIBxisBpikLSwINuloCsAapXRwBia7bjeszKf6aAPA==
X-Google-Smtp-Source: AGHT+IFhQo0bU7CnD0wUtQnbkscb/BWNRKZ0XGOlgopyadiqsXYGO3pH0XKE+DrhIZRdX1M77rBk5w==
X-Received: by 2002:a17:902:e5c8:b0:1fb:2ebc:d16b with SMTP id d9443c01a7336-2037ee0656emr179888165ad.7.1724563725909;
        Sat, 24 Aug 2024 22:28:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dd28esm49344595ad.142.2024.08.24.22.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:28:45 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:28:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: jingle.wu@emc.com.tw, josh.chen@emc.com.tw,
	Phoenix Huang <phoenix@emc.com.tw>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: elan_i2c - switch to using cleanup functions
Message-ID: <ZsrBC7qDbOvAaI-W@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Start using __free() and guard() primitives to simplify the code
and error handling. This makes the code more compact and error
handling more robust by ensuring that locks are released in all
code paths when control leaves critical section and all allocated
memory is freed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/elan_i2c_core.c | 228 ++++++++++++++--------------
 drivers/input/mouse/elan_i2c_i2c.c  |  14 +-
 2 files changed, 121 insertions(+), 121 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index ce96513b34f6..ef44bc027c30 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -541,7 +541,8 @@ static int elan_update_firmware(struct elan_tp_data *data,
 
 	dev_dbg(&client->dev, "Starting firmware update....\n");
 
-	disable_irq(client->irq);
+	guard(disable_irq)(&client->irq);
+
 	data->in_fw_update = true;
 
 	retval = __elan_update_firmware(data, fw);
@@ -555,7 +556,6 @@ static int elan_update_firmware(struct elan_tp_data *data,
 	}
 
 	data->in_fw_update = false;
-	enable_irq(client->irq);
 
 	return retval;
 }
@@ -621,8 +621,6 @@ static ssize_t elan_sysfs_update_fw(struct device *dev,
 				    const char *buf, size_t count)
 {
 	struct elan_tp_data *data = dev_get_drvdata(dev);
-	const struct firmware *fw;
-	char *fw_name;
 	int error;
 	const u8 *fw_signature;
 	static const u8 signature[] = {0xAA, 0x55, 0xCC, 0x33, 0xFF, 0xFF};
@@ -631,15 +629,16 @@ static ssize_t elan_sysfs_update_fw(struct device *dev,
 		return -EINVAL;
 
 	/* Look for a firmware with the product id appended. */
-	fw_name = kasprintf(GFP_KERNEL, ETP_FW_NAME, data->product_id);
+	const char *fw_name __free(kfree) =
+		kasprintf(GFP_KERNEL, ETP_FW_NAME, data->product_id);
 	if (!fw_name) {
 		dev_err(dev, "failed to allocate memory for firmware name\n");
 		return -ENOMEM;
 	}
 
 	dev_info(dev, "requesting fw '%s'\n", fw_name);
+	const struct firmware *fw __free(firmware) = NULL;
 	error = request_firmware(&fw, fw_name, dev);
-	kfree(fw_name);
 	if (error) {
 		dev_err(dev, "failed to request firmware: %d\n", error);
 		return error;
@@ -651,46 +650,36 @@ static ssize_t elan_sysfs_update_fw(struct device *dev,
 		dev_err(dev, "signature mismatch (expected %*ph, got %*ph)\n",
 			(int)sizeof(signature), signature,
 			(int)sizeof(signature), fw_signature);
-		error = -EBADF;
-		goto out_release_fw;
+		return -EBADF;
 	}
 
-	error = mutex_lock_interruptible(&data->sysfs_mutex);
-	if (error)
-		goto out_release_fw;
-
-	error = elan_update_firmware(data, fw);
-
-	mutex_unlock(&data->sysfs_mutex);
+	scoped_cond_guard(mutex_intr, return -EINTR, &data->sysfs_mutex) {
+		error = elan_update_firmware(data, fw);
+		if (error)
+			return error;
+	}
 
-out_release_fw:
-	release_firmware(fw);
-	return error ?: count;
+	return count;
 }
 
-static ssize_t calibrate_store(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static int elan_calibrate(struct elan_tp_data *data)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct elan_tp_data *data = i2c_get_clientdata(client);
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
 	int tries = 20;
 	int retval;
 	int error;
 	u8 val[ETP_CALIBRATE_MAX_LEN];
 
-	retval = mutex_lock_interruptible(&data->sysfs_mutex);
-	if (retval)
-		return retval;
-
-	disable_irq(client->irq);
+	guard(disable_irq)(&client->irq);
 
 	data->mode |= ETP_ENABLE_CALIBRATE;
 	retval = data->ops->set_mode(client, data->mode);
 	if (retval) {
+		data->mode &= ~ETP_ENABLE_CALIBRATE;
 		dev_err(dev, "failed to enable calibration mode: %d\n",
 			retval);
-		goto out;
+		return retval;
 	}
 
 	retval = data->ops->calibrate(client);
@@ -728,10 +717,24 @@ static ssize_t calibrate_store(struct device *dev,
 		if (!retval)
 			retval = error;
 	}
-out:
-	enable_irq(client->irq);
-	mutex_unlock(&data->sysfs_mutex);
-	return retval ?: count;
+	return retval;
+}
+
+static ssize_t calibrate_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct elan_tp_data *data = i2c_get_clientdata(client);
+	int error;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &data->sysfs_mutex) {
+		error = elan_calibrate(data);
+		if (error)
+			return error;
+	}
+
+	return count;
 }
 
 static ssize_t elan_sysfs_read_mode(struct device *dev,
@@ -743,16 +746,11 @@ static ssize_t elan_sysfs_read_mode(struct device *dev,
 	int error;
 	enum tp_mode mode;
 
-	error = mutex_lock_interruptible(&data->sysfs_mutex);
-	if (error)
-		return error;
-
-	error = data->ops->iap_get_mode(data->client, &mode);
-
-	mutex_unlock(&data->sysfs_mutex);
-
-	if (error)
-		return error;
+	scoped_cond_guard(mutex_intr, return -EINTR, &data->sysfs_mutex) {
+		error = data->ops->iap_get_mode(data->client, &mode);
+		if (error)
+			return error;
+	}
 
 	return sysfs_emit(buf, "%d\n", (int)mode);
 }
@@ -783,44 +781,40 @@ static const struct attribute_group elan_sysfs_group = {
 	.attrs = elan_sysfs_entries,
 };
 
-static ssize_t acquire_store(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static int elan_acquire_baseline(struct elan_tp_data *data)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct elan_tp_data *data = i2c_get_clientdata(client);
-	int error;
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
 	int retval;
+	int error;
 
-	retval = mutex_lock_interruptible(&data->sysfs_mutex);
-	if (retval)
-		return retval;
-
-	disable_irq(client->irq);
+	guard(disable_irq)(&client->irq);
 
 	data->baseline_ready = false;
 
 	data->mode |= ETP_ENABLE_CALIBRATE;
-	retval = data->ops->set_mode(data->client, data->mode);
+	retval = data->ops->set_mode(client, data->mode);
 	if (retval) {
+		data->mode &= ~ETP_ENABLE_CALIBRATE;
 		dev_err(dev, "Failed to enable calibration mode to get baseline: %d\n",
 			retval);
-		goto out;
+		return retval;
 	}
 
 	msleep(250);
 
-	retval = data->ops->get_baseline_data(data->client, true,
+	retval = data->ops->get_baseline_data(client, true,
 					      &data->max_baseline);
 	if (retval) {
-		dev_err(dev, "Failed to read max baseline form device: %d\n",
+		dev_err(dev, "Failed to read max baseline from device: %d\n",
 			retval);
 		goto out_disable_calibrate;
 	}
 
-	retval = data->ops->get_baseline_data(data->client, false,
+	retval = data->ops->get_baseline_data(client, false,
 					      &data->min_baseline);
 	if (retval) {
-		dev_err(dev, "Failed to read min baseline form device: %d\n",
+		dev_err(dev, "Failed to read min baseline from device: %d\n",
 			retval);
 		goto out_disable_calibrate;
 	}
@@ -829,17 +823,31 @@ static ssize_t acquire_store(struct device *dev, struct device_attribute *attr,
 
 out_disable_calibrate:
 	data->mode &= ~ETP_ENABLE_CALIBRATE;
-	error = data->ops->set_mode(data->client, data->mode);
+	error = data->ops->set_mode(client, data->mode);
 	if (error) {
 		dev_err(dev, "Failed to disable calibration mode after acquiring baseline: %d\n",
 			error);
 		if (!retval)
 			retval = error;
 	}
-out:
-	enable_irq(client->irq);
-	mutex_unlock(&data->sysfs_mutex);
-	return retval ?: count;
+
+	return retval;
+}
+
+static ssize_t acquire_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct elan_tp_data *data = i2c_get_clientdata(client);
+	int error;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &data->sysfs_mutex) {
+		error = elan_acquire_baseline(data);
+		if (error)
+			return error;
+	}
+
+	return count;
 }
 
 static ssize_t min_show(struct device *dev,
@@ -847,22 +855,15 @@ static ssize_t min_show(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elan_tp_data *data = i2c_get_clientdata(client);
-	int retval;
 
-	retval = mutex_lock_interruptible(&data->sysfs_mutex);
-	if (retval)
-		return retval;
+	scoped_guard(mutex_intr, &data->sysfs_mutex) {
+		if (!data->baseline_ready)
+			return -ENODATA;
 
-	if (!data->baseline_ready) {
-		retval = -ENODATA;
-		goto out;
+		return sysfs_emit(buf, "%d", data->min_baseline);
 	}
 
-	retval = sysfs_emit(buf, "%d", data->min_baseline);
-
-out:
-	mutex_unlock(&data->sysfs_mutex);
-	return retval;
+	return -EINTR;
 }
 
 static ssize_t max_show(struct device *dev,
@@ -870,25 +871,17 @@ static ssize_t max_show(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elan_tp_data *data = i2c_get_clientdata(client);
-	int retval;
 
-	retval = mutex_lock_interruptible(&data->sysfs_mutex);
-	if (retval)
-		return retval;
+	scoped_guard(mutex_intr, &data->sysfs_mutex) {
+		if (!data->baseline_ready)
+			return -ENODATA;
 
-	if (!data->baseline_ready) {
-		retval = -ENODATA;
-		goto out;
+		return sysfs_emit(buf, "%d", data->max_baseline);
 	}
 
-	retval = sysfs_emit(buf, "%d", data->max_baseline);
-
-out:
-	mutex_unlock(&data->sysfs_mutex);
-	return retval;
+	return -EINTR;
 }
 
-
 static DEVICE_ATTR_WO(acquire);
 static DEVICE_ATTR_RO(min);
 static DEVICE_ATTR_RO(max);
@@ -1323,43 +1316,54 @@ static int elan_probe(struct i2c_client *client)
 	return 0;
 }
 
+static int __elan_suspend(struct elan_tp_data *data)
+{
+	struct i2c_client *client = data->client;
+	int error;
+
+	if (device_may_wakeup(&client->dev))
+		return elan_sleep(data);
+
+	/* Touchpad is not a wakeup source */
+	error = elan_set_power(data, false);
+	if (error)
+		return error;
+
+	error = regulator_disable(data->vcc);
+	if (error) {
+		dev_err(&client->dev,
+			"failed to disable regulator when suspending: %d\n",
+			error);
+		/* Attempt to power the chip back up */
+		elan_set_power(data, true);
+		return error;
+	}
+
+	return 0;
+}
+
 static int elan_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elan_tp_data *data = i2c_get_clientdata(client);
-	int ret;
+	int error;
 
 	/*
 	 * We are taking the mutex to make sure sysfs operations are
 	 * complete before we attempt to bring the device into low[er]
 	 * power mode.
 	 */
-	ret = mutex_lock_interruptible(&data->sysfs_mutex);
-	if (ret)
-		return ret;
-
-	disable_irq(client->irq);
+	scoped_cond_guard(mutex_intr, return -EINTR, &data->sysfs_mutex) {
+		disable_irq(client->irq);
 
-	if (device_may_wakeup(dev)) {
-		ret = elan_sleep(data);
-	} else {
-		ret = elan_set_power(data, false);
-		if (ret)
-			goto err;
-
-		ret = regulator_disable(data->vcc);
-		if (ret) {
-			dev_err(dev, "error %d disabling regulator\n", ret);
-			/* Attempt to power the chip back up */
-			elan_set_power(data, true);
+		error = __elan_suspend(data);
+		if (error) {
+			enable_irq(client->irq);
+			return error;
 		}
 	}
 
-err:
-	if (ret)
-		enable_irq(client->irq);
-	mutex_unlock(&data->sysfs_mutex);
-	return ret;
+	return 0;
 }
 
 static int elan_resume(struct device *dev)
diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
index 13dc097eb6c6..5ed13c8d976e 100644
--- a/drivers/input/mouse/elan_i2c_i2c.c
+++ b/drivers/input/mouse/elan_i2c_i2c.c
@@ -628,12 +628,11 @@ static int elan_i2c_write_fw_block(struct i2c_client *client, u16 fw_page_size,
 				   const u8 *page, u16 checksum, int idx)
 {
 	struct device *dev = &client->dev;
-	u8 *page_store;
 	u8 val[3];
 	u16 result;
 	int ret, error;
 
-	page_store = kmalloc(fw_page_size + 4, GFP_KERNEL);
+	u8 *page_store __free(kfree) = kmalloc(fw_page_size + 4, GFP_KERNEL);
 	if (!page_store)
 		return -ENOMEM;
 
@@ -647,7 +646,7 @@ static int elan_i2c_write_fw_block(struct i2c_client *client, u16 fw_page_size,
 	if (ret != fw_page_size + 4) {
 		error = ret < 0 ? ret : -EIO;
 		dev_err(dev, "Failed to write page %d: %d\n", idx, error);
-		goto exit;
+		return error;
 	}
 
 	/* Wait for F/W to update one page ROM data. */
@@ -656,20 +655,17 @@ static int elan_i2c_write_fw_block(struct i2c_client *client, u16 fw_page_size,
 	error = elan_i2c_read_cmd(client, ETP_I2C_IAP_CTRL_CMD, val);
 	if (error) {
 		dev_err(dev, "Failed to read IAP write result: %d\n", error);
-		goto exit;
+		return error;
 	}
 
 	result = le16_to_cpup((__le16 *)val);
 	if (result & (ETP_FW_IAP_PAGE_ERR | ETP_FW_IAP_INTF_ERR)) {
 		dev_err(dev, "IAP reports failed write: %04hx\n",
 			result);
-		error = -EIO;
-		goto exit;
+		return -EIO;
 	}
 
-exit:
-	kfree(page_store);
-	return error;
+	return 0;
 }
 
 static int elan_i2c_finish_fw_update(struct i2c_client *client,
-- 
2.46.0.295.g3b9ea8a38a-goog


-- 
Dmitry


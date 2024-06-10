Return-Path: <linux-input+bounces-4285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7F9019AF
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 06:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3268BB2151F
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 04:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0CCB658;
	Mon, 10 Jun 2024 04:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfTZ0yvT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA56FB6;
	Mon, 10 Jun 2024 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717993101; cv=none; b=c4Y576Qe9twYo3pcdqyLjvYlcH6OxAWVjAEIWEuGNn2yKA4t6iV0wseWiHAnusW0Np1aM0ccabNkFIa15o1nqSo2bywKiJq4UklJInqY1sLH746f/c6vdhHroK3GE4MbqPYDJ8fM2QFohz8vi5ipaECIQZnLsyCGRWxSkKw2mJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717993101; c=relaxed/simple;
	bh=gyoHZVbBtmo+1Y2rEl3fcXSZal2tRwlaPyo7TuyUzt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQZCRsDhJ3XhHvU2Q9Rdw9wWkirY68nW3SEOZ19GNjo510uo4mFLRwn3I3FnsZvt1yHUZu91aSpARwZ2zHiC4g59mIzIomQZwFnxNbd0HzWzJbH0REgtW6b0arMhYG/fu/7TC29Ks/fR21taw7lorgt3vNuN0QlKHecOcE+KIN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfTZ0yvT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f70c457823so3042765ad.3;
        Sun, 09 Jun 2024 21:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717993098; x=1718597898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc+OTuubCrRnq/UTIIjZ369Bpra4NGZupgPhOK8l0lM=;
        b=VfTZ0yvTe+l/61F1ERIX9VfIVZ8C/SNXawHryrsHWXHhRciX8CnwHi3bl/tSPWeUjK
         Luwub9FuS8iNHCWneUerKsVTNSrnxpubLM8meXjWqS5hhAXMh12a2a3FobfVmn7wKCby
         jCVIH4QOrfhRrE119gjVb/8Vh02t9RV+bme+HPdDIJSJhjdmctrMuEJWq6Ci6/ANj3wh
         qnVE5FEd/I4ihiYYliRMkJGsj9VummKmndOPwMFvpTWamSlliWKt0oMe/BqGnzDfd2MV
         2+vG+GlE93ypjzx6kds30sb5iM0eVTnueOWaA9zRFbEehoosKt+Y27j7icBz7rv0Va4i
         tp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717993098; x=1718597898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vc+OTuubCrRnq/UTIIjZ369Bpra4NGZupgPhOK8l0lM=;
        b=ZD230FMi4zyeyfG5CndpuTpP5rWLDyson1ltUZCKYgn4VqBT9bE5KNpV/fHooG7NB5
         cH5iZHSJuFHkjoYlyPe9Wx4oz6soe5yheCDdrL46/WJk9RIDtIkr0JtS9mkqo2T/CdZ1
         w2iRBMyA3fK+zFLBX34HXs5l8F9fgoj6ZLeni+jjIgfmQ9Uz4RuM2nex63rRZ7l+7Q6Z
         6GHEwUk9dQgUC9J3VXRSq9HSRAnyMjs9jWc0H0liHwpt0f+sarqR3slDbUW26W8WdxrO
         V2v9BY3Sr/VA2HU0qqZu6K4PXVdv9uYNUy8iDq69Bc/bTRUwPRMdH8GCJW5mjmWukHLx
         XcHA==
X-Gm-Message-State: AOJu0YxrVByNsgpW2lNNC2UwDctqXX+IbikRDRwUw0RDycuFECxMHEYl
	xBb54jl+rzyt6/HPSvNQwb/8sIPyHfizcCQ6EHQKcbOIMmKOFSkfTC0hFg==
X-Google-Smtp-Source: AGHT+IHefB9ZW9Hc2FPIXvwmtPPJMYHMSkSymuIo8ELx4f2ly4YQfVGk7UxezuvK9dXciueyWJAu3A==
X-Received: by 2002:a17:902:e5d0:b0:1de:f91:3cf3 with SMTP id d9443c01a7336-1f6d0389400mr92733705ad.55.1717993098488;
        Sun, 09 Jun 2024 21:18:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:83cc:2314:b3bd:bf64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f5a05b83sm30658355ad.249.2024.06.09.21.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:18:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: ims-pcu - switch to using cleanup functions
Date: Sun,  9 Jun 2024 21:18:11 -0700
Message-ID: <20240610041813.722445-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240610041813.722445-1-dmitry.torokhov@gmail.com>
References: <20240610041813.722445-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start using __free() and guard() primitives to simplify the code
and error handling.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/ims-pcu.c | 135 ++++++++++++++++-------------------
 1 file changed, 62 insertions(+), 73 deletions(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 0e61d969662f..e7bd8f9858ac 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -928,9 +928,8 @@ static void ims_pcu_process_async_firmware(const struct firmware *fw,
 		goto out;
 	}
 
-	mutex_lock(&pcu->cmd_mutex);
-	ims_pcu_handle_firmware_update(pcu, fw);
-	mutex_unlock(&pcu->cmd_mutex);
+	scoped_guard(mutex, &pcu->cmd_mutex)
+		ims_pcu_handle_firmware_update(pcu, fw);
 
 	release_firmware(fw);
 
@@ -954,7 +953,7 @@ static int ims_pcu_backlight_set_brightness(struct led_classdev *cdev,
 	__le16 br_val = cpu_to_le16(value);
 	int error;
 
-	mutex_lock(&pcu->cmd_mutex);
+	guard(mutex)(&pcu->cmd_mutex);
 
 	error = ims_pcu_execute_command(pcu, SET_BRIGHTNESS,
 					&br_val, sizeof(br_val));
@@ -963,8 +962,6 @@ static int ims_pcu_backlight_set_brightness(struct led_classdev *cdev,
 			 "Failed to set desired brightness %u, error: %d\n",
 			 value, error);
 
-	mutex_unlock(&pcu->cmd_mutex);
-
 	return error;
 }
 
@@ -978,7 +975,7 @@ ims_pcu_backlight_get_brightness(struct led_classdev *cdev)
 	int brightness;
 	int error;
 
-	mutex_lock(&pcu->cmd_mutex);
+	guard(mutex)(&pcu->cmd_mutex);
 
 	error = ims_pcu_execute_query(pcu, GET_BRIGHTNESS);
 	if (error) {
@@ -992,8 +989,6 @@ ims_pcu_backlight_get_brightness(struct led_classdev *cdev)
 			get_unaligned_le16(&pcu->cmd_buf[IMS_PCU_DATA_OFFSET]);
 	}
 
-	mutex_unlock(&pcu->cmd_mutex);
-
 	return brightness;
 }
 
@@ -1073,24 +1068,23 @@ static ssize_t ims_pcu_attribute_store(struct device *dev,
 	if (data_len > attr->field_length)
 		return -EINVAL;
 
-	error = mutex_lock_interruptible(&pcu->cmd_mutex);
-	if (error)
-		return error;
+	scoped_cond_guard(mutex, return -EINTR, &pcu->cmd_mutex) {
+		memset(field, 0, attr->field_length);
+		memcpy(field, buf, data_len);
 
-	memset(field, 0, attr->field_length);
-	memcpy(field, buf, data_len);
+		error = ims_pcu_set_info(pcu);
 
-	error = ims_pcu_set_info(pcu);
-
-	/*
-	 * Even if update failed, let's fetch the info again as we just
-	 * clobbered one of the fields.
-	 */
-	ims_pcu_get_info(pcu);
+		/*
+		 * Even if update failed, let's fetch the info again as we just
+		 * clobbered one of the fields.
+		 */
+		ims_pcu_get_info(pcu);
 
-	mutex_unlock(&pcu->cmd_mutex);
+		if (error)
+			return error;
+	}
 
-	return error < 0 ? error : count;
+	return count;
 }
 
 #define IMS_PCU_ATTR(_field, _mode)					\
@@ -1153,7 +1147,6 @@ static ssize_t ims_pcu_update_firmware_store(struct device *dev,
 {
 	struct usb_interface *intf = to_usb_interface(dev);
 	struct ims_pcu *pcu = usb_get_intfdata(intf);
-	const struct firmware *fw = NULL;
 	int value;
 	int error;
 
@@ -1164,35 +1157,33 @@ static ssize_t ims_pcu_update_firmware_store(struct device *dev,
 	if (value != 1)
 		return -EINVAL;
 
-	error = mutex_lock_interruptible(&pcu->cmd_mutex);
-	if (error)
-		return error;
-
+	const struct firmware *fw __free(firmware) = NULL;
 	error = request_ihex_firmware(&fw, IMS_PCU_FIRMWARE_NAME, pcu->dev);
 	if (error) {
 		dev_err(pcu->dev, "Failed to request firmware %s, error: %d\n",
 			IMS_PCU_FIRMWARE_NAME, error);
-		goto out;
+		return error;
 	}
 
-	/*
-	 * If we are already in bootloader mode we can proceed with
-	 * flashing the firmware.
-	 *
-	 * If we are in application mode, then we need to switch into
-	 * bootloader mode, which will cause the device to disconnect
-	 * and reconnect as different device.
-	 */
-	if (pcu->bootloader_mode)
-		error = ims_pcu_handle_firmware_update(pcu, fw);
-	else
-		error = ims_pcu_switch_to_bootloader(pcu);
+	scoped_cond_guard(mutex_intr, return -EINTR, &pcu->cmd_mutex) {
+		/*
+		 * If we are already in bootloader mode we can proceed with
+		 * flashing the firmware.
+		 *
+		 * If we are in application mode, then we need to switch into
+		 * bootloader mode, which will cause the device to disconnect
+		 * and reconnect as different device.
+		 */
+		if (pcu->bootloader_mode)
+			error = ims_pcu_handle_firmware_update(pcu, fw);
+		else
+			error = ims_pcu_switch_to_bootloader(pcu);
 
-	release_firmware(fw);
+		if (error)
+			return error;
+	}
 
-out:
-	mutex_unlock(&pcu->cmd_mutex);
-	return error ?: count;
+	return count;
 }
 
 static DEVICE_ATTR(update_firmware, S_IWUSR,
@@ -1302,12 +1293,11 @@ static ssize_t ims_pcu_ofn_reg_data_show(struct device *dev,
 	int error;
 	u8 data;
 
-	mutex_lock(&pcu->cmd_mutex);
-	error = ims_pcu_read_ofn_config(pcu, pcu->ofn_reg_addr, &data);
-	mutex_unlock(&pcu->cmd_mutex);
-
-	if (error)
-		return error;
+	scoped_guard(mutex, &pcu->cmd_mutex) {
+		error = ims_pcu_read_ofn_config(pcu, pcu->ofn_reg_addr, &data);
+		if (error)
+			return error;
+	}
 
 	return sysfs_emit(buf, "%x\n", data);
 }
@@ -1325,11 +1315,13 @@ static ssize_t ims_pcu_ofn_reg_data_store(struct device *dev,
 	if (error)
 		return error;
 
-	mutex_lock(&pcu->cmd_mutex);
+	guard(mutex)(&pcu->cmd_mutex);
+
 	error = ims_pcu_write_ofn_config(pcu, pcu->ofn_reg_addr, value);
-	mutex_unlock(&pcu->cmd_mutex);
+	if (error)
+		return error;
 
-	return error ?: count;
+	return count;
 }
 
 static DEVICE_ATTR(reg_data, S_IRUGO | S_IWUSR,
@@ -1341,13 +1333,10 @@ static ssize_t ims_pcu_ofn_reg_addr_show(struct device *dev,
 {
 	struct usb_interface *intf = to_usb_interface(dev);
 	struct ims_pcu *pcu = usb_get_intfdata(intf);
-	int error;
 
-	mutex_lock(&pcu->cmd_mutex);
-	error = sysfs_emit(buf, "%x\n", pcu->ofn_reg_addr);
-	mutex_unlock(&pcu->cmd_mutex);
+	guard(mutex)(&pcu->cmd_mutex);
 
-	return error;
+	return sysfs_emit(buf, "%x\n", pcu->ofn_reg_addr);
 }
 
 static ssize_t ims_pcu_ofn_reg_addr_store(struct device *dev,
@@ -1363,9 +1352,9 @@ static ssize_t ims_pcu_ofn_reg_addr_store(struct device *dev,
 	if (error)
 		return error;
 
-	mutex_lock(&pcu->cmd_mutex);
+	guard(mutex)(&pcu->cmd_mutex);
+
 	pcu->ofn_reg_addr = value;
-	mutex_unlock(&pcu->cmd_mutex);
 
 	return count;
 }
@@ -1390,12 +1379,11 @@ static ssize_t ims_pcu_ofn_bit_show(struct device *dev,
 	int error;
 	u8 data;
 
-	mutex_lock(&pcu->cmd_mutex);
-	error = ims_pcu_read_ofn_config(pcu, attr->addr, &data);
-	mutex_unlock(&pcu->cmd_mutex);
-
-	if (error)
-		return error;
+	scoped_guard(mutex, &pcu->cmd_mutex) {
+		error = ims_pcu_read_ofn_config(pcu, attr->addr, &data);
+		if (error)
+			return error;
+	}
 
 	return sysfs_emit(buf, "%d\n", !!(data & (1 << attr->nr)));
 }
@@ -1419,21 +1407,22 @@ static ssize_t ims_pcu_ofn_bit_store(struct device *dev,
 	if (value > 1)
 		return -EINVAL;
 
-	mutex_lock(&pcu->cmd_mutex);
+	scoped_guard(mutex, &pcu->cmd_mutex) {
+		error = ims_pcu_read_ofn_config(pcu, attr->addr, &data);
+		if (error)
+			return error;
 
-	error = ims_pcu_read_ofn_config(pcu, attr->addr, &data);
-	if (!error) {
 		if (value)
 			data |= 1U << attr->nr;
 		else
 			data &= ~(1U << attr->nr);
 
 		error = ims_pcu_write_ofn_config(pcu, attr->addr, data);
+		if (error)
+			return error;
 	}
 
-	mutex_unlock(&pcu->cmd_mutex);
-
-	return error ?: count;
+	return count;
 }
 
 #define IMS_PCU_OFN_BIT_ATTR(_field, _addr, _nr)			\
-- 
2.45.2.505.gda0bf45e8d-goog



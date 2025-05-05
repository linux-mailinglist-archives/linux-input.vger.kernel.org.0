Return-Path: <linux-input+bounces-12158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4857AAB644
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 07:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371A01BC7BD7
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 05:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7C5292416;
	Tue,  6 May 2025 00:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYcasjta"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C72C17A3;
	Mon,  5 May 2025 22:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485406; cv=none; b=ZEzwLZ+b2rTDbNOPCX4P9xA+/7fOyy9+m6ZLx7j40hATsSDxAKGoER6yvE3hMJoqKftZR78yPaczhrSznQ3vo5WGf1gvIbqSHVleBWXVgXr6uQYrAynPwnU4O/iEYr/x851xCLgVZlNDez2GwymJg78fc8S8QiQjMZheVAXXUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485406; c=relaxed/simple;
	bh=zr1SzuRb6t3Y1HRDJr3JFdWagSS0mQnrrrPXxi/vt/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXY85yjVw9o8A/mPKnMkL8eyIx3/64AKLR8aqnUFpOZtfWl5c/BsvRAtq8lJchHbyRwI4pszpU7We7KxSi+CjWP9jfwuXWKYPC6mUC/NI9I8o3JhB5VcmWnPtKKEDdzpEq2pft/k5AVejdoBKRwYzDUKBWvYb6x339vzwAWkGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYcasjta; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22d95f0dda4so72006875ad.2;
        Mon, 05 May 2025 15:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746485403; x=1747090203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/F9jX5nQ9TWkl/xk9jA0llENX+QnGcCOPEAFkdMk0w=;
        b=AYcasjtaz5C7COP5tjHYa8cury0KUvWXdAKnDraGnG9fnhlXI5PmF41eTtGMousL+R
         BPLn34XSIw3mivHyLhfXfp45hV2pR7ZAriwzYCdG5dR31jL5P3Si0CDAtBFc17C/ri6p
         Wa1Zh7sr7mJv6o61yf6LhIjTjFxYFMDh1nwVxD8sOLUm+id1JJVdMuX9CEOeyvFIL4z/
         0mvDpC3KSldusfwlY8AMp9zLxlR7ULeYQ89URy2yUe5CTrKUv3BF3xdeTLbpDW8yKdNh
         bdNTc81yjS7O3oZkBQ8c21IXapd+1ZYTLVl5pRi4B8K9/4wHQseTzp9On0Jmq6aDpt2l
         1cIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746485403; x=1747090203;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/F9jX5nQ9TWkl/xk9jA0llENX+QnGcCOPEAFkdMk0w=;
        b=nhiAJpbYZCepVN0jc1BClM4gfESCNaMm8+4z9BIejQVkUGPqYZ6hucakT0+k3kWmpM
         Fscv9epviWf8Xw3tlwJesriyj4BV4jHEbvx1V+LS3lU1u02345rzq1i6f023QBpYQKaQ
         44oKVY/b0F4OQTeewkE7cWRO0pEbnpGDCAKqOYYiZQrLFqoJ/LogHigT6xHZqJQ3+NkG
         GDt3hEEAR4RVd5ZcUYgTuzZEKqgmsui/ixh3V8cHsAxWpBU2z+COqX+sNeMYd1Yfg0pn
         ItYA+Lvso0ftwRxYygDLFErCAXxflWZEg9gVrjdDFwbgDEOe0Kk/FM3toKGPJNPEAV4O
         TA/g==
X-Forwarded-Encrypted: i=1; AJvYcCVtI80UXFYNjCTHsNqpXQm9XmHAsBaMohK1qDi1H9WUE3d30AOht4kyhepbUZQdXjOagfh6PmMyyW+iEAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+1sNk7fe+rvfF4bZ/bVEJVQmcZMg70o0mkaTWDckEUUqH0tz
	OjKSG5ei6hRqSmTfcFICG7VJFRHkVV78w5b2dMUZzrOSlDPiPlzOKrC0yA==
X-Gm-Gg: ASbGnctNCYl6Z6g6DFJvwvEVFU3rcGUgIRMeCY97XI1hJEAoRqF2MGrf05DmRpykxdK
	vXlLhKsuNF6dlLleqFR6r5K+gwG2qNG7nZlwtMTVTtQRH/9gD78fr1NHLr7/zcMILqMmib/doWC
	Lx6B+O+AGX7UbRqPqrDqkglIIQb3WLEgb3rjo6RfJUBfVxg/5qXRQFjHMroSsAQWZ4nV33XJldj
	z0uissc6LrDyQFXHHG++QMZfBus7Qqku5ldAbK8wq73Tn7W6ZSkI7f7tmO5GnIUFUJWGlLkBkeb
	x+2514DHoy97kmBbZpvvvZlGj5R9b0/4qWUsd9bG0A==
X-Google-Smtp-Source: AGHT+IHHHTjuyLsz08Yk36i3/6vZfyqjCAh87ew21d5TLJXoB8Biah29BPicOWizZy77b8ONZIYH4A==
X-Received: by 2002:a17:903:faf:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22e35fa9dfbmr11432095ad.10.1746485402960;
        Mon, 05 May 2025 15:50:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6c50:1878:74d0:c0be])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e98desm61037795ad.55.2025.05.05.15.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 15:50:02 -0700 (PDT)
Date: Mon, 5 May 2025 15:49:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Hanno =?iso-8859-1?Q?B=F6ck?= <hanno@hboeck.de>
Cc: Lyude Paul <lyude@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Nick Dyer <nick@shmanahar.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: synaptics-rmi - fix crash with unsupported versions
 of F34
Message-ID: <aBlAl6sGulam-Qcx@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Sysfs interface for updating firmware for RMI devices is available
even when F34 probe failed. The code checks presence of F34 "container"
pointer and then tries to use the function data attached to the
sub-device. F34 assigns the function data early, before it knows if
probe succeeds, leaving behind a stale pointer.

Fix this by expanding checks to not only test for presence of F34
"container" but also check if there is driver data assigned to the
sub-device, and call dev_set_drvdata() only after we are certain that
probe is successful.

This is not a complete fix, since F34 will be freed during firmware
update, so there is still a race when fetching and accessing this
pointer. This race will be addressed in follow-up changes.

Reported-by: Hanno Böck <hanno@hboeck.de>
Fixes: 29fd0ec2bdbe ("Input: synaptics-rmi4 - add support for F34 device reflash")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/rmi4/rmi_f34.c | 135 ++++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 59 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f34.c b/drivers/input/rmi4/rmi_f34.c
index d760af4cc12e..f1947f03b06a 100644
--- a/drivers/input/rmi4/rmi_f34.c
+++ b/drivers/input/rmi4/rmi_f34.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2016 Zodiac Inflight Innovations
  */
 
+#include "linux/device.h"
 #include <linux/kernel.h>
 #include <linux/rmi.h>
 #include <linux/firmware.h>
@@ -289,39 +290,30 @@ static int rmi_f34_update_firmware(struct f34_data *f34,
 	return rmi_f34_flash_firmware(f34, syn_fw);
 }
 
-static int rmi_f34_status(struct rmi_function *fn)
-{
-	struct f34_data *f34 = dev_get_drvdata(&fn->dev);
-
-	/*
-	 * The status is the percentage complete, or once complete,
-	 * zero for success or a negative return code.
-	 */
-	return f34->update_status;
-}
-
 static ssize_t rmi_driver_bootloader_id_show(struct device *dev,
 					     struct device_attribute *dattr,
 					     char *buf)
 {
 	struct rmi_driver_data *data = dev_get_drvdata(dev);
-	struct rmi_function *fn = data->f34_container;
+	struct rmi_function *fn;
 	struct f34_data *f34;
 
-	if (fn) {
-		f34 = dev_get_drvdata(&fn->dev);
-
-		if (f34->bl_version == 5)
-			return sysfs_emit(buf, "%c%c\n",
-					  f34->bootloader_id[0],
-					  f34->bootloader_id[1]);
-		else
-			return sysfs_emit(buf, "V%d.%d\n",
-					  f34->bootloader_id[1],
-					  f34->bootloader_id[0]);
-	}
+	fn = data->f34_container;
+	if (!fn)
+		return -ENODEV;
 
-	return 0;
+	f34 = dev_get_drvdata(&fn->dev);
+	if (!f34)
+		return -ENODEV;
+
+	if (f34->bl_version == 5)
+		return sysfs_emit(buf, "%c%c\n",
+				  f34->bootloader_id[0],
+				  f34->bootloader_id[1]);
+	else
+		return sysfs_emit(buf, "V%d.%d\n",
+				  f34->bootloader_id[1],
+				  f34->bootloader_id[0]);
 }
 
 static DEVICE_ATTR(bootloader_id, 0444, rmi_driver_bootloader_id_show, NULL);
@@ -334,13 +326,16 @@ static ssize_t rmi_driver_configuration_id_show(struct device *dev,
 	struct rmi_function *fn = data->f34_container;
 	struct f34_data *f34;
 
-	if (fn) {
-		f34 = dev_get_drvdata(&fn->dev);
+	fn = data->f34_container;
+	if (!fn)
+		return -ENODEV;
+
+	f34 = dev_get_drvdata(&fn->dev);
+	if (!f34)
+		return -ENODEV;
 
-		return sysfs_emit(buf, "%s\n", f34->configuration_id);
-	}
 
-	return 0;
+	return sysfs_emit(buf, "%s\n", f34->configuration_id);
 }
 
 static DEVICE_ATTR(configuration_id, 0444,
@@ -356,10 +351,14 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
 
 	if (!data->f34_container) {
 		dev_warn(dev, "%s: No F34 present!\n", __func__);
-		return -EINVAL;
+		return -ENODEV;
 	}
 
 	f34 = dev_get_drvdata(&data->f34_container->dev);
+	if (!f34) {
+		dev_warn(dev, "%s: No valid F34 present!\n", __func__);
+		return -ENODEV;
+	}
 
 	if (f34->bl_version >= 7) {
 		if (data->pdt_props & HAS_BSR) {
@@ -485,10 +484,18 @@ static ssize_t rmi_driver_update_fw_status_show(struct device *dev,
 						char *buf)
 {
 	struct rmi_driver_data *data = dev_get_drvdata(dev);
-	int update_status = 0;
+	struct f34_data *f34;
+	int update_status = -ENODEV;
 
-	if (data->f34_container)
-		update_status = rmi_f34_status(data->f34_container);
+	/*
+	 * The status is the percentage complete, or once complete,
+	 * zero for success or a negative return code.
+	 */
+	if (data->f34_container) {
+		f34 = dev_get_drvdata(&data->f34_container->dev);
+		if (f34)
+			update_status = f34->update_status;
+	}
 
 	return sysfs_emit(buf, "%d\n", update_status);
 }
@@ -508,33 +515,21 @@ static const struct attribute_group rmi_firmware_attr_group = {
 	.attrs = rmi_firmware_attrs,
 };
 
-static int rmi_f34_probe(struct rmi_function *fn)
+static int rmi_f34v5_probe(struct f34_data *f34)
 {
-	struct f34_data *f34;
-	unsigned char f34_queries[9];
+	struct rmi_function *fn = f34->fn;
+	u8 f34_queries[9];
 	bool has_config_id;
-	u8 version = fn->fd.function_version;
-	int ret;
-
-	f34 = devm_kzalloc(&fn->dev, sizeof(struct f34_data), GFP_KERNEL);
-	if (!f34)
-		return -ENOMEM;
-
-	f34->fn = fn;
-	dev_set_drvdata(&fn->dev, f34);
-
-	/* v5 code only supported version 0, try V7 probe */
-	if (version > 0)
-		return rmi_f34v7_probe(f34);
+	int error;
 
 	f34->bl_version = 5;
 
-	ret = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr,
-			     f34_queries, sizeof(f34_queries));
-	if (ret) {
+	error = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr,
+			       f34_queries, sizeof(f34_queries));
+	if (error) {
 		dev_err(&fn->dev, "%s: Failed to query properties\n",
 			__func__);
-		return ret;
+		return error;
 	}
 
 	snprintf(f34->bootloader_id, sizeof(f34->bootloader_id),
@@ -560,11 +555,11 @@ static int rmi_f34_probe(struct rmi_function *fn)
 		f34->v5.config_blocks);
 
 	if (has_config_id) {
-		ret = rmi_read_block(fn->rmi_dev, fn->fd.control_base_addr,
-				     f34_queries, sizeof(f34_queries));
-		if (ret) {
+		error = rmi_read_block(fn->rmi_dev, fn->fd.control_base_addr,
+				       f34_queries, sizeof(f34_queries));
+		if (error) {
 			dev_err(&fn->dev, "Failed to read F34 config ID\n");
-			return ret;
+			return error;
 		}
 
 		snprintf(f34->configuration_id, sizeof(f34->configuration_id),
@@ -573,12 +568,34 @@ static int rmi_f34_probe(struct rmi_function *fn)
 			 f34_queries[2], f34_queries[3]);
 
 		rmi_dbg(RMI_DEBUG_FN, &fn->dev, "Configuration ID: %s\n",
-			 f34->configuration_id);
+			f34->configuration_id);
 	}
 
 	return 0;
 }
 
+static int rmi_f34_probe(struct rmi_function *fn)
+{
+	struct f34_data *f34;
+	u8 version = fn->fd.function_version;
+	int error;
+
+	f34 = devm_kzalloc(&fn->dev, sizeof(struct f34_data), GFP_KERNEL);
+	if (!f34)
+		return -ENOMEM;
+
+	f34->fn = fn;
+
+	/* v5 code only supported version 0 */
+	error = version == 0 ? rmi_f34v5_probe(f34) : rmi_f34v7_probe(f34);
+	if (error)
+		return error;
+
+	dev_set_drvdata(&fn->dev, f34);
+
+	return 0;
+}
+
 int rmi_f34_create_sysfs(struct rmi_device *rmi_dev)
 {
 	return sysfs_create_group(&rmi_dev->dev.kobj, &rmi_firmware_attr_group);
-- 
2.49.0.967.g6a0df3ecc3-goog


-- 
Dmitry


Return-Path: <linux-input+bounces-6136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679296AFFD
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F345288241
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7661F12C526;
	Wed,  4 Sep 2024 04:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFvRGgrE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB950126BFD;
	Wed,  4 Sep 2024 04:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424989; cv=none; b=XYkrA1tBBbZdUWXWr7LeUKGJfpKBntneJ1s1lcbiCZWSPqmaIAPtssXjeEQ35Gc9zVNYbmL6v6PRLDpGyrHmTE6cLsLQnY7/MktvFveoZAKOyfQWKzwBNaa5m1p/bESbvSe0YCdmScHbQPBsheGiI+Rn7wLK6zMVabTF0J7rGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424989; c=relaxed/simple;
	bh=UO5tdz28zf6P49QFmFryD8fHoZAMUUMLPprETK3ohXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5AUuaoLosMx58g/M+bZmP9fVfqeh90yjj4y9b8XQOJActnii7cqGacl2xqfZDrsndObF3OvuYWKfr0BLnQUC9Gxn19j2RpHIMindN7vOqDq3EBySfKbEUA1pCjPuSubLwLKhHqUO4Y8Q/T27IS8Uwk4AfweiT15Ox7FbPHfbCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFvRGgrE; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3449508a12.0;
        Tue, 03 Sep 2024 21:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424987; x=1726029787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt6lvz54FLu2yt0+MuKREUCSNC/E33zVcfi/wJ5rHi8=;
        b=GFvRGgrEVXDkGsUo9eAbPTZhplz43ZdPDe37XDR7mmIGYRkqIiuh7qacJf2TXRFwTu
         oewyrHUWMn/2z0gp4GJZUbm6/Z7H+ValOkdV08ZpF+vj4p0wlHYaMK63k1MPB1jQEcdJ
         jicBUjI8+hT/4lBCdEkqBpS5HbmjJ3/2cjaWnpS2HNpSZ6hSNvR2t3r+onijzmN16eRP
         jswoA1n3i79KUAYRGsFv3DbsvcP+K2sYsGFXnNFLfH+wT1EnrJxtjPEnUp6sPYsjKSvm
         ly1JoQ0AkKT58hcSYF5EiksP+q7BBXwAk77/hmILA2TY+1Zp7sTerWrRtjpjdGqJSuZn
         Hkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424987; x=1726029787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt6lvz54FLu2yt0+MuKREUCSNC/E33zVcfi/wJ5rHi8=;
        b=hDCtH44dLrcAPIEhKC+VcqBkp2dZgB04UgIJPZ5Qn0h4iMLkXY1S8O9M7Cm30kt5wq
         47vOFizlrc03G7d8u0thGWOarnEoQNYPcB0myYbBA0+E7AW3N2QGPmOhyRrH/RkJbxUc
         ThmUQEr6gbsSXez6g5HzKtYXMxUhuROKK6wlM+o2toimJbLuXzQBbAsAvJAHt2T5d3DM
         1kIJ5TM2ALwg6LWJJvAU6ywqUhEBJimIDzZI8ZzfIMX3457+Hbz0bwwPNQBOlcxG3luy
         GKh4eVx/ORl/69iGaE32nFcP1DIcbyI/LhXcykYQtAVq+u3nL2FsJTumwVsovV1qdBLx
         4OHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrEEL7i+VIDrBxFNPxeKNABfzzEyb5zUveGYsBqj4BAkYn8Gv3CAwwV+BR0k/eGUGO+cTw566XYm/ac1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFjjh6GGfch7mxGrdoZfpKT6sa9gOx0yU1SWR3et2GM5Y1M24
	bPvKSK16yxI6n9mTiFSQMVLW8TNeJHwTRgEiMSAvyZfS9EXd6OU8/KpZGQ==
X-Google-Smtp-Source: AGHT+IGPb3PpMZ/VEpa9wnSlL3PiK9uo22oOIgqwAyk1NF1r0jwyW5MLPmpjGblzlcP/m8rIDEZKnw==
X-Received: by 2002:a17:902:daca:b0:202:54b8:72e5 with SMTP id d9443c01a7336-205444f14d9mr119647375ad.22.1725424987017;
        Tue, 03 Sep 2024 21:43:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/22] Input: drv260x - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:42:27 -0700
Message-ID: <20240904044244.1042174-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/drv260x.c | 50 +++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 61b503835aa6..96cd6a078c8a 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -537,64 +537,62 @@ static int drv260x_probe(struct i2c_client *client)
 static int drv260x_suspend(struct device *dev)
 {
 	struct drv260x_data *haptics = dev_get_drvdata(dev);
-	int ret = 0;
+	int error;
 
-	mutex_lock(&haptics->input_dev->mutex);
+	guard(mutex)(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
-		ret = regmap_update_bits(haptics->regmap,
-					 DRV260X_MODE,
-					 DRV260X_STANDBY_MASK,
-					 DRV260X_STANDBY);
-		if (ret) {
+		error = regmap_update_bits(haptics->regmap,
+					   DRV260X_MODE,
+					   DRV260X_STANDBY_MASK,
+					   DRV260X_STANDBY);
+		if (error) {
 			dev_err(dev, "Failed to set standby mode\n");
-			goto out;
+			return error;
 		}
 
 		gpiod_set_value(haptics->enable_gpio, 0);
 
-		ret = regulator_disable(haptics->regulator);
-		if (ret) {
+		error = regulator_disable(haptics->regulator);
+		if (error) {
 			dev_err(dev, "Failed to disable regulator\n");
 			regmap_update_bits(haptics->regmap,
 					   DRV260X_MODE,
 					   DRV260X_STANDBY_MASK, 0);
+			return error;
 		}
 	}
-out:
-	mutex_unlock(&haptics->input_dev->mutex);
-	return ret;
+
+	return 0;
 }
 
 static int drv260x_resume(struct device *dev)
 {
 	struct drv260x_data *haptics = dev_get_drvdata(dev);
-	int ret = 0;
+	int error;
 
-	mutex_lock(&haptics->input_dev->mutex);
+	guard(mutex)(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
-		ret = regulator_enable(haptics->regulator);
-		if (ret) {
+		error = regulator_enable(haptics->regulator);
+		if (error) {
 			dev_err(dev, "Failed to enable regulator\n");
-			goto out;
+			return error;
 		}
 
-		ret = regmap_update_bits(haptics->regmap,
-					 DRV260X_MODE,
-					 DRV260X_STANDBY_MASK, 0);
-		if (ret) {
+		error = regmap_update_bits(haptics->regmap,
+					   DRV260X_MODE,
+					   DRV260X_STANDBY_MASK, 0);
+		if (error) {
 			dev_err(dev, "Failed to unset standby mode\n");
 			regulator_disable(haptics->regulator);
-			goto out;
+			return error;
 		}
 
 		gpiod_set_value(haptics->enable_gpio, 1);
 	}
 
-out:
-	mutex_unlock(&haptics->input_dev->mutex);
-	return ret;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(drv260x_pm_ops, drv260x_suspend, drv260x_resume);
-- 
2.46.0.469.g59c65b2a67-goog



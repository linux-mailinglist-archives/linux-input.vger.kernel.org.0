Return-Path: <linux-input+bounces-6138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E6D96B001
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C36B2B24777
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE703136330;
	Wed,  4 Sep 2024 04:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHOkwgEJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77612E1EE;
	Wed,  4 Sep 2024 04:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424992; cv=none; b=bac8GqCQnVsyjuomGN3+8gddw2jhuhIVNnAPegWOyVM+UwmsLwLKLR38QBzmoDFWCMA/FuwDamx/WhBM0Jr4uXXPwJUdjdxI4sKeOO99dgVwebppL86iD8eZaiwXFFTnksmaY4SJ2V2ARFWU4wPT6FoxT3Lr8F+XLVjDQekJkXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424992; c=relaxed/simple;
	bh=+QCYpClhTtmr9oxKcjIusJ3w9NUyshfTFgW/7Dfamok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiEOB3Sv4I3YArp8Tus46X6ObOS5/Fa2dhFnf+6zI1XOY5dWKOZgt1A+/sHBK3MbRnPKLZDFkVC7UmrDPY82h0GQeBMxdT0mY5JmxZZEpRcN/K9uk6AcxoqcEFcwKxLB7H9vFDO1ni6TDlDGcO1JB52okTTQoUDdtY780aBBgJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHOkwgEJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2068a7c9286so17730755ad.1;
        Tue, 03 Sep 2024 21:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424989; x=1726029789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T8reovlUAD3Peiwe00gk1a2SyLBGNIf5F8eFsRkOIA=;
        b=KHOkwgEJU5aZnW9w1eI4dO5oBcuRjvRyb42UWyb5xrEc4QyVwGUIlUaIt9HiJefnYo
         jkGkMMLcrl7zk5pMSBhrTUBHWaWgeZNO0AabG2ydsTe5Ij+FnFEyoVghk0+GcFfc3bss
         HJdfo9rLB6rLjRBUWGULvhQrog32IByYCVOYtD3/kHqY3CsouoVMoViaXB46NFFMQsyU
         Y+tI+jRn6F6takSayA48c/tRiCbUo985XWx6Vq2amT+JwPfJcmDujGovbKTvaQVSDb6X
         Ot9h5uOE+ypr5jmJNhL7RBJgo5weNASrPkqQI8W/DizUtZ0j1WNIYI/Vs6DVBUUwMFH/
         iVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424989; x=1726029789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2T8reovlUAD3Peiwe00gk1a2SyLBGNIf5F8eFsRkOIA=;
        b=oI4NyolpIx0rHcjoT+Coyglw2dcuxSi/VvL+A9ZoGv7oRTwa5C/Mp/R6xe21jAutXX
         f34Ut5K1SnO+0tuy3dxUkQro3SvVcVXko7OSAspobPDhJSQKuF+nZ79fki/1FGfn58ar
         +FZ++06S4wdxlQjykU/f/5AP7F/Yf+fcYLfp/UJto72f14n6YoXUQCgKcW4+J0+HEz0e
         9La6qkvJ/BY50N7B4ylkGilVgywWwLO508CKTLzC27N85JbDQiFp6zaQy1JSZ2ArFn1r
         WpROyneAKI6V8yF1SN4jR5LyGwjWkStZpsVoY1FkY5fY/tB5sCQF1X4F8FRrl85kOacZ
         CPdg==
X-Forwarded-Encrypted: i=1; AJvYcCVEFBaCU/pN3BZCUef4Z8Jt8XBr0gn3G9cArU+ZcxQvjZkVTPveT+fwbpQRbpdwZmwRcoeIcwhir8Tdjp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkEjIgki5G8lSogYEqAAccxreHDG+75kMKIKMQC+VtPGSXvTb
	wvfByyACpF9BQhld7WXDecv+QVrHUmb1Yw0U+Y9W7/jfYZolH9xPuQgnAg==
X-Google-Smtp-Source: AGHT+IGORmxL/SQuwsCZkQ3nC4/WLtFGKhEMLIfdw0V/9CXgLV5KYObwTLCund5/qyilAWA2un+ABA==
X-Received: by 2002:a17:903:2286:b0:202:38d8:173 with SMTP id d9443c01a7336-205841a60ddmr81282225ad.29.1725424989323;
        Tue, 03 Sep 2024 21:43:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:08 -0700 (PDT)
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
Subject: [PATCH 09/22] Input: drv2667 - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:42:29 -0700
Message-ID: <20240904044244.1042174-10-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/drv2667.c | 44 +++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index ad49845374b9..906292625f84 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -402,59 +402,57 @@ static int drv2667_probe(struct i2c_client *client)
 static int drv2667_suspend(struct device *dev)
 {
 	struct drv2667_data *haptics = dev_get_drvdata(dev);
-	int ret = 0;
+	int error;
 
-	mutex_lock(&haptics->input_dev->mutex);
+	guard(mutex)(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
-		ret = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
-					 DRV2667_STANDBY, DRV2667_STANDBY);
-		if (ret) {
+		error = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
+					   DRV2667_STANDBY, DRV2667_STANDBY);
+		if (error) {
 			dev_err(dev, "Failed to set standby mode\n");
 			regulator_disable(haptics->regulator);
-			goto out;
+			return error;
 		}
 
-		ret = regulator_disable(haptics->regulator);
-		if (ret) {
+		error = regulator_disable(haptics->regulator);
+		if (error) {
 			dev_err(dev, "Failed to disable regulator\n");
 			regmap_update_bits(haptics->regmap,
 					   DRV2667_CTRL_2,
 					   DRV2667_STANDBY, 0);
+			return error;
 		}
 	}
-out:
-	mutex_unlock(&haptics->input_dev->mutex);
-	return ret;
+
+	return 0;
 }
 
 static int drv2667_resume(struct device *dev)
 {
 	struct drv2667_data *haptics = dev_get_drvdata(dev);
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
 
-		ret = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
-					 DRV2667_STANDBY, 0);
-		if (ret) {
+		error = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
+					   DRV2667_STANDBY, 0);
+		if (error) {
 			dev_err(dev, "Failed to unset standby mode\n");
 			regulator_disable(haptics->regulator);
-			goto out;
+			return error;
 		}
 
 	}
 
-out:
-	mutex_unlock(&haptics->input_dev->mutex);
-	return ret;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(drv2667_pm_ops, drv2667_suspend, drv2667_resume);
-- 
2.46.0.469.g59c65b2a67-goog



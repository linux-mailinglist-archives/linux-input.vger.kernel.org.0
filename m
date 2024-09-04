Return-Path: <linux-input+bounces-6137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEDA96AFFF
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79B1CB244B2
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F06412FB37;
	Wed,  4 Sep 2024 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJOANGwF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9D512CDB0;
	Wed,  4 Sep 2024 04:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424991; cv=none; b=AqAyrJsvx8WNQzyzkK/Cztpi7Abj9NMfE8B0t7XgU5p/kbX+05Ivo0whBxtexxuA0cGNt3M/3jVgEgEo7vJWeZst/lYSZ3ZHAaVRE1JUe+pzNSI64XpCr/eTN+8YA5wwo0pqdrKWX4z6vpWDQ9QD6pOTfLoSdzAQ/A5w8uPfllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424991; c=relaxed/simple;
	bh=UTU0Q6nqcjXo8U72mkhmNRNfnaA6FZQfpIyIp/8HXS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k57D3oGS3CH5PmpTc381DJ0fseLnnRex66fiWtx0KgO24mrhMXbXopONFdCrN6QTbsnFwYRANVbkV+IaTSiHC6ruKyyb/rlNxgqIXxU74D7m3NrBjGAdSWDVfA0WP4brELICx3Uq96yd4M+jIRcsf1PsvJzmRIBv5G3Sl8uvrqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJOANGwF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so884870a12.2;
        Tue, 03 Sep 2024 21:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424988; x=1726029788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnKUsf8sYZk0+1pS2fn63M21zdwO+i7FFD1dgf0fueU=;
        b=PJOANGwF8D3ZPFH9qfENScR/mO5FOYI60iu8wVaeGqPf7OrCAu3IBBeudLVv3l1sl+
         Y8G1h2sMTWSynnmvEL1VlaXxYchjf4M3k/mE3z8Xusz2Bq8oQ05chlm25cbJmjLzBSZw
         DOJeMKsyM2pC/5QTPOZiVCNXeq3zNz+tPfIjXOHtdWimpNj48W1M3HlCslX3KXkqLVqh
         meh9w7ypQrLtjoGP3zYYSKRw1Yu5fDhy0hvUwXQQxwe7pfSH50E64w4ltx0D6kQdiW7p
         uIz9IBE/5KqOgjNTokpplz29g2rxL2000+Slgan1sbdHRlML4WF6SSveoQg609IogrBN
         uJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424988; x=1726029788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnKUsf8sYZk0+1pS2fn63M21zdwO+i7FFD1dgf0fueU=;
        b=sXz9r12YyG6nueEBVxfYI0HeFoJqWOZHLDZMh1n3M/eniFU46dfVOT3Bn2fDrcZPyP
         txUFKRcmsAT8/7QqSWvUFTKHO/32pzdJBTp9PNkyLj3YDnU7LPMGBPBb5MwPplz/TTCC
         /WQQYoxtiYtoxqaemXJpyOg67wuQbYY1agNusLGO9hv89sU6oKMIfG2YsqPS4FS3vgzC
         sL4WZ5ZhPkdsBSE4+TKnqy+4fzy6tV3tWmHjyYoAWlbpMlOtkQJZ9hyd9koDpJ1giocu
         jPE7N3DMjoAgzTSD82+L3EkQK1aDS3+/PfizbfBXArDih8IyoHYjU6XZhnLHCe+Lidj6
         0MIg==
X-Forwarded-Encrypted: i=1; AJvYcCVBFtGDmXzCL3DG9B3xzwFAEW0Q7TRMU+JGVLsC9jzmoFq9fTZkab8+m1EOZb8xE5Nsy3Zg3fc+CiHL1y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/fz0wuk0Cj1kJtH+AjXIQ/UY3B9ItBRSjd1mSAGTHFFISfVd
	IgjJxK5maom9YXFdGuFQKkM+CJahKgTZu4zurso9LMAERtc98BJRS/GcmQ==
X-Google-Smtp-Source: AGHT+IEHc1zEMjCZ2hL7VhZi07U+zjl3L7wzRyGNxE8xUAoVUAt/IC74rbslg9f8MjNdBGjAqmdbyQ==
X-Received: by 2002:a17:902:f606:b0:205:410c:f3b3 with SMTP id d9443c01a7336-205410cf6c0mr151781095ad.59.1725424988146;
        Tue, 03 Sep 2024 21:43:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:07 -0700 (PDT)
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
Subject: [PATCH 08/22] Input: drv2665 - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:42:28 -0700
Message-ID: <20240904044244.1042174-9-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/drv2665.c | 44 +++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index f98e4d765307..77ec96c7db76 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -225,59 +225,57 @@ static int drv2665_probe(struct i2c_client *client)
 static int drv2665_suspend(struct device *dev)
 {
 	struct drv2665_data *haptics = dev_get_drvdata(dev);
-	int ret = 0;
+	int error;
 
-	mutex_lock(&haptics->input_dev->mutex);
+	guard(mutex)(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
-		ret = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
-					 DRV2665_STANDBY, DRV2665_STANDBY);
-		if (ret) {
+		error = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
+					   DRV2665_STANDBY, DRV2665_STANDBY);
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
 					   DRV2665_CTRL_2,
 					   DRV2665_STANDBY, 0);
+			return error;
 		}
 	}
-out:
-	mutex_unlock(&haptics->input_dev->mutex);
-	return ret;
+
+	return 0;
 }
 
 static int drv2665_resume(struct device *dev)
 {
 	struct drv2665_data *haptics = dev_get_drvdata(dev);
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
 
-		ret = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
-					 DRV2665_STANDBY, 0);
-		if (ret) {
+		error = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
+					   DRV2665_STANDBY, 0);
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
 
 static DEFINE_SIMPLE_DEV_PM_OPS(drv2665_pm_ops, drv2665_suspend, drv2665_resume);
-- 
2.46.0.469.g59c65b2a67-goog



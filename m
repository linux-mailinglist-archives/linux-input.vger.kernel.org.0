Return-Path: <linux-input+bounces-4299-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB989902738
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 18:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3171F1F21A68
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 16:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F8515B103;
	Mon, 10 Jun 2024 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fupLVECF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CD15A85B;
	Mon, 10 Jun 2024 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037792; cv=none; b=rMu0f0RZ4uAtZAryIW/ZbDpFPBqHg4/zvL9P2NIDWPho1j60QB0fJCGUpIyUkEHWBUcfeP79Zz7iguRU+q6+BhYQvbJLxbrawHc7osd+b5ToKE9V3m2eF7tPOK3v1EFAIgjTeJLNdRTgInV+tYH8HngkTGOTeAFZ9YUhJh2vN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037792; c=relaxed/simple;
	bh=rZZNbu/TdlMBnedn8skGNOsh5ktrxPuwHA5pvH2c9ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3uuyV9DOAI7aoPcyDQoFcpc/eXRenPXvfoc15e1/saT502P+iP/2aazWED1iFQT5ZR+DGy9Avy5b/zH0gRE6Sj04G407tPt9xWSfaRvt2xJR08jSeYtr37zPxx4cakGiNdFNxlrxBcOEsdpEyO8oVR2/GCQd6zvaZSTM1kj0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fupLVECF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f6a837e9a3so27323855ad.1;
        Mon, 10 Jun 2024 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718037790; x=1718642590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQOdkb8MufKmsG2+IsraeNOgODLMgveSPl2B8xwfpUE=;
        b=fupLVECF9JRH2zoRpTQuZM5pd89iQinoG5iYI4S1Bu8ROh68repNAZw/wKE0RUzQoD
         5zm/wp8LnKZqCK/XzOAuQxCHXhyOzTTtwD5GvJilAzzSCzxvpZzcSjw12uEhtYxn4to6
         RkINbQdVcZ7GlaiCx2VCwe5a4ZDpWrblHjmQScaZwSmzr22S9qqoYL3dmFfQBmfFUdzr
         PoBCj56Jp0FdzyM5Nnz/W7C9qBONwAS73aAzOb9zirDyo7TJia9C6G0+D95KB0r51cMe
         stvd4ttl2eJNsKfIni4J7JKUgjfMWgoqnqCiMr7OST4mYMLj7ZV8jpChfJ3oJKNnEL+G
         5niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037790; x=1718642590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQOdkb8MufKmsG2+IsraeNOgODLMgveSPl2B8xwfpUE=;
        b=HXDSu6/n64d5gcWxUMCqBTcyT84L/6ukEyMZVRY6I1hiZNXntd9dU3qTnOlb4c8Xbs
         7xpx9vQgdQa4NawzTRQgNcy2ZmpLgCSoltuRr+SVeZYbBQXYkJRqZXCFrXeiQyTPZMY1
         vHF89iFvqhleb2k6DSpsV1j80V/bHdjuvnjBDV58v3F2jIm0E8x26I8KyehNDBNSJFe+
         DvXyCVCaPyWhOVFCfpvUqelnClsD+Ap0GvfhoJ4LIHTqtspMvNqREtI6WPt1jWTBKG1B
         p4FPSEcKP3i0YlePlfYfpizB09BQprZL5Wc2SIjmQeR4j2bZB2mpvp30RZjJozyb37wC
         qiXA==
X-Forwarded-Encrypted: i=1; AJvYcCVnnUBLIS8fdN/8qdOwAzLrVGhFrLs6hQC0l1juQpiitBUZl3U7gwUPVJS/qOKyUq+/VDLcpTlaGCjprMURcgC1Z1PC0kkdC6neBTkR
X-Gm-Message-State: AOJu0YzKxqJJee2eTlwr88j9liFIs0lWVlcGzWfI3jUJpnGkd4TikfH1
	OfKTdSWixCxD8f8eCM1aw80+7uJMlvhvZVJGVT4Irgyh/DAj7yr8QyhG5A==
X-Google-Smtp-Source: AGHT+IEUcivt30f5arFkHcXNd1AS2Br2ntpmYNguwgYImJk72/a8SMn2LycP1blQiiXifpBaAGW26w==
X-Received: by 2002:a17:902:728a:b0:1f6:6de6:9274 with SMTP id d9443c01a7336-1f6d039b5f6mr92018665ad.59.1718037789393;
        Mon, 10 Jun 2024 09:43:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:83cc:2314:b3bd:bf64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f72479ab2esm5235845ad.308.2024.06.10.09.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:43:08 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Nuno Sa <nuno.sa@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] Input: adxl34x- switch to using "guard" notation
Date: Mon, 10 Jun 2024 09:43:00 -0700
Message-ID: <20240610164301.1048482-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
References: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using guard(mutex)() notation to acquire and automatically
release mutexes.

Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: added Nono's ACK

 drivers/input/misc/adxl34x.c | 61 ++++++++++++------------------------
 1 file changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index c6c34005f5d2..7cafbf8d5f1a 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -241,7 +241,8 @@ static void adxl34x_get_triple(struct adxl34x *ac, struct axis_triple *axis)
 
 	ac->bops->read_block(ac->dev, DATAX0, DATAZ1 - DATAX0 + 1, buf);
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
+
 	ac->saved.x = (s16) le16_to_cpu(buf[0]);
 	axis->x = ac->saved.x;
 
@@ -250,7 +251,6 @@ static void adxl34x_get_triple(struct adxl34x *ac, struct axis_triple *axis)
 
 	ac->saved.z = (s16) le16_to_cpu(buf[2]);
 	axis->z = ac->saved.z;
-	mutex_unlock(&ac->mutex);
 }
 
 static void adxl34x_service_ev_fifo(struct adxl34x *ac)
@@ -416,15 +416,13 @@ static int adxl34x_suspend(struct device *dev)
 {
 	struct adxl34x *ac = dev_get_drvdata(dev);
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
 	if (!ac->suspended && !ac->disabled && ac->opened)
 		__adxl34x_disable(ac);
 
 	ac->suspended = true;
 
-	mutex_unlock(&ac->mutex);
-
 	return 0;
 }
 
@@ -432,15 +430,13 @@ static int adxl34x_resume(struct device *dev)
 {
 	struct adxl34x *ac = dev_get_drvdata(dev);
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
 	if (ac->suspended && !ac->disabled && ac->opened)
 		__adxl34x_enable(ac);
 
 	ac->suspended = false;
 
-	mutex_unlock(&ac->mutex);
-
 	return 0;
 }
 
@@ -464,7 +460,7 @@ static ssize_t adxl34x_disable_store(struct device *dev,
 	if (error)
 		return error;
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
 	if (!ac->suspended && ac->opened) {
 		if (val) {
@@ -478,8 +474,6 @@ static ssize_t adxl34x_disable_store(struct device *dev,
 
 	ac->disabled = !!val;
 
-	mutex_unlock(&ac->mutex);
-
 	return count;
 }
 
@@ -489,16 +483,13 @@ static ssize_t adxl34x_calibrate_show(struct device *dev,
 				      struct device_attribute *attr, char *buf)
 {
 	struct adxl34x *ac = dev_get_drvdata(dev);
-	ssize_t count;
 
-	mutex_lock(&ac->mutex);
-	count = sprintf(buf, "%d,%d,%d\n",
-			ac->hwcal.x * 4 + ac->swcal.x,
-			ac->hwcal.y * 4 + ac->swcal.y,
-			ac->hwcal.z * 4 + ac->swcal.z);
-	mutex_unlock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
-	return count;
+	return sprintf(buf, "%d,%d,%d\n",
+		       ac->hwcal.x * 4 + ac->swcal.x,
+		       ac->hwcal.y * 4 + ac->swcal.y,
+		       ac->hwcal.z * 4 + ac->swcal.z);
 }
 
 static ssize_t adxl34x_calibrate_store(struct device *dev,
@@ -512,7 +503,8 @@ static ssize_t adxl34x_calibrate_store(struct device *dev,
 	 * We use HW calibration and handle the remaining bits in SW. (4mg/LSB)
 	 */
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
+
 	ac->hwcal.x -= (ac->saved.x / 4);
 	ac->swcal.x = ac->saved.x % 4;
 
@@ -525,7 +517,6 @@ static ssize_t adxl34x_calibrate_store(struct device *dev,
 	AC_WRITE(ac, OFSX, (s8) ac->hwcal.x);
 	AC_WRITE(ac, OFSY, (s8) ac->hwcal.y);
 	AC_WRITE(ac, OFSZ, (s8) ac->hwcal.z);
-	mutex_unlock(&ac->mutex);
 
 	return count;
 }
@@ -553,15 +544,13 @@ static ssize_t adxl34x_rate_store(struct device *dev,
 	if (error)
 		return error;
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
 	ac->pdata.data_rate = RATE(val);
 	AC_WRITE(ac, BW_RATE,
 		 ac->pdata.data_rate |
 			(ac->pdata.low_power_mode ? LOW_POWER : 0));
 
-	mutex_unlock(&ac->mutex);
-
 	return count;
 }
 
@@ -588,7 +577,7 @@ static ssize_t adxl34x_autosleep_store(struct device *dev,
 	if (error)
 		return error;
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
 	if (val)
 		ac->pdata.power_mode |= (PCTL_AUTO_SLEEP | PCTL_LINK);
@@ -598,8 +587,6 @@ static ssize_t adxl34x_autosleep_store(struct device *dev,
 	if (!ac->disabled && !ac->suspended && ac->opened)
 		AC_WRITE(ac, POWER_CTL, ac->pdata.power_mode | PCTL_MEASURE);
 
-	mutex_unlock(&ac->mutex);
-
 	return count;
 }
 
@@ -610,14 +597,11 @@ static ssize_t adxl34x_position_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct adxl34x *ac = dev_get_drvdata(dev);
-	ssize_t count;
 
-	mutex_lock(&ac->mutex);
-	count = sprintf(buf, "(%d, %d, %d)\n",
-			ac->saved.x, ac->saved.y, ac->saved.z);
-	mutex_unlock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
-	return count;
+	return sprintf(buf, "(%d, %d, %d)\n",
+		       ac->saved.x, ac->saved.y, ac->saved.z);
 }
 
 static DEVICE_ATTR(position, S_IRUGO, adxl34x_position_show, NULL);
@@ -638,9 +622,8 @@ static ssize_t adxl34x_write_store(struct device *dev,
 	if (error)
 		return error;
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 	AC_WRITE(ac, val >> 8, val & 0xFF);
-	mutex_unlock(&ac->mutex);
 
 	return count;
 }
@@ -674,15 +657,13 @@ static int adxl34x_input_open(struct input_dev *input)
 {
 	struct adxl34x *ac = input_get_drvdata(input);
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
 	if (!ac->suspended && !ac->disabled)
 		__adxl34x_enable(ac);
 
 	ac->opened = true;
 
-	mutex_unlock(&ac->mutex);
-
 	return 0;
 }
 
@@ -690,14 +671,12 @@ static void adxl34x_input_close(struct input_dev *input)
 {
 	struct adxl34x *ac = input_get_drvdata(input);
 
-	mutex_lock(&ac->mutex);
+	guard(mutex)(&ac->mutex);
 
 	if (!ac->suspended && !ac->disabled)
 		__adxl34x_disable(ac);
 
 	ac->opened = false;
-
-	mutex_unlock(&ac->mutex);
 }
 
 struct adxl34x *adxl34x_probe(struct device *dev, int irq,
-- 
2.45.2.505.gda0bf45e8d-goog



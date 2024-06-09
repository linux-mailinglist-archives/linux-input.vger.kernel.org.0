Return-Path: <linux-input+bounces-4277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 412869018C6
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBB50280F1F
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116DB57CBE;
	Sun,  9 Jun 2024 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGLn9Dnf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB05588E;
	Sun,  9 Jun 2024 23:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976491; cv=none; b=uNmIbvbVEMbQnL8dwZYseRxfx2CgbqPHRrX3NnecF5n8Gf6TTL+U7KkesvGQhNLLLJ5lBsta2oZRpxpFfXNvKO3yxKUZNedbzNyiezIxvVxNEiKuCHAmFKWB4UWH+8y3KGMOoGmaXrAUbkfovWzn/U2D7zTqHLtWC+VEDvqBng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976491; c=relaxed/simple;
	bh=v/w/WBCiVX1GwiN9yGDO5vWzVLYy+QdnC2/rGTBm5cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r10i8oB9K48oydmmflJ3Ol1gJ1T6qybJ62gnJeUN06NAVhjVBqusc51gdtyAiMJUkxLdlvAfezpdBRtuwq5kmYzuIM4KkmyPsIucmPH7aLLkKVkFrxQitxYgsTcBiYIGmIwYA65w2AnqC7a+uvRnUQghQTdcuaC4bPyncujfERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGLn9Dnf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-705959a2dfbso274356b3a.1;
        Sun, 09 Jun 2024 16:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717976488; x=1718581288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8x8SvJ+68zrI1ehRs/ceW/9Hyywh6f7X24DTYrjqAKs=;
        b=QGLn9DnfqbX51BoiTKuE+EIoYedNyi05Xe0LaQ3R1L447XW4Z1Cpu0Medc2MelajuN
         bS8zI7zg2w88d8hEdVcQpE9FimB3r6CoH/DH8fn2VcGv4N4///u/1taATDMtmVQOqrvk
         54rKfwZ5f3j9eHB5OKR+2otV6QOp8idN/ejdeyB5KDx+NRFe2TFz8JPeVRzbfqK33Zsq
         tpSu59tj1uuitPh9WKqDdeXd7liXNIWKpTQS86kyrb8LU2vbgpPPKtDGZXh5a3KOdSrN
         KbpbGiIbb9dcdF/f4wwfjmjW1AR5yqP4mva/jj/2Oz/o+oeld2FFI/4k8uuapDiFEWLb
         G0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717976488; x=1718581288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8x8SvJ+68zrI1ehRs/ceW/9Hyywh6f7X24DTYrjqAKs=;
        b=uzi+ONnlDaTchrDP2Es2M0cyEK2CWlwaEcJ4GiTU1Np5KyEUvvu3bcVz94c0RIhAUC
         sbX5cEJba6TnEYu1q08Bz3kCXZcLRWN2NCI5ciCBrJC9F0gnwINloZldLjAxMKqWQm/k
         FdDFEqUqhK1DcM0xG7159i5nD19Mst73Z+wqPlAkN3ZosE56vC00HbEvXMi76BeD9FZb
         bNcvo7qrVaI7MxQyqbl2vCYlfMk5XEXRYjRBIDJsciUcN1ojIKNA2dePP16m297Ik2Qg
         SNjK30odbMl4nhHxOvicf4QB8BsAiPv1N1/RjEUwvT0erNX16/BbM7NLCCPndYY3uW56
         DYug==
X-Forwarded-Encrypted: i=1; AJvYcCXnBkViPZH4t0UGEF7+qRMi7XIoKHNFZ+AXkRGyWEmuDpZ+45WCNjoCPd0W60C98N2WrDvdwg66KEJwCBRkdtcQcwoOASQmfTb5X0zF
X-Gm-Message-State: AOJu0YxDmhnKzgqKmmMUKXE852dm+1sUPU/4lxTOdzrbfJheGF+4/qaI
	eK4LeznuqXDr/32F/D7mWoVhk4wa83ZFzV+43BUOITtVk8f5CKSZrHx7wg==
X-Google-Smtp-Source: AGHT+IF3znw/qHdl7pz/l2szH30/T+dy6rVIlLSbRmGEE5uJ9cMomqfaOLoIGFpwGLwVQwXLGO5LtA==
X-Received: by 2002:a05:6a00:2e11:b0:705:9abf:a405 with SMTP id d2e1a72fcca58-7059abfa6a6mr697126b3a.9.1717976488315;
        Sun, 09 Jun 2024 16:41:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041edb91cdsm3246877b3a.213.2024.06.09.16.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:41:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: adxl34x- switch to using "guard" notation
Date: Sun,  9 Jun 2024 16:41:20 -0700
Message-ID: <20240609234122.603796-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
References: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using guard(mutex)() notation to acquire and automatically
release mutexes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
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



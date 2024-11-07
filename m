Return-Path: <linux-input+bounces-7938-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DBD9BFED9
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C881F227CF
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAAF197548;
	Thu,  7 Nov 2024 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnnIhqjO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E72812B63;
	Thu,  7 Nov 2024 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963751; cv=none; b=BUCaRpXKRYogmqP+VuGmH4MRp4aJ18QYHQvI4RMPrRmNNRfHQoBYSwTXOcS1Rod/I9Krq1ynr/vD3qIOHoVn3E+syr7qer7RJEGcSK8CPhlVdwUOYGG6uLOYRy5w+F7PXOW63q1pKjFFsSd0GvNnjjGmhUhZ8hbQp9ra4XwIRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963751; c=relaxed/simple;
	bh=AATao1D6lidjpskXGy5Ba1Q2c1dLwG1Gr0iVECdIp3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNLpmMu8iF71pTFqRnV6stM5vPQFTE1dQJQvUsAyNU81ZMJdFkIxkC4uXwXM66HvTCFBOjsM/qiOIzrlVNrLoXcidnos1FP5ljCjfmdNDHN7zthzhjj87l5FSigDKyLFWaTyJSk6yb8fzC25ZArB1PLqg38NDHjRQ02/knTrSmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnnIhqjO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cceb8d8b4so4344915ad.1;
        Wed, 06 Nov 2024 23:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963749; x=1731568549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GjsxQ/i2qh7N2/wZ7xIogBkSPAFn+brlhd4b1PUcx0=;
        b=RnnIhqjOMjczDEDCxtoQbGDCFe5FTptpJ+PJ4pFmRFQFALzqKd5Pak4sU/8eaG/2oP
         zim91qQHRhRAZuH257pI90AHac5N4zXxFCVPUdsWH937G65sTNV3w2LmXj+TN0bLextK
         YDIJtHBb4djOSbKAJh2o5FTBsnZuSDfRTIFHMRulJs02M7/7xVoNY9DUtn0ArG+GsJag
         YUvP/dbGV00LqqbDCaYZHTHwiwuua3MLJz0vzK+yQGxvYd9bfjRiUQLc0PQ6v5rp42O1
         56x28jJ86v9DF9yIXAFkt1ArLAC1ur5Hud/N1urD5yw1BJOPG/An+kPsHJKeNxEZbYmX
         x8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963749; x=1731568549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GjsxQ/i2qh7N2/wZ7xIogBkSPAFn+brlhd4b1PUcx0=;
        b=Uu6jlUKs06HZCXmX6GiXnEbmbbtmhVED8Mxkwl/be/TJop9SL14AWXixWpwKBjUTv2
         +W37QEf339b8FKw8KwUIVhWhhWkDuDekHufMdKTckwx4XMPcngJQ6itTwb3/nwuRlOcf
         IDaES7mGCI8/Xkp0yCpP3TYFZ3BKp2oG8dKDHOMLMOrHLpIq26LuNix6t2uhHLBvnuos
         1QP9yfUOtqRKtX8s4O2YRhAa55s2d5ikT+Pw3W8uo3vyqbbETanemIdJZq2bPCYjB5SP
         nvdNBgylipXMv0VAOrxefDVb4aFL0FSDiIGP+rGv8FBJ5XavzhETF1kw53tq1xYjzHqh
         iJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEHFFgmE/E7xqdIyJ8rULUTLNmgATizIBucd+Dxcq5hMRQ0dhcAfSMNLu90kf5Kd/K9bn4JkpXYn2GiDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC9zCv5A9ioUyvN0ddDZmuJzXUvtwZVL2voa558qp2Ep7meSoW
	ab5zX+IDQfCo/lwnCJPoIp2LEt3lv7Hya2QkOyuV9Itozh/eebccLsjXCg==
X-Google-Smtp-Source: AGHT+IH4RvxWUkNwdZma9LL9ggyjv9uD2eNgpFExnxBXbJTvi+8oJfsHloX7TSPqNz972h5nqfh5kw==
X-Received: by 2002:a17:902:d510:b0:20b:a73b:3f5 with SMTP id d9443c01a7336-2117d18a67amr1009515ad.14.1730963748654;
        Wed, 06 Nov 2024 23:15:48 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:48 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] Input: ff-core - convert locking to guard notation
Date: Wed,  6 Nov 2024 23:15:28 -0800
Message-ID: <20241107071538.195340-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard() and scoped_guard() notation instead of explicitly acquiring
and releasing spinlocks and mutexes to simplify the code and ensure that
all locks are released properly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/ff-core.c | 71 +++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index 609a5f01761b..eb01bcb69d00 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -93,7 +93,7 @@ int input_ff_upload(struct input_dev *dev, struct ff_effect *effect,
 {
 	struct ff_device *ff = dev->ff;
 	struct ff_effect *old;
-	int ret = 0;
+	int error;
 	int id;
 
 	if (!test_bit(EV_FF, dev->evbit))
@@ -114,22 +114,20 @@ int input_ff_upload(struct input_dev *dev, struct ff_effect *effect,
 	}
 
 	if (!test_bit(effect->type, ff->ffbit)) {
-		ret = compat_effect(ff, effect);
-		if (ret)
-			return ret;
+		error = compat_effect(ff, effect);
+		if (error)
+			return error;
 	}
 
-	mutex_lock(&ff->mutex);
+	guard(mutex)(&ff->mutex);
 
 	if (effect->id == -1) {
 		for (id = 0; id < ff->max_effects; id++)
 			if (!ff->effect_owners[id])
 				break;
 
-		if (id >= ff->max_effects) {
-			ret = -ENOSPC;
-			goto out;
-		}
+		if (id >= ff->max_effects)
+			return -ENOSPC;
 
 		effect->id = id;
 		old = NULL;
@@ -137,30 +135,26 @@ int input_ff_upload(struct input_dev *dev, struct ff_effect *effect,
 	} else {
 		id = effect->id;
 
-		ret = check_effect_access(ff, id, file);
-		if (ret)
-			goto out;
+		error = check_effect_access(ff, id, file);
+		if (error)
+			return error;
 
 		old = &ff->effects[id];
 
-		if (!check_effects_compatible(effect, old)) {
-			ret = -EINVAL;
-			goto out;
-		}
+		if (!check_effects_compatible(effect, old))
+			return -EINVAL;
 	}
 
-	ret = ff->upload(dev, effect, old);
-	if (ret)
-		goto out;
+	error = ff->upload(dev, effect, old);
+	if (error)
+		return error;
 
-	spin_lock_irq(&dev->event_lock);
-	ff->effects[id] = *effect;
-	ff->effect_owners[id] = file;
-	spin_unlock_irq(&dev->event_lock);
+	scoped_guard(spinlock_irq, &dev->event_lock) {
+		ff->effects[id] = *effect;
+		ff->effect_owners[id] = file;
+	}
 
- out:
-	mutex_unlock(&ff->mutex);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(input_ff_upload);
 
@@ -178,17 +172,16 @@ static int erase_effect(struct input_dev *dev, int effect_id,
 	if (error)
 		return error;
 
-	spin_lock_irq(&dev->event_lock);
-	ff->playback(dev, effect_id, 0);
-	ff->effect_owners[effect_id] = NULL;
-	spin_unlock_irq(&dev->event_lock);
+	scoped_guard(spinlock_irq, &dev->event_lock) {
+		ff->playback(dev, effect_id, 0);
+		ff->effect_owners[effect_id] = NULL;
+	}
 
 	if (ff->erase) {
 		error = ff->erase(dev, effect_id);
 		if (error) {
-			spin_lock_irq(&dev->event_lock);
-			ff->effect_owners[effect_id] = file;
-			spin_unlock_irq(&dev->event_lock);
+			scoped_guard(spinlock_irq, &dev->event_lock)
+				ff->effect_owners[effect_id] = file;
 
 			return error;
 		}
@@ -210,16 +203,12 @@ static int erase_effect(struct input_dev *dev, int effect_id,
 int input_ff_erase(struct input_dev *dev, int effect_id, struct file *file)
 {
 	struct ff_device *ff = dev->ff;
-	int ret;
 
 	if (!test_bit(EV_FF, dev->evbit))
 		return -ENOSYS;
 
-	mutex_lock(&ff->mutex);
-	ret = erase_effect(dev, effect_id, file);
-	mutex_unlock(&ff->mutex);
-
-	return ret;
+	guard(mutex)(&ff->mutex);
+	return erase_effect(dev, effect_id, file);
 }
 EXPORT_SYMBOL_GPL(input_ff_erase);
 
@@ -239,13 +228,11 @@ int input_ff_flush(struct input_dev *dev, struct file *file)
 
 	dev_dbg(&dev->dev, "flushing now\n");
 
-	mutex_lock(&ff->mutex);
+	guard(mutex)(&ff->mutex);
 
 	for (i = 0; i < ff->max_effects; i++)
 		erase_effect(dev, i, file);
 
-	mutex_unlock(&ff->mutex);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(input_ff_flush);
-- 
2.47.0.277.g8800431eea-goog



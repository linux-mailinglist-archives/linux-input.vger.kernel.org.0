Return-Path: <linux-input+bounces-6142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868796B011
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2061F216F6
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEF581ACA;
	Wed,  4 Sep 2024 04:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL9p4Rrf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1847A6A;
	Wed,  4 Sep 2024 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425281; cv=none; b=O4m5g2uflzT50htQ0wnc2rwvcBSFJI04E599KQsL8KvuRqyRdwkz+105Lp/oOVLbZ83rdTxR6VqTwc9sQNC7mdvROWBMvvKf5IoLBNXGcqsOZKqeFxG1vd78c/Heik34Nride8SzS3ZOfvBBdR4oM8cTsdf5uPJuZOErcqX1LPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425281; c=relaxed/simple;
	bh=XzuF0WAITKAGkM6GQTvjbAvIys92eTsF/ZZlU1T/dtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czVIy/bbUrLhLh5HPSg3aRUwsTyCnjDyyai/RVxncNillshUGJKID6KajSEnq8k0/oXursdQZZVLSDIyMktY2j9WrkxREeCmllKmMbYJzeMegHjDKzISP7shMhbWBwR5wX+c65kg6V8LU8/CsL9oAt1i3syMGZcgu7QP1EXC3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL9p4Rrf; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso312455a12.0;
        Tue, 03 Sep 2024 21:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425279; x=1726030079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V77A++HLf9lpZI2obJz1GB0ENLYF8i6nppAYlu8YwEA=;
        b=XL9p4RrfqrxCuZo4qjeFZBIfy7VIaA7JdIi7RwhB4sjpqJFCU/Azw4vGzuNTxxwpFI
         nn6a8aO7dpU7uR0lWcPOFBDjeQB+060OVrXFBOsh5wantJ0okwaBphE0ZmPYOKftOjax
         bvWuwKR8pJxcjKDAp91W4L4gb9tBi7NUua55MBX4gwNrlGNT0bBjdcv6SgKkysp91Qaz
         mYCULdsR8KjMHmQaZOil1Tq+AJPnZxKJLkfykLJrZfIGa5HZyBhEJ35FKdzcFRlSX0B2
         uM8ZWZBe1Q3PqeXb1SVWhVVjWua0GUMenqbJOzY2rDBSpZ+Vj6gMoqY3N9yR9pFUimp+
         /AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425279; x=1726030079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V77A++HLf9lpZI2obJz1GB0ENLYF8i6nppAYlu8YwEA=;
        b=spbrGcBNTgQkD+qNEl8DEApTYxJNe/zNPnmE0Ew9030z9TI73YIIodUup636vLwIQO
         huiSTjQmn88tY/2qWHug9/FuQ9HTLnr3X2Pw4vPpy8VXWhcaUFg0ASvctxoPdKSwBxIX
         3+l8uRT8wEjMHBHSd94yLPLsoKJPo3V/byRoCLl4vYmfUH7UsWYurYtaZHSjaYGQRReG
         isrk9+SgpNGKnWI53I6HJTMyhlTmAuVzG6G1d6OKnp0Nb1FEXAoteiggxCXnKNXAEILp
         I5KqR8cc38s83Y4IprX6YmBeG8+ghliy4mx02dfIlOe8lcphdCfLWg6b7sln8h/iz+fi
         Sc+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFrWrwaomQE/etkMXnD2GL3HOFTdXDamX+7HR8b5UlpfXhe3t/Bm/sVeOuVX3gA5GPWlTChkl3uJjr5dM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0r8FZoO6+eWShirMIj3sHw+FMKM43oZl8LOBvWI106+bMJssl
	JHk/S8rSiGBTv5n33GVlpGtIdIdQg0UPM5Sd20OO9Xx9Blu+6LDkDURB8A==
X-Google-Smtp-Source: AGHT+IFpspVJ8zUAOGCf+pCI+Ry0xtQO1WKzqSTSQ2FcvjTqYYYAEo41E1DGVJ5DxIugN+IFMV5t7w==
X-Received: by 2002:a05:6a21:1693:b0:1ce:d6ea:2163 with SMTP id adf61e73a8af0-1ced6ea3fd6mr13310718637.25.1725425278694;
        Tue, 03 Sep 2024 21:47:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae953dadsm5790245ad.92.2024.09.03.21.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:47:58 -0700 (PDT)
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
Subject: [PATCH 12/22] Input: iqs269a - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:47:55 -0700
Message-ID: <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/iqs269a.c | 46 +++++++++++++-----------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 843f8a3f3410..c34d847fa4af 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -365,7 +365,7 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
 	if (mode > IQS269_CHx_ENG_A_ATI_MODE_MAX)
 		return -EINVAL;
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
 
 	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
 
@@ -375,8 +375,6 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
 	ch_reg[ch_num].engine_a = cpu_to_be16(engine_a);
 	iqs269->ati_current = false;
 
-	mutex_unlock(&iqs269->lock);
-
 	return 0;
 }
 
@@ -389,9 +387,9 @@ static int iqs269_ati_mode_get(struct iqs269_private *iqs269,
 	if (ch_num >= IQS269_NUM_CH)
 		return -EINVAL;
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
+
 	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
-	mutex_unlock(&iqs269->lock);
 
 	engine_a &= IQS269_CHx_ENG_A_ATI_MODE_MASK;
 	*mode = (engine_a >> IQS269_CHx_ENG_A_ATI_MODE_SHIFT);
@@ -429,7 +427,7 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
 		return -EINVAL;
 	}
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
 
 	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
 
@@ -439,8 +437,6 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
 	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
 	iqs269->ati_current = false;
 
-	mutex_unlock(&iqs269->lock);
-
 	return 0;
 }
 
@@ -453,9 +449,9 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
 	if (ch_num >= IQS269_NUM_CH)
 		return -EINVAL;
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
+
 	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
-	mutex_unlock(&iqs269->lock);
 
 	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
 	case IQS269_CHx_ENG_B_ATI_BASE_75:
@@ -491,7 +487,7 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
 	if (target > IQS269_CHx_ENG_B_ATI_TARGET_MAX)
 		return -EINVAL;
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
 
 	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
 
@@ -501,8 +497,6 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
 	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
 	iqs269->ati_current = false;
 
-	mutex_unlock(&iqs269->lock);
-
 	return 0;
 }
 
@@ -515,10 +509,9 @@ static int iqs269_ati_target_get(struct iqs269_private *iqs269,
 	if (ch_num >= IQS269_NUM_CH)
 		return -EINVAL;
 
-	mutex_lock(&iqs269->lock);
-	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
-	mutex_unlock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
 
+	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
 	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;
 
 	return 0;
@@ -1199,7 +1192,7 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 {
 	int error;
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
 
 	/*
 	 * Early revisions of silicon require the following workaround in order
@@ -1210,19 +1203,19 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 		error = regmap_multi_reg_write(iqs269->regmap, iqs269_tws_init,
 					       ARRAY_SIZE(iqs269_tws_init));
 		if (error)
-			goto err_mutex;
+			return error;
 	}
 
 	error = regmap_update_bits(iqs269->regmap, IQS269_HALL_UI,
 				   IQS269_HALL_UI_ENABLE,
 				   iqs269->hall_enable ? ~0 : 0);
 	if (error)
-		goto err_mutex;
+		return error;
 
 	error = regmap_raw_write(iqs269->regmap, IQS269_SYS_SETTINGS,
 				 &iqs269->sys_reg, sizeof(iqs269->sys_reg));
 	if (error)
-		goto err_mutex;
+		return error;
 
 	/*
 	 * The following delay gives the device time to deassert its RDY output
@@ -1232,10 +1225,7 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 
 	iqs269->ati_current = true;
 
-err_mutex:
-	mutex_unlock(&iqs269->lock);
-
-	return error;
+	return 0;
 }
 
 static int iqs269_input_init(struct iqs269_private *iqs269)
@@ -1580,13 +1570,11 @@ static ssize_t hall_enable_store(struct device *dev,
 	if (error)
 		return error;
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
 
 	iqs269->hall_enable = val;
 	iqs269->ati_current = false;
 
-	mutex_unlock(&iqs269->lock);
-
 	return count;
 }
 
@@ -1643,13 +1631,11 @@ static ssize_t rx_enable_store(struct device *dev,
 	if (val > 0xFF)
 		return -EINVAL;
 
-	mutex_lock(&iqs269->lock);
+	guard(mutex)(&iqs269->lock);
 
 	ch_reg[iqs269->ch_num].rx_enable = val;
 	iqs269->ati_current = false;
 
-	mutex_unlock(&iqs269->lock);
-
 	return count;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog



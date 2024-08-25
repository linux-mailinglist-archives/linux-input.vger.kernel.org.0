Return-Path: <linux-input+bounces-5835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1D995E1EA
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35DA31F21F8F
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB4B7347C;
	Sun, 25 Aug 2024 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl7i8zg3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC2757CBB;
	Sun, 25 Aug 2024 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563008; cv=none; b=hdHDq7EF1xPAw/FzfWMUyUvuOwd+40dBHQg6d9+KBkRVAut3KSNdJf7TRadPW7o/Nixu9j3hvbEKAkm+xoVEPqQbZlXMKmBMjs8gSPf0aHIu6nDYkv0j5oBukq4MxYAXjnGK/DCjGM+m1JAxTKJe8HTrJ2kppC+L40a5Ttu/hhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563008; c=relaxed/simple;
	bh=qDiIvliRjSEpEOJTrSaZM7tuLe4Z9lw1T0mNPAza15E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEU5AoKGmLkDQ5xVrPRKjcy1pQftHZwWscIzef9AVWj2n40k19C20Bx07DPZKDyjDSahnwksza4nxoRZG4+oUaPvVQuav0EXblkGF9/eZVWZDP9mgZryHzlVKy8ObcMSlLPTQCmoaS1ZGBJKFLiRsML/3gotkCj4DL4HN8NatHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl7i8zg3; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-27046394c9bso2451051fac.2;
        Sat, 24 Aug 2024 22:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563005; x=1725167805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IClYBjpK7iTXWqXO0hqSivHGfHTegcYSer/+UixwhE=;
        b=Fl7i8zg3KQI2Y8TuzKcIYr06xEgtgK1Nru4dDGaaH0/vQJYw2sok0kgqmgsmracK5y
         N0SD6qnXZ/SjKVBQSF9Ey4DTY3dWbwm+vQCcUoE35TMCx7U9ifMeO00Vl/H8LFrCXvBs
         1jq82MgMzUHb7Ospea2dwC7hxUgkoga0LN37GkmeLFmdCVafwYSHZFan28UvoviWjSoa
         11zepT/BBqxa2JAYIWeIpPYxtAFgn459EhfXLHBqrW+XEO4ftRY3Xq+8/LfmRnPyhPSl
         MTIZCrpZjYJSZ+NBssi1K7ymUrn9fQqBdctdXtDH8lfhb7/kyqS4CNfqEvOn1zsuHehS
         yLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563005; x=1725167805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IClYBjpK7iTXWqXO0hqSivHGfHTegcYSer/+UixwhE=;
        b=m9+Sbi+KDXeg47M6R5XJZ7Kvv1ZvUVHl//CGfyw4KbwERJmUcNuv+EnCOz2Fzydc8o
         vsKeFOV6nJn+SR76LkIp8xJmPajmhZGus+HpJjGe0tWktpsy/YRu33djhIz51AXKcGwj
         0afbvB4dRosGZvAzQ+T3MIUATLdG4lyG09RVvq3j/KRfQ6p7wfjaNJYox2wK6cCFQFK4
         u5rQ2YNPUFv0dsgqDdjbVk8n5cdpmDV/pqetL4alrg0adfRT1AZdjRyZAvMJDjmhM2QI
         xddMLbAvsJ+xTzyBXxWYw6p4SKojEIlsnQMDUGW2DG9rMIztyIbQUh0fzm2z6NuQ5+uS
         mTbg==
X-Forwarded-Encrypted: i=1; AJvYcCUVjLvoBhvOcSd84gZs238T4uHFfRJ57jZeK9YqQAIl2VqiwlSxJi2+6i0+r3knnvLyIFJKM15ljMKWQzw=@vger.kernel.org, AJvYcCW7kdvtpv5uAf4ooJgMmM4K8O5SE/Af03sEYYDsSQGSPmv0SwsxtFGynb1//JkPFOSWibk96smaneFn2GM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW15lCkDmGyMtfG9KvHGRDS5wkf5U6M45hInmNi55/uS/uCrLf
	B7gDAfLgHZt5h646duT48bycGZK/KaxAWgQ5ob/RTyhiU7kuCf/0viSgKg==
X-Google-Smtp-Source: AGHT+IEotK5Z46zRG2q3RwlYVnZUsrGo/WBEX9X+Oub64iSKDadCyz4xjkfGuQRwO8QaHq4D1a66ZA==
X-Received: by 2002:a05:6870:a91a:b0:270:46be:9534 with SMTP id 586e51a60fabf-273e64f5c77mr7810387fac.24.1724563005413;
        Sat, 24 Aug 2024 22:16:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 05/17] Input: gpio-keys - switch to using cleanup functions
Date: Sat, 24 Aug 2024 22:16:09 -0700
Message-ID: <20240825051627.2848495-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start using __free() and guard() primitives to simplify the code
and error handling. This makes the code more compact and error
handling more robust by ensuring that locks are released in all
code paths when control leaves critical section and all allocated
memory is freed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/gpio_keys.c | 44 ++++++++++++------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 9fb0bdcfbf9e..380fe8dab3b0 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -245,23 +245,20 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
 {
 	int n_events = get_n_events_by_type(type);
 	const unsigned long *bitmap = get_bm_events_by_type(ddata->input, type);
-	unsigned long *bits;
 	ssize_t error;
 	int i;
 
-	bits = bitmap_alloc(n_events, GFP_KERNEL);
+	unsigned long *bits __free(bitmap) = bitmap_alloc(n_events, GFP_KERNEL);
 	if (!bits)
 		return -ENOMEM;
 
 	error = bitmap_parselist(buf, bits, n_events);
 	if (error)
-		goto out;
+		return error;
 
 	/* First validate */
-	if (!bitmap_subset(bits, bitmap, n_events)) {
-		error = -EINVAL;
-		goto out;
-	}
+	if (!bitmap_subset(bits, bitmap, n_events))
+		return -EINVAL;
 
 	for (i = 0; i < ddata->pdata->nbuttons; i++) {
 		struct gpio_button_data *bdata = &ddata->data[i];
@@ -271,12 +268,11 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
 
 		if (test_bit(*bdata->code, bits) &&
 		    !bdata->button->can_disable) {
-			error = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	}
 
-	mutex_lock(&ddata->disable_lock);
+	guard(mutex)(&ddata->disable_lock);
 
 	for (i = 0; i < ddata->pdata->nbuttons; i++) {
 		struct gpio_button_data *bdata = &ddata->data[i];
@@ -290,11 +286,7 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
 			gpio_keys_enable_button(bdata);
 	}
 
-	mutex_unlock(&ddata->disable_lock);
-
-out:
-	bitmap_free(bits);
-	return error;
+	return 0;
 }
 
 #define ATTR_SHOW_FN(name, type, only_disabled)				\
@@ -470,11 +462,10 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
 {
 	struct gpio_button_data *bdata = dev_id;
 	struct input_dev *input = bdata->input;
-	unsigned long flags;
 
 	BUG_ON(irq != bdata->irq);
 
-	spin_lock_irqsave(&bdata->lock, flags);
+	guard(spinlock_irqsave)(&bdata->lock);
 
 	if (!bdata->key_pressed) {
 		if (bdata->button->wakeup)
@@ -497,7 +488,6 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
 			      ms_to_ktime(bdata->release_delay),
 			      HRTIMER_MODE_REL_HARD);
 out:
-	spin_unlock_irqrestore(&bdata->lock, flags);
 	return IRQ_HANDLED;
 }
 
@@ -1062,10 +1052,10 @@ static int gpio_keys_suspend(struct device *dev)
 		if (error)
 			return error;
 	} else {
-		mutex_lock(&input->mutex);
+		guard(mutex)(&input->mutex);
+
 		if (input_device_enabled(input))
 			gpio_keys_close(input);
-		mutex_unlock(&input->mutex);
 	}
 
 	return 0;
@@ -1075,20 +1065,20 @@ static int gpio_keys_resume(struct device *dev)
 {
 	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
 	struct input_dev *input = ddata->input;
-	int error = 0;
+	int error;
 
 	if (device_may_wakeup(dev)) {
 		gpio_keys_disable_wakeup(ddata);
 	} else {
-		mutex_lock(&input->mutex);
-		if (input_device_enabled(input))
+		guard(mutex)(&input->mutex);
+
+		if (input_device_enabled(input)) {
 			error = gpio_keys_open(input);
-		mutex_unlock(&input->mutex);
+			if (error)
+				return error;
+		}
 	}
 
-	if (error)
-		return error;
-
 	gpio_keys_report_state(ddata);
 	return 0;
 }
-- 
2.46.0.295.g3b9ea8a38a-goog



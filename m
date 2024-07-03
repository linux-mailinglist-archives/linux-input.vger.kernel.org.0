Return-Path: <linux-input+bounces-4834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D6926A75
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5FD1F22FC7
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884F81953A9;
	Wed,  3 Jul 2024 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCgb0vlB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B8191F84;
	Wed,  3 Jul 2024 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042693; cv=none; b=eeMxLPEuDxs0sGl3upVVQsesQjcn1uzdTNogp/WbNgmRHN+jCsffvX45PGGXnAT44iHDEMgjM2YSjEFBX+R4nS7LWUD+CabRmi919uJVFJNQ/y49ulXDHZa+OovbyWYs3o4n2O6oFfdvsWUNQzRkSWAk7CI8J+Bsni5MWUKHVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042693; c=relaxed/simple;
	bh=9htig+76vR8Q2ec9CymnaE6JlyNDJ4x/azABzTbbc6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvXuqPMCab3+LpWWuUZuMI/H8/Og/4xWN06YRmzdqt0XBcAdiFHO+X3IXUBf/YecMIbdJsSHEnt0LfzOCIMn4Yfc5mkMTMXRFnFjcpZJBb669frlzHY8Fef6cStuIlRLzqlp5c6NRSErlvO/gFTYOMMEu6yRmlSe9Hhc7c6pp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCgb0vlB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70673c32118so13929b3a.3;
        Wed, 03 Jul 2024 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042691; x=1720647491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9Hur8Z7nhDnxTtwckIAZ72uTwrIRPql8qqveD+op3g=;
        b=OCgb0vlBIGuId58WJlpZO1nCuW5pkIfgv1d9rZNsdMd+b0Sen3ExrDFj1Tt57ItNGc
         1UGFN79XSY7aVv139AGJ3OUGOw2TmcvNPTWAPkdAxciuFh+Z6lLk/sPV7v6zuFwgPNWf
         BruAt4oYtrIHogkrstFv9HG256GPGLcliCSzQgCEHfm9CMW/j04rZvZjIMGkw8wbaSLt
         lOnSA/RLFd/Y2sNCSOiPIJuDx0/T6RvbAfkjpgUCEhQ+8X3T8RhFXwQ/8ggUBNBHPLQh
         enhpzdYeh8BHemI89KMp9sOg0FRlfiLLVthPk4LFsHcqr1My7Zo/BUB0NbueCzi4CTZg
         BAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042691; x=1720647491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9Hur8Z7nhDnxTtwckIAZ72uTwrIRPql8qqveD+op3g=;
        b=A7QY5ydGc5fKccLlvjlmrBDNUXosyEVhihIj+5ElBY2j2btEAOIUGZdxdoPojW0x4U
         9+RnmXKXbUtU9d553cevEziRE+AntDlGnQLs7fsal1j/Hvl+aq8lbJv1KL5hTHC/37ot
         G/19c3m/esQF5Tfq7M7gpTcKYLZMbv9O2w5/Rs2Rk6Po94n83qO/vgnVIB50Q8axB5Li
         VP3mfrvkWF5zqbZHcy0W+02hef9JD8s2iv6puaVLyz4f+NqoDj7uaZ4ym5zD0yHXgJNG
         ur++LSyBWOEubvPFt1HSqIMzZAe7o3vtIGDXXeD8O6/Yg3w+pGSfqvJWxx9A3i6rD0mh
         KYpg==
X-Forwarded-Encrypted: i=1; AJvYcCUXaeMRvgVnB12SIA+Dt+izgol+8KqI7U1hkJpwt9f5zCmIj+1+ZliYE5xp5it/3AZBI72rsqFqwul6dXNlBIHu14lvG2mojEl2eHFs
X-Gm-Message-State: AOJu0Yxh06H5fktFQXK7Qs1NF8EwVBamKEHFmy4aO6e6ib6vP+lUyKvX
	Q2sj22/fiqwUicbIQcOOxfYNAComRmhKDEnkVBVxMzMbYq0mvkhhgPtVZQ==
X-Google-Smtp-Source: AGHT+IH4lse7TtifD2jfH2POv9oSlVGoriLNoCBkoIPuCIJmz7LPyIMqiPe9o9OVDG4ht2Spw+w1yA==
X-Received: by 2002:a05:6a21:187:b0:1be:f71e:2196 with SMTP id adf61e73a8af0-1bef71e56femr12654749637.27.1720042690988;
        Wed, 03 Jul 2024 14:38:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] Input: rearrange input_alloc_device() to prepare for preallocating of vals
Date: Wed,  3 Jul 2024 14:37:52 -0700
Message-ID: <20240703213756.3375978-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation to have dev->vals memory pre-allocated rearrange
code in input_alloc_device() so that it allows handling multiple
points of failure.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 40a04154f99d..9981fdfaee9f 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1982,21 +1982,28 @@ struct input_dev *input_allocate_device(void)
 	struct input_dev *dev;
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (dev) {
-		dev->dev.type = &input_dev_type;
-		dev->dev.class = &input_class;
-		device_initialize(&dev->dev);
-		mutex_init(&dev->mutex);
-		spin_lock_init(&dev->event_lock);
-		timer_setup(&dev->timer, NULL, 0);
-		INIT_LIST_HEAD(&dev->h_list);
-		INIT_LIST_HEAD(&dev->node);
-
-		dev_set_name(&dev->dev, "input%lu",
-			     (unsigned long)atomic_inc_return(&input_no));
-
-		__module_get(THIS_MODULE);
-	}
+	if (!dev)
+		return NULL;
+
+	mutex_init(&dev->mutex);
+	spin_lock_init(&dev->event_lock);
+	timer_setup(&dev->timer, NULL, 0);
+	INIT_LIST_HEAD(&dev->h_list);
+	INIT_LIST_HEAD(&dev->node);
+
+	dev->dev.type = &input_dev_type;
+	dev->dev.class = &input_class;
+	device_initialize(&dev->dev);
+	/*
+	 * From this point on we can no longer simply "kfree(dev)", we need
+	 * to use input_free_device() so that device core properly frees its
+	 * resources associated with the input device.
+	 */
+
+	dev_set_name(&dev->dev, "input%lu",
+		     (unsigned long)atomic_inc_return(&input_no));
+
+	__module_get(THIS_MODULE);
 
 	return dev;
 }
-- 
2.45.2.803.g4e1b14247a-goog



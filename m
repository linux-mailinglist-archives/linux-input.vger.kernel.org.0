Return-Path: <linux-input+bounces-4831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1D926A6F
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21B6A283C65
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294DD194A59;
	Wed,  3 Jul 2024 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCu13OoD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB519415E;
	Wed,  3 Jul 2024 21:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042690; cv=none; b=N9KfrwsD94+AVMv0Z/QNtq8uk7yKjMaj1GlE6FGk0ArQNImO1Jp02aRIaEBd7e2tzvoFmqyJ06TB6/v+A5cEYrkyLYiBGc0ux6W3rnb5kpXKBWEutNQnrPwivdtjfKmUsUo6iL3EmyRYYE7YK3CHp4L1SsB5xW7myVYUSYhZlSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042690; c=relaxed/simple;
	bh=YIFleg+R00NGRRL18iImGLmyOLoJZnxEQaxjf7Y/HqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U40wOGQrsPiqMmq07bRhC8iRQe6unCsU6uTI8kAqEGRjXVzIc8GHfTAth+5eb0W5KJhOc1m/ZLV4QGr3h2v4dKkFK8VhT1YmEAkGhJ4RqJ5/6KP4fc9q1/vZszrUPd6TneBc1UKTZlD7lYyRCP5HF3EReEoBNNiLMOdIhCIKVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCu13OoD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70af4868d3dso12701b3a.3;
        Wed, 03 Jul 2024 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042688; x=1720647488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNymPC6bH94Z2+TzJb2KNwf0SwZ3m76uCy9hLMGkTp8=;
        b=aCu13OoDCy3GM0FNuVr9k1BHY5T/K+A85VGcH/0IecSPRKDRnb+16tG9etTt8bZ8IX
         fGRQrrjrqC6pG37oMTka2TgoXn4pubJyILUdHahX/nz9Bbpm2f2KiS0qRXjzgA9cUTli
         Wj2uRRXYKOSSrZwOSNNXSC3gE8k/Ywar3VJerPPDSaOEOjNW8GXHHD8M+bTvBwa+KN8h
         psEzecD7+aTgeZX2Wm/XqEkobZVIC2zfxTOcU9CYyJGQ4l3PafzooO8AHeEUuMsB5Dm9
         sHMRU2iX0vdZ7g+M119gzKwV2EXC1bvh/QUkyxXMA13qobEWTLNFj2ZNFj4dlygZ8eEc
         1B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042688; x=1720647488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNymPC6bH94Z2+TzJb2KNwf0SwZ3m76uCy9hLMGkTp8=;
        b=Fj9R9H8B704Mjdid+uyyOqJXGoZEG2Vwc8BfXDSNw+XSf7LxrbHF9NktD/j7t8Xw3I
         YN0qTjbSo4rO6xwvt1yKgwT3D4YiI2/6I1vaom0fIpeH9ar97mkEVPgG3Zn4uQuA18db
         7m1OtO/MSOLNbiG+jghukWy+bwFcRTcnbxXEM0dxLtPUNqBc90q4G8BroCgDO9dC3wXb
         QhYpRGnsodEZG5vsz494GMNFe+Hh7vjrPQlXezbndM2tZxhku+ulnW2qot/LXuN/ZSaS
         mshKdF/hVLWkxSKxN5Rc9QoHvst65xdphR7bCWxS6hhYUjF2EMhEqpMwaN9pdiGMh1qw
         KHyg==
X-Forwarded-Encrypted: i=1; AJvYcCUob0uVayPaLUVwiccIuWaWYxdiSO6eluVv0ykvIt0DVsFPGEFdgW7UOBfyjX6UCRhSQ4Uq2QwczCVH+t5h7rPwb9xZO+AW8Jq5Vw9P
X-Gm-Message-State: AOJu0YwicHts0FHPGRoNuzkdEd7w+Kp0Hr9wcngky9jOgOD8DkilGJNX
	sY+YrtnILM80Qk9U5nsyz5teW1HWTiLqF/bdrLMDEAjFkuz1OwjtB7+NfA==
X-Google-Smtp-Source: AGHT+IHwdBP+b9trbBSuCVo08uEFmEiA6ywKIg/9HRA1SKsmPdX0ZyzKzt+f9k6caosUH/EfBgayLg==
X-Received: by 2002:a05:6a00:2394:b0:6ec:f2e7:21a8 with SMTP id d2e1a72fcca58-70aaaee2a38mr12265080b3a.21.1720042687678;
        Wed, 03 Jul 2024 14:38:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] Input: make sure input handlers define only one processing method
Date: Wed,  3 Jul 2024 14:37:49 -0700
Message-ID: <20240703213756.3375978-3-dmitry.torokhov@gmail.com>
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

Input core expects input handlers to be either filters, or regular
handlers, but not both. Additionally, for regular handlers it does
not make sense to define both single event method and batch method.

Refuse registering handler if it defines more than one method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index fd4997ba263c..7e4f8824f4fd 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2517,6 +2517,26 @@ void input_unregister_device(struct input_dev *dev)
 }
 EXPORT_SYMBOL(input_unregister_device);
 
+static int input_handler_check_methods(const struct input_handler *handler)
+{
+	int count = 0;
+
+	if (handler->filter)
+		count++;
+	if (handler->events)
+		count++;
+	if (handler->event)
+		count++;
+
+	if (count > 1) {
+		pr_err("%s: only one event processing method can be defined (%s)\n",
+		       __func__, handler->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * input_register_handler - register a new input handler
  * @handler: handler to be registered
@@ -2530,6 +2550,10 @@ int input_register_handler(struct input_handler *handler)
 	struct input_dev *dev;
 	int error;
 
+	error = input_handler_check_methods(handler);
+	if (error)
+		return error;
+
 	error = mutex_lock_interruptible(&input_mutex);
 	if (error)
 		return error;
-- 
2.45.2.803.g4e1b14247a-goog



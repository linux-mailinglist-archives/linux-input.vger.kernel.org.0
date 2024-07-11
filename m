Return-Path: <linux-input+bounces-4979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3892EDB9
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 19:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C101F224F1
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 17:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A110D16DEA2;
	Thu, 11 Jul 2024 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2ESpU2A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6DA16D9C4;
	Thu, 11 Jul 2024 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718853; cv=none; b=vEQu/mZ0C/xRGhBUtzT0Zz6geB9xQ3HjUD9CezXxuXoDqhlcyoGSS+QP929LXaOcjD2viF0UAqanW7G4e58i5MMsTe4QWxE0dxP0+1CC8oSR/G1X8wjjhfF9NllEIo05E4DnFB1EXMaoWZlIzkkq2NfEBvqp4vHrXXN8rthNin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718853; c=relaxed/simple;
	bh=LV2qkLwVkLu0UyvYvKa5w4mGcnJWYXxH4Pynyzbgdw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLwB9fVjFVeZduHSIyBfqOC1jVzw57Db9qzTL8+Z5vfhTJD9txBd6d+7dYH9LfltGLtHYEKqydASF0boNFhIFL1bM1QiPm0PqM2a8NVEqf6r0I/6rBt/UfhPAdtWPk6X5VsbodvpVLau0xf5mqInjSA8YNDi2X8YKmx8/IOx3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2ESpU2A; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fb05ac6b77so8143425ad.0;
        Thu, 11 Jul 2024 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720718851; x=1721323651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1HlQyJZEZSdBP2lJm/bVCfQMFgVDPH4QbUxllsdPXs=;
        b=m2ESpU2AWr/SwEDNk5aHKri5Zq7x0Sy2o9eR9dIZp6Kjq3Qw0NbILYcGy618bL5lQs
         iXsTEWort066smUBP3E4+GcwA89+Yg9DeebChJpLSbd3Ibd4zMhhDWNTCm6v0BrzVPbw
         57BOg83Ce3dR5uQagAdTYg1hxyGDIi3zXxq88SRwyBWCuZw5J0BMagasKdftSXPqBjJu
         6AtFYgXnbWPKc7QzDLdOovu1KiKcde9/+zY6zofH86OvdEdp9JBHV9o6CQ+d+56xpvLp
         K8fuYwT3Nfw+0PVDezVSAJy+5ZMKqeQn5ss5cq1vO9bECvUxgJMkpedvxD1qdStcCw5J
         +Sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718851; x=1721323651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1HlQyJZEZSdBP2lJm/bVCfQMFgVDPH4QbUxllsdPXs=;
        b=fwua5mvujzG9Z+4nsNEOzzyMm+5cILEwYeLC9YQttbz9+1uKKfjx/D3Zv23NQZ77X/
         5O7d/jZF++cv77ATDiEiyewwF9SFOXC5eGJtgQborOj6tvdXi4O6mOmv5TY4/n4+sVFk
         FbVQbdpub0oNKrm42FQs5wN7W4FP87r5fgv0cz8Tu/BNu6LLfVo5Y8+35ClU6j0QUJIe
         LCzMYzwd2rdLs+pZKhqmGvF5ST3QaOZplbvappbAH0GrKQFGxTUhByicwSFHUb2513fG
         85mNuKshosqiL4biedG/Disvz4DnIU2gW99zK+3bK/1iEIAwdpYKWWSx9PzL2YNh0lE8
         Um8g==
X-Gm-Message-State: AOJu0Yw+8XyejkkzVU5IGHFuDn7CZ2l3XAACYKrBSVrsoL2wQiK/N1fY
	rUV7IEupkfdIrF11abYNI8SG/FyiZofotJgHgjFXNPz6xmljcJmIyvvbzQ==
X-Google-Smtp-Source: AGHT+IHT7fMeIaUUZxL/1MFKinxvV1RLGJFuukwC+TxrAA6s15NCPpTLUzX/7nP/BCxgRvVwh2ODWQ==
X-Received: by 2002:a17:902:d4c6:b0:1fb:3474:9500 with SMTP id d9443c01a7336-1fbb6d4b98fmr80587975ad.27.1720718851150;
        Thu, 11 Jul 2024 10:27:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac0c47sm52976845ad.192.2024.07.11.10.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:27:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] Input: tsc2004/5 - fix reset handling on probe
Date: Thu, 11 Jul 2024 10:27:14 -0700
Message-ID: <20240711172719.1248373-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
References: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the driver has been converted to use gpiod API it was requesting
and asserting the reset on probe, but never deasserted it. However
because of incorrect annotations in device tree marking reset line as
active high whereas in reality it is active low, the end result was
that the chip was never reset on probe. With polarity of the reset line
now corrected this became a problem.

Fix this by calling tsc200x_reset() from tsc200x_probe() to properly
complete the reset sequence and move requesting the reset GPIO and VIO
supply closer to the point where we need to start talking to the
hardware.

Fixes: d257f2980feb ("Input: tsc2005 - convert to gpiod")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc200x-core.c | 28 +++++++++++++-----------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index cd539a2a1dd5..87e6839c60fa 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -486,19 +486,6 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 					 &esd_timeout);
 	ts->esd_timeout = error ? 0 : esd_timeout;
 
-	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ts->reset_gpio)) {
-		error = PTR_ERR(ts->reset_gpio);
-		dev_err(dev, "error acquiring reset gpio: %d\n", error);
-		return error;
-	}
-
-	error = devm_regulator_get_enable(dev, "vio");
-	if (error) {
-		dev_err(dev, "error acquiring vio regulator: %d\n", error);
-		return error;
-	}
-
 	mutex_init(&ts->mutex);
 
 	spin_lock_init(&ts->lock);
@@ -539,6 +526,21 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 
 	touchscreen_parse_properties(input_dev, false, &ts->prop);
 
+	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	error = PTR_ERR_OR_ZERO(ts->reset_gpio);
+	if (error) {
+		dev_err(dev, "error acquiring reset gpio: %d\n", error);
+		return error;
+	}
+
+	error = devm_regulator_get_enable(dev, "vio");
+	if (error) {
+		dev_err(dev, "error acquiring vio regulator: %d\n", error);
+		return error;
+	}
+
+	tsc200x_reset(ts);
+
 	/* Ensure the touchscreen is off */
 	tsc200x_stop_scan(ts);
 
-- 
2.45.2.993.g49e7a77208-goog



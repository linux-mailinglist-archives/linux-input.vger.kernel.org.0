Return-Path: <linux-input+bounces-8963-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7709AA03215
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ABD8162789
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A891E009B;
	Mon,  6 Jan 2025 21:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj0IrOJb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFAB1DFE38;
	Mon,  6 Jan 2025 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199348; cv=none; b=F39lmxlKwpVIom+J6CGEcQsDXBBU1XtbrrmoczgokBeZ0hGsn9Y/z9Y9TlvbHGBw2ppS/YQSS8S/Ino+YIcYIEiQRFaEuh3colDHv8gbDKU1HsRw5yWsKr/DIQKT2Xt4ZnW+QTsPOTHzrovBmrJZmF0rtIm6OTof9JhtHdRbsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199348; c=relaxed/simple;
	bh=60aSOMQx14zfMVGYITpU0cwL1JQM2IC1G8kgAFjv5ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2kL2NK0g/yFAHElzbvBFOewPIM3SAqMGparYNf3xfz3OcryRQO463TdAIhf+0KWTPrQjhDgom1JTv8MZ9DCVUa2bvbViGnud1P+szOItCD6ydNkFIYiGccddC72P5Oisa5GHKAB7V+oBiZF6e/StoSfGUMyjdyDOghxh75JEWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj0IrOJb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so3133599a12.1;
        Mon, 06 Jan 2025 13:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199345; x=1736804145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMTdGnyyJWXuH6aEDEPHe6IuTncIDqPC0Rg1e/KX1X8=;
        b=Hj0IrOJby189fvEKXMszYI5+r8/j07iOFh40fmuh7nrfMp2KSkRUKArV8irJr4jaxi
         iObQOSol/3vkLXqVaNhpLixDloePgBEPn92oFU98HlZbA4VZ+d1oCbQfCMfn+Zf3yu0w
         4U2bwUPZwfF1r6BPL1cOsGfVQuarahAhnj3aIukXEtG0jWlvW91EGdC3O7nh6bN8tO40
         u05kf2kCCRg9aSGlLRNXF1Pm+00HzFU24UC+hEElisBbyiGFVlppzkk4x3F3TUYygB3R
         7OxO4oq8AU5BCwbHdUaye/Xrxo/lvQ0xp13veVG5duqkvXTP9aAmkWC4J37dYkzjHQX/
         gLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199345; x=1736804145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMTdGnyyJWXuH6aEDEPHe6IuTncIDqPC0Rg1e/KX1X8=;
        b=DvhGw8h3vh7EkhhMx/Kt04MASKeyC4nG3SUO/eJNqoAI/7YOErfKtz2TS/3aGVNJIG
         3IhtXya6bJDivK2UsGJl/v+j9IHZUS/1CPsLwmqXuKwFH1SmMXFcgVetc2D1yKQVy9Md
         3m+rlnVSM2doUjJ+uZ1HH7/Tyzyp1WhbSJcKBgbMjmZzt42bk/BCkSQ3pi+p2hA7ke00
         0wlu9Af+/x2GWEECMYoZV0giPk12jkKzQZkaj1nYSs+7c6S/+76F2W5+XnxMP2Y985Z5
         ebCkY5g0M86jpMNhvyBwbpKHdpmQ2c2ES2f4D5U9dDUEpo1gL5Z4akngLosjMr7V8yzr
         JKcw==
X-Forwarded-Encrypted: i=1; AJvYcCX90He3otxm40KAdipiCkSuOsf1m46SsalyeUPXBCcjoV3MYOxtTXzLDH9iC5owvfLslklu9Sc1ITU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7MJygeXOn56qN2wY+R1xfKmmqvkw25TLiNJC7LAaoyW0V9ZJf
	l5rD16JEeCQp6wyYNjD7PbXU9qWkzEwCFi1ee7E8zIG7vh/ml+p8Tfb3nNxG
X-Gm-Gg: ASbGncuPi/dAnYVcTk6zWHFNi6SPzfC7T+bgLvv7CgsTgQBHxr31LwF3uvYA/CrLGDx
	xm1vqE36ArvfUIpyJ2KgfNCAWxk04kjF18uLnBYNIH6y6UufrnSQC60Nln9wCFGinOgZMeRUTvj
	aiAUz8jmVcI5Rhqvs41DZPcsDOi49l+0RrC/tmKYLl+mWIKxWJWgFeKJ0jE/jF/Hs8pi+OfQ61E
	lzkZNDoiD6XqeUQI3YvxjPwl6NZ9jvu1XC5kgeoV1EUcmttLdnTB1Dc9KfLNZxhGueoPIKCzplV
	XyUOTTX2FBqLYJMLy0unKZT5dbs=
X-Google-Smtp-Source: AGHT+IEzCYYiNd745kQpx4ofP4CyvT4uBaER669kvtUAhW55t9aMvo8vYfBByQTR6sHxJ4psV+dT3g==
X-Received: by 2002:a05:6402:274e:b0:5d0:d183:cc11 with SMTP id 4fb4d7f45d1cf-5d81dd6422amr19450229a12.2.1736199344696;
        Mon, 06 Jan 2025 13:35:44 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:44 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 01/10] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Mon,  6 Jan 2025 22:35:30 +0100
Message-ID: <20250106213539.77709-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux defines 0 length as infinite in its force feedback API
while USB PID defines NULL (0xffff). Most PID devices do not expect a
0-length effect and can't interpret it as infinite. This change fixes
Force Feedback for most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..3899d72a0b02 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -301,7 +301,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	// Convert infinite length from Linux API (0)
+	// to PID standard (NULL) if needed
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? 0xffff : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.47.1



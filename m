Return-Path: <linux-input+bounces-11942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA8EA98471
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 10:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F592189629E
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 08:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED5C1F3FED;
	Wed, 23 Apr 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JeTIT23d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F31EE019
	for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398555; cv=none; b=mdFHqeynDxezZlDSOj4tLheAR0dyOfJQt88zBlgal0bh5qZOOKamq3jEJC2zEjuVRqP/QqKt2U44xHFYEEPtXLk1XxpzbZv2avZEQ5Hqf2RKaCH2vmf8pqFN/bbcTS2ckU0t1rs5LAe2pZ2gh9zUpi9rHhH2efsUB1QFTOB3q28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398555; c=relaxed/simple;
	bh=78erSKRClsMeZtwbiQK/eYXqLE0Qi/RfkYG5lQRg06g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQM7HYgn+NVGrALmP7jPDZmr4WS9w1uqGO7z3tj0DIP7ddbeM/zCqX3Z6k1sPMZqJM3gdHIHU1XTbVDnA1Hzt+Z50s5IBEVOSw8HXBy+CNdGxTOLOZq8okTB/mZPHB+/fZihW5CyRTUq07CaRM8ybT32QUurmfxqpjDXmK5o8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JeTIT23d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so5087225e9.1
        for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398552; x=1746003352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU+q6B+KeVc9Dotp3+HXW8/M81FKVZlxFGFb0G5Bpbg=;
        b=JeTIT23dk7LAG2SWSF6CwlCSARH6KAk7Cf6JJHcGQN383WsvbCa8Nfn6F3qgYc4sSJ
         YZAeFOerEfqoDMaePDdsSMhOOcEVYFae4VU2V4IoX0i7q9NXp74rJIRIsgQvgsycsm+o
         +aMPAus02h25P5RJmBqxerrrTwREelDdfNb7HWiHSls0yx0qdRgsuu6TrJYiSBCIBmu4
         COzblGKAmUcyvuN0FHvsKp7gYf2JUFzpll2R42iERYc99stuYQJ9IzJ+k2BqBWOmEUS2
         rjjQ7ouZh11YLoklx1zkGoolGTTSjo0cHZdgiNEtNlSl6GKgADA1USevhsaOhg7SG4XF
         LHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398552; x=1746003352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xU+q6B+KeVc9Dotp3+HXW8/M81FKVZlxFGFb0G5Bpbg=;
        b=R125SLGl4U6MVvyJNg2BbTMqSy/VSHWz1i9IAQrPFwSU75lZcNCWEXt8gp+Qhn+ppk
         mfIdgf5CJpaRLOQDLXpL2MlC1g941ljpN4bniPCzgrc7rFfyUz/13aXYoCavaGNNBeWR
         qI6NQ5vYVl2kBblJoLjij30vt4F27WCXmuzgyHE58phK8AyUE6B3oFxWbQ4ghEwXBYk+
         mv5OEUAYYrBnFi6i3cegkRwFLnEc95LUZa0IUJNJ/xZNmK7Vt68kNK1O4la0zQ9Dib7K
         g7zlbI2zXdWSbEDld7UzLeWwzq54Z1FIe6lnyvJP7CJ6JqZsw0rI0wuGviUzAEcazo7w
         HiyQ==
X-Gm-Message-State: AOJu0Ywy7A+U9uVk1VfOkvZaVyXVy2dLZMfWHi1VdgHHd0QWVAYoZI/9
	YWu9XmWQsVkIhGaIcIiQH0fhn2n9t7NV/zQCVec9rNAbmUG7vVan8bDZZx/iWJs=
X-Gm-Gg: ASbGncvGZLg0WM9gOBqNspfqQei6NoqEvLN92iguDzDnL3iJOV94CbhIzgAPba8dKbK
	gF5BLQMrvIWzL7XheNHCSQJ447xtwwNPk8RK+XmVkvKLWEBk2AmgkqeiHVGag+D4PpzMq2AV532
	53Mvuh7vSZTPM3+WJOirV/N5F/2uVNznn2SHi5/Q06y573Y07nMneQnTNF1vaQ21IVxAL+N+4DA
	BthbxmF14vhy5MBnd3jFwzIqy3M6UkwwY3NO4GRnQh9/ZGOS20G+SUprdJ+63Gsr9UrubnBWOCi
	kUGqhaWBqr8wPtvtNednPYtgwmMYGDbFEg==
X-Google-Smtp-Source: AGHT+IFsnUHyXLc/V2ofKcW5mQzbrMR2fSz2s4gn5/R5CVyacBF7IB9KCUsiHcaRQw+s8v12JkDS4g==
X-Received: by 2002:a05:600c:1d1f:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-44091eaec9cmr18708095e9.2.1745398552009;
        Wed, 23 Apr 2025 01:55:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 10:55:42 +0200
Subject: [PATCH 4/6] hid: cp2112: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-hid-v1-4-2e6762b582f6@linaro.org>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3m9eD5np0PCYm6CXzEmoZHY1+lpcLzL/5hTmqHLPJkM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsSzMLGtDZLUYWUDyAUa7jdtk9GnBimJcQX2
 SoTdL2SZ1aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirEgAKCRARpy6gFHHX
 cgzCEACfhjBYKX9WaY4Rj6j6dY6Nsm8jaTIw+76AGZPtpSCeseU5lPyTyVk0kfxUseBanQoYcsy
 AJC2ReKiFWZ8x93TDQCuXc0HPRpsJxSwH58DQZmdSpeWtYl36D40pjvVdlaUKJPEGh3M81IY53y
 W7qPcBz+CaA5O3p8ijVymEwJxGcVD9Q5YzGouWP/rQnIJYavqitbMr/C6D11wOvpbkcCr76KKvT
 LOFuNGZ9qvyg/7GpRGoDw/nPyndmQOLAZFqk2LWwM6IITlvVRrCx/w0wFk89EqrbfVbUaPdg1bn
 PiQ7G4shFXnhl2te1Ts5uSr8mFglwLYo9HuUbFHPelb4YxR9w9Y/o/NET046Br47Ejn7dbtH/0p
 XEylhaW2+63qWgabCRvfC4LKks4CH/W2gx1svepYJawFK/YJWdxJYuClSrWGCvxqWuV27CjDncD
 3pfif/fk6my5n0ECt+XOhz6FCENCaHRHwp+OxEdOt/Jr19MKGn/Z+d6DdU5Po9KIvdTtxz96kwL
 WCuyuLyXkDvxs6LinqpRNdlMT495MVXKhtk5FlCz5yVm7t6R+69y8MJEo6HL9djCLhUWmq6renD
 i6iTn5Byw618DT5kDY57X1Cz5FA+I5u6CLVjKjWu8FMcc/8+SlH4Sb+MgpTQrkxwn+gG1U+6sY9
 TfYmnorS8l3zKfg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-cp2112.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 92dd891b7b59..234fa82eab07 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -215,8 +215,8 @@ static int cp2112_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void cp2112_gpio_set_unlocked(struct cp2112_device *dev,
-				     unsigned int offset, int value)
+static int cp2112_gpio_set_unlocked(struct cp2112_device *dev,
+				    unsigned int offset, int value)
 {
 	struct hid_device *hdev = dev->hdev;
 	u8 *buf = dev->in_out_buffer;
@@ -231,16 +231,18 @@ static void cp2112_gpio_set_unlocked(struct cp2112_device *dev,
 				 HID_REQ_SET_REPORT);
 	if (ret < 0)
 		hid_err(hdev, "error setting GPIO values: %d\n", ret);
+
+	return ret;
 }
 
-static void cp2112_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int cp2112_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct cp2112_device *dev = gpiochip_get_data(chip);
 
 	guard(mutex)(&dev->lock);
 
-	cp2112_gpio_set_unlocked(dev, offset, value);
+	return cp2112_gpio_set_unlocked(dev, offset, value);
 }
 
 static int cp2112_gpio_get_all(struct gpio_chip *chip)
@@ -1286,7 +1288,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.label			= "cp2112_gpio";
 	dev->gc.direction_input		= cp2112_gpio_direction_input;
 	dev->gc.direction_output	= cp2112_gpio_direction_output;
-	dev->gc.set			= cp2112_gpio_set;
+	dev->gc.set_rv			= cp2112_gpio_set;
 	dev->gc.get			= cp2112_gpio_get;
 	dev->gc.base			= -1;
 	dev->gc.ngpio			= CP2112_GPIO_MAX_GPIO;

-- 
2.45.2



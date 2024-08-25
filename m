Return-Path: <linux-input+bounces-5831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2A195E1DD
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3405E1F21D9F
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6303A267;
	Sun, 25 Aug 2024 05:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ih9e9nhF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52F28382;
	Sun, 25 Aug 2024 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563002; cv=none; b=sQeKMGv9YMCHL0EKXIgmZPLHnxeWkq5qBOuYT2eWCzx8h9TpFp42Ia9QVW/9CtrCuQwvO7/EfUVnve1Ffu/L8fpmwDQRYUK/OBqBJc9nEhxs556RrodOb1An8DW7kRX7YhA+Vws3n5zd2i0iYsuyr+PctlNfZj8kMQJ26KRkUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563002; c=relaxed/simple;
	bh=OSk3cuE+1s6/axlkl5Wvob1pSWEblZgOBnVXoaDU3Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksYqVqzOIiOE2dnJpUO+Ob17Xa8pof+blFG7zUZfh2QW3ZReLojXeN1eVQIKNmp0VICNHxL65s9fOga7JJloHxdTzyQkcAn4Ok+WS0zlGMTgXrzmylSmLQIt5LuMnwf5xNM+8PpFSFen8PA5aVZuuhoj9sjva3fTeGB8XjFOAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ih9e9nhF; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2703967b10cso2397246fac.0;
        Sat, 24 Aug 2024 22:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563000; x=1725167800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShO+HgvM3GmU9GyOB1yPa+S5A01U1lb+gXxQbTtxVpc=;
        b=Ih9e9nhFoNghFKgVDd3KOC24ec4FdrkVvj0hLEcrHoUnN01joGDF+/mEDRDhoxJsFV
         jGRWMQI/c1yLvNKSYKcInZlTXx9CmTlJO93BAN1xY4bK8b364J9Y7bQT/7fDm7wz+q1z
         9d0oBEfpEI3ah5wVuFfkZB2No32xt7sXQuunGMBoAx6Wts2owOuVSuqJ26mJy6CqPfTI
         24kbvUunl5olH9TJDxUcaYEY/suXBAO63uYHXJmVQLn5dY+qbYvG5Q/t8CrU+DuCoi1h
         AuXVBYVm7vvplwmAVY5mOkxHsCM1PgAxyK/Lg+MfYNCAcOx1W66fAQEstk+DIoIrpnat
         b51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563000; x=1725167800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShO+HgvM3GmU9GyOB1yPa+S5A01U1lb+gXxQbTtxVpc=;
        b=R+ss+e/8S9p4IWtoyaaN50+YPJMphGT9ph0YpdaJPulRwWIV91RYc4fxUm2b8o7LHD
         1v7PkNa/Z3eOabrAtSwqXFrFL5lMiyn7AsK97ta90v/mMo3u0kTrokEgI0qCEYPCqYum
         lXnP0VnUp3BSYZHQj5AAzzfIKLuvsF6rBeIzPnaks2H42AzN7aT2M56+q/VlvVKxPURP
         h0KdErL1RMBHH6aq1Oy/DppZyRyu0i7vYVmMJWpp2xFdu8JuSOjEe/Hx9/CQmbS+Ohfl
         s/m/kIWeXGY6AagWrSzARGT5nlTtpdQPP+gKeHDE4op9FnVTp1XgMllZwr+Fhyfvvzhb
         ENXg==
X-Forwarded-Encrypted: i=1; AJvYcCWw1Ic2ponYQ9HAjok99Hre32echD08B/UvrrpIsxn4x/uTsRHIlDSiVsBQ/de42F1gLDvsXYTIn1dHUmo=@vger.kernel.org, AJvYcCXIh/nMh8M8wf7EVF877WTNCqQOKyUjfLRGq0NToYJ0t4M/Mbcc5Uizm9w4yJfGwErkFNgsMSu3a8uQIWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY6horRlQFyF88Z/2AlEmdEa9rjbjcM0qsdLdci8JtmQt7JTyN
	sWU5NoYSVV9fL4i6rDNUPUcdLPzshbNNrYOea2yTGCmDOZVvb3Prt4TBZw==
X-Google-Smtp-Source: AGHT+IEZFPpCzZoomgKLJTyaudR7j9NCS6uaxVcYk6aQIQGxzRythkb2raMKaNsay8DSDOaUBbZJmA==
X-Received: by 2002:a05:6870:1608:b0:270:440a:a40e with SMTP id 586e51a60fabf-273e67260d0mr8083459fac.46.1724563000175;
        Sat, 24 Aug 2024 22:16:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:39 -0700 (PDT)
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
Subject: [PATCH 01/17] Input: adp5589-keys - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:05 -0700
Message-ID: <20240825051627.2848495-2-dmitry.torokhov@gmail.com>
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

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/adp5589-keys.c | 39 +++++++++++++--------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 8996e00cd63a..735d96b056d4 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -404,7 +404,7 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (val)
 		kpad->dat_out[bank] |= bit;
@@ -413,8 +413,6 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 
 	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
 		      bank, kpad->dat_out[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
 }
 
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -422,18 +420,13 @@ static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
-	int ret;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] &= ~bit;
-	ret = adp5589_write(kpad->client,
-			    kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
-			    kpad->dir[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return ret;
+	return adp5589_write(kpad->client,
+			     kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			     kpad->dir[bank]);
 }
 
 static int adp5589_gpio_direction_output(struct gpio_chip *chip,
@@ -442,9 +435,9 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
-	int ret;
+	int error;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] |= bit;
 
@@ -453,15 +446,19 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	ret = adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A)
-			    + bank, kpad->dat_out[bank]);
-	ret |= adp5589_write(kpad->client,
-			     kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
-			     kpad->dir[bank]);
+	error = adp5589_write(kpad->client,
+			      kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
+			      kpad->dat_out[bank]);
+	if (error)
+		return error;
 
-	mutex_unlock(&kpad->gpio_lock);
+	error = adp5589_write(kpad->client,
+			      kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			      kpad->dir[bank]);
+	if (error)
+		return error;
 
-	return ret;
+	return 0;
 }
 
 static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
-- 
2.46.0.295.g3b9ea8a38a-goog



Return-Path: <linux-input+bounces-4777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAE291E701
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 19:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCC91F23386
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 17:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918A316EB6A;
	Mon,  1 Jul 2024 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzgQrqHb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626C16D4F0;
	Mon,  1 Jul 2024 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719856643; cv=none; b=kCGLMXPO+V60qmEeL3BexGxARCAIuv0OWDNsg6hmbEy31r0WV5r9FcVvvrijB7NNDEYydztYJ2H07fWWQAVGB8PECxOPrrnwbUL6xHxtYbY5bd3B1VPwOj2AmraSUC8RaLPuOQSf+P0OlS6MxC5r1EAKKVvosktlUpSBUldk/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719856643; c=relaxed/simple;
	bh=SaLxlOaLeIy6cJ2O8VEYwT6gGoNIQBGx/nLJKnvcBqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h01TUPoXImAsZ8UYgaaIZBscay3EkOeEoNzl5EpaEk6wjQtb7nW0Qyyy2cGEjXHGJhITwgNSEOCDTYldXYmLvfEDBefoVIAo/t9CFx9xMk9+AuavG4J8PgERNmXo1f+NMelwjST3U//bR7wCysda38XpD/rZsXcrOYOFDqkqB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzgQrqHb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f65a3abd01so24010115ad.3;
        Mon, 01 Jul 2024 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719856641; x=1720461441; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTnBu4nnqsZojUMtGOINbfAR4CxGHYDTTSGyDIhRhiE=;
        b=AzgQrqHbgWnt2+VtDV0c7mC3yvPjNVPd10juXZTf6IeaOZTunMzI/meM+GIy3oFb96
         i7Opi2YEp+zJfIkjMOHxQom1gk0RT4wNRhLMaXs9xEn5536irNUqQpU1p1BXQzzVbGtI
         vrwsQxbu6o/enUzGfn/Xzck9ZleR3Qjr3euNx7pqKcIktO0mOZdD7e5aw6NrlS8NrZsA
         tgT8v6R78KDPV15uc60OPO9XviUor9pzVaX2CcqCNzVdOQjdguKdvskKVdw2sBq6hYom
         37MfJzduOC43wYh3UVzIogQ8wWAZNATPT4jifZOrXsyMjFf+EgkUB/noH3jTL+gkUijV
         iJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719856641; x=1720461441;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTnBu4nnqsZojUMtGOINbfAR4CxGHYDTTSGyDIhRhiE=;
        b=h2bxBqsT05i/Eq/DspFEkSyOITdo56U6q0wZrQj5nnB7QCPCGZw9RsrP56xzEFdXIR
         M0QwtWmM0Uj4biMppnvVcr1rD1r8IoN0a7U7+97nFXY2KPlSh2tSGC+tDnWSTR/FUGtR
         iL7icxntNCChYq7WfKZCvX9SiWwu99N8qSEkHbDKujkF685yqh6YpKZwJKN8mcnR81xg
         nSIPzZDReJu77jaTBwy++grJr9/oLMe5OstxGCE1a6v1MmhbWVDcsBtoF2o01pQCKT+R
         /+L7QSp8ne0NgpS+uI8KFSW32wIYgSK4dzLTGBRhnJui4535BrN6L0HqyJpOT+ZXfhot
         y2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXETdqT17+0wPeLrjjYu2YVrj0uBG1y93KqP5bsRdXK8elmwR7d1yB2Y+6XHP1HV0dz9K9flDdtwZYKfjXrykgnuXlOueYjoKe6MR322zT3J/RjoP1W5br28S5xd1N6NNvfHPwxGLb27HE=
X-Gm-Message-State: AOJu0Yz7ZMjsvc6odxkuYPzwQpJk/EVnTjAhxNvVLcCd7ZZYeBk8oiZn
	Mg73aP7lDM4iZ5OK4kvORdBNZw2rsOKCpyJnnOjTuPh85Wt6GfJN
X-Google-Smtp-Source: AGHT+IFo+6odbDk3AziB8lJmBh7bCrPK0HlbjMXlB/kaZJyUYY2xfVs8u2HJkwLzKlpyeEkt+pN+Qw==
X-Received: by 2002:a17:903:2308:b0:1fa:1d37:700b with SMTP id d9443c01a7336-1fadbce6a01mr57101205ad.45.1719856641322;
        Mon, 01 Jul 2024 10:57:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e392asm67875045ad.78.2024.07.01.10.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:57:21 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:57:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iInput: adp5588-keys - use guard notation when acquiring
 mutexes
Message-ID: <ZoLt_qBCQS-tG8Ar@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This makes the code more compact and error handling more robust.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Sending this out because Utsav is working on the driver so he can rebase
the work on top of this.

 drivers/input/keyboard/adp5588-keys.c | 49 ++++++++++-----------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 1b0279393df4..09bcfc6b9408 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -221,15 +221,13 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 	int val;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (kpad->dir[bank] & bit)
 		val = kpad->dat_out[bank];
 	else
 		val = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
 
-	mutex_unlock(&kpad->gpio_lock);
-
 	return !!(val & bit);
 }
 
@@ -240,7 +238,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (val)
 		kpad->dat_out[bank] |= bit;
@@ -248,8 +246,6 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 		kpad->dat_out[bank] &= ~bit;
 
 	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
 }
 
 static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
@@ -259,7 +255,6 @@ static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 	bool pull_disable;
-	int ret;
 
 	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_BIAS_PULL_UP:
@@ -272,19 +267,15 @@ static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 		return -ENOTSUPP;
 	}
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (pull_disable)
 		kpad->pull_dis[bank] |= bit;
 	else
 		kpad->pull_dis[bank] &= bit;
 
-	ret = adp5588_write(kpad->client, GPIO_PULL1 + bank,
-			    kpad->pull_dis[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return ret;
+	return adp5588_write(kpad->client, GPIO_PULL1 + bank,
+			     kpad->pull_dis[bank]);
 }
 
 static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off)
@@ -292,16 +283,11 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
-	int ret;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] &= ~bit;
-	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return ret;
+	return adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
 }
 
 static int adp5588_gpio_direction_output(struct gpio_chip *chip,
@@ -310,9 +296,9 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
-	int ret;
+	int error;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] |= bit;
 
@@ -321,17 +307,16 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	ret = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-			    kpad->dat_out[bank]);
-	if (ret)
-		goto out_unlock;
-
-	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
+	error = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
+			      kpad->dat_out[bank]);
+	if (error)
+		return error;
 
-out_unlock:
-	mutex_unlock(&kpad->gpio_lock);
+	error = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
+	if (error)
+		return error;
 
-	return ret;
+	return 0;
 }
 
 static int adp5588_build_gpiomap(struct adp5588_kpad *kpad)
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry


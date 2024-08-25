Return-Path: <linux-input+bounces-5839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E895E1F7
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F891C21547
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B94823C3;
	Sun, 25 Aug 2024 05:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhmQxu2I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57317F7FC;
	Sun, 25 Aug 2024 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563013; cv=none; b=oLYUT3QI/ecUIhc3BBdU4xCxy8d7+t51Us8FjzvavUYsnshBc1VgxMK1WFxUZ6OYx87NtRf3T8yFzJSrbDEj5qwjOm7XsxE8npSmdVW4ntDKJKpqcO0QcK/lX2th+vNdA608FH5zgcD8AMlalM1q07s4fAkhYnIHidjU9cgz6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563013; c=relaxed/simple;
	bh=9QH0Z2k1Exe8nRbW09wHzcRQf5tH/6RKlkLk5/+ZLDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1Hk4bIMYjkTunbXxSdFxRWQyurfxMVJ7J3RK348i170ckg6dORpPoKYCNOmBYf/KPohuuqQl/luWhH3mJtkJ0p3flosDeIi8fYtjHV8CAs1I6KL7jkPMxXVzpzrUlQd3kgr6I0k/zU31MVAVCPGkt8vznlNAqZqjLaSyQztOd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhmQxu2I; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-714302e7285so2797474b3a.2;
        Sat, 24 Aug 2024 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563011; x=1725167811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1sIje/HnXzt33wD+dka8sJAuwV3C7GUd6Fvewfxm9o=;
        b=nhmQxu2IZqlUWVEZja/FcP6IxxfQC8aFtCdUDEqazlOptNsZ8dTuesJqL9IcGS3zRz
         ob5CPGzpOWlJDF6tW4A16N1LpjzwHSDEsPwyZVmXtRCjMdbkLCXhIgX/jOAdw0Jk/dcC
         4hloWImfwFtmHOm4K7KEIcgFWl8jJ25hQNCPSv15xL7EAuh1oVnSZBJ85nk9xFWSn7fc
         FAfE1boLKbf4Gg5PCCpVt3nS94e/IZW6D8U197S3oZXbS8Prvd0elPlexyuBhIVxgL4Q
         Sbd4tHDhSgKveWDJfiy1w4OicyJQRLNOucN0dBwlkOvlVODxEcfefhuOweMl2kiT9KD/
         0mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563011; x=1725167811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1sIje/HnXzt33wD+dka8sJAuwV3C7GUd6Fvewfxm9o=;
        b=T8rqtk7V7rI4SAWxAogU0pOjah2/Q5ausj/RLeOWVHrzre0ZbIglQO+kzqSt6RsTAl
         5GyYuiCGtByB5EVlySGUx8WV5y3hlDUxI/Gel+AhQEl+eVRVQjOZRTLYg41xUEVGZzFf
         aCquXb3CUJ45+tIvc7IOCOW3QsoC4cav5SNBd+C+SgTJ+4EtLMU40mWa/7++OpqeI+zo
         gkC7Sr9g17p2ROzQwtQGS4/Cgj0XrWDb353FpKc3QifhN7wVnnQMxymYADdaWKoCGNkw
         m3uFL402169eKNP/zYSBF6iS+z2Vztgw5r6kWpZ9ISOqd+x0scvr1nrwJPfi0ogcj3p3
         ntYA==
X-Forwarded-Encrypted: i=1; AJvYcCU8FDPVOutxIXTMJQMxX+nhR3pLbO39UvXxoOytA0rD67gY2/l/kxJCYEJaOkDYGt3JVnajwsP4DGtyhvQ=@vger.kernel.org, AJvYcCXKUpNnUBIgUyIJPJJyjLZBjlm8LWabhSoKF2GGyoiqgnuAaikhH4qOj8fm3aea0wfpfnz4qfFvNPnrCQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws9mp5uW3ntvTVcC+X4SWyV5wRVvNSjfw1026RPS6p6+Lg0RXJ
	06iKoMA3QnsHuAIAJQhMgOvw/LyZuDa2T1A+A+csgUMtJ5/ZmlnRPaztQQ==
X-Google-Smtp-Source: AGHT+IH6nl7Gp6typ8jXOMj8WE/a55ZrJJqfoIbSsLMBPPh/0P9kxt4yqzLE6RUgOHHWRfDQqSZM3Q==
X-Received: by 2002:a05:6a21:3a87:b0:1be:c4bb:6f31 with SMTP id adf61e73a8af0-1cc89d4d900mr8040665637.18.1724563010571;
        Sat, 24 Aug 2024 22:16:50 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:50 -0700 (PDT)
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
Subject: [PATCH 09/17] Input: lm8323 - use guard notation when acquiring mutexes
Date: Sat, 24 Aug 2024 22:16:13 -0700
Message-ID: <20240825051627.2848495-10-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/lm8323.c | 49 +++++++++++++++------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index cf67ba13477a..e26bf2956344 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -350,11 +350,11 @@ static int lm8323_configure(struct lm8323_chip *lm)
 
 static void pwm_done(struct lm8323_pwm *pwm)
 {
-	mutex_lock(&pwm->lock);
+	guard(mutex)(&pwm->lock);
+
 	pwm->running = false;
 	if (pwm->desired_brightness != pwm->brightness)
 		schedule_work(&pwm->work);
-	mutex_unlock(&pwm->lock);
 }
 
 /*
@@ -367,7 +367,7 @@ static irqreturn_t lm8323_irq(int irq, void *_lm)
 	u8 ints;
 	int i;
 
-	mutex_lock(&lm->lock);
+	guard(mutex)(&lm->lock);
 
 	while ((lm8323_read(lm, LM8323_CMD_READ_INT, &ints, 1) == 1) && ints) {
 		if (likely(ints & INT_KEYPAD))
@@ -394,8 +394,6 @@ static irqreturn_t lm8323_irq(int irq, void *_lm)
 		}
 	}
 
-	mutex_unlock(&lm->lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -445,7 +443,7 @@ static void lm8323_pwm_work(struct work_struct *work)
 	u16 pwm_cmds[3];
 	int num_cmds = 0;
 
-	mutex_lock(&pwm->lock);
+	guard(mutex)(&pwm->lock);
 
 	/*
 	 * Do nothing if we're already at the requested level,
@@ -454,7 +452,7 @@ static void lm8323_pwm_work(struct work_struct *work)
 	 * finishes.
 	 */
 	if (pwm->running || pwm->desired_brightness == pwm->brightness)
-		goto out;
+		return;
 
 	kill = (pwm->desired_brightness == 0);
 	up = (pwm->desired_brightness > pwm->brightness);
@@ -489,9 +487,6 @@ static void lm8323_pwm_work(struct work_struct *work)
 
 	lm8323_write_pwm(pwm, kill, num_cmds, pwm_cmds);
 	pwm->brightness = pwm->desired_brightness;
-
- out:
-	mutex_unlock(&pwm->lock);
 }
 
 static void lm8323_pwm_set_brightness(struct led_classdev *led_cdev,
@@ -500,9 +495,9 @@ static void lm8323_pwm_set_brightness(struct led_classdev *led_cdev,
 	struct lm8323_pwm *pwm = cdev_to_pwm(led_cdev);
 	struct lm8323_chip *lm = pwm->chip;
 
-	mutex_lock(&pwm->lock);
-	pwm->desired_brightness = brightness;
-	mutex_unlock(&pwm->lock);
+	scoped_guard(mutex, &pwm->lock) {
+		pwm->desired_brightness = brightness;
+	}
 
 	if (in_interrupt()) {
 		schedule_work(&pwm->work);
@@ -510,12 +505,12 @@ static void lm8323_pwm_set_brightness(struct led_classdev *led_cdev,
 		/*
 		 * Schedule PWM work as usual unless we are going into suspend
 		 */
-		mutex_lock(&lm->lock);
-		if (likely(!lm->pm_suspend))
-			schedule_work(&pwm->work);
-		else
-			lm8323_pwm_work(&pwm->work);
-		mutex_unlock(&lm->lock);
+		scoped_guard(mutex, &lm->lock) {
+			if (likely(!lm->pm_suspend))
+				schedule_work(&pwm->work);
+			else
+				lm8323_pwm_work(&pwm->work);
+		}
 	}
 }
 
@@ -608,9 +603,9 @@ static ssize_t lm8323_set_disable(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&lm->lock);
+	guard(mutex)(&lm->lock);
+
 	lm->kp_enabled = !i;
-	mutex_unlock(&lm->lock);
 
 	return count;
 }
@@ -758,9 +753,9 @@ static int lm8323_suspend(struct device *dev)
 	irq_set_irq_wake(client->irq, 0);
 	disable_irq(client->irq);
 
-	mutex_lock(&lm->lock);
-	lm->pm_suspend = true;
-	mutex_unlock(&lm->lock);
+	scoped_guard(mutex, &lm->lock) {
+		lm->pm_suspend = true;
+	}
 
 	for (i = 0; i < 3; i++)
 		if (lm->pwm[i].enabled)
@@ -775,9 +770,9 @@ static int lm8323_resume(struct device *dev)
 	struct lm8323_chip *lm = i2c_get_clientdata(client);
 	int i;
 
-	mutex_lock(&lm->lock);
-	lm->pm_suspend = false;
-	mutex_unlock(&lm->lock);
+	scoped_guard(mutex, &lm->lock) {
+		lm->pm_suspend = false;
+	}
 
 	for (i = 0; i < 3; i++)
 		if (lm->pwm[i].enabled)
-- 
2.46.0.295.g3b9ea8a38a-goog



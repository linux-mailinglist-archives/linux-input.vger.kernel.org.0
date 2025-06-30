Return-Path: <linux-input+bounces-13190-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6DAAED8E5
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E43D3B6A19
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 09:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71E5239E7C;
	Mon, 30 Jun 2025 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VhNqzNDr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2441246766
	for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276250; cv=none; b=jRm9j/rTZJwDxc3XayJi/vAuKJcuESb33JGLqDieTTXRSJEUsZg73h6a9jrLLSjB+AzuAVMJqfJGScen8Cue/nPgIpIU58qpcfglbESnx38tAJ5WLhYtSX3FY0kj8cY1YNy6BcFiH5loXbOe6yiQvyUHiojM08PsJXNKIjDwJsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276250; c=relaxed/simple;
	bh=GnfLzsdPfQ2VHV8UMkZ2FvFVLNH8ELi6SNM5xx1OHiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sGziMf1j74Nn9hrrsSxqvbjbYJio3HhTer7V9xc+ao8h2HFb4gdSt/U1+hbENdM+2UeqYi0cqxXAdVP/u44TxmC9mZsasheydJB0o0uCuB7ien88x7fO1JLZfAfGYAzwOxscDTHam8mtOdeokp5uFmi6OpyUC4dU8Ob1ksNZcic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VhNqzNDr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453398e90e9so14154115e9.1
        for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751276246; x=1751881046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gUrNdDVU77c9uw4mJM2RJELk7rgZTpadQl39/qaYr4k=;
        b=VhNqzNDrowA5HQ7XqL1sjW4x/f0fgTnpRA6mjqyxIb6Kx0PqcgDI0hnW7E8TUVA7uT
         H4Qn6V4/tG2Z1vEb8sMn1XoxsetoULXLLkiZuJdxe8QlsOizxUEuHEhAJqquUSeJuNZM
         B7nCiwYJt/xu7BnDh8seaM9Ju7naItYWS3ckjFj7eg3x1FWtULofmLpO6CBF0tHbzGed
         p6NpYP29OZDloiGYEszvKxK4vPl7DbBoz7xx4W/pIo9CRMP/MfRYU8bJvIiL5Ijc6adk
         eiV5PZ+Gdgnsyzpm94nuB0YjQZvReLjdeN6EtKFk5oOXxmzOkQXaXpRwnKab7ICbVfNb
         lypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276246; x=1751881046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUrNdDVU77c9uw4mJM2RJELk7rgZTpadQl39/qaYr4k=;
        b=oL2mOt9r6krs28b69t2mh5hTC1lHQMhc2aAphX9qptakL9lLjaR4yysRotqL6NVfon
         M+GlFBQuYsil0C3dgPr8NfgvawkFSKRfDJB3Rr/p93KsyE6MlStvTTE66aR6hxXRu/Zn
         l4Vg0ThIH6vqEx3s2yVKQZVww34Yt0a1HbafdUbPK5eo3m8wuJGV33x5MLsNI6baCmcV
         mSljufMgs3bfQ+PGcjmGG0a0aeu5kAX0SFlGyDgNIILvquwRw1mv6sC5oSXd9pkT6aKs
         f6QebOJnMZborOt/xZr83DvpzcF18UEEKt+VXWIgtMRmyX5XtqQw7DeX1LRGR7M76dWP
         ZEAg==
X-Forwarded-Encrypted: i=1; AJvYcCVh2k+S5ualxBpMY1rEPVE0kTIOcuNm/xmdSft4A4QaUfSCMS2jJFB4otH4gB/oDrBHc0kdgK4SzrVjkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVvY7OgDdISoSwaOTr4Ag0+4BlEveSh2fVbi0wbWZi/IrqaaR2
	2foMw7/HNYgSE8nLQdxFi32YpLWnV253s2FFOfFzaCY01tkEHqHPXzQLJzwzif5fatw=
X-Gm-Gg: ASbGncvyANMrIpvrbGJG4E7utQfEWLrjrjHMHyyIeWTU+ltWJdH4oalV3Fr/B1k7Mgk
	DVF6nnnlgLT0HVImrmahkNCZ1w+M4JJE8n1IkyvTR+yeJ0Knmw2eoPG7GhEcj3tx332Bzzow3kE
	+4pJfXRRJDVlVpuZ534Lag8Rm0wFX0yzU+BJOMeHFJgWTeQfG5IX18ixQXE/3rvMkA4Gq18Ju6N
	7Y+VcqqfGqdjFgp/lUdLwb5SoayTasiYCwksCgA19VvvgzdcU9Wqbwa8Me5DvSyyTSdQdZh2n6z
	uP3WkCCMMgdronwSFfF4uc1VeCi9DbeiNKtEOh/wjNluHR2BZ+9g3JdmmGIBCbCcEuH7NV+gAWw
	3kHPQMK3MHr9SwZxQV1hBe4En4GCA
X-Google-Smtp-Source: AGHT+IFBxWCjZ6a4yiGuV3Ap6A1SD/3fbRo9FBv1t8LTT4S614TTr0mdjKuAeIYjUe/jM3Uo1hzqGQ==
X-Received: by 2002:a05:600c:4750:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4538ee30effmr148411035e9.3.1751276246017;
        Mon, 30 Jun 2025 02:37:26 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a406ab6sm131054585e9.30.2025.06.30.02.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:37:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v2] Input: max8997_haptic - Optimize PWM configuration
Date: Mon, 30 Jun 2025 11:37:17 +0200
Message-ID: <20250630093718.2062359-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5601; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=GnfLzsdPfQ2VHV8UMkZ2FvFVLNH8ELi6SNM5xx1OHiY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoYlrOagWcyyC4zVhjFV5jfvaWu/eZAgVghg6z+ q3bXG7SfTSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGJazgAKCRCPgPtYfRL+ TqjdCACH8KqudfEX4kHE+DFXBYTfCBHP3OQFCRbHX3E1kZGB0conIQObEg5W3Ui14u2LbKgVe0c TW04U4aZa1oQu70pTUEzIOO75QCYwralGktrJcHwIiqS0xzWK3+ueIKOw5WaJx8t2lgTNZD5DGA ZUmjrPDIdI7i6CKa/VHGZTal/waeQX0y2SDSTrrnFHWTqCMDJGHWAxMIyKLrP2FnngSysLmadsn BIAgSr2mkKMBhDOtp6tXBlli1EhgQvoQqN6JS1n86s9f/KYesfwsNxWaCXwqe74gqcBkFgjMgV8 uTGhsK6HGjTSyUxIw8br94zkke7T3c+j2EOE1QVKXAFa/u+9
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Both pwm_config() and pwm_enable() are wrappers around
pwm_apply_might_sleep(). Instead of calling this function twice only
call it once without an intermediate step.

Setup the PWM in max8997_haptic_enable() only where it was enabled
historically. max8997_haptic_set_duty_cycle() is renamed accordingly to
make it clear this function is only about the internal setup now.
pwm_config() was called earlier back then, but that call has no effect
on the hardware when the PWM is disabled, so delaying this configuration
doesn't make a difference.

As pwm_apply_might_sleep() is used now defining the whole state of the
PWM, the call to pwm_apply_args() in .probe() can be dropped now, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

changes since (implicit) v1, available at
https://lore.kernel.org/linux-input/20250623112742.1372312-2-u.kleine-koenig@baylibre.com

 - keep enabling the PWM only after the regulator is also enabled
 - add a comment describing the reason for that, making it possible that
   someone with access to the device and/or documenation easily notices
   this cleanup (if it's possible)
 - rename max8997_haptic_set_duty_cycle() ->
   max8997_haptic_set_internal_duty_cycle() and make it return void.
 - trivially rebase to a newer next tag
 - drop pwm_apply_args()

The driving motivation is to get rid of pwm_config(). This driver is one
of the remaining two users of this function.

 drivers/input/misc/max8997_haptic.c | 98 +++++++++++++++--------------
 1 file changed, 50 insertions(+), 48 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index f97f341ee0bb..033225cae818 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -53,40 +53,35 @@ struct max8997_haptic {
 	unsigned int pattern_signal_period;
 };
 
-static int max8997_haptic_set_duty_cycle(struct max8997_haptic *chip)
+static void max8997_haptic_set_internal_duty_cycle(struct max8997_haptic *chip)
 {
-	int ret = 0;
+	u8 duty_index = 0;
 
-	if (chip->mode == MAX8997_EXTERNAL_MODE) {
-		unsigned int duty = chip->pwm_period * chip->level / 100;
-		ret = pwm_config(chip->pwm, duty, chip->pwm_period);
-	} else {
-		u8 duty_index = 0;
+	if (chip->mode == MAX8997_EXTERNAL_MODE)
+		return;
 
-		duty_index = DIV_ROUND_UP(chip->level * 64, 100);
+	duty_index = DIV_ROUND_UP(chip->level * 64, 100);
 
-		switch (chip->internal_mode_pattern) {
-		case 0:
-			max8997_write_reg(chip->client,
-				MAX8997_HAPTIC_REG_SIGPWMDC1, duty_index);
-			break;
-		case 1:
-			max8997_write_reg(chip->client,
-				MAX8997_HAPTIC_REG_SIGPWMDC2, duty_index);
-			break;
-		case 2:
-			max8997_write_reg(chip->client,
-				MAX8997_HAPTIC_REG_SIGPWMDC3, duty_index);
-			break;
-		case 3:
-			max8997_write_reg(chip->client,
-				MAX8997_HAPTIC_REG_SIGPWMDC4, duty_index);
-			break;
-		default:
-			break;
-		}
+	switch (chip->internal_mode_pattern) {
+	case 0:
+		max8997_write_reg(chip->client,
+			MAX8997_HAPTIC_REG_SIGPWMDC1, duty_index);
+		break;
+	case 1:
+		max8997_write_reg(chip->client,
+			MAX8997_HAPTIC_REG_SIGPWMDC2, duty_index);
+		break;
+	case 2:
+		max8997_write_reg(chip->client,
+			MAX8997_HAPTIC_REG_SIGPWMDC3, duty_index);
+		break;
+	case 3:
+		max8997_write_reg(chip->client,
+			MAX8997_HAPTIC_REG_SIGPWMDC4, duty_index);
+		break;
+	default:
+		break;
 	}
-	return ret;
 }
 
 static void max8997_haptic_configure(struct max8997_haptic *chip)
@@ -155,11 +150,7 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
 
 	guard(mutex)(&chip->mutex);
 
-	error = max8997_haptic_set_duty_cycle(chip);
-	if (error) {
-		dev_err(chip->dev, "set_pwm_cycle failed, error: %d\n", error);
-		return;
-	}
+	max8997_haptic_set_internal_duty_cycle(chip);
 
 	if (!chip->enabled) {
 		error = regulator_enable(chip->regulator);
@@ -168,16 +159,32 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
 			return;
 		}
 		max8997_haptic_configure(chip);
-		if (chip->mode == MAX8997_EXTERNAL_MODE) {
-			error = pwm_enable(chip->pwm);
-			if (error) {
-				dev_err(chip->dev, "Failed to enable PWM\n");
-				regulator_disable(chip->regulator);
-				return;
-			}
-		}
-		chip->enabled = true;
 	}
+
+	/*
+	 * It would be more straight forward to configure the external PWM
+	 * earlier i.e. when the internal duty_cycle is setup in internal mode.
+	 * But historically this is done only after the regulator was enabled
+	 * and max8997_haptic_configure() set the enable bit in
+	 * MAX8997_HAPTIC_REG_CONF2. So better keep it this way.
+	 */
+	if (chip->mode == MAX8997_EXTERNAL_MODE) {
+		struct pwm_state state;
+
+		pwm_init_state(chip->pwm, &state);
+		state.period = chip->pwm_period;
+		state.duty_cycle = chip->pwm_period * chip->level / 100;
+		state.enabled = true;
+
+		error = pwm_apply_might_sleep(chip->pwm, &state);
+		if (error) {
+			dev_err(chip->dev, "Failed to enable PWM\n");
+			regulator_disable(chip->regulator);
+			return;
+		}
+	}
+
+	chip->enabled = true;
 }
 
 static void max8997_haptic_disable(struct max8997_haptic *chip)
@@ -282,11 +289,6 @@ static int max8997_haptic_probe(struct platform_device *pdev)
 			goto err_free_mem;
 		}
 
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(chip->pwm);
 		break;
 
 	default:

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0


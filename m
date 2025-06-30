Return-Path: <linux-input+bounces-13198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F20AEDA04
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F6A07A2BCA
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A0C244688;
	Mon, 30 Jun 2025 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1P0BXyGk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA366246BB0
	for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279943; cv=none; b=GW9WBdBmwbJhKrT8CyoBB6Y6JKr2WW4U8r4+KSd29/u4B62Trc0b2HCJuTMOblTGWO5JDTq0fjKPrc6iU95L0QYqtn1fTtLoIfiTAW7ePbJ11wHFZ6W0+6nhQL1pRcTZ24Cvr/LO1qfTmHwGWWmgkdu5SDzwIgvPa1GlYp7Pjwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279943; c=relaxed/simple;
	bh=k+KdiBc/mn9/dxOM7/q9Js58Njn0x+1gGICxsNrcqqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nPR5X6RUVy5Zp7tjgVk10afD2D2YsqjVUN70iA/k9Slq+Mr0hUkDK5qI8twJdjYnSfS47HcQA+GLJqqviNfj7g+N6o8WKeofCwZQS3QXntTpbSfHjqa/wGgGcBI1j3b1wkNUSM5IbV6KgwJ9hRiUgFNDY0hfOF901aca6xP+jrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1P0BXyGk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453643020bdso37648755e9.1
        for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751279938; x=1751884738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKPFv0V+pZESiVXTlV4K0nr8wRpUOdISl/cJt2AvE7Q=;
        b=1P0BXyGk9pvxXdPXD/cgN6WGvwPgb1y9/rLoh/CSwa07yf32lif4LelGJG0F/zLsh9
         p3jOwoG9dBq/Tfu7sEpIhK2sUF/Whpuy13SaJHTxF/r7dVT7Q8cMZvo0ABBqqdcJs57Q
         zBGqDbjMZSD9S+/URKnaeecuSTTevVKXiFkBXg8030+TrdkncLubm385pEuRk1A++s/s
         4/0mOkdfDLXrr3ZhH6jnEVBByd/0g1Dm62pG4x7SWeejN7dv3W+r8dYHhYooyFwuFIsI
         D9IMjao1YomcwGFA3gaDX3bXUBp/8rEqpxReDB0SFt9ArMb8FhjFZqTdTL8c5/PZ8bAZ
         cx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279938; x=1751884738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKPFv0V+pZESiVXTlV4K0nr8wRpUOdISl/cJt2AvE7Q=;
        b=REkXY6LWsG+APfc2u12iNQhepPf4ylpA0DsJV2rTEqK9v0WT7plCu++MShOjXMx1YY
         wXBLSrYA03ubBa42q+ubm8kBa9u0nYiidEpzdZaFg+CGYvq96zexxugRkS+DlkbmRtrC
         YTW77HFbB/sf+Z7/P0DU28fjCIhhhs//3nhOb5lk3kkiaFh2LbROQapb9ZC7yebo3ika
         VImnLxTQbn3G7dSSh1GBbi5ujn/sQxc+f0lKgvw2cBeHWuZ4xNpR51laXlayp55qnqQ2
         khEVTUCt44sYvq7P1+5h6w3dj/pPXPZBwRNs/dN3DTxdfurpJZZD3s8lb7OS+GqqnI4N
         cssQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTxsWAQjrlcCGcbCiSvYqELpZY+aO/PPMsautyf91LGspKMMaDoWuCix6Fhn0d+HnI7XDEr4n4XiDKzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM7jCr/fMpk2/NVngGcv4QUnP/sGlA0sDgga0lCXI4i/f8tq/q
	IuJOU9bni8H7ifeLeXsshVL0IoIURkbmUR5HTdC6ymnxX0g+ne4QbtQKvIXDfulemb4=
X-Gm-Gg: ASbGnctwPGJVATUH+S6Y/b33ITEw6beQjKuMc6Iz8A+vDmHkNayz0dkUowK4gLTEDHI
	AgMj3FWvc99z8to0lmTnM2ZdyUCXbf+oCgtHfXg6iA5P0SSbCoYD+QpQJCnMfxSJieaadhtAATb
	JbFIJusDI4HxecNoaV13gGFd2pAJsAVnKVOsBvQYoM7JWwaCk7IkennUAZbW/qt+rbwuHXTX3Yz
	YiIOAXaz8QZ4shN98whvtQIvL+fz2IYu86fDDb4euu82PdcTffgl31nHMbyDUVisEWy58v3LEVo
	9Og+fIoB/uCxynDPjvSq2ZzvXvtdwq24wGr4eyP8ZYZBYjM/WmK7Iq1ZAjvJre+b+AneRFnZEEs
	Bkoa9GVa242MwqgYCArSK6jy6VV4k
X-Google-Smtp-Source: AGHT+IGQBOAh6OVZ+HZ1cI2mDIcxZrj9eqOdGnasJJmCHYG7j8eYyesoWgNtmAzeQUKiNeAqEUmQzQ==
X-Received: by 2002:a05:600c:530d:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-4538ef33a85mr110955955e9.1.1751279938109;
        Mon, 30 Jun 2025 03:38:58 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad247sm166168555e9.26.2025.06.30.03.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:38:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH] Input: max77693 - Convert to atomic pwm operation
Date: Mon, 30 Jun 2025 12:38:50 +0200
Message-ID: <20250630103851.2069952-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3333; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=k+KdiBc/mn9/dxOM7/q9Js58Njn0x+1gGICxsNrcqqE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoYmk7wPWiAi8LAdOScIKTkakQztMgFPRswZ5mv aVSRMnlKqKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGJpOwAKCRCPgPtYfRL+ TgzDB/0Q1JenZXtZn1GQW0a9EQa1N/RXm0uzgSm2WwyvZcJZz9fsZKJ5kzw/Kg88EOC/GL/2FtW WaeqaKTlX0kE+S7+iuohPXSMztxveWxSNsQWLsykgzQNnDHlTDK80ZcgH2nUk+cZ3ZE9IkRqmaS JAnewZ8b+Hbkpw5lIZj2nORB7/Mp1gGtU7whdnMuCd704O/5kyM63odGBPFR1rfMM4B6W1sR4Lj 5l5273eE8SlecOmVZSdjbHIOdim7eivsQqqDDTM2DYpmdnfbfj/w7KsRopstaG+SpleFRijWv5z n2IsDWzczxkqj7SQWFw2naMOlwE/MFjRudx0VwaHHEA+z1Fg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver called pwm_config() and pwm_enable() separately. Today both
are wrappers for pwm_apply_might_sleep() and it's more effective to call
this function directly and only once. Also don't configure the
duty_cycle and period if the next operation is to disable the PWM so
configure the PWM in max77693_haptic_enable().

With the direct use of pwm_apply_might_sleep() the need to call
pwm_apply_args() in .probe() is now gone, too, so drop this one.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

the motivation for this patch is getting rid of pwm_config(),
pwm_enable() and pwm_apply_args(). I plan to remove these once all
callers are fixed to use pwm_apply_might_sleep().

Best regards
Uwe

 drivers/input/misc/max77693-haptic.c | 41 ++++++----------------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index 1dfd7b95a4ce..ecb3e8d541c3 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -66,23 +66,6 @@ struct max77693_haptic {
 	struct work_struct work;
 };
 
-static int max77693_haptic_set_duty_cycle(struct max77693_haptic *haptic)
-{
-	struct pwm_args pargs;
-	int delta;
-	int error;
-
-	pwm_get_args(haptic->pwm_dev, &pargs);
-	delta = (pargs.period + haptic->pwm_duty) / 2;
-	error = pwm_config(haptic->pwm_dev, delta, pargs.period);
-	if (error) {
-		dev_err(haptic->dev, "failed to configure pwm: %d\n", error);
-		return error;
-	}
-
-	return 0;
-}
-
 static int max77843_haptic_bias(struct max77693_haptic *haptic, bool on)
 {
 	int error;
@@ -167,17 +150,22 @@ static int max77693_haptic_lowsys(struct max77693_haptic *haptic, bool enable)
 static void max77693_haptic_enable(struct max77693_haptic *haptic)
 {
 	int error;
+	struct pwm_state state;
 
-	if (haptic->enabled)
-		return;
+	pwm_init_state(haptic->pwm_dev, &state);
+	state.duty_cycle = (state.period + haptic->pwm_duty) / 2;
+	state.enabled = true;
 
-	error = pwm_enable(haptic->pwm_dev);
+	error = pwm_apply_might_sleep(haptic->pwm_dev, &state);
 	if (error) {
 		dev_err(haptic->dev,
 			"failed to enable haptic pwm device: %d\n", error);
 		return;
 	}
 
+	if (haptic->enabled)
+		return;
+
 	error = max77693_haptic_lowsys(haptic, true);
 	if (error)
 		goto err_enable_lowsys;
@@ -224,13 +212,6 @@ static void max77693_haptic_play_work(struct work_struct *work)
 {
 	struct max77693_haptic *haptic =
 			container_of(work, struct max77693_haptic, work);
-	int error;
-
-	error = max77693_haptic_set_duty_cycle(haptic);
-	if (error) {
-		dev_err(haptic->dev, "failed to set duty cycle: %d\n", error);
-		return;
-	}
 
 	if (haptic->magnitude)
 		max77693_haptic_enable(haptic);
@@ -340,12 +321,6 @@ static int max77693_haptic_probe(struct platform_device *pdev)
 		return PTR_ERR(haptic->pwm_dev);
 	}
 
-	/*
-	 * FIXME: pwm_apply_args() should be removed when switching to the
-	 * atomic PWM API.
-	 */
-	pwm_apply_args(haptic->pwm_dev);
-
 	haptic->motor_reg = devm_regulator_get(&pdev->dev, "haptic");
 	if (IS_ERR(haptic->motor_reg)) {
 		dev_err(&pdev->dev, "failed to get regulator\n");

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0



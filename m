Return-Path: <linux-input+bounces-12996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D02AE3D8F
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 13:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C166163EF5
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 11:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5FB72610;
	Mon, 23 Jun 2025 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lp+adA/n"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F29C17996
	for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676434; cv=none; b=J3IiNfshsxJUYxz7ey+xnYveICq9xEr6VMcXK/EArXw03FQq1ArYglpwZY05JsEARdgSjQSmUDWbLZqeh9Eqhz/fg4ifvgcRiAO6UmkboOURnDP+YdRRR5W2WUO0kBDX3HGWwYJhymeI3UHt7pweP4WurQY5tU98O6RsAQ1xg1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676434; c=relaxed/simple;
	bh=aaGRnRR8GM5wk4+Ar7u4xV1AHwtWaMXNajYu9tGWxiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MR4d13QLqjx6yUc+N7QXKotCmUyM1zZtG/pDVSkXH8Mk23iRKyxXGu2P4Ntj2aFfpnS/DQiK+h1F3IeZZC64fwdi9TnKeOxkInf3o2Bm68hOevGk5Yv+Dq3/RUREy4jVXE1q9+irLYoCBinngBu2ExBD9x6QgRA3DCoHJvJxE78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lp+adA/n; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a510432236so2987101f8f.0
        for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750676429; x=1751281229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBBpsrkz1sDnByh0D3X5akQWa02YWR3mBenqvW81gOk=;
        b=lp+adA/nj06Z5pILhLQCyIN25J42P5azrg8WqWVjzzgmNOjeBVRQ4yuvMKnhgnEg8s
         tfnikfbj+X3AiiovL67Dn2i2uYLwirig9OBd4LjQWOKTCs0Xief5n/tuSqTn1Q+sgX4d
         Bp0Vc3d19dh1inp2PvjGQgsGZRmbFPxmjx6kFAdrcIOEaeCdWKVkWAByABcptuK4GADQ
         dhneTNuTD7dmlDVvr7uKqwwx4SZ2DLm7ExyGc5D3uqOpSZprdfiJQJjZFbekH4naf4NH
         HZgeZZqLDL5S10w+ccxHcX1ee23S4o8qvETl2dmPfL0YGbQ5XddUwTzL6LUZ+ehI2cJZ
         nHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676429; x=1751281229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBBpsrkz1sDnByh0D3X5akQWa02YWR3mBenqvW81gOk=;
        b=ZXs9Eq7wD8qyS6/C9O//cF+IFHQUoFLcOBq551fGuCBdyxGed8qikk0JTiKZ2UYJaf
         c7pYPYbo7CY/q/fTZG+ZY9dzIdZLN4L9+zvfU5r1TqTXi0rU/2EAj0WmRngA5P37+Qvi
         ak2/kMxQqGzVybc70UY95ozZ6ezSEx27/+QbXRGijbQVXXj/R0sBN9OZOtb7B2ST2Mwz
         a+CXI2QqO5ZVhHthDQ8ErFSx01pd/8rVnU3ztXuYXR/h3xspCpTLVjt72GF8EqM54p1K
         lgysh+gpqNO6UxsxgKvJo7zxHB+Qq2fP2WD+0rx3fh5lCr1MGVMjSG1Xat2w+uYSdFMk
         4njA==
X-Forwarded-Encrypted: i=1; AJvYcCV0fp+FZx33YblwRTARTaDcuzsJHMrYnc79dOyq2D4F781jeBR02idHSFoJjIvoufkPBPP/CHRK0fHRSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxurKEyGIY3z3Uq+EwUZe6zolV+hgDwlxilaymneo1P6beGCfAO
	pdCBaNAK7An+OaWmw3oPfCXncv3D1bs1nBzIx7YEHanFOObJAuG3KLeFZGI15zpsZjeOImKfNzs
	kcxne
X-Gm-Gg: ASbGncv+A4i6cKEJ84zuNT627pjlqeb+s4EZb3+jZRkccp5LPC48uMCiJuhsAaLfNnM
	nl0vpjBNaShcyLTkr7fWXwJZXjCSKykRaA84dEEik7Uk7z3MclhP4xjkKOM+WEGZJEyBYfYea6V
	8wQCqjZaeBDnx+tMDqdopEPYu0VTPdA0GiFx2vB7v08F2lU35UDZVCCmdaBKcIjMwpSYdL+Cf8T
	iIia4X1ZEZ3qqaUvaqKfJZJkaSRYmPUe0KoCDejJYT8TH82f5ruC+MV/I4MNwlfs9pzgJlu0J5z
	Tihinbal3ihhQR6g+4HzkViQ3xGrEMsg8yK6kMGSzKALmexcpcRVdgN9bO7g2/WwexvblqOXfu8
	+Mg2Roioh/xxfbc0h72J+9C8SLagVdscb4cyp5/s=
X-Google-Smtp-Source: AGHT+IFwryfWlrouXkIZkm/vYA1KpCqEDTcyzcqCCZbXpHXfsdWUV4wlum3b45n6NmbUDlKYdLts7g==
X-Received: by 2002:a05:6000:2282:b0:3a4:d79a:35a6 with SMTP id ffacd0b85a97d-3a6d12e34b9mr10869309f8f.14.1750676428864;
        Mon, 23 Jun 2025 04:00:28 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e97b501sm138929405e9.2.2025.06.23.04.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:00:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: max77693 - Simplify suspend/resume handling
Date: Mon, 23 Jun 2025 13:00:16 +0200
Message-ID: <20250623110016.1370622-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=aaGRnRR8GM5wk4+Ar7u4xV1AHwtWaMXNajYu9tGWxiE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWTPBrde6f2bQaMwlJOM48l9bWvci40Hh6bOHU ZP4L2plYMWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFkzwQAKCRCPgPtYfRL+ Tnl9B/9+WB8cs/OEndLmcHj62nC5AjM0NJgXwTauPO9KxbLdFXZebxGPbwQz2cr61hjvqGXBMrU VVw/hPXE5ZvVHzOErVX88UdkXBVCC0L6e1+zCn8dRzcqSYtSoD3gY9mzL45PkaBhLmVFcK5EFNr gkUOweVzUlYAOltYQSpxuBx6c2nL7oJ8BC73iuBBVkdloIqK+xId4XlFY6NgEF0MBxfgjuA6yYq PRUIdpvLcApCyDS3iCZxPelS2fPwjMWOKwYY+cNlsfNZ0vHbmPEsZBslz82peXjEDXTEhb2ZBUX IF8q1zMtZYdLQtLSZsrP9vlQKle0M5LEt0eSk5aVyItwrxZc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

max77693_haptic_disable() is a noop if !haptic->enabled, so it can be
called unconditionally in max77693_haptic_suspend().

haptic->suspend_state can only be true in max77693_haptic_resume() if
haptic->enabled is also true. In this case max77693_haptic_enable() is
a noop and the call can be dropped.

After these simplifications haptic->suspend_state is essentially a
write-only variable and so can be dropped, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

found that simplification while trying to understand the driver enough
to improve the PWM handling. Not sure that the result is what is
intended, but if you think the new behaviour is bogus then so is the
status quo, just better hidden.

Best regards
Uwe

 drivers/input/misc/max77693-haptic.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index 1dfd7b95a4ce..abbc47a0d73c 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -57,7 +57,6 @@ struct max77693_haptic {
 	struct regulator *motor_reg;
 
 	bool enabled;
-	bool suspend_state;
 	unsigned int magnitude;
 	unsigned int pwm_duty;
 	enum max77693_haptic_motor_type type;
@@ -313,7 +312,6 @@ static int max77693_haptic_probe(struct platform_device *pdev)
 	haptic->dev = &pdev->dev;
 	haptic->type = MAX77693_HAPTIC_LRA;
 	haptic->mode = MAX77693_HAPTIC_EXTERNAL_MODE;
-	haptic->suspend_state = false;
 
 	/* Variant-specific init */
 	haptic->dev_type = max77693->type;
@@ -390,23 +388,7 @@ static int max77693_haptic_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct max77693_haptic *haptic = platform_get_drvdata(pdev);
 
-	if (haptic->enabled) {
-		max77693_haptic_disable(haptic);
-		haptic->suspend_state = true;
-	}
-
-	return 0;
-}
-
-static int max77693_haptic_resume(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct max77693_haptic *haptic = platform_get_drvdata(pdev);
-
-	if (haptic->suspend_state) {
-		max77693_haptic_enable(haptic);
-		haptic->suspend_state = false;
-	}
+	max77693_haptic_disable(haptic);
 
 	return 0;
 }

base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
-- 
2.49.0



Return-Path: <linux-input+bounces-12875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB1AD83F0
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 09:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACFCE189A165
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 07:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A89A290BA5;
	Fri, 13 Jun 2025 07:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhCA2aE/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74E2900B2
	for <linux-input@vger.kernel.org>; Fri, 13 Jun 2025 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749799021; cv=none; b=tITr1AporuwdohqCBL9YR98rDQOnG3b2O9YPqNcD9BiEz9iuP/LJSnZf62IzUE7sfYtxZtOgGZdVGr4SLD2j9+twL9Mfyl6D2GmSDL/yrf02r0K2Lc0uzLFAZ2Yv5Pk4LEM3u7uhlSQKnJj2ZOYWBnriXxiSt+h7e880tza3i88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749799021; c=relaxed/simple;
	bh=s7H8hAOu8r6PsF0xyvqZ3QYYYUvxVZaHwOSbxv1Gj8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qHw+66j2s1ccMr/Uenk2q/MFz/cA0SwrkxTlpH5xDlBOOWXk8tBhc5mbPO9L0G3RX5bhIwPeKgOH8ZgYX/ThCjurP19faWg7p1sjVDK5ZO2uuwan4r7hB2SjyEq/Rth4sRJLSR7FuNi7uEYqVx2VEu+/XbqjWKiD8CJCEy+7uvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhCA2aE/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a528e301b0so153862f8f.1
        for <linux-input@vger.kernel.org>; Fri, 13 Jun 2025 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749799018; x=1750403818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmM3uzbZnyWX7ZTyVsPhybFQT3KPyRdO9ddniD4WDrg=;
        b=dhCA2aE/1Bns4NAqje1kAy9UQcDDMl3NqX4q/WKh6Q4VjPTb497ofSdgRdrho5EKnU
         gTtSskcNUHbt62U8kUwrHh0c9wk0z9cMIoUqWi9mrmo7YNjLdNyjWBaeq+VgMaKNSQ75
         98mqFeLnDjXWtNoszaJq29yrOj9yQ86H9krklTjJT0gf/RBXzKSFSphBan+uWOYGdtBz
         SLN43AfC9jsYQ5pOw0Mlgd3Ewko4uZ3b8/FCsRjW6sPb5kD6BFX1sk8F4OY153v6eOUa
         tRwIR9AUaPJ8lyaT6xC3Mo32QYNsLIQetTnlPp6OQLVqYidU1s8wgdfvK7AVd85ggyNR
         szeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749799018; x=1750403818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmM3uzbZnyWX7ZTyVsPhybFQT3KPyRdO9ddniD4WDrg=;
        b=e19p+mZTxgLKTbuHEV8cLMeRk89qgqpvERpuh+NEay/QGYnpXrP7EFNPWIqKLOabZl
         wZxsI+JohIO7RSCo8TyG0Ikl+a5UHZcGlfDFqCBAAUodOjiiQQg1Zu9ZsAUviFjTsw3y
         u7/z/Z252MYsp/hIm3AWbySpEE+2umjlAfvtkdLBcPzbcg55m00Ktf3CGoE39Y+LHUFt
         OTefIChlFcLcpUOJpTgmf2SJHhVk/E0zoKw6CMPLoO7Uk1whJ7RTwVcKWc+20iMNjiN5
         LvabATEoo9xUXVDWeSMFErdqsEesnscI/NCewwb0Z1qYSgsETt47slwRF8c+RX4VWeFo
         NbQw==
X-Forwarded-Encrypted: i=1; AJvYcCUEdq9m9HUaZbf0efZJrZv66GD4voRBTjggxtzel57rzZa9tPgS8u0qkf4wMVga+I0L44gGDCBbyXNdKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysKUmeN6bzCV/c1uJF5tX3yyrnDMe7ISExw+aXxeHYdH+otkDm
	HxPms6wHNpAVGZvdeHSB7lJddcurwk0jm9gwJ/s/W3GRuwa6ZNiMWkjuJHRP3zBy8T8=
X-Gm-Gg: ASbGncvH+MlUazNJ7+19RxsfmK/rdARm9pR2PQMQxxsWtLvjGzP9OFY+4jN2uj6wVEd
	ZcQ34UmOr5aIjExGkAp1dbjdqXlHXDUuVSFoX9R4u/8dTD7dB0aTRy2kF2jS78+eXyqD/a6Ki9Y
	QgA25nVrHwLp6xGTgCFYc+xOVOH4xotvJ3Kffrgee4+teBXEc5ceXbzXEJpym3a5kxLJwurW/Pb
	H2P4SpthQV1k720YuBoT17ch+GSIaQExx/U5SiX27NsqNt6AuytbPHmDCzkmYNBjajwoFxDgZCr
	yGBue8W/3SlhV2lSVjvBHZXKdHt436oZFtqigvdbxJlXZPmGfzpT85Cn3kg1mP1kO3QyVFHl+A=
	=
X-Google-Smtp-Source: AGHT+IEolEb7tfFX0Bt2Sg7VF+35gzR6nKVWcO4jX4ONIvd6pX3z/jY8SqI9dzduB6tESwjhI8nX3w==
X-Received: by 2002:a05:6000:401f:b0:3a3:7be3:d0f3 with SMTP id ffacd0b85a97d-3a56874a312mr648054f8f.14.1749799017861;
        Fri, 13 Jun 2025 00:16:57 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a72cd3sm1479822f8f.32.2025.06.13.00.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sangwon Jee <jeesw@melfas.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Input: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:16:54 +0200
Message-ID: <20250613071653.46809-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=s7H8hAOu8r6PsF0xyvqZ3QYYYUvxVZaHwOSbxv1Gj8Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9BldlK1h6nRICmW5g3qvf7r8ym+wnDpkfXeU
 DxMLIRUhMuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQZQAKCRDBN2bmhouD
 17BFEACbck70vrGqWZcrG0AXxn9j9xycYF2Hd/YtQ0ckdRj/G65KoOMz9eEuVojxIuZpJg9rkun
 F5lVaneeh34cJ0EEMPHk4w4t7pJ3i82l9rRByG6NOHPk6zYa8zMzo5b5UL7RwM+UREIIrTMU9s5
 7HJMdLfJlVVvGCIVDewunl9XNq6rYTiSun6u07eeyiatuHi6pCPDDkrGa5Q+JkVdakewfss8Itl
 VY7I+pEp9bF9Fysx5i14nTZqeM2rSRAyCIUC0MF9BeHxoZTd+42Gq9xCTLVleugvD8GpyK1ckSV
 jiu3a2yS7nq0/cHly18Pu5ii1jw2WuMyfqGMg1vLnFFVdSZ49zNnUkW2Zj7678gg9WohARn43C8
 VqS2bchHSzvYFDZSkUyzsEi/rUzgEe8C/FRfYtOUn2Xjg/QuPiQrWgU7MqaLB6SV+I+tTbGkxaE
 Qx38u3c05SJXQiLEUcvCOMnyx3NdOnwwZF9+2XOaA2RGhHPThoq7PsFJ8LpZ8P41yN7j7YvUYed
 tJP8mCZSD74SOV+1bMzzFhLPS5/+ajC+Va8igThqg8orZAn7Cf/55XxzoI13B9/JnWz9tZF1/To
 iwdm5wcDGVceIL44FeRitBUulnggd+JenE0/qpniIX2nH3ePMJ/FQXMeQJwtbhrHrmh9ToQPcWo 1W/0EE9IvQs50jw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/misc/gpio-beeper.c        | 2 +-
 drivers/input/touchscreen/melfas_mip4.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/gpio-beeper.c b/drivers/input/misc/gpio-beeper.c
index d2d2954e2f79..3d65cb4f4ef3 100644
--- a/drivers/input/misc/gpio-beeper.c
+++ b/drivers/input/misc/gpio-beeper.c
@@ -94,7 +94,7 @@ static int gpio_beeper_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id gpio_beeper_of_match[] = {
-	{ .compatible = BEEPER_MODNAME, },
+	{ .compatible = "gpio-beeper", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_beeper_of_match);
diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index a6946e3d8376..869884219908 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1554,7 +1554,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(mip4_pm_ops, mip4_suspend, mip4_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id mip4_of_match[] = {
-	{ .compatible = "melfas,"MIP4_DEVICE_NAME, },
+	{ .compatible = "melfas,mip4_ts", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mip4_of_match);
-- 
2.45.2



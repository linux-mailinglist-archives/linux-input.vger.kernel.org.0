Return-Path: <linux-input+bounces-5847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2192695E210
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2EEB1F213D4
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B4F13C673;
	Sun, 25 Aug 2024 05:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky5NFyOy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320CA4778C;
	Sun, 25 Aug 2024 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563023; cv=none; b=LbaxOekw3ZOfi62Ncam0vVTzbGK5tghdM+WNEOvtVvHGczdGnS4nueSI1a+kGzKpwD5+LrwZE97iE+EpuD0T4kzRFbRX+TjQZHFte2e4yqonmFyUtKSApIRm3cbNXC25UyuXVhjHX04r4SMoQdEooCgEuXhQ9qP9h41B++bSWuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563023; c=relaxed/simple;
	bh=yY4ZVaSxsIM1IRldiqRRPie18QZDpDnG/Gx5Op+I8sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+cLKGtSOAwjud0R9P9bbl0OmrjnwTwo7D6EuwgjTuRbimJD5YUe30bwCGbfZdjgmD3iEIMr1n0kXjsqLiIGnN4amiIZV/ttT9crBoPnrj+3LeEtDgb8fLtdBKAUf25AZARnfkSgVzOAr4N3s97QP3JnWeimT/raK+CKFZDu+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky5NFyOy; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5daa93677e1so2541516eaf.3;
        Sat, 24 Aug 2024 22:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563021; x=1725167821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iL+2InRXO647WU3Yi34+ctBbVoiJtTYGlGR4qSXeVCA=;
        b=Ky5NFyOyT5Rs3ZCCPReCy0Q8a1H9MoPC/0KwgZS8O3dXX8/8pErvDUPXot/UbeWgWa
         Ezh+NsWryoKoPvSp3twIQqs7Ul2M6DOJpFZM9UrR1d0pw5gOPowtp9Ga9J2STMwhwaxU
         vWPMsk2W1SShX+UWmzIXtDLPrUsoTseOtu6LOLWGh+2MWaaEuKdWczlT5eryfX05/Amy
         6jCfA2M+hwubmMkJyXeTSwnam26T8EDdVjxachlwWrh1Knk4XRMeTf8l6rvn8y3agPLa
         qsjOO0qbwTAWW3E98EXPRPHQJIuI24WcCW4J1NroS94DWAA3yHtcg7Yo8S+t6RE3LlQk
         R2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563021; x=1725167821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iL+2InRXO647WU3Yi34+ctBbVoiJtTYGlGR4qSXeVCA=;
        b=glzyEvkTDMDeoFoLvBff4ZZrE8eWwZBziAT1nPmFEUCAm5Bu59gHVpHoq0kLUZ4qyf
         LyZcfLfx85k/ngcCb8bkKRPWRQa74vbrMrriLtTdcwWFycAoNLkvCqI+Lv1VpDK7H0o9
         54NCHBM/qgp5YTJd8oPZSDXEmuuW44tQ1DWd3drBy/qTCKRoJ8hJCCmjusIseQJ5mO82
         df1iFmPuaYphT0q9bswyoZDawYNgyc092gM5fbq3MzoqvWdOmy+UXIiHEyeujbmy43w1
         6TymS6z3XcLdKMRYfwailgcpTJTL794PDKeoPmC9iQ9l1bQYXz2E+Wyyb8LO9Wcv8LHP
         YzoA==
X-Forwarded-Encrypted: i=1; AJvYcCVcqd6ID+rj6KhBMrc/+k/qc6RH105t1ocpN1sLIsVapF7tE4tC4B84uICtDSMA363GbP5UYor+CZOp/9A=@vger.kernel.org, AJvYcCXcyHhRfKF+LZyqiXIEUA5r1kTPBm/MSTcpoasRKBYw3jVz0Kfvu/f8ZrFuMNctaXrf3Lw4YL6zXl5RR64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPiRmvAxPoL/fG55etWJbhBmogLoE2jQYMldWorREIHX51OeZ
	3m2PZxNOD2GFVBqY/XkKeCIuFMadzDwsQR3HAhAGC86uEAXu/vRzbOKZBw==
X-Google-Smtp-Source: AGHT+IHIrpT9TrF1Y6WIh6M0wyTrLhvKWZg8Ae6gbV2uHoKlDK9dxT5dBqBF7dMmWUdbcIyQW1ik1w==
X-Received: by 2002:a05:6808:199a:b0:3d9:3f51:f351 with SMTP id 5614622812f47-3de2a853444mr7501714b6e.11.1724563020952;
        Sat, 24 Aug 2024 22:17:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:17:00 -0700 (PDT)
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
Subject: [PATCH 17/17] Input: tegra-kbc - use guard notation when acquiring mutex and spinlock
Date: Sat, 24 Aug 2024 22:16:21 -0700
Message-ID: <20240825051627.2848495-18-dmitry.torokhov@gmail.com>
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
by ensuring that locks are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/tegra-kbc.c | 45 +++++++++++++-----------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index a1765ed8c825..204ba189807e 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -241,11 +241,10 @@ static void tegra_kbc_set_fifo_interrupt(struct tegra_kbc *kbc, bool enable)
 static void tegra_kbc_keypress_timer(struct timer_list *t)
 {
 	struct tegra_kbc *kbc = from_timer(kbc, t, timer);
-	unsigned long flags;
 	u32 val;
 	unsigned int i;
 
-	spin_lock_irqsave(&kbc->lock, flags);
+	guard(spinlock_irqsave)(&kbc->lock);
 
 	val = (readl(kbc->mmio + KBC_INT_0) >> 4) & 0xf;
 	if (val) {
@@ -270,17 +269,14 @@ static void tegra_kbc_keypress_timer(struct timer_list *t)
 		/* All keys are released so enable the keypress interrupt */
 		tegra_kbc_set_fifo_interrupt(kbc, true);
 	}
-
-	spin_unlock_irqrestore(&kbc->lock, flags);
 }
 
 static irqreturn_t tegra_kbc_isr(int irq, void *args)
 {
 	struct tegra_kbc *kbc = args;
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&kbc->lock, flags);
+	guard(spinlock_irqsave)(&kbc->lock);
 
 	/*
 	 * Quickly bail out & reenable interrupts if the fifo threshold
@@ -301,8 +297,6 @@ static irqreturn_t tegra_kbc_isr(int irq, void *args)
 		kbc->keypress_caused_wake = true;
 	}
 
-	spin_unlock_irqrestore(&kbc->lock, flags);
-
 	return IRQ_HANDLED;
 }
 
@@ -413,14 +407,13 @@ static int tegra_kbc_start(struct tegra_kbc *kbc)
 
 static void tegra_kbc_stop(struct tegra_kbc *kbc)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&kbc->lock, flags);
-	val = readl(kbc->mmio + KBC_CONTROL_0);
-	val &= ~1;
-	writel(val, kbc->mmio + KBC_CONTROL_0);
-	spin_unlock_irqrestore(&kbc->lock, flags);
+	scoped_guard(spinlock_irqsave, &kbc->lock) {
+		val = readl(kbc->mmio + KBC_CONTROL_0);
+		val &= ~1;
+		writel(val, kbc->mmio + KBC_CONTROL_0);
+	}
 
 	disable_irq(kbc->irq);
 	del_timer_sync(&kbc->timer);
@@ -724,7 +717,8 @@ static int tegra_kbc_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_kbc *kbc = platform_get_drvdata(pdev);
 
-	mutex_lock(&kbc->idev->mutex);
+	guard(mutex)(&kbc->idev->mutex);
+
 	if (device_may_wakeup(&pdev->dev)) {
 		disable_irq(kbc->irq);
 		del_timer_sync(&kbc->timer);
@@ -747,11 +741,9 @@ static int tegra_kbc_suspend(struct device *dev)
 		tegra_kbc_set_keypress_interrupt(kbc, true);
 		enable_irq(kbc->irq);
 		enable_irq_wake(kbc->irq);
-	} else {
-		if (input_device_enabled(kbc->idev))
-			tegra_kbc_stop(kbc);
+	} else if (input_device_enabled(kbc->idev)) {
+		tegra_kbc_stop(kbc);
 	}
-	mutex_unlock(&kbc->idev->mutex);
 
 	return 0;
 }
@@ -760,9 +752,10 @@ static int tegra_kbc_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_kbc *kbc = platform_get_drvdata(pdev);
-	int err = 0;
+	int err;
+
+	guard(mutex)(&kbc->idev->mutex);
 
-	mutex_lock(&kbc->idev->mutex);
 	if (device_may_wakeup(&pdev->dev)) {
 		disable_irq_wake(kbc->irq);
 		tegra_kbc_setup_wakekeys(kbc, false);
@@ -787,13 +780,13 @@ static int tegra_kbc_resume(struct device *dev)
 			input_report_key(kbc->idev, kbc->wakeup_key, 0);
 			input_sync(kbc->idev);
 		}
-	} else {
-		if (input_device_enabled(kbc->idev))
-			err = tegra_kbc_start(kbc);
+	} else if (input_device_enabled(kbc->idev)) {
+		err = tegra_kbc_start(kbc);
+		if (err)
+			return err;
 	}
-	mutex_unlock(&kbc->idev->mutex);
 
-	return err;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(tegra_kbc_pm_ops,
-- 
2.46.0.295.g3b9ea8a38a-goog



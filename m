Return-Path: <linux-input+bounces-5836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A968B95E1EF
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5F41B21BB1
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4E977111;
	Sun, 25 Aug 2024 05:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeP0EA/O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9F6EB4C;
	Sun, 25 Aug 2024 05:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563009; cv=none; b=dl0J1vgq8e9R3OslBQTnGwyclNSn6XKl+tfnkWuJlm+9K0PAOn2zVH06oPpDrySWy+QBUaa0diYMTlEggjUZzcEzSRXtb7b5r1t1WK5NxrLnT+iphCEN2x0ZY6rkZ55X+Bl1u5pM2uixfLv83tmwOyvsPtZ2PpzhDkd22/M3El4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563009; c=relaxed/simple;
	bh=wJ0YIbK2Bowe6CEQFFxfyG1unJtNoBYloVGSQaRk9V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fN9l42fb8IAFUwO8nyg7PynEf3KPrYwOxmdy4lz/UNRwIYnhzN6lUYx+jcELzaLtQnkYHvRVu5D1abt2rxkdeTT+w0z9ymQgNN3rJIQc4nwWBbG+USOUAtmlBnd2iYwRfWjOEjgbx39jfACrGYBNpg4AGpi9EajP+63LBV5CT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeP0EA/O; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-39d311d8091so14036845ab.3;
        Sat, 24 Aug 2024 22:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563007; x=1725167807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF5E3W/jIicHOW4h7MeNLzhN752Za5ehXWfMuqIr3TQ=;
        b=jeP0EA/OT4Yd1Dfp0u6zRMV5XY2o3n8cTDfyJAIfpVktwpZJ9UBKYXYGmbGSO7VBYr
         fS39gD4QdtVl+0xx5O3aIszq1qSQfh/vyUdq3iP1O6eewjU8ql+RMPQmDep08x9Xm6KP
         GGWCraztxU7s8mEf+ddwEa6z0RL36LMbfAwDruQolIcP3lBEJPK3RzHFeuR1pTUTSM68
         OyGWWJv+tO9WiEitxBCF6zzU1gbdf+VfRQtmDN9pR7JGSd8adNX84/DgSVfhX+wibW5b
         YjtzePuwdI9AHMxsGOnDm7LYQLSNP6gJRJNbrdz8TlSnh3dox0OIY3IM4b+R6w2J7BAK
         VH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563007; x=1725167807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF5E3W/jIicHOW4h7MeNLzhN752Za5ehXWfMuqIr3TQ=;
        b=lWRAd/eaU5oPT8zDClVFDQrPHr7HTV4DBXBnqRzLLgz4vTCUBuNxwaYJJ0AwPtL+bU
         uDGM7SXEsEEvMVeBWRqKMaDh1vNah0BCAQJhuowpo3R+jZ/SfvaeXHufUwc4u7CeaZJc
         nwISBukUNMvBKOceu3SFC0Y4hLXF2WGqXCY5yDG/OxlsktJQ3cTA5SwkKVudzs/V0lM1
         9axJHXe+LHJfnG9X7jzQhCXQtt4u8yDktXz2Wzez+GuYjw4w4CMkCGqSIHYD9eP7+G27
         VULBFNAbgb4VLnob4y/EzRyhVp2RIX1zTLGCliqKM9gCrB1qFBncZZZt/sv+QyOojEE4
         jyig==
X-Forwarded-Encrypted: i=1; AJvYcCWJsFGDkOYWFVNVUSpxwoXA51B1SbPK/gVDwQCAlUr0/xIgjr++8dEoGREPjOqyMcs3gDhE9Kh9bUPkRLY=@vger.kernel.org, AJvYcCXnV1KgdpEVwVPcnBlk6HMCoWbAtoG5nbIkNFEgkr9Lfw3il9Y8NThueXxbq1/BNyJmj4Ku5qBwBB1k4lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO7Lgdvf2J/qlN3wwgbswxoPdinLjimajaFB5/sTL3SKPs/Osj
	2f6Rx1+EuV5CzLEq0t3gyTt28QJcj8+yGw7u0rn3RpAKc65o485pNUmniQ==
X-Google-Smtp-Source: AGHT+IHXAs6GceADDzLZ7I3Pij++Fm3NQFnIWhk4AJZxUkQIX9t9GW0NO9mJDGotB52VqJS/4yMQyA==
X-Received: by 2002:a05:6e02:5a3:b0:39d:300f:e8ff with SMTP id e9e14a558f8ab-39e3c975b22mr65481975ab.6.1724563006637;
        Sat, 24 Aug 2024 22:16:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:46 -0700 (PDT)
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
Subject: [PATCH 06/17] Input: imx_keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:10 -0700
Message-ID: <20240825051627.2848495-7-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/imx_keypad.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index e15a93619e82..b92268ddfd84 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -521,13 +521,11 @@ static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 	struct input_dev *input_dev = kbd->input_dev;
 	unsigned short reg_val = readw(kbd->mmio_base + KPSR);
 
-	/* imx kbd can wake up system even clock is disabled */
-	mutex_lock(&input_dev->mutex);
-
-	if (input_device_enabled(input_dev))
-		clk_disable_unprepare(kbd->clk);
-
-	mutex_unlock(&input_dev->mutex);
+	scoped_guard(mutex, &input_dev->mutex) {
+		/* imx kbd can wake up system even clock is disabled */
+		if (input_device_enabled(input_dev))
+			clk_disable_unprepare(kbd->clk);
+	}
 
 	if (device_may_wakeup(&pdev->dev)) {
 		if (reg_val & KBD_STAT_KPKD)
@@ -547,23 +545,20 @@ static int __maybe_unused imx_kbd_noirq_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx_keypad *kbd = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = kbd->input_dev;
-	int ret = 0;
+	int error;
 
 	if (device_may_wakeup(&pdev->dev))
 		disable_irq_wake(kbd->irq);
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev)) {
-		ret = clk_prepare_enable(kbd->clk);
-		if (ret)
-			goto err_clk;
+		error = clk_prepare_enable(kbd->clk);
+		if (error)
+			return error;
 	}
 
-err_clk:
-	mutex_unlock(&input_dev->mutex);
-
-	return ret;
+	return 0;
 }
 
 static const struct dev_pm_ops imx_kbd_pm_ops = {
-- 
2.46.0.295.g3b9ea8a38a-goog



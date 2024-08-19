Return-Path: <linux-input+bounces-5637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DE9562C3
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF442281F41
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D3614A0B5;
	Mon, 19 Aug 2024 04:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbAMBLTx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8B12C52E;
	Mon, 19 Aug 2024 04:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043509; cv=none; b=mBdN5vE0OJm68BQ+RY6fU+bcXZsW7A607ROqda0WkdZ4DQJttdLFTlOxXgoenS7AOKdhhcpavdOyF5JHt0MIZ+YxiVMBNbLr0JLTVbmNGmjrvdGH7B+/Pg4FGMJ3ws4UI2fTMkGRktNXPpx+gDZVqAWKyN7/uVs/HuUWQF7AGPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043509; c=relaxed/simple;
	bh=nJ3sgL2CJoUjcmQPCl4x+ltEPA6HADPYCfsYu9lJA5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1YlcGobYS/arfETAcNNcvcmjHh2VSXj6qH/5hh1ApKOlqjjfn/78YVBNTqQ6q/Pl16aYRw+3/8dEvNPXUGmp7Klzk0VG63ftlyfkVFKY9gv0ZaXTUxrtO2KfNo6f/gYKOrW//jviRJbVOEQn7vv+k4Mc3c/BOk1LpxkQTB5Pq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbAMBLTx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2021a99af5eso13212115ad.1;
        Sun, 18 Aug 2024 21:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043507; x=1724648307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjo9bqr1UtOoJLuXizHH4agDHMHJlsbeIYUVnrax5+8=;
        b=XbAMBLTxhaiiKvK4kiNXlV7hEJhosdJN0TkfcxOaykl3NWvI/LYksgx0iV+5lIW2ZK
         /Un3AHwLuSFN1TS7CpS8P5VqBttM58BbjyP8b6qpJWD0z/NLrUgrm07DVesugG5zTzFO
         2CSpxj0UPhdPrj5jfiX+rj6wnOHV6gaFxY44bJUEAyVOeh+hxVgf04YbD5FiD9caiYUi
         9VOQm3t3FqVtWdTLdNowIfwHunBtzQ9AZaI3xzcDutEBSls+T4xIlU8WzM6isM8vCv7k
         8FcsnoFN8Zw2ExeKLUrku8IrpUG6IoWxAQRAPeOcYF+FiMOMSFY505MZahY/zA7GdSy5
         icgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043507; x=1724648307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjo9bqr1UtOoJLuXizHH4agDHMHJlsbeIYUVnrax5+8=;
        b=qwyBMZp1jDn4KBFXBVy1mXKQW4c7PyZ3SLCca8HLbixeFz25ljzYUtaoTPdz8xMf6N
         B4tsfMaJnaZ9DaMdmQy/g2F8614yqkDRmsEYX7MpNZr6nnF+tx96+wsQSjpTPeMUePrn
         G0mdaVejGhnzjbZG6KotiyCmpP00jPR7fI5ks/k5zSLxx/kyuYaeUMLaewA/nv82Hai3
         qkLIM38jv+58RI5pPiGPcYD1G318EErgN4ECoXD2Q9scI/Oc2PteTJm/FleXYj6dFKlF
         G8UbvqZetem7IP5McGV5pJaxmFCymZGpCzgv6xrFFrRm7Kj7kA/I8n+FJU2DbyF3KonE
         pXJA==
X-Forwarded-Encrypted: i=1; AJvYcCU/0V9ZVWwaHKcb+QFTNIVXU8nXSntMFVFnF36bX7lAOyCXvlhepfpgY2+/cjjCS9Ef2URpZTkXAsr4EZV59+LOsTA=@vger.kernel.org, AJvYcCW4ducFXpAHhPuawuHO88Qs9JvGIGx+xtivqDjmoYfQ1SC1SsuHPrblbJGPQQL8wYMrnT8vgXW9anMe@vger.kernel.org, AJvYcCXEWQuBMQowk4Ue+rMX3wRMD8R5miBFAshXZm26oVvM/kVgoh/l8mqGXaqrGYlA2qKDByBNwHR2Sr0LkkJG@vger.kernel.org
X-Gm-Message-State: AOJu0YwZiBMe7PRBWr+Wb/4S0u9HYuYROUoWy1OZqVwIyMxzioTywEGY
	oDY21gfDyxDBQKx18jsi1pLqAJN0kxwGa1reqL5aClCBa2+oO987
X-Google-Smtp-Source: AGHT+IEgWjgzFxk/W9ikkgzvRwbFFaUk2esxhBqzuQvA+hd7no2/ruCI6LWlDXbaFRBGOsR6Bd85AQ==
X-Received: by 2002:a17:902:f60f:b0:201:daee:6fae with SMTP id d9443c01a7336-20203f2c389mr139215625ad.48.1724043506539;
        Sun, 18 Aug 2024 21:58:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 01/14] Input: samsung-keypad - switch to using devm_clk_get_prepared()
Date: Sun, 18 Aug 2024 21:57:58 -0700
Message-ID: <20240819045813.2154642-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using devm_clk_get_prepared() instead of combining
devm_clk_get() with clk_prepare(), which simplifies the code and
ensures that the clock is unprepared at the right time relative to
releasing other managed resources.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index e212eff7687c..a5fac7de8b5d 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -361,18 +361,12 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	if (!keypad->base)
 		return -EBUSY;
 
-	keypad->clk = devm_clk_get(&pdev->dev, "keypad");
+	keypad->clk = devm_clk_get_prepared(&pdev->dev, "keypad");
 	if (IS_ERR(keypad->clk)) {
 		dev_err(&pdev->dev, "failed to get keypad clk\n");
 		return PTR_ERR(keypad->clk);
 	}
 
-	error = clk_prepare(keypad->clk);
-	if (error) {
-		dev_err(&pdev->dev, "keypad clock prepare failed\n");
-		return error;
-	}
-
 	keypad->input_dev = input_dev;
 	keypad->pdev = pdev;
 	keypad->row_shift = row_shift;
@@ -399,7 +393,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 					   keypad->keycodes, input_dev);
 	if (error) {
 		dev_err(&pdev->dev, "failed to build keymap\n");
-		goto err_unprepare_clk;
+		return error;
 	}
 
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
@@ -411,7 +405,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	keypad->irq = platform_get_irq(pdev, 0);
 	if (keypad->irq < 0) {
 		error = keypad->irq;
-		goto err_unprepare_clk;
+		return error;
 	}
 
 	error = devm_request_threaded_irq(&pdev->dev, keypad->irq, NULL,
@@ -419,7 +413,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 					  dev_name(&pdev->dev), keypad);
 	if (error) {
 		dev_err(&pdev->dev, "failed to register keypad interrupt\n");
-		goto err_unprepare_clk;
+		return error;
 	}
 
 	device_init_wakeup(&pdev->dev, pdata->wakeup);
@@ -439,20 +433,12 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 
 err_disable_runtime_pm:
 	pm_runtime_disable(&pdev->dev);
-err_unprepare_clk:
-	clk_unprepare(keypad->clk);
 	return error;
 }
 
 static void samsung_keypad_remove(struct platform_device *pdev)
 {
-	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
-
 	pm_runtime_disable(&pdev->dev);
-
-	input_unregister_device(keypad->input_dev);
-
-	clk_unprepare(keypad->clk);
 }
 
 static int samsung_keypad_runtime_suspend(struct device *dev)
-- 
2.46.0.184.g6999bdac58-goog



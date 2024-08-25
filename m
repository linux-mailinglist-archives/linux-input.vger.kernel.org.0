Return-Path: <linux-input+bounces-5840-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65F95E1FA
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A09928225C
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7598C82C60;
	Sun, 25 Aug 2024 05:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH0JcXXb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1693C466;
	Sun, 25 Aug 2024 05:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563014; cv=none; b=QFuawjSlNoIqxGXSKIwivbMY0DiSjDydLmPNhGJjNYERYHVVbRzaFSPJvcgyr/w+gkuyzhe7m4t2kiFwjS7w/uoujUoCR3TOVgauJg6nmD4iz8+uWEPTMZOt3k8Absu7Wgn7dcU/lVnWpwIK01vUo20BeOKeC6wQSidr1h20hbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563014; c=relaxed/simple;
	bh=wNujzFkWY2QRnJ4eoygNvp/2j66nWvzzi/2rJGjoD6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEnMr2x+d7TqS54bakSD3CS9bIBNVnWMtI8XyJOVSYEdAv8Rapz8/SGcMfOkI1xt+e0V8om61KYltbV4Dpp5EOxkiIdVDiVP0WF9Ek+fMgpJITy+mkwCHfAZR0iYOI2HHHuvaK5CsoN6MP5SKGCEtyzVvbB8gfTGw5d5v1X6vDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH0JcXXb; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7093c94435bso1933207a34.0;
        Sat, 24 Aug 2024 22:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563012; x=1725167812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyPqTHyh07puR7bU3JACy63C0BspLgz3ChuDMwPsOL4=;
        b=cH0JcXXbV2lvKKho+cCq3ozdf157nleRIP0RYiCoOuBT60yNaEE6roBwp1epEnItWl
         baoSotLbXupEcw9V9+Hff4D0Qs+jNC1reyYTHL4ok9cXrA0j/pC2P9j7EmgTUWmeY7cB
         eb5iQNs+5OEiAWlYEgaYdEdlxziIU8MMpz7i6qL1PQgRGHLliikyLDrGzxDRH9RsWDSV
         FwuQxGgE4M51s5BhElxcHAwet6CTQbDrJnIlcdQf7/vS34NpYYNiwgRpRmpUf1r/dDaC
         yeTn0HDBeG8BeUAnMNGF4CnplbR3TmINy317BTKOU7GYsE+VKhBEYlfS1K0gDaT/1yjE
         v3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563012; x=1725167812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyPqTHyh07puR7bU3JACy63C0BspLgz3ChuDMwPsOL4=;
        b=mVAy964Im+CAUrbCcm8wecp8DM0Ncjf6O3mty0gykGD8EGBknPsKrJUyJ2iNzgrbsX
         CzYyvLa4MtRRTUc1iVK754k0noYsiNcP+2RVGgK73UNpkCBfkBh1ABi8zZdUkBkzxtvv
         +IOIq5yqHq0UDF95buPYkvekQxL1+W3AV3pzqjH35a4WcB7SAR64VShdPSt2BECbDObY
         kQlWQ8937oAxGGKDrgiuSlCHt3YHA55buZXhk3Mmmty6fS/YEQtlHIEg+Bb0UIzmH/5Y
         D6eLY6y3sbCx8HzQJ+gOfr+o68j/B0jXwBTyeQuoT5hsoGRYvkM9+8i0tnziG8r4I5rI
         2EfA==
X-Forwarded-Encrypted: i=1; AJvYcCVsABSM6KocGKi4C2dYM+NcYsRMm/4m7lWRfTB8HdKBbY+7UHPzEtWNgz6vIqLH9pdFUIN2f1uqsADwNa8=@vger.kernel.org, AJvYcCWbLgxFp/xreBeAc+tbjxaoDt6IxDZAsAuLN/CuTIxkVqgwbkhbPcJo+aIQk5XaRnAX7FtzDAXXvjV815c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYs4ev8yJ/mqUhu3C6Am5hJy3dYFmysDUNYT1R34rDHwLEbvj
	tECOf5atXLFP7O2inW/zXRMLcwTOYGkmV1JzDcUOPadaUKQP7YP7cE0e+w==
X-Google-Smtp-Source: AGHT+IElTjsj7Q4fdjXuCiV15fwaclHOkI2Ai1DHHC2EwetOtIQNk0UHrxm09mtsUN+F1sUh9V3o8w==
X-Received: by 2002:a05:6830:658c:b0:708:b32f:ade5 with SMTP id 46e09a7af769-70e0ec90cacmr8581080a34.32.1724563011839;
        Sat, 24 Aug 2024 22:16:51 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:51 -0700 (PDT)
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
Subject: [PATCH 10/17] Input: lpc32xx-keys - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:14 -0700
Message-ID: <20240825051627.2848495-11-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/lpc32xx-keys.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
index 423035be86fb..2392e7ec3b19 100644
--- a/drivers/input/keyboard/lpc32xx-keys.c
+++ b/drivers/input/keyboard/lpc32xx-keys.c
@@ -262,7 +262,7 @@ static int lpc32xx_kscan_suspend(struct device *dev)
 	struct lpc32xx_kscan_drv *kscandat = platform_get_drvdata(pdev);
 	struct input_dev *input = kscandat->input;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (input_device_enabled(input)) {
 		/* Clear IRQ and disable clock */
@@ -270,7 +270,6 @@ static int lpc32xx_kscan_suspend(struct device *dev)
 		clk_disable_unprepare(kscandat->clk);
 	}
 
-	mutex_unlock(&input->mutex);
 	return 0;
 }
 
@@ -279,19 +278,20 @@ static int lpc32xx_kscan_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct lpc32xx_kscan_drv *kscandat = platform_get_drvdata(pdev);
 	struct input_dev *input = kscandat->input;
-	int retval = 0;
+	int error;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (input_device_enabled(input)) {
 		/* Enable clock and clear IRQ */
-		retval = clk_prepare_enable(kscandat->clk);
-		if (retval == 0)
-			writel(1, LPC32XX_KS_IRQ(kscandat->kscan_base));
+		error = clk_prepare_enable(kscandat->clk);
+		if (error)
+			return error;
+
+		writel(1, LPC32XX_KS_IRQ(kscandat->kscan_base));
 	}
 
-	mutex_unlock(&input->mutex);
-	return retval;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(lpc32xx_kscan_pm_ops, lpc32xx_kscan_suspend,
-- 
2.46.0.295.g3b9ea8a38a-goog



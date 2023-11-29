Return-Path: <linux-input+bounces-334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515B7FD8A8
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 14:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FADD1C20856
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 13:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABD0210E2;
	Wed, 29 Nov 2023 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAvuDLua"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C7BCE
	for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:51 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bc501081fso959796e87.1
        for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701265909; x=1701870709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMcH7HqNFaUybso4IhgNmtpCYxX1qk/8kEmmSQTbt3I=;
        b=IAvuDLuanRoOFGopz/xY0jtYmSQ7dkBUpmoGd+W3QF6aDvaBJdSt3B6H9YM1FIwJZ5
         ZPorNBxb8WnneM2Fc1czP+rJnpdbc+pQn8nMdQAguefiqiPMOQiE7+YcAjX5ynF6fMB4
         6ZY6K2nKecoJP2rZcpOXOt19mRvHMv0W74E2MONuvXvr0jwxHFAReNOUspD+Dg8wWoIy
         vy31/vJ0w/NuwAqsB1GyAnUepRxE+3M9g/uX20oq4kfapDkhu+tIhxUNkqoO+nd6HeqJ
         Hdlg7MFoQ4PGokMXzxQZbgfhaqlaX2perKiYGnd5bGYkl8jxj0hW/Of3F//EuDcsLzJ0
         5rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265909; x=1701870709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMcH7HqNFaUybso4IhgNmtpCYxX1qk/8kEmmSQTbt3I=;
        b=SZkxKBKts25JUOx/569gvSO2uOcf18cq6Y6nNREw1ZUac6+k6McjoP+4r4ZQ/Jg9fv
         B3GP+6cmwzX0z0pOdVfHu4SpKrwPIIfhCNa3bftftSryinoz1XItrVjPctcBrifSPpsG
         lhFoMthM9PaJAfmCGLKRW0wsKpXx8EyuFwn9bCvy83rnTBAsUXm2RdtZKQBSsDs81kt/
         d4Nhvgq7aRF1oOhtl+yX2B3vN8v/+GkGtr7eD+Y6IbShXDHiaAFGPbPb95IUynK8pPfY
         FucqYBVYtp0IP4MrfAx7HoML5Orgrg+51v1H5QhEbG3INFnKvpHYXR8fdQ2Gp6j7KGC4
         BGhA==
X-Gm-Message-State: AOJu0YyLrNnkWzS37m/VkUJAMxSJI34HviKs2VrMdBIQ2dUK18A6Y7HU
	J0kCm6rDDCjEt7MRbP7XRIOCeE9IvO2LJ7t6tIo=
X-Google-Smtp-Source: AGHT+IHqWWTkkhifST4wKln0gZfMHhT9KI+NavqVpBNdbuyFbsloFN8Wktxe2RYaDdcmk7NP5eIBKw==
X-Received: by 2002:a05:6512:31cb:b0:50b:a690:953f with SMTP id j11-20020a05651231cb00b0050ba690953fmr11509559lfe.18.1701265909467;
        Wed, 29 Nov 2023 05:51:49 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a28-20020ac2521c000000b0050ab88758b8sm2164280lfl.84.2023.11.29.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:51:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 14:51:47 +0100
Subject: [PATCH 3/4] Input: omap-keypad - Drop optional GPIO support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-input-v1-3-9433162914a3@linaro.org>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
In-Reply-To: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The driver supports passing some GPIO lines for rows and columns
through the driver data, but there is no in-kernel user of this.

Further the use seems convoluted because the GPIO lines are unused
in the driver, then explicitly free:ed when removing it without
being requested when probing it, which is assymetric and just
a recepie for disaster.

Remove the support for these unused GPIOs, if need be support can
be reestablished in an organized fashion using GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/keyboard/omap-keypad.c      | 16 +---------------
 include/linux/platform_data/keypad-omap.h |  3 ---
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index 454fb8675657..99023b9de35f 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -21,7 +21,6 @@
 #include <linux/mutex.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
 #include <linux/platform_data/keypad-omap.h>
 #include <linux/soc/ti/omap1-io.h>
@@ -49,9 +48,6 @@ struct omap_kp {
 
 static DECLARE_TASKLET_DISABLED_OLD(kp_tasklet, omap_kp_tasklet);
 
-static unsigned int *row_gpios;
-static unsigned int *col_gpios;
-
 static irqreturn_t omap_kp_interrupt(int irq, void *dev_id)
 {
 	/* disable keyboard interrupt and schedule for handling */
@@ -180,7 +176,7 @@ static int omap_kp_probe(struct platform_device *pdev)
 	struct omap_kp *omap_kp;
 	struct input_dev *input_dev;
 	struct omap_kp_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	int i, col_idx, row_idx, ret;
+	int col_idx, row_idx, ret;
 	unsigned int row_shift, keycodemax;
 
 	if (!pdata->rows || !pdata->cols || !pdata->keymap_data) {
@@ -209,11 +205,6 @@ static int omap_kp_probe(struct platform_device *pdev)
 	if (pdata->delay)
 		omap_kp->delay = pdata->delay;
 
-	if (pdata->row_gpios && pdata->col_gpios) {
-		row_gpios = pdata->row_gpios;
-		col_gpios = pdata->col_gpios;
-	}
-
 	omap_kp->rows = pdata->rows;
 	omap_kp->cols = pdata->cols;
 
@@ -276,11 +267,6 @@ static int omap_kp_probe(struct platform_device *pdev)
 err3:
 	device_remove_file(&pdev->dev, &dev_attr_enable);
 err2:
-	for (i = row_idx - 1; i >= 0; i--)
-		gpio_free(row_gpios[i]);
-	for (i = col_idx - 1; i >= 0; i--)
-		gpio_free(col_gpios[i]);
-
 	kfree(omap_kp);
 	input_free_device(input_dev);
 
diff --git a/include/linux/platform_data/keypad-omap.h b/include/linux/platform_data/keypad-omap.h
index 3e7c64c854f4..f3f1311cdf3a 100644
--- a/include/linux/platform_data/keypad-omap.h
+++ b/include/linux/platform_data/keypad-omap.h
@@ -19,9 +19,6 @@ struct omap_kp_platform_data {
 	bool rep;
 	unsigned long delay;
 	bool dbounce;
-	/* specific to OMAP242x*/
-	unsigned int *row_gpios;
-	unsigned int *col_gpios;
 };
 
 /* Group (0..3) -- when multiple keys are pressed, only the

-- 
2.34.1



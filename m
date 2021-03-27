Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B0934B925
	for <lists+linux-input@lfdr.de>; Sat, 27 Mar 2021 20:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhC0Tnv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Mar 2021 15:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhC0TnV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Mar 2021 15:43:21 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A925EC0613B1
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:43:19 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id y5so8721363qkl.9
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZH2G9zlTYurFt4lii+StEH9jmIKNIv4yiGAm9mlue7E=;
        b=GCMR5IYPT1nmcVEL4jLtj/ayI4oV0G8K30d7jT6Z9YhNtUwYakbIyp0PUrcmGsQFTQ
         pd3Ql6fUw7JK3S1ElYFXYtuQZseyjZIrmXL3Nm8B0pDiv8RKLlUwhiQoFWrrTGC4vzsR
         r35tOXXtzyaGZXor0awXjt0IFBnLQVvA6NhL94mpSv8lg2DJHv2HB1qIE8vQF/BH+KBc
         8lUtpyty6OifMlk2CtVz6+evHzj2aplfdoDyez4n6++TPmLBlJEjZj8B/prqEGWAdh8g
         +UXSJS/FpOK1W/Qr1zLn9hA6X/sJ/Z6p71Yeo1o4hLcb04Xf3YM2eeGJJdUtrZhMOQEl
         kxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZH2G9zlTYurFt4lii+StEH9jmIKNIv4yiGAm9mlue7E=;
        b=OixI14yQ2nuEbYZo/K+Xrso1Ntxyj9LaSUWY0fVvu/K/CelIUhNGwSanrPJyWvzqfj
         ioyhBGV315QQDZZAjPRlMrfbqXjWb1ePtyphxOvmxs6wS6Arj5AhWhWObFz7Bxjaz36z
         jSY6iA44lbDdV8WYUUackEe1GzBWbeVHsl0KQ7BdWnwRgOrxkgjXctOpCi3sAPBhdpMp
         gjhfVDzgVPzeKEolGAqPgZ2hEdNm+ZnyeHtIMJNaMWoa620PCJASoUbX4IvcBzlhO1eR
         4Eu/LrGa039q5+gRY18hoFrvsbVr1TFqbzsAMy+r7AfFrQDByxPphCb6e0dL9T+Or6su
         kfnQ==
X-Gm-Message-State: AOAM530coi6Uo936oN9krj+rJA1cP7ot4ny8UWrNlvjtPjZfMpNWWqjh
        vfvCW5nVsy3xOm9Nv48fO1REQP/bDGo=
X-Google-Smtp-Source: ABdhPJyrlIEePS0c11l2VT6cnMJLEa4j8SSbCWxjf7OR69OkOK+5PDC+gqtZFRGwpYKtHv1vzV2nJg==
X-Received: by 2002:a37:5f04:: with SMTP id t4mr18367002qkb.440.1616874198948;
        Sat, 27 Mar 2021 12:43:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:d77e:bbfa:7898:56c:200:f2a5])
        by smtp.gmail.com with ESMTPSA id j14sm3210919qtj.87.2021.03.27.12.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 12:43:18 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] Input: imx_keypad - convert to a DT-only driver
Date:   Sat, 27 Mar 2021 16:43:07 -0300
Message-Id: <20210327194307.541248-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i.MX has been converted to a DT-only platform, so make the
adjustments to the driver to convert it to a DT-only driver.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Remove the OF dependency in Kconfig. (Dmitry)

 drivers/input/keyboard/imx_keypad.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 1f5c9ea5e9e5..ae9303848571 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -408,27 +408,18 @@ static int imx_keypad_open(struct input_dev *dev)
 	return -EIO;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id imx_keypad_of_match[] = {
 	{ .compatible = "fsl,imx21-kpp", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_keypad_of_match);
-#endif
 
 static int imx_keypad_probe(struct platform_device *pdev)
 {
-	const struct matrix_keymap_data *keymap_data =
-			dev_get_platdata(&pdev->dev);
 	struct imx_keypad *keypad;
 	struct input_dev *input_dev;
 	int irq, error, i, row, col;
 
-	if (!keymap_data && !pdev->dev.of_node) {
-		dev_err(&pdev->dev, "no keymap defined\n");
-		return -EINVAL;
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -469,7 +460,7 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	input_dev->open = imx_keypad_open;
 	input_dev->close = imx_keypad_close;
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(NULL, NULL,
 					   MAX_MATRIX_KEY_ROWS,
 					   MAX_MATRIX_KEY_COLS,
 					   keypad->keycodes, input_dev);
@@ -582,7 +573,7 @@ static struct platform_driver imx_keypad_driver = {
 	.driver		= {
 		.name	= "imx-keypad",
 		.pm	= &imx_kbd_pm_ops,
-		.of_match_table = of_match_ptr(imx_keypad_of_match),
+		.of_match_table = imx_keypad_of_match,
 	},
 	.probe		= imx_keypad_probe,
 };
-- 
2.25.1


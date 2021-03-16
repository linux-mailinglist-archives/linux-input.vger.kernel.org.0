Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74ED633D4FA
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 14:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbhCPNhI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Mar 2021 09:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235174AbhCPNg4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Mar 2021 09:36:56 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78776C06174A
        for <linux-input@vger.kernel.org>; Tue, 16 Mar 2021 06:36:55 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id l13so11611385qtu.9
        for <linux-input@vger.kernel.org>; Tue, 16 Mar 2021 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHou+Bpm3EkMmAtfRl0epRp3I60rMKQy6/kMSI/v5wI=;
        b=tOUq8RLS85teislQykfmF1vUxlVRMUnXCK3zLJKyuGT/e+QeSipbjFQKVmXUuRB7gS
         CDCehbssKEKpGm69d8ij5suOXTQdkPNq6PwhZIzoGtFOfKcTe1IDhvft8Cuk8vumuRT2
         nPuCs0qfRZ8pl311eL1d8ikDJl/934w6QStDVngHi15dTQeTFxRzARORcaA9we1NW4NS
         ZcK0SR4fxo6HlY1omVgm/5ts/ZdMAyy6KLtrVotMwIWqKZtLBZXX2bPWKd1SZEs9iqT3
         lEYRM4Lvlt05CMhq8NPtabIjMTX1Z84fHa7H9O67Nd+UhrSnWYBx4U9yeUecWXoFuaNO
         /z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHou+Bpm3EkMmAtfRl0epRp3I60rMKQy6/kMSI/v5wI=;
        b=sVzlKbQDJgJxOhBWyh+gqjshcOxxWFoCH2+fzEvFd82qLOkhfKIMImqpAXp+lCBsGk
         e0lezmaXlwn2O8wp6lhu1PUsBKfGhJGBbU0NDKT1c4Bx+E+NxZdPvs95j9/vbjvXrCEC
         E2zhS5sxjlcYaqduFuGnMWbwfg3L59Dktyz61ydT7X3uyJE++8623CI0tINsVrZZM/kS
         NatoTQE8bGqDr0UNz0ApXq9TQeawUFRZy8r6UKhQN3PgFGqNSjd97EOON6eDObvOZros
         nh/WiisnJN+Y9Qs3q9tO5N8U13Uc4u2Kcq1b1PELg+PnVr9nd8UfjyNmq1xj1Ko6w3mX
         vrOw==
X-Gm-Message-State: AOAM532HN3NfMFtp6i5RFKb3zbv1vvHzkj5QsjQ5gnyCsEuBxwRIsSSY
        wWThXYD7pXQbKsFUn07ptc0=
X-Google-Smtp-Source: ABdhPJyIoLGLpOwCiOHckpDQJua0D4rh9ZcbD03FeCWVhG7QViUanuH7MZLZaVIeV1fc8jwWGLjVHA==
X-Received: by 2002:ac8:431e:: with SMTP id z30mr27046579qtm.216.1615901814600;
        Tue, 16 Mar 2021 06:36:54 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id m13sm14729440qkk.16.2021.03.16.06.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 06:36:53 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] Input: imx_keypad - convert to a DT-only driver
Date:   Tue, 16 Mar 2021 10:35:34 -0300
Message-Id: <20210316133534.224105-1-festevam@gmail.com>
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
Changes since v1:
- Remove dev_get_platdata() and the pdev->dev.of_node check (Dmitry).

 drivers/input/keyboard/Kconfig      |  1 +
 drivers/input/keyboard/imx_keypad.c | 13 ++-----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 32d15809ae58..bef0c06ef2a9 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -458,6 +458,7 @@ config KEYBOARD_SNVS_PWRKEY
 config KEYBOARD_IMX
 	tristate "IMX keypad support"
 	depends on ARCH_MXC || COMPILE_TEST
+	depends on OF
 	select INPUT_MATRIXKMAP
 	help
 	  Enable support for IMX keypad port.
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


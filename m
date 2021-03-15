Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF87233C3AB
	for <lists+linux-input@lfdr.de>; Mon, 15 Mar 2021 18:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbhCORK7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Mar 2021 13:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbhCORKr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Mar 2021 13:10:47 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBB1C06175F
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 10:10:47 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id l132so32396282qke.7
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 10:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfYYoY5ECja+GYIj/M/+9ekCkTVsWtvqI/FeqwkLFOw=;
        b=r+vO8gmU4hQJCq5EkykQ2wgewQMqgW2UIB8Gq31p/UQhs8DsCrHVtUB+ocDUbjO2Kr
         DePaG4y9MkwNs6OHVebAT8jFqziEZV4SCC5STHeLLLfpP7evXOFMjppLRzHhi2epkqnY
         HG/jBDrjV/nRLhud0rSdBN49aaWWEhC8sJe62VqN7KNkkBNFGYNv+djgfBVVDY5wlr4E
         mj0cu16jBbWNZ/K3hq8M49hNFWc59h8PYyOFGnB7gHBOJc6IpIepfuB2kjnyUzTfZQEg
         OavGTjFpe5EeuJnyn9A4cHQDsqXN6j7r7EVb7FAtrDc0SrJpVIhLQMJyX++FLCu7tvJM
         U7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfYYoY5ECja+GYIj/M/+9ekCkTVsWtvqI/FeqwkLFOw=;
        b=MS9vh/d2QhLssHPnA/hsdG7zqf20aqHxHZ/B3+5CHbijE/0+/cxRY3Dc+zPWBL1dK9
         N/Un6gKSiDalJovKU9ksCRskf2E8adC8cU8g6V2kWX0oMKDGnQF7LhJTEMIo0mV4JPzg
         6fsFB28cdAdBSfL8l4Q8GgcPnWH8cKMOBt7Y1vj362MhJ/zqkCw46LidD8/iWTwgrGCa
         21uYhbesUKae3JbjhybafkAZq3/SB2FQ0qSavY3VYUGLRoVHWLW4oKJFGeoirSnqpnAR
         6Edttt0IowxcU+m1YN0OFnpjAetWT0H6TIUleWGSziWFb8C0+dMcDrCH2JjntFW2hM0g
         /AWg==
X-Gm-Message-State: AOAM532R8/lMtP4zo/QUNehGxSDIIbykgD4rcSswp0MY2WtTOD85uKQW
        zrlxiQf+7H3IvxNESpia4nIXBm602rgI2w==
X-Google-Smtp-Source: ABdhPJwmDUyGCftng1oCvu5LB94AQak6LbRLfZM+qA6PdGyDl4WeiwDq5huZAkHecL0gKIJcC0VZ4g==
X-Received: by 2002:a05:620a:144a:: with SMTP id i10mr26132902qkl.431.1615828246852;
        Mon, 15 Mar 2021 10:10:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id k8sm9996286qth.74.2021.03.15.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:10:46 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] Input: imx_keypad - convert to a DT-only driver
Date:   Mon, 15 Mar 2021 14:10:37 -0300
Message-Id: <20210315171037.171120-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i.MX has been converted to a DT-only platform, so make the driver
depend on OF, remove the CONFIG_OF ifdefery and remove of_match_ptr().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/keyboard/Kconfig      | 1 +
 drivers/input/keyboard/imx_keypad.c | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

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
index 1f5c9ea5e9e5..815b3d11dfbb 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -408,13 +408,11 @@ static int imx_keypad_open(struct input_dev *dev)
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
@@ -582,7 +580,7 @@ static struct platform_driver imx_keypad_driver = {
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


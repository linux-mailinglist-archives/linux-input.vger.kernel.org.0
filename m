Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83508DB872
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502570AbfJQUmn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:43 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42318 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502472AbfJQUmk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:40 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so383799plj.9;
        Thu, 17 Oct 2019 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+B6qJ2+sSOJxH3bWqT0dnUTKHAsVIIfgBFCuwwzUvjw=;
        b=CbQAgdz0/oATooI3JAjctya7d07Tum22kSzH0rlFQExxNDjvC1yAx+owKU4ysP3SKD
         9yb7s2uIEH/105h8+GSQVl60hNegEwtDz0vlIpGCiNerVAwyPJBhFzsip7BRAVbx5NGq
         6Q4fkJEmZbjtMlcSuRFk/4AsziJR4GtD3brq1dS20KStyj8folSpT5flYwr1W1ocIiYC
         WF1I3L6RWhgaYEzacOIm2hOviTTmZ1GcOraxZs2DZMJ0fhuRpaqmZ1Qls112sxOCzyZT
         0l081m5qb7VDyMaBTq2YnVEVCX+654J2CfYaNjDBhFcGIBoKSx+iWrdznAFwS0UlIGJN
         3N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+B6qJ2+sSOJxH3bWqT0dnUTKHAsVIIfgBFCuwwzUvjw=;
        b=OI5DjDt70xeaWZ3UVs8Ox8XuHFgkNsmiOVNtGC9dY6ufWJwVuvsPzYp4pqLYaSkhE1
         QEhOs1xXlxDGswBtMSNG8/2RXEuV26v+2L6JaGv3InefdvJGKeJZG8VBkZNE7bKHTyE5
         EIa2Q6wg4Pa2A5eAzXV6brm5/DQ0RVdfEMhnKJYI2Si9T8/Zxv13X2sN7sKwP343iFpR
         ETct7ehRcbbze0xLTWbgygufmdWUey4QNOi2hzC6/uZlsdiWSp27fRj0FbSnHU6d7/cO
         nlaR+oVTp7RpQ/FqPVJLK6MUUFQtJO5Ma9nB0fGehUCL3wULvppr9K12YQ/Hvz51c/Mu
         rF3w==
X-Gm-Message-State: APjAAAU6xyUhow34h3e6Ov9YtiVD0vaRKS5VxFiLeXFey/JO6YW//jGt
        oRBBZD0ALiOSt53L5fEMgH2DbfXR
X-Google-Smtp-Source: APXvYqzI5gLW8a6HyzNcyCcjJkOmrrq46EKMuhYNuMDZbqFmTjdU0b+0s1BXJwbfkAOFURuuW1V+4A==
X-Received: by 2002:a17:902:6acb:: with SMTP id i11mr5767468plt.273.1571344957746;
        Thu, 17 Oct 2019 13:42:37 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:36 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Allison Randal <allison@lohutok.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Jilayne Lovejoy <opensource@jilayne.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/22] Input: cobalt_btns - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:06 -0700
Message-Id: <20191017204217.106453-13-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We have added polled mode to the normal input devices with the intent of
retiring input_polled_dev. This converts cobalt_btns driver to use
the polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig       |  1 -
 drivers/input/misc/cobalt_btns.c | 26 ++++++++++++++------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 248e3b40bd24..05520bf4e31d 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -326,7 +326,6 @@ config INPUT_IXP4XX_BEEPER
 config INPUT_COBALT_BTNS
 	tristate "Cobalt button interface"
 	depends on MIPS_COBALT
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you want to support MIPS Cobalt button interface.
 
diff --git a/drivers/input/misc/cobalt_btns.c b/drivers/input/misc/cobalt_btns.c
index f7c1693fc6bb..b1624f5414ee 100644
--- a/drivers/input/misc/cobalt_btns.c
+++ b/drivers/input/misc/cobalt_btns.c
@@ -4,7 +4,7 @@
  *
  *  Copyright (C) 2007-2008  Yoichi Yuasa <yuasa@linux-mips.org>
  */
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
@@ -32,10 +32,9 @@ struct buttons_dev {
 	void __iomem *reg;
 };
 
-static void handle_buttons(struct input_polled_dev *dev)
+static void handle_buttons(struct input_dev *input)
 {
-	struct buttons_dev *bdev = dev->private;
-	struct input_dev *input = dev->input;
+	struct buttons_dev *bdev = input_get_drvdata(input);
 	uint32_t status;
 	int i;
 
@@ -62,7 +61,6 @@ static void handle_buttons(struct input_polled_dev *dev)
 static int cobalt_buttons_probe(struct platform_device *pdev)
 {
 	struct buttons_dev *bdev;
-	struct input_polled_dev *poll_dev;
 	struct input_dev *input;
 	struct resource *res;
 	int error, i;
@@ -81,15 +79,12 @@ static int cobalt_buttons_probe(struct platform_device *pdev)
 
 	memcpy(bdev->keymap, cobalt_map, sizeof(bdev->keymap));
 
-	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
-	if (!poll_dev)
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input)
 		return -ENOMEM;
 
-	poll_dev->private = bdev;
-	poll_dev->poll = handle_buttons;
-	poll_dev->poll_interval = BUTTONS_POLL_INTERVAL;
+	input_set_drvdata(input, bdev);
 
-	input = poll_dev->input;
 	input->name = "Cobalt buttons";
 	input->phys = "cobalt/input0";
 	input->id.bustype = BUS_HOST;
@@ -104,7 +99,14 @@ static int cobalt_buttons_probe(struct platform_device *pdev)
 		__set_bit(bdev->keymap[i], input->keybit);
 	__clear_bit(KEY_RESERVED, input->keybit);
 
-	error = input_register_polled_device(poll_dev);
+
+	error = input_setup_polling(input, handle_buttons);
+	if (error)
+		return error;
+
+	input_set_poll_interval(input, BUTTONS_POLL_INTERVAL);
+
+	error = input_register_device(input);
 	if (error)
 		return error;
 
-- 
2.23.0.866.gb869b98d4c-goog


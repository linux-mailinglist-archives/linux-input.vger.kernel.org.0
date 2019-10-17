Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56A1DB88A
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503577AbfJQUnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:43:45 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36784 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502537AbfJQUmm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:42 -0400
Received: by mail-pl1-f193.google.com with SMTP id j11so1706588plk.3;
        Thu, 17 Oct 2019 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OSh22+yVoEobbB0Q9LQlMfjUGPQ3hQpM1kovi0TTTE=;
        b=iu0ojF5yyj3dozHSsziE6kH+Gi584zheA4VlOiCemk4AZQxzKgXLvsn48gtIUW07GV
         NYtO3c3McBZb+y16uZZkbEdrJll5zVPqOfbr5J1eR56JUNnlneb5jM5y8C6jdeGIq1cs
         KT1paaVMZXfKM6U0JiYRTdC/Dz8ttXYo8QrNgB8/JbxYHcTspL89Pkg2YIjCzOOW98u6
         oojuO2+f6cbLTr0MSPVP59KD190L0rNkxCBbN1MLCN+X7HuFaxjBUkkZe7kLmQY3a8Gx
         4Q3fZpcz451JoqXgCcOiW3WE+ARX/EbIveS2ZhP9drB2VMozR94DyNlsk+ZlX1Myqqnr
         7OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OSh22+yVoEobbB0Q9LQlMfjUGPQ3hQpM1kovi0TTTE=;
        b=b1hvzDWtkbn79YWU2OKspKEsO4Dx/2k5XUZvRt3gelV3O/DYMLp4UuXoXLncVv3Ugq
         0kDLDqdG1NAHeceDnU0d8lw735j0UjO7Pr4KsKd/yoCPmevl0RJpYfzhN41OF9Evv0Ry
         Ec60+lTxWbcbgVABa/yDl3Cs5vp+bjGqHYHhW39LUlFWQaQfV0kG45k8vs4Ov6rtLKVB
         0LL5FVfkDcnIOqriOifVL4tiQrJyYzuE6j6oiV7YHoBmLTfDqWvygRsueIoh+JwORwat
         EKD/ypCn0qPlS3Uyx/1BdstFlxNimpy0G1Vsgfu9Ra8JgBEQMtVn2b6gICSiHMiWhYHs
         bN5Q==
X-Gm-Message-State: APjAAAULPZHEziLsOI+DIC5/eW5cJNGnzzmNbOlaCtzLqy85tKQTXl4F
        Pg8Px97G8QsxtbZdBBDViFSYGnZ+
X-Google-Smtp-Source: APXvYqxl19fCY67lB2b4zP9cmS80YAs6fS6GazjMSJQY393kf6FKfGDNK0YS2dKRdIaSqx5sOXj3kw==
X-Received: by 2002:a17:902:848e:: with SMTP id c14mr5548629plo.77.1571344960154;
        Thu, 17 Oct 2019 13:42:40 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:39 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Steve Winslow <swinslow@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/22] Input: sgi_btns - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:08 -0700
Message-Id: <20191017204217.106453-15-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts sgi_btns driver to use
the polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig    |  1 -
 drivers/input/misc/sgi_btns.c | 25 +++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 05520bf4e31d..c27a9ee4ef9a 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -543,7 +543,6 @@ config INPUT_UINPUT
 config INPUT_SGI_BTNS
 	tristate "SGI Indy/O2 volume button interface"
 	depends on SGI_IP22 || SGI_IP32
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you want to support SGI Indy/O2 volume button interface.
 
diff --git a/drivers/input/misc/sgi_btns.c b/drivers/input/misc/sgi_btns.c
index 829277b4271f..0657d785b3cc 100644
--- a/drivers/input/misc/sgi_btns.c
+++ b/drivers/input/misc/sgi_btns.c
@@ -4,7 +4,7 @@
  *
  *  Copyright (C) 2008  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  */
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -49,10 +49,9 @@ struct buttons_dev {
 	int count[ARRAY_SIZE(sgi_map)];
 };
 
-static void handle_buttons(struct input_polled_dev *dev)
+static void handle_buttons(struct input_dev *input)
 {
-	struct buttons_dev *bdev = dev->private;
-	struct input_dev *input = dev->input;
+	struct buttons_dev *bdev = input_get_drvdata(input);
 	u8 status;
 	int i;
 
@@ -79,7 +78,6 @@ static void handle_buttons(struct input_polled_dev *dev)
 static int sgi_buttons_probe(struct platform_device *pdev)
 {
 	struct buttons_dev *bdev;
-	struct input_polled_dev *poll_dev;
 	struct input_dev *input;
 	int error, i;
 
@@ -87,17 +85,14 @@ static int sgi_buttons_probe(struct platform_device *pdev)
 	if (!bdev)
 		return -ENOMEM;
 
-	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
-	if (!poll_dev)
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input)
 		return -ENOMEM;
 
 	memcpy(bdev->keymap, sgi_map, sizeof(bdev->keymap));
 
-	poll_dev->private = bdev;
-	poll_dev->poll = handle_buttons;
-	poll_dev->poll_interval = BUTTONS_POLL_INTERVAL;
+	input_set_drvdata(input, bdev);
 
-	input = poll_dev->input;
 	input->name = "SGI buttons";
 	input->phys = "sgi/input0";
 	input->id.bustype = BUS_HOST;
@@ -112,7 +107,13 @@ static int sgi_buttons_probe(struct platform_device *pdev)
 		__set_bit(bdev->keymap[i], input->keybit);
 	__clear_bit(KEY_RESERVED, input->keybit);
 
-	error = input_register_polled_device(poll_dev);
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


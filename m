Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9761DB886
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502733AbfJQUmq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35439 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502634AbfJQUmp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id c3so1709895plo.2;
        Thu, 17 Oct 2019 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H6A+MfE+mY9j5A0d4q4ouMrSZpQoTdVP4FH8jGsUc3A=;
        b=k+WXYrglf1NX0PyOCClEtSAiyMd1d7VM1QfO5Sz85fU55TkwlyrfQb94f/wcfBlHIp
         jtrR25t1UA8j8jT1RrlKH85PCFh0i19Z3DCvfiZcpnMXOIYvq6ZpUG33JRtJm0VVEQiS
         w/hBJwuhMuxg14pZAdEjZobPIiSBkhxsPFFQkb3gvR56z47E9fp3zCl/fR6i/mCGQnOM
         Lz7DEpsLbzlI9StZFSQxQj4ERwMGQZ6n470f6zGxBZM0KVFvAz9D59/SlTiym9ImweAY
         J7Px9i9GMYxtMUvgtrPW9P4+xVrwFvrwkPBZB4fg8FS4VZOLRbpXbtWVuPa7nv+vgA+f
         lwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H6A+MfE+mY9j5A0d4q4ouMrSZpQoTdVP4FH8jGsUc3A=;
        b=n3GUk5WW6v691CbHgoG4DOrlnKx7Co8wRAZbNcOz0iy18LmL/MU5rXOXQpsE8Q3vO6
         mEoitlqbck1o8XhsUIQ1xqTZ68dDZQx6JV8oQ+RI01eVPlNincnbT13Vrsz31YilQN8r
         Vs3d6OQZ7vIl0zKFx5hXhyVRHReBeQfEXdVh1iazO1V3a0+lSFjJZOPROvloZF2EQcm8
         1j6JviDesRlLLO2ks6g0EuQsfKmcCUpUXccMfN7w0gGi5iKtmyGS/57Zh1+jEpM1c6HE
         2iyoPxG47wv+VYihlQmp2Fk6VqYtZvR6Bh4yYcqbgtmQNLtmzrQ3HRBbSX3hxDZ0y6Qp
         m6aQ==
X-Gm-Message-State: APjAAAWF2p/2J7tnXDQrN/l/f22u7gOf0i9QVSGxR4XSTeC0COBPDfpo
        uTzE316mI6+Kv45gE8Ort0fPj0ll
X-Google-Smtp-Source: APXvYqz4i9wKh+YGYMbY0xagOCVnLgkjnbA9wVaJThtTGwv52eBWzmKDT82iWZQZOG9wBygSM0aiuQ==
X-Received: by 2002:a17:902:a70f:: with SMTP id w15mr6044474plq.146.1571344963132;
        Thu, 17 Oct 2019 13:42:43 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:41 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/22] Input: rb532_button - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:10 -0700
Message-Id: <20191017204217.106453-17-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts rb532_button driver to use
the polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig        |  1 -
 drivers/input/misc/rb532_button.c | 32 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index c27a9ee4ef9a..102e993bbd6b 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -633,7 +633,6 @@ config INPUT_RB532_BUTTON
 	tristate "Mikrotik Routerboard 532 button interface"
 	depends on MIKROTIK_RB532
 	depends on GPIOLIB
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you want support for the S1 button built into
 	  Mikrotik's Routerboard 532.
diff --git a/drivers/input/misc/rb532_button.c b/drivers/input/misc/rb532_button.c
index 3c43024f4527..190a80e1e2c1 100644
--- a/drivers/input/misc/rb532_button.c
+++ b/drivers/input/misc/rb532_button.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2009  Phil Sutter <n0-1@freewrt.org>
  */
 
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
@@ -46,32 +46,34 @@ static bool rb532_button_pressed(void)
 	return !val;
 }
 
-static void rb532_button_poll(struct input_polled_dev *poll_dev)
+static void rb532_button_poll(struct input_dev *input)
 {
-	input_report_key(poll_dev->input, RB532_BTN_KSYM,
-			 rb532_button_pressed());
-	input_sync(poll_dev->input);
+	input_report_key(input, RB532_BTN_KSYM, rb532_button_pressed());
+	input_sync(input);
 }
 
 static int rb532_button_probe(struct platform_device *pdev)
 {
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	int error;
 
-	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
-	if (!poll_dev)
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input)
 		return -ENOMEM;
 
-	poll_dev->poll = rb532_button_poll;
-	poll_dev->poll_interval = RB532_BTN_RATE;
+	input->name = "rb532 button";
+	input->phys = "rb532/button0";
+	input->id.bustype = BUS_HOST;
 
-	poll_dev->input->name = "rb532 button";
-	poll_dev->input->phys = "rb532/button0";
-	poll_dev->input->id.bustype = BUS_HOST;
+	input_set_capability(input, EV_KEY, RB532_BTN_KSYM);
 
-	input_set_capability(poll_dev->input, EV_KEY, RB532_BTN_KSYM);
+	error = input_setup_polling(input, rb532_button_poll);
+	if (error)
+		return error;
+
+	input_set_poll_interval(input, RB532_BTN_RATE);
 
-	error = input_register_polled_device(poll_dev);
+	error = input_register_device(input);
 	if (error)
 		return error;
 
-- 
2.23.0.866.gb869b98d4c-goog


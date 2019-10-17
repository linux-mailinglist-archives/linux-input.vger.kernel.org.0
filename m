Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B9ADB892
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502462AbfJQUmj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39518 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502399AbfJQUmg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id p12so2020963pgn.6;
        Thu, 17 Oct 2019 13:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/u7CQMSqx4AqgCFaDTl7FrvAytzef1LxG8s2tTMpAZA=;
        b=ZFe484p1up1ZOS/7Ry47ymlyO4ldflOXJZvhXJjjjBkIofzyAXSDpqeLuaPAsLhPES
         ieRvhebdFRDC9aMNsPB0fD1yevighBZAwBIA7usJY/med0a/JfXNRt1N9mCWzP+RkEXF
         s8sUhbEFQB7ewA/HgBAzb50Tb4U8zcHLfwSCw0M3kBDRKpT37IpDJDcIQSzxaX6rT+lU
         jVtdIgI/IgQ1Fu3w06dfyLd5Val90VMqiUqTAbxbMtXaleiu8tcdoxD6cnrgrigPSONC
         7HrW6rX5yRQrUVhafTX0kKN70YGbUNi19vg8lHF1deHA+UpXyoFUlPVM8hVoXr+O+Urv
         q7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/u7CQMSqx4AqgCFaDTl7FrvAytzef1LxG8s2tTMpAZA=;
        b=ojg31Y65WaeN+n10GjmZB0fUs8sZWnQJlTNWIEAWKl+jbehajHEO2Nzpz7Q3U7yJoo
         4zZE50f1qb8kPb25JJeXhoIEqsKw1GdKklZYXQyJMiv5TmGTIO4BkVpblveMMuggmhdD
         W87JYfapnzsMuYUSbQPvgx84syYgH08y0/7VagIfK+9yP1EltFIrdinhSQlSD3uXSkvf
         MqBMyN/MiexxWprpLM8jUco4FqvKxE++Xdgg+dO4eGpiQX9e7kdG8aRIlmTa8KDJSO7l
         rSr2ubOinWE0jmMzaW2bfFfO1+UmEWEAswkeKnG8PZyU02FnaZoFHSl3qb1OHrvp+NAt
         +hFA==
X-Gm-Message-State: APjAAAVmq+iHC/Dq3ALNu2nD6nhBkJnlW4kRAmF+fxAHJx8Kv0fcAnbt
        1PBb4blOjoSO0K3JORk4n9IyRQoU
X-Google-Smtp-Source: APXvYqzxQ2/iNypxVHBBbitc/8Q8q1+ZEi6pyXFf2HzrEixssFtagr4mb7W2D+rPQCGMOLxHkqWnKg==
X-Received: by 2002:a17:90a:cf98:: with SMTP id i24mr6391907pju.99.1571344955329;
        Thu, 17 Oct 2019 13:42:35 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:34 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Miloslav Trmac <mitr@volny.cz>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/22] Input: wistron_btns - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:04 -0700
Message-Id: <20191017204217.106453-11-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts wistron_btns driver to use
the polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig        |  1 -
 drivers/input/misc/wistron_btns.c | 51 ++++++++++++++++---------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index a6b8af69915d..248e3b40bd24 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -346,7 +346,6 @@ config INPUT_CPCAP_PWRBUTTON
 config INPUT_WISTRON_BTNS
 	tristate "x86 Wistron laptop button interface"
 	depends on X86_32
-	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
 	select LEDS_CLASS
diff --git a/drivers/input/misc/wistron_btns.c b/drivers/input/misc/wistron_btns.c
index 7ce6cc60d4d2..80dfd72a02d3 100644
--- a/drivers/input/misc/wistron_btns.c
+++ b/drivers/input/misc/wistron_btns.c
@@ -8,7 +8,7 @@
 #include <linux/io.h>
 #include <linux/dmi.h>
 #include <linux/init.h>
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
@@ -1030,7 +1030,7 @@ static int __init select_keymap(void)
 
  /* Input layer interface */
 
-static struct input_polled_dev *wistron_idev;
+static struct input_dev *wistron_idev;
 static unsigned long jiffies_last_press;
 static bool wifi_enabled;
 static bool bluetooth_enabled;
@@ -1114,7 +1114,7 @@ static inline void wistron_led_resume(void)
 static void handle_key(u8 code)
 {
 	const struct key_entry *key =
-		sparse_keymap_entry_from_scancode(wistron_idev->input, code);
+		sparse_keymap_entry_from_scancode(wistron_idev, code);
 
 	if (key) {
 		switch (key->type) {
@@ -1133,14 +1133,14 @@ static void handle_key(u8 code)
 			break;
 
 		default:
-			sparse_keymap_report_entry(wistron_idev->input,
-						   key, 1, true);
+			sparse_keymap_report_entry(wistron_idev, key, 1, true);
 			break;
 		}
 		jiffies_last_press = jiffies;
-	} else
+	} else {
 		printk(KERN_NOTICE
 			"wistron_btns: Unknown key code %02X\n", code);
+	}
 }
 
 static void poll_bios(bool discard)
@@ -1158,21 +1158,23 @@ static void poll_bios(bool discard)
 	}
 }
 
-static void wistron_flush(struct input_polled_dev *dev)
+static int wistron_flush(struct input_dev *dev)
 {
 	/* Flush stale event queue */
 	poll_bios(true);
+
+	return 0;
 }
 
-static void wistron_poll(struct input_polled_dev *dev)
+static void wistron_poll(struct input_dev *dev)
 {
 	poll_bios(false);
 
 	/* Increase poll frequency if user is currently pressing keys (< 2s ago) */
 	if (time_before(jiffies, jiffies_last_press + 2 * HZ))
-		dev->poll_interval = POLL_INTERVAL_BURST;
+		input_set_poll_interval(dev, POLL_INTERVAL_BURST);
 	else
-		dev->poll_interval = POLL_INTERVAL_DEFAULT;
+		input_set_poll_interval(dev, POLL_INTERVAL_DEFAULT);
 }
 
 static int wistron_setup_keymap(struct input_dev *dev,
@@ -1208,35 +1210,37 @@ static int wistron_setup_keymap(struct input_dev *dev,
 
 static int setup_input_dev(void)
 {
-	struct input_dev *input_dev;
 	int error;
 
-	wistron_idev = input_allocate_polled_device();
+	wistron_idev = input_allocate_device();
 	if (!wistron_idev)
 		return -ENOMEM;
 
+	wistron_idev->name = "Wistron laptop buttons";
+	wistron_idev->phys = "wistron/input0";
+	wistron_idev->id.bustype = BUS_HOST;
+	wistron_idev->dev.parent = &wistron_device->dev;
+
 	wistron_idev->open = wistron_flush;
-	wistron_idev->poll = wistron_poll;
-	wistron_idev->poll_interval = POLL_INTERVAL_DEFAULT;
 
-	input_dev = wistron_idev->input;
-	input_dev->name = "Wistron laptop buttons";
-	input_dev->phys = "wistron/input0";
-	input_dev->id.bustype = BUS_HOST;
-	input_dev->dev.parent = &wistron_device->dev;
+	error = sparse_keymap_setup(wistron_idev, keymap, wistron_setup_keymap);
+	if (error)
+		goto err_free_dev;
 
-	error = sparse_keymap_setup(input_dev, keymap, wistron_setup_keymap);
+	error = input_setup_polling(wistron_idev, wistron_poll);
 	if (error)
 		goto err_free_dev;
 
-	error = input_register_polled_device(wistron_idev);
+	input_set_poll_interval(wistron_idev, POLL_INTERVAL_DEFAULT);
+
+	error = input_register_device(wistron_idev);
 	if (error)
 		goto err_free_dev;
 
 	return 0;
 
  err_free_dev:
-	input_free_polled_device(wistron_idev);
+	input_free_device(wistron_idev);
 	return error;
 }
 
@@ -1285,8 +1289,7 @@ static int wistron_probe(struct platform_device *dev)
 static int wistron_remove(struct platform_device *dev)
 {
 	wistron_led_remove();
-	input_unregister_polled_device(wistron_idev);
-	input_free_polled_device(wistron_idev);
+	input_unregister_device(wistron_idev);
 	bios_detach();
 
 	return 0;
-- 
2.23.0.866.gb869b98d4c-goog


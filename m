Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83AAFDB891
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502278AbfJQUmd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35657 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502167AbfJQUmc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id p30so2035195pgl.2;
        Thu, 17 Oct 2019 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DXOOvgjdHDLcY/TELjuk7480vpSOqwTSHaydEd8CsDk=;
        b=uqZCfmKxEStzygZDPg+aw/K+714cHqVk4+fZMdDo/w9IGMX2TkOBN5k7U79AJ4uh4D
         K6N50QhgWjTV1suuVzPDjkBvbnVWhS1JbKN5CdMnFacDxb3iiGEWKyJjyQxMuuxYKlYG
         NDtSxOfcHFRhb88y7M2QeWsE0mj8yavW4vfWis1nsuqTNbNF0CVpoIMgki8ocNYPeI7W
         FFGPFQWeGFROmKq5EBJ8nN4/KMSmnKreZHtyyBWdjmqPkzTDzVYWB7WFKxlkSsBBmXMP
         LJwDdS7v4WHc8eL2aYgPPpTdtWJN6MjgeaaxnM8u17+gENdF4Gwku45KFwf4jD7/rTrv
         GU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DXOOvgjdHDLcY/TELjuk7480vpSOqwTSHaydEd8CsDk=;
        b=b9HTDaWXz6GAf1Fz0bKxcUNNAz2SJX1aYuRhvVelq5Ndys2MEnjLmr5JD7n9/z+rcx
         FbGCvAOjb2Wj3zdmzDUE2xqLGGfIAvsYRgTcEoStobnWFxAoIhwDLL4PP+EN03exMdLn
         PRt616IObIIDTZ1D6GK7taRqsyke+DaN7VrP6qv/J5pEKMLqFu1MMfe7CsM0KypgwM9W
         rTqEFy1UfMtwwehNvEi5MkS/LpcCo5roNuKPepSS/itLQUA64OeUN3rJDSy//emizwrt
         ZkA+7Go/joeEx2oQSI9ImqTs42AelVfT388codLttAv+uL06fUwDLxgPLxECUL0EOk4L
         XU4g==
X-Gm-Message-State: APjAAAV37AvcBblQHb7zpsbNBjiyebBIL4a4Q+TAiv9jnEMs6cUKyTuH
        P+FtD1CJGiGg0geaKJ23EqEvwlcp
X-Google-Smtp-Source: APXvYqymCrgDzYuBixHWm6GkgUIkI2iLHtFF52oTIoIgv32UpsMspRRf7vYHpgEq1y16QYXegSPl8w==
X-Received: by 2002:a62:a504:: with SMTP id v4mr2224847pfm.243.1571344951192;
        Thu, 17 Oct 2019 13:42:31 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:30 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Allison Randal <allison@lohutok.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Enrico Weigelt <info@metux.net>, Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
        Stefan Agner <stefan@agner.ch>,
        YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 07/22] Input: jornada680_kbd - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:01 -0700
Message-Id: <20191017204217.106453-8-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts jornada680_kbd driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/keyboard/Kconfig          |  1 -
 drivers/input/keyboard/jornada680_kbd.c | 37 +++++++++++++------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 0e7368288dae..54b1905ebbfe 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -340,7 +340,6 @@ config KEYBOARD_HIL
 config KEYBOARD_HP6XX
 	tristate "HP Jornada 6xx keyboard"
 	depends on SH_HP6XX
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you have a HP Jornada 620/660/680/690 and want to
 	  support the built-in keyboard.
diff --git a/drivers/input/keyboard/jornada680_kbd.c b/drivers/input/keyboard/jornada680_kbd.c
index 4232aa876d2e..7e35081393be 100644
--- a/drivers/input/keyboard/jornada680_kbd.c
+++ b/drivers/input/keyboard/jornada680_kbd.c
@@ -15,7 +15,6 @@
 
 #include <linux/device.h>
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
@@ -64,7 +63,7 @@ static const unsigned short jornada_scancodes[] = {
 #define JORNADA_SCAN_SIZE	18
 
 struct jornadakbd {
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	unsigned short keymap[ARRAY_SIZE(jornada_scancodes)];
 	unsigned char length;
 	unsigned char old_scan[JORNADA_SCAN_SIZE];
@@ -73,7 +72,7 @@ struct jornadakbd {
 
 static void jornada_parse_kbd(struct jornadakbd *jornadakbd)
 {
-	struct input_dev *input_dev = jornadakbd->poll_dev->input;
+	struct input_dev *input_dev = jornadakbd->input;
 	unsigned short *keymap = jornadakbd->keymap;
 	unsigned int sync_me = 0;
 	unsigned int i, j;
@@ -167,9 +166,9 @@ static void jornada_scan_keyb(unsigned char *s)
 	*s++ = __raw_readb(PHDR);
 }
 
-static void jornadakbd680_poll(struct input_polled_dev *dev)
+static void jornadakbd680_poll(struct input_dev *input)
 {
-	struct jornadakbd *jornadakbd = dev->private;
+	struct jornadakbd *jornadakbd = input_get_drvdata(input);
 
 	jornada_scan_keyb(jornadakbd->new_scan);
 	jornada_parse_kbd(jornadakbd);
@@ -179,7 +178,6 @@ static void jornadakbd680_poll(struct input_polled_dev *dev)
 static int jornada680kbd_probe(struct platform_device *pdev)
 {
 	struct jornadakbd *jornadakbd;
-	struct input_polled_dev *poll_dev;
 	struct input_dev *input_dev;
 	int i, error;
 
@@ -188,29 +186,24 @@ static int jornada680kbd_probe(struct platform_device *pdev)
 	if (!jornadakbd)
 		return -ENOMEM;
 
-	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
-	if (!poll_dev) {
-		dev_err(&pdev->dev, "failed to allocate polled input device\n");
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev) {
+		dev_err(&pdev->dev, "failed to allocate input device\n");
 		return -ENOMEM;
 	}
 
-	jornadakbd->poll_dev = poll_dev;
+	jornadakbd->input = input_dev;
 
 	memcpy(jornadakbd->keymap, jornada_scancodes,
 		sizeof(jornadakbd->keymap));
 
-	poll_dev->private = jornadakbd;
-	poll_dev->poll = jornadakbd680_poll;
-	poll_dev->poll_interval = 50; /* msec */
-
-	input_dev = poll_dev->input;
+	input_set_drvdata(input_dev, jornadakbd);
 	input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_REP);
 	input_dev->name = "HP Jornada 680 keyboard";
 	input_dev->phys = "jornadakbd/input0";
 	input_dev->keycode = jornadakbd->keymap;
 	input_dev->keycodesize = sizeof(unsigned short);
 	input_dev->keycodemax = ARRAY_SIZE(jornada_scancodes);
-	input_dev->dev.parent = &pdev->dev;
 	input_dev->id.bustype = BUS_HOST;
 
 	for (i = 0; i < 128; i++)
@@ -220,9 +213,17 @@ static int jornada680kbd_probe(struct platform_device *pdev)
 
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
 
-	error = input_register_polled_device(jornadakbd->poll_dev);
+	error = input_setup_polling(input_dev, jornadakbd680_poll);
+	if (error) {
+		dev_err(&pdev->dev, "failed to set up polling\n");
+		return error;
+	}
+
+	input_set_poll_interval(input_dev, 50 /* msec */);
+
+	error = input_register_device(input_dev);
 	if (error) {
-		dev_err(&pdev->dev, "failed to register polled input device\n");
+		dev_err(&pdev->dev, "failed to register input device\n");
 		return error;
 	}
 
-- 
2.23.0.866.gb869b98d4c-goog


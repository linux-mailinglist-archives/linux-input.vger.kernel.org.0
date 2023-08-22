Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FD3784561
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 17:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237033AbjHVPW5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 11:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbjHVPW5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 11:22:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DD71BE
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 08:22:54 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-3159d5e409dso3600700f8f.0
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692717773; x=1693322573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iYVw+zE33iGEGgZkL2OTTW5qQuIEbe9J8maXgT3tvA=;
        b=HRIuTNqwWahTO8wOvckmTC3bIz/O05jocYJ1geTY+ue/lTfEmxpr9oj/yISd4Y9m9O
         Q4iyd0Ss3K4+MlQcwfeeBHDIyvFxZSEv6PWH760nCFonZh5qmrvVgarjbq24f2XUj5vG
         fGieRLsVPfLaOnu0n4uDG6vc3hDKPF71IzKa0DmvBdIXouY9sL9neozx6R/RooGUlxQ6
         JPBBXcWh1WSQaGmHXA68r4EDhQYwnCZ0/3uVZZVnlMIDLy3SERDws2B+wpM6mu4YZXC8
         PJRRQBKziPSyuYA159UZAr/s5Gydb0PlxOoooMWefxdP7V2dxAhf7zSgviTDvL8KX9qi
         /YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692717773; x=1693322573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iYVw+zE33iGEGgZkL2OTTW5qQuIEbe9J8maXgT3tvA=;
        b=cRIsyCRmX/Dae+9cxqBx8z7NR611THaHdGLy210itd4IO33dfa/3SiLRQm2VTz4BGV
         4tiztB6gvE9RG2PJTtp2iapPKiyIYY5mNH92PIB/GrL2VJ8vQlJWD0TkmdTP7JXWWJr9
         6z53M/vORF+uUpyJs+5SIWWKCD1pNy3sKg/WvHjvOTyYGFOnI5AFkdgfuD5KFsVJlY8c
         s75IfREjPZ7FU2fVM8ydIOtf3PnU9dwi+MSN3N59pFNkFBYs8EKZuRnZKi4kdkdseWeF
         u7lWSL9QAcvFsDe1eWwGaW2gTuWfHI18mEMWHEM+kd1Q5i4Rzh8huhAt2C+IlViuhEY6
         Zxbw==
X-Gm-Message-State: AOJu0YwqUq0mppTjg07ExaNxFhmhZIWPdEptTWDO8droBA0qjr4VA56+
        gpNaXUaPGAFjuaaAKI8D3yV+qg==
X-Google-Smtp-Source: AGHT+IHTgHZKWR8m9u2lx0rcTpz+vGmzab0M/imuEXDxse1WPmxfU4cmlo1QRY52al01CRlGXI/Xfw==
X-Received: by 2002:a5d:4b47:0:b0:317:417e:a467 with SMTP id w7-20020a5d4b47000000b00317417ea467mr6910866wrs.6.1692717773127;
        Tue, 22 Aug 2023 08:22:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ca21:e0f4:e967:fd3d])
        by smtp.gmail.com with ESMTPSA id b14-20020a5d4b8e000000b0031434c08bb7sm16129920wrt.105.2023.08.22.08.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 08:22:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] HID: cp2112: make the irqchip immutable
Date:   Tue, 22 Aug 2023 17:22:44 +0200
Message-Id: <20230822152244.214394-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This make the GPIO irqchip exposed by the CP2112 driver use an immutable
irq_chip struct thus addressing the following warning on probe:

  (cp2112_gpio): not an immutable chip, please consider fixing it!

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-cp2112.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 27cadadda7c9..01f2a7211033 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -163,7 +163,6 @@ struct cp2112_device {
 	atomic_t read_avail;
 	atomic_t xfer_avail;
 	struct gpio_chip gc;
-	struct irq_chip irq;
 	u8 *in_out_buffer;
 	struct mutex lock;
 
@@ -1082,6 +1081,7 @@ static void cp2112_gpio_irq_mask(struct irq_data *d)
 	struct cp2112_device *dev = gpiochip_get_data(gc);
 
 	__clear_bit(d->hwirq, &dev->irq_mask);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void cp2112_gpio_irq_unmask(struct irq_data *d)
@@ -1089,6 +1089,7 @@ static void cp2112_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct cp2112_device *dev = gpiochip_get_data(gc);
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	__set_bit(d->hwirq, &dev->irq_mask);
 }
 
@@ -1228,6 +1229,18 @@ static int __maybe_unused cp2112_allocate_irq(struct cp2112_device *dev,
 	return ret;
 }
 
+static const struct irq_chip cp2112_irq_chip = {
+	.name		= "cp2112-gpio",
+	.irq_startup	= cp2112_gpio_irq_startup,
+	.irq_shutdown	= cp2112_gpio_irq_shutdown,
+	.irq_ack	= cp2112_gpio_irq_ack,
+	.irq_mask	= cp2112_gpio_irq_mask,
+	.irq_unmask	= cp2112_gpio_irq_unmask,
+	.irq_set_type	= cp2112_gpio_irq_type,
+	.flags		= IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct cp2112_device *dev;
@@ -1337,17 +1350,8 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.can_sleep		= 1;
 	dev->gc.parent			= &hdev->dev;
 
-	dev->irq.name = "cp2112-gpio";
-	dev->irq.irq_startup = cp2112_gpio_irq_startup;
-	dev->irq.irq_shutdown = cp2112_gpio_irq_shutdown;
-	dev->irq.irq_ack = cp2112_gpio_irq_ack;
-	dev->irq.irq_mask = cp2112_gpio_irq_mask;
-	dev->irq.irq_unmask = cp2112_gpio_irq_unmask;
-	dev->irq.irq_set_type = cp2112_gpio_irq_type;
-	dev->irq.flags = IRQCHIP_MASK_ON_SUSPEND;
-
 	girq = &dev->gc.irq;
-	girq->chip = &dev->irq;
+	gpio_irq_chip_set_chip(girq, &cp2112_irq_chip);
 	/* The event comes from the outside so no parent handler */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.39.2


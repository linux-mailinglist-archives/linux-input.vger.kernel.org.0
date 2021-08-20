Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D103F32CC
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 20:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbhHTSJL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 14:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44284 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235779AbhHTSJH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 14:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629482908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=apjmD1xneUA7925DyFY2dWBIVZwhAXCudJdH1Ujm/QA=;
        b=hVTaCRgaeAsuLx2Nh6F5yWU1DGLtNKcnlZRT6bifO4v4JwAMDuv7I2RlskT+Hg9EziZAql
        yVsrZKRN+WLFN2au0qpsgCF9086NdtKjtlO0+BmbAkN+nFAXU0eGw3W8WglaBlRcazSLg2
        jAYJaimab4VuZWwqXt4teH5tWKf0Iag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-XZd279OoNMqEMF5gYHXk4A-1; Fri, 20 Aug 2021 14:08:24 -0400
X-MC-Unique: XZd279OoNMqEMF5gYHXk4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88F7C8015C7;
        Fri, 20 Aug 2021 18:08:23 +0000 (UTC)
Received: from cmirabil.remote.csb (unknown [10.22.9.218])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 00EA05D9D5;
        Fri, 20 Aug 2021 18:08:21 +0000 (UTC)
From:   Charles Mirabile <cmirabil@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Charles Mirabile <cmirabil@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Serge Schneider <serge@raspberrypi.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenzju@redhat.com>,
        linux-rpi-kernel@lists.infradead.org, fedora-rpi@googlegroups.com,
        Mwesigwa Guma <mguma@redhat.com>,
        Joel Savitz <jsavitz@redhat.com>
Subject: [RFC PATCH vs 2/4] drivers/input/joystick: sensehat: Raspberry Pi Sense HAT joystick driver
Date:   Fri, 20 Aug 2021 14:07:59 -0400
Message-Id: <20210820180801.561119-3-cmirabil@redhat.com>
In-Reply-To: <20210820180801.561119-1-cmirabil@redhat.com>
References: <20210820180801.561119-1-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch implements support for the joystick.
It supports left/right/up/down/enter attached via i2c

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Mwesigwa Guma <mguma@redhat.com>
Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 drivers/input/joystick/Kconfig             |   8 ++
 drivers/input/joystick/Makefile            |   1 +
 drivers/input/joystick/sensehat-joystick.c | 124 +++++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 drivers/input/joystick/sensehat-joystick.c

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 3b23078bc7b5..d2f78353b74c 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -399,4 +399,12 @@ config JOYSTICK_N64
 	  Say Y here if you want enable support for the four
 	  built-in controller ports on the Nintendo 64 console.
 
+config JOYSTICK_SENSEHAT
+	tristate "Raspberry Pi Sense HAT joystick"
+	depends on GPIOLIB && INPUT
+	select MFD_SENSEHAT_CORE
+
+	help
+	  This is the joystick driver for the Raspberry Pi Sense HAT
+
 endif
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index 5174b8aba2dd..39c8b5c6e5ae 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
 obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
 obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
 obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
+obj-$(CONFIG_JOYSTICK_SENSEHAT)         += sensehat-joystick.o
 obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
 obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
 obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
diff --git a/drivers/input/joystick/sensehat-joystick.c b/drivers/input/joystick/sensehat-joystick.c
new file mode 100644
index 000000000000..4aca125bc29d
--- /dev/null
+++ b/drivers/input/joystick/sensehat-joystick.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Raspberry Pi Sense HAT joystick driver
+ * http://raspberrypi.org
+ *
+ * Copyright (C) 2015 Raspberry Pi
+ * Copyright (C) 2021 Charles Mirabile, Mwesigwa Guma, Joel Savitz
+ *
+ * Original Author: Serge Schneider
+ * Revised for upstream Linux by: Charles Mirabile, Mwesigwa Guma, Joel Savitz
+ */
+
+#include <linux/module.h>
+#include <linux/input.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/gpio/consumer.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/sensehat.h>
+
+static unsigned char keymap[] = {KEY_DOWN, KEY_RIGHT, KEY_UP, KEY_ENTER, KEY_LEFT,};
+
+static irqreturn_t sensehat_joystick_report(int n, void *cookie)
+{
+	int i;
+	static s32 prev_keys;
+	struct sensehat *sensehat = cookie;
+	struct sensehat_joystick *sensehat_joystick = &sensehat->joystick;
+	s32 keys = sensehat_get_joystick_state(sensehat);
+	s32 changes = keys ^ prev_keys;
+
+	prev_keys = keys;
+	for (i = 0; i < ARRAY_SIZE(keymap); ++i) {
+		if (changes & (1<<i)) {
+			input_report_key(sensehat_joystick->keys_dev,
+					 keymap[i], keys & (1<<i));
+		}
+	}
+	input_sync(sensehat_joystick->keys_dev);
+	return IRQ_HANDLED;
+}
+
+static int sensehat_joystick_probe(struct platform_device *pdev)
+{
+	int ret;
+	int i;
+	struct sensehat *sensehat = dev_get_drvdata(&pdev->dev);
+	struct sensehat_joystick *sensehat_joystick = &sensehat->joystick;
+
+	sensehat_joystick->keys_desc = devm_gpiod_get(&sensehat->i2c_client->dev,
+						"keys-int", GPIOD_IN);
+	if (IS_ERR(sensehat_joystick->keys_desc)) {
+		dev_warn(&pdev->dev, "Failed to get keys-int descriptor.\n");
+		return PTR_ERR(sensehat_joystick->keys_desc);
+	}
+
+
+	sensehat_joystick->keys_dev = devm_input_allocate_device(&pdev->dev);
+	if (!sensehat_joystick->keys_dev) {
+		dev_err(&pdev->dev, "Could not allocate input device.\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(keymap); i++) {
+		set_bit(keymap[i],
+			sensehat_joystick->keys_dev->keybit);
+	}
+
+	sensehat_joystick->keys_dev->name = "Raspberry Pi Sense HAT Joystick";
+	sensehat_joystick->keys_dev->phys = "rpi-sense-joy/input0";
+	sensehat_joystick->keys_dev->id.bustype = BUS_I2C;
+	sensehat_joystick->keys_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REP);
+	sensehat_joystick->keys_dev->keycode = keymap;
+	sensehat_joystick->keys_dev->keycodesize = sizeof(unsigned char);
+	sensehat_joystick->keys_dev->keycodemax = ARRAY_SIZE(keymap);
+
+	ret = input_register_device(sensehat_joystick->keys_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register input device.\n");
+		return ret;
+	}
+
+	ret = gpiod_direction_input(sensehat_joystick->keys_desc);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not set keys-int direction.\n");
+		return ret;
+	}
+
+	sensehat_joystick->keys_irq = gpiod_to_irq(sensehat_joystick->keys_desc);
+	if (sensehat_joystick->keys_irq < 0) {
+		dev_err(&pdev->dev, "Could not determine keys-int IRQ.\n");
+		return sensehat_joystick->keys_irq;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, sensehat_joystick->keys_irq,
+		NULL, sensehat_joystick_report, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+		"keys", sensehat);
+
+	if (ret) {
+		dev_err(&pdev->dev, "IRQ request failed.\n");
+		return ret;
+	}
+	return 0;
+}
+
+static struct platform_device_id sensehat_joystick_device_id[] = {
+	{ .name = "sensehat-joystick" },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, sensehat_joystick_device_id);
+
+static struct platform_driver sensehat_joystick_driver = {
+	.probe = sensehat_joystick_probe,
+	.driver = {
+		.name = "sensehat-joystick",
+	},
+};
+
+module_platform_driver(sensehat_joystick_driver);
+
+MODULE_DESCRIPTION("Raspberry Pi Sense HAT joystick driver");
+MODULE_AUTHOR("Serge Schneider <serge@raspberrypi.org>");
+MODULE_LICENSE("GPL");
-- 
2.27.0


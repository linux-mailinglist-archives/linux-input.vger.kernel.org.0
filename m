Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E5A45E5C
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 15:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfFNNhQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 09:37:16 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:55719 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbfFNNhQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 09:37:16 -0400
Received: from dell-desktop.home (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr [90.88.23.150])
        (Authenticated sender: mylene.josserand@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id F3057240008;
        Fri, 14 Jun 2019 13:37:07 +0000 (UTC)
From:   =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mylene.josserand@bootlin.com,
        thomas.petazzoni@bootlin.com
Subject: [PATCH v1] Input: rotary-encoder - Add gpio as push button
Date:   Fri, 14 Jun 2019 15:36:51 +0200
Message-Id: <20190614133651.28396-1-mylene.josserand@bootlin.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the support of a gpio that can be defined as a push button.
Thanks to that, it is possible to emit a keycode in case of a
"push" event, if the rotary supports that.

The keycode to emit is defined using "linux,code" property
(such as in gpio-keys).

Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
---
 .../devicetree/bindings/input/rotary-encoder.txt   |  5 +++
 drivers/input/misc/rotary_encoder.c                | 50 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.txt b/Documentation/devicetree/bindings/input/rotary-encoder.txt
index a644408b33b8..1cfce5d0b5c4 100644
--- a/Documentation/devicetree/bindings/input/rotary-encoder.txt
+++ b/Documentation/devicetree/bindings/input/rotary-encoder.txt
@@ -22,6 +22,9 @@ Optional properties:
 - wakeup-source: Boolean, rotary encoder can wake up the system.
 - rotary-encoder,encoding: String, the method used to encode steps.
   Supported are "gray" (the default and more common) and "binary".
+- push-gpio: a gpio to be used as a detection of a push from the rotary.
+- linux,code: keycode to emit with the push-gpio of this rotary encoder.
+  Required property in case "push-gpio"'s one is used.
 
 Deprecated properties:
 - rotary-encoder,half-period: Makes the driver work on half-period mode.
@@ -47,4 +50,6 @@ Example:
 			rotary-encoder,steps = <24>;
 			rotary-encoder,encoding = "binary";
 			rotary-encoder,rollover;
+			push-gpio = <&gpio 20 0>;
+			linux-code = <28> /* KEY_ENTER */
 		};
diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
index d748897bf5e9..556995fb7dde 100644
--- a/drivers/input/misc/rotary_encoder.c
+++ b/drivers/input/misc/rotary_encoder.c
@@ -47,8 +47,10 @@ struct rotary_encoder {
 	unsigned int pos;
 
 	struct gpio_descs *gpios;
+	struct gpio_desc *gpio_push;
 
 	unsigned int *irq;
+	unsigned int code;
 
 	bool armed;
 	signed char dir;	/* 1 - clockwise, -1 - CCW */
@@ -56,6 +58,23 @@ struct rotary_encoder {
 	unsigned int last_stable;
 };
 
+static irqreturn_t rotary_push_irq(int irq, void *dev_id)
+{
+	struct rotary_encoder *encoder = dev_id;
+	int val;
+
+	mutex_lock(&encoder->access_mutex);
+
+	val = gpiod_get_value_cansleep(encoder->gpio_push);
+
+	input_report_key(encoder->input, encoder->code, val);
+	input_sync(encoder->input);
+
+	mutex_unlock(&encoder->access_mutex);
+
+	return IRQ_HANDLED;
+}
+
 static unsigned int rotary_encoder_get_state(struct rotary_encoder *encoder)
 {
 	int i;
@@ -190,6 +209,7 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rotary_encoder *encoder;
 	struct input_dev *input;
+	unsigned int irq_push;
 	irq_handler_t handler;
 	u32 steps_per_period;
 	unsigned int i;
@@ -250,6 +270,20 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	encoder->gpio_push = devm_gpiod_get_optional(dev, "push", GPIOD_IN);
+	if (IS_ERR(encoder->gpio_push)) {
+		dev_err(dev, "unable to get gpio-push\n");
+		return PTR_ERR(encoder->gpio_push);
+	}
+
+	if (encoder->gpio_push) {
+		if (device_property_read_u32(dev, "linux,code",
+					     &encoder->code)) {
+			dev_err(dev, "gpio-push without keycode\n");
+			return -EINVAL;
+		}
+	}
+
 	input = devm_input_allocate_device(dev);
 	if (!input)
 		return -ENOMEM;
@@ -306,6 +340,22 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (encoder->gpio_push) {
+		input_set_capability(encoder->input, EV_KEY, encoder->code);
+
+		irq_push = gpiod_to_irq(encoder->gpio_push);
+		err = devm_request_threaded_irq(dev, irq_push,
+						NULL, rotary_push_irq,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						DRV_NAME, encoder);
+		if (err) {
+			dev_err(dev, "unable to request IRQ %d\n", irq_push);
+			return err;
+		}
+	}
+
 	err = input_register_device(input);
 	if (err) {
 		dev_err(dev, "failed to register input device\n");
-- 
2.11.0


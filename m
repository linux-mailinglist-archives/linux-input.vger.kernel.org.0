Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F45A2605D9
	for <lists+linux-input@lfdr.de>; Mon,  7 Sep 2020 22:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgIGUky (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Sep 2020 16:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbgIGUkx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Sep 2020 16:40:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B40AC061755;
        Mon,  7 Sep 2020 13:40:51 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 7F83A2911A7
Received: by jupiter.universe (Postfix, from userid 1000)
        id 0E8EA480118; Mon,  7 Sep 2020 22:40:47 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Myl=C3=A8ne=20Josserand?= 
        <mylene.josserand@collabora.com>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 4/4] Input: rotary-encoder - Add gpio as push button
Date:   Mon,  7 Sep 2020 22:40:45 +0200
Message-Id: <20200907204045.95530-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907204045.95530-1-sebastian.reichel@collabora.com>
References: <20200907204045.95530-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mylène Josserand <mylene.josserand@collabora.com>

Add the support of a gpio that can be defined as a push button.
Thanks to that, it is possible to emit a keycode in case of a
"push" event, if the rotary supports that.

The keycode to emit is defined using "linux,code" property
(such as in gpio-keys).

Signed-off-by: Mylène Josserand <mylene.josserand@collabora.com>
[code cleanup to current standards and renamed some properties]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/input/rotary-encoder.yaml        | 21 +++++++++
 drivers/input/misc/rotary_encoder.c           | 43 +++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.yaml b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
index 5b60ea86bd62..682fee104004 100644
--- a/Documentation/devicetree/bindings/input/rotary-encoder.yaml
+++ b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
@@ -74,6 +74,24 @@ properties:
       need to be passed.
     type: boolean
 
+  push-gpios:
+    description: GPIO used as a detection of a push from the rotary-encoder.
+    maxItems: 1
+
+  linux,push-code:
+    description:
+      keycode to emit with the push-gpio of this rotary encoder.
+      If not specified defaults to <28> == KEY_ENTER.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 28
+
+  linux,push-type:
+    description:
+      Specify event type this button/key generates.
+      If not specified defaults to <1> == EV_KEY.
+    $ref: /schemas/types.yaml#definitions/uint32
+    default: 1
+
 required:
   - compatible
   - gpios
@@ -97,4 +115,7 @@ examples:
             linux,axis = <ABS_Y>;
             rotary-encoder,encoding = "binary";
             rotary-encoder,rollover;
+            push-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
+            linux,push-code = <KEY_ENTER>;
+            linux,push-type = <EV_KEY>;
     };
diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
index 16ad86fad7cb..484042a5afa0 100644
--- a/drivers/input/misc/rotary_encoder.c
+++ b/drivers/input/misc/rotary_encoder.c
@@ -47,12 +47,33 @@ struct rotary_encoder {
 
 	unsigned int *irq;
 
+	struct gpio_desc *push_gpio;
+	unsigned int push_code;
+	unsigned int push_type;
+
 	bool armed;
 	signed char dir;	/* 1 - clockwise, -1 - CCW */
 
 	unsigned int last_stable;
 };
 
+static irqreturn_t rotary_push_irq(int irq, void *dev_id)
+{
+	struct rotary_encoder *encoder = dev_id;
+	int val;
+
+	mutex_lock(&encoder->access_mutex);
+
+	val = gpiod_get_value_cansleep(encoder->push_gpio);
+
+	input_report_key(encoder->input, encoder->push_code, val);
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
@@ -248,6 +269,16 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	encoder->push_gpio = devm_gpiod_get_optional(dev, "push", GPIOD_IN);
+	if (IS_ERR(encoder->push_gpio))
+		return dev_err_probe(dev, PTR_ERR(encoder->push_gpio), "failed to get push-gpio\n");
+
+	encoder->push_code = KEY_ENTER;
+	device_property_read_u32(dev, "linux,push-code", &encoder->push_code);
+
+	encoder->push_type = EV_KEY;
+	device_property_read_u32(dev, "linux,push-type", &encoder->push_type);
+
 	input = devm_input_allocate_device(dev);
 	if (!input)
 		return -ENOMEM;
@@ -304,6 +335,18 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (encoder->push_gpio) {
+		input_set_capability(encoder->input, encoder->push_type, encoder->push_code);
+		err = devm_request_threaded_irq(dev, gpiod_to_irq(encoder->push_gpio),
+						NULL, rotary_push_irq,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						DRV_NAME, encoder);
+		if (err)
+			return dev_err_probe(dev, err, "unable to request push IRQ\n");
+	}
+
 	err = input_register_device(input);
 	if (err) {
 		dev_err(dev, "failed to register input device\n");
-- 
2.28.0


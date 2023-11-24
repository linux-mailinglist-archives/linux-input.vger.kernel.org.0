Return-Path: <linux-input+bounces-227-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B6D7F6E63
	for <lists+linux-input@lfdr.de>; Fri, 24 Nov 2023 09:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B46C21C20DA7
	for <lists+linux-input@lfdr.de>; Fri, 24 Nov 2023 08:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070AB19D;
	Fri, 24 Nov 2023 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="deq8gQJo"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 368 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Nov 2023 00:39:14 PST
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45E1AD;
	Fri, 24 Nov 2023 00:39:13 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 5A57C60B1C;
	Fri, 24 Nov 2023 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1700814812;
	bh=X9UAYrEpltlL4BFSrotnsyJ28JU1NDy+XhYUgWFsj3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=deq8gQJoV8AuDJyfkujArZSATCptJGPR0oRvGeUQHKRlosVOvT+oW0d7diQ6tztdi
	 PgqjHJn6mqxEpebsOYh9vNXzAf0cgcnySdleHpY5arlQOCEKe68YzB+y9u+dMD2vJR
	 WhuxWudhbeaeCkdg/URqXQwtJ8w2In3hd7zSx5onHwfszgAcA6F5B62DF2M5pLZsgv
	 deaEPLf1R0VOS3sCQwk3FIGCTXhQvZrBdi7FMPyyst07aPjGnh5+uZTPQG1islIacA
	 riYzbWoxf8TfsNjPEqKHvN/RYuSmSiixjV9Z5KajH8QWWa+L41EHiA/nty5hFChEC4
	 75L2s+1h3F4eA==
From: Tony Lindgren <tony@atomide.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Dhruva Gole <d-gole@ti.com>
Subject: [PATCH v4 2/2] Input: gpio-keys - Add system suspend support for dedicated wakeirqs
Date: Fri, 24 Nov 2023 10:32:41 +0200
Message-ID: <20231124083241.40780-2-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124083241.40780-1-tony@atomide.com>
References: <20231124083241.40780-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoCs have a separate dedicated wake-up interrupt controller that can
be used to wake up the system from deeper idle states. We already support
configuring a separate interrupt for a gpio-keys button to be used with a
gpio line. However, we are lacking support system suspend for cases where
a separate interrupt needs to be used in deeper sleep modes.

Because of it's nature, gpio-keys does not know about the runtime PM state
of the button gpios, and may have several gpio buttons configured for each
gpio-keys device instance. Implementing runtime PM support for gpio-keys
does not help, and we cannot use drivers/base/power/wakeirq.c support. We
need to implement custom wakeirq support for gpio-keys.

For handling a dedicated wakeirq for system suspend, we enable and disable
it with gpio_keys_enable_wakeup() and gpio_keys_disable_wakeup() that we
already use based on device_may_wakeup().

Some systems may have a dedicated wakeirq that can also be used as the
main interrupt, this is already working for gpio-keys. Let's add some
wakeirq related comments while at it as the usage with a gpio line and
separate interrupt line may not be obvious.

Tested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

No changes from v1

---
 drivers/input/keyboard/gpio_keys.c | 69 ++++++++++++++++++++++++++++--
 include/linux/gpio_keys.h          |  2 +
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -45,7 +45,9 @@ struct gpio_button_data {
 	unsigned int software_debounce;	/* in msecs, for GPIO-driven buttons */
 
 	unsigned int irq;
+	unsigned int wakeirq;
 	unsigned int wakeup_trigger_type;
+
 	spinlock_t lock;
 	bool disabled;
 	bool key_pressed;
@@ -511,6 +513,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	struct gpio_button_data *bdata = &ddata->data[idx];
 	irq_handler_t isr;
 	unsigned long irqflags;
+	const char *wakedesc;
 	int irq;
 	int error;
 
@@ -575,6 +578,14 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 					!gpiod_cansleep(bdata->gpiod);
 		}
 
+		/*
+		 * If an interrupt was specified, use it instead of the gpio
+		 * interrupt and use the gpio for reading the state. A separate
+		 * interrupt may be used as the main button interrupt for
+		 * runtime PM to detect events also in deeper idle states. If a
+		 * dedicated wakeirq is used for system suspend only, see below
+		 * for bdata->wakeirq setup.
+		 */
 		if (button->irq) {
 			bdata->irq = button->irq;
 		} else {
@@ -672,6 +683,36 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		return error;
 	}
 
+	if (!button->wakeirq)
+		return 0;
+
+	/* Use :wakeup suffix like drivers/base/power/wakeirq.c does */
+	wakedesc = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", desc);
+	if (!wakedesc)
+		return -ENOMEM;
+
+	bdata->wakeirq = button->wakeirq;
+	irqflags |= IRQF_NO_SUSPEND;
+
+	/*
+	 * Wakeirq shares the handler with the main interrupt, it's only
+	 * active during system suspend. See gpio_keys_button_enable_wakeup()
+	 * and gpio_keys_button_disable_wakeup().
+	 */
+	error = devm_request_any_context_irq(dev, bdata->wakeirq, isr,
+					     irqflags, wakedesc, bdata);
+	if (error < 0) {
+		dev_err(dev, "Unable to claim wakeirq %d; error %d\n",
+			bdata->irq, error);
+		return error;
+	}
+
+	/*
+	 * Disable wakeirq until suspend. IRQF_NO_AUTOEN won't work if
+	 * IRQF_SHARED was set based on !button->can_disable.
+	 */
+	disable_irq_nosync(bdata->wakeirq);
+
 	return 0;
 }
 
@@ -728,7 +769,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 	struct gpio_keys_platform_data *pdata;
 	struct gpio_keys_button *button;
 	struct fwnode_handle *child;
-	int nbuttons;
+	int nbuttons, irq;
 
 	nbuttons = device_get_child_node_count(dev);
 	if (nbuttons == 0)
@@ -750,9 +791,19 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 	device_property_read_string(dev, "label", &pdata->name);
 
 	device_for_each_child_node(dev, child) {
-		if (is_of_node(child))
-			button->irq =
-				irq_of_parse_and_map(to_of_node(child), 0);
+		if (is_of_node(child)) {
+			irq = of_irq_get_byname(to_of_node(child), "irq");
+			if (irq > 0)
+				button->irq = irq;
+
+			irq = of_irq_get_byname(to_of_node(child), "wakeup");
+			if (irq > 0)
+				button->wakeirq = irq;
+
+			if (!button->irq && !button->wakeirq)
+				button->irq =
+					irq_of_parse_and_map(to_of_node(child), 0);
+		}
 
 		if (fwnode_property_read_u32(child, "linux,code",
 					     &button->code)) {
@@ -921,6 +972,11 @@ gpio_keys_button_enable_wakeup(struct gpio_button_data *bdata)
 		}
 	}
 
+	if (bdata->wakeirq) {
+		enable_irq(bdata->wakeirq);
+		disable_irq_nosync(bdata->irq);
+	}
+
 	return 0;
 }
 
@@ -929,6 +985,11 @@ gpio_keys_button_disable_wakeup(struct gpio_button_data *bdata)
 {
 	int error;
 
+	if (bdata->wakeirq) {
+		enable_irq(bdata->irq);
+		disable_irq_nosync(bdata->wakeirq);
+	}
+
 	/*
 	 * The trigger type is always both edges for gpio-based keys and we do
 	 * not support changing wakeup trigger for interrupt-based keys.
diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
--- a/include/linux/gpio_keys.h
+++ b/include/linux/gpio_keys.h
@@ -21,6 +21,7 @@ struct device;
  *			disable button via sysfs
  * @value:		axis value for %EV_ABS
  * @irq:		Irq number in case of interrupt keys
+ * @wakeirq:		Optional dedicated wake-up interrupt
  */
 struct gpio_keys_button {
 	unsigned int code;
@@ -34,6 +35,7 @@ struct gpio_keys_button {
 	bool can_disable;
 	int value;
 	unsigned int irq;
+	unsigned int wakeirq;
 };
 
 /**
-- 
2.42.1


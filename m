Return-Path: <linux-input+bounces-3559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 997E28BE679
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50AE5285898
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3993E165FD4;
	Tue,  7 May 2024 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4CKJ8Ee"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71EF161327;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=CtKUU8gsJyy4bvJiYEfF1ucs5SAe3t+LjtK/OaRG0oZ0plZF+zKgK5FG4i/e01E5rhOirjkKE9wPGQmoAVEuwX56OSNSB+zwTOmRBjOAIIMqyfxjqRVazQm3cG3is7DbYA8AUFvI66hs1zISt5WFEO26OvWe+mqZDJGKGBSCvgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=ZGUlbQ7dRiwmfFZzy/vMmEaZuterDFUAiXiGbZMveFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5PIuoftMDeTPnCzdpulsFy1lBmmlwQs/XX1QtfoTCju12X/FzudwRvtBcgQ0ygRChxVN936EStTENh9TbngENeVsxflGKQ5EDtZAkVnKIGM1nBxudKufGyq1qhFUAh46FeTarjr6DKU8UaiWLFbQR5bCLtMI2FVtST2WpSb4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4CKJ8Ee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F66C4DDE2;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=ZGUlbQ7dRiwmfFZzy/vMmEaZuterDFUAiXiGbZMveFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N4CKJ8Ee0uU2em/ltjSb1fiFRGxoQs8zPYUcsCRIxMH/ghJLUjHaeG3tsarobxthu
	 dK/qElcXQuqx633Yr4Bs1l61uSWeKwDb7YpxjGOh3+xK1rWDbZFMD/BdNEESPzrKaB
	 ETRuvZMxKq2e4Q0zum3KzTmnWVeTQGWgfAi7NJX6H+0+eb9AkGsg4RT5hillWXeWqw
	 8vkX0LzsajuIm+hcirkrlNxf3OGtlcGkZs+hLN34HTetOxClP1y3zR53O+rqJPPqYf
	 20Y68aLflCPOGkMaFIXxn33cXlorhAEzf4Ayz8qqIIpZ1AU24DQnyzixrPgFN8OdXD
	 UxDuC5SDbDBaA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7g-000000003Cu-2Pvk;
	Tue, 07 May 2024 16:48:52 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v2 4/7] HID: i2c-hid: elan: fix reset suspend current leakage
Date: Tue,  7 May 2024 16:48:18 +0200
Message-ID: <20240507144821.12275-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Elan eKTH5015M touch controller found on the Lenovo ThinkPad X13s
shares the VCC33 supply with other peripherals that may remain powered
during suspend (e.g. when enabled as wakeup sources).

The reset line is also wired so that it can be left deasserted when the
supply is off.

This is important as it avoids holding the controller in reset for
extended periods of time when it remains powered, which can lead to
increased power consumption, and also avoids leaking current through the
X13s reset circuitry during suspend (and after driver unbind).

Use the new 'no-reset-on-power-off' devicetree property to determine
when reset needs to be asserted on power down.

Notably this also avoids wasting power on machine variants without a
touchscreen for which the driver would otherwise exit probe with reset
asserted.

Fixes: bd3cba00dcc6 ("HID: i2c-hid: elan: Add support for Elan eKTH6915 i2c-hid touchscreens")
Cc: stable@vger.kernel.org	# 6.0
Cc: Douglas Anderson <dianders@chromium.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 59 +++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 5b91fb106cfc..091e37933225 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -31,6 +31,7 @@ struct i2c_hid_of_elan {
 	struct regulator *vcc33;
 	struct regulator *vccio;
 	struct gpio_desc *reset_gpio;
+	bool no_reset_on_power_off;
 	const struct elan_i2c_hid_chip_data *chip_data;
 };
 
@@ -40,17 +41,17 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *ops)
 		container_of(ops, struct i2c_hid_of_elan, ops);
 	int ret;
 
+	gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
+
 	if (ihid_elan->vcc33) {
 		ret = regulator_enable(ihid_elan->vcc33);
 		if (ret)
-			return ret;
+			goto err_deassert_reset;
 	}
 
 	ret = regulator_enable(ihid_elan->vccio);
-	if (ret) {
-		regulator_disable(ihid_elan->vcc33);
-		return ret;
-	}
+	if (ret)
+		goto err_disable_vcc33;
 
 	if (ihid_elan->chip_data->post_power_delay_ms)
 		msleep(ihid_elan->chip_data->post_power_delay_ms);
@@ -60,6 +61,15 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *ops)
 		msleep(ihid_elan->chip_data->post_gpio_reset_on_delay_ms);
 
 	return 0;
+
+err_disable_vcc33:
+	if (ihid_elan->vcc33)
+		regulator_disable(ihid_elan->vcc33);
+err_deassert_reset:
+	if (ihid_elan->no_reset_on_power_off)
+		gpiod_set_value_cansleep(ihid_elan->reset_gpio, 0);
+
+	return ret;
 }
 
 static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
@@ -67,7 +77,14 @@ static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
 	struct i2c_hid_of_elan *ihid_elan =
 		container_of(ops, struct i2c_hid_of_elan, ops);
 
-	gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
+	/*
+	 * Do not assert reset when the hardware allows for it to remain
+	 * deasserted regardless of the state of the (shared) power supply to
+	 * avoid wasting power when the supply is left on.
+	 */
+	if (!ihid_elan->no_reset_on_power_off)
+		gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
+
 	if (ihid_elan->chip_data->post_gpio_reset_off_delay_ms)
 		msleep(ihid_elan->chip_data->post_gpio_reset_off_delay_ms);
 
@@ -79,6 +96,7 @@ static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
 static int i2c_hid_of_elan_probe(struct i2c_client *client)
 {
 	struct i2c_hid_of_elan *ihid_elan;
+	int ret;
 
 	ihid_elan = devm_kzalloc(&client->dev, sizeof(*ihid_elan), GFP_KERNEL);
 	if (!ihid_elan)
@@ -93,21 +111,38 @@ static int i2c_hid_of_elan_probe(struct i2c_client *client)
 	if (IS_ERR(ihid_elan->reset_gpio))
 		return PTR_ERR(ihid_elan->reset_gpio);
 
+	ihid_elan->no_reset_on_power_off = of_property_read_bool(client->dev.of_node,
+						"no-reset-on-power-off");
+
 	ihid_elan->vccio = devm_regulator_get(&client->dev, "vccio");
-	if (IS_ERR(ihid_elan->vccio))
-		return PTR_ERR(ihid_elan->vccio);
+	if (IS_ERR(ihid_elan->vccio)) {
+		ret = PTR_ERR(ihid_elan->vccio);
+		goto err_deassert_reset;
+	}
 
 	ihid_elan->chip_data = device_get_match_data(&client->dev);
 
 	if (ihid_elan->chip_data->main_supply_name) {
 		ihid_elan->vcc33 = devm_regulator_get(&client->dev,
 						      ihid_elan->chip_data->main_supply_name);
-		if (IS_ERR(ihid_elan->vcc33))
-			return PTR_ERR(ihid_elan->vcc33);
+		if (IS_ERR(ihid_elan->vcc33)) {
+			ret = PTR_ERR(ihid_elan->vcc33);
+			goto err_deassert_reset;
+		}
 	}
 
-	return i2c_hid_core_probe(client, &ihid_elan->ops,
-				  ihid_elan->chip_data->hid_descriptor_address, 0);
+	ret = i2c_hid_core_probe(client, &ihid_elan->ops,
+				 ihid_elan->chip_data->hid_descriptor_address, 0);
+	if (ret)
+		goto err_deassert_reset;
+
+	return 0;
+
+err_deassert_reset:
+	if (ihid_elan->no_reset_on_power_off)
+		gpiod_set_value_cansleep(ihid_elan->reset_gpio, 0);
+
+	return ret;
 }
 
 static const struct elan_i2c_hid_chip_data elan_ekth6915_chip_data = {
-- 
2.43.2



Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA23B406060
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 02:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhIJARO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Sep 2021 20:17:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:43072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229614AbhIJARN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Sep 2021 20:17:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C64346115A;
        Fri, 10 Sep 2021 00:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631232963;
        bh=3UkuJGy2kC4xGVB97VarghCWxDaAkzuRK7CddsaqhyE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q0lfCBgcuhSCgVmNQpl5si00LPT/wBkru1Nrg9xWi3E/eezd3hbL33us0S98HiByY
         aIgjHezBG/8z9nbCM9Xm+VhPKax1p8J/Z+6WUdLHgIK48V20bDKqExOoJmwolTc5aS
         ttAFNEAfu7xpIPhUqhmzycUizFgZlssz5Y28KrMNcWxAz6o39YO+E1q1NsWsxbRBpS
         YjOCSEoJbbptlfDSSQuURuibVtsLg+yJQ219fqbI6UVcuCYBzFTTyWEv5C8hHwdkbW
         8VeWW2ud/N24azf2kclDRDGWUWD5YjWzWCInnaWUBwQqViZJ34ajILSXyf3uitctvi
         nE4qMPrWdvatQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 03/99] HID: i2c-hid: goodix: Tie the reset line to true state of the regulator
Date:   Thu,  9 Sep 2021 20:14:22 -0400
Message-Id: <20210910001558.173296-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit 18eeef46d3593e3bc3d6a8f7a6f94ace356578ff ]

The regulator for the touchscreen could be:
* A dedicated regulator just for the touchscreen.
* A regulator shared with something else in the system.
* An always-on regulator.

How we want the "reset" line to behave depends a bit on which of those
three cases we're in. Currently the code is written with the
assumption that it has a dedicated regulator, but that's not really
guaranteed to be the case.

The problem we run into is that if we leave the touchscreen powered on
(because someone else is requesting the regulator or it's an always-on
regulator) and we assert reset then we apparently burn an extra 67 mW
of power. That's not great.

Let's instead tie the control of the reset line to the true state of
the regulator as reported by regulator notifiers. If we have an
always-on regulator our notifier will never be called. If we have a
shared regulator then our notifier will be called when the touchscreen
is truly turned on or truly turned off.

Using notifiers like this nicely handles all the cases without
resorting to hacks like pretending that there is no "reset" GPIO if we
have an always-on regulator.

NOTE: if the regulator is on a shared line it's still possible that
things could be a little off. Specifically, this case is not handled
even after this patch:
1. Suspend goodix (send "sleep", goodix stops requesting regulator on)
2. Other regulator user turns off (regulator fully turns off).
3. Goodix driver gets notified and asserts reset.
4. Other regulator user turns on.
5. Goodix driver gets notified and deasserts reset.
6. Nobody resumes goodix.

With that set of steps we'll have reset deasserted but we will have
lost the results of the I2C_HID_PWR_SLEEP from the suspend path. That
means we might be in higher power than we could be even if the goodix
driver thinks things are suspended. Presumably, however, we're still
in better shape than if we were asserting "reset" the whole time. If
somehow the above situation is actually affecting someone and we want
to do better we can deal with it when we have a real use case.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 92 +++++++++++++++++++++----
 1 file changed, 79 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index ee0225982a82..31a4c229fdb7 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -26,28 +26,29 @@ struct i2c_hid_of_goodix {
 	struct i2chid_ops ops;
 
 	struct regulator *vdd;
+	struct notifier_block nb;
+	struct mutex regulator_mutex;
 	struct gpio_desc *reset_gpio;
 	const struct goodix_i2c_hid_timing_data *timings;
 };
 
-static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
+static void goodix_i2c_hid_deassert_reset(struct i2c_hid_of_goodix *ihid_goodix,
+					  bool regulator_just_turned_on)
 {
-	struct i2c_hid_of_goodix *ihid_goodix =
-		container_of(ops, struct i2c_hid_of_goodix, ops);
-	int ret;
-
-	ret = regulator_enable(ihid_goodix->vdd);
-	if (ret)
-		return ret;
-
-	if (ihid_goodix->timings->post_power_delay_ms)
+	if (regulator_just_turned_on && ihid_goodix->timings->post_power_delay_ms)
 		msleep(ihid_goodix->timings->post_power_delay_ms);
 
 	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 0);
 	if (ihid_goodix->timings->post_gpio_reset_delay_ms)
 		msleep(ihid_goodix->timings->post_gpio_reset_delay_ms);
+}
 
-	return 0;
+static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
+{
+	struct i2c_hid_of_goodix *ihid_goodix =
+		container_of(ops, struct i2c_hid_of_goodix, ops);
+
+	return regulator_enable(ihid_goodix->vdd);
 }
 
 static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
@@ -55,20 +56,54 @@ static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
 	struct i2c_hid_of_goodix *ihid_goodix =
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 
-	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
 	regulator_disable(ihid_goodix->vdd);
 }
 
+static int ihid_goodix_vdd_notify(struct notifier_block *nb,
+				    unsigned long event,
+				    void *ignored)
+{
+	struct i2c_hid_of_goodix *ihid_goodix =
+		container_of(nb, struct i2c_hid_of_goodix, nb);
+	int ret = NOTIFY_OK;
+
+	mutex_lock(&ihid_goodix->regulator_mutex);
+
+	switch (event) {
+	case REGULATOR_EVENT_PRE_DISABLE:
+		gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+		break;
+
+	case REGULATOR_EVENT_ENABLE:
+		goodix_i2c_hid_deassert_reset(ihid_goodix, true);
+		break;
+
+	case REGULATOR_EVENT_ABORT_DISABLE:
+		goodix_i2c_hid_deassert_reset(ihid_goodix, false);
+		break;
+
+	default:
+		ret = NOTIFY_DONE;
+		break;
+	}
+
+	mutex_unlock(&ihid_goodix->regulator_mutex);
+
+	return ret;
+}
+
 static int i2c_hid_of_goodix_probe(struct i2c_client *client,
 				   const struct i2c_device_id *id)
 {
 	struct i2c_hid_of_goodix *ihid_goodix;
-
+	int ret;
 	ihid_goodix = devm_kzalloc(&client->dev, sizeof(*ihid_goodix),
 				   GFP_KERNEL);
 	if (!ihid_goodix)
 		return -ENOMEM;
 
+	mutex_init(&ihid_goodix->regulator_mutex);
+
 	ihid_goodix->ops.power_up = goodix_i2c_hid_power_up;
 	ihid_goodix->ops.power_down = goodix_i2c_hid_power_down;
 
@@ -84,6 +119,37 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client,
 
 	ihid_goodix->timings = device_get_match_data(&client->dev);
 
+	/*
+	 * We need to control the "reset" line in lockstep with the regulator
+	 * actually turning on an off instead of just when we make the request.
+	 * This matters if the regulator is shared with another consumer.
+	 * - If the regulator is off then we must assert reset. The reset
+	 *   line is active low and on some boards it could cause a current
+	 *   leak if left high.
+	 * - If the regulator is on then we don't want reset asserted for very
+	 *   long. Holding the controller in reset apparently draws extra
+	 *   power.
+	 */
+	mutex_lock(&ihid_goodix->regulator_mutex);
+	ihid_goodix->nb.notifier_call = ihid_goodix_vdd_notify;
+	ret = regulator_register_notifier(ihid_goodix->vdd, &ihid_goodix->nb);
+	if (ret) {
+		mutex_unlock(&ihid_goodix->regulator_mutex);
+		return dev_err_probe(&client->dev, ret,
+			"regulator notifier request failed\n");
+	}
+
+	/*
+	 * If someone else is holding the regulator on (or the regulator is
+	 * an always-on one) we might never be told to deassert reset. Do it
+	 * now. Here we'll assume that someone else might have _just
+	 * barely_ turned the regulator on so we'll do the full
+	 * "post_power_delay" just in case.
+	 */
+	if (ihid_goodix->reset_gpio && regulator_is_enabled(ihid_goodix->vdd))
+		goodix_i2c_hid_deassert_reset(ihid_goodix, true);
+	mutex_unlock(&ihid_goodix->regulator_mutex);
+
 	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001);
 }
 
-- 
2.30.2


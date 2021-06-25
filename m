Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306273B4676
	for <lists+linux-input@lfdr.de>; Fri, 25 Jun 2021 17:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbhFYPV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Jun 2021 11:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYPV0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Jun 2021 11:21:26 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8D0C061766
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 08:19:04 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id p9so7840587pgb.1
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYXfHZ621u1RKXLl6fRVJ5qE+Ta1mKaJ04yv+bL3cZM=;
        b=fElIZVV9zJ5EbpAzGjhWJ974z9nJG/IlwupqN1aYKTdJGEM1+A4PWgy+BDUfZyl+Op
         tpPZqRZYesdfaSjGLC2NY1hyFU+cAHoEdOSPSzCiHxWvaISGZx7XF47dTkIE/AbbULCc
         vEUcXHGszPvP4ZIgz+uhTatwuApAUyBY8bOww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYXfHZ621u1RKXLl6fRVJ5qE+Ta1mKaJ04yv+bL3cZM=;
        b=lLxQ+45VsRja0uJk9I5rwQoodQjZN9QJbaskeWKNle4JxEUNce7djAqjTfrLy2S/RD
         X2BfUQGtA31ZZS90ZAmIEFuCsF84PJ+JnbbD8tMrcrqpohWsJE4e5w9tHY8Y3IP1Y1uA
         EpBaaDTHi4QEi8diLW6V0pka2Ww0f1ehzqe6MYzYcHdEtEp6jb/eIaTZTTJrVZZU5wvu
         WT3TtYpptUJRBCGB89yw9ktyrb15mfHWl2mbGtg4anDhORHgUxVqbe4XMrc4HNpkDemZ
         cdGmUqZ8lbdViMj9/3md0+YNZovieKRCLKgsQJbC9IZ+EEXEhR7TJm3WfHS56HM+i9GG
         UZPg==
X-Gm-Message-State: AOAM533wTkkiA2mzRk5u03ud1O78zfWjAaq5ttCdtJO5okpw7owhQrRj
        OtBjJsto7Oxx3u2FZixkzvgmUw==
X-Google-Smtp-Source: ABdhPJyLf0gK5OV/R74bM1YQmGfHnzB9zzX4T8MUiMNVrYeGBOizHd2ZtDhIRFLsGyG3GZMdFNfWSg==
X-Received: by 2002:a63:db43:: with SMTP id x3mr10054474pgi.383.1624634344441;
        Fri, 25 Jun 2021 08:19:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:cbea:f502:729d:7fa5])
        by smtp.gmail.com with ESMTPSA id t3sm6205024pfl.44.2021.06.25.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 08:19:04 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: i2c-hid: goodix: Tie the reset line to true state of the regulator
Date:   Fri, 25 Jun 2021 08:18:36 -0700
Message-Id: <20210625081818.v2.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
---

Changes in v2:
- Drop the lock before returning in error case

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
2.32.0.93.g670b81a890-goog


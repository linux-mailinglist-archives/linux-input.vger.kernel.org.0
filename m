Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6765B9143
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 01:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiINX6s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 19:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiINX6O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 19:58:14 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1FD89829
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:13 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id h194so11834859iof.4
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bZ+qtxPfho04MrKrUszJh9/TiBJm28a0YpVnjrNGpL8=;
        b=Z1Mz0AVWyZV1x9kWPMTtSH9m15d65yOz28rOukX+iiKK5sxgljOg3AjuAL/fLsty0o
         Fwa0dv08IN+GgMhpT+RyBQm3sV+RzvmA8dqscyc/19CjC4pLE94A2fFRclaQAS0I46JL
         UdrAR6GegAHt4ty+yIDzUTVeFW3q5rZ9lWSWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bZ+qtxPfho04MrKrUszJh9/TiBJm28a0YpVnjrNGpL8=;
        b=OZB4oUPpgyIzlnocj7Ou2UyrbIWk45rUAJNUXqKdaQ0cZyp15+oblQgP0nlSu3IZgr
         6L2a6eIP6INwDhKOpL5vyKUonwV28gdLKOfOqOCf3lZk61j+Z3k7Ff8LYWUpb1kHyC5e
         FKaqfLbLY1qB+NCX1sfdbij5c/Jhipt9BVd/iM2j3HmsrDyf3hYA/Op6ABgW3LjjSX09
         dql2Yrlrdethw+udbDrUccfTg8D+yxjHg3lGPefNzAixFZxhXvLVSDfLiTgwYSAxF9oL
         V/d4HBQIUxtfMhKD4KabfhqDk/Kt5vTZ3av3jZWsXFS5OYB0vo6uYDeZe3drv8Z/MxJA
         VV/A==
X-Gm-Message-State: ACgBeo0P7wBJVvt0LBvrIgwms4tgEUdR2GAlnf4ytHxsJuXSbvwRdQB3
        TGTqMhVVSSa8dyY/IB9UFLu7Ng==
X-Google-Smtp-Source: AA6agR70f91KueYcy3vW2OijG0ZdXL3W9DFkLxN83/mUwr80g2n2bX09vzEmq41z5yQX9KMMR9ZMag==
X-Received: by 2002:a6b:3f08:0:b0:6a1:ebef:805f with SMTP id m8-20020a6b3f08000000b006a1ebef805fmr1796981ioa.116.1663199892392;
        Wed, 14 Sep 2022 16:58:12 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id a14-20020a027a0e000000b0034c0e8829c0sm353721jac.0.2022.09.14.16.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 16:58:11 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     jingle.wu@emc.com.tw, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, mario.limonciello@amd.com,
        hdegoede@redhat.com, linus.walleij@linaro.org, timvp@google.com,
        dmitry.torokhov@gmail.com, Raul E Rangel <rrangel@chromium.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/13] Input: raydium_ts_i2c - Use PM subsystem to manage wake irq
Date:   Wed, 14 Sep 2022 17:57:52 -0600
Message-Id: <20220914155914.v3.4.I06b417b274bbecb31775a73993a7a3c1bc80de7b@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220914235801.1731478-1-rrangel@chromium.org>
References: <20220914235801.1731478-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The raydium I2C touchscreen driver is currently manually managing the
wake IRQ. This change removes the explicit enable_irq_wake /
disable_irq_wake and instead relies on the PM subsystem. This is done by
calling dev_pm_set_wake_irq.

i2c_device_probe already calls dev_pm_set_wake_irq when using device
tree, and i2c_device_remove also already calls dev_pm_clear_wake_irq.
There could be some device tree systems that have incorrectly declared
`wake` capabilities, so this change will set the wake irq if one is
missing. This matches the previous behavior.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

(no changes since v2)

Changes in v2:
- Added raydium_ts_i2c to series

 drivers/input/touchscreen/raydium_i2c_ts.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 3a4952935366f9..66c5b577b791d4 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -21,6 +21,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <asm/unaligned.h>
@@ -134,8 +135,6 @@ struct raydium_data {
 	u8 pkg_size;
 
 	enum raydium_boot_mode boot_mode;
-
-	bool wake_irq_enabled;
 };
 
 /*
@@ -1186,6 +1185,15 @@ static int raydium_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
+	/*
+	 * The wake IRQ should be declared via device tree instead of assuming
+	 * the IRQ can wake the system. This is here for legacy reasons and
+	 * will be removed once the i2c-core supports querying ACPI for wake
+	 * capabilities.
+	 */
+	if (!client->dev.power.wakeirq)
+		dev_pm_set_wake_irq(&client->dev, client->irq);
+
 	error = devm_device_add_group(&client->dev,
 				   &raydium_i2c_attribute_group);
 	if (error) {
@@ -1222,8 +1230,6 @@ static int __maybe_unused raydium_i2c_suspend(struct device *dev)
 
 	if (device_may_wakeup(dev)) {
 		raydium_enter_sleep(client);
-
-		ts->wake_irq_enabled = (enable_irq_wake(client->irq) == 0);
 	} else {
 		raydium_i2c_power_off(ts);
 	}
@@ -1237,8 +1243,6 @@ static int __maybe_unused raydium_i2c_resume(struct device *dev)
 	struct raydium_data *ts = i2c_get_clientdata(client);
 
 	if (device_may_wakeup(dev)) {
-		if (ts->wake_irq_enabled)
-			disable_irq_wake(client->irq);
 		raydium_i2c_sw_reset(client);
 	} else {
 		raydium_i2c_power_on(ts);
-- 
2.37.3.968.ga6b4b080e4-goog


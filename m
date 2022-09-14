Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B825B913B
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 01:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiINX6O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 19:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiINX6K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 19:58:10 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92FF895EB
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:09 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id b23so13517066iof.2
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FeCM68gkQ9FF2bI4ULoqKrlayWCcShzPlt5I44au1/c=;
        b=WwUIlBW2sig7QIamYBwg73LnJKD+Q9o8vhKwbMERgHTclYfel0/TF852uzMVCFjU3l
         BjnIrrNSZXJ0OF5+ZRPoyjG/jDcPrNwFP5trRbFuko7skJuGhClIWa1EqXS7ByWBQ2zI
         kVzWFLH1uTj9JPViW5z8GNxNaKXwLCsIFpYPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FeCM68gkQ9FF2bI4ULoqKrlayWCcShzPlt5I44au1/c=;
        b=beLge85vhW0EuUxZnFob+Qk4VrCuOZ+AbYKDDpZqQwpC8x5PgiMGMJ2akLg2/bebR5
         FUxXX2IjHCquM+rulH9kxFBGv22/Y709wgR08DhQ+lIAZ9y+bvA7RslNe0W+0N1UCZTV
         bHkLXh2XZ+FZwA0LN2JpZg7+XN7WLJPqcryTs3W4HqkU2YSS5yITrkAfU0+0lp0/gMzM
         w/X5B3mZJYp8BUJRd5WWMJ9tRSfbNeb6MHb0BQ8A740tZq9/Gkw4HJwfdM9uhiwruNYV
         8IS18EI/qzIokrmecCqeRoCZ4dMiIQqDz1nu1zb1ukGEgs7ZlJsnk2O3ezHpxgOqiCdC
         KxKg==
X-Gm-Message-State: ACgBeo1gmSnHTX6yD0PBNCIJod87R2s60Jbgrq4dsX9q0uEB6LNfrKz3
        NdStBixuKIYWsS12Wkl/jqA70A==
X-Google-Smtp-Source: AA6agR7uCyzIsdzm4G24LKdVf+tpy2liBA3YlXhpjZjCHqSBfRdi/8ekYE4tng2DP3z6nBBdASTu6g==
X-Received: by 2002:a05:6638:264b:b0:35a:79c0:932d with SMTP id n11-20020a056638264b00b0035a79c0932dmr735569jat.116.1663199889258;
        Wed, 14 Sep 2022 16:58:09 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id a14-20020a027a0e000000b0034c0e8829c0sm353721jac.0.2022.09.14.16.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 16:58:08 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     jingle.wu@emc.com.tw, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, mario.limonciello@amd.com,
        hdegoede@redhat.com, linus.walleij@linaro.org, timvp@google.com,
        dmitry.torokhov@gmail.com, Raul E Rangel <rrangel@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] Input: elan_i2c - Use PM subsystem to manage wake irq
Date:   Wed, 14 Sep 2022 17:57:50 -0600
Message-Id: <20220914155914.v3.2.Id022caf53d01112188308520915798f08a33cd3e@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220914235801.1731478-1-rrangel@chromium.org>
References: <20220914235801.1731478-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Elan I2C touchpad driver is currently manually managing the wake
IRQ. This change removes the explicit enable_irq_wake/disable_irq_wake
and instead relies on the PM subsystem. This is done by calling
dev_pm_set_wake_irq.

i2c_device_probe already calls dev_pm_set_wake_irq when using device
tree, and i2c_device_remove also already calls dev_pm_clear_wake_irq.
There could be some device tree systems that have incorrectly declared
`wake` capabilities, so this change will set the wake irq if one is
missing. This matches the previous behavior.

I tested this on an ACPI system where the touchpad doesn't have _PRW
defined. I verified I can still wake the system and that the wake source
was the touchpad IRQ GPIO.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

(no changes since v2)

Changes in v2:
- Set the wake_irq when not configured by the i2c-core. This is
  different than v1, where the wake_irq was only set for non DT systems.

 drivers/input/mouse/elan_i2c_core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index e1758d5ffe4218..3947474e93d16a 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -33,6 +33,7 @@
 #include <linux/jiffies.h>
 #include <linux/completion.h>
 #include <linux/of.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <asm/unaligned.h>
@@ -86,8 +87,6 @@ struct elan_tp_data {
 	u16			fw_page_size;
 	u32			fw_signature_address;
 
-	bool			irq_wake;
-
 	u8			min_baseline;
 	u8			max_baseline;
 	bool			baseline_ready;
@@ -1340,6 +1339,15 @@ static int elan_probe(struct i2c_client *client,
 	if (!dev->of_node)
 		device_init_wakeup(dev, true);
 
+	/*
+	 * The wake IRQ should be declared via device tree instead of assuming
+	 * the IRQ can wake the system. This is here for legacy reasons and
+	 * will be removed once the i2c-core supports querying ACPI for wake
+	 * capabilities.
+	 */
+	if (!dev->power.wakeirq)
+		dev_pm_set_wake_irq(dev, client->irq);
+
 	return 0;
 }
 
@@ -1362,8 +1370,6 @@ static int __maybe_unused elan_suspend(struct device *dev)
 
 	if (device_may_wakeup(dev)) {
 		ret = elan_sleep(data);
-		/* Enable wake from IRQ */
-		data->irq_wake = (enable_irq_wake(client->irq) == 0);
 	} else {
 		ret = elan_set_power(data, false);
 		if (ret)
@@ -1394,9 +1400,6 @@ static int __maybe_unused elan_resume(struct device *dev)
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
 		}
-	} else if (data->irq_wake) {
-		disable_irq_wake(client->irq);
-		data->irq_wake = false;
 	}
 
 	error = elan_set_power(data, true);
-- 
2.37.3.968.ga6b4b080e4-goog


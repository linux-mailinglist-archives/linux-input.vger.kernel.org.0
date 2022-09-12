Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 799D85B6357
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 00:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiILWNy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Sep 2022 18:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiILWNw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Sep 2022 18:13:52 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4280A4D4EB
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 15:13:48 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id q83so6084175iod.7
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 15:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Gf/3wLxxzq93wvmkmOpA2yiovGrE9tHMsIP2zTcl2ts=;
        b=lFfseaXQJH1bT742nSwr4guESqvskBe24hwVx7Z7fdEkTdu7YKTR+/rNUpty0X9J/k
         vTawyfTzxjEcErwzn+O9o+LQs+xE30QNNE7m0UaOkjRN53X2n0sTt74x156OvtCZKghl
         bvMdxG+bOOYarNUHcRRcHXsWZkNis1JF9M6Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gf/3wLxxzq93wvmkmOpA2yiovGrE9tHMsIP2zTcl2ts=;
        b=Z+ccb0vG2fXAuggpLBT88iQ4MvTsg7DeqOdOj7uRrbKxAg57Lh6H3ubIr/3ci4/RNE
         2JD2n1Imhd5ULdG9TImZKK/NuyJNeTdp4pcMck0fZ7VOYF2EQfzY/o7eO2FZ0BIfLhj7
         /PwM//omy5glUySYBcy+Bju4Kz3ORBJdUQP3bPteRk8SqXIzpdQucBE5yHurlv4M8lUc
         TyFlivFkMbc0O0mzjkcH4G/2YYGKIEP4x2nZDmVAV9x8O9hJHSbVUQTqSlblGuu8cFbv
         +jr0q3gJRk8fhY/06avmy1RmgNI6Ip54tPTCW1zNj7qJZSpUoiuj0JXMzywN/ljX9Aub
         oM0A==
X-Gm-Message-State: ACgBeo3N46RIAaILkeRC2lntSySZw9hdY3KNmXfpY50AwNPASdhabTVl
        b5sAVnqsxmAXu3xna+czPRd2Tw==
X-Google-Smtp-Source: AA6agR7rRz34XTvX2YXxhhw11bbiJQl0wFlxBM4acYP8+Y7E2STS/cJhgIQdp5RdV37E9SF2PQGEGg==
X-Received: by 2002:a05:6638:3828:b0:35a:415e:fb8f with SMTP id i40-20020a056638382800b0035a415efb8fmr2796791jav.71.1663020827345;
        Mon, 12 Sep 2022 15:13:47 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id 18-20020a056e020cb200b002f16e7021f6sm4077334ilg.22.2022.09.12.15.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 15:13:46 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, jingle.wu@emc.com.tw,
        mario.limonciello@amd.com, timvp@google.com,
        linus.walleij@linaro.org, hdegoede@redhat.com, rafael@kernel.org,
        Raul E Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] Input: elan_i2c - Use PM subsystem to manage wake irq
Date:   Mon, 12 Sep 2022 16:13:06 -0600
Message-Id: <20220912160931.v2.2.Id022caf53d01112188308520915798f08a33cd3e@changeid>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220912221317.2775651-1-rrangel@chromium.org>
References: <20220912221317.2775651-1-rrangel@chromium.org>
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
2.37.2.789.g6183377224-goog


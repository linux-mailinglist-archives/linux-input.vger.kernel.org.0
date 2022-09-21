Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6505C032C
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 18:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbiIUQAs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 12:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbiIUP76 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 11:59:58 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD068BCA4
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:53:21 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id k9so3335308ils.12
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uLFsVomnZ3NOv94HIF7hfztjoJa5WoPp5LmQm5BO1Bo=;
        b=O6tqmj45Spb7X3ZoyObvQBcCU4s7qL9NiJJxoNs7Q9/xEpkjceGH08uJnsmGNyUPuz
         xQ+YtfY9IjBhD0lEdm0hxVfzAFv28LoymxsipYDB74khtXJWnnvSg/hw5dfpm9ZlPT0y
         uocBxTa36EUl8Na7frHwUeQDnrg8XXWBeGmUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uLFsVomnZ3NOv94HIF7hfztjoJa5WoPp5LmQm5BO1Bo=;
        b=TgMRVCAcPV1w5L5WamsoVvVow+otNLEVR3JUxmAgtHgUoGH/pDcSsnXnxNiYJW/uee
         t9FM3MuolukaVd/8pzUTAZTR3+D/u2whINfU4GGH0p/7++gEqDHT+eIdDxIua5QaEg38
         fmbpLAxsIOLXTVbzrTFC8SysEO+OXdD2GVMPh1jMRf8zZGIBnPZDT1MMkz2Wuw3zjOgU
         d4bcHqIzp2bQYl9sbfZPlZbfpedltvCR0KP/gWhPAesPFYm3u5hi5KO+mbs3/pe4XNoo
         5+N601V8qzGz065xG9fqwXU/kRFXmp9eASDRvD51eJm8zhlkX2ipRTXW8OUCBtTsaRXA
         l2CA==
X-Gm-Message-State: ACrzQf3m404RfJrroULHt51zGjGPOUF/i68Ou6Wf/xErunv+y9qNf4TB
        tjh1xF2jDP+UIQnsYMcsVn6Spw==
X-Google-Smtp-Source: AMsMyM77cC0aAph6/2CCkbrI9fOLUbmaAc6wstab/vTUVuUtZUk/2Lop5RRn6wgBxooER+YOjNg/RQ==
X-Received: by 2002:a92:dcc2:0:b0:2e4:38f2:a9f6 with SMTP id b2-20020a92dcc2000000b002e438f2a9f6mr6283206ilr.130.1663775532851;
        Wed, 21 Sep 2022 08:52:12 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id c14-20020a023b0e000000b0035a8d644a31sm1148061jaa.117.2022.09.21.08.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 08:52:12 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, jingle.wu@emc.com.tw,
        hdegoede@redhat.com, mario.limonciello@amd.com,
        linus.walleij@linaro.org, Raul E Rangel <rrangel@chromium.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Douglas Anderson <dianders@chromium.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/13] Input: elants_i2c - Use PM subsystem to manage wake irq
Date:   Wed, 21 Sep 2022 09:51:55 -0600
Message-Id: <20220921094736.v5.3.I5862429ee3e4de0f9ad5ba01ce07ad99eec10cf0@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220921155205.1332614-1-rrangel@chromium.org>
References: <20220921155205.1332614-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Elan I2C touchscreen driver is currently manually managing the wake
IRQ. This change removes the explicit enable_irq_wake/disable_irq_wake
and instead relies on the PM subsystem. This is done by calling
dev_pm_set_wake_irq.

i2c_device_probe already calls dev_pm_set_wake_irq when using device
tree, and i2c_device_remove also already calls dev_pm_clear_wake_irq.
There could be some device tree systems that have incorrectly declared
`wake` capabilities, so this change will set the wake irq if one is
missing. This matches the previous behavior.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

(no changes since v2)

Changes in v2:
- Added elants_i2c to series

 drivers/input/touchscreen/elants_i2c.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index a56f042adf9d82..80e16b533c452a 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -36,6 +36,7 @@
 #include <linux/input/touchscreen.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/uuid.h>
@@ -180,7 +181,6 @@ struct elants_data {
 	u8 cmd_resp[HEADER_SIZE];
 	struct completion cmd_done;
 
-	bool wake_irq_enabled;
 	bool keep_power_in_suspend;
 
 	/* Must be last to be used for DMA operations */
@@ -1582,6 +1582,15 @@ static int elants_i2c_probe(struct i2c_client *client)
 	if (!client->dev.of_node)
 		device_init_wakeup(&client->dev, true);
 
+	/*
+	 * The wake IRQ should be declared via device tree instead of assuming
+	 * the IRQ can wake the system. This is here for legacy reasons and
+	 * will be removed once the i2c-core supports querying ACPI for wake
+	 * capabilities.
+	 */
+	if (!client->dev.power.wakeirq)
+		dev_pm_set_wake_irq(&client->dev, client->irq);
+
 	error = devm_device_add_group(&client->dev, &elants_attribute_group);
 	if (error) {
 		dev_err(&client->dev, "failed to create sysfs attributes: %d\n",
@@ -1626,7 +1635,7 @@ static int __maybe_unused elants_i2c_suspend(struct device *dev)
 		 * The device will automatically enter idle mode
 		 * that has reduced power consumption.
 		 */
-		ts->wake_irq_enabled = (enable_irq_wake(client->irq) == 0);
+		return 0;
 	} else if (ts->keep_power_in_suspend) {
 		for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
 			error = elants_i2c_send(client, set_sleep_cmd,
@@ -1655,8 +1664,6 @@ static int __maybe_unused elants_i2c_resume(struct device *dev)
 	int error;
 
 	if (device_may_wakeup(dev)) {
-		if (ts->wake_irq_enabled)
-			disable_irq_wake(client->irq);
 		elants_i2c_sw_reset(client);
 	} else if (ts->keep_power_in_suspend) {
 		for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
-- 
2.37.3.968.ga6b4b080e4-goog


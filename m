Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6997CDE88
	for <lists+linux-input@lfdr.de>; Wed, 18 Oct 2023 16:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbjJROMa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Oct 2023 10:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbjJROMW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Oct 2023 10:12:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58749120;
        Wed, 18 Oct 2023 07:12:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD250C433C9;
        Wed, 18 Oct 2023 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697638339;
        bh=W6B0ohHYlK6muxOBgLgKjoQuqemi4dkS+/r+S/hB0gE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E4ES14m8meywHNfWZ/h7pzoHQ8aHj5KLCji9UVqgN5XDcaLdgs5GJ69yF/S8cvFai
         qURbuF/3fKg7Sq7f3/c/KEExBPMiFlZlw4mOCJ+fktxY1uujSENGpN/ybKJF7VZlX+
         Q76JU69i5M7y8rgZe8EUsD+0weZuJG4zPrtLjiukMeQBinvZOxWi/LY0V5lbZw35Wj
         w/m65BUPnkIwSCYsefU8tTJch7GTTnT/QCeWxoKBqF/zROif/jbDcELFpltkwOie2O
         2KelJEwZxm1r3Zn3niytGseeRoLmVrsCX2q9uq9m3CaVkoXjiZLuDB0PRSpnbVANYB
         W1ercMMjuJyXw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Michael Smith <1973.mjsmith@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, hadess@hadess.net,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 11/31] Input: goodix - ensure int GPIO is in input for gpio_count == 1 && gpio_int_idx == 0 case
Date:   Wed, 18 Oct 2023 10:11:28 -0400
Message-Id: <20231018141151.1334501-11-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 423622a90abb243944d1517b9f57db53729e45c4 ]

Add a special case for gpio_count == 1 && gpio_int_idx == 0 to
goodix_add_acpi_gpio_mappings().

It seems that on newer x86/ACPI devices the reset and irq GPIOs are no
longer listed as GPIO resources instead there is only 1 GpioInt resource
and _PS0 does the whole reset sequence for us.

This means that we must call acpi_device_fix_up_power() on these devices
to ensure that the chip is reset before we try to use it.

This part was already fixed in commit 3de93e6ed2df ("Input: goodix - call
acpi_device_fix_up_power() in some cases") by adding a call to
acpi_device_fix_up_power() to the generic "Unexpected ACPI resources"
catch all.

But it turns out that this case on some hw needs some more special
handling. Specifically the firmware may bootup with the IRQ pin in
output mode. The reset sequence from ACPI _PS0 (executed by
acpi_device_fix_up_power()) should put the pin in input mode,
but the GPIO subsystem has cached the direction at bootup, causing
request_irq() to fail due to gpiochip_lock_as_irq() failure:

[    9.119864] Goodix-TS i2c-GDIX1002:00: Unexpected ACPI resources: gpio_count 1, gpio_int_idx 0
[    9.317443] Goodix-TS i2c-GDIX1002:00: ID 911, version: 1060
[    9.321902] input: Goodix Capacitive TouchScreen as /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-5/i2c-GDIX1002:00/input/input8
[    9.327840] gpio gpiochip0: (INT3453:00): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
[    9.327856] gpio gpiochip0: (INT3453:00): unable to lock HW IRQ 26 for IRQ
[    9.327861] genirq: Failed to request resources for GDIX1002:00 (irq 131) on irqchip intel-gpio
[    9.327912] Goodix-TS i2c-GDIX1002:00: request IRQ failed: -5

Fix this by adding a special case for gpio_count == 1 && gpio_int_idx == 0
which adds an ACPI GPIO lookup table for the int GPIO even though we cannot
use it for reset purposes (as there is no reset GPIO).

Adding the lookup will make the gpiod_int = gpiod_get(..., GPIOD_IN) call
succeed, which will explicitly set the direction to input fixing the issue.

Note this re-uses the acpi_goodix_int_first_gpios[] lookup table, since
there is only 1 GPIO in the ACPI resources the reset entry in that
lookup table will amount to a no-op.

Reported-and-tested-by: Michael Smith <1973.mjsmith@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20231003215144.69527-1-hdegoede@redhat.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/goodix.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index f5aa240739f97..0f727dbc7232f 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -900,6 +900,25 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
 		dev_info(dev, "No ACPI GpioInt resource, assuming that the GPIO order is reset, int\n");
 		ts->irq_pin_access_method = IRQ_PIN_ACCESS_ACPI_GPIO;
 		gpio_mapping = acpi_goodix_int_last_gpios;
+	} else if (ts->gpio_count == 1 && ts->gpio_int_idx == 0) {
+		/*
+		 * On newer devices there is only 1 GpioInt resource and _PS0
+		 * does the whole reset sequence for us.
+		 */
+		acpi_device_fix_up_power(ACPI_COMPANION(dev));
+
+		/*
+		 * Before the _PS0 call the int GPIO may have been in output
+		 * mode and the call should have put the int GPIO in input mode,
+		 * but the GPIO subsys cached state may still think it is
+		 * in output mode, causing gpiochip_lock_as_irq() failure.
+		 *
+		 * Add a mapping for the int GPIO to make the
+		 * gpiod_int = gpiod_get(..., GPIOD_IN) call succeed,
+		 * which will explicitly set the direction to input.
+		 */
+		ts->irq_pin_access_method = IRQ_PIN_ACCESS_NONE;
+		gpio_mapping = acpi_goodix_int_first_gpios;
 	} else {
 		dev_warn(dev, "Unexpected ACPI resources: gpio_count %d, gpio_int_idx %d\n",
 			 ts->gpio_count, ts->gpio_int_idx);
-- 
2.40.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0ED07B738A
	for <lists+linux-input@lfdr.de>; Tue,  3 Oct 2023 23:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbjJCVwk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Oct 2023 17:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241276AbjJCVwg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Oct 2023 17:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08ADA6
        for <linux-input@vger.kernel.org>; Tue,  3 Oct 2023 14:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696369910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=an+lQDwTiwVWgqHiVFuqjDaLV+DbbeMPouHGFWrF+tc=;
        b=OeTgJB4F6/ZnUuqI/pomfaHrFk3vFUYLJlOhHpU8o4+ZeyLSHJnHquX3fBaGoQXWSg5ARl
        JdxXP7Q6DvRve5iTHkDHTSuz4hVmgPHBx3pc42x4XOWiWS48+38GhcUDaMxZPBxvNNoGmk
        zne9FWMrSQjP5j1dnu6x7djbnxKBd4s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55--xzgmoQUM5WJS-djq33quQ-1; Tue, 03 Oct 2023 17:51:46 -0400
X-MC-Unique: -xzgmoQUM5WJS-djq33quQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ADA83821347;
        Tue,  3 Oct 2023 21:51:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.82])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F57D2156701;
        Tue,  3 Oct 2023 21:51:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        linux-input@vger.kernel.org, Michael Smith <1973.mjsmith@gmail.com>
Subject: [PATCH] Input: goodix - Ensure int GPIO is in input for gpio_count == 1 && gpio_int_idx == 0 case
Date:   Tue,  3 Oct 2023 23:51:44 +0200
Message-ID: <20231003215144.69527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
---
- No Closes tag as this was reported by private email
---
 drivers/input/touchscreen/goodix.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index da9954d6df44..af32fbe57b63 100644
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
2.41.0


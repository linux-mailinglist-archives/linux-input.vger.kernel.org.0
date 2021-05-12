Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0556F37ECF0
	for <lists+linux-input@lfdr.de>; Thu, 13 May 2021 00:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344143AbhELUDb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 16:03:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:52538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352899AbhELSEd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 14:04:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A198A6143D;
        Wed, 12 May 2021 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620842601;
        bh=mkCBvt1/7W4P8EeI5YKbcvoKEMpNeqOd4JwgCcgdyFw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bPB0zxCKlsPguOU13dM4g/I6NR4SLL4SdCZjzLsxxWHVgpzyAwnA5iaVBVFT2tZEo
         SfAL3yiyj/QDbZEe2INp2TZ+dDLb5b4qObNEkPEylQvwmOnK64ND2muqGUmG4vBEbd
         JVwVPz+PMTB2Lbwn2TIbtVIwmvHy/vsYYFo2zQC5z63m4fBCUSohu5sklTQPra66x3
         qCOjjjGXSoJcJzvN/k8VvsyVlDRIRFwrWrFoGl4b1nqARuCxXXnIfHNZ3m374ThqrZ
         fVAL3lY4jSll7Bt8Q30VZ/eXPcI/VcG4DTOwsM4aWcZZjwmPpb/MshFcdSuWmnUR7e
         RyULFlNJE2AaA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/34] Input: silead - add workaround for x86 BIOS-es which bring the chip up in a stuck state
Date:   Wed, 12 May 2021 14:02:40 -0400
Message-Id: <20210512180306.664925-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180306.664925-1-sashal@kernel.org>
References: <20210512180306.664925-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit e479187748a8f151a85116a7091c599b121fdea5 ]

Some buggy BIOS-es bring up the touchscreen-controller in a stuck
state where it blocks the I2C bus. Specifically this happens on
the Jumper EZpad 7 tablet model.

After much poking at this problem I have found that the following steps
are necessary to unstuck the chip / bus:

1. Turn off the Silead chip.
2. Try to do an I2C transfer with the chip, this will fail in response to
   which the I2C-bus-driver will call: i2c_recover_bus() which will unstuck
   the I2C-bus. Note the unstuck-ing of the I2C bus only works if we first
   drop the chip of the bus by turning it off.
3. Turn the chip back on.

On the x86/ACPI systems were this problem is seen, step 1. and 3. require
making ACPI calls and dealing with ACPI Power Resources. This commit adds
a workaround which runtime-suspends the chip to turn it off, leaving it up
to the ACPI subsystem to deal with all the ACPI specific details.

There is no good way to detect this bug, so the workaround gets activated
by a new "silead,stuck-controller-bug" boolean device-property. Since this
is only used on x86/ACPI, this will be set by model specific device-props
set by drivers/platform/x86/touchscreen_dmi.c. Therefor this new
device-property is not documented in the DT-bindings.

Dmesg will contain the following messages on systems where the workaround
is activated:

[   54.309029] silead_ts i2c-MSSL1680:00: [Firmware Bug]: Stuck I2C bus: please ignore the next 'controller timed out' error
[   55.373593] i2c_designware 808622C1:04: controller timed out
[   55.582186] silead_ts i2c-MSSL1680:00: Silead chip ID: 0x80360000

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20210405202745.16777-1-hdegoede@redhat.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/silead.c | 44 +++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 8fa2f3b7cfd8..e8b6c3137420 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -20,6 +20,7 @@
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
 #include <linux/pm.h>
+#include <linux/pm_runtime.h>
 #include <linux/irq.h>
 #include <linux/regulator/consumer.h>
 
@@ -335,10 +336,8 @@ static int silead_ts_get_id(struct i2c_client *client)
 
 	error = i2c_smbus_read_i2c_block_data(client, SILEAD_REG_ID,
 					      sizeof(chip_id), (u8 *)&chip_id);
-	if (error < 0) {
-		dev_err(&client->dev, "Chip ID read error %d\n", error);
+	if (error < 0)
 		return error;
-	}
 
 	data->chip_id = le32_to_cpu(chip_id);
 	dev_info(&client->dev, "Silead chip ID: 0x%8X", data->chip_id);
@@ -351,12 +350,49 @@ static int silead_ts_setup(struct i2c_client *client)
 	int error;
 	u32 status;
 
+	/*
+	 * Some buggy BIOS-es bring up the chip in a stuck state where it
+	 * blocks the I2C bus. The following steps are necessary to
+	 * unstuck the chip / bus:
+	 * 1. Turn off the Silead chip.
+	 * 2. Try to do an I2C transfer with the chip, this will fail in
+	 *    response to which the I2C-bus-driver will call:
+	 *    i2c_recover_bus() which will unstuck the I2C-bus. Note the
+	 *    unstuck-ing of the I2C bus only works if we first drop the
+	 *    chip off the bus by turning it off.
+	 * 3. Turn the chip back on.
+	 *
+	 * On the x86/ACPI systems were this problem is seen, step 1. and
+	 * 3. require making ACPI calls and dealing with ACPI Power
+	 * Resources. The workaround below runtime-suspends the chip to
+	 * turn it off, leaving it up to the ACPI subsystem to deal with
+	 * this.
+	 */
+
+	if (device_property_read_bool(&client->dev,
+				      "silead,stuck-controller-bug")) {
+		pm_runtime_set_active(&client->dev);
+		pm_runtime_enable(&client->dev);
+		pm_runtime_allow(&client->dev);
+
+		pm_runtime_suspend(&client->dev);
+
+		dev_warn(&client->dev, FW_BUG "Stuck I2C bus: please ignore the next 'controller timed out' error\n");
+		silead_ts_get_id(client);
+
+		/* The forbid will also resume the device */
+		pm_runtime_forbid(&client->dev);
+		pm_runtime_disable(&client->dev);
+	}
+
 	silead_ts_set_power(client, SILEAD_POWER_OFF);
 	silead_ts_set_power(client, SILEAD_POWER_ON);
 
 	error = silead_ts_get_id(client);
-	if (error)
+	if (error) {
+		dev_err(&client->dev, "Chip ID read error %d\n", error);
 		return error;
+	}
 
 	error = silead_ts_init(client);
 	if (error)
-- 
2.30.2


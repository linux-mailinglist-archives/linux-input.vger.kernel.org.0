Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096B130767C
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 13:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhA1Myp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56824 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231139AbhA1My3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611838382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IFvReJvr3IEweu4w1n9ct95RpXOCYsJCOef/qPqrup4=;
        b=UXFC3n8KzwDP95kuMmLHkUmV0hCfCehsabMSAhYRs3kGJvcxyRQuTJ6KUjyoOLesP9fndE
        DebXzMh4gQ8MK9yZCN8eURG7PCNyhHZmFdDYGjySp6i6T9uUOyxVP6al/f21S+EhMRB9H5
        VuFOnDymCXxnGY94by82k3bmQn2FxSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-r8qQBLgRPAufYr3aRkzK-w-1; Thu, 28 Jan 2021 07:52:58 -0500
X-MC-Unique: r8qQBLgRPAufYr3aRkzK-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C80258030A2;
        Thu, 28 Jan 2021 12:52:57 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-250.ams2.redhat.com [10.36.114.250])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 04B4560C13;
        Thu, 28 Jan 2021 12:52:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: silead - Add workaround for x86 BIOS-es which bring the Silead chip up in a stuck state
Date:   Thu, 28 Jan 2021 13:52:56 +0100
Message-Id: <20210128125256.106879-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
---
 drivers/input/touchscreen/silead.c | 39 +++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 8fa2f3b7cfd8..9deef6317761 100644
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
@@ -351,12 +350,44 @@ static int silead_ts_setup(struct i2c_client *client)
 	int error;
 	u32 status;
 
+	/*
+	 * Some buggy BIOS-es bring up the chip in a stuck state where it blocks the I2C bus.
+	 * The following steps are necessary to unstuck the chip / bus:
+	 * 1. Turn off the Silead chip.
+	 * 2. Try to do an I2C transfer with the chip, this will fail in response to
+	 *    which the I2C-bus-driver will call: i2c_recover_bus() which will unstuck
+	 *    the I2C-bus. Note the unstuck-ing of the I2C bus only works if we first
+	 *    drop the chip of the bus by turning it off.
+	 * 3. Turn the chip back on.
+	 *
+	 * On the x86/ACPI systems were this problem is seen, step 1. and 3. require
+	 * making ACPI calls and dealing with ACPI Power Resources. The workaround below
+	 * runtime-suspends the chip to turn it off, leaving it up to the ACPI subsystem
+	 * to deal with this.
+	 */
+	if (device_property_read_bool(dev, "silead,stuck-controller-bug")) {
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
2.29.2


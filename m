Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9DD03FCE8F
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 22:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhHaU0e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 16:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240997AbhHaU0d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 16:26:33 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADE5C061764
        for <linux-input@vger.kernel.org>; Tue, 31 Aug 2021 13:25:35 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6CC3982C84;
        Tue, 31 Aug 2021 22:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630441532;
        bh=ePkvC2fCw8Hr3ybPS7mnGhRrSMx43KJay+6oKbzOGh4=;
        h=From:To:Cc:Subject:Date:From;
        b=rs0cB5GGO236aEX8eZgrOEMM8l7klZXofrVcGciT2N6YgPZrznCct/b6Kiq2YlqDK
         N98e45X3PtpcvM9qdEcKj7/XUr8cvRqlHw4fzyHjDH3XQNFpCSgeORzpl3wZ7EStvJ
         0Jjicwuj4Mkiyam20lY1weRzsSeycofmufTk4e0U0D8WCpeY0liEAEoKaKRi1wgrsp
         QF0vMGMDDulnZOeXX0LDggs4ull0oCzKsa8vN++9w88bS3nDP+JTtgYJ7M4x0EfhfQ
         TE06zecAXeZKNEyQmpVmfvy0OYS3aJA5MxYiQqqvlz6XTEWmuOh132e1MApwhkJ+Kl
         7PZ5+/i7I7N6w==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     ch@denx.de, Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH v3 1/3] Input: ili210x - use resolution from ili251x firmware
Date:   Tue, 31 Aug 2021 22:25:04 +0200
Message-Id: <20210831202506.181927-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ili251x firmware protocol permits readout of panel resolution,
implement this, but make it possible to override this value using
DT bindings. This way, older DTs which contain touchscreen-size-x
and touchscreen-size-y properties will behave just like before and
new DTs may avoid specifying these for ILI251x.

Note that the command format is different on other controllers, so
this functionality is isolated to ILI251x.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
V2: New patch
V3: - Use le16_to_cpup() byte-swap resolution data
    - Check Y-resolution range up to 0xffff too
    - Use .has_firmware_proto flag to discern supported MCU protocol
    - Use input_abs_set_max() per include/linux/input.h INPUT_GENERATE_ABS_ACCESSORS
    - Rename variable ret to error
    - Add a wrapper function ili251x_firmware_update_cached_state(),
      which would call pull other cacheable state from the controller
      in subsequent patch (hence also the ret variable in it which
      looks like it could be removed, this will reduce the number of
      changes in the next patch).
    - Wait for the firmware to fully stabilize itself after reset.
      No, those 200 milliseconds is not a mistake, but a value taken
      from example code. Anything less sometimes does report partly
      invalid values.
---
 drivers/input/touchscreen/ili210x.c | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 30576a5f2f04..baaddf95dd92 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -35,6 +35,7 @@ struct ili2xxx_chip {
 	unsigned int max_touches;
 	unsigned int resolution;
 	bool has_calibrate_reg;
+	bool has_firmware_proto;
 	bool has_pressure_reg;
 };
 
@@ -268,6 +269,7 @@ static const struct ili2xxx_chip ili251x_chip = {
 	.continue_polling	= ili251x_check_continue_polling,
 	.max_touches		= 10,
 	.has_calibrate_reg	= true,
+	.has_firmware_proto	= true,
 	.has_pressure_reg	= true,
 };
 
@@ -323,6 +325,54 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 	return IRQ_HANDLED;
 }
 
+static int ili251x_firmware_update_resolution(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	__le16 resx, resy;
+	u8 rs[10];
+	int error;
+
+	/* The firmware update blob might have changed the resolution. */
+	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
+	if (error)
+		return error;
+
+	resx = le16_to_cpup((__le16 *)rs);
+	resy = le16_to_cpup((__le16 *)(rs + 2));
+
+	/* The value reported by the firmware is invalid. */
+	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
+		return -EINVAL;
+
+	input_abs_set_max(priv->input, ABS_X, resx - 1);
+	input_abs_set_max(priv->input, ABS_Y, resy - 1);
+	input_abs_set_max(priv->input, ABS_MT_POSITION_X, resx - 1);
+	input_abs_set_max(priv->input, ABS_MT_POSITION_Y, resy - 1);
+
+	return 0;
+}
+
+static int ili251x_firmware_update_cached_state(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	int ret;
+
+	if (!priv->chip->has_firmware_proto)
+		return 0;
+
+	/* Wait for firmware to boot and stabilize itself. */
+	msleep(200);
+
+	/* Firmware does report valid information. */
+	ret = ili251x_firmware_update_resolution(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static ssize_t ili210x_calibrate(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -449,6 +499,12 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
 	if (priv->chip->has_pressure_reg)
 		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 0xa, 0, 0);
+	error = ili251x_firmware_update_cached_state(dev);
+	if (error) {
+		dev_err(dev, "Unable to cache firmware information, err: %d\n",
+			error);
+		return error;
+	}
 	touchscreen_parse_properties(input, true, &priv->prop);
 
 	error = input_mt_init_slots(input, priv->chip->max_touches,
-- 
2.33.0


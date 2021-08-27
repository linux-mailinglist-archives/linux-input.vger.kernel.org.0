Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C8C3FA105
	for <lists+linux-input@lfdr.de>; Fri, 27 Aug 2021 23:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhH0VOL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Aug 2021 17:14:11 -0400
Received: from phobos.denx.de ([85.214.62.61]:55570 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231572AbhH0VOK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Aug 2021 17:14:10 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 27C7A81D1F;
        Fri, 27 Aug 2021 23:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630098799;
        bh=TcJGbKjaiblZSFk3DAXojkWYe9518wGzjlcIgFxnydo=;
        h=From:To:Cc:Subject:Date:From;
        b=ukcO44LNqo+DM20UogNWONgFFmHjFZozer9K6qBwHBXUPT9UqJUyv/T5PW8kg8HXf
         v8+xDJN5RKLIUREyXh3aKEfFoOAwuWT55nGr/LC3GhZQ5NnpkiWa3wLwykZjIUGLB5
         PoTM+gUl3D2nOkKl8r+LsgSHSMrkRzsPX1QSKnoHUw6aefIHZjrvquBkDJi/wIdGRe
         2DA8awpyOOfIJaBBBgdnUURRI/XJFQtYyxZoK+M56EHQtHJrc8eEw3XQb7gkbtvDBF
         XtQowBoE6arUPboxNJj6WmTTPJA88GVNbkA+lzbfrqRMsHTYHXtk4tH8vTmSTXymVz
         xE6OjXHUj5rZQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     ch@denx.de, Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH v2 1/3] Input: ili210x - use resolution from ili251x firmware
Date:   Fri, 27 Aug 2021 23:12:56 +0200
Message-Id: <20210827211258.318618-1-marex@denx.de>
X-Mailer: git-send-email 2.32.0
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
---
 drivers/input/touchscreen/ili210x.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 30576a5f2f04..c46553ecabe6 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -323,6 +323,34 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 	return IRQ_HANDLED;
 }
 
+static int ili251x_firmware_update_resolution(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u16 resx, resy;
+	u8 rs[10];
+	int ret;
+
+	/* The firmware update blob might have changed the resolution. */
+	ret = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
+	if (ret)
+		return ret;
+
+	resx = (rs[1] << 8U) | rs[0];
+	resy = (rs[3] << 8U) | rs[2];
+
+	/* The value reported by the firmware is invalid. */
+	if (!resx || resx == 0xffff || !resy || resy == 0xfff)
+		return -EINVAL;
+
+	priv->input->absinfo[ABS_X].maximum = resx - 1;
+	priv->input->absinfo[ABS_Y].maximum = resy - 1;
+	priv->input->absinfo[ABS_MT_POSITION_X].maximum = resx - 1;
+	priv->input->absinfo[ABS_MT_POSITION_Y].maximum = resy - 1;
+
+	return 0;
+}
+
 static ssize_t ili210x_calibrate(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -449,6 +477,9 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
 	if (priv->chip->has_pressure_reg)
 		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 0xa, 0, 0);
+	/* ILI251x does report valid resolution information, try it. */
+	if (priv->chip == &ili251x_chip)
+		ili251x_firmware_update_resolution(dev);
 	touchscreen_parse_properties(input, true, &priv->prop);
 
 	error = input_mt_init_slots(input, priv->chip->max_touches,
-- 
2.32.0


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C50F95E5
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 17:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfKLQo4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 11:44:56 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37393 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLQoz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 11:44:55 -0500
Received: by mail-qt1-f196.google.com with SMTP id g50so20433284qtb.4;
        Tue, 12 Nov 2019 08:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9PK6Iii1ai1LkK82Hw9G+h5BnDsZJNDqHEqNoavTYJE=;
        b=YOQJdU9iXybjiq3jIolIh7vTdXvXe/anYmAa+/ybVJZSjPkE82QsdSi4kQVW3B2Vhg
         iaZ1/NvJ0Df/ahFgkWFzkCakOCwn1IQdqa7Q88Dq/csFy98fKNFaWz4VFayUWk+H735O
         HqiJ8mYX6WrL4wWhvqB+IaxyX3iW7p/ZSlMEWGr8DJz1ccswWTtskP1FQWCyOsaRrmun
         gnPcY7UABfS1BWL3sT2Tn5X/ATGJ2/ZqExRQ0bbxR+Tvwq/zDo99r2GmDYY7sRk+1gGR
         BGCnhFFNQt0WdjljqXiEZJ8o/CLeSJEK0Qq/Y2XU5xg96xGnLtWzvy/kyHg4dd/SBpDH
         r3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9PK6Iii1ai1LkK82Hw9G+h5BnDsZJNDqHEqNoavTYJE=;
        b=Sf+0wEZsIJZQ6u673Tze4tTdW/fMmvJiuEN6ffRILO+081bunYqMaAe+L9jnJYJ+5S
         1md+YiH7sUJrKDKwt+QDU7OQ3bNhDJgqSThGA2W0/k2CsEtHltzHSTuDP+3eBfmkjFnD
         EtGiBKEdxjxKqx59YCbu7WDkM0839WGbe8tWfbJutfcia1qK6X/zS5va6j9jtF/LN27D
         9RZ1gTcoOkOXloZvOhxlpGwde7VMFjAHpVu5T2/haJoRcA8hC2YuaTieuQ1LvhJWza8g
         TSeelkZ4nTJC/kUIN/PZ6L0sWE2qFetaxAlM7m/KNvoR8qKbsTd2XrLoRwCemq18UpuI
         M7QA==
X-Gm-Message-State: APjAAAVK5/CwGDID5XgkgnNo74q2XY3e2pdyZDON6cAhbMSKCqXcT08K
        lO1O8Ek37n0C16p42rphvTC9EBel
X-Google-Smtp-Source: APXvYqwZyENd2jI5gfYm5zky8sOs4MWD5PkctjtBlh6crwLiUXu2OGCqF749lMzPIlQEEQxdwponLQ==
X-Received: by 2002:ac8:3168:: with SMTP id h37mr31958767qtb.311.1573577094635;
        Tue, 12 Nov 2019 08:44:54 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id z5sm10543552qtm.9.2019.11.12.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 08:44:54 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v1 1/3] Input: ili210x - do not retrieve/print chip firmware version
Date:   Tue, 12 Nov 2019 11:44:27 -0500
Message-Id: <20191112164429.11225-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver's method to retrieve the firmware version on ili2117/
ili2118 chip flavours is incorrect. The firmware version register
address and layout are wrong.

The firmware version is not actually used anywhere inside or
outside this driver. There is a dev_dbg() print, but that is
only visible when the developer explicitly compiles in debug
support.

Don't make the code more complicated to preserve a feature that
no-one is using. Remove all code associated with chip firmware
version.

Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
Cc: Marek Vasut <marex@denx.de>
Cc: Adam Ford <aford173@gmail.com>
Cc: <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org
Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 0ed6014af6d7..a6feae5ce887 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -21,15 +21,8 @@
 /* Touchscreen commands */
 #define REG_TOUCHDATA		0x10
 #define REG_PANEL_INFO		0x20
-#define REG_FIRMWARE_VERSION	0x40
 #define REG_CALIBRATE		0xcc
 
-struct firmware_version {
-	u8 id;
-	u8 major;
-	u8 minor;
-} __packed;
-
 struct ili2xxx_chip {
 	int (*read_reg)(struct i2c_client *client, u8 reg,
 			void *buf, size_t len);
@@ -342,7 +335,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	struct ili210x *priv;
 	struct gpio_desc *reset_gpio;
 	struct input_dev *input;
-	struct firmware_version firmware;
 	int error;
 
 	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
@@ -389,15 +381,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	priv->chip = chip;
 	i2c_set_clientdata(client, priv);
 
-	/* Get firmware version */
-	error = chip->read_reg(client, REG_FIRMWARE_VERSION,
-			       &firmware, sizeof(firmware));
-	if (error) {
-		dev_err(dev, "Failed to get firmware version, err: %d\n",
-			error);
-		return error;
-	}
-
 	/* Setup input device */
 	input->name = "ILI210x Touchscreen";
 	input->id.bustype = BUS_I2C;
@@ -439,10 +422,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
-	dev_dbg(dev,
-		"ILI210x initialized (IRQ: %d), firmware version %d.%d.%d",
-		client->irq, firmware.id, firmware.major, firmware.minor);
-
 	return 0;
 }
 
-- 
2.17.1


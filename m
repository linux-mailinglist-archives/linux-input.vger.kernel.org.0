Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E44FCCE154
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 14:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfJGMPv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 08:15:51 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45763 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGMPu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 08:15:50 -0400
Received: by mail-qk1-f195.google.com with SMTP id z67so12260662qkb.12
        for <linux-input@vger.kernel.org>; Mon, 07 Oct 2019 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+SIlC361um6jarKwr9f+FViDvls3ViyvVkzc9SDn7XM=;
        b=AzycBlRoHCHJV2voO09T+ApzmS8c0wni75+zt9icAfOQZ9Oa+/8kFGcfuIYY8frVzu
         1+iic38R0qm7501jyXzWhQIzsNI0xf7T0aA1G1UVSHFpjepSb1mVOCKkHBa84sbsvS3Q
         DRNT6UDvZlfOMQ1tXewASJTP9hzqubuOwdwJVWAOaPOqGJZO0navMdPB/6mBq5DiC7LL
         6DnCmbs80HfT30lGW+Z7KLnMy3lX8D8BTxhyLrok8juCwLe3/4flhYqOZKdVaE2bCq1V
         kHnvD2wr9VShItCx1nzHh0KkCQTq8Pz1FdYcvV7YJTgcWGZAX6MPsI4yC3vAYNTSeuS2
         UrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+SIlC361um6jarKwr9f+FViDvls3ViyvVkzc9SDn7XM=;
        b=nALN4oCsjaM3IkQ18BfWqbHLm6sg1rMpRmMoOpbJj1xOam18Pp7NV5kl8mp8LvYZVP
         d5Qb7c+78d2Hvn628blpY7u39lRx+ATfQm9kR1UDXMiCrbOpNc9yjXhNg5jRc3DKI2gy
         0K+f5rGKrMBiIzwc7U7QcXemGtQBMSoOwBTv+dBeXqIsgfHDpgdyIqiZo/ffN+CqXq1O
         9peeD142IBHfGP3eCutvfVUSnjU/yyYaAYmgEGdqxjYCzmq9WrsXBhIAw1v1KcbF6D8s
         18ZzzbrjKONf8sxFu+NZRwahcgU7r8ndeOLLoqbV+uUfR+1L4INPvjBhOkwITpkM+HxZ
         deAA==
X-Gm-Message-State: APjAAAV2x4qRGNVD7VbabhXGFd/DXDI26zhQplhNr+ZFWxwlozAZZIBZ
        pPpTvqPdGX74gkNQ317qnK/nbNH2
X-Google-Smtp-Source: APXvYqzBvwgJ6mf3VZgSqSbxDriKqF2RWeJjuukPuoi3ELOHPgiS6RxeyYxJXATs4oFTwPr0auWVHw==
X-Received: by 2002:ae9:e609:: with SMTP id z9mr23004721qkf.50.1570450549326;
        Mon, 07 Oct 2019 05:15:49 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id g194sm8221678qke.46.2019.10.07.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 05:15:48 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jcbian@pixcir.com.cn, rogerq@ti.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/5] Input: pixcir_i2c_ts - Move definitions into a single file
Date:   Mon,  7 Oct 2019 09:16:04 -0300
Message-Id: <20191007121607.12545-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007121607.12545-1-festevam@gmail.com>
References: <20191007121607.12545-1-festevam@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

All the defined symbols from linux/platform_data/pixcir_i2c_ts.h
are only used by the pixcir_i2c_ts driver, so move all the definitions
locally and get rid of the pixcir_i2c_ts.h file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/pixcir_i2c_ts.c   | 60 ++++++++++++++++++-
 include/linux/platform_data/pixcir_i2c_ts.h | 64 ---------------------
 2 files changed, 59 insertions(+), 65 deletions(-)
 delete mode 100644 include/linux/platform_data/pixcir_i2c_ts.h

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index 4561d65e7a1e..efe5f1e86ef1 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -15,11 +15,69 @@
 #include <linux/input/touchscreen.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of_device.h>
-#include <linux/platform_data/pixcir_i2c_ts.h>
 #include <asm/unaligned.h>
 
 #define PIXCIR_MAX_SLOTS       5 /* Max fingers supported by driver */
 
+/*
+ * Register map
+ */
+#define PIXCIR_REG_POWER_MODE	51
+#define PIXCIR_REG_INT_MODE	52
+
+/*
+ * Power modes:
+ * active: max scan speed
+ * idle: lower scan speed with automatic transition to active on touch
+ * halt: datasheet says sleep but this is more like halt as the chip
+ *       clocks are cut and it can only be brought out of this mode
+ *	 using the RESET pin.
+ */
+enum pixcir_power_mode {
+	PIXCIR_POWER_ACTIVE,
+	PIXCIR_POWER_IDLE,
+	PIXCIR_POWER_HALT,
+};
+
+#define PIXCIR_POWER_MODE_MASK	0x03
+#define PIXCIR_POWER_ALLOW_IDLE (1UL << 2)
+
+/*
+ * Interrupt modes:
+ * periodical: interrupt is asserted periodicaly
+ * diff coordinates: interrupt is asserted when coordinates change
+ * level on touch: interrupt level asserted during touch
+ * pulse on touch: interrupt pulse asserted during touch
+ *
+ */
+enum pixcir_int_mode {
+	PIXCIR_INT_PERIODICAL,
+	PIXCIR_INT_DIFF_COORD,
+	PIXCIR_INT_LEVEL_TOUCH,
+	PIXCIR_INT_PULSE_TOUCH,
+};
+
+#define PIXCIR_INT_MODE_MASK	0x03
+#define PIXCIR_INT_ENABLE	(1UL << 3)
+#define PIXCIR_INT_POL_HIGH	(1UL << 2)
+
+/**
+ * struct pixcir_irc_chip_data - chip related data
+ * @max_fingers:	Max number of fingers reported simultaneously by h/w
+ * @has_hw_ids:		Hardware supports finger tracking IDs
+ *
+ */
+struct pixcir_i2c_chip_data {
+	u8 max_fingers;
+	bool has_hw_ids;
+};
+
+struct pixcir_ts_platform_data {
+	int x_max;
+	int y_max;
+	struct pixcir_i2c_chip_data chip;
+};
+
 struct pixcir_i2c_ts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
diff --git a/include/linux/platform_data/pixcir_i2c_ts.h b/include/linux/platform_data/pixcir_i2c_ts.h
deleted file mode 100644
index 4ab3cd6f1cc2..000000000000
--- a/include/linux/platform_data/pixcir_i2c_ts.h
+++ /dev/null
@@ -1,64 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef	_PIXCIR_I2C_TS_H
-#define	_PIXCIR_I2C_TS_H
-
-/*
- * Register map
- */
-#define PIXCIR_REG_POWER_MODE	51
-#define PIXCIR_REG_INT_MODE	52
-
-/*
- * Power modes:
- * active: max scan speed
- * idle: lower scan speed with automatic transition to active on touch
- * halt: datasheet says sleep but this is more like halt as the chip
- *       clocks are cut and it can only be brought out of this mode
- *	 using the RESET pin.
- */
-enum pixcir_power_mode {
-	PIXCIR_POWER_ACTIVE,
-	PIXCIR_POWER_IDLE,
-	PIXCIR_POWER_HALT,
-};
-
-#define PIXCIR_POWER_MODE_MASK	0x03
-#define PIXCIR_POWER_ALLOW_IDLE (1UL << 2)
-
-/*
- * Interrupt modes:
- * periodical: interrupt is asserted periodicaly
- * diff coordinates: interrupt is asserted when coordinates change
- * level on touch: interrupt level asserted during touch
- * pulse on touch: interrupt pulse asserted druing touch
- *
- */
-enum pixcir_int_mode {
-	PIXCIR_INT_PERIODICAL,
-	PIXCIR_INT_DIFF_COORD,
-	PIXCIR_INT_LEVEL_TOUCH,
-	PIXCIR_INT_PULSE_TOUCH,
-};
-
-#define PIXCIR_INT_MODE_MASK	0x03
-#define PIXCIR_INT_ENABLE	(1UL << 3)
-#define PIXCIR_INT_POL_HIGH	(1UL << 2)
-
-/**
- * struct pixcir_irc_chip_data - chip related data
- * @max_fingers:	Max number of fingers reported simultaneously by h/w
- * @has_hw_ids:		Hardware supports finger tracking IDs
- *
- */
-struct pixcir_i2c_chip_data {
-	u8 max_fingers;
-	bool has_hw_ids;
-};
-
-struct pixcir_ts_platform_data {
-	int x_max;
-	int y_max;
-	struct pixcir_i2c_chip_data chip;
-};
-
-#endif
-- 
2.17.1


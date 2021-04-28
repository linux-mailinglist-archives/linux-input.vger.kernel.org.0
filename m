Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD3D36D6BA
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 13:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhD1LrA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 07:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46583 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229600AbhD1LrA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 07:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619610375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wYfOq0Tk2StKX2uL26mmPHwVfquox6YNSmeaTxLhtGQ=;
        b=cuyewOpUbL0L6ulIiUsAvbf7iT1cdUPF5xytMC/9FzmkPNXlNhwUKP9KwDoeId9etaGSeI
        jLONkiEIKZtOxE8r04VmemX5yCj2V4akpuUE4BRXCgqLyXpoayOMso4nGPedOfT2g740A7
        y+lw31xVdKzvmaMyNkNXy/e1gVMgQCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Sn3qz-Q4MpqlhFsGdJLvnw-1; Wed, 28 Apr 2021 07:46:13 -0400
X-MC-Unique: Sn3qz-Q4MpqlhFsGdJLvnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 777C0801F98;
        Wed, 28 Apr 2021 11:46:12 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 876C85F729;
        Wed, 28 Apr 2021 11:46:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/7] Input: goodix - Add a goodix.h header file
Date:   Wed, 28 Apr 2021 13:46:03 +0200
Message-Id: <20210428114608.101795-3-hdegoede@redhat.com>
In-Reply-To: <20210428114608.101795-1-hdegoede@redhat.com>
References: <20210428114608.101795-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a goodix.h header file, and move the register definitions,
and struct declarations there and add prototypes for various
helper functions.

This is a preparation patch for adding support for controllers
without flash, which need to have their firmware uploaded and
need some other special handling too.

Since MAINTAINERS needs updating because of this change anyways,
also add myself as co-maintainer.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                        |  3 +-
 drivers/input/touchscreen/goodix.c | 73 +++---------------------------
 drivers/input/touchscreen/goodix.h | 73 ++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 68 deletions(-)
 create mode 100644 drivers/input/touchscreen/goodix.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cec5f5ae51e9..446aeb4e4d3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7593,9 +7593,10 @@ F:	drivers/media/usb/go7007/
 
 GOODIX TOUCHSCREEN
 M:	Bastien Nocera <hadess@hadess.net>
+M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-F:	drivers/input/touchscreen/goodix.c
+F:	drivers/input/touchscreen/goodix*
 
 GOOGLE ETHERNET DRIVERS
 M:	Catherine Sullivan <csully@google.com>
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index fddbc6c5127d..76e93bc8389a 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -14,20 +14,15 @@
 #include <linux/kernel.h>
 #include <linux/dmi.h>
 #include <linux/firmware.h>
-#include <linux/gpio/consumer.h>
-#include <linux/i2c.h>
-#include <linux/input.h>
-#include <linux/input/mt.h>
-#include <linux/input/touchscreen.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
+#include "goodix.h"
 
 #define GOODIX_GPIO_INT_NAME		"irq"
 #define GOODIX_GPIO_RST_NAME		"reset"
@@ -38,22 +33,11 @@
 #define GOODIX_CONTACT_SIZE		8
 #define GOODIX_MAX_CONTACT_SIZE		9
 #define GOODIX_MAX_CONTACTS		10
-#define GOODIX_MAX_KEYS			7
 
 #define GOODIX_CONFIG_MIN_LENGTH	186
 #define GOODIX_CONFIG_911_LENGTH	186
 #define GOODIX_CONFIG_967_LENGTH	228
 #define GOODIX_CONFIG_GT9X_LENGTH	240
-#define GOODIX_CONFIG_MAX_LENGTH	240
-
-/* Register defines */
-#define GOODIX_REG_COMMAND		0x8040
-#define GOODIX_CMD_SCREEN_OFF		0x05
-
-#define GOODIX_READ_COOR_ADDR		0x814E
-#define GOODIX_GT1X_REG_CONFIG_DATA	0x8050
-#define GOODIX_GT9X_REG_CONFIG_DATA	0x8047
-#define GOODIX_REG_ID			0x8140
 
 #define GOODIX_BUFFER_STATUS_READY	BIT(7)
 #define GOODIX_HAVE_KEY			BIT(4)
@@ -68,55 +52,11 @@
 #define ACPI_GPIO_SUPPORT
 #endif
 
-struct goodix_ts_data;
-
-enum goodix_irq_pin_access_method {
-	IRQ_PIN_ACCESS_NONE,
-	IRQ_PIN_ACCESS_GPIO,
-	IRQ_PIN_ACCESS_ACPI_GPIO,
-	IRQ_PIN_ACCESS_ACPI_METHOD,
-};
-
-struct goodix_chip_data {
-	u16 config_addr;
-	int config_len;
-	int (*check_config)(struct goodix_ts_data *ts, const u8 *cfg, int len);
-	void (*calc_config_checksum)(struct goodix_ts_data *ts);
-};
-
 struct goodix_chip_id {
 	const char *id;
 	const struct goodix_chip_data *data;
 };
 
-#define GOODIX_ID_MAX_LEN	4
-
-struct goodix_ts_data {
-	struct i2c_client *client;
-	struct input_dev *input_dev;
-	const struct goodix_chip_data *chip;
-	struct touchscreen_properties prop;
-	unsigned int max_touch_num;
-	unsigned int int_trigger_type;
-	struct regulator *avdd28;
-	struct regulator *vddio;
-	struct gpio_desc *gpiod_int;
-	struct gpio_desc *gpiod_rst;
-	int gpio_count;
-	int gpio_int_idx;
-	char id[GOODIX_ID_MAX_LEN + 1];
-	u16 version;
-	const char *cfg_name;
-	bool reset_controller_at_probe;
-	bool load_cfg_from_disk;
-	struct completion firmware_loading_complete;
-	unsigned long irq_flags;
-	enum goodix_irq_pin_access_method irq_pin_access_method;
-	unsigned int contact_size;
-	u8 config[GOODIX_CONFIG_MAX_LENGTH];
-	unsigned short keymap[GOODIX_MAX_KEYS];
-};
-
 static int goodix_check_cfg_8(struct goodix_ts_data *ts,
 			      const u8 *cfg, int len);
 static int goodix_check_cfg_16(struct goodix_ts_data *ts,
@@ -260,8 +200,7 @@ static const struct dmi_system_id inverted_x_screen[] = {
  * @buf: raw write data buffer.
  * @len: length of the buffer to write
  */
-static int goodix_i2c_read(struct i2c_client *client,
-			   u16 reg, u8 *buf, int len)
+int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len)
 {
 	struct i2c_msg msgs[2];
 	__be16 wbuf = cpu_to_be16(reg);
@@ -289,7 +228,7 @@ static int goodix_i2c_read(struct i2c_client *client,
  * @buf: raw data buffer to write.
  * @len: length of the buffer to write
  */
-static int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf, int len)
+int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf, int len)
 {
 	u8 *addr_buf;
 	struct i2c_msg msg;
@@ -313,7 +252,7 @@ static int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf, i
 	return ret < 0 ? ret : (ret != 1 ? -EIO : 0);
 }
 
-static int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value)
+int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value)
 {
 	return goodix_i2c_write(client, reg, &value, sizeof(value));
 }
@@ -597,7 +536,7 @@ static int goodix_check_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len)
  * @cfg: config firmware to write to device
  * @len: config data length
  */
-static int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len)
+int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len)
 {
 	int error;
 
@@ -695,7 +634,7 @@ static int goodix_irq_direction_input(struct goodix_ts_data *ts)
 	return -EINVAL; /* Never reached */
 }
 
-static int goodix_int_sync(struct goodix_ts_data *ts)
+int goodix_int_sync(struct goodix_ts_data *ts)
 {
 	int error;
 
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
new file mode 100644
index 000000000000..cdaced4f2980
--- /dev/null
+++ b/drivers/input/touchscreen/goodix.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __GOODIX_H__
+#define __GOODIX_H__
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/regulator/consumer.h>
+
+/* Register defines */
+#define GOODIX_REG_COMMAND			0x8040
+#define GOODIX_CMD_SCREEN_OFF			0x05
+
+#define GOODIX_GT1X_REG_CONFIG_DATA		0x8050
+#define GOODIX_GT9X_REG_CONFIG_DATA		0x8047
+#define GOODIX_REG_ID				0x8140
+#define GOODIX_READ_COOR_ADDR			0x814E
+
+#define GOODIX_ID_MAX_LEN			4
+#define GOODIX_CONFIG_MAX_LENGTH		240
+#define GOODIX_MAX_KEYS				7
+
+enum goodix_irq_pin_access_method {
+	IRQ_PIN_ACCESS_NONE,
+	IRQ_PIN_ACCESS_GPIO,
+	IRQ_PIN_ACCESS_ACPI_GPIO,
+	IRQ_PIN_ACCESS_ACPI_METHOD,
+};
+
+struct goodix_ts_data;
+
+struct goodix_chip_data {
+	u16 config_addr;
+	int config_len;
+	int (*check_config)(struct goodix_ts_data *ts, const u8 *cfg, int len);
+	void (*calc_config_checksum)(struct goodix_ts_data *ts);
+};
+
+struct goodix_ts_data {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	const struct goodix_chip_data *chip;
+	struct touchscreen_properties prop;
+	unsigned int max_touch_num;
+	unsigned int int_trigger_type;
+	struct regulator *avdd28;
+	struct regulator *vddio;
+	struct gpio_desc *gpiod_int;
+	struct gpio_desc *gpiod_rst;
+	int gpio_count;
+	int gpio_int_idx;
+	char id[GOODIX_ID_MAX_LEN + 1];
+	u16 version;
+	const char *cfg_name;
+	bool reset_controller_at_probe;
+	bool load_cfg_from_disk;
+	struct completion firmware_loading_complete;
+	unsigned long irq_flags;
+	enum goodix_irq_pin_access_method irq_pin_access_method;
+	unsigned int contact_size;
+	u8 config[GOODIX_CONFIG_MAX_LENGTH];
+	unsigned short keymap[GOODIX_MAX_KEYS];
+};
+
+int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len);
+int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf, int len);
+int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value);
+int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len);
+int goodix_int_sync(struct goodix_ts_data *ts);
+
+#endif
-- 
2.31.1


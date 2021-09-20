Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB48A4117CF
	for <lists+linux-input@lfdr.de>; Mon, 20 Sep 2021 17:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241099AbhITPIY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 11:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60573 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241077AbhITPIY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 11:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632150417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ebVR2dlZ9RpPAbJ0SM1i0EsAcDi2ftWXpTxbXeDbcus=;
        b=G+7OEt+IYlW//5O+EJ1OkFrrMIk+qH+6yWYr8ZFadlveMWsoIRxDBieThSLCMEnu0ZQB6h
        zoFNkQtifOxvIepJK+7kXgQdlYDZEGPyofngnV0K4knmYgikPkUosnwAA1CToGeakv0KJ6
        aVWEHIPsnXZUItDMKwtFOgtzOHlJCoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-CnTkGXs8M7OjmzV0G9--2g-1; Mon, 20 Sep 2021 11:06:55 -0400
X-MC-Unique: CnTkGXs8M7OjmzV0G9--2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F13C15074D;
        Mon, 20 Sep 2021 15:06:54 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 83B565F706;
        Mon, 20 Sep 2021 15:06:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 6/6] Input: goodix - Add support for controllers without flash
Date:   Mon, 20 Sep 2021 17:06:43 +0200
Message-Id: <20210920150643.155872-7-hdegoede@redhat.com>
In-Reply-To: <20210920150643.155872-1-hdegoede@redhat.com>
References: <20210920150643.155872-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Goodix touchscreen controllers, such as for example the GT912,
don't have flash-storage for their firmware.

These models require the OS to load the firmware at runtime, as well as
some other special handling. Add support for this to the goodix driver.

This patch was developed and tested on a Glavey TM800A550L tablet.

Note the "goodix,main-clk" and "firmware-name" device-properties used
by the new code are *not* documented in the
Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
device-tree bindings for now.

Not documenting these is intentional. This is done because this code has
only been tested on x86/ACPI so far, where devicetree is not used.
Instead these properties are set through a software-fwnode attached to the
device by the drivers/platform/x86/touchscreen_dmi.c code. This means that
the use of this properties for now is purely a kernel-internal thing and
the name/working of the properties may still be changed for now.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Decide if a controller does not have flash / needs firmware to be
  uploaded based on the presence of the "firmware-name" device-property,
  the autodetection code in v1 was causing false-positives on some
  devices
---
 drivers/input/touchscreen/Makefile          |   3 +-
 drivers/input/touchscreen/goodix.c          |  42 +-
 drivers/input/touchscreen/goodix.h          |  43 ++
 drivers/input/touchscreen/goodix_fwupload.c | 413 ++++++++++++++++++++
 4 files changed, 493 insertions(+), 8 deletions(-)
 create mode 100644 drivers/input/touchscreen/goodix_fwupload.c

diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 7d34100f7f22..39a8127cf6a5 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -6,6 +6,7 @@
 # Each configuration option enables a list of files.
 
 wm97xx-ts-y := wm97xx-core.o
+goodix_ts-y := goodix.o goodix_fwupload.o
 
 obj-$(CONFIG_TOUCHSCREEN_88PM860X)	+= 88pm860x-ts.o
 obj-$(CONFIG_TOUCHSCREEN_AD7877)	+= ad7877.o
@@ -44,7 +45,7 @@ obj-$(CONFIG_TOUCHSCREEN_EGALAX)	+= egalax_ts.o
 obj-$(CONFIG_TOUCHSCREEN_EGALAX_SERIAL)	+= egalax_ts_serial.o
 obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
 obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
-obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix.o
+obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 1447a9858627..ea731947e87d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -278,6 +278,11 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 			return touch_num;
 		}
 
+		if (data[0] == 0 && ts->firmware_name) {
+			if (goodix_handle_fw_request(ts))
+				return 0;
+		}
+
 		usleep_range(1000, 2000); /* Poll every 1 - 2 ms */
 	} while (time_before(jiffies, max_timeout));
 
@@ -890,12 +895,19 @@ static void goodix_read_config(struct goodix_ts_data *ts)
 	int x_max, y_max;
 	int error;
 
-	error = goodix_i2c_read(ts->client, ts->chip->config_addr,
-				ts->config, ts->chip->config_len);
-	if (error) {
-		ts->int_trigger_type = GOODIX_INT_TRIGGER;
-		ts->max_touch_num = GOODIX_MAX_CONTACTS;
-		return;
+	/*
+	 * On controllers where we need to upload the firmware
+	 * (controllers without flash) ts->config already has the config
+	 * at this point and the controller itself does not have it yet!
+	 */
+	if (!ts->firmware_name) {
+		error = goodix_i2c_read(ts->client, ts->chip->config_addr,
+					ts->config, ts->chip->config_len);
+		if (error) {
+			ts->int_trigger_type = GOODIX_INT_TRIGGER;
+			ts->max_touch_num = GOODIX_MAX_CONTACTS;
+			return;
+		}
 	}
 
 	ts->int_trigger_type = ts->config[TRIGGER_LOC] & 0x03;
@@ -1082,7 +1094,16 @@ static void goodix_config_cb(const struct firmware *cfg, void *ctx)
 	struct goodix_ts_data *ts = ctx;
 	int error;
 
-	if (cfg) {
+	if (ts->firmware_name) {
+		if (!cfg)
+			goto err_release_cfg;
+
+		error = goodix_check_cfg(ts, cfg->data, cfg->size);
+		if (error)
+			goto err_release_cfg;
+
+		memcpy(ts->config, cfg->data, cfg->size);
+	} else if (cfg) {
 		/* send device configuration to the firmware */
 		error = goodix_send_cfg(ts, cfg->data, cfg->size);
 		if (error)
@@ -1174,6 +1195,10 @@ static int goodix_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	error = goodix_firmware_check(ts);
+	if (error)
+		return error;
+
 	error = goodix_read_version(ts);
 	if (error)
 		return error;
@@ -1236,6 +1261,9 @@ static int __maybe_unused goodix_suspend(struct device *dev)
 	/* Free IRQ as IRQ pin is used as output in the suspend sequence */
 	goodix_free_irq(ts);
 
+	/* Save reference (calibration) info if necessary */
+	goodix_save_bak_ref(ts);
+
 	/* Output LOW on the INT pin for 5 ms */
 	error = goodix_irq_direction_output(ts, 0);
 	if (error) {
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
index b1d1bc004091..62138f930d1a 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -10,13 +10,48 @@
 #include <linux/regulator/consumer.h>
 
 /* Register defines */
+#define GOODIX_REG_MISCTL_DSP_CTL		0x4010
+#define GOODIX_REG_MISCTL_SRAM_BANK		0x4048
+#define GOODIX_REG_MISCTL_MEM_CD_EN		0x4049
+#define GOODIX_REG_MISCTL_CACHE_EN		0x404B
+#define GOODIX_REG_MISCTL_TMR0_EN		0x40B0
+#define GOODIX_REG_MISCTL_SWRST			0x4180
+#define GOODIX_REG_MISCTL_CPU_SWRST_PULSE	0x4184
+#define GOODIX_REG_MISCTL_BOOTCTL		0x4190
+#define GOODIX_REG_MISCTL_BOOT_OPT		0x4218
+#define GOODIX_REG_MISCTL_BOOT_CTL		0x5094
+
+#define GOODIX_REG_FW_SIG			0x8000
+#define GOODIX_FW_SIG_LEN			10
+
+#define GOODIX_REG_MAIN_CLK			0x8020
+#define GOODIX_MAIN_CLK_LEN			6
+
 #define GOODIX_REG_COMMAND			0x8040
 #define GOODIX_CMD_SCREEN_OFF			0x05
 
+#define GOODIX_REG_SW_WDT			0x8041
+
+#define GOODIX_REG_REQUEST			0x8043
+#define GOODIX_RQST_RESPONDED			0x00
+#define GOODIX_RQST_CONFIG			0x01
+#define GOODIX_RQST_BAK_REF			0x02
+#define GOODIX_RQST_RESET			0x03
+#define GOODIX_RQST_MAIN_CLOCK			0x04
+/*
+ * Unknown request which gets send by the controller aprox.
+ * every 34 seconds once it is up and running.
+ */
+#define GOODIX_RQST_UNKNOWN			0x06
+#define GOODIX_RQST_IDLE			0xFF
+
+#define GOODIX_REG_STATUS			0x8044
+
 #define GOODIX_GT1X_REG_CONFIG_DATA		0x8050
 #define GOODIX_GT9X_REG_CONFIG_DATA		0x8047
 #define GOODIX_REG_ID				0x8140
 #define GOODIX_READ_COOR_ADDR			0x814E
+#define GOODIX_REG_BAK_REF			0x99D0
 
 #define GOODIX_ID_MAX_LEN			4
 #define GOODIX_CONFIG_MAX_LENGTH		240
@@ -42,6 +77,7 @@ struct goodix_ts_data {
 	struct i2c_client *client;
 	struct input_dev *input_dev;
 	const struct goodix_chip_data *chip;
+	const char *firmware_name;
 	struct touchscreen_properties prop;
 	unsigned int max_touch_num;
 	unsigned int int_trigger_type;
@@ -62,6 +98,9 @@ struct goodix_ts_data {
 	unsigned int contact_size;
 	u8 config[GOODIX_CONFIG_MAX_LENGTH];
 	unsigned short keymap[GOODIX_MAX_KEYS];
+	u8 main_clk[GOODIX_MAIN_CLK_LEN];
+	int bak_ref_len;
+	u8 *bak_ref;
 };
 
 int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len);
@@ -71,4 +110,8 @@ int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len);
 int goodix_int_sync(struct goodix_ts_data *ts);
 int goodix_reset_no_int_sync(struct goodix_ts_data *ts);
 
+int goodix_firmware_check(struct goodix_ts_data *ts);
+bool goodix_handle_fw_request(struct goodix_ts_data *ts);
+void goodix_save_bak_ref(struct goodix_ts_data *ts);
+
 #endif
diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
new file mode 100644
index 000000000000..fa2993371ab3
--- /dev/null
+++ b/drivers/input/touchscreen/goodix_fwupload.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Goodix Touchscreen firmware upload support
+ *
+ * Copyright (c) 2021 Hans de Goede <hdegoede@redhat.com>
+ *
+ * This is a rewrite of gt9xx_update.c from the Allwinner H3 BSP which is:
+ * Copyright (c) 2010 - 2012 Goodix Technology.
+ * Author: andrew@goodix.com
+ */
+
+#include <linux/device.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include "goodix.h"
+
+#define GOODIX_FW_HEADER_LENGTH		sizeof(struct goodix_fw_header)
+#define GOODIX_FW_SECTION_LENGTH	0x2000
+#define GOODIX_FW_DSP_LENGTH		0x1000
+#define GOODIX_FW_UPLOAD_ADDRESS	0xc000
+
+#define GOODIX_CFG_LOC_HAVE_KEY		 7
+#define GOODIX_CFG_LOC_DRVA_NUM		27
+#define GOODIX_CFG_LOC_DRVB_NUM		28
+#define GOODIX_CFG_LOC_SENS_NUM		29
+
+struct goodix_fw_header {
+	u8 hw_info[4];
+	u8 pid[8];
+	u8 vid[2];
+} __packed;
+
+static u16 goodix_firmware_checksum(const u8 *data, int size)
+{
+	u16 checksum = 0;
+	int i;
+
+	for (i = 0; i < size; i += 2)
+		checksum += (data[i] << 8) + data[i + 1];
+
+	return checksum;
+}
+
+static int goodix_firmware_verify(struct device *dev, const struct firmware *fw)
+{
+	const struct goodix_fw_header *fw_header;
+	size_t expected_size;
+	const u8 *data;
+	u16 checksum;
+	char buf[9];
+
+	expected_size = GOODIX_FW_HEADER_LENGTH + 4 * GOODIX_FW_SECTION_LENGTH +
+			GOODIX_FW_DSP_LENGTH;
+	if (fw->size != expected_size) {
+		dev_err(dev, "Firmware has wrong size, expected %zu got %zu\n",
+			expected_size, fw->size);
+		return -EINVAL;
+	}
+
+	data = fw->data + GOODIX_FW_HEADER_LENGTH;
+	checksum = goodix_firmware_checksum(data, 4 * GOODIX_FW_SECTION_LENGTH);
+	if (checksum) {
+		dev_err(dev, "Main firmware checksum error\n");
+		return -EINVAL;
+	}
+
+	data += 4 * GOODIX_FW_SECTION_LENGTH;
+	checksum = goodix_firmware_checksum(data, GOODIX_FW_DSP_LENGTH);
+	if (checksum) {
+		dev_err(dev, "DSP firmware checksum error\n");
+		return -EINVAL;
+	}
+
+	fw_header = (const struct goodix_fw_header *)fw->data;
+	dev_info(dev, "Firmware hardware info %02x%02x%02x%02x\n",
+		 fw_header->hw_info[0], fw_header->hw_info[1],
+		 fw_header->hw_info[2], fw_header->hw_info[3]);
+	/* pid is a 8 byte buffer containing a string, weird I know */
+	memcpy(buf, fw_header->pid, 8);
+	buf[8] = 0;
+	dev_info(dev, "Firmware PID: %s VID: %02x%02x\n", buf,
+		 fw_header->vid[0], fw_header->vid[1]);
+	return 0;
+}
+
+static int goodix_enter_upload_mode(struct i2c_client *client)
+{
+	int tries, error;
+	u8 val;
+
+	tries = 200;
+	do {
+		error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_SWRST, 0x0c);
+		if (error)
+			return error;
+
+		error = goodix_i2c_read(client, GOODIX_REG_MISCTL_SWRST, &val, 1);
+		if (error)
+			return error;
+
+		if (val == 0x0c)
+			break;
+	} while (--tries);
+
+	if (!tries) {
+		dev_err(&client->dev, "Error could not hold ss51 & dsp\n");
+		return -EIO;
+	}
+
+	/* DSP_CK and DSP_ALU_CK PowerOn */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_DSP_CTL, 0x00);
+	if (error)
+		return error;
+
+	/* Disable watchdog */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_TMR0_EN, 0x00);
+	if (error)
+		return error;
+
+	/* Clear cache enable */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_CACHE_EN, 0x00);
+	if (error)
+		return error;
+
+	/* Set boot from SRAM */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_BOOTCTL, 0x02);
+	if (error)
+		return error;
+
+	/* Software reboot */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_CPU_SWRST_PULSE, 0x01);
+	if (error)
+		return error;
+
+	/* Clear control flag */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_BOOTCTL, 0x00);
+	if (error)
+		return error;
+
+	/* Set scramble */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_BOOT_OPT, 0x00);
+	if (error)
+		return error;
+
+	/* Enable accessing code */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_MEM_CD_EN, 0x01);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int goodix_start_firmware(struct i2c_client *client)
+{
+	int error;
+	u8 val;
+
+	/* Init software watchdog */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_SW_WDT, 0xaa);
+	if (error)
+		return error;
+
+	/* Release SS51 & DSP */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_MISCTL_SWRST, 0x00);
+	if (error)
+		return error;
+
+	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
+	if (error)
+		return error;
+
+	/* The value we've written to SW_WDT should have been cleared now */
+	if (val == 0xaa) {
+		dev_err(&client->dev, "Error SW_WDT reg not cleared on fw startup\n");
+		return -EIO;
+	}
+
+	/* Re-init software watchdog */
+	error = goodix_i2c_write_u8(client, GOODIX_REG_SW_WDT, 0xaa);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int goodix_firmware_upload(struct goodix_ts_data *ts)
+{
+	const struct firmware *fw;
+	char fw_name[64];
+	const u8 *data;
+	int error;
+
+	snprintf(fw_name, sizeof(fw_name), "goodix/%s", ts->firmware_name);
+
+	error = request_firmware(&fw, fw_name, &ts->client->dev);
+	if (error) {
+		dev_err(&ts->client->dev, "Firmware request error %d\n", error);
+		return error;
+	}
+
+	error = goodix_firmware_verify(&ts->client->dev, fw);
+	if (error)
+		goto release;
+
+	error = goodix_reset_no_int_sync(ts);
+	if (error)
+		return error;
+
+	error = goodix_enter_upload_mode(ts->client);
+	if (error)
+		goto release;
+
+	/* Select SRAM bank 0 and upload section 1 & 2 */
+	error = goodix_i2c_write_u8(ts->client, GOODIX_REG_MISCTL_SRAM_BANK, 0x00);
+	if (error)
+		goto release;
+
+	data = fw->data + GOODIX_FW_HEADER_LENGTH;
+	error = goodix_i2c_write(ts->client, GOODIX_FW_UPLOAD_ADDRESS,
+				 data, 2 * GOODIX_FW_SECTION_LENGTH);
+	if (error)
+		goto release;
+
+	/* Select SRAM bank 1 and upload section 3 & 4 */
+	error = goodix_i2c_write_u8(ts->client, GOODIX_REG_MISCTL_SRAM_BANK, 0x01);
+	if (error)
+		goto release;
+
+	data += 2 * GOODIX_FW_SECTION_LENGTH;
+	error = goodix_i2c_write(ts->client, GOODIX_FW_UPLOAD_ADDRESS,
+				 data, 2 * GOODIX_FW_SECTION_LENGTH);
+	if (error)
+		goto release;
+
+	/* Select SRAM bank 2 and upload the DSP firmware */
+	error = goodix_i2c_write_u8(ts->client, GOODIX_REG_MISCTL_SRAM_BANK, 0x02);
+	if (error)
+		goto release;
+
+	data += 2 * GOODIX_FW_SECTION_LENGTH;
+	error = goodix_i2c_write(ts->client, GOODIX_FW_UPLOAD_ADDRESS,
+				 data, GOODIX_FW_DSP_LENGTH);
+	if (error)
+		goto release;
+
+	error = goodix_start_firmware(ts->client);
+	if (error)
+		goto release;
+
+	error = goodix_int_sync(ts);
+release:
+	release_firmware(fw);
+	return error;
+}
+
+static int goodix_prepare_bak_ref(struct goodix_ts_data *ts)
+{
+	u8 have_key, driver_num, sensor_num;
+
+	if (ts->bak_ref)
+		return 0; /* Already done */
+
+	have_key = (ts->config[GOODIX_CFG_LOC_HAVE_KEY] & 0x01);
+
+	driver_num = (ts->config[GOODIX_CFG_LOC_DRVA_NUM] & 0x1f) +
+		     (ts->config[GOODIX_CFG_LOC_DRVB_NUM] & 0x1f);
+	if (have_key)
+		driver_num--;
+
+	sensor_num = (ts->config[GOODIX_CFG_LOC_SENS_NUM] & 0x0f) +
+		     ((ts->config[GOODIX_CFG_LOC_SENS_NUM] >> 4) & 0x0f);
+
+	dev_dbg(&ts->client->dev, "Drv %d Sen %d Key %d\n", driver_num, sensor_num, have_key);
+
+	ts->bak_ref_len = (driver_num * (sensor_num - 2) + 2) * 2;
+
+	ts->bak_ref = devm_kzalloc(&ts->client->dev, ts->bak_ref_len, GFP_KERNEL);
+	if (!ts->bak_ref)
+		return -ENOMEM;
+
+	/*
+	 * The bak_ref array contains the backup of an array of (self/auto)
+	 * calibration related values which the Android version of the driver
+	 * stores on the filesystem so that it can be restored after reboot.
+	 * The mainline kernel never writes directly to the filesystem like
+	 * this, we always start will all the values which give a correction
+	 * factor in approx. the -20 - +20 range (in 2s complement) set to 0.
+	 *
+	 * Note the touchscreen works fine without restoring the reference
+	 * values after a reboot / power-cycle.
+	 *
+	 * The last 2 bytes are a 16 bits unsigned checksum which is expected
+	 * to make the addition al all 16 bit unsigned values in the array add
+	 * up to 1 (rather then the usual 0), so we must set the last byte to 1.
+	 */
+	ts->bak_ref[ts->bak_ref_len - 1] = 1;
+
+	return 0;
+}
+
+static int goodix_send_main_clock(struct goodix_ts_data *ts)
+{
+	u32 main_clk = 54; /* Default main clock */
+	u8 checksum = 0;
+	int i;
+
+	device_property_read_u32(&ts->client->dev, "goodix,main-clk", &main_clk);
+
+	for (i = 0; i < (GOODIX_MAIN_CLK_LEN - 1); i++) {
+		ts->main_clk[i] = main_clk;
+		checksum += main_clk;
+	}
+
+	/* The value of all bytes combines must be 0 */
+	ts->main_clk[GOODIX_MAIN_CLK_LEN - 1] = 256 - checksum;
+
+	return goodix_i2c_write(ts->client, GOODIX_REG_MAIN_CLK,
+				ts->main_clk, GOODIX_MAIN_CLK_LEN);
+}
+
+int goodix_firmware_check(struct goodix_ts_data *ts)
+{
+	device_property_read_string(&ts->client->dev, "firmware-name", &ts->firmware_name);
+	if (!ts->firmware_name)
+		return 0;
+
+	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
+		dev_err(&ts->client->dev, "Error no IRQ-pin access method, cannot upload fw.\n");
+		return -EINVAL;
+	}
+
+	dev_info(&ts->client->dev, "Touchscreen controller needs fw-upload\n");
+	ts->load_cfg_from_disk = true;
+
+	return goodix_firmware_upload(ts);
+}
+
+bool goodix_handle_fw_request(struct goodix_ts_data *ts)
+{
+	int error;
+	u8 val;
+
+	error = goodix_i2c_read(ts->client, GOODIX_REG_REQUEST, &val, 1);
+	if (error)
+		return false;
+
+	switch (val) {
+	case GOODIX_RQST_RESPONDED:
+		/* If we read back our own last ack the IRQ was not for a request */
+		return false;
+	case GOODIX_RQST_CONFIG:
+		error = goodix_send_cfg(ts, ts->config, ts->chip->config_len);
+		if (error)
+			return false;
+
+		break;
+	case GOODIX_RQST_BAK_REF:
+		error = goodix_prepare_bak_ref(ts);
+		if (error)
+			return false;
+
+		error = goodix_i2c_write(ts->client, GOODIX_REG_BAK_REF,
+					 ts->bak_ref, ts->bak_ref_len);
+		if (error)
+			return false;
+
+		break;
+	case GOODIX_RQST_RESET:
+		error = goodix_firmware_upload(ts);
+		if (error)
+			return false;
+
+		break;
+	case GOODIX_RQST_MAIN_CLOCK:
+		error = goodix_send_main_clock(ts);
+		if (error)
+			return false;
+
+		break;
+	case GOODIX_RQST_UNKNOWN:
+	case GOODIX_RQST_IDLE:
+		break;
+	default:
+		dev_err_ratelimited(&ts->client->dev, "Unknown Request: 0x%02x\n", val);
+	}
+
+	/* Ack the request */
+	goodix_i2c_write_u8(ts->client, GOODIX_REG_REQUEST, GOODIX_RQST_RESPONDED);
+	return true;
+}
+
+void goodix_save_bak_ref(struct goodix_ts_data *ts)
+{
+	int error;
+	u8 val;
+
+	if (!ts->firmware_name)
+		return;
+
+	error = goodix_i2c_read(ts->client, GOODIX_REG_STATUS, &val, 1);
+	if (error)
+		return;
+
+	if (!(val & 0x80))
+		return;
+
+	error = goodix_i2c_read(ts->client, GOODIX_REG_BAK_REF,
+				ts->bak_ref, ts->bak_ref_len);
+	if (error) {
+		memset(ts->bak_ref, 0, ts->bak_ref_len);
+		ts->bak_ref[ts->bak_ref_len - 1] = 1;
+	}
+}
-- 
2.31.1


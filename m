Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BF93FCE8E
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 22:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240870AbhHaU0f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 16:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbhHaU0d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 16:26:33 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2BDC061575
        for <linux-input@vger.kernel.org>; Tue, 31 Aug 2021 13:25:35 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 66A1683129;
        Tue, 31 Aug 2021 22:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630441533;
        bh=r+42Uq0vNe+9somSpFEJjuqh+l532mpJHL/ZOJ7hNKA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tVkUqcV0y9NtpOC1eR8q7JREpoVfc0mrHwvCa9pC0vVBLD+VZXXVDKLQN74rKC/9Z
         PyQXGHGZwiwPIw8ZhcEVi3c+m1IhRE7/2NqYQ+cSjkcVa2uV3mh9SFvMAD0ww5LexQ
         agbd+PTDX64ICnEmMNEx+D9zRAvOz8F9hrctNo1/QpT+FEw1DQE8JYziKmHj7d1hkw
         d1ta+E+kWi0q55/QMHyxz+i54XlvlLrvC0KKU5lIC9j9MFL1xdnFyAw9ds5OcLHT/D
         51PNcSzmZWIR911hWwX0dfcRDS4UMufUh06rwgwvr/m2DDYhWBX5q8oI65kYSqokFG
         jk0ICy+MLIojw==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     ch@denx.de, Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH v3 3/3] Input: ili210x - add ili251x firmware update support
Date:   Tue, 31 Aug 2021 22:25:06 +0200
Message-Id: <20210831202506.181927-3-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210831202506.181927-1-marex@denx.de>
References: <20210831202506.181927-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ili251x firmware can be updated, this is used when switching between
different modes of operation of the touch surface, e.g. glove operation.
This patch implements the firmware update mechanism triggered by a write
into an sysfs attribute.

The firmware itself is distributed as an intel hex file with non-standard
types. The first two lines are of type 0xad, which indicates the start of
DataFlash payload, that is always at address 0xf000 on the ili251x, so it
can be dropped, and 0xac which indicates the position of firmware info in
the Application payload, that is always at address 0x2020 on the ili251x
and we do not care. The rest of the firmware is data of type 0x00, and we
care about that. To convert the firmware hex file into something usable
by the kernel, remove the first two lines and then use ihex2fw:

 $ tail -n +3 input.hex > temp.hex
 $ ./tools/firmware/ihex2fw temp.hex firmware/ilitek/ili251x.bin

To trigger the firmware update, place firmware file ilitek/ili251x.bin
into /lib/firmware/, write into firmware_update sysfs attribute and wait
about 30-40 seconds. The firmware update is slow. Afterward, verify the
firmware_version and mode sysfs attributes to check whether the firmware
got updated and the controller switched back to application (AP) mode by
reading out 'mode' attribute in sysfs.

Note that the content of firmware_version, e.g. 0600.0005.abcd.aa04 can
be matched to the content of the firmware hex file. The first four bytes,
0x06 0x00 0x00 0x05 can be found at ^:102030 00 05000006, the next four
bytes 0xab 0xcd 0xaa 0x04 at ^:10F000 00 nnnnnnnn ABCDAA04.

Note that the protocol differs considerably between the ili2xxx devices,
this patch therefore implements this functionality only for ili251x that
I can test.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
V2: - Rename REG_IC_MODE to REG_GET_MODE, since it is pair command to REG_SET_MODE
    - Replace 0xc7 in code with REG_READ_DATA_CRC macro
    - Handle firmware name with newline at the end
    - Update X and Y resolution after firmware update, the FW could have
      changed the resolution
V3: - Rename variable ret to error
    - Use kzalloc()
    - Fix last firmware block check, abort of last firmware block
      in the firmware blob is above 0xffe0, i.e. less than 32 bytes
      from the end of the max 64 kiB firmware blob. Add comment about
      this.
    - Pick some sort of symbolic name for the register 0x80 (BUSY)
    - Replace dev_info() with dev_dbg()
    - Call ili251x_firmware_update_cached_state() to update all the
      cached state after firmware update
    - Use disable_irq()/enable_irq() to prevent the IRQ handler from
      firing during firmware update.
    - Drop custom firmware filename support for now, use ili251x.bin
      for the firmware filename.
---
 drivers/input/touchscreen/Kconfig   |   1 +
 drivers/input/touchscreen/ili210x.c | 312 ++++++++++++++++++++++++++++
 2 files changed, 313 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index ad454cd2855a..4d34043cdf01 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -425,6 +425,7 @@ config TOUCHSCREEN_HYCON_HY46XX
 config TOUCHSCREEN_ILI210X
 	tristate "Ilitek ILI210X based touchscreen"
 	depends on I2C
+	select CRC_CCITT
 	help
 	  Say Y here if you have a ILI210X based touchscreen
 	  controller. This driver supports models ILI2102,
diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index a4da753d9355..9a8bd901c9d3 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/crc-ccitt.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/ihex.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
@@ -25,11 +27,20 @@
 #define REG_FIRMWARE_VERSION	0x40
 #define REG_PROTOCOL_VERSION	0x42
 #define REG_KERNEL_VERSION	0x61
+#define REG_IC_BUSY		0x80
+#define REG_IC_BUSY_NOT_BUSY	0x50
 #define REG_GET_MODE		0xc0
 #define REG_GET_MODE_AP		0x5a
 #define REG_GET_MODE_BL		0x55
+#define REG_SET_MODE_AP		0xc1
+#define REG_SET_MODE_BL		0xc2
+#define REG_WRITE_DATA		0xc3
+#define REG_WRITE_ENABLE	0xc4
+#define REG_READ_DATA_CRC	0xc7
 #define REG_CALIBRATE		0xcc
 
+#define ILI251X_FW_FILENAME	"ilitek/ili251x.bin"
+
 struct ili2xxx_chip {
 	int (*read_reg)(struct i2c_client *client, u8 reg,
 			void *buf, size_t len);
@@ -546,8 +557,309 @@ static ssize_t ili210x_calibrate(struct device *dev,
 }
 static DEVICE_ATTR(calibrate, S_IWUSR, NULL, ili210x_calibrate);
 
+static int ili251x_firmware_to_buffer(struct device *dev,
+				      const char *fwname, u8 **buf,
+				      u16 *ac_end, u16 *df_end)
+{
+	const struct firmware *fw = NULL;
+	const struct ihex_binrec *rec;
+	u32 fw_addr, fw_last_addr = 0;
+	u16 fw_len;
+	u8 *fw_buf;
+	int error;
+
+	error = request_ihex_firmware(&fw, fwname, dev);
+	if (error) {
+		dev_err(dev, "Failed to request firmware %s, error=%d\n",
+			fwname, error);
+		return error;
+	}
+
+	/*
+	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
+	 * simple -- allocate a 64 kiB buffer, iterate over the ihex blob records
+	 * once, copy them all into this buffer at the right locations, and then
+	 * do all operations on this linear buffer.
+	 */
+	fw_buf = kzalloc(SZ_64K, GFP_KERNEL);
+	if (!fw_buf) {
+		error = -ENOMEM;
+		goto err_alloc;
+	}
+
+	rec = (const struct ihex_binrec *)fw->data;
+	while (rec) {
+		fw_addr = be32_to_cpu(rec->addr);
+		fw_len = be16_to_cpu(rec->len);
+
+		/* The last 32 Byte firmware block can be 0xffe0 */
+		if (fw_addr + fw_len > SZ_64K || fw_addr > SZ_64K - 32) {
+			error = -EFBIG;
+			goto err_big;
+		}
+
+		/* Find the last address before DF start address, that is AC end */
+		if (fw_addr == 0xf000)
+			*ac_end = fw_last_addr;
+		fw_last_addr = fw_addr + fw_len;
+
+		memcpy(fw_buf + fw_addr, rec->data, fw_len);
+		rec = ihex_next_binrec(rec);
+	}
+
+	/* DF end address is the last address in the firmware blob */
+	*df_end = fw_addr + fw_len;
+	*buf = fw_buf;
+	release_firmware(fw);
+	return 0;
+err_big:
+	kfree(fw_buf);
+err_alloc:
+	release_firmware(fw);
+	return error;
+}
+
+/* Switch mode between Application and BootLoader */
+static int ili251x_switch_ic_mode(struct i2c_client *client, u8 cmd_mode)
+{
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 cmd_wren[3] = { REG_WRITE_ENABLE, 0x5a, 0xa5 };
+	u8 md[2];
+	int error;
+
+	error = priv->chip->read_reg(client, REG_GET_MODE, md, sizeof(md));
+	if (error)
+		return error;
+	/* Mode already set */
+	if ((cmd_mode == REG_SET_MODE_AP && md[0] == REG_GET_MODE_AP) ||
+	    (cmd_mode == REG_SET_MODE_BL && md[0] == REG_GET_MODE_BL))
+		return 0;
+
+	/* Unlock writes */
+	error = i2c_master_send(client, cmd_wren, sizeof(cmd_wren));
+	if (error != sizeof(cmd_wren))
+		return -EINVAL;
+
+	mdelay(20);
+
+	/* Select mode (BootLoader or Application) */
+	error = i2c_master_send(client, &cmd_mode, 1);
+	if (error != 1)
+		return -EINVAL;
+
+	mdelay(200);	/* Reboot into bootloader takes a lot of time ... */
+
+	/* Read back mode */
+	error = priv->chip->read_reg(client, REG_GET_MODE, md, sizeof(md));
+	if (error)
+		return error;
+	/* Check if mode is correct now. */
+	if ((cmd_mode == REG_SET_MODE_AP && md[0] == REG_GET_MODE_AP) ||
+	    (cmd_mode == REG_SET_MODE_BL && md[0] == REG_GET_MODE_BL))
+		return 0;
+
+	return -EINVAL;
+}
+
+static int ili251x_firmware_busy(struct i2c_client *client)
+{
+	struct ili210x *priv = i2c_get_clientdata(client);
+	int error, i = 0;
+	u8 data;
+
+	do {
+		/* The read_reg already contains suitable delay */
+		error = priv->chip->read_reg(client, REG_IC_BUSY, &data, 1);
+		if (error)
+			return error;
+		if (i++ == 100000)
+			return -ETIMEDOUT;
+	} while (data != REG_IC_BUSY_NOT_BUSY);
+
+	return 0;
+}
+
+static int ili251x_firmware_write_to_ic(struct device *dev, u8 *fwbuf,
+					u16 start, u16 end, u8 dataflash)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 cmd_crc = REG_READ_DATA_CRC;
+	u8 crcrb[4] = { 0 };
+	u8 fw_data[33];
+	u16 fw_addr;
+	int error;
+
+	/*
+	 * The DF (dataflash) needs 2 bytes offset for unknown reasons,
+	 * the AC (application) has 2 bytes CRC16-CCITT at the end.
+	 */
+	u16 crc = crc_ccitt(0, fwbuf + start + (dataflash ? 2 : 0),
+			    end - start - 2);
+
+	/* Unlock write to either AC (application) or DF (dataflash) area */
+	u8 cmd_wr[10] = {
+		REG_WRITE_ENABLE, 0x5a, 0xa5, dataflash,
+		(end >> 16) & 0xff, (end >> 8) & 0xff, end & 0xff,
+		(crc >> 16) & 0xff, (crc >> 8) & 0xff, crc & 0xff
+	};
+
+	error = i2c_master_send(client, cmd_wr, sizeof(cmd_wr));
+	if (error != sizeof(cmd_wr))
+		return -EINVAL;
+
+	error = ili251x_firmware_busy(client);
+	if (error)
+		return error;
+
+	for (fw_addr = start; fw_addr < end; fw_addr += 32) {
+		fw_data[0] = REG_WRITE_DATA;
+		memcpy(&(fw_data[1]), fwbuf + fw_addr, 32);
+		error = i2c_master_send(client, fw_data, 33);
+		if (error != sizeof(fw_data))
+			return error;
+		error = ili251x_firmware_busy(client);
+		if (error)
+			return error;
+	}
+
+	error = i2c_master_send(client, &cmd_crc, 1);
+	if (error != 1)
+		return -EINVAL;
+
+	error = ili251x_firmware_busy(client);
+	if (error)
+		return error;
+
+	error = priv->chip->read_reg(client, REG_READ_DATA_CRC,
+				   &crcrb, sizeof(crcrb));
+	if (error)
+		return error;
+
+	/* Check CRC readback */
+	if ((crcrb[0] != (crc & 0xff)) || crcrb[1] != ((crc >> 8) & 0xff))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ili251x_firmware_reset(struct i2c_client *client)
+{
+	u8 cmd_reset[2] = { 0xf2, 0x01 };
+	int error;
+
+	error = i2c_master_send(client, cmd_reset, sizeof(cmd_reset));
+	if (error != sizeof(cmd_reset))
+		return -EINVAL;
+
+	return ili251x_firmware_busy(client);
+}
+
+static void ili251x_hardware_reset(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+
+	/* Reset the controller */
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(10000, 15000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	msleep(300);
+}
+
+static ssize_t ili210x_firmware_update_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	const char *fwname = ILI251X_FW_FILENAME;
+	u16 ac_end, df_end;
+	u8 *fwbuf;
+	int error;
+	int i;
+
+	error = ili251x_firmware_to_buffer(dev, fwname, &fwbuf, &ac_end, &df_end);
+	if (error)
+		return error;
+
+	/*
+	 * Disable touchscreen IRQ, so that we would not get spurious touch
+	 * interrupt during firmware update, and so that the IRQ handler won't
+	 * trigger and interfere with the firmware update. There is no bit in
+	 * the touch controller to disable the IRQs during update, so we have
+	 * to do it this way here.
+	 */
+	disable_irq(client->irq);
+
+	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
+
+	ili251x_hardware_reset(dev);
+
+	error = ili251x_firmware_reset(client);
+	if (error)
+		goto exit;
+
+	/* This may not succeed on first try, so re-try a few times. */
+	for (i = 0; i < 5; i++) {
+		error = ili251x_switch_ic_mode(client, REG_SET_MODE_BL);
+		if (!error)
+			break;
+	}
+
+	if (error)
+		goto exit;
+
+	dev_dbg(dev, "IC is now in BootLoader mode\n");
+
+	msleep(200);	/* The bootloader seems to need some time too. */
+
+	error = ili251x_firmware_write_to_ic(dev, fwbuf, 0xf000, df_end, 1);
+	if (error) {
+		dev_err(dev, "DF firmware update failed, error=%d\n", error);
+		goto exit;
+	}
+
+	dev_dbg(dev, "DataFlash firmware written\n");
+
+	error = ili251x_firmware_write_to_ic(dev, fwbuf, 0x2000, ac_end, 0);
+	if (error) {
+		dev_err(dev, "AC firmware update failed, error=%d\n", error);
+		goto exit;
+	}
+
+	dev_dbg(dev, "Application firmware written\n");
+
+	/* This may not succeed on first try, so re-try a few times. */
+	for (i = 0; i < 5; i++) {
+		error = ili251x_switch_ic_mode(client, REG_SET_MODE_AP);
+		if (!error)
+			break;
+	}
+
+	if (error)
+		goto exit;
+
+	dev_dbg(dev, "IC is now in Application mode\n");
+
+	error = ili251x_firmware_update_cached_state(dev);
+	if (error)
+		goto exit;
+
+	error = count;
+
+exit:
+	ili251x_hardware_reset(dev);
+	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
+	enable_irq(client->irq);
+	kfree(fwbuf);
+	return error;
+}
+
+static DEVICE_ATTR(firmware_update, 0200, NULL, ili210x_firmware_update_store);
+
 static struct attribute *ili210x_attributes[] = {
 	&dev_attr_calibrate.attr,
+	&dev_attr_firmware_update.attr,
 	&dev_attr_firmware_version.attr,
 	&dev_attr_kernel_version.attr,
 	&dev_attr_protocol_version.attr,
-- 
2.33.0


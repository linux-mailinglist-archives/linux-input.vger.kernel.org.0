Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900A53F2178
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 22:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhHSUTD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 16:19:03 -0400
Received: from phobos.denx.de ([85.214.62.61]:43916 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231683AbhHSUTC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 16:19:02 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AADFB80F47;
        Thu, 19 Aug 2021 22:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629404305;
        bh=NEqC85ilOkEZPLWwsARDpxYbWvqOBDg/qEveQG7twjo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lSZWFXGK9H0K5T2fbA9zak/RG6W8MO0I7zvDEMiGbq97gz6cERlFoJNdRAL/QsH3k
         vhCijihaLuSaE31JQ5FB1bKqJ/czVJGdvD2ZP2qkZFw9OQmnwZZKgAGjYVJyqo6/TV
         oACvlS6T7/8igsQHFGb7MODzjHNH+n+iSxCVVJOKbNvH3W6oiSf2T3hBCqbES81Vd6
         qFYDeXF0q+IiNb7gEPrX7aDGgPV4c4p1WZE22kmE9K1A7EI1ejfr6aas7iiUL98lfA
         fAkBJVfEXS+XLOWliiOahG4vLqofYhV9DnDg/PYMhCZJhW0focvXbQHS78FF2pAnpI
         3qE2dZDtzlpNw==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     ch@denx.de, Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH 2/2] Input: ili210x - add ili251x firmware update support
Date:   Thu, 19 Aug 2021 22:17:59 +0200
Message-Id: <20210819201759.2084481-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819201759.2084481-1-marex@denx.de>
References: <20210819201759.2084481-1-marex@denx.de>
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
of firmware name into an sysfs attribute.

The firmware itself is distributed as an intel hex file with non-standard
types. The first two lines are of type 0xad, which indicates the start of
DataFlash payload, that is always at address 0xf000 on the ili251x, so it
can be dropped, and 0xac which indicates the position of firmware info in
the Application payload, that is always at address 0x2020 on the ili251x
and we do not care. The rest of the firmware is data of type 0x00, and we
care about that. To convert the firmware hex file into something usable
by the kernel, remove the first two lines and then use ihex2fw:

 $ tail -n +3 input.hex > temp.hex
 $ ./tools/firmware/ihex2fw temp.hex firmware/touch.bin

To trigger the firmware update, place touch.bin or whichever file name
you pick into /lib/firmware/, write that zero terminated file name into
firmware_update sysfs attribute, wait about 30-40 seconds. The firmware
update is slow. Then verify firmware_version and mode sysfs attributes
to verify whether the firmware got updated and the controller switched
back to application (AP) mode by reading out firmware_version attribute
in sysfs.

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
 drivers/input/touchscreen/Kconfig   |   1 +
 drivers/input/touchscreen/ili210x.c | 291 ++++++++++++++++++++++++++++
 2 files changed, 292 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index ad454cd2855a0..4d34043cdf010 100644
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
index 894f74dba5abf..f754356a98b29 100644
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
@@ -28,6 +30,10 @@
 #define REG_IC_MODE		0xc0
 #define REG_IC_MODE_AP		0x5a
 #define REG_IC_MODE_BL		0x55
+#define REG_SET_MODE_AP		0xc1
+#define REG_SET_MODE_BL		0xc2
+#define REG_WRITE_DATA		0xc3
+#define REG_WRITE_ENABLE	0xc4
 #define REG_CALIBRATE		0xcc
 
 struct ili2xxx_chip {
@@ -460,8 +466,293 @@ static ssize_t ili210x_calibrate(struct device *dev,
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
+	int ret;
+
+	ret = request_ihex_firmware(&fw, fwname, dev);
+	if (ret) {
+		dev_err(dev, "Failed to request firmware %s, ret=%d\n", fwname, ret);
+		return ret;
+	}
+
+	/*
+	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
+	 * simple -- allocate a 64 kiB buffer, iterate over the ihex blob records
+	 * once, copy them all into this buffer at the right locations, and then
+	 * do all operations on this linear buffer.
+	 */
+	fw_buf = kcalloc(1, SZ_64K, GFP_KERNEL);
+	if (!fw_buf) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	rec = (const struct ihex_binrec *)fw->data;
+	while (rec) {
+		fw_addr = be32_to_cpu(rec->addr);
+		fw_len = be16_to_cpu(rec->len);
+
+		if (fw_addr + fw_len > SZ_64K) {
+			ret = -EFBIG;
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
+err_big:
+	kfree(fw_buf);
+err_alloc:
+	release_firmware(fw);
+	return ret;
+}
+
+/* Switch mode between Application and BootLoader */
+static int ili251x_switch_ic_mode(struct i2c_client *client, u8 cmd_mode)
+{
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 cmd_wren[3] = { REG_WRITE_ENABLE, 0x5a, 0xa5 };
+	u8 md[2];
+	int ret;
+
+	ret = priv->chip->read_reg(client, REG_IC_MODE, md, sizeof(md));
+	if (ret)
+		return ret;
+	/* Mode already set */
+	if ((cmd_mode == REG_SET_MODE_AP && md[0] == REG_IC_MODE_AP) ||
+	    (cmd_mode == REG_SET_MODE_BL && md[0] == REG_IC_MODE_BL))
+		return 0;
+
+	/* Unlock writes */
+	ret = i2c_master_send(client, cmd_wren, sizeof(cmd_wren));
+	if (ret != sizeof(cmd_wren))
+		return -EINVAL;
+
+	mdelay(20);
+
+	/* Select mode (BootLoader or Application) */
+	ret = i2c_master_send(client, &cmd_mode, 1);
+	if (ret != 1)
+		return -EINVAL;
+
+	mdelay(200);	/* Reboot into bootloader takes a lot of time ... */
+
+	/* Read back mode */
+	ret = priv->chip->read_reg(client, REG_IC_MODE, md, sizeof(md));
+	if (ret)
+		return ret;
+	/* Check if mode is correct now. */
+	if ((cmd_mode == REG_SET_MODE_AP && md[0] == REG_IC_MODE_AP) ||
+	    (cmd_mode == REG_SET_MODE_BL && md[0] == REG_IC_MODE_BL))
+		return 0;
+
+	return -EINVAL;
+}
+
+static int ili251x_firmware_busy(struct i2c_client *client)
+{
+	struct ili210x *priv = i2c_get_clientdata(client);
+	int ret, i = 0;
+	u8 data;
+
+	do {
+		/* The read_reg already contains suitable delay */
+		ret = priv->chip->read_reg(client, 0x80, &data, 1);
+		if (ret)
+			return ret;
+		if (i++ == 100000)
+			return -ETIMEDOUT;
+	} while (data != 0x50);
+
+	return 0;
+}
+
+static int ili251x_firmware_write_to_ic(struct device *dev, u8 *fwbuf,
+					u16 start, u16 end, u8 dataflash)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 crcrb[4] = { 0 };
+	u8 cmd_mode = 0xc7;
+	u8 fw_data[33];
+	u16 fw_addr;
+	int ret;
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
+	ret = i2c_master_send(client, cmd_wr, sizeof(cmd_wr));
+	if (ret != sizeof(cmd_wr))
+		return -EINVAL;
+
+	ret = ili251x_firmware_busy(client);
+	if (ret)
+		return ret;
+
+	for (fw_addr = start; fw_addr < end; fw_addr += 32) {
+		fw_data[0] = REG_WRITE_DATA;
+		memcpy(&(fw_data[1]), fwbuf + fw_addr, 32);
+		ret = i2c_master_send(client, fw_data, 33);
+		if (ret != sizeof(fw_data))
+			return ret;
+		ret = ili251x_firmware_busy(client);
+		if (ret)
+			return ret;
+	}
+
+	ret = i2c_master_send(client, &cmd_mode, 1);
+	if (ret != 1)
+		return -EINVAL;
+
+	ret = ili251x_firmware_busy(client);
+	if (ret)
+		return ret;
+
+	ret = priv->chip->read_reg(client, 0xc7, &crcrb, sizeof(crcrb));
+	if (ret)
+		return ret;
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
+	int ret;
+
+	ret = i2c_master_send(client, cmd_reset, sizeof(cmd_reset));
+	if (ret != sizeof(cmd_reset))
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
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u16 ac_end, df_end;
+	u8 *fwbuf;
+	int ret;
+	int i;
+
+	ret = ili251x_firmware_to_buffer(dev, buf, &fwbuf, &ac_end, &df_end);
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->lock);
+
+	dev_info(dev, "Firmware update started, firmware=%s\n", buf);
+
+	ili251x_hardware_reset(dev);
+
+	ret = ili251x_firmware_reset(client);
+	if (ret)
+		goto exit;
+
+	/* This may not succeed on first try, so re-try a few times. */
+	for (i = 0; i < 5; i++) {
+		ret = ili251x_switch_ic_mode(client, REG_SET_MODE_BL);
+		if (!ret)
+			break;
+	}
+
+	if (ret)
+		goto exit;
+
+	dev_info(dev, "IC is now in BootLoader mode\n");
+
+	msleep(200);	/* The bootloader seems to need some time too. */
+
+	ret = ili251x_firmware_write_to_ic(dev, fwbuf, 0xf000, df_end, 1);
+	if (ret) {
+		dev_err(dev, "DF firmware update failed, ret=%d\n", ret);
+		goto exit;
+	}
+
+	dev_info(dev, "DataFlash firmware written\n");
+
+	ret = ili251x_firmware_write_to_ic(dev, fwbuf, 0x2000, ac_end, 0);
+	if (ret) {
+		dev_err(dev, "AC firmware update failed, ret=%d\n", ret);
+		goto exit;
+	}
+
+	dev_info(dev, "Application firmware written\n");
+
+	/* This may not succeed on first try, so re-try a few times. */
+	for (i = 0; i < 5; i++) {
+		ret = ili251x_switch_ic_mode(client, REG_SET_MODE_AP);
+		if (!ret)
+			break;
+	}
+
+	if (ret)
+		goto exit;
+
+	dev_info(dev, "IC is now in Application mode\n");
+
+	ret = count;
+
+exit:
+	ili251x_hardware_reset(dev);
+	dev_info(dev, "Firmware update ended, ret=%i\n", ret);
+	mutex_unlock(&priv->lock);
+	kfree(fwbuf);
+	return ret;
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
2.30.2


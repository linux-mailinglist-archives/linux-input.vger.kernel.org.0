Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9C0302A2B
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 19:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbhAYS0u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 13:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbhAYS0e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 13:26:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE63C06178A
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:25:32 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1l46YM-00041I-6C; Mon, 25 Jan 2021 19:25:30 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v3 5/5] Input: exc3000 - add firmware update support
Date:   Mon, 25 Jan 2021 19:25:27 +0100
Message-Id: <20210125182527.1225245-6-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210125182527.1225245-1-l.stach@pengutronix.de>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change allows the device firmware to be updated by putting a firmware
file in /lib/firmware and providing the name of the file via the update_fw
sysfs property. The driver will then flash the firmware image into the
controller internal storage and restart the controller to activate the new
firmware.

The implementation was done by looking at the the messages passed between
the controller and proprietary vendor update tool. Not every detail of the
protocol is totally well understood, so the implementation still has some
"monkey see, monkey do" parts, as far as they have been found to be required
for the update to succeed.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../ABI/testing/sysfs-driver-input-exc3000    |  20 ++
 drivers/input/touchscreen/exc3000.c           | 240 +++++++++++++++++-
 2 files changed, 258 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Documentation/ABI/testing/sysfs-driver-input-exc3000
index 704434b277b0..123a00ccee8b 100644
--- a/Documentation/ABI/testing/sysfs-driver-input-exc3000
+++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
@@ -24,3 +24,23 @@ Description:	Reports the type identification provided by the touchscreen, for ex
 		Access: Read
 
 		Valid values: Represented as string
+
+What:		/sys/bus/i2c/devices/xxx/update_fw
+Date:		Jan 2021
+Contact:	linux-input@vger.kernel.org
+Description:	Allows to specify a firlename of a firmware file located in /lib/firmware/ that will be
+		used to update the application firmware on the touchscreen controller. For example
+		"eeti/eeti_27_0_EDipper_0735.fw"
+
+		Access: Write
+
+		Valid values: Represented as string
+
+What:		/sys/bus/i2c/devices/xxx/update_fw_status
+Date:		Jan 2021
+Contact:	linux-input@vger.kernel.org
+Description:	Reports the current status of a in-progress controller firmware update.
+
+		Access: Read
+
+		Valid values: Represented as percentage between 0 and 100.
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 74ba03dcaaf7..07767a8cbad7 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -3,8 +3,8 @@
  * Driver for I2C connected EETI EXC3000 multiple touch controller
  *
  * Copyright (C) 2017 Ahmet Inan <inan@distec.de>
- *
- * minimal implementation based on egalax_ts.c and egalax_i2c.c
+ * Copyright (C) 2019 Pengutronix <kernel@pengutronix.de>
+ * Copyright (C) 2019 Zodiac Inflight Innovations
  */
 
 #include <linux/bitops.h>
@@ -21,6 +21,8 @@
 #include <linux/sizes.h>
 #include <linux/timer.h>
 #include <asm/unaligned.h>
+#include <linux/firmware.h>
+#include <linux/delay.h>
 
 #define EXC3000_NUM_SLOTS		10
 #define EXC3000_SLOTS_PER_FRAME		5
@@ -78,6 +80,7 @@ struct exc3000_data {
 	u8 buf[2 * EXC3000_LEN_FRAME];
 	struct completion wait_event;
 	struct mutex query_lock;
+	int update_status;
 };
 
 static void exc3000_report_slots(struct input_dev *input,
@@ -314,10 +317,243 @@ static ssize_t type_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(type);
 
+static void exc3000_generate_unlock_response(u8 *challenge, u8 *response)
+{
+	u8 op, rot, sum;
+	int i;
+
+	op = challenge[0] + challenge[3];
+	rot = challenge[1] + challenge[2];
+	sum = challenge[0] + challenge[1] + challenge[2] + challenge[3];
+
+	for (i = 0; i < 4; i++) {
+		if ((op >> i) & 0x1) {
+			response[i] = sum + challenge[(rot + i) & 0x3];
+		} else {
+			response[i] = sum - challenge[(rot + i) & 0x3];
+		}
+	}
+}
+
+static int exc3000_firmware_update(struct exc3000_data *data,
+				   const struct firmware *fw)
+{
+	struct device *dev = &data->client->dev;
+	u8 resp[EXC3000_LEN_FRAME];
+	int ret, i;
+
+	dev_info(dev, "starting firmware update\n");
+
+	/* 1: check device state */
+	ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x02}, 2, resp, 1);
+	if (ret < 0)
+		goto out;
+
+	/* 2: switch state from app to bootloader mode if necessary */
+	if (!resp[2] && !resp[3]) {
+		u8 unlock_req[6] = { 0x3a, 0xfc };
+
+		dev_dbg(dev, "device in app mode, switching to bootloader\n");
+
+		/* 2.1 request unlock challenge */
+		ret = exc3000_vendor_data_request(data,
+						  (u8[]){0x3a, 0xfb}, 2,
+						  resp, 1);
+		if (ret < 0)
+			goto out;
+
+		/* 2.2 generate and send response */
+		exc3000_generate_unlock_response(&resp[2], &unlock_req[2]);
+		ret = exc3000_vendor_data_request(data, unlock_req, 6, resp, 1);
+		if (ret < 0)
+			goto out;
+
+		if (resp[2] != 0x01) {
+			dev_err(dev, "device unlock failed, aborting\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* 2.3 unknown, but required and invariant data */
+		ret = exc3000_vendor_data_request(data,
+						  (u8[]){0x3a, 0xfe, 0x34,
+						         0x43, 0xcc}, 5,
+						  resp, 1);
+		if (ret < 0)
+			goto out;
+
+		/* 2.4 reset controller */
+		ret = exc3000_vendor_data_request(data, (u8[]){0x3a, 0xff},
+						  2, NULL, 1);
+		if (ret < 0)
+			goto out;
+
+		/* wait for controller init after reset */
+		msleep(500);
+
+		/* 2.5: check communication after reset */
+		ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x01},
+						  2, resp, 1);
+		if (ret < 0)
+			goto out;
+
+		if (resp[1] != 0x02) {
+			dev_err(dev, "device ping request NACK, aborting\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* 2.6: check device mode again */
+		ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x02},
+						  2, resp, 1);
+		if (ret < 0)
+			goto out;
+
+		if (!resp[2] && !resp[3]) {
+			dev_err(dev, "device still app mode, aborting\n");
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	/* 3: start firmware upload (erases internal app firmware flash) */
+	dev_dbg(dev, "start firmware upload\n");
+	ret = exc3000_vendor_data_request(data,
+					  (u8[]){0x3a, 0x04}, 2, resp, 20);
+	if (ret < 0)
+		goto out;
+
+	if (resp[2] != 0x01) {
+		dev_err(dev, "firmware update start NACK, aborting\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* 4: upload firmware */
+	for (i = 0x56; i < fw->size; i += 36) {
+		u8 fw_chunk[37] = { 0x3a, 0x01, fw->data[i],
+				    fw->data[i+1],fw->data[i+34] };
+
+		memcpy(&fw_chunk[5], &fw->data[i+2], 32);
+		ret = exc3000_vendor_data_request(data, fw_chunk, 37, resp, 1);
+		if (ret < 0)
+			goto out;
+
+		if (resp[2] != fw->data[i] || resp[3] != fw->data[i+1] ||
+		    resp[4] != fw->data[i+34]) {
+			dev_err(dev,
+				"firmware update readback wrong, aborting\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		data->update_status = DIV_ROUND_UP(i * 100, fw->size);
+	}
+
+	/* 5: end firmware upload */
+	ret = exc3000_vendor_data_request(data,
+					  (u8[]){0x3a, 0x05, fw->data[0x37],
+						fw->data[0x38], fw->data[0x39],
+						fw->data[0x1f], fw->data[0x20]},
+					  7, resp, 1);
+	if (ret < 0)
+		goto out;
+
+	if (resp[2] != 0x01) {
+		dev_err(dev, "firmware update end NACK, aborting\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* 6: switch back to app mode */
+	ret = exc3000_vendor_data_request(data, (u8[]){0x3a, 0xff}, 2, NULL, 1);
+	if (ret < 0)
+		goto out;
+
+	/* wait for controller init after reset */
+	msleep(500);
+
+	/* 7: check communication */
+	ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x01}, 2, resp, 1);
+	if (ret < 0)
+		goto out;
+
+	if (resp[1] != 0x02) {
+		dev_err(dev, "device ping request NACK, aborting\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* 8: check if we are in app mode again */
+	ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x02}, 2, resp, 1);
+	if (ret < 0)
+		goto out;
+
+	if (resp[2] || resp[3]) {
+		dev_err(dev, "device still bootloader mode, aborting\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	dev_info(dev, "firmware update complete\n");
+
+	data->update_status = 0;
+
+	return 0;
+
+out:
+	data->update_status = ret;
+	return ret;
+}
+
+static ssize_t update_fw_store(struct device *dev,
+			       struct device_attribute *dattr,
+			       const char *buf, size_t count)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+	char fw_name[NAME_MAX];
+	const struct firmware *fw;
+	size_t copy_count = count;
+	int ret;
+
+	if (count == 0 || count >= NAME_MAX)
+		return -EINVAL;
+
+	if (buf[count - 1] == '\0' || buf[count - 1] == '\n')
+		copy_count -= 1;
+
+	strncpy(fw_name, buf, copy_count);
+	fw_name[copy_count] = '\0';
+
+	ret = request_firmware(&fw, fw_name, dev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "Flashing %s\n", fw_name);
+
+	ret = exc3000_firmware_update(data, fw);
+
+	release_firmware(fw);
+
+	return ret ?: count;
+}
+static DEVICE_ATTR_WO(update_fw);
+
+static ssize_t update_fw_status_show(struct device *dev,
+				     struct device_attribute *dattr, char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", data->update_status);
+}
+static DEVICE_ATTR_RO(update_fw_status);
+
 static struct attribute *sysfs_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_model.attr,
 	&dev_attr_type.attr,
+	&dev_attr_update_fw.attr,
+	&dev_attr_update_fw_status.attr,
 	NULL
 };
 
-- 
2.20.1


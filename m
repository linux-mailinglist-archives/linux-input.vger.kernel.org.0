Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 386E0132CD0
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 18:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgAGRRn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 12:17:43 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47061 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgAGRRn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 12:17:43 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iosU9-00057y-H2; Tue, 07 Jan 2020 18:17:41 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: [PATCH 4/4] Input: exc3000: add firmware update support
Date:   Tue,  7 Jan 2020 18:17:40 +0100
Message-Id: <20200107171741.10856-4-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107171741.10856-1-l.stach@pengutronix.de>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
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
 drivers/input/touchscreen/exc3000.c | 248 +++++++++++++++++++++++++++-
 1 file changed, 246 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index ce83914d65ff..f9a9820dc232 100644
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
@@ -18,6 +18,8 @@
 #include <linux/of.h>
 #include <linux/timer.h>
 #include <asm/unaligned.h>
+#include <linux/firmware.h>
+#include <linux/delay.h>
 
 #define EXC3000_NUM_SLOTS		10
 #define EXC3000_SLOTS_PER_FRAME		5
@@ -37,6 +39,7 @@ struct exc3000_data {
 	struct mutex vendor_data_lock;
 	struct completion vendor_data_done;
 	char *type, *model, *fw_rev;
+	int update_status;
 };
 
 static void exc3000_report_slots(struct input_dev *input,
@@ -215,6 +218,8 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
 	if (ret < 0)
 		return -ENODEV;
 
+	if (data->type)
+		devm_kfree(dev, data->type);
 	data->type = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
 
 	/* query model info */
@@ -222,6 +227,8 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
 	if (ret < 0)
 		return -ENODEV;
 
+	if (data->model)
+		devm_kfree(dev, data->model);
 	data->model = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
 
 	/* query bootloader info */
@@ -239,6 +246,8 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
 		char bl_version[8];
 
 		snprintf(bl_version, 8, "%d.%d", response[2], response[3]);
+		if (data->fw_rev)
+			devm_kfree(dev, data->fw_rev);
 		data->fw_rev = devm_kmemdup(dev, bl_version,
 					    strlen(bl_version), GFP_KERNEL);
 	} else {
@@ -248,6 +257,8 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
 		if (ret < 0)
 			return -ENODEV;
 
+		if (data->fw_rev)
+			devm_kfree(dev, data->fw_rev);
 		data->fw_rev = devm_kmemdup(dev, &response[1],
 					    ret - 1, GFP_KERNEL);
 	}
@@ -289,10 +300,243 @@ static ssize_t exc3000_sysfs_fw_rev_show(struct device *dev,
 }
 static DEVICE_ATTR(fw_rev, 0444, exc3000_sysfs_fw_rev_show, NULL);
 
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
+	ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x02}, 2, resp);
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
+						  (u8[]){0x3a, 0xfb}, 2, resp);
+		if (ret < 0)
+			goto out;
+
+		/* 2.2 generate and send response */
+		exc3000_generate_unlock_response(&resp[2], &unlock_req[2]);
+		ret = exc3000_vendor_data_request(data, unlock_req, 6, resp);
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
+						         0x43, 0xcc}, 5, resp);
+		if (ret < 0)
+			goto out;
+
+		/* 2.4 reset controller */
+		ret = exc3000_vendor_data_request(data, (u8[]){0x3a, 0xff},
+						  2, NULL);
+		if (ret < 0)
+			goto out;
+
+		/* wait for controller init after reset */
+		msleep(500);
+
+		/* 2.5: check communication after reset */
+		ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x01},
+						  2, resp);
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
+						  2, resp);
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
+	/* 3: start firmware upload */
+	dev_dbg(dev, "start firmware upload\n");
+	ret = exc3000_vendor_data_request(data, (u8[]){0x3a, 0x04}, 2, resp);
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
+		ret = exc3000_vendor_data_request(data, fw_chunk, 37, resp);
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
+					  7, resp);
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
+	ret = exc3000_vendor_data_request(data, (u8[]){0x3a, 0xff}, 2, NULL);
+	if (ret < 0)
+		goto out;
+
+	/* wait for controller init after reset */
+	msleep(500);
+
+	/* 7: check communication */
+	ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x01}, 2, resp);
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
+	ret = exc3000_vendor_data_request(data, (u8[]){0x39, 0x02}, 2, resp);
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
+	exc3000_populate_device_info(data);
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
+static ssize_t exc3000_update_fw_store(struct device *dev,
+				       struct device_attribute *dattr,
+				       const char *buf, size_t count)
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
+static DEVICE_ATTR(update_fw, 0200, NULL, exc3000_update_fw_store);
+
+static ssize_t exc3000_update_fw_status_show(struct device *dev,
+					     struct device_attribute *dattr,
+					     char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", data->update_status);
+}
+static DEVICE_ATTR(update_fw_status, 0444, exc3000_update_fw_status_show, NULL);
+
 static struct attribute *exc3000_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_model.attr,
 	&dev_attr_fw_rev.attr,
+	&dev_attr_update_fw.attr,
+	&dev_attr_update_fw_status.attr,
 	NULL
 };
 
-- 
2.20.1


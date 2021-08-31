Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242C93FCE8D
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 22:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhHaU0f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 16:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240870AbhHaU0d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 16:26:33 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD94C061760
        for <linux-input@vger.kernel.org>; Tue, 31 Aug 2021 13:25:35 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id EFB778310F;
        Tue, 31 Aug 2021 22:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630441533;
        bh=nM5f0DkFyUN6CQY2qr1nS4vWScTkxnLjRyOXJjeAt5s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cmB7NDEyW+8PBuy5nPKExNB8vB6u3fkZAm+tRPcoQTImdP1P2a02wPkFdwPi0Ms12
         zLZNlopH3UR7MuqfbNd8Cv+Ko+4m5wDYFHy0YdGXkkj/7AdjlVw+k6+X03aQNlFC6y
         5EXylcwb2X9gakP6Dp8+XfU33jMujufjBfAGGxo4jXYvt1eIfTiEF9vUygcTRPppqk
         69J3YAEf/VYLZ23KttqT+OkuBKFsOFIzg76mYtJwAemakYL5WpLSA1dq/330QHCo8e
         fdb9C6vo1kZU62hS/WWMn0am4B4mRubrw+dtevK56itiD+5NpGsHjVvAVsVQKxZ6N7
         rj6Iz5nIETMAA==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     ch@denx.de, Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH v3 2/3] Input: ili210x - export ili251x version details via sysfs
Date:   Tue, 31 Aug 2021 22:25:05 +0200
Message-Id: <20210831202506.181927-2-marex@denx.de>
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

The ili251x firmware protocol permits readout of firmware version,
protocol version, mcu version and current mode (application, boot
loader, forced update). These information are useful when updating
the firmware on the il251x, e.g. to avoid updating the same firmware
into the device multiple times. The locking is now necessary to avoid
races between interrupt handler and the sysfs readouts.

Note that the protocol differs considerably between the ili2xxx devices,
this patch therefore implements this functionality only for ili251x that
I can test.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
V2: No change
V3: - Use .has_firmware_proto flag to discern supported MCU protocol
    - Rename REG_IC_MODE to REG_GET_MODE in this patch
    - Use sysfs_emit()
    - Rename variable ret to error
    - Cache firmware version information to avoid mutex in IRQ handler

NOTE: Regarding checkpatch warnings, Consider renaming function(s)
      'ili251x_firmware_version_show' to 'firmware_version_show',
      I considered it and decided against it, because grepping for
      ili251x in debug symbols gives far more accurate results than
      grepping for firmware_version.
---
 drivers/input/touchscreen/ili210x.c | 165 +++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index baaddf95dd92..a4da753d9355 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -22,6 +22,12 @@
 /* Touchscreen commands */
 #define REG_TOUCHDATA		0x10
 #define REG_PANEL_INFO		0x20
+#define REG_FIRMWARE_VERSION	0x40
+#define REG_PROTOCOL_VERSION	0x42
+#define REG_KERNEL_VERSION	0x61
+#define REG_GET_MODE		0xc0
+#define REG_GET_MODE_AP		0x5a
+#define REG_GET_MODE_BL		0x55
 #define REG_CALIBRATE		0xcc
 
 struct ili2xxx_chip {
@@ -45,6 +51,10 @@ struct ili210x {
 	struct gpio_desc *reset_gpio;
 	struct touchscreen_properties prop;
 	const struct ili2xxx_chip *chip;
+	u8 version_firmware[8];
+	u8 version_kernel[5];
+	u8 version_proto[2];
+	u8 ic_mode[2];
 	bool stop;
 };
 
@@ -353,6 +363,69 @@ static int ili251x_firmware_update_resolution(struct device *dev)
 	return 0;
 }
 
+static ssize_t ili251x_firmware_update_firmware_version(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	int error;
+	u8 fw[8];
+
+	/* Get firmware version */
+	error = priv->chip->read_reg(client, REG_FIRMWARE_VERSION,
+				     &fw, sizeof(fw));
+	if (!error)
+		memcpy(priv->version_firmware, fw, sizeof(fw));
+
+	return error;
+}
+
+static ssize_t ili251x_firmware_update_kernel_version(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	int error;
+	u8 kv[5];
+
+	/* Get kernel version */
+	error = priv->chip->read_reg(client, REG_KERNEL_VERSION,
+				     &kv, sizeof(kv));
+	if (!error)
+		memcpy(priv->version_kernel, kv, sizeof(kv));
+
+	return error;
+}
+
+static ssize_t ili251x_firmware_update_protocol_version(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	int error;
+	u8 pv[2];
+
+	/* Get protocol version */
+	error = priv->chip->read_reg(client, REG_PROTOCOL_VERSION,
+				     &pv, sizeof(pv));
+	if (!error)
+		memcpy(priv->version_proto, pv, sizeof(pv));
+
+	return error;
+}
+
+static ssize_t ili251x_firmware_update_ic_mode(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	int error;
+	u8 md[2];
+
+	/* Get chip boot mode */
+	error = priv->chip->read_reg(client, REG_GET_MODE, &md, sizeof(md));
+	if (!error)
+		memcpy(priv->ic_mode, md, sizeof(md));
+
+	return error;
+}
+
 static int ili251x_firmware_update_cached_state(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -370,9 +443,83 @@ static int ili251x_firmware_update_cached_state(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = ili251x_firmware_update_firmware_version(dev);
+	if (ret)
+		return ret;
+
+	ret = ili251x_firmware_update_kernel_version(dev);
+	if (ret)
+		return ret;
+
+	ret = ili251x_firmware_update_protocol_version(dev);
+	if (ret)
+		return ret;
+
+	ret = ili251x_firmware_update_ic_mode(dev);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
+static ssize_t ili251x_firmware_version_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 *fw = priv->version_firmware;
+
+	return sysfs_emit(buf, "%02x%02x.%02x%02x.%02x%02x.%02x%02x\n",
+			  fw[0], fw[1], fw[2], fw[3],
+			  fw[4], fw[5], fw[6], fw[7]);
+}
+static DEVICE_ATTR(firmware_version, 0444, ili251x_firmware_version_show, NULL);
+
+static ssize_t ili251x_kernel_version_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 *kv = priv->version_kernel;
+
+	return sysfs_emit(buf, "%02x.%02x.%02x.%02x.%02x\n",
+			  kv[0], kv[1], kv[2], kv[3], kv[4]);
+}
+static DEVICE_ATTR(kernel_version, 0444, ili251x_kernel_version_show, NULL);
+
+static ssize_t ili251x_protocol_version_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 *pv = priv->version_proto;
+
+	return sysfs_emit(buf, "%02x.%02x\n", pv[0], pv[1]);
+}
+static DEVICE_ATTR(protocol_version, 0444, ili251x_protocol_version_show, NULL);
+
+static ssize_t ili251x_mode_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 *md = priv->ic_mode;
+	char *mode = "AP";
+
+	if (md[0] == REG_GET_MODE_AP)		/* Application Mode */
+		mode = "AP";
+	else if (md[0] == REG_GET_MODE_BL)	/* BootLoader Mode */
+		mode = "BL";
+	else					/* Unknown Mode */
+		mode = "??";
+
+	return sysfs_emit(buf, "%02x.%02x:%s\n", md[0], md[1], mode);
+}
+static DEVICE_ATTR(mode, 0444, ili251x_mode_show, NULL);
+
 static ssize_t ili210x_calibrate(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -401,22 +548,34 @@ static DEVICE_ATTR(calibrate, S_IWUSR, NULL, ili210x_calibrate);
 
 static struct attribute *ili210x_attributes[] = {
 	&dev_attr_calibrate.attr,
+	&dev_attr_firmware_version.attr,
+	&dev_attr_kernel_version.attr,
+	&dev_attr_protocol_version.attr,
+	&dev_attr_mode.attr,
 	NULL,
 };
 
-static umode_t ili210x_calibrate_visible(struct kobject *kobj,
+static umode_t ili210x_attributes_visible(struct kobject *kobj,
 					  struct attribute *attr, int index)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct i2c_client *client = to_i2c_client(dev);
 	struct ili210x *priv = i2c_get_clientdata(client);
 
-	return priv->chip->has_calibrate_reg ? attr->mode : 0;
+	/* Calibrate is present on all ILI2xxx which have calibrate register */
+	if (attr == &dev_attr_calibrate.attr)
+		return priv->chip->has_calibrate_reg ? attr->mode : 0;
+
+	/* Firmware/Kernel/Protocol/BootMode is implememted only for ILI251x */
+	if (!priv->chip->has_firmware_proto)
+		return 0;
+
+	return attr->mode;
 }
 
 static const struct attribute_group ili210x_attr_group = {
 	.attrs = ili210x_attributes,
-	.is_visible = ili210x_calibrate_visible,
+	.is_visible = ili210x_attributes_visible,
 };
 
 static void ili210x_power_down(void *data)
-- 
2.33.0


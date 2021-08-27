Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4273FA104
	for <lists+linux-input@lfdr.de>; Fri, 27 Aug 2021 23:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhH0VOL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Aug 2021 17:14:11 -0400
Received: from phobos.denx.de ([85.214.62.61]:55608 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231815AbhH0VOK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Aug 2021 17:14:10 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AB46482D85;
        Fri, 27 Aug 2021 23:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630098800;
        bh=Mg5SN9U8VPulJBTHqeR3gGkiLPaSvegMqoLsYp1um2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FR/4zEpdD7HQiB/bkL21MQ8PlSIsx0Eay1c0nNBAE1FRvjIuZQqP+PT9/hWcIGVyL
         YPDZuJKLrx23RA2Z17r5t9iX8Yd/4ZjoIfF+Sc+Cnao2wFuzo0hm53oKupTxE/qy3F
         2AxVN72uhk7c09vR0s7sTJLV89X+iipNy4CECYltrZVXUm9jXfBEByRiimodYYO1JX
         KTHJCuZ4/kwhplJ4XefbrxFIB5C+ilgvbO+MUt2R+0xhTWQAsOZlxVZdnQoKoHNhTl
         U/n9mssDqYGeWrUxKvyRxA+H8yIyV0K/lEFaeZ3h/IvnqSvLrT6sj8MC7xOMOIGdtW
         Ie7BEA9RAbLGg==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     ch@denx.de, Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH v2 2/3] Input: ili210x - export ili251x version details via sysfs
Date:   Fri, 27 Aug 2021 23:12:57 +0200
Message-Id: <20210827211258.318618-2-marex@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827211258.318618-1-marex@denx.de>
References: <20210827211258.318618-1-marex@denx.de>
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

NOTE: Regarding checkpatch warnings, Consider renaming function(s)
      'ili251x_firmware_version_show' to 'firmware_version_show',
      I considered it and decided against it, because grepping for
      ili251x in debug symbols gives far more accurate results than
      grepping for firmware_version.
---
 drivers/input/touchscreen/ili210x.c | 130 +++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index c46553ecabe6..7790ad000dc1 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -22,6 +22,12 @@
 /* Touchscreen commands */
 #define REG_TOUCHDATA		0x10
 #define REG_PANEL_INFO		0x20
+#define REG_FIRMWARE_VERSION	0x40
+#define REG_PROTOCOL_VERSION	0x42
+#define REG_KERNEL_VERSION	0x61
+#define REG_IC_MODE		0xc0
+#define REG_IC_MODE_AP		0x5a
+#define REG_IC_MODE_BL		0x55
 #define REG_CALIBRATE		0xcc
 
 struct ili2xxx_chip {
@@ -43,6 +49,7 @@ struct ili210x {
 	struct input_dev *input;
 	struct gpio_desc *reset_gpio;
 	struct touchscreen_properties prop;
+	struct mutex lock;
 	const struct ili2xxx_chip *chip;
 	bool stop;
 };
@@ -307,7 +314,9 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 	int error;
 
 	do {
+		mutex_lock(&priv->lock);
 		error = chip->get_touch_data(client, touchdata);
+		mutex_unlock(&priv->lock);
 		if (error) {
 			dev_err(&client->dev,
 				"Unable to get touch data: %d\n", error);
@@ -351,6 +360,108 @@ static int ili251x_firmware_update_resolution(struct device *dev)
 	return 0;
 }
 
+static ssize_t ili251x_firmware_version_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 fw[8];
+	int ret;
+
+	/* Get firmware version */
+	mutex_lock(&priv->lock);
+	ret = priv->chip->read_reg(client, REG_FIRMWARE_VERSION,
+				   &fw, sizeof(fw));
+	mutex_unlock(&priv->lock);
+
+	if (ret)
+		return ret;
+
+	if (!ret) {
+		ret = scnprintf(buf, PAGE_SIZE,
+				"%02x%02x.%02x%02x.%02x%02x.%02x%02x\n",
+				fw[0], fw[1], fw[2], fw[3],
+				fw[4], fw[5], fw[6], fw[7]);
+	}
+
+	return ret;
+}
+static DEVICE_ATTR(firmware_version, 0444, ili251x_firmware_version_show, NULL);
+
+static ssize_t ili251x_kernel_version_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 kv[5];
+	int ret;
+
+	/* Get kernel version */
+	mutex_lock(&priv->lock);
+	ret = priv->chip->read_reg(client, REG_KERNEL_VERSION,
+				   &kv, sizeof(kv));
+	mutex_unlock(&priv->lock);
+
+	if (ret)
+		return ret;
+
+	return scnprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x.%02x\n",
+			 kv[0], kv[1], kv[2], kv[3], kv[4]);
+}
+static DEVICE_ATTR(kernel_version, 0444, ili251x_kernel_version_show, NULL);
+
+static ssize_t ili251x_protocol_version_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	u8 pv[2];
+	int ret;
+
+	/* Get protocol version */
+	mutex_lock(&priv->lock);
+	ret = priv->chip->read_reg(client, REG_PROTOCOL_VERSION,
+				   &pv, sizeof(pv));
+	mutex_unlock(&priv->lock);
+
+	if (ret)
+		return ret;
+
+	return scnprintf(buf, PAGE_SIZE, "%02x.%02x\n", pv[0], pv[1]);
+}
+static DEVICE_ATTR(protocol_version, 0444, ili251x_protocol_version_show, NULL);
+
+static ssize_t ili251x_mode_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	char *mode = "AP";
+	u8 md[2];
+	int ret;
+
+	/* Get mode */
+	mutex_lock(&priv->lock);
+	ret = priv->chip->read_reg(client, REG_IC_MODE, &md, sizeof(md));
+	mutex_unlock(&priv->lock);
+
+	if (ret)
+		return ret;
+
+	if (md[0] == REG_IC_MODE_AP)		/* Application Mode */
+		mode = "AP";
+	else if (md[0] == REG_IC_MODE_BL)	/* BootLoader Mode */
+		mode = "BL";
+	else					/* Unknown Mode */
+		mode = "??";
+
+	return scnprintf(buf, PAGE_SIZE, "%02x.%02x:%s\n", md[0], md[1], mode);
+}
+static DEVICE_ATTR(mode, 0444, ili251x_mode_show, NULL);
+
 static ssize_t ili210x_calibrate(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -379,22 +490,34 @@ static DEVICE_ATTR(calibrate, S_IWUSR, NULL, ili210x_calibrate);
 
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
+	if (priv->chip != &ili251x_chip)
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
@@ -465,6 +588,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	priv->input = input;
 	priv->reset_gpio = reset_gpio;
 	priv->chip = chip;
+	mutex_init(&priv->lock);
 	i2c_set_clientdata(client, priv);
 
 	/* Setup input device */
-- 
2.32.0


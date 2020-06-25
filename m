Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42C120A03E
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 15:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405205AbgFYNp5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 09:45:57 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:51302 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405027AbgFYNp4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 09:45:56 -0400
Received: from [78.43.71.214] (helo=marius.fritz.box)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <mail@mariuszachmann.de>)
        id 1joSCH-0006BF-9m; Thu, 25 Jun 2020 15:45:46 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Marius Zachmann <mail@mariuszachmann.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v6] hwmon: add Corsair Commander Pro driver
Date:   Thu, 25 Jun 2020 15:45:31 +0200
Message-Id: <20200625134531.5977-1-mail@mariuszachmann.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Con-Id: 241080
X-Con-U: 0-mail
X-Originating-IP: 78.43.71.214
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is v6 of a driver for the Corsair Commander Pro.
It provides sysfs attributes for:
- Reading fan speed
- Reading temp sensors
- Reading voltage values
- Writing pwm and reading last written pwm
- Reading fan and temp connection status

It is an usb driver, so it needs to be on the hid_ignore_list
in hid-quirks.h. The Corsair Commander Pro is a fan controller
and provides no means for user interaction.
The two device numbers are there, because there is a slightly
different version of the same device. (Only difference
seem to be in some presets.)

This is based on the staging/hwmon tree.

Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
---

Changes from v5
- added bitmaps for temp_cnct and fan_cnct
- ccp_visible returns 0 when there is no connection
  and removed tests for connection in other functions
- removed temp labels
- add define for fan and temp sensor count
- removed unneccesary mutex from get_temp_cnct and get_fan_cnct
  and moved these functions directly above ccp_probe
- no more setting return values in ccp_read, ccp_read_string, ccp_write
  just return directly instead of break
- get_data returns values (always >= 0) directly
- inlined get_temp
- removed first two error messages in send_usb_cmd and
  changed last one to dev_dbg
- comment alignments and clarifications
- renamed goto label to "out_unlock"
- sizeof(*ccp) instead of sizeof(struct ccp_device)

Changes from v4
- squashed 3 commits into one.

Changes from v3
- add device ids to hid_ignore_list in hid-quirks.h
- removed unused update_interval
- ccp_disconnect is static
---
 Documentation/hwmon/corsair-cpro.rst |  39 +++
 Documentation/hwmon/index.rst        |   1 +
 MAINTAINERS                          |   6 +
 drivers/hid/hid-quirks.c             |   2 +
 drivers/hwmon/Kconfig                |  10 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/corsair-cpro.c         | 454 +++++++++++++++++++++++++++
 7 files changed, 513 insertions(+)
 create mode 100644 Documentation/hwmon/corsair-cpro.rst
 create mode 100644 drivers/hwmon/corsair-cpro.c

diff --git a/Documentation/hwmon/corsair-cpro.rst b/Documentation/hwmon/corsair-cpro.rst
new file mode 100644
index 000000000000..5913e23d764c
--- /dev/null
+++ b/Documentation/hwmon/corsair-cpro.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver corsair-cpro
+==========================
+
+Supported devices:
+
+  * Corsair Commander Pro
+  * Corsair Commander Pro (1000D)
+
+Author: Marius Zachmann
+
+Description
+-----------
+
+This driver implements the sysfs interface for the Corsair Commander Pro.
+The Corsair Commander Pro is a USB device with 6 fan connectors,
+4 temperature sensor connectors and 2 Corsair LED connectors.
+It can read the voltage levels on the SATA power connector.
+
+Usage Notes
+-----------
+
+Since it is a USB device, hotswapping is possible. The device is autodetected.
+
+Sysfs entries
+-------------
+
+======================= =====================================================================
+in0_input		Voltage on SATA 12v
+in1_input		Voltage on SATA 5v
+in2_input		Voltage on SATA 3.3v
+temp[1-4]_input		Temperature on connected temperature sensors
+fan[1-6]_input		Connected fan rpm.
+fan[1-6]_label		Shows fan type as detected by the device.
+pwm[1-6]		Sets the fan speed. Values from 0-255.
+			When reading, it reports the last value if it was set by the driver.
+			Otherwise returns 0.
+======================= =====================================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 55ff4b7c5349..750d3a975d82 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -47,6 +47,7 @@ Hardware Monitoring Kernel Drivers
    bel-pfe
    bt1-pvt
    coretemp
+   corsair-cpro
    da9052
    da9055
    dell-smm-hwmon
diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c..47b0361718f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4400,6 +4400,12 @@ S:	Maintained
 F:	Documentation/hwmon/coretemp.rst
 F:	drivers/hwmon/coretemp.c

+CORSAIR-CPRO HARDWARE MONITOR DRIVER
+M:	Marius  <mail@mariuszachmann.de>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/corsair-cpro.c
+
 COSA/SRP SYNC SERIAL DRIVER
 M:	Jan "Yenya" Kasprzak <kas@fi.muni.cz>
 S:	Maintained
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ca8b5c261c7c..7b7bc7737c53 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -699,6 +699,8 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AXENTIA, USB_DEVICE_ID_AXENTIA_FM_RADIO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x0c10) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x1d00) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM109) },
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 288ae9f63588..8b046a5dfa40 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -439,6 +439,16 @@ config SENSORS_BT1_PVT_ALARMS
 	  the data conversion will be periodically performed and the data will be
 	  saved in the internal driver cache.

+config SENSORS_CORSAIR_CPRO
+	tristate "Corsair Commander Pro controller"
+	depends on USB
+	help
+	  If you say yes here you get support for the Corsair Commander Pro
+	  controller.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called corsair-cpro.
+
 config SENSORS_DRIVETEMP
 	tristate "Hard disk drives with temperature sensors"
 	depends on SCSI && ATA
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3e32c21f5efe..18e1ef74ade7 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
 obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
+obj-$(CONFIG_SENSORS_CORSAIR_CPRO) += corsair-cpro.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
 obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
 obj-$(CONFIG_SENSORS_DELL_SMM)	+= dell-smm-hwmon.o
diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
new file mode 100644
index 000000000000..6c534b064a02
--- /dev/null
+++ b/drivers/hwmon/corsair-cpro.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * corsair-cpro.c - Linux driver for Corsair Commander Pro
+ * Copyright (C) 2020 Marius Zachmann <mail@mariuszachmann.de>
+ */
+
+#include <linux/kernel.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+#define USB_VENDOR_ID_CORSAIR			0x1b1c
+#define USB_PRODUCT_ID_CORSAIR_COMMANDERPRO	0x0c10
+#define USB_PRODUCT_ID_CORSAIR_1000D		0x1d00
+
+#define OUT_BUFFER_SIZE		63
+#define IN_BUFFER_SIZE		16
+#define LABEL_LENGTH		11
+
+#define CTL_GET_TMP_CNCT	0x10	/*
+					 * returns in bytes 1-4 for each temp sensor:
+					 * 0 not connected
+					 * 1 connected
+					 */
+#define CTL_GET_TMP		0x11	/*
+					 * send: byte 1 is channel, rest zero
+					 * rcv:  returns temp for channel in centi-degree celsius
+					 * in bytes 1 and 2
+					 * returns 17 in byte 0 if no sensor is connected
+					 */
+#define CTL_GET_VOLT		0x12	/*
+					 * send: byte 1 is rail number: 0 = 12v, 1 = 5v, 2 = 3.3v
+					 * rcv:  returns millivolt in bytes 1,2
+					 */
+#define CTL_GET_FAN_CNCT	0x20	/*
+					 * returns in bytes 1-6 for each fan:
+					 * 0 not connected
+					 * 1 3pin
+					 * 2 4pin
+					 */
+#define CTL_GET_FAN_RPM		0x21	/*
+					 * send: byte 1 is channel, rest zero
+					 * rcv:  returns rpm in bytes 1,2
+					 */
+#define CTL_SET_FAN_FPWM	0x23	/*
+					 * set fixed pwm
+					 * send: byte 1 is fan number
+					 * send: byte 2 is percentage from 0 - 100
+					 */
+
+#define NUM_FANS		6
+#define NUM_TEMP_SENSORS	4
+
+struct ccp_device {
+	struct usb_device *udev;
+	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
+	u8 *buffer;
+	int pwm[6];
+	DECLARE_BITMAP(temp_cnct, NUM_TEMP_SENSORS);
+	DECLARE_BITMAP(fan_cnct, NUM_FANS);
+	char fan_label[6][LABEL_LENGTH];
+};
+
+/* send command, check for error in response, response in ccp->buffer */
+static int send_usb_cmd(struct ccp_device *ccp, u8 command, u8 byte1, u8 byte2)
+{
+	int actual_length;
+	int ret;
+
+	memset(ccp->buffer, 0x00, OUT_BUFFER_SIZE);
+	ccp->buffer[0] = command;
+	ccp->buffer[1] = byte1;
+	ccp->buffer[2] = byte2;
+
+	ret = usb_bulk_msg(ccp->udev, usb_sndintpipe(ccp->udev, 2), ccp->buffer, OUT_BUFFER_SIZE,
+			   &actual_length, 1000);
+	if (ret)
+		return ret;
+
+	/* response needs to be received every time */
+	ret = usb_bulk_msg(ccp->udev, usb_rcvintpipe(ccp->udev, 1), ccp->buffer, IN_BUFFER_SIZE,
+			   &actual_length, 1000);
+	if (ret)
+		return ret;
+
+	/* first byte of response is error code */
+	if (ccp->buffer[0] != 0x00) {
+		dev_dbg(&ccp->udev->dev, "device response error: %d", ccp->buffer[0]);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* requests and returns single data values depending on channel */
+static int get_data(struct ccp_device *ccp, int command, int channel)
+{
+	int ret;
+
+	mutex_lock(&ccp->mutex);
+
+	ret = send_usb_cmd(ccp, command, channel, 0);
+	if (ret)
+		goto out_unlock;
+
+	ret = (ccp->buffer[1] << 8) + ccp->buffer[2];
+
+out_unlock:
+	mutex_unlock(&ccp->mutex);
+	return ret;
+}
+
+static int set_pwm(struct ccp_device *ccp, int channel, long val)
+{
+	int ret;
+
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	ccp->pwm[channel] = val;
+
+	/* The Corsair Commander Pro uses values from 0-100 */
+	val = DIV_ROUND_CLOSEST(val * 100, 255);
+
+	mutex_lock(&ccp->mutex);
+
+	ret = send_usb_cmd(ccp, CTL_SET_FAN_FPWM, channel, val);
+
+	mutex_unlock(&ccp->mutex);
+	return ret;
+}
+
+static int ccp_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	struct ccp_device *ccp = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_label:
+			*str = ccp->fan_label[channel];
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int ccp_read(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long *val)
+{
+	struct ccp_device *ccp = dev_get_drvdata(dev);
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			ret = get_data(ccp, CTL_GET_TMP, channel);
+			if (ret < 0)
+				return ret;
+			*val = ret * 10;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret = get_data(ccp, CTL_GET_FAN_RPM, channel);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			/* how to read pwm values from the device is currently unknown */
+			/* driver returns last set value or 0		               */
+			*val = ccp->pwm[channel];
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			ret = get_data(ccp, CTL_GET_VOLT, channel);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+};
+
+static int ccp_write(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long val)
+{
+	struct ccp_device *ccp = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return set_pwm(ccp, channel, val);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+};
+
+static umode_t ccp_is_visible(const void *data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	const struct ccp_device *ccp = data;
+
+	switch (type) {
+	case hwmon_temp:
+		if (!test_bit(channel, ccp->temp_cnct))
+			return 0;
+
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		case hwmon_temp_label:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		if (!test_bit(channel, ccp->fan_cnct))
+			return 0;
+
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_label:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		if (!test_bit(channel, ccp->fan_cnct))
+			return 0;
+
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+};
+
+static const struct hwmon_ops ccp_hwmon_ops = {
+	.is_visible = ccp_is_visible,
+	.read = ccp_read,
+	.read_string = ccp_read_string,
+	.write = ccp_write,
+};
+
+static const struct hwmon_channel_info *ccp_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT
+			   ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL
+			   ),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT
+			   ),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT
+			   ),
+	NULL
+};
+
+static const struct hwmon_chip_info ccp_chip_info = {
+	.ops = &ccp_hwmon_ops,
+	.info = ccp_info,
+};
+
+/* read fan connection status and set labels */
+static int get_fan_cnct(struct ccp_device *ccp)
+{
+	int channel;
+	int mode;
+	int ret;
+
+	ret = send_usb_cmd(ccp, CTL_GET_FAN_CNCT, 0, 0);
+	if (ret)
+		return ret;
+
+	for (channel = 0; channel < NUM_FANS; channel++) {
+		mode = ccp->buffer[channel + 1];
+		if (mode == 0)
+			continue;
+
+		set_bit(channel, ccp->fan_cnct);
+
+		switch (mode) {
+		case 1:
+			scnprintf(ccp->fan_label[channel], LABEL_LENGTH,
+				  "fan%d 3pin", channel + 1);
+			break;
+		case 2:
+			scnprintf(ccp->fan_label[channel], LABEL_LENGTH,
+				  "fan%d 4pin", channel + 1);
+			break;
+		default:
+			scnprintf(ccp->fan_label[channel], LABEL_LENGTH,
+				  "fan%d other", channel + 1);
+			break;
+		}
+	}
+
+	return 0;
+}
+
+/* read temp sensor connection status */
+static int get_temp_cnct(struct ccp_device *ccp)
+{
+	int channel;
+	int mode;
+	int ret;
+
+	ret = send_usb_cmd(ccp, CTL_GET_TMP_CNCT, 0, 0);
+	if (ret)
+		return ret;
+
+	for (channel = 0; channel < NUM_TEMP_SENSORS; channel++) {
+		mode = ccp->buffer[channel + 1];
+		if (mode == 0)
+			continue;
+
+		set_bit(channel, ccp->temp_cnct);
+	}
+
+	return 0;
+}
+
+static int ccp_probe(struct usb_interface *intf, const struct usb_device_id *id)
+{
+	struct device *hwmon_dev;
+	struct ccp_device *ccp;
+	int ret;
+
+	ccp = devm_kzalloc(&intf->dev, sizeof(*ccp), GFP_KERNEL);
+	if (!ccp)
+		return -ENOMEM;
+
+	ccp->buffer = devm_kmalloc(&intf->dev, OUT_BUFFER_SIZE, GFP_KERNEL);
+	if (!ccp->buffer)
+		return -ENOMEM;
+
+	mutex_init(&ccp->mutex);
+
+	ccp->udev = interface_to_usbdev(intf);
+
+	/* temp and fan connection status only updates when device is powered on */
+	ret = get_temp_cnct(ccp);
+	if (ret)
+		return ret;
+
+	ret = get_fan_cnct(ccp);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&intf->dev, "corsaircpro", ccp,
+							 &ccp_chip_info, 0);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static void ccp_disconnect(struct usb_interface *intf)
+{
+}
+
+static const struct usb_device_id ccp_devices[] = {
+	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_CORSAIR_COMMANDERPRO) },
+	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_CORSAIR_1000D) },
+	{ }
+};
+
+static struct usb_driver ccp_driver = {
+	.name = "corsair-cpro",
+	.probe = ccp_probe,
+	.disconnect = ccp_disconnect,
+	.id_table = ccp_devices
+};
+
+MODULE_DEVICE_TABLE(usb, ccp_devices);
+MODULE_LICENSE("GPL");
+
+module_usb_driver(ccp_driver);
--
2.27.0

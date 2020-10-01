Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA3927FF3C
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 14:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732258AbgJAMdC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Oct 2020 08:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731936AbgJAMdC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Oct 2020 08:33:02 -0400
Received: from mxa2.seznam.cz (mxa2.seznam.cz [IPv6:2a02:598:2::90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80879C0613E2;
        Thu,  1 Oct 2020 05:33:01 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc2b.ng.seznam.cz (email-smtpc2b.ng.seznam.cz [10.23.13.45])
        id 553cc2180e32967154950e46;
        Thu, 01 Oct 2020 14:32:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1601555560; bh=3c65vI+fMCmA7GsBOW7vbYAWBPPkMBAOhtKOhBfoNow=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=bthxzHO41dZSW1J1nLI7TbDDa2VacWGHXxhzcnpKUi5LLzpBDpJgwwJ6+Haozv9E/
         QWL8ymth0yuLVvkWBe9ES/6PDNzAIGq2/67VLZzPxrZyB3LkmQnjrUuIzcZvYSN1jJ
         7ANGUdDUnMx+lJ1KKxMDHnoxFHaBPC7SS4NGu65w=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay18.ng.seznam.cz (Seznam SMTPD 1.3.120) with ESMTP;
        Thu, 01 Oct 2020 14:32:34 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Paul Burton <paulburton@kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v6 1/2] Input: add zinitix touchscreen driver
Date:   Thu,  1 Oct 2020 14:29:48 +0200
Message-Id: <20201001122949.16846-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

Add support for the bt541 touchscreen IC from zinitix, loosely based on
downstream driver. The driver currently supports multitouch (5 touch points).
The bt541 seems to support touch keys, but the support was not added because
that functionality is not being utilized by the touchscreen used for testing.
Based on the similartities between downstream drivers, it seems likely that
other similar touchscreen ICs can be supported with this driver in the future.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 changes in v2: applied fixes per recommendation, added support for suspend/resume handling
 changes in v3: added support for working in different touch point report modes 
 		(modes 1 and 2 are now supported). mode 2 seems to work just fine
 		on Samsung Galaxy A3 (2015), and also works on Samsung Galaxy S4 
 		Mini Value Edition (where mode 1 doesn't seem to work because 
 		of different firmware version). It is expected that other fw 
 		versions, and models other than bt541, may have either mode broken
 		(vendor doesn't use it -> they don't care) .
 changes in v4: - removed mode 1 for now to simplify the code and improve it's chances 
 		to get accepted.
 		- added runtime pm to save power while not using the ts
 		- refactored i2c helper functions
		-  
 changes in v5: - send the actual intended V4 (sorry)
 changes in v6: - remove unused include
 		- other fixes per reccomendation

 bt541 is used in the Samsung Galaxy A3 (2015) that has recently gained 
 mainline support [1].

 The downstream driver this is loosely based on: 
 https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/tree/SM-A300FU/drivers/input/touchscreen/zinitix

 [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1329c1ab0730b521e6cd3051c56a2ff3d55f21e6

 drivers/input/touchscreen/Kconfig   |  12 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/zinitix.c | 559 ++++++++++++++++++++++++++++
 3 files changed, 572 insertions(+)
 create mode 100644 drivers/input/touchscreen/zinitix.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 35c867b2d9a7..f012fe746df0 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1322,4 +1322,16 @@ config TOUCHSCREEN_IQS5XX
 	  To compile this driver as a module, choose M here: the
 	  module will be called iqs5xx.
 
+config TOUCHSCREEN_ZINITIX
+	tristate "Zinitix touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have a touchscreen using Zinitix bt541,
+	  or something similar enough.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called zinitix.
+
 endif
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 30d1e1b42492..6233541e9173 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -111,3 +111,4 @@ obj-$(CONFIG_TOUCHSCREEN_COLIBRI_VF50)	+= colibri-vf50-ts.o
 obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
 obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
 obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
+obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
new file mode 100644
index 000000000000..af7a7c80bb10
--- /dev/null
+++ b/drivers/input/touchscreen/zinitix.c
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/kernel.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+
+/* Register Map */
+
+#define BT541_SWRESET_CMD			0x0000
+#define BT541_WAKEUP_CMD			0x0001
+
+#define BT541_IDLE_CMD				0x0004
+#define BT541_SLEEP_CMD				0x0005
+
+#define BT541_CLEAR_INT_STATUS_CMD		0x0003
+#define BT541_CALIBRATE_CMD			0x0006
+#define BT541_SAVE_STATUS_CMD			0x0007
+#define BT541_SAVE_CALIBRATION_CMD		0x0008
+#define BT541_RECALL_FACTORY_CMD		0x000f
+
+#define BT541_THRESHOLD				0x0020
+
+#define BT541_LARGE_PALM_REJECT_AREA_TH		0x003F
+
+#define BT541_DEBUG_REG				0x0115 /* 0~7 */
+
+#define BT541_TOUCH_MODE			0x0010
+#define BT541_CHIP_REVISION			0x0011
+#define BT541_FIRMWARE_VERSION			0x0012
+
+#define ZINITIX_USB_DETECT			0x116
+
+#define BT541_MINOR_FW_VERSION			0x0121
+
+#define BT541_VENDOR_ID				0x001C
+#define BT541_HW_ID				0x0014
+
+#define BT541_DATA_VERSION_REG			0x0013
+#define BT541_SUPPORTED_FINGER_NUM		0x0015
+#define BT541_EEPROM_INFO			0x0018
+#define BT541_INITIAL_TOUCH_MODE		0x0019
+
+#define BT541_TOTAL_NUMBER_OF_X			0x0060
+#define BT541_TOTAL_NUMBER_OF_Y			0x0061
+
+#define BT541_DELAY_RAW_FOR_HOST		0x007f
+
+#define BT541_BUTTON_SUPPORTED_NUM		0x00B0
+#define BT541_BUTTON_SENSITIVITY		0x00B2
+#define BT541_DUMMY_BUTTON_SENSITIVITY		0X00C8
+
+#define BT541_X_RESOLUTION			0x00C0
+#define BT541_Y_RESOLUTION			0x00C1
+
+#define BT541_POINT_STATUS_REG			0x0080
+#define BT541_ICON_STATUS_REG			0x00AA
+
+#define BT541_POINT_COORD_REG			(BT541_POINT_STATUS_REG + 2)
+
+#define BT541_AFE_FREQUENCY			0x0100
+#define BT541_DND_N_COUNT			0x0122
+#define BT541_DND_U_COUNT			0x0135
+
+#define BT541_RAWDATA_REG			0x0200
+
+#define BT541_EEPROM_INFO_REG			0x0018
+
+#define BT541_INT_ENABLE_FLAG			0x00f0
+#define BT541_PERIODICAL_INTERRUPT_INTERVAL	0x00f1
+
+#define BT541_BTN_WIDTH				0x016d
+
+#define BT541_CHECKSUM_RESULT			0x012c
+
+#define BT541_INIT_FLASH			0x01d0
+#define BT541_WRITE_FLASH			0x01d1
+#define BT541_READ_FLASH			0x01d2
+
+#define ZINITIX_INTERNAL_FLAG_02		0x011e
+#define ZINITIX_INTERNAL_FLAG_03		0x011f
+
+#define ZINITIX_I2C_CHECKSUM_WCNT		0x016a
+#define ZINITIX_I2C_CHECKSUM_RESULT		0x016c
+
+/* Interrupt & status register flags */
+
+#define BIT_PT_CNT_CHANGE	BIT(0)
+#define BIT_DOWN		BIT(1)
+#define BIT_MOVE		BIT(2)
+#define BIT_UP			BIT(3)
+#define BIT_PALM		BIT(4)
+#define BIT_PALM_REJECT		BIT(5)
+#define BIT_RESERVED_0		BIT(6)
+#define BIT_RESERVED_1		BIT(7)
+#define BIT_WEIGHT_CHANGE	BIT(8)
+#define BIT_PT_NO_CHANGE	BIT(9)
+#define BIT_REJECT		BIT(10)
+#define BIT_PT_EXIST		BIT(11)
+#define BIT_RESERVED_2		BIT(12)
+#define BIT_ERROR		BIT(13)
+#define BIT_DEBUG		BIT(14)
+#define BIT_ICON_EVENT		BIT(15)
+
+#define SUB_BIT_EXIST		BIT(0)
+#define SUB_BIT_DOWN		BIT(1)
+#define SUB_BIT_MOVE		BIT(2)
+#define SUB_BIT_UP		BIT(3)
+#define SUB_BIT_UPDATE		BIT(4)
+#define SUB_BIT_WAIT		BIT(5)
+
+#define DEFAULT_TOUCH_POINT_MODE	2
+#define MAX_SUPPORTED_FINGER_NUM	5
+
+#define CHIP_ON_DELAY		15 // ms
+#define FIRMWARE_ON_DELAY	40 // ms
+
+struct point_coord {
+	__le16	x;
+	__le16	y;
+	u8	width;
+	u8	sub_status;
+	// currently unused, but needed as padding:
+	u8	minor_width;
+	u8	angle;
+};
+
+struct touch_event {
+	__le16	status;
+	u8	finger_cnt;
+	u8	time_stamp;
+	struct point_coord point_coord[MAX_SUPPORTED_FINGER_NUM];
+};
+
+struct bt541_ts_data {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	struct touchscreen_properties prop;
+	struct regulator_bulk_data supplies[2];
+	u32 zinitix_mode;
+};
+
+static int zinitix_read_data(struct i2c_client *client, u16 reg, u8 *values, size_t length)
+{
+	int ret;
+	__le16 reg_le = cpu_to_le16(reg);
+
+	ret = i2c_master_send(client, (u8 *)&reg_le, sizeof(reg_le));
+	if (ret != sizeof(reg_le))
+		return ret < 0 ? ret : -EIO;
+
+	ret = i2c_master_recv(client, values, length);
+	if (ret != length)
+		return ret;
+
+	return 0;
+}
+
+static int zinitix_write_u16(struct i2c_client *client, u16 reg, u16 value)
+{
+	int ret;
+	__le16 packet[2] = {cpu_to_le16(reg), cpu_to_le16(value)};
+
+	ret = i2c_master_send(client, (u8 *)packet, sizeof(packet));
+	if (ret != sizeof(packet))
+		return ret < 0 ? ret : -EIO;
+
+	return 0;
+}
+
+static int zinitix_write_cmd(struct i2c_client *client, u16 reg)
+{
+	int ret;
+	__le16 reg_le = cpu_to_le16(reg);
+
+	ret = i2c_master_send(client, (u8 *)&reg_le, sizeof(reg_le));
+	if (ret != sizeof(reg_le))
+		return ret < 0 ? ret : -EIO;
+
+	return 0;
+}
+
+static bool zinitix_init_touch(struct bt541_ts_data *bt541)
+{
+	struct i2c_client *client = bt541->client;
+	int i;
+	int error;
+
+	error = zinitix_write_cmd(client, BT541_SWRESET_CMD);
+	if (error) {
+		dev_err(&client->dev, "Failed to write reset command\n");
+		return error;
+	}
+
+	error = zinitix_write_u16(client, BT541_INT_ENABLE_FLAG, 0x0);
+	if (error) {
+		dev_err(&client->dev, "Failed to reset interrupt enable flag\n");
+		return error;
+	}
+
+	/* initialize */
+	error = zinitix_write_u16(client, BT541_X_RESOLUTION, (u16)bt541->prop.max_x);
+	if (error)
+		return error;
+
+	error = zinitix_write_u16(client, BT541_Y_RESOLUTION, (u16)bt541->prop.max_y);
+	if (error)
+		return error;
+
+	error = zinitix_write_u16(client, BT541_SUPPORTED_FINGER_NUM,
+				  (u16)MAX_SUPPORTED_FINGER_NUM);
+	if (error)
+		return error;
+
+	error = zinitix_write_u16(client, BT541_INITIAL_TOUCH_MODE, bt541->zinitix_mode);
+	if (error)
+		return error;
+
+	error = zinitix_write_u16(client, BT541_TOUCH_MODE, bt541->zinitix_mode);
+	if (error)
+		return error;
+
+	error = zinitix_write_u16(client, BT541_INT_ENABLE_FLAG,
+				  BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE | BIT_UP);
+	if (error)
+		return error;
+
+	/* clear queue */
+	for (i = 0; i < 10; i++) {
+		zinitix_write_cmd(client, BT541_CLEAR_INT_STATUS_CMD);
+		udelay(10);
+	}
+
+	return 0;
+}
+
+static int zinitix_init_regulators(struct bt541_ts_data *bt541)
+{
+	struct i2c_client *client = bt541->client;
+	int error;
+
+	bt541->supplies[0].supply = "vdd";
+	bt541->supplies[1].supply = "vddo";
+	error = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(bt541->supplies),
+					bt541->supplies);
+	if (error < 0) {
+		dev_err(&client->dev, "Failed to get regulators: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
+{
+	int error;
+	struct i2c_client *client = bt541->client;
+
+	error = zinitix_write_u16(client, 0xc000, 0x0001);
+	if (error) {
+		dev_err(&client->dev, "Failed to send power sequence(vendor cmd enable)\n");
+		return error;
+	}
+	udelay(10);
+
+	error = zinitix_write_cmd(client, 0xc004);
+	if (error) {
+		dev_err(&client->dev, "Failed to send power sequence(intn clear)\n");
+		return error;
+	}
+	udelay(10);
+
+	error = zinitix_write_u16(client, 0xc002, 0x0001);
+	if (error) {
+		dev_err(&client->dev, "Failed to send power sequence(nvm init)\n");
+		return error;
+	}
+	mdelay(2);
+
+	error = zinitix_write_u16(client, 0xc001, 0x0001);
+	if (error) {
+		dev_err(&client->dev, "Failed to send power sequence(program start)\n");
+		return error;
+	}
+	msleep(FIRMWARE_ON_DELAY);
+
+	return 0;
+}
+
+static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
+{
+	struct bt541_ts_data *bt541 = (struct bt541_ts_data *)bt541_handler;
+	struct i2c_client *client = bt541->client;
+	struct input_dev *input_dev = bt541->input_dev;
+	int i;
+	int error;
+	struct touch_event touch_event;
+
+	if (!input_dev->users) 
+		return IRQ_HANDLED;
+
+	memset(&touch_event, 0, sizeof(struct touch_event));
+
+	error = zinitix_read_data(bt541->client, BT541_POINT_STATUS_REG,
+				  (u8 *)&touch_event, sizeof(struct touch_event));
+	if (error) {
+		dev_err(&client->dev, "Failed to read in touchpoint struct\n");
+
+		goto out;
+	}
+
+	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
+		if (!(touch_event.point_coord[i].sub_status & SUB_BIT_EXIST))
+			continue;
+
+		input_mt_slot(bt541->input_dev, i);
+		input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
+		touchscreen_report_pos(bt541->input_dev, &bt541->prop,
+				       le16_to_cpu(touch_event.point_coord[i].x),
+				       le16_to_cpu(touch_event.point_coord[i].y), true);
+		input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR,
+				 touch_event.point_coord[i].width);
+	}
+
+	input_mt_sync_frame(bt541->input_dev);
+	input_sync(bt541->input_dev);
+out:
+	zinitix_write_cmd(bt541->client, BT541_CLEAR_INT_STATUS_CMD);
+
+	return IRQ_HANDLED;
+}
+
+static int zinitix_start(struct bt541_ts_data *bt541)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(bt541->supplies), bt541->supplies);
+	if (error < 0) {
+		dev_err(&bt541->client->dev, "Failed to enable regulators: %d\n", error);
+		return error;
+	}
+
+	msleep(CHIP_ON_DELAY);
+
+	error = zinitix_send_power_on_sequence(bt541);
+	if (error) {
+		dev_err(&bt541->client->dev, "Error while sending power-on sequence: %d\n", error);
+		return error;
+	}
+
+	error = zinitix_init_touch(bt541);
+	if (error) {
+		dev_err(&bt541->client->dev, "Error while configuring touch IC\n");
+		return error;
+	}
+
+	enable_irq(bt541->client->irq);
+
+	return 0;
+}
+
+static int zinitix_stop(struct bt541_ts_data *bt541)
+{
+	int error;
+
+	disable_irq(bt541->client->irq);
+
+	error = regulator_bulk_disable(ARRAY_SIZE(bt541->supplies), bt541->supplies);
+	if (error) {
+		dev_err(&bt541->client->dev, "Failed to disable regulators: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_input_open(struct input_dev *dev)
+{
+	struct bt541_ts_data *bt541 = input_get_drvdata(dev);
+
+	return zinitix_start(bt541);
+}
+
+static void zinitix_input_close(struct input_dev *dev)
+{
+	struct bt541_ts_data *bt541 = input_get_drvdata(dev);
+
+	zinitix_stop(bt541);
+}
+
+static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
+{
+	int error;
+
+	bt541->input_dev = devm_input_allocate_device(&bt541->client->dev);
+	if (!bt541->input_dev) {
+		dev_err(&bt541->client->dev, "Failed to allocate input device.");
+		return -ENOMEM;
+	}
+
+	bt541->input_dev->name = "Zinitix Capacitive TouchScreen";
+	bt541->input_dev->phys = "input/ts";
+	bt541->input_dev->id.bustype = BUS_I2C;
+	bt541->input_dev->open = zinitix_input_open;
+	bt541->input_dev->close = zinitix_input_close;
+
+	input_set_capability(bt541->input_dev, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(bt541->input_dev, EV_ABS, ABS_MT_POSITION_Y);
+	input_set_abs_params(bt541->input_dev, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
+	input_set_abs_params(bt541->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(bt541->input_dev, true, &bt541->prop);
+
+	if (!bt541->prop.max_x || !bt541->prop.max_y) {
+		dev_err(&bt541->client->dev,
+			"Touchscreen-size-x and/or touchscreen-size-y not set in dts\n");
+		return -EINVAL;
+	}
+
+	error = input_mt_init_slots(bt541->input_dev, MAX_SUPPORTED_FINGER_NUM,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(&bt541->client->dev,
+			"Failed to initialize MT slots: %d", error);
+		return error;
+	}
+
+	error = input_register_device(bt541->input_dev);
+	if (error) {
+		dev_err(&bt541->client->dev,
+			"Failed to register input device: %d", error);
+		return error;
+	}
+
+	input_set_drvdata(bt541->input_dev, bt541);
+
+	return 0;
+}
+
+static int zinitix_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct bt541_ts_data *bt541;
+	int error;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "Failed to assert adapter's support for plain I2C.\n");
+		return -ENXIO;
+	}
+
+	bt541 = devm_kzalloc(&client->dev, sizeof(*bt541), GFP_KERNEL);
+	if (!bt541)
+		return -ENOMEM;
+
+	bt541->client = client;
+	i2c_set_clientdata(client, bt541);
+
+	error = zinitix_init_regulators(bt541);
+	if (error) {
+		dev_err(&client->dev, "Failed to initialize regulators: %d\n", error);
+		return error;
+	}
+
+	error = zinitix_init_input_dev(bt541);
+	if (error) {
+		dev_err(&client->dev, "Failed to initialize input device: %d\n", error);
+		return error;
+	}
+
+	error = device_property_read_u32(&client->dev, "zinitix,mode", &bt541->zinitix_mode);
+	if (error < 0) {
+		// fall back to mode 2
+		bt541->zinitix_mode = DEFAULT_TOUCH_POINT_MODE;
+	}
+
+	if (bt541->zinitix_mode != 2) {
+		// if devices are found which don't support mode 2, support for other modes (0, 1)
+		// may be needed.
+		dev_err(&client->dev, "Malformed zinitix,mode property, must be 2 (supplied: %d)\n",
+			bt541->zinitix_mode);
+		return -EINVAL;
+	}
+
+	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
+	error = devm_request_threaded_irq(&client->dev, client->irq, NULL, zinitix_ts_irq_handler,
+					  IRQF_ONESHOT, client->name, bt541);
+	if (error) {
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused zinitix_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct bt541_ts_data *bt541 = i2c_get_clientdata(client);
+
+	/* Release all fingers */
+	input_mt_sync_frame(bt541->input_dev);
+	input_sync(bt541->input_dev);
+
+	mutex_lock(&bt541->input_dev->mutex);
+
+	if (bt541->input_dev->users)
+		zinitix_stop(bt541);
+
+	mutex_unlock(&bt541->input_dev->mutex);
+
+	return 0;
+}
+
+static int __maybe_unused zinitix_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct bt541_ts_data *bt541 = i2c_get_clientdata(client);
+	int ret = 0;
+
+	mutex_lock(&bt541->input_dev->mutex);
+
+	if (bt541->input_dev->users)
+		ret = zinitix_start(bt541);
+
+	mutex_unlock(&bt541->input_dev->mutex);
+
+	return ret;
+}
+
+static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_suspend, zinitix_resume);
+
+#ifdef CONFIG_OF
+static const struct of_device_id zinitix_of_match[] = {
+	{ .compatible = "zinitix,bt541" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zinitix_of_match);
+#endif
+
+static struct i2c_driver zinitix_ts_driver = {
+	.probe = zinitix_ts_probe,
+	.driver = {
+		.name = "Zinitix-TS",
+		.pm = &zinitix_pm_ops,
+		.of_match_table = of_match_ptr(zinitix_of_match),
+	},
+};
+module_i2c_driver(zinitix_ts_driver);
+
+MODULE_AUTHOR("Michael Srba <Michael.Srba@seznam.cz>");
+MODULE_DESCRIPTION("Zinitix touchscreen driver");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

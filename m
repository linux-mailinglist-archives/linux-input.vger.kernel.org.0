Return-Path: <linux-input+bounces-4105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5C8FC75B
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 11:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2A602865B1
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 09:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62C418FDB8;
	Wed,  5 Jun 2024 09:12:21 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com [115.124.28.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8218F2DB;
	Wed,  5 Jun 2024 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578741; cv=none; b=ZALjfvPoWC53O2ZlpghTEKw8bUEYInTEqB9tXuM6PuB097J5EbU2q5FtE872A60YDN5YnOh4xK+VOOun62gqqByow1LDn8fyGifSYCLdye3mWmVlNP6ANmyLrymPBObJKCk4GQj2lNUyxbcXAIwaXp4sj43kRSr5fNQFG2gFyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578741; c=relaxed/simple;
	bh=/piz7l6LFaRFHzxtFtZIeSgtHht6c/yfmfAeT9uq3Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGeaSSKk86iGzjfEMo6Brp/W16rQ/RfvwqPpAZiceCCjEXRp3zcdHs0XOy0pRLccRrCnG625Yt9A+tktGo1IoSvaZK+fysd01PQHJz5EM/RnQsB7j7denYg475o4CkkKYpRlldtUdvyEOrF/mC33IlPgWFwCMLlDVF9j7D+aHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0378758-0.000531947-0.961592;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068155186;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XwdqTne_1717578726;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XwdqTne_1717578726)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 17:12:07 +0800
From: wangshuaijie@awinic.com
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jeff@labundy.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: wangshuaijie@awinic.com,
	liweilei@awinic.com,
	kangjiajun@awinic.com
Subject: [PATCH V2 5/5] Add support for Awinic sar sensor.
Date: Wed,  5 Jun 2024 09:11:43 +0000
Message-ID: <20240605091143.163789-6-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240605091143.163789-1-wangshuaijie@awinic.com>
References: <20240605091143.163789-1-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: shuaijie wang <wangshuaijie@awinic.com>

Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Reported-by: Dan Carpenter <error27@gmail.com>
---
 drivers/input/misc/Kconfig         |    9 +
 drivers/input/misc/Makefile        |    1 +
 drivers/input/misc/aw_sar/Makefile |    2 +
 drivers/input/misc/aw_sar/aw_sar.c | 2036 ++++++++++++++++++++++++++++
 drivers/input/misc/aw_sar/aw_sar.h |   15 +
 5 files changed, 2063 insertions(+)
 create mode 100644 drivers/input/misc/aw_sar/Makefile
 create mode 100644 drivers/input/misc/aw_sar/aw_sar.c
 create mode 100644 drivers/input/misc/aw_sar/aw_sar.h

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6ba984d7f0b1..ac56fdd21839 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -939,4 +939,13 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config AWINIC_SAR
+	tristate "Awinic sar sensor support"
+	depends on I2C
+	help
+	  Say Y to enable support for the Awinic sar sensor driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called awinic_sar.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 04296a4abe8e..6ee1870ea677 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -90,3 +90,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
+obj-$(CONFIG_AWINIC_SAR)		+= aw_sar/
diff --git a/drivers/input/misc/aw_sar/Makefile b/drivers/input/misc/aw_sar/Makefile
new file mode 100644
index 000000000000..c357ecaa4f98
--- /dev/null
+++ b/drivers/input/misc/aw_sar/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_AWINIC_SAR) += awinic_sar.o
+awinic_sar-objs := ./comm/aw_sar_comm_interface.o aw_sar.o ./aw9610x/aw9610x.o ./aw963xx/aw963xx.o
diff --git a/drivers/input/misc/aw_sar/aw_sar.c b/drivers/input/misc/aw_sar/aw_sar.c
new file mode 100644
index 000000000000..ab89fed65a6a
--- /dev/null
+++ b/drivers/input/misc/aw_sar/aw_sar.c
@@ -0,0 +1,2036 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AWINIC sar sensor driver
+ *
+ * Author: Shuaijie Wang<wangshuaijie@awinic.com>
+ *
+ * Copyright (c) 2024 awinic Technology CO., LTD
+ */
+#include "./comm/aw_sar_chip_interface.h"
+#include "aw_sar.h"
+
+#define AW_SAR_I2C_NAME		"awinic_sar"
+
+/*
+ * Please check which power_supply on your platform
+ * can get the charger insertion information, then select it.
+ * eg: "usb"/"charger"/"mtk-master-charger"/"mtk_charger_type"
+ */
+#define USB_POWER_SUPPLY_NAME   "charger"
+/*
+ * Check which of your power_supply properties is available
+ * for the charger insertion information and select it.
+ * eg: POWER_SUPPLY_PROP_ONLINE/POWER_SUPPLY_PROP_PRESENT
+ */
+#define AW_USB_PROP_ONLINE	POWER_SUPPLY_PROP_ONLINE
+
+#define AW_I2C_RW_RETRY_TIME_MIN		(2000)
+#define AW_I2C_RW_RETRY_TIME_MAX		(3000)
+#define AW_RETRIES				(5)
+
+#define AW_SAR_AWRW_OffSET			(20)
+#define AW_SAR_AWRW_DATA_WIDTH			(5)
+#define AW_DATA_OffSET_2			(2)
+#define AW_DATA_OffSET_3			(3)
+#define AW_POWER_ON_SYSFS_DELAY_MS		(5000)
+#define AW_SAR_MONITOR_ESD_DELAY_MS		(5000)
+#define AW_SAR_OFFSET_LEN			(15)
+#define AW_SAR_VCC_MIN_UV			(1700000)
+#define AW_SAR_VCC_MAX_UV			(3600000)
+
+static struct mutex aw_sar_lock;
+
+static int32_t aw_sar_get_chip_info(struct aw_sar *p_sar);
+static void aw_sar_sensor_free(struct aw_sar *p_sar);
+
+//Because disable/enable_irq api Therefore, IRQ is embedded
+void aw_sar_disable_irq(struct aw_sar *p_sar)
+{
+	if (p_sar->irq_init.host_irq_stat == IRQ_ENABLE) {
+		disable_irq(p_sar->irq_init.to_irq);
+		p_sar->irq_init.host_irq_stat = IRQ_DISABLE;
+	}
+}
+
+void aw_sar_enable_irq(struct aw_sar *p_sar)
+{
+	if (p_sar->irq_init.host_irq_stat == IRQ_DISABLE) {
+		enable_irq(p_sar->irq_init.to_irq);
+		p_sar->irq_init.host_irq_stat = IRQ_ENABLE;
+	}
+}
+
+//Chip logic part start
+//Load default array function
+static int32_t
+aw_sar_para_loaded_func(struct i2c_client *i2c, const struct aw_sar_para_load_t *para_load)
+{
+	int32_t ret;
+	int32_t i;
+
+	for (i = 0; i < para_load->reg_arr_len; i = i + 2) {
+		ret = aw_sar_i2c_write(i2c, (uint16_t)para_load->reg_arr[i],
+						para_load->reg_arr[i + 1]);
+		if (ret != 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+//Mode setting function
+static void aw_sar_mode_set_func(struct i2c_client *i2c, int to_irq,
+		struct aw_sar_mode_set_t *mode_set_para,
+		const struct aw_sar_mode_set_t *mode_set, uint8_t len)
+{
+	uint8_t i;
+
+	for (i = 0; i < len; i++) {
+		if ((mode_set[i].chip_mode.curr_mode == mode_set_para->chip_mode.curr_mode) &&
+				(mode_set[i].chip_mode.last_mode == mode_set_para->chip_mode.last_mode) &&
+				((mode_set[i].chip_id == AW_SAR_NONE_CHECK_CHIP) ||
+				 ((mode_set[i].chip_id & mode_set_para->chip_id) != 0))) {
+			if (mode_set[i].mode_switch_ops.enable_clock != NULL)
+				mode_set[i].mode_switch_ops.enable_clock(i2c);
+			if (mode_set[i].mode_switch_ops.rc_irqscr != NULL)
+				mode_set[i].mode_switch_ops.rc_irqscr(i2c);
+			if (mode_set[i].mode_switch_ops.mode_update != NULL)
+				mode_set[i].mode_switch_ops.mode_update(i2c);
+			break;
+		}
+	}
+}
+
+static int32_t aw_sar_check_init_over_irq_func(struct i2c_client *i2c,
+					const struct aw_sar_init_over_irq_t *p_check_irq)
+{
+	int16_t cnt = p_check_irq->wait_times;
+	uint32_t irq_stat;
+	int32_t ret;
+
+	do {
+		ret = aw_sar_i2c_read(i2c, p_check_irq->reg_irqsrc, &irq_stat);
+		if (ret < 0)
+			return ret;
+		if (((irq_stat >> p_check_irq->irq_offset_bit) & p_check_irq->irq_mask) ==
+				p_check_irq->irq_flag)
+			return 0;
+		mdelay(1);
+	} while (cnt--);
+
+	if (cnt < 0)
+		dev_err(&i2c->dev, "init over irq error!");
+
+	return AW_ERR_IRQ_INIT_OVER;
+}
+
+static int32_t
+aw_sar_soft_reset_func(struct i2c_client *i2c, const struct aw_sar_soft_rst_t *p_soft_rst)
+{
+	int32_t ret;
+
+	ret = aw_sar_i2c_write(i2c, p_soft_rst->reg_rst, p_soft_rst->reg_rst_val);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "soft_reset error: %d", ret);
+		return ret;
+	}
+
+	msleep(p_soft_rst->delay_ms);
+
+	return 0;
+}
+//Chip logic part end
+
+static int32_t aw_sar_parse_bin(const struct firmware *cont, struct aw_sar *p_sar)
+{
+	enum aw_bin_err_val bin_ret;
+	struct aw_bin *aw_bin;
+	int32_t ret;
+
+	if (!cont) {
+		dev_err(p_sar->dev, "def_reg_bin request error!");
+		return -EINVAL;
+	}
+
+	dev_dbg(p_sar->dev, "Bin file size: %d", (uint32_t)cont->size);
+
+	aw_bin = devm_kzalloc(p_sar->dev, cont->size + sizeof(struct aw_bin), GFP_KERNEL);
+	if (!aw_bin) {
+		release_firmware(cont);
+		dev_err(p_sar->dev, "failed to allcating memory!");
+		return -ENOMEM;
+	}
+
+	aw_bin->info.len = cont->size;
+	memcpy(aw_bin->info.data, cont->data, cont->size);
+
+	bin_ret = aw_sar_parsing_bin_file(aw_bin);
+	if (bin_ret < 0) {
+		dev_err(p_sar->dev, "parse bin fail! bin_ret = %d", bin_ret);
+		goto err;
+	}
+
+	//Write bin file execution process
+	if (p_sar->load_bin.bin_opera_func != NULL) {
+		ret = p_sar->load_bin.bin_opera_func(aw_bin, p_sar);
+		if (ret != 0) {
+			dev_err(p_sar->dev, "load_bin_to_chip error!");
+			if (p_sar->load_bin.bin_load_fail_opera_func != NULL) {
+				ret = p_sar->load_bin.bin_load_fail_opera_func(aw_bin, p_sar);
+				if (ret != 0) {
+					dev_err(p_sar->dev, "bin_load_fail_opera_func error!");
+					goto err;
+				}
+			} else {
+				goto err;
+			}
+		}
+	} else {
+		dev_err(p_sar->dev, "bin_opera_func is null error!");
+	}
+
+	if (aw_bin != NULL)
+		devm_kfree(p_sar->dev, aw_bin);
+
+	return 0;
+err:
+	if (aw_bin != NULL)
+		devm_kfree(p_sar->dev, aw_bin);
+
+	return -EINVAL;
+}
+
+static int32_t aw_sar_load_bin_comm(struct aw_sar *p_sar)
+{
+	const struct firmware *fw;
+	int32_t ret;
+
+	ret = request_firmware(&fw, p_sar->load_bin.bin_name, p_sar->dev);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "parse %s error!", p_sar->load_bin.bin_name);
+		return ret;
+	}
+
+	ret = aw_sar_parse_bin(fw, p_sar);
+	if (ret != 0)
+		dev_err(p_sar->dev, "reg_bin %s load error!", p_sar->load_bin.bin_name);
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int32_t aw_sar_parse_dts_comm(struct device *dev, struct device_node *np,
+		struct aw_sar_dts_info *p_dts_info)
+{
+	int32_t val;
+
+	val = of_property_read_u32(np, "awinic,sar-label", &p_dts_info->sar_num);
+	dev_info(dev, "sar label = %d", p_dts_info->sar_num);
+	if (val != 0) {
+		dev_err(dev, "multiple sar failed!");
+		return -EINVAL;
+	}
+
+	p_dts_info->irq_gpio = of_get_named_gpio(np, "irq-gpio", 0);
+	if (p_dts_info->irq_gpio < 0) {
+		p_dts_info->irq_gpio = -1;
+		dev_err(dev, "no irq gpio provided.");
+		return -EINVAL;
+	}
+
+	val = of_property_read_u32(np, "awinic,channel-use-mask", &p_dts_info->channel_use_flag);
+	if (val != 0) {
+		dev_err(dev, "channel_use_flag failed!");
+		return -EINVAL;
+	}
+
+	//GPIO is set as internal pull-up input
+	p_dts_info->use_inter_pull_up = of_property_read_bool(np, "awinic,pin-set-inter-pull-up");
+	p_dts_info->use_pm = of_property_read_bool(np, "awinic,using-pm-ops");
+	p_dts_info->update_fw_flag = of_property_read_bool(np, "awinic,update-fw");
+	p_dts_info->use_plug_cail_flag = of_property_read_bool(np, "awinic,use-plug-cail");
+	p_dts_info->monitor_esd_flag = of_property_read_bool(np, "awinic,monitor-esd");
+
+	return 0;
+}
+
+static int32_t aw_sar_parse_dts(struct aw_sar *p_sar)
+{
+	int32_t ret;
+
+	ret = aw_sar_parse_dts_comm(p_sar->dev, p_sar->i2c->dev.of_node, &p_sar->dts_info);
+
+	//Special requirements of SAR chip
+	if (p_sar->p_sar_para->p_platform_config->p_add_parse_dts_fn != NULL)
+		ret |= p_sar->p_sar_para->p_platform_config->p_add_parse_dts_fn(p_sar);
+
+	return ret;
+}
+
+static irqreturn_t aw_sar_irq(int32_t irq, void *data)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	uint32_t irq_status = 0;
+
+	//step1: read clear interrupt
+	if (p_sar->p_sar_para->p_platform_config->p_irq_init->rc_irq_fn != NULL)
+		irq_status = p_sar->p_sar_para->p_platform_config->p_irq_init->rc_irq_fn(p_sar->i2c);
+
+	//step2: Read the status register for status reporting
+	if (p_sar->p_sar_para->p_platform_config->p_irq_init->irq_spec_handler_fn != NULL)
+		p_sar->p_sar_para->p_platform_config->p_irq_init->irq_spec_handler_fn(irq_status,
+				p_sar);
+
+	//step3: The chip
+
+	if ((!p_sar->dts_info.monitor_esd_flag) && (p_sar->fault_flag == AW_SAR_UNHEALTHY)) {
+		p_sar->fault_flag = AW_SAR_HEALTHY;
+		disable_irq_nosync(p_sar->irq_init.to_irq);
+		p_sar->irq_init.host_irq_stat = IRQ_DISABLE;
+		//aw_sar_soft_reset(p_sar);
+		schedule_delayed_work(&p_sar->update_work, msecs_to_jiffies(500));
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int32_t aw_sar_irq_init_comm(struct aw_sar *p_sar, const struct aw_sar_irq_init_t *p_irq_init)
+{
+	irq_handler_t thread_fn = p_irq_init->thread_fn;
+	int32_t ret;
+
+	snprintf(p_sar->irq_init.label, sizeof(p_sar->irq_init.label),
+				"aw_sar%u_gpio", p_sar->dts_info.sar_num);
+	snprintf(p_sar->irq_init.dev_id, sizeof(p_sar->irq_init.dev_id),
+				"aw_sar%u_irq", p_sar->dts_info.sar_num);
+
+	if (gpio_is_valid(p_sar->dts_info.irq_gpio)) {
+		p_sar->irq_init.to_irq = gpio_to_irq(p_sar->dts_info.irq_gpio);
+		ret = devm_gpio_request_one(p_sar->dev,
+						p_sar->dts_info.irq_gpio,
+						p_irq_init->flags,
+						p_sar->irq_init.label);
+		if (ret) {
+			dev_err(p_sar->dev,
+				"request irq gpio failed, ret = %d", ret);
+			return ret;
+		}
+		if (!thread_fn)
+			thread_fn = aw_sar_irq;
+		ret = devm_request_threaded_irq(p_sar->dev,
+				p_sar->irq_init.to_irq,
+				p_irq_init->handler,
+				thread_fn,
+				p_irq_init->irq_flags,
+				p_sar->irq_init.dev_id,
+				p_sar);
+		if (ret != 0) {
+			dev_err(p_sar->dev,
+					"failed to request IRQ %d: %d",
+					p_sar->irq_init.to_irq, ret);
+			return ret;
+		}
+	} else {
+		dev_err(p_sar->dev, "irq gpio invalid!");
+		return -EINVAL;
+	}
+
+	p_sar->irq_init.host_irq_stat = IRQ_DISABLE;
+	disable_irq(p_sar->irq_init.to_irq);
+
+	return 0;
+}
+
+static int32_t aw_sar_irq_init(struct aw_sar *p_sar)
+{
+
+	if (!p_sar->p_sar_para->p_platform_config->p_irq_init) {
+		dev_err(p_sar->dev, "AW_INVALID_PARA");
+		return -EINVAL;
+	}
+
+	if (p_sar->p_sar_para->p_platform_config->p_irq_init->p_irq_init_fn != NULL) {
+		dev_err(p_sar->dev, "p_irq_init_fn");
+		return p_sar->p_sar_para->p_platform_config->p_irq_init->p_irq_init_fn(p_sar);
+	}
+
+	return aw_sar_irq_init_comm(p_sar, p_sar->p_sar_para->p_platform_config->p_irq_init);
+}
+
+static void aw_sar_irq_free(struct aw_sar *p_sar)
+{
+	if ((p_sar->p_sar_para->p_platform_config != NULL) &&
+		(p_sar->p_sar_para->p_platform_config->p_irq_init != NULL) &&
+		(p_sar->p_sar_para->p_platform_config->p_irq_init->p_irq_deinit_fn != NULL)) {
+		p_sar->p_sar_para->p_platform_config->p_irq_init->p_irq_deinit_fn(p_sar);
+		dev_err(p_sar->dev, "AW_INVALID_PARA");
+		return;
+	}
+}
+
+static int32_t aw_sar_input_init_comm(struct aw_sar *p_sar)
+{
+	int32_t ret;
+	uint32_t i;
+
+	p_sar->channels_arr = devm_kzalloc(p_sar->dev,
+				sizeof(struct aw_channels_info) *
+				p_sar->p_sar_para->ch_num_max,
+				GFP_KERNEL);
+	if (!p_sar->channels_arr) {
+		dev_err(p_sar->dev, "devm_kzalloc err");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < p_sar->p_sar_para->ch_num_max; i++) {
+		snprintf(p_sar->channels_arr[i].name,
+				sizeof(p_sar->channels_arr->name),
+				"aw_sar%u_ch%ud",
+				p_sar->dts_info.sar_num, i);
+
+		p_sar->channels_arr[i].last_channel_info = 0;
+
+		if ((p_sar->dts_info.channel_use_flag >> i) & 0x01) {
+			p_sar->channels_arr[i].used = AW_TRUE;
+			p_sar->channels_arr[i].input = devm_input_allocate_device(p_sar->dev);
+			if (!p_sar->channels_arr[i].input)
+				return -EINVAL;
+			p_sar->channels_arr[i].input->name = p_sar->channels_arr[i].name;
+			input_set_abs_params(p_sar->channels_arr[i].input,
+						ABS_DISTANCE, -1, 100, 0, 0);
+			ret = input_register_device(p_sar->channels_arr[i].input);
+			if (ret) {
+				dev_err(p_sar->dev, "failed to register input device");
+				return ret;
+			}
+		} else {
+			p_sar->channels_arr[i].used = AW_FALSE;
+			p_sar->channels_arr[i].input = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int32_t aw_sar_input_init(struct aw_sar *p_sar)
+{
+	if (p_sar->p_sar_para->p_platform_config->p_input_init_fn != NULL)
+		return p_sar->p_sar_para->p_platform_config->p_input_init_fn(p_sar);
+
+	return aw_sar_input_init_comm(p_sar);
+}
+
+static void aw_sar_input_free(struct aw_sar *p_sar)
+{
+	if ((p_sar->p_sar_para->p_platform_config != NULL) &&
+		(p_sar->p_sar_para->p_platform_config->p_input_deinit_fn != NULL)) {
+		p_sar->p_sar_para->p_platform_config->p_input_deinit_fn(p_sar);
+	}
+}
+
+static int32_t aw_sar_check_init_over_irq_comm(struct aw_sar *p_sar)
+{
+	int32_t ret;
+
+	if (!p_sar->p_sar_para->p_init_over_irq)
+		return -EINVAL;
+
+	ret = aw_sar_check_init_over_irq_func(p_sar->i2c, p_sar->p_sar_para->p_init_over_irq);
+	if (ret == AW_ERR_IRQ_INIT_OVER) {
+		if (p_sar->p_sar_para->p_init_over_irq->p_get_err_type_fn != NULL) {
+			//Consider the abnormality reasonable
+			if (p_sar->p_sar_para->p_init_over_irq->p_get_err_type_fn(p_sar) == 0) {
+				p_sar->fw_fail_flag = AW_TRUE;
+				return 0;
+			}
+		}
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+//If there is no special operation on the chip, execute the common process
+int32_t aw_sar_check_init_over_irq(struct aw_sar *p_sar)
+{
+	if (!p_sar->p_sar_para->p_init_over_irq)
+		return -EINVAL;
+
+	if (p_sar->p_sar_para->p_init_over_irq->p_check_init_over_irq_fn != NULL)
+		return p_sar->p_sar_para->p_init_over_irq->p_check_init_over_irq_fn(p_sar);
+
+	return aw_sar_check_init_over_irq_comm(p_sar);
+}
+
+static int32_t aw_sar_chip_other_operation(struct aw_sar *p_sar)
+{
+	if (p_sar->p_sar_para->p_other_operation != NULL)
+		return p_sar->p_sar_para->p_other_operation(p_sar);
+
+	return 0;
+}
+
+static void aw_sar_chip_other_operation_free(struct aw_sar *p_sar)
+{
+	if (p_sar->p_sar_para->p_other_opera_free != NULL)
+		p_sar->p_sar_para->p_other_opera_free(p_sar);
+}
+
+int32_t aw_sar_soft_reset(struct aw_sar *p_sar)
+{
+	if (!p_sar->p_sar_para->p_soft_rst)
+		return -EINVAL;
+
+	//If a private interface is defined, the private interface is used
+	if (p_sar->p_sar_para->p_soft_rst->p_soft_reset_fn != NULL)
+		return p_sar->p_sar_para->p_soft_rst->p_soft_reset_fn(p_sar);
+
+	return aw_sar_soft_reset_func(p_sar->i2c, p_sar->p_sar_para->p_soft_rst);
+}
+
+static int32_t aw_sar_check_chipid(struct aw_sar *p_sar)
+{
+	if (!p_sar->p_sar_para)
+		return -EINVAL;
+
+	if (p_sar->p_sar_para->p_check_chipid != NULL) {
+		if (p_sar->p_sar_para->p_check_chipid->p_check_chipid_fn != NULL)
+			return p_sar->p_sar_para->p_check_chipid->p_check_chipid_fn(p_sar);
+	}
+
+	return -EINVAL;
+}
+
+int32_t aw_sar_load_def_reg_bin(struct aw_sar *p_sar)
+{
+	if ((!p_sar->p_sar_para->p_reg_bin) ||
+		(!p_sar->p_sar_para->p_reg_bin->bin_name)) {
+		dev_err(p_sar->dev, "p_reg_bin is NULL or bin_name is NULL error");
+		p_sar->ret_val = AW_BIN_PARA_INVALID;
+		return -EINVAL;
+	}
+
+	snprintf(p_sar->load_bin.bin_name, sizeof(p_sar->load_bin.bin_name),
+			"%s_%u.bin", p_sar->p_sar_para->p_reg_bin->bin_name,
+			p_sar->dts_info.sar_num);
+
+	p_sar->load_bin.bin_opera_func = p_sar->p_sar_para->p_reg_bin->bin_opera_func;
+
+	return aw_sar_load_bin_comm(p_sar);
+}
+
+static int32_t aw_sar_para_loaded(struct aw_sar *p_sar)
+{
+	if (!p_sar->p_sar_para->p_reg_arr)
+		return -EINVAL;
+
+	aw_sar_para_loaded_func(p_sar->i2c, p_sar->p_sar_para->p_reg_arr);
+
+	return 0;
+}
+
+static int32_t aw_sar_reg_update_boot_work(struct aw_sar *p_sar)
+{
+	if ((!p_sar->p_sar_para->p_boot_bin) || (!p_sar->p_sar_para->p_boot_bin->bin_name))
+		return -EINVAL;
+
+	snprintf(p_sar->load_bin.bin_name, sizeof(p_sar->load_bin.bin_name),
+			"%s_%u.bin", p_sar->p_sar_para->p_boot_bin->bin_name,
+			p_sar->dts_info.sar_num);
+
+	p_sar->load_bin.bin_opera_func = p_sar->p_sar_para->p_boot_bin->bin_opera_func;
+
+	return aw_sar_load_bin_comm(p_sar);
+}
+
+static int32_t aw_sar_update_fw_para(struct aw_sar *p_sar, const struct aw_sar_load_bin_t *p_bin)
+{
+	if ((!p_bin) || (!p_bin->bin_name))
+		return -EINVAL;
+
+	p_sar->load_bin.bin_opera_func = p_bin->bin_opera_func;
+	p_sar->load_bin.bin_load_fail_opera_func = p_bin->bin_load_fail_opera;
+
+	snprintf(p_sar->load_bin.bin_name, sizeof(p_sar->load_bin.bin_name),
+			"%s_%u.bin", p_bin->bin_name, p_sar->dts_info.sar_num);
+
+	return 0;
+}
+
+int32_t aw_sar_update_fw(struct aw_sar *p_sar)
+{
+	if (aw_sar_update_fw_para(p_sar, p_sar->p_sar_para->p_fw_bin) != 0)
+		return -EINVAL;
+
+	return aw_sar_load_bin_comm(p_sar);
+}
+
+static int32_t aw_sar_node_prox_update_fw(struct aw_sar *p_sar)
+{
+	if (aw_sar_update_fw_para(p_sar, p_sar->p_sar_para->p_prox_fw) != 0)
+		return -EINVAL;
+
+	return aw_sar_load_bin_comm(p_sar);
+}
+
+static int32_t aw_sar_node_reg_update_fw(struct aw_sar *p_sar)
+{
+	if (aw_sar_update_fw_para(p_sar, p_sar->p_sar_para->p_reg_fw))
+		return -EINVAL;
+
+	return aw_sar_load_bin_comm(p_sar);
+}
+
+static int32_t aw_sar_awrw_data_analysis(struct aw_sar *p_sar, const char *buf, uint8_t len)
+{
+	uint32_t theory_len = len * AW_SAR_AWRW_DATA_WIDTH + AW_SAR_AWRW_OffSET;
+	uint32_t actual_len = strlen(buf);
+	uint8_t data_temp[2] = { 0 };
+	uint32_t tranfar_data_temp;
+	uint8_t index = 0;
+	uint32_t i;
+
+	if (theory_len != actual_len) {
+		dev_err(p_sar->dev, "error theory_len = %d actual_len = %d",
+				theory_len, actual_len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < len * AW_SAR_AWRW_DATA_WIDTH; i += AW_SAR_AWRW_DATA_WIDTH) {
+		data_temp[0] = buf[AW_SAR_AWRW_OffSET + i + AW_DATA_OffSET_2];
+		data_temp[1] = buf[AW_SAR_AWRW_OffSET + i + AW_DATA_OffSET_3];
+
+		if (sscanf(data_temp, "%02x", &tranfar_data_temp) == 1)
+			p_sar->awrw_info.p_i2c_tranfar_data[index] = (uint8_t)tranfar_data_temp;
+		index++;
+	}
+
+	return 0;
+}
+
+static int32_t aw_sar_awrw_write(struct aw_sar *p_sar, const char *buf)
+{
+	int32_t ret;
+
+	ret = aw_sar_awrw_data_analysis(p_sar, buf, p_sar->awrw_info.i2c_tranfar_data_len);
+	if (ret == 0)
+		aw_sar_i2c_write_seq(p_sar->i2c, p_sar->awrw_info.p_i2c_tranfar_data,
+					p_sar->awrw_info.i2c_tranfar_data_len);
+
+	return ret;
+}
+
+static int32_t aw_sar_awrw_read(struct aw_sar *p_sar, const char *buf)
+{
+	int32_t ret = 0;
+	uint8_t *p_buf = p_sar->awrw_info.p_i2c_tranfar_data + p_sar->awrw_info.addr_len;
+	uint32_t len = (uint16_t)(p_sar->awrw_info.data_len * p_sar->awrw_info.reg_num);
+
+	ret = aw_sar_awrw_data_analysis(p_sar, buf, p_sar->awrw_info.addr_len);
+	if (ret == 0) {
+		ret = aw_sar_i2c_read_seq(p_sar->i2c,
+				p_sar->awrw_info.p_i2c_tranfar_data,
+				p_sar->awrw_info.addr_len,
+				p_sar->awrw_info.p_i2c_tranfar_data + p_sar->awrw_info.addr_len,
+				(uint16_t)(p_sar->awrw_info.data_len * p_sar->awrw_info.reg_num));
+		if (ret != 0)
+			memset(p_buf, 0xff, len);
+	}
+
+	return ret;
+}
+
+static int32_t aw_sar_awrw_get_func(struct aw_sar *p_sar, char *buf)
+{
+	uint32_t len = 0;
+	uint32_t i;
+
+	if (!p_sar->awrw_info.p_i2c_tranfar_data) {
+		dev_err(p_sar->dev, "p_i2c_tranfar_data is NULL");
+		return len;
+	}
+
+	if (p_sar->awrw_info.rw_flag == AW_SAR_PACKAGE_RD) {
+		for (i = 0; i < p_sar->awrw_info.i2c_tranfar_data_len; i++) {
+			len += snprintf(buf + len, PAGE_SIZE - len, "0x%02x,",
+				p_sar->awrw_info.p_i2c_tranfar_data[i]);
+		}
+	} else {
+		for (i = 0; i < (p_sar->awrw_info.data_len) * (p_sar->awrw_info.reg_num); i++) {
+			len += snprintf(buf + len, PAGE_SIZE - len, "0x%02x,",
+				p_sar->awrw_info.p_i2c_tranfar_data[p_sar->awrw_info.addr_len + i]);
+		}
+	}
+	snprintf(buf + len - 1, PAGE_SIZE - len, "\n");
+
+	devm_kfree(p_sar->dev, p_sar->awrw_info.p_i2c_tranfar_data);
+	p_sar->awrw_info.p_i2c_tranfar_data = NULL;
+
+	return len;
+}
+
+//Function: continuous read register interface
+static ssize_t awrw_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	ssize_t ret;
+
+	mutex_lock(&aw_sar_lock);
+	if ((p_sar->p_sar_para->p_aw_sar_awrw != NULL) &&
+		(p_sar->p_sar_para->p_aw_sar_awrw->p_get_awrw_node_fn != NULL)) {
+		ret = (ssize_t)p_sar->p_sar_para->p_aw_sar_awrw->p_get_awrw_node_fn(p_sar, buf);
+		mutex_unlock(&aw_sar_lock);
+		return ret;
+	}
+
+	ret = (ssize_t)aw_sar_awrw_get_func(p_sar, buf);
+
+	mutex_unlock(&aw_sar_lock);
+
+	return ret;
+}
+
+static int32_t aw_sar_awrw_handle(struct aw_sar *p_sar, const char *buf)
+{
+	int32_t ret;
+
+	p_sar->awrw_info.i2c_tranfar_data_len = p_sar->awrw_info.addr_len +
+						p_sar->awrw_info.data_len *
+						p_sar->awrw_info.reg_num;
+
+	if (p_sar->awrw_info.p_i2c_tranfar_data != NULL) {
+		devm_kfree(p_sar->dev, p_sar->awrw_info.p_i2c_tranfar_data);
+		p_sar->awrw_info.p_i2c_tranfar_data = NULL;
+	}
+
+	p_sar->awrw_info.p_i2c_tranfar_data = devm_kzalloc(p_sar->dev,
+			p_sar->awrw_info.i2c_tranfar_data_len, GFP_KERNEL);
+	if (!p_sar->awrw_info.p_i2c_tranfar_data)
+		return -ENOMEM;
+
+	if (p_sar->awrw_info.rw_flag == AW_SAR_I2C_WR) {
+		ret = aw_sar_awrw_write(p_sar, buf);
+		if (ret != 0)
+			dev_err(p_sar->dev, "awrw_write error");
+		if (p_sar->awrw_info.p_i2c_tranfar_data != NULL) {
+			devm_kfree(p_sar->dev, p_sar->awrw_info.p_i2c_tranfar_data);
+			p_sar->awrw_info.p_i2c_tranfar_data = NULL;
+		}
+	} else if (p_sar->awrw_info.rw_flag == AW_SAR_I2C_RD) {
+		ret = aw_sar_awrw_read(p_sar, buf);
+		if (ret != 0)
+			dev_err(p_sar->dev, "awrw_read error");
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int32_t aw_sar_awrw_set_func(struct aw_sar *p_sar, const char *buf)
+{
+	uint32_t rw_flag;
+	uint32_t addr_bytes;
+	uint32_t data_bytes;
+	uint32_t package_nums;
+	uint32_t addr_tmp;
+	uint32_t buf_index0;
+	uint32_t buf_index1;
+	uint32_t r_buf_len = 0;
+	uint32_t tr_offset = 0;
+	uint8_t addr[4] = { 0 };
+	uint32_t theory_len;
+	uint32_t actual_len;
+	uint32_t reg_num;
+	uint32_t i;
+	uint32_t j;
+
+	//step1: Parse frame header
+	if (sscanf(buf, "0x%02x 0x%02x 0x%02x ", &rw_flag, &addr_bytes, &data_bytes) != 3) {
+		dev_err(p_sar->dev, "sscanf0 parse error!");
+		return -EINVAL;
+	}
+	p_sar->awrw_info.rw_flag = (uint8_t)rw_flag;
+	p_sar->awrw_info.addr_len = (uint8_t)addr_bytes;
+	p_sar->awrw_info.data_len = (uint8_t)data_bytes;
+
+	if (addr_bytes > 4) {
+		dev_err(p_sar->dev, "para error!");
+		return -EINVAL;
+	}
+
+	if ((rw_flag == AW_SAR_I2C_WR) || (rw_flag == AW_SAR_I2C_RD)) {
+		if (sscanf(buf + AW_SAR_OFFSET_LEN, "0x%02x ", &reg_num) != 1) {
+			dev_err(p_sar->dev, "sscanf1 parse error!");
+			return -EINVAL;
+		}
+		p_sar->awrw_info.reg_num = (uint8_t)reg_num;
+		aw_sar_awrw_handle(p_sar, buf);
+	} else if (rw_flag == AW_SAR_PACKAGE_RD) {
+		//step2: Get number of packages
+		if (sscanf(buf + AW_SAR_OFFSET_LEN, "0x%02x ", &package_nums) != 1) {
+			dev_err(p_sar->dev, "sscanf2 parse error!");
+			return -EINVAL;
+		}
+		theory_len = AW_SAR_OFFSET_LEN + AW_SAR_AWRW_DATA_WIDTH +
+				package_nums * (AW_SAR_AWRW_DATA_WIDTH +
+				AW_SAR_AWRW_DATA_WIDTH * addr_bytes);
+		actual_len = strlen(buf);
+		if (theory_len != actual_len) {
+			dev_err(p_sar->dev, "theory_len:%d, actual_len:%d error!",
+					theory_len, actual_len);
+			return -EINVAL;
+		}
+
+		//step3: Get the size of read data and apply for space
+		for (i = 0; i < package_nums; i++) {
+			buf_index0 = AW_SAR_OFFSET_LEN + AW_SAR_AWRW_DATA_WIDTH +
+				(AW_SAR_AWRW_DATA_WIDTH * addr_bytes +
+				 AW_SAR_AWRW_DATA_WIDTH) * i;
+			if (sscanf(buf + buf_index0, "0x%02x", &reg_num) != 1) {
+				dev_err(p_sar->dev, "sscanf3 parse error!");
+				return -EINVAL;
+			}
+			r_buf_len += reg_num * data_bytes;
+		}
+
+		p_sar->awrw_info.i2c_tranfar_data_len = r_buf_len;
+
+		if (p_sar->awrw_info.p_i2c_tranfar_data != NULL) {
+			devm_kfree(p_sar->dev, p_sar->awrw_info.p_i2c_tranfar_data);
+			p_sar->awrw_info.p_i2c_tranfar_data = NULL;
+		}
+		p_sar->awrw_info.p_i2c_tranfar_data = devm_kzalloc(p_sar->dev,
+								r_buf_len, GFP_KERNEL);
+		if (!p_sar->awrw_info.p_i2c_tranfar_data)
+			return -ENOMEM;
+
+		//step3: Resolve register address and read data in packets
+		for (i = 0; i < package_nums; i++) {
+			buf_index0 = AW_SAR_OFFSET_LEN + AW_SAR_AWRW_DATA_WIDTH +
+				(AW_SAR_AWRW_DATA_WIDTH * addr_bytes + AW_SAR_AWRW_DATA_WIDTH) * i;
+			if (sscanf(buf + buf_index0, "0x%02x", &reg_num) != 1) {
+				dev_err(p_sar->dev, "sscanf4 parse error!");
+				return -EINVAL;
+			}
+
+			for (j = 0; j < addr_bytes; j += 1) {
+				buf_index1 = buf_index0 + AW_SAR_AWRW_DATA_WIDTH +
+					(j * AW_SAR_AWRW_DATA_WIDTH);
+				if (sscanf(buf + buf_index1, "0x%02x", &addr_tmp) == 1) {
+					addr[j] = (uint8_t)addr_tmp;
+				} else {
+					dev_err(p_sar->dev, "sscanf5 parse error!");
+					return -EINVAL;
+				}
+			}
+			aw_sar_i2c_read_seq(p_sar->i2c,
+					addr,
+					addr_bytes,
+					p_sar->awrw_info.p_i2c_tranfar_data + tr_offset,
+					(uint16_t)(data_bytes * reg_num));
+			tr_offset += data_bytes * reg_num;
+		}
+	}
+
+	return 0;
+}
+
+//Function: continuous write register interface
+static ssize_t
+awrw_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+
+	mutex_lock(&aw_sar_lock);
+
+	if ((p_sar->p_sar_para->p_aw_sar_awrw != NULL) &&
+		(p_sar->p_sar_para->p_aw_sar_awrw->p_set_awrw_node_fn != NULL)) {
+		p_sar->p_sar_para->p_aw_sar_awrw->p_set_awrw_node_fn(p_sar, buf, count);
+		mutex_unlock(&aw_sar_lock);
+		return count;
+	}
+
+	aw_sar_awrw_set_func(p_sar, buf);
+
+	mutex_unlock(&aw_sar_lock);
+
+	return count;
+}
+//Print all readable register values
+static ssize_t reg_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	uint8_t reg_rd_access;
+	uint32_t reg_data;
+	ssize_t len = 0;
+	int32_t ret;
+	uint16_t i;
+
+	if (!p_sar->p_sar_para->p_reg_list)
+		return len;
+
+	reg_rd_access = p_sar->p_sar_para->p_reg_list->reg_rd_access;
+
+	for (i = 0; i < p_sar->p_sar_para->p_reg_list->reg_num; i++) {
+		if (p_sar->p_sar_para->p_reg_list->reg_perm[i].rw & reg_rd_access) {
+			ret = aw_sar_i2c_read(p_sar->i2c,
+					p_sar->p_sar_para->p_reg_list->reg_perm[i].reg, &reg_data);
+			if (ret < 0)
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"i2c read error ret = %d\n", ret);
+			len += snprintf(buf + len, PAGE_SIZE - len,
+						"%x,%x\n",
+						p_sar->p_sar_para->p_reg_list->reg_perm[i].reg,
+						reg_data);
+		}
+	}
+
+	return len;
+}
+
+//Write register interface with write permission
+static ssize_t
+reg_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	uint32_t databuf[2] = { 0, 0 };
+	uint8_t reg_wd_access;
+	uint16_t i;
+
+	if (!p_sar->p_sar_para->p_reg_list) {
+		dev_err(p_sar->dev, "AW_INVALID_PARA");
+		return count;
+	}
+
+	reg_wd_access = p_sar->p_sar_para->p_reg_list->reg_wd_access;
+
+	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) != 2)
+		return count;
+
+	for (i = 0; i < p_sar->p_sar_para->p_reg_list->reg_num; i++) {
+		if ((uint16_t)databuf[0] == p_sar->p_sar_para->p_reg_list->reg_perm[i].reg) {
+			if (p_sar->p_sar_para->p_reg_list->reg_perm[i].rw & reg_wd_access) {
+				aw_sar_i2c_write(p_sar->i2c,
+					(uint16_t)databuf[0], (uint32_t)databuf[1]);
+			}
+			break;
+		}
+	}
+
+	return count;
+}
+
+//set chip Soft reset
+static ssize_t
+soft_rst_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	uint32_t flag;
+
+	if (kstrtouint(buf, 0, &flag) != 0) {
+		dev_err(p_sar->dev, "kstrtouint parse err");
+		return count;
+	}
+
+	if (flag == AW_TRUE)
+		aw_sar_soft_reset(p_sar);
+
+	return count;
+}
+
+static int32_t aw_sar_aot(struct aw_sar *p_sar)
+{
+	if (!p_sar->p_sar_para->p_aot)
+		return -EINVAL;
+
+	if (p_sar->p_sar_para->p_aot->p_set_aot_node_fn != NULL)
+		return p_sar->p_sar_para->p_aot->p_set_aot_node_fn(p_sar);
+
+	return aw_sar_i2c_write_bits(p_sar->i2c, p_sar->p_sar_para->p_aot->aot_reg,
+					p_sar->p_sar_para->p_aot->aot_mask,
+					p_sar->p_sar_para->p_aot->aot_flag);
+}
+
+//Perform Auto-Offset-Tuning (AOT)
+static ssize_t
+aot_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	uint32_t cali_flag;
+
+	if (kstrtouint(buf, 0, &cali_flag) != 0)
+		return count;
+
+	if (cali_flag == AW_TRUE)
+		aw_sar_aot(p_sar);
+	else
+		dev_err(p_sar->dev, "fail to set aot cali");
+
+	return count;
+}
+
+//update Register configuration and set the chip active mode
+int32_t aw_sar_update_reg_set_func(struct aw_sar *p_sar)
+{
+	aw_sar_load_def_reg_bin(p_sar);
+	aw_sar_mode_set(p_sar, p_sar->p_sar_para->p_chip_mode->active);
+
+	return 0;
+}
+
+//Update register configuration
+static ssize_t
+update_reg_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	uint32_t flag;
+
+	if (kstrtouint(buf, 0, &flag) != 0) {
+		dev_err(p_sar->dev, "kstrtouint parse error");
+		return count;
+	}
+
+	if (flag == AW_TRUE) {
+		mutex_lock(&aw_sar_lock);
+		aw_sar_soft_reset(p_sar);
+		aw_sar_update_reg_set_func(p_sar);
+		mutex_unlock(&aw_sar_lock);
+	}
+
+	return count;
+}
+
+//get chip diff val
+static ssize_t aw_sar_get_diff(struct aw_sar *p_sar, char *buf)
+{
+	const struct aw_sar_diff_t *diff = p_sar->p_sar_para->p_diff;
+	int32_t diff_val;
+	ssize_t len = 0;
+	uint32_t data;
+	int32_t ret;
+	uint32_t i;
+
+	if (!p_sar->p_sar_para->p_diff)
+		return -EINVAL;
+
+	//If a private interface is defined, the private interface is used
+	if (p_sar->p_sar_para->p_diff->p_get_diff_node_fn != NULL)
+		return p_sar->p_sar_para->p_diff->p_get_diff_node_fn(p_sar, buf);
+
+	for (i = 0; i < p_sar->p_sar_para->ch_num_max; i++) {
+		ret = aw_sar_i2c_read(p_sar->i2c, diff->diff0_reg + i * diff->diff_step, &data);
+		if (ret != 0) {
+			dev_err(p_sar->dev, "read diff err: %d", ret);
+			return ret;
+		}
+		diff_val = (int32_t)data / (int32_t)diff->rm_float;
+		len += snprintf(buf + len, PAGE_SIZE - len, "DIFF_CH%u = %d\n", i, diff_val);
+	}
+
+	return len;
+}
+
+
+//Print diff values of all channels of the chip.
+static ssize_t diff_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+
+	return aw_sar_get_diff(p_sar, buf);
+}
+
+void aw_sar_mode_set(struct aw_sar *p_sar, uint8_t curr_mode)
+{
+	struct aw_sar_mode_set_t mode_set_para;
+
+	if (!p_sar->p_sar_para->p_mode)
+		return;
+
+	//If a private interface is defined, the private interface is used
+	if (p_sar->p_sar_para->p_mode->p_set_mode_node_fn != NULL) {
+		p_sar->p_sar_para->p_mode->p_set_mode_node_fn(p_sar, curr_mode);
+		return;
+	}
+
+	mode_set_para.chip_id = p_sar->chip_type;
+	mode_set_para.chip_mode.curr_mode = curr_mode;
+	mode_set_para.chip_mode.last_mode = p_sar->last_mode;
+
+	aw_sar_mode_set_func(p_sar->i2c, p_sar->irq_init.to_irq, &mode_set_para,
+		p_sar->p_sar_para->p_mode->mode_set_arr,
+		p_sar->p_sar_para->p_mode->mode_set_arr_len);
+	p_sar->last_mode = curr_mode;
+}
+
+//Set the chip to enter different modes
+static ssize_t mode_operation_store(struct device *dev, struct device_attribute *attr,
+						const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	uint32_t mode;
+
+	if (kstrtouint(buf, 0, &mode) != 0) {
+		dev_err(p_sar->dev, "kstrtouint parse err");
+		return count;
+	}
+	aw_sar_mode_set(p_sar, mode);
+
+	return count;
+}
+
+//Get the current mode of the chip
+static ssize_t mode_operation_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	ssize_t len = 0;
+
+	if (!p_sar->p_sar_para->p_mode)
+		return len;
+
+	if (p_sar->p_sar_para->p_mode->p_get_mode_node_fn != NULL)
+		len = p_sar->p_sar_para->p_mode->p_get_mode_node_fn(p_sar, buf);
+
+	return len;
+}
+
+//Print information related information
+static ssize_t chip_info_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	ssize_t len = 0;
+
+	len += snprintf(buf + len, PAGE_SIZE - len, "reg_load_state: %d\n", p_sar->ret_val);
+
+	if ((p_sar->p_sar_para->p_get_chip_info != NULL) &&
+		(p_sar->p_sar_para->p_get_chip_info->p_get_chip_info_node_fn != NULL)) {
+		p_sar->p_sar_para->p_get_chip_info->p_get_chip_info_node_fn(p_sar, buf, &len);
+	}
+
+	return len;
+}
+
+static ssize_t offset_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	ssize_t len = 0;
+
+	if ((p_sar->p_sar_para->p_offset != NULL) &&
+		(p_sar->p_sar_para->p_offset->p_get_offset_node_fn != NULL))
+		len = (ssize_t)p_sar->p_sar_para->p_offset->p_get_offset_node_fn(p_sar, buf);
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(awrw);
+static DEVICE_ATTR_RW(reg);
+static DEVICE_ATTR_WO(soft_rst);
+static DEVICE_ATTR_WO(aot);
+static DEVICE_ATTR_WO(update_reg);
+static DEVICE_ATTR_RO(diff);
+static DEVICE_ATTR_RW(mode_operation);
+static DEVICE_ATTR_RO(chip_info);
+static DEVICE_ATTR_RO(offset);
+
+static struct attribute *aw_sar_attributes[] = {
+	&dev_attr_awrw.attr,
+	&dev_attr_reg.attr,
+	&dev_attr_soft_rst.attr,
+	&dev_attr_aot.attr,
+	&dev_attr_update_reg.attr,
+	&dev_attr_diff.attr,
+	&dev_attr_mode_operation.attr,
+	&dev_attr_chip_info.attr,
+	&dev_attr_offset.attr,
+	NULL
+};
+
+static const struct attribute_group aw_sar_attribute_group = {
+	.attrs = aw_sar_attributes,
+};
+
+//firmware upgrade through write register mode, and the operation is supported by flash chip
+static ssize_t prot_update_fw_store(struct device *dev,
+						struct device_attribute *attr,
+						const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+
+
+	mutex_lock(&aw_sar_lock);
+	aw_sar_disable_irq(p_sar);
+
+	p_sar->prot_update_state = aw_sar_node_prox_update_fw(p_sar);
+
+	aw_sar_enable_irq(p_sar);
+	mutex_unlock(&aw_sar_lock);
+
+	return count;
+}
+
+//firmware upgrade throughr Write register mode,and the operation is supported by flash chip
+static ssize_t reg_update_fw_store(struct device *dev,
+						struct device_attribute *attr,
+						const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+
+	mutex_lock(&aw_sar_lock);
+	aw_sar_disable_irq(p_sar);
+
+	aw_sar_node_reg_update_fw(p_sar);
+
+	aw_sar_enable_irq(p_sar);
+	mutex_unlock(&aw_sar_lock);
+
+	return count;
+}
+
+//boot upgrade throughr Write register mode,and the operation is supported by flash chip
+static ssize_t reg_update_boot_store(struct device *dev,
+						struct device_attribute *attr,
+						const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+
+	if (!p_sar->p_sar_para->p_boot_bin)
+		return count;
+
+	mutex_lock(&aw_sar_lock);
+	aw_sar_disable_irq(p_sar);
+
+	aw_sar_reg_update_boot_work(p_sar);
+
+	aw_sar_enable_irq(p_sar);
+	mutex_unlock(&aw_sar_lock);
+
+	return count;
+}
+
+//Print the protocol upgrade status. 0 is success, Not 0 is failure
+//Print the current firmware version number
+static ssize_t prot_update_fw_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct aw_sar *p_sar = dev_get_drvdata(dev);
+	ssize_t len = 0;
+
+	len += snprintf(buf + len, PAGE_SIZE - len,
+		"protocol update state:%s!\n",
+		(p_sar->prot_update_state == 0) ? "ok" : "error");
+	if ((p_sar->p_sar_para->p_prox_fw != NULL) &&
+		(p_sar->p_sar_para->p_prox_fw->p_get_prot_update_fw_node_fn != NULL))
+		p_sar->p_sar_para->p_prox_fw->p_get_prot_update_fw_node_fn(p_sar, buf, &len);
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(prot_update_fw);
+static DEVICE_ATTR_WO(reg_update_fw);
+static DEVICE_ATTR_WO(reg_update_boot);
+
+static struct attribute *aw_sar_update_attributes[] = {
+	&dev_attr_prot_update_fw.attr,
+	&dev_attr_reg_update_fw.attr,
+	&dev_attr_reg_update_boot.attr,
+	NULL
+};
+
+static const struct attribute_group aw_sar_update_attribute_group = {
+	.attrs = aw_sar_update_attributes,
+};
+
+static void aw_sar_update_work(struct work_struct *work)
+{
+	struct aw_sar *p_sar = container_of(work, struct aw_sar, update_work.work);
+	int32_t ret;
+
+	mutex_lock(&aw_sar_lock);
+
+	if (p_sar->dts_info.update_fw_flag == true) {
+		ret = aw_sar_update_fw(p_sar);
+		if (ret != 0) {
+			dev_err(p_sar->dev, "protocol upgrade firmware error!");
+			p_sar->ret_val = AW_PROT_UPDATE_ERR;
+		}
+	}
+
+	//2.Parse the bin file and load the register configuration
+	ret = aw_sar_load_def_reg_bin(p_sar);
+	if (ret != 0) {
+		p_sar->ret_val = AW_REG_LOAD_ERR;
+		dev_err(p_sar->dev, "reg_bin load err!");
+		aw_sar_para_loaded(p_sar);
+	}
+
+	//3.active chip
+	aw_sar_mode_set(p_sar, p_sar->p_sar_para->p_chip_mode->init_mode);
+	if (p_sar->irq_init.host_irq_stat == IRQ_DISABLE) {
+		enable_irq(p_sar->irq_init.to_irq);
+		p_sar->irq_init.host_irq_stat = IRQ_ENABLE;
+	}
+	p_sar->driver_code_initover_flag = 1;
+	mutex_unlock(&aw_sar_lock);
+}
+
+static void aw_sar_update(struct aw_sar *p_sar)
+{
+	if (!p_sar->p_sar_para->p_reg_bin)
+		return;
+
+	if (p_sar->p_sar_para->p_reg_bin->p_update_fn != NULL)
+		p_sar->p_sar_para->p_reg_bin->p_update_fn(p_sar);
+
+	if (p_sar->driver_code_initover_flag) {
+		schedule_delayed_work(&p_sar->update_work, msecs_to_jiffies(0));
+	} else {
+		INIT_DELAYED_WORK(&p_sar->update_work, aw_sar_update_work);
+		schedule_delayed_work(&p_sar->update_work,
+				msecs_to_jiffies(AW_POWER_ON_SYSFS_DELAY_MS));
+	}
+}
+
+static int32_t aw_sar_create_node(struct aw_sar *p_sar)
+{
+	int32_t ret;
+
+	i2c_set_clientdata(p_sar->i2c, p_sar);
+
+	ret = sysfs_create_group(&p_sar->i2c->dev.kobj, &aw_sar_attribute_group);
+
+	if (p_sar->dts_info.update_fw_flag == true)
+		ret |= sysfs_create_group(&p_sar->i2c->dev.kobj, &aw_sar_update_attribute_group);
+
+	//Special requirements of SAR chip
+	if (p_sar->p_sar_para->p_platform_config->p_add_node_create_fn != NULL)
+		ret |= p_sar->p_sar_para->p_platform_config->p_add_node_create_fn(p_sar);
+
+	return ret;
+}
+
+static void aw_sar_node_free(struct aw_sar *p_sar)
+{
+	sysfs_remove_group(&p_sar->i2c->dev.kobj, &aw_sar_attribute_group);
+
+	if (p_sar->dts_info.update_fw_flag == true)
+		sysfs_remove_group(&p_sar->i2c->dev.kobj, &aw_sar_update_attribute_group);
+
+	//Special requirements of SAR chip
+	if ((p_sar->p_sar_para->p_platform_config != NULL) &&
+		(p_sar->p_sar_para->p_platform_config->p_add_node_free_fn != NULL))
+		p_sar->p_sar_para->p_platform_config->p_add_node_free_fn(p_sar);
+}
+
+//The interrupt pin is set to internal pull-up start
+static void aw_sar_int_output(struct aw_sar *p_sar, int32_t level)
+{
+	if (level == 0) {
+		if (p_sar->pinctrl.pinctrl)
+			pinctrl_select_state(p_sar->pinctrl.pinctrl, p_sar->pinctrl.int_out_low);
+		else
+			dev_err(p_sar->dev, "Failed set int pin output low\n");
+	} else if (level == 1) {
+		if (p_sar->pinctrl.pinctrl)
+			pinctrl_select_state(p_sar->pinctrl.pinctrl, p_sar->pinctrl.int_out_high);
+		else
+			dev_err(p_sar->dev, "Failed set int pin output high\n");
+	}
+}
+
+static int32_t aw_sar_pinctrl_init(struct aw_sar *p_sar)
+{
+	struct aw_sar_pinctrl *pinctrl = &p_sar->pinctrl;
+	uint8_t pin_default_name[50] = { 0 };
+	uint8_t pin_output_low_name[50] = { 0 };
+	uint8_t pin_output_high_name[50] = { 0 };
+
+	pinctrl->pinctrl = devm_pinctrl_get(p_sar->dev);
+	if (IS_ERR_OR_NULL(pinctrl->pinctrl)) {
+		dev_err(p_sar->dev, "No pinctrl found\n");
+		pinctrl->pinctrl = NULL;
+		return -EINVAL;
+	}
+
+	snprintf(pin_default_name, sizeof(pin_default_name),
+					"aw_default_sar%u", p_sar->dts_info.sar_num);
+	pinctrl->default_sta = pinctrl_lookup_state(pinctrl->pinctrl, pin_default_name);
+	if (IS_ERR_OR_NULL(pinctrl->default_sta)) {
+		dev_err(p_sar->dev, "Failed get pinctrl state:default state");
+		goto exit_pinctrl_init;
+	}
+
+	snprintf(pin_output_high_name, sizeof(pin_output_high_name),
+				"aw_int_output_high_sar%u", p_sar->dts_info.sar_num);
+	pinctrl->int_out_high = pinctrl_lookup_state(pinctrl->pinctrl, pin_output_high_name);
+	if (IS_ERR_OR_NULL(pinctrl->int_out_high)) {
+		dev_err(p_sar->dev, "Failed get pinctrl state:output_high");
+		goto exit_pinctrl_init;
+	}
+
+	snprintf(pin_output_low_name, sizeof(pin_output_low_name),
+				"aw_int_output_low_sar%u", p_sar->dts_info.sar_num);
+	pinctrl->int_out_low = pinctrl_lookup_state(pinctrl->pinctrl, pin_output_low_name);
+	if (IS_ERR_OR_NULL(pinctrl->int_out_low)) {
+		dev_err(p_sar->dev, "Failed get pinctrl state:output_low");
+		goto exit_pinctrl_init;
+	}
+
+	return 0;
+
+exit_pinctrl_init:
+	devm_pinctrl_put(pinctrl->pinctrl);
+	pinctrl->pinctrl = NULL;
+
+	return -EINVAL;
+}
+
+static void aw_sar_pinctrl_deinit(struct aw_sar *p_sar)
+{
+	if (p_sar->pinctrl.pinctrl)
+		devm_pinctrl_put(p_sar->pinctrl.pinctrl);
+}
+//The interrupt pin is set to internal pull-up end
+
+//AW_SAR_REGULATOR_POWER_ON start
+static int32_t aw_sar_regulator_power_init(struct aw_sar *p_sar)
+{
+	uint8_t vcc_name[20] = { 0 };
+	int32_t rc;
+
+	snprintf(vcc_name, sizeof(vcc_name), "vcc%u", p_sar->dts_info.sar_num);
+	p_sar->vcc = regulator_get(p_sar->dev, vcc_name);
+	if (IS_ERR(p_sar->vcc)) {
+		rc = PTR_ERR(p_sar->vcc);
+		dev_err(p_sar->dev, "regulator get failed vcc rc = %d", rc);
+		return rc;
+	}
+
+	if (regulator_count_voltages(p_sar->vcc) > 0) {
+		rc = regulator_set_voltage(p_sar->vcc, AW_SAR_VCC_MIN_UV, AW_SAR_VCC_MAX_UV);
+		if (rc) {
+			dev_err(p_sar->dev, "regulator set vol failed rc = %d", rc);
+			goto reg_vcc_put;
+		}
+	}
+
+	return 0;
+
+reg_vcc_put:
+	regulator_put(p_sar->vcc);
+	return rc;
+}
+
+static void aw_sar_power_deinit(struct aw_sar *p_sar)
+{
+	if (p_sar->power_enable) {
+		//Turn off the power output. However,
+		//it may not be turned off immediately
+		//There are scenes where power sharing can exist
+		regulator_disable(p_sar->vcc);
+		regulator_put(p_sar->vcc);
+	}
+}
+
+static void aw_sar_power_enable(struct aw_sar *p_sar, bool on)
+{
+	int32_t rc;
+
+	if (on) {
+		rc = regulator_enable(p_sar->vcc);
+		if (rc) {
+			dev_err(p_sar->dev, "regulator_enable vol failed rc = %d", rc);
+		} else {
+			p_sar->power_enable = AW_TRUE;
+			msleep(20);
+		}
+	} else {
+		rc = regulator_disable(p_sar->vcc);
+		if (rc)
+			dev_err(p_sar->dev, "regulator_disable vol failed rc = %d", rc);
+		else
+			p_sar->power_enable = AW_FALSE;
+	}
+}
+
+static int32_t regulator_is_get_voltage(struct aw_sar *p_sar)
+{
+	uint32_t cnt = 10;
+	int32_t voltage_val;
+
+	while (cnt--) {
+		voltage_val = regulator_get_voltage(p_sar->vcc);
+		if (voltage_val >= AW_SAR_VCC_MIN_UV)
+			return 0;
+		mdelay(1);
+	}
+	//Ensure that the chip initialization is completed
+	msleep(20);
+
+	return -EINVAL;
+}
+//AW_SAR_REGULATOR_POWER_ON end
+
+static void aw_sar_init_lock(struct aw_sar *p_sar)
+{
+	//Initialize lock, To protect the thread safety of updating bin file
+	mutex_init(&aw_sar_lock);
+	//Required for mode setting
+	p_sar->last_mode = p_sar->p_sar_para->p_chip_mode->pre_init_mode;
+	p_sar->fw_fail_flag = AW_FALSE;
+	p_sar->ret_val = 0;
+}
+
+// AW_SAR_USB_PLUG_CAIL start
+static void aw_sar_ps_notify_callback_work(struct work_struct *work)
+{
+	struct aw_sar *p_sar = container_of(work, struct aw_sar, ps_notify_work);
+
+	aw_sar_aot(p_sar);
+}
+
+static int aw_sar_ps_get_state(struct aw_sar *p_sar, struct power_supply *psy, bool *present)
+{
+	union power_supply_propval pval = { 0 };
+	int retval;
+
+	retval = power_supply_get_property(psy, AW_USB_PROP_ONLINE, &pval);
+	if (retval) {
+		dev_err(p_sar->dev, "%s psy get property failed", psy->desc->name);
+		return retval;
+	}
+	*present = (pval.intval) ? true : false;
+
+	return 0;
+}
+
+static int aw_sar_ps_notify_callback(struct notifier_block *self,
+		unsigned long event, void *p)
+{
+	struct aw_sar *p_sar = container_of(self, struct aw_sar, ps_notif);
+	struct power_supply *psy = p;
+	bool present;
+	int retval;
+
+	if (event == PSY_EVENT_PROP_CHANGED
+		&& psy && psy->desc->get_property && psy->desc->name &&
+		!strncmp(psy->desc->name, USB_POWER_SUPPLY_NAME,
+			sizeof(USB_POWER_SUPPLY_NAME))) {
+		retval = aw_sar_ps_get_state(p_sar, psy, &present);
+		if (retval) {
+			dev_err(p_sar->dev, "psy get property failed");
+			return retval;
+		}
+		if (event == PSY_EVENT_PROP_CHANGED) {
+			if (p_sar->ps_is_present == present)
+				return 0;
+		}
+		p_sar->ps_is_present = present;
+		schedule_work(&p_sar->ps_notify_work);
+	}
+	return 0;
+}
+
+static int aw_sar_ps_notify_init(struct aw_sar *p_sar)
+{
+	struct power_supply *psy;
+	int ret;
+
+	INIT_WORK(&p_sar->ps_notify_work, aw_sar_ps_notify_callback_work);
+	p_sar->ps_notif.notifier_call = (notifier_fn_t)aw_sar_ps_notify_callback;
+	ret = power_supply_reg_notifier(&p_sar->ps_notif);
+	if (ret) {
+		dev_err(p_sar->dev, "Unable to register ps_notifier: %d", ret);
+		return ret;
+	}
+	psy = power_supply_get_by_name(USB_POWER_SUPPLY_NAME);
+	if (!psy) {
+		dev_err(p_sar->dev, "Unable to get power_supply: %s", USB_POWER_SUPPLY_NAME);
+		goto free_ps_notifier;
+	}
+	ret = aw_sar_ps_get_state(p_sar, psy, &p_sar->ps_is_present);
+	if (ret) {
+		dev_err(p_sar->dev, "psy get property failed rc=%d", ret);
+		goto free_ps_notifier;
+	}
+	return 0;
+
+free_ps_notifier:
+	power_supply_unreg_notifier(&p_sar->ps_notif);
+
+	return -EINVAL;
+}
+// AW_SAR_USB_PLUG_CAIL end
+
+static int32_t aw_sar_platform_rsc_init(struct aw_sar *p_sar)
+{
+	int32_t ret;
+
+	if (!p_sar->p_sar_para->p_platform_config)
+		return -EINVAL;
+
+	//step 1.parsing dts data
+	ret = aw_sar_parse_dts(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "parse dts error!");
+		return ret;
+	}
+
+	//Initialization lock and some variables
+	aw_sar_init_lock(p_sar);
+
+	//Configure whether to use USB plug-in calibration in DTS according to customer requirements
+	if (p_sar->dts_info.use_plug_cail_flag == true) {
+		ret = aw_sar_ps_notify_init(p_sar);
+		if (ret < 0) {
+			dev_err(p_sar->dev, "error creating power supply notify");
+			goto err_ps_notify_init;
+		}
+	}
+
+	//The interrupt pin is set to internal pull-up and configured by DTS
+	if (p_sar->dts_info.use_inter_pull_up == true) {
+		ret = aw_sar_pinctrl_init(p_sar);
+		if (ret < 0) {
+			/* if define pinctrl must define the following state
+			 * to let int-pin work normally: default, int_output_high,
+			 * int_output_low, int_input
+			 */
+			dev_err(p_sar->dev, "Failed get wanted pinctrl state");
+			goto err_pinctrl_init;
+		}
+		aw_sar_int_output(p_sar, 1);
+	}
+
+	//step 2.Create debug file node
+	ret = aw_sar_create_node(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "create node error!");
+		goto err_sysfs_nodes;
+	}
+
+	//step 3.Initialization interrupt
+	ret = aw_sar_irq_init(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "interrupt initialization error!");
+		goto err_irq_init;
+	}
+
+	//step 4.Initialization input Subsystem
+	ret = aw_sar_input_init(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "input_init error!");
+		goto err_input_init;
+	}
+
+	return 0;
+
+err_input_init:
+	aw_sar_input_free(p_sar);
+	aw_sar_irq_free(p_sar);
+err_irq_init:
+	aw_sar_node_free(p_sar);
+err_sysfs_nodes:
+	if (p_sar->dts_info.use_inter_pull_up == true)
+		aw_sar_pinctrl_deinit(p_sar);
+err_pinctrl_init:
+	if (p_sar->dts_info.use_plug_cail_flag == true)
+		power_supply_unreg_notifier(&p_sar->ps_notif);
+err_ps_notify_init:
+	mutex_destroy(&aw_sar_lock);
+
+	return ret;
+}
+
+/**
+ * @aw_sar_chip_init() - sar sensor initialization logic.
+ *
+ * @p_sar data stored in type 'struct aw_sar *'.
+ * @return 0 if init succeeded. others if unpack error.
+ */
+static int32_t aw_sar_chip_init(struct aw_sar *p_sar)
+{
+	int32_t ret;
+
+	//step 1.check chipid,Verify whether the chip communication is successful
+	ret = aw_sar_check_chipid(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "check_chipid error!");
+		goto communication_fail;
+	}
+
+	//step 2.Check chip initialization completed,
+	ret = aw_sar_soft_reset(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "soft_reset error!");
+		goto communication_fail;
+	}
+
+	ret = aw_sar_check_init_over_irq(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "check_init_over_irqt error!");
+		goto communication_fail;
+	}
+
+	//step 3.chip other operation
+	ret = aw_sar_chip_other_operation(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "chip_other_operation error!");
+		goto free_other_opera;
+	}
+
+	//step 4.Parse the bin file, upgrade the firmware, and load the register prize
+	aw_sar_update(p_sar);
+
+	return 0;
+
+free_other_opera:
+	aw_sar_chip_other_operation_free(p_sar);
+communication_fail:
+
+	return ret;
+}
+
+static int32_t aw_sar_init(struct aw_sar *p_sar)
+{
+	int32_t ret;
+
+	//step 1: Platform resource initialization
+	ret = aw_sar_platform_rsc_init(p_sar);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "platform_rsc_init error!");
+		return ret;
+	}
+
+	//step 2: Chip initialization
+	ret = aw_sar_chip_init(p_sar);
+	if (ret != 0) {
+		aw_sar_input_free(p_sar);
+		aw_sar_irq_free(p_sar);
+		aw_sar_node_free(p_sar);
+		if (p_sar->dts_info.use_inter_pull_up == true)
+			aw_sar_pinctrl_deinit(p_sar);
+		if (p_sar->dts_info.use_plug_cail_flag == true)
+			power_supply_unreg_notifier(&p_sar->ps_notif);
+		mutex_destroy(&aw_sar_lock);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int32_t aw_sar_regulator_power(struct aw_sar *p_sar)
+{
+	struct aw_sar_dts_info *p_dts_info = &p_sar->dts_info;
+	int32_t ret = 0;
+
+	p_dts_info->use_regulator_flag =
+		of_property_read_bool(p_sar->i2c->dev.of_node, "awinic,regulator-power-supply");
+
+	//Configure the use of regulator power supply in DTS
+	if (p_sar->dts_info.use_regulator_flag == true) {
+		ret = aw_sar_regulator_power_init(p_sar);
+		if (ret != 0) {
+			dev_err(p_sar->dev, "power init failed");
+			return ret;
+		}
+		aw_sar_power_enable(p_sar, AW_TRUE);
+		ret = regulator_is_get_voltage(p_sar);
+		if (ret != 0) {
+			dev_err(p_sar->dev, "get_voltage failed");
+			aw_sar_power_deinit(p_sar);
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * @aw_sar_get_chip_info() - Distinguish different chips by chip name and
+ * obtain relevant chip information
+ *
+ * @p_sar Structure to be filled
+ * @return 0 if init succeeded.
+ */
+static int32_t aw_sar_get_chip_info(struct aw_sar *p_sar)
+{
+	int32_t ret;
+	uint8_t i;
+
+	for (i = 0; i < AW_SAR_DRIVER_MAX; i++) {
+		if (g_aw_sar_driver_list[i].p_who_am_i != NULL) {
+			ret = g_aw_sar_driver_list[i].p_who_am_i(p_sar);
+			if (ret == 0) {
+				p_sar->curr_use_driver_type = g_aw_sar_driver_list[i].driver_type;
+				if (!g_aw_sar_driver_list[i].p_chip_init) {
+					dev_err(p_sar->dev,
+							"drvier:%d p_chip_init is null  error!", i);
+					continue;
+				}
+				g_aw_sar_driver_list[i].p_chip_init(p_sar);
+				dev_info(p_sar->dev, "current use drvier is :%d",
+						g_aw_sar_driver_list[i].driver_type);
+				return 0;
+			}
+		}
+	}
+
+	return -EINVAL;
+}
+
+static void aw_sar_monitor_work(struct work_struct *aw_work)
+{
+	struct aw_sar *p_sar = container_of(aw_work, struct aw_sar, monitor_work.work);
+	uint32_t data;
+	int32_t ret;
+
+	ret = aw_sar_i2c_read(p_sar->i2c, 0x0000, &data);
+	if (ret != 0) {
+		dev_err(p_sar->dev, "read 0x0000 err: %d", ret);
+		return;
+	}
+	if (data == 0 && p_sar->driver_code_initover_flag) {
+		dev_err(p_sar->dev, "aw_chip may reset");
+		aw_sar_disable_irq(p_sar);
+		ret = aw_sar_chip_init(p_sar);
+		if (ret != 0)
+			return;
+	}
+	queue_delayed_work(p_sar->monitor_wq, &p_sar->monitor_work,
+			msecs_to_jiffies(AW_SAR_MONITOR_ESD_DELAY_MS));
+}
+
+static int32_t aw_sar_monitor_esd_init(struct aw_sar *p_sar)
+{
+	p_sar->monitor_wq = create_singlethread_workqueue("aw_sar_workqueue");
+	if (!p_sar->monitor_wq) {
+		dev_err(&p_sar->i2c->dev, "aw_sar_workqueue error");
+		return -EINVAL;
+	}
+	INIT_DELAYED_WORK(&p_sar->monitor_work, aw_sar_monitor_work);
+	queue_delayed_work(p_sar->monitor_wq, &p_sar->monitor_work,
+			msecs_to_jiffies(AW_SAR_MONITOR_ESD_DELAY_MS));
+
+	return 0;
+}
+
+static void aw_sar_sensor_free(struct aw_sar *p_sar)
+{
+	if (g_aw_sar_driver_list[p_sar->curr_use_driver_type].p_chip_deinit != NULL)
+		g_aw_sar_driver_list[p_sar->curr_use_driver_type].p_chip_deinit(p_sar);
+}
+
+
+/* Drive logic entry */
+static int32_t aw_sar_i2c_probe(struct i2c_client *i2c)
+{
+	struct aw_sar *p_sar;
+	int32_t ret;
+
+	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
+		pr_err("check_functionality failed!\n");
+		return -EIO;
+	}
+
+	p_sar = devm_kzalloc(&i2c->dev, sizeof(struct aw_sar), GFP_KERNEL);
+	if (!p_sar) {
+		ret = -ENOMEM;
+		goto err_malloc;
+	}
+
+	p_sar->dev = &i2c->dev;
+	p_sar->i2c = i2c;
+	i2c_set_clientdata(i2c, p_sar);
+
+	//1.Judge whether to use regular power supply. If yes, supply power
+	ret = aw_sar_regulator_power(p_sar);
+	if (ret != 0) {
+		dev_err(&i2c->dev, "regulator_power error!");
+		goto err_malloc;
+	}
+
+	//2.Get chip initialization resources
+	ret = aw_sar_get_chip_info(p_sar);
+	if (ret != 0) {
+		dev_err(&i2c->dev, "chip_init error!");
+		goto err_chip_init;
+	}
+
+	//3.Chip initialization process
+	ret = aw_sar_init(p_sar);
+	if (ret != 0) {
+		dev_err(&i2c->dev, "sar_init error!");
+		goto err_sar_init;
+	}
+
+	if (p_sar->dts_info.monitor_esd_flag) {
+		ret = aw_sar_monitor_esd_init(p_sar);
+		if (ret != 0) {
+			dev_err(&i2c->dev, "monitor_esd_init error!");
+			goto err_esd_init;
+		}
+	}
+
+	dev_dbg(&i2c->dev, "probe success!");
+
+	return 0;
+
+err_esd_init:
+	aw_sar_input_free(p_sar);
+	aw_sar_irq_free(p_sar);
+	aw_sar_node_free(p_sar);
+	if (p_sar->dts_info.use_inter_pull_up == true)
+		aw_sar_pinctrl_deinit(p_sar);
+	if (p_sar->dts_info.use_plug_cail_flag == true)
+		power_supply_unreg_notifier(&p_sar->ps_notif);
+	mutex_destroy(&aw_sar_lock);
+err_sar_init:
+	aw_sar_sensor_free(p_sar);
+err_chip_init:
+if (p_sar->dts_info.use_regulator_flag == true)
+	aw_sar_power_deinit(p_sar);
+err_malloc:
+	return ret;
+}
+
+static void aw_sar_i2c_remove(struct i2c_client *i2c)
+{
+	struct aw_sar *p_sar  = i2c_get_clientdata(i2c);
+
+	aw_sar_chip_other_operation_free(p_sar);
+
+	aw_sar_node_free(p_sar);
+
+	aw_sar_irq_free(p_sar);
+
+	aw_sar_input_free(p_sar);
+
+	if (p_sar->dts_info.use_inter_pull_up == true)
+		aw_sar_pinctrl_deinit(p_sar);
+
+	if (p_sar->dts_info.use_regulator_flag == true)
+		aw_sar_power_deinit(p_sar);
+
+	if (p_sar->dts_info.use_plug_cail_flag == true)
+		power_supply_unreg_notifier(&p_sar->ps_notif);
+
+	aw_sar_sensor_free(p_sar);
+}
+
+static int aw_sar_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct aw_sar *p_sar = i2c_get_clientdata(client);
+
+	if (p_sar->dts_info.use_pm == true) {
+		if ((!p_sar->p_sar_para->p_platform_config) ||
+			(!p_sar->p_sar_para->p_platform_config->p_pm_chip_mode))
+			return 0;
+		if (p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->p_suspend_fn) {
+			p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->p_suspend_fn(p_sar);
+			return 0;
+		}
+		aw_sar_mode_set(p_sar,
+			p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->suspend_set_mode);
+	}
+
+	if (p_sar->dts_info.monitor_esd_flag)
+		cancel_delayed_work_sync(&p_sar->monitor_work);
+
+	return 0;
+}
+
+static int aw_sar_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct aw_sar *p_sar = i2c_get_clientdata(client);
+
+	if (p_sar->dts_info.use_pm == true) {
+		if ((!p_sar->p_sar_para->p_platform_config) ||
+			(!p_sar->p_sar_para->p_platform_config->p_pm_chip_mode))
+			return 0;
+		if (p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->p_resume_fn) {
+			p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->p_resume_fn(p_sar);
+			return 0;
+		}
+		aw_sar_mode_set(p_sar,
+			p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->resume_set_mode);
+	}
+
+	if (p_sar->dts_info.monitor_esd_flag)
+		queue_delayed_work(p_sar->monitor_wq, &p_sar->monitor_work,
+				msecs_to_jiffies(AW_SAR_MONITOR_ESD_DELAY_MS));
+
+	return 0;
+}
+
+static void aw_sar_i2c_shutdown(struct i2c_client *i2c)
+{
+	struct aw_sar *p_sar  = i2c_get_clientdata(i2c);
+
+	if ((!p_sar->p_sar_para->p_platform_config) ||
+		(!p_sar->p_sar_para->p_platform_config->p_pm_chip_mode))
+		return;
+
+	if (p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->p_shutdown_fn) {
+		p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->p_shutdown_fn(p_sar);
+		return;
+	}
+
+	aw_sar_mode_set(p_sar,
+		p_sar->p_sar_para->p_platform_config->p_pm_chip_mode->shutdown_set_mode);
+}
+
+static const struct dev_pm_ops aw_sar_pm_ops = {
+	.suspend = aw_sar_suspend,
+	.resume = aw_sar_resume,
+};
+
+static const struct of_device_id aw_sar_dt_match[] = {
+	{ .compatible = "awinic,aw96103" },
+	{ .compatible = "awinic,aw96105" },
+	{ .compatible = "awinic,aw96303" },
+	{ .compatible = "awinic,aw96305" },
+	{ .compatible = "awinic,aw96308" },
+	{ },
+};
+
+static const struct i2c_device_id aw_sar_i2c_id[] = {
+	{ AW_SAR_I2C_NAME, 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, aw_sar_i2c_id);
+
+static struct i2c_driver aw_sar_i2c_driver = {
+	.driver = {
+		.name = AW_SAR_I2C_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = aw_sar_dt_match,
+		.pm = &aw_sar_pm_ops,
+	},
+	.probe = aw_sar_i2c_probe,
+	.remove = aw_sar_i2c_remove,
+	.shutdown = aw_sar_i2c_shutdown,
+	.id_table = aw_sar_i2c_id,
+};
+
+static int32_t __init aw_sar_i2c_init(void)
+{
+	int32_t ret;
+
+	ret = i2c_add_driver(&aw_sar_i2c_driver);
+	if (ret) {
+		pr_err("fail to add aw_sar device into i2c\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+module_init(aw_sar_i2c_init);
+static void __exit aw_sar_i2c_exit(void)
+{
+	i2c_del_driver(&aw_sar_i2c_driver);
+}
+module_exit(aw_sar_i2c_exit);
+MODULE_DESCRIPTION("AWINIC SAR Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/input/misc/aw_sar/aw_sar.h b/drivers/input/misc/aw_sar/aw_sar.h
new file mode 100644
index 000000000000..7a139f56e9c3
--- /dev/null
+++ b/drivers/input/misc/aw_sar/aw_sar.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef AW_SAR_H_
+#define AW_SAR_H_
+
+void aw_sar_disable_irq(struct aw_sar *p_sar);
+void aw_sar_enable_irq(struct aw_sar *p_sar);
+
+int32_t aw_sar_soft_reset(struct aw_sar *p_sar);
+int32_t aw_sar_check_init_over_irq(struct aw_sar *p_sar);
+int32_t aw_sar_update_fw(struct aw_sar *p_sar);
+int32_t aw_sar_load_def_reg_bin(struct aw_sar *p_sar);
+void aw_sar_mode_set(struct aw_sar *p_sar, uint8_t curr_mode);
+int32_t aw_sar_update_reg_set_func(struct aw_sar *p_sar);
+
+#endif
-- 
2.45.1



Return-Path: <linux-input+bounces-4104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7358FC759
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 11:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 962282863B3
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 09:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A3118F2F2;
	Wed,  5 Jun 2024 09:12:18 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com [115.124.28.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91918C34B;
	Wed,  5 Jun 2024 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578738; cv=none; b=Q5Iu1XtMoiRbKiXSD+lEEaH3ChACuDdCFUYYTf8sBMgoE8SLARyr09BXbvJHbLypjP+fi7w4iCqcC0KaRMjj12fn1fsKcqZW7UEDGjNHcNmmkqyBo1ElouDA5zsZABlnbUDwwZ5aLPHIhV/g4FQyvWWxpobqCJzTwhKLsULHAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578738; c=relaxed/simple;
	bh=t63nm9r1ENdEapW9EY3HWHUbjphUtphquC0DtyWMLII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IF8lf41T01BG2RAW9qeTZ7zv4om0177hJpLTaKeDf3MQk/aUnQKfbuyVe+s6ChzjKNmn1HAWnu1D/h0gXOxEGShc/bptsYBH6h+kpKkhfnlkMaj+bbSMQyrdH/Ks9XoF5f5YpPL5xS2ef21qUztWAzmH4R9pcc/49HaHoN9Kwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0278597-0.00135007-0.97079;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045002061;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XwdqTkT_1717578724;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XwdqTkT_1717578724)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 17:12:05 +0800
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
Subject: [PATCH V2 3/5] Add aw9610x series related interfaces to the aw_sar driver.
Date: Wed,  5 Jun 2024 09:11:41 +0000
Message-ID: <20240605091143.163789-4-wangshuaijie@awinic.com>
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
 drivers/input/misc/aw_sar/aw9610x/aw9610x.c | 884 ++++++++++++++++++++
 drivers/input/misc/aw_sar/aw9610x/aw9610x.h | 327 ++++++++
 2 files changed, 1211 insertions(+)
 create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.c
 create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.h

diff --git a/drivers/input/misc/aw_sar/aw9610x/aw9610x.c b/drivers/input/misc/aw_sar/aw9610x/aw9610x.c
new file mode 100644
index 000000000000..83b238f155d5
--- /dev/null
+++ b/drivers/input/misc/aw_sar/aw9610x/aw9610x.c
@@ -0,0 +1,884 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AWINIC sar sensor driver (aw9610x)
+ *
+ * Author: Shuaijie Wang<wangshuaijie@awinic.com>
+ *
+ * Copyright (c) 2024 awinic Technology CO., LTD
+ */
+#include "aw9610x.h"
+
+#define AW9610X_I2C_NAME "aw9610x_sar"
+
+static struct aw_sar *g_aw_sar;
+
+static int32_t aw9610x_baseline_filter(struct aw_sar *p_sar)
+{
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint32_t status0;
+	uint32_t status1;
+	uint8_t i;
+
+	aw_sar_i2c_read(p_sar->i2c, REG_STAT1, &status1);
+	aw_sar_i2c_read(p_sar->i2c, REG_STAT0, &status0);
+
+	for (i = 0; i < AW9610X_CHANNEL_MAX; i++) {
+		if (((status1 >> i) & 0x01) == 1) {
+			if (aw9610x->satu_flag[i] == 0) {
+				aw_sar_i2c_read(p_sar->i2c, REG_BLFILT_CH0 + i * AW_CL1SPE_DEAL_OS,
+						&aw9610x->satu_data[i]);
+				aw_sar_i2c_write(p_sar->i2c, REG_BLFILT_CH0 + i * AW_CL1SPE_DEAL_OS,
+						((aw9610x->satu_data[i] | 0x1fc) & 0x3fffffff));
+				aw9610x->satu_flag[i] = 1;
+			}
+		} else if (((status1 >> i) & 0x01) == 0) {
+			if (aw9610x->satu_flag[i] == 1) {
+				if (((status0 >> (i + 24)) & 0x01) == 0) {
+					aw_sar_i2c_write(p_sar->i2c,
+							REG_BLFILT_CH0 + i * AW_CL1SPE_DEAL_OS,
+							aw9610x->satu_data[i]);
+					aw9610x->satu_flag[i] = 0;
+				}
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void aw9610x_saturat_release_handle(struct aw_sar *p_sar)
+{
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint32_t satu_irq;
+	uint32_t status0;
+	uint8_t i;
+
+	satu_irq = (aw9610x->irq_status >> 7) & 0x01;
+	if (satu_irq == 1) {
+		aw9610x_baseline_filter(p_sar);
+	} else {
+		aw_sar_i2c_read(p_sar->i2c, REG_STAT0, &status0);
+		for (i = 0; i < AW9610X_CHANNEL_MAX; i++) {
+			if (aw9610x->satu_flag[i] == 1) {
+				if (((status0 >> (i + 24)) & 0x01) == 0) {
+					aw_sar_i2c_write(p_sar->i2c,
+							REG_BLFILT_CH0 + i * AW_CL1SPE_DEAL_OS,
+							aw9610x->satu_data[i]);
+					aw9610x->satu_flag[i] = 0;
+				}
+			}
+		}
+	}
+}
+
+static void aw9610x_irq_handle(struct aw_sar *p_sar)
+{
+	uint32_t curr_status_val;
+	uint32_t curr_status;
+	uint8_t i;
+
+	aw_sar_i2c_read(p_sar->i2c, REG_STAT0, &curr_status_val);
+	if (!p_sar->channels_arr) {
+		dev_err(p_sar->dev, "input err!!!");
+		return;
+	}
+
+	for (i = 0; i < AW9610X_CHANNEL_MAX; i++) {
+		curr_status =
+			(((uint8_t)(curr_status_val >> (24 + i)) & 0x1))
+#ifdef AW_INPUT_TRIGGER_TH1
+			| (((uint8_t)(curr_status_val >> (16 + i)) & 0x1) << 1)
+#endif
+#ifdef AW_INPUT_TRIGGER_TH2
+			| (((uint8_t)(curr_status_val >> (8 + i)) & 0x1) << 2)
+#endif
+#ifdef AW_INPUT_TRIGGER_TH3
+			| (((uint8_t)(curr_status_val >> (i)) & 0x1) << 3)
+#endif
+			;
+
+		if (p_sar->channels_arr[i].used == AW_FALSE)
+			continue;
+
+		if (p_sar->channels_arr[i].last_channel_info == curr_status)
+			continue;
+
+		switch (curr_status) {
+		case AW9610X_FAR:
+			input_report_abs(p_sar->channels_arr[i].input, ABS_DISTANCE, 0);
+			break;
+		case AW9610X_TRIGGER_TH0:
+			input_report_abs(p_sar->channels_arr[i].input, ABS_DISTANCE, 1);
+			break;
+#ifdef AW_INPUT_TRIGGER_TH1
+		case AW9610X_TRIGGER_TH1:
+			input_report_abs(p_sar->channels_arr[i].input, ABS_DISTANCE, 2);
+			break;
+#endif
+#ifdef AW_INPUT_TRIGGER_TH2
+		case AW9610X_TRIGGER_TH2:
+			input_report_abs(p_sar->channels_arr[i].input, ABS_DISTANCE, 3);
+			break;
+#endif
+#ifdef AW_INPUT_TRIGGER_TH3
+		case AW9610X_TRIGGER_TH3:
+			input_report_abs(p_sar->channels_arr[i].input, ABS_DISTANCE, 4);
+			break;
+#endif
+		default:
+			dev_err(p_sar->dev, "error abs distance");
+			return;
+		}
+		input_sync(p_sar->channels_arr[i].input);
+
+		p_sar->channels_arr[i].last_channel_info = curr_status;
+	}
+}
+
+static void aw9610x_version_aw9610x_private(struct aw_sar *p_sar)
+{
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+
+	if (aw9610x->satu_release == AW9610X_FUNC_ON)
+		aw9610x_saturat_release_handle(p_sar);
+}
+
+static void aw9610x_irq_handle_func(uint32_t irq_status, void *data)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+
+	dev_info(p_sar->dev, "IRQSRC = 0x%x", irq_status);
+
+	switch (aw9610x->vers) {
+	case AW9610X:
+		aw9610x_version_aw9610x_private(p_sar);
+		break;
+	case AW9610XA:
+		break;
+	default:
+		break;
+	}
+
+	aw9610x_irq_handle(p_sar);
+}
+
+int32_t aw9610x_check_chipid(void *data)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	uint32_t reg_val;
+	int32_t ret;
+
+	if (!p_sar)
+		return -EINVAL;
+
+	ret = aw_sar_i2c_read(p_sar->i2c, REG_CHIPID, &reg_val);
+	if (ret < 0) {
+		dev_err(p_sar->dev, "read CHIP ID failed: %d", ret);
+		return ret;
+	}
+	reg_val = reg_val >> 16;
+
+	if (reg_val != AW9610X_CHIP_ID) {
+		dev_err(p_sar->dev, "unsupport dev, chipid is (0x%04x)", reg_val);
+		return -EINVAL;
+	}
+	dev_info(p_sar->dev, "aw9610x detected, 0x%04x", reg_val);
+	memcpy(p_sar->chip_name, "AW9610X", 8);
+
+	return 0;
+}
+
+static const struct aw_sar_check_chipid_t g_aw9610x_check_chipid = {
+	.p_check_chipid_fn = aw9610x_check_chipid,
+};
+
+static ssize_t aw9610x_operation_mode_get(void *data, char *buf)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	ssize_t len = 0;
+
+	if (p_sar->last_mode == AW9610X_ACTIVE_MODE)
+		len += snprintf(buf + len, PAGE_SIZE - len, "operation mode: Active\n");
+	else if (p_sar->last_mode == AW9610X_SLEEP_MODE)
+		len += snprintf(buf + len, PAGE_SIZE - len, "operation mode: Sleep\n");
+	else if ((p_sar->last_mode == AW9610X_DEEPSLEEP_MODE) && (aw9610x->vers == AW9610XA))
+		len += snprintf(buf + len, PAGE_SIZE - len, "operation mode: DeepSleep\n");
+	else
+		len += snprintf(buf + len, PAGE_SIZE - len, "operation mode: Unconfirmed\n");
+
+	return len;
+}
+
+static void aw9610x_chip_info_get(void *data, char *buf, ssize_t *p_len)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint32_t reg_data;
+
+	*p_len += snprintf(buf + *p_len, PAGE_SIZE - *p_len,
+			"sar%u\n", p_sar->dts_info.sar_num);
+	*p_len += snprintf(buf + *p_len, PAGE_SIZE - *p_len, "The driver supports UI\n");
+
+	aw_sar_i2c_read(p_sar->i2c, REG_CHIPID, &reg_data);
+	*p_len += snprintf(buf + *p_len, PAGE_SIZE - *p_len, "chipid is 0x%08x\n", reg_data);
+
+	aw_sar_i2c_read(p_sar->i2c, REG_IRQEN, &reg_data);
+	*p_len += snprintf(buf + *p_len, PAGE_SIZE - *p_len, "REG_HOSTIRQEN is 0x%08x\n", reg_data);
+
+	*p_len += snprintf(buf + *p_len, PAGE_SIZE - *p_len,
+			"chip_name:%s bin_prase_chip_name:%s\n",
+			aw9610x->chip_name, aw9610x->chip_type);
+}
+
+static const struct aw_sar_get_chip_info_t g_aw9610x_get_chip_info = {
+	.p_get_chip_info_node_fn = aw9610x_chip_info_get,
+};
+
+static void aw9610x_reg_version_comp(struct aw_sar *p_sar, struct aw_bin *aw_bin)
+{
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint32_t blfilt1_data;
+	uint32_t blfilt1_tmp;
+	uint8_t i;
+
+	if ((aw9610x->chip_name[7] == 'A') &&
+		(aw_bin->header_info[0].chip_type[7] == '\0')) {
+		for (i = 0; i < 6; i++) {
+			aw_sar_i2c_read(p_sar->i2c, REG_BLFILT_CH0 + (0x3c * i), &blfilt1_data);
+			blfilt1_tmp = (blfilt1_data >> 25) & 0x1;
+			if (blfilt1_tmp == 1)
+				aw_sar_i2c_write_bits(p_sar->i2c, REG_BLRSTRNG_CH0 + (0x3c * i),
+						~(0x3f), 1 << i);
+		}
+	}
+}
+
+static int32_t aw9610x_load_reg_bin(struct aw_bin *aw_bin, void *load_bin_para)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)load_bin_para;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	int32_t ret;
+
+	dev_info(p_sar->dev, "reg chip name: %s, soc chip name: %s, len = %d",
+			p_sar->chip_name, aw_bin->header_info[0].chip_type, aw_bin->info.len);
+
+	snprintf(aw9610x->chip_type, sizeof(aw9610x->chip_type), "%s",
+			aw_bin->header_info[0].chip_type);
+	ret = strncmp(aw9610x->chip_name, aw_bin->header_info[0].chip_type,
+			sizeof(aw_bin->header_info[0].chip_type));
+	if (ret != 0)
+		dev_err(p_sar->dev, "load_binname(%s) incompatible with chip type(%s)",
+			p_sar->chip_name, aw_bin->header_info[0].chip_type);
+
+	p_sar->load_bin.bin_data_ver = aw_bin->header_info[0].bin_data_ver;
+
+	ret = aw_sar_load_reg(aw_bin, p_sar->i2c);
+	aw9610x_reg_version_comp(p_sar, aw_bin);
+
+	return ret;
+}
+
+static ssize_t aw9610x_get_self_cap_offset(void *data, char *buf)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	uint8_t temp_data[20] = { 0 };
+	uint32_t coff_data_int;
+	uint32_t coff_data_dec;
+	uint32_t coff_data;
+	uint32_t reg_val;
+	ssize_t len = 0;
+	uint8_t i;
+
+	for (i = 0; i < AW9610X_CHANNEL_MAX; i++) {
+		aw_sar_i2c_read(p_sar->i2c,
+			REG_AFECFG1_CH0 + i * AW_CL1SPE_CALI_OS, &reg_val);
+		coff_data = (reg_val >> 24) * 900 + ((reg_val >> 16) & 0xff) * 13;
+		coff_data_int = coff_data / 1000;
+		coff_data_dec = coff_data % 1000;
+		snprintf(temp_data, sizeof(temp_data), "%u.%u", coff_data_int, coff_data_dec);
+		len += snprintf(buf+len, PAGE_SIZE-len, "PARASITIC_DATA_CH%d = %s pf\n",
+				i, temp_data);
+	}
+
+	return len;
+}
+
+static const struct aw_sar_offset_t g_aw9610x_offset = {
+	.p_get_offset_node_fn = aw9610x_get_self_cap_offset,
+};
+
+static uint32_t attr_buf[] = {
+	8, 10,
+	9, 100,
+	10, 1000,
+};
+
+static void aw9610x_addrblock_load(struct aw_sar *p_sar, const char *buf)
+{
+	struct aw9610x *aw9610x = p_sar->priv_data;
+	uint8_t addr_bytes = aw9610x->aw_i2c_package.addr_bytes;
+	uint8_t reg_num = aw9610x->aw_i2c_package.reg_num;
+	uint32_t addrbuf[4] = { 0 };
+	uint8_t temp_buf[2] = { 0 };
+	uint32_t i;
+
+	for (i = 0; i < addr_bytes; i++) {
+		if (reg_num < attr_buf[1]) {
+			temp_buf[0] = buf[attr_buf[0] + i * 5];
+			temp_buf[1] = buf[attr_buf[0] + i * 5 + 1];
+		} else if (reg_num >= attr_buf[1] && reg_num < attr_buf[3]) {
+			temp_buf[0] = buf[attr_buf[2] + i * 5];
+			temp_buf[1] = buf[attr_buf[2] + i * 5 + 1];
+		} else if (reg_num >= attr_buf[3] && reg_num < attr_buf[5]) {
+			temp_buf[0] = buf[attr_buf[4] + i * 5];
+			temp_buf[1] = buf[attr_buf[4] + i * 5 + 1];
+		}
+		if (sscanf(temp_buf, "%02x", &addrbuf[i]) == 1)
+			aw9610x->aw_i2c_package.init_addr[i] = (uint8_t)addrbuf[i];
+	}
+}
+
+static int32_t aw9610x_awrw_write_seq(struct aw_sar *p_sar)
+{
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint8_t addr_bytes = aw9610x->aw_i2c_package.addr_bytes;
+	uint8_t data_bytes = aw9610x->aw_i2c_package.data_bytes;
+	uint8_t reg_num = aw9610x->aw_i2c_package.reg_num;
+	uint8_t *p_reg_data = aw9610x->aw_i2c_package.p_reg_data;
+	uint8_t w_buf[228];
+	uint32_t msg_idx;
+	uint8_t msg_cnt;
+
+	for (msg_idx = 0; msg_idx < addr_bytes; msg_idx++)
+		w_buf[msg_idx] = aw9610x->aw_i2c_package.init_addr[msg_idx];
+
+	msg_cnt = addr_bytes;
+	for (msg_idx = 0; msg_idx < data_bytes * reg_num; msg_idx++) {
+		w_buf[msg_cnt] = *p_reg_data++;
+		msg_cnt++;
+	}
+
+	return aw_sar_i2c_write_seq(p_sar->i2c, w_buf, msg_cnt);
+}
+
+static void aw9610x_datablock_load(struct aw_sar *p_sar, const char *buf)
+{
+	struct aw9610x *aw9610x = p_sar->priv_data;
+	uint8_t addr_bytes = aw9610x->aw_i2c_package.addr_bytes;
+	uint8_t data_bytes = aw9610x->aw_i2c_package.data_bytes;
+	uint8_t reg_num = aw9610x->aw_i2c_package.reg_num;
+	uint8_t reg_data[220] = { 0 };
+	uint32_t databuf[220] = { 0 };
+	uint8_t temp_buf[2] = { 0 };
+	uint32_t i;
+
+	for (i = 0; i < data_bytes * reg_num; i++) {
+		if (reg_num < attr_buf[1]) {
+			temp_buf[0] = buf[attr_buf[0] + (addr_bytes + i) * 5];
+			temp_buf[1] =
+				buf[attr_buf[0] + (addr_bytes + i) * 5 + 1];
+		} else if (reg_num >= attr_buf[1] && reg_num < attr_buf[3]) {
+			temp_buf[0] = buf[attr_buf[2] + (addr_bytes + i) * 5];
+			temp_buf[1] =
+				buf[attr_buf[2] + (addr_bytes + i) * 5 + 1];
+		} else if (reg_num >= attr_buf[3] && reg_num < attr_buf[5]) {
+			temp_buf[0] = buf[attr_buf[4] + (addr_bytes + i) * 5];
+			temp_buf[1] =
+				buf[attr_buf[4] + (addr_bytes + i) * 5 + 1];
+		}
+		sscanf(temp_buf, "%02x", &databuf[i]);
+		reg_data[i] = (uint8_t)databuf[i];
+	}
+	aw9610x->aw_i2c_package.p_reg_data = reg_data;
+	aw9610x_awrw_write_seq(p_sar);
+}
+
+static int32_t aw9610x_awrw_read_seq(struct aw_sar *p_sar, uint8_t *reg_data)
+{
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint8_t data_bytes = aw9610x->aw_i2c_package.data_bytes;
+	uint8_t addr_bytes = aw9610x->aw_i2c_package.addr_bytes;
+	uint8_t reg_num = aw9610x->aw_i2c_package.reg_num;
+	uint16_t msg_cnt = (uint16_t)(data_bytes * reg_num);
+	uint8_t w_buf[4];
+	uint8_t buf[228];
+	uint32_t msg_idx;
+	int32_t ret;
+
+	for (msg_idx = 0; msg_idx < addr_bytes; msg_idx++)
+		w_buf[msg_idx] = aw9610x->aw_i2c_package.init_addr[msg_idx];
+
+	ret = aw_sar_i2c_read_seq(p_sar->i2c, w_buf, 2, (uint8_t *)buf, msg_cnt);
+
+	for (msg_idx = 0; msg_idx < msg_cnt; msg_idx++)
+		reg_data[msg_idx] = buf[msg_idx];
+
+	return ret;
+}
+
+static ssize_t aw9610x_awrw_get(void *data, char *buf)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint8_t data_bytes = aw9610x->aw_i2c_package.data_bytes;
+	uint8_t reg_num = aw9610x->aw_i2c_package.reg_num;
+	uint8_t reg_data[228] = { 0 };
+	ssize_t len = 0;
+	uint8_t i;
+
+	aw9610x_awrw_read_seq(p_sar, reg_data);
+	for (i = 0; i < reg_num * data_bytes; i++)
+		len += snprintf(buf + len, PAGE_SIZE - len, "0x%02x,", reg_data[i]);
+
+	snprintf(buf + len - 1, PAGE_SIZE - len, "\n");
+
+	return len;
+};
+
+static ssize_t aw9610x_awrw_set(void *data, const char *buf, size_t count)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint32_t datatype[3] = { 0 };
+
+	if (sscanf(buf, "%u %u %u", &datatype[0], &datatype[1], &datatype[2]) == 3) {
+		aw9610x->aw_i2c_package.addr_bytes = (uint8_t)datatype[0];
+		aw9610x->aw_i2c_package.data_bytes = (uint8_t)datatype[1];
+		aw9610x->aw_i2c_package.reg_num = (uint8_t)datatype[2];
+
+		aw9610x_addrblock_load(p_sar, buf);
+		if (count > 7 + 5 * aw9610x->aw_i2c_package.addr_bytes)
+			aw9610x_datablock_load(p_sar, buf);
+	}
+
+	return count;
+}
+
+static int32_t aw9610x_get_chip_version(void *data)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint32_t firmvers;
+	uint32_t fw_ver;
+	int32_t ret;
+
+	aw_sar_i2c_read(p_sar->i2c, REG_FWVER, &firmvers);
+
+	ret = aw_sar_i2c_read(p_sar->i2c, REG_FWVER2, &fw_ver);
+	if (ret < 0) {
+		dev_err(p_sar->dev, "read REG_FWVER2 err!");
+		return ret;
+	}
+	snprintf(aw9610x->chip_name, sizeof(aw9610x->chip_name), "AW9610X");
+	p_sar->chip_type = AW_SAR_NONE_CHECK_CHIP;
+
+	if (fw_ver == AW_CHIP_AW9610XA) {
+		aw9610x->vers = AW9610XA;
+		memcpy(aw9610x->chip_name + strlen(aw9610x->chip_name), "A\0", 2);
+		p_sar->chip_type = SAR_AW9610XA;
+	} else {
+		aw9610x->vers = AW9610X;
+		p_sar->chip_type = SAR_AW9610X;
+		aw9610x->chip_name[7] = '\0';
+	}
+	dev_info(p_sar->dev, "the IC is = %s", aw9610x->chip_name);
+
+	return 0;
+}
+
+#ifdef AW9610X_TVS_ABNORMAL_CAIL
+static ssize_t aw9610x_set_aot(void *data)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint32_t max_delay_ms = AW9610X_AOT_OVER_DELAY_MAX_MS;
+	uint32_t irqen_reg_val;
+	uint32_t reg_val_tmp;
+	uint32_t scan_over_cnt;
+	uint32_t scan_over_en;
+	uint32_t ch_en;
+	uint32_t i;
+
+	//1. disable chip irq
+	aw_sar_i2c_read(p_sar->i2c, REG_IRQEN, &irqen_reg_val);
+	aw_sar_i2c_write(p_sar->i2c, REG_IRQEN, AW_REG_IRQEN_CLOSE);
+
+	//2. aot cail
+	aw_sar_i2c_write_bits(p_sar->i2c, REG_SCANCTRL0, ~(AW9610X_AOT_MASK << AW9610X_AOT_BIT),
+						AW9610X_AOT_MASK << AW9610X_AOT_BIT);
+	// aot over
+	for (i = 0; i < max_delay_ms; i++) {
+		aw_sar_i2c_read(p_sar->i2c, REG_IRQSRC, &reg_val_tmp);
+		if (((reg_val_tmp >> AW_REG_IRQSRC_AOT_OVER_BIT) & 0x01) == 1)
+			break;
+		mdelay(1);
+	}
+
+	//3. scan 8 cnt over
+	aw_sar_i2c_read(p_sar->i2c, REG_SCANCTRL0, &ch_en);
+	aw_sar_i2c_read(p_sar->i2c, REG_CHINTEN, &scan_over_en);
+	if ((ch_en & AW9610X_AOT_MASK) != (scan_over_en & AW9610X_AOT_MASK))
+		aw_sar_i2c_write_bits(p_sar->i2c, REG_CHINTEN, ~(AW9610X_AOT_MASK),
+				ch_en & (AW9610X_AOT_MASK));
+
+	for (scan_over_cnt = 0; scan_over_cnt < AW9610X_AOT_SCAN_OVER_CNT; scan_over_cnt++) {
+		for (i = 0; i < max_delay_ms; i++) {
+			aw_sar_i2c_read(p_sar->i2c, REG_IRQSRC, &reg_val_tmp);
+			if (((reg_val_tmp >> REG_IRQSRC_SCAN_OVER_BIT) & 0x01) == 1)
+				break;
+			mdelay(1);
+		}
+	}
+	if ((ch_en & AW9610X_AOT_MASK) != (scan_over_en & AW9610X_AOT_MASK))
+		aw_sar_i2c_write_bits(p_sar->i2c, REG_CHINTEN, ~(AW9610X_AOT_MASK),
+				ch_en & (AW9610X_AOT_MASK));
+
+	if (aw9610x->vers == AW9610XA)
+		//4. chip set sleep mode
+		aw_sar_i2c_write(p_sar->i2c, REG_CMD, AW9610X_SLEEP_MODE);
+	else if (aw9610x->vers == AW9610X)
+		aw_sar_i2c_write(p_sar->i2c, REG_CMD, AW9610X_DEEPSLEEP_MODE);
+
+	for (i = 0; i < max_delay_ms; i++) {
+		aw_sar_i2c_read(p_sar->i2c, REG_WST, &reg_val_tmp);
+		if ((reg_val_tmp & 0xFF) == REG_REG_WST_SLEEP_MODE)
+			break;
+		mdelay(1);
+	}
+
+	//5. write baseline data
+	for (i = 0; i < AW9610X_CHANNEL_MAX; i++) {
+		aw_sar_i2c_read(p_sar->i2c, REG_COMP_CH0 + i * AW9610X_REG_OFFSET_STEP,
+				&reg_val_tmp);
+		aw_sar_i2c_write(p_sar->i2c, REG_BASELINE_CH0 + i * AW9610X_REG_OFFSET_STEP,
+				reg_val_tmp);
+	}
+
+	//6. chip set active, irq recovery
+	aw_sar_i2c_write(p_sar->i2c, REG_CMD, AW9610X_ACTIVE_MODE);
+	aw_sar_i2c_write(p_sar->i2c, REG_IRQEN, irqen_reg_val);
+
+	return 0;
+}
+#else
+static ssize_t aw9610x_set_aot(void *data)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+
+	aw_sar_i2c_write_bits(p_sar->i2c, REG_SCANCTRL0, ~(AW9610X_AOT_MASK << AW9610X_AOT_BIT),
+						(AW9610X_AOT_MASK) << AW9610X_AOT_BIT);
+	return 0;
+}
+#endif
+
+static const struct aw_sar_aot_t g_aw9610x_aot = {
+	.p_set_aot_node_fn = aw9610x_set_aot,
+};
+
+/**********************mode operation start*******************************/
+static void aw9610x_enable_clock(void *i2c)
+{
+	aw_sar_i2c_write(i2c, REG_OSCEN, AW9610X_CPU_WORK_MASK);
+}
+
+static uint32_t aw9610x_rc_irqscr(void *i2c)
+{
+	uint32_t val;
+
+	aw_sar_i2c_read(i2c, REG_IRQSRC, &val);
+
+	return val;
+}
+
+//Note: TVS exceptions need to be handled after active
+static void aw9610x_set_active_cmd(void *i2c)
+{
+	aw_sar_i2c_write(i2c, REG_CMD, AW9610X_ACTIVE_MODE);
+
+#ifdef AW9610X_TVS_ABNORMAL_CAIL
+	if (g_aw_sar != NULL)
+		aw9610x_set_aot(g_aw_sar);
+#endif
+}
+
+static void aw9610x_set_sleep_cmd(void *i2c)
+{
+	aw_sar_i2c_write(i2c, REG_CMD, AW9610X_SLEEP_MODE);
+}
+
+static void aw9610x_set_deepsleep_cmd(void *i2c)
+{
+	aw_sar_i2c_write(i2c, REG_CMD, AW9610X_DEEPSLEEP_MODE);
+}
+
+static const struct aw_sar_mode_set_t g_aw9610x_mode_set[] = {
+	{
+		.chip_id = SAR_AW9610XA | SAR_AW9610X,
+		.chip_mode = {
+			.curr_mode = AW9610X_ACTIVE_MODE,
+			.last_mode = AW9610X_DEEPSLEEP_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = aw9610x_enable_clock,
+			.rc_irqscr = NULL,
+			.mode_update = aw9610x_set_active_cmd,
+		},
+	},
+	{
+		.chip_id = SAR_AW9610XA | SAR_AW9610X,
+		.chip_mode = {
+			.curr_mode = AW9610X_ACTIVE_MODE,
+			.last_mode = AW9610X_SLEEP_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = NULL,
+			.rc_irqscr = NULL,
+			.mode_update = aw9610x_set_active_cmd,
+		},
+	},
+	{
+		.chip_id = SAR_AW9610XA | SAR_AW9610X,
+		.chip_mode = {
+			.curr_mode = AW9610X_ACTIVE_MODE,
+			.last_mode = AW9610X_ACTIVE_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = NULL,
+			.rc_irqscr = NULL,
+			.mode_update = aw9610x_set_active_cmd,
+		},
+	},
+	{
+		.chip_id = SAR_AW9610XA | SAR_AW9610X,
+		.chip_mode = {
+			.curr_mode = AW9610X_SLEEP_MODE,
+			.last_mode = AW9610X_DEEPSLEEP_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = aw9610x_enable_clock,
+			.rc_irqscr = NULL,
+			.mode_update = aw9610x_set_sleep_cmd,
+		},
+	},
+	{
+		.chip_id = SAR_AW9610XA | SAR_AW9610X,
+		.chip_mode = {
+			.curr_mode = AW9610X_SLEEP_MODE,
+			.last_mode = AW9610X_ACTIVE_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = NULL,
+			.rc_irqscr = NULL,
+			.mode_update = aw9610x_set_sleep_cmd,
+		},
+	},
+	{
+		.chip_id = SAR_AW9610XA | SAR_AW9610X,
+		.chip_mode = {
+			.curr_mode = AW9610X_DEEPSLEEP_MODE,
+			.last_mode = AW9610X_SLEEP_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = NULL,
+			.rc_irqscr = NULL,
+			.mode_update = aw9610x_set_deepsleep_cmd,
+		},
+	},
+	{
+		.chip_id = SAR_AW9610XA,
+		.chip_mode = {
+			.curr_mode = AW9610X_DEEPSLEEP_MODE,
+			.last_mode = AW9610X_ACTIVE_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = NULL,
+			.rc_irqscr = aw9610x_rc_irqscr,
+			.mode_update = aw9610x_set_deepsleep_cmd,
+		},
+	},
+	{
+		.chip_id = SAR_AW9610X,
+		.chip_mode = {
+			.curr_mode = AW9610X_DEEPSLEEP_MODE,
+			.last_mode = AW9610X_ACTIVE_MODE,
+		},
+		.mode_switch_ops = {
+			.enable_clock = NULL,
+			.rc_irqscr = NULL,
+			.mode_update = NULL,
+		},
+	},
+};
+/**********************mode operation end*******************************/
+
+static const struct aw_sar_irq_init_t g_aw9610x_irq_init = {
+	.flags = GPIOF_DIR_IN | GPIOF_INIT_HIGH,
+	.irq_flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+	.handler = NULL,
+	.thread_fn = NULL,
+	.rc_irq_fn = aw9610x_rc_irqscr,
+	.irq_spec_handler_fn = aw9610x_irq_handle_func,
+};
+
+static const struct aw_sar_soft_rst_t g_aw9610x_soft_rst = {
+	.reg_rst = REG_RESET,
+	.reg_rst_val = 0,
+	.delay_ms = 20,
+};
+
+static const struct aw_sar_init_over_irq_t g_aw9610x_init_over_irq = {
+	.wait_times = 20,
+	.daley_step = 1,
+	.reg_irqsrc = REG_IRQSRC,
+	.irq_offset_bit = 0,
+	.irq_mask = 0x1,
+	.irq_flag = 0x1,
+};
+
+static const struct aw_sar_load_bin_t g_aw9610x_load_reg_bin = {
+	.bin_name = "aw9610x",
+	.bin_opera_func = aw9610x_load_reg_bin,
+	.p_update_fn = NULL,
+};
+
+static const struct aw_sar_para_load_t g_aw9610x_reg_arr_para = {
+	.reg_arr = aw9610x_reg_default,
+	.reg_arr_len = ARRAY_SIZE(aw9610x_reg_default),
+};
+
+static const struct aw_sar_diff_t g_aw9610x_diff = {
+	.diff0_reg = REG_DIFF_CH0,
+	.diff_step = 4,
+	.rm_float = AW9610x_DATA_PROCESS_FACTOR,
+};
+
+static const struct aw_sar_mode_t g_aw9610x_mode = {
+	.mode_set_arr = &g_aw9610x_mode_set[0],
+	.mode_set_arr_len = ARRAY_SIZE(g_aw9610x_mode_set),
+	.p_set_mode_node_fn = NULL,
+	.p_get_mode_node_fn = aw9610x_operation_mode_get,
+};
+
+static const struct aw_sar_reg_list_t g_aw9610x_reg_list = {
+	.reg_none_access = REG_NONE_ACCESS,
+	.reg_rd_access = REG_RD_ACCESS,
+	.reg_wd_access = REG_WR_ACCESS,
+	.reg_perm = (struct aw_sar_reg_data *)&g_aw9610x_reg_access[0],
+	.reg_num = ARRAY_SIZE(g_aw9610x_reg_access),
+};
+
+static const struct aw_sar_pm_t g_aw9610x_pm_chip_mode = {
+	.suspend_set_mode = AW9610X_SLEEP_MODE,
+	.resume_set_mode = AW9610X_ACTIVE_MODE,
+	.shutdown_set_mode = AW9610X_SLEEP_MODE,
+};
+
+static const struct aw_sar_chip_mode_t g_aw9610x_chip_mode = {
+	.init_mode = AW9610X_ACTIVE_MODE,
+	.active = AW9610X_ACTIVE_MODE,
+	.pre_init_mode = AW9610X_SLEEP_MODE,
+};
+
+static const struct aw_sar_regulator_config_t g_regulator_config = {
+	.vcc_name = "vcc",
+	.min_uV = AW9610X_SAR_VCC_MIN_UV,
+	.max_uV = AW9610X_SAR_VCC_MAX_UV,
+};
+
+struct aw_sar_awrw_t g_aw9610x_awrw = {
+	.p_set_awrw_node_fn = aw9610x_awrw_set,
+	.p_get_awrw_node_fn = aw9610x_awrw_get,
+};
+
+static const struct aw_sar_platform_config g_aw9610x_platform_config = {
+	.p_regulator_config = &g_regulator_config,
+	.p_irq_init = &g_aw9610x_irq_init,
+	.p_pm_chip_mode = &g_aw9610x_pm_chip_mode,
+};
+
+static void aw9610x_power_on_prox_detection(void *data, uint8_t en_flag)
+{
+	struct aw_sar *p_sar = (struct aw_sar *)data;
+	struct aw9610x *aw9610x = (struct aw9610x *)p_sar->priv_data;
+	uint8_t ch;
+
+	if (en_flag == true) {
+		for (ch = 0; ch < AW9610X_CHANNEL_MAX; ch++) {
+			aw_sar_i2c_read(p_sar->i2c,
+				REG_BLFILT_CH0 + (REG_BLFILT_CH1 - REG_BLFILT_CH0) * ch,
+				&(aw9610x->last_blfilta[ch]));
+			aw_sar_i2c_write_bits(p_sar->i2c,
+				REG_BLFILT_CH0 + (REG_BLFILT_CH1 - REG_BLFILT_CH0) * ch,
+				~(0x3f << 13), (1 << 13));
+		}
+		aw_sar_i2c_read(p_sar->i2c, REG_IRQEN, &aw9610x->last_irq_en);
+		aw_sar_i2c_write_bits(p_sar->i2c, REG_IRQEN, ~(1 << 3), 1 << 3);
+	} else if (en_flag == false) {
+		for (ch = 0; ch < AW9610X_CHANNEL_MAX; ch++) {
+			aw_sar_i2c_write(p_sar->i2c,
+				REG_BLFILT_CH0 + (REG_BLFILT_CH1 - REG_BLFILT_CH0) * ch,
+				aw9610x->last_blfilta[ch]);
+		}
+		aw_sar_i2c_write(p_sar->i2c, REG_IRQEN, aw9610x->last_irq_en);
+	}
+}
+
+static const struct aw_sar_power_on_prox_detection_t g_aw9610x_power_on_prox_detection = {
+	.p_power_on_prox_detection_en_fn = aw9610x_power_on_prox_detection,
+	.irq_en_cali_bit = 3,
+	.power_on_prox_en_flag = true,
+};
+
+static const struct aw_sar_chip_config g_aw9610x_chip_config = {
+	.ch_num_max = AW9610X_CHANNEL_MAX,
+
+	.p_platform_config = &g_aw9610x_platform_config,
+
+	.p_check_chipid = &g_aw9610x_check_chipid,
+	.p_soft_rst = &g_aw9610x_soft_rst,
+	.p_init_over_irq = &g_aw9610x_init_over_irq,
+	.p_fw_bin = NULL,
+	.p_reg_bin = &g_aw9610x_load_reg_bin,
+	.p_chip_mode = &g_aw9610x_chip_mode,
+
+	//Node usage parameters
+	.p_reg_list = &g_aw9610x_reg_list,
+	.p_reg_arr = &g_aw9610x_reg_arr_para,
+	.p_aot = &g_aw9610x_aot,
+	.p_diff = &g_aw9610x_diff,
+	.p_offset = &g_aw9610x_offset,
+	.p_mode = &g_aw9610x_mode,
+	.p_prox_fw = NULL,
+	.p_get_chip_info = &g_aw9610x_get_chip_info,
+	.p_aw_sar_awrw = &g_aw9610x_awrw,
+	.p_boot_bin = NULL,
+
+	.p_other_operation = aw9610x_get_chip_version,
+	.p_other_opera_free = NULL,
+	.power_on_prox_detection = &g_aw9610x_power_on_prox_detection,
+};
+
+int32_t aw9610x_init(struct aw_sar *p_sar)
+{
+	if (!p_sar)
+		return -EINVAL;
+
+	g_aw_sar = p_sar;
+
+	p_sar->priv_data = devm_kzalloc(p_sar->dev, sizeof(struct aw9610x), GFP_KERNEL);
+	if (!p_sar->priv_data)
+		return -ENOMEM;
+
+	//Chip private function operation
+	p_sar->p_sar_para = &g_aw9610x_chip_config;
+
+	return 0;
+}
+
+void aw9610x_deinit(struct aw_sar *p_sar)
+{
+	if (p_sar->priv_data != NULL)
+		devm_kfree(p_sar->dev, p_sar->priv_data);
+}
diff --git a/drivers/input/misc/aw_sar/aw9610x/aw9610x.h b/drivers/input/misc/aw_sar/aw9610x/aw9610x.h
new file mode 100644
index 000000000000..220f85bec95c
--- /dev/null
+++ b/drivers/input/misc/aw_sar/aw9610x/aw9610x.h
@@ -0,0 +1,327 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _AW9610X_H_
+#define _AW9610X_H_
+#include "../comm/aw_sar_type.h"
+
+//#define AW9610X_TVS_ABNORMAL_CAIL
+#define AW9610X_AOT_SCAN_OVER_CNT (32)
+
+#define AW9610X_CHIP_ID					(0xa961)
+#define AW9610x_DATA_PROCESS_FACTOR			(1024)
+#define AW_CHIP_AW9610XA				(0x03000b00)
+#define AW9610X_CPU_WORK_MASK				(1)
+
+#define AW9610X_SAR_VCC_MIN_UV				(1700000)
+#define AW9610X_SAR_VCC_MAX_UV				(3600000)
+
+#define AW_REG_IRQEN_CLOSE				(0)
+#define AW_REG_IRQSRC_AOT_OVER_BIT			(3)
+#define REG_IRQSRC_SCAN_OVER_BIT			(4)
+#define REG_REG_WST_SLEEP_MODE				(0x3)
+#define AW9610X_AOT_OVER_DELAY_MAX_MS			(6000)
+#define AW9610X_AOT_MASK				(0x3f)
+#define AW9610X_AOT_BIT					(8)
+#define AW9610X_REG_OFFSET_STEP				(4)
+
+enum aw9610x_sar_vers {
+	AW9610X = 2,
+	AW9610XA = 6,
+	AW9610XB = 0xa,
+};
+
+enum aw9610x_operation_mode {
+	AW9610X_ACTIVE_MODE = 1,
+	AW9610X_SLEEP_MODE,
+	AW9610X_DEEPSLEEP_MODE,
+	AW9610XB_DEEPSLEEP_MODE,
+};
+
+/**********************************************
+ *spereg addr offset
+ **********************************************/
+enum aw9610x_spereg_addr_offset {
+	AW_CL1SPE_CALI_OS = 20,
+	AW_CL1SPE_DEAL_OS = 60,
+	AW_CL2SPE_CALI_OS = 4,
+	AW_CL2SPE_DEAL_OS = 4,
+};
+
+
+/**********************************************
+ *the flag of i2c read/write
+ **********************************************/
+enum aw9610x_function_flag {
+	AW9610X_FUNC_OFF,
+	AW9610X_FUNC_ON,
+};
+
+/**********************************************
+ * multiple sar define
+ **********************************************/
+enum aw9610x_multiple_sar {
+	AW_SAR0,
+	AW_SAR1,
+	AW_SAR_MAX,
+};
+
+#define AW9610X_CHANNEL_MAX	(6)
+
+enum aw9610x_irq_trigger_position {
+	AW9610X_FAR,
+	AW9610X_TRIGGER_TH0,
+	AW9610X_TRIGGER_TH1 = 0x03,
+	AW9610X_TRIGGER_TH2 = 0x07,
+	AW9610X_TRIGGER_TH3 = 0x0f,
+};
+
+struct aw_i2c_package {
+	uint8_t addr_bytes;
+	uint8_t data_bytes;
+	uint8_t reg_num;
+	uint8_t init_addr[4];
+	uint8_t *p_reg_data;
+};
+
+struct aw9610x {
+	uint8_t vers;
+	uint8_t channel;
+	uint32_t irq_status;
+	uint8_t chip_name[9];
+	uint8_t chip_type[9];
+	bool satu_release;
+
+	struct aw_i2c_package aw_i2c_package;
+
+	uint8_t satu_flag[6];
+	uint32_t satu_data[6];
+	uint32_t last_blfilta[AW9610X_CHANNEL_MAX];
+	uint32_t last_irq_en;
+};
+
+/********************************************
+ * Register List
+ ********************************************/
+#define AFE_BASE_ADDR					(0x0000)
+#define DSP_BASE_ADDR					(0x0000)
+#define STAT_BASE_ADDR					(0x0000)
+#define SFR_BASE_ADDR					(0x0000)
+#define DATA_BASE_ADDR					(0x0000)
+
+#define REG_SCANCTRL0					((0x0000) + AFE_BASE_ADDR)
+#define REG_AFECFG1_CH0					((0x0014) + AFE_BASE_ADDR)
+
+#define REG_FWVER					((0x0088) + STAT_BASE_ADDR)
+#define REG_WST						((0x008C) + STAT_BASE_ADDR)
+#define REG_STAT0					((0x0090) + STAT_BASE_ADDR)
+#define REG_STAT1					((0x0094) + STAT_BASE_ADDR)
+#define REG_CHINTEN					((0x009C) + STAT_BASE_ADDR)
+
+#define REG_BLFILT_CH0					((0x00A8) + DSP_BASE_ADDR)
+#define REG_BLRSTRNG_CH0				((0x00B4) + DSP_BASE_ADDR)
+#define REG_BLFILT_CH1					((0x00E4) + DSP_BASE_ADDR)
+
+#define REG_COMP_CH0					((0x0210) + DATA_BASE_ADDR)
+#define REG_BASELINE_CH0				((0x0228) + DATA_BASE_ADDR)
+#define REG_DIFF_CH0					((0x0240) + DATA_BASE_ADDR)
+#define REG_FWVER2					((0x0410) + DATA_BASE_ADDR)
+
+#define REG_CMD						((0xF008) + SFR_BASE_ADDR)
+#define REG_IRQSRC					((0xF080) + SFR_BASE_ADDR)
+#define REG_IRQEN					((0xF084) + SFR_BASE_ADDR)
+#define REG_OSCEN					((0xFF00) + SFR_BASE_ADDR)
+#define REG_RESET					((0xFF0C) + SFR_BASE_ADDR)
+#define REG_CHIPID					((0xFF10) + SFR_BASE_ADDR)
+
+struct aw_reg_data {
+	unsigned char rw;
+	unsigned short reg;
+};
+/********************************************
+ * Register Access
+ *******************************************/
+#define REG_NONE_ACCESS					(0)
+#define REG_RD_ACCESS					(1 << 0)
+#define REG_WR_ACCESS					(1 << 1)
+
+static const struct aw_reg_data g_aw9610x_reg_access[] = {
+	{ .reg = REG_SCANCTRL0,				.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+	{ .reg = REG_AFECFG1_CH0,			.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+
+	{ .reg = REG_FWVER,				.rw = REG_RD_ACCESS, },
+	{ .reg = REG_WST,				.rw = REG_RD_ACCESS, },
+	{ .reg = REG_STAT0,				.rw = REG_RD_ACCESS, },
+	{ .reg = REG_STAT1,				.rw = REG_RD_ACCESS, },
+	{ .reg = REG_CHINTEN,				.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+
+	{ .reg = REG_BLFILT_CH0,			.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+	{ .reg = REG_BLRSTRNG_CH0,			.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+	{ .reg = REG_BLFILT_CH1,			.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+
+
+	{ .reg = REG_COMP_CH0,				.rw = REG_RD_ACCESS, },
+	{ .reg = REG_BASELINE_CH0,			.rw = REG_RD_ACCESS, },
+	{ .reg = REG_DIFF_CH0,				.rw = REG_RD_ACCESS, },
+	{ .reg = REG_FWVER2,				.rw = REG_RD_ACCESS, },
+
+	{ .reg = REG_CMD,				.rw = REG_NONE_ACCESS, },
+	{ .reg = REG_IRQSRC,				.rw = REG_RD_ACCESS, },
+	{ .reg = REG_IRQEN,				.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+	{ .reg = REG_OSCEN,				.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+	{ .reg = REG_RESET,				.rw = REG_RD_ACCESS | REG_WR_ACCESS, },
+	{ .reg = REG_CHIPID,				.rw = REG_RD_ACCESS, },
+};
+
+
+/******************************************************
+ * Register Detail
+ ******************************************************/
+static const uint32_t aw9610x_reg_default[] = {
+	0x0000, 0x00003f3f,
+	0x0004, 0x00000064,
+	0x0008, 0x0017c11e,
+	0x000c, 0x05000000,
+	0x0010, 0x00093ffd,
+	0x0014, 0x19240009,
+	0x0018, 0xd81c0207,
+	0x001c, 0xff000000,
+	0x0020, 0x00241900,
+	0x0024, 0x00093ff7,
+	0x0028, 0x58020009,
+	0x002c, 0xd81c0207,
+	0x0030, 0xff000000,
+	0x0034, 0x00025800,
+	0x0038, 0x00093fdf,
+	0x003c, 0x7d3b0009,
+	0x0040, 0xd81c0207,
+	0x0044, 0xff000000,
+	0x0048, 0x003b7d00,
+	0x004c, 0x00093f7f,
+	0x0050, 0xe9310009,
+	0x0054, 0xd81c0207,
+	0x0058, 0xff000000,
+	0x005c, 0x0031e900,
+	0x0060, 0x00093dff,
+	0x0064, 0x1a0c0009,
+	0x0068, 0xd81c0207,
+	0x006c, 0xff000000,
+	0x0070, 0x000c1a00,
+	0x0074, 0x80093fff,
+	0x0078, 0x043d0009,
+	0x007c, 0xd81c0207,
+	0x0080, 0xff000000,
+	0x0084, 0x003d0400,
+	0x00a0, 0xe6400000,
+	0x00a4, 0x00000000,
+	0x00a8, 0x010408d2,
+	0x00ac, 0x00000000,
+	0x00b0, 0x00000000,
+	0x00b8, 0x00005fff,
+	0x00bc, 0x00000000,
+	0x00c0, 0x00000000,
+	0x00c4, 0x00000000,
+	0x00c8, 0x00000000,
+	0x00cc, 0x00000000,
+	0x00d0, 0x00000000,
+	0x00d4, 0x00000000,
+	0x00d8, 0x00000000,
+	0x00dc, 0xe6447800,
+	0x00e0, 0x78000000,
+	0x00e4, 0x010408d2,
+	0x00e8, 0x00000000,
+	0x00ec, 0x00000000,
+	0x00f4, 0x00005fff,
+	0x00f8, 0x00000000,
+	0x00fc, 0x00000000,
+	0x0100, 0x00000000,
+	0x0104, 0x00000000,
+	0x0108, 0x00000000,
+	0x010c, 0x02000000,
+	0x0110, 0x00000000,
+	0x0114, 0x00000000,
+	0x0118, 0xe6447800,
+	0x011c, 0x78000000,
+	0x0120, 0x010408d2,
+	0x0124, 0x00000000,
+	0x0128, 0x00000000,
+	0x0130, 0x00005fff,
+	0x0134, 0x00000000,
+	0x0138, 0x00000000,
+	0x013c, 0x00000000,
+	0x0140, 0x00000000,
+	0x0144, 0x00000000,
+	0x0148, 0x02000000,
+	0x014c, 0x00000000,
+	0x0150, 0x00000000,
+	0x0154, 0xe6447800,
+	0x0158, 0x78000000,
+	0x015c, 0x010408d2,
+	0x0160, 0x00000000,
+	0x0164, 0x00000000,
+	0x016c, 0x00005fff,
+	0x0170, 0x00000000,
+	0x0174, 0x00000000,
+	0x0178, 0x00000000,
+	0x017c, 0x00000000,
+	0x0180, 0x00000000,
+	0x0184, 0x02000000,
+	0x0188, 0x00000000,
+	0x018c, 0x00000000,
+	0x0190, 0xe6447800,
+	0x0194, 0x78000000,
+	0x0198, 0x010408d2,
+	0x019c, 0x00000000,
+	0x01a0, 0x00000000,
+	0x01a8, 0x00005fff,
+	0x01ac, 0x00000000,
+	0x01b0, 0x00000000,
+	0x01b4, 0x00000000,
+	0x01b8, 0x00000000,
+	0x01bc, 0x00000000,
+	0x01c0, 0x02000000,
+	0x01c4, 0x00000000,
+	0x01c8, 0x00000000,
+	0x01cc, 0xe6407800,
+	0x01d0, 0x78000000,
+	0x01d4, 0x010408d2,
+	0x01d8, 0x00000000,
+	0x01dc, 0x00000000,
+	0x01e4, 0x00005fff,
+	0x01e8, 0x00000000,
+	0x01ec, 0x00000000,
+	0x01f0, 0x00000000,
+	0x01f4, 0x00000000,
+	0x01f8, 0x00000000,
+	0x01fc, 0x02000000,
+	0x0200, 0x00000000,
+	0x0204, 0x00000000,
+	0x0208, 0x00000008,
+	0x020c, 0x0000000d,
+	0x41fc, 0x00000000,
+	0x4400, 0x00000000,
+	0x4410, 0x00000000,
+	0x4420, 0x00000000,
+	0x4430, 0x00000000,
+	0x4440, 0x00000000,
+	0x4450, 0x00000000,
+	0x4460, 0x00000000,
+	0x4470, 0x00000000,
+	0xf080, 0x00003018,
+	0xf084, 0x00000fff,
+	0xf800, 0x00000000,
+	0xf804, 0x00002e00,
+	0xf8d0, 0x00000001,
+	0xf8d4, 0x00000000,
+	0xff00, 0x00000301,
+	0xff0c, 0x01000000,
+	0xffe0, 0x00000000,
+	0xfff4, 0x00004011,
+	0x0090, 0x00000000,
+	0x0094, 0x00000000,
+	0x0098, 0x00000000,
+	0x009c, 0x3f3f3f3f,
+};
+
+int32_t aw9610x_check_chipid(void *data);
+int32_t aw9610x_init(struct aw_sar *p_sar);
+void aw9610x_deinit(struct aw_sar *p_sar);
+#endif
-- 
2.45.1



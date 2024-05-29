Return-Path: <linux-input+bounces-3945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD88D3709
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 15:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4DD01F268E5
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF842E554;
	Wed, 29 May 2024 13:06:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com [115.124.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557C49474;
	Wed, 29 May 2024 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988008; cv=none; b=lYA5lbkkf5FHSMosT+psvHxR6fAA9tjtgu0JGLi36XXwg46TNNg8Ks7LRdqtDvb5gPSDO0CBZVPqY2XFScuZJsElwZamLmRRcj8pNYufuYU6vRuxvag8MWIrHqbK+Sx6z9gL5FUYCrBtwbnXJH1pO+/BZ20vlUweQyMHmAojApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988008; c=relaxed/simple;
	bh=fUgaWG4YTG2UF6mO3IU0FJKp/bhoLLxuLpJiAM/Kdwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icAZS4UvCXwgjWJa+G48SyyRyC0HoW+O2VyD53rO2VurYY0tc4efN2LOobwZMqFfoOpXpFU9oodcUxgkNVTgfFTsiVDe1/hLhPi85vF14ZHsm0REtLnH/g/uBznfZNYG8NpQW8B3lZJ5Ps6MKuWKOVMsIpV3K3Q61NHeAoITPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0641415-0.000130344-0.935728;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037135125;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XqPpuGT_1716987991;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XqPpuGT_1716987991)
          by smtp.aliyun-inc.com;
          Wed, 29 May 2024 21:06:32 +0800
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
Subject: [PATCH V1 2/5] Add universal interface for the aw_sar driver.
Date: Wed, 29 May 2024 13:06:05 +0000
Message-ID: <20240529130608.783624-3-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240529130608.783624-1-wangshuaijie@awinic.com>
References: <20240529130608.783624-1-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: shuaijie wang <wangshuaijie@awinic.com>

Add i2c read-write interfaces and interfaces for parsing bin files.

Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
---
 .../misc/aw_sar/comm/aw_sar_chip_interface.h  |  27 +
 .../misc/aw_sar/comm/aw_sar_comm_interface.c  | 656 ++++++++++++++++++
 .../misc/aw_sar/comm/aw_sar_comm_interface.h  | 172 +++++
 drivers/input/misc/aw_sar/comm/aw_sar_type.h  | 396 +++++++++++
 4 files changed, 1251 insertions(+)
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_chip_interface.h
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.c
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.h
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_type.h

diff --git a/drivers/input/misc/aw_sar/comm/aw_sar_chip_interface.h b/drivers/input/misc/aw_sar/comm/aw_sar_chip_interface.h
new file mode 100644
index 000000000000..d406e48e8136
--- /dev/null
+++ b/drivers/input/misc/aw_sar/comm/aw_sar_chip_interface.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _SAR_SUPPORT_CHIP_H_
+#define _SAR_SUPPORT_CHIP_H_
+#include "aw_sar_type.h"
+
+enum aw_sar_driver_list_t {
+	AW_SAR_AW9610X,
+	AW_SAR_AW963XX,
+
+	AW_SAR_DRIVER_MAX,
+};
+
+int32_t aw9610x_check_chipid(void *data);
+int32_t aw9610x_init(struct aw_sar *p_sar);
+void aw9610x_deinit(struct aw_sar *p_sar);
+
+int32_t aw963xx_check_chipid(void *data);
+int32_t aw963xx_init(struct aw_sar *p_sar);
+void aw963xx_deinit(struct aw_sar *p_sar);
+
+
+static const struct aw_sar_driver_type g_aw_sar_driver_list[] = {
+	{ AW_SAR_AW9610X, aw9610x_check_chipid, aw9610x_init, aw9610x_deinit },
+	{ AW_SAR_AW963XX, aw963xx_check_chipid, aw963xx_init, aw963xx_deinit },
+};
+
+#endif
diff --git a/drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.c b/drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.c
new file mode 100644
index 000000000000..1d62ebb60acc
--- /dev/null
+++ b/drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.c
@@ -0,0 +1,656 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "aw_sar_comm_interface.h"
+
+#define AW_I2C_RW_RETRY_TIME_MIN		(2000)
+#define AW_I2C_RW_RETRY_TIME_MAX		(3000)
+#define AW_RETRIES				(5)
+
+static int32_t awinic_i2c_write(struct i2c_client *i2c, uint8_t *tr_data, uint16_t len)
+{
+	struct i2c_msg msg;
+
+	msg.addr = i2c->addr;
+	msg.flags = 0;
+	msg.len = len;
+	msg.buf = tr_data;
+
+	return i2c_transfer(i2c->adapter, &msg, 1);
+}
+
+static int32_t awinic_i2c_read(struct i2c_client *i2c, uint8_t *addr,
+				uint8_t addr_len, uint8_t *data, uint16_t data_len)
+{
+	struct i2c_msg msg[2];
+
+	msg[0].addr = i2c->addr;
+	msg[0].flags = 0;
+	msg[0].len = addr_len;
+	msg[0].buf = addr;
+
+	msg[1].addr = i2c->addr;
+	msg[1].flags = 1;
+	msg[1].len = data_len;
+	msg[1].buf = data;
+
+	return i2c_transfer(i2c->adapter, msg, 2);
+}
+
+/**
+ * @brief Read register interface
+ *
+ * @param i2c: i2c client.
+ * @param reg_addr16: 16 bit register address.
+ * @param *reg_data32: 32 bit register data.
+ * @return 0 if init succeeded.
+ */
+int32_t aw_sar_i2c_read(struct i2c_client *i2c, uint16_t reg_addr16,  uint32_t *reg_data32)
+{
+	uint8_t r_buf[6] = { 0 };
+	int8_t cnt = 5;
+	int32_t ret;
+
+	if (!i2c)
+		return -EINVAL;
+
+	r_buf[0] = (unsigned char)(reg_addr16 >> OFFSET_BIT_8);
+	r_buf[1] = (unsigned char)(reg_addr16);
+
+	do {
+		ret = awinic_i2c_read(i2c, r_buf, 2, &r_buf[2], 4);
+		if (ret < 0)
+			dev_err(&i2c->dev, "i2c read error reg: 0x%04x, ret= %d cnt= %d",
+					reg_addr16, ret, cnt);
+		else
+			break;
+		usleep_range(2000, 3000);
+	} while (cnt--);
+
+	if (cnt < 0) {
+		dev_err(&i2c->dev, "i2c read error!");
+		return ret;
+	}
+
+	*reg_data32 = ((uint32_t)r_buf[5] << OFFSET_BIT_0) | ((uint32_t)r_buf[4] << OFFSET_BIT_8) |
+		      ((uint32_t)r_buf[3] << OFFSET_BIT_16) | ((uint32_t)r_buf[2] << OFFSET_BIT_24);
+
+	return 0;
+}
+
+/**
+ * @brief write register interface
+ *
+ * @param i2c: i2c client.
+ * @param reg_addr16: 16 bit register address.
+ * @param reg_data32: 32 bit register data.
+ * @return 0 if init succeeded.
+ */
+int32_t aw_sar_i2c_write(struct i2c_client *i2c, uint16_t reg_addr16, uint32_t reg_data32)
+{
+	uint8_t w_buf[6] = { 0 };
+	int8_t cnt = 5;
+	int32_t ret;
+
+	if (!i2c)
+		return -EINVAL;
+
+	/*reg_addr*/
+	w_buf[0] = (uint8_t)(reg_addr16 >> OFFSET_BIT_8);
+	w_buf[1] = (uint8_t)(reg_addr16);
+	/*data*/
+	w_buf[2] = (uint8_t)(reg_data32 >> OFFSET_BIT_24);
+	w_buf[3] = (uint8_t)(reg_data32 >> OFFSET_BIT_16);
+	w_buf[4] = (uint8_t)(reg_data32 >> OFFSET_BIT_8);
+	w_buf[5] = (uint8_t)(reg_data32);
+
+	do {
+		ret = awinic_i2c_write(i2c, w_buf, ARRAY_SIZE(w_buf));
+		if (ret < 0) {
+			dev_err(&i2c->dev,
+					"i2c write error reg: 0x%04x data: 0x%08x, ret= %d cnt= %d",
+					reg_addr16, reg_data32, ret, cnt);
+		} else {
+			break;
+		}
+	} while (cnt--);
+
+	if (cnt < 0) {
+		dev_err(&i2c->dev, "i2c write error!");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * @brief Write the corresponding bit of the register
+ *
+ * @param i2c:i2c client.
+ * @param reg_addr16: 16 bit register address.
+ * @param mask: Write the corresponding bit as 0
+ * @param val: Write corresponding data to the register
+ * @return 0 if init succeeded.
+ */
+int32_t
+aw_sar_i2c_write_bits(struct i2c_client *i2c, uint16_t reg_addr16, uint32_t mask, uint32_t val)
+{
+	uint32_t reg_val;
+
+	aw_sar_i2c_read(i2c, reg_addr16, &reg_val);
+	reg_val &= mask;
+	reg_val |= (val & (~mask));
+	aw_sar_i2c_write(i2c, reg_addr16, reg_val);
+
+	return 0;
+}
+
+/**
+ * @brief Continuously write data to the chip
+ *
+ * @param i2c:i2c client.
+ * @param *tr_data: Data written
+ * @param len: Length of data written
+ * @return 0 if init succeeded.
+ */
+int32_t aw_sar_i2c_write_seq(struct i2c_client *i2c, uint8_t *tr_data, uint16_t len)
+{
+	int8_t cnt = AW_RETRIES;
+	int32_t ret;
+
+	do {
+		ret = awinic_i2c_write(i2c, tr_data, len);
+		if (ret < 0)
+			dev_err(&i2c->dev, "awinic i2c write seq error %d", ret);
+		else
+			break;
+		usleep_range(AW_I2C_RW_RETRY_TIME_MIN, AW_I2C_RW_RETRY_TIME_MAX);
+	} while (cnt--);
+
+	if (cnt < 0) {
+		dev_err(&i2c->dev, "awinic i2c write error!");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * @brief Continuously Read data from chip
+ *
+ * @param i2c:i2c client.
+ * @param *addr: Read address
+ * @param addr_len: Length of read address (byte)
+ * @param *data: Data written
+ * @param data_len: Length of data written
+ * @return 0 if init succeeded.
+ */
+int32_t aw_sar_i2c_read_seq(struct i2c_client *i2c, uint8_t *addr,
+				uint8_t addr_len, uint8_t *data, uint16_t data_len)
+{
+	int8_t cnt = AW_RETRIES;
+	int32_t ret;
+
+	do {
+		ret = awinic_i2c_read(i2c, addr, addr_len, data, data_len);
+		if (ret < 0)
+			dev_err(&i2c->dev, "awinic sar i2c write error %d", ret);
+		else
+			break;
+		usleep_range(AW_I2C_RW_RETRY_TIME_MIN, AW_I2C_RW_RETRY_TIME_MAX);
+	} while (cnt--);
+
+	if (cnt < 0) {
+		dev_err(&i2c->dev, "awinic sar i2c read error!");
+		return ret;
+	}
+
+	return 0;
+}
+
+/******************************Parse bin file code start****************************************/
+
+#define AWINIC_CODE_VERSION "V0.0.7-V1.0.4"  /* "code version"-"excel version" */
+
+enum bin_header_version_enum {
+	HEADER_VERSION_1_0_0 = 0x01000000,
+};
+
+enum data_type_enum {
+	DATA_TYPE_REGISTER = 0x00000000,
+	DATA_TYPE_DSP_REG = 0x00000010,
+	DATA_TYPE_DSP_CFG = 0x00000011,
+	DATA_TYPE_SOC_REG = 0x00000020,
+	DATA_TYPE_SOC_APP = 0x00000021,
+	DATA_TYPE_MULTI_BINS = 0x00002000,
+};
+
+#define BigLittleSwap16(A)	((((unsigned short int)(A) & 0xff00) >> 8) | \
+				(((unsigned short int)(A) & 0x00ff) << 8))
+
+#define BigLittleSwap32(A)	((((unsigned long)(A) & 0xff000000) >> 24) | \
+				(((unsigned long)(A) & 0x00ff0000) >> 8) | \
+				(((unsigned long)(A) & 0x0000ff00) << 8) | \
+				(((unsigned long)(A) & 0x000000ff) << 24))
+
+static int aw_parse_bin_header_1_0_0(struct aw_bin *bin);
+
+/**
+ *
+ * Interface function
+ *
+ * return value:
+ *       value = 0 :success;
+ *       value = -1 :check bin header version
+ *       value = -2 :check bin data type
+ *       value = -3 :check sum or check bin data len error
+ *       value = -4 :check data version
+ *       value = -5 :check register num
+ *       value = -6 :check dsp reg num
+ *       value = -7 :check soc app num
+ *       value = -8 :bin is NULL point
+ *
+ **/
+
+/********************************************************
+ *
+ * check sum data
+ *
+ ********************************************************/
+static enum aw_bin_err_val aw_check_sum(struct aw_bin *bin, int bin_num)
+{
+	unsigned char *p_check_sum;
+	unsigned int sum_data = 0;
+	unsigned int check_sum;
+	unsigned int i;
+
+	p_check_sum = &(bin->info.data[(bin->header_info[bin_num].valid_data_addr -
+			bin->header_info[bin_num].header_len)]);
+	check_sum = AW_SAR_GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
+				*(p_check_sum + 1), *(p_check_sum));
+
+	for (i = 4; i < bin->header_info[bin_num].bin_data_len +
+			bin->header_info[bin_num].header_len; i++)
+		sum_data += *(p_check_sum + i);
+
+	if (sum_data != check_sum) {
+		p_check_sum = NULL;
+		return AW_BIN_ERROR_SUM_OR_DATA_LEN;
+	}
+	p_check_sum = NULL;
+
+	return AW_BIN_ERROR_NONE;
+}
+
+static enum aw_bin_err_val aw_check_register_num_v1(struct aw_bin *bin, int bin_num)
+{
+	unsigned int check_register_num;
+	unsigned int parse_register_num;
+	char *p_check_sum;
+
+	p_check_sum =
+	    &(bin->info.data[(bin->header_info[bin_num].valid_data_addr)]);
+	parse_register_num = AW_SAR_GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
+					*(p_check_sum + 1), *(p_check_sum));
+	check_register_num = (bin->header_info[bin_num].bin_data_len - 4) /
+				(bin->header_info[bin_num].reg_byte_len +
+				bin->header_info[bin_num].data_byte_len);
+	if (parse_register_num != check_register_num) {
+		p_check_sum = NULL;
+		return AW_BIN_ERROR_REGISTER_NUM;
+	}
+	bin->header_info[bin_num].reg_num = parse_register_num;
+	bin->header_info[bin_num].valid_data_len = bin->header_info[bin_num].bin_data_len - 4;
+	p_check_sum = NULL;
+	bin->header_info[bin_num].valid_data_addr =
+	    bin->header_info[bin_num].valid_data_addr + 4;
+
+	return AW_BIN_ERROR_NONE;
+}
+
+static enum aw_bin_err_val aw_check_dsp_reg_num_v1(struct aw_bin *bin, int bin_num)
+{
+	unsigned int check_dsp_reg_num;
+	unsigned int parse_dsp_reg_num;
+	char *p_check_sum;
+
+	p_check_sum =
+	    &(bin->info.data[(bin->header_info[bin_num].valid_data_addr)]);
+	parse_dsp_reg_num = AW_SAR_GET_32_DATA(*(p_check_sum + 7),
+					*(p_check_sum + 6),
+					*(p_check_sum + 5),
+					*(p_check_sum + 4));
+	bin->header_info[bin_num].reg_data_byte_len =
+	    AW_SAR_GET_32_DATA(*(p_check_sum + 11), *(p_check_sum + 10),
+			*(p_check_sum + 9), *(p_check_sum + 8));
+	check_dsp_reg_num = (bin->header_info[bin_num].bin_data_len -
+				12) / bin->header_info[bin_num].reg_data_byte_len;
+	if (parse_dsp_reg_num != check_dsp_reg_num) {
+		p_check_sum = NULL;
+		return AW_BIN_ERROR_DSP_REG_NUM;
+	}
+	bin->header_info[bin_num].download_addr =
+	    AW_SAR_GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
+			*(p_check_sum + 1), *(p_check_sum));
+	bin->header_info[bin_num].reg_num = parse_dsp_reg_num;
+	bin->header_info[bin_num].valid_data_len = bin->header_info[bin_num].bin_data_len - 12;
+	p_check_sum = NULL;
+	bin->header_info[bin_num].valid_data_addr =
+	    bin->header_info[bin_num].valid_data_addr + 12;
+
+	return AW_BIN_ERROR_NONE;
+}
+
+static enum aw_bin_err_val aw_check_soc_app_num_v1(struct aw_bin *bin, int bin_num)
+{
+	unsigned int check_soc_app_num;
+	unsigned int parse_soc_app_num;
+	char *p_check_sum;
+
+	p_check_sum = &(bin->info.data[(bin->header_info[bin_num].valid_data_addr)]);
+	bin->header_info[bin_num].app_version = AW_SAR_GET_32_DATA(*(p_check_sum + 3),
+							    *(p_check_sum + 2),
+							    *(p_check_sum + 1),
+							    *(p_check_sum));
+	parse_soc_app_num = AW_SAR_GET_32_DATA(*(p_check_sum + 11), *(p_check_sum + 10),
+					*(p_check_sum + 9), *(p_check_sum + 8));
+	check_soc_app_num = bin->header_info[bin_num].bin_data_len - 12;
+	if (parse_soc_app_num != check_soc_app_num) {
+		p_check_sum = NULL;
+		return AW_BIN_ERROR_SOC_APP_NUM;
+	}
+	bin->header_info[bin_num].reg_num = parse_soc_app_num;
+	bin->header_info[bin_num].download_addr =
+	    AW_SAR_GET_32_DATA(*(p_check_sum + 7), *(p_check_sum + 6),
+			*(p_check_sum + 5), *(p_check_sum + 4));
+	bin->header_info[bin_num].valid_data_len =
+	    bin->header_info[bin_num].bin_data_len - 12;
+	p_check_sum = NULL;
+	bin->header_info[bin_num].valid_data_addr =
+	    bin->header_info[bin_num].valid_data_addr + 12;
+
+	return AW_BIN_ERROR_NONE;
+}
+
+/************************
+ *
+ ***bin header 1_0_0
+ ***
+ ************************/
+static void aw_get_single_bin_header_1_0_0(struct aw_bin *bin)
+{
+	int i;
+
+	bin->header_info[bin->all_bin_parse_num].header_len = 60;
+	bin->header_info[bin->all_bin_parse_num].check_sum =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 3), *(bin->p_addr + 2),
+			*(bin->p_addr + 1), *(bin->p_addr));
+	bin->header_info[bin->all_bin_parse_num].header_ver =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 7), *(bin->p_addr + 6),
+			*(bin->p_addr + 5), *(bin->p_addr + 4));
+	bin->header_info[bin->all_bin_parse_num].bin_data_type =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 11), *(bin->p_addr + 10),
+			*(bin->p_addr + 9), *(bin->p_addr + 8));
+	bin->header_info[bin->all_bin_parse_num].bin_data_ver =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 15), *(bin->p_addr + 14),
+			*(bin->p_addr + 13), *(bin->p_addr + 12));
+	bin->header_info[bin->all_bin_parse_num].bin_data_len =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 19), *(bin->p_addr + 18),
+			*(bin->p_addr + 17), *(bin->p_addr + 16));
+	bin->header_info[bin->all_bin_parse_num].ui_ver =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 23), *(bin->p_addr + 22),
+			*(bin->p_addr + 21), *(bin->p_addr + 20));
+	bin->header_info[bin->all_bin_parse_num].reg_byte_len =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 35), *(bin->p_addr + 34),
+			*(bin->p_addr + 33), *(bin->p_addr + 32));
+	bin->header_info[bin->all_bin_parse_num].data_byte_len =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 39), *(bin->p_addr + 38),
+			*(bin->p_addr + 37), *(bin->p_addr + 36));
+	bin->header_info[bin->all_bin_parse_num].device_addr =
+	    AW_SAR_GET_32_DATA(*(bin->p_addr + 43), *(bin->p_addr + 42),
+			*(bin->p_addr + 41), *(bin->p_addr + 40));
+	for (i = 0; i < 8; i++) {
+		bin->header_info[bin->all_bin_parse_num].chip_type[i] =
+		    *(bin->p_addr + 24 + i);
+	}
+//	bin->header_info[bin->all_bin_parse_num].chip_type[i] = '\0';
+//	DBG("enter chip_type is %s\n", bin->header_info[bin->all_bin_parse_num].chip_type);
+
+	bin->header_info[bin->all_bin_parse_num].reg_num = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].reg_data_byte_len = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].download_addr = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].app_version = 0x00000000;
+	bin->header_info[bin->all_bin_parse_num].valid_data_len = 0x00000000;
+	bin->all_bin_parse_num += 1;
+}
+
+static enum aw_bin_err_val aw_parse_each_of_multi_bins_1_0_0(unsigned int bin_num,
+		int bin_serial_num, struct aw_bin *bin)
+{
+	unsigned int bin_start_addr;
+	unsigned int valid_data_len;
+	enum aw_bin_err_val ret;
+
+	if (!bin_serial_num) {
+		bin_start_addr = AW_SAR_GET_32_DATA(*(bin->p_addr + 67),
+					     *(bin->p_addr + 66),
+					     *(bin->p_addr + 65),
+					     *(bin->p_addr + 64));
+		bin->p_addr += (60 + bin_start_addr);
+		bin->header_info[bin->all_bin_parse_num].valid_data_addr =
+		    bin->header_info[bin->all_bin_parse_num -
+				     1].valid_data_addr + 4 + 8 * bin_num + 60;
+	} else {
+		valid_data_len =
+		    bin->header_info[bin->all_bin_parse_num - 1].bin_data_len;
+		bin->p_addr += (60 + valid_data_len);
+		bin->header_info[bin->all_bin_parse_num].valid_data_addr =
+		    bin->header_info[bin->all_bin_parse_num -
+				     1].valid_data_addr +
+		    bin->header_info[bin->all_bin_parse_num - 1].bin_data_len +
+		    60;
+	}
+
+	ret = aw_parse_bin_header_1_0_0(bin);
+	return ret;
+}
+
+/* Get the number of bins in multi bins, and set a for loop, loop processing each bin data */
+static enum aw_bin_err_val aw_get_multi_bin_header_1_0_0(struct aw_bin *bin)
+{
+	unsigned int bin_num;
+	enum aw_bin_err_val ret;
+	int i;
+
+	bin_num = AW_SAR_GET_32_DATA(*(bin->p_addr + 63),
+			      *(bin->p_addr + 62),
+			      *(bin->p_addr + 61), *(bin->p_addr + 60));
+	if (bin->multi_bin_parse_num == 1)
+		bin->header_info[bin->all_bin_parse_num].valid_data_addr = 60;
+	aw_get_single_bin_header_1_0_0(bin);
+
+	for (i = 0; i < bin_num; i++) {
+		ret = aw_parse_each_of_multi_bins_1_0_0(bin_num, i, bin);
+		if (ret < 0)
+			return ret;
+	}
+	return AW_BIN_ERROR_NONE;
+}
+
+/********************************************************
+ *
+ * If the bin framework header version is 1.0.0,
+ * determine the data type of bin, and then perform different processing
+ * according to the data type
+ * If it is a single bin data type, write the data directly into the structure array
+ * If it is a multi-bin data type, first obtain the number of bins,
+ * and then recursively call the bin frame header processing function
+ * according to the bin number to process the frame header information of each bin separately
+ *
+ ********************************************************/
+static enum aw_bin_err_val aw_parse_bin_header_1_0_0(struct aw_bin *bin)
+{
+	unsigned int bin_data_type;
+	enum aw_bin_err_val ret;
+
+	bin_data_type = AW_SAR_GET_32_DATA(*(bin->p_addr + 11),
+				    *(bin->p_addr + 10),
+				    *(bin->p_addr + 9), *(bin->p_addr + 8));
+	switch (bin_data_type) {
+	case DATA_TYPE_REGISTER:
+	case DATA_TYPE_DSP_REG:
+	case DATA_TYPE_SOC_APP:
+		// Divided into two processing methods,
+		// one is single bin processing,
+		// and the other is single bin processing in multi bin
+		bin->single_bin_parse_num += 1;
+		if (!bin->multi_bin_parse_num)
+			bin->header_info[bin->all_bin_parse_num].valid_data_addr = 60;
+		aw_get_single_bin_header_1_0_0(bin);
+		break;
+	case DATA_TYPE_MULTI_BINS:
+		/* Get the number of times to enter multi bins */
+		bin->multi_bin_parse_num += 1;
+		ret = aw_get_multi_bin_header_1_0_0(bin);
+		if (ret < 0)
+			return ret;
+		break;
+	default:
+		return AW_BIN_ERROR_DATA_TYPE;
+	}
+	return AW_BIN_ERROR_NONE;
+}
+
+/* get the bin's header version */
+static enum aw_bin_err_val aw_check_bin_header_version(struct aw_bin *bin)
+{
+	unsigned int header_version;
+	enum aw_bin_err_val ret;
+
+	header_version = AW_SAR_GET_32_DATA(*(bin->p_addr + 7), *(bin->p_addr + 6),
+				     *(bin->p_addr + 5), *(bin->p_addr + 4));
+
+
+	// Write data to the corresponding structure array
+	// according to different formats of the bin frame header version
+	switch (header_version) {
+	case HEADER_VERSION_1_0_0:
+		ret = aw_parse_bin_header_1_0_0(bin);
+		return ret;
+	default:
+		return AW_BIN_ERROR_HEADER_VERSION;
+	}
+}
+
+/**
+ * @brief Parse bin file
+ *
+ * @param bin: Store the contents of the parsed bin file
+ * @return 0 if init succeeded, other if error
+ */
+enum aw_bin_err_val aw_sar_parsing_bin_file(struct aw_bin *bin)
+{
+	enum aw_bin_err_val ret;
+	int i;
+
+	if (!bin)
+		return AW_BIN_ERROR_NULL_POINT;
+	bin->p_addr = bin->info.data;
+	bin->all_bin_parse_num = 0;
+	bin->multi_bin_parse_num = 0;
+	bin->single_bin_parse_num = 0;
+
+	/* filling bins header info */
+	ret = aw_check_bin_header_version(bin);
+	if (ret < 0)
+		return ret;
+	bin->p_addr = NULL;
+
+	/* check bin header info */
+	for (i = 0; i < bin->all_bin_parse_num; i++) {
+		/* check sum */
+		ret = aw_check_sum(bin, i);
+		if (ret < 0)
+			return ret;
+
+		/* check register num */
+		if (bin->header_info[i].bin_data_type == DATA_TYPE_REGISTER) {
+			ret = aw_check_register_num_v1(bin, i);
+			if (ret < 0)
+				return ret;
+			/* check dsp reg num */
+		} else if (bin->header_info[i].bin_data_type == DATA_TYPE_DSP_REG) {
+			ret = aw_check_dsp_reg_num_v1(bin, i);
+			if (ret < 0)
+				return ret;
+			/* check soc app num */
+		} else if (bin->header_info[i].bin_data_type == DATA_TYPE_SOC_APP) {
+			ret = aw_check_soc_app_num_v1(bin, i);
+			if (ret < 0)
+				return ret;
+		} else {
+			bin->header_info[i].valid_data_len = bin->header_info[i].bin_data_len;
+		}
+	}
+
+	return AW_BIN_ERROR_NONE;
+}
+/*********************************Parse bin file code end************************************/
+
+/**
+ * @brief Calculate the second power
+ *
+ * @param cnt: ifrequency
+ * @return the second power
+ */
+uint32_t aw_sar_pow2(uint32_t cnt)
+{
+	uint32_t sum = 1;
+	uint32_t i;
+
+	if (cnt == 0) {
+		sum = 1;
+	} else {
+		for (i = 0; i < cnt; i++)
+			sum *= 2;
+	}
+
+	return sum;
+}
+
+/**
+ * @brief Calculate the second power
+ *
+ * @param *aw_bin: Information after parsing bin file
+ * @param *i2c: i2c client.
+ * @return 0 if init succeeded.
+ */
+int32_t aw_sar_load_reg(struct aw_bin *aw_bin, struct i2c_client *i2c)
+{
+	uint32_t start_addr = aw_bin->header_info[0].valid_data_addr;
+	uint16_t reg_addr;
+	uint32_t reg_data;
+	int32_t ret;
+	uint32_t i;
+
+	for (i = 0; i < aw_bin->header_info[0].valid_data_len; i += 6, start_addr += 6) {
+		reg_addr = (aw_bin->info.data[start_addr]) |
+				aw_bin->info.data[start_addr + 1] << OFFSET_BIT_8;
+		reg_data = aw_bin->info.data[start_addr + 2] |
+			(aw_bin->info.data[start_addr + 3] << OFFSET_BIT_8) |
+			(aw_bin->info.data[start_addr + 4] << OFFSET_BIT_16) |
+			(aw_bin->info.data[start_addr + 5] << OFFSET_BIT_24);
+
+		ret = aw_sar_i2c_write(i2c, reg_addr, reg_data);
+		if (ret < 0) {
+			dev_err(&i2c->dev, "i2c write err");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void aw_sar_delay_ms(uint32_t ms)
+{
+	mdelay(ms);
+}
+
diff --git a/drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.h b/drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.h
new file mode 100644
index 000000000000..6f35193f2aee
--- /dev/null
+++ b/drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _AW_SAR_PLAT_HW_INTERFACE_H_
+#define _AW_SAR_PLAT_HW_INTERFACE_H_
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/of_gpio.h>
+#include <linux/power_supply.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+enum aw_sar_chip_list_t {
+	AW_SAR_NONE_CHECK_CHIP,
+
+	SAR_AW9610X = 1 << 1,
+	SAR_AW9610XA = 1 << 2,
+
+	SAR_AW96303 = 1 << 6,
+	SAR_AW96305 = 1 << 7,
+	SAR_AW96308 = 1 << 8,
+	SAR_AW96310 = 1 << 9,
+	SAR_AW96312 = 1 << 10,
+};
+
+enum AW_SAR_UPDATE_FW_MODE {
+	PROT_UPDATE_FW,
+	REG_UPDATE_FW,
+};
+
+#ifndef AW_TRUE
+#define AW_TRUE					(1)
+#endif
+
+#ifndef AW_FALSE
+#define AW_FALSE				(0)
+#endif
+
+#define AW_ERR_IRQ_INIT_OVER			(0xAA)
+
+enum aw_sar_rst_val {
+	AW_OK,
+	AW_BIN_PARA_INVALID,
+	AW_PROT_UPDATE_ERR,
+	AW_REG_LOAD_ERR,
+};
+
+#ifndef OFFSET_BIT_0
+#define OFFSET_BIT_0				(0)
+#endif
+
+#ifndef OFFSET_BIT_8
+#define OFFSET_BIT_8				(8)
+#endif
+
+#ifndef OFFSET_BIT_16
+#define OFFSET_BIT_16				(16)
+#endif
+
+#ifndef OFFSET_BIT_24
+#define OFFSET_BIT_24				(24)
+#endif
+
+#define AW_SAR_GET_32_DATA(w, x, y, z)	((unsigned int)(((w) << 24) | ((x) << 16) | ((y) << 8) | (z)))
+
+enum AW_SAR_HOST_IRQ_STAT {
+	IRQ_ENABLE,
+	IRQ_DISABLE,
+};
+
+#define AW_SAR_BIN_NUM_MAX   100
+
+enum aw_bin_err_val {
+	AW_BIN_ERROR_NONE = 0,
+	AW_BIN_ERROR_HEADER_VERSION = -1,
+	AW_BIN_ERROR_DATA_TYPE = -2,
+	AW_BIN_ERROR_SUM_OR_DATA_LEN = -3,
+	AW_BIN_ERROR_DATA_VERSION = -4,
+	AW_BIN_ERROR_REGISTER_NUM = -5,
+	AW_BIN_ERROR_DSP_REG_NUM = -6,
+	AW_BIN_ERROR_SOC_APP_NUM = -7,
+	AW_BIN_ERROR_NULL_POINT = -8,
+};
+
+/**
+ * struct bin_header_info -
+ * @header_len: Frame header length
+ * @check_sum: Frame header information-Checksum
+ * @header_ver: Frame header information-Frame header version
+ * @bin_data_type: Frame header information-Data type
+ * @bin_data_ver: Frame header information-Data version
+ * @bin_data_len: Frame header information-Data length
+ * @ui_ver: Frame header information-ui version
+ * @chip_type: Frame header information-chip type
+ * @reg_byte_len: Frame header information-reg byte len
+ * @data_byte_len: Frame header information-data byte len
+ * @device_addr: Frame header information-device addr
+ * @valid_data_len: Length of valid data obtained after parsing
+ * @valid_data_addr: The offset address of the valid data obtained
+ *    after parsing relative to info
+ * @reg_num: The number of registers obtained after parsing
+ * @reg_data_byte_len: The byte length of the register obtained after parsing
+ * @download_addr: The starting address or download address obtained after parsing
+ * @app_version: The software version number obtained after parsing
+ */
+struct bin_header_info {
+	unsigned int header_len;
+	unsigned int check_sum;
+	unsigned int header_ver;
+	unsigned int bin_data_type;
+	unsigned int bin_data_ver;
+	unsigned int bin_data_len;
+	unsigned int ui_ver;
+	unsigned char chip_type[8];
+	unsigned int reg_byte_len;
+	unsigned int data_byte_len;
+	unsigned int device_addr;
+	unsigned int valid_data_len;
+	unsigned int valid_data_addr;
+	unsigned int reg_num;
+	unsigned int reg_data_byte_len;
+	unsigned int download_addr;
+	unsigned int app_version;
+};
+
+/**
+ * struct bin_container -
+ * @len: The size of the bin file obtained from the firmware
+ * @data: Store the bin file obtained from the firmware
+ */
+struct bin_container {
+	unsigned int len;
+	unsigned char data[];
+};
+
+/**
+ * struct aw_bin -
+ * @p_addr: Offset pointer (backward offset pointer to obtain frame header information and
+ *    important information)
+ * @all_bin_parse_num: The number of all bin files
+ * @multi_bin_parse_num: The number of single bin files
+ * @single_bin_parse_num: The number of multiple bin files
+ * @header_info: Frame header information and
+ *    other important data obtained after parsing
+ * @info: Obtained bin file data that needs to be parsed
+ */
+struct aw_bin {
+	char *p_addr;
+	unsigned int all_bin_parse_num;
+	unsigned int multi_bin_parse_num;
+	unsigned int single_bin_parse_num;
+	struct bin_header_info header_info[AW_SAR_BIN_NUM_MAX];
+	struct bin_container info;
+};
+
+//I2C communication API
+extern int32_t aw_sar_i2c_read(struct i2c_client *i2c, uint16_t reg_addr16,  uint32_t *reg_data32);
+extern int32_t aw_sar_i2c_write(struct i2c_client *i2c, uint16_t reg_addr16, uint32_t reg_data32);
+extern int32_t aw_sar_i2c_write_bits(struct i2c_client *i2c, uint16_t reg_addr16,
+		uint32_t mask, uint32_t val);
+extern int32_t aw_sar_i2c_write_seq(struct i2c_client *i2c, uint8_t *tr_data, uint16_t len);
+extern int32_t aw_sar_i2c_read_seq(struct i2c_client *i2c, uint8_t *addr,
+		uint8_t addr_len, uint8_t *data, uint16_t data_len);
+extern void aw_sar_delay_ms(uint32_t ms);
+
+extern enum aw_bin_err_val aw_sar_parsing_bin_file(struct aw_bin *bin);
+extern uint32_t aw_sar_pow2(uint32_t cnt);
+extern int32_t aw_sar_load_reg(struct aw_bin *aw_bin, struct i2c_client *i2c);
+
+#endif
diff --git a/drivers/input/misc/aw_sar/comm/aw_sar_type.h b/drivers/input/misc/aw_sar/comm/aw_sar_type.h
new file mode 100644
index 000000000000..8f217f8e21dd
--- /dev/null
+++ b/drivers/input/misc/aw_sar/comm/aw_sar_type.h
@@ -0,0 +1,396 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _SAR_TYPE_H_
+#define _SAR_TYPE_H_
+
+#include "aw_sar_comm_interface.h"
+
+typedef int32_t (*aw_sar_chip_other_operation_t)(void *data);
+typedef void (*aw_sar_chip_other_opera_free_t)(void *data);
+
+enum aw_i2c_flags {
+	AW_SAR_I2C_WR,
+	AW_SAR_I2C_RD,
+	AW_SAR_PACKAGE_RD,
+};
+
+enum sar_health_check {
+	AW_SAR_HEALTHY = 0,
+	AW_SAR_UNHEALTHY = 1,
+};
+typedef int32_t (*aw_sar_bin_opera_t)(struct aw_bin *aw_bin, void *load_bin_para);
+typedef int32_t (*aw_sar_bin_load_fail_opera_t)(struct aw_bin *aw_bin, void *load_bin_para);
+
+struct aw_sar_get_chip_info_t {
+	void (*p_get_chip_info_node_fn)(void *data, char *buf, ssize_t *p_len);
+};
+
+struct aw_sar_load_bin_t {
+	const uint8_t *bin_name;
+	aw_sar_bin_opera_t bin_opera_func;
+	aw_sar_bin_load_fail_opera_t bin_load_fail_opera;
+
+	void (*p_get_prot_update_fw_node_fn)(void *data, char *buf, ssize_t *p_len);
+
+	/*Perform different operations to update parameters*/
+	int32_t (*p_update_fn)(void *data);
+};
+
+struct aw_sar_reg_data {
+	unsigned char rw;
+	unsigned short reg;
+};
+
+struct aw_sar_awrw_t {
+	ssize_t (*p_set_awrw_node_fn)(void *data, const char *buf, size_t count);
+	ssize_t (*p_get_awrw_node_fn)(void *data, char *buf);
+};
+
+struct aw_sar_reg_list_t {
+	uint8_t reg_none_access;
+	uint8_t reg_rd_access;
+	uint8_t reg_wd_access;
+	const struct aw_sar_reg_data *reg_perm;
+	uint32_t reg_num;
+};
+
+typedef void (*aw_sar_update_work_t)(struct work_struct *work);
+struct aw_sar_update_static_t {
+	aw_sar_update_work_t update_work_func;
+	uint32_t delay_ms;
+};
+
+typedef irqreturn_t (*aw_sar_irq_t)(int irq, void *data);
+typedef uint32_t (*sar_rc_irqscr_t)(void *i2c);
+/*
+ * If the return value is 1, there is an initialization completion interrupt;
+ * if the return value is 0, there is no
+ */
+typedef uint32_t (*aw_sar_is_init_over_irq)(uint32_t irq_status);
+typedef void (*aw_sar_irq_spec_handler_t)(uint32_t irq_status, void *data);
+
+struct aw_sar_check_chipid_t {
+	/*Read chipid and check chipid, Must be implemented externally*/
+	int32_t (*p_check_chipid_fn)(void *data);
+};
+
+struct aw_sar_irq_init_t {
+	unsigned long flags;
+	unsigned long irq_flags;
+	irq_handler_t handler;
+	irq_handler_t thread_fn;
+	/*Interrupt processing parameters*/
+	sar_rc_irqscr_t rc_irq_fn;
+	//aw_sar_is_init_over_irq is_init_over_irq_fn;
+	aw_sar_irq_spec_handler_t irq_spec_handler_fn;
+
+	/*Use a different initialization interrupt to initialize the operation*/
+	int32_t (*p_irq_init_fn)(void *data);
+	/*Release interrupt resource*/
+//	void const (*p_irq_deinit_fn)(void *data);
+	int (*p_irq_deinit_fn)(void *data);
+};
+
+struct aw_sar_pm_t {
+	uint32_t suspend_set_mode;
+	uint32_t resume_set_mode;
+	uint32_t shutdown_set_mode;
+	//system api
+	int32_t (*p_suspend_fn)(void *data);
+	int32_t (*p_resume_fn)(void *data);
+	int32_t (*p_shutdown_fn)(void *data);
+};
+
+struct aw_sar_chip_mode_t {
+	uint32_t init_mode;
+	uint32_t active;
+	uint32_t pre_init_mode;
+};
+
+struct aw_sar_regulator_config_t {
+	//Note that "_sar_num" after VCC name is defined by SAR C auto add
+	const uint8_t *vcc_name;
+	int32_t min_uV;
+	int32_t max_uV;
+};
+
+struct aw_channels_info {
+	uint16_t used;
+	uint32_t last_channel_info;
+	struct input_dev *input;
+	uint8_t name[20];
+};
+
+struct aw_sar_dts_info {
+	uint32_t sar_num;
+	int32_t irq_gpio;
+	uint32_t channel_use_flag;
+	bool use_regulator_flag;
+	bool use_inter_pull_up;
+	bool use_pm;
+	bool update_fw_flag;
+	bool use_plug_cail_flag;
+	bool monitor_esd_flag;
+};
+
+struct aw_sar_irq_init_comm_t {
+	int32_t to_irq;
+	uint8_t host_irq_stat;
+	void *data;
+	uint8_t label[30];
+	uint8_t dev_id[30];
+};
+
+struct aw_sar_load_bin_comm_t {
+	uint8_t bin_name[30];
+	uint32_t bin_data_ver;
+	aw_sar_bin_opera_t bin_opera_func;
+	aw_sar_bin_load_fail_opera_t bin_load_fail_opera_func;
+};
+
+struct aw_awrw_info {
+	uint8_t rw_flag;
+	uint8_t addr_len;
+	uint8_t data_len;
+	uint8_t reg_num;
+	uint32_t i2c_tranfar_data_len;
+	uint8_t *p_i2c_tranfar_data;
+};
+
+/****************mode set start******************/
+typedef void (*sar_enable_clock_t)(void *i2c);
+typedef void (*sar_operation_irq_t)(int to_irq);
+typedef void (*sar_mode_update_t)(void *i2c);
+
+struct aw_sar_mode_switch_ops {
+	sar_enable_clock_t enable_clock;
+	sar_rc_irqscr_t rc_irqscr;
+	sar_mode_update_t mode_update;
+};
+
+struct aw_sar_chip_mode {
+	uint8_t curr_mode;
+	uint8_t last_mode;
+};
+
+struct aw_sar_mode_set_t {
+	uint8_t chip_id;
+	struct aw_sar_chip_mode chip_mode;
+	struct aw_sar_mode_switch_ops mode_switch_ops;
+};
+
+struct aw_sar_mode_t {
+	const struct aw_sar_mode_set_t *mode_set_arr;
+	uint8_t mode_set_arr_len;
+	ssize_t (*p_set_mode_node_fn)(void *data, uint8_t curr_mode);
+	ssize_t (*p_get_mode_node_fn)(void *data, char *buf);
+};
+/********************mode set end****************/
+
+struct aw_sar_init_over_irq_t {
+	int16_t wait_times;
+	uint8_t daley_step;
+	uint32_t reg_irqsrc;
+	uint32_t irq_offset_bit;
+	uint32_t irq_mask;
+	uint32_t irq_flag;
+	/*
+	 * Perform different verification initialization
+	 * to complete the interrupt operation
+	 */
+	int32_t (*p_check_init_over_irq_fn)(void *data);
+	/*
+	 * When initialization fails, get the corresponding error type and
+	 * apply it to the chip with flash
+	 */
+	int32_t (*p_get_err_type_fn)(void *data);
+};
+
+struct aw_sar_soft_rst_t {
+	uint16_t reg_rst;
+	uint32_t reg_rst_val;
+	uint32_t delay_ms;
+	/*Perform different soft reset operations*/
+	int32_t (*p_soft_reset_fn)(void *data);
+};
+
+struct aw_sar_aot_t {
+	uint32_t aot_reg;
+	uint32_t aot_mask;
+	uint32_t aot_flag;
+	ssize_t (*p_set_aot_node_fn)(void *data);
+};
+
+struct aw_sar_diff_t {
+	uint16_t diff0_reg;
+	uint16_t diff_step;
+	//Data format:S21.10, Floating point types generally need to be removed
+	uint32_t rm_float;
+	ssize_t (*p_get_diff_node_fn)(void *data, char *buf);
+};
+
+struct aw_sar_offset_t {
+	ssize_t (*p_get_offset_node_fn)(void *data, char *buf);
+};
+
+struct aw_sar_pinctrl {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *default_sta;
+	struct pinctrl_state *int_out_high;
+	struct pinctrl_state *int_out_low;
+};
+
+//update reg node
+struct aw_sar_para_load_t {
+	const uint32_t *reg_arr;
+	uint32_t reg_arr_len;
+};
+
+struct aw_sar_platform_config {
+	/*The chip needs to parse more DTS contents for addition*/
+	int32_t (*p_add_parse_dts_fn)(void *data);
+
+	const struct aw_sar_regulator_config_t *p_regulator_config;
+
+	/*The chip needs to add more nodes*/
+	int32_t (*p_add_node_create_fn)(void *data);
+	/*Release the added node*/
+	int32_t (*p_add_node_free_fn)(void *data);
+
+	/*Use a different initialization interrupt to initialize the operation*/
+	int32_t (*p_input_init_fn)(void *data);
+	/*Release input resource*/
+	int32_t (*p_input_deinit_fn)(void *data);
+
+	//The parameters passed in are required for interrupt initialization
+	const struct aw_sar_irq_init_t *p_irq_init;
+
+	//The chip is set to different modes in different power management interfaces
+	const struct aw_sar_pm_t *p_pm_chip_mode;
+};
+
+struct aw_sar_power_on_prox_detection_t {
+	//en_flag is true enable
+	void (*p_power_on_prox_detection_en_fn)(void *data, uint8_t en_flag);
+	uint32_t irq_en_cali_bit;
+	uint8_t power_on_prox_en_flag;
+};
+
+
+/*Parameter passed in by different SAR sensors.
+ *It must be implemented in each sensor code.
+ *If it is not necessary that some members can be assigned null,
+ *the corresponding function will not be implemented
+ */
+struct aw_sar_chip_config {
+	uint8_t ch_num_max; //Number of channels of the chip
+
+	//Chip related platform content configuration
+	const struct aw_sar_platform_config *p_platform_config;
+	//Parameters required for verification of chipid
+	const struct aw_sar_check_chipid_t *p_check_chipid;
+	//Parameters required for soft reset
+	const struct aw_sar_soft_rst_t *p_soft_rst;
+	//Verify the parameters required to initialize a complete interrupt
+	const struct aw_sar_init_over_irq_t *p_init_over_irq;
+	//Parameters required for load boot bin file,
+	//If the chip does not have flash, please ignore and assign the value to null
+	const struct aw_sar_load_bin_t *p_fw_bin;
+	//Parameters required for load register bin file
+	const struct aw_sar_load_bin_t *p_reg_bin;
+	//The mode set before and after the initialization of the chip
+	const struct aw_sar_chip_mode_t *p_chip_mode;
+
+	//Node usage parameters
+	//Register permission table
+	const struct aw_sar_reg_list_t *p_reg_list;
+	//Default register table
+	const struct aw_sar_para_load_t *p_reg_arr;
+	//Parameters required for set Auto-Offset-Tuning(aot)
+	const struct aw_sar_aot_t *p_aot;
+	//Parameters required for get chip diff val
+	const struct aw_sar_diff_t *p_diff;
+	//Parameters required for get chip offset val
+	const struct aw_sar_offset_t *p_offset;
+	//Set the parameters of different working modes of the chip
+	const struct aw_sar_mode_t *p_mode;
+	//Upgrading firmware using the debug node protocol
+	const struct aw_sar_load_bin_t *p_prox_fw;
+	//Upgrading firmware using the debug node reg
+	const struct aw_sar_load_bin_t *p_reg_fw;
+	//Obtain the necessary information of the chip
+	const struct aw_sar_get_chip_info_t *p_get_chip_info;
+	//Continuous read/write register interface
+	const struct aw_sar_awrw_t *p_aw_sar_awrw;
+	//Parameters required for load boot bin file,
+	//If the chip does not have flash, please ignore and assign the value to null
+	const struct aw_sar_load_bin_t *p_boot_bin;
+
+	/*Other operations during initialization, Add according to different usage*/
+	aw_sar_chip_other_operation_t p_other_operation;
+	/*If requested by resources, please release*/
+	aw_sar_chip_other_opera_free_t p_other_opera_free;
+
+	const struct aw_sar_power_on_prox_detection_t *power_on_prox_detection;
+};
+
+struct aw_sar {
+	struct i2c_client *i2c;
+	struct device *dev;
+	struct regulator *vcc;
+	struct delayed_work update_work;
+	//Set pin pull-up mode
+	struct aw_sar_pinctrl pinctrl;
+	/* eds work */
+	struct delayed_work monitor_work;
+	struct workqueue_struct *monitor_wq;
+
+	uint8_t chip_type;
+	uint8_t chip_name[20];
+
+	bool power_enable;
+	bool fw_fail_flag;
+	uint8_t last_mode;
+
+	/*handler_anomalies*/
+	uint8_t fault_flag;
+	uint8_t driver_code_initover_flag;
+	/*handler_anomalies*/
+
+	uint8_t ret_val;
+	uint8_t curr_use_driver_type;
+	int32_t prot_update_state;
+
+	uint8_t aot_irq_num;
+	uint8_t enter_irq_handle_num;
+	uint8_t exit_power_on_prox_detection;
+
+	struct work_struct ps_notify_work;
+	struct notifier_block ps_notif;
+	bool ps_is_present;
+
+	//Parameters related to platform logic
+	struct aw_sar_dts_info dts_info;
+	struct aw_sar_load_bin_comm_t load_bin;
+	struct aw_sar_irq_init_comm_t irq_init;
+	struct aw_awrw_info awrw_info;
+	struct aw_channels_info *channels_arr;
+
+	//Private arguments required for public functions
+	const struct aw_sar_chip_config *p_sar_para;
+	//Private arguments required for private functions
+	void *priv_data;
+};
+
+//Determine whether the chip exists by verifying chipid
+typedef int32_t (*aw_sar_who_am_i_t)(void *data);
+typedef int32_t (*aw_sar_chip_init_t)(struct aw_sar *p_sar);
+typedef void (*aw_sar_chip_deinit_t)(struct aw_sar *p_sar);
+
+struct aw_sar_driver_type {
+	uint8_t driver_type;
+	aw_sar_who_am_i_t p_who_am_i;
+	aw_sar_chip_init_t p_chip_init;
+	aw_sar_chip_deinit_t p_chip_deinit;
+};
+
+#endif
-- 
2.45.1



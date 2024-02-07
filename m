Return-Path: <linux-input+bounces-1718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BD84C16C
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 01:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AD6A286F62
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 00:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FC22F58;
	Wed,  7 Feb 2024 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RqIZr1pi"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB67F9;
	Wed,  7 Feb 2024 00:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266224; cv=none; b=sbRtdFwOE07XqOa4QvJURj8wv3Od/IprtJjcZzpeiVP2I+G4p7aIJi2Ret2cYFEPc4dJYmoCM7xobo87gizsbm9+XLmMlDnA5iOwGG/rZE/xEY+rliPiXoK9oSe6ctQY3bX2iNT9vPcoM52+ELBRSLEjLnEodcyqP2vGCPTWrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266224; c=relaxed/simple;
	bh=7y/4ViLPRGYrOSjsVVRy5ZBw28bs66ApuJPZ44shogQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOxEv+CTSQLdNbj7NdMEvDx7rINUsLqgdsYO1ynfceJ926NiHkF5+NaxWeXop4z5uxTe6/LuuRV0Iyp+LSLflZPtyh8QE/r8h4AmxTczIheEtEo4Emy9k/khRy10uJ37a5xZTRyoXYC7C5aJQz8gesNdfvPWQ7VL89rsyJwETso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RqIZr1pi; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416AS7SJ031521;
	Tue, 6 Feb 2024 18:36:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=r8SgbSU5Bb16oL6hwjfXq9bAlM6A6aG75rHFr3z9GMk=; b=
	RqIZr1pi9Jaf81mKDNVOPjfi05wi4uz7Lizs6GxlIqqZe0q0d10QoQ/ppESa0vst
	b4BifBn1wWx7u8WgG55gVj/u+J0DmBshxrJa15CKSYbqUsgYH4LSUdePX877RdYf
	DsFn7AFzn8VPNTttBj4c+yHzKKufr1sYmZolnvLUmw4ebs/udERp0/v2l11dxwzu
	u3OveVj2UKXbfQLeS+o5pbQTi21ldORRDRZ3u8Dqr45i2WWbCvXbjFFOsljg6ToP
	dL0vSigx5mRSeysD34XlzDDap1aZR/j7fhMgvCSMQ+hYI0vcRYmkpqkayHPb16ai
	ZNazu1Bc5ytXqjIS955VTA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2cbgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 18:36:54 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 00:36:51 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 7 Feb 2024 00:36:51 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3DE8A820247;
	Wed,  7 Feb 2024 00:36:50 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v6 4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
Date: Wed, 7 Feb 2024 00:36:11 +0000
Message-ID: <20240207003612.4187370-5-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
References: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: W3k3SO7VX5shIGXYiVyVeRVvIPn7OGNq
X-Proofpoint-ORIG-GUID: W3k3SO7VX5shIGXYiVyVeRVvIPn7OGNq
X-Proofpoint-Spam-Reason: safe

Introduce support for Cirrus Logic Device CS40L50: a
haptic driver with waveform memory, integrated DSP,
and closed-loop algorithms.

The input driver provides the interface for control of
haptic effects through the device.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
v6:
Please advise if playback stop is still misused with respect to not
specifying an effect, and if so what the best solution would be. The
device can only play one effect at a time, but setting max effects
for the EVIOCGEFFECTS ioctl to 1 would restrict the number of
uploads to 1 as well. Is there an alternative solution here? And
please correct my wrong assumptions if there are any.

 MAINTAINERS                        |   1 +
 drivers/input/misc/Kconfig         |  10 +
 drivers/input/misc/Makefile        |   1 +
 drivers/input/misc/cs40l50-vibra.c | 571 +++++++++++++++++++++++++++++
 4 files changed, 583 insertions(+)
 create mode 100644 drivers/input/misc/cs40l50-vibra.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 69a9e0a3b968..24cfb4f017bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4940,6 +4940,7 @@ M:	Ben Bright <ben.bright@cirrus.com>
 L:	patches@opensource.cirrus.com
 S:	Supported
 F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
+F:	drivers/input/misc/cs40l*
 F:	drivers/mfd/cs40l*
 F:	include/linux/mfd/cs40l*
 
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6ba984d7f0b1..ee45dbb0636e 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -140,6 +140,16 @@ config INPUT_BMA150
 	  To compile this driver as a module, choose M here: the
 	  module will be called bma150.
 
+config INPUT_CS40L50_VIBRA
+	tristate "CS40L50 Haptic Driver support"
+	depends on MFD_CS40L50_CORE
+	help
+	  Say Y here to enable support for Cirrus Logic's CS40L50
+	  haptic driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called cs40l50-vibra.
+
 config INPUT_E3X0_BUTTON
 	tristate "NI Ettus Research USRP E3xx Button support."
 	default n
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 04296a4abe8e..88279de6d3d5 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_INPUT_CMA3000)		+= cma3000_d0x.o
 obj-$(CONFIG_INPUT_CMA3000_I2C)		+= cma3000_d0x_i2c.o
 obj-$(CONFIG_INPUT_COBALT_BTNS)		+= cobalt_btns.o
 obj-$(CONFIG_INPUT_CPCAP_PWRBUTTON)	+= cpcap-pwrbutton.o
+obj-$(CONFIG_INPUT_CS40L50_VIBRA)	+= cs40l50-vibra.o
 obj-$(CONFIG_INPUT_DA7280_HAPTICS)	+= da7280.o
 obj-$(CONFIG_INPUT_DA9052_ONKEY)	+= da9052_onkey.o
 obj-$(CONFIG_INPUT_DA9055_ONKEY)	+= da9055_onkey.o
diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
new file mode 100644
index 000000000000..9089b90c31a9
--- /dev/null
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS40L50 Advanced Haptic Driver with waveform memory,
+ * integrated DSP, and closed-loop algorithms
+ *
+ * Copyright 2024 Cirrus Logic, Inc.
+ *
+ * Author: James Ogletree <james.ogletree@cirrus.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/input.h>
+#include <linux/mfd/cs40l50.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+/* Wavetables */
+#define CS40L50_RAM_INDEX_START		0x1000000
+#define CS40L50_RAM_INDEX_END		0x100007F
+#define CS40L50_RTH_INDEX_START		0x1400000
+#define CS40L50_RTH_INDEX_END		0x1400001
+#define CS40L50_ROM_INDEX_START		0x1800000
+#define CS40L50_ROM_INDEX_END		0x180001A
+#define CS40L50_TYPE_PCM		8
+#define CS40L50_TYPE_PWLE		12
+#define CS40L50_PCM_ID			0x0
+#define CS40L50_OWT_CUSTOM_DATA_SIZE	2
+
+/* DSP */
+#define CS40L50_GPIO_BASE		0x2804140
+#define CS40L50_OWT_BASE		0x2805C34
+#define CS40L50_OWT_SIZE		0x2805C38
+#define CS40L50_OWT_NEXT		0x2805C3C
+
+/* GPIO */
+#define CS40L50_GPIO_NUM_MASK		GENMASK(14, 12)
+#define CS40L50_GPIO_EDGE_MASK		BIT(15)
+#define CS40L50_GPIO_MAPPING_NONE	0
+#define CS40L50_GPIO_DISABLE		0x1FF
+
+enum vibra_bank_type {
+	WVFRM_BANK_RAM,
+	WVFRM_BANK_ROM,
+	WVFRM_BANK_OWT,
+	WVFRM_BANK_NUM,
+};
+
+/* Describes an area in DSP memory populated by effects */
+struct vibra_bank {
+	enum vibra_bank_type bank;
+	u32 base_index;
+	u32 max_index;
+};
+
+struct vibra_effect {
+	enum vibra_bank_type bank;
+	struct list_head list;
+	u32 gpio_reg;
+	u32 index;
+	int id;
+};
+
+/* Describes haptic interface of loaded DSP firmware */
+struct vibra_dsp {
+	struct vibra_bank *banks;
+	u32 gpio_base_reg;
+	u32 owt_offset_reg;
+	u32 owt_size_reg;
+	u32 owt_base_reg;
+	int (*write)(struct device *dev, struct regmap *regmap, u32 val);
+	u32 push_owt_cmd;
+	u32 delete_owt_cmd;
+	u32 stop_cmd;
+};
+
+/* Describes configuration and state of haptic operations */
+struct vibra_info {
+	struct device *dev;
+	struct regmap *regmap;
+	struct input_dev *input;
+	struct mutex lock;
+	struct workqueue_struct *vibe_wq;
+	struct list_head effect_head;
+	struct vibra_dsp dsp;
+};
+
+struct vibra_work {
+	struct vibra_info *info;
+	struct ff_effect *effect;
+	struct work_struct work;
+	s16 *custom_data;
+	int count;
+	int error;
+};
+
+static struct vibra_bank cs40l50_banks[] = {
+	{
+		.bank =		WVFRM_BANK_RAM,
+		.base_index =	CS40L50_RAM_INDEX_START,
+		.max_index =	CS40L50_RAM_INDEX_END,
+	},
+	{
+		.bank =		WVFRM_BANK_ROM,
+		.base_index =	CS40L50_ROM_INDEX_START,
+		.max_index =	CS40L50_ROM_INDEX_END,
+	},
+	{
+		.bank =		WVFRM_BANK_OWT,
+		.base_index =	CS40L50_RTH_INDEX_START,
+		.max_index =	CS40L50_RTH_INDEX_END,
+	},
+};
+
+static struct vibra_dsp cs40l50_dsp = {
+	.banks =		cs40l50_banks,
+	.gpio_base_reg =	CS40L50_GPIO_BASE,
+	.owt_base_reg =		CS40L50_OWT_BASE,
+	.owt_offset_reg =	CS40L50_OWT_NEXT,
+	.owt_size_reg =		CS40L50_OWT_SIZE,
+
+	.push_owt_cmd =		CS40L50_OWT_PUSH,
+	.delete_owt_cmd =	CS40L50_OWT_DELETE,
+	.stop_cmd =		CS40L50_STOP_PLAYBACK,
+
+	.write =		cs40l50_dsp_write,
+};
+
+static struct vibra_effect *vibra_find_effect(int id, struct list_head *effect_head)
+{
+	struct vibra_effect *effect;
+
+	list_for_each_entry(effect, effect_head, list)
+		if (effect->id == id)
+			return effect;
+
+	return NULL;
+}
+
+static int vibra_effect_bank_set(struct vibra_work *work_data,
+				 struct vibra_effect *effect)
+{
+	unsigned int len = work_data->effect->u.periodic.custom_len;
+	s16 bank = work_data->custom_data[0] & 0xffffu;
+
+	if (bank >= WVFRM_BANK_NUM) {
+		dev_err(work_data->info->dev, "Invalid waveform bank: %d\n", bank);
+		return -EINVAL;
+	}
+
+	effect->bank = len > CS40L50_OWT_CUSTOM_DATA_SIZE ? WVFRM_BANK_OWT : bank;
+
+	return 0;
+}
+
+static int vibra_effect_gpio_mapping_set(struct vibra_work *work_data,
+				    struct vibra_effect *effect)
+{
+	u16 button = work_data->effect->trigger.button;
+	struct vibra_info *info = work_data->info;
+	u32 gpio_num, gpio_edge;
+
+	if (button) {
+		gpio_num = FIELD_GET(CS40L50_GPIO_NUM_MASK, button);
+		gpio_edge = FIELD_GET(CS40L50_GPIO_EDGE_MASK, button);
+		effect->gpio_reg = info->dsp.gpio_base_reg + (gpio_num * 8) - gpio_edge;
+
+		return regmap_write(info->regmap, effect->gpio_reg, button);
+	}
+
+	effect->gpio_reg = CS40L50_GPIO_MAPPING_NONE;
+
+	return 0;
+}
+
+static int vibra_effect_index_set(struct vibra_work *work_data,
+				  struct vibra_effect *effect)
+{
+	struct vibra_info *info = work_data->info;
+	struct vibra_effect *owt_effect;
+	u32 base_index, max_index;
+
+	base_index = info->dsp.banks[effect->bank].base_index;
+	max_index = info->dsp.banks[effect->bank].max_index;
+
+	effect->index = base_index;
+
+	switch (effect->bank) {
+	case WVFRM_BANK_OWT:
+		list_for_each_entry(owt_effect, &info->effect_head, list)
+			if (owt_effect->bank == WVFRM_BANK_OWT)
+				effect->index++;
+		break;
+	case WVFRM_BANK_ROM:
+	case WVFRM_BANK_RAM:
+		effect->index += work_data->custom_data[1] & 0xffffu;
+		break;
+	default:
+		dev_err(info->dev, "Bank not supported: %d\n", effect->bank);
+		return -EINVAL;
+	}
+
+	if (effect->index > max_index || effect->index < base_index) {
+		dev_err(info->dev, "Index out of bounds: %u\n", effect->index);
+		return -ENOSPC;
+	}
+
+	return 0;
+}
+
+/* Describes a header for an OWT effect */
+struct owt_header {
+	u32 type;
+	u32 data_words;
+	u32 offset;
+} __packed;
+
+static int vibra_upload_owt(struct vibra_work *work_data, struct vibra_effect *effect)
+{
+	struct ff_periodic_effect add_effect = work_data->effect->u.periodic;
+	u32 len = 2 * add_effect.custom_len, wt_offset, wt_size;
+	struct vibra_info *info = work_data->info;
+	struct owt_header header;
+	u8 *out_data;
+	int error;
+
+	error = regmap_read(info->regmap, info->dsp.owt_size_reg, &wt_size);
+	if (error)
+		return error;
+
+	if ((wt_size * sizeof(u32)) < sizeof(header) + len) {
+		dev_err(info->dev, "No space in OWT bank for effect\n");
+		return -ENOSPC;
+	}
+
+	out_data = kzalloc(sizeof(header) + len, GFP_KERNEL);
+	if (!out_data)
+		return -ENOMEM;
+
+	header.type = add_effect.custom_data[0] == CS40L50_PCM_ID ? CS40L50_TYPE_PCM :
+								    CS40L50_TYPE_PWLE;
+	header.offset = sizeof(header) / sizeof(u32);
+	header.data_words = len / sizeof(u32);
+
+	memcpy(out_data, &header, sizeof(header));
+	memcpy(out_data + sizeof(header), add_effect.custom_data, len);
+
+	error = regmap_read(info->regmap, info->dsp.owt_offset_reg, &wt_offset);
+	if (error)
+		return error;
+
+	error = regmap_bulk_write(info->regmap, info->dsp.owt_base_reg +
+				  (wt_offset * sizeof(u32)), out_data,
+				  sizeof(header) + len);
+	if (error)
+		goto err_free;
+
+	error = info->dsp.write(info->dev, info->regmap, info->dsp.push_owt_cmd);
+err_free:
+	kfree(out_data);
+
+	return error;
+}
+
+static void vibra_add_worker(struct work_struct *work)
+{
+	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
+	struct vibra_info *info = work_data->info;
+	struct vibra_effect *effect;
+	bool is_new = false;
+	int error;
+
+	error = pm_runtime_resume_and_get(info->dev);
+	if (error < 0)
+		goto exit;
+
+	mutex_lock(&info->lock);
+
+	effect = vibra_find_effect(work_data->effect->id, &info->effect_head);
+	if (!effect) {
+		effect = kzalloc(sizeof(*effect), GFP_KERNEL);
+		if (!effect) {
+			error = -ENOMEM;
+			goto err_mutex;
+		}
+
+		effect->id = work_data->effect->id;
+		is_new = true;
+	}
+
+	error = vibra_effect_bank_set(work_data, effect);
+	if (error)
+		goto err_free;
+
+	error = vibra_effect_index_set(work_data, effect);
+	if (error)
+		goto err_free;
+
+	error = vibra_effect_gpio_mapping_set(work_data, effect);
+	if (error)
+		goto err_free;
+
+	if (effect->bank == WVFRM_BANK_OWT)
+		error = vibra_upload_owt(work_data, effect);
+err_free:
+	if (is_new) {
+		if (error)
+			kfree(effect);
+		else
+			list_add(&effect->list, &info->effect_head);
+	}
+err_mutex:
+	mutex_unlock(&info->lock);
+
+	pm_runtime_mark_last_busy(info->dev);
+	pm_runtime_put_autosuspend(info->dev);
+exit:
+	work_data->error = error;
+}
+
+static int vibra_add(struct input_dev *dev, struct ff_effect *effect,
+		     struct ff_effect *old)
+{
+	struct ff_periodic_effect *periodic = &effect->u.periodic;
+	struct vibra_info *info = input_get_drvdata(dev);
+	struct vibra_work work_data = { info, effect, };
+	u32 len = effect->u.periodic.custom_len;
+
+	if (effect->type != FF_PERIODIC || periodic->waveform != FF_CUSTOM) {
+		dev_err(info->dev, "Type (%#X) or waveform (%#X) unsupported\n",
+			effect->type, periodic->waveform);
+		return -EINVAL;
+	}
+
+	work_data.custom_data = kcalloc(len, sizeof(s16), GFP_KERNEL);
+	if (!work_data.custom_data)
+		return -ENOMEM;
+
+	if (copy_from_user(work_data.custom_data, effect->u.periodic.custom_data,
+			   sizeof(s16) * len)) {
+		work_data.error = -EFAULT;
+		goto out_free;
+	}
+
+	INIT_WORK(&work_data.work, vibra_add_worker);
+
+	/* Push to the workqueue to serialize with playbacks */
+	queue_work(info->vibe_wq, &work_data.work);
+	flush_work(&work_data.work);
+out_free:
+	kfree(work_data.custom_data);
+
+	return work_data.error;
+}
+
+static void vibra_start_worker(struct work_struct *work)
+{
+	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
+	struct vibra_info *info = work_data->info;
+	struct vibra_effect *start_effect;
+
+	if (pm_runtime_resume_and_get(info->dev) < 0)
+		goto error;
+
+	mutex_lock(&info->lock);
+
+	start_effect = vibra_find_effect(work_data->effect->id, &info->effect_head);
+	if (start_effect) {
+		while (--work_data->count >= 0) {
+			info->dsp.write(info->dev, info->regmap, start_effect->index);
+			usleep_range(work_data->effect->replay.length,
+				     work_data->effect->replay.length + 100);
+		}
+	}
+
+	mutex_unlock(&info->lock);
+
+	if (!start_effect)
+		dev_err(info->dev, "Effect to play not found\n");
+
+	pm_runtime_mark_last_busy(info->dev);
+	pm_runtime_put_autosuspend(info->dev);
+error:
+	kfree(work_data);
+}
+
+static void vibra_stop_worker(struct work_struct *work)
+{
+	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
+	struct vibra_info *info = work_data->info;
+
+	if (pm_runtime_resume_and_get(info->dev) < 0)
+		return;
+
+	mutex_lock(&info->lock);
+
+	info->dsp.write(info->dev, info->regmap, info->dsp.stop_cmd);
+
+	mutex_unlock(&info->lock);
+
+	pm_runtime_mark_last_busy(info->dev);
+	pm_runtime_put_autosuspend(info->dev);
+
+	kfree(work_data);
+}
+
+static int vibra_playback(struct input_dev *dev, int effect_id, int val)
+{
+	struct vibra_info *info = input_get_drvdata(dev);
+	struct vibra_work *work_data;
+
+	work_data = kzalloc(sizeof(*work_data), GFP_ATOMIC);
+	if (!work_data)
+		return -ENOMEM;
+
+	work_data->info = info;
+
+	if (val > 0) {
+		work_data->effect = &dev->ff->effects[effect_id];
+		work_data->count = val;
+		INIT_WORK(&work_data->work, vibra_start_worker);
+	} else {
+		/* Stop the amplifier as device can only drive one effect */
+		INIT_WORK(&work_data->work, vibra_stop_worker);
+	}
+
+	queue_work(info->vibe_wq, &work_data->work);
+
+	return 0;
+}
+
+static void vibra_erase_worker(struct work_struct *work)
+{
+	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
+	struct vibra_effect *owt_effect, *erase_effect;
+	struct vibra_info *info = work_data->info;
+	int error;
+
+	error = pm_runtime_resume_and_get(info->dev);
+	if (error < 0)
+		goto exit;
+
+	mutex_lock(&info->lock);
+
+	erase_effect = vibra_find_effect(work_data->effect->id, &info->effect_head);
+	if (!erase_effect) {
+		dev_err(info->dev, "Effect to erase not found\n");
+		error = -EINVAL;
+		goto error;
+	}
+
+	if (erase_effect->gpio_reg != CS40L50_GPIO_MAPPING_NONE) {
+		error = regmap_write(info->regmap, erase_effect->gpio_reg,
+				     CS40L50_GPIO_DISABLE);
+		if (error)
+			goto error;
+	}
+
+	if (erase_effect->bank == WVFRM_BANK_OWT) {
+		error = info->dsp.write(info->dev, info->regmap,
+					info->dsp.delete_owt_cmd |
+					erase_effect->index);
+		if (error)
+			goto error;
+
+		list_for_each_entry(owt_effect, &info->effect_head, list)
+			if (owt_effect->bank == WVFRM_BANK_OWT &&
+			    owt_effect->index > erase_effect->index)
+				owt_effect->index--;
+	}
+
+	list_del(&erase_effect->list);
+	kfree(erase_effect);
+error:
+	mutex_unlock(&info->lock);
+
+	pm_runtime_mark_last_busy(info->dev);
+	pm_runtime_put_autosuspend(info->dev);
+exit:
+	work_data->error = error;
+}
+
+static int vibra_erase(struct input_dev *dev, int effect_id)
+{
+	struct vibra_info *info = input_get_drvdata(dev);
+	struct vibra_work work_data = { info, &dev->ff->effects[effect_id], };
+
+	INIT_WORK(&work_data.work, vibra_erase_worker);
+
+	/* Push to workqueue to serialize with playbacks */
+	queue_work(info->vibe_wq, &work_data.work);
+	flush_work(&work_data.work);
+
+	return work_data.error;
+}
+
+static void vibra_remove_wq(void *data)
+{
+	struct vibra_info *info = data;
+
+	flush_workqueue(info->vibe_wq);
+	destroy_workqueue(info->vibe_wq);
+}
+
+static int cs40l50_vibra_probe(struct platform_device *pdev)
+{
+	struct cs40l50 *cs40l50 = dev_get_drvdata(pdev->dev.parent);
+	struct vibra_info *info;
+	int error;
+
+	info = devm_kzalloc(pdev->dev.parent, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	mutex_init(&info->lock);
+
+	info->dev = cs40l50->dev;
+	info->regmap = cs40l50->regmap;
+	info->dsp = cs40l50_dsp;
+
+	info->input = devm_input_allocate_device(info->dev);
+	if (!info->input)
+		return -ENOMEM;
+	info->input->id.product = cs40l50->devid & 0xFFFF;
+	info->input->id.version = cs40l50->revid;
+	info->input->name = "cs40l50_vibra";
+
+	input_set_drvdata(info->input, info);
+	input_set_capability(info->input, EV_FF, FF_PERIODIC);
+	input_set_capability(info->input, EV_FF, FF_CUSTOM);
+
+	error = input_ff_create(info->input, FF_MAX_EFFECTS);
+	if (error) {
+		dev_err(info->dev, "Failed to create input device\n");
+		return error;
+	}
+
+	info->input->ff->upload = vibra_add;
+	info->input->ff->playback = vibra_playback;
+	info->input->ff->erase = vibra_erase;
+
+	INIT_LIST_HEAD(&info->effect_head);
+
+	info->vibe_wq = alloc_ordered_workqueue("vibe_wq", WQ_HIGHPRI);
+	if (!info->vibe_wq)
+		return -ENOMEM;
+
+	error = devm_add_action_or_reset(info->dev, vibra_remove_wq, info);
+	if (error)
+		return error;
+
+	return input_register_device(info->input);
+}
+
+static const struct platform_device_id vibra_id_match[] = {
+	{ "cs40l50-vibra", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, vibra_id_match);
+
+static struct platform_driver cs40l50_vibra_driver = {
+	.probe		= cs40l50_vibra_probe,
+	.id_table	= vibra_id_match,
+	.driver		= {
+		.name	= "cs40l50-vibra",
+	},
+};
+module_platform_driver(cs40l50_vibra_driver);
+
+MODULE_DESCRIPTION("CS40L50 Advanced Haptic Driver");
+MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1



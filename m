Return-Path: <linux-input+bounces-2864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A833489C85E
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 17:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2023D1F22AE3
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 15:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5281411EF;
	Mon,  8 Apr 2024 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MlFbtBb/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77C140396;
	Mon,  8 Apr 2024 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590364; cv=none; b=u0LgYSWIwsCUk6SXlrvXi8U8dzpImA/J87MxN85GU8X9mlAHCfKF5IBavmpmfFH0soTnVoeehtsCmBnHlqC6OMUqAKpBYecKV20DE1FVBpT5a4MGEQH+8bBZITZD5uWXW9gvPI+/43z8DKXCs/C89/DPuMZRCcxUcCEhkE71egs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590364; c=relaxed/simple;
	bh=xKKIXez9R3dyHcHJEJoUeMF66XipWrxGj6Ml6R2y5G0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lmsBY99QloS/A91fbTQHQ391Fo0im0jt/hsXVEJjNC0OVP6GRoLaQHCYubAhwRmb/Q18o6SfvRlHx+ndP5ZmVa4D1ic1KBuu6LUbO36jHKP8uYSH2JzNAMc/NdB1EfNeJn9KfZtJebwRde7kI9Bffoth2/b722ibm4dyWpABJEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MlFbtBb/; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4385sYp1027153;
	Mon, 8 Apr 2024 10:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=oz6jl5m3HSzWVpViPGhUsvb8Q0Ls7TxOZ8crVtXOfN8=; b=
	MlFbtBb/72AUp9A7QwVPBdlwgEz51IqRta0ZKyM4vMDksYV8pmaVagRxEP4R2IjB
	UhLQsyMv4WGG2WFXS0yXFUFAAse5qL6he9QJjYtpTgTBbO0E91Qtu1iN2qo7vWCC
	o2ZgH8LRPrFsP9hrjAVy0XF379PtMQydgDuVaeYBxfNS2dv6A7txRu48uBFlmiDe
	WUoi9OmDdtX1T3omhHE5BHsa+ZNMONnHIOWe8BlEPbiStYtnKe0OkLIcC1zubkBM
	RgovQQpIQ3gM6/HFW58rj6LvWBNpHM3/PHuEkNBN1EfqSZpq+ryPUPKYu2tmVUPw
	Lu5qo7GW0KhC0XGtqLCmsg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xb2tjhy80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 10:32:33 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Apr 2024
 16:32:32 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 8 Apr 2024 16:32:32 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 98059820242;
	Mon,  8 Apr 2024 15:32:30 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
Date: Mon, 8 Apr 2024 15:32:13 +0000
Message-ID: <20240408153214.42368-5-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fU10zCr6zmboovLE3OBqrJf_bWDqHFIR
X-Proofpoint-GUID: fU10zCr6zmboovLE3OBqrJf_bWDqHFIR
X-Proofpoint-Spam-Reason: safe

Introduce support for Cirrus Logic Device CS40L50: a
haptic driver with waveform memory, integrated DSP,
and closed-loop algorithms.

The input driver provides the interface for control of
haptic effects through the device.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
v10:
Minor concern that playback stop is still misused with respect to not
specifying an effect ID. The device can only play one effect at a
time, but setting max effects for the EVIOCGEFFECTS ioctl to 1 would
restrict the number of uploads to 1 as well.

 MAINTAINERS                        |   1 +
 drivers/input/misc/Kconfig         |  10 +
 drivers/input/misc/Makefile        |   1 +
 drivers/input/misc/cs40l50-vibra.c | 577 +++++++++++++++++++++++++++++
 4 files changed, 589 insertions(+)
 create mode 100644 drivers/input/misc/cs40l50-vibra.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e804f3766cba..49c2e6e57b09 100644
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
index 000000000000..5440cf224f59
--- /dev/null
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -0,0 +1,577 @@
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
+#define CS40L50_CUSTOM_DATA_MASK	0xFFFFU
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
+enum cs40l50_bank_type {
+	CS40L50_WVFRM_BANK_RAM,
+	CS40L50_WVFRM_BANK_ROM,
+	CS40L50_WVFRM_BANK_OWT,
+	CS40L50_WVFRM_BANK_NUM,
+};
+
+/* Describes an area in DSP memory populated by effects */
+struct cs40l50_bank {
+	enum cs40l50_bank_type type;
+	u32 base_index;
+	u32 max_index;
+};
+
+struct cs40l50_effect {
+	enum cs40l50_bank_type type;
+	struct list_head list;
+	u32 gpio_reg;
+	u32 index;
+	int id;
+};
+
+/* Describes haptic interface of loaded DSP firmware */
+struct cs40l50_vibra_dsp {
+	struct cs40l50_bank *banks;
+	u32 gpio_base_reg;
+	u32 owt_offset_reg;
+	u32 owt_size_reg;
+	u32 owt_base_reg;
+	u32 push_owt_cmd;
+	u32 delete_owt_cmd;
+	u32 stop_cmd;
+	int (*write)(struct device *dev, struct regmap *regmap, u32 val);
+};
+
+/* Describes configuration and state of haptic operations */
+struct cs40l50_vibra {
+	struct device *dev;
+	struct regmap *regmap;
+	struct input_dev *input;
+	struct mutex lock;
+	struct workqueue_struct *vibe_wq;
+	struct list_head effect_head;
+	struct cs40l50_vibra_dsp dsp;
+};
+
+struct cs40l50_work {
+	struct cs40l50_vibra *vibra;
+	struct ff_effect *effect;
+	struct work_struct work;
+	s16 *custom_data;
+	int custom_len;
+	int count;
+	int error;
+};
+
+static struct cs40l50_bank cs40l50_banks[] = {
+	{
+		.type =		CS40L50_WVFRM_BANK_RAM,
+		.base_index =	CS40L50_RAM_INDEX_START,
+		.max_index =	CS40L50_RAM_INDEX_END,
+	},
+	{
+		.type =		CS40L50_WVFRM_BANK_ROM,
+		.base_index =	CS40L50_ROM_INDEX_START,
+		.max_index =	CS40L50_ROM_INDEX_END,
+	},
+	{
+		.type =		CS40L50_WVFRM_BANK_OWT,
+		.base_index =	CS40L50_RTH_INDEX_START,
+		.max_index =	CS40L50_RTH_INDEX_END,
+	},
+};
+
+static struct cs40l50_vibra_dsp cs40l50_dsp = {
+	.banks =		cs40l50_banks,
+	.gpio_base_reg =	CS40L50_GPIO_BASE,
+	.owt_base_reg =		CS40L50_OWT_BASE,
+	.owt_offset_reg =	CS40L50_OWT_NEXT,
+	.owt_size_reg =		CS40L50_OWT_SIZE,
+	.push_owt_cmd =		CS40L50_OWT_PUSH,
+	.delete_owt_cmd =	CS40L50_OWT_DELETE,
+	.stop_cmd =		CS40L50_STOP_PLAYBACK,
+	.write =		cs40l50_dsp_write,
+};
+
+static struct cs40l50_effect *cs40l50_find_effect(int id, struct list_head *effect_head)
+{
+	struct cs40l50_effect *effect;
+
+	list_for_each_entry(effect, effect_head, list)
+		if (effect->id == id)
+			return effect;
+
+	return NULL;
+}
+
+static int cs40l50_effect_bank_set(struct cs40l50_work *work_data,
+				   struct cs40l50_effect *effect)
+{
+	s16 bank_type = work_data->custom_data[0] & CS40L50_CUSTOM_DATA_MASK;
+
+	if (bank_type >= CS40L50_WVFRM_BANK_NUM) {
+		dev_err(work_data->vibra->dev, "Invalid bank (%d)\n", bank_type);
+		return -EINVAL;
+	}
+
+	if (work_data->custom_len > CS40L50_OWT_CUSTOM_DATA_SIZE)
+		effect->type = CS40L50_WVFRM_BANK_OWT;
+	else
+		effect->type = bank_type;
+
+	return 0;
+}
+
+static int cs40l50_effect_gpio_mapping_set(struct cs40l50_work *work_data,
+					   struct cs40l50_effect *effect)
+{
+	u16 gpio_num, gpio_edge, button = work_data->effect->trigger.button;
+	struct cs40l50_vibra *vibra = work_data->vibra;
+
+	if (button) {
+		gpio_num = FIELD_GET(CS40L50_GPIO_NUM_MASK, button);
+		gpio_edge = FIELD_GET(CS40L50_GPIO_EDGE_MASK, button);
+		effect->gpio_reg = vibra->dsp.gpio_base_reg + (gpio_num * 8) - gpio_edge;
+
+		return regmap_write(vibra->regmap, effect->gpio_reg, button);
+	}
+
+	effect->gpio_reg = CS40L50_GPIO_MAPPING_NONE;
+
+	return 0;
+}
+
+static int cs40l50_effect_index_set(struct cs40l50_work *work_data,
+				   struct cs40l50_effect *effect)
+{
+	struct cs40l50_vibra *vibra = work_data->vibra;
+	struct cs40l50_effect *owt_effect;
+	u32 base_index, max_index;
+
+	base_index = vibra->dsp.banks[effect->type].base_index;
+	max_index = vibra->dsp.banks[effect->type].max_index;
+
+	effect->index = base_index;
+
+	switch (effect->type) {
+	case CS40L50_WVFRM_BANK_OWT:
+		list_for_each_entry(owt_effect, &vibra->effect_head, list)
+			if (owt_effect->type == CS40L50_WVFRM_BANK_OWT)
+				effect->index++;
+		break;
+	case CS40L50_WVFRM_BANK_ROM:
+	case CS40L50_WVFRM_BANK_RAM:
+		effect->index += work_data->custom_data[1] & CS40L50_CUSTOM_DATA_MASK;
+		break;
+	default:
+		dev_err(vibra->dev, "Bank type %d not supported\n", effect->type);
+		return -EINVAL;
+	}
+
+	if (effect->index > max_index || effect->index < base_index) {
+		dev_err(vibra->dev, "Index out of bounds: %u\n", effect->index);
+		return -ENOSPC;
+	}
+
+	return 0;
+}
+
+/* Describes a header for an OWT effect */
+struct cs40l50_owt_header {
+	u32 type;
+	u32 data_words;
+	u32 offset;
+} __packed;
+
+static int cs40l50_upload_owt(struct cs40l50_work *work_data)
+{
+	u32 len = 2 * work_data->custom_len, wt_offset, wt_size;
+	struct cs40l50_vibra *vibra = work_data->vibra;
+	struct cs40l50_owt_header header;
+	u8 *out_data;
+	int error;
+
+	error = regmap_read(vibra->regmap, vibra->dsp.owt_size_reg, &wt_size);
+	if (error)
+		return error;
+
+	if ((wt_size * sizeof(u32)) < sizeof(header) + len) {
+		dev_err(vibra->dev, "No space in OWT bank for effect\n");
+		return -ENOSPC;
+	}
+
+	out_data = kzalloc(sizeof(header) + len, GFP_KERNEL);
+	if (!out_data)
+		return -ENOMEM;
+
+	header.type = work_data->custom_data[0] == CS40L50_PCM_ID ? CS40L50_TYPE_PCM :
+								    CS40L50_TYPE_PWLE;
+	header.offset = sizeof(header) / sizeof(u32);
+	header.data_words = len / sizeof(u32);
+
+	memcpy(out_data, &header, sizeof(header));
+	memcpy(out_data + sizeof(header), work_data->custom_data, len);
+
+	error = regmap_read(vibra->regmap, vibra->dsp.owt_offset_reg, &wt_offset);
+	if (error)
+		goto err_free;
+
+	error = regmap_bulk_write(vibra->regmap, vibra->dsp.owt_base_reg +
+				  (wt_offset * sizeof(u32)), out_data,
+				  sizeof(header) + len);
+	if (error)
+		goto err_free;
+
+	error = vibra->dsp.write(vibra->dev, vibra->regmap, vibra->dsp.push_owt_cmd);
+err_free:
+	kfree(out_data);
+
+	return error;
+}
+
+static void cs40l50_add_worker(struct work_struct *work)
+{
+	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
+	struct cs40l50_vibra *vibra = work_data->vibra;
+	struct cs40l50_effect *effect;
+	bool is_new = false;
+	int error;
+
+	error = pm_runtime_resume_and_get(vibra->dev);
+	if (error)
+		goto err_exit;
+
+	mutex_lock(&vibra->lock);
+
+	/* Update effect if already present, otherwise create new effect */
+	effect = cs40l50_find_effect(work_data->effect->id, &vibra->effect_head);
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
+	error = cs40l50_effect_bank_set(work_data, effect);
+	if (error)
+		goto err_free;
+
+	error = cs40l50_effect_index_set(work_data, effect);
+	if (error)
+		goto err_free;
+
+	error = cs40l50_effect_gpio_mapping_set(work_data, effect);
+	if (error)
+		goto err_free;
+
+	if (effect->type == CS40L50_WVFRM_BANK_OWT)
+		error = cs40l50_upload_owt(work_data);
+err_free:
+	if (is_new) {
+		if (error)
+			kfree(effect);
+		else
+			list_add(&effect->list, &vibra->effect_head);
+	}
+err_mutex:
+	mutex_unlock(&vibra->lock);
+
+	pm_runtime_mark_last_busy(vibra->dev);
+	pm_runtime_put_autosuspend(vibra->dev);
+err_exit:
+	work_data->error = error;
+}
+
+static int cs40l50_add(struct input_dev *dev, struct ff_effect *effect,
+		       struct ff_effect *old)
+{
+	struct ff_periodic_effect *periodic = &effect->u.periodic;
+	struct cs40l50_vibra *vibra = input_get_drvdata(dev);
+	u32 len = effect->u.periodic.custom_len;
+	struct cs40l50_work work_data;
+
+	if (effect->type != FF_PERIODIC || periodic->waveform != FF_CUSTOM) {
+		dev_err(vibra->dev, "Type (%#X) or waveform (%#X) unsupported\n",
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
+		goto err_free;
+	}
+
+	work_data.custom_len = len;
+	work_data.vibra = vibra;
+	work_data.effect = effect;
+	INIT_WORK(&work_data.work, cs40l50_add_worker);
+
+	/* Push to the workqueue to serialize with playbacks */
+	queue_work(vibra->vibe_wq, &work_data.work);
+	flush_work(&work_data.work);
+err_free:
+	kfree(work_data.custom_data);
+
+	return work_data.error;
+}
+
+static void cs40l50_start_worker(struct work_struct *work)
+{
+	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
+	struct cs40l50_vibra *vibra = work_data->vibra;
+	struct cs40l50_effect *start_effect;
+
+	if (pm_runtime_resume_and_get(vibra->dev) < 0)
+		goto err_free;
+
+	mutex_lock(&vibra->lock);
+
+	start_effect = cs40l50_find_effect(work_data->effect->id, &vibra->effect_head);
+	if (start_effect) {
+		while (--work_data->count >= 0) {
+			vibra->dsp.write(vibra->dev, vibra->regmap, start_effect->index);
+			usleep_range(work_data->effect->replay.length,
+				     work_data->effect->replay.length + 100);
+		}
+	}
+
+	mutex_unlock(&vibra->lock);
+
+	if (!start_effect)
+		dev_err(vibra->dev, "Effect to play not found\n");
+
+	pm_runtime_mark_last_busy(vibra->dev);
+	pm_runtime_put_autosuspend(vibra->dev);
+err_free:
+	kfree(work_data);
+}
+
+static void cs40l50_stop_worker(struct work_struct *work)
+{
+	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
+	struct cs40l50_vibra *vibra = work_data->vibra;
+
+	if (pm_runtime_resume_and_get(vibra->dev) < 0)
+		return;
+
+	mutex_lock(&vibra->lock);
+
+	vibra->dsp.write(vibra->dev, vibra->regmap, vibra->dsp.stop_cmd);
+
+	mutex_unlock(&vibra->lock);
+
+	pm_runtime_mark_last_busy(vibra->dev);
+	pm_runtime_put_autosuspend(vibra->dev);
+
+	kfree(work_data);
+}
+
+static int cs40l50_playback(struct input_dev *dev, int effect_id, int val)
+{
+	struct cs40l50_vibra *vibra = input_get_drvdata(dev);
+	struct cs40l50_work *work_data;
+
+	work_data = kzalloc(sizeof(*work_data), GFP_ATOMIC);
+	if (!work_data)
+		return -ENOMEM;
+
+	work_data->vibra = vibra;
+
+	if (val > 0) {
+		work_data->effect = &dev->ff->effects[effect_id];
+		work_data->count = val;
+		INIT_WORK(&work_data->work, cs40l50_start_worker);
+	} else {
+		/* Just stop the amplifier as device drives only one effect */
+		INIT_WORK(&work_data->work, cs40l50_stop_worker);
+	}
+
+	queue_work(vibra->vibe_wq, &work_data->work);
+
+	return 0;
+}
+
+static void cs40l50_erase_worker(struct work_struct *work)
+{
+	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
+	struct cs40l50_effect *owt_effect, *erase_effect;
+	struct cs40l50_vibra *vibra = work_data->vibra;
+	int error;
+
+	error = pm_runtime_resume_and_get(vibra->dev);
+	if (error)
+		goto err_exit;
+
+	mutex_lock(&vibra->lock);
+
+	erase_effect = cs40l50_find_effect(work_data->effect->id, &vibra->effect_head);
+	if (!erase_effect) {
+		dev_err(vibra->dev, "Effect to erase not found\n");
+		error = -EINVAL;
+		goto err_mutex;
+	}
+
+	if (erase_effect->gpio_reg != CS40L50_GPIO_MAPPING_NONE) {
+		error = regmap_write(vibra->regmap, erase_effect->gpio_reg,
+				     CS40L50_GPIO_DISABLE);
+		if (error)
+			goto err_mutex;
+	}
+
+	if (erase_effect->type == CS40L50_WVFRM_BANK_OWT) {
+		error = vibra->dsp.write(vibra->dev, vibra->regmap,
+					 vibra->dsp.delete_owt_cmd |
+					 erase_effect->index);
+		if (error)
+			goto err_mutex;
+
+		list_for_each_entry(owt_effect, &vibra->effect_head, list)
+			if (owt_effect->type == CS40L50_WVFRM_BANK_OWT &&
+			    owt_effect->index > erase_effect->index)
+				owt_effect->index--;
+	}
+
+	list_del(&erase_effect->list);
+	kfree(erase_effect);
+err_mutex:
+	mutex_unlock(&vibra->lock);
+
+	pm_runtime_mark_last_busy(vibra->dev);
+	pm_runtime_put_autosuspend(vibra->dev);
+err_exit:
+	work_data->error = error;
+}
+
+static int cs40l50_erase(struct input_dev *dev, int effect_id)
+{
+	struct cs40l50_vibra *vibra = input_get_drvdata(dev);
+	struct cs40l50_work work_data;
+
+	work_data.vibra = vibra;
+	work_data.effect = &dev->ff->effects[effect_id];
+
+	INIT_WORK(&work_data.work, cs40l50_erase_worker);
+
+	/* Push to workqueue to serialize with playbacks */
+	queue_work(vibra->vibe_wq, &work_data.work);
+	flush_work(&work_data.work);
+
+	return work_data.error;
+}
+
+static void cs40l50_remove_wq(void *data)
+{
+	flush_workqueue(data);
+	destroy_workqueue(data);
+}
+
+static int cs40l50_vibra_probe(struct platform_device *pdev)
+{
+	struct cs40l50 *cs40l50 = dev_get_drvdata(pdev->dev.parent);
+	struct cs40l50_vibra *vibra;
+	int error;
+
+	vibra = devm_kzalloc(pdev->dev.parent, sizeof(*vibra), GFP_KERNEL);
+	if (!vibra)
+		return -ENOMEM;
+
+	mutex_init(&vibra->lock);
+
+	vibra->dev = cs40l50->dev;
+	vibra->regmap = cs40l50->regmap;
+	vibra->dsp = cs40l50_dsp;
+
+	vibra->input = devm_input_allocate_device(vibra->dev);
+	if (!vibra->input)
+		return -ENOMEM;
+
+	vibra->input->id.product = cs40l50->devid;
+	vibra->input->id.version = cs40l50->revid;
+	vibra->input->name = "cs40l50_vibra";
+
+	input_set_drvdata(vibra->input, vibra);
+	input_set_capability(vibra->input, EV_FF, FF_PERIODIC);
+	input_set_capability(vibra->input, EV_FF, FF_CUSTOM);
+
+	error = input_ff_create(vibra->input, FF_MAX_EFFECTS);
+	if (error) {
+		dev_err(vibra->dev, "Failed to create input device\n");
+		return error;
+	}
+
+	vibra->input->ff->upload = cs40l50_add;
+	vibra->input->ff->playback = cs40l50_playback;
+	vibra->input->ff->erase = cs40l50_erase;
+
+	INIT_LIST_HEAD(&vibra->effect_head);
+
+	vibra->vibe_wq = alloc_ordered_workqueue("vibe_wq", WQ_HIGHPRI);
+	if (!vibra->vibe_wq)
+		return -ENOMEM;
+
+	error = devm_add_action_or_reset(vibra->dev, cs40l50_remove_wq, vibra->vibe_wq);
+	if (error)
+		return error;
+
+	return input_register_device(vibra->input);
+}
+
+static const struct platform_device_id cs40l50_vibra_id_match[] = {
+	{ "cs40l50-vibra", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, cs40l50_vibra_id_match);
+
+static struct platform_driver cs40l50_vibra_driver = {
+	.probe		= cs40l50_vibra_probe,
+	.id_table	= cs40l50_vibra_id_match,
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



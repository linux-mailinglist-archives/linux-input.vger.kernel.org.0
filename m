Return-Path: <linux-input+bounces-9771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B51A27F7C
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA2B3A262F
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 23:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6991B21C9EE;
	Tue,  4 Feb 2025 23:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R5Wvjvj0"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF721C19F;
	Tue,  4 Feb 2025 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711290; cv=none; b=uRYII6qo8uOdYXJ9DuRhQE61qbKRttdYQWIU0kkfRkba2jZVnaeZ/VcvwmN8wKekHSZaeEhm4kqu8IY5r97NuAc7PeHTwshkSIljrAXxmERocmXq1vJhRt/jqnWzFVdGK3APqAXR7jM5Vx/nmmyQ4orGFjXDsqlqr3yPaJQ1zik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711290; c=relaxed/simple;
	bh=fuWeLByj80754MOGlmEzAJX/L9c2TYV677lqCSUIZCE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atZX9W/cMtKsOZLGpuC7wiUPjtTcEgPefQ773D5qVMtWrij4sjmRghkox0O+X/ofcMU9BCPCXIooGJapGSVlhPJhFkSI2kXU9gNM2dkz8gxizbNpo7TtYQMYSy1hWGjI4QOXHWAdlmMoZlWfqi+MCzpE/yCVawaW32C/Li6fdAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R5Wvjvj0; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Fmw8O029853;
	Tue, 4 Feb 2025 17:20:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MF3LR1s1Rj7Ha12pV01Rjj4AA/V+w0HEuDHAs9QG5WU=; b=
	R5Wvjvj0Dsy0DDp/BN6Zk14Dyn9fcvIJQJp4od9A3zHV8SrmXvWTaeVya5ehmJoL
	UpJtczubkaD+7+3FvdtAT7KVtnvWm4emQNP+cij6kYNvRAJJY5LB3A6LAMO17CMm
	MyWui2nT7bQHNOLrpsI9w9sFgybqBTjLNMcnhut7DEIbgd4oOJQlLUwh8NJuxn1T
	8OGhYBsuoSL7Pre3MKWa9Zg9D0eyR8RjUM15yWaYKxNEBzkxsOFewrb/TPqMICDW
	43HjBnpbVizzkZ+UnzU9mTLaEcZF8odZYtJ+R8vV2VujuTJTNGv2AT2Qi8kq8zfc
	FZ570fke7jpAfsQq8m+ljg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53pkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:20:37 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:20:25 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:20:20 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 85475820270;
	Tue,  4 Feb 2025 23:20:16 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Ben Bright
	<ben.bright@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Jeff LaBundy
	<jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
        Karel Balej
	<balejk@matfyz.cz>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Binbin Zhou
	<zhoubinbin@loongson.cn>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        "Paul
 Handrigan" <paulha@opensource.cirrus.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
        Fred Treven
	<ftreven@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH RESEND 7/7] Input: cs40l26 - Add support for CS40L26 haptic driver
Date: Tue, 4 Feb 2025 17:18:36 -0600
Message-ID: <20250204231835.2000457-8-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c-eADMAq4RV4r0b5gCbXUlG5TL3rnwsb
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a2a0c5 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=u19Cq9sczE363Rxt_jsA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: c-eADMAq4RV4r0b5gCbXUlG5TL3rnwsb
X-Proofpoint-Spam-Reason: safe

Introduce support for Cirrus Logic Device CS40L26:
a boosted haptics driver with integrated DSP and
waveform memory with advanced closed loop algorithms
and LRA protection.

The input driver provides the interface for control
of haptic effects through the device.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/input/misc/Kconfig         |  10 +
 drivers/input/misc/Makefile        |   1 +
 drivers/input/misc/cs40l26-vibra.c | 669 +++++++++++++++++++++++++++++
 3 files changed, 680 insertions(+)
 create mode 100644 drivers/input/misc/cs40l26-vibra.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 13d135257e06..2c9496c873e7 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -147,6 +147,16 @@ config INPUT_BMA150
 	  To compile this driver as a module, choose M here: the
 	  module will be called bma150.
 
+config INPUT_CS40L26_VIBRA
+	tristate "CS40L26 Haptic Driver support"
+	depends on MFD_CS40L26_CORE
+	help
+	  Say Y here to enable support for Cirrus Logic's CS40L26
+	  haptic driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called cs40l26-vibra.
+
 config INPUT_CS40L50_VIBRA
 	tristate "CS40L50 Haptic Driver support"
 	depends on MFD_CS40L50_CORE
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 6d91804d0a6f..b6274a937a94 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_INPUT_CMA3000)		+= cma3000_d0x.o
 obj-$(CONFIG_INPUT_CMA3000_I2C)		+= cma3000_d0x_i2c.o
 obj-$(CONFIG_INPUT_COBALT_BTNS)		+= cobalt_btns.o
 obj-$(CONFIG_INPUT_CPCAP_PWRBUTTON)	+= cpcap-pwrbutton.o
+obj-$(CONFIG_INPUT_CS40L26_VIBRA)	+= cs40l26-vibra.o
 obj-$(CONFIG_INPUT_CS40L50_VIBRA)	+= cs40l50-vibra.o
 obj-$(CONFIG_INPUT_DA7280_HAPTICS)	+= da7280.o
 obj-$(CONFIG_INPUT_DA9052_ONKEY)	+= da9052_onkey.o
diff --git a/drivers/input/misc/cs40l26-vibra.c b/drivers/input/misc/cs40l26-vibra.c
new file mode 100644
index 000000000000..d083be714a3a
--- /dev/null
+++ b/drivers/input/misc/cs40l26-vibra.c
@@ -0,0 +1,669 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS40L26 Advanced Haptic Driver with waveform memory,
+ * integrated DSP, and closed-loop algorithms
+ *
+ * Copyright 2025 Cirrus Logic, Inc.
+ *
+ * Author: Fred Treven <ftreven@opensource.cirrus.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/input.h>
+#include <linux/mfd/cs40l26.h>
+
+#define CS40L26_EFFECTS_MAX	1
+
+#define CS40L26_NUM_PCT_MAP_VALUES	101
+
+#define CS40L26_STOP_PLAYBACK	0x05000000
+
+#define CS40L26_MAX_INDEX_MASK	GENMASK(15, 0)
+
+#define CS40L26_RAM_INDEX_START	0x01000000
+#define CS40L26_RAM_INDEX_END	0x0100007F
+
+#define CS40L26_ROM_INDEX_START	0x01800000
+#define CS40L26_ROM_INDEX_END	0x01800026
+#define CS40L26_NUM_ROM_WAVES	(CS40L26_ROM_INDEX_END - CS40L26_ROM_INDEX_START + 1)
+
+#define CS40L26_BUZZGEN_INDEX_START	0x01800080
+#define CS40L26_BUZZGEN_INDEX_END	0x01800085
+
+#define CS40L26_BUZZGEN_PER_MS_MAX	10
+#define CS40L26_BUZZGEN_PER_MS_MIN	4
+
+#define CS40L26_BUZZGEN_LEVEL_MIN	0x00
+#define CS40L26_BUZZGEN_LEVEL_MAX	0xFF
+
+#define CS40L26_BUZZGEN_NUM_CONFIGS	(CS40L26_BUZZGEN_INDEX_END - CS40L26_BUZZGEN_INDEX_START)
+
+enum cs40l26_bank {
+	CS40L26_BANK_RAM,
+	CS40L26_BANK_ROM,
+	CS40L26_BANK_BUZ,
+};
+
+struct cs40l26_effect {
+	enum cs40l26_bank bank;
+	u32 index;
+	int id;
+	struct list_head list;
+};
+
+struct cs40l26_vibra {
+	struct cs40l26 *cs40l26;
+	struct input_dev *input;
+	struct workqueue_struct *vib_wq;
+	struct list_head effect_head;
+};
+
+struct cs40l26_work {
+	struct ff_effect *ff_effect;
+	struct cs40l26_vibra *vib;
+	struct work_struct work;
+	s16 *custom_data;
+	int custom_len;
+	u16 gain_pct;
+	int count;
+	int error;
+};
+
+struct cs40l26_buzzgen_config {
+	const char *duration_name;
+	const char *freq_name;
+	const char *level_name;
+	int effect_id;
+};
+
+static struct cs40l26_buzzgen_config cs40l26_buzzgen_configs[] = {
+	{
+		.duration_name = "BUZZ_EFFECTS2_BUZZ_DURATION",
+		.freq_name = "BUZZ_EFFECTS2_BUZZ_FREQ",
+		.level_name = "BUZZ_EFFECTS2_BUZZ_LEVEL",
+		.effect_id = -1
+	},
+	{
+		.duration_name = "BUZZ_EFFECTS3_BUZZ_DURATION",
+		.freq_name = "BUZZ_EFFECTS3_BUZZ_FREQ",
+		.level_name = "BUZZ_EFFECTS3_BUZZ_LEVEL",
+		.effect_id = -1
+	},
+	{
+		.duration_name = "BUZZ_EFFECTS4_BUZZ_DURATION",
+		.freq_name = "BUZZ_EFFECTS4_BUZZ_FREQ",
+		.level_name = "BUZZ_EFFECTS4_BUZZ_LEVEL",
+		.effect_id = -1
+	},
+	{
+		.duration_name = "BUZZ_EFFECTS5_BUZZ_DURATION",
+		.freq_name = "BUZZ_EFFECTS5_BUZZ_FREQ",
+		.level_name = "BUZZ_EFFECTS5_BUZZ_LEVEL",
+		.effect_id = -1
+	},
+	{
+		.duration_name = "BUZZ_EFFECTS6_BUZZ_DURATION",
+		.freq_name = "BUZZ_EFFECTS6_BUZZ_FREQ",
+		.level_name = "BUZZ_EFFECTS6_BUZZ_LEVEL",
+		.effect_id = -1
+	},
+};
+
+static int cs40l26_buzzgen_find_slot(int id)
+{
+	int effect_id, lowest_available_slot = -1, slot;
+
+	for (slot = CS40L26_BUZZGEN_NUM_CONFIGS - 1; slot >= 0; slot--) {
+		effect_id = cs40l26_buzzgen_configs[slot].effect_id;
+
+		if (effect_id == id)
+			return slot;
+		else if (effect_id == -1)
+			lowest_available_slot = slot;
+	}
+
+	return lowest_available_slot;
+}
+
+static int cs40l26_sine_upload(struct cs40l26_vibra *vib, struct cs40l26_work *work_data,
+			       struct cs40l26_effect *effect)
+{
+	struct cs_dsp *dsp = &vib->cs40l26->dsp;
+	unsigned int duration, freq, level;
+	int error, slot;
+
+	slot = cs40l26_buzzgen_find_slot(work_data->ff_effect->id);
+	if (slot == -1) {
+		dev_err(vib->cs40l26->dev, "No free BUZZGEN slot available\n");
+		return -ENOSPC;
+	}
+
+	cs40l26_buzzgen_configs[slot].effect_id = work_data->ff_effect->id;
+
+	/* Firmware expects duration in ms divided by 4 */
+	duration = (unsigned int)DIV_ROUND_UP(work_data->ff_effect->replay.length, 4);
+
+	freq = (unsigned int)(1000 / clamp_val(work_data->ff_effect->u.periodic.period,
+					       CS40L26_BUZZGEN_PER_MS_MIN,
+					       CS40L26_BUZZGEN_PER_MS_MAX));
+
+	level = (unsigned int)clamp_val(work_data->ff_effect->u.periodic.magnitude,
+					CS40L26_BUZZGEN_LEVEL_MIN, CS40L26_BUZZGEN_LEVEL_MAX);
+
+	guard(mutex)(&dsp->pwr_lock);
+
+	error = cs40l26_fw_write(dsp, cs40l26_buzzgen_configs[slot].duration_name,
+				 CS40L26_BUZZGEN_ALGO_ID, duration);
+	if (error)
+		return error;
+
+	error = cs40l26_fw_write(dsp, cs40l26_buzzgen_configs[slot].freq_name,
+				 CS40L26_BUZZGEN_ALGO_ID, freq);
+	if (error)
+		return error;
+
+	error = cs40l26_fw_write(dsp, cs40l26_buzzgen_configs[slot].level_name,
+				 CS40L26_BUZZGEN_ALGO_ID, level);
+	if (error)
+		return error;
+
+	effect->id = work_data->ff_effect->id;
+	effect->bank = CS40L26_BANK_BUZ;
+
+	/* BUZZGEN slot 1 is reserved for OTP buzz so offset of 1 required */
+	effect->index = CS40L26_BUZZGEN_INDEX_START + slot + 1;
+
+	return 0;
+}
+
+static int cs40l26_num_ram_waves(struct cs40l26_vibra *vib)
+{
+	u32 nwaves;
+	int error;
+
+	guard(mutex)(&vib->cs40l26->dsp.pwr_lock);
+
+	error = cs40l26_fw_read(&vib->cs40l26->dsp, "NUM_OF_WAVES",
+				vib->cs40l26->variant->info->vibegen_algo_id, &nwaves);
+
+	return error ? error : (int)nwaves;
+}
+
+static int cs40l26_trigger_index_get(struct cs40l26_vibra *vib, struct cs40l26_work *work_data,
+				     enum cs40l26_bank bank, u32 *trigger_index)
+{
+	u16 index = (u16)(work_data->custom_data[1] & CS40L26_MAX_INDEX_MASK);
+	struct device *dev = vib->cs40l26->dev;
+	int error = 0, nwaves;
+	u32 index_start;
+
+	switch (bank) {
+	case CS40L26_BANK_RAM:
+		nwaves = cs40l26_num_ram_waves(vib);
+		if (nwaves < 0) {
+			error = nwaves;
+		} else if (nwaves == 0) {
+			dev_err(dev, "No waveforms in RAM bank\n");
+			error = -ENODATA;
+		}
+
+		index_start = CS40L26_RAM_INDEX_START;
+		break;
+	case CS40L26_BANK_ROM:
+		nwaves = CS40L26_NUM_ROM_WAVES;
+		index_start = CS40L26_ROM_INDEX_START;
+		break;
+	default:
+		dev_err(dev, "Invalid bank %u\n", bank);
+		error = -EINVAL;
+	}
+
+	if (error)
+		return error;
+
+	if (index > nwaves - 1) {
+		dev_err(dev, "Index %u invalid for bank %u (%d waveforms)\n", index, bank, nwaves);
+		return -EINVAL;
+	}
+
+	*trigger_index = index + index_start;
+
+	return 0;
+}
+
+static int cs40l26_custom_upload(struct cs40l26_vibra *vib, struct cs40l26_work *work_data,
+				 struct cs40l26_effect *effect)
+{
+	size_t data_len = work_data->ff_effect->u.periodic.custom_len;
+	enum cs40l26_bank bank;
+	int error;
+
+	if (data_len != 2) {
+		dev_err(vib->cs40l26->dev, "Invalid custom data length %zd\n", data_len);
+		return -EINVAL;
+	}
+
+	bank = (enum cs40l26_bank)work_data->custom_data[0];
+
+	error = cs40l26_trigger_index_get(vib, work_data, bank, &effect->index);
+	if (error)
+		return error;
+
+	effect->id = work_data->ff_effect->id;
+	effect->bank = bank;
+
+	return 0;
+}
+
+static struct cs40l26_effect *cs40l26_find_effect(struct cs40l26_vibra *vib, int id)
+{
+	struct cs40l26_effect *effect;
+
+	if (list_empty(&vib->effect_head))
+		return NULL;
+
+	list_for_each_entry(effect, &vib->effect_head, list) {
+		if (effect->id == id)
+			return effect;
+	}
+
+	return NULL;
+}
+
+static void cs40l26_upload_worker(struct work_struct *work)
+{
+	struct cs40l26_work *work_data = container_of(work, struct cs40l26_work, work);
+	struct cs40l26_vibra *vib = work_data->vib;
+	struct device *dev = vib->cs40l26->dev;
+	struct cs40l26_effect *effect;
+	bool new_effect = false;
+	int error;
+
+	error = pm_runtime_resume_and_get(dev);
+	if (error) {
+		work_data->error = error;
+		return;
+	}
+
+	effect = cs40l26_find_effect(vib, work_data->ff_effect->id);
+	if (!effect) {
+		effect = devm_kzalloc(dev, sizeof(struct cs40l26_effect), GFP_KERNEL);
+		if (!effect) {
+			cs40l26_pm_exit(dev);
+
+			work_data->error = -ENOMEM;
+			return;
+		}
+
+		new_effect = true;
+	}
+
+	if (work_data->ff_effect->u.periodic.waveform == FF_CUSTOM) {
+		error = cs40l26_custom_upload(vib, work_data, effect);
+	} else if (work_data->ff_effect->u.periodic.waveform == FF_SINE) {
+		error = cs40l26_sine_upload(vib, work_data, effect);
+	} else {
+		dev_err(dev, "Type 0x%X unsupported\n", work_data->ff_effect->u.periodic.waveform);
+		error = -EINVAL;
+	}
+
+	if (error) {
+		if (new_effect)
+			devm_kfree(dev, effect);
+
+		cs40l26_pm_exit(dev);
+
+		work_data->error = error;
+		return;
+	}
+
+	if (new_effect)
+		list_add(&effect->list, &vib->effect_head);
+
+	cs40l26_pm_exit(dev);
+
+	work_data->error = 0;
+}
+
+static int cs40l26_upload(struct input_dev *dev, struct ff_effect *effect, struct ff_effect *old)
+{
+	struct cs40l26_vibra *vib = input_get_drvdata(dev);
+	bool custom = false;
+	struct cs40l26_work *work_data;
+	int error;
+
+	work_data = kzalloc(sizeof(struct cs40l26_work), GFP_KERNEL);
+	if (!work_data)
+		return -ENOMEM;
+
+	if (effect->u.periodic.waveform == FF_CUSTOM) {
+		work_data->custom_data = memdup_array_user(effect->u.periodic.custom_data,
+							   effect->u.periodic.custom_len,
+							   sizeof(s16));
+		if (IS_ERR(work_data->custom_data)) {
+			error = PTR_ERR(work_data->custom_data);
+			goto out_free;
+		}
+
+		custom = true;
+		work_data->custom_len = effect->u.periodic.custom_len;
+	}
+
+	work_data->vib = vib;
+	work_data->ff_effect = effect;
+
+	INIT_WORK(&work_data->work, cs40l26_upload_worker);
+
+	queue_work(vib->vib_wq, &work_data->work);
+	flush_work(&work_data->work);
+
+	error = work_data->error;
+
+out_free:
+	if (custom)
+		kfree(work_data->custom_data);
+
+	kfree(work_data);
+
+	return error;
+}
+
+static void cs40l26_stop_playback_worker(struct work_struct *work)
+{
+	struct cs40l26_work *work_data = container_of(work, struct cs40l26_work, work);
+	struct cs40l26_vibra *vib = work_data->vib;
+
+	if (pm_runtime_resume_and_get(vib->cs40l26->dev))
+		goto out_free;
+
+	if (cs40l26_dsp_write(vib->cs40l26, CS40L26_STOP_PLAYBACK))
+		dev_err(vib->cs40l26->dev, "Failed to stop haptic playback\n");
+
+	cs40l26_pm_exit(vib->cs40l26->dev);
+out_free:
+	kfree(work_data);
+}
+
+static void cs40l26_start_playback_worker(struct work_struct *work)
+{
+	struct cs40l26_work *work_data = container_of(work, struct cs40l26_work, work);
+	struct cs40l26 *cs40l26 = work_data->vib->cs40l26;
+	struct cs40l26_effect *effect;
+	u16 duration;
+	int id;
+
+	id = work_data->ff_effect->id;
+
+	duration = work_data->ff_effect->replay.length;
+
+	if (pm_runtime_resume_and_get(cs40l26->dev))
+		goto out_free;
+
+	guard(mutex)(&cs40l26->dsp.pwr_lock);
+
+	if (cs40l26_fw_write(&cs40l26->dsp, "TIMEOUT_MS", cs40l26->variant->info->vibegen_algo_id,
+			     duration))
+		goto out_pm;
+
+	effect = cs40l26_find_effect(work_data->vib, id);
+	if (effect) {
+		while (--work_data->count >= 0) {
+			if (cs40l26_dsp_write(cs40l26, effect->index))
+				goto out_pm;
+
+			usleep_range(duration, duration + 100);
+		}
+	} else {
+		dev_err(cs40l26->dev, "No effect found with ID %d\n", id);
+	}
+
+out_pm:
+	cs40l26_pm_exit(cs40l26->dev);
+
+out_free:
+	kfree(work_data);
+}
+
+static int cs40l26_playback(struct input_dev *dev, int effect_id, int val)
+{
+	struct cs40l26_vibra *vib = input_get_drvdata(dev);
+	struct cs40l26_work *work_data;
+
+	work_data = kzalloc(sizeof(struct cs40l26_work), GFP_ATOMIC);
+	if (!work_data)
+		return -ENOMEM;
+
+	work_data->vib = vib;
+
+	if (val > 0) {
+		work_data->ff_effect = &dev->ff->effects[effect_id];
+		work_data->count = val;
+		INIT_WORK(&work_data->work, cs40l26_start_playback_worker);
+	} else {
+		INIT_WORK(&work_data->work, cs40l26_stop_playback_worker);
+	}
+
+	queue_work(vib->vib_wq, &work_data->work);
+
+	return 0;
+}
+
+static int cs40l26_sine_erase(struct cs40l26_vibra *vib, int id)
+{
+	int slot = cs40l26_buzzgen_find_slot(id);
+
+	if (slot == -1) {
+		dev_err(vib->cs40l26->dev, "No BUZZGEN ID matching %d\n", id);
+		return -EINVAL;
+	}
+
+	cs40l26_buzzgen_configs[slot].effect_id = -1;
+
+	return 0;
+}
+
+static void cs40l26_erase_worker(struct work_struct *work)
+{
+	struct cs40l26_work *work_data = container_of(work, struct cs40l26_work, work);
+	struct cs40l26_vibra *vib = work_data->vib;
+	struct device *dev = vib->cs40l26->dev;
+	int id = work_data->ff_effect->id;
+	struct cs40l26_effect *effect;
+	int error;
+
+	error = pm_runtime_resume_and_get(dev);
+	if (error) {
+		work_data->error = error;
+		return;
+	}
+
+	effect = cs40l26_find_effect(vib, id);
+	if (!effect) {
+		dev_err(dev, "Cannot erase effect with ID %d, no such effect\n", id);
+		error = -EINVAL;
+		goto out_pm;
+	}
+
+	if (effect->bank == CS40L26_BANK_BUZ) {
+		error = cs40l26_sine_erase(vib, id);
+		if (error)
+			goto out_pm;
+	}
+
+	list_del(&effect->list);
+	devm_kfree(dev, effect);
+
+out_pm:
+	cs40l26_pm_exit(dev);
+
+	work_data->error = error;
+}
+
+static int cs40l26_erase(struct input_dev *dev, int effect_id)
+{
+	struct cs40l26_vibra *vib = input_get_drvdata(dev);
+	struct cs40l26_work *work_data;
+	int error;
+
+	work_data = kzalloc(sizeof(struct cs40l26_work), GFP_KERNEL);
+	if (!work_data)
+		return -ENOMEM;
+
+	work_data->vib = vib;
+	work_data->error = 0;
+	work_data->ff_effect = &dev->ff->effects[effect_id];
+
+	INIT_WORK(&work_data->work, cs40l26_erase_worker);
+
+	queue_work(vib->vib_wq, &work_data->work);
+	flush_work(&work_data->work);
+
+	error = work_data->error;
+
+	kfree(work_data);
+
+	return error;
+}
+
+/* LUT for converting gain percentage to attenuation in dB */
+static const u32 cs40l26_atten_lut_q21_2[CS40L26_NUM_PCT_MAP_VALUES] = {
+	/* MUTE */ 400, 160, 136, 122, 112, 104, 98, 92, 88, 84, 80, 77, 74,
+	71, 68, 66, 64, 62, 60, 58, 56, 54, 53,	51, 50, 48, 47, 45, 44, 43,
+	42, 41, 40, 39, 37, 36,	35, 35, 34, 33, 32, 31, 30, 29, 29, 28, 27,
+	26, 26, 25, 24,	23, 23, 22, 21, 21, 20, 20, 19, 18, 18, 17, 17, 16,
+	16, 15, 14, 14, 13, 13, 12, 12, 11, 11, 10, 10, 10, 9, 9, 8, 8, 7,
+	7, 6, 6, 6, 5, 5, 4, 4, 4, 3, 3, 3, 2, 2, 1, 1, 1, 0, 0, /* 100% */
+};
+
+static void cs40l26_set_gain_worker(struct work_struct *work)
+{
+	struct cs40l26_work *work_data = container_of(work, struct cs40l26_work, work);
+	struct cs40l26_vibra *vib = work_data->vib;
+	struct cs40l26 *cs40l26 = vib->cs40l26;
+	int error;
+
+	error = pm_runtime_resume_and_get(vib->cs40l26->dev);
+	if (error) {
+		dev_err(vib->cs40l26->dev, "%s: Failed to exit hibernate\n", __func__);
+		goto out_free;
+	}
+
+	guard(mutex)(&vib->cs40l26->dsp.pwr_lock);
+
+	error = cs40l26_fw_write(&vib->cs40l26->dsp, "SOURCE_ATTENUATION",
+				 cs40l26->variant->info->ram_ext_algo_id,
+				 cs40l26_atten_lut_q21_2[work_data->gain_pct]);
+	if (error)
+		dev_err(vib->cs40l26->dev, "Failed to set attenuation\n");
+
+	cs40l26_pm_exit(vib->cs40l26->dev);
+
+out_free:
+	kfree(work_data);
+}
+
+static void cs40l26_set_gain(struct input_dev *dev, u16 gain)
+{
+	struct cs40l26_vibra *vib = input_get_drvdata(dev);
+	struct cs40l26_work *work_data;
+
+	if (gain >= CS40L26_NUM_PCT_MAP_VALUES) {
+		dev_err(vib->cs40l26->dev, "Gain value %u%% out of bounds\n", gain);
+		return;
+	}
+
+	work_data = kzalloc(sizeof(struct cs40l26_work), GFP_ATOMIC);
+	if (!work_data)
+		return;
+
+	work_data->gain_pct = gain;
+	work_data->vib = vib;
+
+	INIT_WORK(&work_data->work, cs40l26_set_gain_worker);
+
+	queue_work(vib->vib_wq, &work_data->work);
+}
+
+static void cs40l26_remove_wq(void *data)
+{
+	flush_workqueue(data);
+	destroy_workqueue((struct workqueue_struct *)data);
+}
+
+static int cs40l26_vibra_probe(struct platform_device *pdev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(pdev->dev.parent);
+	struct cs40l26_vibra *vib;
+	int error;
+
+	vib = devm_kzalloc(cs40l26->dev, sizeof(struct cs40l26_vibra), GFP_KERNEL);
+	if (!vib)
+		return -ENOMEM;
+
+	vib->cs40l26 = cs40l26;
+
+	vib->input = devm_input_allocate_device(vib->cs40l26->dev);
+	if (!vib->input)
+		return -ENOMEM;
+
+	vib->input->id.product = cs40l26->devid;
+	vib->input->id.version = cs40l26->revid;
+	vib->input->name = "cs40l26_vibra";
+
+	input_set_drvdata(vib->input, vib);
+	input_set_capability(vib->input, EV_FF, FF_PERIODIC);
+	input_set_capability(vib->input, EV_FF, FF_CUSTOM);
+	input_set_capability(vib->input, EV_FF, FF_SINE);
+	input_set_capability(vib->input, EV_FF, FF_GAIN);
+
+	error = input_ff_create(vib->input, 1);
+	if (error) {
+		dev_err(vib->cs40l26->dev, "Failed to create input device\n");
+		return error;
+	}
+
+	clear_bit(FF_RUMBLE, vib->input->ffbit);
+
+	vib->input->ff->upload = cs40l26_upload;
+	vib->input->ff->playback = cs40l26_playback;
+	vib->input->ff->set_gain = cs40l26_set_gain;
+	vib->input->ff->erase = cs40l26_erase;
+
+	INIT_LIST_HEAD(&vib->effect_head);
+
+	vib->vib_wq = alloc_ordered_workqueue("vib_wq", WQ_HIGHPRI);
+	if (!vib->vib_wq)
+		return -ENOMEM;
+
+	error = devm_add_action_or_reset(vib->cs40l26->dev, cs40l26_remove_wq, vib->vib_wq);
+	if (error)
+		return error;
+
+	error = input_register_device(vib->input);
+	if (error)
+		return error;
+
+	dev_info(vib->cs40l26->dev, "Loaded cs40l26-vibra with %d RAM waveforms\n",
+		 cs40l26_num_ram_waves(vib));
+
+	return 0;
+}
+
+static const struct platform_device_id cs40l26_vibra_id_match[] = {
+	{ "cs40l26-vibra", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, cs40l26_vibra_id_match);
+
+static struct platform_driver cs40l26_vibra_driver = {
+	.probe		= cs40l26_vibra_probe,
+	.id_table	= cs40l26_vibra_id_match,
+	.driver		= {
+		.name	= "cs40l26-vibra",
+	},
+};
+module_platform_driver(cs40l26_vibra_driver);
+
+MODULE_DESCRIPTION("CS40L26 Boosted Class D Amplifier for Haptics");
+MODULE_AUTHOR("Fred Treven, Cirrus Logic Inc. <ftreven@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1



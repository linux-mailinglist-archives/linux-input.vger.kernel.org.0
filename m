Return-Path: <linux-input+bounces-1719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E8B84C16E
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 01:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FC1A1C21D39
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 00:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92949454;
	Wed,  7 Feb 2024 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Wz+eB2F1"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA528F48;
	Wed,  7 Feb 2024 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266224; cv=none; b=bMG/G7N0v9HONpvzsqTl4U7ipX00xePlwXp81r7vjetgQgUuKLxTnIHQcRn5bbx0DveWrSSRM8D0Ylzt/gZ6IEIoMGu8VBNIlgnYnF6VY/z9rFz7h2ESdeIYTNj63sUbiTp496yQEEz7CEJRPY5+4pcYrLT5zTkr2UpwH393oBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266224; c=relaxed/simple;
	bh=Q77eP9BlgsHS3+Rd+GFZpg0wZysfS2mudbPFQY4pBbw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b9LUG9z7qkWhSgSB3wCaGwBCvW9OWwysidBrQoNEvaOaKgID84PSPukgims+fcDbdKFzlJj8WyxGQRG+EI1FWzBPiaDXZp3ugdAJmmuxxek+tXCNubExzgd4hBISENiRrYDDoNUwcrOoDn0gy+ihpO0NVXhl+HIAAbRnPxcwoHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Wz+eB2F1; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416AS7SK031521;
	Tue, 6 Feb 2024 18:36:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=CQ39LmvJ5XiLh4OsF067Tkk6ZcmreIjE1P0+wrkk23k=; b=
	Wz+eB2F1wjy+jkFFhcyHpv691TTTFZ5uA33l9Es3jeREaxMtvIg/BMvP8ouXFk8n
	5ojuINWHAsl+MZ/KFc2b2g5dT+5es7HoxT5CjOs0jqQjM4HS7L1ZN35WIbwlfB5o
	BDOnQHHUoy7ouNa07lpr8hDLkVcHfGo9FmTVW9KJkeHXDnM44omWq0Zch0uUs/VJ
	xDe8ml1ApQd66298kADlUbGPa7UqsGMqpvmmxVWk2bR3AoMQkmP/b2jl7emlkxJL
	iHvVBykONQGh6qdINhYSE7G3x9QE2mainZNQJgkT2Vxic94k6hEkyIUNY921RT2D
	k0Ym8B4j5d4pbQFrPw2Gjg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2cbgh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 18:36:56 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 00:36:53 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 7 Feb 2024 00:36:53 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2E1D9820248;
	Wed,  7 Feb 2024 00:36:52 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v6 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Date: Wed, 7 Feb 2024 00:36:12 +0000
Message-ID: <20240207003612.4187370-6-jogletre@opensource.cirrus.com>
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
X-Proofpoint-GUID: n_E4LKI5l3YF56kFSirbhbcljxaj2U6q
X-Proofpoint-ORIG-GUID: n_E4LKI5l3YF56kFSirbhbcljxaj2U6q
X-Proofpoint-Spam-Reason: safe

Introduce support for Cirrus Logic Device CS40L50: a
haptic driver with waveform memory, integrated DSP,
and closed-loop algorithms.

The ASoC driver enables I2S streaming to the device.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 MAINTAINERS                      |   1 +
 sound/soc/codecs/Kconfig         |  11 ++
 sound/soc/codecs/Makefile        |   2 +
 sound/soc/codecs/cs40l50-codec.c | 311 +++++++++++++++++++++++++++++++
 4 files changed, 325 insertions(+)
 create mode 100644 sound/soc/codecs/cs40l50-codec.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 24cfb4f017bb..fca2454a7a38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4943,6 +4943,7 @@ F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
 F:	drivers/input/misc/cs40l*
 F:	drivers/mfd/cs40l*
 F:	include/linux/mfd/cs40l*
+F:	sound/soc/codecs/cs40l*
 
 CIRRUS LOGIC DSP FIRMWARE DRIVER
 M:	Simon Trimmer <simont@opensource.cirrus.com>
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f1e1dbc509f6..1a81bedfdbe3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -73,6 +73,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_CS35L56_I2C
 	imply SND_SOC_CS35L56_SPI
 	imply SND_SOC_CS35L56_SDW
+	imply SND_SOC_CS40L50
 	imply SND_SOC_CS42L42
 	imply SND_SOC_CS42L42_SDW
 	imply SND_SOC_CS42L43
@@ -800,6 +801,16 @@ config SND_SOC_CS35L56_SDW
 	help
 	  Enable support for Cirrus Logic CS35L56 boosted amplifier with SoundWire control
 
+config SND_SOC_CS40L50
+	tristate "Cirrus Logic CS40L50 CODEC"
+	depends on MFD_CS40L50_CORE
+	help
+	  This option enables support for I2S streaming to Cirrus Logic CS40L50.
+
+	  CS40L50 is a haptic driver with waveform memory, an integrated
+	  DSP, and closed-loop algorithms. If built as a module, it will be
+	  called snd-soc-cs40l50.
+
 config SND_SOC_CS42L42_CORE
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index a87e56938ce5..7e31f000774a 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -74,6 +74,7 @@ snd-soc-cs35l56-shared-objs := cs35l56-shared.o
 snd-soc-cs35l56-i2c-objs := cs35l56-i2c.o
 snd-soc-cs35l56-spi-objs := cs35l56-spi.o
 snd-soc-cs35l56-sdw-objs := cs35l56-sdw.o
+snd-soc-cs40l50-objs := cs40l50-codec.o
 snd-soc-cs42l42-objs := cs42l42.o
 snd-soc-cs42l42-i2c-objs := cs42l42-i2c.o
 snd-soc-cs42l42-sdw-objs := cs42l42-sdw.o
@@ -460,6 +461,7 @@ obj-$(CONFIG_SND_SOC_CS35L56_SHARED)	+= snd-soc-cs35l56-shared.o
 obj-$(CONFIG_SND_SOC_CS35L56_I2C)	+= snd-soc-cs35l56-i2c.o
 obj-$(CONFIG_SND_SOC_CS35L56_SPI)	+= snd-soc-cs35l56-spi.o
 obj-$(CONFIG_SND_SOC_CS35L56_SDW)	+= snd-soc-cs35l56-sdw.o
+obj-$(CONFIG_SND_SOC_CS40L50)		+= snd-soc-cs40l50.o
 obj-$(CONFIG_SND_SOC_CS42L42_CORE)	+= snd-soc-cs42l42.o
 obj-$(CONFIG_SND_SOC_CS42L42)	+= snd-soc-cs42l42-i2c.o
 obj-$(CONFIG_SND_SOC_CS42L42_SDW)	+= snd-soc-cs42l42-sdw.o
diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
new file mode 100644
index 000000000000..3632069d6091
--- /dev/null
+++ b/sound/soc/codecs/cs40l50-codec.c
@@ -0,0 +1,311 @@
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
+#include <linux/mfd/cs40l50.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#define CS40L50_REFCLK_INPUT		0x2C04
+#define CS40L50_ASP_CONTROL2		0x4808
+#define CS40L50_ASP_DATA_CONTROL5	0x4840
+
+/* PLL Config */
+#define CS40L50_PLL_CLK_CFG_32768	0x00
+#define CS40L50_PLL_CLK_CFG_1536000	0x1B
+#define CS40L50_PLL_CLK_CFG_3072000	0x21
+#define CS40L50_PLL_CLK_CFG_6144000	0x28
+#define CS40L50_PLL_CLK_CFG_9600000	0x30
+#define CS40L50_PLL_CLK_CFG_12288000	0x33
+#define CS40L50_PLL_CLK_FRQ_32768	32768
+#define CS40L50_PLL_CLK_FRQ_1536000	1536000
+#define CS40L50_PLL_CLK_FRQ_3072000	3072000
+#define CS40L50_PLL_CLK_FRQ_6144000	6144000
+#define CS40L50_PLL_CLK_FRQ_9600000	9600000
+#define CS40L50_PLL_CLK_FRQ_12288000	12288000
+#define CS40L50_PLL_REFCLK_BCLK		0x0
+#define CS40L50_PLL_REFCLK_MCLK		0x5
+#define CS40L50_PLL_REFCLK_LOOP_MASK	BIT(11)
+#define CS40L50_PLL_REFCLK_OPEN_LOOP	1
+#define CS40L50_PLL_REFCLK_CLOSED_LOOP	0
+#define CS40L50_PLL_REFCLK_LOOP_SHIFT	11
+#define CS40L50_PLL_REFCLK_FREQ_MASK	GENMASK(10, 5)
+#define CS40L50_PLL_REFCLK_FREQ_SHIFT	5
+#define CS40L50_PLL_REFCLK_SEL_MASK	GENMASK(2, 0)
+
+/* ASP Config */
+#define CS40L50_ASP_RX_WIDTH_SHIFT	24
+#define CS40L50_ASP_RX_WIDTH_MASK	GENMASK(31, 24)
+#define CS40L50_ASP_RX_WL_MASK		GENMASK(5, 0)
+#define CS40L50_ASP_FSYNC_INV_MASK	BIT(2)
+#define CS40L50_ASP_BCLK_INV_MASK	BIT(6)
+#define CS40L50_ASP_FMT_MASK		GENMASK(10, 8)
+#define CS40L50_ASP_FMT_I2S		0x2
+#define CS40L50_FORMATS			(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+
+struct cs40l50_pll_sysclk_config {
+	unsigned int freq;
+	unsigned int clk_cfg;
+};
+
+struct cs40l50_codec {
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned int sysclk_rate;
+	unsigned int daifmt;
+};
+
+static const struct cs40l50_pll_sysclk_config cs40l50_pll_sysclk[] = {
+	{CS40L50_PLL_CLK_FRQ_32768, CS40L50_PLL_CLK_CFG_32768},
+	{CS40L50_PLL_CLK_FRQ_1536000, CS40L50_PLL_CLK_CFG_1536000},
+	{CS40L50_PLL_CLK_FRQ_3072000, CS40L50_PLL_CLK_CFG_3072000},
+	{CS40L50_PLL_CLK_FRQ_6144000, CS40L50_PLL_CLK_CFG_6144000},
+	{CS40L50_PLL_CLK_FRQ_9600000, CS40L50_PLL_CLK_CFG_9600000},
+	{CS40L50_PLL_CLK_FRQ_12288000, CS40L50_PLL_CLK_CFG_12288000},
+};
+
+static int cs40l50_get_clk_config(unsigned int freq, unsigned int *clk_cfg)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs40l50_pll_sysclk); i++) {
+		if (cs40l50_pll_sysclk[i].freq == freq) {
+			*clk_cfg = cs40l50_pll_sysclk[i].clk_cfg;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int cs40l50_swap_ext_clk(struct cs40l50_codec *codec, unsigned int clk_src)
+{
+	unsigned int clk_cfg;
+	int ret;
+
+	switch (clk_src) {
+	case CS40L50_PLL_REFCLK_BCLK:
+		ret = cs40l50_get_clk_config(codec->sysclk_rate, &clk_cfg);
+		if (ret)
+			return ret;
+		break;
+	case CS40L50_PLL_REFCLK_MCLK:
+		clk_cfg = CS40L50_PLL_CLK_CFG_32768;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(codec->regmap, CS40L50_REFCLK_INPUT,
+				 CS40L50_PLL_REFCLK_LOOP_MASK,
+				 CS40L50_PLL_REFCLK_OPEN_LOOP <<
+				 CS40L50_PLL_REFCLK_LOOP_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(codec->regmap, CS40L50_REFCLK_INPUT,
+				 CS40L50_PLL_REFCLK_FREQ_MASK |
+				 CS40L50_PLL_REFCLK_SEL_MASK,
+				 (clk_cfg << CS40L50_PLL_REFCLK_FREQ_SHIFT) | clk_src);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(codec->regmap, CS40L50_REFCLK_INPUT,
+				  CS40L50_PLL_REFCLK_LOOP_MASK,
+				  CS40L50_PLL_REFCLK_CLOSED_LOOP <<
+				  CS40L50_PLL_REFCLK_LOOP_SHIFT);
+}
+
+static int cs40l50_clk_en(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(comp);
+	int ret;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = cs40l50_dsp_write(codec->dev, codec->regmap, CS40L50_STOP_PLAYBACK);
+		if (ret)
+			return ret;
+
+		ret = cs40l50_dsp_write(codec->dev, codec->regmap, CS40L50_START_I2S);
+		if (ret)
+			return ret;
+
+		ret = cs40l50_swap_ext_clk(codec, CS40L50_PLL_REFCLK_BCLK);
+		if (ret)
+			return ret;
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = cs40l50_swap_ext_clk(codec, CS40L50_PLL_REFCLK_MCLK);
+		if (ret)
+			return ret;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget cs40l50_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY_S("ASP PLL", 0, SND_SOC_NOPM, 0, 0, cs40l50_clk_en,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_AIF_IN("ASPRX1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("ASPRX2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route cs40l50_dapm_routes[] = {
+	{ "ASP Playback", NULL, "ASP PLL" },
+	{ "ASPRX1", NULL, "ASP Playback" },
+	{ "ASPRX2", NULL, "ASP Playback" },
+
+	{ "OUT", NULL, "ASPRX1" },
+	{ "OUT", NULL, "ASPRX2" },
+};
+
+static int cs40l50_component_set_sysclk(struct snd_soc_component *component,
+		int clk_id, int source, unsigned int freq, int dir)
+{
+	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(component);
+
+	codec->sysclk_rate = freq;
+
+	return 0;
+}
+
+static int cs40l50_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(codec_dai->component);
+
+	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
+		return -EINVAL;
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		codec->daifmt = 0;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		codec->daifmt = CS40L50_ASP_FSYNC_INV_MASK;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		codec->daifmt = CS40L50_ASP_BCLK_INV_MASK;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		codec->daifmt = CS40L50_ASP_FSYNC_INV_MASK | CS40L50_ASP_BCLK_INV_MASK;
+		break;
+	default:
+		dev_err(codec->dev, "Invalid clock invert\n");
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		codec->daifmt |= FIELD_PREP(CS40L50_ASP_FMT_MASK, CS40L50_ASP_FMT_I2S);
+		break;
+	default:
+		dev_err(codec->dev, "Unsupported DAI format\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cs40l50_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(dai->component);
+	unsigned int asp_rx_wl = params_width(params);
+	int ret;
+
+	ret = regmap_update_bits(codec->regmap, CS40L50_ASP_DATA_CONTROL5,
+				 CS40L50_ASP_RX_WL_MASK, asp_rx_wl);
+	if (ret)
+		return ret;
+
+	codec->daifmt |= (asp_rx_wl << CS40L50_ASP_RX_WIDTH_SHIFT);
+
+	return regmap_update_bits(codec->regmap, CS40L50_ASP_CONTROL2,
+				  CS40L50_ASP_FSYNC_INV_MASK |
+				  CS40L50_ASP_BCLK_INV_MASK |
+				  CS40L50_ASP_FMT_MASK |
+				  CS40L50_ASP_RX_WIDTH_MASK, codec->daifmt);
+}
+
+static const struct snd_soc_dai_ops cs40l50_dai_ops = {
+	.set_fmt = cs40l50_set_dai_fmt,
+	.hw_params = cs40l50_hw_params,
+};
+
+static struct snd_soc_dai_driver cs40l50_dai[] = {
+	{
+		.name = "cs40l50-pcm",
+		.id = 0,
+		.playback = {
+			.stream_name = "ASP Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_48000,
+			.formats = CS40L50_FORMATS,
+		},
+		.ops = &cs40l50_dai_ops,
+	},
+};
+
+static int cs40l50_codec_probe(struct snd_soc_component *component)
+{
+	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(component);
+
+	codec->sysclk_rate = CS40L50_PLL_CLK_FRQ_1536000;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_cs40l50 = {
+	.probe = cs40l50_codec_probe,
+	.set_sysclk = cs40l50_component_set_sysclk,
+	.dapm_widgets = cs40l50_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cs40l50_dapm_widgets),
+	.dapm_routes = cs40l50_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(cs40l50_dapm_routes),
+};
+
+static int cs40l50_codec_driver_probe(struct platform_device *pdev)
+{
+	struct cs40l50 *cs40l50 = dev_get_drvdata(pdev->dev.parent);
+	struct cs40l50_codec *codec;
+
+	codec = devm_kzalloc(&pdev->dev, sizeof(*codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	codec->regmap = cs40l50->regmap;
+	codec->dev = &pdev->dev;
+
+	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cs40l50,
+					       cs40l50_dai, ARRAY_SIZE(cs40l50_dai));
+}
+
+static struct platform_driver cs40l50_codec_driver = {
+	.probe = cs40l50_codec_driver_probe,
+	.driver = {
+		.name = "cs40l50-codec",
+	},
+};
+module_platform_driver(cs40l50_codec_driver);
+
+MODULE_DESCRIPTION("ASoC CS40L50 driver");
+MODULE_AUTHOR("James Ogletree <james.ogletree@cirrus.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1



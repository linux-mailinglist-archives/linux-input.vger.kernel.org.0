Return-Path: <linux-input+bounces-9774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A53AA27F8A
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F87A18860B4
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 23:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD5621D018;
	Tue,  4 Feb 2025 23:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l+kysFiy"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B6621C9EE;
	Tue,  4 Feb 2025 23:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711464; cv=none; b=kRs49NAXQKvunPI5PXs2K0Ab/DyH5tlP+bEl+t+f05+otqgLSstjmx9WXit8o65a6wcj7Gxx0Yk26uGeRVsdeKNsBNqrFZvmiqv9+dL3lpq9Sx4bLJ39a23+XORjjEaOzqCc7q8nJ6SwUK1SSIPpNgPyAIypFftNHMjlMCJiGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711464; c=relaxed/simple;
	bh=sIln//XUWOCbv+jbIU+HIsNsEaNVSCpgYZ+FUr6PS8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hg1t9IzOqyeYLtlXihshKrawWMgvGHalNbml6caktxC3vt4wefl/aUcAz+q77WjH641bx8LhmpZ8Zwd7T+o9KFVVN5OAPdIXD9jnMddPPbkSb8bBwbVnw5E8uspuFbuzFAUqu+42aXpO9hGoZxqhgWVa4Y54Bd4q/nL/oR4L7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l+kysFiy; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514FmAYv022131;
	Tue, 4 Feb 2025 17:20:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vbeaKiAV8j9TomN/Mh6JI2DXEEZVRCZpyRAxRLZvhJo=; b=
	l+kysFiyTFiepxtfC6QC6cvJ8HYwcd0ZrZWifK86VUUIH7Ru0k+PPuHnVFg6Epmr
	4Xv1OrwFiv6DuYieJB/Fj45RUVBxPdEkbw9hb88sVkG4Auy+XHkzN7LbrK5FZBpd
	xcStX6aFgr1Ap96ONvHW/W7POcAbVcL7XBjzArYnecwpxjxSoep7G6egLNvMLU5t
	2rQR/SmK90lRNnPTGYi2tsOx/ma+yVDC7ae5VbnctM+vrX8WdMfMPKadZr831IoY
	eFf98m6B8/zRDNKVONV9jH2avFHyUfB5bdk2tUBBHetNL0jZAX8v7/lYnzoGH6tO
	4dXXM91+E3ev12GPN75odw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm3sqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:20:21 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:20:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:20:14 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 30309820248;
	Tue,  4 Feb 2025 23:20:10 +0000 (UTC)
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
Subject: [PATCH RESEND 6/7] ASoC: cs40l26: Support I2S streaming to CS40L26
Date: Tue, 4 Feb 2025 17:18:35 -0600
Message-ID: <20250204231835.2000457-7-ftreven@opensource.cirrus.com>
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
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a2a0b5 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=CNfp1fVX68x8Q3iYfccA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: lA0UnrLd6glWyAKyuQOnA1OYayb_B1pb
X-Proofpoint-GUID: lA0UnrLd6glWyAKyuQOnA1OYayb_B1pb
X-Proofpoint-Spam-Reason: safe

Introduce codec support for Cirrus Logic Device CS40L26.

The ASoC driver enables I2S streaming to the device.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig         |  12 +
 sound/soc/codecs/Makefile        |   2 +
 sound/soc/codecs/cs40l26-codec.c | 523 +++++++++++++++++++++++++++++++
 3 files changed, 537 insertions(+)
 create mode 100644 sound/soc/codecs/cs40l26-codec.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ee35f3aa5521..850b5fab984c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -77,6 +77,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_CS35L56_I2C
 	imply SND_SOC_CS35L56_SPI
 	imply SND_SOC_CS35L56_SDW
+	imply SND_SOC_CS40L26
 	imply SND_SOC_CS40L50
 	imply SND_SOC_CS42L42
 	imply SND_SOC_CS42L42_SDW
@@ -875,6 +876,17 @@ config SND_SOC_CS35L56_SDW
 	help
 	  Enable support for Cirrus Logic CS35L56 boosted amplifier with SoundWire control
 
+config SND_SOC_CS40L26
+	tristate "Cirrus Logic CS40L26 CODEC"
+	depends on MFD_CS40L26_CORE
+	help
+	  This option enables support for I2S streaming to Cirrus Logic CS40L26.
+
+	  CS40L26 is a boosted haptic driver with integrated DSP and waveform
+	  memory with advanced closed loop algorithms and LRA protection.
+
+	  If built as a module, it will be named snd-soc-cs40l26.
+
 config SND_SOC_CS40L50
 	tristate "Cirrus Logic CS40L50 CODEC"
 	depends on MFD_CS40L50_CORE
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d7ad795603c1..086e18964e60 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -80,6 +80,7 @@ snd-soc-cs35l56-shared-y := cs35l56-shared.o
 snd-soc-cs35l56-i2c-y := cs35l56-i2c.o
 snd-soc-cs35l56-spi-y := cs35l56-spi.o
 snd-soc-cs35l56-sdw-y := cs35l56-sdw.o
+snd-soc-cs40l26-y := cs40l26-codec.o
 snd-soc-cs40l50-y := cs40l50-codec.o
 snd-soc-cs42l42-y := cs42l42.o
 snd-soc-cs42l42-i2c-y := cs42l42-i2c.o
@@ -497,6 +498,7 @@ obj-$(CONFIG_SND_SOC_CS35L56_SHARED)	+= snd-soc-cs35l56-shared.o
 obj-$(CONFIG_SND_SOC_CS35L56_I2C)	+= snd-soc-cs35l56-i2c.o
 obj-$(CONFIG_SND_SOC_CS35L56_SPI)	+= snd-soc-cs35l56-spi.o
 obj-$(CONFIG_SND_SOC_CS35L56_SDW)	+= snd-soc-cs35l56-sdw.o
+obj-$(CONFIG_SND_SOC_CS40L26)		+= snd-soc-cs40l26.o
 obj-$(CONFIG_SND_SOC_CS40L50)		+= snd-soc-cs40l50.o
 obj-$(CONFIG_SND_SOC_CS42L42_CORE)	+= snd-soc-cs42l42.o
 obj-$(CONFIG_SND_SOC_CS42L42)	+= snd-soc-cs42l42-i2c.o
diff --git a/sound/soc/codecs/cs40l26-codec.c b/sound/soc/codecs/cs40l26-codec.c
new file mode 100644
index 000000000000..5bfaff0683a5
--- /dev/null
+++ b/sound/soc/codecs/cs40l26-codec.c
@@ -0,0 +1,523 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// CS40L26 Boosted Haptic Driver with integrated DSP and
+// waveform memory with advanced closed loop algorithms and
+// LRA protection
+//
+// Copyright 2025 Cirrus Logic Inc.
+//
+// Author: Fred Treven <ftreven@opensource.cirrus.com>
+
+#include <linux/bitfield.h>
+#include <linux/mfd/cs40l26.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#define CS40L26_MONITOR_FILT 0x4008
+#define CS40L26_ASP_ENABLES1 0x4800
+#define CS40L26_ASP_CONTROL2 0x4808
+#define CS40L26_ASP_FRAME_CONTROL5 0x4820
+#define CS40L26_ASP_DATA_CONTROL5 0x4840
+#define CS40L26_DACPCM1_INPUT 0x4C00
+#define CS40L26_ASPTX1_INPUT 0x4C20
+
+#define CS40L26_PLL_CLK_SEL_BCLK 0x0
+#define CS40L26_PLL_CLK_SEL_MCLK 0x5
+
+#define CS40L26_PLL_CLK_FREQ_MASK GENMASK(31, 0)
+
+#define CS40L26_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+#define CS40L26_RATES (SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
+
+#define CS40L26_ASP_RX_WIDTH_MASK GENMASK(31, 24)
+#define CS40L26_ASP_FMT_MASK GENMASK(10, 8)
+#define CS40L26_ASP_BCLK_INV_MASK BIT(6)
+#define CS40L26_ASP_FSYNC_INV_MASK BIT(2)
+#define CS40L26_ASP_FSYNC_INV_SHIFT 2
+
+#define CS40L26_ASP_FMT_TDM1_DSPA 0x0
+#define CS40L26_ASP_FMT_I2S 0x2
+
+#define CS40L26_PLL_REFCLK_BCLK 0x0
+#define CS40L26_PLL_REFCLK_FSYNC 0x1
+#define CS40L26_PLL_REFCLK_MCLK 0x5
+
+#define CS40L26_PLL_REFCLK_SEL_MASK GENMASK(2, 0)
+#define CS40L26_PLL_REFCLK_FREQ_MASK GENMASK(10, 5)
+#define CS40L26_PLL_REFCLK_FREQ_SHIFT 5
+#define CS40L26_PLL_REFCLK_LOOP_MASK BIT(11)
+
+#define CS40L26_ASP_RX_WL_MASK GENMASK(5, 0)
+
+#define CS40L26_DATA_SRC_DSP1TX1 0x32
+
+#define CS40L26_DATA_SRC_MASK GENMASK(6, 0)
+
+#define CS40L26_ASP_TX1_EN_MASK BIT(0)
+#define CS40L26_ASP_TX2_EN_MASK BIT(1)
+#define CS40L26_ASP_RX1_EN_MASK BIT(16)
+#define CS40L26_ASP_RX2_EN_MASK BIT(17)
+#define CS40L26_ASP_ENABLE_MASK                                                        \
+	(CS40L26_ASP_TX1_EN_MASK | CS40L26_ASP_TX2_EN_MASK | CS40L26_ASP_RX1_EN_MASK | \
+	 CS40L26_ASP_RX2_EN_MASK)
+
+#define CS40L26_ASP_RX1_SLOT_MASK GENMASK(5, 0)
+#define CS40L26_ASP_RX2_SLOT_MASK GENMASK(13, 8)
+
+#define CS40L26_VIMON_DUAL_RATE_MASK BIT(16)
+
+struct cs40l26_pll_sysclk_config {
+	u32 freq;
+	u8 cfg;
+};
+
+struct cs40l26_codec {
+	struct cs40l26 *core;
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned int rate;
+	u32 daifmt;
+	int tdm_width;
+	int tdm_slot[2];
+	u32 refclk_input;
+};
+
+static const struct cs40l26_pll_sysclk_config cs40l26_pll_sysclk[] = {
+	{ 32768, 0x00 },
+	{ 1536000, 0x1B },
+	{ 3072000, 0x21 },
+	{ 6144000, 0x28 },
+	{ 9600000, 0x30 },
+	{ 12288000, 0x33 },
+};
+
+static int cs40l26_get_clk_config(struct cs40l26_codec *codec, u32 freq, u8 *clk_cfg)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs40l26_pll_sysclk); i++) {
+		if (cs40l26_pll_sysclk[i].freq == freq) {
+			*clk_cfg = cs40l26_pll_sysclk[i].cfg;
+			return 0;
+		}
+	}
+
+	dev_err(codec->dev, "Invalid clock frequency: %u Hz\n", freq);
+
+	return -EINVAL;
+}
+
+static int cs40l26_swap_ext_clk(struct cs40l26_codec *codec, u8 clk_src)
+{
+	u8 clk_cfg, clk_sel;
+	int ret;
+
+	switch (clk_src) {
+	case CS40L26_PLL_REFCLK_BCLK:
+		clk_sel = CS40L26_PLL_CLK_SEL_BCLK;
+		ret = cs40l26_get_clk_config(codec, codec->rate, &clk_cfg);
+		break;
+	case CS40L26_PLL_REFCLK_MCLK:
+		clk_sel = CS40L26_PLL_CLK_SEL_MCLK;
+		ret = cs40l26_get_clk_config(codec, 32768, &clk_cfg);
+		break;
+	case CS40L26_PLL_REFCLK_FSYNC:
+		ret = -EPERM;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(codec->dev, "Failed to get clock configuration\n");
+		return ret;
+	}
+
+	ret = cs40l26_set_pll_loop(codec->core, CS40L26_PLL_OPEN);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(codec->regmap, CS40L26_REFCLK_INPUT,
+				 CS40L26_PLL_REFCLK_FREQ_MASK | CS40L26_PLL_REFCLK_SEL_MASK,
+				 (clk_cfg << CS40L26_PLL_REFCLK_FREQ_SHIFT) | clk_sel);
+	if (ret)
+		return ret;
+
+	return cs40l26_set_pll_loop(codec->core, CS40L26_PLL_CLOSED);
+}
+
+static int cs40l26_clk_en(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs40l26_codec *codec = snd_soc_component_get_drvdata(component);
+	struct cs40l26 *cs40l26 = codec->core;
+	int ret;
+
+	guard(mutex)(&cs40l26->lock);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = cs40l26_dsp_write(cs40l26, CS40L26_STOP_PLAYBACK);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(codec->regmap, CS40L26_REFCLK_INPUT, &codec->refclk_input);
+		if (ret)
+			return ret;
+
+		ret = cs40l26_dsp_write(cs40l26, CS40L26_START_I2S);
+		if (ret)
+			return ret;
+
+		ret = cs40l26_swap_ext_clk(codec, CS40L26_PLL_REFCLK_BCLK);
+		if (ret)
+			return ret;
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = cs40l26_swap_ext_clk(codec, CS40L26_PLL_REFCLK_MCLK);
+		if (ret)
+			return ret;
+
+		/* Restore PLL Configuration */
+		ret = cs40l26_set_pll_loop(cs40l26, (u32)FIELD_GET(CS40L26_PLL_REFCLK_LOOP_MASK,
+								   codec->refclk_input));
+		if (ret)
+			return ret;
+		break;
+	default:
+		dev_err(codec->dev, "Invalid event: %d\n", event);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cs40l26_dsp_tx(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs40l26_codec *codec = snd_soc_component_get_drvdata(component);
+	struct cs40l26 *cs40l26 = codec->core;
+	int ret;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = cs40l26_fw_write(&cs40l26->dsp, "A2HEN", CS40L26_A2H_ALGO_ID, 1);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = cs40l26_fw_write(&cs40l26->dsp, "A2HEN", CS40L26_A2H_ALGO_ID, 0);
+		break;
+	default:
+		dev_err(codec->dev, "Invalid DSPTX event: %d\n", event);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int cs40l26_asp_rx(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event)
+{
+	struct cs40l26_codec *codec;
+	struct cs40l26 *cs40l26;
+	int ret;
+
+	codec = snd_soc_component_get_drvdata(snd_soc_dapm_to_component(w->dapm));
+
+	cs40l26 = codec->core;
+
+	guard(mutex)(&cs40l26->lock);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = regmap_update_bits(codec->regmap, CS40L26_DACPCM1_INPUT,
+					 CS40L26_DATA_SRC_MASK, CS40L26_DATA_SRC_DSP1TX1);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(codec->regmap, CS40L26_ASPTX1_INPUT, CS40L26_DATA_SRC_MASK,
+					 CS40L26_DATA_SRC_DSP1TX1);
+		if (ret)
+			return ret;
+
+		ret = regmap_set_bits(codec->regmap, CS40L26_ASP_ENABLES1, CS40L26_ASP_ENABLE_MASK);
+		if (ret)
+			return ret;
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = cs40l26_dsp_write(cs40l26, CS40L26_STOP_I2S);
+		if (ret)
+			return ret;
+
+		ret = regmap_clear_bits(codec->regmap, CS40L26_ASP_ENABLES1,
+					CS40L26_ASP_ENABLE_MASK);
+		if (ret)
+			return ret;
+		break;
+	default:
+		dev_err(codec->dev, "Invalid ASPRX event: %d\n", event);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cs40l26_component_set_sysclk(struct snd_soc_component *component, int clk_id, int source,
+					unsigned int freq, int dir)
+{
+	struct cs40l26_codec *codec = snd_soc_component_get_drvdata(component);
+	u8 clk_cfg;
+	int ret;
+
+	ret = cs40l26_get_clk_config(codec, (u32)(CS40L26_PLL_CLK_FREQ_MASK & freq), &clk_cfg);
+	if (ret)
+		return ret;
+
+	if (clk_id) {
+		dev_err(codec->dev, "Invalid input clock (ID: %d)\n", clk_id);
+		return -EINVAL;
+	}
+
+	codec->rate = CS40L26_PLL_CLK_FREQ_MASK & freq;
+
+	return 0;
+}
+
+static int cs40l26_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct cs40l26_codec *codec = snd_soc_component_get_drvdata(codec_dai->component);
+
+	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
+		dev_err(codec->dev, "Device can not be master\n");
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		codec->daifmt = 0;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		codec->daifmt = CS40L26_ASP_FSYNC_INV_MASK;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		codec->daifmt = CS40L26_ASP_BCLK_INV_MASK;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		codec->daifmt = CS40L26_ASP_FSYNC_INV_MASK | CS40L26_ASP_BCLK_INV_MASK;
+		break;
+	default:
+		dev_err(codec->dev, "Invalid clock inversion\n");
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+		codec->daifmt |= FIELD_PREP(CS40L26_ASP_FMT_MASK, CS40L26_ASP_FMT_TDM1_DSPA);
+		break;
+	case SND_SOC_DAIFMT_I2S:
+		codec->daifmt |= FIELD_PREP(CS40L26_ASP_FMT_MASK, CS40L26_ASP_FMT_I2S);
+		break;
+	default:
+		dev_err(codec->dev, "Invalid DAI format: 0x%X\n", fmt & SND_SOC_DAIFMT_FORMAT_MASK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cs40l26_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct cs40l26_codec *codec = snd_soc_component_get_drvdata(dai->component);
+	u32 asp_rx_wl, asp_rx_width;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(codec->core->dev);
+	if (ret)
+		return ret;
+
+	switch (params_rate(params)) {
+	case 48000:
+		ret = regmap_clear_bits(codec->regmap, CS40L26_MONITOR_FILT,
+					CS40L26_VIMON_DUAL_RATE_MASK);
+		break;
+	case 96000:
+		ret = regmap_set_bits(codec->regmap, CS40L26_MONITOR_FILT,
+				      CS40L26_VIMON_DUAL_RATE_MASK);
+		break;
+	default:
+		dev_err(codec->dev, "Unsupported sample rate: %d Hz\n", params_rate(params));
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		goto pm_exit;
+
+	asp_rx_wl = params_width(params);
+
+	ret = regmap_update_bits(codec->regmap, CS40L26_ASP_DATA_CONTROL5, CS40L26_ASP_RX_WL_MASK,
+				 asp_rx_wl);
+	if (ret)
+		goto pm_exit;
+
+
+	asp_rx_width = codec->tdm_width ? codec->tdm_width : asp_rx_wl;
+
+	codec->daifmt |= FIELD_PREP(CS40L26_ASP_RX_WIDTH_MASK, asp_rx_width);
+
+	ret = regmap_update_bits(codec->regmap, CS40L26_ASP_CONTROL2,
+				 CS40L26_ASP_FSYNC_INV_MASK | CS40L26_ASP_BCLK_INV_MASK |
+				 CS40L26_ASP_FMT_MASK | CS40L26_ASP_RX_WIDTH_MASK, codec->daifmt);
+	if (ret)
+		goto pm_exit;
+
+	ret = regmap_update_bits(codec->regmap, CS40L26_ASP_FRAME_CONTROL5,
+				 CS40L26_ASP_RX1_SLOT_MASK | CS40L26_ASP_RX2_SLOT_MASK,
+				 codec->tdm_slot[0] |
+					 FIELD_PREP(CS40L26_ASP_RX2_SLOT_MASK, codec->tdm_slot[1]));
+	if (ret)
+		goto pm_exit;
+
+	dev_dbg(codec->dev, "ASP: %d bits in %d bit slots, slot #s: %d, %d\n", asp_rx_wl,
+		asp_rx_width, codec->tdm_slot[0], codec->tdm_slot[1]);
+
+pm_exit:
+	cs40l26_pm_exit(codec->core->dev);
+
+	return ret;
+}
+
+static int cs40l26_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask, unsigned int rx_mask,
+				int slots, int slot_width)
+{
+	struct cs40l26_codec *codec = snd_soc_component_get_drvdata(dai->component);
+
+	codec->tdm_width = slot_width;
+
+	/*
+	 * Reset slots if TDM is being disabled, and catch the case in which both RX1 and RX2
+	 * would be set to slot 0 which would cause the hardware to flag an error
+	 */
+	if (!slots || rx_mask == 0x1)
+		rx_mask = 0x3;
+
+	codec->tdm_slot[0] = ffs(rx_mask) - 1;
+	rx_mask &= ~BIT(codec->tdm_slot[0]);
+	codec->tdm_slot[1] = ffs(rx_mask) - 1;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cs40l26_dai_ops = {
+	.set_fmt = cs40l26_set_dai_fmt,
+	.set_tdm_slot = cs40l26_set_tdm_slot,
+	.hw_params = cs40l26_pcm_hw_params,
+};
+
+static struct snd_soc_dai_driver cs40l26_dai[] = {
+	{
+		.name = "cs40l26-pcm",
+		.id = 0,
+		.playback = {
+			.stream_name = "ASP Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = CS40L26_RATES,
+			.formats = CS40L26_FORMATS,
+		},
+		.ops = &cs40l26_dai_ops,
+		.symmetric_rate = 1,
+	},
+};
+
+static const char *const cs40l26_out_mux_texts[] = { "Off", "ASP", "DSP" };
+static SOC_ENUM_SINGLE_VIRT_DECL(cs40l26_out_mux_enum, cs40l26_out_mux_texts);
+static const struct snd_kcontrol_new cs40l26_out_mux =
+	SOC_DAPM_ENUM("Haptics Source", cs40l26_out_mux_enum);
+
+static const struct snd_soc_dapm_widget cs40l26_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY_S("ASP PLL", 0, SND_SOC_NOPM, 0, 0, cs40l26_clk_en,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_AIF_IN("ASPRX1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("ASPRX2", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_PGA_E("ASP", SND_SOC_NOPM, 0, 0, NULL, 0, cs40l26_asp_rx,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_PGA_E("DSP", SND_SOC_NOPM, 0, 0, NULL, 0, cs40l26_dsp_tx,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_MUX("Haptics Source", SND_SOC_NOPM, 0, 0, &cs40l26_out_mux),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route cs40l26_dapm_routes[] = {
+	{ "ASP Playback", NULL, "ASP PLL" },
+	{ "ASPRX1", NULL, "ASP Playback" },
+	{ "ASPRX2", NULL, "ASP Playback" },
+
+	{ "ASP", NULL, "ASPRX1" },
+	{ "ASP", NULL, "ASPRX2" },
+	{ "DSP", NULL, "ASP" },
+
+	{ "Haptics Source", "ASP", "ASP" },
+	{ "Haptics Source", "DSP", "DSP" },
+	{ "OUT", NULL, "Haptics Source" },
+};
+
+static int cs40l26_codec_probe(struct snd_soc_component *component)
+{
+	struct cs40l26_codec *codec = snd_soc_component_get_drvdata(component);
+
+	/* Default audio SCLK frequency */
+	codec->rate = 1536000;
+
+	codec->tdm_slot[0] = 0;
+	codec->tdm_slot[1] = 1;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_cs40l26 = {
+	.probe = cs40l26_codec_probe,
+	.set_sysclk = cs40l26_component_set_sysclk,
+	.dapm_widgets = cs40l26_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cs40l26_dapm_widgets),
+	.dapm_routes = cs40l26_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(cs40l26_dapm_routes),
+};
+
+static int cs40l26_platform_probe(struct platform_device *pdev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(pdev->dev.parent);
+	struct cs40l26_codec *codec;
+
+	codec = devm_kzalloc(&pdev->dev, sizeof(struct cs40l26_codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	codec->core = cs40l26;
+	codec->regmap = cs40l26->regmap;
+	codec->dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, codec);
+
+	return snd_soc_register_component(&pdev->dev, &soc_codec_dev_cs40l26, cs40l26_dai,
+					  ARRAY_SIZE(cs40l26_dai));
+}
+
+static const struct platform_device_id cs40l26_id[] = {
+	{ "cs40l26-codec", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, cs40l26_id);
+
+static struct platform_driver cs40l26_codec_driver = {
+	.probe = cs40l26_platform_probe,
+	.id_table = cs40l26_id,
+	.driver = {
+		.name = "cs40l26-codec",
+	},
+};
+module_platform_driver(cs40l26_codec_driver);
+
+MODULE_DESCRIPTION("ASoC CS40L26 driver");
+MODULE_AUTHOR("Fred Treven ftreven@opensource.cirrus.com");
+MODULE_LICENSE("GPL");
-- 
2.34.1



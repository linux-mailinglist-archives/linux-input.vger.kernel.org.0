Return-Path: <linux-input+bounces-9770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E076A27F79
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0E61165D2F
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 23:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C1821CA19;
	Tue,  4 Feb 2025 23:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EEGmVRt5"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC2A21CA17;
	Tue,  4 Feb 2025 23:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711258; cv=none; b=FUtuX1TPLy2S7uhuhkjxu9V8ICbrjSrb5WPwS+1VxDMaMH1q2BuOxYm34rpH1HkLRQ+v5uY0s1DNkKLu1vLDLJ9oOVTlxUzULNOY1YgVOjDJhPQqui1XZBFRCBwiiLzQvgZTDbYT3VzbXm30DIVVF+zDbNegj8gJrfMUcw2TRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711258; c=relaxed/simple;
	bh=HMt93Qvd72e7Vz2VoEDR2dGKT3tO6E4ZXpdIP3TDNc8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fix1yEC+v+zjEJ+ybdesu8GWdRoJpC5pvFHYo6NR6osEg910ZOrlstxAUWTjpf0be6wqmJp7xeGunlXDweKYte92qqs1hNEcqLRBPVPV7robyTD44npTCljCWOhh2hFg03uyiS/+h0Z4SLwrzHhN6cd2shGwndMrVI6E5neJ20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EEGmVRt5; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Fmw8M029853;
	Tue, 4 Feb 2025 17:20:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/f6FTRfiMITsj7S7AFHQkwLB5hayI/diyUQ2xzJa794=; b=
	EEGmVRt5X9MkMBwMkAPwI4wV06tGRRMZdhTGXWNBAKhVzDEdwR4paPcB41OvFzzw
	e5in5bHSEUElOYDQ5AjqZcpGG//NOlikMDVUrOJM9prHKuVHlQxdWstZ2hNpaWin
	fHc3MeBNG2e+yNi+Z7/VGfdZPGsIhnt/ncBFSbjJVN0FFwJaUQR6Oemn1Qe2NysU
	M+SUVco0ubUvl0uhNi2TuVd1uX+odjiSMZW8GOb/O2vCkE92hdWkzLjpEuTMAN/J
	TsRqGg+KsiGxyVPYWydmkE0VeZT1rNSiCHOcZRLn1RH2iBFc884OpafLax0zjSrn
	9GzgyAQHobFn+S5jT5rr+w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53pkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:20:16 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:20:13 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:20:08 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5DB30820270;
	Tue,  4 Feb 2025 23:20:04 +0000 (UTC)
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
Subject: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core driver
Date: Tue, 4 Feb 2025 17:18:34 -0600
Message-ID: <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: SPOiO2LvLNFZ5ZQZ73Ku65ybGAjSEO5O
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a2a0b0 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=kJREcIERN5GkY3D7nBAA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: SPOiO2LvLNFZ5ZQZ73Ku65ybGAjSEO5O
X-Proofpoint-Spam-Reason: safe

Introduce support for Cirrus Logic Device CS40L26:
A boosted haptic driver with integrated DSP and
waveform memory with advanced closed loop algorithms
and LRA protection.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/mfd/Kconfig         |   29 +
 drivers/mfd/Makefile        |    4 +
 drivers/mfd/cs40l26-core.c  | 1412 +++++++++++++++++++++++++++++++++++
 drivers/mfd/cs40l26-i2c.c   |   63 ++
 drivers/mfd/cs40l26-spi.c   |   63 ++
 include/linux/mfd/cs40l26.h |  341 +++++++++
 6 files changed, 1912 insertions(+)
 create mode 100644 drivers/mfd/cs40l26-core.c
 create mode 100644 drivers/mfd/cs40l26-i2c.c
 create mode 100644 drivers/mfd/cs40l26-spi.c
 create mode 100644 include/linux/mfd/cs40l26.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..93a60fa9551a 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2293,6 +2293,35 @@ config MCP_UCB1200_TS
 
 endmenu
 
+config MFD_CS40L26_CORE
+	tristate
+	select MFD_CORE
+	select FW_CS_DSP
+
+config MFD_CS40L26_I2C
+	tristate "Cirrus Logic CS40L26 (I2C)"
+	select REGMAP_I2C
+	select MFD_CS40L26_CORE
+	depends on I2C
+	help
+	  Select this to support the Cirrus Logic CS40L26 Haptic
+	  Driver over I2C.
+
+	  This driver can be built as a module. If built as a module it will be
+	  called "cs40l26-i2c".
+
+config MFD_CS40L26_SPI
+	tristate "Cirrus Logic CS40L26 (SPI)"
+	select REGMAP_SPI
+	select MFD_CS40L26_CORE
+	depends on SPI
+	help
+	  Select this to support the Cirrus Logic CS40L26 Haptic
+	  Driver over SPI.
+
+	  This driver can be built as a module. If built as a module it will be
+	  called "cs40l26-spi".
+
 config MFD_CS40L50_CORE
 	tristate
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..8a245f36d73d 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -90,6 +90,10 @@ obj-$(CONFIG_MFD_MADERA)	+= madera.o
 obj-$(CONFIG_MFD_MADERA_I2C)	+= madera-i2c.o
 obj-$(CONFIG_MFD_MADERA_SPI)	+= madera-spi.o
 
+obj-$(CONFIG_MFD_CS40L26_CORE)	+= cs40l26-core.o
+obj-$(CONFIG_MFD_CS40L26_I2C)	+= cs40l26-i2c.o
+obj-$(CONFIG_MFD_CS40L26_SPI)	+= cs40l26-spi.o
+
 obj-$(CONFIG_MFD_CS40L50_CORE)	+= cs40l50-core.o
 obj-$(CONFIG_MFD_CS40L50_I2C)	+= cs40l50-i2c.o
 obj-$(CONFIG_MFD_CS40L50_SPI)	+= cs40l50-spi.o
diff --git a/drivers/mfd/cs40l26-core.c b/drivers/mfd/cs40l26-core.c
new file mode 100644
index 000000000000..b314f820de1e
--- /dev/null
+++ b/drivers/mfd/cs40l26-core.c
@@ -0,0 +1,1412 @@
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
+#include <linux/cleanup.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/cs40l26.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+static const struct mfd_cell cs40l26_devs[] = {
+	{ .name = "cs40l26-codec", },
+	{ .name = "cs40l26-vibra", },
+};
+
+const struct regmap_config cs40l26_regmap = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = CS40L26_LASTREG,
+	.cache_type = REGCACHE_NONE,
+};
+EXPORT_SYMBOL_GPL(cs40l26_regmap);
+
+static const char *const cs40l26_supplies[] = {
+	"va", "vp",
+};
+
+inline void cs40l26_pm_exit(struct device *dev)
+{
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+}
+EXPORT_SYMBOL_GPL(cs40l26_pm_exit);
+
+static int cs40l26_fw_write_raw(struct cs_dsp *dsp, const char *const name,
+				const unsigned int algo_id, const u32 offset_words,
+				const size_t len_words, u32 *buf)
+{
+	struct cs_dsp_coeff_ctl *ctl;
+	__be32 *val;
+	int i, ret;
+
+	ctl = cs_dsp_get_ctl(dsp, name, WMFW_ADSP2_XM, algo_id);
+	if (!ctl) {
+		dev_err(dsp->dev, "Failed to find FW control %s\n", name);
+		return -EINVAL;
+	}
+
+	val = kzalloc(len_words * sizeof(u32), GFP_KERNEL);
+	if (!val)
+		return -ENOMEM;
+
+	for (i = 0; i < len_words; i++)
+		val[i] = cpu_to_be32(buf[i]);
+
+	ret = cs_dsp_coeff_write_ctrl(ctl, offset_words, val, len_words * sizeof(u32));
+	if (ret < 0)
+		dev_err(dsp->dev, "Failed to write FW control %s\n", name);
+
+	kfree(val);
+
+	return (ret < 0) ? ret : 0;
+}
+
+inline int cs40l26_fw_write(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
+			    u32 val)
+{
+	return cs40l26_fw_write_raw(dsp, name, algo_id, 0, 1, &val);
+}
+EXPORT_SYMBOL_GPL(cs40l26_fw_write);
+
+static int cs40l26_fw_read_raw(struct cs_dsp *dsp, const char *const name,
+			       const unsigned int algo_id, const unsigned int offset_words,
+			       const size_t len_words, u32 *buf)
+{
+	struct cs_dsp_coeff_ctl *ctl;
+	int i, ret;
+
+	ctl = cs_dsp_get_ctl(dsp, name, WMFW_ADSP2_XM, algo_id);
+	if (!ctl) {
+		dev_err(dsp->dev, "Failed to find FW control %s\n", name);
+		return -EINVAL;
+	}
+
+	ret = cs_dsp_coeff_read_ctrl(ctl, offset_words, buf, len_words * sizeof(u32));
+	if (ret) {
+		dev_err(dsp->dev, "Failed to read FW control %s\n", name);
+		return ret;
+	}
+
+	for (i = 0; i < len_words; i++)
+		buf[i] = be32_to_cpu(buf[i]);
+
+	return 0;
+}
+
+inline int cs40l26_fw_read(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
+			   u32 *buf)
+{
+	return cs40l26_fw_read_raw(dsp, name, algo_id, 0, 1, buf);
+}
+EXPORT_SYMBOL_GPL(cs40l26_fw_read);
+
+static struct cs40l26_irq *cs40l26_get_irq(struct cs40l26 *cs40l26, const int num, const int bit);
+
+static int cs40l26_gpio1_rise_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	if (cs40l26->wksrc_sts & CS40L26_WKSRC_STS_EN)
+		dev_dbg(cs40l26->dev, "GPIO1 Rising Edge Detected\n");
+
+	cs40l26->wksrc_sts |= CS40L26_WKSRC_STS_EN;
+
+	return 0;
+}
+
+static int cs40l26_gpio1_fall_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	if (cs40l26->wksrc_sts & CS40L26_WKSRC_STS_EN)
+		dev_dbg(cs40l26->dev, "GPIO1 Falling Edge Detected\n");
+
+	cs40l26->wksrc_sts |= CS40L26_WKSRC_STS_EN;
+
+	return 0;
+}
+
+static int cs40l26_wksrc_any_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+	u32 last_wksrc, pwrmgt_sts;
+	int ret;
+
+	guard(mutex)(&cs40l26->dsp.pwr_lock);
+
+	ret = regmap_read(cs40l26->regmap, CS40L26_PWRMGT_STS, &pwrmgt_sts);
+	if (ret)
+		return ret;
+
+	cs40l26->wksrc_sts = (u8)FIELD_GET(CS40L26_WKSRC_STS_MASK, pwrmgt_sts);
+
+	ret = cs40l26_fw_read(&cs40l26->dsp, "LAST_WAKESRC_CTL", cs40l26->dsp.fw_id, &last_wksrc);
+	if (ret)
+		return ret;
+
+	cs40l26->last_wksrc_pol = (u8)(last_wksrc & CS40L26_WKSRC_GPIO_POL_MASK);
+
+	return 0;
+}
+
+static int cs40l26_wksrc_gpio1_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	/*
+	 * The GPIO wakesource and event interrupts are not able to reliably determine
+	 * the GPIO edge that triggered the interrupt (rising/falling).
+	 *
+	 * The driver must therefore perform this logic in order to determine the edge
+	 * of the GPIO event for two cases:
+	 * 1. The GPIO event is waking the device from hibernation.
+	 * 2. The GPIO event occurs when the device is already awake.
+	 */
+
+	if (cs40l26->wksrc_sts & cs40l26->last_wksrc_pol) {
+		dev_dbg(cs40l26->dev, "GPIO1 Falling Edge Detected\n");
+		cs40l26->wksrc_sts |= CS40L26_WKSRC_STS_EN;
+	} else {
+		dev_dbg(cs40l26->dev, "GPIO1 rising edge detected\n");
+	}
+
+	return 0;
+}
+
+static int cs40l26_error_release(struct cs40l26 *cs40l26, const enum cs40l26_error err)
+{
+	int ret;
+
+	dev_err(cs40l26->dev, "Device Reported Error: %u\n", (unsigned int)BIT(err));
+
+	ret = regmap_clear_bits(cs40l26->regmap, CS40L26_ERROR_RELEASE, BIT(err));
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(cs40l26->regmap, CS40L26_ERROR_RELEASE, BIT(err));
+	if (ret)
+		return ret;
+
+	return regmap_clear_bits(cs40l26->regmap, CS40L26_ERROR_RELEASE, BIT(err));
+}
+
+static int cs40l26_bst_ovp_err_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	return cs40l26_error_release(cs40l26, CS40L26_ERROR_BST_OVP);
+}
+
+static int cs40l26_bst_dcm_uvp_err_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	return cs40l26_error_release(cs40l26, CS40L26_ERROR_BST_DCM_UVP);
+}
+
+static int cs40l26_bst_short_err_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	return cs40l26_error_release(cs40l26, CS40L26_ERROR_BST_SHORT);
+}
+
+static int cs40l26_temp_warn_rise_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	return cs40l26_error_release(cs40l26, CS40L26_ERROR_TEMP_WARN);
+}
+
+static int cs40l26_temp_err_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	return cs40l26_error_release(cs40l26, CS40L26_ERROR_TEMP_ERR);
+}
+
+static int cs40l26_amp_short_err_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+
+	return cs40l26_error_release(cs40l26, CS40L26_ERROR_AMP_SHORT);
+}
+
+static int cs40l26_dsp_queue_buffer_read(struct cs40l26 *cs40l26, u32 *val)
+{
+	u32 queue_rd, queue_wt, sts;
+	int ret;
+
+	guard(mutex)(&cs40l26->dsp.pwr_lock);
+
+	ret = cs40l26_fw_read(&cs40l26->dsp, "QUEUE_WT", CS40L26_DSP_ALGO_ID, &queue_wt);
+	if (ret)
+		return ret;
+
+	ret = cs40l26_fw_read(&cs40l26->dsp, "QUEUE_RD", CS40L26_DSP_ALGO_ID, &queue_rd);
+	if (ret)
+		return ret;
+
+	if (queue_rd - sizeof(u32) == queue_wt) {
+		ret = cs40l26_fw_read(&cs40l26->dsp, "STATUS", CS40L26_DSP_ALGO_ID, &sts);
+		if (ret)
+			return ret;
+
+		if (sts) {
+			dev_err(cs40l26->dev, "DSP Queue Buffer is full, message(s) missed\n");
+			return -ENOSPC;
+		}
+	}
+
+	if (queue_rd == queue_wt) /* DSP Queue is Empty */
+		return 1;
+
+	ret = regmap_read(cs40l26->regmap, queue_rd, val);
+	if (ret)
+		return ret;
+
+	if (queue_rd == cs40l26->queue_last)
+		queue_rd = cs40l26->queue_base;
+	else
+		queue_rd += sizeof(u32);
+
+	return cs40l26_fw_write(&cs40l26->dsp, "QUEUE_RD", CS40L26_DSP_ALGO_ID, queue_rd);
+}
+
+static int cs40l26_dsp_queue_irq(void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+	bool end = false;
+	int ret;
+	u32 val;
+
+	ret = cs40l26_dsp_queue_buffer_read(cs40l26, &val);
+	if (ret == 1)
+		return 0;
+	else if (ret)
+		return ret;
+
+	while (!end) {
+		if ((val & CS40L26_DSP_CMD_INDEX_MASK) == CS40L26_DSP_PANIC) {
+			dev_err(cs40l26->dev, "DSP Panic! Error: 0x%06X\n",
+				(u32)(val & CS40L26_DSP_CMD_PAYLOAD_MASK));
+			return -ENOTRECOVERABLE;
+		}
+
+		switch (val) {
+		case CS40L26_DSP_COMPLETE_CP:
+			dev_dbg(cs40l26->dev, "DSP Queue: Control Port Haptics Completed\n");
+			break;
+		case CS40L26_DSP_COMPLETE_I2S:
+			dev_dbg(cs40l26->dev, "DSP Queue: I2S Stream Completed\n");
+			break;
+		case CS40L26_DSP_TRIGGER_CP:
+			dev_dbg(cs40l26->dev, "DSP Queue: Control Port Haptics Triggered\n");
+			break;
+		case CS40L26_DSP_TRIGGER_I2S:
+			dev_dbg(cs40l26->dev, "DSP Queue: I2S Stream Triggered\n");
+			break;
+		case CS40L26_DSP_PM_AWAKE:
+			cs40l26->wksrc_sts |= CS40L26_WKSRC_STS_EN;
+			dev_dbg(cs40l26->dev, "DSP Queue: AWAKE\n");
+			break;
+		case CS40L26_DSP_SYS_ACK:
+			dev_dbg(cs40l26->dev, "DSP Queue: Inbound PING received\n");
+			break;
+		default:
+			dev_err(cs40l26->dev, "DSP Queue value (0x%X) unrecognized\n", val);
+			return -EINVAL;
+		}
+
+		ret = cs40l26_dsp_queue_buffer_read(cs40l26, &val);
+		if (ret == 1)
+			end = true;
+		else if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct reg_sequence cs40l26_irq_masks[] = {
+	REG_SEQ0(CS40L26_IRQ1_MASK_1, CS40L26_IRQ_1_ALL_MASKED),
+	REG_SEQ0(CS40L26_IRQ1_MASK_2, CS40L26_IRQ_2_ALL_MASKED),
+};
+
+static void cs40l26_irq_unmask(struct cs40l26 *cs40l26, const int num, const int virq)
+{
+	struct cs40l26_irq *irq;
+
+	if (num != 1 && num != 2) {
+		dev_err(cs40l26->dev, "Invalid IRQ number %d\n", num);
+		return;
+	}
+
+	irq = cs40l26_get_irq(cs40l26, num, virq);
+	if (!irq)
+		return;
+
+	cs40l26->irq_masks[num - 1].def &= ~irq->mask;
+}
+
+static struct cs40l26_irq cs40l26_irqs_1[] = {
+	CS40L26_IRQ(GPIO1_RISE, "GPIO1 Rise", cs40l26_gpio1_rise_irq),
+	CS40L26_IRQ(GPIO1_FALL, "GPIO1 Fall", cs40l26_gpio1_fall_irq),
+	CS40L26_IRQ(WKSRC_STS_ANY, "ANY Wake", cs40l26_wksrc_any_irq),
+	CS40L26_IRQ(WKSRC_STS_GPIO1, "GPIO1 Wake", cs40l26_wksrc_gpio1_irq),
+	CS40L26_IRQ(WKSRC_STS_SPI, "SPI Wake", NULL),
+	CS40L26_IRQ(WKSRC_STS_I2C, "I2C Wake", NULL),
+	CS40L26_IRQ(BST_OVP_FLAG_RISE, "BST OVP Rise", NULL),
+	CS40L26_IRQ(BST_OVP_FLAG_FALL, "BST OVP Fall", NULL),
+	CS40L26_IRQ(BST_OVP_ERR, "BST OVP Error", cs40l26_bst_ovp_err_irq),
+	CS40L26_IRQ(BST_DCM_UVP_ERR, "BST UVP Error", cs40l26_bst_dcm_uvp_err_irq),
+	CS40L26_IRQ(BST_SHORT_ERR, "BST Short Error", cs40l26_bst_short_err_irq),
+	CS40L26_IRQ(BST_IPK_FLAG, "BST IPK Flag", NULL),
+	CS40L26_IRQ(TEMP_WARN_RISE, "TEMP Warn Rise", cs40l26_temp_warn_rise_irq),
+	CS40L26_IRQ(TEMP_WARN_FALL, "TEMP Warn Fall", NULL),
+	CS40L26_IRQ(TEMP_ERR, "TEMP Error", cs40l26_temp_err_irq),
+	CS40L26_IRQ(AMP_ERR, "AMP Error", cs40l26_amp_short_err_irq),
+	CS40L26_IRQ(DSP_RX_QUEUE, "DSP Rx", cs40l26_dsp_queue_irq),
+};
+
+static struct cs40l26_irq cs40l26_irqs_2[] = {
+	CS40L26_IRQ(REFCLK_PRESENT, "REFCLK Present", NULL),
+	CS40L26_IRQ(REFCLK_MISSING_FALL, "REFCLK Missing Fall", NULL),
+	CS40L26_IRQ(REFCLK_MISSING_RISE, "REFCLK Missing Rise", NULL),
+	CS40L26_IRQ(VPMON_CLIPPED, "VPMON Clipped", NULL),
+	CS40L26_IRQ(VBSTMON_CLIPPED, "VBSTMON Clipped", NULL),
+	CS40L26_IRQ(VMON_CLIPPED, "VMON Clipped", NULL),
+	CS40L26_IRQ(IMON_CLIPPED, "IMON Clipped", NULL),
+};
+
+static struct cs40l26_irq *cs40l26_get_irq(struct cs40l26 *cs40l26, const int num, const int bit)
+{
+	int i;
+
+	if (num == 1) {
+		for (i = 0; i < ARRAY_SIZE(cs40l26_irqs_1); i++) {
+			if (cs40l26_irqs_1[i].virq == bit)
+				return &cs40l26_irqs_1[i];
+		}
+	} else if (num == 2) {
+		for (i = 0; i < ARRAY_SIZE(cs40l26_irqs_2); i++) {
+			if (cs40l26_irqs_2[i].virq == bit)
+				return &cs40l26_irqs_2[i];
+		}
+	} else {
+		dev_err(cs40l26->dev, "Invalid IRQ number %d\n", num);
+		return NULL;
+	}
+
+	dev_err(cs40l26->dev, "Failed to find IRQ corresponding to bit in IRQ%d %d\n", bit, num);
+
+	return NULL;
+}
+
+static irqreturn_t cs40l26_irq_handler(int irq, void *data)
+{
+	struct cs40l26 *cs40l26 = data;
+	struct cs40l26_irq *irq_s;
+	unsigned long handle_bits;
+	u32 eint, mask, sts;
+	int i, j, ret;
+
+	if (pm_runtime_resume_and_get(cs40l26->dev)) {
+		dev_err(cs40l26->dev, "Failed to exit hibernate to service interrupt\n");
+		return IRQ_NONE;
+	}
+
+	guard(mutex)(&cs40l26->lock);
+
+	ret = regmap_read(cs40l26->regmap, CS40L26_IRQ1_STATUS, &sts);
+	if (ret)
+		goto err_pm;
+
+	if (!(sts & CS40L26_IRQ_STATUS_ASSERT)) {
+		dev_err(cs40l26->dev, "IRQ1 asserted with no pending interrupts\n");
+		ret = -EIO;
+		goto err_pm;
+	}
+
+	for (j = 0; j < 2; j++) {
+		ret = regmap_read(cs40l26->regmap, CS40L26_IRQ1_MASK_1 + j * 4, &mask);
+		if (ret)
+			goto err_pm;
+
+		ret = regmap_read(cs40l26->regmap, CS40L26_IRQ1_EINT_1 + j * 4, &eint);
+		if (ret)
+			goto err_pm;
+
+		handle_bits = eint & ~mask;
+
+		for_each_set_bit(i, &handle_bits, j ? CS40L26_IRQ_2_NBITS : CS40L26_IRQ_1_NBITS) {
+			irq_s = cs40l26_get_irq(cs40l26, j + 1, i);
+			if (!irq_s)
+				continue;
+
+			dev_dbg(cs40l26->dev, "%s", irq_s->name);
+
+			if (irq_s->handler) {
+				ret = irq_s->handler(cs40l26);
+				if (ret)
+					goto err_pm;
+			}
+
+			ret = regmap_write(cs40l26->regmap, CS40L26_IRQ1_EINT_1 + j * 4, BIT(i));
+			if (ret)
+				goto err_pm;
+		}
+	}
+
+err_pm:
+	cs40l26_pm_exit(cs40l26->dev);
+
+	return IRQ_RETVAL(ret);
+}
+
+int cs40l26_dsp_write(struct cs40l26 *cs40l26, const u32 val)
+{
+	int i, ret;
+	u32 ack;
+
+	/* Device NAKs if hibernating, so retry if this is the case */
+	for (i = 0; i < CS40L26_DSP_TIMEOUT_COUNT; i++) {
+		ret = regmap_write(cs40l26->regmap, CS40L26_DSP_QUEUE, val);
+		if (!ret)
+			break;
+
+		usleep_range(CS40L26_DSP_POLL_US, CS40L26_DSP_POLL_US + 100);
+	}
+
+	if (i == CS40L26_DSP_TIMEOUT_COUNT) {
+		dev_err(cs40l26->dev, "Timed out writing %#X to DSP\n", val);
+		return -ETIMEDOUT;
+	}
+
+	ret = regmap_read_poll_timeout(cs40l26->regmap, CS40L26_DSP_QUEUE, ack, !ack,
+				       CS40L26_DSP_POLL_US,
+				       CS40L26_DSP_POLL_US * CS40L26_DSP_TIMEOUT_COUNT);
+	if (ret)
+		dev_err(cs40l26->dev, "DSP failed to ACK %#X: %d\n", val, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs40l26_dsp_write);
+
+int cs40l26_dsp_state_get(struct cs40l26 *cs40l26, u32 *state)
+{
+	u32 dsp_state = CS40L26_DSP_STATE_NONE;
+	int i, ret;
+
+	if (cs40l26->dsp.running) {
+		for (i = 0; i < CS40L26_DSP_TIMEOUT_COUNT; i++) {
+			ret = cs40l26_fw_read(&cs40l26->dsp, "PM_CUR_STATE", CS40L26_PM_ALGO_ID,
+					      &dsp_state);
+			if (ret)
+				return ret;
+
+			if (dsp_state != CS40L26_DSP_STATE_NONE)
+				break;
+
+			usleep_range(CS40L26_DSP_POLL_US, CS40L26_DSP_POLL_US + 100);
+		}
+
+		if (i == CS40L26_DSP_TIMEOUT_COUNT) {
+			dev_err(cs40l26->dev, "Timed out reading PM_CUR_STATE\n");
+			return -ETIMEDOUT;
+		}
+	} else {
+		ret = regmap_read_poll_timeout(cs40l26->regmap,
+					       cs40l26->variant->info->pm_cur_state, dsp_state,
+					       dsp_state != CS40L26_DSP_STATE_NONE,
+					       CS40L26_DSP_POLL_US,
+					       CS40L26_DSP_POLL_US * CS40L26_DSP_TIMEOUT_COUNT);
+		if (ret) {
+			dev_err(cs40l26->dev, "Failed to read poll for static PM_CUR_STATE\n");
+			return ret;
+		}
+	}
+
+	*state = dsp_state;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs40l26_dsp_state_get);
+
+static bool cs40l26_dsp_can_run(struct cs40l26 *cs40l26)
+{
+	struct regmap *regmap = cs40l26->regmap;
+	u32 dsp_state, pm_state_locks;
+	int ret;
+
+	ret = cs40l26_dsp_state_get(cs40l26, &dsp_state);
+	if (ret)
+		return false;
+
+	if (dsp_state == CS40L26_DSP_STATE_ACTIVE)
+		return true;
+
+	if (dsp_state != CS40L26_DSP_STATE_STANDBY) {
+		dev_err(cs40l26->dev, "DSP in bad state: %u\n", dsp_state);
+		return false;
+	}
+
+	if (cs40l26->dsp.running)
+		ret = cs40l26_fw_read_raw(&cs40l26->dsp, "PM_STATE_LOCKS", CS40L26_PM_ALGO_ID,
+					  CS40L26_DSP_LOCK3_OFFSET_WORDS, 1, &pm_state_locks);
+	else
+		ret = regmap_read(regmap, cs40l26->variant->info->pm_state_locks3, &pm_state_locks);
+
+	if (ret) {
+		dev_err(cs40l26->dev, "Failed to read PM_STATE_LOCKS\n");
+		return false;
+	}
+
+	return pm_state_locks & CS40L26_DSP_LOCK3_MASK;
+}
+
+static int cs40l26_prevent_hiber(struct cs40l26 *cs40l26)
+{
+	int i, ret;
+
+	for (i = 0; i < CS40L26_DSP_TIMEOUT_COUNT; i++) {
+		ret = cs40l26_dsp_write(cs40l26, CS40L26_DSP_CMD_PREVENT_HIBER);
+		if (ret)
+			return ret;
+
+		usleep_range(CS40L26_DSP_POLL_US, CS40L26_DSP_POLL_US + 100);
+
+		if (cs40l26_dsp_can_run(cs40l26))
+			break;
+	}
+
+	if (i == CS40L26_DSP_TIMEOUT_COUNT) {
+		dev_err(cs40l26->dev, "Failed to prevent hibernation\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int cs40l26_lbst_short_test(struct cs40l26 *cs40l26)
+{
+	u32 err, vbst_ctl_1, vbst_ctl_2;
+	int ret;
+
+	/* Read initial values to restore after test is complete */
+	ret = regmap_read(cs40l26->regmap, CS40L26_VBST_CTL_2, &vbst_ctl_2);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(cs40l26->regmap, CS40L26_VBST_CTL_1, &vbst_ctl_1);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(cs40l26->regmap, CS40L26_VBST_CTL_2, CS40L26_BST_CTL_SEL_MASK,
+				 CS40L26_BST_CTL_SEL_FIXED);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(cs40l26->regmap, CS40L26_VBST_CTL_1, CS40L26_BST_CTL_MASK,
+				 CS40L26_BST_CTL_VP);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(cs40l26->regmap, CS40L26_GLOBAL_ENABLES, CS40L26_GLOBAL_EN);
+	if (ret)
+		return ret;
+
+	/* Wait for boost converter to power up */
+	usleep_range(CS40L26_BST_TIME_US, CS40L26_BST_TIME_US + 100);
+
+	ret = regmap_read(cs40l26->regmap, CS40L26_ERROR_RELEASE, &err);
+	if (ret)
+		return ret;
+
+	if (err & BIT(CS40L26_ERROR_BST_SHORT)) {
+		dev_err(cs40l26->dev, "Boost shorted at startup\n");
+		return -ENOTRECOVERABLE;
+	}
+
+	/* Return to previous state before test */
+	ret = regmap_clear_bits(cs40l26->regmap, CS40L26_GLOBAL_ENABLES, CS40L26_GLOBAL_EN);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(cs40l26->regmap, CS40L26_VBST_CTL_1, vbst_ctl_1);
+	if (ret)
+		return ret;
+
+	return regmap_write(cs40l26->regmap, CS40L26_VBST_CTL_2, vbst_ctl_2);
+}
+
+static const struct reg_sequence cs40l26_a1_b1_errata[] = {
+	{ CS40L26_PLL_REFCLK_DETECT_0, CS40L26_PLL_REFCLK_DET_DISABLE },
+	{ 0x00000040, 0x00000055 },
+	{ 0x00000040, 0x000000AA },
+	{ CS40L26_TEST_LBST, CS40L26_DISABLE_EXPL_MODE },
+};
+
+static int cs40l26_a1_b1_handle_errata(struct cs40l26 *cs40l26)
+{
+	int ret;
+
+	/*
+	 * Boost Exploratory Mode must be disabled on 0xA1/0xB1 devices in order to ensure there is
+	 * no unintentional damage to the boost inductor. Any boost short that occurs after the
+	 * LBST short test at probe will not be detected.
+	 */
+	ret = cs40l26_lbst_short_test(cs40l26);
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(cs40l26->regmap, cs40l26_a1_b1_errata,
+				     ARRAY_SIZE(cs40l26_a1_b1_errata));
+	if (ret)
+		return ret;
+
+	return cs_dsp_wseq_multi_write(&cs40l26->dsp, &cs40l26->wseqs[CS40L26_WSEQ_POWER_ON],
+				       cs40l26_a1_b1_errata, ARRAY_SIZE(cs40l26_a1_b1_errata),
+				       CS_DSP_WSEQ_FULL, false);
+}
+
+static const struct cs40l26_variant_info cs40l26_a1_b1_info = {
+	.pm_cur_state = CS40L26_A1_B1_PM_CUR_STATE,
+	.pm_state_locks = CS40L26_A1_B1_PM_STATE_LOCKS,
+	.pm_state_locks3 = CS40L26_A1_B1_PM_STATE_LOCKS3,
+	.pm_stdby_ticks = CS40L26_A1_B1_PM_STDBY_TICKS,
+	.pm_active_ticks = CS40L26_A1_B1_PM_ACTIVE_TICKS,
+	.halo_state = CS40L26_A1_B1_HALO_STATE,
+	.event_map_1 = CS40L26_A1_B1_EVENT_MAP_1,
+	.event_map_2 = CS40L26_A1_B1_EVENT_MAP_2,
+	.fw_min_rev = CS40L26_FW_A1_B1_MIN_REV,
+	.ram_ext_algo_id = CS40L26_EXT_ALGO_ID,
+	.vibegen_algo_id = CS40L26_VIBEGEN_ALGO_ID_A1,
+};
+
+static const struct cs40l26_variant_info cs40l26_b2_info = {
+	.pm_cur_state = CS40L26_B2_PM_CUR_STATE,
+	.pm_state_locks = CS40L26_B2_PM_STATE_LOCKS,
+	.pm_state_locks3 = CS40L26_B2_PM_STATE_LOCKS3,
+	.pm_stdby_ticks = CS40L26_B2_PM_STDBY_TICKS,
+	.pm_active_ticks = CS40L26_B2_PM_ACTIVE_TICKS,
+	.halo_state = CS40L26_B2_HALO_STATE,
+	.event_map_1 = CS40L26_B2_EVENT_MAP_1,
+	.event_map_2 = CS40L26_B2_EVENT_MAP_2,
+	.fw_min_rev = CS40L26_FW_B2_MIN_REV,
+	.ram_ext_algo_id = CS40L26_FW_ID,
+	.vibegen_algo_id = CS40L26_VIBEGEN_ALGO_ID_B2,
+};
+
+static const struct cs40l26_variant cs40l26_a1_b1_variant = {
+	.info = &cs40l26_a1_b1_info,
+	.handle_errata = &cs40l26_a1_b1_handle_errata,
+};
+
+static const struct cs40l26_variant cs40l26_b2_variant = {
+	.info = &cs40l26_b2_info,
+	.handle_errata = NULL,
+};
+
+static inline int cs40l26_pm_timeout_ms_set(struct cs40l26 *cs40l26, const u32 dsp_state,
+					    const u32 timeout_ms)
+{
+	return regmap_write(cs40l26->regmap,
+			    dsp_state == CS40L26_DSP_STATE_STANDBY ?
+			     cs40l26->variant->info->pm_stdby_ticks :
+			     cs40l26->variant->info->pm_active_ticks,
+			     (timeout_ms * CS40L26_PM_TICKS_PER_SEC) / 1000);
+}
+
+static int cs40l26_pm_timeout_ms_get(struct cs40l26 *cs40l26, const u32 dsp_state, u32 *timeout_ms)
+{
+	u32 timeout_ticks;
+	int ret;
+
+	ret = regmap_read(cs40l26->regmap,
+			  dsp_state == CS40L26_DSP_STATE_STANDBY ?
+			  cs40l26->variant->info->pm_stdby_ticks :
+			  cs40l26->variant->info->pm_active_ticks,
+			  &timeout_ticks);
+	if (ret)
+		return ret;
+
+	*timeout_ms = DIV_ROUND_UP(timeout_ticks * 1000, CS40L26_PM_TICKS_PER_SEC);
+
+	return 0;
+}
+
+static int cs40l26_pm_runtime_setup(struct device *dev)
+{
+	int ret;
+
+	pm_runtime_set_autosuspend_delay(dev, CS40L26_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_get_noresume(dev);
+	ret = pm_runtime_set_active(dev);
+	if (ret)
+		return ret;
+
+	return devm_pm_runtime_enable(dev);
+}
+
+static int cs40l26_dsp_pre_config(struct cs40l26 *cs40l26)
+{
+	u32 dsp_state, halo_state, timeout_ms;
+	int i, ret;
+
+	ret = regmap_read(cs40l26->regmap, cs40l26->variant->info->halo_state, &halo_state);
+	if (ret)
+		return ret;
+
+	if (halo_state != CS40L26_DSP_HALO_STATE_RUN) {
+		dev_err(cs40l26->dev, "Invalid DSP state: %u\n", halo_state);
+		return -EINVAL;
+	}
+
+	ret = cs40l26_pm_timeout_ms_get(cs40l26, CS40L26_DSP_STATE_ACTIVE, &timeout_ms);
+	if (ret) {
+		dev_err(cs40l26->dev, "Failed to get ACTIVE timeout\n");
+		return ret;
+	}
+
+	for (i = 0; i < CS40L26_DSP_STATE_TIMEOUT_COUNT; i++) {
+		ret = cs40l26_dsp_state_get(cs40l26, &dsp_state);
+		if (ret)
+			return ret;
+
+		if (dsp_state != CS40L26_DSP_STATE_SHUTDOWN &&
+		    dsp_state != CS40L26_DSP_STATE_STANDBY)
+			dev_warn(cs40l26->dev, "DSP core not safe to kill\n");
+		else
+			break;
+
+		usleep_range(timeout_ms * 1000, (timeout_ms * 1000) + 100);
+	}
+
+	if (i == CS40L26_DSP_STATE_TIMEOUT_COUNT) {
+		dev_err(cs40l26->dev, "DSP Core could not be shut down\n");
+		return -ETIMEDOUT;
+	}
+
+	return regmap_write(cs40l26->regmap, CS40L26_DSP1_CCM_CORE_CONTROL,
+			    CS40L26_DSP_CCM_CORE_KILL);
+}
+
+static const struct cs_dsp_region cs40l26_dsp_regions[] = {
+	{ .type = WMFW_HALO_PM_PACKED, .base = CS40L26_DSP1_PMEM_0 },
+	{ .type = WMFW_HALO_XM_PACKED, .base = CS40L26_DSP1_XMEM_PACKED_0 },
+	{ .type = WMFW_HALO_YM_PACKED, .base = CS40L26_DSP1_YMEM_PACKED_0 },
+	{ .type = WMFW_ADSP2_XM, .base = CS40L26_DSP1_XMEM_UNPACKED24_0 },
+	{ .type = WMFW_ADSP2_YM, .base = CS40L26_DSP1_YMEM_UNPACKED24_0 },
+};
+
+static int cs40l26_get_model(struct cs40l26 *cs40l26)
+{
+	int ret;
+
+	ret = regmap_read(cs40l26->regmap, CS40L26_DEVID, &cs40l26->devid);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(cs40l26->regmap, CS40L26_REVID, &cs40l26->revid);
+	if (ret)
+		return ret;
+
+	switch (cs40l26->devid) {
+	case CS40L26_DEVID_L26:
+		if (cs40l26->revid != CS40L26_REVID_A1 && cs40l26->revid != CS40L26_REVID_B1)
+			goto err;
+
+		cs40l26->variant = &cs40l26_a1_b1_variant;
+		break;
+	case CS40L26_DEVID_L27:
+		if (cs40l26->revid != CS40L26_REVID_B2)
+			goto err;
+
+		cs40l26->variant = &cs40l26_b2_variant;
+		break;
+	default:
+		dev_err(cs40l26->dev, "Invalid device ID 0x%06X\n", cs40l26->devid);
+		return -EINVAL;
+	}
+
+	dev_info(cs40l26->dev, "Cirrus Logic CS40L26 ID: 0x%06X, Revision: 0x%02X\n",
+		 cs40l26->devid, cs40l26->revid);
+
+	return 0;
+
+err:
+	dev_err(cs40l26->dev, "Invalid revision 0x%02X for device 0x%06X\n", cs40l26->revid,
+		cs40l26->devid);
+	return -EINVAL;
+}
+
+int cs40l26_set_pll_loop(struct cs40l26 *cs40l26, const u32 pll_loop)
+{
+	int i;
+
+	/* Retry in case DSP is hibernating */
+	for (i = 0; i < CS40L26_PLL_NUM_SET_ATTEMPTS; i++) {
+		if (!regmap_update_bits(cs40l26->regmap, CS40L26_REFCLK_INPUT,
+					CS40L26_PLL_REFCLK_LOOP_MASK,
+					pll_loop << CS40L26_PLL_REFCLK_LOOP_SHIFT))
+			break;
+	}
+
+	if (i == CS40L26_PLL_NUM_SET_ATTEMPTS) {
+		dev_err(cs40l26->dev, "Failed to configure PLL\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs40l26_set_pll_loop);
+
+static int cs40l26_wseq_init(struct cs40l26 *cs40l26)
+{
+	struct cs_dsp *dsp = &cs40l26->dsp;
+
+	cs40l26->wseqs[CS40L26_WSEQ_POWER_ON].ctl =
+		cs_dsp_get_ctl(dsp, "POWER_ON_SEQUENCE", WMFW_ADSP2_XM, CS40L26_PM_ALGO_ID);
+	if (!cs40l26->wseqs[CS40L26_WSEQ_POWER_ON].ctl) {
+		dev_err(cs40l26->dev, "POWER_ON write sequence not found\n");
+		return -EINVAL;
+	}
+
+	cs40l26->wseqs[CS40L26_WSEQ_ACTIVE].ctl =
+		cs_dsp_get_ctl(dsp, "ACTIVE_SEQUENCE", WMFW_ADSP2_XM, CS40L26_PM_ALGO_ID);
+	if (!cs40l26->wseqs[CS40L26_WSEQ_ACTIVE].ctl) {
+		dev_err(cs40l26->dev, "ACTIVE write sequence not found\n");
+		return -EINVAL;
+	}
+
+	cs40l26->wseqs[CS40L26_WSEQ_STANDBY].ctl =
+		cs_dsp_get_ctl(dsp, "STANDBY_SEQUENCE", WMFW_ADSP2_XM, CS40L26_PM_ALGO_ID);
+	if (!cs40l26->wseqs[CS40L26_WSEQ_STANDBY].ctl) {
+		dev_err(cs40l26->dev, "STANDBY write sequence not found\n");
+		return -EINVAL;
+	}
+
+	return cs_dsp_wseq_init(dsp, cs40l26->wseqs, CS40L26_NUM_WSEQS);
+}
+
+static int cs40l26_wksrc_config(struct cs40l26 *cs40l26)
+{
+	u32 wksrc;
+	int ret;
+
+	if (!strncmp(cs40l26->bus->name, "spi", strlen(cs40l26->bus->name))) {
+		cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_WKSRC_STS_SPI);
+		wksrc = CS40L26_WKSRC_POL_SPI | CS40L26_WKSRC_EN_SPI;
+	} else if (!strncmp(cs40l26->bus->name, "i2c", strlen(cs40l26->bus->name))) {
+		cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_WKSRC_STS_I2C);
+		wksrc = CS40L26_WKSRC_EN_I2C;
+	} else {
+		dev_err(cs40l26->dev, "Invalid bus type\n");
+		return -EINVAL;
+	}
+
+	cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_WKSRC_STS_GPIO1);
+	cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_WKSRC_STS_ANY);
+
+	ret = regmap_write(cs40l26->regmap, CS40L26_WAKESRC_CTL, wksrc);
+	if (ret)
+		return ret;
+
+	return cs_dsp_wseq_write(&cs40l26->dsp, &cs40l26->wseqs[CS40L26_WSEQ_POWER_ON],
+				 CS40L26_WAKESRC_CTL, wksrc, CS_DSP_WSEQ_L16, true);
+}
+
+static inline void cs40l26_gpio_config(struct cs40l26 *cs40l26)
+{
+	cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_GPIO1_RISE);
+	cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_GPIO1_FALL);
+}
+
+static int cs40l26_bst_ipk_config(struct cs40l26 *cs40l26)
+{
+	u32 bst_ipk;
+	int ret;
+
+	bst_ipk = (clamp_val(cs40l26->bst_ipk_ua, CS40L26_BST_IPK_UA_MIN, CS40L26_BST_IPK_UA_MAX) -
+		   CS40L26_BST_IPK_UA_OFFSET) / CS40L26_BST_IPK_UA_STEP;
+
+	cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_BST_IPK_FLAG);
+
+	ret = regmap_write(cs40l26->regmap, CS40L26_BST_IPK_CTL, bst_ipk);
+	if (ret)
+		return ret;
+
+	return cs_dsp_wseq_write(&cs40l26->dsp, &cs40l26->wseqs[CS40L26_WSEQ_POWER_ON],
+				 CS40L26_BST_IPK_CTL, bst_ipk, CS_DSP_WSEQ_L16, true);
+}
+
+static int cs40l26_bst_ctl_config(struct cs40l26 *cs40l26)
+{
+	u32 bst_ctl, bst_ctl_lim;
+	int ret;
+
+	ret = regmap_read(cs40l26->regmap, CS40L26_VBST_CTL_2, &bst_ctl_lim);
+	if (ret)
+		return ret;
+
+	bst_ctl_lim |= FIELD_PREP(CS40L26_BST_CTL_LIM_EN_MASK, CS40L26_BST_CTL_LIM_EN);
+
+	ret = regmap_write(cs40l26->regmap, CS40L26_VBST_CTL_2, bst_ctl_lim);
+	if (ret)
+		return ret;
+
+	ret = cs_dsp_wseq_write(&cs40l26->dsp, &cs40l26->wseqs[CS40L26_WSEQ_POWER_ON],
+				CS40L26_VBST_CTL_2, bst_ctl_lim, CS_DSP_WSEQ_L16, true);
+	if (ret)
+		return ret;
+
+	bst_ctl = (clamp_val(cs40l26->vbst_uv, CS40L26_BST_UV_MIN, CS40L26_BST_UV_MAX) -
+		   CS40L26_BST_UV_MIN) / CS40L26_BST_UV_STEP;
+
+	ret = regmap_write(cs40l26->regmap, CS40L26_VBST_CTL_1, bst_ctl);
+	if (ret)
+		return ret;
+
+	return cs_dsp_wseq_write(&cs40l26->dsp, &cs40l26->wseqs[CS40L26_WSEQ_POWER_ON],
+				 CS40L26_VBST_CTL_1, bst_ctl, CS_DSP_WSEQ_L16, true);
+}
+
+static int cs40l26_irq_init(struct cs40l26 *cs40l26)
+{
+	int i, ret;
+
+	/* Unmask relevant warnings and error interrupts */
+	for (i = CS40L26_IRQ_BST_OVP_FLAG_RISE; i <= CS40L26_IRQ_AMP_ERR; i++)
+		cs40l26_irq_unmask(cs40l26, 1, i);
+
+	cs40l26_irq_unmask(cs40l26, 1, CS40L26_IRQ_DSP_RX_QUEUE);
+
+	for (i = CS40L26_IRQ_VPMON_CLIPPED; i <= CS40L26_IRQ_IMON_CLIPPED; i++)
+		cs40l26_irq_unmask(cs40l26, 2, i);
+
+	for (i = CS40L26_IRQ_REFCLK_PRESENT; i <= CS40L26_IRQ_REFCLK_MISSING_RISE; i++)
+		cs40l26_irq_unmask(cs40l26, 2, i);
+
+	ret = regmap_multi_reg_write(cs40l26->regmap, cs40l26_irq_masks, 2);
+	if (ret)
+		return ret;
+
+	ret = cs_dsp_wseq_multi_write(&cs40l26->dsp, &cs40l26->wseqs[CS40L26_WSEQ_POWER_ON],
+				      cs40l26_irq_masks, 2, CS_DSP_WSEQ_FULL, true);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(cs40l26->dev, cs40l26->irq, NULL, cs40l26_irq_handler,
+					IRQF_ONESHOT, "cs40l26", cs40l26);
+	if (ret)
+		dev_err(cs40l26->dev, "Failed to request IRQ\n");
+
+	return ret;
+}
+
+static int cs40l26_hw_init(struct cs40l26 *cs40l26)
+{
+	int ret;
+
+	cs40l26->irq_masks = cs40l26_irq_masks;
+
+	ret = cs40l26_wksrc_config(cs40l26);
+	if (ret)
+		return ret;
+
+	cs40l26_gpio_config(cs40l26);
+
+	ret = cs40l26_bst_ipk_config(cs40l26);
+	if (ret)
+		return ret;
+
+	ret = cs40l26_bst_ctl_config(cs40l26);
+	if (ret)
+		return ret;
+
+	return cs40l26_irq_init(cs40l26);
+}
+
+static int cs40l26_cs_dsp_pre_run(struct cs_dsp *dsp)
+{
+	struct cs40l26 *cs40l26 = container_of(dsp, struct cs40l26, dsp);
+	int ret;
+
+	ret = cs40l26_pm_timeout_ms_set(cs40l26, CS40L26_DSP_STATE_STANDBY, 100);
+	if (ret) {
+		dev_err(cs40l26->dev, "Failed to set standby timeout\n");
+		return ret;
+	}
+
+	ret = cs40l26_pm_timeout_ms_set(cs40l26, CS40L26_DSP_STATE_ACTIVE, 250);
+	if (ret) {
+		dev_err(cs40l26->dev, "Failed to set active timeout\n");
+		return ret;
+	}
+
+	ret = regmap_set_bits(cs40l26->regmap, CS40L26_PWRMGT_CTL, CS40L26_MEM_RDY);
+	if (ret) {
+		dev_err(cs40l26->dev, "Failed to set MEM_RDY\n");
+		return ret;
+	}
+
+	ret = cs40l26_fw_read(dsp, "QUEUE_BASE", CS40L26_DSP_ALGO_ID, &cs40l26->queue_base);
+	if (ret)
+		return ret;
+
+	ret = cs40l26_fw_read(dsp, "QUEUE_LEN", CS40L26_DSP_ALGO_ID, &cs40l26->queue_len);
+	if (ret)
+		return ret;
+
+	cs40l26->queue_last = cs40l26->queue_base + ((cs40l26->queue_len - 1) * sizeof(u32));
+
+	ret = cs40l26_fw_write(dsp, "CALL_RAM_INIT", dsp->fw_id, 1);
+	if (ret)
+		return ret;
+
+	ret = cs40l26_wseq_init(cs40l26);
+	if (ret)
+		return ret;
+
+	if (cs40l26->variant->handle_errata)
+		return cs40l26->variant->handle_errata(cs40l26);
+	else
+		return 0;
+}
+
+static int cs40l26_cs_dsp_post_run(struct cs_dsp *dsp)
+{
+	struct cs40l26 *cs40l26 = container_of(dsp, struct cs40l26, dsp);
+	u32 halo_state;
+	int ret;
+
+	/*
+	 * cs_dsp_halo_start_core() has reset the DSP core at this point.
+	 * Hibernation must be disabled again.
+	 */
+	ret = cs40l26_prevent_hiber(cs40l26);
+	if (ret)
+		return ret;
+
+	ret = cs40l26_fw_read(dsp, "HALO_STATE", dsp->fw_id, &halo_state);
+	if (ret)
+		return ret;
+
+	if (halo_state != CS40L26_DSP_HALO_STATE_RUN) {
+		dev_err(dsp->dev, "Invalid DSP state: %u\n", halo_state);
+		return -EINVAL;
+	}
+
+	ret = cs40l26_hw_init(cs40l26);
+	if (ret)
+		return ret;
+
+	dev_dbg(dsp->dev, "CS40L26/L27 DSP started successfully\n");
+
+	ret = devm_mfd_add_devices(cs40l26->dev, PLATFORM_DEVID_AUTO, cs40l26_devs,
+				   ARRAY_SIZE(cs40l26_devs), NULL, 0, NULL);
+	if (ret)
+		dev_err(cs40l26->dev, "Failed to add MFD child devices: %d\n", ret);
+
+	return ret;
+}
+
+static const struct cs_dsp_client_ops cs40l26_cs_dsp_client_ops = {
+	.pre_run = cs40l26_cs_dsp_pre_run,
+	.post_run = cs40l26_cs_dsp_post_run,
+};
+
+static void cs40l26_cs_dsp_remove(void *data)
+{
+	cs_dsp_remove((struct cs_dsp *)data);
+}
+
+static struct cs_dsp_coeff_desc cs40l26_coeffs[] = {
+	{ .coeff_firmware = NULL, .coeff_filename = "cs40l26.bin" },
+	{ .coeff_firmware = NULL, .coeff_filename = "cs40l26-svc.bin" },
+	{ .coeff_firmware = NULL, .coeff_filename = "cs40l26-dvl.bin" },
+};
+
+static int cs40l26_cs_dsp_init(struct cs40l26 *cs40l26)
+{
+	struct cs_dsp *dsp = &cs40l26->dsp;
+	int ret;
+
+	dsp->num = 1;
+	dsp->type = WMFW_HALO;
+	dsp->dev = cs40l26->dev;
+	dsp->regmap = cs40l26->regmap;
+	dsp->base = CS40L26_DSP_CTRL_BASE;
+	dsp->base_sysinfo = CS40L26_DSP1_SYS_INFO_ID;
+	dsp->mem = cs40l26_dsp_regions;
+	dsp->num_mems = ARRAY_SIZE(cs40l26_dsp_regions);
+	dsp->client_ops = &cs40l26_cs_dsp_client_ops;
+
+	ret = cs_dsp_halo_init(dsp);
+	if (ret) {
+		dev_err(cs40l26->dev, "Failed to initialize HALO core\n");
+		return ret;
+	}
+
+	return devm_add_action_or_reset(cs40l26->dev, cs40l26_cs_dsp_remove, dsp);
+}
+
+static void cs40l26_dsp_start(struct cs40l26 *cs40l26)
+{
+	int i, ret;
+
+	ret = cs40l26_dsp_pre_config(cs40l26);
+	if (ret) {
+		dev_err(cs40l26->dev, "DSP Pre Config. Failed: %d\n", ret);
+		goto err_fw_rls;
+	}
+
+	guard(mutex)(&cs40l26->lock);
+
+	ret = cs_dsp_power_up_multiple(&cs40l26->dsp, cs40l26->wmfw, "cs40l26.wmfw", cs40l26_coeffs,
+				       CS40L26_NUM_COEFF_FILES, "cs40l26");
+	if (ret) {
+		dev_err(cs40l26->dev, "Failed to Power Up DSP\n");
+		goto err_fw_rls;
+	}
+
+	if (cs40l26->dsp.fw_id != CS40L26_FW_ID) {
+		dev_err(cs40l26->dev, "Invalid firmware ID: 0x%X\n", cs40l26->dsp.fw_id);
+		goto err_fw_rls;
+	}
+
+	if (cs40l26->dsp.fw_id_version < cs40l26->variant->info->fw_min_rev) {
+		dev_err(cs40l26->dev, "Invalid firmware revision: 0x%X\n",
+			cs40l26->dsp.fw_id_version);
+		goto err_fw_rls;
+	}
+
+	ret = cs_dsp_run(&cs40l26->dsp);
+	if (ret)
+		dev_err(cs40l26->dev, "DSP Failed to run: %d\n", ret);
+
+err_fw_rls:
+	for (i = 0; i < CS40L26_NUM_COEFF_FILES; i++)
+		release_firmware(cs40l26_coeffs[i].coeff_firmware);
+
+	release_firmware(cs40l26->wmfw);
+}
+
+static void cs40l26_fw_upload(const struct firmware *wmfw, void *context)
+{
+	struct cs40l26 *cs40l26 = (struct cs40l26 *)context;
+	const struct firmware *coeff;
+	int i, ret;
+
+	if (!wmfw) {
+		dev_err(cs40l26->dev, "Failed to request firmware file\n");
+		return;
+	}
+
+	cs40l26->wmfw = wmfw;
+
+	for (i = 0; i < CS40L26_NUM_COEFF_FILES; i++) {
+		ret = request_firmware(&coeff, cs40l26_coeffs[i].coeff_filename, cs40l26->dev);
+		if (ret)
+			continue;
+
+		cs40l26_coeffs[i].coeff_firmware = coeff;
+	}
+
+	return cs40l26_dsp_start(cs40l26);
+}
+
+static int cs40l26_init(struct cs40l26 *cs40l26)
+{
+	int ret;
+
+	cs40l26->bst_ipk_ua = CS40L26_BST_IPK_UA_DEFAULT;
+	cs40l26->vbst_uv = CS40L26_BST_UV_MAX;
+	/*
+	 * Set the PLL to open-loop and remove default GPI mappings to prevent DSP lockup while
+	 * the driver configures RAM firmware.
+	 *
+	 * The firmware will set the PLL back to closed-loop when the DSP has been started.
+	 */
+	ret = cs40l26_set_pll_loop(cs40l26, CS40L26_PLL_OPEN);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(cs40l26->regmap, cs40l26->variant->info->event_map_1,
+			   CS40L26_EVENT_MAP_GPI_DISABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(cs40l26->regmap, cs40l26->variant->info->event_map_2,
+			   CS40L26_EVENT_MAP_GPI_DISABLE);
+	if (ret)
+		return ret;
+
+	/* Set LRA to HI-Z to avoid fault conditions */
+	return regmap_set_bits(cs40l26->regmap, CS40L26_TST_DAC_MSM_CONFIG,
+			       CS40L26_SPK_DEFAULT_HIZ);
+}
+
+static int cs40l26_parse_properties(struct cs40l26 *cs40l26)
+{
+	struct device *dev = cs40l26->dev;
+	int ret;
+
+	ret = device_property_read_u32(dev, "cirrus,bst-ctl-microvolt", &cs40l26->vbst_uv);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = device_property_read_u32(dev, "cirrus,bst-ipk-microamp", &cs40l26->bst_ipk_ua);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	return 0;
+}
+
+int cs40l26_probe(struct cs40l26 *cs40l26)
+{
+	int ret;
+
+	mutex_init(&cs40l26->lock);
+
+	cs40l26->reset_gpio = devm_gpiod_get_optional(cs40l26->dev, "reset", GPIOD_OUT_HIGH);
+	if (!cs40l26->reset_gpio)
+		return dev_err_probe(cs40l26->dev, -EINVAL, "Failed to get reset GPIO\n");
+
+	ret = devm_regulator_bulk_get_enable(cs40l26->dev, ARRAY_SIZE(cs40l26_supplies),
+					     cs40l26_supplies);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to get supplies\n");
+
+	usleep_range(CS40L26_MIN_RESET_PULSE_US, CS40L26_MIN_RESET_PULSE_US + 100);
+
+	gpiod_set_value_cansleep(cs40l26->reset_gpio, 0);
+
+	usleep_range(CS40L26_CP_READY_DELAY_US, CS40L26_CP_READY_DELAY_US + 100);
+
+	ret = cs40l26_get_model(cs40l26);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to get part number\n");
+
+	ret = cs40l26_prevent_hiber(cs40l26);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to prevent hibernation\n");
+
+	ret = cs40l26_init(cs40l26);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to initialize device\n");
+
+	ret = cs40l26_parse_properties(cs40l26);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to parse devicetree\n");
+
+	ret = cs40l26_cs_dsp_init(cs40l26);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to initialize CS DSP\n");
+
+	ret = cs40l26_pm_runtime_setup(cs40l26->dev);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to set up PM Runtime\n");
+
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT, "cs40l26.wmfw", cs40l26->dev,
+				      GFP_KERNEL, cs40l26, cs40l26_fw_upload);
+	if (ret)
+		return dev_err_probe(cs40l26->dev, ret, "Failed to load firmware\n");
+
+	cs40l26_pm_exit(cs40l26->dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs40l26_probe);
+
+static int __maybe_unused cs40l26_suspend(struct device *dev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(dev);
+
+	guard(mutex)(&cs40l26->lock);
+
+	dev_dbg(dev, "%s: Enabling hibernation\n", __func__);
+
+	cs40l26->wksrc_sts = 0x00;
+
+	/* Don't poll DSP since reading for ACK will wake the device again */
+	return regmap_write(cs40l26->regmap, CS40L26_DSP_QUEUE, CS40L26_DSP_CMD_ALLOW_HIBER);
+}
+
+static int __maybe_unused cs40l26_sys_suspend(struct device *dev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "System suspend, disabling IRQ\n");
+
+	disable_irq(cs40l26->irq);
+
+	return 0;
+}
+
+static int __maybe_unused cs40l26_sys_suspend_noirq(struct device *dev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "Late system suspend, re-enabling IRQ\n");
+
+	enable_irq(cs40l26->irq);
+
+	return 0;
+}
+
+static int __maybe_unused cs40l26_resume(struct device *dev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s: Disabling hibernation\n", __func__);
+
+	guard(mutex)(&cs40l26->dsp.pwr_lock);
+
+	return cs40l26_prevent_hiber(cs40l26);
+}
+
+static int __maybe_unused cs40l26_sys_resume(struct device *dev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "System resume, re-enabling IRQ\n");
+
+	enable_irq(cs40l26->irq);
+
+	return 0;
+}
+
+static int __maybe_unused cs40l26_sys_resume_noirq(struct device *dev)
+{
+	struct cs40l26 *cs40l26 = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "Early system resume, disabling IRQ\n");
+
+	disable_irq(cs40l26->irq);
+
+	return 0;
+}
+
+EXPORT_GPL_DEV_PM_OPS(cs40l26_pm_ops) = {
+	RUNTIME_PM_OPS(cs40l26_suspend, cs40l26_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(cs40l26_sys_suspend, cs40l26_sys_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs40l26_sys_suspend_noirq, cs40l26_sys_resume_noirq)
+};
+
+MODULE_DESCRIPTION("CS40L26 Boosted Class D Amplifier for Haptics");
+MODULE_AUTHOR("Fred Treven, Cirrus Logic Inc. <ftreven@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/drivers/mfd/cs40l26-i2c.c b/drivers/mfd/cs40l26-i2c.c
new file mode 100644
index 000000000000..c6e4118775a2
--- /dev/null
+++ b/drivers/mfd/cs40l26-i2c.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS40L26 Boosted Haptic Driver with Integrated DSP and
+ * Waveform Memory with Advanced Closed Loop Algorithms and LRA protection
+ *
+ * Copyright 2025 Cirrus Logic, Inc.
+ *
+ * Author: Fred Treven <ftreven@opensource.cirrus.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/mfd/cs40l26.h>
+
+static int cs40l26_i2c_probe(struct i2c_client *i2c)
+{
+	struct cs40l26 *cs40l26;
+
+	cs40l26 = devm_kzalloc(&i2c->dev, sizeof(struct cs40l26), GFP_KERNEL);
+	if (!cs40l26)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, cs40l26);
+
+	cs40l26->dev = &i2c->dev;
+	cs40l26->irq = i2c->irq;
+	cs40l26->bus = &i2c_bus_type;
+
+	cs40l26->regmap = devm_regmap_init_i2c(i2c, &cs40l26_regmap);
+	if (IS_ERR(cs40l26->regmap))
+		return dev_err_probe(cs40l26->dev, PTR_ERR(cs40l26->regmap),
+				     "Failed to allocate register map\n");
+
+	return cs40l26_probe(cs40l26);
+}
+
+static const struct i2c_device_id cs40l26_id_i2c[] = {
+	{ "cs40l26a", 0 },
+	{ "cs40l27b", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, cs40l26_id_i2c);
+
+static const struct of_device_id cs40l26_of_match[] = {
+	{ .compatible = "cirrus,cs40l26a" },
+	{ .compatible = "cirrus,cs40l27b" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cs40l26_of_match);
+
+static struct i2c_driver cs40l26_i2c_driver = {
+	.driver = {
+		.name = "cs40l26",
+		.of_match_table = cs40l26_of_match,
+		.pm = pm_ptr(&cs40l26_pm_ops),
+	},
+	.id_table = cs40l26_id_i2c,
+	.probe = cs40l26_i2c_probe,
+};
+module_i2c_driver(cs40l26_i2c_driver);
+
+MODULE_DESCRIPTION("CS40L26 I2C Driver");
+MODULE_AUTHOR("Fred Treven, Cirrus Logic Inc. <ftreven@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/cs40l26-spi.c b/drivers/mfd/cs40l26-spi.c
new file mode 100644
index 000000000000..57fc92356d9d
--- /dev/null
+++ b/drivers/mfd/cs40l26-spi.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS40L26 Boosted Haptic Driver with Integrated DSP and
+ * Waveform Memory with Advanced Closed Loop Algorithms and LRA protection
+ *
+ * Copyright 2025 Cirrus Logic, Inc.
+ *
+ * Author: Fred Treven <ftreven@opensource.cirrus.com>
+ */
+
+#include <linux/mfd/cs40l26.h>
+#include <linux/spi/spi.h>
+
+static int cs40l26_spi_probe(struct spi_device *spi)
+{
+	struct cs40l26 *cs40l26;
+
+	cs40l26 = devm_kzalloc(&spi->dev, sizeof(struct cs40l26), GFP_KERNEL);
+	if (!cs40l26)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, cs40l26);
+
+	cs40l26->dev = &spi->dev;
+	cs40l26->irq = spi->irq;
+	cs40l26->bus = &spi_bus_type;
+
+	cs40l26->regmap = devm_regmap_init_spi(spi, &cs40l26_regmap);
+	if (IS_ERR(cs40l26->regmap))
+		return dev_err_probe(cs40l26->dev, PTR_ERR(cs40l26->regmap),
+				     "Failed to allocate register map\n");
+
+	return cs40l26_probe(cs40l26);
+}
+
+static const struct spi_device_id cs40l26_id_spi[] = {
+	{ "cs40l26a", 0 },
+	{ "cs40l27b", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, cs40l26_id_spi);
+
+static const struct of_device_id cs40l26_of_match[] = {
+	{ .compatible = "cirrus,cs40l26a" },
+	{ .compatible = "cirrus,cs40l27b" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cs40l26_of_match);
+
+static struct spi_driver cs40l26_spi_driver = {
+	.driver = {
+		.name = "cs40l26",
+		.of_match_table = cs40l26_of_match,
+		.pm = pm_ptr(&cs40l26_pm_ops),
+	},
+	.id_table = cs40l26_id_spi,
+	.probe = cs40l26_spi_probe,
+};
+module_spi_driver(cs40l26_spi_driver);
+
+MODULE_DESCRIPTION("CS40L26 SPI Driver");
+MODULE_AUTHOR("Fred Treven, Cirrus Logic Inc. <ftreven@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/cs40l26.h b/include/linux/mfd/cs40l26.h
new file mode 100644
index 000000000000..c0647c09e24d
--- /dev/null
+++ b/include/linux/mfd/cs40l26.h
@@ -0,0 +1,341 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * CS40L26 Boosted Haptic Driver with Integrated DSP and
+ * Waveform Memory with Advanced Closed Loop Algorithms and LRA protection
+ *
+ * Copyright 2025 Cirrus Logic, Inc.
+ *
+ * Author: Fred Treven <ftreven@opensource.cirrus.com>
+ */
+
+#ifndef __MFD_CS40L26_H__
+#define __MFD_CS40L26_H__
+
+#include <linux/bitops.h>
+#include <linux/firmware/cirrus/cs_dsp.h>
+#include <linux/firmware/cirrus/wmfw.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+/* Register Addresses */
+#define CS40L26_LASTREG			0x3C7DFE8
+#define CS40L26_DEVID			0x0
+#define CS40L26_REVID			0x4
+#define CS40L26_GLOBAL_ENABLES		0x2014
+#define CS40L26_ERROR_RELEASE		0x2034
+#define CS40L26_PWRMGT_CTL		0x2900
+#define CS40L26_WAKESRC_CTL		0x2904
+#define CS40L26_PWRMGT_STS		0x290C
+#define CS40L26_REFCLK_INPUT		0x2C04
+#define CS40L26_PLL_REFCLK_DETECT_0	0x2C28
+#define CS40L26_VBST_CTL_1		0x3800
+#define CS40L26_VBST_CTL_2		0x3804
+#define CS40L26_BST_IPK_CTL		0x3808
+#define CS40L26_TEST_LBST		0x391C
+#define CS40L26_DAC_MSM_CONFIG		0x7400
+#define CS40L26_TST_DAC_MSM_CONFIG	0x7404
+#define CS40L26_IRQ1_STATUS		0x10004
+#define CS40L26_IRQ1_EINT_1		0x10010
+#define CS40L26_IRQ1_EINT_2		0x10014
+#define CS40L26_IRQ1_MASK_1		0x10110
+#define CS40L26_IRQ1_MASK_2		0x10114
+#define CS40L26_DSP_QUEUE		0x13020
+#define CS40L26_DSP1_XMEM_PACKED_0	0x2000000
+#define CS40L26_DSP1_SYS_INFO_ID	0x25E0000
+#define CS40L26_DSP1_XMEM_UNPACKED24_0	0x2800000
+#define CS40L26_DSP1_CCM_CORE_CONTROL	0x2BC1000
+#define CS40L26_DSP1_YMEM_PACKED_0	0x2C00000
+#define CS40L26_DSP1_YMEM_UNPACKED32_0	0x3000000
+#define CS40L26_DSP1_YMEM_UNPACKED24_0	0x3400000
+#define CS40L26_DSP1_PMEM_0		0x3800000
+
+/* Device */
+#define CS40L26_DEVID_L26		0x40A260
+#define CS40L26_DEVID_L27		0x40A270
+#define CS40L26_REVID_A1		0xA1
+#define CS40L26_REVID_B1		0xB1
+#define CS40L26_REVID_B2		0xB2
+#define CS40L26_MIN_RESET_PULSE_US	1500
+#define CS40L26_CP_READY_DELAY_US	6000
+#define CS40L26_SPK_DEFAULT_HIZ		BIT(28)
+#define CS40L26_DSP_CCM_CORE_KILL	0x00000080
+#define CS40L26_MEM_RDY			BIT(1)
+
+/* Errata */
+#define CS40L26_DISABLE_EXPL_MODE	0x0100C080
+
+#define CS40L26_PLL_REFCLK_DET_DISABLE	0x0
+
+/* Boost Converter Control */
+#define CS40L26_GLOBAL_EN		BIT(0)
+
+#define CS40L26_BST_IPK_UA_MAX		4800000
+#define CS40L26_BST_IPK_UA_DEFAULT	4500000
+#define CS40L26_BST_IPK_UA_MIN		1600000
+#define CS40L26_BST_IPK_UA_STEP		50000
+#define CS40L26_BST_IPK_UA_OFFSET	800000
+
+#define CS40L26_BST_UV_MIN		2500000
+#define CS40L26_BST_UV_MAX		11000000
+#define CS40L26_BST_UV_STEP		50000
+
+#define CS40L26_BST_CTL_VP		0x00
+#define CS40L26_BST_CTL_MASK		GENMASK(7, 0)
+#define CS40L26_BST_CTL_SEL_MASK	GENMASK(1, 0)
+#define CS40L26_BST_CTL_SEL_FIXED	0x0
+#define CS40L26_BST_CTL_LIM_EN_MASK	BIT(2)
+#define CS40L26_BST_CTL_LIM_EN		1
+
+#define CS40L26_BST_TIME_US		10000
+
+/* Phase Locked Loop */
+#define CS40L26_PLL_REFCLK_LOOP_MASK	BIT(11)
+#define CS40L26_PLL_REFCLK_LOOP_SHIFT	11
+#define CS40L26_PLL_NUM_SET_ATTEMPTS	5
+
+/* GPIO */
+#define CS40L26_EVENT_MAP_GPI_DISABLE	0x1FF
+
+#define CS40L26_A1_B1_EVENT_MAP_1	0x02806FC4
+#define CS40L26_A1_B1_EVENT_MAP_2	0x02806FC8
+
+#define CS40L26_B2_EVENT_MAP_1		0x02806FB0
+#define CS40L26_B2_EVENT_MAP_2		0x02806FB4
+
+/* Power Management */
+#define CS40L26_PM_STDBY_TICKS_OFFSET	16
+#define CS40L26_PM_ACTIVE_TICKS_OFFSET	24
+
+#define CS40L26_A1_B1_PM_CUR_STATE	0x02800370
+#define CS40L26_A1_B1_PM_STATE_LOCKS	0x02800378
+#define CS40L26_A1_B1_PM_STATE_LOCKS3	(CS40L26_A1_B1_PM_STATE_LOCKS + \
+					CS40L26_DSP_LOCK3_OFFSET_BYTES)
+
+#define	CS40L26_A1_B1_PM_TIMEOUT_TICKS	0x02800350
+#define CS40L26_A1_B1_PM_STDBY_TICKS	(CS40L26_A1_B1_PM_TIMEOUT_TICKS + \
+					CS40L26_PM_STDBY_TICKS_OFFSET)
+#define CS40L26_A1_B1_PM_ACTIVE_TICKS	(CS40L26_A1_B1_PM_TIMEOUT_TICKS + \
+					CS40L26_PM_ACTIVE_TICKS_OFFSET)
+
+#define CS40L26_A1_B1_HALO_STATE	0x02800FA8
+
+#define CS40L26_B2_PM_CUR_STATE		0x02801F98
+#define CS40L26_B2_PM_STATE_LOCKS	0x02801FA0
+#define CS40L26_B2_PM_STATE_LOCKS3	(CS40L26_B2_PM_STATE_LOCKS + CS40L26_DSP_LOCK3_OFFSET_BYTES)
+#define CS40L26_B2_PM_TIMEOUT_TICKS	0x02801F78
+#define CS40L26_B2_PM_STDBY_TICKS	(CS40L26_B2_PM_TIMEOUT_TICKS + \
+					CS40L26_PM_STDBY_TICKS_OFFSET)
+#define CS40L26_B2_PM_ACTIVE_TICKS	(CS40L26_B2_PM_TIMEOUT_TICKS + \
+					CS40L26_PM_ACTIVE_TICKS_OFFSET)
+
+#define CS40L26_B2_HALO_STATE		0x02806AF8
+
+#define CS40L26_AUTOSUSPEND_DELAY_MS	2000
+#define CS40L26_PM_TICKS_PER_SEC	32768
+
+/* Firmware Handling */
+#define CS40L26_FW_ID			0x1800D4
+#define CS40L26_FW_A1_B1_MIN_REV	0x070247
+#define CS40L26_FW_B2_MIN_REV		0x0A0000
+
+#define CS40L26_NUM_COEFF_FILES 3
+
+/* Algorithms */
+#define CS40L26_VIBEGEN_ALGO_ID_A1	0x000400BD
+#define CS40L26_VIBEGEN_ALGO_ID_B2	0x000A00BD
+
+#define CS40L26_BUZZGEN_ALGO_ID	0x0004F202
+#define CS40L26_A2H_ALGO_ID	0x00040110
+#define CS40L26_EXT_ALGO_ID	0x0004013C
+#define CS40L26_DSP_ALGO_ID	0x0004F203
+#define CS40L26_PM_ALGO_ID	0x0004F206
+
+/* DSP */
+#define CS40L26_DSP_LOCK3_OFFSET_BYTES	8
+#define CS40L26_DSP_LOCK3_OFFSET_WORDS	(CS40L26_DSP_LOCK3_OFFSET_BYTES / sizeof(u32))
+#define CS40L26_DSP_LOCK3_MASK		BIT(1)
+#define CS40L26_DSP_HALO_STATE_RUN	2
+#define CS40L26_DSP_CTRL_BASE		0x2B80000
+#define CS40L26_DSP_POLL_US		1000
+#define CS40L26_DSP_TIMEOUT_COUNT	100
+#define CS40L26_PM_LOCKS_TIMEOUT_COUNT	10
+#define CS40L26_DSP_STATE_TIMEOUT_COUNT	10
+
+#define CS40L26_DSP_CMD_PREVENT_HIBER	0x02000003
+#define CS40L26_DSP_CMD_ALLOW_HIBER	0x02000004
+#define CS40L26_DSP_CMD_INDEX_MASK	GENMASK(28, 24)
+#define CS40L26_DSP_CMD_PAYLOAD_MASK	GENMASK(23, 0)
+
+#define CS40L26_DSP_COMPLETE_CP		0x01000000
+#define CS40L26_DSP_COMPLETE_I2S	0x01000002
+#define CS40L26_DSP_TRIGGER_CP		0x01000010
+#define CS40L26_DSP_TRIGGER_I2S		0x01000012
+#define CS40L26_DSP_PM_AWAKE		0x02000002
+#define CS40L26_DSP_SYS_ACK		0x0A000000
+#define CS40L26_DSP_PANIC		0x0C000000
+
+/* Wake Sources */
+#define CS40L26_WKSRC_STS_MASK		GENMASK(9, 4)
+#define CS40L26_WKSRC_STS_SHIFT		4
+#define CS40L26_WKSRC_STS_EN		BIT(7)
+#define CS40L26_WKSRC_POL_SPI		BIT(4)
+#define CS40L26_WKSRC_EN_SPI		BIT(9)
+#define CS40L26_WKSRC_EN_I2C		BIT(10)
+#define CS40L26_WKSRC_GPIO_POL_MASK	GENMASK(3, 0)
+
+/* Interrupts */
+#define CS40L26_IRQ_GPIO1_RISE		0
+#define CS40L26_IRQ_GPIO1_FALL		1
+#define CS40L26_IRQ_WKSRC_STS_ANY	8
+#define CS40L26_IRQ_WKSRC_STS_GPIO1	9
+#define CS40L26_IRQ_WKSRC_STS_SPI	13
+#define CS40L26_IRQ_WKSRC_STS_I2C	14
+#define CS40L26_IRQ_BST_OVP_FLAG_RISE	18
+#define CS40L26_IRQ_BST_OVP_FLAG_FALL	19
+#define CS40L26_IRQ_BST_OVP_ERR		20
+#define CS40L26_IRQ_BST_DCM_UVP_ERR	21
+#define CS40L26_IRQ_BST_SHORT_ERR	22
+#define CS40L26_IRQ_BST_IPK_FLAG	23
+#define CS40L26_IRQ_TEMP_WARN_RISE	24
+#define CS40L26_IRQ_TEMP_WARN_FALL	25
+#define CS40L26_IRQ_TEMP_ERR		26
+#define CS40L26_IRQ_AMP_ERR		27
+#define CS40L26_IRQ_DSP_RX_QUEUE	31
+
+#define CS40L26_IRQ_1_NBITS		32
+
+#define CS40L26_IRQ_REFCLK_PRESENT	6
+#define CS40L26_IRQ_REFCLK_MISSING_FALL	7
+#define CS40L26_IRQ_REFCLK_MISSING_RISE	8
+#define CS40L26_IRQ_VPMON_CLIPPED	23
+#define CS40L26_IRQ_VBSTMON_CLIPPED	24
+#define CS40L26_IRQ_VMON_CLIPPED	25
+#define CS40L26_IRQ_IMON_CLIPPED	26
+
+#define CS40L26_IRQ_2_NBITS		30
+
+#define CS40L26_IRQ_1_ALL_MASKED	0xFFFFFFFF
+#define CS40L26_IRQ_2_ALL_MASKED	0x3FFFFFFF
+
+#define CS40L26_IRQ_STATUS_ASSERT	0x1
+
+/* Playback */
+#define CS40L26_STOP_PLAYBACK	0x05000000
+
+#define CS40L26_START_I2S	0x03000002
+#define CS40L26_STOP_I2S	0x03000003
+
+/* Error Release */
+enum cs40l26_error {
+	CS40L26_ERROR_NONE,
+	CS40L26_ERROR_AMP_SHORT,
+	CS40L26_ERROR_BST_SHORT,
+	CS40L26_ERROR_BST_OVP,
+	CS40L26_ERROR_BST_DCM_UVP,
+	CS40L26_ERROR_TEMP_WARN,
+	CS40L26_ERROR_TEMP_ERR,
+};
+
+struct cs40l26_irq {
+	int virq;
+	u32 mask;
+	const char *name;
+	int (*handler)(void *data);
+};
+
+#define CS40L26_IRQ(_irq, _name, _hand)			\
+	{						\
+		.virq = CS40L26_IRQ_ ## _irq,		\
+		.mask = BIT(CS40L26_ ## IRQ_ ## _irq),	\
+		.name = _name,				\
+		.handler = _hand,			\
+	}
+
+enum cs40l26_dsp_state {
+	CS40L26_DSP_STATE_HIBERNATE,
+	CS40L26_DSP_STATE_SHUTDOWN,
+	CS40L26_DSP_STATE_STANDBY,
+	CS40L26_DSP_STATE_ACTIVE,
+	CS40L26_DSP_STATE_NONE,
+};
+
+enum cs40l26_gpio_map {
+	CS40L26_GPIO_MAP_A_PRESS,
+	CS40L26_GPIO_MAP_A_RELEASE,
+	CS40L26_GPIO_MAP_NUM_AVAILABLE,
+	CS40L26_GPIO_MAP_INVALID,
+};
+
+enum cs40l26_pll {
+	CS40L26_PLL_CLOSED,
+	CS40L26_PLL_OPEN,
+};
+
+enum cs40l50_wseqs {
+	CS40L26_WSEQ_POWER_ON,
+	CS40L26_WSEQ_ACTIVE,
+	CS40L26_WSEQ_STANDBY,
+	CS40L26_NUM_WSEQS,
+};
+
+struct cs40l26_variant_info {
+	u32 pm_cur_state;
+	u32 pm_state_locks;
+	u32 pm_state_locks3;
+	u32 pm_stdby_ticks;
+	u32 pm_active_ticks;
+	u32 halo_state;
+	u32 event_map_1;
+	u32 event_map_2;
+	u32 fw_min_rev;
+	u32 ram_ext_algo_id;
+	u32 vibegen_algo_id;
+};
+
+struct cs40l26_variant;
+
+struct cs40l26 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct cs_dsp dsp;
+	int irq;
+	struct mutex lock;
+	struct gpio_desc *reset_gpio;
+	u32 devid;
+	u32 revid;
+	const struct cs40l26_variant *variant;
+	struct cs_dsp_wseq wseqs[CS40L26_NUM_WSEQS];
+	u8 wksrc_sts;
+	u8 last_wksrc_pol;
+	u32 queue_base;
+	u32 queue_len;
+	u32 queue_last;
+	unsigned int bst_ipk_ua;
+	unsigned int vbst_uv;
+	const struct firmware *wmfw;
+	const struct bus_type *bus;
+	struct reg_sequence *irq_masks;
+};
+
+struct cs40l26_variant {
+	const struct cs40l26_variant_info *info;
+	int (*handle_errata)(struct cs40l26 *cs40l26);
+};
+
+inline void cs40l26_pm_exit(struct device *dev);
+int cs40l26_probe(struct cs40l26 *cs40l26);
+int cs40l26_set_pll_loop(struct cs40l26 *cs40l26, const u32 pll_loop);
+int cs40l26_dsp_write(struct cs40l26 *cs40l26, const u32 val);
+int cs40l26_dsp_state_get(struct cs40l26 *cs40l26, u32 *state);
+inline int cs40l26_fw_write(struct cs_dsp *dsp, const char *const name,
+			    const unsigned int algo_id, u32 val);
+inline int cs40l26_fw_read(struct cs_dsp *dsp, const char *const name,
+			   const unsigned int algo_id, u32 *buf);
+
+extern const struct regmap_config cs40l26_regmap;
+extern const struct dev_pm_ops cs40l26_pm_ops;
+
+#endif /* __CS40L26_H__ */
-- 
2.34.1



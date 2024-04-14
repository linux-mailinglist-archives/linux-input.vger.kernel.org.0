Return-Path: <linux-input+bounces-2956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BF8A2E74
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 14:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 876202858F0
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 12:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061525B5BE;
	Fri, 12 Apr 2024 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O52vpQT4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F5859151;
	Fri, 12 Apr 2024 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712925406; cv=none; b=GGNQVs0cTZXXrCM+/B6CfjhS9ktZXmHBiIJvuZ+0+Hq9BhEUMWi32VoEdITjL3TvzO+59wq0EEwCUqDXIVYqS3qnedSvxmNxvOeGRfp39fEh0KOGfTdqKzL/NdzHHGwqVcY64SyW3hF0ISHIAZIT7yTX2qH9NHt3F66eiI7Dk/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712925406; c=relaxed/simple;
	bh=xFE6yHf+ELaJ65ZtXDVDrnM3v5v9K1M4YZUAaGCz6hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9D3rAODgo3mrC3PBdj9x3YzM5Bf2uKvY1oROYcBscFUjl6e5xFn9AZ3teuoMvV6K8UGesbD1wkx+ftKz61akk3Jieu2Dif4s4EjtZ3hkh9Iqtztfyg2LHO4nIr7IeIuaYBybzKL7bijNmK7CB1Bl4rPPANjq+Mt6R26F7hw22k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O52vpQT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EFB8C4AF0B;
	Fri, 12 Apr 2024 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712925406;
	bh=xFE6yHf+ELaJ65ZtXDVDrnM3v5v9K1M4YZUAaGCz6hU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O52vpQT4trXty8+uUPyJnHsOy+z3I6QMlEx2IPUfF3Aai5WznsvNSHu1bbsHr08M8
	 mLJ0c1khJ5MFX31E7nLMQf+aZk4OFxKC3Ibi+wOg7s5JSNehyX8IZXPBTcmyf+w2A+
	 KcS5NRf/dH97k3qDDfaPs0/Z4lrWfizicfHHAAtFUTRqkw7IHW/SpOfUFOdBu8JDBw
	 wwmqj+O+LDp8KrqX4lDwi0BikZ1jsntrsk5qkYpOlb5bKXCLoAh4ZTj9Pz3KXDgvW7
	 E46T4WHS1h02CWTQ5NXE5yugo6RyzEI02qtdZbWpRmldd1zy1LzxbW50rIsURwXoXa
	 V5mVRSmz3E+Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D2FC4345F;
	Fri, 12 Apr 2024 12:36:46 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+quic_fenglinw.quicinc.com@kernel.org>
Date: Fri, 12 Apr 2024 20:36:28 +0800
Subject: [PATCH v10 4/4] input: pm8xxx-vibrator: add new SPMI vibrator
 support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-pm8xxx-vibrator-new-design-v10-4-0ec0ad133866@quicinc.com>
References: <20240412-pm8xxx-vibrator-new-design-v10-0-0ec0ad133866@quicinc.com>
In-Reply-To: <20240412-pm8xxx-vibrator-new-design-v10-0-0ec0ad133866@quicinc.com>
To: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712925404; l=5274;
 i=quic_fenglinw@quicinc.com; s=20240327; h=from:subject:message-id;
 bh=mtvq3ksLnluW1t+bHVsls8dPe8UtzlHjlwBNRHuZr8U=;
 b=MWzogqUr0K1rwZQrUvkBweUGfhJxGrWFNASMzeVu+h/+6tOdmgAzJqpUNVEcOZvzVS4R3Zstd
 F3NANoCNFSECDM/U3ZMopW7DyO+Ae+54f9tCi4zlVnzHssUkDvPb8xr
X-Developer-Key: i=quic_fenglinw@quicinc.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for quic_fenglinw@quicinc.com/20240327
 with auth_id=146
X-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Reply-To: quic_fenglinw@quicinc.com

From: Fenglin Wu <quic_fenglinw@quicinc.com>

Add support for a new SPMI vibrator module which is very similar
to the vibrator module inside PM8916 but has a finer drive voltage
step and different output voltage range, its drive level control
is expanded across 2 registers. The vibrator module can be found
in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/input/misc/pm8xxx-vibrator.c | 55 ++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
index 640927f94143..8b9d757d650f 100644
--- a/drivers/input/misc/pm8xxx-vibrator.c
+++ b/drivers/input/misc/pm8xxx-vibrator.c
@@ -12,10 +12,11 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-#define VIB_MAX_LEVEL_mV	(3100)
-#define VIB_MIN_LEVEL_mV	(1200)
-#define VIB_PER_STEP_mV		(100)
-#define VIB_MAX_LEVELS		(VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV + VIB_PER_STEP_mV)
+#define VIB_MAX_LEVEL_mV(vib)	(vib->drv2_addr ? 3544 : 3100)
+#define VIB_MIN_LEVEL_mV(vib)	(vib->drv2_addr ? 1504 : 1200)
+#define VIB_PER_STEP_mV(vib)	(vib->drv2_addr ? 8 : 100)
+#define VIB_MAX_LEVELS(vib) \
+	(VIB_MAX_LEVEL_mV(vib) - VIB_MIN_LEVEL_mV(vib) + VIB_PER_STEP_mV(vib))
 
 #define MAX_FF_SPEED		0xff
 
@@ -26,7 +27,11 @@ struct pm8xxx_regs {
 	unsigned int drv_offset;
 	unsigned int drv_mask;
 	unsigned int drv_shift;
+	unsigned int drv2_offset;
+	unsigned int drv2_mask;
+	unsigned int drv2_shift;
 	unsigned int drv_en_manual_mask;
+	bool	     drv_in_step;
 };
 
 static const struct pm8xxx_regs pm8058_regs = {
@@ -34,6 +39,7 @@ static const struct pm8xxx_regs pm8058_regs = {
 	.drv_mask = 0xf8,
 	.drv_shift = 3,
 	.drv_en_manual_mask = 0xfc,
+	.drv_in_step = true,
 };
 
 static struct pm8xxx_regs pm8916_regs = {
@@ -43,6 +49,20 @@ static struct pm8xxx_regs pm8916_regs = {
 	.drv_mask = 0x1f,
 	.drv_shift = 0,
 	.drv_en_manual_mask = 0,
+	.drv_in_step = true,
+};
+
+static struct pm8xxx_regs pmi632_regs = {
+	.enable_offset = 0x46,
+	.enable_mask = BIT(7),
+	.drv_offset = 0x40,
+	.drv_mask = GENMASK(7, 0),
+	.drv_shift = 0,
+	.drv2_offset = 0x41,
+	.drv2_mask = GENMASK(3, 0),
+	.drv2_shift = 8,
+	.drv_en_manual_mask = 0,
+	.drv_in_step = false,
 };
 
 /**
@@ -53,6 +73,7 @@ static struct pm8xxx_regs pm8916_regs = {
  * @regs: registers' info
  * @enable_addr: vibrator enable register
  * @drv_addr: vibrator drive strength register
+ * @drv2_addr: vibrator drive strength upper byte register
  * @speed: speed of vibration set from userland
  * @active: state of vibrator
  * @level: level of vibration to set in the chip
@@ -65,6 +86,7 @@ struct pm8xxx_vib {
 	const struct pm8xxx_regs *regs;
 	unsigned int enable_addr;
 	unsigned int drv_addr;
+	unsigned int drv2_addr;
 	int speed;
 	int level;
 	bool active;
@@ -82,6 +104,9 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 	unsigned int val = vib->reg_vib_drv;
 	const struct pm8xxx_regs *regs = vib->regs;
 
+	if (regs->drv_in_step)
+		vib->level /= VIB_PER_STEP_mV(vib);
+
 	if (on)
 		val |= (vib->level << regs->drv_shift) & regs->drv_mask;
 	else
@@ -93,6 +118,17 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 
 	vib->reg_vib_drv = val;
 
+	if (regs->drv2_mask) {
+		if (on)
+			val = (vib->level << regs->drv2_shift) & regs->drv2_mask;
+		else
+			val = 0;
+
+		rc = regmap_write_bits(vib->regmap, vib->drv2_addr, regs->drv2_mask, val);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (regs->enable_mask)
 		rc = regmap_update_bits(vib->regmap, vib->enable_addr,
 					regs->enable_mask, on ? regs->enable_mask : 0);
@@ -115,17 +151,16 @@ static void pm8xxx_work_handler(struct work_struct *work)
 		return;
 
 	/*
-	 * pmic vibrator supports voltage ranges from 1.2 to 3.1V, so
+	 * pmic vibrator supports voltage ranges from MIN_LEVEL to MAX_LEVEL, so
 	 * scale the level to fit into these ranges.
 	 */
 	if (vib->speed) {
 		vib->active = true;
-		vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
-						VIB_MIN_LEVEL_mV;
-		vib->level /= VIB_PER_STEP_mV;
+		vib->level = VIB_MIN_LEVEL_mV(vib);
+		vib->level += mult_frac(VIB_MAX_LEVELS(vib), vib->speed, MAX_FF_SPEED);
 	} else {
 		vib->active = false;
-		vib->level = VIB_MIN_LEVEL_mV / VIB_PER_STEP_mV;
+		vib->level = VIB_MIN_LEVEL_mV(vib);
 	}
 
 	pm8xxx_vib_set(vib, vib->active);
@@ -200,6 +235,7 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
 	regs = of_device_get_match_data(&pdev->dev);
 	vib->enable_addr = reg_base + regs->enable_offset;
 	vib->drv_addr = reg_base + regs->drv_offset;
+	vib->drv2_addr = reg_base + regs->drv2_offset;
 
 	/* operate in manual mode */
 	error = regmap_read(vib->regmap, vib->drv_addr, &val);
@@ -254,6 +290,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
 	{ .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8921-vib", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8916-vib", .data = &pm8916_regs },
+	{ .compatible = "qcom,pmi632-vib", .data = &pmi632_regs },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);

-- 
2.25.1




Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4847AFAA8
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 08:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjI0GFL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 02:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjI0GFI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 02:05:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197F5F4;
        Tue, 26 Sep 2023 23:05:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF8F6C433CA;
        Wed, 27 Sep 2023 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695794706;
        bh=DmQ7v8XOka3ZnDfCNSbZLIVIjhSv7gUIq7ZztoA3hr8=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
        b=iG3YEftkRhdvH6+sSrHAdZwZtuB5BgTK5f3IMd6vPsMQskyhHypJQYaIpbap53OM2
         Le8auXjYW7XcD46ABq4AlBv69biYuqy0ySv9PDJcrVqjtchphu9qlbCBbs2Z4OGU0F
         4XpB97kfDFYTF1nNLKRCgfpNUxMvhrV4+3Y15WAFxT8tQJ8A82zyE9oZFa/wb88KLP
         w2LRWsI6mpHO4FigTOrbeWK4Ua9pn+al2pe+4WiJ9YrjLobBN/TR7JeLwbHqchfVRK
         0tWMzsjtLHepBT2j2OcLZOK22E8MaBYE99ug7bpoF1dIyk/sLjagcAreXvGtFoAKzo
         ztu4Lb65oauAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.lore.kernel.org (Postfix) with ESMTP id 958A1E80A96;
        Wed, 27 Sep 2023 06:05:06 +0000 (UTC)
From:   Fenglin Wu via B4 Relay 
        <devnull+quic_fenglinw.quicinc.com@kernel.org>
Date:   Wed, 27 Sep 2023 14:05:04 +0800
Subject: [PATCH v7 3/3] input: pm8xxx-vibrator: add new SPMI vibrator
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-pm8xxx-vibrator-v7-3-b5d8c92ce818@quicinc.com>
References: <20230927-pm8xxx-vibrator-v7-0-b5d8c92ce818@quicinc.com>
In-Reply-To: <20230927-pm8xxx-vibrator-v7-0-b5d8c92ce818@quicinc.com>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_kamalw@quicinc.com,
        jestar@qti.qualcomm.com, Luca Weiss <luca.weiss@fairphone.com>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695794704; l=3749;
 i=quic_fenglinw@quicinc.com; s=20230725; h=from:subject:message-id;
 bh=wJayTUhik7klfO9cHbbqPgCXQ4qQW2jIadjS/C/xeqc=;
 b=z3E0B9xNNfgb3Z7/KUkWFu2BAgQz8RVXruY4jFynxmzBbRt9I4MnpNsnkBVeKy7S3Wy+k11+n
 u+AjV6gAm2RAPTPeAay4z0AcPtGIYbR2WOFrR+dkIjT3FeV4hqjVGUS
X-Developer-Key: i=quic_fenglinw@quicinc.com; a=ed25519;
 pk=hleIDz3Unk1zeiwwOnZUjoQVMMelRancDFXg927lNjI=
X-Endpoint-Received: by B4 Relay for quic_fenglinw@quicinc.com/20230725 with auth_id=68
X-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Reply-To: <quic_fenglinw@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Fenglin Wu <quic_fenglinw@quicinc.com>

Add new SPMI vibrator module which is very similar to the SPMI vibrator
module inside PM8916 but just has a finer drive voltage step (1mV vs
100mV) hence its drive level control is expanded to across 2 registers.
The vibrator module can be found in Qualcomm PMIC PMI632, then following
PM7250B, PM7325B, PM7550BA PMICs.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3 (pmi632)
---
 drivers/input/misc/pm8xxx-vibrator.c | 42 +++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
index ba9be374f892..82c788841f1f 100644
--- a/drivers/input/misc/pm8xxx-vibrator.c
+++ b/drivers/input/misc/pm8xxx-vibrator.c
@@ -21,6 +21,13 @@
 #define SPMI_VIB_DRV_LEVEL_MASK		GENMASK(4, 0)
 #define SPMI_VIB_DRV_SHIFT		0
 
+#define SPMI_VIB_GEN2_DRV_REG		0x40
+#define SPMI_VIB_GEN2_DRV_MASK		GENMASK(7, 0)
+#define SPMI_VIB_GEN2_DRV_SHIFT		0
+#define SPMI_VIB_GEN2_DRV2_REG		0x41
+#define SPMI_VIB_GEN2_DRV2_MASK		GENMASK(3, 0)
+#define SPMI_VIB_GEN2_DRV2_SHIFT	8
+
 #define SPMI_VIB_EN_REG			0x46
 #define SPMI_VIB_EN_BIT			BIT(7)
 
@@ -33,12 +40,14 @@
 enum vib_hw_type {
 	SSBI_VIB,
 	SPMI_VIB,
+	SPMI_VIB_GEN2
 };
 
 struct pm8xxx_vib_data {
 	enum vib_hw_type	hw_type;
 	unsigned int		enable_addr;
 	unsigned int		drv_addr;
+	unsigned int		drv2_addr;
 };
 
 static const struct pm8xxx_vib_data ssbi_vib_data = {
@@ -52,6 +61,13 @@ static const struct pm8xxx_vib_data spmi_vib_data = {
 	.drv_addr	= SPMI_VIB_DRV_REG,
 };
 
+static const struct pm8xxx_vib_data spmi_vib_gen2_data = {
+	.hw_type	= SPMI_VIB_GEN2,
+	.enable_addr	= SPMI_VIB_EN_REG,
+	.drv_addr	= SPMI_VIB_GEN2_DRV_REG,
+	.drv2_addr	= SPMI_VIB_GEN2_DRV2_REG,
+};
+
 /**
  * struct pm8xxx_vib - structure to hold vibrator data
  * @vib_input_dev: input device supporting force feedback
@@ -96,9 +112,12 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 		mask = SPMI_VIB_DRV_LEVEL_MASK;
 		shift = SPMI_VIB_DRV_SHIFT;
 		break;
+	case SPMI_VIB_GEN2:
+		mask = SPMI_VIB_GEN2_DRV_MASK;
+		shift = SPMI_VIB_GEN2_DRV_SHIFT;
+		break;
 	default:
 		return -EINVAL;
-
 	}
 
 	if (on)
@@ -112,6 +131,19 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 
 	vib->reg_vib_drv = val;
 
+	if (vib->data->hw_type == SPMI_VIB_GEN2) {
+		mask = SPMI_VIB_GEN2_DRV2_MASK;
+		shift = SPMI_VIB_GEN2_DRV2_SHIFT;
+		if (on)
+			val = (vib->level >> shift) & mask;
+		else
+			val = 0;
+		rc = regmap_update_bits(vib->regmap,
+				vib->reg_base + vib->data->drv2_addr, mask, val);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (vib->data->hw_type == SSBI_VIB)
 		return 0;
 
@@ -136,10 +168,13 @@ static void pm8xxx_work_handler(struct work_struct *work)
 		vib->active = true;
 		vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
 						VIB_MIN_LEVEL_mV;
-		vib->level /= 100;
+		if (vib->data->hw_type != SPMI_VIB_GEN2)
+			vib->level /= 100;
 	} else {
 		vib->active = false;
-		vib->level = VIB_MIN_LEVEL_mV / 100;
+		vib->level = VIB_MIN_LEVEL_mV;
+		if (vib->data->hw_type != SPMI_VIB_GEN2)
+			vib->level /= 100;
 	}
 
 	pm8xxx_vib_set(vib, vib->active);
@@ -274,6 +309,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
 	{ .compatible = "qcom,pm8058-vib", .data = &ssbi_vib_data },
 	{ .compatible = "qcom,pm8921-vib", .data = &ssbi_vib_data },
 	{ .compatible = "qcom,pm8916-vib", .data = &spmi_vib_data },
+	{ .compatible = "qcom,pmi632-vib", .data = &spmi_vib_gen2_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);

-- 
2.25.1


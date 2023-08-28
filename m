Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91EDF78A540
	for <lists+linux-input@lfdr.de>; Mon, 28 Aug 2023 07:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjH1FdL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Aug 2023 01:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjH1Fck (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Aug 2023 01:32:40 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC23B9;
        Sun, 27 Aug 2023 22:32:38 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37S4x1MF018892;
        Mon, 28 Aug 2023 05:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=W1ZndHb06o1CqBfEMHAQs0xKzsPqR8W26l51gDxt9tE=;
 b=QWqTuHgAqbe4kuYvtVN7XmZPkx5bKDRYDI8rPyq9YtHv2FQ7fkTNMMv+94pQSefDeu8D
 H9W2bmiowOPgTocdGN5yvGwysLv4GJraaJuW0ZPWI0htyfOh7dPhloMXwkGpn5h2rB0Q
 DB9+82pWmySl8gdS7mcH+bIKEFjRsTVRHpiCbdOSY+RRoK+YTX4EG8wTVhXSoB22Yhlh
 dS4buPsRvh0AyQ/tiqC2IJFRPllmjuylkjXBmKnsO5I2dG/6a3oJiRdKyNiDvcuEXLwV
 cc/u1kzkqKDpc2rbpWyp334Fi4EiRUSoQnIvbGDAmdJbBZ1BvQUj3NvJeJ4onZ5rOnJG gg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sq8ddjnkv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 05:32:33 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37S5WWcS010128
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 05:32:32 GMT
Received: from fenglinw2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sun, 27 Aug 2023 22:32:28 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>
CC:     <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>,
        <quic_fenglinw@quicinc.com>, <quic_kamalw@quicinc.com>,
        <jestar@qti.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>
Subject: [RESEND PATCH v6 3/3] input: pm8xxx-vibrator: add new SPMI vibrator support
Date:   Mon, 28 Aug 2023 13:32:05 +0800
Message-ID: <20230828053205.218950-4-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828053205.218950-1-quic_fenglinw@quicinc.com>
References: <20230828053205.218950-1-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KG0PqHyfL7jgEBeZ6RhEWNPm1kwdRtQt
X-Proofpoint-GUID: KG0PqHyfL7jgEBeZ6RhEWNPm1kwdRtQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_03,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add new SPMI vibrator module which is very similar to the SPMI vibrator
module inside PM8916 but just has a finer drive voltage step (1mV vs
100mV) hence its drive level control is expanded to across 2 registers.
The vibrator module can be found in Qualcomm PMIC PMI632, then following
PM7250B, PM7325B, PM7550BA PMICs.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3 (pmi632)
---
 drivers/input/misc/pm8xxx-vibrator.c | 55 +++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
index d6b468324c77..990e8a9ac018 100644
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
@@ -85,12 +101,24 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 {
 	int rc;
 	unsigned int val = vib->reg_vib_drv;
-	u32 mask = SPMI_VIB_DRV_LEVEL_MASK;
-	u32 shift = SPMI_VIB_DRV_SHIFT;
+	u32 mask, shift;
 
-	if (vib->data->hw_type == SSBI_VIB) {
+
+	switch (vib->data->hw_type) {
+	case SSBI_VIB:
 		mask = SSBI_VIB_DRV_LEVEL_MASK;
 		shift = SSBI_VIB_DRV_SHIFT;
+		break;
+	case SPMI_VIB:
+		mask = SPMI_VIB_DRV_LEVEL_MASK;
+		shift = SPMI_VIB_DRV_SHIFT;
+		break;
+	case SPMI_VIB_GEN2:
+		mask = SPMI_VIB_GEN2_DRV_MASK;
+		shift = SPMI_VIB_GEN2_DRV_SHIFT;
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	if (on)
@@ -104,6 +132,19 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 
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
 
@@ -128,10 +169,13 @@ static void pm8xxx_work_handler(struct work_struct *work)
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
@@ -266,6 +310,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
 	{ .compatible = "qcom,pm8058-vib", .data = &ssbi_vib_data },
 	{ .compatible = "qcom,pm8921-vib", .data = &ssbi_vib_data },
 	{ .compatible = "qcom,pm8916-vib", .data = &spmi_vib_data },
+	{ .compatible = "qcom,pmi632-vib", .data = &spmi_vib_gen2_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);
-- 
2.25.1


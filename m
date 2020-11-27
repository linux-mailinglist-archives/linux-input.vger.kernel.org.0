Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67DD2C63B0
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 12:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbgK0LOu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 06:14:50 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:58658 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729250AbgK0LOt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 06:14:49 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0ARBAxZ7025999;
        Fri, 27 Nov 2020 06:14:36 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34y0p8jw27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Nov 2020 06:14:36 -0500
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0ARBEZVv053812
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Fri, 27 Nov 2020 06:14:35 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 27 Nov
 2020 06:14:34 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Fri, 27 Nov 2020 06:14:34 -0500
Received: from saturn.ad.analog.com ([10.48.65.109])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0ARBETQM023930;
        Fri, 27 Nov 2020 06:14:31 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <lars@metafoo.de>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 2/4] Input: adp5589-keys - wrap device probing into chip info struct
Date:   Fri, 27 Nov 2020 13:14:18 +0200
Message-ID: <20201127111420.96500-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127111420.96500-1-alexandru.ardelean@analog.com>
References: <20201127111420.96500-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-27_05:2020-11-26,2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270069
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change wraps the devices supported by the adp5589 driver into a chip
info struct. With this, a device table can be created, and the probed
device can be selected based on the enum value provided by the i2c driver
data.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 60 ++++++++++++++++-----------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 742bf4b97dbb..6cb93ee3b97c 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -227,16 +227,17 @@ struct adp_constants {
 	u8 (*reg) (u8 reg);
 };
 
+struct adp5589_chip_info;
+
 struct adp5589_kpad {
 	struct i2c_client *client;
 	struct input_dev *input;
 	const struct adp_constants *var;
+	const struct adp5589_chip_info *info;
 	unsigned short keycode[ADP5589_KEYMAPSIZE];
 	const struct adp5589_gpi_map *gpimap;
 	unsigned short gpimapsize;
 	unsigned extend_cfg;
-	bool is_adp5585;
-	bool support_row5;
 #ifdef CONFIG_GPIOLIB
 	unsigned char gpiomap[ADP5589_MAXGPIO];
 	struct gpio_chip gc;
@@ -377,6 +378,28 @@ static const struct adp5589_kpad_platform_data adp5589_default_pdata = {
 	.gpio_data = &adp5589_default_gpio_pdata,
 };
 
+struct adp5589_chip_info {
+	const struct adp_constants	*constants;
+	bool				support_row5;
+	bool				is_adp5585;
+};
+
+static const struct adp5589_chip_info adp5589_chip_info_tbl[] = {
+	[ADP5589] = {
+		.constants = &const_adp5589,
+		.support_row5 = true,
+	},
+	[ADP5585_01] = {
+		.constants = &const_adp5585,
+		.is_adp5585 = true,
+	},
+	[ADP5585_02] = {
+		.constants = &const_adp5585,
+		.is_adp5585 = true,
+		.support_row5 = true,
+	},
+};
+
 static const struct adp5589_kpad_platform_data *adp5589_kpad_pdata_get(
 	struct device *dev)
 {
@@ -504,7 +527,7 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 	if (kpad->extend_cfg & C4_EXTEND_CFG)
 		pin_used[kpad->var->c4_extend_cfg] = true;
 
-	if (!kpad->support_row5)
+	if (!kpad->info->support_row5)
 		pin_used[5] = true;
 
 	for (i = 0; i < kpad->var->maxgpio; i++)
@@ -651,11 +674,11 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 			     (pdata->keypad_en_mask >> kpad->var->col_shift) &
 			     kpad->var->col_mask);
 
-	if (!kpad->is_adp5585)
+	if (!kpad->info->is_adp5585)
 		ret |= adp5589_write(client, ADP5589_PIN_CONFIG_C,
 				     (pdata->keypad_en_mask >> 16) & 0xFF);
 
-	if (!kpad->is_adp5585 && pdata->en_keylock) {
+	if (!kpad->info->is_adp5585 && pdata->en_keylock) {
 		ret |= adp5589_write(client, ADP5589_UNLOCK1,
 				     pdata->unlock_key1);
 		ret |= adp5589_write(client, ADP5589_UNLOCK2,
@@ -676,7 +699,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 		} else {
 			evt_mode2 |=
 			    BIT(pin - kpad->var->gpi_pin_col_base) & 0xFF;
-			if (!kpad->is_adp5585)
+			if (!kpad->info->is_adp5585)
 				evt_mode3 |=
 				    BIT(pin - kpad->var->gpi_pin_col_base) >> 8;
 		}
@@ -687,7 +710,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 				     evt_mode1);
 		ret |= adp5589_write(client, reg(ADP5589_GPI_EVENT_EN_B),
 				     evt_mode2);
-		if (!kpad->is_adp5585)
+		if (!kpad->info->is_adp5585)
 			ret |= adp5589_write(client,
 					     reg(ADP5589_GPI_EVENT_EN_C),
 					     evt_mode3);
@@ -775,16 +798,16 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 			     (pdata->debounce_dis_mask >> kpad->var->col_shift)
 			     & kpad->var->col_mask);
 
-	if (!kpad->is_adp5585)
+	if (!kpad->info->is_adp5585)
 		ret |= adp5589_write(client, reg(ADP5589_DEBOUNCE_DIS_C),
 				     (pdata->debounce_dis_mask >> 16) & 0xFF);
 
 	ret |= adp5589_write(client, reg(ADP5589_POLL_PTIME_CFG),
 			     pdata->scan_cycle_time & PTIME_MASK);
 	ret |= adp5589_write(client, ADP5589_5_INT_STATUS,
-			     (kpad->is_adp5585 ? 0 : LOGIC2_INT) |
+			     (kpad->info->is_adp5585 ? 0 : LOGIC2_INT) |
 			     LOGIC1_INT | OVRFLOW_INT |
-			     (kpad->is_adp5585 ? 0 : LOCK_INT) |
+			     (kpad->info->is_adp5585 ? 0 : LOCK_INT) |
 			     GPI_INT | EVENT_INT);	/* Status is W1C */
 
 	ret |= adp5589_write(client, reg(ADP5589_GENERAL_CFG),
@@ -808,7 +831,7 @@ static void adp5589_report_switch_state(struct adp5589_kpad *kpad)
 				     kpad->var->reg(ADP5589_GPI_STATUS_A));
 	int gpi_stat2 = adp5589_read(kpad->client,
 				     kpad->var->reg(ADP5589_GPI_STATUS_B));
-	int gpi_stat3 = !kpad->is_adp5585 ?
+	int gpi_stat3 = !kpad->info->is_adp5585 ?
 			adp5589_read(kpad->client, ADP5589_GPI_STATUS_C) : 0;
 
 	for (i = 0; i < kpad->gpimapsize; i++) {
@@ -984,19 +1007,8 @@ static int adp5589_probe(struct i2c_client *client,
 
 	kpad->client = client;
 
-	switch (id->driver_data) {
-	case ADP5585_02:
-		kpad->support_row5 = true;
-		fallthrough;
-	case ADP5585_01:
-		kpad->is_adp5585 = true;
-		kpad->var = &const_adp5585;
-		break;
-	case ADP5589:
-		kpad->support_row5 = true;
-		kpad->var = &const_adp5589;
-		break;
-	}
+	kpad->info = &adp5589_chip_info_tbl[id->driver_data];
+	kpad->var = kpad->info->constants;
 
 	error = devm_add_action_or_reset(&client->dev, adp5589_clear_config,
 					 client);
-- 
2.27.0


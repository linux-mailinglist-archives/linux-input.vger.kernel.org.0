Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08E12B8F61
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 10:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgKSJt6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 04:49:58 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:43732 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726853AbgKSJt5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 04:49:57 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ9l1QY021572;
        Thu, 19 Nov 2020 04:49:46 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34td19h442-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Nov 2020 04:49:46 -0500
Received: from SCSQMBX10.ad.analog.com (SCSQMBX10.ad.analog.com [10.77.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AJ9nixg010210
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 19 Nov 2020 04:49:45 -0500
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 19 Nov 2020 01:49:44 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 19 Nov 2020 01:49:43 -0800
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AJ9nbw6017439;
        Thu, 19 Nov 2020 04:49:41 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <lars@metafoo.de>, <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 3/3] Input: adp5589-keys - add basic devicetree support
Date:   Thu, 19 Nov 2020 11:54:54 +0200
Message-ID: <20201119095454.48631-3-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119095454.48631-1-alexandru.ardelean@analog.com>
References: <20201119095454.48631-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-19_08:2020-11-17,2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190071
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lars-Peter Clausen <lars@metafoo.de>

Add very basic devicetree suppport to the adp5589 allowing the device to be
registered from devicetree and ACPI via PRP0001.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 30 ++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index daa6d3cdbac5..4321bad10269 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -985,9 +985,25 @@ static void adp5589_clear_config(void *data)
 	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
 }
 
+static const struct adp5589_chip_info *adp5589_get_chip_info(struct device *dev,
+							     const struct i2c_device_id *id)
+{
+	const struct adp5589_chip_info *info;
+
+	info = device_get_match_data(dev);
+	if (info)
+		return info;
+
+	if (id)
+		return &adp5589_chip_info_tbl[id->driver_data];
+
+	return NULL;
+}
+
 static int adp5589_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	const struct adp5589_chip_info *info;
 	struct adp5589_kpad *kpad;
 	const struct adp5589_kpad_platform_data *pdata =
 		adp5589_kpad_pdata_get(&client->dev);
@@ -1000,13 +1016,17 @@ static int adp5589_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
+	info = adp5589_get_chip_info(&client->dev, id);
+	if (!info)
+		return -ENODEV;
+
 	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
 		return -ENOMEM;
 
 	kpad->client = client;
 
-	kpad->info = &adp5589_chip_info_tbl[id->driver_data];
+	kpad->info = info;
 	kpad->var = kpad->info->constants;
 
 	error = devm_add_action_or_reset(&client->dev, adp5589_clear_config,
@@ -1079,6 +1099,13 @@ static int adp5589_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
 
+static const struct of_device_id adp5589_of_match[] = {
+	{ .compatible = "adi,adp5585", .data = &adp5589_chip_info_tbl[ADP5585_01] },
+	{ .compatible = "adi,adp5585-02", .data = &adp5589_chip_info_tbl[ADP5585_02] },
+	{ .compatible = "adi,adp5589", .data = &adp5589_chip_info_tbl[ADP5589] },
+	{}
+};
+
 static const struct i2c_device_id adp5589_id[] = {
 	{"adp5589-keys", ADP5589},
 	{"adp5585-keys", ADP5585_01},
@@ -1092,6 +1119,7 @@ static struct i2c_driver adp5589_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &adp5589_dev_pm_ops,
+		.of_match_table = adp5589_of_match,
 	},
 	.probe = adp5589_probe,
 	.id_table = adp5589_id,
-- 
2.17.1


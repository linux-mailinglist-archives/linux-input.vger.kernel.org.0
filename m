Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91FD62C63B4
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 12:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgK0LOv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 06:14:51 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:59174 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729248AbgK0LOu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 06:14:50 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0ARBApgE025952;
        Fri, 27 Nov 2020 06:14:37 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 34y0p8jw2c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Nov 2020 06:14:37 -0500
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0ARBEaT1047893
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Fri, 27 Nov 2020 06:14:36 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 27 Nov 2020 06:14:35 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 27 Nov 2020 06:14:35 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Fri, 27 Nov 2020 06:14:35 -0500
Received: from saturn.ad.analog.com ([10.48.65.109])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0ARBETQN023930;
        Fri, 27 Nov 2020 06:14:32 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <lars@metafoo.de>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 3/4] Input: adp5589-keys - add basic devicetree support
Date:   Fri, 27 Nov 2020 13:14:19 +0200
Message-ID: <20201127111420.96500-3-alexandru.ardelean@analog.com>
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

From: Lars-Peter Clausen <lars@metafoo.de>

Add very basic devicetree suppport to the adp5589 allowing the device to be
registered from devicetree and ACPI via PRP0001.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 30 ++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 6cb93ee3b97c..8ff18ff18b75 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -986,9 +986,25 @@ static void adp5589_clear_config(void *data)
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
@@ -1001,13 +1017,17 @@ static int adp5589_probe(struct i2c_client *client,
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
@@ -1078,6 +1098,13 @@ static int __maybe_unused adp5589_resume(struct device *dev)
 
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
@@ -1091,6 +1118,7 @@ static struct i2c_driver adp5589_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &adp5589_dev_pm_ops,
+		.of_match_table = adp5589_of_match,
 	},
 	.probe = adp5589_probe,
 	.id_table = adp5589_id,
-- 
2.27.0


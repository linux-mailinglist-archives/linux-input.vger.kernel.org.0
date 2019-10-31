Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A48EAC15
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 10:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfJaJC7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Oct 2019 05:02:59 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:23938 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726864AbfJaJC7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Oct 2019 05:02:59 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9V92asu007885;
        Thu, 31 Oct 2019 05:02:44 -0400
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2058.outbound.protection.outlook.com [104.47.36.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 2vxwhjmkdf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 31 Oct 2019 05:02:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b07kFWF5NzASuTEGUXNQu9grO5Hz9US/bNxgFmsH0Plf0NWaAA3tGRF8ukrBPnmZwq32zeLOfKzjURJQyoXOSPwO/NBxlDMG4sbiQvAuSf/0g9VeKIfN468c5VoHhzT2ayKIVoQQ0SwgPa/m1aX0Dubq3XzLuvURsiV1s3O+8T11DRMiFEZc259eLNLC7Z2DphzxOnXs/tB3/WBbjpS4UpfkRdyH/aTBEMbEmS3PO0ClCGiVC50roGbdbNL4AObytUuFJrLsIKUMAYhZ2fg0pJrzy6vKqcS2I9j2ty9YyXMU2OQfFAQDdDlYrA9nVvKc1G2ftr1+LNOBs1AwRr4kSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMBkZHQLR/8l7CfYOs2l+dEHKYpzPMNlU47f9IVuKYU=;
 b=hcs7Rkd3inJ5MBiB87I6Sp9exztq52XOv0IjASELds/uSDih06uGRHu1whnG090amHywhUAZGabdIwD6wJlrJQoXO6W2Hqin1V6GOAs81plJsQTvTTZWu3XM7meeAgOX6H62LVTz78rj3Rt5lNM/0UjgOHDiLKr+0n3i7LIm01C7PLKd7175aPGJmoykJWIZsTTwm7l/TsSkaah00yMgLQUDwSsnIaQuQHD9cEmkw9E5/MFPdZDTpYw6b5YWQqYxxcwexiqIudQjJCXJ7JyDjbk0+zBFzVzeSKFqjuyAu5QicXtYJ2zIKjGFuFPrLh2Gf0OlBeVGduXe3IcodTvZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMBkZHQLR/8l7CfYOs2l+dEHKYpzPMNlU47f9IVuKYU=;
 b=NjeoFner0dLY2ROg13NNYFuujCoMUh3cQNk3W1AaVsZj4Yc5zs10Mefawu6c9WjGRyXPnoYZrOVHmLiXlz8jJEh2GC4x2E8NIp+i31OJ7v6c4DzeWONPBe4yB/Fr+rXYEX2eerauAutWx3FT7jxFOu4UT8sAB0TxsQTiTey8Fik=
Received: from BY5PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:1e0::11)
 by CY4PR03MB3399.namprd03.prod.outlook.com (2603:10b6:910:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Thu, 31 Oct
 2019 09:02:41 +0000
Received: from SN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by BY5PR03CA0001.outlook.office365.com
 (2603:10b6:a03:1e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.17 via Frontend
 Transport; Thu, 31 Oct 2019 09:02:41 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT017.mail.protection.outlook.com (10.152.72.115) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Thu, 31 Oct 2019 09:02:40 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9V92WZb003403
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 31 Oct 2019 02:02:32 -0700
Received: from saturn.ad.analog.com (10.48.65.117) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Thu, 31 Oct 2019 05:02:38 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 1/2] input: adp5589: Add default platform data
Date:   Thu, 31 Oct 2019 11:03:11 +0200
Message-ID: <20191031090312.17205-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(396003)(39860400002)(136003)(346002)(189003)(199004)(54534003)(106002)(50466002)(48376002)(50226002)(478600001)(316002)(54906003)(2870700001)(2906002)(6666004)(110136005)(70586007)(44832011)(356004)(70206006)(2616005)(26005)(47776003)(8676002)(107886003)(186003)(36756003)(246002)(336012)(426003)(305945005)(126002)(7636002)(8936002)(476003)(5660300002)(51416003)(86362001)(7696005)(486006)(4326008)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR03MB3399;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a76111b4-cba9-4b8a-faad-08d75de115a9
X-MS-TrafficTypeDiagnostic: CY4PR03MB3399:
X-Microsoft-Antispam-PRVS: <CY4PR03MB3399CC3C961C96E42241AE08F9630@CY4PR03MB3399.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 010X3FcjOWdmYvGBf09TKm5plEjLbldBJUi085BRXUebtI7gad3SUNhq4d53yznI6ZasZSeyE2D1lHbQx4wH99T4cmXbkxasV6vVIx1ay/jxGhOnwZezW60N8BtRvVSRvcRgnrkGlczfVcK2ExkW2K2N0SDZYwHUAXi5/HcMZ4NPF0sJO3uGM38ib3krMwFTspk/OAOnQryD4/cSjvyKXz1QlX5SczNMf+ZeeD/DZjgurP/ED5kH9onLPMg15PTTnprJG3bOPGuOLEW0+5hzOVjXe/7w83Cn8YcDYmFb9DWZBbAEY1dXT8jGvygxhQqpE+WiLiA+9shQguTLKv7c9mJPpXyUwWbrbULI9g5BkyHOB8m70ZjMM0PTLy4OZ+Tq29gBxHFU6yA80gY3ZcERu/Cd2KxLu4eDimW2qGL78io1PQaZ3SEXZg7uQPUEvaec
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 09:02:40.7549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a76111b4-cba9-4b8a-faad-08d75de115a9
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3399
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_03:2019-10-30,2019-10-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910310091
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lars-Peter Clausen <lars@metafoo.de>

If no platform data is supplied use a dummy platform data that configures
the device in GPIO only mode. This change adds a adp5589_kpad_pdata_get()
helper that returns the default platform-data. This can be later extended
to load configuration from device-trees or ACPI.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---

Changelog v2 -> v3:
* fix `-Wpointer-to-int-cast` warnings for patch `input: adp5589: Add basic
  devicetree support` ; warnings shows up on 64 bit ARCHs

Changelog v1 -> v2:
* adjusted patch `input: adp5589: Add default platform data` by
  introducting a `adp5589_kpad_pdata_get()` helper, which returns the
  platform-data; the previos patch was based on an older version of the
  kernel from the ADI kernel-tree; the driver was sync-ed with the upstream
  version

 drivers/input/keyboard/adp5589-keys.c | 36 +++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index e7d58e7f0257..c6a801bcdf90 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -369,6 +369,25 @@ static const struct adp_constants const_adp5585 = {
 	.reg			= adp5585_reg,
 };
 
+static const struct adp5589_gpio_platform_data adp5589_default_gpio_pdata = {
+	.gpio_start = -1,
+};
+
+static const struct adp5589_kpad_platform_data adp5589_default_pdata = {
+	.gpio_data = &adp5589_default_gpio_pdata,
+};
+
+static const struct adp5589_kpad_platform_data *adp5589_kpad_pdata_get(
+	struct device *dev)
+{
+	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
+
+	if (!pdata)
+		pdata = &adp5589_default_pdata;
+
+	return pdata;
+}
+
 static int adp5589_read(struct i2c_client *client, u8 reg)
 {
 	int ret = i2c_smbus_read_byte_data(client, reg);
@@ -498,7 +517,8 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
+	const struct adp5589_kpad_platform_data *pdata =
+		adp5589_kpad_pdata_get(dev);
 	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
 	int i, error;
 
@@ -553,7 +573,8 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 static void adp5589_gpio_remove(struct adp5589_kpad *kpad)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
+	const struct adp5589_kpad_platform_data *pdata =
+		adp5589_kpad_pdata_get(dev);
 	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
 	int error;
 
@@ -656,7 +677,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 {
 	struct i2c_client *client = kpad->client;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	u8 (*reg) (u8) = kpad->var->reg;
 	unsigned char evt_mode1 = 0, evt_mode2 = 0, evt_mode3 = 0;
 	unsigned char pull_mask = 0;
@@ -861,7 +882,7 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 {
 	struct i2c_client *client = kpad->client;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	struct input_dev *input;
 	unsigned int i;
 	int error;
@@ -992,7 +1013,7 @@ static int adp5589_probe(struct i2c_client *client,
 {
 	struct adp5589_kpad *kpad;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	unsigned int revid;
 	int error, ret;
 
@@ -1002,11 +1023,6 @@ static int adp5589_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	if (!pdata) {
-		dev_err(&client->dev, "no platform data?\n");
-		return -EINVAL;
-	}
-
 	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
 		return -ENOMEM;
-- 
2.20.1


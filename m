Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51536BC32
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 14:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfGQMWJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 08:22:09 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:13638 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbfGQMWI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 08:22:08 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6HCEZhJ004705;
        Wed, 17 Jul 2019 08:21:46 -0400
Received: from nam01-bn3-obe.outbound.protection.outlook.com (mail-bn3nam01lp2053.outbound.protection.outlook.com [104.47.33.53])
        by mx0b-00128a01.pphosted.com with ESMTP id 2tseucbpgg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 17 Jul 2019 08:21:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrJl+WLRok/juY14s1N0B7O8ULZoqQqBMr6tMBDzXeTTUeLyGSGMgnwwSHGlMiO7roQnI39UBizNTYKu3pSly5AvcHenxDgSrwXqHZwdYm1LiS/6Iva2z/6gc4zaFF2PiOdO7sB06nZZmGLTR4pfJrFRfHIVCpsf6kJCcgKYBY0jAvSM/6FMDBKzBrk7tbvBR6I7YCD0ObafeOOnQ4eHy/8mogzwNItKlTmSam3BaXfKRuChhVYEsuLmjijX9VQiOGUF7HhgakmYxZNkVU+Upl/q5bh+cQikUyXloJFFkWwrikbg+AaFC9M7lVU/ebYQViZD9AxIQPFOdJ4srzT4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baiGIU0/o6tVrJSeGBenm0VN61AqoQGJ48svNwliOIY=;
 b=eT6FCuVT5ddWkVcxkKAwykGQwTvoiflgyrqgne8MLb1i2bQiNSpnK4vB++Rm3Ya9S7AKpSDXkkCfmWhX3f/s/9G4pGsNiqLlJ4wrbSf6iVDdQ3Fz8GxDoNJafSbgIYYCoJUHE7mt3gCjReWOCBBfMXk6axK3N/2L/JlEEx1T171Gef09/u7gjrSFm7xvzIW3cjxmeKF/1odyQ6OvtRaWAXONXtTCxtBz1GYWSoUc+VpgVKbygOKwFRszXk9mFQBK9UkT+YCDbKsJ5FufqGLCX+a8NnbTP2RBk1tr5wLjGZ65YWX18xVzSoBVeQkfwrpjEJWK8NwX8zof0iCWd08xzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baiGIU0/o6tVrJSeGBenm0VN61AqoQGJ48svNwliOIY=;
 b=L+84yi055q8j0okgIUUQg1JqYaaAxoueG5xar1jLeS9jlcAmRSmG966DzV+eWpE+HuDbW4Hj9/4NyYh/I4wcEC8yLk+gz261+3xSwKThJcQ8OcqThCGTHHg4TArLUNvUByx6VAhPGtLeymDGoCPN3DnbNCj/k7iewU28wgi+dWU=
Received: from MWHPR03CA0052.namprd03.prod.outlook.com (2603:10b6:301:3b::41)
 by BYAPR03MB4712.namprd03.prod.outlook.com (2603:10b6:a03:131::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Wed, 17 Jul
 2019 12:21:43 +0000
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::208) by MWHPR03CA0052.outlook.office365.com
 (2603:10b6:301:3b::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10 via Frontend
 Transport; Wed, 17 Jul 2019 12:21:43 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2052.25
 via Frontend Transport; Wed, 17 Jul 2019 12:21:42 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x6HCLgL5012708
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Wed, 17 Jul 2019 05:21:42 -0700
Received: from saturn.ad.analog.com (10.48.65.145) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Wed, 17 Jul 2019 08:21:41 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH] input: adp5589: Make keypad support optional
Date:   Wed, 17 Jul 2019 15:21:33 +0300
Message-ID: <20190717122133.24333-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(189003)(199004)(70206006)(26005)(54906003)(1076003)(106002)(36756003)(6916009)(70586007)(5660300002)(186003)(305945005)(7696005)(7636002)(8676002)(14444005)(246002)(2870700001)(44832011)(476003)(2351001)(2906002)(126002)(107886003)(2616005)(486006)(316002)(50226002)(86362001)(6666004)(336012)(4326008)(8936002)(426003)(50466002)(48376002)(478600001)(356004)(51416003)(47776003)(334744003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4712;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af504f81-1efe-48c7-e691-08d70ab153f1
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BYAPR03MB4712;
X-MS-TrafficTypeDiagnostic: BYAPR03MB4712:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4712D4458E206C7024729FE7F9C90@BYAPR03MB4712.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 01018CB5B3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8hLfgQhQNfPkzv4j+O8BHasUMcgBTxEu97sKQAXo9ivlTPzvZ68yDFH7of/4W+FlQ9YfgKL6Ot5+j4njdu6mTPvnO0VIkxgDH/fMlV65Q4lM8bXJ6uD17SaO1k4G4tvkOb3AcHImQWOE38yKqiQcHulumY2pjDo6x9MmYqjxRbjFoteM5SyhDtrM3sICMWJe1OMPkmKuEBf4rtpKhCmO6RgnyqxYnds2u5qXRYcVksP71vYLwnldDnBzvOJ5vD2hfKUps7FWdvlCg6++g6pShy/JfK5+V4vHILCsLUaKWlG34DIwqepjgbJ/fJLUAaluATisxpB2O6+AgwsBwyScSFH+oVgrdx5DnYeVsfMgblFrvC88VHLY6EqssSrS6ui7QDvuFN0WEkSOP+JQQlsr3efzZU2i5qhYqenEi7/uwns=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2019 12:21:42.7904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af504f81-1efe-48c7-e691-08d70ab153f1
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4712
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-17_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170151
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lars-Peter Clausen <lars@metafoo.de>

On some platforms the adp5589 is used in GPIO only mode. On these platforms
we do not want to register a input device, so make that optional and only
create the input device if a keymap is supplied.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 197 +++++++++++++++-----------
 1 file changed, 111 insertions(+), 86 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 4f96a4a99e5b..08bfa8b213e8 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -495,10 +495,10 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 	return n_unused;
 }
 
-static int adp5589_gpio_add(struct adp5589_kpad *kpad)
+static int adp5589_gpio_add(struct adp5589_kpad *kpad,
+	const struct adp5589_kpad_platform_data *pdata)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
 	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
 	int i, error;
 
@@ -550,10 +550,10 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	return 0;
 }
 
-static void adp5589_gpio_remove(struct adp5589_kpad *kpad)
+static void adp5589_gpio_remove(struct adp5589_kpad *kpad,
+	const struct adp5589_kpad_platform_data *pdata)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
 	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
 	int error;
 
@@ -571,12 +571,14 @@ static void adp5589_gpio_remove(struct adp5589_kpad *kpad)
 	gpiochip_remove(&kpad->gc);
 }
 #else
-static inline int adp5589_gpio_add(struct adp5589_kpad *kpad)
+static inline int adp5589_gpio_add(struct adp5589_kpad *kpad,
+	struct const adp5589_kpad_platform_data *pdata)
 {
 	return 0;
 }
 
-static inline void adp5589_gpio_remove(struct adp5589_kpad *kpad)
+static inline void adp5589_gpio_remove(struct adp5589_kpad *kpad,
+	struct const adp5589_kpad_platform_data *pdata)
 {
 }
 #endif
@@ -652,11 +654,10 @@ static int adp5589_get_evcode(struct adp5589_kpad *kpad, unsigned short key)
 	return -EINVAL;
 }
 
-static int adp5589_setup(struct adp5589_kpad *kpad)
+static int adp5589_setup(struct adp5589_kpad *kpad, 
+	const struct adp5589_kpad_platform_data *pdata)
 {
 	struct i2c_client *client = kpad->client;
-	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
 	u8 (*reg) (u8) = kpad->var->reg;
 	unsigned char evt_mode1 = 0, evt_mode2 = 0, evt_mode3 = 0;
 	unsigned char pull_mask = 0;
@@ -857,70 +858,37 @@ static void adp5589_report_switch_state(struct adp5589_kpad *kpad)
 	input_sync(kpad->input);
 }
 
-static int adp5589_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid,
+	const struct adp5589_kpad_platform_data *pdata)
 {
-	struct adp5589_kpad *kpad;
-	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+	struct i2c_client *client = kpad->client;
 	struct input_dev *input;
-	unsigned int revid;
-	int ret, i;
+	unsigned int i;
 	int error;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
-		return -EIO;
-	}
-
-	if (!pdata) {
-		dev_err(&client->dev, "no platform data?\n");
-		return -EINVAL;
-	}
-
-	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
-	if (!kpad)
-		return -ENOMEM;
-
-	switch (id->driver_data) {
-	case ADP5585_02:
-		kpad->support_row5 = true;
-		/* fall through */
-	case ADP5585_01:
-		kpad->is_adp5585 = true;
-		kpad->var = &const_adp5585;
-		break;
-	case ADP5589:
-		kpad->support_row5 = true;
-		kpad->var = &const_adp5589;
-		break;
-	}
+	if (pdata->keymapsize == 0)
+		return 0;
 
 	if (!((pdata->keypad_en_mask & kpad->var->row_mask) &&
 			(pdata->keypad_en_mask >> kpad->var->col_shift)) ||
 			!pdata->keymap) {
 		dev_err(&client->dev, "no rows, cols or keymap from pdata\n");
-		error = -EINVAL;
-		goto err_free_mem;
+		return -EINVAL;
 	}
 
 	if (pdata->keymapsize != kpad->var->keymapsize) {
 		dev_err(&client->dev, "invalid keymapsize\n");
-		error = -EINVAL;
-		goto err_free_mem;
+		return -EINVAL;
 	}
 
 	if (!pdata->gpimap && pdata->gpimapsize) {
 		dev_err(&client->dev, "invalid gpimap from pdata\n");
-		error = -EINVAL;
-		goto err_free_mem;
+		return -EINVAL;
 	}
 
 	if (pdata->gpimapsize > kpad->var->gpimapsize_max) {
 		dev_err(&client->dev, "invalid gpimapsize\n");
-		error = -EINVAL;
-		goto err_free_mem;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < pdata->gpimapsize; i++) {
@@ -929,41 +897,27 @@ static int adp5589_probe(struct i2c_client *client,
 		if (pin < kpad->var->gpi_pin_base ||
 				pin > kpad->var->gpi_pin_end) {
 			dev_err(&client->dev, "invalid gpi pin data\n");
-			error = -EINVAL;
-			goto err_free_mem;
+			return -EINVAL;
 		}
 
 		if ((1 << (pin - kpad->var->gpi_pin_row_base)) &
 				pdata->keypad_en_mask) {
 			dev_err(&client->dev, "invalid gpi row/col data\n");
-			error = -EINVAL;
-			goto err_free_mem;
+			return -EINVAL;
 		}
 	}
 
 	if (!client->irq) {
 		dev_err(&client->dev, "no IRQ?\n");
-		error = -EINVAL;
-		goto err_free_mem;
+		return -EINVAL;
 	}
 
 	input = input_allocate_device();
-	if (!input) {
-		error = -ENOMEM;
-		goto err_free_mem;
-	}
+	if (!input)
+		return -ENOMEM;
 
-	kpad->client = client;
 	kpad->input = input;
 
-	ret = adp5589_read(client, ADP5589_5_ID);
-	if (ret < 0) {
-		error = ret;
-		goto err_free_input;
-	}
-
-	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
-
 	input->name = client->name;
 	input->phys = "adp5589-keys/input0";
 	input->dev.parent = &client->dev;
@@ -1015,30 +969,94 @@ static int adp5589_probe(struct i2c_client *client,
 		goto err_unreg_dev;
 	}
 
-	error = adp5589_setup(kpad);
+	device_init_wakeup(&client->dev, 1);
+
+	return 0;
+
+err_unreg_dev:
+	input_unregister_device(input);
+	input = NULL;
+err_free_input:
+	input_free_device(input);
+
+	return error;
+}
+
+static void adp5589_keypad_remove(struct adp5589_kpad *kpad,
+	const struct adp5589_kpad_platform_data *pdata)
+{
+	if (!kpad->input)
+		return;
+
+	free_irq(kpad->client->irq, kpad);
+	input_unregister_device(kpad->input);
+}
+
+static int adp5589_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct adp5589_kpad *kpad;
+	const struct adp5589_kpad_platform_data *pdata =
+		dev_get_platdata(&client->dev);
+	unsigned int revid;
+	int error, ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE_DATA)) {
+		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
+		return -EIO;
+	}
+
+
+	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
+	if (!kpad)
+		return -ENOMEM;
+
+	kpad->client = client;
+
+	switch (id->driver_data) {
+	case ADP5585_02:
+		kpad->support_row5 = true;
+	case ADP5585_01:
+		kpad->is_adp5585 = true;
+		kpad->var = &const_adp5585;
+		break;
+	case ADP5589:
+		kpad->support_row5 = true;
+		kpad->var = &const_adp5589;
+		break;
+	}
+
+	ret = adp5589_read(client, ADP5589_5_ID);
+	if (ret < 0) {
+		error = ret;
+		goto err_free_mem;
+	}
+
+	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
+
+	error = adp5589_keypad_add(kpad, revid, pdata);
 	if (error)
-		goto err_free_irq;
+		goto err_free_mem;
+
+	error = adp5589_setup(kpad, pdata);
+	if (error)
+		goto err_keypad_remove;
 
 	if (kpad->gpimapsize)
 		adp5589_report_switch_state(kpad);
 
-	error = adp5589_gpio_add(kpad);
+	error = adp5589_gpio_add(kpad, pdata);
 	if (error)
-		goto err_free_irq;
+		goto err_keypad_remove;
 
-	device_init_wakeup(&client->dev, 1);
 	i2c_set_clientdata(client, kpad);
 
 	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
 	return 0;
 
-err_free_irq:
-	free_irq(client->irq, kpad);
-err_unreg_dev:
-	input_unregister_device(input);
-	input = NULL;
-err_free_input:
-	input_free_device(input);
+err_keypad_remove:
+	adp5589_keypad_remove(kpad, pdata);
 err_free_mem:
 	kfree(kpad);
 
@@ -1048,11 +1066,12 @@ static int adp5589_probe(struct i2c_client *client,
 static int adp5589_remove(struct i2c_client *client)
 {
 	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
+	const struct adp5589_kpad_platform_data *pdata =
+		dev_get_platdata(&client->dev);
 
 	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
-	free_irq(client->irq, kpad);
-	input_unregister_device(kpad->input);
-	adp5589_gpio_remove(kpad);
+	adp5589_keypad_remove(kpad, pdata);
+	adp5589_gpio_remove(kpad, pdata);
 	kfree(kpad);
 
 	return 0;
@@ -1064,6 +1083,9 @@ static int adp5589_suspend(struct device *dev)
 	struct adp5589_kpad *kpad = dev_get_drvdata(dev);
 	struct i2c_client *client = kpad->client;
 
+	if (!kpad->input)
+		return 0;
+
 	disable_irq(client->irq);
 
 	if (device_may_wakeup(&client->dev))
@@ -1077,6 +1099,9 @@ static int adp5589_resume(struct device *dev)
 	struct adp5589_kpad *kpad = dev_get_drvdata(dev);
 	struct i2c_client *client = kpad->client;
 
+	if (!kpad->input)
+		return 0;
+
 	if (device_may_wakeup(&client->dev))
 		disable_irq_wake(client->irq);
 
-- 
2.20.1


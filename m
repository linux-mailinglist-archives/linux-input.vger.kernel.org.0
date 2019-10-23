Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA1C6E12A9
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 09:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388578AbfJWHFq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Oct 2019 03:05:46 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:36894 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731524AbfJWHFq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Oct 2019 03:05:46 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9N72wbR003523;
        Wed, 23 Oct 2019 03:05:31 -0400
Received: from nam01-sn1-obe.outbound.protection.outlook.com (mail-sn1nam01lp2051.outbound.protection.outlook.com [104.47.32.51])
        by mx0a-00128a01.pphosted.com with ESMTP id 2vt9tw17sy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 23 Oct 2019 03:05:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCcaO4UdL591mkLBkRZi7orNXKjw3QVHhTIAs0LP8ezUG9LPnaxnTCWMWUBoTjohzxLyps8oKYCrwatiYQAEUZIX9U+V+hwslOwQ2O2aHZ3g3o/suqGbHCgVJ0D8sFvGW09ttGizonoGxU2bkDVv79ICDejdYvOHC2kHWYqbtycHCSZRiqaUQoSafEHbjYMLmTiXnAK7v4+53bWqEARnL6t6ZERhsc15O8aUlWkP45MfQx3WOXyIwXASILOCOCrevarsySwY7zzboO9cJG5rqX/57CW9kbUs+9g4mtfnaPGJ9nAJucEaz1LKWq3xfdOXXDbis5KEFD8x4gVblYtpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baiGIU0/o6tVrJSeGBenm0VN61AqoQGJ48svNwliOIY=;
 b=ZWBa/L01upXx4xfKOIe6TYob9kXxDaCoTjs3JleR+q2MfM7PdEne4QrWDSG1bblzkQie0waFmUUS7qENPmnrMZhFY4g6KBkBPgd97a1RpV/eCIrWMa9SJnzpgOrNQHD+JyKlczVaR0JGTi1Mz3V4eXPU9sSDrdQ7uN++SF5k6/Ek78YaJ/r6m4tPnDrRMyYwzd5Umr/p6noXjwpUoI/TQCN9BpUTOs0piTa0KNqguw6uR6jEdt/pyh5mrkPtunbIbUr736mjVcTtc5Rj4rEuvr7sWAUaWwWO/QLKvRSHSmZ8k605EgNGCkw12DH91uL+TTRvXy3QmvH8ioJ+2QB28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baiGIU0/o6tVrJSeGBenm0VN61AqoQGJ48svNwliOIY=;
 b=9T3p8WmHlziglOvnq7LP6rmkR6odm5lwmUKu1XPKarJRLc2e6bOXEEBCE4VHlkQPXJKsVF741MXpSyAzQckvsxrGpmSHavloxCtsGpa8epaCXr9H2cmg/LRXeEkHnrZlhtkMp4G1dbWT/pivd4llVz62tslZIba0S1aPtClsLFg=
Received: from BYAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:a02:a8::32)
 by BN7PR03MB4468.namprd03.prod.outlook.com (2603:10b6:408:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Wed, 23 Oct
 2019 07:05:29 +0000
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::206) by BYAPR03CA0019.outlook.office365.com
 (2603:10b6:a02:a8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Wed, 23 Oct 2019 07:05:28 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Wed, 23 Oct 2019 07:05:28 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9N75R9t017499
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Wed, 23 Oct 2019 00:05:28 -0700
Received: from saturn.ad.analog.com (10.48.65.116) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Wed, 23 Oct 2019 03:05:26 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH][RESEND] input: adp5589: Make keypad support optional
Date:   Wed, 23 Oct 2019 10:05:41 +0300
Message-ID: <20191023070541.13940-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927123836.28047-1-alexandru.ardelean@analog.com>
References: <20190927123836.28047-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(47776003)(2906002)(14444005)(7636002)(54906003)(246002)(476003)(106002)(305945005)(8676002)(316002)(126002)(110136005)(446003)(356004)(11346002)(2616005)(107886003)(44832011)(486006)(36756003)(4326008)(186003)(336012)(8936002)(2870700001)(50226002)(76176011)(1076003)(426003)(50466002)(7696005)(51416003)(478600001)(70586007)(86362001)(70206006)(6666004)(26005)(48376002)(5660300002)(334744003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR03MB4468;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ffbd3e7-1456-41a5-7c46-08d7578762d9
X-MS-TrafficTypeDiagnostic: BN7PR03MB4468:
X-Microsoft-Antispam-PRVS: <BN7PR03MB4468D38E4480B209E8744969F96B0@BN7PR03MB4468.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 019919A9E4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: azpyGkacPmIexh+Sb17HOC2AKjf19fTOXYOGmGlIBJUnQp4vpn+Fl4Tk6VKnEx3H+NYB0Tt6KCL/u++kdNRfcAiENdjBc9EWL4uH2oenZXNMb7Pe/U7ucyhY8PsIX7/aYi3kQogNaqquEErWEPjq10RZ+LI6s+Qu47Nn5yajTbKAkNn0JmyDTwX2LFSfRVxUGlMc9EGGF4qU1gXdn7dimHWdnD/PDLrL72c7CtDwJSlpCo11lhRwzlI9IabmxwQ7kACtDFAqnFWS9WspizI9joIH/fwnZ8PMtQJyH+juFHxyJQ+64JkMg3hMUFIJFogRJlsgSCenQFyDE+HCY6g347zpd8KTbgivbeHsebpM6DUHKjjolx34uTcViTVKHgmDFnv5LgW5DPx5hbbcNj13DYrg4bGeTUTw22zTpyFo5TU6hFKX8Dn4DlYn0aUP+7sc
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2019 07:05:28.5735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffbd3e7-1456-41a5-7c46-08d7578762d9
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4468
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_01:2019-10-22,2019-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=2 mlxscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910230069
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


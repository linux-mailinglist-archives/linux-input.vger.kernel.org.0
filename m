Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D0F2C200A
	for <lists+linux-input@lfdr.de>; Tue, 24 Nov 2020 09:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730549AbgKXIcL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Nov 2020 03:32:11 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:11202 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730476AbgKXIcK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Nov 2020 03:32:10 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0AO8QLmn027376;
        Tue, 24 Nov 2020 03:31:58 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34y0p87ut2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Nov 2020 03:31:57 -0500
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AO8VuMR014699
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Tue, 24 Nov 2020 03:31:56 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 24 Nov
 2020 03:31:55 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 24 Nov 2020 03:31:55 -0500
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AO8VqG2021753;
        Tue, 24 Nov 2020 03:31:53 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 1/3] Input: adp5589-keys - add default platform data
Date:   Tue, 24 Nov 2020 10:22:53 +0200
Message-ID: <20201124082255.13427-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-24_03:2020-11-24,2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240051
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

Changelog v1 -> v2:
* rebased on newer input/next tree; a conflict appeared for this
  patchset https://lore.kernel.org/r/20201119072440.GA116840@dtor-ws

 drivers/input/keyboard/adp5589-keys.c | 33 +++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index e2cdf14d90cd..742bf4b97dbb 100644
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
 
@@ -619,7 +639,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 {
 	struct i2c_client *client = kpad->client;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	u8 (*reg) (u8) = kpad->var->reg;
 	unsigned char evt_mode1 = 0, evt_mode2 = 0, evt_mode3 = 0;
 	unsigned char pull_mask = 0;
@@ -824,7 +844,7 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 {
 	struct i2c_client *client = kpad->client;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	struct input_dev *input;
 	unsigned int i;
 	int error;
@@ -948,7 +968,7 @@ static int adp5589_probe(struct i2c_client *client,
 {
 	struct adp5589_kpad *kpad;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	unsigned int revid;
 	int error, ret;
 
@@ -958,11 +978,6 @@ static int adp5589_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	if (!pdata) {
-		dev_err(&client->dev, "no platform data?\n");
-		return -EINVAL;
-	}
-
 	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
 		return -ENOMEM;
-- 
2.17.1


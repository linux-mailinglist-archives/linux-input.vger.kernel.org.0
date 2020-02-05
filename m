Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E15211532B2
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2020 15:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgBEOUG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Feb 2020 09:20:06 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:1792 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbgBEOUG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Feb 2020 09:20:06 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 015EBm87006876;
        Wed, 5 Feb 2020 09:19:53 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 2xyhnkht8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Feb 2020 09:19:53 -0500
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 015EJplg056582
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Wed, 5 Feb 2020 09:19:51 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Wed, 5 Feb 2020
 09:19:51 -0500
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 5 Feb 2020 09:19:51 -0500
Received: from saturn.ad.analog.com ([10.48.65.124])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 015EJmEL000357;
        Wed, 5 Feb 2020 09:19:49 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 1/2][RESEND] input: adp5589: Add default platform data
Date:   Wed, 5 Feb 2020 16:22:17 +0200
Message-ID: <20200205142218.15973-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-05_04:2020-02-04,2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002050111
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


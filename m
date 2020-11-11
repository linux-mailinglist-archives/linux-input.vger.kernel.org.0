Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7981A2AEC32
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 09:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgKKInp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 03:43:45 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:50774 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726096AbgKKInm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 03:43:42 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AB8ZUnb015604;
        Wed, 11 Nov 2020 03:43:41 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34npaavq7k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Nov 2020 03:43:41 -0500
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AB8hdne057976
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Wed, 11 Nov 2020 03:43:40 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 03:43:39 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 03:43:38 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 03:43:38 -0500
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AB8hTjh016992;
        Wed, 11 Nov 2020 03:43:36 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 6/6] Input: adp5589: use devm_add_action_or_reset() for register clear
Date:   Wed, 11 Nov 2020 10:48:33 +0200
Message-ID: <20201111084833.40995-7-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111084833.40995-1-alexandru.ardelean@analog.com>
References: <20201111084833.40995-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_02:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110046
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver clears the general configuration register during the remove()
hook. This should also be done in case the driver exits on error.

This change move the clear of that register to the
devm_add_action_or_reset() hook.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 0bd7170041e0..7d1ab0aa6b14 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -930,6 +930,14 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 	return 0;
 }
 
+static void adp5589_clear_config(void *data)
+{
+	struct i2c_client *client = data;
+	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
+
+	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
+}
+
 static int adp5589_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -976,6 +984,11 @@ static int adp5589_probe(struct i2c_client *client,
 
 	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
 
+	ret = devm_add_action_or_reset(&client->dev, adp5589_clear_config,
+				       client);
+	if (ret < 0)
+		return ret;
+
 	if (pdata->keymapsize) {
 		ret = adp5589_keypad_add(kpad, revid);
 		if (ret)
@@ -999,15 +1012,6 @@ static int adp5589_probe(struct i2c_client *client,
 	return 0;
 }
 
-static int adp5589_remove(struct i2c_client *client)
-{
-	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
-
-	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int adp5589_suspend(struct device *dev)
 {
@@ -1059,7 +1063,6 @@ static struct i2c_driver adp5589_driver = {
 		.pm = &adp5589_dev_pm_ops,
 	},
 	.probe = adp5589_probe,
-	.remove = adp5589_remove,
 	.id_table = adp5589_id,
 };
 
-- 
2.17.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFEE2AEC2B
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 09:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgKKIng (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 03:43:36 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:45542 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725899AbgKKIng (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 03:43:36 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AB8g9hC027842;
        Wed, 11 Nov 2020 03:43:35 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 34nsc94fyq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Nov 2020 03:43:34 -0500
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0AB8hXEB039890
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Wed, 11 Nov 2020 03:43:33 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Wed, 11 Nov
 2020 03:43:32 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 03:43:32 -0500
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AB8hTjc016992;
        Wed, 11 Nov 2020 03:43:31 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 1/6] Input: adp5589: use a single variable for error in probe
Date:   Wed, 11 Nov 2020 10:48:28 +0200
Message-ID: <20201111084833.40995-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111084833.40995-1-alexandru.ardelean@analog.com>
References: <20201111084833.40995-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_02:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=2 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110047
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 'error' & 'ret' variables are used. This is a bit of duplication.
This change replaces the use of error with the 'ret' variable since the
name is a bit more generic.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index eb0e9cd66bcb..4cfb26e3d79c 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -994,7 +994,7 @@ static int adp5589_probe(struct i2c_client *client,
 	const struct adp5589_kpad_platform_data *pdata =
 		dev_get_platdata(&client->dev);
 	unsigned int revid;
-	int error, ret;
+	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA)) {
@@ -1028,28 +1028,26 @@ static int adp5589_probe(struct i2c_client *client,
 	}
 
 	ret = adp5589_read(client, ADP5589_5_ID);
-	if (ret < 0) {
-		error = ret;
+	if (ret < 0)
 		goto err_free_mem;
-	}
 
 	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
 
 	if (pdata->keymapsize) {
-		error = adp5589_keypad_add(kpad, revid);
-		if (error)
+		ret = adp5589_keypad_add(kpad, revid);
+		if (ret)
 			goto err_free_mem;
 	}
 
-	error = adp5589_setup(kpad);
-	if (error)
+	ret = adp5589_setup(kpad);
+	if (ret)
 		goto err_keypad_remove;
 
 	if (kpad->gpimapsize)
 		adp5589_report_switch_state(kpad);
 
-	error = adp5589_gpio_add(kpad);
-	if (error)
+	ret = adp5589_gpio_add(kpad);
+	if (ret)
 		goto err_keypad_remove;
 
 	i2c_set_clientdata(client, kpad);
@@ -1062,7 +1060,7 @@ static int adp5589_probe(struct i2c_client *client,
 err_free_mem:
 	kfree(kpad);
 
-	return error;
+	return ret;
 }
 
 static int adp5589_remove(struct i2c_client *client)
-- 
2.17.1


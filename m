Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B2C2AEC2D
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 09:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgKKInj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 03:43:39 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:47382 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725899AbgKKIni (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 03:43:38 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AB8ZCwE015125;
        Wed, 11 Nov 2020 03:43:37 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34npaavq7c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Nov 2020 03:43:36 -0500
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AB8hZ57057968
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Wed, 11 Nov 2020 03:43:35 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 03:43:34 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 03:43:34 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 03:43:34 -0500
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AB8hTjd016992;
        Wed, 11 Nov 2020 03:43:32 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 2/6] Input: adp5589: use devm_kzalloc() to allocate the kpad object
Date:   Wed, 11 Nov 2020 10:48:29 +0200
Message-ID: <20201111084833.40995-3-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111084833.40995-1-alexandru.ardelean@analog.com>
References: <20201111084833.40995-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_02:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=765 clxscore=1015 lowpriorityscore=0
 suspectscore=2 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110046
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This removes the need to manually free the kpad object and cleans up some
exit/error paths.
The error path cleanup should reduce the risk of any memory leaks with this
object.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 4cfb26e3d79c..9f41118b4321 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1007,7 +1007,7 @@ static int adp5589_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
+	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
 		return -ENOMEM;
 
@@ -1029,14 +1029,14 @@ static int adp5589_probe(struct i2c_client *client,
 
 	ret = adp5589_read(client, ADP5589_5_ID);
 	if (ret < 0)
-		goto err_free_mem;
+		return ret;
 
 	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
 
 	if (pdata->keymapsize) {
 		ret = adp5589_keypad_add(kpad, revid);
 		if (ret)
-			goto err_free_mem;
+			return ret;
 	}
 
 	ret = adp5589_setup(kpad);
@@ -1057,8 +1057,6 @@ static int adp5589_probe(struct i2c_client *client,
 
 err_keypad_remove:
 	adp5589_keypad_remove(kpad);
-err_free_mem:
-	kfree(kpad);
 
 	return ret;
 }
@@ -1070,7 +1068,6 @@ static int adp5589_remove(struct i2c_client *client)
 	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
 	adp5589_keypad_remove(kpad);
 	adp5589_gpio_remove(kpad);
-	kfree(kpad);
 
 	return 0;
 }
-- 
2.17.1


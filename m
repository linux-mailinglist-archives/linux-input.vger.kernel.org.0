Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A712B0061
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 08:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgKLHib (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 02:38:31 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:30334 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726066AbgKLHi2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 02:38:28 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AC7ZiUK026526;
        Thu, 12 Nov 2020 02:38:27 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34npab0hev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 02:38:27 -0500
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AC7cQ8g018447
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 12 Nov 2020 02:38:26 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Thu, 12 Nov
 2020 02:38:25 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 12 Nov 2020 02:38:24 -0500
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AC7cLL5024474;
        Thu, 12 Nov 2020 02:38:22 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 1/5] Input: adp5589: use devm_kzalloc() to allocate the kpad object
Date:   Thu, 12 Nov 2020 09:43:04 +0200
Message-ID: <20201112074308.71351-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112074308.71351-1-alexandru.ardelean@analog.com>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_02:2020-11-10,2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=796 clxscore=1015 lowpriorityscore=0
 suspectscore=2 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120045
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This removes the need to manually free the kpad object and cleans up some
exit/error paths.
The error path cleanup should reduce the risk of any memory leaks with this
object.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index eb0e9cd66bcb..922497b65ab0 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1007,7 +1007,7 @@ static int adp5589_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
+	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
 		return -ENOMEM;
 
@@ -1028,17 +1028,15 @@ static int adp5589_probe(struct i2c_client *client,
 	}
 
 	ret = adp5589_read(client, ADP5589_5_ID);
-	if (ret < 0) {
-		error = ret;
-		goto err_free_mem;
-	}
+	if (ret < 0)
+		return ret;
 
 	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
 
 	if (pdata->keymapsize) {
 		error = adp5589_keypad_add(kpad, revid);
 		if (error)
-			goto err_free_mem;
+			return error;
 	}
 
 	error = adp5589_setup(kpad);
@@ -1059,8 +1057,6 @@ static int adp5589_probe(struct i2c_client *client,
 
 err_keypad_remove:
 	adp5589_keypad_remove(kpad);
-err_free_mem:
-	kfree(kpad);
 
 	return error;
 }
@@ -1072,7 +1068,6 @@ static int adp5589_remove(struct i2c_client *client)
 	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
 	adp5589_keypad_remove(kpad);
 	adp5589_gpio_remove(kpad);
-	kfree(kpad);
 
 	return 0;
 }
-- 
2.17.1


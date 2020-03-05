Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4075017A61E
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 14:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgCENLb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 08:11:31 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:18915 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726263AbgCENLa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Mar 2020 08:11:30 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 025CoR9K022360;
        Thu, 5 Mar 2020 08:11:16 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ygm52f46a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Mar 2020 08:11:16 -0500
Received: from ASHBMBX8.ad.analog.com (ashbmbx8.ad.analog.com [10.64.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 025DBFY6041804
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 5 Mar 2020 08:11:15 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 5 Mar 2020 08:11:14 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 5 Mar 2020 08:11:14 -0500
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 5 Mar 2020 08:11:14 -0500
Received: from saturn.ad.analog.com ([10.48.65.112])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 025DB78B029497;
        Thu, 5 Mar 2020 08:11:11 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v4 3/4] Input: adp5589: unify ret & error variables
Date:   Thu, 5 Mar 2020 15:14:04 +0200
Message-ID: <20200305131405.6598-3-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305131405.6598-1-alexandru.ardelean@analog.com>
References: <20200305131405.6598-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-05_03:2020-03-05,2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 impostorscore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050083
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Both variables are used mostly in the same way in the probe function.
Having both means that we need to copy 'ret' to 'error' before exiting, so
just use 'ret' everywhere.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 56f4ff7fa9c3..1fd36c581a91 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1034,7 +1034,7 @@ static int adp5589_probe(struct i2c_client *client,
 	const struct adp5589_kpad_platform_data *pdata =
 		adp5589_kpad_pdata_get(&client->dev);
 	unsigned int revid;
-	int error, ret;
+	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA)) {
@@ -1067,28 +1067,26 @@ static int adp5589_probe(struct i2c_client *client,
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
@@ -1101,7 +1099,7 @@ static int adp5589_probe(struct i2c_client *client,
 err_free_mem:
 	kfree(kpad);
 
-	return error;
+	return ret;
 }
 
 static int adp5589_remove(struct i2c_client *client)
-- 
2.20.1


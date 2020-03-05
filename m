Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B21317A61C
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 14:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgCENLa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 08:11:30 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:12486 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726259AbgCENL2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Mar 2020 08:11:28 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 025Cp1YO022457;
        Thu, 5 Mar 2020 08:11:16 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ygm52f469-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Mar 2020 08:11:15 -0500
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 025DBEgq037326
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 5 Mar 2020 08:11:14 -0500
Received: from SCSQCASHYB7.ad.analog.com (10.77.17.133) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 5 Mar 2020 05:11:13 -0800
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQCASHYB7.ad.analog.com (10.77.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 5 Mar 2020 05:11:13 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 5 Mar 2020 05:11:12 -0800
Received: from saturn.ad.analog.com ([10.48.65.112])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 025DB78A029497;
        Thu, 5 Mar 2020 08:11:09 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v4 2/4] Input: adp5589: Add basic devicetree support
Date:   Thu, 5 Mar 2020 15:14:03 +0200
Message-ID: <20200305131405.6598-2-alexandru.ardelean@analog.com>
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
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050083
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lars-Peter Clausen <lars@metafoo.de>

Add very basic devicetree suppport to the adp5589 allowing the device to be
registered from devicetree.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 33 ++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index c6a801bcdf90..56f4ff7fa9c3 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1008,6 +1008,25 @@ static void adp5589_keypad_remove(struct adp5589_kpad *kpad)
 	}
 }
 
+static int adp5589_i2c_get_driver_data(struct i2c_client *i2c,
+				       const struct i2c_device_id *id)
+{
+	const struct of_device_id *match;
+
+	if (id)
+		return id->driver_data;
+
+	if (!IS_ENABLED(CONFIG_OF) || !i2c->dev.of_node)
+		return -ENODEV;
+
+	match = of_match_node(i2c->dev.driver->of_match_table,
+			      i2c->dev.of_node);
+	if (match)
+		return (uintptr_t)match->data;
+
+	return -ENODEV;
+}
+
 static int adp5589_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -1029,7 +1048,11 @@ static int adp5589_probe(struct i2c_client *client,
 
 	kpad->client = client;
 
-	switch (id->driver_data) {
+	ret = adp5589_i2c_get_driver_data(client, id);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
 	case ADP5585_02:
 		kpad->support_row5 = true;
 		/* fall through */
@@ -1129,6 +1152,13 @@ static int adp5589_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
 
+static const struct of_device_id adp5589_of_match[] = {
+	{ .compatible = "adi,adp5585", .data = (void *)ADP5585_01 },
+	{ .compatible = "adi,adp5585-02", .data = (void *)ADP5585_02 },
+	{ .compatible = "adi,adp5589", .data = (void *)ADP5589 },
+	{}
+};
+
 static const struct i2c_device_id adp5589_id[] = {
 	{"adp5589-keys", ADP5589},
 	{"adp5585-keys", ADP5585_01},
@@ -1142,6 +1172,7 @@ static struct i2c_driver adp5589_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &adp5589_dev_pm_ops,
+		.of_match_table = adp5589_of_match,
 	},
 	.probe = adp5589_probe,
 	.remove = adp5589_remove,
-- 
2.20.1


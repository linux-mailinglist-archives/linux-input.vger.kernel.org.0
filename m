Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377E82B0067
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 08:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKLHib (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 02:38:31 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:31890 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbgKLHia (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 02:38:30 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AC7c76u023929;
        Thu, 12 Nov 2020 02:38:29 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 34nsc989cm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 02:38:29 -0500
Received: from SCSQMBX10.ad.analog.com (SCSQMBX10.ad.analog.com [10.77.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0AC7cRFO062718
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 12 Nov 2020 02:38:28 -0500
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 23:38:26 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 23:38:26 -0800
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AC7cLL6024474;
        Thu, 12 Nov 2020 02:38:23 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 2/5] Input: adp5589: use device-managed function in adp5589_keypad_add()
Date:   Thu, 12 Nov 2020 09:43:05 +0200
Message-ID: <20201112074308.71351-3-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112074308.71351-1-alexandru.ardelean@analog.com>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_02:2020-11-10,2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=2 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=896 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120045
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change makes use of the devm_input_allocate_device() function, which
gets rid of the input_free_device() and input_unregister_device() calls.

When a device is allocated via input_allocate_device(), the
input_register_device() call will also be device-managed, so there is no
longer need to manually call unregister.

Also, the irq is allocated with the devm_request_threaded_irq(), so with
these two changes, the adp5589_keypad_remove() function is no longer
needed.

This cleans up the error & exit paths.
It also looks like the input_free_device() should have been called on the
remove() hook, but doesn't look like it is.

This change may also also fix some potential leaks that were probably
omitted earlier.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 47 +++++++--------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 922497b65ab0..e96ffd5ed69e 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -909,7 +909,7 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 		return -EINVAL;
 	}
 
-	input = input_allocate_device();
+	input = devm_input_allocate_device(&client->dev);
 	if (!input)
 		return -ENOMEM;
 
@@ -953,38 +953,19 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 		__set_bit(kpad->gpimap[i].sw_evt, input->swbit);
 
 	error = input_register_device(input);
-	if (error) {
-		dev_err(&client->dev, "unable to register input device\n");
-		goto err_free_input;
-	}
+	if (error)
+		return error;
 
-	error = request_threaded_irq(client->irq, NULL, adp5589_irq,
-				     IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-				     client->dev.driver->name, kpad);
-	if (error) {
-		dev_err(&client->dev, "irq %d busy?\n", client->irq);
-		goto err_unreg_dev;
-	}
+	error = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					  adp5589_irq,
+					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					  client->dev.driver->name, kpad);
+	if (error)
+		return error;
 
 	device_init_wakeup(&client->dev, 1);
 
 	return 0;
-
-err_unreg_dev:
-	input_unregister_device(input);
-	input = NULL;
-err_free_input:
-	input_free_device(input);
-
-	return error;
-}
-
-static void adp5589_keypad_remove(struct adp5589_kpad *kpad)
-{
-	if (kpad->input) {
-		free_irq(kpad->client->irq, kpad);
-		input_unregister_device(kpad->input);
-	}
 }
 
 static int adp5589_probe(struct i2c_client *client,
@@ -1041,24 +1022,19 @@ static int adp5589_probe(struct i2c_client *client,
 
 	error = adp5589_setup(kpad);
 	if (error)
-		goto err_keypad_remove;
+		return error;
 
 	if (kpad->gpimapsize)
 		adp5589_report_switch_state(kpad);
 
 	error = adp5589_gpio_add(kpad);
 	if (error)
-		goto err_keypad_remove;
+		return error;
 
 	i2c_set_clientdata(client, kpad);
 
 	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
 	return 0;
-
-err_keypad_remove:
-	adp5589_keypad_remove(kpad);
-
-	return error;
 }
 
 static int adp5589_remove(struct i2c_client *client)
@@ -1066,7 +1042,6 @@ static int adp5589_remove(struct i2c_client *client)
 	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
 
 	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
-	adp5589_keypad_remove(kpad);
 	adp5589_gpio_remove(kpad);
 
 	return 0;
-- 
2.17.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88982B0068
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 08:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgKLHie (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 02:38:34 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:33842 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726229AbgKLHid (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 02:38:33 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AC7ZOAJ026491;
        Thu, 12 Nov 2020 02:38:32 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 34npab0hf4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 02:38:31 -0500
Received: from SCSQMBX10.ad.analog.com (SCSQMBX10.ad.analog.com [10.77.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0AC7cUMD062724
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 12 Nov 2020 02:38:30 -0500
Received: from SCSQCASHYB7.ad.analog.com (10.77.17.133) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 23:38:29 -0800
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by
 SCSQCASHYB7.ad.analog.com (10.77.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 23:38:28 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 23:38:28 -0800
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AC7cLL8024474;
        Thu, 12 Nov 2020 02:38:26 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 4/5] Input: adp5589: use devm_gpiochip_add_data() for gpios
Date:   Thu, 12 Nov 2020 09:43:07 +0200
Message-ID: <20201112074308.71351-5-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112074308.71351-1-alexandru.ardelean@analog.com>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_02:2020-11-10,2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120045
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change makes use of the devm_gpiochip_add_data() function. With this
the gpiochip_remove() function can be removed, and the
adp5589_gpio_remove() function as well.

The kpad->export_gpio variable is also redundant now, and has been removed.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index cc91a47931bd..ab390b01db08 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -238,7 +238,6 @@ struct adp5589_kpad {
 	bool support_row5;
 #ifdef CONFIG_GPIOLIB
 	unsigned char gpiomap[ADP5589_MAXGPIO];
-	bool export_gpio;
 	struct gpio_chip gc;
 	struct mutex gpio_lock;	/* Protect cached dir, dat_out */
 	u8 dat_out[3];
@@ -512,8 +511,6 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 		return 0;
 	}
 
-	kpad->export_gpio = true;
-
 	kpad->gc.direction_input = adp5589_gpio_direction_input;
 	kpad->gc.direction_output = adp5589_gpio_direction_output;
 	kpad->gc.get = adp5589_gpio_get_value;
@@ -526,11 +523,9 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 
 	mutex_init(&kpad->gpio_lock);
 
-	error = gpiochip_add_data(&kpad->gc, kpad);
-	if (error) {
-		dev_err(dev, "gpiochip_add_data() failed, err: %d\n", error);
+	error = devm_gpiochip_add_data(dev, &kpad->gc, kpad);
+	if (error)
 		return error;
-	}
 
 	for (i = 0; i <= kpad->var->bank(kpad->var->maxgpio); i++) {
 		kpad->dat_out[i] = adp5589_read(kpad->client, kpad->var->reg(
@@ -541,23 +536,11 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 
 	return 0;
 }
-
-static void adp5589_gpio_remove(struct adp5589_kpad *kpad)
-{
-	if (!kpad->export_gpio)
-		return;
-
-	gpiochip_remove(&kpad->gc);
-}
 #else
 static inline int adp5589_gpio_add(struct adp5589_kpad *kpad)
 {
 	return 0;
 }
-
-static inline void adp5589_gpio_remove(struct adp5589_kpad *kpad)
-{
-}
 #endif
 
 static void adp5589_report_switches(struct adp5589_kpad *kpad,
@@ -1021,7 +1004,6 @@ static int adp5589_remove(struct i2c_client *client)
 	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
 
 	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
-	adp5589_gpio_remove(kpad);
 
 	return 0;
 }
-- 
2.17.1


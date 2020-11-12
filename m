Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA24F2B0069
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 08:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKLHis (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 02:38:48 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:32234 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726107AbgKLHia (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 02:38:30 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AC7cUQg024894;
        Thu, 12 Nov 2020 02:38:30 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34nsc989cn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 02:38:29 -0500
Received: from SCSQMBX11.ad.analog.com (SCSQMBX11.ad.analog.com [10.77.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AC7cSQt018451
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 12 Nov 2020 02:38:28 -0500
Received: from SCSQCASHYB7.ad.analog.com (10.77.17.133) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 23:38:27 -0800
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQCASHYB7.ad.analog.com (10.77.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 23:38:26 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 23:38:26 -0800
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AC7cLL7024474;
        Thu, 12 Nov 2020 02:38:24 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 3/5] Input: adp5589: remove setup/teardown hooks for gpios
Date:   Thu, 12 Nov 2020 09:43:06 +0200
Message-ID: <20201112074308.71351-4-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112074308.71351-1-alexandru.ardelean@analog.com>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_02:2020-11-10,2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120045
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is currently just dead code. It's from around a time when
platform-data was used, and a board could hook it's own special callback
for setup/teardown, and a private object (via 'context').

This change removes it, as there are no more users in mainline for this.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 21 ---------------------
 include/linux/input/adp5589.h         |  7 -------
 2 files changed, 28 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index e96ffd5ed69e..cc91a47931bd 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -539,35 +539,14 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 					    ADP5589_GPIO_DIRECTION_A) + i);
 	}
 
-	if (gpio_data->setup) {
-		error = gpio_data->setup(kpad->client,
-					 kpad->gc.base, kpad->gc.ngpio,
-					 gpio_data->context);
-		if (error)
-			dev_warn(dev, "setup failed, %d\n", error);
-	}
-
 	return 0;
 }
 
 static void adp5589_gpio_remove(struct adp5589_kpad *kpad)
 {
-	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
-	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
-	int error;
-
 	if (!kpad->export_gpio)
 		return;
 
-	if (gpio_data->teardown) {
-		error = gpio_data->teardown(kpad->client,
-					    kpad->gc.base, kpad->gc.ngpio,
-					    gpio_data->context);
-		if (error)
-			dev_warn(dev, "teardown failed %d\n", error);
-	}
-
 	gpiochip_remove(&kpad->gc);
 }
 #else
diff --git a/include/linux/input/adp5589.h b/include/linux/input/adp5589.h
index c0523af96893..0e4742c8c81e 100644
--- a/include/linux/input/adp5589.h
+++ b/include/linux/input/adp5589.h
@@ -175,13 +175,6 @@ struct i2c_client; /* forward declaration */
 
 struct adp5589_gpio_platform_data {
 	int	gpio_start;	/* GPIO Chip base # */
-	int	(*setup)(struct i2c_client *client,
-				int gpio, unsigned ngpio,
-				void *context);
-	int	(*teardown)(struct i2c_client *client,
-				int gpio, unsigned ngpio,
-				void *context);
-	void	*context;
 };
 
 #endif
-- 
2.17.1


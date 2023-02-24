Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE916A1898
	for <lists+linux-input@lfdr.de>; Fri, 24 Feb 2023 10:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBXJSd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 04:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjBXJSb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 04:18:31 -0500
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FD948E23
        for <linux-input@vger.kernel.org>; Fri, 24 Feb 2023 01:18:30 -0800 (PST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31O8Pimn013309;
        Fri, 24 Feb 2023 04:18:29 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3nxc0e4jwr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 04:18:29 -0500
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 31O9IS9J010427
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Feb 2023 04:18:28 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 24 Feb
 2023 04:18:27 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Feb 2023 04:18:27 -0500
Received: from nsa.ad.analog.com ([10.44.3.102])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 31O9IEmN019939;
        Fri, 24 Feb 2023 04:18:21 -0500
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-input@vger.kernel.org>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH] input: keyboard: adp5588: make use of devm_regulator_get_enable()
Date:   Fri, 24 Feb 2023 10:20:11 +0100
Message-ID: <20230224092011.713545-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: hSFNCUwrxf_VI4zcP_Kj5C3pKnzi6zYH
X-Proofpoint-GUID: hSFNCUwrxf_VI4zcP_Kj5C3pKnzi6zYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_04,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 mlxlogscore=822 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302240075
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Using devm_regulator_get_enable() allow us to save some boiler plate
code.

No functional changes intended...

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 72ae5ce72956..a9138810f8ef 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -713,17 +713,11 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 	return 0;
 }
 
-static void adp5588_disable_regulator(void *reg)
-{
-	regulator_disable(reg);
-}
-
 static int adp5588_probe(struct i2c_client *client)
 {
 	struct adp5588_kpad *kpad;
 	struct input_dev *input;
 	struct gpio_desc *gpio;
-	struct regulator *vcc;
 	unsigned int revid;
 	int ret;
 	int error;
@@ -749,18 +743,9 @@ static int adp5588_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	vcc = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(vcc))
-		return PTR_ERR(vcc);
-
-	error = regulator_enable(vcc);
-	if (error)
-		return error;
-
-	error = devm_add_action_or_reset(&client->dev,
-					 adp5588_disable_regulator, vcc);
-	if (error)
-		return error;
+	ret = devm_regulator_get_enable(&client->dev, "vcc");
+	if (ret)
+		return ret;
 
 	gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(gpio))
-- 
2.39.2


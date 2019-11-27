Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD26210AD92
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 11:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfK0K3H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 05:29:07 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:30728 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726546AbfK0K3H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 05:29:07 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xARAR2dk031886;
        Wed, 27 Nov 2019 11:29:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=Bmi9ZxvHiIlWxe/sSml2LTtA26zSCPWx7oIRLedeHJE=;
 b=Pr3Z78mCwyJ9TShbbI12Na03BJ4OiVZwMtDSWYVnuxhayk6LzKq3YiFopT8c55DlgFSA
 xoig3XdJcgk6oAQW5qS3Wa2/b+2XMcsRa0/4GZvKNLzmnNibvsBDsIuT0wPuNl5dtXZD
 rFQfnC9r1f3yMcg1+Z62xKHxSNkbycdsGcxvFzhcyH2dOPocP0JZEigZ2ggqmkAnZSd1
 v2F+69ysw+FZPYYNwlw9g4bwoUfnaFNVF+J6dmn+fMvgBDDAYuK0WXxDGgccU3MVZno5
 orgZNCBILAxnNgA5AQ0S3WzeZIY1lfRT+bAf/ZK6pMNB2I+sNHc5YB58ZzGKJjs1iSmU OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2whcxsb1hc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 11:29:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0235910002A;
        Wed, 27 Nov 2019 11:29:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5591E2B1868;
        Wed, 27 Nov 2019 11:29:03 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov 2019 11:29:02
 +0100
From:   Yannick Fertre <yannick.fertre@st.com>
To:     Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: goodix: request_irq: convert gpio to irq
Date:   Wed, 27 Nov 2019 11:29:01 +0100
Message-ID: <1574850541-13577-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Yannick Fertré <yannick.fertre@st.com>

Convert gpio to irq if not already done by gpio lib.

Signed-off-by: Yannick Fertré <yannick.fertre
---
 drivers/input/touchscreen/goodix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index b470773..f1d9d5e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -23,6 +23,7 @@
 #include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
@@ -392,6 +393,13 @@ static void goodix_free_irq(struct goodix_ts_data *ts)
 
 static int goodix_request_irq(struct goodix_ts_data *ts)
 {
+	int gpio;
+
+	gpio = desc_to_gpio(ts->gpiod_int);
+
+	if (gpio_is_valid(gpio))
+		ts->client->irq = gpio_to_irq(gpio);
+
 	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
 					 NULL, goodix_ts_irq_handler,
 					 ts->irq_flags, ts->client->name, ts);
-- 
2.7.4


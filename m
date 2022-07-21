Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82E8E57C5AE
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 10:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbiGUIDt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 04:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiGUIDs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 04:03:48 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9D84AD6F;
        Thu, 21 Jul 2022 01:03:46 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L6DCdt008132;
        Thu, 21 Jul 2022 04:03:41 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3hbq679e5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jul 2022 04:03:41 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26L83eDU026247
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Jul 2022 04:03:40 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:39 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:39 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 21 Jul 2022 04:03:39 -0400
Received: from nsa.ad.analog.com ([10.44.3.68])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26L83GIo028313;
        Thu, 21 Jul 2022 04:03:33 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 07/10] input: keyboard: adp5588-keys: fix coding style warnings
Date:   Thu, 21 Jul 2022 10:04:20 +0200
Message-ID: <20220721080423.156151-8-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220721080423.156151-1-nuno.sa@analog.com>
References: <20220721080423.156151-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: pwomJSn7xbHqBnpxUIc19QLv5ZeuEc2c
X-Proofpoint-ORIG-GUID: pwomJSn7xbHqBnpxUIc19QLv5ZeuEc2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210031
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Just some code cleanup regarding coding style. With the introduction of
the bits.h macros changes in the code are indeed introduced.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/keyboard/adp5588-keys.c | 98 +++++++++++++--------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 6499b4a94c73..1c4b1ea724b0 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008-2010 Analog Devices Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
@@ -29,16 +30,16 @@
 #define CFG 0x01		/* Configuration Register1 */
 #define INT_STAT 0x02		/* Interrupt Status Register */
 #define KEY_LCK_EC_STAT 0x03	/* Key Lock and Event Counter Register */
-#define Key_EVENTA 0x04		/* Key Event Register A */
-#define Key_EVENTB 0x05		/* Key Event Register B */
-#define Key_EVENTC 0x06		/* Key Event Register C */
-#define Key_EVENTD 0x07		/* Key Event Register D */
-#define Key_EVENTE 0x08		/* Key Event Register E */
-#define Key_EVENTF 0x09		/* Key Event Register F */
-#define Key_EVENTG 0x0A		/* Key Event Register G */
-#define Key_EVENTH 0x0B		/* Key Event Register H */
-#define Key_EVENTI 0x0C		/* Key Event Register I */
-#define Key_EVENTJ 0x0D		/* Key Event Register J */
+#define KEY_EVENTA 0x04		/* Key Event Register A */
+#define KEY_EVENTB 0x05		/* Key Event Register B */
+#define KEY_EVENTC 0x06		/* Key Event Register C */
+#define KEY_EVENTD 0x07		/* Key Event Register D */
+#define KEY_EVENTE 0x08		/* Key Event Register E */
+#define KEY_EVENTF 0x09		/* Key Event Register F */
+#define KEY_EVENTG 0x0A		/* Key Event Register G */
+#define KEY_EVENTH 0x0B		/* Key Event Register H */
+#define KEY_EVENTI 0x0C		/* Key Event Register I */
+#define KEY_EVENTJ 0x0D		/* Key Event Register J */
 #define KP_LCK_TMR 0x0E		/* Keypad Lock1 to Lock2 Timer */
 #define UNLOCK1 0x0F		/* Unlock Key1 */
 #define UNLOCK2 0x10		/* Unlock Key2 */
@@ -66,9 +67,9 @@
 #define GPIO_INT_LVL1 0x26	/* GPIO Edge/Level Detect */
 #define GPIO_INT_LVL2 0x27	/* GPIO Edge/Level Detect */
 #define GPIO_INT_LVL3 0x28	/* GPIO Edge/Level Detect */
-#define Debounce_DIS1 0x29	/* Debounce Disable */
-#define Debounce_DIS2 0x2A	/* Debounce Disable */
-#define Debounce_DIS3 0x2B	/* Debounce Disable */
+#define DEBOUNCE_DIS1 0x29	/* Debounce Disable */
+#define DEBOUNCE_DIS2 0x2A	/* Debounce Disable */
+#define DEBOUNCE_DIS3 0x2B	/* Debounce Disable */
 #define GPIO_PULL1 0x2C		/* GPIO Pull Disable */
 #define GPIO_PULL2 0x2D		/* GPIO Pull Disable */
 #define GPIO_PULL3 0x2E		/* GPIO Pull Disable */
@@ -91,27 +92,27 @@
 #define ADP5588_DEVICE_ID_MASK	0xF
 
  /* Configuration Register1 */
-#define ADP5588_AUTO_INC	(1 << 7)
-#define ADP5588_GPIEM_CFG	(1 << 6)
-#define ADP5588_OVR_FLOW_M	(1 << 5)
-#define ADP5588_INT_CFG		(1 << 4)
-#define ADP5588_OVR_FLOW_IEN	(1 << 3)
-#define ADP5588_K_LCK_IM	(1 << 2)
-#define ADP5588_GPI_IEN		(1 << 1)
-#define ADP5588_KE_IEN		(1 << 0)
+#define ADP5588_AUTO_INC	BIT(7)
+#define ADP5588_GPIEM_CFG	BIT(6)
+#define ADP5588_OVR_FLOW_M	BIT(5)
+#define ADP5588_INT_CFG		BIT(4)
+#define ADP5588_OVR_FLOW_IEN	BIT(3)
+#define ADP5588_K_LCK_IM	BIT(2)
+#define ADP5588_GPI_IEN		BIT(1)
+#define ADP5588_KE_IEN		BIT(0)
 
 /* Interrupt Status Register */
-#define ADP5588_CMP2_INT	(1 << 5)
-#define ADP5588_CMP1_INT	(1 << 4)
-#define ADP5588_OVR_FLOW_INT	(1 << 3)
-#define ADP5588_K_LCK_INT	(1 << 2)
-#define ADP5588_GPI_INT		(1 << 1)
-#define ADP5588_KE_INT		(1 << 0)
+#define ADP5588_CMP2_INT	BIT(5)
+#define ADP5588_CMP1_INT	BIT(4)
+#define ADP5588_OVR_FLOW_INT	BIT(3)
+#define ADP5588_K_LCK_INT	BIT(2)
+#define ADP5588_GPI_INT		BIT(1)
+#define ADP5588_KE_INT		BIT(0)
 
 /* Key Lock and Event Counter Register */
-#define ADP5588_K_LCK_EN	(1 << 6)
+#define ADP5588_K_LCK_EN	BIT(6)
 #define ADP5588_LCK21		0x30
-#define ADP5588_KEC		0xF
+#define ADP5588_KEC		GENMASK(3, 0)
 
 #define ADP5588_MAXGPIO		18
 #define ADP5588_BANK(offs)	((offs) >> 3)
@@ -158,10 +159,10 @@
 #define ADP5588_GPIMAPSIZE_MAX (GPI_PIN_END - GPI_PIN_BASE + 1)
 
 /* Key Event Register xy */
-#define KEY_EV_PRESSED		(1 << 7)
-#define KEY_EV_MASK		(0x7F)
+#define KEY_EV_PRESSED		BIT(7)
+#define KEY_EV_MASK		GENMASK(6, 0)
 
-#define KP_SEL(x)		(0xFFFF >> (16 - x))	/* 2^x-1 */
+#define KP_SEL(x)		(BIT(x) - 1)	/* 2^x-1 */
 
 #define KEYP_MAX_EVENT		10
 
@@ -209,7 +210,7 @@ static int adp5588_write(struct i2c_client *client, u8 reg, u8 val)
 	return i2c_smbus_write_byte_data(client, reg, val);
 }
 
-static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -229,7 +230,7 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
 }
 
 static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+				   unsigned int off, int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -242,8 +243,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-			   kpad->dat_out[bank]);
+	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
 
 	mutex_unlock(&kpad->gpio_lock);
 }
@@ -282,7 +282,7 @@ static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 	return ret;
 }
 
-static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -300,7 +300,7 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 }
 
 static int adp5588_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned off, int val)
+					 unsigned int off, int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -317,12 +317,11 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 		kpad->dat_out[bank] &= ~bit;
 
 	ret = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-				 kpad->dat_out[bank]);
+			    kpad->dat_out[bank]);
 	if (ret)
 		goto out_unlock;
 
-	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank,
-				 kpad->dir[bank]);
+	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
 
 out_unlock:
 	mutex_unlock(&kpad->gpio_lock);
@@ -519,7 +518,7 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5588_read(kpad->client, Key_EVENTA + i);
+		int key = adp5588_read(kpad->client, KEY_EVENTA + i);
 		int key_val = key & KEY_EV_MASK;
 		int key_press = key & KEY_EV_PRESSED;
 
@@ -619,21 +618,20 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
 	}
 
 	for (i = 0; i < KEYP_MAX_EVENT; i++) {
-		ret = adp5588_read(client, Key_EVENTA);
+		ret = adp5588_read(client, KEY_EVENTA);
 		if (ret)
 			return ret;
 	}
 
 	ret = adp5588_write(client, INT_STAT,
-				ADP5588_CMP2_INT | ADP5588_CMP1_INT |
-				ADP5588_OVR_FLOW_INT | ADP5588_K_LCK_INT |
-				ADP5588_GPI_INT | ADP5588_KE_INT); /* Status is W1C */
+			    ADP5588_CMP2_INT | ADP5588_CMP1_INT |
+			    ADP5588_OVR_FLOW_INT | ADP5588_K_LCK_INT |
+			    ADP5588_GPI_INT | ADP5588_KE_INT); /* Status is W1C */
 	if (ret)
 		return ret;
 
 	return adp5588_write(client, CFG, ADP5588_INT_CFG |
-					  ADP5588_OVR_FLOW_IEN |
-					  ADP5588_KE_IEN);
+			     ADP5588_OVR_FLOW_IEN | ADP5588_KE_IEN);
 }
 
 static int adp5588_fw_parse(struct adp5588_kpad *kpad)
@@ -717,7 +715,7 @@ static int adp5588_probe(struct i2c_client *client,
 	int error;
 
 	if (!i2c_check_functionality(client->adapter,
-					I2C_FUNC_SMBUS_BYTE_DATA)) {
+				     I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
 		return -EIO;
 	}
@@ -741,7 +739,7 @@ static int adp5588_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	revid = (u8) ret & ADP5588_DEVICE_ID_MASK;
+	revid = ret & ADP5588_DEVICE_ID_MASK;
 	if (WA_DELAYED_READOUT_REVID(revid))
 		kpad->delay = msecs_to_jiffies(WA_DELAYED_READOUT_TIME);
 
-- 
2.37.1


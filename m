Return-Path: <linux-input+bounces-6954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53498BE0C
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AF421C21B03
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667421C6885;
	Tue,  1 Oct 2024 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rs1TGtfd"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B711C3F1A;
	Tue,  1 Oct 2024 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789881; cv=none; b=pEKKC0vrv8n6FTRRqrOSKPb3SsBzZOeYCA8+S52x3ham26Z+FqukKyllXKBFZ81lov5QroS5hHVhP89jHtRYOse8rDG4yzDn+BCU3x6vzxnXnlnQnl8Yv1q5WTkiUPm5NEyfF9aS9OKa7/JQztX/c4mfglDpgn/ZogH/JbpKg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789881; c=relaxed/simple;
	bh=7TTYuqO17oZlNM1nMSd+ANb7POTG7aLCyk3jXnDqrg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eq86+CrSJtWJX3qYovLzHQxHKDEL7oaVyQmPGwwXpPkNixZku96AMbSQDAhV9E9NNW99P5E3+SOPZ6OX7RrseZrLmgwDYvTsjgmdLA2+EPePo4ifZe2nVwCMstWGLn+iIdcK9KDmZY+O1gJPNCShdvIVT2XwBwnRjAug8CvUQVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rs1TGtfd; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491Bmdj0017079;
	Tue, 1 Oct 2024 09:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gMIuj
	xJoN4ST0JeSvUe9uXOQVlehZezzkAMHBRDE1IU=; b=rs1TGtfdG6LVlXrozNuHh
	1IowRCzJuB/roYpLVdHHPypwwAmnlepCx3UuWBZ0ZUriKc+sQa7qm0dMzPLd/v0l
	2O+HUucZySZ8WEvLTY3hfqZUaBYhXMhDVXtWPrdboxk0E7iL26yYIbAXKSEnxzVT
	ATOnI3zW+LzoohHyvTr+y2iefNH/k3vglbn9eGLBT+R2Em1+pNLKWbwgUxh9F/2n
	a93eZASsCzYjYd9SOgegqNV15UN6Wi9KQDsThtkmXWYYKOOi3VsPba92kl3YU+CX
	dKEqusTbPnzZ7UxTXzOH+bbecbvQM4LyCy5SW8SfZu6IjM2yyBcJIVcSl7DKKPrq
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:53 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491DbqCZ054565
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:52 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:51 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:51 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:51 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeS022143;
	Tue, 1 Oct 2024 09:37:46 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:40 +0200
Subject: [PATCH 09/13] Input: adp5589-keys: refactor adp5589_read()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-9-fca0149dfc47@analog.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mike Frysinger
	<vapier@gentoo.org>, Dmitry Torokhov <dtor@mail.ru>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=6121;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=7TTYuqO17oZlNM1nMSd+ANb7POTG7aLCyk3jXnDqrg8=;
 b=ySs2Ofy6RkPzHlZZjT5I1HfFdJ/v51AVsoD/xE73/1LixW6FQt8khL5rQagdsiG5gkHxjegGR
 OByxfb3ZkJTCcW61WKZjTdpiEyCRtHNNmh7tUX+1kBQmizAzBU/EFf7
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: d4U0cnljUlaiy98cw7VhwfrqGZwBvZ8v
X-Proofpoint-ORIG-GUID: d4U0cnljUlaiy98cw7VhwfrqGZwBvZ8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

adp5589_read() now either returns 0 or an error code. The value to read
is passed as an argument to the function. Therefore we don't mix
register values with error codes.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 94 ++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 622ff442b378768aca7c1da81f7cc38516c7806c..103a290c5f9f5407253960bbc44566b115789dfc 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -398,14 +398,17 @@ static const struct adp_constants const_adp5585 = {
 	.reg			= adp5585_reg,
 };
 
-static int adp5589_read(struct i2c_client *client, u8 reg)
+static int adp5589_read(struct i2c_client *client, u8 reg, u8 *val)
 {
 	int ret = i2c_smbus_read_byte_data(client, reg);
 
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(&client->dev, "Read Error\n");
+		return ret;
+	}
 
-	return ret;
+	*val = ret;
+	return 0;
 }
 
 static int adp5589_write(struct i2c_client *client, u8 reg, u8 val)
@@ -418,16 +421,18 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
-	int val;
+	int error;
+	u8 val;
 
 	guard(mutex)(&kpad->gpio_lock);
 	if (kpad->dir[bank] & bit)
 		return !!(kpad->dat_out[bank] & bit);
 
-	val = adp5589_read(kpad->client,
-			   kpad->info->var->reg(ADP5589_GPI_STATUS_A) + bank);
-	if (val < 0)
-		return val;
+	error = adp5589_read(kpad->client,
+			     kpad->info->var->reg(ADP5589_GPI_STATUS_A) + bank,
+			     &val);
+	if (error)
+		return error;
 
 	return !!(val & bit);
 }
@@ -721,28 +726,31 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 		return error;
 
 	for (i = 0; i <= kpad->info->var->bank(kpad->info->var->maxgpio); i++) {
-		kpad->dat_out[i] = adp5589_read(kpad->client,
-						kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) + i);
-		if (kpad->dat_out[i] < 0)
-			return kpad->dat_out[i];
+		error = adp5589_read(kpad->client,
+				     kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) + i,
+				     &kpad->dat_out[i]);
+		if (error)
+			return error;
 
-		kpad->dir[i] = adp5589_read(kpad->client,
-					    kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + i);
-		if (kpad->dir[i] < 0)
-			return kpad->dir[i];
+		error = adp5589_read(kpad->client,
+				     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + i,
+				     &kpad->dir[i]);
+		if (error)
+			return error;
 
-		kpad->debounce_dis[i] = adp5589_read(kpad->client,
-						     kpad->info->var->reg(ADP5589_DEBOUNCE_DIS_A)
-						     + i);
-		if (kpad->debounce_dis[i] < 0)
-			return kpad->debounce_dis[i];
+		error = adp5589_read(kpad->client,
+				     kpad->info->var->reg(ADP5589_DEBOUNCE_DIS_A) + i,
+				     &kpad->debounce_dis[i]);
+		if (error)
+			return error;
 	}
 
 	for (i = 0; i < kpad->info->rpull_banks; i++) {
-		kpad->rpull[i] = adp5589_read(kpad->client,
-					      kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + i);
-		if (kpad->rpull[i] < 0)
-			return kpad->rpull[i];
+		error = adp5589_read(kpad->client,
+				     kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + i,
+				     &kpad->rpull[i]);
+		if (error)
+			return error;
 	}
 
 	return 0;
@@ -805,10 +813,11 @@ static void adp5589_report_events(struct adp5589_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key, key_val, key_press;
+		u8 key, key_val, key_press;
+		int error;
 
-		key = adp5589_read(kpad->client, ADP5589_5_FIFO_1 + i);
-		if (key < 0)
+		error = adp5589_read(kpad->client, ADP5589_5_FIFO_1 + i, &key);
+		if (error)
 			return;
 
 		key_val = key & KEY_EV_MASK;
@@ -837,21 +846,22 @@ static irqreturn_t adp5589_irq(int irq, void *handle)
 {
 	struct adp5589_kpad *kpad = handle;
 	struct i2c_client *client = kpad->client;
-	int status, ev_cnt;
+	u8 status, ev_cnt;
+	int error;
 
-	status = adp5589_read(client, ADP5589_5_INT_STATUS);
-	if (status < 0)
+	error = adp5589_read(client, ADP5589_5_INT_STATUS, &status);
+	if (error)
 		return IRQ_HANDLED;
 
 	if (status & OVRFLOW_INT)	/* Unlikely and should never happen */
 		dev_err(&client->dev, "Event Overflow Error\n");
 
 	if (status & EVENT_INT) {
-		ev_cnt = adp5589_read(client, ADP5589_5_STATUS) & KEC;
-		if (ev_cnt <= 0)
+		error = adp5589_read(client, ADP5589_5_STATUS, &ev_cnt);
+		if (error || !(ev_cnt & KEC))
 			goto out_irq;
 
-		adp5589_report_events(kpad, ev_cnt);
+		adp5589_report_events(kpad, ev_cnt & KEC);
 		input_sync(kpad->input);
 	}
 
@@ -866,6 +876,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	struct i2c_client *client = kpad->client;
 	u8 (*reg)(u8) = kpad->info->var->reg;
 	int i, ret;
+	u8 dummy;
 
 	ret = adp5589_write(client, reg(ADP5589_PIN_CONFIG_A),
 			    kpad->keypad_en_mask);
@@ -904,8 +915,8 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	}
 
 	for (i = 0; i < KEYP_MAX_EVENT; i++) {
-		ret = adp5589_read(client, ADP5589_5_FIFO_1 + i);
-		if (ret < 0)
+		ret = adp5589_read(client, ADP5589_5_FIFO_1 + i, &dummy);
+		if (ret)
 			return ret;
 	}
 
@@ -1456,7 +1467,8 @@ static int adp5589_probe(struct i2c_client *client)
 {
 	struct adp5589_kpad *kpad;
 	unsigned int revid;
-	int error, ret;
+	int error;
+	u8 id;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA)) {
@@ -1479,11 +1491,11 @@ static int adp5589_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	ret = adp5589_read(client, ADP5589_5_ID);
-	if (ret < 0)
-		return ret;
+	error = adp5589_read(client, ADP5589_5_ID, &id);
+	if (error)
+		return error;
 
-	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
+	revid = id & ADP5589_5_DEVICE_ID_MASK;
 
 	error = adp5589_keypad_add(kpad, revid);
 	if (error)

-- 
2.46.1



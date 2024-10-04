Return-Path: <linux-input+bounces-7079-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D06399904BF
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 15:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029FC1C21138
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1EF212EF1;
	Fri,  4 Oct 2024 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlmHvPb+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7E212EED
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049617; cv=none; b=hMvSzV/2CvKRCp8YbZGVXNUnyHfz3Ya0o31q0s+a0HUXRVCtin+bXmb4KseEGI+2TvRtcclgr3qcuMAEBtfI0muR2ojGJ8CYYXArqBLq/BE69ItprMEPDXq8RJi7X3SUUDD9f7DgudhW8ynqyU+SSsLSkaE9d5jUPKQkDD06Ncw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049617; c=relaxed/simple;
	bh=TQdzT5fj4fjsb2m8teEep4deAsU9fDFo0MkGzTSzU98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rr0cMvE/zG/88Jb7P34MXw+tIM/1K53SvitAxaSc5QVhxC+T/EOWhNFRFXPnBQP1nejqvL5yzemLoUI706flc/R1rTVnEytANGhKeUPmORaNWCq4N18Xs1w5EaboxQPkksSk7zBcj4GMRfE0pxf/R7gTwoD9v2kIHHikJF4waEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlmHvPb+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B617AC4CEC7;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728049616;
	bh=TQdzT5fj4fjsb2m8teEep4deAsU9fDFo0MkGzTSzU98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KlmHvPb+EJDaj1y+5j0FbhA71QtFcK+L88dlKmMbrwxE9m0GvkykYHjnmlymdLxPX
	 19v3ajKmgZjmhstfVxaSMjgIb6KZFuQ/+pwkbIgCwEgw4QYZqoFwqpwZH+IhGChwOz
	 STkaPcX0W+dtsUfsEJcAXvYhptAwB1Zu1+yzKHXS8aY8b3rJW4+mQsvHkk17Ujc+0y
	 2Ryz7qCJKAfxTgD6ljOkCxJUxB6OVYzkJb3+1GHu8kD7X4hgt7VFlivxfCKkELglvq
	 dsK6+3tzsQrdCBu3zmHSGohrViMI4XQam5SY0x7OneN9k/J6rHvnA30S769m7ddDo/
	 24dC+eCwIArCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D4ACFA775;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 04 Oct 2024 15:46:50 +0200
Subject: [PATCH v2 1/3] Input: adp5588-keys: bail on returned error
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-fix-adp5588-read-refactor-v2-1-275a093758ae@analog.com>
References: <20241004-fix-adp5588-read-refactor-v2-0-275a093758ae@analog.com>
In-Reply-To: <20241004-fix-adp5588-read-refactor-v2-0-275a093758ae@analog.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728049615; l=5780;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=r9TnP/wtMiKjVNaniVP8bwQshEJ/XoHAR/uMSqI/NPU=;
 b=H+p3w+hWRJutVKmRAEmUQrPdCVdGSIULKIFYhn88kmLnJujnm+oWAvXNQgiaf9xZildevoG+6
 d7rc+V9WtsUCUNAo3hRQiFQV5kbyX2x4CnvKy7HCdSc8oPB5MZlrJSk
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

Bail out in case adp5588_read() return an error code. Not doing so is
asking for problems. In order to making it easier (as some values we
want to read are unsigned), adp5588_read() now either returns 0 or an
error code and the value to read is passed as an argument to the
function.

While at it, did a small refactor in adp5588_gpio_get_value() to make it
easier to handle checking the return value.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 84 +++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index d25d63a807f23..11a70ee184825 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -200,14 +200,17 @@ struct adp5588_kpad {
 	u8 pull_dis[3];
 };
 
-static int adp5588_read(struct i2c_client *client, u8 reg)
+static int adp5588_read(struct i2c_client *client, u8 reg, u8 *val)
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
 
 static int adp5588_write(struct i2c_client *client, u8 reg, u8 val)
@@ -220,14 +223,17 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
-	int val;
+	int error;
+	u8 val;
 
 	guard(mutex)(&kpad->gpio_lock);
 
 	if (kpad->dir[bank] & bit)
-		val = kpad->dat_out[bank];
-	else
-		val = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
+		return !!(kpad->dat_out[bank] & bit);
+
+	error = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank, &val);
+	if (error)
+		return error;
 
 	return !!(val & bit);
 }
@@ -453,10 +459,20 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	}
 
 	for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
-		kpad->dat_out[i] = adp5588_read(kpad->client,
-						GPIO_DAT_OUT1 + i);
-		kpad->dir[i] = adp5588_read(kpad->client, GPIO_DIR1 + i);
-		kpad->pull_dis[i] = adp5588_read(kpad->client, GPIO_PULL1 + i);
+		error = adp5588_read(kpad->client,
+				     GPIO_DAT_OUT1 + i, &kpad->dat_out[i]);
+		if (error)
+			return error;
+
+		error = adp5588_read(kpad->client, GPIO_DIR1 + i,
+				     &kpad->dir[i]);
+		if (error)
+			return error;
+
+		error = adp5588_read(kpad->client, GPIO_PULL1 + i,
+				     &kpad->pull_dis[i]);
+		if (error)
+			return error;
 	}
 
 	return 0;
@@ -519,9 +535,15 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5588_read(kpad->client, KEY_EVENTA + i);
-		int key_val = key & KEY_EV_MASK;
-		int key_press = key & KEY_EV_PRESSED;
+		u8 key, key_val, key_press;
+		int error;
+
+		error = adp5588_read(kpad->client, KEY_EVENTA + i, &key);
+		if (error)
+			return;
+
+		key_val = key & KEY_EV_MASK;
+		key_press = key & KEY_EV_PRESSED;
 
 		if (key_val >= GPI_PIN_BASE && key_val <= GPI_PIN_END) {
 			/* gpio line used as IRQ source */
@@ -556,7 +578,8 @@ static irqreturn_t adp5588_thread_irq(int irq, void *handle)
 	struct i2c_client *client = kpad->client;
 	ktime_t target_time, now;
 	unsigned long delay;
-	int status, ev_cnt;
+	u8 status, ev_cnt;
+	int error;
 
 	/*
 	 * Readout needs to wait for at least 25ms after the notification
@@ -571,19 +594,23 @@ static irqreturn_t adp5588_thread_irq(int irq, void *handle)
 		}
 	}
 
-	status = adp5588_read(client, INT_STAT);
+	error = adp5588_read(client, INT_STAT, &status);
+	if (error)
+		return IRQ_HANDLED;
 
 	if (status & ADP5588_OVR_FLOW_INT)	/* Unlikely and should never happen */
 		dev_err(&client->dev, "Event Overflow Error\n");
 
 	if (status & ADP5588_KE_INT) {
-		ev_cnt = adp5588_read(client, KEY_LCK_EC_STAT) & ADP5588_KEC;
-		if (ev_cnt) {
-			adp5588_report_events(kpad, ev_cnt);
-			input_sync(kpad->input);
-		}
+		error = adp5588_read(client, KEY_LCK_EC_STAT, &ev_cnt);
+		if (error || !(ev_cnt & ADP5588_KEC))
+			goto out_irq;
+
+		adp5588_report_events(kpad, ev_cnt & ADP5588_KEC);
+		input_sync(kpad->input);
 	}
 
+out_irq:
 	adp5588_write(client, INT_STAT, status); /* Status is W1C */
 
 	return IRQ_HANDLED;
@@ -593,6 +620,7 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
 {
 	struct i2c_client *client = kpad->client;
 	int i, ret;
+	u8 dummy;
 
 	ret = adp5588_write(client, KP_GPIO1, KP_SEL(kpad->rows));
 	if (ret)
@@ -619,8 +647,8 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
 	}
 
 	for (i = 0; i < KEYP_MAX_EVENT; i++) {
-		ret = adp5588_read(client, KEY_EVENTA);
-		if (ret < 0)
+		ret = adp5588_read(client, KEY_EVENTA, &dummy);
+		if (ret)
 			return ret;
 	}
 
@@ -724,8 +752,8 @@ static int adp5588_probe(struct i2c_client *client)
 	struct input_dev *input;
 	struct gpio_desc *gpio;
 	unsigned int revid;
-	int ret;
 	int error;
+	u8 id;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA)) {
@@ -762,11 +790,11 @@ static int adp5588_probe(struct i2c_client *client)
 		fsleep(60);
 	}
 
-	ret = adp5588_read(client, DEV_ID);
-	if (ret < 0)
-		return ret;
+	error = adp5588_read(client, DEV_ID, &id);
+	if (error)
+		return error;
 
-	revid = ret & ADP5588_DEVICE_ID_MASK;
+	revid = id & ADP5588_DEVICE_ID_MASK;
 	if (WA_DELAYED_READOUT_REVID(revid))
 		kpad->delay = msecs_to_jiffies(WA_DELAYED_READOUT_TIME);
 

-- 
2.46.1




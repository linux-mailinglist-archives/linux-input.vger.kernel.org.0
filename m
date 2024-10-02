Return-Path: <linux-input+bounces-7009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC498D1BA
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12AC4286B9D
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B771EC000;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FS34rcGe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813941E7672
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866312; cv=none; b=NiQdJkmL9R/P2nisszBdkWiF8L7a5m99mCV5VQzP+xCQ/GvSP4rOvjqghbeMBkVbnR6vkwf+z6Hq269JSPEWjlYmbwuVUrSsU29PL5hDdsSOb7tu1+btq0dZ7N7P938o4jb9YIIZTNT0hC4SzJqSsk4HbE/ADIFjHn20Uc/6bME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866312; c=relaxed/simple;
	bh=42G0y/9jzNMexvGRK5gYVw6l13H/cI37/yjOu66j624=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lS3U1gctpGKWj0glI5SN22jZQs5L2c/vdpe88mg9KRNbQowqvoe7aO4KphJdr3Mt0UxYw8LX7DgvvxjxrrCtIf4w30xLt/rYTJQ0DwC73aVEIChTEghU5dM4GHEthJuS+M5F5iC5Cy/m9BxwAQSY0BMreZanT5EGk1TSeRwirAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FS34rcGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35FB1C4CECE;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866312;
	bh=42G0y/9jzNMexvGRK5gYVw6l13H/cI37/yjOu66j624=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FS34rcGe1oYPwZAuT49yJ2pJ2GUwpveV9JTG/iR1cKkjNklEk7I6MX3iVoTivFpOz
	 0vFwjbpPZ5O9w7DJB+IfMNqovrX4GdHMALk97bd5l2HUuYYpSLZ8YIdweoVVkZO60a
	 6SHh9eqrqCbewN81lmDA3x+LIi44mpFp8Gg7towr41UrayFyALmJPWuxjy79cXYjtF
	 ZcypTY6GU9pfqRORkJrwEbrBJKzPrgQ1eh4aynWSR11CRZFjanlJAI7RznhnO5IpW9
	 YzJ5QBXtLGJm0P0I2uY+YJgblV0VQpieLKh7XOhRb89lF0eywfqg3I/eAyqKNw3n0o
	 Qu4id5PmnB7dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE94CF31B4;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 02 Oct 2024 12:51:51 +0200
Subject: [PATCH 2/4] Input: adp5588-keys: refactor adp5589_read()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-fix-adp5588-read-refactor-v1-2-28800f1b9773@analog.com>
References: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
In-Reply-To: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727866310; l=5418;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=iHBBKizUY4muCV5YApLvONvBlERTpRBTGQjSMr4hebU=;
 b=syX5Hhj2jn9i5xtdIAlhG5Wakqy6dnfHTAQWop80TdFr6Vx5cGUtvyReOfMQ3JkiHN84BlWFy
 FxHlcIMiOFdBxTc+AziRRZFldzqzouugG+p54KtqAlEvoaiGgECPSeU
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

adp5588_read() now either returns 0 or an error code. The value to read
is passed as an argument to the function. Therefore we don't mix
register values with error codes.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 75 ++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 9ac68baf0117..11a70ee18482 100644
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
@@ -220,16 +223,17 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
-	int val;
+	int error;
+	u8 val;
 
 	guard(mutex)(&kpad->gpio_lock);
 
 	if (kpad->dir[bank] & bit)
 		return !!(kpad->dat_out[bank] & bit);
 
-	val = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
-	if (val < 0)
-		return val;
+	error = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank, &val);
+	if (error)
+		return error;
 
 	return !!(val & bit);
 }
@@ -455,18 +459,20 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	}
 
 	for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
-		kpad->dat_out[i] = adp5588_read(kpad->client,
-						GPIO_DAT_OUT1 + i);
-		if (kpad->dat_out[i] < 0)
-			return kpad->dat_out[i];
+		error = adp5588_read(kpad->client,
+				     GPIO_DAT_OUT1 + i, &kpad->dat_out[i]);
+		if (error)
+			return error;
 
-		kpad->dir[i] = adp5588_read(kpad->client, GPIO_DIR1 + i);
-		if (kpad->dir[i] < 0)
-			return kpad->dir[i];
+		error = adp5588_read(kpad->client, GPIO_DIR1 + i,
+				     &kpad->dir[i]);
+		if (error)
+			return error;
 
-		kpad->pull_dis[i] = adp5588_read(kpad->client, GPIO_PULL1 + i);
-		if (kpad->pull_dis[i] < 0)
-			return kpad->pull_dis[i];
+		error = adp5588_read(kpad->client, GPIO_PULL1 + i,
+				     &kpad->pull_dis[i]);
+		if (error)
+			return error;
 	}
 
 	return 0;
@@ -529,10 +535,11 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key, key_val, key_press;
+		u8 key, key_val, key_press;
+		int error;
 
-		key = adp5588_read(kpad->client, KEY_EVENTA + i);
-		if (key < 0)
+		error = adp5588_read(kpad->client, KEY_EVENTA + i, &key);
+		if (error)
 			return;
 
 		key_val = key & KEY_EV_MASK;
@@ -571,7 +578,8 @@ static irqreturn_t adp5588_thread_irq(int irq, void *handle)
 	struct i2c_client *client = kpad->client;
 	ktime_t target_time, now;
 	unsigned long delay;
-	int status, ev_cnt;
+	u8 status, ev_cnt;
+	int error;
 
 	/*
 	 * Readout needs to wait for at least 25ms after the notification
@@ -586,19 +594,19 @@ static irqreturn_t adp5588_thread_irq(int irq, void *handle)
 		}
 	}
 
-	status = adp5588_read(client, INT_STAT);
-	if (status < 0)
+	error = adp5588_read(client, INT_STAT, &status);
+	if (error)
 		return IRQ_HANDLED;
 
 	if (status & ADP5588_OVR_FLOW_INT)	/* Unlikely and should never happen */
 		dev_err(&client->dev, "Event Overflow Error\n");
 
 	if (status & ADP5588_KE_INT) {
-		ev_cnt = adp5588_read(client, KEY_LCK_EC_STAT) & ADP5588_KEC;
-		if (ev_cnt <= 0)
+		error = adp5588_read(client, KEY_LCK_EC_STAT, &ev_cnt);
+		if (error || !(ev_cnt & ADP5588_KEC))
 			goto out_irq;
 
-		adp5588_report_events(kpad, ev_cnt);
+		adp5588_report_events(kpad, ev_cnt & ADP5588_KEC);
 		input_sync(kpad->input);
 	}
 
@@ -612,6 +620,7 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
 {
 	struct i2c_client *client = kpad->client;
 	int i, ret;
+	u8 dummy;
 
 	ret = adp5588_write(client, KP_GPIO1, KP_SEL(kpad->rows));
 	if (ret)
@@ -638,8 +647,8 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
 	}
 
 	for (i = 0; i < KEYP_MAX_EVENT; i++) {
-		ret = adp5588_read(client, KEY_EVENTA);
-		if (ret < 0)
+		ret = adp5588_read(client, KEY_EVENTA, &dummy);
+		if (ret)
 			return ret;
 	}
 
@@ -743,8 +752,8 @@ static int adp5588_probe(struct i2c_client *client)
 	struct input_dev *input;
 	struct gpio_desc *gpio;
 	unsigned int revid;
-	int ret;
 	int error;
+	u8 id;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA)) {
@@ -781,11 +790,11 @@ static int adp5588_probe(struct i2c_client *client)
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




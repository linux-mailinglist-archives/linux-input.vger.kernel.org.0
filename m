Return-Path: <linux-input+bounces-7007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4F98D1B8
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 416381C21E93
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9FF1EBFFB;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5mAml65"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769991E766B
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866312; cv=none; b=jiZ5QuFBr+CEDhACkdaL7Yqq3ntADQnRVdwBEWnKhAZh5pGxKt8ePqExxP2lhO9jBbcSlzWbWZEm+VgRWB0AT84YSZLBEZ2i7sPCPoF3vTrkSK8gs8yibvsuqCNLwsf1R8bKTHSKhel7q3u4BpSYPP1BDpn6Ybnf5amnFgX4FiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866312; c=relaxed/simple;
	bh=pJPrbC14shf1WTb0cyWwI1A8LE5gcJao3AirjxVPZG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9qifI2/3vVazF8gDWUOY2eUmHvdjzdO19gIJ+Q0WsoMJkQNV3B1afGGPhFvxTI/i0jZUbVGpj7vP0pr53MgTiyVdl5STj/5JGpjz3uNSPwE1UL0o1RTN/52hvEFb0SgSEs7kU6Zo2wsqp5Hq0RnEtZlLv4S+lxrVFKx8Nk97IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5mAml65; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29818C4CECD;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866312;
	bh=pJPrbC14shf1WTb0cyWwI1A8LE5gcJao3AirjxVPZG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O5mAml65q62FC6SQIyGRXM/lklY2veXiL5VE3KNnTptRXOowTL8yNLwV4nS5u1V62
	 XosPBBhSXw5bSwuZsOtBZOq01QZd8T/0kXg26m/8M8teD9LJaEerV4w0xoSxVy+kw+
	 As2L8pKYHuN7k7uIfb8lOj7KiTNF98jb54zPycruguvvn/Ye0uqCNfTgB0XpaGzJMk
	 WuAs/tXjt+hapenV738hBOCSMRGoqEN4nI9gLx7OfAnAa4p+ywXKjfN5U6ktxBoa1o
	 yS8bWSWM5l3Ikh4z372LLiiipAEHJCN8GdzKFtTGQzV3kf+NRvqJdwRJxNGd0HNskE
	 jIgkMFJirkC6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20804CF31B0;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 02 Oct 2024 12:51:50 +0200
Subject: [PATCH 1/4] Input: adp5588-keys: bail on returned error
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-fix-adp5588-read-refactor-v1-1-28800f1b9773@analog.com>
References: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
In-Reply-To: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727866310; l=2989;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=jihJnS6nvrxqMZA4GxnLZ7/1dJtPOBtIIDbrJ2sgXYM=;
 b=R0Gw0ynVFWoLMgJefki/YQEbnRkpj5qd6N+tmElPN6xpCVIgkqkPJgW+0O4YHDVFlrxqQm7Ii
 xJpdYC2xbhfDK3TmwLSfJc2YulsAXwLFNNod6KAZFT7MAMJLTLH10Gk
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

Bail out in case adp5588_read() return an error code. Not doing so is
asking for problems.

While at it, did a small refactor in adp5588_gpio_get_value() to make it
easier to handle checking the return value.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 39 ++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index d25d63a807f23..9ac68baf01179 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -225,9 +225,11 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	guard(mutex)(&kpad->gpio_lock);
 
 	if (kpad->dir[bank] & bit)
-		val = kpad->dat_out[bank];
-	else
-		val = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
+		return !!(kpad->dat_out[bank] & bit);
+
+	val = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
+	if (val < 0)
+		return val;
 
 	return !!(val & bit);
 }
@@ -455,8 +457,16 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
 		kpad->dat_out[i] = adp5588_read(kpad->client,
 						GPIO_DAT_OUT1 + i);
+		if (kpad->dat_out[i] < 0)
+			return kpad->dat_out[i];
+
 		kpad->dir[i] = adp5588_read(kpad->client, GPIO_DIR1 + i);
+		if (kpad->dir[i] < 0)
+			return kpad->dir[i];
+
 		kpad->pull_dis[i] = adp5588_read(kpad->client, GPIO_PULL1 + i);
+		if (kpad->pull_dis[i] < 0)
+			return kpad->pull_dis[i];
 	}
 
 	return 0;
@@ -519,9 +529,14 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5588_read(kpad->client, KEY_EVENTA + i);
-		int key_val = key & KEY_EV_MASK;
-		int key_press = key & KEY_EV_PRESSED;
+		int key, key_val, key_press;
+
+		key = adp5588_read(kpad->client, KEY_EVENTA + i);
+		if (key < 0)
+			return;
+
+		key_val = key & KEY_EV_MASK;
+		key_press = key & KEY_EV_PRESSED;
 
 		if (key_val >= GPI_PIN_BASE && key_val <= GPI_PIN_END) {
 			/* gpio line used as IRQ source */
@@ -572,18 +587,22 @@ static irqreturn_t adp5588_thread_irq(int irq, void *handle)
 	}
 
 	status = adp5588_read(client, INT_STAT);
+	if (status < 0)
+		return IRQ_HANDLED;
 
 	if (status & ADP5588_OVR_FLOW_INT)	/* Unlikely and should never happen */
 		dev_err(&client->dev, "Event Overflow Error\n");
 
 	if (status & ADP5588_KE_INT) {
 		ev_cnt = adp5588_read(client, KEY_LCK_EC_STAT) & ADP5588_KEC;
-		if (ev_cnt) {
-			adp5588_report_events(kpad, ev_cnt);
-			input_sync(kpad->input);
-		}
+		if (ev_cnt <= 0)
+			goto out_irq;
+
+		adp5588_report_events(kpad, ev_cnt);
+		input_sync(kpad->input);
 	}
 
+out_irq:
 	adp5588_write(client, INT_STAT, status); /* Status is W1C */
 
 	return IRQ_HANDLED;

-- 
2.46.1




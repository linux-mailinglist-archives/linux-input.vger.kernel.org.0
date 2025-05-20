Return-Path: <linux-input+bounces-12473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C16ABD67F
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 13:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33CF9189589A
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 11:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610B327FB24;
	Tue, 20 May 2025 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="ZgdtAX1w"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7226FA76;
	Tue, 20 May 2025 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739651; cv=none; b=Qyec+sTJwWv0w4hTEQi6heZ9DeLG4bANwZWAJjGn2wGfsxXa75GKvSaQH+LTwzbGuN6QwU3OqiOcTej0ju84ttlDhf0RWzWDY+ZmKbHqDDM3263vHljEA1TtMiH55nv5j9rXNBmuiWr5fbRIB18z96Cp3NMneoNWCygJBOi5qo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739651; c=relaxed/simple;
	bh=DtsMp2CAqHPAgA60fbL5H/vFNEiZrHHq+hY6Cc2J4TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzzNHOXJo58YHkwXmWy9DktWTbGUNRQM6ml3gCJD8Ix52zRyMO7LKhJywkHI9whOSPYRY2RhBTPQ5tpVC8xVlKVOPTIGYSbZA8wCD9092Gn0U3GhL+ESt5BLEWH1ofzKFpfrapEapNFtHqTrxEP1DDJCi78gNOe8IXmU3p90XzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=ZgdtAX1w; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1747739645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLATSaJYUKOamk1aDdn8PphQ+N5iG0C9jge0QKa6WiQ=;
	b=ZgdtAX1wwI3qErq5VYfvAPXJ5F76oDOj0rfjKsdvy+bmO2T1qpTdnv1OUXHKsjVApJGjPo
	jidaNbFl4bfVt/gJsL3O5esHAQrD+/NVXmL1POGamNkh98yz/PGlKrupLgMqikUBOJ7a33
	nBoBLmL8oeGpyANVKjnmehSKROxRMXo=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] Input: adp5588-keys - Prevent buffer overflow
Date: Tue, 20 May 2025 14:13:58 +0300
Message-ID: <20250520111404.1346071-3-arefev@swemel.ru>
In-Reply-To: <20250520111404.1346071-1-arefev@swemel.ru>
References: <20250520111404.1346071-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the value of 'key_val' is less than 1 or greater than 80,
a buffer overflow may occur.

Add a check for valid values 'key_val'.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 69a4af606ed4 ("Input: adp5588-keys - support GPI events for ADP5588 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
V1 -> V2:
Added tag Fixes

 drivers/input/keyboard/adp5588-keys.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 13136f863270..91f00d6e2413 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -164,6 +164,9 @@
 #define KEY_EV_PRESSED		BIT(7)
 #define KEY_EV_MASK		GENMASK(6, 0)
 
+#define KEY_EVENT_MIN		1
+#define KEY_EVENT_MAX		80
+
 #define KP_SEL(x)		(BIT(x) - 1)	/* 2^x-1 */
 
 #define KEYP_MAX_EVENT		10
@@ -531,7 +534,7 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 		if (key_val >= GPI_PIN_BASE && key_val <= GPI_PIN_END) {
 			/* gpio line used as IRQ source */
 			adp5588_gpio_irq_handle(kpad, key_val, key_press);
-		} else {
+		} else if (key_val >= KEY_EVENT_MIN && key_val <= KEY_EVENT_MAX) {
 			int row = (key_val - 1) / ADP5588_COLS_MAX;
 			int col =  (key_val - 1) % ADP5588_COLS_MAX;
 			int code = MATRIX_SCAN_CODE(row, col, kpad->row_shift);
@@ -542,6 +545,8 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 
 			input_report_key(kpad->input,
 					 kpad->keycode[code], key_press);
+		} else {
+			dev_err_ratelimited(&kpad->client->dev, "invalid report key value %d", key);
 		}
 	}
 }
-- 
2.43.0



Return-Path: <linux-input+bounces-12391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3969AB9E04
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 15:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30023B1876
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 13:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCEC14AD2B;
	Fri, 16 May 2025 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="C6BI6TcK"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421B72601;
	Fri, 16 May 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403555; cv=none; b=Ld3X6fvpuzttMAkmgi6267mnFH9g1v0WoJlVXS5qm6fR+eqFFqb36RxFQYoXryufzT8RY7stBZSr2EnylrtdUcfvXuYbCjenkZ58/Ega6+YGiw9yMNEDE1Ea8eM12CbawDsHYQ+YLYup+P5uC+v/NSk8QVpkw8GHmdYUU0GGyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403555; c=relaxed/simple;
	bh=93MfKOBFY/xp28aJL8ed8K9h0Fuwu8du2ZW66YDjtoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSXiLKLDGMJ9O5Lb0SXZmutX1ILuxr5dhsf96NgNmEM310KjeElDWhkWko4MM6WS++KnL2FqlEOOwSU8GaP+v7rPTMvOjNqiaUGKgZLFrnGHMfXeTgAmPLUPyAFd3BCf2/02qEPUIgD6Kjqjr2mE7fQwnNEBCAyRs82uFiJYhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=C6BI6TcK; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1747402994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJHoKRceF6EqRRHw5UR5TuoAwTc8C9bqZS0hDetWwo8=;
	b=C6BI6TcK/0Z4gz24ML3cwRKytqnJ0hYmIT1rxWCh0A1Rxf7FvqIH+MFs/JlUUCFsek5U3s
	YbrPbClSuCJZ/0JftqN6DZ5OmiTAneC+fWKjzZSwAODwgjAWlxc0rURZdNkpvjX/wCgpzI
	fISCMKmCa90cecZjvxginy2I5CJX4bM=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 2/2] Input: adp5588-keys Prevent buffer overflow
Date: Fri, 16 May 2025 16:43:04 +0300
Message-ID: <20250516134313.282564-3-arefev@swemel.ru>
In-Reply-To: <20250516134313.282564-1-arefev@swemel.ru>
References: <20250516134313.282564-1-arefev@swemel.ru>
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

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
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



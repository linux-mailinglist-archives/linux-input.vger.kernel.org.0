Return-Path: <linux-input+bounces-11381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80637A76392
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 11:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB2E1188727F
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D088B1D88A4;
	Mon, 31 Mar 2025 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="EQbFmIOz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A57E107;
	Mon, 31 Mar 2025 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414557; cv=none; b=JLw+Qp4jzRXibCm4P7fh4+n7crg+OAlTc4BUR+Id39DOv0BlTEqRkRBqJ9FSgEyA8rDWovIXiJWDTf4Gc57BAjaN30YfpF0gYLvnVRUTOLcRgMcTkwlOXDtptguzvBY6PezJZ40c2GuLsL1O8IixX9eTPsBi9ovogP+KwlrPDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414557; c=relaxed/simple;
	bh=ZSDobHLDeQniFI9cGo0w73JBwy1stD8x5yEAdBby6jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JGkQ9w/YXxaR0gbLGFlGfxlJL+j78uv68nnYgISy4nnbB3WKLfsSGD8QBCMAIbi8/0KbInmZVMMb9fejH2Awsqtpe83mYNs9UDKuC741V6JTMjQwVWSRNms+pszG/PmcxIOJy2E1xGhNlpvbX6PeI7VRwQ3j8uPeRXoCDHAY52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=EQbFmIOz; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1743414543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ty5s/dBTl3ZV4mH2v8vqQBCZlTfTYjyuubC67Hr4Ib8=;
	b=EQbFmIOzrdHWnufAqk8K5OViNEfAQaUDFQizT9XGCpHDfMmThS3rdl28Af1vx9ylj9YHZk
	h1DfZqAV9y86ost22xsJN9HkCbC3rPXrlrAh7oA8Vyi4a5S7YCMYmI1DkiXLLoQ6e5VY9n
	PoqcLX/Wvca+Um/6M73F+feQ1vbRZ+Y=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] Input: adp5588-keys Add check on return code
Date: Mon, 31 Mar 2025 12:49:02 +0300
Message-ID: <20250331094903.9145-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adp5588_read() function can return 0 or a negative value.
If the function returns 0 then a buffer overflow  occurs.
kpad->keycode[0 - 1].

If the function returns a negative value, then the array kpad->keycode
is accessed with an incorrectly calculated index.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/input/keyboard/adp5588-keys.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index dc734974ce06..e329320d4ae3 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -519,14 +519,19 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5588_read(kpad->client, KEY_EVENTA + i);
-		int key_val = key & KEY_EV_MASK;
-		int key_press = key & KEY_EV_PRESSED;
+		int key, key_val, key_press;
+
+		key = adp5588_read(kpad->client, KEY_EVENTA + i);
+		if (key < 0)
+			continue;
+
+		key_val = key & KEY_EV_MASK;
+		key_press = key & KEY_EV_PRESSED;
 
 		if (key_val >= GPI_PIN_BASE && key_val <= GPI_PIN_END) {
 			/* gpio line used as IRQ source */
 			adp5588_gpio_irq_handle(kpad, key_val, key_press);
-		} else {
+		} else if (key_val > 0) {
 			int row = (key_val - 1) / ADP5588_COLS_MAX;
 			int col =  (key_val - 1) % ADP5588_COLS_MAX;
 			int code = MATRIX_SCAN_CODE(row, col, kpad->row_shift);
-- 
2.43.0



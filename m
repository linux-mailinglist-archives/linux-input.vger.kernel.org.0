Return-Path: <linux-input+bounces-12472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F329FABD67E
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 13:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C3221BA3547
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 11:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C33A27AC4E;
	Tue, 20 May 2025 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="wxlGzFdy"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160FD27586D;
	Tue, 20 May 2025 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739651; cv=none; b=F/rLze225Dl0Nz2VGt+Q4Q0hS8WklmF+NI8fjSrUoN/Hcrx9Mo/07m993quhM5jSqoKo0fRqNB9H7b2XrLCxhsbqH70IceEoi4W//2ih4oET4Z4hPIxpClDPDBtnMBC+zMH/sQvg/fG1w2Uc5PqjGYiYDw1H75n+A+3IwPhWwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739651; c=relaxed/simple;
	bh=H2zYyCKEFC1gdpuxbPqLXotR11sCRrie5bfyYZlCQ2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcGWPmHlM1is3enidTP/g7abcC91P3VSZh2PpdcM5h8/uwQTRT3iFSYLTSbV9OWSKwEsQxVIAGqKy+qrPWe+sFnrk7X6tc3dnNl3N8rCtK02pyKXnyWOM0jMmHLoYmokrUWZbJFJSDQoq4aT2lL+L0DNvWlvoPqwfHiavA9J/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=wxlGzFdy; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1747739645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUwblmsHazoEp78aho7gvryVjUx9gR5cv4lS4+eKc64=;
	b=wxlGzFdyRmi2c0GmSPeJc34AxBGAICGIxqJQrw2EILpSGxzEi5ijTG/4tMxCKsbokPxTjI
	i7UE+pBVpLBMucFVq88mpxsmJzzNg7it5p8YkRQ5jaERCtACq3DRvTAx1HqpqW7akwqeL1
	2VsTwd8EMG5Yh3gxFf0rcaP6XJtDopY=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] Input: adp5588-keys - Add check on return code
Date: Tue, 20 May 2025 14:13:57 +0300
Message-ID: <20250520111404.1346071-2-arefev@swemel.ru>
In-Reply-To: <20250520111404.1346071-1-arefev@swemel.ru>
References: <20250520111404.1346071-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function 'adp5588_read()' can return a negative value, which after
calculations will be used as an index to access the array
'kpad->keycode'.

Add a check for the return value.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 69a4af606ed4 ("Input: adp5588-keys - support GPI events for ADP5588 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
V1 -> V2:
Added  tag Fixes
	
 drivers/input/keyboard/adp5588-keys.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index dc734974ce06..13136f863270 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -519,9 +519,14 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
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
-- 
2.43.0



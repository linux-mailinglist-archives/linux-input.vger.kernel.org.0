Return-Path: <linux-input+bounces-12389-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76EAB9DFF
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 15:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6E127B642E
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3A5823DE;
	Fri, 16 May 2025 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="XMcHMcQd"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B978F5E;
	Fri, 16 May 2025 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403554; cv=none; b=RRqjdmuF+lPS/IdvaZbn4GtGMqVy8srFBl19uXi7yHMb+An6XUH+QrT5zAvoBtT0trFTtypdB69qiVSp/sPDW4qQzEPrAkwM30LZLksySUDmT9z3nNDuKVKc5kVXxv9J44MNSaYnLnm1BYzsiF94y3rNhhP1EsAaVAEUQmZFb44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403554; c=relaxed/simple;
	bh=d9/NXXM1MUS98a9dC2cv1hPHz3wy9P+5UGnNYDRbIe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDfnu1w0WxiVs9+LuphX+8lnrg9oF/ephYGE2845ggNou581cQ2GIzHCXafUx7RRp1NYA7fDOAW8Dfv2YCgKVvrHo5ErISH0Vdq1k+xJddFHDIdPFG1nn21rrzmMHLuVNdnFcwudBDFx6O9Fyzn7Oy5B9BULYMqV+s57G5GWSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=XMcHMcQd; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1747402993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKF33DSgwYiTA/ehRWYmGRInlXFF0RqU9SvTIqTGm5c=;
	b=XMcHMcQduO24NMFiuJxxMJ4bQINqIMsN3UcArzq6F6rMn/V25T02+Z4yEckRaBpyoXTLdh
	kNLYIA/NotyidmF8+SF8Kw+5CxPwB4dFFEZFTYXsDd+2lfx3J5p9kEGNo0OWFaAYE6IjTQ
	Y2mPhhp8rRB4MvrQNBSCPxFKzIg+53w=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 1/2] Input: adp5588-keys Add check on return code
Date: Fri, 16 May 2025 16:43:03 +0300
Message-ID: <20250516134313.282564-2-arefev@swemel.ru>
In-Reply-To: <20250516134313.282564-1-arefev@swemel.ru>
References: <20250516134313.282564-1-arefev@swemel.ru>
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

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
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



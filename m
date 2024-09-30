Return-Path: <linux-input+bounces-6897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9188989CE0
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 10:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC092848A2
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 08:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6013317B506;
	Mon, 30 Sep 2024 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="xLEGHhGw"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6184F3FB0E;
	Mon, 30 Sep 2024 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685424; cv=none; b=TW4k99y+MvK6LAeQ2yVF6aN1hvfDlGkcRLR1aQdqzz/AW6tR4bL688pT3qNa/vjPg4FDpXbIMQMyYLvIJDu9mermaJp5cGhhFCZycGr8qBWGtXNm2EjVR0sM0GFbcQUe+WQLg4uIjLqfeRcstEd+l287DTv7SemJTJG4CnQyoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685424; c=relaxed/simple;
	bh=WIx/fRG8zTNvrhzIOSrLiujEGU5deiNFiroFWb3C3Jo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgU0Z4P/HdXMoWG3cvlbnPfMlGuududaZXw6yOilhIQyIEPnQnGm55efyG5ou5KT2U4T30Zbi3j4ZfdflVA85q++pVabcz4FgtvLYdBHTq5Nm/IrOSCXh637ssgckzeFbSFAE5+bGoAg9i3K6K4gBHmhYTh0I3Kb12oLh4F53Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=xLEGHhGw; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1727685409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FvX83hEQwH4oAEgwBRFc52ilKHcvmwibc9uxwlkcfQQ=;
	b=xLEGHhGwruI/bxO+3cmqXkoSVBTrW6UUQkL8uD9v/TtphByICQ+aX0DxpIa6NMypjBzpW5
	fwPO0Uwsq4leHjPLGS8vR0qh6Bt8k4iQmGY7JZjVWSwOGsUb3z/zQNvnEmpj/CNLHZvrsc
	B9wwZ4msMfLElg0VYoUEGo3GSIwFHcg=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] Input: adp5588-keys - Added checking of key and key_val variables
Date: Mon, 30 Sep 2024 11:36:49 +0300
Message-Id: <20240930083649.4703-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the adp5588_read function returns 0, then there will be an
overflow of the kpad->keycode buffer.

If the adp5588_read function returns a negative value, then the
logic is broken - the wrong value is used as an index of
the kpad->keycode array.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/input/keyboard/adp5588-keys.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 1b0279393df4..d05387f9c11f 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -526,14 +526,17 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5588_read(kpad->client, KEY_EVENTA + i);
-		int key_val = key & KEY_EV_MASK;
-		int key_press = key & KEY_EV_PRESSED;
+		int key, key_val, key_press;
 
+		key = adp5588_read(kpad->client, KEY_EVENTA + i);
+		if (key < 0)
+			continue;
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
2.25.1



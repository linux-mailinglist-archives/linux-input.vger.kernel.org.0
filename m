Return-Path: <linux-input+bounces-15267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3303BB937E
	for <lists+linux-input@lfdr.de>; Sun, 05 Oct 2025 04:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2B964E13D3
	for <lists+linux-input@lfdr.de>; Sun,  5 Oct 2025 02:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091FAE571;
	Sun,  5 Oct 2025 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fOrLJZX+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="E8NBp65k"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3C282F1
	for <linux-input@vger.kernel.org>; Sun,  5 Oct 2025 02:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759631645; cv=none; b=PiB1gYWdHYsdOa5bDj0GbABqXCJlQa8Apj8R8OF2panY7IKh0QZ3x39BFgHQ0FUKnXcFnnoQog/EMouhNTJH+Jizck7685J0KOGinTALbYBTQjKlxmmsUDskOqlrL3kJhwWzhrqom7D31/FPsXPPJvHIBYrSNgqzp6e8xgWDDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759631645; c=relaxed/simple;
	bh=B9uWqH9MUC4ST4Fol8++azto2a8Gj9gPyfMuvt7nb94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cx9vXFMar3VZd3BS4DXovlkTanVrjyKNKQ089q2/tgIyccS4HxYCzFqFe+UisSJVQGX1GIRa+4mCq6A4y+U8+2CrXBNh8uD7AJGm+I9PrHLbiOeXN/2kAO+fM8qq8SElu2RPeVIxBxXr+GoK5Xrxwku6Z9anj1o5zrqt37QKiDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fOrLJZX+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=E8NBp65k; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cfRKv4VtDz9sNZ;
	Sun,  5 Oct 2025 04:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759631635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YIDKnCsFJmcVltIk44NEs2d2FTZp4ZxrYsh4dM/i3fA=;
	b=fOrLJZX+6qgS2T5LTesgqB684ERqJnDtomRgyO5HKAhOaEx+xn5A9pWvyvV7A4PT+toM2b
	bR5Sgr6lFxID4iiFDpH829zOvxKpSpiosQMTN/c0h6ZlAfS4hJQ64cd5UWQRb42hptlPeQ
	jG6uWq+Ph9cphMiARKbFyc5413Be5kWc805HElbis8vsYftsQoa4G3CYkKUG6zZ2Q3xJpo
	mcaLIfreM5560/4Q+Hsm/tlnV6yIrp9efwLqDxOdZjB4Qev+5Wttv7KvMJYafkLObShTYJ
	wty1ry0ptRq2qNPhx60rCSXCz0SlXIuevvznNWN8HA83BprPcBtdO0Y229dF1w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=E8NBp65k;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759631633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YIDKnCsFJmcVltIk44NEs2d2FTZp4ZxrYsh4dM/i3fA=;
	b=E8NBp65kFh5gE9UOu1iNkorXzJM42R2bRfBx2q4MA1zxghvTEvYoHy6BbiAS0UnG4y66Vu
	hT6p9TjDHKxZK23PYNNjL749Dgw8v7SWuPEWnmARIosJFYUvjgzSd1OiZJjKzDeyG1nn2A
	Yj5SQ5A/ikecXH2iukNL4Q6Vyd9TWilY/5oLnLdoM43wTJVVXO3cBul2LhCcenlmdNjtgQ
	4XjcKsprxzc4GZbA6IAqRAtZvtZT0Z33KWDGYE/T4+z35BexnTVNovgIC7cDFdFp972rGk
	R1zo2Ui5euUWCFseltekMF9Ck94R9nK9hZzzrclIFYcOZqGCEN87vwszAfw77w==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Nick Dyer <nick@shmanahar.org>
Subject: [PATCH] Input: atmel_mxt_ts - allow reset GPIO to sleep
Date: Sun,  5 Oct 2025 04:33:10 +0200
Message-ID: <20251005023335.166483-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 88ejt93qdomm7jq3hrqoj75uno7unmf6
X-MBO-RS-ID: 34e34e5820aa9287594
X-Rspamd-Queue-Id: 4cfRKv4VtDz9sNZ

The reset GPIO is not toggled in any critical section where it couldn't
sleep, allow the reset GPIO to sleep. This allows the driver to operate
reset GPIOs connected to I2C GPIO expanders.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>
Cc: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index fc624101147ec..dd0544cc1bc1a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3320,7 +3320,7 @@ static int mxt_probe(struct i2c_client *client)
 	if (data->reset_gpio) {
 		/* Wait a while and then de-assert the RESET GPIO line */
 		msleep(MXT_RESET_GPIO_TIME);
-		gpiod_set_value(data->reset_gpio, 0);
+		gpiod_set_value_cansleep(data->reset_gpio, 0);
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
-- 
2.51.0



Return-Path: <linux-input+bounces-9760-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D5AA27ABA
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 20:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85463A2908
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 19:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C3C218E99;
	Tue,  4 Feb 2025 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="hWJOZL20"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A0F2040BE;
	Tue,  4 Feb 2025 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695673; cv=none; b=sPOk/sIx2nqCI+rGFVZVYUOUY3TQgN0sDapI7Q62LckiO61Fq2N9vV+/KrCWHVyfkKNy0/r7TM0YBZTE69NOgc0NDqLncP0rsY4m9zW6CtHU2EoO5NjwZn5rj+j0qH9JWgsIGJRol0NPbIfpPfHXtlj6UOjrEmsjZoCoA4tQ/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695673; c=relaxed/simple;
	bh=L7vBV1JPoj8vYtTWSak3lwHAxIiQQEbX51Hefc8OtzA=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=e5KDec1/rMuc0KP9lf+G9yuiuYHITPmACF/uf5xepSHf48cy2QURodCKoMhDBjBghYPGqOXjOI5Tl/ttz7JjovTCKnbEALGUgIb82leb8/aGf3VgCyugo1NyH47N9Z3pwWBxYzQzGRmGgI98G8viSIVx1nMUQrZLi+2mZ5RZbRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=hWJOZL20; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=mielJIRelVHU6ChF+oGw8yNzaNbjHGCOHmtP7wdOr6k=; b=hWJOZL20ZfLye+e+9n2TU/DpU9
	ea0oUFdebGacU61HA662BCJwMqleM+OhG/c6IS7x4u8MypTaemNgqmDWYzRKKyP8422/mPQG7Pt5a
	6QeglHa2aWUwOlOnOTsfvVTtoJG/2gxCFDT3G/iZ80Gy4pbLWrP2vhflV6yqvlD8M7Y4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33036 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1tfOAQ-000145-Gv; Tue, 04 Feb 2025 14:01:05 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	stable@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Tue,  4 Feb 2025 14:01:00 -0500
Message-Id: <20250204190100.2210863-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] Input: cyttsp5 - ensure minimum reset pulse width
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The current reset pulse width is measured to be 5us on a
Renesas RZ/G2L SOM. The manufacturer's minimum reset pulse width is
specified as 10us.

Extend reset pulse width to make sure it is long enough on all platforms.

Also reword confusing comments about reset pin assertion.

Fixes: 5b0c03e24a06 ("Input: Add driver for Cypress Generation 5 touchscreen")
Cc: <stable@vger.kernel.org>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/input/touchscreen/cyttsp5.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index eafe5a9b8964..bb09e84d0e92 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -870,13 +870,16 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
 	ts->input->phys = ts->phys;
 	input_set_drvdata(ts->input, ts);
 
-	/* Reset the gpio to be in a reset state */
+	/* Assert gpio to be in a reset state */
 	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
 		dev_err(dev, "Failed to request reset gpio, error %d\n", error);
 		return error;
 	}
+
+	fsleep(1000); /* Ensure long-enough reset pulse (minimum 10us). */
+
 	gpiod_set_value_cansleep(ts->reset_gpio, 0);
 
 	/* Need a delay to have device up */

base-commit: 0de63bb7d91975e73338300a57c54b93d3cc151c
-- 
2.39.5



Return-Path: <linux-input+bounces-11724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61DA84CE0
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 21:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7502B4E0B72
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 19:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CF2298981;
	Thu, 10 Apr 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="m23B2k/w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F42980C3;
	Thu, 10 Apr 2025 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312767; cv=none; b=S45VCcTStQHffq9ZBhybMqsYF9b7QjUQ+COWO9djaDZddtVgtPjEmejgSoqJf/1oi2kCZWFUvSXTwdmS1QsP8YznHWh5Od08NSrlw+ykFOcZW0QDyDUy2pk6VExiYOfVEjFonlufudhaf1V3qy/T3RXjGUTRmPew0ZIBM0SpBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312767; c=relaxed/simple;
	bh=bJsgrB3grlJVSN/jnkMp1mQnB8pPJ8qGsqsE5IvGtXo=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=R2KA/EVCzZqOsadn2bbtJcTcEpxW23GzhOfpUNB5eNYn8xnsEGTMfQYMllKLuxkFvD5JcAA+Tl94Je7ptlhnUFeD3qXGOJvUU0EybIvpMqCt2nX7a0/JUqbLah8HzfQE0LuaFQLmah08TbO1SnBPcpKZ81pwHEYGE67HG8+ckfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=m23B2k/w; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=9Ku3fsH6MRem2t90YQw/GQmkA5AL+TBtNZiCWwXXhH8=; b=m23B2k/wVR3NkVT2hvmsS2MoKE
	ae6+FlyCZQofwyuOIv7irjmqWMJRmxv5YMjf3zRNKi6CdJ/3F/uAS4UbFCjvGLJ+YP9rKWVBzMdJc
	yKK73qc+CV7PBgpnkZDSB1KCf+2NJhRPUBsCBcVO0+z4Il3f5tbqDJ9VU9LqzyEV5qbg=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:55534 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1u2wv6-0005sc-Jq; Thu, 10 Apr 2025 14:46:37 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alistair Francis <alistair@alistair23.me>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	stable@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu, 10 Apr 2025 14:46:32 -0400
Message-Id: <20250410184633.1164837-1-hugo@hugovil.com>
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
Subject: [PATCH v2] Input: cyttsp5 - ensure minimum reset pulse width
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
Acked-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
Changes for v2:
  - change delay from 1000us to 10us, to eliminate confusion
  - Add Alistair acked-by tag
---
 drivers/input/touchscreen/cyttsp5.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index eafe5a9b89648..14c43f0a6c217 100644
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
+	fsleep(10); /* Ensure long-enough reset pulse (minimum 10us). */
+
 	gpiod_set_value_cansleep(ts->reset_gpio, 0);
 
 	/* Need a delay to have device up */

base-commit: 3b07108ada81a8ebcebf1fe61367b4e436c895bd
-- 
2.39.5



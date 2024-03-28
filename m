Return-Path: <linux-input+bounces-2350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BD38787FF
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 19:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797461F22EC0
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 18:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD569626A7;
	Mon, 11 Mar 2024 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh9Tt+Kj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954D962177;
	Mon, 11 Mar 2024 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710182352; cv=none; b=ua0j1ZAqxKY1Jpsa9PYtOG+x7J92nPL8CFOlj5fmrR+b4v5HIqvlac2PeN1yw0nPWd3JYjyawkYGGeLDe1sWh2VvCw3+lQkhrTZrYH3QF645T0wII2ExbHfM1cR7WbD22tOLiADkkG+OFpTOZVCblmrCrnOQYqxYv/tUuFcSogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710182352; c=relaxed/simple;
	bh=YEz4yne20Y+PXJLPWPogO6ruSXDx1kKR8hKUaO0QDu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BlimD2s4+Wmuy3DB+CiEwXtqjMUHDUFL2ahJqDJ/eLxMWqqkqIjIKYY9E9bwQkdpRIN1jrLoHh3C29YRlJzJGEAi/c4FQEajTLomG87VakIh8PAsUKBtkeIFee8fZP8nLz8+TE4G+iuj5BrBqxAoDwIJHCAYv6IfF/EJhGg9cy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh9Tt+Kj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB12C433C7;
	Mon, 11 Mar 2024 18:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182352;
	bh=YEz4yne20Y+PXJLPWPogO6ruSXDx1kKR8hKUaO0QDu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dh9Tt+KjW0viZ8sO9OwY/hZn7IeNTl37QCUZBw9nP2tLD0OuzbT3F7heUWJzIgVst
	 ka5wVniBfui73QNrU2Fm+9Rg168eXXbjKZs/cKwXhlH3O7wna40p7h7I3y8rFFKlhe
	 YzQ+odfyz9MjYdk7JZpT138+k1F+CyDHpr3jRN7q3jzHiCXPegNuVQdR8EPdyeiQO2
	 pxuNwpsTCN3B6VSSjGmQsLVIBoo4xHEkoQRTj1UutMQ7UgKwDOLMoqlHT+vLTmA7c/
	 nSycxiN1Gn17n5YIQPkP8NEcxRoiW+Ud33rrONXubmJe09ZeD0Y1GCUX4+NkrV5tmD
	 pYJDwhmR7bSuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 2/5] Input: gpio_keys_polled - suppress deferred probe error for gpio
Date: Mon, 11 Mar 2024 14:38:58 -0400
Message-ID: <20240311183901.328749-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311183901.328749-1-sashal@kernel.org>
References: <20240311183901.328749-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.151
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[ Upstream commit 963465a33141d0d52338e77f80fe543d2c9dc053 ]

On a PC Engines APU our admins are faced with:

	$ dmesg | grep -c "gpio-keys-polled gpio-keys-polled: unable to claim gpio 0, err=-517"
	261

Such a message always appears when e.g. a new USB device is plugged in.

Suppress this message which considerably clutters the kernel log for
EPROBE_DEFER (i.e. -517).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20240305101042.10953-2-u.kleine-koenig@pengutronix.de
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/keyboard/gpio_keys_polled.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index c3937d2fc7446..a0f9978c68f55 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -319,12 +319,10 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 			error = devm_gpio_request_one(dev, button->gpio,
 					flags, button->desc ? : DRV_NAME);
-			if (error) {
-				dev_err(dev,
-					"unable to claim gpio %u, err=%d\n",
-					button->gpio, error);
-				return error;
-			}
+			if (error)
+				return dev_err_probe(dev, error,
+						     "unable to claim gpio %u\n",
+						     button->gpio);
 
 			bdata->gpiod = gpio_to_desc(button->gpio);
 			if (!bdata->gpiod) {
-- 
2.43.0



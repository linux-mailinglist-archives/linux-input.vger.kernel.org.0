Return-Path: <linux-input+bounces-2222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87407871A4E
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 11:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22C09B21FE9
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 10:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFD4548EA;
	Tue,  5 Mar 2024 10:10:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF45548E0
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709633458; cv=none; b=X8VhMJbvcebAcjAbRlxuJ+1AEilZd2kkFtxZ1uPfeQMm98VjsJcX2ksHcn2I5VoAelp2/xVH5podLvXNVS7QnrYOK8IvMzm4n+mUJnow6nAQx/u1euYMBNyS8sUOJPfizPjilhWs8sxJPqzeTXHVJ5bKq9Sz5d0Mr/fkPaDddNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709633458; c=relaxed/simple;
	bh=+oLVsRd4MBhQuMWSbl0WQlAaxHX4j3U6FntbKyCeg5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ma7Oy+DQXwKuHoWZcJmhiyFWHnwJ6CZ3bmYAzr9Ym2vnkZzLKUOBeq+dS6/UdC+5KZ1n4YL1E3PH/ZlzJ7EhYvVfpLmMJVMXMSLoxZ60PCGFP+IStmD1kW9w3IJs4PnM4cQXp0bCQken/TpEEXBEKVIY8Ej9dhhui+7FehC+IS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhRl0-00074L-7C; Tue, 05 Mar 2024 11:10:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhRkz-004X0P-Jd; Tue, 05 Mar 2024 11:10:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhRkz-00Ha7h-1f;
	Tue, 05 Mar 2024 11:10:45 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-input@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] Input: gpio_keys_polled - Suppress deferred probe error for gpio
Date: Tue,  5 Mar 2024 11:10:42 +0100
Message-ID: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+oLVsRd4MBhQuMWSbl0WQlAaxHX4j3U6FntbKyCeg5U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl5u+i03ve1jJCggpnNDSDm2oYjgPpYoNVzKUxO /jVaBOxm3OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZebvogAKCRCPgPtYfRL+ TsnJB/9jiIsJZZ5ASV6z7wuDSz6cx5SiTYgvWM1OCoJDgz77ebE5pZNMw/jQme0wLD0dEXMJece 29rdm6suKZmjFAz2bFpHvWOVtnc08ff0lPocmk/rt/bEtGWEOt4nrfiZsewqRzUHTGY29xmhInX Q99ivIuRhOI55I2dXQZBVH7RuqyQRrwjfjjGHXzzPvEk0NtgivJMwHSOdWa/aOXuv4YoF3DTC2D dxlsst/oLlj9iqo4F5nUgHKFswcXvSOx2a81xSLRzqrKlF1OhYWlaubsKzmRlIEx36soVA2uX0j wlh+yyITnL+qdv6JKp2Niim+xvdnSfqu9F2Ps9bz5+BBGHdC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On a PC Engines APU our admins are faced with:

	$ dmesg | grep -c "gpio-keys-polled gpio-keys-polled: unable to claim gpio 0, err=-517"
	261

Such a message always appears when e.g. a new USB device is plugged in.

Suppress this message which considerably clutters the kernel log for
EPROBE_DEFER (i.e. -517).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

there are a few other exit paths that could use dev_err_probe(), but IIRC
Dmitry isn't a fan of using dev_err_probe() where the return value cannot be
EPROBE_DEFER, so I'm only changing this one error path.

Best regards
Uwe

 drivers/input/keyboard/gpio_keys_polled.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index ba00ecfbd343..b41fd1240f43 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -315,12 +315,10 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
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

base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
-- 
2.43.0



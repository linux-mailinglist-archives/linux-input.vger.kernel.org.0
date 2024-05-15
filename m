Return-Path: <linux-input+bounces-3715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5C8C699C
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 17:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753BC1C20D27
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 15:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1185F155747;
	Wed, 15 May 2024 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="O0We/ZGQ"
X-Original-To: linux-input@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C8E15573E
	for <linux-input@vger.kernel.org>; Wed, 15 May 2024 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715786710; cv=none; b=BDErsef/+62Yu8ySjD1DHfF26QGKUDXqZIMj7bFj4PYPL28oBPUOXkNGFzhK1csnGmU2GlTdxCgvYJR5U/lEg13STSdHVeuxY8RhK4w7che4hFbOKB1v0hfTepbrl5Jdm8g9zLH2GWjxduVYGT+wDRsHdmIJ5yAUnBpv8RRc9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715786710; c=relaxed/simple;
	bh=3/gBG12SdrNquCn61uCLM9Nd7nAnF7/euXYf6ET/QBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=li6YnjBX/5UVDYsvbQhuoELnsVNe1xw0iKKRaI7T0+qb7JQj5VEImia3UtdeXJ2j8F1FyqMBFQO1B5EAYnyRrN5rK+C+U8CHjhMlphGhJFzwmbmo9E6FKvPI5f+CqsbJnrAQqlGJciUEtI6blwhhoOiP4gsEfWGjKX7ID9Gp9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=tika.stderr.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=O0We/ZGQ; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tika.stderr.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n34FeKsLTWyb8TghmAHaTg2CJa+VcqsBeTp6NSDv9zE=; b=O0We/ZGQT1GnjuyhigqWKl8qwn
	MkncVeY07XCXN7wuSj4XRW7CieaaRxj3Xkg7b4TCYouF4fIVxL7hLCl7cW/0ZFwxsEVRB7KD9tbPg
	8Sc75GC5dT6h7CQo45QIOcAbPl8KxJ3+kvJP9/BJEG/PxSX0o2WzZKwnxYcsCyRIQy6Q=;
X-Preliminary-Spam-Score: -3.1 (---)
Received: from 89-250-188-118.tangos.nl ([89.250.188.118] helo=dottie)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@tika.stderr.nl>)
	id 1s7Fx5-004LRr-0p;
	Wed, 15 May 2024 16:49:55 +0200
Received: (nullmailer pid 678346 invoked by uid 1000);
	Wed, 15 May 2024 14:49:54 -0000
From: Matthijs Kooijman <matthijs@stdin.nl>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthijs Kooijman <matthijs@stdin.nl>
Subject: [PATCH] Input: ilitek_ts_i2c: Use gpiod_set_value_cansleep()
Date: Wed, 15 May 2024 16:49:44 +0200
Message-Id: <20240515144943.678260-1-matthijs@stdin.nl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use gpiod_set_value_cansleep in the ilitek_reset function (called only
from ilitek_ts_i2c_probe and ilitek_resume).

Without this change, the driver may print a warning if the reset pin is
connected to a GPIO chip which can sleep (e.g. a GPIO expander):

WARNING: CPU: 1 PID: 578 at gpiod_set_value+0x5c/0xd0

This commit is modeled after commit 7c977019c53ed (leds: lp55xx: Use
gpiod_set_value_cansleep(), 2023-09-18)

Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index fc4e39b6651a4..236c332de6cdc 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -391,9 +391,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
 static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
 {
 	if (ts->reset_gpio) {
-		gpiod_set_value(ts->reset_gpio, 1);
+		gpiod_set_value_cansleep(ts->reset_gpio, 1);
 		mdelay(10);
-		gpiod_set_value(ts->reset_gpio, 0);
+		gpiod_set_value_cansleep(ts->reset_gpio, 0);
 		mdelay(delay);
 	}
 }
-- 
2.40.1



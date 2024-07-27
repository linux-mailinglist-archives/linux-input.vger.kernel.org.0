Return-Path: <linux-input+bounces-5170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A895A93DD88
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2024 08:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C57E284AB5
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2024 06:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C43C1CD3D;
	Sat, 27 Jul 2024 06:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="BdGgqL4b"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB9208B0;
	Sat, 27 Jul 2024 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722062295; cv=none; b=jN47Ci/dnMAjFJV9FjxFFyk4nTfgH7juNpTkbBYgqLNLRO3BiGlwLfhjLN+rge5ccA33qtkIZXBMp3TjhJNTxtQFrI830a8KpE16HZg2ad4wlkUs6ZgRT1eHfrAy+teUeldea0tDaEvQd4dt/5LgORLSkI9lF9b2cxqAXfNldNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722062295; c=relaxed/simple;
	bh=GrJeDK2srVi+z2UkjJHob9c8b6SOSjMXZQ3r/XMlwYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FhR+VhPzq4Ckhxo50KykFCMRE+XKzpINBnPzd9k+Id1JE/lrKcEB2iVNUcUk0Y3bqvk2AmJZ4P5A/kUnvT2RVUca+Ws8uNHbT9/vYNhI7ON2MGkEU2tPWHnQOb9uB3eH1rWRXoRkd99/I4PX2RbCZ182T+NtCgZRJU4zJqzSgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=BdGgqL4b; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Xb2zsVCoM6bu3Xb2zscawa; Sat, 27 Jul 2024 08:36:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722062213;
	bh=ZHDCDqysapmv2ryBK6BEJxU1h57yEUk6bw3Qv1mEShs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BdGgqL4bydrIPmm/lNBGsOHsGXsAa+Q8dwBHEn4O7+m/PqLOLNJdH9HqY4c7QYtti
	 C8Gq6wLy+Xt7fDflgw1nohqsR4qbyLv388/Eb/UULvVVACDlW5LBjv0/OdE++MESZz
	 96rXENTHPWC6YeNN+eJCY0s2g2bpxLb7yrMyrdiTLm6EjkKEBaT6FOa/UzXebqvk98
	 /BW4kKokbm7FgcexUWp2YD16plDbNqFpnQvJs/rZD7UX47e2LVl10Yl8VG94w5tSX+
	 9cEsz+6kgF33UksgZ58JzVMZ9nK7hvEw4R5PKFkv3w1V5wNUuKt+UePkt2KaMfm2Xn
	 HieCaZrfQRlgw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 27 Jul 2024 08:36:53 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH v2] Input: spear-keyboard - Switch to devm_clk_get_prepared()
Date: Sat, 27 Jul 2024 08:36:49 +0200
Message-ID: <062986b0a5105cbc61330da0e55b22c00e2c1c4f.1722062145.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_prepared() in order to remove a clk_unprepare() in an
error handling path of the probe and from the .remove() function.

This done, the whole .remove() function can also be axed because
'input_dev' is a managed resource allocated with
devm_input_allocate_device() and we can fully rely on devm for cleaning up.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - Merge patch 1 and 2, because patch 1 alone introduced a bug   [Dmitry Torokhov]

v1: https://lore.kernel.org/all/cover.1721939824.git.christophe.jaillet@wanadoo.fr/
---
 drivers/input/keyboard/spear-keyboard.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 557d00a667ce..1df4feb8ba01 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -222,7 +222,7 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	if (IS_ERR(kbd->io_base))
 		return PTR_ERR(kbd->io_base);
 
-	kbd->clk = devm_clk_get(&pdev->dev, NULL);
+	kbd->clk = devm_clk_get_prepared(&pdev->dev, NULL);
 	if (IS_ERR(kbd->clk))
 		return PTR_ERR(kbd->clk);
 
@@ -255,14 +255,9 @@ static int spear_kbd_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	error = clk_prepare(kbd->clk);
-	if (error)
-		return error;
-
 	error = input_register_device(input_dev);
 	if (error) {
 		dev_err(&pdev->dev, "Unable to register keyboard device\n");
-		clk_unprepare(kbd->clk);
 		return error;
 	}
 
@@ -272,14 +267,6 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void spear_kbd_remove(struct platform_device *pdev)
-{
-	struct spear_kbd *kbd = platform_get_drvdata(pdev);
-
-	input_unregister_device(kbd->input);
-	clk_unprepare(kbd->clk);
-}
-
 static int spear_kbd_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -373,7 +360,6 @@ MODULE_DEVICE_TABLE(of, spear_kbd_id_table);
 
 static struct platform_driver spear_kbd_driver = {
 	.probe		= spear_kbd_probe,
-	.remove_new	= spear_kbd_remove,
 	.driver		= {
 		.name	= "keyboard",
 		.pm	= pm_sleep_ptr(&spear_kbd_pm_ops),
-- 
2.45.2



Return-Path: <linux-input+bounces-14712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 747E9B56BB8
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 21:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20B1118912E0
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B7C2DE6F8;
	Sun, 14 Sep 2025 19:35:43 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1021ADFFB;
	Sun, 14 Sep 2025 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878543; cv=none; b=PMKm7Jok4o3Fy/4xndGZ4D2XPgRZkt6gA7jXldj+9cq0LVkQQNrOfsNF6uFSIK/+fmA1PNOQQ386Ou+/PHA/h87RXCe1ggWvaO1U/cv3M5uh5eKyKm6UVl5QaoaLR+SZmRlQO3ka48D4hKCh10gGm8rKmS0wyLLGmdJ38UdxQPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878543; c=relaxed/simple;
	bh=T7S3tGDSkRkjUCD68dVv+kgTO8r6VOa4JBA80JkSbJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RiTucy7PSFoJ9YHS6nShCTeMNto4kKScbZerdW15qO69bf00eB7wMg5UYJpuIk0P5h5RiCkmWmuzVvLv1kIz+ZvD8saHhHXiFPIeB0fTo985x92rbaW6xPXpX6a5G80WTXepIHq4K5fz1DwSK8hl1CCujfD2bfYtlSDq2qEhwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 58EJbPdE010619;
	Sun, 14 Sep 2025 19:37:25 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 58EJbPMS010614;
	Sun, 14 Sep 2025 19:37:25 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v4 4/8] mfd: mc13xxx: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
Date: Sun, 14 Sep 2025 19:37:19 +0000
Message-Id: <20250914193723.10544-5-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250914193723.10544-1-akurz@blala.de>
References: <20250914193723.10544-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_mfd_add_devices() for adding MFD child devices and
devm_regmap_add_irq_chip() for IRQ chip registration.

This reduces the amount of required cleanup.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/mfd/mc13xxx-core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 920797b806ce..091c9171b2b7 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -381,7 +381,7 @@ static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
 	if (!cell.name)
 		return -ENOMEM;
 
-	return mfd_add_devices(mc13xxx->dev, -1, &cell, 1, NULL, 0,
+	return devm_mfd_add_devices(mc13xxx->dev, -1, &cell, 1, NULL, 0,
 			       regmap_irq_get_domain(mc13xxx->irq_data));
 }
 
@@ -455,8 +455,9 @@ int mc13xxx_common_init(struct device *dev)
 	mc13xxx->irq_chip.irqs = mc13xxx->irqs;
 	mc13xxx->irq_chip.num_irqs = ARRAY_SIZE(mc13xxx->irqs);
 
-	ret = regmap_add_irq_chip(mc13xxx->regmap, mc13xxx->irq, IRQF_ONESHOT,
-				  0, &mc13xxx->irq_chip, &mc13xxx->irq_data);
+	ret = devm_regmap_add_irq_chip(dev, mc13xxx->regmap, mc13xxx->irq,
+				       IRQF_ONESHOT, 0, &mc13xxx->irq_chip,
+				       &mc13xxx->irq_data);
 	if (ret)
 		return ret;
 
@@ -502,8 +503,6 @@ void mc13xxx_common_exit(struct device *dev)
 {
 	struct mc13xxx *mc13xxx = dev_get_drvdata(dev);
 
-	mfd_remove_devices(dev);
-	regmap_del_irq_chip(mc13xxx->irq, mc13xxx->irq_data);
 	mutex_destroy(&mc13xxx->lock);
 }
 EXPORT_SYMBOL_GPL(mc13xxx_common_exit);
-- 
2.39.5



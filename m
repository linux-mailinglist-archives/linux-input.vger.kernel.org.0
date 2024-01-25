Return-Path: <linux-input+bounces-1468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08C183C3D8
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 14:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3DE81C21ACD
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 13:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EB75730A;
	Thu, 25 Jan 2024 13:37:54 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844EF57317;
	Thu, 25 Jan 2024 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189874; cv=none; b=QmGejuHgjbbjNvWTyF97Rkfimfq5z90qOVfysx+XADzD9XMZdoL/fZHqVKPdaQHyx3b1arTI5AoZRkHMU0a3JSUhchLRP2Dy+L+Q+ev1LXoXyJ/B6Hc9lFaeOaawzBvdX0DZSs6jEuYLTjWn3Uz/ZLyH/rz/6xBRJGiekEBUuHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189874; c=relaxed/simple;
	bh=uwWvPBBLizGvEQ452Or9FXvr01UgQnxipDT2WEbzpqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ELcfXhtWOordSxnLVV3Tvmye6iiL+NbfozllLO2cnx65M0+zlSvPWtZV0qu0QoVufUAmHYl0bAUqsQo4aOZNmQwMP929wgczje1C6qx+9py5rcefTqb/FvP5qFEm2hvy//NFtxaGD5Ms8h008hSc8JIsjA4zxfIHqDEjSrdJCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="195621352"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jan 2024 22:37:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.215])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 047BC42C93AB;
	Thu, 25 Jan 2024 22:37:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/3] Input: da9063_onkey - Drop scheduling work
Date: Thu, 25 Jan 2024 13:37:32 +0000
Message-Id: <20240125133733.95081-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125133733.95081-1-biju.das.jz@bp.renesas.com>
References: <20240125133733.95081-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On threaded case it might be cleaner to avoid scheduling work and simply
loop in the interrupt thread as it can sleep.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/input/misc/da9063_onkey.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 06ad9d09ada8..e5256bf31140 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/property.h>
-#include <linux/workqueue.h>
 #include <linux/regmap.h>
 #include <linux/mfd/da9063/core.h>
 #include <linux/mfd/da9063/registers.h>
@@ -36,7 +35,6 @@ struct da906x_chip_config {
 };
 
 struct da9063_onkey {
-	struct delayed_work work;
 	struct input_dev *input;
 	struct device *dev;
 	struct regmap *regmap;
@@ -82,11 +80,8 @@ static void da9063_onkey_report_key(struct da9063_onkey *onkey,
 	input_sync(onkey->input);
 }
 
-static void da9063_poll_on(struct work_struct *work)
+static bool da9063_poll_on(struct da9063_onkey *onkey)
 {
-	struct da9063_onkey *onkey = container_of(work,
-						struct da9063_onkey,
-						work.work);
 	const struct da906x_chip_config *config = onkey->config;
 	unsigned int val;
 	int fault_log = 0;
@@ -151,8 +146,7 @@ static void da9063_poll_on(struct work_struct *work)
 	}
 
 err_poll:
-	if (poll)
-		schedule_delayed_work(&onkey->work, msecs_to_jiffies(50));
+	return poll;
 }
 
 static irqreturn_t da9063_onkey_irq_handler(int irq, void *data)
@@ -165,7 +159,8 @@ static irqreturn_t da9063_onkey_irq_handler(int irq, void *data)
 	error = regmap_read(onkey->regmap, config->onkey_status, &val);
 	da9063_onkey_report_key(onkey, KEY_POWER, 1);
 	if (onkey->key_power && !error && (val & config->onkey_nonkey_mask)) {
-		schedule_delayed_work(&onkey->work, 0);
+		while (da9063_poll_on(onkey))
+			msleep(50);
 		dev_dbg(onkey->dev, "KEY_POWER long press.\n");
 	} else {
 		da9063_onkey_report_key(onkey, KEY_POWER, 0);
@@ -211,11 +206,6 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 
 	input_set_capability(onkey->input, EV_KEY, KEY_POWER);
 
-	error = devm_delayed_work_autocancel(&pdev->dev, &onkey->work,
-					     da9063_poll_on);
-	if (error)
-		return error;
-
 	irq = platform_get_irq_byname(pdev, "ONKEY");
 	if (irq < 0)
 		return irq;
-- 
2.25.1



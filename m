Return-Path: <linux-input+bounces-1467-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857E83C3D6
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 14:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2AD1C2385A
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419265732D;
	Thu, 25 Jan 2024 13:37:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D136857317;
	Thu, 25 Jan 2024 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189872; cv=none; b=dUjGL5CPrVLYHskw9+4G4KZ8d2hl7WwupNJF4G/dAxrOI0ejwjY3Tt9+hoOeeonzwff3GkfxapeRC+cMZ7V8CSrBcAYNa+xZosC6DvqzIahwpy+yetDM73NJbBrpnkLv+4heRy/X0w8tIkZkcVymo1Ox1ccRSTI4NxhuDqymc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189872; c=relaxed/simple;
	bh=aecc4VtS3J2A+wtS8gtU/czKhW9ts0HJzNfn1FTkt3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WBaQKNnumiuIpkv0peBbTDYGpOLG0UhKEVV2JY/vINbzbRaW/aOfcvBWUKXIl4N6mRUxXTpAvc8ogdF3O0kcRJl+yngWyZum7gSCNXz7IQ6fc418Nt17Cihsu1b3HMdzELNa4NjIB5GGRDxB87eSlw1XD1Gy8lGN0YY6l26jSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="191712565"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2024 22:37:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.215])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D718A42C93B0;
	Thu, 25 Jan 2024 22:37:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] Input: da9063_onkey - Add da9063_onkey_report_key()
Date: Thu, 25 Jan 2024 13:37:31 +0000
Message-Id: <20240125133733.95081-2-biju.das.jz@bp.renesas.com>
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

Adding da9063_onkey_report_key() for reporting key events makes the code
simpler. So, simplify it.

While at it, update multiline code that can fit to single line.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/input/misc/da9063_onkey.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index c338765e0ecd..06ad9d09ada8 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -75,6 +75,13 @@ static const struct da906x_chip_config da9062_regs = {
 	.name = "da9062-onkey",
 };
 
+static void da9063_onkey_report_key(struct da9063_onkey *onkey,
+				    unsigned int code, int value)
+{
+	input_report_key(onkey->input, code, value);
+	input_sync(onkey->input);
+}
+
 static void da9063_poll_on(struct work_struct *work)
 {
 	struct da9063_onkey *onkey = container_of(work,
@@ -87,12 +94,9 @@ static void da9063_poll_on(struct work_struct *work)
 	int error;
 
 	/* Poll to see when the pin is released */
-	error = regmap_read(onkey->regmap,
-			    config->onkey_status,
-			    &val);
+	error = regmap_read(onkey->regmap, config->onkey_status, &val);
 	if (error) {
-		dev_err(onkey->dev,
-			"Failed to read ON status: %d\n", error);
+		dev_err(onkey->dev, "Failed to read ON status: %d\n", error);
 		goto err_poll;
 	}
 
@@ -107,8 +111,7 @@ static void da9063_poll_on(struct work_struct *work)
 			goto err_poll;
 		}
 
-		input_report_key(onkey->input, KEY_POWER, 0);
-		input_sync(onkey->input);
+		da9063_onkey_report_key(onkey, KEY_POWER, 0);
 
 		poll = false;
 	}
@@ -159,19 +162,13 @@ static irqreturn_t da9063_onkey_irq_handler(int irq, void *data)
 	unsigned int val;
 	int error;
 
-	error = regmap_read(onkey->regmap,
-			    config->onkey_status,
-			    &val);
+	error = regmap_read(onkey->regmap, config->onkey_status, &val);
+	da9063_onkey_report_key(onkey, KEY_POWER, 1);
 	if (onkey->key_power && !error && (val & config->onkey_nonkey_mask)) {
-		input_report_key(onkey->input, KEY_POWER, 1);
-		input_sync(onkey->input);
 		schedule_delayed_work(&onkey->work, 0);
 		dev_dbg(onkey->dev, "KEY_POWER long press.\n");
 	} else {
-		input_report_key(onkey->input, KEY_POWER, 1);
-		input_sync(onkey->input);
-		input_report_key(onkey->input, KEY_POWER, 0);
-		input_sync(onkey->input);
+		da9063_onkey_report_key(onkey, KEY_POWER, 0);
 		dev_dbg(onkey->dev, "KEY_POWER short press.\n");
 	}
 
-- 
2.25.1



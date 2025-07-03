Return-Path: <linux-input+bounces-13366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7BDAF7CBC
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 17:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99CD03A7A16
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 15:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE792D46C1;
	Thu,  3 Jul 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fuECaOsR"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D0C2236E3;
	Thu,  3 Jul 2025 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557342; cv=none; b=b8YBYVBKrCGj8Jt5jn2qP/P4jlwuEie8Xh8rqW4OspI8RcRRLXn4Grl5DPonXee0irnv1dPMqkFPJKjkQxTMzgceim/5N2o3NuRJbivDss8wUrz5rAUYD18mu724StI5Jvjsy9WIxpaCLxsQ4FExvLyvbaJie/0Fx2iuSuoIac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557342; c=relaxed/simple;
	bh=QTbnWAayA30BBivWJPpqyOG+fUTqPYXweWMPu/sAVpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dG38i87k89qIxHWUfJNclgsi4UFGeME7K+5ibuEvtuTD1OrggwUwzUCzMLt31Z9CTfVxNOLg2LHkqvhrU72kk7Diu2IsLg474Za6zPnUNJ/fW/1xVrCktB7FTGfuF2lDeyYosOF/If5wcvR9tJBfRiuGK8lV71kuGJx5pv/aP8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fuECaOsR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557339;
	bh=QTbnWAayA30BBivWJPpqyOG+fUTqPYXweWMPu/sAVpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fuECaOsRJ+a5oKQv/+vraH3cGWALtojlLUzAlblxBoqEmM+B0kHCQcsqsN4fZpMHp
	 h8R2raZElyNnef+3cjyYAd+HaZ/Db6p4B7UYuD+jfIZmZJdQDclhb0UM4ynmJWdH5/
	 xFY33Ley4YTSJH3xnj/bDjJC6KUdRRdakq9Xi968iGhnMOpDG+dOSWMRJtPMikkbLE
	 jGYxI/76dIZbEcsigPEJpV+dkY4EEKu5U+o568BGTGG0z8y5d7Q321xHNByDa47v2y
	 OnQZljJXiqBp91Vh+9q2dTTdsaj7yuec8790J4pGPrxGn91OT0Idujv6y1fKYezkY5
	 vigfm0jVqPxHw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B288617E0B1E;
	Thu,  3 Jul 2025 17:42:18 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Jul 2025 17:41:03 +0200
Subject: [PATCH 1/3] Input: mtk-pmic-keys - add support for MT6359 PMIC
 keys
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-1-21a4d2774e34@collabora.com>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=1760;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=QTbnWAayA30BBivWJPpqyOG+fUTqPYXweWMPu/sAVpw=;
 b=khzbvBhxLyH1a2Q/3rP/3wy8zQTM35b3ONQBLfWQnTAxVIyv5iTy90OoIV3ClQHtjZmALABm+
 b3jKceypMLRAPrZ+EwbNQPJmjG9TuHyf1RyWX8dDqBkzaIHV34Ra676
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add PMIC key support on MT6359 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 061d48350df661dd26832b307e1460ee8b8fd535..50e2e792c91d2626d3f282d04a1db60845827ef2 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/mt6331/registers.h>
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
+#include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -117,6 +118,19 @@ static const struct mtk_pmic_regs mt6358_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6359_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+				   0x2, MT6359_PSC_TOP_INT_CON0, 0x5,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+				   0x8, MT6359_PSC_TOP_INT_CON0, 0xa,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6359_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -296,6 +310,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_regs,
+	}, {
+		.compatible = "mediatek,mt6359-keys",
+		.data = &mt6359_regs,
 	}, {
 		/* sentinel */
 	}

-- 
2.50.0



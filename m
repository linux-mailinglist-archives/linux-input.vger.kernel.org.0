Return-Path: <linux-input+bounces-14324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFCB36885
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 16:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67B418E3543
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2DC350D48;
	Tue, 26 Aug 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R01YK0RS"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1926342CA7;
	Tue, 26 Aug 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216918; cv=none; b=W2Ub5ziKRJrUzoNjGTaYuiyJPcjwuoKSkRvYT8UQySqvpnGRHBkzv6sE2QkGNL2fvc4uoAKvbipF4oNeX1qI70xXi0bd83LW/PKiRlCMt45rO4cMSE86PXq1t582pARWjHXVNhLBGRkVsXTyrhvMek/0jBW8TX+MNy2P9fR4pt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216918; c=relaxed/simple;
	bh=DX2D+C5ydoecfNdBzKvrOSzseuCckWs8nJpneMFTTpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhH0e6OFeGk+oRsZtoCHDRH4Lg9B+BgT15yiafy1bkCXtntezbpCVUWD2uniNwOkcGK/6/Mnt9Ob0CqAn+RWIm9Jjyicf6brIBnpuL7arovqpgtjUvJmzRKy3AGSBpGXnvBcdbsm5yBr8OHDTLYr7sgWqHdyARZkBbOAkRo98GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R01YK0RS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216915;
	bh=DX2D+C5ydoecfNdBzKvrOSzseuCckWs8nJpneMFTTpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R01YK0RSpGAPcIuC2HvOq2f4j2Cu3hirMFqwM3aC9SIV8O1iRhrDLpQYPjY0JBmgh
	 yd96hRZOmaLiwLYp7NDsnsgv+j8zg4NYjKMZYFEJ5mWwzAJ+vGW5ABG3KzfL6RJWCD
	 72ik8u9xPaXhADwuWZH7Ig7nMRCsEBVIJhxNKUXIU1kav+b2jus3asS6bPEX8Fxcg7
	 qN4uFGVa2fWJ/Q6vzVscwZ9Qox5BEQhpwXij/hf/c4YPWjAZkgXvn6OsQJ4vl+Mskt
	 q0hdU+n0HBWNd1blvg14wfQ4eFyUfZhNpt+GLy0c8ogXPHICGlTIVk87LVjGeQIvlV
	 Yq1QSEDWT0F+A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B88217E07FB;
	Tue, 26 Aug 2025 16:01:54 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 16:01:52 +0200
Subject: [PATCH v2 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-radxa-nio-12-l-gpio-v2-1-7f18fa3fbfc8@collabora.com>
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
In-Reply-To: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

A recent commit in linux-next added support for key events.
However, the key release event is not properly handled:
only key press events are generated, leaving key states
stuck in "pressed".

This patch ensures that both key press and key release events
are properly emitted by handling the release logic correctly.

Introduce a 'key_release_irq' member to the 'mtk_pmic_regs',
to identify the devices that have a separate irq for the
release event.

Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 50e2e792c91d2626d3f282d04a1db60845827ef2..c78d9f6d97c4f7a77b4c44cee3b93e4712a19aec 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -55,6 +55,7 @@ struct mtk_pmic_regs {
 	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
 	u32 pmic_rst_reg;
 	u32 rst_lprst_mask; /* Long-press reset timeout bitmask */
+	bool key_release_irq;
 };
 
 static const struct mtk_pmic_regs mt6397_regs = {
@@ -116,6 +117,7 @@ static const struct mtk_pmic_regs mt6358_regs = {
 				   MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
 };
 
 static const struct mtk_pmic_regs mt6359_regs = {
@@ -129,6 +131,7 @@ static const struct mtk_pmic_regs mt6359_regs = {
 				   MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6359_TOP_RST_MISC,
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
 };
 
 struct mtk_pmic_keys_info {
@@ -368,7 +371,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		if (keys->keys[index].irq < 0)
 			return keys->keys[index].irq;
 
-		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
+		if (mtk_pmic_regs->key_release_irq) {
 			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
 									  irqnames_r[index]);
 

-- 
2.50.1



Return-Path: <linux-input+bounces-14508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF2CB456E3
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 13:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421A95C0F35
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 11:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CFF34A32C;
	Fri,  5 Sep 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ka30bxE/"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6121B3469ED;
	Fri,  5 Sep 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073129; cv=none; b=rdQs4i+jLMevRXm56d1ZmZSsRou3pGdP/73K7NRFXk1GQqSReCyb8xiVB3ILIPvZlM8ioB13eJg0dPMn9J/P+abG9W2Usqm4BqLYPbtqZOoFs0fScvNCPe/GJ0Tiir/wV8eHPww5FR/k3qUANmHVPqx6HyXZ2vnIjoU9B6Dm2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073129; c=relaxed/simple;
	bh=nGCQcq61aKBRf0b7FK8UVUHa2H+P8YyeOd1I16hGvAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwNpE3vH//crjbUkdIm8rK2vfGOiv+hdufPPCXTwOIKD+VHBQLBPm449/R9SYYKGbCJg+TSJyHZQVw+s0WV1i+l6VCs5XDuuhZX4HW8yCrd1jb2gyoe3xLjdEnjXK0twIM7Od1bZ88hOERUxFWjtfsBBSPtIDjDxIv2kZHRwEyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ka30bxE/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757073125;
	bh=nGCQcq61aKBRf0b7FK8UVUHa2H+P8YyeOd1I16hGvAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ka30bxE/Hc2F9cak9VvSldw3iz5FIERcNisml9glefat2t87MRZXYic3aowp3CZZX
	 Y27XoFU1d0MpumDaskc4UX8Iyv5kCKq+bDwtlNwZDPsab7EmrRg+QBw1qYbE9XNCm8
	 4p7au7KfEpSnTjKXOsNAPoCLVURld3vDndgRNBLsf2Da09gkLHKNUt/iLMazMb6xqb
	 s7NC/iJap3WDwUevCweXxsyezYv/7GkFrsj9eUsVfhG3rI+hYsmMczkMz8N2930ZSB
	 PPjvwry9XqXqHWdE0bG8Zcq6IZ6lHwFWOFQJUSjAFRn4RYDA3YiAKeUycujuYB4zEk
	 l5vsQJ3Q9gH5A==
Received: from localhost-live.home (2a01cb0892F2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEDC817E0237;
	Fri,  5 Sep 2025 13:52:04 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 05 Sep 2025 13:51:58 +0200
Subject: [PATCH v3 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
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

Support for MT6359 PMIC keys has been added recently.
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
2.51.0



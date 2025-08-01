Return-Path: <linux-input+bounces-13757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5148B1824B
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 15:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1231AA74D4
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB4C2561D4;
	Fri,  1 Aug 2025 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KpXd8Kbt"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF313248F5F;
	Fri,  1 Aug 2025 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754054217; cv=none; b=sFUetNTWQ/QJxA8DOlRYNFKYwmGozPMOSdbVJZ5sdSVnAnC2Wub0aT2oPBGfy0V8G7uiQ1PIXckXdNASi4c27u7TXXISSkSlZQK6drIGw0562JBG2NTX7U1/WlagaauOuhHnOc3Jpd3164MmMs5vew2Rx+B5aUkjCySMMR5UZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754054217; c=relaxed/simple;
	bh=5ietD06f8Z2UeewCIdXHPrS5WF1AM8TGkC/CX4qWjOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSu/hA8rd3yGLKb384SbVKuTtDRRTArqiKugJzWwaKKUOjDzaAQ9joHEqR6+jgU5Dd2JSSdABp7wh2j1VjJgsa/pEmwUcgyGJTw1AtA75Gd0hBreHJsWkfxbdmiNRPD6ic8MLDbMmeD3MEni/9pLvQuUDSo+iK/N3PqhxLTVTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KpXd8Kbt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754054213;
	bh=5ietD06f8Z2UeewCIdXHPrS5WF1AM8TGkC/CX4qWjOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KpXd8KbtYIbC53CV9/bcGCey1JzAGtn6x3OO5N98xTgrg1IeDe2C8YthWcPUhfGyE
	 eI9quD6l6FzrXt1ILTbSibNwbcfNI0i+Q+qLjkAGisU+klqbsdQ+CH8Gj1kSz5nceL
	 2QrXgEl2pt9CKrCW6+Rc5YnhM72Tto3/e1ue2S4j6y6C58rlzZZx/12MK0OFDWB2zw
	 A71ac4k9WddICRILXNb2SSFIXX58uIDEDeImTH2+uHPLuj1jNHzZkd1rXmBm1HNInB
	 nKgC5pixmsB95nKIl7xUmG1Hqaj2VYeCCp/tXjPQrTJ06w9Fn1NvYmTsDBym6Y/egh
	 D5B7pW0PnUbxQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C529417E0DD7;
	Fri,  1 Aug 2025 15:16:52 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 15:16:49 +0200
Subject: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

A recent commit in linux-next added support for key events.
However, the key release event is not properly handled: only key press events
are generated, leaving key states stuck in "pressed".

This patch ensures that both key press and key release events are properly
emitted by handling the release logic correctly.

Note: the code was introduced in linux-next by commit
bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
and is not yet present in mainline.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 50e2e792c91d2626d3f282d04a1db60845827ef2..0f9a589306482265f1f65c5a100b3f4aba0a2ed3 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -129,6 +129,7 @@ static const struct mtk_pmic_regs mt6359_regs = {
 				   MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6359_TOP_RST_MISC,
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
 };
 
 struct mtk_pmic_keys_info {

-- 
2.50.1



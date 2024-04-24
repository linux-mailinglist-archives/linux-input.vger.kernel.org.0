Return-Path: <linux-input+bounces-3222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 682038B0210
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 08:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A53B241D3
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 06:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464FE1581F2;
	Wed, 24 Apr 2024 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0fkbWy+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162321581E4;
	Wed, 24 Apr 2024 06:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713940536; cv=none; b=tTXElXf2oKqFc3nN9VpWIQG0yV3pRMUoUvppMa0HUo55IS3ZTXDXWw/iJZban1vdpMoP5FWvuNX+yNqDZyRppqJ4ME2zQfVSxKkPTrPGtx7klvHbTuusKn2oRvQQNT1EnlbtsEcCk/qdIDof/6TlRZ6EAT0ke2tnv8FWW9BT2ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713940536; c=relaxed/simple;
	bh=EX4OZ4ahslVLrwePlI3E2P5OznuRrbR8wOc2lzkSgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZiBUC1fiF36JdJPZx011hhvPhmRwEswnAM/WT9fm20duZjQKwBgEvqnjk5AtHb/LpsFmpJ5ZjN+3UupKQj13mgJibIfkEbWbHBQwqnAvxnYIVt4ccZuQettFhit2uqbgnb3LC1ShbgGmR9I2+Ynn0Ewipm4kRPXOVYXnPGn5ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0fkbWy+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED99AC3277B;
	Wed, 24 Apr 2024 06:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713940535;
	bh=EX4OZ4ahslVLrwePlI3E2P5OznuRrbR8wOc2lzkSgdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X0fkbWy+dNM1LIbT2x8cCe8NBeQPVJ6WUyJDyVxzDiNY8od5cdJGgmAUFJNSayOc5
	 dh7aGTnz16QjsnpLJYV3Yce788thyI/GrNkMW2efT9AmNx3wBxpABs41rwtspEgJiS
	 KEB1dWyMolTKoWejwN85D1vd6jCuscNM8PYrhDceAIM27IbFXPUp7nI0zAio4CRZ7m
	 O5oK5wM+39qlhTjCR8nGtAfGoSFgv4F3k3agfpA/rL8leh5pO9F1jfSkHQe9PMKEUf
	 9UpsZEeQV8bGITrgjiQZOLyN9jbSFsvGw348VdupKd2PFCQHF9WeBgxnCw0ai1ovzS
	 +9Y0GdK/HLtVQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:37 +0200
Subject: [PATCH v2 11/19] backlight: ltv350qv: Constify lcd_ops
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-11-1aaa82b07bc6@kernel.org>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=krzk@kernel.org;
 h=from:subject:message-id; bh=EX4OZ4ahslVLrwePlI3E2P5OznuRrbR8wOc2lzkSgdw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfnU8+cFrmEgouxxsFm9Cih66qdG2WZEmJSw
 ID3byntUvOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin5wAKCRDBN2bmhouD
 155bD/419r9Trn2nvF0pbnKMBFNVwncLlnIZlhkfYESVlReWbejYNtl6uk3BVlakWnY/IGiyaan
 Zx9NZ3h0z7PawISPu8PDlvBtu+bF4OqqVseY1P+AP95VVGKaeE7pX7pqsIreictSdxqliGTL3BL
 wA8do+RuwOMQheR4MSfwqPwOse9rPqYiCKxFikcjRmzPgQ/X+hUVEQ6HJJ3pO1f+D72g5VcbZvX
 2/xMvotX3kKZEBaV+2zot/w1Eey4tsofgC3Nba60ACBigSo3h2dQ4teuUlcZCk7+4n86lA/cGyV
 USjsk2Wua4gfgmHfqseftv/d7De5mJtQG66MDLWK1qHRf5NbPGG+yREZeW6DWuwlZGjbz0plcAl
 Fgndy/vkxaiLrgVjHRIcIZJCQ9YjEp142Zh9dSpu1lOTRrLWhjTubgwcBkuFxP/xCPKOh6c0uSj
 VXQBTvMvCnodNR5JHqxc6UV0q/cnl0X/8eHLNJW9cWkYLtgMyP+4D5BZjOIajSCY3k1UQOQble9
 FBBie+fOF3OMejmTzRbKxC1gh4bCT8irq/NVDTzCfuq0W8mHYJt6/kPsUkAaRHttRcrbeGCCDZ5
 H4GlQ5P7H/CzJrmmW67W7u2JhUeTWCZZ0h/kG5k5Le7tvpv4e7T1bH4DLblFb23hARsCejDVoSe
 Q/B800KSZ6lwQCQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'struct lcd_ops' is not modified by core backlight code, so it can be
made const for increased code safety.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/ltv350qv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ltv350qv.c b/drivers/video/backlight/ltv350qv.c
index d54f501e4285..cdc4c087f230 100644
--- a/drivers/video/backlight/ltv350qv.c
+++ b/drivers/video/backlight/ltv350qv.c
@@ -217,7 +217,7 @@ static int ltv350qv_get_power(struct lcd_device *ld)
 	return lcd->power;
 }
 
-static struct lcd_ops ltv_ops = {
+static const struct lcd_ops ltv_ops = {
 	.get_power	= ltv350qv_get_power,
 	.set_power	= ltv350qv_set_power,
 };

-- 
2.43.0



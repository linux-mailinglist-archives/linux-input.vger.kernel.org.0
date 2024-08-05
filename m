Return-Path: <linux-input+bounces-5326-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3BF94732C
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 03:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CBDB1F21494
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 01:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB941422AB;
	Mon,  5 Aug 2024 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEZ/Yvj8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E6A3BBCB;
	Mon,  5 Aug 2024 01:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722822448; cv=none; b=M49DJFaBGi5ZfdwEyZ2bk4Wf61n+ZHIGxAYnD15T8Hqzixtcp5Td6e38S/Ru6P0+Tc/qkRbVS5Ovu8L3u0LLhrrOwCvXUZFwnoVAGiEWqVx3JMM2raum4KVG0a2Xle9McW4uRYCa+cfGcRZ3a2MIbozh+/kPyjxF/nWuECVeq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722822448; c=relaxed/simple;
	bh=8bB3loXHuxTdbn0Pa+bvxNatmKFAbx31tjgt9O+dFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF6z7MQFSu0g7kMhzkGQ5vACe8EwMV2sQ8ULdQ2lLgblCF/E2EgVq60LG+xSs4ssWSQdlHY2xBZN+o/qLMrj1k/aUGCx6nldlp+7ApjKjWxAwnKiVqak71ixBTEhWRf1AB3dsmZqrEcdKUhTY6odhCPypuWbQ8hX+B7vMRbqWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEZ/Yvj8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc49c0aaffso72670645ad.3;
        Sun, 04 Aug 2024 18:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822446; x=1723427246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2fTMTU2sCnO518NONvI840diOGxlwU3sQIVaxycmPg=;
        b=FEZ/Yvj8+80yJLbndZhRiID5jh+52G6WROIOqHuGK2KbQcr59cqxnqjqsYK//or7Rt
         3tRpD6rCQM0bMjj4SxopkGNlIvqHpDbNdW/7UsPKPuicCdaW53CtTSwU5YkMSfeRMlOw
         3pAncKxEs3MpAl1yy8lHWBETeL2bF4g2QsoLDHYj92UB9z5llQk/W3W6VK1eVevfGNX4
         zf4KIK3EHJcnKnxBPeTILsYAdW+vQi7VAjrre3QrxtI1InNY8oMnlcy7NRSy3YRAg9a0
         dbWNTC/Blza6wQwXjpduT2iVIMk+YggQB+7P7ZBs3paRLQdX4dPGSRg1MyGZ04xzczqJ
         Ul+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822446; x=1723427246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2fTMTU2sCnO518NONvI840diOGxlwU3sQIVaxycmPg=;
        b=sSpNdBkszbecNlv48vuzfOhZRHL7eubp/ohi4tBLJ+VXYLneZNDbQ7fNR55hJTVGfY
         wkvFT3s/03F51nN6bLfADWvjRjJF0RmVr9wGkL6m3VEW0OGfyDxvdsNyyOpvZQbWAjTr
         hiTZRV86fEeRJCXLSmXQqQHbPqzwALksbX4+rtnZBILxPiNi6tKP/zEI6oPfV9AvNwX5
         o0tjmkQcx/KWnZuM74a6VpGvmcL76NCrXzl0saIZxh4IQSFJL6ekeZh0M3tSf24SjXGD
         VS7XJlL0x5BTX+Gb/yMZM5pbf/HaG0xf+Yxj1MleBpoye/gqgzFvMBo5MGtfQcbBWbZ4
         uRnw==
X-Forwarded-Encrypted: i=1; AJvYcCWxBaq2h9aE4KXe2SrSodyiL+wsOaFud6Uu74MSwfRUJD7bGnB2GCGU6Zinbfg9E8RPcwynSlKuMGnpTz99zyOukNvwfNvq35g/m4d3hXndFnsKxSbbZjiX5TKDdx14tWD0irVkUF3Ys5E=
X-Gm-Message-State: AOJu0YwDt7Brw23dLg/KdxXPSeGhaGQkINQK74m93X1DjHwf5/jMklB2
	GEOAlKulrybhhJRFKj/04cVcIrgCJzhapJcT+55hlUrRnPszKyTp
X-Google-Smtp-Source: AGHT+IFGvfv0qGcuu0s9hpraRVdX+4qEf2sPdEvVVkHNnRbbklmFC1Z3IJaCt/qLGORFLVGSXNLLxw==
X-Received: by 2002:a17:902:d2ce:b0:1f6:f298:e50 with SMTP id d9443c01a7336-1ff574e697cmr111650735ad.58.1722822446358;
        Sun, 04 Aug 2024 18:47:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH 4/5] ARM: spitz: Use software nodes/properties for the matrix keypad
Date: Sun,  4 Aug 2024 18:47:07 -0700
Message-ID: <20240805014710.1961677-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Spitz to use software nodes and static properties to
describe GPIOs and other parameters of its matrix keypad.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 64 +++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 9a7dc7b8676d..690596f36979 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -378,38 +378,56 @@ static const uint32_t spitz_keymap[] = {
 	KEY(6, 8, KEY_RIGHT),
 };
 
-static const struct matrix_keymap_data spitz_keymap_data = {
-	.keymap		= spitz_keymap,
-	.keymap_size	= ARRAY_SIZE(spitz_keymap),
+static const struct software_node_ref_args spitz_mkp_row_gpios[] = {
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 12, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 17, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 91, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 34, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 36, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 38, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 39, GPIO_ACTIVE_HIGH),
 };
 
-static const uint32_t spitz_row_gpios[] =
-		{ 12, 17, 91, 34, 36, 38, 39 };
-static const uint32_t spitz_col_gpios[] =
-		{ 88, 23, 24, 25, 26, 27, 52, 103, 107, 108, 114 };
-
-static struct matrix_keypad_platform_data spitz_mkp_pdata = {
-	.keymap_data		= &spitz_keymap_data,
-	.row_gpios		= spitz_row_gpios,
-	.col_gpios		= spitz_col_gpios,
-	.num_row_gpios		= ARRAY_SIZE(spitz_row_gpios),
-	.num_col_gpios		= ARRAY_SIZE(spitz_col_gpios),
-	.col_scan_delay_us	= 10,
-	.debounce_ms		= 10,
-	.wakeup			= 1,
+static const struct software_node_ref_args spitz_mkp_col_gpios[] = {
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 88, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 23, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 24, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 25, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 26, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 27, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 52, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 103, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 107, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 108, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 114, GPIO_ACTIVE_HIGH),
 };
 
-static struct platform_device spitz_mkp_device = {
+static const struct property_entry spitz_mkp_properties[] = {
+	PROPERTY_ENTRY_ARRAY_U32("linux,keymap", spitz_keymap),
+	PROPERTY_ENTRY_REF_ARRAY("row-gpios", spitz_mkp_row_gpios),
+	PROPERTY_ENTRY_REF_ARRAY("col-gpios", spitz_mkp_col_gpios),
+	PROPERTY_ENTRY_U32("col-scan-delay-us", 10),
+	PROPERTY_ENTRY_U32("debounce-delay-ms", 10),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct platform_device_info spitz_mkp_info __initconst = {
 	.name		= "matrix-keypad",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &spitz_mkp_pdata,
-	},
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= spitz_mkp_properties,
 };
 
+
 static void __init spitz_mkp_init(void)
 {
-	platform_device_register(&spitz_mkp_device);
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&spitz_mkp_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create keypad device: %d\n", err);
 }
 #else
 static inline void spitz_mkp_init(void) {}
-- 
2.46.0.rc2.264.g509ed76dc8-goog



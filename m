Return-Path: <linux-input+bounces-11871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D33CFA94F44
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6E1F169E09
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53463263C78;
	Mon, 21 Apr 2025 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PvMscab+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC622263899
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230403; cv=none; b=diO0DfpbuCcJpqsnU11X0Y/2EAs4Wfda5nd4dZQMuFOvCsU0Ri4/VZ55c2U9ogPo4kY0x9C2cXkB+5MCq31RqM7joVdc5zlU3+koWDEiq3FBaTJNUY2t4sZCnKSIyLj5+5MX8rL4sWu8bCVCDXzvKI6FiM4WhJ2tEkFXBnqxSR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230403; c=relaxed/simple;
	bh=sy8ThRyRgU7oedwZh2khgThNY5WH15EZl03oVLUYUIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmhhXUcxkZQnLWMEKSS/MoPlvZWxYWiBhhhYYe/l+IGWpemA7/8onHgg3X131hLyLgHnENGowYkToBIcHaOYuT3ICzbpHVoDtU8L2ECBAGKHLORS/Qt+nx4U5RTwyxmgfPZqe6HINfNTK85GlNog0nSWUMwfHFWPZ93UREx0tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PvMscab+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3081f72c271so3261981a91.0
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230401; x=1745835201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=PvMscab+f/DdGlLJV6Ty2Gp1BVUtvDMJSxM1BFQkpaZRq2K7gf56rj2xE7+yhd4c0E
         3ITfuRNmnQeU1fVEHm/27tz7lyqLXmrI7hg78TdtVX8vhdkwGIODD5nIB0DxFFIOebLY
         WJiNvj7Uh609dX1cwfg9Xl7GE7BzPARmry/SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230401; x=1745835201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=obXPafoNsgNN6WxLCWHWKURp9hzdgGlv+Bk+YHBfkaGfwQo4nYM3VxI/mEWGkTwzXf
         alsbHe/pWPjdYSKZYMuexSVuITK286jtZajYYdLhjYlXFvsJV4jSMIoupRbLuXmY9nnP
         /Q7YThfD9AYoJ5rpIeUqOrPvO+zYhAhQVn8zKl6BSvT96dDm/WEkZE0wsVgFzcua1fZs
         XA2ipaIpC7M0KLI6fHGpoUvQ1RPiGtaV6UyEsyT7Li1G8wMbxm/SkqSbhWbAndhpCmpy
         wpoyqK3F1HoCUzsaAKF6jYvdAbvEOcZmowlj6SolFbfTP7hnZXCwdPPFKg7sgu2/cuIO
         saaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9qJ5VOkrQhd2z0HPpzX20YZUT5gzNIfCPaZpGV++EsW9/8+QRPbUY/sm/7SGmy+ggEj6NNOgL7WGYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzasfp7SXe04AEEXREF5j/db51luXwh21AWLro9rL/FxH+QSeZL
	K7CZX0HQGy1fb5KrW0DE0m3SngbtLsvRoyxO3ceO2O117VTlUS7TATl9u4RF7Q==
X-Gm-Gg: ASbGnctQPZPomXYXF1+Qb6rOXWTgo2ovFIIJUtNQbjsDEdMxH5hUXqmCWk0usNIxch9
	qJSK0l6nYbGSzGWw7L+sdv/91IH4ZpXmcCMKF5DvnVonZLJDQ/Uimgiw+5FJqqRtCZlZ5/Gvmym
	Xrv2ihqnfdNGGi1G/RtLHXL8VqoUB3lUnwEnqrQ6xvYKuNRNiclJvj4a8ynlSGC651Z6yo8BpjW
	3cM3A8sYazfxWBDNRtkSVszgEL9t4hXWUVJdO/Ecz4amk+SaEsa4nW2iRW9+YwY3g3NB1/NusHC
	4SQMOn0qVUjYqKvD91s3pLyIc4Calw/BDusSJq8g5MCvrIgg2vgHP/trpU8=
X-Google-Smtp-Source: AGHT+IHzGqLnsYoPPrUzas9aFIuhG2tfwpqW1sujdJRkCyGS/gKycIu8sZyY4IdNUXVMBMKhKzW5aQ==
X-Received: by 2002:a17:90b:4ad0:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-3087bcc8fcbmr14175251a91.31.1745230401151;
        Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Mon, 21 Apr 2025 18:12:43 +0800
Message-ID: <20250421101248.426929-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate device trees.

Merge the two device trees together and simplify the compatible string
list. The dtsi is still kept separate since there is an incoming device
that shares the same design, but with slightly difference components.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..ff67931e7821 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -73,8 +73,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
deleted file mode 100644
index d16834eec87a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-
-/dts-v1/;
-#include "mt8186-corsola-voltorb.dtsi"
-
-/ {
-	model = "Google Voltorb sku589824 board";
-	compatible = "google,voltorb-sku589824", "google,voltorb",
-		     "mediatek,mt8186";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
similarity index 76%
rename from arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
rename to arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
index 45e57f7706cc..cc805408a8b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
@@ -7,9 +7,8 @@
 #include "mt8186-corsola-voltorb.dtsi"
 
 / {
-	model = "Google Voltorb sku589825 board";
-	compatible = "google,voltorb-sku589825", "google,voltorb",
-		     "mediatek,mt8186";
+	model = "Google Voltorb board";
+	compatible = "google,voltorb", "mediatek,mt8186";
 };
 
 &i2c1 {
-- 
2.49.0.805.g082f7c87e0-goog



Return-Path: <linux-input+bounces-12928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70EADC490
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 10:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 291947AAF1A
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 08:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE71293B5F;
	Tue, 17 Jun 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eixLJDLF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90E295DA5
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148423; cv=none; b=iLtK3OFIDUZwBpnmkTFu/OGEQsU9qYX7kCplnxxK/B9moFOseicIaNOU+ke/+XHdjBer6jLSAi7WWJytCY7zAPMU316NdDvsjRvbpyWyQNvK6uLSPXl0O5t/6YL1c9GG85A3AkTRBPJnRGVHK8czAwuruBPG8fToMk8eBF/F5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148423; c=relaxed/simple;
	bh=qjRr++3nK/S0s+lP3ALUUbzeqRmkxOyEdtHPJW9G1pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLPdw6S/zZkqCVb/2VWp8F//ew8b3Aqwfq0xJOz8/aC7uR0eOr0xq5cKs3dTWO+2BLW7RUzO6kzTsdmasUtRJC1LbIO5I6i81I0sbo2n4gxI4kIugS+elD5ymJE0P9JHqm8D7TQ6kgqZM4HYFV+YuwJyqaQWlLeZVFWV5rtSc2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eixLJDLF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-236377f00easo70591795ad.1
        for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148421; x=1750753221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=;
        b=eixLJDLFtLfEu6BgIlsNUFus2iT+UGTyHiyLmAiFhXvY9zT2Srpx8VZxW+QaIBD3nc
         LV9/0vyzNhsNgtaXYNFnbd4qpeqHN7+G6Y3bylL+OOvZR0ZYyFdvJHNtgveM8VwLy0xb
         YApCNS0WuCLew21G0jpeCqn5hlylKa5viI5bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148421; x=1750753221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=;
        b=rjxZ9RtBDKNUFguWSOW9i3Xkyc9781SHCCkclAaMDUoyWJiIDMyewTikWyh91BvTg0
         wuJ1UWrlARXN3JF41ChZC24qwy+LP6Qg3vU9DkwRwkbGlN8iY0aXUDtrhCaz6bM8H0o3
         MQvYm5A/36Dsado5PL4RVBNvXi1vbor257fPyQ1onpnoGpZ3any7XH78d1MJSq5iylCv
         RbG+hJlRIoSMgL0dddSikL43qMXHcqf/YXYNHqWkhI9h4AsGzqJQ3V/qdr0KUf+gDIjo
         coIqEU4yaybT0TlNqvfn4oyCtWhuWfx0051XZ2VNyDT1HsdYx5SwZCfTzV6bwqfKNaTO
         ky0w==
X-Forwarded-Encrypted: i=1; AJvYcCVi+Bi6zEd1zvLMWk2auo1ioW3KJjvf35L1evy+UDuzailbkf5Z7dss1evrp08lRk9Gwpg7hYrc4NqK3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmsPmyw5anGw/WFmOQyfM2QrSrY+zYdTNpPxwdgn1i3ThvL3j
	SYPB5NCUjYKJMZIjRdyktw2u0Ik8gojnvAzR6fv3UqoWvccip/ZLUmaERFNlH/Q7xw==
X-Gm-Gg: ASbGnctw78luWH3Ye9u4U9EsrqiSsKSmbwUMUV2t0A0cMByFbkpVm7J9T62V+mQ9GH4
	5PC9OR2cr3VsHnlThUdmAYj992WdXirO/BPnBKOEAWKlqkUJTL+TmZpjmdQEb5RBBKgM+l8Pc4/
	7XbFIPZ9+KGY7MSFADZ5P8dsTKPFROjblJW6FJxCHDZx6HJss5ZEwcZqtbB3AkpnecryHwKq7k2
	1D+4i/ds+FYW87uGKeDzsfCVTZyS2UHMsVSq3eoSPNHQH4FRe/pOgrz+l53wqsj5lLGds/5yT0G
	CQKYueq0M6n5ma0oNOca9ASqKWhIEl6O5R6GfDk4LeZ4xTwmX/B+KtLwPAbg2OvLQHxV+0qjgsY
	tm/X6
X-Google-Smtp-Source: AGHT+IEY70uZwkZ9fnRIDDmKpg9uBUC73hKP0ryT3ds2gfv9hOkjBFwKd6TZX/WRDjwEzvut9oH02w==
X-Received: by 2002:a17:902:da85:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2366affb250mr198366645ad.14.1750148421026;
        Tue, 17 Jun 2025 01:20:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Tue, 17 Jun 2025 16:20:02 +0800
Message-ID: <20250617082004.1653492-6-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index f68865d06edd..a8b8796276aa 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -76,8 +76,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
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
2.50.0.rc2.692.g299adb8693-goog



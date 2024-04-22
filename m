Return-Path: <linux-input+bounces-3166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB118AD2A4
	for <lists+linux-input@lfdr.de>; Mon, 22 Apr 2024 18:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233D428C956
	for <lists+linux-input@lfdr.de>; Mon, 22 Apr 2024 16:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68E11552E8;
	Mon, 22 Apr 2024 16:45:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F09B154C16;
	Mon, 22 Apr 2024 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713804324; cv=none; b=cOHNvvC58VWd82Ez72kU2+jkKqlAoYy+he5vZ0D9IvnBH5eqEKq2cLEwfnRQjm5tHrVqXLRNd5T5n/iB8V/+dkGEUfF9bGHZ318ks+swqgBN3TKG0A8Ii3wNq2VRCuLGCvuMwSeXHzs7sCXqAoxipCUw2pAQoNdrWIgv/L8rMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713804324; c=relaxed/simple;
	bh=aEOIMLfaoyXNz3E643XQI4KPNx/VNDCEabn2Rbao1GU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JDX4mLiLLhbp9uk/5ho41JSRQUhW0V2ZAbrfVvhpjfEhKa4+WwgSq8hoR2Ms4M2WVi9mBRULSqFrWPkA6uvLoGhvMDwoFwv3ymsRJmUbUFSYIvnAv25hiG5d6k7BhSL121oslYlU0Kqz7V/8KTihC8U2yAq/iABOvpTczN95w3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35E1E150C;
	Mon, 22 Apr 2024 09:45:51 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FFFF3F7BD;
	Mon, 22 Apr 2024 09:45:21 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	James McGregor <jamcgregor@protonmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: h616: Add LRADC node
Date: Mon, 22 Apr 2024 17:45:11 +0100
Message-Id: <20240422164511.2488261-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422164511.2488261-1-andre.przywara@arm.com>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James McGregor <jamcgregor@protonmail.com>

Add a DT node for the Allwinner H616 LRADC describing the base address,
interrupt, reset and clock gates.

Signed-off-by: James McGregor <jamcgregor@protonmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index a061b69c07c2..58fb28f83feb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -125,6 +125,16 @@ sram_c: sram@28000 {
 			};
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-h616-lradc",
+				     "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_KEYADC>;
+			resets = <&ccu RST_BUS_KEYADC>;
+			status = "disabled";
+		};
+
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-h616-ccu";
 			reg = <0x03001000 0x1000>;
-- 
2.34.1



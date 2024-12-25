Return-Path: <linux-input+bounces-8771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1159FC663
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 20:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E89E1628BD
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 19:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E151BC07A;
	Wed, 25 Dec 2024 19:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="OjTI0p64"
X-Original-To: linux-input@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3B1B87FB
	for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735154860; cv=none; b=Fdzm1iT2vzb5P+rS7T4iVloqql5D0Go7CXbtUZCbT109N1QuH3YRXmh23noqGkmXxZpKMhEEUu4+kJcCTq9WoAPAd2HuenfrA5Yq+bZzuPL4Z3sWhsTZJYrPnfTVRDyl/rhhw+QWrqEcuy9nRndBGN9s9x/UjMtbL5csnqzjmcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735154860; c=relaxed/simple;
	bh=zKlthQVouyb2Nhnv1QTalWj8z3Gu6NWIWvkygJeWwRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1fXbXQXSOtIG26iMKGz7JMZH1D8a9RAuDqygJX8KaGpWfePHtuD5e7T15/wkI7DELeE5KV4YKxrCbg+AUp07YpONzzL9wEaD5hhrIDtkSmXAvATSySWC4J0+6HuQCE/cU3Io1Q0rdPpAdpZwgQawoW3Wtz9s1YWJp6wTvfHrxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=OjTI0p64; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735154855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5TwIvC+pogcjmLFzMEJfSARog3Ov5O6G7UbbZ1ELaQ=;
	b=OjTI0p64NaP3/yljJiC8m3FwQD4cgw7sRgLh0H0uWN779kN5uHlp5hm9Q5UqG+/bJBDQZD
	YF4vFvJIDJXjzjS2lEGSlWhJkqvumSw5JEh9qlM+5oGhmCMbbCqbEzVfxCIQidejrQ8M5p
	ni1PXGewnW9oj1VLvniL4d7syoPQ9Xh5niLifoAeKXJ03zZTY9uEObDKcQ1m7d1Z33F/PS
	Vn6s3YcVddzZds4cw3aEFSorCxie6TAKsbwYb9kdwhRTds9Arfs8e9D4bDb6Hin6XmPRBQ
	62aF+8mMbtLBZAvIHbd0LTlgrEaMnG4PYxhIexHaKr50e+SvweJ0U0d/iWE5EQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
Date: Wed, 25 Dec 2024 16:26:20 -0300
Message-ID: <20241225192631.25017-3-val@packett.cool>
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The mt6779-keypad binding specifies using a compatible for the
actual SoC before the generic MT6779 one.

Fixes: a8013418d35c ("arm64: dts: mediatek: mt8183: add keyboard node")
Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c7008bb8a81da..0aa34e5bbaaa8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1024,7 +1024,8 @@ pwrap: pwrap@1000d000 {
 		};
 
 		keyboard: keyboard@10010000 {
-			compatible = "mediatek,mt6779-keypad";
+			compatible = "mediatek,mt8183-keypad",
+				     "mediatek,mt6779-keypad";
 			reg = <0 0x10010000 0 0x1000>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_EDGE_FALLING>;
 			clocks = <&clk26m>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 9c91fe8ea0f96..2bf8c9d02b6ee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -449,7 +449,8 @@ pwrap: pwrap@1000d000 {
 		};
 
 		keypad: keypad@10010000 {
-			compatible = "mediatek,mt6779-keypad";
+			compatible = "mediatek,mt8365-keypad",
+				     "mediatek,mt6779-keypad";
 			reg = <0 0x10010000 0 0x1000>;
 			wakeup-source;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_EDGE_FALLING>;
-- 
2.47.1



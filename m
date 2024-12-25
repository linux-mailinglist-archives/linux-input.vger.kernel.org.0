Return-Path: <linux-input+bounces-8772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D82589FC664
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 20:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8AF188267B
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 19:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1008A1C3F36;
	Wed, 25 Dec 2024 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="CFDQeefp"
X-Original-To: linux-input@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D18C1C3F00
	for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735154866; cv=none; b=ZFSbop5svO4ia1fvhq1uhS0kDTEJXdPvTXiAWka5DnVHLiDsNKOl//J5gss+DUA9KoV8nAYG/NOrpJ2j3tDwySZNb7IByPGiSuRP+KVw+HxxuXb5DPAUoGwfCgtir8PiMORkyJgd3ubxYmY0hIgXgI1br4fjGEVUxh6XKlCyeOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735154866; c=relaxed/simple;
	bh=SiL5gWedbYGY8jpPXvhrDlFzNYQymdn1BIJrR8bk+nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjDpmhLz5XwLPycXjbWPnckAxvEdVkB4RrfuPnbprCkcUmvE/wMtHl2lSSIX9x47f13ymVFpg7Hptw2LHhBRnnemISRGtLH30YOcFDbjZb6EzoTX9FcQaSpxPCn/5v5V1b34LHsO2655lRLSt85Lm+lGAQkJaHeRmZvkLTSX5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=CFDQeefp; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735154861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooCP4AVj6ouf61L4l6iIgaeJr118tdjjjQYgYlz/msQ=;
	b=CFDQeefpWl35qibFOJxQB19HfXzQTL64mOoGsi7vOLZF42pQl5WEawIFFoJ3l0FrigyMfL
	mJJQcBRSTXtuaejIjQD3imFpqgTCeOMjhD0oglA5Ow5OqqHQNcGxydxB1KOPs1BSUe8rBt
	TWzp024niCUAllC8aZ78AGYky2JISF+EXq8k4+7V1IR1fK3biNofQVd0Fb6qLobLLSP5Sx
	A8OqTiojt7TxldJZLlTZFqKMSxbsVRG813n4RzL7/BAzfB06AWc9V96myFf4dsPjatJBV8
	BSB7cNEjp+5MMiKyd1ZjIpAXRZl4cItIVXK7eeJanAmKdmvBTTeFGnQ89QRG5g==
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
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8516: add keypad node
Date: Wed, 25 Dec 2024 16:26:21 -0300
Message-ID: <20241225192631.25017-4-val@packett.cool>
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

Add a keypad matrix node for the MT8516/MT8167 SoC.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index e30623ebac0e1..b5e753759465d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -220,6 +220,17 @@ timer: timer@10008000 {
 			clock-names = "clk13m", "bus";
 		};
 
+		keypad: keypad@10002000 {
+			compatible = "mediatek,mt8516-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10002000 0 0x1000>;
+			wakeup-source;
+			interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		syscfg_pctl: syscfg-pctl@10005000 {
 			compatible = "syscon";
 			reg = <0 0x10005000 0 0x1000>;
-- 
2.47.1



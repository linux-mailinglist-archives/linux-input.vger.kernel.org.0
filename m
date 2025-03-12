Return-Path: <linux-input+bounces-10737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F90A5DAC6
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 11:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99851645A0
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 10:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0369D241696;
	Wed, 12 Mar 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ab0LIHPZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64787245018
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776252; cv=none; b=DbSVjye15NiqhQ9lQ0epII1G9LIxIyAV0suR83DfueR8chDY1VDv5gYJxJqWU6fAbZt6c/Z5QVD/NBiNC6HCxUwloa2Uq5IQbaHbDgXLcpW/xnoEbXIGzhLJBxbzIHJaGgXP9xm66cLwqJpHkqd+swX6Y5WB1qGXRadSLVnI6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776252; c=relaxed/simple;
	bh=6KzaDgXAuvehobhCqyAsKe+VdJwH/17xKtj+Ekr5FFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjYIk7zktNgH5eOi64MP4KNM8iy//PTO7g5CzkAW7ezboE80itotKtkh5ANzKqyvDgJ9w8QY/fZsjhJcyWGbVip+j3UEz7PCXp8LkClZpFPrHPF5oXt1XytuzvyBrCulNZ2mp5+9p/VTiQkGRnfAjgLJtyVJtPeq0lcro6lnW/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ab0LIHPZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff4a4f901fso9849821a91.2
        for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776251; x=1742381051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0rwtvzwsfEIt6EQwRB6Y3EdYF6stdicwqbW9nbuzVU=;
        b=ab0LIHPZLA8cLUHMq6TTKDy6cAgfSQ2hIiexwCok/wJQBpRceP8hrEL5V+s4P9heLJ
         QIitd83uoFDv127DbI0pBFaegMTH32xNI5VjYyCXom1Cc0gHTJjRBR67W5fQWGAV0Oe0
         l+v3yAsNX+dj4uDcPQD64QGF/pU+hYD5PBmN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776251; x=1742381051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0rwtvzwsfEIt6EQwRB6Y3EdYF6stdicwqbW9nbuzVU=;
        b=cAK35iWjvVHdZX5QLvgmmRxjisuQfYmW/AXS/9Zqy9hW+4oE4vii0M4xNfkhy2Oy5F
         GtvRP2yEKKPaleRTjKrM5xDWpw50QIgKAetdGOR8ToZ+mJva77hssngx4uMSsps1BiJJ
         YbUh1vI/iu/dmkaJias5mzssAKl3nO3rAlVs9jlfFk+T2/zxDbezeZP2qXxcZjiFliOA
         IjWA+Yg1g8p2exFGgKIe9xiUIHJijaeXXdVyOujwuz/dzw366HiPtrSy5MeXxLvuXHmj
         PeLDU3cXgsNziWpYsfYezCabbFW39TzxLQ9uRT5v0eTvg5wGcGsitxWerJpb45ZPVqwC
         QAXA==
X-Forwarded-Encrypted: i=1; AJvYcCVhCbZ144f4muhWGpmAczdbMcrRXiHKDaaf0UTP0Qd69YABbynFCLOzL9rVckqpZ19TpMb+F8kfP/CaUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynBx4JsPOy0km3s7rYvgHvQ4xt3OBdDi+LM986xS9CdP7zQN3M
	3//t/7JRKlL71lr6Q7B8eMdFIKgJHvx/U9/s9voUJJ6n1I6I3aLJBUqLrVgzVg==
X-Gm-Gg: ASbGncsnU/vQwoQSqOX4hdnXbWRt27APfum7WgWnNsFxWPCIBqCwvT+HuPRrJlLrUCH
	CPmuc4oBVrXi1Hb97RcSueWUHa4grvVktXYo8aN0b8d5/axMkJR4hxCbGPOHsGKVeTtB/HX6yJI
	fTNlCb7PrazAj9T4xtoBnB+43Hob+hB1jAJ3QdXvTqEWZ4/a2qYllvQZ2chOmx1WU/5HKkloGHC
	sQJMS+hb77KoAiZC1Gm7eccPRuAWhZUjq2JiuA7lb9B9ZVDY+CfEwHs/ttl7gJqRZdW1PdUJrvG
	z40iBbihNMgP6hbPmbHaeYZO7uswJJB5eFOTS8Ci337hKhzjzRzyI56ufcg6XRs=
X-Google-Smtp-Source: AGHT+IFJEDyls+cbJCxBCdhAUNOO7qiruVd5yhiIVXsu3lvkvt9Y01tOY1MADvDbSxiriAzgZl2LFQ==
X-Received: by 2002:a17:90b:35ce:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-300ff0d4869mr9687514a91.8.1741776250694;
        Wed, 12 Mar 2025 03:44:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:10 -0700 (PDT)
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
Subject: [PATCH 6/8] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
Date: Wed, 12 Mar 2025 18:43:40 +0800
Message-ID: <20250312104344.3084425-7-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree for the MT8186 based Squirtle Chromebooks, also known
as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   2 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index ff67931e7821..77ce29608170 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -65,6 +65,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-squirtle.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
new file mode 100644
index 000000000000..f721ad4e5c97
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-voltorb.dtsi"
+
+/ {
+	model = "Google squirtle board";
+	compatible = "google,squirtle", "mediatek,mt8186";
+	chassis-type = "convertible";
+};
+
+&i2c1 {
+	touchscreen@10 {
+		compatible = "elan,ekth6915";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+
+	touchscreen@16 {
+		compatible = "elan,ekth8d18", "elan,ekth6a12nay";
+		reg = <0x16>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c2 {
+	trackpad@68 {
+		compatible = "hid-over-i2c";
+		reg = <0x68>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	/delete-node/ codec@1a;
+
+	rt5650: codec@1a {
+		compatible = "realtek,rt5650";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 17 IRQ_TYPE_EDGE_BOTH>;
+		avdd-supply = <&mt6366_vio18_reg>;
+		cpvdd-supply = <&mt6366_vio18_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&speaker_codec_pins_default>;
+		cbj-sleeve-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		realtek,dmic1-data-pin = <2>;
+		realtek,jd-mode = <2>;
+	};
+};
+
+&sound {
+	compatible = "mediatek,mt8186-mt6366-rt5650-sound";
+	model = "mt8186_rt5650";
+
+	audio-routing =
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"HDMI1", "TX";
+
+	hs-playback-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	hs-capture-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai = <&it6505dptx>;
+		};
+	};
+};
+
+&speaker_codec {
+	status = "disabled";
+};
+
+&trackpad_steelix {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index 822a177e7c19..8a196dc9a96b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -118,7 +118,7 @@ &i2c2 {
 	i2c-scl-internal-delay-ns = <22000>;
 
 	/* second source component */
-	trackpad@2c {
+	trackpad_steelix: trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
-- 
2.49.0.rc0.332.g42c0ae87b1-goog



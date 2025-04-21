Return-Path: <linux-input+bounces-11872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA8A94F47
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D95E188FE24
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A15263F43;
	Mon, 21 Apr 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TvL+E+3O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED610263F22
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230407; cv=none; b=jMjhbLTzo9zxvOU3wPYJ50RmUGOeFPakdZ0AI1gEkZuHUlYHjraRtMWbjMsVMFLvqq+mnNXjx/WPiEacOasgQB6qT1EoI9BRplJtLVmPtFH3wXArGJjVhgWSxxbtQhuyTp/onJhXO/xUx5QRF8i70T+fAsfjfRgppoLddZ7tRXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230407; c=relaxed/simple;
	bh=E6JFtxDZbzhj1oi4qP6ZpzahkFOgUu69fyYc5siUtFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crQ2T1k+IwL3oD3ywW1667Y175WoXupi05UidsywOxH7zwsceQ4oOk/+j6gKoPUTEezmM+3gzRcd4QLc/9PZoAitJBXOeiPxNqSCbPMsRmRMTipDnF2Z0L6tC6hXDUiSE74fqzJXBXgjzbvzGHvmt/kW/gX2tv9qY8mivz6N5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TvL+E+3O; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2279915e06eso39477585ad.1
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230404; x=1745835204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fI4INpVmKKLQ+GnUwLC8BM3GpY4ldbDIRRh2dXHIFMs=;
        b=TvL+E+3Of8NkfZWN+O7K1OgiD8A8+3A0LE/73JBDvW6jALz66CEdqUZR66ciNdHG2X
         yAA6r/C/KcazTvuptucquJfp+7rk5ksHPj8bxPSUywUIBQcxW5EMsMN8lB5QM0r5myIE
         p8A0KpILzL9j6BYbfGKNQxLkMZ2cO+cJeS7zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230404; x=1745835204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI4INpVmKKLQ+GnUwLC8BM3GpY4ldbDIRRh2dXHIFMs=;
        b=Pht113hQQR0r0R4qbAgePNsf9snbH+X2e4wEjgHFC4bIp9vdPJBCRDbkU1UBz3emgZ
         cEnGd3qNkyInugtseMgjZJKjkrey7iTuih7YL/0BHK22YeDHF6a2OOERgqOFMo8z+UKL
         PSL7l8NmH9Sn1f8nMxwNfpewV8op96GN17nfe9snHhWtsnIaX4NbiLKxWtivcwxxLHjb
         ZjNCWj3T276azI76/cFOnetyFGq/SLP3Z/ygIljHJrtdAij9fclratx+zK7bsNgzl8ke
         l7T91AjpK9jfc+UkQk52RVVRN79hzFzC/yAq1Zi4DeapyonEOo2Mqd5A7WR0/tVHIkaP
         02gw==
X-Forwarded-Encrypted: i=1; AJvYcCXUkahKaVPJSuMz8Di0iw4NgwrmW9FppyHYBC8GB9EIK62Ii0cVrcdeSw8CjD5xTqrc3/lIzXdCkiVbBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxwntI/NC4JZfvWIVF98AFDBn4ZkYrxaXAiiz4RhzIodmE+Uy
	+g25eQxZy2vjBkWx/uLWZSUz0tSrmT/6bZucP+YSqSjmOEBwI7kMQLfxo4coIg==
X-Gm-Gg: ASbGncuMD5C7Ko5aqYt58WWnoBRxcsxmbGqRJefM7XIfRvioMXZ81vUORYkKCuypAfJ
	fdR5mrK8zoYrLiIYAN9l82jc8Kb1k4IwQbjieVnLOo3PEvxj7a3TfAlO9m6rpW8U3roMefhC4Jm
	CMMmiK8l7sssYSE6CWRHJVjzRzw63WQpCzAbB2o4yr15he0e6PI9hhSC0pnUb1gNT2ilY4RyexP
	9pW+6ZgrKvlakaJquQeamcj8Be/MoPbeBOn7maBH8zpTUvJ6jVeh2MBJcTUWwgCh05UZh6XkxQh
	GuZPkUSwdKsDFR04Pk03vk7lZ5Ey1IOkoSFCIETgBCenkWbziPglCRGsURk=
X-Google-Smtp-Source: AGHT+IGEkbtC/fVUVtuk0XcjS/PS+i1YOa/LJMDWAqNFAJ0mD3J0gKfEIcrJJeHWHk1BOZIZJkjZmQ==
X-Received: by 2002:a17:902:d48f:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22c535bf828mr153722745ad.23.1745230404197;
        Mon, 21 Apr 2025 03:13:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:23 -0700 (PDT)
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
Subject: [PATCH v2 6/8] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
Date: Mon, 21 Apr 2025 18:12:44 +0800
Message-ID: <20250421101248.426929-7-wenst@chromium.org>
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
2.49.0.805.g082f7c87e0-goog



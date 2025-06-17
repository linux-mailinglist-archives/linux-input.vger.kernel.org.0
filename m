Return-Path: <linux-input+bounces-12929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E62ADC495
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 10:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3DEC167A6E
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 08:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48482980B3;
	Tue, 17 Jun 2025 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W9+d0LI8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B86293B5C
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148425; cv=none; b=uZm8EjGJnuMR/6Gqb0Hh50q8698tv4228oJYe8bsrvry5+578+1EhqFall6E/lwwjxzjPkC/r1w9zF19jVYfisc0i4MFZyhOdcwIkmtNEMu/OIJRSgpjft7vzCvg+jo/f7kRYc9hflT+qazJ721kRYjUOzbOsivwjcL9b9Q0W6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148425; c=relaxed/simple;
	bh=8yYHhsk6aMkF+7LDvlU62jXCOJIeWXFnbuZRr/rWNfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiTbkj1NhwYoU8qo4N0hpjLgbgQyD1a+DinurZBIxAqFN/pIF/64g9QO3r79DODAxJ9hQ/tOeqpCW6jq0OxmrLPNPL2SiGyoq0JFWAjCZePY11WyVZHfTqsC7e1iHTWJZTSGhbvJEKpQ2KQTXBaztrYnhVq/pRSLDO4Amk4gxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W9+d0LI8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234b9dfb842so48934435ad.1
        for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148423; x=1750753223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=;
        b=W9+d0LI8+UdMHmzRSI819lrmhq8Z/1urzXKx/QhCCgI5Kr73XTflATW40xQRb7pR7r
         8Wge0OBuNquzzBLYDm/fmJH75fwSDY3ijAZnTtaRr4b6MxSDqd1FyfXyGTSplLjDcp8/
         HkVpmaTvORVcevstAv2mBshgvutS2d1jGzJ4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148423; x=1750753223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=;
        b=TrZPQYbMF3bSmCuhQF+Ubeb/FcL7BBauDgt+gAMn69tmfD8JIylEiqGSrtgLStLoq3
         BL47pSOREYk0diwI5u6Kbu/aqzhb6J3OzA0GWMjTpHfbES/fhBfxVFGA46ANWzSovxWN
         WKEwCieeGjOyF1oOyY/1pasPI7KVpJ6x81ODDSk9ws/N1wD1LEicBzPq185VWD/2d/pn
         8gbHtNZk9FuCT9dzg/2zDuuKO75zLwYQCDWoXCdDIUPM9dkvm88LD/AztbSieuRfT5EA
         i5pC3X7KDw7qhHquWStgU43b75TWKbRUi81F8hqg61ZhwGDhq7ypxbye5l8uTD84VAiG
         igzA==
X-Forwarded-Encrypted: i=1; AJvYcCV13WK/akJZ7W1T/BHx0QAWaq7oUCKA2TB33077nm6XgY/MmsryoQxEt+m1BfUkWHJyg9bxU2RECE1gTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvj0ftpylWiaOaGkKB+LZ2ebgBZ7IbNGWTrEZLbYCAEFQU1szo
	0IcuiSzAPT0oUrLtnvUMJhWfc6WFw1Ob/+gvHl8WdW1gYFof+rZAk4vYDEgwGjN+0Q==
X-Gm-Gg: ASbGncsJCJBAjSSS2oMV+zNnpIO4SIEkVtFkQsZ6j+Nw4M10lpihx22VG5UxPG3iTsf
	oL/wV4JXE5yIDmoOHVBQkJuUEUS6/4CAkcRtXWxYve0fst2egF0kDAZIidYQga5m+f0HjxvXT+l
	Dn+T2syUr8VJQs2inS57KT36KKBOI1rrQFBSf064XSHtNskcYiID66HEyq7eWOi0MElWOZzUvwH
	AqBIk6CbpAq4FFYvvkF8sCCS2xDlsLY1FZjTtrKFyhcp9cjROM6Nu87Cg6Z68inApaFk4C0zuMk
	2JKD7skPEf31+1WUkmvy2yXMkTdpfb0+IclkYWDzgLZ5lYQtiAQZztYP4LOf9ilnU8Uy9OwrUuu
	u0w9C
X-Google-Smtp-Source: AGHT+IF4kxUCNX955eBUeMtmUp09tZHq5eVY7way6VVQf06qYS7+0eKNuGC1EFb0EH+rMHbB8Kt5lw==
X-Received: by 2002:a17:903:440f:b0:235:60e:3704 with SMTP id d9443c01a7336-2366b32ccafmr198804545ad.12.1750148423221;
        Tue, 17 Jun 2025 01:20:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:22 -0700 (PDT)
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
Subject: [PATCH v3 6/6] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
Date: Tue, 17 Jun 2025 16:20:03 +0800
Message-ID: <20250617082004.1653492-7-wenst@chromium.org>
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

Add a device tree for the MT8186 based Squirtle Chromebooks, also known
as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
convertible.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   2 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a8b8796276aa..a4df4c21399e 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -68,6 +68,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
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
2.50.0.rc2.692.g299adb8693-goog



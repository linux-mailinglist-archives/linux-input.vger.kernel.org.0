Return-Path: <linux-input+bounces-11870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D750A94F40
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A9A1892997
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7384C26156B;
	Mon, 21 Apr 2025 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K2sbUXtb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C09263899
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230400; cv=none; b=jekA5WcN4MmsorLMvh3ryTxeLIbI8K8wbwzuokrXNMtNCY4y8ddHITkOO/keTTqxJBJWZpwn3xw03LN13Fqkk9vUy6sXTm7K1af5TkkahYIlcG0r2aCUIZWosLmCIzIuAJNcuiu1tYLjV8FK9EFQ1HEfqXJ9EaFtMi8DzAp2BEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230400; c=relaxed/simple;
	bh=5XUtMoDRCkTRdh5mvmKCDd+dNP+k6uqdEMLM9UzaAPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXvq5OJ2hEPkCIFRZrMe24aMB2qohGB4V+ZFCZYdRbr3jZMNlhjDhmtjvM+J4LqAG5qFMN9O3vauimbIe6ilCapHLB0M4JAgxszlDauDlCxXK2QEdYhW2/Jg9Hm1LCtVQQmIz2htRLOfifp5ofWCShgNx3Ocwt7pNa4RubW7Er4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K2sbUXtb; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227914acd20so37784055ad.1
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230398; x=1745835198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=K2sbUXtbUh1cRDl8NZDmLiX91RIqGJNb+Bq0jP7fQ3XlCd2dz6GAD3K8SYRI7HnCAI
         qyIGyQAN/diBee4zge3BCcrEP4dGKX1lEDMfK6o45WsHdVC4pSQHumL0HQbM36JI9Q7f
         Bs0jK2ycNfd3MmEgVJu47QhZJorFX61S66Qvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230398; x=1745835198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=wRUEiYchxHZSufMaEdxT+bY3ukuDRqQ+SZJo289uyg331oNfnCPaD/OVKvtK+6ymUu
         GuHuxCLQkQt6J4AbfOlY5wHSMx7H25xq4smFsFNh66qGtr8yqaCed7QLtuuk2m1/kU5L
         ppPgc8tWdogMVzJgjozuwrBNmbAxlWIdrfKSPzreqnKfse7JH7sGRQlqNB6jbMYqOt83
         2Hc1ALgvokX+2j4EUZpY8lt3nGzgEucP0bOh/vWPHajRgrQCgvp/zYEVZPdc1t3kA78u
         mInV4FH0SQFCL5Z2qOGtB7TxIERgkD8851lbBalP4HQ9o81qRSlnfqvaNSbNx5GIyDKP
         d9Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXjDZNKHUCn3EMCdFuvX+5VNfJk2ZNWAg7ozgad8kFk1V0trW4C8DHdHzQ2CBYDffTK90FFEiaN2lF1+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZaq5HQppsFICBcVVYKkU/6MDlibSPd+ZudLqm66LSJ8FbXmbA
	E/O829iFNBGni9g80V/thCbPiey6++lp/uTa/Hka06uizxsEx/uI8wP4cnnQTg==
X-Gm-Gg: ASbGncvCQEVXcFm7vDWpZaL1onhHcHEdQNSRvy56SgavvsKNWmggkcutBRQse4VUBxs
	ZyH0yXnGkxZ6O7LRmzQzsuo5LotwlH8YH6+APfAeOMvGyILECZp+sthbfpkWuXAyTAuEHcUCOLd
	bNqQm3u8xzorckUmCbi3NdAGSYIIy2eHn/J8icJNtZlYD+2PTOS5ZarTJ3Xltvc3IoyCUqFhMuE
	A2/QPBKoY8p0Rja6EfB6ir5oxlzge/zSpA61MwvMCpTeklR2Cx8B+FcrfNOO/fb4gDHCyo22ExY
	myiZGRQ5DNqhAYuZWXP4Butg+yIcLxtYfQNHCe7OcB08ofmZVurYvinpcwa3mqPz8ZQnvg==
X-Google-Smtp-Source: AGHT+IF6rGXrSzCpvaNGhX4xciML4WX1Qp+Xf99qU1svwwhGPd2mOXprUmL/S+UqQYoWzSfytulsaw==
X-Received: by 2002:a17:902:f644:b0:224:7a4:b31 with SMTP id d9443c01a7336-22c53e38f33mr139591965ad.6.1745230398086;
        Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:17 -0700 (PDT)
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
	Douglas Anderson <dianders@chromium.org>,
	stable+noautosel@kernel.org
Subject: [PATCH v2 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Mon, 21 Apr 2025 18:12:42 +0800
Message-ID: <20250421101248.426929-5-wenst@chromium.org>
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

Steelix design has two possible trackpad component sources. Currently
they are all marked as available, along with having workarounds for
shared pinctrl muxing and GPIOs.

Instead, mark them all as "fail-needs-probe" and have the implementation
try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8186-corsola-steelix.dtsi      |  7 +++++++
 .../mediatek/mt8186-corsola-tentacool-sku327683.dts    |  2 ++
 .../mediatek/mt8186-corsola-tentacruel-sku262148.dts   |  2 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi       | 10 ++++------
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index e74e886a00cb..822a177e7c19 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -123,8 +123,11 @@ trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -197,3 +200,7 @@ pins-vreg-en {
 		};
 	};
 };
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
index c3ae6f9616c8..4dbf2cb73a81 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
@@ -17,6 +17,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
index 447b57b12b41..ee5bc2cd9e9f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
@@ -19,6 +19,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cebb134331fb..918f17385ba5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -390,19 +390,17 @@ &i2c1 {
 
 &i2c2 {
 	pinctrl-names = "default";
-	/*
-	 * Trackpad pin put here to work around second source components
-	 * sharing the pinmux in steelix designs.
-	 */
-	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
+	pinctrl-0 = <&i2c2_pins>;
 	clock-frequency = <400000>;
 	i2c-scl-internal-delay-ns = <10000>;
 	status = "okay";
 
-	trackpad@15 {
+	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vcc-supply = <&pp3300_s3>;
 		wakeup-source;
 	};
-- 
2.49.0.805.g082f7c87e0-goog



Return-Path: <linux-input+bounces-16028-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25584C51F88
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 12:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 036C33A8CD8
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 11:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A7A30E0C5;
	Wed, 12 Nov 2025 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk06i2YK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F68715ECD7
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946332; cv=none; b=ShKK49KkJTsad8QaW6YRuE69ogHjwwciDYKkKOyZvRAeUKzUmRFBe4WxBUv3AE2BV7rBhLf71N6nH/S02yV46SyqauWm2uFF8J6B/O19tIcQqKJyOKt73PVZkKCAuR+o+7B8y/NSpxgBlRzb/1Qm2mkOPFPaTjvyypWtecXF5QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946332; c=relaxed/simple;
	bh=cV5fF0qJO7pdpT8f2yzJ48FKOMe3eNyb1yjLf5hwPSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcHLDdCn0gpGFlwe8hl0EBO/2xWHhIhcLQN3gXepHxdY2pbETIAQqyV5TE5U+anqzK92suMpSCW3Xw6ly4TUFY2iZtuG147hEUq7E+lVrSh7ZP4kgaW8StB1rSMVWwV09dOFcR9zOcfHv/iPoM585/sQUpO4yy7ZOJ5DFeWZGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk06i2YK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-298287a26c3so7900185ad.0
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 03:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946330; x=1763551130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=Bk06i2YK/4G/N1zND76g9QO5VYP4E2cJr4Ycaf3iPh96lkebMG1smw/LdCmWt8LXbL
         sqIm5CrUhGgM0dJSbDY4k7bmjFKHcuaV7vwccX3DU+6QDIHjBB2CbNizL91vNtffTV8f
         FmgwcS2eCOL039z49ENwAo9ulu6EKmJKFs5ePfSRb0o4IuaKdEibaCN/tI7xPKHejQVn
         +PrLKryD4kTzOT2ZWgEqytkReKLETaAWF33u7HJJ7ufsXyWh2Qk7F8svPasvZFgbVI+x
         JgNolEaIVvgmyiqBlQR8ePgZMm0m+yrpPD1cqDENZ1Iz8TIVUzoA8mSs/XSEJFzqHxyJ
         DzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946330; x=1763551130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=lIlvDRSC+5GfI/lzNA9L4XVDpJoroa0aZ3OaYOgOD1ArNnBNVobNKrWyT87/WojkwF
         OYw2M3lNKEBFGb+oB3nE/ZivnJnt9qJMpzYOTkqeFNkmLQAIYSBQkrwjbuAOZWKiIL6P
         OIrq4eH22bFflcTRexEeKoAG9eoNtblC4/FkVBLEAIUJLtsfv5p+VnJU6GN9gyTRf82s
         yEaxdkRBvk+jELTAr97QrmI5Cp4nh7qxObSrV5CJ3AbtduMRZsrV8odQqTrVa4eAHA/8
         2yQtgONsJXksaO3ZIYaXY89dWQXyeSHWVads0WBTKLhLw9JuIG4IRMTGJT5UpqAQRPiW
         52ug==
X-Forwarded-Encrypted: i=1; AJvYcCUVA5uBOBj2Q7ZBRpfKsqpmP2v8DNNQuNJQPiOUJTi9cUx8N1xAVkbv1t1Rvt/xL79eDDlyiKee85xlPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgtqZg8ATDOPzkIHHzSJpLL+Nmp9zyX1rVaDvjVGRnd/43IxD
	ln+/TyJDnsf7C/U1g3KlF7+zVFTGfJRkAWu8XxM7ACjHgFlVY6BzZWz0
X-Gm-Gg: ASbGncu3zhUj90nQdQdZUZNTSaBtuGL9qMr0fPdPvrjRBV8lsQFYbbKSt0ylwIy4wko
	aWaGZlrDPc2hGzrLLVdwRaH9nJGmp04hZXcSdiq3VaLotmyBodzXovmWC4Vo8UCs+rCC+FOx28G
	2O++UBeiM1bnfp2i3y0es6kt+BgYY7uOVtmGXRmo1J6ZdX3uqHTyYewOpFeyiRvUN/KOSZ9xgkq
	vwuKxbU0H2gzSgJ8gbcKigZC/jeTID4ak/mcrf3wVGOfVA2/tyC/DGicL/dxrqDdl3FNhEE60GN
	NGGn8Gf3pLi5BjfcxVYzaYkz7sn0cTVIhGVKq9sppa59U+qo+VgR5vtYdePgmWhLzkc/2mOvtge
	PJNa45EXczbanAEHuJ3KnXjYpwucYf6v4ZfcK/QTPz3r0HQHOmMbER5FJbOT2O0zI1eq3QprFYG
	EU/Cxn009TQWfi1DsbzAcifkmvouYQalTOG1f0hw9Qs6PCPv1VKlsa0OICKCZkTFFcVgcF72LA/
	kOEkpKWsc12q1GBozCkUNar6kAwghUSIgtPH9KU29nmgq0ORfZbh4s=
X-Google-Smtp-Source: AGHT+IFR7QWTTs3Zcb/5ft94/X6vbUaJNlBlezavBVdQ/3VzVvLaCae6d4kQA/Kg2GnApMGUCG81qQ==
X-Received: by 2002:a17:902:e543:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2984ee16a71mr33782855ad.51.1762946329798;
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:56 +1000
Subject: [PATCH v5 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-10-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WbLk+4olybI4wwc+d0lxY+Dd90gh9RgPWEprBEz0Yao=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOcfOlYr8bFj60khS+5UQ9+ndU0LetjI3h5jenRAds
 vHv9vyajoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFTPsGBk2Hnku/XnVYdT5a8tbZ2TVdjOzRLv9rKet/G+5L3EV+bhcYwM3TMD+QP
 1Wg9YbJ+ZoGimuWT1km1Luw48U79aPqHg7cRgRgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.51.2



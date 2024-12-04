Return-Path: <linux-input+bounces-8385-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2839E37F6
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 11:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899A7169760
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 10:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D5D1B0F0E;
	Wed,  4 Dec 2024 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJBkbQca"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC93B1B0103
	for <linux-input@vger.kernel.org>; Wed,  4 Dec 2024 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309680; cv=none; b=IDuZK/a3f0E7jg1fUyoIJNhu7lRgGy/1N0t25dLm37Cq8dc1dOoUgA1VGJqMPJpxuza3UwI42Z+AXoI5hJlQDz1GklTndGRHo0gRYlTCpEbVzATFFSR7vR0QCYwvEAqXHwAeDE7B6OQLELdhI25ck0bBGQYyWBLt6qofbknlh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309680; c=relaxed/simple;
	bh=IVTuEF9PfaQpMp54Wh8h+mUp8nHxErDQUanmDJ3asS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gzJe26oRXrcSxmGcHukizgkttkEso5q/yEHZJ5jVobnnRtbHcNvlPssLwHF+E8SXSMNRix7w0FWt8plKRiH412IZcc79+ki0jWdxEbedtkN3yEHgYD+0H4Hpwfa/uHPDKwPBvOtbRzemeAlJ8Uf1p1l0NhVdr3S6Z+9Z5N6rgPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJBkbQca; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385de9f789cso3732565f8f.2
        for <linux-input@vger.kernel.org>; Wed, 04 Dec 2024 02:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733309677; x=1733914477; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXonveUFexqTc7GT+APSjcQQ2kmHpkmDVElwWyFI8sM=;
        b=qJBkbQca9QqgHJLshrWNgZwhgF8RxG48uCSNWr/UKwFtLkF/r6LlzU2IjeAeiE9QXR
         jhw0RkyMp53XY/lpUsPJZKZFVi4miOIaXxLkR/epSNAKmUAHN02hD/9juXc9ZE7q6qjl
         yx1gkvk5U25ZMbyuDzOIcCTpcJPHstjPuEYDKdISYhRfzum8ufm3c640Y+KAFY3dYFZN
         8tVUpn1KeUTtYP+qzkQ8g95axBluRZAaj78+v5cHKkFuj9EiT6V/d339ZBne8mAdMVd5
         7b29sHz/Yd9hcQrP67SAKL5ehhIRQlxr9QGSMWv/LR3u8YaYyQIQPjO/V5EHcajTSx3S
         PPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733309677; x=1733914477;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXonveUFexqTc7GT+APSjcQQ2kmHpkmDVElwWyFI8sM=;
        b=rGCfN2NkmAd59uIcKTVDiMTB/JO7lCM6DbYGYX9ARL8zSeUsyLXpO3MuMIfN849yEL
         r8pFEOIVSmMFDvKHnLzpiXg7DiQNo3BQFyMuVhh3AOO5hOmMGr++WxuymddnkExLUx0b
         jqaofWo+vvXnzSgQ66vF8SsRuNIGToALTvlMixztOH41IzS+ftFCttA8hlldG8f72GXg
         rAFOMtENIJkYyCOw1pGNVIYCx0n7SGETOV5LNw49ckpV6VwR214a4VjVOBq8kTsG4d4j
         QBfVdUVHNDa+FvsEG/Kki8MiBMg0BguSh97BWy0ArJrP1OCs019bjhCS1mnduoEhXxq/
         X6bA==
X-Gm-Message-State: AOJu0YzRcbohB+lNEiOfqUlyUFqfB6t/zPoBpaOaooHZ0De8Z+06JoHq
	oI9tCujH7KOz2wHw7Ycw8wj5WXX+Ysz71PXyDmJ6C5ngc8XHTrZi0qgRIDRJ1BE=
X-Gm-Gg: ASbGncuAdJxZZZop3vF8mYJECX7mgLTdiHbAxIoZwobLNj6mkL6vzysA1DWyJSOqlMI
	3F23V9ZBsdPkETG1NY2vQOUwjxY1oI8LPG27Nr0iwnw3M1Mc96edqMTNrIGMLBunPTI3oDAw507
	ud1olrssEe0ZoI75ewbFTgmzL/9XuP+loWj+ly6jLtPEAs9ifpjUVl0gu2WbpNAEHD3n2mTYL1S
	owPPgehv9ghI7l02bOJ1JLeJBM8W5mgzbBRbiuSk+JSc3+WKzK8fh03sT8EfV1TAt7PtwU=
X-Google-Smtp-Source: AGHT+IFxXc7jugmydClMLmH2aMVRNjy7vMWMUU7Gkxp4tlOusBPtmbXIutfsZ7afJdnn0+kcLkW5hQ==
X-Received: by 2002:a5d:6485:0:b0:382:d7a:315b with SMTP id ffacd0b85a97d-385fd3c699amr4776065f8f.11.1733309676973;
        Wed, 04 Dec 2024 02:54:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e940fef3sm11678665f8f.42.2024.12.04.02.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:54:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:54:35 +0100
Subject: [PATCH] dt-bindings: input: convert dlg,da7280.txt to dt-schema
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-da7280-convert-v1-1-0f89971beca9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOo0UGcC/x3MMQrDMAxA0asEzRXYIiWmVykdhKw0GmoH24RC8
 N1jMr7h/xOqFtMKr+mEoodVy2nAPyaQjdNX0eIwkKPZk5ux5d0Ef1YFIy8UHEpOh5aG5HRljs8
 QhGH0e9HV/vf7/en9AoKMfJJrAAAA
X-Change-ID: 20241204-topic-misc-da7280-convert-20efaad588ca
To: Support Opensource <support.opensource@diasemi.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12701;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IVTuEF9PfaQpMp54Wh8h+mUp8nHxErDQUanmDJ3asS8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDTr0gpJ1D3jjhcoV8hRd7mpVPmC+m8DpxEUydRC
 mIt9sxGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1A06wAKCRB33NvayMhJ0SQdEA
 DOFLHiHYkKYMt7iwFTcMBFn86YCzIX26JBTzC2ZDQ88e9WINatmsHISiPu/61UnvNZkbNA8EuOfuFK
 CHODacCAEPWMLfV21zqxlne2d3rrfkztmrIYlANj546GR541xRsj/bfLxDw+gehP891UB5OGX0x72S
 XYFHOF38q1st529KdvsCYbCMMTNUXv6qU9ALbZ0SUAyki5TGbbN4/XJFv7OcjLv1FcbdNAEKjwGoS5
 Sqz7GcxAL1YbZVfCE9gnfHe8p5pIYvpcz4Le2GhEYqFRH1fBbBVucb08xBWrtiUSA9KcvddH1x9Yp2
 sYI2wONwXoOQAv0dHwrbshbomqYKtoQoGAQdQIjjXGhFW+eOC0J4zJYp5V0NefvhcW7PM5IM4FYHTH
 77mMZZ9WOkg6oLaEju+ch2KB0XgdyJoQfN3eqYv850G25OplVV2K6MuKSTtEK1R/rupcQGOI6Weldo
 iIwc0jNI309xCM9xX8Oqg85BG8DTWgx5b17EriV1mHWJha3tvCDefLKL0OSx8uO7hiJESX4DAwC6lU
 f+mbNZqgRc1RpWAnRbIOjyCddUW8st+yrUqBJS7SIYtsaz98gLIKtryKevPuUCVYN5FDyAEPwg+bjU
 pSY5NGEXWRoKVqSLPjHuCJxZUfhvSh0w1xBoBgDQjo8KoI0gXWDqxbSXYkUA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Convert the Dialog Semiconductor DA7280 Low Power High-Definition
Haptic Driver bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/input/dlg,da7280.txt       | 108 ----------
 .../devicetree/bindings/input/dlg,da7280.yaml      | 238 +++++++++++++++++++++
 2 files changed, 238 insertions(+), 108 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/dlg,da7280.txt b/Documentation/devicetree/bindings/input/dlg,da7280.txt
deleted file mode 100644
index 96ee5d50e111b85ce680eadd0276280e706bb4cf..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/input/dlg,da7280.txt
+++ /dev/null
@@ -1,108 +0,0 @@
-Dialog Semiconductor DA7280 Haptics bindings
-
-Required properties:
-- compatible: Should be "dlg,da7280".
-- reg: Specifies the I2C slave address.
-
-- interrupt-parent : Specifies the phandle of the interrupt controller to
-  which the IRQs from DA7280 are delivered to.
-
-- dlg,actuator-type: Set Actuator type. it should be one of:
-  "LRA" - Linear Resonance Actuator type.
-  "ERM-bar" - Bar type Eccentric Rotating Mass.
-  "ERM-coin" - Coin type Eccentric Rotating Mass.
-
-- dlg,const-op-mode: Haptic operation mode for FF_CONSTANT.
-  Possible values:
-	1 - Direct register override(DRO) mode triggered by i2c(default),
-	2 - PWM data source mode controlled by PWM duty,
-- dlg,periodic-op-mode: Haptic operation mode for FF_PERIODIC.
-  Possible values:
-	1 - Register triggered waveform memory(RTWM) mode, the pattern
-	    assigned to the PS_SEQ_ID played as much times as PS_SEQ_LOOP,
-	2 - Edge triggered waveform memory(ETWM) mode, external GPI(N)
-	    control are required to enable/disable and it needs to keep
-	    device enabled by sending magnitude (X > 0),
-	    the pattern is assigned to the GPI(N)_SEQUENCE_ID below.
-	The default value is 1 for both of the operation modes.
-	For more details, please see the datasheet.
-
-- dlg,nom-microvolt: Nominal actuator voltage rating.
-  Valid values: 0 - 6000000.
-- dlg,abs-max-microvolt: Absolute actuator maximum voltage rating.
-  Valid values: 0 - 6000000.
-- dlg,imax-microamp: Actuator max current rating.
-  Valid values: 0 - 252000.
-  Default: 130000.
-- dlg,impd-micro-ohms: the impedance of the actuator in micro ohms.
-  Valid values: 0 - 1500000000.
-
-Optional properties:
-- pwms : phandle to the physical PWM(Pulse Width Modulation) device.
-  PWM properties should be named "pwms". And number of cell is different
-  for each pwm device.
-  (See Documentation/devicetree/bindings/pwm/pwm.txt
-   for further information relating to pwm properties)
-
-- dlg,ps-seq-id: the PS_SEQ_ID(pattern ID in waveform memory inside chip)
-  to play back when RTWM-MODE is enabled.
-  Valid range: 0 - 15.
-- dlg,ps-seq-loop: the PS_SEQ_LOOP, Number of times the pre-stored sequence
-  pointed to by PS_SEQ_ID or GPI(N)_SEQUENCE_ID is repeated.
-  Valid range: 0 - 15.
-- dlg,gpiN-seq-id: the GPI(N)_SEQUENCE_ID, pattern to play
-  when gpi0 is triggered, 'N' must be 0 - 2.
-  Valid range: 0 - 15.
-- dlg,gpiN-mode: the pattern mode which can select either
-  "Single-pattern" or "Multi-pattern", 'N' must be 0 - 2.
-- dlg,gpiN-polarity: gpiN polarity which can be chosen among
-  "Rising-edge", "Falling-edge" and "Both-edge",
-  'N' must be 0 - 2
-  Haptic will work by this edge option in case of ETWM mode.
-
-- dlg,resonant-freq-hz: use in case of LRA.
-  the frequency range: 50 - 300.
-  Default: 205.
-
-- dlg,bemf-sens-enable: Enable for internal loop computations.
-- dlg,freq-track-enable: Enable for resonant frequency tracking.
-- dlg,acc-enable: Enable for active acceleration.
-- dlg,rapid-stop-enable: Enable for rapid stop.
-- dlg,amp-pid-enable: Enable for the amplitude PID.
-- dlg,mem-array: Customized waveform memory(patterns) data downloaded to
-  the device during initialization. This is an array of 100 values(u8).
-
-For further information, see device datasheet.
-
-======
-
-Example:
-
-	haptics: da7280-haptics@4a {
-		compatible = "dlg,da7280";
-		reg = <0x4a>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-		dlg,actuator-type = "LRA";
-		dlg,dlg,const-op-mode = <1>;
-		dlg,dlg,periodic-op-mode = <1>;
-		dlg,nom-microvolt = <2000000>;
-		dlg,abs-max-microvolt = <2000000>;
-		dlg,imax-microamp = <170000>;
-		dlg,resonant-freq-hz = <180>;
-		dlg,impd-micro-ohms = <10500000>;
-		dlg,freq-track-enable;
-		dlg,rapid-stop-enable;
-		dlg,mem-array = <
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
-		>;
-	};
diff --git a/Documentation/devicetree/bindings/input/dlg,da7280.yaml b/Documentation/devicetree/bindings/input/dlg,da7280.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b9cdf4543598cc1637061a63a1143f541bf22b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/dlg,da7280.yaml
@@ -0,0 +1,238 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog Semiconductor DA7280 Low Power High-Definition Haptic Driver
+
+maintainers:
+  - Roy Im <roy.im.opensource@diasemi.com>
+
+properties:
+  compatible:
+    const: dlg,da7280
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  interrupts:
+    maxItems: 1
+
+  dlg,actuator-type:
+    enum:
+      - LRA # Linear Resonance Actuator type
+      - ERM-bar # Bar type Eccentric Rotating Mass
+      - ERM-coin # Coin type Eccentric Rotating Mass
+
+  dlg,const-op-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Direct register override (DRO) mode triggered by i2c (default)
+      - 1 # PWM data source mode controlled by PWM duty
+    description:
+      Haptic operation mode for FF_CONSTANT
+
+  dlg,periodic-op-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 1 # Register triggered waveform memory(RTWM) mode, the pattern
+          # assigned to the PS_SEQ_ID played as much times as PS_SEQ_LOOP
+      - 2 # Edge triggered waveform memory(ETWM) mode, external GPI(N)
+          # control are required to enable/disable and it needs to keep
+          # device enabled by sending magnitude (X > 0),
+          # the pattern is assigned to the GPI(N)_SEQUENCE_ID below
+    default: 1
+    description:
+      Haptic operation mode for FF_PERIODIC.
+      The default value is 1 for both of the operation modes.
+      For more details, please see the datasheet
+
+  dlg,nom-microvolt:
+    minimum: 0
+    maximum: 6000000
+    description:
+      Nominal actuator voltage rating
+
+  dlg,abs-max-microvolt:
+    minimum: 0
+    maximum: 6000000
+    description:
+      Absolute actuator maximum voltage rating
+
+  dlg,imax-microamp:
+    minimum: 0
+    maximum: 252000
+    default: 130000
+    description:
+      Actuator max current rating
+
+  dlg,impd-micro-ohms:
+    minimum: 0
+    maximum: 1500000000
+    description:
+      Impedance of the actuator
+
+  pwms:
+    maxItems: 1
+
+  dlg,ps-seq-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      The PS_SEQ_ID(pattern ID in waveform memory inside chip)
+      to play back when RTWM-MODE is enabled
+
+  dlg,ps-seq-loop:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      The PS_SEQ_LOOP, Number of times the pre-stored sequence pointed to by
+      PS_SEQ_ID or GPI(N)_SEQUENCE_ID is repeated
+
+  dlg,gpi0-seq-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      the GPI0_SEQUENCE_ID, pattern to play when gpi0 is triggered
+
+  dlg,gpi1-seq-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      the GPI1_SEQUENCE_ID, pattern to play when gpi1 is triggered
+
+  dlg,gpi2-seq-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      the GPI2_SEQUENCE_ID, pattern to play when gpi2 is triggered
+
+  dlg,gpi0-mode:
+    enum:
+      - Single-pattern
+      - Multi-pattern
+    description:
+      Pattern mode for gpi0
+
+  dlg,gpi1-mode:
+    enum:
+      - Single-pattern
+      - Multi-pattern
+    description:
+      Pattern mode for gpi1
+
+  dlg,gpi2-mode:
+    enum:
+      - Single-pattern
+      - Multi-pattern
+    description:
+      Pattern mode for gpi2
+
+  dlg,gpi0-polarity:
+    enum:
+      - Rising-edge
+      - Falling-edge
+      - Both-edge
+    description:
+      gpi0 polarity, Haptic will work by this edge option in case of ETWM mode
+
+  dlg,gpi1-polarity:
+    enum:
+      - Rising-edge
+      - Falling-edge
+      - Both-edge
+    description:
+      gpi1 polarity, Haptic will work by this edge option in case of ETWM mode
+
+  dlg,gpi2-polarity:
+    enum:
+      - Rising-edge
+      - Falling-edge
+      - Both-edge
+    description:
+      gpi2 polarity, Haptic will work by this edge option in case of ETWM mode
+
+  dlg,resonant-freq-hz:
+    minimum: 50
+    maximum: 300
+    default: 205
+
+  dlg,bemf-sens-enable:
+    type: boolean
+    description:
+      Enable for internal loop computations
+
+  dlg,freq-track-enable:
+    type: boolean
+    description:
+      Enable for resonant frequency tracking
+
+  dlg,acc-enable:
+    type: boolean
+    description:
+      Enable for active acceleration
+
+  dlg,rapid-stop-enable:
+    type: boolean
+    description:
+      Enable for rapid stop
+
+  dlg,amp-pid-enable:
+    type: boolean
+    description:
+      Enable for the amplitude PID
+
+  dlg,mem-array:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 100
+    description:
+      Customized waveform memory (patterns) data downloaded to the device during initialization
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@4a {
+            compatible = "dlg,da7280";
+            reg = <0x4a>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+            dlg,actuator-type = "LRA";
+            dlg,const-op-mode = <1>;
+            dlg,periodic-op-mode = <1>;
+            dlg,nom-microvolt = <2000000>;
+            dlg,abs-max-microvolt = <2000000>;
+            dlg,imax-microamp = <170000>;
+            dlg,resonant-freq-hz = <180>;
+            dlg,impd-micro-ohms = <10500000>;
+            dlg,freq-track-enable;
+            dlg,rapid-stop-enable;
+            dlg,mem-array = /bits/ 8 <0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                      0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00>;
+        };
+    };

---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241204-topic-misc-da7280-convert-20efaad588ca

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



Return-Path: <linux-input+bounces-13708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FDB148DA
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 09:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17B0318C0D30
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 07:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE025261393;
	Tue, 29 Jul 2025 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="cuTUFAY3"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD4A25FA3B;
	Tue, 29 Jul 2025 06:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753772379; cv=none; b=tx1KKFQIzNwdXrtTAdMcYn6slqRmxc9LEJQtScYa3i4YbUg13nPn6UaTBZjX0qEMu9ZW2v0xD8LNVn4Eafw4OAo0bXq9V7h1RXE82d5XgAkvAaxk+ucvRdSPPn2wpObVNmO62sgu4hcLV4RjuWDc/tgt/U6AsKje0oSe398+PsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753772379; c=relaxed/simple;
	bh=+u2npLuiOYYzuApasD/eb+of7z3Vqhml/QVftRZwHSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cAb9sRRU1r1K7GatxuPTXHfsG/WX5r4t6umNWt5azXhmyrKx8LshZwOz/0zqW0ZaqNWFXnbf93Hxq7i8LUAn23Rp/TupD7tlEcRja9s/ODa3kprGOAxUqDlA3EwxqxcTzsfWIygMP4Xf6LcfunVL1kqIt7o5zLigspVMxYkRvwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=cuTUFAY3; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tO
	E2rEC2EKMiPOxKhGqXtVXUa0TwU0/b/xoOLt4Rd0g=; b=cuTUFAY3znLDQtH291
	6L7QRXGNdCE9AqeIJhArQcz1QkQYERlCg4wNTzXLuRVYumKyUhLixQ6pCRHueqAV
	1L4HoGbRIYIi4Y83QcKVuIQxKqLbGmQbRngpY+ZdqAAXW5Spz1u21UE3lVirDSVm
	UQ/hwDiAkyUJRUYet2CcPwC14=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgCnjwClbYhou7D5Ag--.23794S6;
	Tue, 29 Jul 2025 14:43:56 +0800 (CST)
From: marlonwu@126.com
To: robh@kernel.org,
	dmitry.torokhov@gmail.com,
	krzk+dt@kernel.org
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	marlonwu@126.com,
	MenglongWoo@aliyun.com
Subject: [PATCH 2/2] ARM: dts: Add virtual GPIO input for VNC keyboard
Date: Tue, 29 Jul 2025 14:43:46 +0800
Message-Id: <20250729064346.22834-3-marlonwu@126.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250729064346.22834-1-marlonwu@126.com>
References: <20250729064346.22834-1-marlonwu@126.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCkvCgCnjwClbYhou7D5Ag--.23794S6
X-Coremail-Antispam: 1Uf129KBjvAXoW3KFykKFyUZF4DZF1UWF4rXwb_yoW8GFW7Ao
	W5Jw4xW3s8JF4j93s7tF43Ga45urW5Ar4rCa17Aas5WFW3ta4xWF9xCr4fJw18Zr4rJw1j
	g3s5Xa1rtFZ0k3Z8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RG89NDUUUU
X-CM-SenderInfo: xpduz0xqzxqiyswou0bp/1tbiJxeZDWiIYmHt7QABsG

From: Menglong Wu <marlonwu@126.com>

Implements a complete ANSI keyboard solution for VNC remote input
on ARM devices by:

1. Adding a device tree include file (vnc-virtual-input.dtsi) that:
   - Defines a gpio-mockup controller with 104 virtual GPIOs
   (startingfrom 400)
   - Maps all standard keyboard keys
   (F1-F12, alphanumeric, modifiers, etc.)
   - Follows Linux input event codes for key mappings

2. Updating MAINTAINERS to track the new dtsi file

The virtual GPIO approach allows embedded systems without physical
keyboards to receive full keyboard input via VNC while avoiding
conflicts with realGPIO numbering.

Signed-off-by: Menglong Wu <marlonwu@126.com>
---
 MAINTAINERS                              |   1 +
 arch/arm/boot/dts/vnc-virtual-input.dtsi | 569 +++++++++++++++++++++++
 2 files changed, 570 insertions(+)
 create mode 100644 arch/arm/boot/dts/vnc-virtual-input.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 658ef6619542..da69f516388c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27482,6 +27482,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/vnc-virtual-input.txt
 F:	Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
+F:	arch/arm/boot/dts/vnc-virtual-input.da9052_tsi
 
 THE REST
 M:	Linus Torvalds <torvalds@linux-foundation.org>
diff --git a/arch/arm/boot/dts/vnc-virtual-input.dtsi b/arch/arm/boot/dts/vnc-virtual-input.dtsi
new file mode 100644
index 000000000000..2937623d4099
--- /dev/null
+++ b/arch/arm/boot/dts/vnc-virtual-input.dtsi
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * vnc-virtual-input.dtsi - Device tree file for x11vnc
+ *
+ * KEY_xx references can be found in input-event-codes.h
+ * See vnc-virtual-input.txt Documentation file for details.
+ *
+ * Copyright (C) 2025 Menglong Wu <marlonwu@126.com>
+ *
+ */
+
+
+gpio_mockup_hw: gpio_mockup_hw {
+	compatible = "gpio-mockup";
+	gpio-controller;
+	#gpio-cells = <2>;
+	gpio-base = <400>;
+	nr-gpios = <104>;
+	status = "okay";
+};
+
+vnc_key {
+	compatible = "gpio-keys";
+
+	/* F1 - F12 */
+	vk_0 {
+		label = "vk_key_0";
+		gpios = <&gpio_mockup_hw 0 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F1>;
+	};
+	vk_1 {
+		label = "vk_key_1";
+		gpios = <&gpio_mockup_hw 1 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F2>;
+	};
+	vk_2 {
+		label = "vk_key_2";
+		gpios = <&gpio_mockup_hw 2 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F3>;
+	};
+	vk_3 {
+		label = "vk_key_3";
+		gpios = <&gpio_mockup_hw 3 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F4>;
+	};
+	vk_4 {
+		label = "vk_key_4";
+		gpios = <&gpio_mockup_hw 4 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F5>;
+	};
+	vk_5 {
+		label = "vk_key_5";
+		gpios = <&gpio_mockup_hw 5 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F6>;
+	};
+	vk_6 {
+		label = "vk_key_6";
+		gpios = <&gpio_mockup_hw 6 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F7>;
+	};
+	vk_7 {
+		label = "vk_key_7";
+		gpios = <&gpio_mockup_hw 7 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F8>;
+	};
+	vk_8 {
+		label = "vk_key_8";
+		gpios = <&gpio_mockup_hw 8 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F9>;
+	};
+	vk_9 {
+		label = "vk_key_9";
+		gpios = <&gpio_mockup_hw 9 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F10>;
+	};
+	vk_10 {
+		label = "vk_key_10";
+		gpios = <&gpio_mockup_hw 10 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F11>;
+	};
+	vk_11 {
+		label = "vk_key_11";
+		gpios = <&gpio_mockup_hw 11 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F12>;
+	};
+
+	/* Number */
+	vk_12 {
+		label = "vk_key_12";
+		gpios = <&gpio_mockup_hw 12 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_1>;
+	};
+	vk_13 {
+		label = "vk_key_13";
+		gpios = <&gpio_mockup_hw 13 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_2>;
+	};
+	vk_14 {
+		label = "vk_key_14";
+		gpios = <&gpio_mockup_hw 14 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_3>;
+	};
+	vk_15 {
+		label = "vk_key_15";
+		gpios = <&gpio_mockup_hw 15 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_4>;
+	};
+	vk_16 {
+		label = "vk_key_16";
+		gpios = <&gpio_mockup_hw 16 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_5>;
+	};
+	vk_17 {
+		label = "vk_key_17";
+		gpios = <&gpio_mockup_hw 17 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_6>;
+	};
+	vk_18 {
+		label = "vk_key_18";
+		gpios = <&gpio_mockup_hw 18 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_7>;
+	};
+	vk_19 {
+		label = "vk_key_19";
+		gpios = <&gpio_mockup_hw 19 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_8>;
+	};
+	vk_20 {
+		label = "vk_key_20";
+		gpios = <&gpio_mockup_hw 20 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_9>;
+	};
+	vk_21 {
+		label = "vk_key_21";
+		gpios = <&gpio_mockup_hw 21 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_0>;
+	};
+
+
+	/* a - z */
+	vk_22 {
+		label = "vk_key_22";
+		gpios = <&gpio_mockup_hw 22 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_A>;
+	};
+	vk_23 {
+		label = "vk_key_23";
+		gpios = <&gpio_mockup_hw 23 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_B>;
+	};
+	vk_24 {
+		label = "vk_key_24";
+		gpios = <&gpio_mockup_hw 24 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_C>;
+	};
+	vk_25 {
+		label = "vk_key_25";
+		gpios = <&gpio_mockup_hw 25 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_D>;
+	};
+	vk_26 {
+		label = "vk_key_26";
+		gpios = <&gpio_mockup_hw 26 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_E>;
+	};
+	vk_27 {
+		label = "vk_key_27";
+		gpios = <&gpio_mockup_hw 27 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_F>;
+	};
+	vk_28 {
+		label = "vk_key_28";
+		gpios = <&gpio_mockup_hw 28 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_G>;
+	};
+	vk_29 {
+		label = "vk_key_29";
+		gpios = <&gpio_mockup_hw 29 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_H>;
+	};
+	vk_30 {
+		label = "vk_key_30";
+		gpios = <&gpio_mockup_hw 30 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_I>;
+	};
+	vk_31 {
+		label = "vk_key_31";
+		gpios = <&gpio_mockup_hw 31 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_J>;
+	};
+	vk_32 {
+		label = "vk_key_32";
+		gpios = <&gpio_mockup_hw 32 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_K>;
+	};
+	vk_33 {
+		label = "vk_key_33";
+		gpios = <&gpio_mockup_hw 33 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_L>;
+	};
+	vk_34 {
+		label = "vk_key_34";
+		gpios = <&gpio_mockup_hw 34 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_M>;
+	};
+	vk_35 {
+		label = "vk_key_35";
+		gpios = <&gpio_mockup_hw 35 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_N>;
+	};
+	vk_36 {
+		label = "vk_key_36";
+		gpios = <&gpio_mockup_hw 36 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_O>;
+	};
+	vk_37 {
+		label = "vk_key_37";
+		gpios = <&gpio_mockup_hw 37 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_P>;
+	};
+	vk_38 {
+		label = "vk_key_38";
+		gpios = <&gpio_mockup_hw 38 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_Q>;
+	};
+	vk_39 {
+		label = "vk_key_39";
+		gpios = <&gpio_mockup_hw 39 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_R>;
+	};
+	vk_40 {
+		label = "vk_key_40";
+		gpios = <&gpio_mockup_hw 40 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_S>;
+	};
+	vk_41 {
+		label = "vk_key_41";
+		gpios = <&gpio_mockup_hw 41 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_T>;
+	};
+	vk_42 {
+		label = "vk_key_42";
+		gpios = <&gpio_mockup_hw 42 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_U>;
+	};
+	vk_43 {
+		label = "vk_key_43";
+		gpios = <&gpio_mockup_hw 43 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_V>;
+	};
+	vk_44 {
+		label = "vk_key_44";
+		gpios = <&gpio_mockup_hw 44 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_W>;
+	};
+	vk_45 {
+		label = "vk_key_45";
+		gpios = <&gpio_mockup_hw 45 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_X>;
+	};
+	vk_46 {
+		label = "vk_key_46";
+		gpios = <&gpio_mockup_hw 46 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_Y>;
+	};
+	vk_47 {
+		label = "vk_key_47";
+		gpios = <&gpio_mockup_hw 47 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_Z>;
+	};
+
+
+	/* Misc */
+	vk_48 {
+		label = "vk_key_48";
+		gpios = <&gpio_mockup_hw 48 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_SYSRQ>;
+	};
+	vk_49 {
+		label = "vk_key_49";
+		gpios = <&gpio_mockup_hw 49 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_SCROLLLOCK>;
+	};
+	vk_50 {
+		label = "vk_key_50";
+		gpios = <&gpio_mockup_hw 50 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_PAUSE>;
+	};
+
+	/* Cursor Position */
+	vk_51 {
+		label = "vk_key_51";
+		gpios = <&gpio_mockup_hw 51 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_INSERT>;
+	};
+	vk_52 {
+		label = "vk_key_52";
+		gpios = <&gpio_mockup_hw 52 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_HOME>;
+	};
+	vk_53 {
+		label = "vk_key_53";
+		gpios = <&gpio_mockup_hw 53 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_PAGEUP>;
+	};
+
+	vk_54 {
+		label = "vk_key_54";
+		gpios = <&gpio_mockup_hw 54 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_DELETE>;
+	};
+	vk_55 {
+		label = "vk_key_55";
+		gpios = <&gpio_mockup_hw 55 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_END>;
+	};
+	vk_56 {
+		label = "vk_key_56";
+		gpios = <&gpio_mockup_hw 56 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_PAGEDOWN>;
+	};
+
+	vk_57 {
+		label = "vk_key_57";
+		gpios = <&gpio_mockup_hw 57 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_UP>;
+	};
+	vk_58 {
+		label = "vk_key_58";
+		gpios = <&gpio_mockup_hw 58 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_LEFT>;
+	};
+	vk_59 {
+		label = "vk_key_59";
+		gpios = <&gpio_mockup_hw 59 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_DOWN>;
+	};
+	vk_60 {
+		label = "vk_key_60";
+		gpios = <&gpio_mockup_hw 60 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_RIGHT>;
+	};
+
+
+	/* Numpad */
+	vk_61 {
+		label = "vk_key_61";
+		gpios = <&gpio_mockup_hw 61 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_NUMLOCK>;
+	};
+	vk_62 {
+		label = "vk_key_62";
+		gpios = <&gpio_mockup_hw 62 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KPSLASH>;
+	};
+	vk_63 {
+		label = "vk_key_63";
+		gpios = <&gpio_mockup_hw 63 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KPASTERISK>;
+	};
+	vk_64 {
+		label = "vk_key_64";
+		gpios = <&gpio_mockup_hw 64 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_MINUS>;
+	};
+	vk_65 {
+		label = "vk_key_65";
+		gpios = <&gpio_mockup_hw 65 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KPPLUS>;
+	};
+	vk_66 {
+		label = "vk_key_66";
+		gpios = <&gpio_mockup_hw 66 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KPENTER>;
+	};
+	vk_67 {
+		label = "vk_key_67";
+		gpios = <&gpio_mockup_hw 67 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KPDOT>;
+	};
+
+	vk_68 {
+		label = "vk_key_68";
+		gpios = <&gpio_mockup_hw 68 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP0>;
+	};
+	vk_69 {
+		label = "vk_key_69";
+		gpios = <&gpio_mockup_hw 69 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP1>;
+	};
+	vk_70 {
+		label = "vk_key_70";
+		gpios = <&gpio_mockup_hw 70 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP2>;
+	};
+	vk_71 {
+		label = "vk_key_71";
+		gpios = <&gpio_mockup_hw 71 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP3>;
+	};
+	vk_72 {
+		label = "vk_key_72";
+		gpios = <&gpio_mockup_hw 72 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP4>;
+	};
+	vk_73 {
+		label = "vk_key_73";
+		gpios = <&gpio_mockup_hw 73 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP5>;
+	};
+	vk_74 {
+		label = "vk_key_74";
+		gpios = <&gpio_mockup_hw 74 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP6>;
+	};
+	vk_75 {
+		label = "vk_key_75";
+		gpios = <&gpio_mockup_hw 75 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP7>;
+	};
+	vk_76 {
+		label = "vk_key_76";
+		gpios = <&gpio_mockup_hw 76 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP8>;
+	};
+	vk_77 {
+		label = "vk_key_77";
+		gpios = <&gpio_mockup_hw 77 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_KP9>;
+	};
+
+	/* Left of a - z */
+	vk_78 {
+		label = "vk_key_78";
+		gpios = <&gpio_mockup_hw 78 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_ESC>;
+	};
+	vk_79 {
+		label = "vk_key_79";
+		gpios = <&gpio_mockup_hw 79 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_GRAVE>;
+	};
+	vk_80 {
+		label = "vk_key_80";
+		gpios = <&gpio_mockup_hw 80 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_TAB>;
+	};
+	vk_81 {
+		label = "vk_key_81";
+		gpios = <&gpio_mockup_hw 81 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_CAPSLOCK>;
+	};
+	vk_82 {
+		label = "vk_key_82";
+		gpios = <&gpio_mockup_hw 82 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_LEFTSHIFT>;
+	};
+	vk_83 {
+		label = "vk_key_83";
+		gpios = <&gpio_mockup_hw 83 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_LEFTCTRL>;
+	};
+	vk_84 {
+		label = "vk_key_84";
+		gpios = <&gpio_mockup_hw 84 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_LEFTMETA>;
+	};
+	vk_85 {
+		label = "vk_key_85";
+		gpios = <&gpio_mockup_hw 85 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_LEFTALT>;
+	};
+	vk_86 {
+		label = "vk_key_86";
+		gpios = <&gpio_mockup_hw 86 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_SPACE>;
+	};
+
+	/* Right of a - z */
+	vk_87 {
+		label = "vk_key_87";
+		gpios = <&gpio_mockup_hw 87 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_MINUS>;
+	};
+	vk_88 {
+		label = "vk_key_88";
+		gpios = <&gpio_mockup_hw 88 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_EQUAL>;
+	};
+	vk_89 {
+		label = "vk_key_89";
+		gpios = <&gpio_mockup_hw 89 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_BACKSPACE>;
+	};
+	vk_90 {
+		label = "vk_key_90";
+		gpios = <&gpio_mockup_hw 90 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_LEFTBRACE>;
+	};
+	vk_91 {
+		label = "vk_key_91";
+		gpios = <&gpio_mockup_hw 91 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_RIGHTBRACE>;
+	};
+	vk_92 {
+		label = "vk_key_92";
+		gpios = <&gpio_mockup_hw 92 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_BACKSLASH>;
+	};
+
+	vk_93 {
+		label = "vk_key_93";
+		gpios = <&gpio_mockup_hw 93 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_SEMICOLON>;
+	};
+	vk_94 {
+		label = "vk_key_94";
+		gpios = <&gpio_mockup_hw 94 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_APOSTROPHE>;
+	};
+	vk_95 {
+		label = "vk_key_95";
+		gpios = <&gpio_mockup_hw 95 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_ENTER>;
+	};
+
+	vk_96 {
+		label = "vk_key_96";
+		gpios = <&gpio_mockup_hw 96 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_COMMA>;
+	};
+	vk_97 {
+		label = "vk_key_97";
+		gpios = <&gpio_mockup_hw 97 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_DOT>;
+	};
+	vk_98 {
+		label = "vk_key_98";
+		gpios = <&gpio_mockup_hw 98 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_SLASH>;
+	};
+	vk_99 {
+		label = "vk_key_99";
+		gpios = <&gpio_mockup_hw 99 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_RIGHTSHIFT>;
+	};
+
+	vk_100 {
+		label = "vk_key_100";
+		gpios = <&gpio_mockup_hw 100 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_RIGHTALT>;
+	};
+	vk_101 {
+		label = "vk_key_101";
+		gpios = <&gpio_mockup_hw 101 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_RIGHTMETA>;
+	};
+	vk_102 {
+		label = "vk_key_102";
+		gpios = <&gpio_mockup_hw 102 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_COMPOSE>;
+	};
+	vk_103 {
+		label = "vk_key_103";
+		gpios = <&gpio_mockup_hw 103 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_RIGHTCTRL>;
+	};
+};
-- 
2.39.5



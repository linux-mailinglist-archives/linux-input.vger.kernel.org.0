Return-Path: <linux-input+bounces-13196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7BEAED9A8
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 149E5177BE1
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4640D2580F2;
	Mon, 30 Jun 2025 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="biKSowR0"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BC2580E7;
	Mon, 30 Jun 2025 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278806; cv=pass; b=BnHUUhpfo26VqdBJ3BNglmysesO0oNkazea2W2mJCguEhh/phwhhcrVLkLz7EiTub+RUChdw3bN0B0r3x687es8R76xojIWW/R75qS7Q8VDmTkAjplWbY9UWdK6kN2X3uBhQ/lvu+lFE/VraPrHxGkdctjeerJg5xh7+nmfne0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278806; c=relaxed/simple;
	bh=GUq2T+Z+kmaJ2SmSYOaIAKce3jqNoG/q/U1F/7YkYgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtpTDo1oL5DfW6V9szIwPWY4EcKPuuobkii5QwlSNtD55fvQPnxFB/qFgwxm857T+Uu5fSlL/bA/PvZ5Zdp4yt4/NvceYn6F3IZiWwBNCzp/PVDotuND+Hbv7xObbbN0PbHWIZI09KfNqmAChc6Qzt18IGAExc6vzJ4V2yQSpb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=biKSowR0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751278784; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cnKWfeDr3EjYX52A+2jJFuq5YD7l6N4BuYsn7yK7ZQ/4ikBXKCpsFAJS1TDQlwBqxXipn/2bXefpOE5l6cIL5PffugsqVEr4w//+eF52rMwt/SLs+fPurJ3ldMGaYQJ+4tXCQFxoUsIFwYvywQE6VKySqW9rM0dv9haLtaaP73E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751278784; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v5CW2bj+oVB/Xn4FH4bL2uotFhsK3zyngzq7FjyuLqM=; 
	b=cXosbHCB31arcRcaDiFlLW/ifoL+6grSimTAvSfFPsXCUhVGN5h39I0WzXrRPAyHkeGnlBJSHNrEL95dOBdH4rHRUyAMOkANVbvdr8xaiBMdJ7slvod+U6GstmXIrLqLYca6s+CZ5xs9TzAIJyluZI+RVWfBJRSIcV2VmamVQxA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751278784;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=v5CW2bj+oVB/Xn4FH4bL2uotFhsK3zyngzq7FjyuLqM=;
	b=biKSowR0RyprTLbVslIZRkPh6fmjuOXMIgT7uYNM7WoPPGA5hxybQ7iLm1MAff63
	qUdqmTN1bAJCQF/SRtOpwNtfj//Fi2E/t5CmMs+NOPWdvSAN8xNLW5mPv1nyPRdTCgV
	XJddyMnfYvUbY7Lpt2dc1iw3MWGdvQjZKmjUHd6I=
Received: by mx.zohomail.com with SMTPS id 1751278781441383.500485393065;
	Mon, 30 Jun 2025 03:19:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 12:19:26 +0200
Subject: [PATCH 3/4] arm64: dts: rockchip: add analog audio to ROCK 4D
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-audio-v1-3-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The RADXA ROCK 4D, like many other Rockchip-based boards, uses an ES8388
analog audio codec. On the production version of the board, the codec's
LOUT1 and ROUT1 pins are tied to the headphone jack, whereas pins LOUT2
and ROUT2 lead to a non-populated speaker amplifier that itself leads to
a non-populated speaker jack. The schematic is still haunted by the
ghosts of those symbols, but it clearly marks them as "NC".

The 3.5mm TRRS jack has its microphone ring (and ground ring) wired to
the codec's LINPUT1 and RINPUT1 pins for differential signalling.

Furthermore, it uses the SoCs ADC to detect whether the inserted cable
is of headphones (i.e., no microphone), or a headset (i.e., with
microphone). The way this is done is that the ADC input taps the output
of a 100K/100K resistor divider that divides the microphone ring pin
that's pulled up to 3.3V.

There is no ADC level difference between a completely empty jack and one
with a set of headphones (i.e., ones that don't have a microphone)
connected. Consequently headphone insertion detection isn't something
that can be done.

Add the necessary codec and audio card nodes. The non-populated parts,
i.e. LOUT2 and ROUT2, are not modeled at all, as they are not present on
the hardware.

Also, add an adc-keys node for the headset detection, which uses an
input type of EV_SW with the SW_MICROPHONE_INSERT keycode. Below the
220mV pressed voltage level of our SW_MICROPHONE_INSERT switch, we also
define a button that emits a KEY_RESERVED code, which is there to model
this part of the voltage range as not just being extra legroom for the
button above it, but actually a state that is encountered in the real
world, and should be recognised as a valid state for the ADC range to be
in so that no "closer" ADC button is chosen.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 90 +++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 6756403111e704cad42f6674d5ab55eb0306f1e3..4d4b8ababd2436b82515443b029916b3c786dba1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
@@ -37,6 +38,31 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	es8388_sound: es8388-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "On-board Analog ES8388";
+		simple-audio-card,widgets = "Microphone", "Headphone Mic",
+					    "Headphone", "Headphone";
+		simple-audio-card,routing = "Headphone", "LOUT1",
+					    "Headphone", "ROUT1",
+					    "Left PGA Mux", "Differential Mux",
+					    "Differential Mux", "LINPUT1",
+					    "Differential Mux", "RINPUT1",
+					    "LINPUT1", "Headphone Mic",
+					    "RINPUT1", "Headphone Mic";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -57,6 +83,37 @@ user-led {
 		};
 	};
 
+	saradc_keys: adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 3>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <3000000>;
+		poll-interval = <100>;
+
+		/*
+		 * During insertion and removal of a regular set of headphones,
+		 * i.e. one without a microphone, the voltage level briefly
+		 * dips below the 220mV of the headset connection switch.
+		 * By having a button definition with a KEY_RESERVED signal
+		 * between 0 to 220, we ensure no driver implementation thinks
+		 * that the closest thing to 0V is 220mV so clearly there must
+		 * be a headset connected.
+		 */
+
+		button-headset-disconnected {
+			label = "Headset Microphone Disconnected";
+			linux,code = <KEY_RESERVED>;
+			press-threshold-microvolt = <0>;
+		};
+
+		button-headset-connected {
+			label = "Headset Microphone Connected";
+			linux,code = <SW_MICROPHONE_INSERT>;
+			linux,input-type = <EV_SW>;
+			press-threshold-microvolt = <220000>;
+		};
+	};
+
 	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -639,6 +696,25 @@ hym8563: rtc@51 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	es8388: audio-codec@10 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x10>;
+		clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcc_3v3_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcc_3v3_s0>;
+		assigned-clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sai1m0_mclk>;
+	};
+};
+
 &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -687,6 +763,20 @@ usb_host_pwren: usb-host-pwren {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sai1m0_lrck
+		     &sai1m0_sclk
+		     &sai1m0_sdi0
+		     &sai1m0_sdo0>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcca1v8_pldo2_s0>;
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;

-- 
2.50.0



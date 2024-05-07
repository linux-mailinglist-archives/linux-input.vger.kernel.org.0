Return-Path: <linux-input+bounces-3558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6688BE674
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B992841D7
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51361635A4;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qd/8ltE8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F9160785;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=NJC0Qo1TFB8mhH73pCwj/UJv0XPx9OfdkrbCoLUnt82KPSe6nyAYBehu74X7Pad8O/8pYzFWV36cwr77YkL4kSRrhejkXi6nLfBz8rIGGpcyRoiiFYWwkrRsnt8czK7khxT55livPHb8Qg6qcJQldEJEMEh1it+zwMHJCLSGXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=d+flEQr9cxZbb3a6RHKFy4dAh2/qde9+Fg9iSBSS0ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIEEVwoJBDj1e3E+/zg6yRTRU9y4XTH60Aq70lr/2potRMkoq1ncDVAOpBH1S7bVTpTyYE7hylN0ESseW3Q52kGqT5GiCmqS/j4zXwldS6AHDbR1PFNOjLbhriUUks+bisfHY8fb+yXwXFcyYti4aeQlrsZuhbNalqwW7OvvXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qd/8ltE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6F5C4AF66;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=d+flEQr9cxZbb3a6RHKFy4dAh2/qde9+Fg9iSBSS0ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qd/8ltE86w+ref6wRBvnIlr3iGN4tqq/VrVV/RntiAX2mq8zAteNvcbQz21CPMM3r
	 bLmo0bj0DRiBetCX2YcnzBJ9JK9gV/xwjt+WpCKH83ZFLe1cIRYRsTYC+QeCLmGyGk
	 M/bG8HtvM+LxjtOkXDLgTPutJkXs7yrC2KupFAkfNhz/E4KxXwsKm8kL1YyNQI0vHA
	 2tuiqb2rhyBQpmctcr8orAr9kiUdYQEP7ek7zlQmVN6MN2pNJra6zQNO2sYwMti2Oy
	 uB9ZP/uG2S/P/Np7PwE+3WYYeZAXXBn6XNpc0CY0bMJyymVrkXbMqAjWi9ESH9QWp6
	 XmXn8VS7f8Xpg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7g-000000003Cw-2jvi;
	Tue, 07 May 2024 16:48:52 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v2 5/7] arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
Date: Tue,  7 May 2024 16:48:19 +0200
Message-ID: <20240507144821.12275-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
before sending commands after having deasserted reset during power on.

Switch to the Elan specific binding so that the OS can determine the
required power-on sequence and make sure that the controller is always
detected during boot.

Note that the always-on 1.8 V supply (s10b) is not used by the
controller directly and should not be described.

Fixes: 32c231385ed4 ("arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree")
Cc: stable@vger.kernel.org	# 6.0
Tested-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 569add4ebfab..98c1b75513be 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -653,15 +653,16 @@ &i2c4 {
 
 	status = "okay";
 
-	/* FIXME: verify */
 	touchscreen@10 {
-		compatible = "hid-over-i2c";
+		compatible = "elan,ekth5015m", "elan,ekth6915";
 		reg = <0x10>;
 
-		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_s10b>;
+		reset-gpios = <&tlmm 99 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+		no-reset-on-power-off;
+
+		vcc33-supply = <&vreg_misc_3p3>;
+		vccio-supply = <&vreg_misc_3p3>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts0_default>;
@@ -1507,8 +1508,8 @@ int-n-pins {
 		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
-			output-high;
-			drive-strength = <16>;
+			drive-strength = <2>;
+			bias-disable;
 		};
 	};
 
-- 
2.43.2



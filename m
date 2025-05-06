Return-Path: <linux-input+bounces-12178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9CAACD0B
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 20:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 631BE1C40E12
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 18:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3A028640F;
	Tue,  6 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCc7FedY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC64221FBC;
	Tue,  6 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555529; cv=none; b=LO6jkutm4sM+RVgv95QP4g/oEUiCW0+QvTOwzFxcvctunLJ1lWG+V6/i29z3+p0V3AEKRW09fjzdChycqUviQK1dbxeXDAhRsaQS05QacninQRtlhFhFGM/MFEFNYvqzPUou+nATMSIq4dWF1GHSEvq0ghUoV/8SuyTLaU+WIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555529; c=relaxed/simple;
	bh=2NIkEmSpkcdbfbmqdFE1qZRw8zNqmk2tmSI4/3+DvQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4JA+vWTSb5prIN/iNWbtcpR0S9BcXPr9m5+h3SJHTrAoSlb1np1Q/yFOaEhCuiooTu+C3W+maXE71RluD9Xd+2qMOWQJcczeGwzSSs8lMdoWVCH91i3eWpIBrrGCN+FEXCgBFB3+F6y8Fcglj9xcUTPIRy/m6kgz5EYD8hAV40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCc7FedY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECE54C4CEF5;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555529;
	bh=2NIkEmSpkcdbfbmqdFE1qZRw8zNqmk2tmSI4/3+DvQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VCc7FedYN6dR9svAFQqXCfBYY6+wEFchQ0FB1mvnRH1pDDoB+0yovr7qVOjMTjWW5
	 ZBuRf7ShjkcWAAsUD0b6wG/OqAQ8aZchOsLSOu8AS7u4ssWpkw5v3zFf4vSZpNKQYd
	 z6KIzr8FF2EwRSy7A8aYEMKDm+31sn23V6BLIfx+IXj52OxVdlAJAYCHZzHJFKSF9Z
	 Kb77Lv6xAmBzxJWRqe2xXPF4c8DNqEQs3ZTMJeBPh3gaRJUcbAL3PIC8wRaJQ7nvMs
	 t6ny4bjlqWhu3036algEfKbqWBkpL+ZQ9nou8izhXSOtmLmlxKhw0Zb25RrO/yEjI5
	 0rfsSj8sIfFRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0933C3ABC5;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Tue, 06 May 2025 13:18:41 -0500
Subject: [PATCH RESEND v4 4/4] arm64: dts: qcom:
 sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-pocof1-touchscreen-support-v4-4-bfb53da52945@joelselvaraj.com>
References: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
In-Reply-To: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746555528; l=1409;
 i=foss@joelselvaraj.com; s=20250506; h=from:subject:message-id;
 bh=rIxiguVu8wilDxcWbkOT29epD34sIhLGKlxvCtrt6IM=;
 b=LSh1LUjOGEDbje401uAFs2/QvmSLuda5RL/YFYI/HOEuEpYpjwQ1fFN0WaJrn4fjz78jvq62z
 6SZeih2j9m7BJvCrNtLEaRqSNPtoCneF1vdVMIRrfXdk62ZuRXHCYKu
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=/jk63vyofgC3YCat+t/kcBv+rlSEVcI4PLN/LN0SQlQ=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20250506 with
 auth_id=399
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

Enable the Focaltech FT8719 touchscreen controller used in the Poco F1
(EBBG) panel variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
index 76931ebad065e0f82d122dd3fe846a64da686ace..2d6f0e382a6cbf18b325127cfaf4859d7d9fd4fc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
@@ -13,3 +13,26 @@ &display_panel {
 	compatible = "ebbg,ft8719";
 	status = "okay";
 };
+
+&i2c14 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft8719";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 31 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+		panel = <&display_panel>;
+
+		iovcc-supply = <&vreg_l14a_1p8>;
+		vcc-supply = <&lab>;
+
+		pinctrl-0 = <&ts_int_default &ts_reset_default>;
+		pinctrl-1 = <&ts_int_sleep &ts_reset_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2246>;
+	};
+};

-- 
2.49.0




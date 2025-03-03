Return-Path: <linux-input+bounces-10508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A88CA4CE72
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 23:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C666818902A5
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 22:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BC0238D21;
	Mon,  3 Mar 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNVTZZmS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58623312E;
	Mon,  3 Mar 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041424; cv=none; b=nBL+3vr4llqS95RCIbA4uT4W4nGo3TAR8Tl0a4KB9TVUtQLau4jglEU4eZf9gz2B1qxeKPmO5q3wxXNlJqQogxWKSJW0zRRS+Xrc+pO2I6jF0XUPBr6rDil0S9Zynuk9ISS2Nq3AEB4gqQstR3d9n/ChUkOsBYQW4kRWi0jWwEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041424; c=relaxed/simple;
	bh=s+TuXpLZ1HWnMPD8Wb7qkyoCfh9Gyet9+8uMqxy5iJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbTKUt05y2pXldfRrifpKI/nL5Q/QGEvfDmwRjonoo2Ogib+yQdXSYf07UFTsYUR8XSXRhyyJbJ3YdWHWy6F3hVWrGz7XgRMj+HeO1nCfJ2XAVJy3yt/+pzSttDIJ9ojKvysJp4RpFXPkm5GVgR8+xd3QLesWQow+XBpmPjh1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNVTZZmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8FF8C4CEEB;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741041423;
	bh=s+TuXpLZ1HWnMPD8Wb7qkyoCfh9Gyet9+8uMqxy5iJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FNVTZZmSUu9+wbwi3IG5SdCSqoyag82fwhiER0p2aoQHoIW8bl0D5czklL159zLed
	 J1vc1HO/gdmAYJU2O6FGX9iu8dHWZiCluF+mws2fEIp9hk9XIsam++NhGkZ5LDAQHI
	 Ka7p+X43V4Je/W/8+iZy4sEOJWSY6POJ31Cxjq54K7mhrBHuV+A6pwUG/rEqAPOPuF
	 lK0NsDUMgHgg2wFv73+qrvmCrVpf4S+f90OlrDy+yrJYlCXwAOXwKy0MJ3sI41GUsG
	 8HNDT5uphvl5lhoATJ3Z0w1KxIQu17nfEPzR4zpvghgccRdl6zz9PvnDl+iiBYBU4A
	 2LMvUPdHjHXHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA15C282D0;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Mon, 03 Mar 2025 16:36:57 -0600
Subject: [PATCH v4 3/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-pocof1-touchscreen-support-v4-3-cdc3bebc3942@joelselvaraj.com>
References: <20250303-pocof1-touchscreen-support-v4-0-cdc3bebc3942@joelselvaraj.com>
In-Reply-To: <20250303-pocof1-touchscreen-support-v4-0-cdc3bebc3942@joelselvaraj.com>
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
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741041422; l=1390;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=yhsKIm7ZLnIXHoyaZNN55eP6DISAW8rg+iMWaf1tr+I=;
 b=MLrnq3P9DpRvQ1b6hK0zSPSpHsWRZb90fRG3foKuAqcctkeChJKR7SWj5C2NekU1bARE+zDJl
 jhL6Cn4u6JSBSTFlJJaDg3adcpEAXMrZTxV4Z6+VNLr79EXAB6YExp+
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

Enable the Novatek NT36672A touchscreen controller used in the Poco F1
(Tianma) panel variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index e9427851ebaa..b58964cde834 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -13,3 +13,26 @@ &display_panel {
 	compatible = "tianma,fhd-video", "novatek,nt36672a";
 	status = "okay";
 };
+
+&i2c14 {
+	status = "okay";
+
+	touchscreen@1 {
+		compatible = "novatek,nt36672a-ts";
+		reg = <0x01>;
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
2.48.1




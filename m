Return-Path: <linux-input+bounces-10475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BBA4AE71
	for <lists+linux-input@lfdr.de>; Sun,  2 Mar 2025 00:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21959188B9A5
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 23:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CC81E9B1F;
	Sat,  1 Mar 2025 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0iZBePM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3351E98E1;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740872605; cv=none; b=u3eDUTXvbYkxXzFOHal6bw0fh8HOMLQE4bEdv31MjBT3FvgJPovyx1JlZO4SKbUZhvkY83AjkWQ5VohlpN8M3BQfl/UKPcJ2xZ7yDf/XTI8Fb7VNvav80VjYwiitKI/78nx9s6Rj8ZKHVqwDx/UK6WqKqh6TAF8MUebLd0ZEyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740872605; c=relaxed/simple;
	bh=aNlKagADWoighFnPzry+cD7b2GcWWYyJrGlMwgcAzec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNhCFe42uYMcXlWai9RoYWLItzgLZ45VhYgabroBkgRM9KOkm70PNl2iy25KrL7VFL3dgJuSNIkqW1YQL3VgLe6PkoZrbtRS4P1e/h4DqaPk4JwusUqjesxpO3Jn38w9VpW+QVKRoBqf1qZDV1AEQ9ds5CP0CoKTFCnqdu7Ha5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0iZBePM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A982CC4CEF3;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740872604;
	bh=aNlKagADWoighFnPzry+cD7b2GcWWYyJrGlMwgcAzec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I0iZBePM9HvWOSmOjbiPwPVoLlRtlFKSl3TZndwFIglzwgWIG7RYCeMj7GnLxgQJt
	 y9C5L1zMiJ7G0YLML3zMdt0xf8S6BEgDndwoqqf+Z/fxoqewyZ9Vd2b0jiNxqc/wI6
	 A79b1JFD+488B2/tzwUvYd9wPC9S9DlUi90XW8qSvimkl0QWE/orn/LLLg1Mistuc4
	 gsjIx82ExX5ubro2gxokje5GJzyUEAwqlpA7zmQOdvYMi9nuTDklSxVCoBuRXsxyEV
	 20PovZkVgYi61aDl+L5/891PpkX1vyrOVYoaTJUJQy0VyA44WBRqYjLcUsABE4B9lR
	 waDr01dOCfhGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2A7C282D1;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Sat, 01 Mar 2025 17:43:10 -0600
Subject: [PATCH v3 4/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-pocof1-touchscreen-support-v3-4-af01c3b30b55@joelselvaraj.com>
References: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
In-Reply-To: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740872603; l=1286;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=RjgUxrTDZeUZrOstA31OE2MhayiA53NoLQULv+T9AW4=;
 b=qAPYySoh/iApH9aSUQYNS2tH7+LHh3fWU2i6VPL6LdtFUB+5lRGSAJGZ7k9s9HQUzrWsp5um/
 GKkxBxsxjNeAnKtYvR05sg8AF/0XqRh3JRRNWKd36+ydp27RSjZeT44
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

Enable the Focaltech FT8719 touchscreen controller used in the Poco F1
(EBBG) panel variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
index 76931ebad065..2d6f0e382a6c 100644
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
2.48.1




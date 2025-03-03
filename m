Return-Path: <linux-input+bounces-10506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E537A4CE6C
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 23:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0905E173F86
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 22:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE77237702;
	Mon,  3 Mar 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b97NBIsl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B022FF4F;
	Mon,  3 Mar 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041424; cv=none; b=gcaXaEn/a0hQQVaTeAwOSicyNJJgUZ5+ofZf1PXPmmocOXzybaLUcP/WlvNhuWbTvkMWlF2YsEEdnXq1S9muLmrTGt+k/wroQ4Ht9mC2aupmAxg3KfK/Yjb/P4DOlzZAPc0CMFx+UgVsmFlgBPloq5JQfTq5VKzbZcdoUcXV0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041424; c=relaxed/simple;
	bh=ZwHhXPvpJCdV5KNYYgWeXvqLnklun0Ps9D9yBgnGRNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZjSFEin/Y4P+FDKL5JAQi8cBjA4CUdHF3yLA798UZAfprN0YrSxro+Qvi/Z0dIDXDoZnaw5g3zLAmeqH8yAL1JTGM9JSH4nw0N/TvhHOTXOkvzOqFE2epCle9MG/sSjcSVxmiVjvXfslm+SlAXCsXaypBiKyl9Fbks1LKeU3Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b97NBIsl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6F7CC4CEF1;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741041424;
	bh=ZwHhXPvpJCdV5KNYYgWeXvqLnklun0Ps9D9yBgnGRNo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b97NBIslTrAMN+PIXj7HpEUuEU1CEtm39J5fXKtxvVNy3/Jpg7WWYflWkSBpzRkyP
	 0CP5v9uJQCs2SoKWkIfIeb0v5aWXHu3K1ZD6JjTkU3wlQVSjUjCxZ3v4gtr5jmWGRK
	 o7W6hzzTG1sukrUBdpkd3rWeNHvRxWx2KLEIKC41CNXVJ45TjHvj8UmAR9QwuGfkLx
	 RgjSvACCI+8KnMV1bqwvZzoBnJVm4xVQzLeRCMm9eudPi8rCEf4p8G7DzpEnCRyNfQ
	 2kGq5970v1cvgrfobaVDG5qqe8cb97hpU4b8NmywURb9ZfEDYA0G43gGgrJWgTzxs8
	 BwC/sSOtDAzfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3B2C282D4;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Mon, 03 Mar 2025 16:36:58 -0600
Subject: [PATCH v4 4/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-pocof1-touchscreen-support-v4-4-cdc3bebc3942@joelselvaraj.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741041422; l=1353;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=/EYGZKfsbI654LMI3OrPLlYqb/jeTp2euCUTiMhRjIc=;
 b=fX+JxFS3q1blDTJqocmSoo6oLccGcIuMhF3/6GbezvwEZD01gWYTr1MkQvA6ekK/Wn/S6YWPS
 naLH8FxucPJAsu5zCY92z2kvEPFhCCGw70JobUsTswahc2a0+J8BY81
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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




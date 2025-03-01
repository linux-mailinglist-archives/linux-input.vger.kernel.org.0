Return-Path: <linux-input+bounces-10473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D8A4AE6A
	for <lists+linux-input@lfdr.de>; Sun,  2 Mar 2025 00:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E0D1894D92
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 23:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9471E8823;
	Sat,  1 Mar 2025 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTnLfj9D"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E851DB148;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740872605; cv=none; b=eH/GZr+5B7gh3n6Mf+0fG4RvO7EhPBdPGUuRjiTUUQM+P5ThCMUV46rkDtSYsnt284TbcDkC+kXpN9nNposHIhZc42xbTJKa7YRM1kRITGIM64P1xAOafsESKaKr0qo5zxXDx1zPMSgDNFFg+S1O3n5yYxToW58OaR7ZaRNaUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740872605; c=relaxed/simple;
	bh=G+lcGKbxCjedS5fpELQ3J4ZIrHJkIvFah3TkiwdWV6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8vexOM+m8rNNGl8uO7pLqQ3lW+cS6QXpC/HotE/o1s9Tn+E0/yoVLeLFIVzP2MYTRKiQYJlhd5QOSFvM0VX2tN5HMpEK6YoKsXkWUce4X6Vg26bpVy65t9kmimWVCCJrz0NhbZgFLh4YT5a/A6ZH873vilkr514P0wGOqgrzj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTnLfj9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E176C4CEF1;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740872604;
	bh=G+lcGKbxCjedS5fpELQ3J4ZIrHJkIvFah3TkiwdWV6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VTnLfj9D6BTvdXrM6Y/TtiIk8b2JZEI+FtjO3s6QBLgeptXHEzJ6+kaxU9IP283of
	 gLTvJAMOl1HHepqjXzljdB5ixJ6ty0ZynPXelJD3UIVdyO59+G/de3w307QpBNPyK3
	 +dpxI5+Ll8tJffWweeAW8PWlZy77Gu16b0NVyFrC7ZmNHffv/SCauUUjz69Qm9YXIb
	 HKLXU/9JF+FDp+ah1URE0jNDjdft3fVqX12Krs2QxYFkMASNBGGkmiClCdXKasEOr8
	 j2WnEE5se0Tjv7kaHgQ2+RgqrNeKm5kXuODoQ/XwL/Ix96F3y634yZX2LolQ8sNg7T
	 Euj2hqJ4B/KgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8668EC282C6;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Sat, 01 Mar 2025 17:43:09 -0600
Subject: [PATCH v3 3/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-pocof1-touchscreen-support-v3-3-af01c3b30b55@joelselvaraj.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740872603; l=1323;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=p1bDzsWyHmoOrqIbVXlq/tHb9ChbU3yC/N8XHGelvPo=;
 b=gXiuaVXu+Ih3hW5x4jE/Vx7anM5wHmqTYVAHZteVJUcAKY0DX358UJfYMNaREcPM0/L017uj/
 i3KKAmv3xz+DDp5p08ERzDzCToluVxuLjwMaq0ZoVt9F7fkHeaLyzNk
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




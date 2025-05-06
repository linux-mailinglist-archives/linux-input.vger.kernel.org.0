Return-Path: <linux-input+bounces-12180-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F63AACD04
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 20:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3BC41C40EE8
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 18:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9144128642B;
	Tue,  6 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6N+/wgg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3627FD73;
	Tue,  6 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555529; cv=none; b=KTITPCe9itOCR60+7wkI2bMnjAVv4EbmJoBH9vZRoSmkQyi6Y2wvoNKBZ7S6/KyXVSbpGS8KJCW9QGvd0NGV2y0f2XsXaqO+a9craP4MHPemGMoMueVVShJaDfGLYrpetad+iCjkqiR+gmk/lFwxCn3OMawlQs2jerfxyyEE0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555529; c=relaxed/simple;
	bh=bBWDIfE+OQuKFmYOAddG8eQiQhi5ABo4QMIGCibhkgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cv3ITJpp3h5w02hcc7TaSfEaz3Uxg2BFbEKR8kv7ZoAut0UnzGEiMjdQSVkoAskhrXikvod/1q5hxX13w8t6QPKBd6U4YINI62j6OX/br8m/+uLV22l06YC+mq5W9gHOuhEAsw+r+FEZLQ5yOnCQSZVa+Afvv6urRJgntyutPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6N+/wgg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3F93C4CEF0;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555529;
	bh=bBWDIfE+OQuKFmYOAddG8eQiQhi5ABo4QMIGCibhkgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u6N+/wggUtvuD9+F8dnD0lCR+H8jyKgrulTvf5njVjyqi2NCE6sIvKtK+lgUtCHLx
	 b6bZ5zHm+PbXdWQSsNdyCyzT50bDm3km29phY0sr1z7lbvzuhFG8eInv03PawLVx9n
	 21Ompkb/VC0qvb5KqNx3kPCAAaMvotokFCafmbrXZ806CfqnwrM3b52b1OTS1ZPGoO
	 Peh/WrM8RB68GjDVN8+GJMVHsLVzit3W/ktF6ngGnecFd+Wrj9siG4v/Dajl5+NfRn
	 0SO9KhxJdRALuvLeUzYc/pxbSbqNN9MAIwFqAjasfy59L+04JergoS24hbxzXHIJ11
	 SPHSBhlaH/KYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A93C3ABC6;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Tue, 06 May 2025 13:18:40 -0500
Subject: [PATCH RESEND v4 3/4] arm64: dts: qcom:
 sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-pocof1-touchscreen-support-v4-3-bfb53da52945@joelselvaraj.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746555528; l=1446;
 i=foss@joelselvaraj.com; s=20250506; h=from:subject:message-id;
 bh=omu9P9eNkNZRMqW32xW8epBAdb+JJlQ1CwabUVCs0a0=;
 b=IKLIA+eY60v5DxWy29ZulcLaAjMplEPPHuWWmcXLoMH4fq0kazvusUe4kBKT16+oSmQ74pRdi
 HrlFDtqbGjGAwPT+cOqg2fJ1e4yyW9uLJ1Cc4bibe6ZlQhHi9zWAaWB
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=/jk63vyofgC3YCat+t/kcBv+rlSEVcI4PLN/LN0SQlQ=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20250506 with
 auth_id=399
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
index e9427851ebaae13389f394c06eaae339a63fcad9..b58964cde834221baf1a7e52c002c8394668dd99 100644
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
2.49.0




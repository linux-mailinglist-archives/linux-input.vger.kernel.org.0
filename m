Return-Path: <linux-input+bounces-11846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701DA94547
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 21:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC071189184B
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 19:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795E41E2307;
	Sat, 19 Apr 2025 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwX29j3h"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD254A3C;
	Sat, 19 Apr 2025 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745091988; cv=none; b=Tsh3Dndx8dbWvgj0SZB2jvpw6o9LYb62slVJKdrO5fJMgYWusY84/8boAInE6FA3d2oOhN5zG731U+ivphX64GdbdIPen/7Qj21mCX2wbEdOLyOGxdiEqAnN4v+eZ3L7hKtNcoBB8fm0D1okB6TjJwt2ymE8UGDFha0w6BSr6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745091988; c=relaxed/simple;
	bh=oJfRg4zIMZ3tXriZj/afkIrse+w7HayBW5i6gEbnvu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOfnfB7XpOBh0pT+vvnhwsZ4Sd0C+STGIF/NrtLOOx4Sg9NJY3nHp5tej75DfOcpEi2f+oNtLUG1V9w6L47cWyndNkgjskmkCVsqnTrikUi4dWwjP5KoFk+2fKAukC9I9ejB5o6mWw8ElqzdUqWtnYMVeGfnm6yRvde2iypiSz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwX29j3h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1D78C4CEED;
	Sat, 19 Apr 2025 19:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745091987;
	bh=oJfRg4zIMZ3tXriZj/afkIrse+w7HayBW5i6gEbnvu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SwX29j3hTiqKf4CGUwjD6f9FhEQoJyzKfmS2evYs4QIxoenmYCHkz5UgvL6boIzqI
	 mC1ZczduyJEapXUJFt6qZEilotmAoUIwrw8Qb6Tdf4Wt1odDuqOg0Jjt/elcVyW0aI
	 aX8EGi3AC7ora8WnE838of+XsknPvmsdgMjYS/MgyMY6Cjt3in/zyVsxkXrxAUqmqM
	 dZDJjgSvTzODWiHJw7arxMO+YQ7cY4JE2eNmCiIi5OIVimvUrV80FrLfyg/b7LjUgi
	 UUHzWL0hm+uYQjB1zeNpPHLuu4VNh/rCgjzk2isBNBSmY0GTklVE3iII/vwYmYSY/3
	 JCGmiT53BK4OA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD0CC369D3;
	Sat, 19 Apr 2025 19:46:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 19 Apr 2025 21:46:25 +0200
Subject: [PATCH v5 2/2] arm64: dts: qcom: sdm845-oneplus: Add alert-slider
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-op6-tri-state-v5-2-443127078517@ixit.cz>
References: <20250419-op6-tri-state-v5-0-443127078517@ixit.cz>
In-Reply-To: <20250419-op6-tri-state-v5-0-443127078517@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Gergo Koteles <soyer@irl.hu>, 
 Casey Connolly <casey@connolly.tech>, David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=QhCUbDmUHcz4RzxVc6XbeZUejFzQoncYw+4pfYDvJbY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoA/2SXNUW9FmCVx/sofCVR1893e6A0Pgi0fk2t
 /vlzsdqOCOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaAP9kgAKCRBgAj/E00kg
 clf8D/9u8uPCDLrbj2Z6HGbMlLcVBRPLnOb//zm6tNBBYYlkWtuSbIA4+ziaEy7T7v9mYMzPyVy
 L0lRRx62HtcjCdCaOvfebpZUh8tJ0xOJ/5wzORGEsHbsBVseMdjZi7cddRm0FXw//3e3tPdlqfX
 J+MmSRz2RDYsavYWjVdcnmSXmIni9aLGBWTg+hAY2WK+8Cn003wZ5E5wi02KMhprT36HNVVQsWK
 994To8W4xb/LMsUmYf0LD3ImbBYVyEAixDeIW2Ondy7TtuQN80KH9Dzzw2KDBj0j35mWjJWUuzs
 96htMIWpmGPuUsQoaR05EmetYyynt6eHdnEs0LeWLxtpGbacZwJSIZRXqnsGDEDpqCIv3M3atqH
 +Fbsa2vgJSeH4AJgGsUM62WIdXWCs9bgez5JuwsZsV3f5nYiNgTrR6Wa+6btvPNTKaVG0zJK3Qc
 nGMILNV0iaeCpbjby8Z+6rQOagCNa31ELCp4UUun7wPmFX6N6fIWrKlvos+mccgOluIcl1n3/+A
 +6BqBxepc/MC6tYCiGGg+wqvokSUY9i5YLHsCk3NVLtUH8qmIbbPXs1raRaS0K+LGTdggQu4Kc4
 XFUsiABTxGtUw0vWH8NLYUJajZIqiBv2Hbf/4LU0MITDguUfmwjiBTFEXDnVld1N/oooKnZqIEz
 TO1xwGF/KlLHmTA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Gergo Koteles <soyer@irl.hu>

The alert-slider is a tri-state sound profile switch found on the
OnePlus 6, Android maps the states to "silent", "vibrate" and "ring".
Expose them as ABS_SND_PROFILE events.
The previous GPIO numbers were wrong. Update them to the correct ones.

Co-developed-by: Casey Connolly <casey@connolly.tech>
Signed-off-by: Casey Connolly <casey@connolly.tech>
Signed-off-by: Gergo Koteles <soyer@irl.hu>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 39 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8a0f154bffc3d55ae2134ef28cb7653dde702552..9a508b3149bef50c0ed897dec3c01a3f08712e85 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -21,6 +21,41 @@
 /delete-node/ &rmtfs_mem;
 
 / {
+	alert-slider {
+		compatible = "gpio-keys";
+		label = "Alert slider";
+
+		pinctrl-0 = <&alert_slider_default>;
+		pinctrl-names = "default";
+
+		switch-top {
+			label = "Silent";
+			linux,input-type = <EV_ABS>;
+			linux,code = <ABS_SND_PROFILE>;
+			linux,input-value = <SND_PROFILE_SILENT>;
+			gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
+			linux,can-disable;
+		};
+
+		switch-middle {
+			label = "Vibrate";
+			linux,input-type = <EV_ABS>;
+			linux,code = <ABS_SND_PROFILE>;
+			linux,input-value = <SND_PROFILE_VIBRATE>;
+			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
+			linux,can-disable;
+		};
+
+		switch-bottom {
+			label = "Ring";
+			linux,input-type = <EV_ABS>;
+			linux,code = <ABS_SND_PROFILE>;
+			linux,input-value = <SND_PROFILE_RING>;
+			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+			linux,can-disable;
+		};
+	};
+
 	aliases {
 		serial0 = &uart9;
 		serial1 = &uart6;
@@ -799,8 +834,8 @@ hall_sensor_default: hall-sensor-default-state {
 		bias-disable;
 	};
 
-	tri_state_key_default: tri-state-key-default-state {
-		pins = "gpio40", "gpio42", "gpio26";
+	alert_slider_default: alert-slider-default-state {
+		pins = "gpio126", "gpio52", "gpio24";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;

-- 
2.49.0




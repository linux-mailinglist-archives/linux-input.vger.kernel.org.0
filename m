Return-Path: <linux-input+bounces-16095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A0C58BD8
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 869513BDFD5
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F79A34DCFE;
	Thu, 13 Nov 2025 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSeAyupX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58847347BC1;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049786; cv=none; b=GI1DwQMVZlyjDVQHoUJrqvkdA+Dc1bm5OiiAmCNzjcFwkFXcpFm7ER7GwkQGpGPXB/aepmx2tbUKl/+dkJuBLJG1dRtz4JroV8GjmcgzWSo/xSghWTbdhDOv2RcyNcQd9amyIGjscMG1rXKR7IrD4b14pkUdG9qjMmXoivC5wV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049786; c=relaxed/simple;
	bh=QIuVHgS8+ahZYbIi0X11y/faUOwKz1GnquRdQ0didNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGiaXLJEnHTk/TjxlqMn4oh3QboDKN0hgkoIK5IQRkUlfKWby4enp2Hb0eQNd8MVfjxAiqa1Wpr5cwvlLi9BDwORji4l8wAMDHQepUEdXAlRUvVWp+juMbKewC80i5hufem1/mKQRhalzlsoRyO4cVLr8hYm+8rKvAmz5V65FHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSeAyupX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A860C116D0;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763049785;
	bh=QIuVHgS8+ahZYbIi0X11y/faUOwKz1GnquRdQ0didNs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tSeAyupXrXFw4C5M95fEd5soYFTksiErzcnE6hKnyqVRuoTENv1AoENe88AxpqR+v
	 /XkteEkCRJGHuxtI4LTYYNbcH9/YpZxA3feV6zS1s0iAnANTykD2GeGIYENaKgkOhd
	 FmmNaJb+VPn5kbf/cMRT/0pqpREvHm6+PZmRH4ZYBRMkVRra8Hp+wJN172xlQAlU3a
	 CNhkTiLNcy+R9DRh3gTPFv34rco6Ua61Gt/8VjZCEYZAo1TZb9XUkWNZLK7nLcAAgZ
	 F2RyzE0ryisBPcqdIheFcL6bvTNkSvJyWh6ZLFu712B7eM4cDVVKLP1ovJcmu14lmw
	 B96Pr6CCrMdyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC2BCD8C94;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:02:59 +0100
Subject: [PATCH v8 2/2] arm64: dts: qcom: sdm845-oneplus: Add alert-slider
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251113-op6-tri-state-v8-2-54073f3874bc@ixit.cz>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
In-Reply-To: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 Gergo Koteles <soyer@irl.hu>, Casey Connolly <casey@connolly.tech>, 
 David Heidelberg <david@ixit.cz>, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dqvFSr3SuBIu+543qnkoNfG9uq0Cj2Q9+THYg6kIPK0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgE3UzVo+zDBd/5cErL4bALGyVMggtI90tyiC
 L61dLnRCzWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYBNwAKCRBgAj/E00kg
 cptuD/4lE1F+wE1YrI3e866r6VZ3BJ1VMxehSO5M5oPDXrvQS+qHmdLrx3q+hAvRBS9JSsSiSi/
 ug7or4TNPrF+DrjgGe3IQRp0LU0ihym5IdlvD0oW5cIy0bYRllgNOa/UChLFvoF6ksGTLoV/3Ir
 phtDYu+BXYXixMNfTZTLj/ke+MC+93Htu2W3Vbho3lzF6nNx0Xnn5RuxIRSlj6Os7/HtIy6YCUg
 X4coQnI15RRjaX4DH0K40kpeIBVo5/yWjyhNH4CxieCCUxHa/1pjAsPEbT16aJAB0RTzzFR/Jmb
 h9lmn7fyVqq0krSmHmElJ0nMU06HlFVMM2IMZEI03iqSJW2HIWyTBofMNbt1JNX633eeJZ0KxBp
 uPJS2+pRSTaJa3l71WRRJR8+aRm6OoqXkE5DH6VHV3NL8qfUqxU4kugignehUOUt1mehbCTofoj
 zSC81jH3Cylj+ghxb0k0h8YOJ1bsGv7boCtJSuqHSa0iJW3cIEm9khd+BQBh9ew9ZnU7AZlQXPp
 oSFHOYM+PRI1kZuja1+t0WdgRTthLBXNXRk5YAlCTgjXHOKlzrTyjoO7tGXKfUHWu37sPSTOsng
 NvlbuYm+coDOtwPESDR7lS7kmEbYBVgrZ3NzAN3X2as/GpGp8MQ7AtVun32yk2H0jl+KiXiAmrq
 y6zlEk0af8zcEZg==
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
Tested-by: Guido Günther <agx@sigxcpu.org> # oneplus,fajita & oneplus,enchilada
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..963dc4cc3bbb8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -25,6 +25,41 @@ / {
 	chassis-type = "handset";
 	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
 
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

-- 
2.51.0




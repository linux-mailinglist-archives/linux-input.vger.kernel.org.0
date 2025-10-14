Return-Path: <linux-input+bounces-15454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAB5BD865E
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D483B0662
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CB02E7160;
	Tue, 14 Oct 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moPjs0/k"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E823F294;
	Tue, 14 Oct 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433641; cv=none; b=HhdkNUtmLOcUR0w2JFi4VyB5+dqkMsgmA1x4x81oBjcEymlNCMuEvjPNFtQCLLnkDNZv+OOcIcTeGUyTWGzXijHJtaSYvSigdkx2afjHrTgbeY8dwy++QaCgQO3/abN+oTD+yzhPAUuPBpH7eZ6AlaqYQO1uH5slRpVBejOfzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433641; c=relaxed/simple;
	bh=4viXq0Ak1dSFsTCWo3WHd5sjRdKeR+JKhmrn8uAKos8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=noELvQX3MsfybPTwKLh2/Q5nLs1OKwPU0QBIfN5YHCxblwr7oSlF77gXDLfAhbLYNmI88PSBy7TNK1mi/9jWCv0bzoROYDHKseI25MVAZRwWloQVqaUvUkoUvF0Il8XhZxBucuvwweCH1nRP8Z6RJZ7IdO97EFrrGGcZ5dR9JwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moPjs0/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE195C116C6;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433641;
	bh=4viXq0Ak1dSFsTCWo3WHd5sjRdKeR+JKhmrn8uAKos8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=moPjs0/kj1Mu6TiEy3JndTOIpgRUFp7ssafmAXf5UppdcRR12tdbucy6oqImdJNaY
	 xs0P79mRl7LS1Z6YAvSQwsckqHURoO3BTN+BK/itmaS12pant5/pD7EaM4XtctPbL4
	 7C7hNKHq9vHatKmaH71yS5D51f6qrtppmW+wuGXQWEue/k91tAYHWr0lq38A63Vup+
	 nEkq1zd/CVOSyQoK+8feH8SaNiyMcgLrqHwjuZbwkN8H5vBHhpjF4uKJpwm4YiI5o8
	 wTjOk2faa0ot6v21XC23GcpVTYoo1xt0zJI3ziPrugB7efKh7RRddCiCnDrw5VmbAC
	 6cRdW62VzAPZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAF2CCD192;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 14 Oct 2025 11:20:35 +0200
Subject: [PATCH v7 3/3] arm64: dts: qcom: sdm845-oneplus: Add alert-slider
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-op6-tri-state-v7-3-938a6367197b@ixit.cz>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
In-Reply-To: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=L6s7O1s8v/Sby4jirhhYQ1ffxzp8BzROoJRus6IJ3N0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo7hXniF18Aacb9/oEkiWJMPXVtusl336X6/LAy
 8/OTZ0iBAaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaO4V5wAKCRBgAj/E00kg
 ciNrEACnITmXN760aW8eSm4YI+2YbwuumfXairfYu0xa9bLKypn/P2K3Xq9c7P+t0d/9CCH32YX
 icqmpy17hZBHfQ/EkKTD0SpHttYXXEkwB83IeuI90KpycNQeIBMLfbZeMjZVxsFGJy3IxCy6FO7
 stDxhhOa0/biOj62UTReNoKNHyQb+1+ML6Bx3f3ADvPPEKBC8tmZpHLePGH4R0rj7dGAS6eRbfG
 ofxPqRe52eVoymurikB+/nzi9MDKoI87QQ44Led6O9b9+P+mHuOJzYce+45WjqvbdBzP37PdHcW
 V1o4iQhqFocdcMDB5VWlIxh1PR+vCvTQFsJgav/z6gGnIu8RkrHPO8gmelR9R5AJVpBOct51Ru9
 FGGEriYD3C7IGOt+AMu7GbqfyBVLBRJXsaTddJgejLxwYtIp2UwJ2grc9cDRSHn56O2ikx67eXs
 q1s6cJl08bY6IX6n2cVwoiZhvnbG0JjYHvOzceZuxHUvBZR7SyQQog5x2Sa5qEd+TdVNmjGSiEl
 DU8i1tFGYqCMcR+O0cAZGrkaM7ctnhUpYg5LPJwJPKc+6koEo4WtHZ4+LFWf+BzN1V7uhrLeCwW
 9/RPEZ+542rSS8opmI5pa3h8Tw1OhQMpUT9xyzUx6SvjjO1sZ1oKtifvyJm6WSMKhq+vg2zdhUK
 o0WDTA8Kl0UY5/Q==
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
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 51a9a276399ac..98f5e4c8237a0 100644
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




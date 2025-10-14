Return-Path: <linux-input+bounces-15457-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF8BBD8682
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146C93B9605
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4832E7F0A;
	Tue, 14 Oct 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOFQsKG7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9F2DCF6B;
	Tue, 14 Oct 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433641; cv=none; b=h6czcYQjs1kL79VFR/j8rMrYcdjUMHiBouROtycrRVubMpjzyJEhN88Wevt0xdKItwjP9bqfFEs+vG/moc3Z6zQkVMU8fDWTz3AabqaOPUz8KJjWNudZHQWmlJbvXAu4SZ+FrmEVPLqlXTRosjYSQw0W5DZq/uuw2b7uVwuKZtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433641; c=relaxed/simple;
	bh=2X26JZ6fl7rnlplSPwFOUfbF2p6ZHnuKHXTP5m5tt8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYLx+J75/4QcsL8znA8Q1ff7wCh295rdqWQ1hKQEdK0Ii/MPLKq7D3PwpMI5IuSitlFeUn0jWwcOv2Jtwfzy3ZPvgW6jpgK39XitZNL4YYnIYApPqqlWsUx3igYonIYAX6bqq18ekjXCnveEgglSFWbCg2BdVdN/2WxqMScwIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOFQsKG7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8115C4CEFE;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433640;
	bh=2X26JZ6fl7rnlplSPwFOUfbF2p6ZHnuKHXTP5m5tt8g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jOFQsKG7O517hmRqbl6WjWiGui3Xx73TulOdKiT6mncpv87mf1kKizBZWLEeed7OV
	 kbCyLmb0FtYLGqcOxQhft89SYeJ+Dtk384tkbG+k0UrJsp3F7ByO4V/lKfbyUnGae7
	 DHCPSp7GHgQuubO5pj6LANkFhuilZ8grAZK+GJbBnDwqHRqBGUL6cNsd70vqUd3hhL
	 ZRkeAEeam07TGITdEU+FEu509v1mg0GHlfifZ/Nweej6LyH0sDF2UpXWlMvfr4gT8h
	 GAMLMskky23LtozwneMimpnqIpfX3+e1fcNKGiytBJhJkMjlnBKu/miTCThJ5hlJKU
	 JKlULDymzWiGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F38CCD190;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 14 Oct 2025 11:20:34 +0200
Subject: [PATCH v7 2/3] arm64: dts: qcom: sdm845-oneplus: Correct gpio used
 for slider
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
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
 Gergo Koteles <soyer@irl.hu>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Fy4PwTgZvRdYveoZogmk4XGDDnQX034Xshv7R9LeAto=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo7hXnVtZyU+BU1XwQlxjwwEQzHM0S6LKsSP5a3
 YnGpj7V9GuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaO4V5wAKCRBgAj/E00kg
 ckxUEACCEpaS2GuZHqdFoMiC8g4Wech97ZeEBvgAU13nEdycgo0tiDkM1mU1ecdZRZ7NhoctCup
 mHJlKQuJOqhZeeEwBBmUzh8NAzBCxLh2Kv03UXQ2KU/x6EW7f/Spc0WXYDZvVhNiUODHNaRtXg5
 xXolPRiELMRDB1UDa2oTE9tEgxk7mKQytwQGnAPnLvj/Xa9sF/3E00dlKe+Q9tmbVgnhaoaUd0W
 D8DpofNZ1qxTNDhg8hEN+b+6QYSCVhccZlZ0KVAJgSiMWlc/tGdhNi0kTbD3eILhPhYU8YcQxec
 aW8gX7H+nTlEXvveqEqvu6sql6PGNA+2TkzlZMyfdszymryTBK/drXGvA7uX6CYfZc2BOj3pOEP
 ayhlvbirSkcZILGidCc8Iqqv0kQcqUE1sKaXNHmxFy3ADP0a19SbmebJZA7cF5PdkT3BhnVFrui
 mV4eOuf/7opACpJXkI1If0V7VXtoqsDSCA+KTYpaPASZVh+Hv2ppnGJUY6FTBkyzUUgePmNP7ca
 c6AESRDT8nFSQRlXkEXxYodWLLSjl/Q3A1Ucukgek5RAPNa0C/RCqHpPuJ1zWmIzFcTDGXNs9Ec
 PMASXC0eZNMSluaoLnb/7B4VVClF8bTlV6UZBcCuqM0Ol4XsVHd/56lVm3BUfMl3Bs3D52+gDpj
 gyeQgw5V8U6+4CA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Gergo Koteles <soyer@irl.hu>

The previous GPIO numbers were wrong. Update them to the correct
ones and fix the label.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index dcfffb271fcf3..51a9a276399ac 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -803,8 +803,8 @@ hall_sensor_default: hall-sensor-default-state {
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
2.51.0




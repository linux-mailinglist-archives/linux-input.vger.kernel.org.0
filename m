Return-Path: <linux-input+bounces-13841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC32B1C85F
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 17:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB5A03AB12B
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 15:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBBA291C2F;
	Wed,  6 Aug 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2PXialas"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AB6290D83
	for <linux-input@vger.kernel.org>; Wed,  6 Aug 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493027; cv=none; b=HrYspvY4QMvItyH+7kq5LuOareQen4zFwTbmssNvfMrL/lgGjM9ZyvdGuOIhjjmLzrcF09dOqvlu8uLLquP7obASgaGcHKV6gzbnBNGRDXKAsQv2p2BTb6f3AXArIyRtDgC7dxiqd78bJutHWvI/ONNHKon44vPhI01JA5ubS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493027; c=relaxed/simple;
	bh=mkMKBwz5BKx3M5ukHVq0U7xYjHmmJcHQfBYE9D9pbLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKIdnhvd6/zE/j700eNfxqO+x7x5NizsyRe9ldBNNZRgrId4bbvejFmcpwenOQYClAIoiTOpi4lv2dLRe5YxhNoVCBtAMNGXDAzrHjDDjBLc3uWSkQWL5RmNAMOSCut+n3oA/3KNR1GNaSWW7D7xwQMP9zGqfudXotQdD2GHjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2PXialas; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af91a6b7a06so1230145266b.2
        for <linux-input@vger.kernel.org>; Wed, 06 Aug 2025 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754493023; x=1755097823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKHJowmVjOKhweg/31XcJuN1dKyemiZUjq/gTTEI0D4=;
        b=2PXialasG8bkbX+e6ZXi6/K+FfbcqiYwOlqmKxEAuXZu8Z4oRyhTOfAg5r3+/qbsRE
         krBoAFDROQG6rgi3n3tHn9I+SsItHpX9iyxw4cDh8s+e690tzdapc2oOM7pXoqXPnVVY
         pGEJdIdFLBO47THcJuGqF/u1ZcwcXVnldhQBavIM7RIdfGhMlm1U99yZeiXpobagr5SM
         zy/5yf7MxU1o4GZ606EfzUCXxxp6Rqtyd7qHqMmNGxpjVDy7SsJ1diUQqmivJtmdsNxr
         D8wsBcJPTxpwFQKLhgaWg0flcMHGASl0EgA5+SjhCgRG5Hbi6fg6G8ItVNivFsy9kc16
         f1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493023; x=1755097823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKHJowmVjOKhweg/31XcJuN1dKyemiZUjq/gTTEI0D4=;
        b=nmnAwhZu+qdwjp1jMCs7+sRxWwsESdn1Fgq5zbFmPNcccxM36L50Dym3hnT2Svpf5i
         JLdTlQY0pY4YpXp28GnN5NBE8OlS2X2+GstJZnG9OzBdLGH08vsnRJkjPT8/xZtTzyBt
         EGhtqgAhiWxOTu7lHvw5qFTfdljEgktv0A5JLzo8COA6uKFO4RnMNtownU/x/xyWO21W
         uiOp9KCDPnaTLY1Aue8CCEStA1V8xk/+93wqwUIo5UiAeMgaj+Us5clOOleS7XXolrEQ
         vBxACltGJNlgamkrXSIVcN0Q6hDDgumo0VxD5tBrm6UGiMn6/qukoUSfQaT0hq5wKsZ7
         ylzw==
X-Gm-Message-State: AOJu0YxaIDuU+AJjTyHM6F/lFfDEnQhRR6lnIXbDSAlM03/HNAWo81Pd
	Ird59HokQXNAofZytu6M+ZREfZXnN8uAK10ruBGZjGVAE6pQT5hIZZSEGwsLlyudzDg=
X-Gm-Gg: ASbGncu+s3kEdULpRPD5smLz9gfXhY7oHkC9uTYSyvWzz1ant4IAKmcbyr3mLANiDPv
	1JVlOwCInyWi6ukZ1ySxrSAzVx8bkxzO6MFTtzwv5lw/hAUZFg7Hc57FbQ2d0p4Ottx5BjxLGxp
	tL5apaP2rnj+T2lHHGZRRXSR7iKqXWBTbmEHDVvQ41mgHsKMKf1h3cJGuk5tkZxNXSbr5DuzOtA
	kmEDuLC+s1Bqge8XZ1N4GTredUhxUam3CTtFsUv1fMm4+VRzP3ierN4C/joZ53bU5gbETVsVu8i
	I1dNzNaYlnVkCFtG1zioeCkOxaTlZmYXrSMZrmIi8rdgIQJg6rVY3zo+f9Hjoh3Z1lojOm7luvS
	7qW+dv7us3VjqZ148BKZp4KsCW9EcjkKOUCqdvWoEPwwE/HIiKPmc4BKFNli2/aVY6pB0OkF/S4
	dmBP4=
X-Google-Smtp-Source: AGHT+IH8DW2Kp/036um5fo54X/6vueOzgFt3fBIYDww6nDeVymURksuNRfJrnIRDzmfw+vtApSseXg==
X-Received: by 2002:a17:907:3e8f:b0:af9:8c1f:c2b9 with SMTP id a640c23a62f3a-af99005c7fcmr299707266b.8.1754493023342;
        Wed, 06 Aug 2025 08:10:23 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b77sm1120100666b.51.2025.08.06.08.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:10:23 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Wed, 06 Aug 2025 17:10:10 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator
 support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-aw86927-v1-3-23d8a6d0f2b2@fairphone.com>
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
In-Reply-To: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754493019; l=1231;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mkMKBwz5BKx3M5ukHVq0U7xYjHmmJcHQfBYE9D9pbLY=;
 b=9xF1MNdjywzjYsOry9BBTU5wVDy08shUSv+1t+tc7ZOPISwDvFFGeWrjsLPziUTQaGleWWHxj
 eKbNhajwzcvBH3spUvKXYq7qI+fSiQrEEGSljDAwdNNMJPjI2rtiqCV
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86927).

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 4c6cb4a644e2..9576efdf1e8d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,7 +866,16 @@ ocp96011_sbu_mux: endpoint {
 		};
 	};
 
-	/* AW86927FCR haptics @ 5a */
+	vibrator@5a {
+		compatible = "awinic,aw86927";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86927_int_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c2 {
@@ -1415,6 +1424,13 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		bias-disable;
 		output-high;
 	};
+
+	aw86927_int_default: aw86927-int-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.43.0



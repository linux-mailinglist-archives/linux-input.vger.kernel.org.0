Return-Path: <linux-input+bounces-14029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D3B269C2
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 16:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06B191CE3ACC
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 14:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774831C861A;
	Thu, 14 Aug 2025 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="i4EX0dqD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8B1D6188
	for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181917; cv=none; b=M5W6b+ZXVksJyxl9d574JBBlUA+bW/pKBU1nO2lmPoIQwd92LQYbvxVW73yijl6OWyuy2ZnwA/UdkmLhJoCAig1nKOApm6dlOBuRouJd18EgaT5GLnUpI5RiswcU/tDyXgjpJEBp0zIlKB0yuHkR4zlyedlWFmlIuucgNPcNqYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181917; c=relaxed/simple;
	bh=DhSXH5X/MnMSzKpEZ4Sb383iahpmcRMY2QF61lP6iQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJIjslPUai5g18OyqhORU+LV80/haM5/GgxFC07J7kfJkyOqwMITrYu7LIiJ26Cc7vfgklsHgjHvlKHt/yjsb0KBM5Nj1Kbj7wnOtIbalKl9HRgkHI/E8ZYP7AZXahHE9d+Fso29YDqSxF9tiX5P8lXqDCUOqe+E5Rs9iZEBQ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=i4EX0dqD; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb73621fcso143206966b.0
        for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1755181913; x=1755786713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMvQYBfsoacMumg+rF9fJxblVybPFTp+y3sBY09KX/4=;
        b=i4EX0dqDMx6D3GL3u0fymmiQ2gtuD/7PB/i7aL8LXjhAgQ0JBiBnTEaGxVcYILnwy1
         fzn5gsMgXHbuWREZZ3x6QbD9vtGdGKSwsnBEWRjjVcn/hNwV9YpCPUpsGtV2x3aOqWEf
         Ce2E9k8EBbFalrzW/1mZs1bJkKqGsaEAIZPRe+hCiX5L7AV+hEq0Vr6QN/Thc5fj6/Tr
         4CTOrgRtupR8vdMVLdGtmENvuq03/pXYrV48P/gNgUH1PrG/qmztt2G7pVigaMFFGvYA
         xUoycP258w4v5Hc/3wjccp8hNExC4kslsloj9FBVD5G3biL1ULXngL0AyTJIT3boj0vO
         +SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755181913; x=1755786713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMvQYBfsoacMumg+rF9fJxblVybPFTp+y3sBY09KX/4=;
        b=FeGIMx6hSFVPQrUlJd+zkEKFxFVw8QVlAQpvBCdjT3HVhSbnrGZdaJqdZ2VzcDqDtA
         q1cDVZU+HfASDS0qJctJBrzhzw3sYES6YUEj2e24Mv2D36tOsBPNbDu7CX9l+RUsuHWp
         H50pVwMZv0xbQu5TRMrfAFXyWozarZbhnHU9NWjCwxQCZKaAmK7EvoGvJLV3rTfZAqBk
         1ysxnwMnRyVfSKmx/6Drwrp36mL2WCFoy9wwq01IZMtvwuiS1xGp79mubZ9i7cOKYcvj
         Y8rHiAQ6VAM13NE4vqKFI2hnyLOqAeMR+CbRmSYEClUo5I/9G0EIaVD9NBLlJY0obnAw
         qwpA==
X-Gm-Message-State: AOJu0YxKf/SXIzDvfuEk9qRsy3TqQs/TdOs/osM4bouXiwsNRpgJCTej
	U0ckjXuSCZk9I/zhuKdEV3cvOp8bRPgZficHEC52yYMD3qnDEMmsjgrOXmoPCNXAFNk=
X-Gm-Gg: ASbGncsyjS1rLoLjrb5HfTD8TNs38XKgSZWDx5mCrnyPDvGg6lCQpsbSc8FDzDRxZcZ
	ZAOLuzOQCUEQNTjrM2lzrhJVLkFWEecG2xMim7ueRazGCF5AoEIZJ1374SAwAuqiTmkEfDO6Bjw
	MFIK9ZBq1IdDB5PsHmNRVJE/kBPxxrLutbycoRoAxjKk8S2aChZiU03QQduaZAeF6T/bsLLJ0kQ
	dXVlTfLY9pp/r7gD9BrzAPBSteBCBEBJooHTGptTwt/GhtkxlDljnK1ImGtijJsxi+l3pMyvI+N
	R8w5w+5TrOqQlq2PryZmhgHK1JYz7W/t9uXMjLFdgSTr0fR450NMOlaVxR/7dr/QuhqqtpiiHiE
	MRE6k1OqFDTPSNRE6eRPBYfj2NkZbS4hUqt8dKDbJ33iOOM0w9NoO6m+GTIT/w5GK+eavoSg+x5
	adTCM=
X-Google-Smtp-Source: AGHT+IEpDMl3bfkZteiiPPVcvc7b/5mISGkuZFWMxDGLxGwbf+rrygSrZ8ELSREV1Oqg8RPpbuYWGA==
X-Received: by 2002:a17:907:3f0f:b0:aec:6600:dbe3 with SMTP id a640c23a62f3a-afcb9a3a917mr317894866b.56.1755181912991;
        Thu, 14 Aug 2025 07:31:52 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a313esm2609421066b.32.2025.08.14.07.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:31:52 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 14 Aug 2025 16:31:37 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-aw86927-v3-3-c99434083e6a@fairphone.com>
References: <20250814-aw86927-v3-0-c99434083e6a@fairphone.com>
In-Reply-To: <20250814-aw86927-v3-0-c99434083e6a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755181907; l=1292;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=DhSXH5X/MnMSzKpEZ4Sb383iahpmcRMY2QF61lP6iQY=;
 b=QPyR7vmm/q1jEnw+7pvkm5NHW/TE9mIdQwCqN5nSjgrcQ1PhHSdZfRB40DOgz9Izj4zpqXswJ
 GCCHy9nz+KtCxR8ghCwu+dtaVSWYeVq+YQhfqkZJxW7/VZDaAsutD6d
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86927).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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



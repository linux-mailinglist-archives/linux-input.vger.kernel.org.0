Return-Path: <linux-input+bounces-13901-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBFBB20711
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 13:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143582A232A
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 11:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3EA2BF005;
	Mon, 11 Aug 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TROteofY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A7F2BEC23
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910825; cv=none; b=GowxHGEiLdq5AtZj7mtJyw5/auHViJVoQC0AqXCFFb2Wux+IBLq4SUkfp75Uc0oJkGbxykIFviYG10eo+835Yq2PJ35cB13nmcaFhG+P33LV6hFuMqJjiA0pQAKVeeKQ9onxTfLmOnVRhaMsVrgFeUH4Z6X9LJXtXUhgh5YeFc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910825; c=relaxed/simple;
	bh=mkMKBwz5BKx3M5ukHVq0U7xYjHmmJcHQfBYE9D9pbLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fj+QtYWbYt8QaNoo1RFpLr+t/6qptS1t8ssKoqhgiSZsYiKUcJ8LJaxZO+DrZjkssb7/mGJhO/t/zSXW3kEa4g/MRJYxll5JwcwpJfx1w6QQCFqVWpdedAinTTfi1jaxgDQUPeWQrcVDtxfXwDRj2RIJ16yfb7lpik80TQAvtXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TROteofY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61580eb7995so8586384a12.0
        for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 04:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754910821; x=1755515621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKHJowmVjOKhweg/31XcJuN1dKyemiZUjq/gTTEI0D4=;
        b=TROteofYOvDg3irF3m9RkDwT3FLkah9WL0dLcQzXxIevGrTa7+MBhT0UXpahFRAOuP
         g4lSe8UwlIQAb04/jEIJ1Kd8/sAdoFLv1GjLg/kYA8x+uoHO/lfIRzBq03505w5506My
         wmoUKRaRbWAfsB2AnzCrUVm9o4x9tzAcQ0e7XrmBFrW+zpIVyUIYabkryATfWi18r8LF
         yHa3uTABTLLmajy6dQ+HRkz5tXfDWDS3pHnm9HfghNbyZgAqwVE0ZnYxau3tVaZF1h4B
         KJ1E1r78+pCb4y0W82D8ixIlDiabUyM2EX8/OG2PNNRzExuhACoFWmZ2xmi5fhbKjqVI
         KGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910821; x=1755515621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKHJowmVjOKhweg/31XcJuN1dKyemiZUjq/gTTEI0D4=;
        b=WZz11yAca5VkZBXauv8qrumfhYvrkLWCZ5aHMRVn0dMvek6dmar9M4pULnUprsgRqM
         3Wb8EhGUiukB4l3EjQDVskaPbgHFf0yk22cwkDeli49PBsMH/BbA1vXvJwLuYgkzAMCH
         j5v0VzDLjc2brU0sdLyA+QzAdemeCUg6nBpvuTsY/gr0GJXWVkUJeSXFb4FRX62FpykG
         CcMAn7GW92on9oLkXNxdA23m2A4kpVGr7fbTBV/NLo6OZutvZBZKY9ztqlyXKR46n515
         yh9/lMf48kIKUeoGSL5/ELrO8KHrmP2Hpx06jYqEcjWa63WjMNuhDhdOYYFSa8OWCdIr
         nh6A==
X-Gm-Message-State: AOJu0YzGA0FzxrbCMayQN0vlmfy1nqtzddvpjIajc/YQvvxJL7c5rsd8
	+es/gtttOYEvYbLPUPzeNwBsmzqfslhfRCVp0Oamm7/qWxj5LbK2V5KX5u7YB7pma7c=
X-Gm-Gg: ASbGncsbuwGNJYlO+Ft7c7gyQcQP23bT9Xu4bRlVgW5XTnpNB8FbyywOZOUZvU1Yikg
	ZAVXIlVf+kau9LqiuYPNGyR2bDZPWpfRl0xxhHglSKpDbBFkAusJWNeYNzVUp3DGiQrdPljdVWF
	9kw04X7r8u6eUIk6+Q5mz4BnBP3sUIFBYhTLrd49RbYxkWEKURe7LWF8QaIMig5LvJHj1ArZT1a
	8AEyM0thndcRTG3ZKGh1JPF/yH8jsd1gYFNatSYB2CtwOC5wK6yJAnRvVrs5tIzqCK6zd/Fbm1G
	4nTEvfLUWJp1TdzcnQcoz9GWvvEsZ/0h6wRRiuN3YlVNkRXP2AAixS4KVCIsdWGlBiXz6aaL1FF
	q/C8XcHZKyTUud6GhzuDFnKAk3dTspRFNDGjIjLhDDx3Jg9rtDJV6+kBNf4yBoJiISOkio4XVzg
	Efqf8JD49wNepNzg==
X-Google-Smtp-Source: AGHT+IHRCN7eL24f2+uJ1/cTx21XdXiqqR+ERsGO4alvFO10WDOS1ocb+M0vZv9ahqle1MU54VlnSw==
X-Received: by 2002:a05:6402:34c3:b0:618:1ccf:5d33 with SMTP id 4fb4d7f45d1cf-6181ccf5ef0mr4724047a12.3.1754910820752;
        Mon, 11 Aug 2025 04:13:40 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61821e562c0sm2467278a12.30.2025.08.11.04.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 04:13:40 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 11 Aug 2025 13:12:03 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aw86927-v2-3-64be8f3da560@fairphone.com>
References: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
In-Reply-To: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754910818; l=1231;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mkMKBwz5BKx3M5ukHVq0U7xYjHmmJcHQfBYE9D9pbLY=;
 b=RzORlAlz1VWsCrifplQz2SBF+em4EZ3hbSv5P4U3iXjuWlyJeHqx7WLRQ4fYGjxBiBEqtOBLU
 5UAtWu+vTfnCXFwRxIUeOwaKNEcsIHQx+/fTBGZYAlaQQtubiJUJA0x
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



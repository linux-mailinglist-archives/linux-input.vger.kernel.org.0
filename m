Return-Path: <linux-input+bounces-15100-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B0B9E919
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 12:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA8E422510
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 10:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC5E28134F;
	Thu, 25 Sep 2025 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ARbZW2Ds"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A372EA49C
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794871; cv=none; b=lymHjKzHaAUVfFj/cWJz6ngV4TnKKQX+h2aJ+ntTRIsDV0iHgeKOhmdkP0zl84Eo6fGXxjYWYT6vuh2uVuXlO4qhlB0kH7XaK0zUJwDID2Wdht1bck0EdpEXYVsZ5n6sB0ZAg/s4qnvuyx+CbB+P1PBG8SmvhaqcheCWu/FghFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794871; c=relaxed/simple;
	bh=LhKzzlkTCNl4IkWDMHZ1OAuhVnKTDiivlJgT2WmkiVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9zZasQk+NB5HrZjnIIAp6/2lDnIzkAy0LtxQ0hEC1AC8zPV0hvU/xWnGSXg3C6QRf6/9bk9I0XCvD9bpTUFTQMKdWGSUh+hpFe6ZaprbH2ZpL0ey2Udazf08vm70o/V/WJgaXE2W/jXI2YRg1lUSsQTrkSDjQorW7CuOFHGUxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ARbZW2Ds; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b0787fdb137so128913866b.0
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758794868; x=1759399668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=903p68FO4P6xFpR2fJbxs0+vg6ytltVcymRFkkxQT9E=;
        b=ARbZW2Dsa7h48FcBgS8Y87noqo0j6tF/GHZePIRsLQ1BLftnoe4/gWqNiwgodeOfFe
         VMHQD6lnlp2WyX2yz/vN5qmuflLKRnupwqkCM7UXR+YSG0JlD9RNfqwqIdsv8Ekecxon
         CyNP2jb5HFrN7A4bOWGpF0pbhqi9DOsemrzVGUnWINpyxx1V2tatKJ1ln675j6yb35Nu
         aE7Hd25uEI1x5AA0E2y+Qc7Tgj3uDsgHge7rbU6uHMJDFYR/nKUvOUM310NIum6zqaM2
         XqSvMklKeakEEre0aE5GHjFRYtqv+M3vDT5vtFSA6RtLlibzNeHJrfDzToAHXAoCNWFt
         F8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794868; x=1759399668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=903p68FO4P6xFpR2fJbxs0+vg6ytltVcymRFkkxQT9E=;
        b=J3HFcvgaUPH6G/zog8Nzs1sr8C2vxHzFdc/XewjGlu/UcQebqgOdgWhjPTC0VVaBp4
         Qi+ZhCYAYxnfox+f+8ZmDJwXDwhCWobYbM7CJILynL9KCo4cOG3ireXCTeDFP7WsSB9U
         2u6R/32U2r3YoEbWrpF1JKN60eTUq6rDi3cp1htb6njtLkGaJgMqWMS10XNANGe3xI5i
         uH9MseReM5tRdM1nEFGrl7VnBKNQOkTEXfEGTd3CFWxzveQDpdx4/nNfiCKaxacfGK27
         7TWaSZgmLV5WccK+siZKKDfQebPQ0Vl+CdqSGl6fxT3wC3zg84zXTHQUPbopUSMu1m0q
         RPRg==
X-Gm-Message-State: AOJu0YytKpNszhDGK97gPQtLSphT95b3+GgblxguH7450tioOCeHxge9
	lsBHs17/jNYvrp6hdP89C8xxW4VZ/yX66nUl2QnujSVhAPyD8w0eoRzkYnzFWFJ/pYE=
X-Gm-Gg: ASbGncshVNC93fsTi0hNEDPkO0ah6QPVsi9aIyvSLVFl6RVPQOCkDv8sLeTWtMraxwO
	mrdkOQ1xFT+T5kDowjClBYEOY+ceYWpA7yYpWwZX9AWc30QKI7pyTOgpT63fWTlhVqst6TGyGv0
	CKyOyLz5eTcJozklIEue/qWkYTDcas/pu6zwJNcPA9d5uEfV9jYBJ8n73bvOs22muJKgUElULFq
	QCeyQSzCOnjn7e32K0z56JpK8pGSQc3oiUC+SVkysvLhF5r0qCO5sfhFbUb2xKlJSVQnRcA2Fom
	MB6ufiweSSLOV7byNwGA62OE3M7GkQAa2qPzrXVk+LDrXSsKrXkjLCHXpZcxPSwtrLewFImbJdn
	Xe5+az3t/efN+9HgF7hUiLAtIx9jiwHwE1jcHXQL09W6QWcUKF97hDVf4lCOKEdbqaxdqzK1TA8
	4S0c2D
X-Google-Smtp-Source: AGHT+IF+rhp1gxg0uR33r/iYlZ/H6zFSEFREOPZi/QkHkOOsdTv1r3hShr/lDkKFBiRpBVxjnCVhdw==
X-Received: by 2002:a17:907:7f1f:b0:b04:1d07:40de with SMTP id a640c23a62f3a-b34bb32043emr296615366b.23.1758794867875;
        Thu, 25 Sep 2025 03:07:47 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7746sm134270766b.59.2025.09.25.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:07:47 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 25 Sep 2025 12:07:30 +0200
Subject: [PATCH RESEND v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-aw86927-v3-3-1fc6265b42de@fairphone.com>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
In-Reply-To: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758794865; l=1348;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=LhKzzlkTCNl4IkWDMHZ1OAuhVnKTDiivlJgT2WmkiVk=;
 b=HeTBl3q9SOYLzKQKn/q13ycWxEYizcLQXQkg7cffIeB26/YJEFy+IePzXMRYWra4/avx87cX2
 zjAzQHQoBoTCbjALCUOjSkFG8L0xlt893+/BK5/GDrVjRmfMDicC1Uk
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86927).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 4c6cb4a644e2a7a5ce6848283e8732b3dda1758c..9576efdf1e8ded31dd2babd40c377b2de9ae9c41 100644
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



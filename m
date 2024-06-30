Return-Path: <linux-input+bounces-4731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 859AD91D32B
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 20:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A640CB20CA9
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 18:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2B6153BE2;
	Sun, 30 Jun 2024 18:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="sWFrK6Ev"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341E15574C
	for <linux-input@vger.kernel.org>; Sun, 30 Jun 2024 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719772607; cv=none; b=qbqy8iWfUXb2HM4PXLKu5mehX1wlkCopX/oIu1AQB/C9aPpavBvXVpxoH5MFKh8oQKnVgfgt6T2+Va4i7CQvAVLN4PYXGT1cUqdVGF0D9FERxa/aORvjC31Q3aDdn97b1olxuEhz2UI80Iz4sIuDU4t2MWg+5RDVHOsfpV8CoWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719772607; c=relaxed/simple;
	bh=sfqCkFm4ffKdXhUh0QxIxVfly9k+wO7sdo7kIj8rVGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlAtnKHNxVKhO7hoVPDttz6BMo0yID20q+FPEGocukNWT1pm3F/Mi8Xwo/NGMvwZ16s8guaRbgTAfCFVv3MIDb+zbgmph4EhR4sxWnOVlcprEjWwD8cCffdR3VP9Mcfq5zDnofY1mP6B8jOCnRidigI2CMiZSysfe5tPpiVE6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=sWFrK6Ev; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719772604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1iJWQP8kPoI5Jy7lwZwh3ljZEa5X8ygkgrRafMpTwQM=;
	b=sWFrK6EvGqQjzfhIH+d3HuwM64C8jMYpZXbThqT6mwgbXL3LBzBWFLhfgujTosu0PDC9T2
	+Is41jz5Qd4Gd9EJ6t5Q/WTlpc9QhJ2azvVkfWUZQ5jjguCfveEIHqQu1NzH0Tv/RzriSY
	3fZ7CfMpEmfTJhkWQkHVFsy1/j4wKfxQfkwA35Sax9SDKbS9aTXsCbWMX+yUeAuhCwUE6I
	OeUlScL3G62IUWNNzHnAEet1Jhefaxf/3eMqJoICPpRA7Rt5stnTj6dm0YEnEdLQMeNN2y
	JQJs1T9Ihx06yQdG/Q+73BNPvPR/qZ5aJ/odusKHgxxaLkUvfIIA+xf53hZ+xQ==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: krzysztof.kozlowski@linaro.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:26 +0200
Subject: [PATCH v2 3/8] dt-bindings: arm: qcom: add OnePlus 8 series
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-3-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=sfqCkFm4ffKdXhUh0QxIxVfly9k+wO7sdo7kIj8rVGc=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWzMisY6NFhaBX5y45OFWOoYcH6nbzOrBWKG
 2VA5vgpxKKJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 tpQMD/4uFmj2FlllhUvvBi7GnoQiMBjL2V/XwzG7SFGjFuujMRiY4vEqGxG8XUtpOUlbY/hOqev
 2Mby/K0V/TjJAaLQAm3XTC4Vnhl8zZjbWNLqmhvaN/YLSV7X9hNhwv6MS1+vnDDvTnHI4TPj9RL
 o+MO9u/PrMN+lD0cI+WF24lQm87pR4hJWccugcdBTJjAJ3pPyPYa0wOHsbuae00vA+fy0e0WKam
 pq8kP/Nh5Tl+7eGYf317Kb4K7il8TTmQr799njGNVBCrw8va2oQwO6FzCU9HMZLH2aX3tZXhdg+
 zc2V/gGx3NUzj7Op/HyXHgbo0e8mnK+Xq3lhkVCxLw3cvsVdkWSionpGZtEOF2Hk4XTY6S2r1ON
 uWv63pD2W6nERquMDN/EgYBdfi3gWB9l70f4NUShXAZuT61bFNmrecq/dFyy1DaUlK26fl5+jOW
 zOyIHyEjbjTT3hGP7En2HTTYcAeMYoQbcQYshI78laLJSlnJe5Ds2EbiWIYK/7/jZ+XJlLw+Uvh
 NWRN92tm+DMT3uTZcCjtQ5lsFP3al1XKthSenkKUEXBAf5UnH2GqgQu+9WJ20QItHyAis5BmzQE
 J3SP/GmbZVN5jdJDTBjD6x/2byLoJ9aWfK192usEFWeAsFCpRvjn4F6wPUVfrK9v+fWztq6/2w5
 QfENbPK/iHBsp5Q==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT

Add bindings for the OnePlus 8, 8 Pro, and 8T devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d839691a900c..3687b65cc6f0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -986,8 +986,11 @@ properties:
           - enum:
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
+              - oneplus,kebab # OnePlus 8T
+              - oneplus,instantnoodle # OnePlus 8
+              - oneplus,instantnoodlep # OnePlus 8 Pro
               - sony,pdx203-generic
               - sony,pdx206-generic
               - xiaomi,elish
               - xiaomi,pipa

-- 
2.45.0



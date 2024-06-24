Return-Path: <linux-input+bounces-4579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F7914007
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 03:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20CD51F22E83
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 01:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DA14A33;
	Mon, 24 Jun 2024 01:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="T1Jm7rW+"
X-Original-To: linux-input@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0369620E6
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 01:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192646; cv=none; b=ZhLm3HfOv3IEG64yMDpjSwuoaeieS96U0fiXHDwt2dKiFdRF9ZrDtnCrE1tnvHlSIskF03BCjHxF8/hDhfPCabPHSZ6J7yXgP4m/2vxwYFTN5Q8XpMnWIZiGBgkwiG/csfqZpGhIiOB3P6jocoPaZ5uFIKDu2ChiD5f0MxV7Nvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192646; c=relaxed/simple;
	bh=UxKVakKxEAyM082N2df+yNf4iORRnEsaiSraRJGPrgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxuXBTFD5qAWeBM65dKix5k+sfihDq92R5MEyjNyxmZIPW8IgLBi/eQ0YwqBCpr/u3rr4AxW/Feja/W1xjQNptGqGwsCAUSXlAPfJ9C6yY9svzWTWV60hmtmB5IEkonxavEIxajvsll4CU6QUo9YVbJEhAqbcBzyqIPAXA1oX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=T1Jm7rW+; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719192643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZii6mgpmc1LquyxAX4rsoJgM0vOMZuCuesI8mpxgeU=;
	b=T1Jm7rW+iqAQz2L0hhVVTQCWFIBKaPxVc8wL8rR6KRPlbu4nqfEX6jPE1Y5fadLgV9i6n2
	bp2pNwpUw0oY783JUoXL/NBkGsuA/2RO8EZCC2v0OwyNFiwDlPcjkczxHPNC+1vW9n6lbj
	YQ0Z9nONJ725C95ugo0l6V6MRuvRaDzWWN1n/2PjAHxR9oiXl2yea8F2vEwTs4y2wvqTnK
	iCROq4sOARNbffO0K2xfzE4zunDwjx7+EG25Qm7VAyCv1lTw85xvfpP0L40DASZtFY0Ulr
	1Nvnj1T1HIpShQ4EmpQOxWJMqR0ShtfXTwtTwedfzcVkDp7w+j4F7Xc96Raqfw==
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: robh@kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Mon, 24 Jun 2024 03:30:27 +0200
Subject: [PATCH 3/7] dt-bindings: arm: qcom: add OnePlus 8 series
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-oneplus8-v1-3-388eecf2dff7@postmarketos.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=caleb@postmarketos.org;
 h=from:subject:message-id; bh=UxKVakKxEAyM082N2df+yNf4iORRnEsaiSraRJGPrgA=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw7UDDRStSoEQLqgLWF9fWRm/RqfqXCEZCS/
 65Iv2zY3/OJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMOwAKCRAFgzErGV9k
 ts8jD/9kEvQiv74tB2glQOGOVLIwRwOVZEEb8/aI1DbiThGGhQEnXnRyLSaE1EVEErLsCxmT7py
 Rww8n40lwPwWsuooGAXlqIezRQC0beHckT4/rXCgB2YARXikLzCvR5tZ+nwtBhFXuGyBajv967r
 Jmk+P9xosfJigJt4rId1c+ABYraEESmuSEc7+KkXwe2TIdy0go95sn57iD7kdqgn3/DiK6fN25u
 rhwukGwyYkNPNSQhRy3cI2xavvoZyWxtpoKu2WbTsQhT1a75c7jDYj6/LRM635uDiW4ovXON/wL
 aJt5gxT+ds9xyhm2ivG3WnFwRetLUUYwp5nGmrh3OgvNl6VN3eI4i3LjfLrw0DY4+yzI4dZt+tm
 0tOfA26MqkcTd5IFhBO+5Mb5tpQAtqlIg/drOCwxLtyen4bTIFU2SDY/WCZh9tNeRvzv9+1A0D/
 YjmWdG64oAqY82IiDAMfdQr5s2xWqBCr7/H7exlsB2zdzniEMWob6d5c7BQNnDf3amBzmg4tJYR
 22I9nUQE1cHuQ+qhInGzc5DQjsbo4ZPcMqsUyzJhQteVmBKKXTe4XW2dkzB3MjE/gXpkmZzTTm9
 +kATBYgpDsjSB6QvtqwmdQhmMM8hBSH7TyCYRknvaDh/nqkPojlpJNd06NyYsnOtaG42pIfRqJu
 aqCkfww0Rc2IOyQ==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT

Add bindings for the OnePlus 8, 8 Pro, and 8T devices.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d839691a900c..a41eeb8c3fc5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -986,8 +986,11 @@ properties:
           - enum:
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
+              - oneplus,kebab
+              - oneplus,instantnoodle
+              - oneplus,instantnoodlep
               - sony,pdx203-generic
               - sony,pdx206-generic
               - xiaomi,elish
               - xiaomi,pipa

-- 
2.45.0



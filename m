Return-Path: <linux-input+bounces-12182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FDAACD0A
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 20:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60EF3AC2BE
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 18:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F7286435;
	Tue,  6 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF3wpjaJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADFC284694;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555529; cv=none; b=LvxLyUkKg/9wG6zg4zOPU3fT0K/Cz9a9r1MIZWQT/mWouKX1ibBzqaoyCssIYoFFpnOiQD7PQub+LYbsiZejpyHSi2sbnsgd1O/TNfCcB/mSUSC8p454eqrnGRtxdafRji+SOQ34C+Zptp1XecucUyEGE2+qYLoG+jlITmQox+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555529; c=relaxed/simple;
	bh=djzHVavlApjcL5+epdW2tQEGyvSj3sJb4p+0EWAvaf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7ri2rIWcSZiRgoUh3f4eDtPrfSQMTMLYMFg1yfcMCLlFCtg39hN5qRhe3X7Yq1qW2eBlYAO0BK9RhJDcruElTDBU8Reh/gU4Tk2mcqvYRZ/ktw+JW0V6YX0sQ3ZUPM4Q/NeCau54njryyzJJ5/QcUjX7XkLOkil42Pbz8yfj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF3wpjaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C932DC4CEEB;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555528;
	bh=djzHVavlApjcL5+epdW2tQEGyvSj3sJb4p+0EWAvaf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WF3wpjaJR+rk9xiSK1SZ0c3ConRPTBLR3g+jssMMzAMXK96gY7/FKCzY1/fvGWacY
	 uqB3+K87RpWizH4afGJIUZ7LtW3D5O/BWyRizQ9LG6aPlAKKW7+U3VW54h3TTP8irr
	 mzYZmI+oY/BfKmgZZiFtQi22UN1dTU+M0KfA+2GsWYM2qEn09RT+NVXBgJA7v74jRH
	 2lSM45Dgmgryd7I+/Q0i2nd1Y2JFsKvXYkFZgx1u+BfDTpLjsrlSEAWTlqC/r6uCYM
	 9e/Y5ln+ZBPptP52QP7bz4nB6wpR1tFNAYhKm5/RIpeIjf1a6NAO1Kys9RQGLwNSc1
	 k5NBLRhWYWTrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2F8C3ABC3;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Tue, 06 May 2025 13:18:38 -0500
Subject: [PATCH RESEND v4 1/4] dt-bindings: input: touchscreen: edt-ft5x06:
 use unevaluatedProperties
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-pocof1-touchscreen-support-v4-1-bfb53da52945@joelselvaraj.com>
References: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
In-Reply-To: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746555528; l=1632;
 i=foss@joelselvaraj.com; s=20250506; h=from:subject:message-id;
 bh=VdNFQQYZg3DtBiz7djqa47zvKcz3+ph7toNxgsM7vNg=;
 b=ckbNOn8YgQSIWuQzufuxsyNDrsvMYBvd/mXNqEEz63m0XnDuNEydiO7g0dyLTH9YPo5D9tTrv
 p0SN8gd78bGDTsoK1GMKsjwQK9vsyalp0PtKpLpR4VliqE4761qbogM
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=/jk63vyofgC3YCat+t/kcBv+rlSEVcI4PLN/LN0SQlQ=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20250506 with
 auth_id=399
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
FT8719 touchscreen is integrally connected to the display panel
(EBBG FT8719) and thus should be power sequenced together with display
panel using the panel property. Since the edt-ft5x06 touchscreen binding
uses almost all the properties present in touchscreen.yaml, let's remove
additionalProperties: false and use unevaluatedProperties to include all
the properties, including the needed panel property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 70a922e213f2a62e3d0bd403e24ed9c3ccffd2d5..ab821490284ac0ea13568cb9ee357aea3faaa1b7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -103,16 +103,9 @@ properties:
     minimum: 0
     maximum: 255
 
-  touchscreen-size-x: true
-  touchscreen-size-y: true
-  touchscreen-fuzz-x: true
-  touchscreen-fuzz-y: true
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-swapped-x-y: true
   interrupt-controller: true
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible

-- 
2.49.0




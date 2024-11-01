Return-Path: <linux-input+bounces-7835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F39D59B99ED
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 22:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAE461F22593
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 21:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780D31E2855;
	Fri,  1 Nov 2024 21:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtKrabIr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF241E282A;
	Fri,  1 Nov 2024 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730495607; cv=none; b=oc8b4n3DohawqWr8RaT6Otr0ZwFPswSC0CSRTUBaRgntavRdY+E0iFy5/Q5NmdrXj5ZFrzvKfdWjxX9JGpFTAuvx6hCWdPEiIQL9hBe9gShOBFyaLkeknjLmnkvDiTxxBYDXZN47KwzSl/tglgLvUgWxFYK9vFTKkwKh/OlHeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730495607; c=relaxed/simple;
	bh=SOC8NatMEPdI9gGlEuY2BgOI7BhxC/TMZh2CjgJx+O0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oI8oIIThRnbQRgbcueTDSssku5jiuIiQnph925njADNBHX17UGLEgyaJkSqVDACMGkl28kPQgTsRDIU9QNQCLEDGehPD+AgTis28+T3LqNcArFW2Gw06cM75BjhyFFU1jGRQvAqeNWq/0iRDVxoy7Iao7uS3EhWTi7McTkpiqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtKrabIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F30AC4CECD;
	Fri,  1 Nov 2024 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730495606;
	bh=SOC8NatMEPdI9gGlEuY2BgOI7BhxC/TMZh2CjgJx+O0=;
	h=From:To:Cc:Subject:Date:From;
	b=CtKrabIrNq3yoyexdM8PiJILqUhE+IZG6QfbJODmZ0mcrrQfrEoVi0FGDY6kj5SZH
	 tRZu2zy+aCmOAy9nwtgyE8pwk/KB7Vvo+rM3JG1bqfkLvuCfKcLb+0Sl8dRXdpwES3
	 MSi4GK6FIA1DDsvATcQK2AvQAMRqHxrcWZOacAlazge1edIp4in2BeMRD3i79iJ+QH
	 ygbOTdnvEVeGi8Zy7xbHKCcxjT77QbAx4+Xq342ytrfKUZxkVSH4Sfdu2Ar7IwZrHF
	 UDN5e8HcRsqZ4zRr8x6FCj9FKxiOncyLxTLm77okp0Uduf8eDmKuljEkvdyj5muiCY
	 pv2xrrnMVS5EQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: input: rotary-encoder: Fix "rotary-encoder,rollover" type
Date: Fri,  1 Nov 2024 16:13:03 -0500
Message-ID: <20241101211304.20886-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user and driver both indicate this property is a boolean, not int32.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/rotary-encoder.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.yaml b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
index e315aab7f584..f9332bb2343f 100644
--- a/Documentation/devicetree/bindings/input/rotary-encoder.yaml
+++ b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
@@ -41,7 +41,7 @@ properties:
       device, hence no steps need to be passed.
 
   rotary-encoder,rollover:
-    $ref: /schemas/types.yaml#/definitions/int32
+    $ref: /schemas/types.yaml#/definitions/flag
     description:
       Automatic rollover when the rotary value becomes
       greater than the specified steps or smaller than 0. For absolute axis only.
-- 
2.45.2



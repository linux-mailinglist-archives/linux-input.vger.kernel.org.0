Return-Path: <linux-input+bounces-13541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A25B0592F
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 13:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9368418915BB
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 11:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48A02DCF5D;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtHoTJEM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4A2DCC13;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580152; cv=none; b=Gw+x640P2N4wamJxs5VTB9+6yNYKxrfUdTPdHsR4NT2H2o6N7LbYjoq1DmaQSqnwnlIXqApLtTeW/d4560BxLXj1MxgnYBXHNKiZMgsckhidGJeZnLTVcbt6s4ZFOQzDgp7eZarzL9cNqdNhACSIczJpf68P9efTCfDe75cllEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580152; c=relaxed/simple;
	bh=DYbbVrjqWkoup9Q75iFzh70qZM5vDLpxKKe1FlyKl/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeZXrC6OfLwtu5gQxTe50py9ap4vMtT7gd4tlLt0DHGTwwQKJyMsg/R1gRwYnt1EzS2haLPSXcqixF+sEo/JtUNSs7/BF4XxYZ3s8APvmp6y3SLHOlYSHj7NJG4FSleQ73i7zeJ3ylZ4ZuKGjBKbFPGVLs+MK3GB8cyrRCGwMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtHoTJEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CE14C4CEF8;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752580152;
	bh=DYbbVrjqWkoup9Q75iFzh70qZM5vDLpxKKe1FlyKl/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GtHoTJEM6F6rOLQFsAbGoD0/5NkYhrk0uWmaCIwfdckw8cn+8C6m9f52qi8SvmGMc
	 RA6p8hj/9cfx8pubHo5Ft2sxoDyst0iikifK6OGV9Zq+5v5rFHZ79K/Q9zugoDBPDI
	 fuTA0f1xtD6aTy95K3lASO5oGz+sXu/CAHxlO10VNJwG3m44VTyVmrZvOBuwqhNyND
	 bEd9c/qEFNUTQMb2tj7tiuGtBcaajlm7f+QVYxTo/kZ+qnKwAYXzDV7AVt6yftzhte
	 Yq7g4bg8G+ksGPxJL+J50hMuUa6ibCow6J1fMju7X/2//6g/Vmb2s66EX42XxKeZCs
	 DlyafQJUOiEzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156DEC83F21;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 15 Jul 2025 13:49:00 +0200
Subject: [PATCH RESEND v5 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-synaptics-rmi4-v5-1-ca255962c122@ixit.cz>
References: <20250715-synaptics-rmi4-v5-0-ca255962c122@ixit.cz>
In-Reply-To: <20250715-synaptics-rmi4-v5-0-ca255962c122@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=jlm0TtzM+qwlqfeZi52UxUZv7l7Eivv2BkocqxTGAHc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBodkA0542TUS1GhEXdCACJaU7dwt2BzADN4kt+k
 0XQwmfV/6mJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaHZANAAKCRBgAj/E00kg
 cjmwD/wJ+i9YGl/wWRC/JpI6fnwMtVKc2sBAhlgJ0QwZrjR5Y9aI+RT6TzPQ/RoFrBkLyj+6aIm
 R937UWS4QiTRk0nibiWQa5xMsAW8zbe8sQaYoc6IXRQCni8SuzmKCA/VWvaab57DXvimSbs4o/D
 AQZy+hQ90rRJRRqUdLM3JqC3tH9316wMVlY9Sew7pRi7qjOJJ6eZr+tdCHnIa3yKJZhZ2nYQJS1
 5bRU9LNrmkv1XP3CqXrE3+OItNc+qfC495RKjZ/bC1y/GIcz/hdxktwnyFffUx4C7RPAiSmJ7Wl
 9F1oxbWj1HNbObIChuA493I4QZJySlzNH+7/GlazlooLlc7zEdFSsriZrubPYA+5dDorMK9h0eb
 Z9Qw8rcLT7UBWL1IizDBlVGP4CgIM8iPjmPDLsQMhSxDdcAAlRd2zgj0HGuoF0vi4dCk1iR4P4k
 DfG5IfGyuL0cYttEmvLC8SqmXZzxNtV7aCSIAB/0Qra9qzuMaHhs4Owwv/tIL3eLPrrLatPOOk1
 /JjI1YYDw/+vg7idiB+KviPUA8+95aSUoF9iBEyXIJzJsj3S7d6mB03bAVBqEZFxyhgaQVUZ9kl
 TsJwl1AnkH5ziUVhOnEDUdxo5GvjwB94QZX0kQj08cx+Y+SeKpzyHH5SwZsPW83zLsbA60scNCx
 tEqZjdPcsvnvDlw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Mostly irrelevant for authentic Synaptics touchscreens, but very important
for applying workarounds to cheap TS knockoffs.

These knockoffs work well with the downstream driver, and since the user
has no way to distinguish them, later in this patch set, we introduce
workarounds to ensure they function as well as possible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index b522c8d3ce0db719ff379f2fefbdca79e73d027c..d5d0225e3826fa5a0559cbd99115c505ab113aa0 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - syna,rmi4-i2c
-      - syna,rmi4-spi
+    oneOf:
+      - enum:
+          - syna,rmi4-i2c
+          - syna,rmi4-spi
+      - items:
+          - enum:
+              - syna,rmi4-s3706b  # OnePlus 6/6T
+          - const: syna,rmi4-i2c
 
   reg:
     maxItems: 1

-- 
2.50.0




Return-Path: <linux-input+bounces-11705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F2A8464B
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4906419E7F05
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541F628C5C5;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3I9cHWb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358C2857D7;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295304; cv=none; b=WAXdwyHMkRm3yijeAv3a9e6IWvWGcdUeCwkiM/Y8rg/HArr1bP4CQqynUB+9kLvFObKwvxnsgzrHXXj1uXlXYy+zest9mJERMagaMJj7gXsvLMUqJcZYGJc2PzqLKSNPhMoi7OVbUmlsXLQy4xS0EyPQAaSu5ub7Cxzod+IVT4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295304; c=relaxed/simple;
	bh=07lRH/Xs/03N+5c/0GvvGnaaiwRX1lGStx7S5SnlxLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbWglP/4E/LSHgyfyZXX+F2AbcN74riAbCpp2gDKMJHFZM9AMy+I2gwduVcE1FrnqnsdYHuCTpk8bV017HnnZ1KUNBm2rJeba7o0lnhuOcddQd+6zwzlXwbLxeOyffsiAVe4HCtfFbUiqBii6vn8g9zRCUL1U1Iy2e+tFfwB3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3I9cHWb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C613C4CEE8;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744295303;
	bh=07lRH/Xs/03N+5c/0GvvGnaaiwRX1lGStx7S5SnlxLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g3I9cHWbNlwgKVZ0ewPfNMUlKM0AFXM3LLouylmkXOQmtqYvYHOMXi3PZuAIwyCqK
	 HYrH7AS5uYtHkQSEmGJ7CDTOsqtc1/hGP7JeGoBsRmpDeHGiF//+wqxwFuWRsT8Av5
	 ZV3c5U9CXYT2KlrXNoyvAspNZXbNa6rQovUIEjs/FBkgjPnrJ/5BbKIg75PZBvAcX5
	 OGTFCifdGci1LalUdKt1ikclnboaEN1sSu+2iKuPdAFryfYef0bagzam7o5CKMNgz3
	 TWrp/LJc1AJDhjUQd3uMCnonrYr6wy8pP9j+3B/EfKwOo7xHqcpWD3zFVpjrMk9MaI
	 apDHE65yZs5dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DC5C369AA;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 10 Apr 2025 16:28:19 +0200
Subject: [PATCH v5 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-synaptics-rmi4-v5-1-b41bb90f78b9@ixit.cz>
References: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
In-Reply-To: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
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
 bh=vZ1A1BKo6qcJdGwTku+fpPYc8gaI2CIp5TJIm0fjjbo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn99WFPKRohmi+kM4ZwOrlgDzZ8E75/XLNBy1c0
 21mvrqCIdSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/fVhQAKCRBgAj/E00kg
 cvghD/9ZcQbkw1tVd2KIYU39rQZH8BDZ5SUAf3Nb1lZwArrntOQANjeQHN1D7VOCPDz+mRK+IiP
 OBnObNOPr/NhYLvbxD4bbQUQvvRPF/shH9mPTIGrbaPZcloQLnH3onV1pqbGPSaRPIjB6BX2EzU
 hPVq7UjsMNR+x4HnSMmHc/j959chBjaUG7IRts2SkDb2XiFCWqART8nVs5+SMrzoeDt1sgn5HEQ
 3hdQQXMciIsxbonEH8HpT61pOdRDaYnaCuZ/fU3Y+3ceSQDJM7BbU3MYyyw8ZN6ibrRN75HllDZ
 phqOk2ti3O4UIbf3k1HOywxzMkTHa2qfFODdubI4ZMqytfLbP/eG25fXL2ZayMbQLy+hFHBppaI
 dDP2rvMWVHpmANOghMba9HENLriwDSwR1VQzUNOAQPCDwDqPC7f5R6K5Ojb0BQ3DGecZWM5+qIP
 IRSME8rr+pbH/qlL0FcxSzzjasMfA/JszSzArJ2YTBVeBzWgH8vDBYGd6KX3dMMzGdl/MQAbVdx
 G7WFjLI+6F3nq7e7YguI8+IOTTLFlrRR5k+bqYT+5e9Pt5YPvxIz/+nAcinAhr5NxZ+cGYEk2QH
 vvm5bKku7Dpn7wyuQVtxFu8o+fJ2zj7W8ebMhkOQse5AFMcWYmzVJ4rfDsRkeTffqeOwlENZIph
 uB60GktHxtOnjbQ==
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
2.49.0




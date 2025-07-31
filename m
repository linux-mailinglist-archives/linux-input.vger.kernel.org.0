Return-Path: <linux-input+bounces-13739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC908B177B8
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26BA2585A21
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44762561C5;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9jEzjQG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E08213E89;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996034; cv=none; b=r3AqHbGtu9ABT3dIvcYl2MXI2ClPY9rM+APzwapZPBpp/NnbufkXHJv7QS0ERoomad/cS0Og3EMgTLR8codel8GozrOiV+W5QP7zTpJ0JW/wxrAYEza3jdyb+0/EQMk/mECJfPSRPZQ8tkNPwS7Obt6YVqfTs+kYBv/+zWwvUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996034; c=relaxed/simple;
	bh=eXBngxo0rpKFGqwkE/sdjN/hReVUcEgEPsE4tFp3n1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rf8uNy+/HLyS5WlZPKKYIT+Qe+fU9Dznoje1nIMQ6Tqj5uNJZ0pRd/GHUB2L/WVtO6CKExWiT0KS3GeMNGxrP/724oyAXdqO1woVkTaRYMhE7YIG3ik18MR7hTkT4iHkIz0NXbzH4i5IHWR/VFoNOia6lCiLNMS7rVtobysC2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9jEzjQG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 218B6C4CEF7;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996034;
	bh=eXBngxo0rpKFGqwkE/sdjN/hReVUcEgEPsE4tFp3n1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d9jEzjQGRW0vTsYImcXOfzktuKM3G3A7kkncc0n0v8nGPEwR6YFkWwkJiVJIgbzwq
	 5udISIghvLn7f++zokNTvfj8ArX+9NmWzvhyGMJZIeL0erlK+cG+D2MSoRLHADilN0
	 EQrrjaMAwxa6jMtNiTD1uGW2Mkv1SAABidLedwGLvnUV+FCmcCvZZyLOMwOQNEg2sJ
	 glXiyT05Yc+++BL6NrwbVW7MIoEBp21mJyG2PM+HAkRVD55i0rNCyXxfslWzvKEK56
	 ydVSsqxxFit3W5T2s+/vb90f0VSBvwEaWpnP8C3xJwLZcMPezk9t8i55/1n1u5bKZS
	 wIxxS2yh9I+tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121E5C87FD2;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:06:51 +0200
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
Message-Id: <20250731-synaptics-rmi4-v5-1-cd0d87d34afa@ixit.cz>
References: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
In-Reply-To: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=13S3lrILNzt/3asS2mqAeBe39EneqcPGVQTM//ivAKg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9r/7nSHwOgYs+0IMyD3zeC4tC01+w3tfVRxM
 NrrDb/HSI6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIva/wAKCRBgAj/E00kg
 ciQCD/0eMYcEqyE2cQvCK3PXANlBINqBcth8xK9GhDii1u/H175U8IQLL+ciZXbZY3JDGECKvj+
 KwyJGcNicEV8nMAEyzSHlVOgZsdflfFse/32VFPsq3S3TfWizfj0zWRtBKiWP7HICQypqGMVd4H
 5mHWlFVPrA6GmjTNN5EJl4FtCYkpOPn2XKOJwzoFXrhs9mBMbZP7fkNFOiwbnAT4+6GknB6CnD+
 3K6rl5pCxAOn2LW00FmbmVcaifzAU6yBHubV1zOAS+lQo5aadr23nDyu3Hnp9xM6oaUUvW23Cxs
 VwwP4IM6BNNIttjhTYENOyST399HwcPT9TRtD4sk6SCfRE6d/a2GktXWf4WEL5NJlqcDUXqO2FY
 feqNi4BdFaKwaiuCqraIeI1uom8Dtezxqug0MJn0KS54uaBp6t4dBoGA8OtRdSCjxELEjvGuf/n
 YRJi8XGvphFhH9OQGRUTtoueIf6XHEumz9I2ZvPxQrEd0YjdQC7Ddf7GaUHF+o4FPjNjDwCXowp
 mXiPYfcqiqHSslzUD5psjdMm5Ub61Ppa1CTmG4IJMrLziZd8SeYI2Ox7wGj1lKi2tdepPtsCO3v
 ZidbNAFew6bTX3xSN1QIu0uAWQ9DqnvcHr/yFCf0gVur3Jg3+TauQayflVAbPG/SLICELXnqpvY
 bzN1XHjfzdLoZKg==
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
2.50.1




Return-Path: <linux-input+bounces-4944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6069692CF42
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 12:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9193F1C23B78
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 10:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4575D19049C;
	Wed, 10 Jul 2024 10:28:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC419149C
	for <linux-input@vger.kernel.org>; Wed, 10 Jul 2024 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607326; cv=none; b=T7tRbdnfYCRBUFdRLWVYuk3ZQW63ph/ZOo/8fpPUqcxtuNQ8rvxuXwxbIMnlFdc59Pn89rXCdsumAhSrazV7TRDcVjK4RUjsZor1E/qbPaULKgp/c+Gh7K8bSI0y12cwpBj9kzCP9/9Lo5Cdq8SDUeeYUhaufQM/hZXW/DYYn3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607326; c=relaxed/simple;
	bh=jZwBAA681i2M486mbPO5auvpZEWdrPrRNSop60OMZwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=coCdlE8KDDZTu6+r2oqnHdUHc/zmWve9XKZNhJBJE+6GwiVa0jDeBUzwrTg4VvWy2qlpe5NpCVNQYgSGxcbXYzldQ3gv9y6WStQ6WEkazjzpjmZTslA7hakAwWJNe8Wor3qLI3vd8/osEUHUmMd7sGoNnonLb+cCuIME1xhppGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sRUYs-0001Y8-Vq; Wed, 10 Jul 2024 12:28:34 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Jul 2024 12:28:31 +0200
Subject: [PATCH v3 1/2] dt-bindings: input: touchscreen: exc3000: add
 EXC81W32
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-input-exc3000-exc81w32-v3-1-4272183628b4@pengutronix.de>
References: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>
In-Reply-To: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15-dev-13183
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Add compatible for EXC81W32 touchscreen controllers.
They use the same protocol and have the same resolution as EXC80H84.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v3: Mark exc81w32 as compatible with exc80h84.
---
 .../devicetree/bindings/input/touchscreen/eeti,exc3000.yaml  | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 9dc25d30a0a8..1c7ae05a8c15 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -14,10 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - eeti,exc3000
-      - eeti,exc80h60
-      - eeti,exc80h84
+    oneOf:
+      - const: eeti,exc3000
+      - const: eeti,exc80h60
+      - const: eeti,exc80h84
+      - items:
+          - enum:
+              - eeti,exc81w32
+          - const: eeti,exc80h84
   reg:
     const: 0x2a
   interrupts:

-- 
2.39.2



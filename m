Return-Path: <linux-input+bounces-14563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEB9B4FD59
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 15:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5235E52A5
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 13:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AE5352061;
	Tue,  9 Sep 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="4j67O6Nq"
X-Original-To: linux-input@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0BE31CA4B;
	Tue,  9 Sep 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424708; cv=none; b=QZ61FDaoPvNtJmDa+d1UFVAelYQG4iv452vy8BatSErJ9p3TXGrvSaLUjvdIOLAMORBpWYZRgvGdFdJXICu2fksNZh5PuiByaH1m1VYMXU8ciTKI3fM++JoCgOdUlqfFQoF8RaM38+uLIIvzqdE1iBJLhQMqCL5uU09a7rYQMho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424708; c=relaxed/simple;
	bh=cBl3AU1k+NzEf9lUPtx7pk/rcGjQFRSJ5fDmsDRVK70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2+agIDdfrGcUUwdoZle3Tm8t1X5ke+gfQKmBzZJ7yFHiOljGEb+vu7hxwzNOWvUqCx59s3BUE5CiOuI2kk4GnijWLMmXFKuQi7mN2CS7LpUfpyeWA5wkEkF3SWjI42dv/Id4ZsR/Sys6Fc6cQJpyuaxIeQo0EeqZEei3V2uFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=4j67O6Nq; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1757424243; bh=cBl3AU1k+NzEf9lUPtx7pk/rcGjQFRSJ5fDmsDRVK70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=4j67O6Nq86O/ZpZcrFsxdLKePJMelHDGH/zAE6jSGHIba5XIP8yMec560lNNZ5kLA
	 lpbxZT+NRNyYp8ppXK0ocMD+GJuu/mXIhxDdOQ0wSz2rxnr8VJ+jVzJ5bSvjkXSGjY
	 5BH7nEGoAv6a620LUyWD4NSg1XW/12yksVM7xXwY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 09 Sep 2025 15:23:07 +0200
Subject: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
In-Reply-To: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Courtney Cavin <courtney.cavin@sonymobile.com>, 
 Vinod Koul <vkoul@kernel.org>
Cc: Bhushan Shah <bshah@kde.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=cBl3AU1k+NzEf9lUPtx7pk/rcGjQFRSJ5fDmsDRVK70=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBowCpweiIckbskuUc7f7npWuCyS80JUHjvIQhyO
 bdFredz7MOJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaMAqcAAKCRBy2EO4nU3X
 Vn1/EADRz+wg59O5TtMeFXiFb5SvQzYCt96JPA5eakPexScAuNSUHrFNk0K2ZAOHOHdUNfg3rT0
 ov+53QtSdLVsvjAsgC9HSzK2a//y2DXiz1U57euuU4cf3HwH4YE9oY/Lhlf3ypKR/ITsPOVglL2
 lbi247kMBBxP+22JUHBrpK3m+ir7tZu/qs/M54TxfxPPRj+s3EP3VD0gQQa1TX9MxDa6vVVmDGO
 SKkBw/PtCBUYVB7vglyD940GyodC8LV0Fa4kDhFEUmRb3MecTJMJT+pQQj4GVzDwgMvJVauwYA0
 ceKeAFd6I0ZJ0vKRDY4IUtBgfgkCcFefcffD63REsNURVfwy9tSj09OZLbWlQ3+pVAGLNHvu1WG
 KxVOFex3vb08rN7Arero5LXR2sXfbbQr5nKLAsUQcvBofImJTbzinsjY57lzjy0fUr7XCvDXFVp
 Ik8hoZ+SsvwipiltbktYcZ/AikDVJMecYtCjbyIzEOA+T+0+wX3gm6fLPUV1oY4/2NBncRnJYWH
 sZzCBRxV8FrS0xvK6un7+WCVAkhIPUSuNdFkaV2WcLcQ1jW0D2RzUmW2hy/YerpfRkh1LV9OKww
 RG1bIZzWS0Pe44uCqkBWI0FrAf5cXWyeCp3Uas/5nMdFG0ue2Dl97HY9EcYwCvTqnRT7T4VyJcb
 aAMhdZHasDc0oOQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

The 'resin' keys (usually connected to a volume-down button) are
generally not supposed to wake up the device from suspend, so explicitly
document a wakeup-source property to enable this wakeup behavior.

For 'pwrkey' the default stays that pressing the button does wake up the
device from suspend.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/input/qcom,pm8941-pwrkey.yaml          | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
index 62314a5fdce59bb00d1e8b86d6a29a091128aa50..62a08e675ef9511e0ae9ed9fbab5694ab7242c35 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
@@ -10,9 +10,6 @@ maintainers:
   - Courtney Cavin <courtney.cavin@sonymobile.com>
   - Vinod Koul <vkoul@kernel.org>
 
-allOf:
-  - $ref: input.yaml#
-
 properties:
   compatible:
     enum:
@@ -36,6 +33,11 @@ properties:
            pin should be configured for pull up.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  wakeup-source:
+    description: |
+           Button can wake-up the system. Only applicable for 'resin',
+           'pwrkey' always wakes the system by default.
+
   linux,code:
     description: |
            The input key-code associated with the power key.
@@ -43,6 +45,19 @@ properties:
            include/dt-bindings/input/linux-event-codes.h
            When property is omitted KEY_POWER is assumed.
 
+allOf:
+  - $ref: input.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8941-pwrkey
+              - qcom,pmk8350-pwrkey
+    then:
+      properties:
+        wakeup-source: false
+
 required:
   - compatible
   - interrupts

-- 
2.51.0



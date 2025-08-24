Return-Path: <linux-input+bounces-14293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC3B33161
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 18:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8CA84433C5
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 16:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79322D543E;
	Sun, 24 Aug 2025 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="fV+t7S/9"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E72DC32B;
	Sun, 24 Aug 2025 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756051980; cv=none; b=VknLXEmnKwlLBS7oZSjOsZGLOdA/gL7HjLJY2P1j1A1mvyV8PhNeOm1F15kdF4vL4T44wDpYQeNl7fe1Emu/LsU5sOdoAIQLkWCHP4xSuRocwHiUEx3hdatrNY+fz6FaoDpSKvVDTxAShq9NUmt0ASbieJOETyqPmETtT+J1NYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756051980; c=relaxed/simple;
	bh=fSYuDyKb8xNMZude0THX4ysx4fxikhPLoCzcuoLlgVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iHY2ckQXbvEmORFxThdJVmMclvKm8Q7SWYtGQHi5epDKcTjU/WUC49gQJQ450YFiJQTvTPf3BSWLAhYIr9Bn69Hw3RImGvDAj4BVmiz8m278+xO5e+hLdcQn/LcHVltMRHPx8fag6CBKz3JgmVMFRz00l0yYblzq8HRPpaLnd60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=fV+t7S/9; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=L5sbl4zYf+tk8qonwR4TafqKQvKTexvrqntakCO4Zk4=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756051953; v=1; x=1756483953;
 b=fV+t7S/96Ju7zO694dL2bS5VZMdK5G4FnHcwGmUAadaGEpQsMLjbifRSB1tLIYya7kfP+vmN
 9rmEtZ6JtUOe/+WVlUSR0DeuRcKkvbylpMXUg3xLeTNKCCK4WMUewAG73yxBkdm9IAvJaqgnYKi
 fGDVJ2UrKuYMlOC5swQhrrUMEaR6IvljEdRviz5/YNjXRTnyOSBEkGDbGTcnzSm19TQtMed/gUw
 WTCgHkx0kD/BXmeNrwiwcv83ZjTLRPZuqiODsiC/Seo0yBgd+g4QkuRyN6wuUa/11MDfNCeGrKv
 SXyzkyi/zaUDXclQTM9JcQAVsTc/LtsVC/xg2rx90ey6w==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id e0debe80; Sun, 24 Aug 2025 18:12:33 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 24 Aug 2025 18:12:05 +0200
Subject: [PATCH] dt-bindings: input: touchscreen: imagis: add missing
 minItems
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250824-imagis-minitems-v1-1-cea9db55e87f@dujemihanovic.xyz>
X-B4-Tracking: v=1; b=H4sIANQ5q2gC/x3MOwqAMBBF0a3I1AZM/OJWxCLqqK9IlIyIENy7w
 fIU90YSDmChPosU+Ibg8Ak6z2jerd9YYUkmU5i66Eyl4OwGUQ4eFztRlW112bUzN3qiVJ2BVzz
 /cRjf9wMHHAecYQAAAA==
X-Change-ID: 20250824-imagis-minitems-4a71387ce61b
To: Markuss Broks <markuss.broks@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=fSYuDyKb8xNMZude0THX4ysx4fxikhPLoCzcuoLlgVs=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmrLT/8WGQs4ii5s9Rol+VLeSm+1M+m4g38hvnv3TdEL
 WwvbpLqKGVhEONikBVTZMn973iN97PI1u3Zywxg5rAygQxh4OIUgIns38XIsLSlsc87039BKpvh
 rZmMc/7PKTjyaLn425w174yLI3xsShj+Wc89UO8itrM7xvTHql8pKZOO+xQc3tP8wEH1PrdYYr4
 YJwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

The binding currently expects exactly 5 keycodes, which matches the
chip's theoretical maximum but probably not the number of touch keys on
any phone using the IST3032C. Add a minItems value of 2 to prevent
dt-validate complaints.

Also add another example to make sure the linux,keycodes property is
checked.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../bindings/input/touchscreen/imagis,ist3038c.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
index bd8ede3a4ad8939cef97e9b177548a8fc8386df7..0ef79343bf9a223501aff8b6a525b873e777ea20 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
@@ -35,6 +35,7 @@ properties:
 
   linux,keycodes:
     description: Keycodes for the touch keys
+    minItems: 2
     maxItems: 5
 
   touchscreen-size-x: true
@@ -87,5 +88,22 @@ examples:
         touchscreen-inverted-y;
       };
     };
+  - |
+    #include <dt-bindings/input/linux-event-codes.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@50 {
+        compatible = "imagis,ist3032c";
+        reg = <0x50>;
+        interrupt-parent = <&gpio>;
+        interrupts = <72 IRQ_TYPE_EDGE_FALLING>;
+        vdd-supply = <&ldo2>;
+        touchscreen-size-x = <480>;
+        touchscreen-size-y = <800>;
+        linux,keycodes = <KEY_APPSELECT>, <KEY_BACK>;
+      };
+    };
 
 ...

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250824-imagis-minitems-4a71387ce61b

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>



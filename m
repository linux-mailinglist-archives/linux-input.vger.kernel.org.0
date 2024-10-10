Return-Path: <linux-input+bounces-7242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1AF998824
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 15:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5D50B24602
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 13:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41451CB33F;
	Thu, 10 Oct 2024 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="iSf5JWmj";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="tvqY2h2H"
X-Original-To: linux-input@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5C1CB303;
	Thu, 10 Oct 2024 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567974; cv=pass; b=qGGXZVxEH9rXuGhle3L9FsvUs1bP53HNHP69eyxowTCgBRK7VEd2nYilxiaEasECx4E5k7yM9PY1sVkv4u1/8TZuAlCo5m5VXzyip3QR7iUFP8bbaTchruS7MCBVzjlRz10g4MlV3SJaWa2ner2+CQQeG2Aex8VQ+fSLjMQB30s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567974; c=relaxed/simple;
	bh=cYWkU9NYtqgEaIgQbt4r2vS+OUrjo3JQ7fR83sxysOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXLw7nzwkWeiMHdtX5xwEckOpelPO5z8OVDmm37D4wbKgjlp4BJfJ/R07qGzxTNU8+rpy2afcu1nvMBY2j2iNCJvmcYJOl4IsTGuvzfGNgHBBI7JXFz9AJAIWiKohHo9zI09IFGU91TvGt/lsnrtnRTpwH2ksTo5Gv54a4txP1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=iSf5JWmj; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=tvqY2h2H; arc=pass smtp.client-ip=85.215.255.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1728567944; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CmOuf42eInCm02NVQJxsuySqehQMgsyFv8bk/maC9XB346mq/PzT+aqp3aaZ0RsV+u
    5MNdh4IBtAUWjBvB5X48HvupRHiszadKgOcZkYZ3DxKwseZeyHrWg5xoB/fQZ6wEtCFx
    IFlQUwhdb98HO8qGEm4eqQluCEPF3aEPnAW1shXpLstzb6rDFAAsfAFQ6piYWEOvrSE9
    fqbbaYG4zmHGPivAjxVqRQZyhxXP5YLlyh683K0BLeinxSqK5539Bj1x8AUZ7I2rxEdS
    9v3b0712lXrqW2ydnFcSjxP0PRC+PSq9mqIUqr9JGG7s5oHQyrli+iO2IYpmZvHPoyvD
    Ns9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=qVNi21WdPjW+gp6D0fND0M3qlxR+JxgNBpjFKNogPRI=;
    b=MQIh5oHkqrJZ254Nn8bNaZJ0pLAj4MsCe63aA8x+2rIuJy8apuWZC7CHYpLzwoULcz
    1LxfjAd7OfvsDZzpCuYu+L7dmwX8FijlPSnqtGuRsBpPRXQ4SGT9nHdhzNwJJVZjkU52
    wmV55q4ngWgUL3qrkggCOYsrbMt+nzdiPsV2xw1LYQWwJny2j7Jj5qzv1PYSj+RHso1y
    bIltPiT7CRb3t6gSGT6/HP8TdfopwSRBzSbaI+yI4gbyXCkxS43pCJQF9aQWJOE7IQV5
    iIPlGv6WBmzmFh2pdZxmUPV6qHo1tn7G0HUHASdAI8jq6j1fO+bLLjIycfnDGXouRGJB
    4o0Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=qVNi21WdPjW+gp6D0fND0M3qlxR+JxgNBpjFKNogPRI=;
    b=iSf5JWmjYXxaMeqjKJ6uBFDvpPtKVhV3r5nRBtqYqI6OscuXywdONmL4CNaa3DTVZR
    OzcgTsUItmc3y4LUA6njZtaC7zMSXbwKbEwBWt2wQbEvdb+jQo3CDkjE4AfhnknhtoyM
    5fSpwTDOLoPXmHpL8Nl/6aBbfS2ZWrVmMwxefVFIhEDlRvSCD40U0BppdJsKfL6Gr73T
    /NWMYhsvsW0139eOdf0Rc+zKhIAJ5Gb4KSzlqYZhjjuBUnXvyR1u0kAXNwYxHrTxrcfr
    VDM+igOD8KIsyPqcWWUuuyxndjs4szlZzoSeh8tCeOcEu6seLE2B08PIZqfnekwFQYTo
    uViA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=qVNi21WdPjW+gp6D0fND0M3qlxR+JxgNBpjFKNogPRI=;
    b=tvqY2h2HxTYKsn0VKBDpoRmOpgEPlKMB8uGcDDVQJGSPofk34yxiwNPy07dI0BviQi
    qYEMKoxS2C95IpqFVnCg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXSOYQGpRtZhZnncGoRCMF/3aEZ/InzRrReCnzIuT5eMHSlE941iZFlw=="
Received: from [127.0.0.2]
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id R0d46809ADjixFa
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 10 Oct 2024 15:45:44 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Thu, 10 Oct 2024 15:45:32 +0200
Subject: [PATCH v4 1/2] dt-bindings: input: touchscreen: document Himax
 HX852x(ES)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-hx852x-v4-1-7e6a20177938@gerhold.net>
References: <20241010-hx852x-v4-0-7e6a20177938@gerhold.net>
In-Reply-To: <20241010-hx852x-v4-0-7e6a20177938@gerhold.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Jonathan Albrieux <jonathan.albrieux@gmail.com>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Himax HX852x(ES) is a touch panel controller with optional support
for capacitive touch keys.

Unfortunately, the model naming is quite unclear and confusing. There
seems to be a distinction between models (e.g. HX8526) and the "series"
suffix (e.g. -A, -B, -C, -D, -E, -ES). But this doesn't seem to be
applied very consistently because e.g. HX8527-E(44) actually seems to
belong to the -ES series.

The compatible consists of the actual part number followed by the
"series" as fallback compatible. Typically only the latter will be
interesting for drivers as there is no relevant difference on the
driver side.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/input/touchscreen/himax,hx852es.yaml  | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml
new file mode 100644
index 000000000000..40a60880111d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/himax,hx852es.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX852x(ES) touch panel controller
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - himax,hx8525e
+          - himax,hx8526e
+          - himax,hx8527e
+      - const: himax,hx852es
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Touch Screen Interrupt (TSIX), active low
+
+  reset-gpios:
+    maxItems: 1
+    description: External Reset (XRES), active low
+
+  vcca-supply:
+    description: Analog power supply (VCCA)
+
+  vccd-supply:
+    description: Digital power supply (VCCD)
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+  linux,keycodes:
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@48 {
+        compatible = "himax,hx8527e", "himax,hx852es";
+        reg = <0x48>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+        vcca-supply = <&reg_ts_vcca>;
+        vccd-supply = <&pm8916_l6>;
+        linux,keycodes = <KEY_BACK KEY_HOMEPAGE KEY_APPSELECT>;
+      };
+    };
+
+...

-- 
2.44.1



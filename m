Return-Path: <linux-input+bounces-17158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A1D38A7D
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 01:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E9F83046428
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 00:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D55E1FC7;
	Sat, 17 Jan 2026 00:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GjCFWwPs";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NZuy0iac"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E7500944;
	Sat, 17 Jan 2026 00:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608748; cv=none; b=hON6TMzgqfDtyjA/5VZpBD78XVWOLxPINWnUjNDpQQTDakf8hFdgbWw+kguSD6DvCXDtDOWndvIFNSeaRVVYOi+NV86SYqW+qInUfiEMemY65yTuoZpQazpAgKEqQF7pndR124fdI+lL0UiZVZfwK/aqVqOEdAHwXONAM3yUFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608748; c=relaxed/simple;
	bh=uXRI71RDanbYJSatk6W/INpAOCFvmQYHNTYqFFll/LI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZLl1fBue4nesTw//EH9iTLQezzbRsf4ogXS0yLWS4aoPV2yJ8DHZ+6Am4Epdn7m9K7GYk3TVQ7K+r02zrE7yRaKdo0JEw7RpZ8PC2nw4nQD2zm5qfRgRLza4I4Z9TbYrWuHKPZTnNuaFNwPRDp+A4zEsOg0I0T3GWV5vRNTB59s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GjCFWwPs; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NZuy0iac; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dtHGb1NKMz9snh;
	Sat, 17 Jan 2026 01:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P6sIYtfJFsawH6LVKMi+yRWY8Zphn3FYUqIVFe+huq4=;
	b=GjCFWwPs9id4b9uTOFCfM6lbam7dWoQY3ToL+auHihnOD0HaFtP8Q2LYdh/SHV8umGRy4r
	ByPlFR8twGaR0+Jq7G8BQlFJr5ouZYsq3pFKDfYFsswtakA3Lrpge08x1v0LxjpyWU3Y/4
	zULgi+skBA2Wu3UoOFySwAaQ9fL3MXa8PKdgR45MkYk9clgDG109wiXv65Ns8osd/DVyi8
	cwUIbxkpTBx2GmQi4IV2gGV4+9DnqnXT0nH5fdNqpIrgiPfqYr/BPknIK16TX6diiswU8s
	fYU2FDK+cM4BlIPTO6GzCgD0yb/umgOOjNpV085GoQcCDuNegFp/ikDyEIKy1w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=NZuy0iac;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P6sIYtfJFsawH6LVKMi+yRWY8Zphn3FYUqIVFe+huq4=;
	b=NZuy0iac7Nq8VAs4aLKpnBRezdXfeyHvyKPNJRxihzz/7zc3POMcmN2BY6Py+WEbOqlULo
	8ZoGe70roEsyH6yY2A89krbFWZhcaSacfFG1agme+Vn5ATxY2iQ6hBHc7QGdMtCKZHJjp1
	BT0w88sQZTpDa3jdXqMsSfF9YjD8Up/SPlKCYftiCUGHTZUnNDc8QNsdHB4aPlYuhVYcIh
	34qNP2Del4mte8zRYmAovHqMT5nWdqAko5SAV8K+rTY6LlXPKzIxUXWIYoVVfCF5xGUTxS
	Yt7eElmD5hDHG7ie6CGuXw0XYFsIWmWCFR7wguJ6Uv5PsgBDOQjwG6LIIIsZjw==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: touchscreen: trivial-touch: Drop 'interrupts' requirement for old Ilitek
Date: Sat, 17 Jan 2026 01:12:02 +0100
Message-ID: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7fp8kkh8okyjszzob9yftttgugbpqcro
X-MBO-RS-ID: b3af310f0ffdf0ee2e9
X-Rspamd-Queue-Id: 4dtHGb1NKMz9snh

The old Ilitek touch controllers V3 and V6 can operate without
interrupt line, in polling mode. Drop the 'interrupts' property
requirement for those four controllers. To avoid overloading the
trivial-touch, fork the old Ilitek V3/V6 touch controller binding
into separate document.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Job Noorman <job@noorman.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Fork the Ilitek V3/V6 bindings into separate document
V3: Add RB from Frank
V4: No change
---
 .../input/touchscreen/ilitek,ili210x.yaml     | 51 +++++++++++++++++++
 .../input/touchscreen/trivial-touch.yaml      |  4 --
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
new file mode 100644
index 0000000000000..1d02aaba64f97
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ilitek,ili210x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI21xx/ILI251x V3/V6 touch screen controller with i2c interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+properties:
+  compatible:
+    enum:
+      - ilitek,ili210x
+      - ilitek,ili2117
+      - ilitek,ili2120
+      - ilitek,ili251x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source: true
+
+allOf:
+  - $ref: touchscreen.yaml
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@41 {
+            compatible = "ilitek,ili2120";
+            reg = <0x41>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index fa27c6754ca4e..6441d21223caf 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -23,9 +23,6 @@ properties:
       # Hynitron cstxxx series touchscreen controller
       - hynitron,cst340
       # Ilitek I2C Touchscreen Controller
-      - ilitek,ili210x
-      - ilitek,ili2117
-      - ilitek,ili2120
       - ilitek,ili2130
       - ilitek,ili2131
       - ilitek,ili2132
@@ -33,7 +30,6 @@ properties:
       - ilitek,ili2322
       - ilitek,ili2323
       - ilitek,ili2326
-      - ilitek,ili251x
       - ilitek,ili2520
       - ilitek,ili2521
       # MAXI MAX11801 Resistive touch screen controller with i2c interface
-- 
2.51.0



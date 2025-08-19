Return-Path: <linux-input+bounces-14165-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15964B2CF5B
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 00:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16167219F9
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 22:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DF131DD88;
	Tue, 19 Aug 2025 22:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqtGIAX8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0376C30DD09;
	Tue, 19 Aug 2025 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755642533; cv=none; b=InomGPfB7E/Z+cMzB3IkSPuC2d06YkCw8VYjPR2X/CgLxogyP8Mxc6EBfKd0ncWQ+oJtpIjEzAMWU1ArhT2zOfCJLrggMXlP0P6TtDfPuoaI4TMXEVD6xeT0+cp+BnE9GyBJL0T7qgaxC1za7zvKPPvDqG+j3/3BlA/H6JlWnig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755642533; c=relaxed/simple;
	bh=0+8XVoBAD/tPExRqsH1rlyeLVpU7k7+Wq25d9Q2DBX0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VHfljjUsENPUIBJkjxiWM7UI9aJg9++N6E4TF7arW7MC6nhWxeNnWVyXSWv8DxDg/jQ95gkb4NTkEJTl/pSyg09viN6RJu3acLUP8Jw9xZdKkgx3KRAvL2lAR+H6p7G/tWNqm4H+s1ZHVsyr1QyK9WJRvZkQ4IrCzVXJuYgFJ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqtGIAX8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso30537085e9.1;
        Tue, 19 Aug 2025 15:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755642530; x=1756247330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxRrcohdrp6hc8dJuUXjhJQdfVF4Q8UIJXDooLC5mqs=;
        b=AqtGIAX8JnVng8Y4yvZxVhuM6ZWijpWoPDpZRtp3VfUCvjv/VL8zNj2wVcP0LGNHcX
         iwwazT63j8jtwCYs4BkLi59LEAEwt5ZRlpNxPnCV8oXl4vS568sdTXbiWQ5WXBpa67gS
         2HjkJMCLfKLLzelu8uJb4Prl1yfCh+Yh2kTWzUWseCvdlq3Ou4df7cv06kBAD7+4mm//
         j8/WRaQd5KI9hr5y5Wr0E2VbUwAP2oHMbTFGS/f+hvgjwTQPrLi4pzQpMu8SnARFZ8ZX
         JKiBj1bC6hPHvP/5ETw3Sv1xFaCJyBKMh/bCT+X1IaoDz0Xh+weN65vGQ8JMhsIvduxQ
         /MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755642530; x=1756247330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxRrcohdrp6hc8dJuUXjhJQdfVF4Q8UIJXDooLC5mqs=;
        b=amO0fD8cgLuuPhOvLGudor4pTMiV/uWNH/wV/ZurOigZRUKXrOiw6VCJy575mrytLQ
         hqba+Rtj1GEoFzE7oDPwdUmj8MpnEd1WzW8sYSTPTSIKOlK8mqSGebwJ/YK8j4JQZKFi
         60i40JYJiA+3lv2y4Dl5TlNDVWImOuYq/5Lud7koKciwlGqeeTxqXLvJxYRuBjWXGjOv
         QvV7it1f2hE6WU/O5bzRLUUEWvvRrgbSQjFKa7KKrNp9kBSNLvf2QVLxOFDSl95Bh+rg
         lNOO4Yt1nKMYfFCLA2Q3g9Mi9Sg3mKgkNY7BoueApU5bv9U5c7WI/DGOkTDYGUOFAa7X
         h0aw==
X-Forwarded-Encrypted: i=1; AJvYcCUXo3KD21KIrHalx7ufl19e3ZpiKpkp7SRe/A+XP8NPrHIaMKDBPcmK6+9I4VU6rz0jWrwcEBue6bXO@vger.kernel.org, AJvYcCVgTBG/7pTvspkAH2MNFltO6Kev9VvYR5bVVh4bqkLrnFip7xrqlg++QRypZR0rcx6DA23HvhEUB3ZZIxfe@vger.kernel.org, AJvYcCXujx3hlaWBptMmDEdxlKW2aNp77yhJ2WmSUsS5LjlRl589EOSoTVDx0ISwVIiZfdvizRnmJR95t01xhCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV2xY9QiFXhxbc7c5J+0iQPPWdSgT6F3Ey3pJgx1zaxOrF3W3V
	KjgsHBSBnc7+F0V/gL0IyWwNA2cuqS1p1WKsLq2ef0oQ8Wmf92G3BjQ=
X-Gm-Gg: ASbGncsMgDep/7rLsbJbFGhxK1SjZ2Wglh4r0qNe1DZrABsDgQjFTuZhLdFl5SDXPzp
	cJzGopYsbhgGOOimLckpCtDqkf//1zwwSYqeoisKB13WLrGdCVwReBytZJDZ2hnQoJyOnYWGaTd
	lQH8WnRwWQWENs6nTd0Kvpso5yyVrmEih9CR8EG/NRTZRaGHoNw1y8hWF14bGHcRNjkQt/78gFL
	WrYGrluQN+++EPm/jwp1LLn4xsC9CFfxXhPNzu5x5N1NSX+eR40DQJ0mBrFp7dh0A4DkZB0Fjya
	DZZbtzjooLn9cFUUtsbrcioFoXUPP4vwpOxG9oBBtj4HjEU/5XsP8jYPgUmzGf5gUIcqPitLTNi
	SgBlNcX6Ni3/kFFYW+O2q7dCl+xB8smD76DhVPjOfNqFxoOg=
X-Google-Smtp-Source: AGHT+IG54zislyWvKb2CD8selDQMJvVHtYy8eN/d91/ywTICdUU8HuG4oNZmw4oxm8cQlV0WtiWfjw==
X-Received: by 2002:a05:600c:524e:b0:45b:43cc:e557 with SMTP id 5b1f17b1804b1-45b47a1a101mr3752005e9.34.1755642530044;
        Tue, 19 Aug 2025 15:28:50 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:216f:2f7a:74c6:177a:3b99:868c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c30dc1sm4394875e9.6.2025.08.19.15.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:28:48 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	peter.ujfalusi@gmail.com,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v4] input: dt-bindings: ti,twl4030-keypad: convert to DT schema
Date: Wed, 20 Aug 2025 00:28:23 +0200
Message-Id: <20250819222823.157943-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the legacy TXT binding for the TWL4030 keypad module
to the modern YAML DT schema format. This adds formal validation
and improves documentation by inheriting from the matrix-keymap schema.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
Changes in v4:
 - No changes.
 - This patch is split from larger series per maintainer feedback.
 - v3 link:
    https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/

Changes in v3:
 - Made 'linux,keymap' a required property as suggested by the reviewer.

Changes in v2:
 - Simplified the description field by removing redundant '|'
 as it does not affect formatting in this context.
---
 .../bindings/input/ti,twl4030-keypad.yaml     | 59 +++++++++++++++++++
 .../bindings/input/twl4030-keypad.txt         | 27 ---------
 2 files changed, 59 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,twl4030-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/twl4030-keypad.txt

diff --git a/Documentation/devicetree/bindings/input/ti,twl4030-keypad.yaml b/Documentation/devicetree/bindings/input/ti,twl4030-keypad.yaml
new file mode 100644
index 000000000..c69aa7f5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,twl4030-keypad.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TWL4030-family Keypad Controller
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@gmail.com>
+
+description:
+  TWL4030's Keypad controller is used to interface a SoC with a matrix-type
+  keypad device. The keypad controller supports multiple row and column lines.
+  A key can be placed at each intersection of a unique row and a unique column.
+  The keypad controller can sense a key-press and key-release and report the
+  event using a interrupt to the cpu.
+
+allOf:
+  - $ref: matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: ti,twl4030-keypad
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - keypad,num-rows
+  - keypad,num-columns
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+
+    keypad {
+        compatible = "ti,twl4030-keypad";
+        interrupts = <1>;
+        keypad,num-rows = <8>;
+        keypad,num-columns = <8>;
+        linux,keymap = <
+            /* row 0 */
+            MATRIX_KEY(0, 0, KEY_1)
+            MATRIX_KEY(0, 1, KEY_2)
+            MATRIX_KEY(0, 2, KEY_3)
+
+            /* ...and so on for a full 8x8 matrix... */
+
+            /* row 7 */
+            MATRIX_KEY(7, 6, KEY_Y)
+            MATRIX_KEY(7, 7, KEY_Z)
+        >;
+    };
diff --git a/Documentation/devicetree/bindings/input/twl4030-keypad.txt b/Documentation/devicetree/bindings/input/twl4030-keypad.txt
deleted file mode 100644
index e4be2f76a..000000000
--- a/Documentation/devicetree/bindings/input/twl4030-keypad.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* TWL4030's Keypad Controller device tree bindings
-
-TWL4030's Keypad controller is used to interface a SoC with a matrix-type
-keypad device. The keypad controller supports multiple row and column lines.
-A key can be placed at each intersection of a unique row and a unique column.
-The keypad controller can sense a key-press and key-release and report the
-event using a interrupt to the cpu.
-
-This binding is based on the matrix-keymap binding with the following
-changes:
-
- * keypad,num-rows and keypad,num-columns are required.
-
-Required SoC Specific Properties:
-- compatible: should be one of the following
-   - "ti,twl4030-keypad": For controllers compatible with twl4030 keypad
-      controller.
-- interrupt: should be one of the following
-   - <1>: For controllers compatible with twl4030 keypad controller.
-
-Example:
-	twl_keypad: keypad {
-		compatible = "ti,twl4030-keypad";
-		interrupts = <1>;
-		keypad,num-rows = <8>;
-		keypad,num-columns = <8>;
-	};
-- 
2.39.5



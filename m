Return-Path: <linux-input+bounces-13709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB2B1491F
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 09:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 548DA3A3D44
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 07:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B421259CAB;
	Tue, 29 Jul 2025 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="WAIAAQJ0"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23F714A82;
	Tue, 29 Jul 2025 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753774183; cv=none; b=oJeC920sgCc12IEgflE8waZfThuUXYJyXYPrKB1fqECqJLXijhyWR7aUUUcH4B/jbaWLOvqVgGSQr4OKCuR8UZ8CUAnHPt00yM/SUqKiBvVDd1Mhe3vQ8yx0jq/OUXWAcZI9v95CDTBRAnRBlmOsXHsW3MNOieHecPUzriSnbHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753774183; c=relaxed/simple;
	bh=V93yTx7ehcSycXqNR++62/oehZaNuMjW2X/UEBdphjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZVrIBLNrTaf8hJF6a2yxM/KFnHZQ3fHH60JnX8LsoxYGLdNrSQdP55d0PNrSIqAxNmORLf49tZ1nEatgnCYXj/CRIkQcYEKEpkU7/iRT6l9plRDd34yoel7x/RoJts1/LbzXffk34LVw6a56PWoqLfCj9tnWr3oqR0w9JtIk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=WAIAAQJ0; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=/nKdXuM6iZRQlGcE9DAj9veDYXnOBOk9an4cA5HBMmI=;
	b=WAIAAQJ0T7VIxX/HKAFfXYcCxSBS4KUBR9YuGzYaTUfeYP448kGSpjYPuOIfMJ
	mJgefigEEL3OQOPoH8uOpmObFwSQqokYzD5BohnHYgowHuznCtcHNOW+R2ai7saC
	SCVVYGRH3UeYlqOuPLe1FXKPybRyAPpVrsGSn4Zhv7ozU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgCnjwClbYhou7D5Ag--.23794S5;
	Tue, 29 Jul 2025 14:43:54 +0800 (CST)
From: marlonwu@126.com
To: robh@kernel.org,
	dmitry.torokhov@gmail.com,
	krzk+dt@kernel.org
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	marlonwu@126.com,
	MenglongWoo@aliyun.com
Subject: [PATCH 1/2] dt-bindings vnc virtual input
Date: Tue, 29 Jul 2025 14:43:45 +0800
Message-Id: <20250729064346.22834-2-marlonwu@126.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250729064346.22834-1-marlonwu@126.com>
References: <20250729064346.22834-1-marlonwu@126.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCkvCgCnjwClbYhou7D5Ag--.23794S5
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7CD7DUUUU
X-CM-SenderInfo: xpduz0xqzxqiyswou0bp/1tbi7wmZDWiIbKoUogAAsi

From: Menglong Wu <marlonwu@126.com>

Add documentation for virtual GPIO keys to enable full ANSI keyboard
emulation via VNC on embedded devices without physical keyboards.

- vnc-virtual-input.txt: Usage scenario and implementation details
- vnc-virtual-input.yaml: Formal DT binding specification
- MAINTAINERS: Add entry for VNC virtual input support

The solution registers virtual GPIOs (starting from 400) to avoid conflicts
with physical GPIOs while supporting standard Linux input codes.

Signed-off-by: Menglong Wu <marlonwu@126.com>
---
 .../bindings/input/vnc-virtual-input.txt      | 153 ++++++++++++++++++
 .../bindings/input/vnc-virtual-input.yaml     |  86 ++++++++++
 MAINTAINERS                                   |   7 +
 3 files changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/vnc-virtual-input.txt
 create mode 100644 Documentation/devicetree/bindings/input/vnc-virtual-input.yaml

diff --git a/Documentation/devicetree/bindings/input/vnc-virtual-input.txt b/Documentation/devicetree/bindings/input/vnc-virtual-input.txt
new file mode 100644
index 000000000000..77d12308c553
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/vnc-virtual-input.txt
@@ -0,0 +1,153 @@
+Register virtual GPIO keys for VNC
+==========================
+
+# Purpose
+
+To emulate a full ANSI keyboard on embedded devices without physical
+keyboards.The server responds to key events via x11vnc.
+This resolves the limitation where embedded systems only register a few
+GPIO keys, making them unable to process full keyboard inputs.
+
+documented in Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
+
+# Scenario
+
+- /dev/input/event1: Physical GPIO buttons
+
+- /dev/input/event2: Physical touchscreen
+
+Assume my-pcb.dts defines two GPIO-based hardware keys (‘A’ and ‘B’).
+When the VNC server x11vnc is started, a remote PC connects via a VNC
+client and attempts to send key inputs.
+Since the Linux kernel only recognizes two keys, the UI on the embedded
+device only responds to ‘A’ and ‘B’.
+
+Start x11vnc server:
+
+```
+    x11vnc -noipv6 -rawfb /dev/fb0 -forever -clip 640x480+0+0 \
+      -pipeinput UINPUT:touch,tslib_cal=/etc/pointercal,\
+      direct_key=/dev/input/event1,\
+      direct_abs=/dev/input/event2
+```
+
+Monitor key events:
+
+```
+    hexdump /dev/input/event1
+```
+
+Check registered virtual GPIOs:
+
+```
+    mount -t debugfs none /sys/kernel/debug/
+    cat /sys/kernel/debug/gpio
+
+    gpiochip5: GPIOs 400-503, parent: platform/gpio_mockup_hw, gpio-mockup-A:
+    gpio-400 (                    |vk_key_0            ) in  lo
+    gpio-401 (                    |vk_key_1            ) in  lo
+```
+
+Original my-pcb.dts:
+
+
+```
+    gpio_keys {
+        compatible = "gpio-keys";
+        pinctrl-0 = <&pinctrl_gpio_keys>;
+
+        key-a {
+            label = "btn-key-a";
+            gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            linux,code = <KEY_A>;
+        };
+        key-b {
+            label = "btn-key-b";
+            gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+            linux,code = <KEY_A>;
+        };
+    };
+```
+
+
+# Solution
+
+Modify my-pcb.dts to support a virtual ANSI keyboard:
+
+```
+    #include "vnc-virtual-input.dtsi"
+
+    // Originally, the DTS relied on physical GPIO keys
+    gpio_keys {
+        // Disable the original physical key node
+        status = "disable";
+    };
+
+    // The virtual GPIO DTS node now integrates physical GPIO
+    vnc_key {
+        compatible = "gpio-keys";
+        pinctrl-0 = <&pinctrl_gpio_keys>;
+
+        key-a {
+            label = "btn-key-a";
+            gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            linux,code = <KEY_A>;
+        };
+        key-b {
+            label = "btn-key-b";
+            gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+            linux,code = <KEY_A>;
+        };
+    }
+```
+
+# Explanation
+
+A virtual GPIO driver gpio_mockup_hw is registered, providing 104 GPIOs,
+starting from number 400.
+
+The starting number (400) avoids conflicts with physical GPIOs on
+commercialSoCs, which typically do not exceed 400. Most SoC vendors also
+start GPIO numbering from 0 in their drivers.
+
+The gpio_key_mockup node defines 100 ANSI standard keyboard keys.
+
+Key codes (KEY_xx) follow the definitions in
+include/uapi/linux/input-event-codes.h.
+
+
+
+ANSI Keyboard Layout (Symbolic Representation):
+
+```
+L FFFFFFFFFFFFFFF   MMM
+L NNNNNNNNNNNN  R   CCC   PPPP
+LL  AAAAAAAAA RRR   CCC   PPPP
+LLL  AAAAAAA RRRR         PPPP
+LLL   AAAAA RRRRR    C    PPPP
+LLLL  LLLLL RRRRR   CCC   PPPP
+```
+
+
+Key Layout Categories
+
+L: Left-side keys (ESC, TAB, CAPS LOCK, etc.)
+F: Function keys (F1–F12)
+N: Number row (1–0)
+A: Alphabet keys (A–Z)
+R: Right-side keys (BACKSPACE, [, ], , ENTER, etc.)
+M: Miscellaneous (Print Screen, Scroll Lock, Pause/Break)
+C: Cursor controls (Insert, Home, Arrow keys, etc.)
+P: Numpad keys (0–9, -, +, etc.)
+
+
+Example from vnc-virtual-input.dtsi:
+
+```
+    /* Left of a-z */
+    vk_78 {
+        label = "vk_key_78";
+        gpios = <&gpio_mockup_hw 78 GPIO_ACTIVE_HIGH>;
+        linux,code = <KEY_ESC>;
+    };
+```
diff --git a/Documentation/devicetree/bindings/input/vnc-virtual-input.yaml b/Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
new file mode 100644
index 000000000000..8b5414cb2bea
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VNC Virtual GPIO Keys
+
+maintainers:
+  - Menglong Wu <marlonwu@126.com>
+
+description: |
+  This binding describes a virtual GPIO key input node for VNC remote
+  input.
+  It is based on the standard gpio-keys binding.
+
+select: false
+
+allOf:
+  - $ref: gpio-keys.yaml#
+
+properties:
+  compatible:
+    const: gpio-keys
+
+  status:
+    enum:
+      - okay
+      - disabled
+
+patternProperties:
+  "^key(-)?[0-9a-zA-Z_-]+$":
+    type: object
+    properties:
+      label:
+        description: Descriptive name of the button
+        $ref: /schemas/types.yaml#/definitions/string
+
+      gpios:
+        maxItems: 1
+
+      linux,code:
+        description: Linux input event code
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      debounce-interval:
+        description: Debounce time in milliseconds
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      gpio-key,wakeup:
+        description: Enables wakeup function from suspend
+        type: boolean
+
+    required:
+      - label
+      - gpios
+      - linux,code
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    test {
+      vnc_key: vnc_key {
+          compatible = "gpio-keys";
+
+          key-a {
+            label = "btn-key-a";
+            gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            linux,code = <KEY_A>;
+          };
+          key-b {
+            label = "btn-key-b";
+            gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+            linux,code = <KEY_A>;
+          };
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c0b444e5fd5a..658ef6619542 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27476,6 +27476,13 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 F:	sound/pci/hda/patch_senarytech.c
 
+VNC VIRTUAL INPUT SUPPORT
+M:	Menglong Wu <marlonwu@126.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/vnc-virtual-input.txt
+F:	Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
+
 THE REST
 M:	Linus Torvalds <torvalds@linux-foundation.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.39.5



Return-Path: <linux-input+bounces-6593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 299FE97B82F
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 08:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72A6C1F23213
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 06:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E6516FF45;
	Wed, 18 Sep 2024 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ebTRkWEy"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678C3C3C;
	Wed, 18 Sep 2024 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726642217; cv=none; b=QIr+6YfXUlmSVDdBp+yhrJtoa3M/j4EgblQzLPAzzgceU1Yb7RstN4BhDAA0Oye2SXKDMi//uqDoFmXbStvGt0zc+kGGoqXL6OIF+Cg2ivcPLGxl6KnGFCoxILRUspo9d4sgE3nUPyArXe/FIO2LXrjRzmkCSUYlVQ320CbSnKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726642217; c=relaxed/simple;
	bh=uJLJoAxqz9qODDVRgvg01QbrqS3+NPO+lpzO6EpYrig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MH65sgxbUbOPszMWuXBThZmnE72k7B21MyD8A7BcLWA8icbYPAdFIOZuf+zFaNGbu2DgpumzOHfkUMH/lxtDQhGgZjawmfTXiffOI9FM7efqYsVvPHORY+vZkouHknm6p6De6AdQ5XJQ6sjUdPyyo1zT0OqaLOKxbnh/yLK4oFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ebTRkWEy; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3e74afac758a11ef8b96093e013ec31c-20240918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l0ZPF71fUW66f67vqpXVHPHs3zlILlU8sjmqZ8BTJ1g=;
	b=ebTRkWEysyviJl7rTWHtHVgAwgA64E/0ePhhpKe0xqb88O4k3+/Tdae5dReVY7+sx12QzwApYmaWnM0T0teUfB9wFT4xUSQ6T6h9DqFkvc2DiAZTdCWVLnEWHNLNDYJrPB4UH7TiQwF/wsfW0dKdv47nK8LGOwHZvVwED9WDkt4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a41d9ff3-6fe5-4695-b587-fc2748acf556,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:5ebc1fc0-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3e74afac758a11ef8b96093e013ec31c-20240918
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 719988529; Wed, 18 Sep 2024 14:50:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Sep 2024 14:50:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Sep 2024 14:50:06 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	"Lee Jones" <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Chen Zhong
	<chen.zhong@mediatek.com>, <linux-input@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v6 2/2] dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format
Date: Wed, 18 Sep 2024 14:49:55 +0800
Message-ID: <20240918064955.6518-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240918064955.6518-1-macpaul.lin@mediatek.com>
References: <20240918064955.6518-1-macpaul.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.822900-8.000000
X-TMASE-MatchedRID: /e+szn4US2FIGJIfj527f1VN8laWo90MoBevD9xxU5ktxWNuz6R5rHik
	i0zUgl6qqoVr5ivdQnVRoKA1TMJV00MpVZZsZyZG85L5JHGOAXAK3n1SHen81VwpnAAvAwazZ10
	wKXUWXnJ8tFOE8rNidyUrPOGI7WM+uyXwa/V5eQrMZk86HxFjjk2HUsDJB8NxoVKHbnELtOkodB
	KOuzGgzZQFiLMWyPKxr15/GZU7YAxf2oN5IGbAjnF+T3jMctr+KhNpTcvbdUIR34ro7k23nUgCl
	CIX2gewXP1H+XULAzzAGMBwYFOuhaOz+j0QSEPd4aieqCznPEEF15s6prCIu/gnJH5vm2+g+r6f
	KqtIz3Z8aRX5Sbm/uBG7cCJtaI6lCDQ7fusn9Vymput5KKcJ03nL427v8Q46TUobVis5Bb8jL1N
	CjhbnQcOH6aH1ycxJdY1jbXK1GBJWj3HFS14pK/zu9Lw9C7fAVo4lwLFUditNjP34VuMkuh/pZ3
	bffunhpEgU1whKQMXkQHSm+Hqcul+1yB6ph7kzuIwLnB3Aqp3+yhO1yCoLfGmj1qXcLu1iXvbV/
	VnUv0rIW7wgrBu8QUP117fOHdLfE0atn7xLb234Wr1WT+bU2lp4YXccYb4AENmkmj0XdvrJ/j+W
	z8BR/V/xXV0HRcJQ+Af7//+eQOTvUrWD9LZnt4dlc1JaOB1Tsf4f4CxxueSpqdpbu0w7OkUeRhG
	Y4VMdB6tLq5RmHAEES/SMmbpv9jkvrbtuQjcdJsxvR/kPS6qcXyt+Ve6JFRd2FPQEB0XO+FKg2E
	2aLCHi8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSk+Mqg+CyrtwA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.822900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0B8B09C76EFA68752ABAFE28D043F954F64535BD1383F3154F5C5B10ABFF67B62000:8
X-MTK: N

Convert the mfd: mediatek: mt6397 binding to DT schema format.

MT6323, MT6358, and MT6397 are PMIC devices with multiple function
subdevices. They share a common PMIC design but have variations in
subdevice combinations.

Key updates in this conversion:

1. RTC:
   - Convert rtc-mt6397.txt and merge into parent MT6397 PMIC DT schema.

2. Regulators:
   - Align to generic name "regulators".
   - Update references from .txt to .yaml for mt6323, mt6358, and mt6397
     regulators.
   - Simplify regulator name labels in device tree examples.

3. Audio Codec:
   - Convert sound/mt6358.txt and merge into parent MT6397 PMIC DT schema.
   - Align to generic name "audio-codec" for codec and sound subdevices.
   - Add "mediatek,dmic-mode" and "Avdd-supply" properties.

4. Clocks:
   - Align to generic name "clocks" for clockbuffer subdevices.

5. LEDs:
   - Convert leds-mt6323.txt and merge into parent MT6397 PMIC DT schema.
   - Update LED binding.

6. Keys:
   - Add detailed descriptions for power and home keys.
   - Add compatible: mediatek,mt6358-keys.

7. Power Controller:
   - Convert mt6323-poweroff.txt and merge into parent MT6397 PMIC DT
     schema.
   - Add #power-domain-cells property to fix dt-binding check error.
   - Clarify "BBPU" as "Baseband power up".

8. Pinctrl:
   - Align to generic name "pinctrl" instead of "pin-controller".

9. Compatible:
   - Drop "mediatek,mt6357" since there is a separated DT Schema
     for PMIC MT6357.

10. Examples:
   - MT6323: Retain complete examples for this PMIC.
   - MT6358 and MT6397: simplify settings in regulators.
    - Preserve "audio-codec", "clocks", "pinctrl", "rtc", and "keys"
      sections as they contain typical settings for different PMICs.

Additional updates:
- MAINTAINERS: Add co-maintainers and reference to
  mfd/mediatek,mt6397.yaml for LED and power-controller drivers.
- input/mediatek,pmic-keys.yaml: Update reference to
  mfd/mediatek,mt6397.yaml.

Signed-off-by: Sen Chu <sen.chu@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/input/mediatek,pmic-keys.yaml    |   2 +-
 .../devicetree/bindings/leds/leds-mt6323.txt  |  63 --
 .../bindings/mfd/mediatek,mt6397.yaml         | 601 ++++++++++++++++++
 .../devicetree/bindings/mfd/mt6397.txt        | 110 ----
 .../bindings/power/reset/mt6323-poweroff.txt  |  20 -
 .../devicetree/bindings/rtc/rtc-mt6397.txt    |  31 -
 .../devicetree/bindings/sound/mt6358.txt      |  26 -
 MAINTAINERS                                   |   8 +-
 8 files changed, 608 insertions(+), 253 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt
 delete mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt

Changes for v1:
 - This patch depends on conversion of mediatek,mt6397-regulator.yaml
   [1] https://lore.kernel.org/lkml/20240807091738.18387-1-macpaul.lin@mediatek.com/T/

Changes for v2:
 - This patch has been made base on linux-next/master git repo.
 - Keep the parent and child relationship with mediatek,pwrap in description.
   [2] https://lore.kernel.org/all/20240826-slurp-earphone-0d5173923ae8@spud/
 - Keep the $ref for regulators since dt_binding_check didn't report any issue
   based on linux-next/master repo.
 - Fix description of mt6397/mt6323 devices, use "power management chip"
   instead of "multifunction device"
 - Drop unnecessary comments or description according to the review.
 - Convert sub-modules to DT Schema:
  - RTC, LEDs, power-controllers, regulators
 - Drop duplicate sub node name and description for sub-modules
  - RTC, Keys
 - examples:
  - drop parent pwrap node
  - Add examples from mediatek,mt6323-regulator.yaml
  - Add examples from mediatek,mt6358-regulator.yaml
  - Add examples from mediatek,mt6397-regulator.yaml
  - Complete the examples as could as possible.

Changes for v3:
 - Rebased on linux-next/master git repo near next-20240906.
 - Revise commit message.
 - Regulators:
  - Use "additionalProperties: true" and add "contains" for matching
    $ref DT bindings.
  - Simplify regulator name labels in device tree examples.
 - LEDs:
  - Use LED bindings.
 - Squash following patches in v2 for removing old text format DT bindings
   into this patch, includes:
  - leds-mt6323.txt, mt6323-poweroff.txt, rtc-mt6397.txt, sound/mt6358.txt.
 - Fix file format of DT schemas, add blank between properties.
 - Fix 'make checkrefdoc' errors, update reference in mediatek,pmic-keys.yaml.

Changes for v4:
 - Remove "mediatek,mt6357" from PMIC's compatible string since there is a
   seperated DT schema for PMIC mt6357.

Changes for v5:
 - Rebase to next-20240913 (linux-next/master).
 - Fix the "title" (device type) of mfd/mediatek,mt6397.yaml to "PMIC".
 - RTC:
  - Drop "start-year"
 - Regulators:
  - Add blank lines between description and properties.
  - Drop allOf for the $ref section on property.
 - clocks:
  - Fix no need '|' in descriptoin.
  - Add blank lines between description and properties.
 - Keys:
  - Drop compatible since these enums are already in $ref.
 - pinctrl:
  - Drop compatible since it is already in $ref.
 - examples:
  - Fix indentations for leds and keys.

Changes for v6:
 - Commit message:
  - Add note for simplifying examples of mt6358 and mt6397.
 - examples:
  - Fix indentations for mt6323-keys.
  - MT6358 and MT6397: simplify settings in regulators.
   - Preserve "audio-codec", "clocks", "pinctrl", "rtc", and "keys"
     sections as they contain typical settings for different PMICs.

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 70567d9..466566a 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -19,7 +19,7 @@ description: |
   by the PMIC that is defined as a Multi-Function Device (MFD).
 
   For MediaTek MT6323/MT6397 PMIC bindings see
-  Documentation/devicetree/bindings/mfd/mt6397.txt
+  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
deleted file mode 100644
index 052dccb8..0000000
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-Device Tree Bindings for LED support on MT6323 PMIC
-
-MT6323 LED controller is subfunction provided by MT6323 PMIC, so the LED
-controllers are defined as the subnode of the function node provided by MT6323
-PMIC controller that is being defined as one kind of Muti-Function Device (MFD)
-using shared bus called PMIC wrapper for each subfunction to access remote
-MT6323 PMIC hardware.
-
-For MT6323 MFD bindings see:
-Documentation/devicetree/bindings/mfd/mt6397.txt
-For MediaTek PMIC wrapper bindings see:
-Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
-
-Required properties:
-- compatible : Must be one of
-  - "mediatek,mt6323-led"
-  - "mediatek,mt6331-led"
-  - "mediatek,mt6332-led"
-- address-cells : Must be 1
-- size-cells : Must be 0
-
-Each led is represented as a child node of the mediatek,mt6323-led that
-describes the initial behavior for each LED physically and currently only four
-LED child nodes can be supported.
-
-Required properties for the LED child node:
-- reg : LED channel number (0..3)
-
-Optional properties for the LED child node:
-- label : See Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
-- default-state: See Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-	mt6323: pmic {
-		compatible = "mediatek,mt6323";
-
-		...
-
-		mt6323led: leds {
-			compatible = "mediatek,mt6323-led";
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			led@0 {
-				reg = <0>;
-				label = "LED0";
-				linux,default-trigger = "timer";
-				default-state = "on";
-			};
-			led@1 {
-				reg = <1>;
-				label = "LED1";
-				default-state = "off";
-			};
-			led@2 {
-				reg = <2>;
-				label = "LED2";
-				default-state = "on";
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
new file mode 100644
index 0000000..953358b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -0,0 +1,601 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6397/MT6323 PMIC
+
+maintainers:
+  - Sen Chu <sen.chu@mediatek.com>
+  - Macpaul Lin <macpaul.lin@mediatek.com>
+
+description: |
+  MT6397/MT6323 is a power management system chip.
+  Please see the sub-modules below for supported features.
+
+  MT6397/MT6323 is a multifunction device with the following sub modules:
+  - Regulators
+  - RTC
+  - Audio codec
+  - GPIO
+  - Clock
+  - LED
+  - Keys
+  - Power controller
+
+  It is interfaced to host controller using SPI interface by a proprietary hardware
+  called PMIC wrapper or pwrap. MT6397/MT6323 PMIC is a child device of pwrap.
+  See the following for pwrap node definitions:
+  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt6323
+          - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
+          - mediatek,mt6358
+          - mediatek,mt6359
+          - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6366
+          - const: mediatek,mt6358
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+    unevaluatedProperties: false
+    description:
+      MT6397 Real Time Clock.
+
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-rtc
+              - mediatek,mt6331-rtc
+              - mediatek,mt6358-rtc
+              - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6366-rtc
+              - const: mediatek,mt6358-rtc
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulators.
+    additionalProperties: true
+
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-regulator
+              - mediatek,mt6358-regulator
+              - mediatek,mt6397-regulator
+          - items:
+              - enum:
+                  - mediatek,mt6366-regulator
+              - const: mediatek,mt6358-regulator
+
+    required:
+      - compatible
+
+  audio-codec:
+    type: object
+    additionalProperties: false
+    description:
+      Audio codec support with MT6397 and MT6358.
+
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6397-codec
+              - mediatek,mt6358-sound
+          - items:
+              - enum:
+                  - mediatek,mt6366-sound
+              - const: mediatek,mt6358-sound
+
+      mediatek,dmic-mode:
+        description: |
+          Indicates how many data pins are used to transmit two channels of PDM
+          signal.
+          0 - two wires;
+          1 - one wire;
+          Default value is 0.
+        enum: [0, 1]
+        default: 0
+
+      Avdd-supply:
+        description: Power source of AVDD.
+
+    required:
+      - compatible
+
+  clocks:
+    type: object
+    additionalProperties: false
+    description:
+      This is a clock buffer node for mt6397. However, there are no sub nodes
+      or any public document exposed in public.
+
+    properties:
+      compatible:
+        const: mediatek,mt6397-clk
+
+      '#clock-cells':
+        const: 1
+
+    required:
+      - compatible
+
+  leds:
+    type: object
+    additionalProperties: false
+    description: |
+      MT6323 LED controller is subfunction provided by MT6323 PMIC, so the LED
+      controllers are defined as the subnode of the function node provided by MT6323
+      PMIC controller that is being defined as one kind of Muti-Function Device (MFD)
+      using shared bus called PMIC wrapper for each subfunction to access remote
+      MT6323 PMIC hardware.
+
+      Each led is represented as a child node of the mediatek,mt6323-led that
+      describes the initial behavior for each LED physically and currently only four
+      LED child nodes can be supported.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,mt6323-led
+          - mediatek,mt6331-led
+          - mediatek,mt6332-led
+
+      reg:
+        maxItems: 1
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-3]$":
+        type: object
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description:
+              LED channel number (0..3)
+            minimum: 0
+            maximum: 3
+
+        required:
+          - reg
+
+    required:
+      - compatible
+      - "#address-cells"
+      - "#size-cells"
+
+  keys:
+    type: object
+    $ref: /schemas/input/mediatek,pmic-keys.yaml
+    unevaluatedProperties: false
+    description:
+      Power and Home keys.
+
+  power-controller:
+    type: object
+    additionalProperties: false
+    description:
+      The power controller which could be found on PMIC is responsible for
+      externally powering off or on the remote MediaTek SoC through the
+      circuit BBPU (baseband power up).
+
+    properties:
+      compatible:
+        const: mediatek,mt6323-pwrc
+
+      '#power-domain-cells':
+        const: 0
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
+    unevaluatedProperties: false
+    description:
+      Pin controller
+
+required:
+  - compatible
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/leds/common.h>
+
+    pmic {
+        compatible = "mediatek,mt6323";
+        interrupt-parent = <&pio>;
+        interrupts = <150 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        leds {
+            compatible = "mediatek,mt6323-led";
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        regulators {
+            compatible = "mediatek,mt6323-regulator";
+
+            buck_vproc {
+                regulator-name = "vproc";
+                regulator-min-microvolt = < 700000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            buck_vsys {
+                regulator-name = "vsys";
+                regulator-min-microvolt = <1400000>;
+                regulator-max-microvolt = <2987500>;
+                regulator-ramp-delay = <25000>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            buck_vpa {
+                regulator-name = "vpa";
+                regulator-min-microvolt = < 500000>;
+                regulator-max-microvolt = <3650000>;
+            };
+
+            ldo_vtcxo {
+                regulator-name = "vtcxo";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <90>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            ldo_vcn28 {
+                regulator-name = "vcn28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <185>;
+            };
+
+            ldo_vcn33_bt {
+                regulator-name = "vcn33_bt";
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3600000>;
+                regulator-enable-ramp-delay = <185>;
+            };
+
+            ldo_vcn33_wifi {
+                regulator-name = "vcn33_wifi";
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3600000>;
+                regulator-enable-ramp-delay = <185>;
+            };
+
+            ldo_va {
+                regulator-name = "va";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            ldo_vcama {
+                regulator-name = "vcama";
+                regulator-min-microvolt = <1500000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vio28 {
+                regulator-name = "vio28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            ldo_vusb {
+                regulator-name = "vusb";
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-boot-on;
+            };
+
+            ldo_vmc {
+                regulator-name = "vmc";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+                regulator-boot-on;
+            };
+
+            ldo_vmch {
+                regulator-name = "vmch";
+                regulator-min-microvolt = <3000000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+                regulator-boot-on;
+            };
+
+            ldo_vemc3v3 {
+                regulator-name = "vemc3v3";
+                regulator-min-microvolt = <3000000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+                regulator-boot-on;
+            };
+
+            ldo_vgp1 {
+                regulator-name = "vgp1";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vgp2 {
+                regulator-name = "vgp2";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vgp3 {
+                regulator-name = "vgp3";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vcn18 {
+                regulator-name = "vcn18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vsim1 {
+                regulator-name = "vsim1";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vsim2 {
+                regulator-name = "vsim2";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vrtc {
+                regulator-name = "vrtc";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            ldo_vcamaf {
+                regulator-name = "vcamaf";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vibr {
+                regulator-name = "vibr";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+            };
+
+            ldo_vrf18 {
+                regulator-name = "vrf18";
+                regulator-min-microvolt = <1825000>;
+                regulator-max-microvolt = <1825000>;
+                regulator-enable-ramp-delay = <187>;
+            };
+
+            ldo_vm {
+                regulator-name = "vm";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            ldo_vio18 {
+                regulator-name = "vio18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+           ldo_vcamd {
+                regulator-name = "vcamd";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            ldo_vcamio {
+                regulator-name = "vcamio";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+        };
+
+        keys {
+            compatible = "mediatek,mt6323-keys";
+            mediatek,long-press-mode = <1>;
+            power-off-time-sec = <0>;
+
+            power {
+                linux,keycodes = <116>;
+                wakeup-source;
+            };
+
+            home {
+                linux,keycodes = <114>;
+            };
+        };
+
+        power-controller {
+            compatible = "mediatek,mt6323-pwrc";
+            #power-domain-cells = <0>;
+        };
+
+        rtc {
+            compatible = "mediatek,mt6323-rtc";
+        };
+    };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6358";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        audio-codec {
+            compatible = "mediatek,mt6358-sound";
+            Avdd-supply = <&mt6358_vaud28_reg>;
+            mediatek,dmic-mode = <0>;
+        };
+
+        regulators {
+            compatible = "mediatek,mt6358-regulator";
+
+            buck_vdram1 {
+                regulator-name = "vdram1";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <2087500>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <0>;
+                regulator-always-on;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            // ...
+
+            ldo_vsim2 {
+                regulator-name = "vsim2";
+                regulator-min-microvolt = <1700000>;
+                regulator-max-microvolt = <3100000>;
+                regulator-enable-ramp-delay = <540>;
+            };
+        };
+
+        rtc {
+            compatible = "mediatek,mt6358-rtc";
+        };
+
+        keys {
+            compatible = "mediatek,mt6358-keys";
+
+            power {
+                linux,keycodes = <KEY_POWER>;
+                wakeup-source;
+            };
+
+            home {
+                linux,keycodes = <KEY_HOME>;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6397";
+
+        interrupt-parent = <&pio>;
+        interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        audio-codec {
+            compatible = "mediatek,mt6397-codec";
+        };
+
+        clocks {
+            compatible = "mediatek,mt6397-clk";
+            #clock-cells = <1>;
+        };
+
+        pinctrl {
+            compatible = "mediatek,mt6397-pinctrl";
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+
+        regulators {
+            compatible = "mediatek,mt6397-regulator";
+
+            buck_vpca15 {
+                regulator-name = "vpca15";
+                regulator-min-microvolt = < 850000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <200>;
+            };
+
+            // ...
+
+            ldo_vibr {
+                regulator-name = "vibr";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+        };
+
+        rtc {
+            compatible = "mediatek,mt6397-rtc";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
deleted file mode 100644
index 10540aa..0000000
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-MediaTek MT6397/MT6323 Multifunction Device Driver
-
-MT6397/MT6323 is a multifunction device with the following sub modules:
-- Regulator
-- RTC
-- Audio codec
-- GPIO
-- Clock
-- LED
-- Keys
-- Power controller
-
-It is interfaced to host controller using SPI interface by a proprietary hardware
-called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
-See the following for pwarp node definitions:
-../soc/mediatek/mediatek,pwrap.yaml
-
-This document describes the binding for MFD device and its sub module.
-
-Required properties:
-compatible:
-	"mediatek,mt6323" for PMIC MT6323
-	"mediatek,mt6331" for PMIC MT6331 and MT6332
-	"mediatek,mt6357" for PMIC MT6357
-	"mediatek,mt6358" for PMIC MT6358
-	"mediatek,mt6359" for PMIC MT6359
-	"mediatek,mt6366", "mediatek,mt6358" for PMIC MT6366
-	"mediatek,mt6397" for PMIC MT6397
-
-Optional subnodes:
-
-- rtc
-	Required properties: Should be one of follows
-		- compatible: "mediatek,mt6323-rtc"
-		- compatible: "mediatek,mt6331-rtc"
-		- compatible: "mediatek,mt6358-rtc"
-		- compatible: "mediatek,mt6397-rtc"
-	For details, see ../rtc/rtc-mt6397.txt
-- regulators
-	Required properties:
-		- compatible: "mediatek,mt6323-regulator"
-	see ../regulator/mt6323-regulator.txt
-		- compatible: "mediatek,mt6358-regulator"
-		- compatible: "mediatek,mt6366-regulator", "mediatek-mt6358-regulator"
-	see ../regulator/mt6358-regulator.txt
-		- compatible: "mediatek,mt6397-regulator"
-	see ../regulator/mt6397-regulator.txt
-- codec
-	Required properties:
-		- compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
-- clk
-	Required properties:
-		- compatible: "mediatek,mt6397-clk"
-- led
-	Required properties:
-		- compatible: "mediatek,mt6323-led"
-	see ../leds/leds-mt6323.txt
-
-- keys
-	Required properties: Should be one of the following
-		- compatible: "mediatek,mt6323-keys"
-		- compatible: "mediatek,mt6331-keys"
-		- compatible: "mediatek,mt6397-keys"
-	see ../input/mtk-pmic-keys.txt
-
-- power-controller
-	Required properties:
-		- compatible: "mediatek,mt6323-pwrc"
-	For details, see ../power/reset/mt6323-poweroff.txt
-
-- pin-controller
-	Required properties:
-		- compatible: "mediatek,mt6397-pinctrl"
-	For details, see ../pinctrl/pinctrl-mt65xx.txt
-
-Example:
-	pwrap: pwrap@1000f000 {
-		compatible = "mediatek,mt8135-pwrap";
-
-		...
-
-		pmic {
-			compatible = "mediatek,mt6397";
-
-			codec: mt6397codec {
-				compatible = "mediatek,mt6397-codec";
-			};
-
-			regulators {
-				compatible = "mediatek,mt6397-regulator";
-
-				mt6397_vpca15_reg: buck_vpca15 {
-					regulator-compatible = "buck_vpca15";
-					regulator-name = "vpca15";
-					regulator-min-microvolt = <850000>;
-					regulator-max-microvolt = <1400000>;
-					regulator-ramp-delay = <12500>;
-					regulator-always-on;
-				};
-
-				mt6397_vgp4_reg: ldo_vgp4 {
-					regulator-compatible = "ldo_vgp4";
-					regulator-name = "vgp4";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-enable-ramp-delay = <218>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
deleted file mode 100644
index 933f0c4..0000000
--- a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Device Tree Bindings for Power Controller on MediaTek PMIC
-
-The power controller which could be found on PMIC is responsible for externally
-powering off or on the remote MediaTek SoC through the circuit BBPU.
-
-Required properties:
-- compatible: Should be one of follows
-       "mediatek,mt6323-pwrc": for MT6323 PMIC
-
-Example:
-
-       pmic {
-               compatible = "mediatek,mt6323";
-
-               ...
-
-               power-controller {
-                       compatible = "mediatek,mt6323-pwrc";
-               };
-       }
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
deleted file mode 100644
index 7212076..0000000
--- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Device-Tree bindings for MediaTek PMIC based RTC
-
-MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
-as a type of multi-function device (MFD). The RTC can be configured and set up
-with PMIC wrapper bus which is a common resource shared with the other
-functions found on the same PMIC.
-
-For MediaTek PMIC MFD bindings, see:
-../mfd/mt6397.txt
-
-For MediaTek PMIC wrapper bus bindings, see:
-../soc/mediatek/pwrap.txt
-
-Required properties:
-- compatible: Should be one of follows
-       "mediatek,mt6323-rtc": for MT6323 PMIC
-       "mediatek,mt6358-rtc": for MT6358 PMIC
-       "mediatek,mt6366-rtc", "mediatek,mt6358-rtc": for MT6366 PMIC
-       "mediatek,mt6397-rtc": for MT6397 PMIC
-
-Example:
-
-       pmic {
-               compatible = "mediatek,mt6323";
-
-               ...
-
-               rtc {
-                       compatible = "mediatek,mt6323-rtc";
-               };
-       };
diff --git a/Documentation/devicetree/bindings/sound/mt6358.txt b/Documentation/devicetree/bindings/sound/mt6358.txt
deleted file mode 100644
index fbe9e55..0000000
--- a/Documentation/devicetree/bindings/sound/mt6358.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Mediatek MT6358 Audio Codec
-
-The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible - "string" - One of:
-    "mediatek,mt6358-sound"
-    "mediatek,mt6366-sound"
-- Avdd-supply : power source of AVDD
-
-Optional properties:
-- mediatek,dmic-mode : Indicates how many data pins are used to transmit two
-	channels of PDM signal. 0 means two wires, 1 means one wire. Default
-	value is 0.
-
-Example:
-
-mt6358_snd {
-	compatible = "mediatek,mt6358-sound";
-	Avdd-supply = <&mt6358_vaud28_reg>;
-	mediatek,dmic-mode = <0>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 2cdd7ca..e97b5ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14418,10 +14418,12 @@ F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.ya
 F:	drivers/bluetooth/btmtkuart.c
 
 MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS
+M:	Sen Chu <sen.chu@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>
+M:	Macpaul Lin <macpaul.lin@mediatek.com>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
+F:	Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 F:	drivers/power/reset/mt6323-poweroff.c
 
 MEDIATEK CIR DRIVER
@@ -14582,9 +14584,11 @@ F:	Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 F:	drivers/mtd/nand/raw/mtk_*
 
 MEDIATEK PMIC LED DRIVER
+M:	Sen Chu <sen.chu@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>
+M:	Macpaul Lin <macpaul.lin@mediatek.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/leds/leds-mt6323.txt
+F:	Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 F:	drivers/leds/leds-mt6323.c
 
 MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
-- 
2.45.2



Return-Path: <linux-input+bounces-4102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C78FC752
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 11:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 362BB1C22809
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E0218F2DB;
	Wed,  5 Jun 2024 09:12:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com [115.124.28.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAC4964B;
	Wed,  5 Jun 2024 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578727; cv=none; b=DNA20Rgck9kuhmAZB2CuNLiejg5KLpbCUT0dTQGljqzwnIslVbd08RJqapgpiiPruvvF510xS7XQXgwwhje/1sp/2csUBOCf7MCd1fR91qUwps0zJwPk4nixQljJkbP0g5BGSnsA0xBph+a+Tr2ioIPfDTD4eD3LfFIeuoW5jw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578727; c=relaxed/simple;
	bh=rkfDndMG/r979OfNH4gi7CoeiwexgT2DZhuz3sszvXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bltqiBIwFBZG4mcKVi1pYKxP9xce6xXmMBe8GrHRdu46BweZXTuqaAD1TG4i96fd+uJNYXXGF504ezb3hVPiBUM34SFsnX8avfgimJ2VPXAj8jhgI6BlDUYT6kaWWSGFMkqBFsbP5cd0XL0lcjqsyoSmFJetAPjagFAQi32iuUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0743626|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.339022-0.000654842-0.660323;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037136014;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XwdqTeF_1717578718;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XwdqTeF_1717578718)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 17:12:01 +0800
From: wangshuaijie@awinic.com
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jeff@labundy.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: wangshuaijie@awinic.com,
	liweilei@awinic.com,
	kangjiajun@awinic.com
Subject: [PATCH V2 1/5] dt-bindings: input: Add YAML to Awinic sar sensor.
Date: Wed,  5 Jun 2024 09:11:39 +0000
Message-ID: <20240605091143.163789-2-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240605091143.163789-1-wangshuaijie@awinic.com>
References: <20240605091143.163789-1-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: shuaijie wang <wangshuaijie@awinic.com>

Add the awinic,aw_sar.yaml file to adapt to the awinic sar sensor driver.

Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
---
 .../bindings/input/awinic,aw_sar.yaml         | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sar.yaml

diff --git a/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
new file mode 100644
index 000000000000..2560ef09d3d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/awinic,aw_sar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic sar sensor driver family
+
+maintainers:
+  - Shuaijie Wang <wangshuaijie@awinic.com>
+
+properties:
+  compatible:
+    enum:
+      - awinic,aw96103
+      - awinic,aw96105
+      - awinic,aw96303
+      - awinic,aw96305
+      - awinic,aw96308
+
+  reg:
+    maxItems: 1
+
+  irq-gpio:
+    maxItems: 1
+
+  awinic,sar-label:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Set the label of the SAR(Specific Absorption Rate) sensor.
+      It is set to 0 if one awinic sar chip is used.
+      If two awinic sar chips are used, awinic,sar-label in the first
+      awinic-sar should be set to 0 and awinic,sar-label in the second
+      awinic-sar should be set to 1.
+
+
+  awinic,regulator-power-supply:
+    description:
+      Choose if you want to use a regulator to power the chip. Then the
+      vccX-supply has to be set.
+
+  vcc0-supply:
+    description:
+      Optional regulator for chip, 1.7V-3.6V.
+      If two awinic sar chips are used, the first regulator
+      should set the ID to vcc0-supply and the second regulator
+      should set the ID to vcc1-supply.
+
+  awinic,channel-use-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The mask of channels used.
+      Configure according to the specific chip channel used.
+      Bit[31:0] Each bit represents a channel.
+      If the customer uses ch0 and ch2, then channel_use_mask=<0x05>
+      For a 3-channel chip, the maximum value is 0x07;
+      For a 5-channel chip, the maximum value is 0x1F;
+      For a 8-channel chip, the maximum value is 0xFF;
+
+  awinic,update-fw:
+    type: boolean
+    description:
+      Choose if you want to update the firmware.
+
+  awinic,monitor-esd:
+    type: boolean
+    description:
+      Choose if you want to monitor ESD.
+
+  awinic,pin-set-inter-pull-up:
+    type: boolean
+    description:
+      Choose if you want to set the interrupt pin to internal pull-up.
+
+  awinic,using-pm-ops:
+    type: boolean
+    description:
+      Choose if you want to change the chip mode on suppend and resume.
+
+  awinic,use-plug-cail:
+    type: boolean
+    description:
+      Choose If you want to perform calibration when plugging and unplugging the charger.
+
+  awinic,start-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      You only need to set this configuration item if you are using AW963XX.
+      When connecting to AW963XX, select the location where the firmware starts.
+      Set 0 if start in rom.
+      Set 1 if start in ram
+
+  awinic,irq-mux:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      You only need to set this configuration item if you are using AW96308 adn AW96305BFOR.
+      If CS2 is used as the interrupt pin, this item should be set to 2.
+      If CS5 is used as the interrupt pin, this item should be set to 5.
+
+required:
+  - compatible
+  - reg
+  - irq-gpio
+  - awinic,sar-label
+  - awinic,channel-use-mask
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        awinic-sar@12 {
+            compatible = "awinic,aw96308";
+            reg = <0x12>;
+            irq-gpio = <&tlmm 72 0>;
+            awinic,sar-label = < 0 >;
+            awinic,channel-use-mask = <0xff>;
+            awinic,start-mode = < 0 >;
+            awinic,irq-mux = < 2 >;
+        };
+    };
-- 
2.45.1


